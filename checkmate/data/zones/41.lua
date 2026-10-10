-- Dynamis-Qufim (zone 41).
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
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [2] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer', 'Vanguard Assassin',
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
                          'Water Elemental' },
        },
        [3] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Beasttender', 'Vanguard Bugler', 'Vanguard Chanter',
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
                          'Water Elemental' },
        },
        [4] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [5] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Chanter',
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
                          'Water Elemental' },
        },
        [6] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [7] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [8] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [9] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [10] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dragontamer',
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
                          'Water Elemental' },
        },
        [11] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
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
                          'Water Elemental' },
        },
        [12] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [13] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [14] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
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
                          'Water Elemental' },
        },
        [15] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [16] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [17] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [18] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [19] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [20] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [21] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
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
                          'Water Elemental' },
        },
        [22] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [23] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [24] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [25] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [26] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
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
                          'Water Elemental' },
        },
        [27] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [28] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Kusa',
                          'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason', 'Vanguard Mesmerizer',
                          'Vanguard Militant', 'Vanguard Minstrel', 'Vanguard Neckchopper', 'Vanguard Necromancer',
                          'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan', 'Vanguard Pathfinder',
                          'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter', 'Vanguard Predator',
                          'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector', 'Vanguard Purloiner',
                          'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel', 'Vanguard Shaman',
                          'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge', 'Vanguard Tinkerer',
                          'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [29] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Minstrel', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [30] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Water Elemental' },
        },
        [31] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Stringes', 'Suttung', 'Thunder Elemental', 'Vanguard Alchemist',
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
                          'Water Elemental' },
        },
        [32] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hawker',
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
                          'Water Elemental' },
        },
        [33] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [34] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Exemplar', 'Vanguard Footsoldier',
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
                          'Water Elemental' },
        },
        [35] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
                          'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Amputator', 'Vanguard Armorer',
                          'Vanguard Assassin', 'Vanguard Backstabber', 'Vanguard Beasttender', 'Vanguard Bugler',
                          'Vanguard Chanter', 'Vanguard Constable', 'Vanguard Defender', 'Vanguard Dollmaster',
                          'Vanguard Dragontamer', 'Vanguard Drakekeeper', 'Vanguard Enchanter', 'Vanguard Exemplar',
                          'Vanguard Footsoldier', 'Vanguard Grappler', 'Vanguard Gutslasher', 'Vanguard Hatamoto',
                          'Vanguard Hawker', 'Vanguard Hitman', 'Vanguard Impaler', 'Vanguard Inciter',
                          'Vanguard Kusa', 'Vanguard Liberator', 'Vanguard Maestro', 'Vanguard Mason',
                          'Vanguard Mesmerizer', 'Vanguard Militant', 'Vanguard Neckchopper',
                          'Vanguard Necromancer', 'Vanguard Ogresoother', 'Vanguard Oracle', 'Vanguard Partisan',
                          'Vanguard Pathfinder', 'Vanguard Persecutor', 'Vanguard Pillager', 'Vanguard Pitfighter',
                          'Vanguard Predator', 'Vanguard Prelate', 'Vanguard Priest', 'Vanguard Protector',
                          'Vanguard Purloiner', 'Vanguard Ronin', 'Vanguard Salvager', 'Vanguard Sentinel',
                          'Vanguard Shaman', 'Vanguard Skirmisher', 'Vanguard Smithy', 'Vanguard Thaumaturge',
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Undertaker', 'Vanguard Vexer',
                          'Vanguard Vigilante', 'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger',
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [36] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Vanguard Tinkerer', 'Vanguard Trooper', 'Vanguard Vexer', 'Vanguard Vigilante',
                          'Vanguard Vindicator', 'Vanguard Visionary', 'Vanguard Welldigger', 'Warchief Tombstone',
                          'Water Elemental' },
        },
        [37] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Thunder Elemental', 'Vanguard Alchemist',
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
                          'Water Elemental' },
        },
        [38] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Suttung', 'Thunder Elemental', 'Vanguard Alchemist',
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
                          'Water Elemental' },
        },
        [39] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [40] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [41] = {
            true_both = { 'Adamantking Effigy', 'Antaeus', 'Dark Elemental', 'Earth Elemental', 'Fire Elemental',
                          'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [42] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Fire Elemental',
                          'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [43] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Vanguard Alchemist',
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
                          'Water Elemental' },
        },
        [44] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
        [45] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [46] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Antaeus', 'Earth Elemental', 'Fire Elemental',
                          'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
        [47] = {
            true_both = { 'Adamantking Effigy', 'Air Elemental', 'Dark Elemental', 'Earth Elemental',
                          'Fire Elemental', 'Goblin Replica', 'Ice Elemental', 'Light Elemental', 'Manifest Icon',
                          'Nightmare Diremite', 'Nightmare Gaylas', 'Nightmare Kraken', 'Nightmare Raptor',
                          'Nightmare Roc', 'Nightmare Snoll', 'Nightmare Stirge', 'Nightmare Tiger',
                          'Nightmare Weapon', 'Scolopendra', 'Stringes', 'Suttung', 'Thunder Elemental',
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
                          'Warchief Tombstone', 'Water Elemental' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Adamantking Effigy'] = { id = 205, name = 'Statue' },
        ['Air Elemental'] = { id = 103, name = 'Elemental' },
        ['Antaeus'] = { id = 57, name = 'Gigas' },
        ['Dark Elemental'] = { id = 103, name = 'Elemental' },
        ['Earth Elemental'] = { id = 103, name = 'Elemental' },
        ['Fire Elemental'] = { id = 103, name = 'Elemental' },
        ['Goblin Replica'] = { id = 205, name = 'Statue' },
        ['Ice Elemental'] = { id = 103, name = 'Elemental' },
        ['Light Elemental'] = { id = 103, name = 'Elemental' },
        ['Manifest Icon'] = { id = 205, name = 'Statue' },
        ['Nightmare Diremite'] = { id = 187, name = 'Diremite' },
        ['Nightmare Gaylas'] = { id = 81, name = 'Flock Bat' },
        ['Nightmare Kraken'] = { id = 19, name = 'Sea Monk' },
        ['Nightmare Raptor'] = { id = 129, name = 'Raptor' },
        ['Nightmare Roc'] = { id = 84, name = 'Greater Bird' },
        ['Nightmare Snoll'] = { id = 22, name = 'Bomb' },
        ['Nightmare Stirge'] = { id = 77, name = 'Bat' },
        ['Nightmare Tiger'] = { id = 53, name = 'Tiger' },
        ['Nightmare Weapon'] = { id = 27, name = 'Evil Weapon' },
        ['Scolopendra'] = { id = 19, name = 'Sea Monk' },
        ['Stringes'] = { id = 77, name = 'Bat' },
        ['Suttung'] = { id = 28, name = 'Golem' },
        ['Thunder Elemental'] = { id = 103, name = 'Elemental' },
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
        ['Water Elemental'] = { id = 103, name = 'Elemental' },
    },
    monsters = {
        {
            name   = 'Warchief Tombstone',
            ids    = { 1, 5, 7, 11, 13, 16, 21, 23, 24 },
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
                { rate = 150, item = 1452 },  -- ordelle bronzepiece
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
            name   = 'Vanguard Grappler',
            ids    = { 2, 20 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Amputator',
            ids    = { 3 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Backstabber',
            ids    = { 4 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
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
            name   = 'Vanguard Trooper',
            ids    = { 6 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
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
            name   = 'Vanguard Bugler',
            ids    = { 8 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
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
            name   = 'Vanguard Impaler',
            ids    = { 9 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguards Wyvern',
            ids    = { 10, 32, 78, 103, 117, 144, 233 },
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
            name   = 'Vanguard Neckchopper',
            ids    = { 12, 22 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Vexer',
            ids    = { 14 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Mesmerizer',
            ids    = { 15 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 8,
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
            name   = 'Vanguard Pillager',
            ids    = { 17 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 9,
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
            ids    = { 18 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 10,
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
            name   = 'Vanguards Avatar',
            ids    = { 19, 48, 91, 98, 120, 136, 215 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Footsoldier',
            ids    = { 25 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 11,
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
            name   = 'Vanguard Gutslasher',
            ids    = { 26 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 12,
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
            name   = 'Vanguard Predator',
            ids    = { 27 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 13,
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
            ids    = { 28 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 14,
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
            ids    = { 29 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Manifest Icon',
            ids    = { 30, 33, 37, 41, 42, 46, 49, 54 },
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
                { rate = 150, item = 1449 },  -- tukuku whiteshell
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
            name   = 'Vanguard Partisan',
            ids    = { 31 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 15,
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
            name   = 'Vanguard Exemplar',
            ids    = { 34 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 16,
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
            name   = 'Vanguard Prelate',
            ids    = { 35 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 17,
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
            name   = 'Vanguard Persecutor',
            ids    = { 36, 56 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Sentinel',
            ids    = { 38 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 18,
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
            name   = 'Vanguard Liberator',
            ids    = { 39 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 19,
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
            name   = 'Vanguard Priest',
            ids    = { 40 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 20,
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
            name   = 'Vanguard Assassin',
            ids    = { 43 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 21,
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
            name   = 'Vanguard Ogresoother',
            ids    = { 44 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 22,
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
            ids    = { 45 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 47 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 23,
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
            name   = 'Vanguard Skirmisher',
            ids    = { 50 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 24,
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
            name   = 'Vanguard Visionary',
            ids    = { 51 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 25,
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
            name   = 'Vanguard Chanter',
            ids    = { 52 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 26,
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
            name   = 'Vanguard Salvager',
            ids    = { 53 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 27,
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
            ids    = { 55 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 28,
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
            name   = 'Adamantking Effigy',
            ids    = { 57, 61, 66, 70, 74, 79, 86 },
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
                { rate = 150, item = 1455 },  -- one byne bill
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
            name   = 'Vanguard Vindicator',
            ids    = { 58, 87 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Protector',
            ids    = { 59, 82 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Kusa',
            ids    = { 60, 76 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Militant',
            ids    = { 62 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Thaumaturge',
            ids    = { 63, 89 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Purloiner',
            ids    = { 64 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
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
            name   = 'Scolopendra',
            ids    = { 65 },
            nm     = true,
            job    = 'war/war',
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
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
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 31,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 95', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Defender',
            ids    = { 67, 83 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Hatamoto',
            ids    = { 68 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Store TP 25', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Constable',
            ids    = { 69, 88 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Beasttender',
            ids    = { 71, 80 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            ids    = { 72, 81 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Mason',
            ids    = { 73, 84 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Vigilante',
            ids    = { 75 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 33,
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
            name   = 'Vanguard Drakekeeper',
            ids    = { 77 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 34,
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
            name   = 'Vanguard Minstrel',
            ids    = { 85 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 35,
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
            ids    = { 90 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 36,
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
            name   = 'Goblin Replica',
            ids    = { 92, 95, 100, 105, 110, 115, 118, 132, 141, 159, 160, 164, 173, 193, 194, 204, 205, 210, 216,
                       222, 228, 234, 239, 240, 241, 242 },
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
                { rate = 150, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
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
            name   = 'Vanguard Pathfinder',
            ids    = { 93, 167, 226 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguards Slime',
            ids    = { 94, 168, 227 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400 }, mp = { [75] = 2181 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Welldigger',
            ids    = { 96, 133, 206, 229 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Triple Attack 5', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Necromancer',
            ids    = { 97, 119, 135, 214 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Maestro',
            ids    = { 99, 142, 207, 230 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Pitfighter',
            ids    = { 101, 208, 211, 220 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Dragontamer',
            ids    = { 102, 116, 143, 232 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Hitman',
            ids    = { 104, 145, 236 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Smithy',
            ids    = { 106, 165, 221, 235 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Armorer',
            ids    = { 107, 213, 223 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Enchanter',
            ids    = { 108, 134, 219, 237 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Shaman',
            ids    = { 109, 166, 218, 238 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Ronin',
            ids    = { 111, 217, 231 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
            name   = 'Vanguard Tinkerer',
            ids    = { 112, 174, 224 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                dangers = danger[9],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Ambusher',
            ids    = { 113, 175, 209 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Vanguard Alchemist',
            ids    = { 114, 176, 212, 225 },
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
                    { 15072, 1 },  -- warriors mask
                    { 15078, 1 },  -- valor coronet
                    { 15082, 1 },  -- scouts beret
                    { 15084, 1 },  -- koga hatsuburi
                    { 15103, 1 },  -- melee gloves
                    { 15111, 1 },  -- bards cuffs
                    { 15113, 1 },  -- saotome kote
                    { 15115, 1 },  -- wyrm finger gauntlets
                    { 15119, 1 },  -- clerics pantaloons
                    { 15120, 1 },  -- sorcerers tonban
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15125, 1 },  -- monster trousers
                    { 15137, 1 },  -- assassins poulaines
                    { 15146, 1 },  -- summoners pigaches
                } },
                { rate = 10, group = {  -- one of
                    { 11385, 1 },  -- commodore bottes
                    { 15025, 1 },  -- mirage bazubands
                    { 15031, 1 },  -- pantin dastanas
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
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Snoll',
            ids    = { 121, 122, 123, 124, 125, 126, 127, 128, 137, 138, 139, 140, 146, 147, 148, 149, 150, 151,
                       152, 153, 154, 155, 156, 157 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
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
                    { 15872, 1 },  -- clerics belt
                    { 15875, 1 },  -- monster belt
                    { 15878, 1 },  -- wyrm belt
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bomb / Arcana', notes = { 'Source species: Snoll (ID 48); family ID 22.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Roc',
            ids    = { 129, 130, 131, 161, 162, 163 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 350,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 356,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 361,
                         attack_skill = 281 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            weapon_dmg = { slashing = -25, piercing = 25, blunt = -25 },
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
                    { 15480, 1 },  -- assassins cape
                    { 15873, 1 },  -- duelists belt
                    { 15876, 1 },  -- scouts belt
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Greater Bird / Bird', notes = { 'Source species: Roc (ID 190); family ID 84.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 60', notes = { 'Source base speed is 60; the ordinary monster default is 40. Animation speed is 60.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Suttung',
            ids    = { 158 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
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
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 37,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Golem / Arcana', notes = { 'Source species: Golem (ID 63); family ID 28.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 320 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Stirge',
            ids    = { 169, 170, 171, 172, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190,
                       191 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
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
                    { 15478, 1 },  -- melee cape
                    { 15872, 1 },  -- clerics belt
                    { 15875, 1 },  -- monster belt
                    { 15878, 1 },  -- wyrm belt
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
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
            name   = 'Stringes',
            ids    = { 192 },
            nm     = true,
            levels = {
                [82] = { acc = 367, eva = 349, agi = 109, int = 88, mnd = 88, chr = 95, dex = 109, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            weapon_dmg = { piercing = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
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
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 38,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Bat / Bird', notes = { 'Source species: Bat (ID 173); family ID 77.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 20000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 200 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 195 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 348,
                         attack_skill = 293 },
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
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 39,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Fire Elemental (ID 261); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4719 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 196 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 40,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Ice Elemental (ID 263); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4719 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Air Elemental',
            ids    = { 197 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 348,
                         attack_skill = 293 },
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
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 41,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Air Elemental (ID 256); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4719 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 198 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 42,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Earth Elemental (ID 260); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4719 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Earth.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 199 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 43,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Thunder Elemental (ID 265); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4719 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 200 },
            nm     = true,
            job    = 'blm/rdm',
            levels = {
                [82] = { acc = 366, eva = 338, agi = 104, int = 118, mnd = 100, chr = 101, dex = 106, def = 348,
                         attack_skill = 293 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 44,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Water Elemental (ID 267); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4719 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Water.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Light Elemental',
            ids    = { 201 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [82] = { acc = 357, eva = 317, agi = 95, int = 95, mnd = 122, chr = 109, dex = 88, def = 353,
                         attack_skill = 293 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            drops  = {
                { rate = 1000, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 45,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Light Elemental (ID 264); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 4762 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Light.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Dark Elemental',
            ids    = { 202 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [82] = { acc = 367, eva = 345, agi = 101, int = 109, mnd = 82, chr = 82, dex = 109, def = 357,
                         attack_skill = 293 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            weapon_dmg = { slashing = -75, piercing = -75, blunt = -75, hand_to_hand = -75 },
            immune = { 'dark_sleep', 'light_sleep', 'blind' },
            drops  = {
                { rate = 1000, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 46,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Elemental / Elemental', notes = { 'Source species: Dark Elemental (ID 259); family ID 103.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 5078 }, mp = { [82] = 2406 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Dark.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[12],
                blue = { value = 'Unknown', notes = { 'The assigned TP-move list is missing from the source tables.', 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Antaeus',
            ids    = { 203 },
            nm     = true,
            job    = 'rng/war',
            levels = {
                [82] = { acc = 413, eva = 354, agi = 118, int = 93, mnd = 97, chr = 95, dex = 104, def = 363,
                         attack_skill = 293 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 25, virus = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
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
            links  = 47,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Gigas / Beastmen', notes = { 'Source species: Gigas (ID 121); family ID 57.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [82] = 37000 }, mp = { [82] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Ice.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Diremite',
            ids    = { 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260,
                       261, 262, 263, 264, 265, 266, 267, 268 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [78] = { acc = 343, eva = 324, agi = 96, int = 104, mnd = 78, chr = 78, dex = 104, def = 336,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 330, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 342,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
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
                    { 15484, 1 },  -- summoners cape
                    { 15879, 1 },  -- saotome koshi-ate
                    { 15920, 1 },  -- commodore belt
                    { 16245, 1 },  -- pantin cape
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Diremite / Vermin', notes = { 'Source species: Diremite (ID 442); family ID 187.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 2277, [79] = 2309, [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 45', notes = { 'Source base speed is 45; the ordinary monster default is 40. Animation speed is 45.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 210', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Kraken',
            ids    = { 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286,
                       287, 288, 289, 290, 291, 292, 293, 294, 295 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            weapon_dmg = { slashing = 25, piercing = -12.5, blunt = -12.5 },
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
                    { 15480, 1 },  -- assassins cape
                    { 15873, 1 },  -- duelists belt
                    { 15876, 1 },  -- scouts belt
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Sea Monk / Aquan', notes = { 'Source species: Sea Monk (ID 42); family ID 19.', 'Species names can be internal variants of the same visible family.' } },
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
            name   = 'Nightmare Gaylas',
            ids    = { 296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313,
                       314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
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
                    { 15480, 1 },  -- assassins cape
                    { 15873, 1 },  -- duelists belt
                    { 15876, 1 },  -- scouts belt
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1455 },  -- one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Flock Bat / Bird', notes = { 'Source species: Flock Bat (ID 181); family ID 81.', 'Species names can be internal variants of the same visible family.' } },
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
            name   = 'Nightmare Raptor',
            ids    = { 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342,
                       343, 344, 345, 346, 347, 348 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
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
                    { 15484, 1 },  -- summoners cape
                    { 15879, 1 },  -- saotome koshi-ate
                    { 15920, 1 },  -- commodore belt
                    { 16245, 1 },  -- pantin cape
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Raptor / Lizard', notes = { 'Source species: Raptor (ID 315); family ID 129.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 70', notes = { 'Source base speed is 70; the ordinary monster default is 40. Animation speed is 70.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 210 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Tiger',
            ids    = { 349, 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366,
                       367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
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
                    { 15484, 1 },  -- summoners cape
                    { 15879, 1 },  -- saotome koshi-ate
                    { 15920, 1 },  -- commodore belt
                    { 16245, 1 },  -- pantin cape
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1449 },  -- tukuku whiteshell
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Tiger / Beast', notes = { 'Source species: Tiger (ID 114); family ID 53.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 0, [79] = 0, [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 68', notes = { 'Source base speed is 68; the ordinary monster default is 40. Animation speed is 68.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Thunder.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Nightmare Weapon',
            ids    = { 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398,
                       399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410 },
            nm     = true,
            levels = {
                [78] = { acc = 343, eva = 328, agi = 104, int = 84, mnd = 84, chr = 92, dex = 104, def = 342,
                         attack_skill = 271 },
                [79] = { acc = 349, eva = 334, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 348,
                         attack_skill = 276 },
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
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
                    { 15872, 1 },  -- clerics belt
                    { 15875, 1 },  -- monster belt
                    { 15878, 1 },  -- wyrm belt
                } },
                { rate = 50, group = {  -- one of
                    { 2037, 1 },  -- warriors calligae -1
                    { 2042, 1 },  -- melee gaiters -1
                    { 2047, 1 },  -- clerics duckbills -1
                    { 2052, 1 },  -- sorcerers sabots -1
                    { 2057, 1 },  -- duelists boots -1
                    { 2062, 1 },  -- assassins poulaines -1
                    { 2067, 1 },  -- valor leggings -1
                    { 2072, 1 },  -- abyss sollerets -1
                    { 2077, 1 },  -- monster gaiters -1
                    { 2082, 1 },  -- bards slippers -1
                    { 2087, 1 },  -- scouts socks -1
                    { 2092, 1 },  -- saotome sune-ate -1
                    { 2097, 1 },  -- koga kyahan -1
                    { 2102, 1 },  -- wyrm greaves -1
                    { 2107, 1 },  -- summoners pigaches -1
                } },
                { rate = 10, group = {  -- one of
                    { 2666, 1 },  -- mirage charuqs -1
                    { 2671, 1 },  -- commodore bottes -1
                    { 2676, 1 },  -- pantin babouches -1
                } },
            },
            steal  = { 1452 },  -- ordelle bronzepiece
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Evil Weapon / Arcana', notes = { 'Source species: Evil Weapon (ID 62); family ID 27.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [78] = 5000, [79] = 5000, [80] = 5000 }, mp = { [78] = 1143, [79] = 1159, [80] = 1176 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Wind.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
