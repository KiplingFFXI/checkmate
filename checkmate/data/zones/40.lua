-- Dynamis-Buburimu (zone 40).
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
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone', 'Woodnix Shrillwhistle' },
        },
        [2] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [3] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [4] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [5] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone', 'Woodnix Shrillwhistle' },
        },
        [6] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [7] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [8] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [9] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [10] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [11] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone' },
        },
        [12] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [13] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [14] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [15] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [16] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [17] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [18] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [19] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [20] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [21] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [22] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [23] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [24] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [25] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Flamecaller Zoeqdoq',
                          'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [26] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [27] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [28] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [29] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [30] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [31] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [32] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [33] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [34] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast', 'Barong',
                          'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff', 'Flamecaller Zoeqdoq',
                          'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [35] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [36] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [37] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [38] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Elvaansticker Bxafraff', 'Flamecaller Zoeqdoq',
                          'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [39] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [40] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [41] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Apocalyptic Beast',
                          'Baa Dava the Bibliophage', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff',
                          'Flamecaller Zoeqdoq', 'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips',
                          'Hamfist Gukhbuk', 'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon',
                          'Nightmare Bunny', 'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel',
                          'Nightmare Eft', 'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion',
                          'Nightmare Uragnite', 'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice',
                          'Shamblix Rottenheart', 'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone', 'Woodnix Shrillwhistle' },
        },
        [42] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Apocalyptic Beast', 'Baa Dava the Bibliophage',
                          'Barong', 'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff', 'Flamecaller Zoeqdoq',
                          'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
        [43] = {
            true_both = { 'Adamantking Effigy', 'Aitvaras', 'Alklha', 'Baa Dava the Bibliophage', 'Barong',
                          'Doo Peku the Fleetfoot', 'Elvaansticker Bxafraff', 'Flamecaller Zoeqdoq',
                          'GiBhe Fleshfeaster', 'Goblin Replica', 'Gosspix Blabberlips', 'Hamfist Gukhbuk',
                          'Koo Rahi the Levinblade', 'Lyncean Juwgneg', 'Manifest Icon', 'Nightmare Bunny',
                          'Nightmare Crab', 'Nightmare Crawler', 'Nightmare Dhalmel', 'Nightmare Eft',
                          'Nightmare Mandragora', 'Nightmare Raven', 'Nightmare Scorpion', 'Nightmare Uragnite',
                          'QuPho Bloodspiller', 'Ree Nata the Melomanic', 'Sand Cockatrice', 'Shamblix Rottenheart',
                          'Stihi', 'TeZha Ironclad', 'VaRhu Bodysnatcher', 'Vanguard Alchemist',
                          'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer', 'Vanguard Assassin',
                          'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
                          'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster', 'Vanguard Dragontamer',
                          'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
                          'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto', 'Vanguard Hawker',
                          'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Woodnix Shrillwhistle' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Adamantking Effigy'] = { id = 205, name = 'Statue' },
        ['Aitvaras'] = { id = 95, name = 'Dragon' },
        ['Alklha'] = { id = 95, name = 'Dragon' },
        ['Apocalyptic Beast'] = { id = 95, name = 'Dragon' },
        ['Baa Dava the Bibliophage'] = { id = 74, name = 'Yagudo' },
        ['Barong'] = { id = 95, name = 'Dragon' },
        ['Doo Peku the Fleetfoot'] = { id = 74, name = 'Yagudo' },
        ['Elvaansticker Bxafraff'] = { id = 63, name = 'Orc' },
        ['Flamecaller Zoeqdoq'] = { id = 63, name = 'Orc' },
        ['GiBhe Fleshfeaster'] = { id = 67, name = 'Quadav' },
        ['Goblin Replica'] = { id = 205, name = 'Statue' },
        ['Gosspix Blabberlips'] = { id = 58, name = 'Goblin' },
        ['Hamfist Gukhbuk'] = { id = 63, name = 'Orc' },
        ['Koo Rahi the Levinblade'] = { id = 74, name = 'Yagudo' },
        ['Lyncean Juwgneg'] = { id = 63, name = 'Orc' },
        ['Manifest Icon'] = { id = 205, name = 'Statue' },
        ['Nightmare Bunny'] = { id = 50, name = 'Rabbit' },
        ['Nightmare Crab'] = { id = 11, name = 'Crab' },
        ['Nightmare Crawler'] = { id = 186, name = 'Crawler' },
        ['Nightmare Dhalmel'] = { id = 44, name = 'Dhalmel' },
        ['Nightmare Eft'] = { id = 124, name = 'Eft' },
        ['Nightmare Mandragora'] = { id = 146, name = 'Mandragora' },
        ['Nightmare Raven'] = { id = 78, name = 'Bird' },
        ['Nightmare Scorpion'] = { id = 194, name = 'Scorpion' },
        ['Nightmare Uragnite'] = { id = 20, name = 'Uragnite' },
        ['QuPho Bloodspiller'] = { id = 67, name = 'Quadav' },
        ['Ree Nata the Melomanic'] = { id = 74, name = 'Yagudo' },
        ['Sand Cockatrice'] = { id = 79, name = 'Cockatrice' },
        ['Shamblix Rottenheart'] = { id = 58, name = 'Goblin' },
        ['Stihi'] = { id = 95, name = 'Dragon' },
        ['TeZha Ironclad'] = { id = 67, name = 'Quadav' },
        ['VaRhu Bodysnatcher'] = { id = 67, name = 'Quadav' },
        ['Vanguard Alchemist'] = { id = 58, name = 'Goblin' },
        ['Vanguard Ambusher'] = { id = 58, name = 'Goblin' },
        ['Vanguard Amputator'] = { id = 63, name = 'Orc' },
        ['Vanguard Armorer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Assassin'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Backstabber'] = { id = 63, name = 'Orc' },
        ['Vanguard Beasttender'] = { id = 67, name = 'Quadav' },
        ['Vanguard Bugler'] = { id = 63, name = 'Orc' },
        ['Vanguard Chanter'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Constable'] = { id = 67, name = 'Quadav' },
        ['Vanguard Defender'] = { id = 67, name = 'Quadav' },
        ['Vanguard Dollmaster'] = { id = 63, name = 'Orc' },
        ['Vanguard Dragontamer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Drakekeeper'] = { id = 67, name = 'Quadav' },
        ['Vanguard Enchanter'] = { id = 58, name = 'Goblin' },
        ['Vanguard Exemplar'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Footsoldier'] = { id = 63, name = 'Orc' },
        ['Vanguard Grappler'] = { id = 63, name = 'Orc' },
        ['Vanguard Gutslasher'] = { id = 63, name = 'Orc' },
        ['Vanguard Hatamoto'] = { id = 67, name = 'Quadav' },
        ['Vanguard Hawker'] = { id = 63, name = 'Orc' },
        ['Vanguard Hitman'] = { id = 58, name = 'Goblin' },
        ['Vanguard Impaler'] = { id = 63, name = 'Orc' },
        ['Vanguard Inciter'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Kusa'] = { id = 67, name = 'Quadav' },
        ['Vanguard Liberator'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Maestro'] = { id = 58, name = 'Goblin' },
        ['Vanguard Mason'] = { id = 67, name = 'Quadav' },
        ['Vanguard Mesmerizer'] = { id = 63, name = 'Orc' },
        ['Vanguard Militant'] = { id = 67, name = 'Quadav' },
        ['Vanguard Minstrel'] = { id = 67, name = 'Quadav' },
        ['Vanguard Neckchopper'] = { id = 63, name = 'Orc' },
        ['Vanguard Necromancer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Ogresoother'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Oracle'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Partisan'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Pathfinder'] = { id = 58, name = 'Goblin' },
        ['Vanguard Persecutor'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Pillager'] = { id = 63, name = 'Orc' },
        ['Vanguard Pitfighter'] = { id = 58, name = 'Goblin' },
        ['Vanguard Predator'] = { id = 63, name = 'Orc' },
        ['Vanguard Prelate'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Priest'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Protector'] = { id = 67, name = 'Quadav' },
        ['Vanguard Purloiner'] = { id = 67, name = 'Quadav' },
        ['Vanguard Ronin'] = { id = 58, name = 'Goblin' },
        ['Vanguard Salvager'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Sentinel'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Shaman'] = { id = 58, name = 'Goblin' },
        ['Vanguard Skirmisher'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Smithy'] = { id = 58, name = 'Goblin' },
        ['Vanguard Thaumaturge'] = { id = 67, name = 'Quadav' },
        ['Vanguard Tinkerer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Trooper'] = { id = 63, name = 'Orc' },
        ['Vanguard Undertaker'] = { id = 67, name = 'Quadav' },
        ['Vanguard Vexer'] = { id = 63, name = 'Orc' },
        ['Vanguard Vigilante'] = { id = 67, name = 'Quadav' },
        ['Vanguard Vindicator'] = { id = 67, name = 'Quadav' },
        ['Vanguard Visionary'] = { id = 74, name = 'Yagudo' },
        ['Vanguard Welldigger'] = { id = 58, name = 'Goblin' },
        ['Warchief Tombstone'] = { id = 205, name = 'Statue' },
        ['Woodnix Shrillwhistle'] = { id = 58, name = 'Goblin' },
    },
    monsters = {
        {
            name   = 'Goblin Replica',
            ids    = { 1, 6, 8, 11, 13, 15, 21, 23, 29, 31, 35 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [65] = { acc = 264, eva = 233, agi = 80, int = 80, mnd = 102, chr = 90, dex = 74, def = 264,
                         attack_skill = 214 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
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
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Goblin Statue (ID 478); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [65] = 1000 }, mp = { [65] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Shamblix Rottenheart',
            ids    = { 2 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 367, eva = 345, agi = 101, int = 109, mnd = 82, chr = 82, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, item = 15109 },  -- abyss gauntlets
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Pitfighter',
            ids    = { 3 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4180 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Smithy',
            ids    = { 4 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Ronin',
            ids    = { 5, 38 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Hitman',
            ids    = { 7, 32 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Necromancer',
            ids    = { 9, 36 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2241 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 10, 37, 43, 77, 133, 135, 163, 167 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 302,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Enchanter',
            ids    = { 12 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Shaman',
            ids    = { 14, 30 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Gosspix Blabberlips',
            ids    = { 16 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [82] = { acc = 363, eva = 333, agi = 95, int = 109, mnd = 109, chr = 101, dex = 101, def = 350,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, item = 15106 },  -- duelists gloves
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Welldigger',
            ids    = { 17 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Armorer',
            ids    = { 18 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 8,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Dragontamer',
            ids    = { 19 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 9,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 20, 58, 123, 125, 160, 173 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Maestro',
            ids    = { 22 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 10,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Woodnix Shrillwhistle',
            ids    = { 24 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [82] = { acc = 367, eva = 339, agi = 88, int = 95, mnd = 95, chr = 122, dex = 109, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 100, item = 15095 },  -- monster jackcoat
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 11,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Woodnixs Slime',
            ids    = { 25 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [82] = { acc = 363, eva = 333, agi = 95, int = 109, mnd = 109, chr = 101, dex = 101, def = 350,
                         attack_skill = 293 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4800 }, mp = { [82] = 2000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Ambusher',
            ids    = { 26 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 12,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Tinkerer',
            ids    = { 27 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 13,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Alchemist',
            ids    = { 28 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 14,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Pathfinder',
            ids    = { 33 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 15,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguards Slime',
            ids    = { 34 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            resist = { silence = 15 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -75, hand_to_hand = -75 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Slime / Amorph', notes = { 'Source species: Slime (ID 18); family ID 8.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Warchief Tombstone',
            ids    = { 39, 41, 45, 50, 53, 55, 62, 64, 66, 68, 70, 75, 80 },
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
            name   = 'Vanguard Pillager',
            ids    = { 40, 84 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Dollmaster',
            ids    = { 42, 76 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 2241 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Bugler',
            ids    = { 44, 85 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Lyncean Juwgneg',
            ids    = { 46 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [82] = { acc = 411, eva = 331, agi = 122, int = 95, mnd = 101, chr = 95, dex = 101, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { poison = 25 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 15127 },  -- scouts braccae
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 16,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8400 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Grappler',
            ids    = { 47, 48 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4389 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Predator',
            ids    = { 49 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 17,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 51, 74 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Amputator',
            ids    = { 52, 73 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Trooper',
            ids    = { 54 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 18,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Hamfist Gukhbuk',
            ids    = { 56 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [82] = { acc = 370, eva = 347, agi = 88, int = 82, mnd = 101, chr = 95, dex = 115, def = 364,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 15118 },  -- melee hose
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 19,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8589 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Impaler',
            ids    = { 57 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 20,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Hawker',
            ids    = { 59, 78 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 60, 79 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 307, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Footsoldier',
            ids    = { 61, 72 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Mesmerizer',
            ids    = { 63 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 21,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Vexer',
            ids    = { 65, 83 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 67 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 22,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Gutslasher',
            ids    = { 69 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1452 },  -- ordelle bronzepiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 1452 },  -- ordelle bronzepiece
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 23,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4200 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Flamecaller Zoeqdoq',
            ids    = { 71 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 15105 },  -- sorcerers gloves
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 24,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8400 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Elvaansticker Bxafraff',
            ids    = { 81 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [82] = { acc = 385, eva = 353, agi = 101, int = 88, mnd = 95, chr = 109, dex = 101, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 1453 },  -- montiont silverpiece
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
                { rate = 100, item = 15145 },  -- wyrm greaves
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 25,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Orc / Beastmen', notes = { 'Source species: Dynamis Orc (ID 140); family ID 63.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8400 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Bxafraffs Wyvern',
            ids    = { 82 },
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
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Blue Wyvern (ID 236); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4800 }, mp = { [82] = 2000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Adamantking Effigy',
            ids    = { 86, 93, 96, 99, 102, 107, 110, 113, 118, 121, 126, 131, 136 },
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
                { rate = 50, item = 4248 },  -- copy of ginuvas battle theory
                { rate = 10, item = 749 },  -- mythril beastcoin
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
            name   = 'QuPho Bloodspiller',
            ids    = { 87 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 25 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 15102 },  -- warriors mufflers
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 26,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7200 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Vindicator',
            ids    = { 88 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 27,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Beasttender',
            ids    = { 89, 91 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 90, 92 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.', 'Phoenix monster-pet EXP is reduced by 70%, 80% or 90% for parties of 4, 5 or 6+; smaller parties keep the base award.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Thaumaturge',
            ids    = { 94, 95, 137, 138 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Vigilante',
            ids    = { 97, 98 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Protector',
            ids    = { 100, 101 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'GiBhe Fleshfeaster',
            ids    = { 103 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 15074 },  -- clerics cap
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 28,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7200 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Constable',
            ids    = { 104 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 29,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Militant',
            ids    = { 105, 106 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3762 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Hatamoto',
            ids    = { 108, 109 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Defender',
            ids    = { 111, 112, 115 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'TeZha Ironclad',
            ids    = { 114 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 82, mnd = 109, chr = 109, dex = 95, def = 412,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { sleep = 25 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 15108 },  -- valor gauntlets
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 30,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7200 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 116, 117 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [75] = { acc = 329, eva = 331, agi = 107, int = 94, mnd = 76, chr = 82, dex = 107, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Minstrel',
            ids    = { 119, 120 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 122, 124 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'VaRhu Bodysnatcher',
            ids    = { 127 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [82] = { acc = 374, eva = 418, agi = 115, int = 109, mnd = 82, chr = 82, dex = 122, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { gravity = 25 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 10, item = 1456 },  -- one hundred byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 15092 },  -- assassins vest
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 31,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 7200 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Purloiner',
            ids    = { 128 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 32,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Quadav / Beastmen', notes = { 'Source species: Dynamis Quadav (ID 149); family ID 67.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Mason',
            ids    = { 129, 130 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Undertaker',
            ids    = { 132, 134 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, earth = -1, thunder = -2, water = 1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 100, item = 1455 },  -- one byne bill
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 3600 }, mp = { [75] = 2241 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Manifest Icon',
            ids    = { 139, 144, 147, 150, 156, 161, 165, 169, 174, 177, 180, 185, 188 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [82] = { acc = 367, eva = 324, agi = 109, int = 122, mnd = 95, chr = 101, dex = 109, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            magic_dmg = { all = -50 },
            weapon_dmg = { slashing = -18.75, piercing = -25, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 50, item = 4248 },  -- copy of ginuvas battle theory
                { rate = 10, item = 749 },  -- mythril beastcoin
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
            name   = 'Koo Rahi the Levinblade',
            ids    = { 140 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [82] = { acc = 367, eva = 353, agi = 101, int = 95, mnd = 95, chr = 101, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 15128 },  -- saotome haidate
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 33,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Skirmisher',
            ids    = { 141, 179 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Salvager',
            ids    = { 142, 187 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [75] = { acc = 371, eva = 295, agi = 115, int = 89, mnd = 94, chr = 89, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 143, 175, 176 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [75] = { acc = 326, eva = 309, agi = 94, int = 101, mnd = 76, chr = 76, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Sentinel',
            ids    = { 145, 148 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [75] = { acc = 329, eva = 310, agi = 82, int = 76, mnd = 94, chr = 89, dex = 107, def = 327,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4180 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Persecutor',
            ids    = { 146, 149 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [75] = { acc = 326, eva = 316, agi = 94, int = 89, mnd = 89, chr = 94, dex = 101, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Baa Dava the Bibliophage',
            ids    = { 151 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [82] = { acc = 360, eva = 320, agi = 101, int = 115, mnd = 115, chr = 115, dex = 95, def = 347,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 15116 },  -- summoners bracers
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 34,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 2466 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Baas Avatar',
            ids    = { 152 },
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
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true, scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4800 }, mp = { [82] = 2000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Priest',
            ids    = { 153 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [75] = { acc = 317, eva = 282, agi = 89, int = 89, mnd = 115, chr = 101, dex = 82, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 35,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 154 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [75] = { acc = 326, eva = 288, agi = 101, int = 115, mnd = 89, chr = 94, dex = 101, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 36,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 155 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 37,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Ogresoother',
            ids    = { 157, 170 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [75] = { acc = 326, eva = 303, agi = 82, int = 89, mnd = 89, chr = 115, dex = 101, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 158, 171 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [75] = { acc = 323, eva = 297, agi = 89, int = 101, mnd = 101, chr = 94, dex = 94, def = 314,
                         attack_skill = 256 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Partisan',
            ids    = { 159, 172 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [75] = { acc = 345, eva = 316, agi = 94, int = 82, mnd = 89, chr = 101, dex = 94, def = 320,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Oracle',
            ids    = { 162, 166 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [75] = { acc = 320, eva = 285, agi = 94, int = 107, mnd = 107, chr = 107, dex = 89, def = 311,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2241 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 164, 168, 190 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [75] = { acc = 323, eva = 294, agi = 82, int = 94, mnd = 94, chr = 107, dex = 94, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Liberator',
            ids    = { 178, 186 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [75] = { acc = 333, eva = 379, agi = 107, int = 101, mnd = 76, chr = 76, dex = 115, def = 317,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Doo Peku the Fleetfoot',
            ids    = { 181 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [82] = { acc = 370, eva = 370, agi = 115, int = 101, mnd = 82, chr = 88, dex = 115, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 15144 },  -- koga kyahan
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 38,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Dual Wield 30', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'The Dual Wield trait applies only when this monster has dual wield enabled; the trait alone does not enable it.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Assassin',
            ids    = { 182, 183, 184 },
            nm     = true,
            job    = 'nin/war',
            levels = {
                [75] = { acc = 328, eva = 330, agi = 105, int = 90, mnd = 78, chr = 84, dex = 105, def = 329,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { virus = 25, bind = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Ree Nata the Melomanic',
            ids    = { 189 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [82] = { acc = 363, eva = 330, agi = 88, int = 101, mnd = 101, chr = 115, dex = 101, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 10, item = 1450 },  -- lungo-nango jadeshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 15081 },  -- bards roundlet
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 39,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Yagudo / Beastmen', notes = { 'Source species: Dynamis Yagudo (ID 166); family ID 74.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 8000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Exemplar',
            ids    = { 191, 192 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [75] = { acc = 320, eva = 300, agi = 76, int = 76, mnd = 101, chr = 101, dex = 89, def = 375,
                         attack_skill = 256 },
            },
            ranks  = { fire = -1, ice = -2, wind = 1, earth = 1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = 1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 240, item = 1449 },  -- tukuku whiteshell
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1449 },  -- tukuku whiteshell
                { rate = 50, group = {  -- one of
                    { 15074, 1 },  -- clerics cap
                    { 15081, 1 },  -- bards roundlet
                    { 15092, 1 },  -- assassins vest
                    { 15095, 1 },  -- monster jackcoat
                    { 15102, 1 },  -- warriors mufflers
                    { 15105, 1 },  -- sorcerers gloves
                    { 15106, 1 },  -- duelists gloves
                    { 15108, 1 },  -- valor gauntlets
                    { 15109, 1 },  -- abyss gauntlets
                    { 15116, 1 },  -- summoners bracers
                    { 15118, 1 },  -- melee hose
                    { 15127, 1 },  -- scouts braccae
                    { 15128, 1 },  -- saotome haidate
                    { 15144, 1 },  -- koga kyahan
                    { 15145, 1 },  -- wyrm greaves
                } },
                { rate = 10, group = {  -- one of
                    { 11388, 1 },  -- pantin babouches
                    { 15028, 1 },  -- commodore gants
                    { 16346, 1 },  -- mirage shalwar
                } },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Stihi',
            ids    = { 193 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 40,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Aitvaras',
            ids    = { 194 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Aitvaras',
            ids    = { 195 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Barong',
            ids    = { 196 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 41,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Aitvaras',
            ids    = { 197 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Alklha',
            ids    = { 198 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 42,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Aitvaras',
            ids    = { 199 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Aitvaras',
            ids    = { 200 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Aitvaras',
            ids    = { 201 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Aitvaras',
            ids    = { 202 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 10, group = {  -- one of
                    { 1450, 1 },  -- lungo-nango jadeshell
                    { 1453, 1 },  -- montiont silverpiece
                    { 1456, 1 },  -- one hundred byne bill
                } },
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 15000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Apocalyptic Beast',
            ids    = { 203 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 11,
                       paralyze = 2, bind = 9, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'petrify', 'terror' },
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
            links  = 43,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Dragon / Dragon', notes = { 'Source species: Dragon (ID 219); family ID 95.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 27000 }, mp = { [82] = 249 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 27', notes = { 'Source base speed is 27; the ordinary monster default is 40. Animation speed is 27.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = { value = 'Move list unresolved', notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Mighty Strikes is possible while its Bloodspiller lockout remains open.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.', 'An empty list does not mean this monster is safe.' }, entries = {  }, coverage = 'unresolved', incomplete = true, reasons = danger[2], general_notes = { 'These are possible moves from the source. They do not predict the next move.', 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.', 'Mighty Strikes is possible while its Bloodspiller lockout remains open.' } },
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Wyvern',
            ids    = { 204, 205, 206, 207, 208 },
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
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Wyvern Pet / Dragon', notes = { 'Source species: Shadow Wyvern (ID 237); family ID 100.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 2400 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 200', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Avatar',
            ids    = { 209 },
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
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Avatar / Elemental', notes = { 'Source species: Carbuncle (ID 243); family ID 102.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 2400 }, mp = { [82] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Crab',
            ids    = { 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227,
                       228, 229 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [78] = { acc = 337, eva = 315, agi = 78, int = 78, mnd = 104, chr = 104, dex = 92, def = 390,
                         attack_skill = 271 },
                [79] = { acc = 342, eva = 320, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 397,
                         attack_skill = 276 },
                [80] = { acc = 347, eva = 325, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 402,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15478, 1 },  -- melee cape
                    { 15481, 1 },  -- valor cape
                    { 15482, 1 },  -- bards cape
                    { 15878, 1 },  -- wyrm belt
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Crab / Aquan', notes = { 'Source species: Crab (ID 25); family ID 11.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Nightmare Dhalmel',
            ids    = { 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247,
                       248, 249, 250, 251, 252, 253, 254, 255 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15478, 1 },  -- melee cape
                    { 15481, 1 },  -- valor cape
                    { 15482, 1 },  -- bards cape
                    { 15878, 1 },  -- wyrm belt
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Dhalmel / Beast', notes = { 'Source species: Dhalmel (ID 95); family ID 44.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Uragnite',
            ids    = { 256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273,
                       274, 275, 276, 277 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15479, 1 },  -- abyss cape
                    { 15873, 1 },  -- duelists belt
                    { 15877, 1 },  -- koga sarashi
                    { 16244, 1 },  -- mirage mantle
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_elements = true, scripted_weapons = true, scripted_defense = true },
            info = {
                family = { value = 'Uragnite / Aquan', notes = { 'Source species: Uragnite (ID 44); family ID 20.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.', 'A script or loaded override changes movement.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 290 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Scripts or loaded overrides can change attack traits during the fight.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Scorpion',
            ids    = { 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295,
                       296, 297, 298 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15478, 1 },  -- melee cape
                    { 15481, 1 },  -- valor cape
                    { 15482, 1 },  -- bards cape
                    { 15878, 1 },  -- wyrm belt
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Scorpion / Vermin', notes = { 'Source species: Scorpion (ID 460); family ID 194.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 280 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Bunny',
            ids    = { 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316,
                       317, 318 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [78] = { acc = 349, eva = 396, agi = 110, int = 104, mnd = 78, chr = 78, dex = 117, def = 332,
                         attack_skill = 271 },
                [79] = { acc = 356, eva = 402, agi = 112, int = 106, mnd = 79, chr = 79, dex = 120, def = 338,
                         attack_skill = 276 },
                [80] = { acc = 361, eva = 407, agi = 112, int = 106, mnd = 79, chr = 79, dex = 120, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15871, 1 },  -- warriors stone
                    { 15874, 1 },  -- sorcerers belt
                    { 15876, 1 },  -- scouts belt
                    { 16245, 1 },  -- pantin cape
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Rabbit / Beast', notes = { 'Source species: Rabbit (ID 106); family ID 50.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Mandragora',
            ids    = { 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336,
                       337, 338, 339, 340, 341, 342 },
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
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15871, 1 },  -- warriors stone
                    { 15874, 1 },  -- sorcerers belt
                    { 15876, 1 },  -- scouts belt
                    { 16245, 1 },  -- pantin cape
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Mandragora / Plantoid', notes = { 'Source species: Mandragora (ID 350); family ID 146.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5180, [79] = 5180, [80] = 5180 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Counter 10', notes = { 'Base attack delay 380 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Sand Cockatrice',
            ids    = { 343, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360,
                       361, 362 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 100, item = 854 },  -- cockatrice skin
            },
            steal  = { 842 },  -- giant bird feather
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Cockatrice / Bird', notes = { 'Source species: Cockatrice (ID 177); family ID 79.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 4863, [79] = 4947, [80] = 5031 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Raven',
            ids    = { 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380,
                       381, 382, 383, 384, 385, 386, 387, 388 },
            nm     = true,
            job    = 'war/thf',
            levels = {
                [78] = { acc = 345, eva = 394, agi = 106, int = 91, mnd = 82, chr = 87, dex = 108, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 351, eva = 400, agi = 108, int = 92, mnd = 83, chr = 88, dex = 111, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 356, eva = 405, agi = 108, int = 92, mnd = 83, chr = 88, dex = 111, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            weapon_dmg = { piercing = 25 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15479, 1 },  -- abyss cape
                    { 15873, 1 },  -- duelists belt
                    { 15877, 1 },  -- koga sarashi
                    { 16244, 1 },  -- mirage mantle
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bird / Bird', notes = { 'Source species: Bird (ID 175); family ID 78.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Crawler',
            ids    = { 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406,
                       407, 408, 409, 410, 411, 412 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 318,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 323,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 328,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15479, 1 },  -- abyss cape
                    { 15873, 1 },  -- duelists belt
                    { 15877, 1 },  -- koga sarashi
                    { 16244, 1 },  -- mirage mantle
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Crawler / Vermin', notes = { 'Source species: Crawler (ID 437); family ID 186.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Eft',
            ids    = { 413, 414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429, 430,
                       431, 432 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = 2, earth = 2, thunder = -1, water = 2, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 2, slow = 2, poison = 2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 240, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
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
                    { 15871, 1 },  -- warriors stone
                    { 15874, 1 },  -- sorcerers belt
                    { 15876, 1 },  -- scouts belt
                    { 16245, 1 },  -- pantin cape
                } },
                { rate = 50, group = {  -- one of
                    { 2035, 1 },  -- warriors mufflers -1
                    { 2040, 1 },  -- melee gloves -1
                    { 2045, 1 },  -- clerics mitts -1
                    { 2050, 1 },  -- sorcerers gloves -1
                    { 2055, 1 },  -- duelists gloves -1
                    { 2060, 1 },  -- assassins armlets -1
                    { 2065, 1 },  -- valor gauntlets -1
                    { 2070, 1 },  -- abyss gauntlets -1
                    { 2075, 1 },  -- monster gloves -1
                    { 2080, 1 },  -- bards cuffs -1
                    { 2085, 1 },  -- scouts bracers -1
                    { 2090, 1 },  -- saotome kote -1
                    { 2095, 1 },  -- koga tekko -1
                    { 2100, 1 },  -- wyrm finger gauntlets -1
                    { 2105, 1 },  -- summoners bracers -1
                } },
                { rate = 10, group = {  -- one of
                    { 2664, 1 },  -- mirage bazubands -1
                    { 2669, 1 },  -- commodore gants -1
                    { 2674, 1 },  -- pantin dastanas -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Eft / Lizard', notes = { 'Source species: Eft (ID 303); family ID 124.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
