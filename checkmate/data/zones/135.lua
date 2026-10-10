-- Dynamis-Xarcabard (zone 135).
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
danger[10] = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' };
danger[11] = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' };
danger[12] = { value = 'Move list unresolved', notes = danger[10], entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[11], general_notes = danger[3] };
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [2] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [3] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [4] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias', 'Marquis Sabnak', 'Prince Seere',
                          'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes', 'Satellite Guns',
                          'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles', 'Satellite Kunai',
                          'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes', 'Satellite Shield',
                          'Satellite Spears', 'Satellite Staves', 'Satellite Tabars', 'Satellite Tachi',
                          'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon', 'Vanguard Eye', 'Yang',
                          'Ying' },
        },
        [5] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [6] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Cimeries', 'Marquis Decarabia',
                          'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias', 'Marquis Sabnak', 'Prince Seere',
                          'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes', 'Satellite Guns',
                          'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles', 'Satellite Kunai',
                          'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes', 'Satellite Shield',
                          'Satellite Spears', 'Satellite Staves', 'Satellite Tabars', 'Satellite Tachi',
                          'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon', 'Vanguard Eye', 'Yang',
                          'Ying' },
        },
        [7] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes',
                          'Satellite Guns', 'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles',
                          'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes',
                          'Satellite Shield', 'Satellite Spears', 'Satellite Staves', 'Satellite Tabars',
                          'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon',
                          'Vanguard Eye', 'Yang', 'Ying' },
        },
        [8] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Prince Seere', 'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes',
                          'Satellite Guns', 'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles',
                          'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes',
                          'Satellite Shield', 'Satellite Spears', 'Satellite Staves', 'Satellite Tabars',
                          'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon',
                          'Vanguard Eye', 'Yang', 'Ying' },
        },
        [9] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [10] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Orias', 'Marquis Sabnak', 'Prince Seere',
                          'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes', 'Satellite Guns',
                          'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles', 'Satellite Kunai',
                          'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes', 'Satellite Shield',
                          'Satellite Spears', 'Satellite Staves', 'Satellite Tabars', 'Satellite Tachi',
                          'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon', 'Vanguard Eye', 'Yang',
                          'Ying' },
        },
        [11] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [12] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Nebiros', 'Marquis Orias', 'Marquis Sabnak', 'Prince Seere',
                          'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes', 'Satellite Guns',
                          'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles', 'Satellite Kunai',
                          'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes', 'Satellite Shield',
                          'Satellite Spears', 'Satellite Staves', 'Satellite Tabars', 'Satellite Tachi',
                          'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon', 'Vanguard Eye', 'Yang',
                          'Ying' },
        },
        [13] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Sabnak',
                          'Prince Seere', 'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes',
                          'Satellite Guns', 'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles',
                          'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes',
                          'Satellite Shield', 'Satellite Spears', 'Satellite Staves', 'Satellite Tabars',
                          'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon',
                          'Vanguard Eye', 'Yang', 'Ying' },
        },
        [14] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [15] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'Marquis Andras', 'Marquis Cimeries', 'Marquis Decarabia',
                          'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias', 'Marquis Sabnak', 'Prince Seere',
                          'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes', 'Satellite Guns',
                          'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles', 'Satellite Kunai',
                          'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes', 'Satellite Shield',
                          'Satellite Spears', 'Satellite Staves', 'Satellite Tabars', 'Satellite Tachi',
                          'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon', 'Vanguard Eye', 'Yang',
                          'Ying' },
        },
        [16] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum',
                          'Count Vine', 'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Decarabia',
                          'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias', 'Marquis Sabnak', 'Prince Seere',
                          'Satellite Claymores', 'Satellite Daggers', 'Satellite Great Axes', 'Satellite Guns',
                          'Satellite Hammers', 'Satellite Horns', 'Satellite Knuckles', 'Satellite Kunai',
                          'Satellite Longbows', 'Satellite Longswords', 'Satellite Scythes', 'Satellite Shield',
                          'Satellite Spears', 'Satellite Staves', 'Satellite Tabars', 'Satellite Tachi',
                          'Statue Prototype', 'Tombstone Prototype', 'Vanguard Dragon', 'Vanguard Eye', 'Yang',
                          'Ying' },
        },
        [17] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [18] = {
            true_both = { 'Animated Claymore', 'Animated Great Axe', 'Animated Gun', 'Animated Hammer',
                          'Animated Horn', 'Animated Knuckles', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [19] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [20] = {
            true_both = { 'Animated Dagger', 'Animated Great Axe', 'Animated Gun', 'Animated Hammer',
                          'Animated Horn', 'Animated Knuckles', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [21] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [22] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Gun', 'Animated Hammer',
                          'Animated Horn', 'Animated Knuckles', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [23] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [24] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [25] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [26] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Staff', 'Animated Tabar', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [27] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Horn', 'Animated Knuckles', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [28] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Shield',
                          'Animated Spear', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [29] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [30] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Hammer',
                          'Animated Horn', 'Animated Knuckles', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [31] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Knuckles', 'Animated Kunai', 'Animated Longbow',
                          'Animated Longsword', 'Animated Scythe', 'Animated Shield', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
        [32] = {
            true_both = { 'Animated Claymore', 'Animated Dagger', 'Animated Great Axe', 'Animated Gun',
                          'Animated Hammer', 'Animated Horn', 'Animated Knuckles', 'Animated Kunai',
                          'Animated Longbow', 'Animated Longsword', 'Animated Scythe', 'Animated Spear',
                          'Animated Staff', 'Animated Tabar', 'Animated Tachi', 'Count Raum', 'Count Vine',
                          'Count Zaebos', 'Duke Berith', 'Duke Gomory', 'Duke Scox', 'Dynamis Lord',
                          'Effigy Prototype', 'Icon Prototype', 'Kindred Bard', 'Kindred Beastmaster',
                          'Kindred Black Mage', 'Kindred Dark Knight', 'Kindred Dragoon', 'Kindred Monk',
                          'Kindred Ninja', 'Kindred Paladin', 'Kindred Ranger', 'Kindred Red Mage',
                          'Kindred Samurai', 'Kindred Summoner', 'Kindred Thief', 'Kindred Warrior',
                          'Kindred White Mage', 'King Zagan', 'Marquis Andras', 'Marquis Cimeries',
                          'Marquis Decarabia', 'Marquis Gamygyn', 'Marquis Nebiros', 'Marquis Orias',
                          'Marquis Sabnak', 'Prince Seere', 'Satellite Claymores', 'Satellite Daggers',
                          'Satellite Great Axes', 'Satellite Guns', 'Satellite Hammers', 'Satellite Horns',
                          'Satellite Knuckles', 'Satellite Kunai', 'Satellite Longbows', 'Satellite Longswords',
                          'Satellite Scythes', 'Satellite Shield', 'Satellite Spears', 'Satellite Staves',
                          'Satellite Tabars', 'Satellite Tachi', 'Statue Prototype', 'Tombstone Prototype',
                          'Vanguard Dragon', 'Vanguard Eye', 'Yang', 'Ying' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Animated Claymore'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Dagger'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Great Axe'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Gun'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Hammer'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Horn'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Knuckles'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Kunai'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Longbow'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Longsword'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Scythe'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Shield'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Spear'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Staff'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Tabar'] = { id = 203, name = 'Animated Weapons' },
        ['Animated Tachi'] = { id = 203, name = 'Animated Weapons' },
        ['Count Raum'] = { id = 88, name = 'Demon' },
        ['Count Vine'] = { id = 88, name = 'Demon' },
        ['Count Zaebos'] = { id = 88, name = 'Demon' },
        ['Duke Berith'] = { id = 88, name = 'Demon' },
        ['Duke Gomory'] = { id = 88, name = 'Demon' },
        ['Duke Scox'] = { id = 88, name = 'Demon' },
        ['Dynamis Lord'] = { id = 69, name = 'Shadow Lord' },
        ['Effigy Prototype'] = { id = 205, name = 'Statue' },
        ['Icon Prototype'] = { id = 205, name = 'Statue' },
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
        ['King Zagan'] = { id = 88, name = 'Demon' },
        ['Marquis Andras'] = { id = 88, name = 'Demon' },
        ['Marquis Cimeries'] = { id = 88, name = 'Demon' },
        ['Marquis Decarabia'] = { id = 88, name = 'Demon' },
        ['Marquis Gamygyn'] = { id = 88, name = 'Demon' },
        ['Marquis Nebiros'] = { id = 88, name = 'Demon' },
        ['Marquis Orias'] = { id = 88, name = 'Demon' },
        ['Marquis Sabnak'] = { id = 88, name = 'Demon' },
        ['Prince Seere'] = { id = 88, name = 'Demon' },
        ['Satellite Claymores'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Daggers'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Great Axes'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Guns'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Hammers'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Horns'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Knuckles'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Kunai'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Longbows'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Longswords'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Scythes'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Shield'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Spears'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Staves'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Tabars'] = { id = 203, name = 'Animated Weapons' },
        ['Satellite Tachi'] = { id = 203, name = 'Animated Weapons' },
        ['Statue Prototype'] = { id = 205, name = 'Statue' },
        ['Tombstone Prototype'] = { id = 205, name = 'Statue' },
        ['Vanguard Dragon'] = { id = 95, name = 'Dragon' },
        ['Vanguard Eye'] = { id = 87, name = 'Ahriman' },
        ['Yang'] = { id = 95, name = 'Dragon' },
        ['Ying'] = { id = 95, name = 'Dragon' },
    },
    monsters = {
        {
            name   = 'Vanguard Eye',
            ids    = { 1, 4, 7, 10, 13, 16, 19, 22, 25, 30, 33, 36, 39, 42, 47, 53, 57, 61, 65, 69, 73, 77, 81, 87,
                       95, 100, 105, 110, 114, 117, 120, 123, 127, 132, 137, 142, 146, 150, 154, 158, 163, 168, 176,
                       179, 182, 185, 188, 192, 196, 199, 202, 206, 210, 214, 219, 224, 228, 234, 237, 240, 243,
                       246, 249, 252, 256, 260, 267, 274, 279, 285, 289, 293, 296, 300, 304, 308, 312, 317, 322,
                       329, 337, 344, 351, 358, 365, 368, 371, 374, 375, 376, 377, 378, 379, 380, 381, 383, 387,
                       393, 396, 398, 401, 404, 408, 412, 416, 420, 424, 427, 431, 434, 439, 442, 445, 448, 451,
                       455, 459, 463, 466, 473, 478, 483, 488, 496, 498, 500, 502, 504, 507, 509, 511, 513, 516,
                       518, 520, 522, 524, 527 },
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
                { rate = 100, item = 4248 },  -- copy of ginuvas battle theory
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Ahriman / Demon', notes = { 'Source species: Dynamis Ahriman (ID 500); family ID 87.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [70] = 1500 }, mp = { [70] = 1500 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Kindred Warrior',
            ids    = { 2, 3, 54, 58, 106, 107, 108, 211, 235, 241, 286, 287, 290, 291, 323, 330, 405, 406, 409,
                       410 },
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
            links  = 1,
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
            name   = 'Kindred Monk',
            ids    = { 5, 6, 55, 59, 111, 112, 113, 215, 238, 244, 275, 280, 324, 331, 366, 369, 413, 414, 417,
                       418 },
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
            links  = 1,
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
            ids    = { 8, 9, 56, 60, 116, 119, 152, 156, 218, 242, 245, 265, 272, 328, 335, 372, 373, 441, 447,
                       453 },
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
            links  = 1,
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
            name   = 'Kindred Black Mage',
            ids    = { 11, 12, 64, 68, 115, 118, 177, 180, 183, 186, 227, 294, 295, 316, 321, 327, 334, 440, 446,
                       452 },
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
            links  = 1,
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
            name   = 'Kindred Red Mage',
            ids    = { 14, 15, 70, 71, 72, 151, 155, 212, 248, 251, 288, 292, 326, 333, 386, 392, 397, 402, 458,
                       462 },
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
            links  = 1,
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
            name   = 'Kindred Thief',
            ids    = { 17, 18, 62, 63, 66, 67, 190, 191, 194, 195, 198, 201, 221, 325, 332, 367, 370, 421, 422,
                       423 },
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
            links  = 1,
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
            name   = 'Kindred Paladin',
            ids    = { 20, 21, 76, 80, 82, 121, 122, 124, 125, 220, 247, 250, 297, 301, 305, 338, 345, 449, 450,
                       464, 465 },
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
            links  = 1,
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
            ids    = { 23, 24, 74, 75, 78, 79, 143, 144, 147, 148, 225, 313, 314, 315, 339, 346, 394, 395, 443,
                       444 },
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
            links  = 1,
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
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Kindred Beastmaster',
            ids    = { 26, 28, 88, 90, 92, 128, 130, 159, 161, 216, 261, 263, 268, 270, 340, 347, 474, 476, 479,
                       481 },
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
            links  = 1,
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
            ids    = { 27, 29, 89, 91, 93, 129, 131, 160, 162, 217, 262, 264, 269, 271, 341, 348, 475, 477, 480,
                       482 },
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
            links  = 1,
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
            name   = 'Kindred Bard',
            ids    = { 31, 32, 99, 104, 109, 145, 149, 153, 157, 213, 236, 239, 266, 273, 343, 350, 407, 411, 415,
                       419 },
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
            links  = 1,
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
            name   = 'Kindred Ranger',
            ids    = { 34, 35, 178, 181, 184, 187, 205, 209, 232, 255, 259, 309, 310, 311, 342, 349, 425, 426, 432,
                       433 },
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
            links  = 1,
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
            ids    = { 37, 38, 96, 97, 98, 203, 204, 207, 208, 229, 318, 319, 320, 352, 359, 384, 385, 428, 429,
                       430 },
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
            links  = 1,
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
            name   = 'Kindred Ninja',
            ids    = { 40, 41, 101, 102, 103, 189, 193, 197, 200, 226, 276, 281, 355, 362, 399, 400, 456, 457, 460,
                       461 },
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
            links  = 1,
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
            name   = 'Kindred Dragoon',
            ids    = { 43, 45, 83, 85, 133, 135, 164, 166, 230, 253, 257, 353, 360, 388, 390, 435, 437, 467, 469,
                       471 },
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
            links  = 1,
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
            ids    = { 44, 46, 84, 86, 134, 136, 165, 167, 231, 254, 258, 354, 361, 389, 391, 436, 438, 468, 470,
                       472 },
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
            links  = 1,
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
            name   = 'Kindred Summoner',
            ids    = { 48, 50, 138, 140, 169, 171, 173, 222, 277, 282, 298, 302, 306, 356, 363, 484, 486, 489, 491,
                       493 },
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
            links  = 1,
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
            ids    = { 49, 51, 139, 141, 170, 172, 174, 223, 278, 283, 299, 303, 307, 357, 364, 485, 487, 490, 492,
                       494 },
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
            links  = 1,
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
            name   = 'Statue Prototype',
            ids    = { 52, 454, 529 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            magic_dmg = { all = -60 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Goblin Statue (ID 478); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 1000 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 15', notes = { 'Source base speed is 15; the ordinary monster default is 40. Animation speed is 15.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100; Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Tombstone Prototype',
            ids    = { 94, 175, 233 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [65] = { acc = 269, eva = 246, agi = 80, int = 90, mnd = 90, chr = 84, dex = 84, def = 262,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            magic_dmg = { all = -60 },
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
            name   = 'Icon Prototype',
            ids    = { 126, 284, 382 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            magic_dmg = { all = -60 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 1000 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Effigy Prototype',
            ids    = { 336, 403, 495 },
            nm     = true,
            levels = {
                [65] = { acc = 272, eva = 259, agi = 90, int = 74, mnd = 74, chr = 80, dex = 90, def = 274,
                         attack_skill = 214 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -60 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
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
            name   = 'Count Zaebos',
            ids    = { 497 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15087 },  -- warriors lorica
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Duke Berith',
            ids    = { 499 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [82] = { acc = 363, eva = 333, agi = 95, int = 109, mnd = 109, chr = 101, dex = 101, def = 350,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15076 },  -- duelists chapeau
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Marquis Decarabia',
            ids    = { 501 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [82] = { acc = 363, eva = 330, agi = 88, int = 101, mnd = 101, chr = 115, dex = 101, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15126 },  -- bards cannions
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Duke Gomory',
            ids    = { 503 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [82] = { acc = 370, eva = 347, agi = 88, int = 82, mnd = 101, chr = 95, dex = 115, def = 364,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15073 },  -- melee crown
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12680 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Marquis Andras',
            ids    = { 505 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [82] = { acc = 367, eva = 339, agi = 88, int = 95, mnd = 95, chr = 122, dex = 109, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15110 },  -- monster gloves
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Andrass Vouivre',
            ids    = { 506 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern / Dragon', notes = { 'Source species: Wyvern (ID 235); family ID 99.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Prince Seere',
            ids    = { 508 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15104 },  -- clerics mitts
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Marquis Sabnak',
            ids    = { 510 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 412,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15093 },  -- valor surcoat
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 8,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Count Raum',
            ids    = { 512 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [82] = { acc = 374, eva = 418, agi = 115, int = 109, mnd = 82, chr = 82, dex = 122, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15107 },  -- assassins armlets
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 9,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Marquis Nebiros',
            ids    = { 514 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [82] = { acc = 360, eva = 320, agi = 101, int = 115, mnd = 115, chr = 115, dex = 95, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15086 },  -- summoners horn
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 10,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 2466 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Nebiross Avatar',
            ids    = { 515 },
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
            links  = 1,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Duke Scox',
            ids    = { 517 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 367, eva = 345, agi = 101, int = 109, mnd = 82, chr = 82, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15079 },  -- abyss burgeonet
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 11,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Marquis Gamygyn',
            ids    = { 519 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [82] = { acc = 370, eva = 370, agi = 115, int = 101, mnd = 82, chr = 88, dex = 115, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15114 },  -- koga tekko
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 12,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Marquis Orias',
            ids    = { 521 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15075 },  -- sorcerers petasos
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 13,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Count Vine',
            ids    = { 523 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [82] = { acc = 367, eva = 353, agi = 101, int = 95, mnd = 95, chr = 101, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15083 },  -- saotome kabuto
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 14,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'King Zagan',
            ids    = { 525 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 385, eva = 353, agi = 101, int = 88, mnd = 95, chr = 109, dex = 101, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15085 },  -- wyrm armet
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 15,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Zagans Wyvern',
            ids    = { 526 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Marquis Cimeries',
            ids    = { 528 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 15097 },  -- scouts jerkin
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 16,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Demon / Demon', notes = { 'Source species: Dynamis Kindred (ID 498); family ID 88.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 12500 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Animated Knuckles',
            ids    = { 530, 531 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [82] = { acc = 370, eva = 347, agi = 88, int = 82, mnd = 101, chr = 95, dex = 115, def = 382,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1571 },  -- mystic fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 17,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20680 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Knuckles',
            ids    = { 532, 533, 534, 535, 536 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [82] = { acc = 370, eva = 347, agi = 88, int = 82, mnd = 101, chr = 95, dex = 115, def = 382,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3364 },  -- mystic goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4180 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Dagger',
            ids    = { 537, 538 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 365,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1572 },  -- ornate fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 18,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Daggers',
            ids    = { 539, 540, 541, 542, 543 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [82] = { acc = 374, eva = 418, agi = 115, int = 109, mnd = 82, chr = 82, dex = 122, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3365 },  -- ornate goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Longsword',
            ids    = { 544, 545 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 430,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1573 },  -- holy fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 19,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Longswords',
            ids    = { 546, 547, 548, 549, 550 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 430,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3366 },  -- holy goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Claymore',
            ids    = { 551, 552 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 430,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1574 },  -- intricate fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 20,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Claymores',
            ids    = { 553, 554, 555, 556, 557 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 430,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3367 },  -- intricate goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Tabar',
            ids    = { 558, 559 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [82] = { acc = 367, eva = 339, agi = 88, int = 95, mnd = 95, chr = 122, dex = 109, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1575 },  -- runaeic fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 21,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Tabars',
            ids    = { 560, 561, 562, 563, 564 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [82] = { acc = 367, eva = 339, agi = 88, int = 95, mnd = 95, chr = 122, dex = 109, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3368 },  -- runaeic goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Great Axe',
            ids    = { 565, 566 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 381,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1576 },  -- seraphic fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 22,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Great Axes',
            ids    = { 567, 568, 569, 570, 571 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 381,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3369 },  -- seraphic goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Spear',
            ids    = { 572, 573 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 385, eva = 353, agi = 101, int = 88, mnd = 95, chr = 109, dex = 101, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1578 },  -- stellar fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 23,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Spears',
            ids    = { 574, 575, 576, 577, 578 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 385, eva = 353, agi = 101, int = 88, mnd = 95, chr = 109, dex = 101, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3371 },  -- stellar goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Scythe',
            ids    = { 579, 580 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 367, eva = 345, agi = 101, int = 109, mnd = 82, chr = 82, dex = 109, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1577 },  -- tenebrous fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 24,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Scythes',
            ids    = { 581, 582, 583, 584, 585 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 367, eva = 345, agi = 101, int = 109, mnd = 82, chr = 82, dex = 109, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3370 },  -- tenebrous goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Kunai',
            ids    = { 586, 587 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [82] = { acc = 370, eva = 370, agi = 115, int = 101, mnd = 82, chr = 88, dex = 115, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1579 },  -- demoniac fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 25,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Kunai',
            ids    = { 588, 589, 590, 591, 592 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [82] = { acc = 370, eva = 370, agi = 115, int = 101, mnd = 82, chr = 88, dex = 115, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3372 },  -- demoniac goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Tachi',
            ids    = { 593, 594 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [82] = { acc = 367, eva = 353, agi = 101, int = 95, mnd = 95, chr = 101, dex = 109, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1580 },  -- divine fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 26,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Tachi',
            ids    = { 595, 596, 597, 598, 599 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [82] = { acc = 367, eva = 353, agi = 101, int = 95, mnd = 95, chr = 101, dex = 109, def = 375,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3373 },  -- divine goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Hammer',
            ids    = { 600, 601 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1581 },  -- heavenly fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 27,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Hammers',
            ids    = { 602, 603, 604, 605, 606 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3374 },  -- heavenly goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Staff',
            ids    = { 607, 608 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 365,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1582 },  -- celestial fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 28,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Staves',
            ids    = { 609, 610, 611, 612, 613 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [82] = { acc = 363, eva = 333, agi = 95, int = 109, mnd = 109, chr = 101, dex = 101, def = 368,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3375 },  -- celestial goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Longbow',
            ids    = { 614, 615 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1583 },  -- snarled fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 29,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Longbows',
            ids    = { 616, 617, 618, 619, 620 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3376 },  -- snarled goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Gun',
            ids    = { 621, 622 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1585 },  -- ethereal fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 30,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Guns',
            ids    = { 623, 624, 625, 626, 627 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3377 },  -- ethereal goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Horn',
            ids    = { 628, 629 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [82] = { acc = 363, eva = 330, agi = 88, int = 101, mnd = 101, chr = 115, dex = 101, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1584 },  -- mysterial fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 31,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Horns',
            ids    = { 630, 631, 632, 633, 634 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [82] = { acc = 363, eva = 330, agi = 88, int = 101, mnd = 101, chr = 115, dex = 101, def = 371,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3378 },  -- mysterial goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Animated Shield',
            ids    = { 635, 636 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 430,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1822 },  -- supernal fragment
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 32,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20500 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Satellite Shield',
            ids    = { 637, 638, 639, 640, 641 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 430,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 3379 },  -- supernal goad
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Animated Weapons / Weapons', notes = { 'Source species: Animated Weapons (ID 476); family ID 203.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4000 }, mp = { [82] = 1208 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Dragon',
            ids    = { 642, 643, 644, 645, 646, 647, 648, 649, 650, 651 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 1000, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 1000, item = 4249 },  -- copy of schultz stratagems
                { rate = 150, item = 1589 },  -- shard of necropsyche
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 30000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Ying',
            ids    = { 652, 660 },
            nm     = true,
            levels = {
                [85] = { acc = 387, eva = 366, agi = 112, int = 91, mnd = 91, chr = 99, dex = 112, def = 380,
                         attack_skill = 311 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [85] = 17000 }, mp = { [85] = 259 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Yang',
            ids    = { 653, 661 },
            nm     = true,
            levels = {
                [85] = { acc = 387, eva = 366, agi = 112, int = 91, mnd = 91, chr = 99, dex = 112, def = 380,
                         attack_skill = 311 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [85] = 17000 }, mp = { [85] = 259 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Dynamis Lord',
            ids    = { 654, 655, 656, 657, 658, 659 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [90] = { acc = 419, eva = 356, agi = 110, int = 117, mnd = 87, chr = 87, dex = 117, def = 430,
                         attack_skill = 341 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1 },
            resist = { paralyze = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'elegy', 'blind', 'poison',
                       'petrify', 'terror' },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, item = 13658 },  -- shadow mantle
                { rate = 100, item = 14646 },  -- shadow ring
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Shadow Lord / Beastmen', notes = { 'Source species: Shadow Lord (ID 153); family ID 69.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [90] = 78000 }, mp = { [90] = 78000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regain 50', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Mighty Strikes is possible through the encounter special sequence.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[2], general_notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Mighty Strikes is possible through the encounter special sequence.' } },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
