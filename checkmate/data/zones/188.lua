-- Dynamis-Jeuno (zone 188).
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
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug',
                          'Tufflix Loglimbs', 'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher',
                          'Vanguard Armorer', 'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman',
                          'Vanguard Maestro', 'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter',
                          'Vanguard Ronin', 'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer',
                          'Vanguard Welldigger', 'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [2] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Distilix Stickytoes', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [3] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [4] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [5] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [6] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug',
                          'Tufflix Loglimbs', 'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher',
                          'Vanguard Armorer', 'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman',
                          'Vanguard Maestro', 'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter',
                          'Vanguard Ronin', 'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer',
                          'Vanguard Welldigger', 'Wyrmwix Snakespecs' },
        },
        [7] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [8] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug',
                          'Tufflix Loglimbs', 'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher',
                          'Vanguard Armorer', 'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman',
                          'Vanguard Maestro', 'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter',
                          'Vanguard Ronin', 'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer',
                          'Vanguard Welldigger', 'Wasabix Callusdigit' },
        },
        [9] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [10] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [11] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [12] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [13] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [14] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [15] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [16] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [17] = {
            true_both = { 'Anvilix Sootwrists', 'Blazox Boneybod', 'Bootrix Jaggedelbow', 'Buffrix Eargone',
                          'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [18] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [19] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [20] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [21] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [22] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [23] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [24] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [25] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [26] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [27] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide',
                          'Snypestix Eaglebeak', 'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug',
                          'Tufflix Loglimbs', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [28] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly',
                          'Rutrix Hamgams', 'Scruffix Shaggychest', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [29] = {
            true_both = { 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow', 'Buffrix Eargone',
                          'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [30] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [31] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Buffrix Eargone',
                          'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [32] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise',
                          'Jabkix Pigeonpecs', 'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck',
                          'Mobpix Mucousmouth', 'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [33] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Eremix Snottynostril', 'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica',
                          'Goblin Statue', 'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [34] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Bootrix Jaggedelbow', 'Buffrix Eargone',
                          'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose', 'Eremix Snottynostril',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
        [35] = {
            true_both = { 'Anvilix Sootwrists', 'Bandrix Rockjaw', 'Blazox Boneybod', 'Bootrix Jaggedelbow',
                          'Buffrix Eargone', 'Cloktix Longnail', 'Distilix Stickytoes', 'Elixmix Hooknose',
                          'Gabblox Magpietongue', 'Goblin Golem', 'Goblin Replica', 'Goblin Statue',
                          'Hermitrix Toothrot', 'Humnox Drumbelly', 'Jabbrox Grannyguise', 'Jabkix Pigeonpecs',
                          'Karashix Swollenskull', 'Kikklix Longlegs', 'Lurklox Dhalmelneck', 'Mobpix Mucousmouth',
                          'Morgmox Moldnoggin', 'Mortilox Wartpaws', 'Prowlox Barrelbelly', 'Rutrix Hamgams',
                          'Scruffix Shaggychest', 'Slystix Megapeepers', 'Smeltix Thickhide', 'Snypestix Eaglebeak',
                          'Sparkspox Sweatbrow', 'Ticktox Beadyeyes', 'Trailblix Goatmug', 'Tufflix Loglimbs',
                          'Tymexox Ninefingers', 'Vanguard Alchemist', 'Vanguard Ambusher', 'Vanguard Armorer',
                          'Vanguard Dragontamer', 'Vanguard Enchanter', 'Vanguard Hitman', 'Vanguard Maestro',
                          'Vanguard Necromancer', 'Vanguard Pathfinder', 'Vanguard Pitfighter', 'Vanguard Ronin',
                          'Vanguard Shaman', 'Vanguard Smithy', 'Vanguard Tinkerer', 'Vanguard Welldigger',
                          'Wasabix Callusdigit', 'Wyrmwix Snakespecs' },
        },
    },
    -- Exact helper names with an unambiguous source family.
    link_families = {
        ['Anvilix Sootwrists'] = { id = 58, name = 'Goblin' },
        ['Bandrix Rockjaw'] = { id = 58, name = 'Goblin' },
        ['Blazox Boneybod'] = { id = 58, name = 'Goblin' },
        ['Bootrix Jaggedelbow'] = { id = 58, name = 'Goblin' },
        ['Buffrix Eargone'] = { id = 58, name = 'Goblin' },
        ['Cloktix Longnail'] = { id = 58, name = 'Goblin' },
        ['Distilix Stickytoes'] = { id = 58, name = 'Goblin' },
        ['Elixmix Hooknose'] = { id = 58, name = 'Goblin' },
        ['Eremix Snottynostril'] = { id = 58, name = 'Goblin' },
        ['Gabblox Magpietongue'] = { id = 58, name = 'Goblin' },
        ['Goblin Golem'] = { id = 205, name = 'Statue' },
        ['Goblin Replica'] = { id = 205, name = 'Statue' },
        ['Goblin Statue'] = { id = 205, name = 'Statue' },
        ['Hermitrix Toothrot'] = { id = 58, name = 'Goblin' },
        ['Humnox Drumbelly'] = { id = 58, name = 'Goblin' },
        ['Jabbrox Grannyguise'] = { id = 58, name = 'Goblin' },
        ['Jabkix Pigeonpecs'] = { id = 58, name = 'Goblin' },
        ['Karashix Swollenskull'] = { id = 58, name = 'Goblin' },
        ['Kikklix Longlegs'] = { id = 58, name = 'Goblin' },
        ['Lurklox Dhalmelneck'] = { id = 58, name = 'Goblin' },
        ['Mobpix Mucousmouth'] = { id = 58, name = 'Goblin' },
        ['Morgmox Moldnoggin'] = { id = 58, name = 'Goblin' },
        ['Mortilox Wartpaws'] = { id = 58, name = 'Goblin' },
        ['Prowlox Barrelbelly'] = { id = 58, name = 'Goblin' },
        ['Rutrix Hamgams'] = { id = 58, name = 'Goblin' },
        ['Scruffix Shaggychest'] = { id = 58, name = 'Goblin' },
        ['Slystix Megapeepers'] = { id = 58, name = 'Goblin' },
        ['Smeltix Thickhide'] = { id = 58, name = 'Goblin' },
        ['Snypestix Eaglebeak'] = { id = 58, name = 'Goblin' },
        ['Sparkspox Sweatbrow'] = { id = 58, name = 'Goblin' },
        ['Ticktox Beadyeyes'] = { id = 58, name = 'Goblin' },
        ['Trailblix Goatmug'] = { id = 58, name = 'Goblin' },
        ['Tufflix Loglimbs'] = { id = 58, name = 'Goblin' },
        ['Tymexox Ninefingers'] = { id = 58, name = 'Goblin' },
        ['Vanguard Alchemist'] = { id = 58, name = 'Goblin' },
        ['Vanguard Ambusher'] = { id = 58, name = 'Goblin' },
        ['Vanguard Armorer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Dragontamer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Enchanter'] = { id = 58, name = 'Goblin' },
        ['Vanguard Hitman'] = { id = 58, name = 'Goblin' },
        ['Vanguard Maestro'] = { id = 58, name = 'Goblin' },
        ['Vanguard Necromancer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Pathfinder'] = { id = 58, name = 'Goblin' },
        ['Vanguard Pitfighter'] = { id = 58, name = 'Goblin' },
        ['Vanguard Ronin'] = { id = 58, name = 'Goblin' },
        ['Vanguard Shaman'] = { id = 58, name = 'Goblin' },
        ['Vanguard Smithy'] = { id = 58, name = 'Goblin' },
        ['Vanguard Tinkerer'] = { id = 58, name = 'Goblin' },
        ['Vanguard Welldigger'] = { id = 58, name = 'Goblin' },
        ['Wasabix Callusdigit'] = { id = 58, name = 'Goblin' },
        ['Wyrmwix Snakespecs'] = { id = 58, name = 'Goblin' },
    },
    monsters = {
        {
            name   = 'Goblin Replica',
            ids    = { 1, 4, 7, 10, 13, 16, 18, 21, 24, 28, 33, 38, 41, 45, 46, 47, 50, 53, 58, 63, 68, 71, 74, 75,
                       76, 78, 80, 82, 87, 88, 91, 95, 96, 98, 99, 105, 108, 109, 112, 114, 118, 121, 129, 131, 134,
                       138, 141, 145, 147, 150, 157, 159, 161, 163, 166, 170, 173, 174, 177, 181, 183, 185, 188,
                       195, 198, 200, 201, 202, 205, 211, 213, 216, 218, 225, 227, 229, 231, 232, 234, 241, 244,
                       247, 251, 253, 255, 258, 260, 263, 265, 267, 269, 271, 272, 273, 276, 281, 283, 285, 289,
                       294, 296, 298, 300, 302, 304, 306, 308, 310, 316, 323, 330, 336, 342, 348, 354, 355, 356,
                       364, 367, 370, 373, 376, 381, 384, 387, 390, 397, 402, 407, 411, 416, 423, 430, 433, 437,
                       440, 444, 448, 452, 456, 464, 471, 479, 485, 491, 499, 504 },
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
            name   = 'Vanguard Smithy',
            ids    = { 2, 39, 100, 132, 175, 186, 226, 266, 286, 305, 343, 357, 368, 391, 403, 472, 480, 505 },
            nm     = true,
            levels = {
                [75] = { acc = 326, eva = 312, agi = 101, int = 82, mnd = 82, chr = 89, dex = 101, def = 327,
                         attack_skill = 256 },
                [76] = { acc = 332, eva = 317, agi = 103, int = 82, mnd = 82, chr = 89, dex = 103, def = 331,
                         attack_skill = 261 },
                [77] = { acc = 338, eva = 323, agi = 104, int = 84, mnd = 84, chr = 90, dex = 104, def = 337,
                         attack_skill = 266 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Pitfighter',
            ids    = { 3, 42, 92, 110, 111, 152, 203, 228, 264, 331, 365, 392, 412, 453, 481, 506, 507 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4180, [76] = 4180, [77] = 4180 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Enchanter',
            ids    = { 5, 48, 60, 106, 115, 155, 204, 230, 233, 236, 284, 350, 361, 374, 395, 434, 441, 466, 492 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 6, 70, 73, 97, 133, 158, 184, 240, 291, 309, 321, 347, 375, 401, 421, 459, 469, 489, 497 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 8, 77, 84, 120, 172, 197, 239, 297, 318, 344, 378, 432, 439, 475, 494 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 9, 35, 52, 123, 124, 125, 126, 248, 249, 307, 322, 351, 379, 422, 424, 425, 476, 510 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 11, 81, 107, 142, 160, 217, 254, 292, 303, 324, 335, 369, 410, 447, 460, 461, 484 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 12, 27, 90, 113, 146, 162, 208, 209, 259, 299, 339, 380, 427, 428, 429, 470, 490, 498 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Pathfinder',
            ids    = { 14, 56, 93, 116, 148, 168, 242, 245, 333, 345, 382, 408, 419, 445, 450, 454 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 15, 57, 94, 117, 149, 169, 207, 243, 246, 320, 334, 346, 383, 409, 420, 446, 451, 455, 496 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Shaman',
            ids    = { 17, 43, 51, 65, 122, 154, 182, 212, 268, 270, 275, 311, 312, 313, 349, 360, 372, 394, 404,
                       449, 474, 487 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Necromancer',
            ids    = { 19, 36, 61, 103, 139, 179, 189, 191, 193, 221, 223, 261, 328, 352, 388, 414, 442, 477, 502 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2241, [76] = 2273, [77] = 2305 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 20, 37, 62, 104, 128, 140, 180, 190, 192, 194, 220, 222, 224, 262, 329, 353, 389, 415, 443,
                       478, 503 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'This spawn is a monster pet. Derived base HP includes the native pet reduction.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 2400, [76] = 2400, [77] = 2400 }, mp = { [75] = 1000, [76] = 1000, [77] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Dragontamer',
            ids    = { 22, 31, 66, 136, 143, 164, 214, 256, 277, 279, 326, 340, 385, 405, 435, 462, 500 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4611, [76] = 4695, [77] = 4779 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            ids    = { 23, 32, 67, 86, 137, 144, 165, 215, 257, 278, 280, 327, 341, 386, 406, 436, 463, 501 },
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
            name   = 'Vanguard Alchemist',
            ids    = { 25, 40, 55, 101, 130, 153, 176, 235, 274, 287, 301, 332, 359, 371, 393, 431, 438, 486, 508 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Cloktix Longnail',
            ids    = { 26 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Welldigger',
            ids    = { 29, 69, 72, 89, 135, 156, 167, 187, 288, 314, 337, 362, 366, 413, 458, 467, 482 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 0, [76] = 0, [77] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Tufflix Loglimbs',
            ids    = { 30 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 347, eva = 325, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 402,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Gabblox Magpietongue',
            ids    = { 34 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [80] = { acc = 350, eva = 323, agi = 93, int = 106, mnd = 106, chr = 99, dex = 99, def = 340,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Goblin Statue',
            ids    = { 44, 210, 293 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [80] = { acc = 343, eva = 307, agi = 93, int = 93, mnd = 120, chr = 106, dex = 85, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            magic_dmg = { all = -50 },
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 1000 }, mp = { [80] = 1000 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Vanguard Armorer',
            ids    = { 49, 79, 83, 119, 196, 238, 252, 282, 295, 317, 338, 398, 399, 400, 417, 468, 493 },
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
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [75] = 4000, [76] = 4000, [77] = 4000 }, mp = { [75] = 2181, [76] = 2213, [77] = 2245 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Smeltix Thickhide',
            ids    = { 54 },
            nm     = true,
            levels = {
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Wasabix Callusdigit',
            ids    = { 59 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [80] = { acc = 354, eva = 343, agi = 99, int = 93, mnd = 93, chr = 99, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Jabkix Pigeonpecs',
            ids    = { 64 },
            nm     = true,
            job    = 'mnk/war',
            levels = {
                [80] = { acc = 356, eva = 340, agi = 92, int = 81, mnd = 94, chr = 93, dex = 110, def = 360,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8180 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Double Attack 10; Counter 10', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.', 'Martial Arts is in the job traits, but the native delay calculation excludes monsters from its benefit.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Wyrmwix Snakespecs',
            ids    = { 85 },
            nm     = true,
            job    = 'drg/drg',
            levels = {
                [80] = { acc = 372, eva = 343, agi = 99, int = 85, mnd = 93, chr = 106, dex = 99, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Hermitrix Toothrot',
            ids    = { 102 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Morgmox Moldnoggin',
            ids    = { 127 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [80] = { acc = 347, eva = 310, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2402 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Sparkspox Sweatbrow',
            ids    = { 151 },
            nm     = true,
            levels = {
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Buffrix Eargone',
            ids    = { 171 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 347, eva = 325, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 402,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Humnox Drumbelly',
            ids    = { 178 },
            nm     = true,
            job    = 'brd/brd',
            levels = {
                [80] = { acc = 350, eva = 319, agi = 85, int = 99, mnd = 99, chr = 112, dex = 99, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { silence = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Elixmix Hooknose',
            ids    = { 199 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [80] = { acc = 350, eva = 323, agi = 93, int = 106, mnd = 106, chr = 99, dex = 99, def = 340,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Trailblix Goatmug',
            ids    = { 206 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [80] = { acc = 354, eva = 328, agi = 85, int = 93, mnd = 93, chr = 120, dex = 106, def = 343,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
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
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Mortilox Wartpaws',
            ids    = { 219 },
            nm     = true,
            job    = 'smn/smn',
            levels = {
                [80] = { acc = 347, eva = 310, agi = 99, int = 112, mnd = 112, chr = 112, dex = 93, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { slow = 20 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 16,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2402 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Bandrix Rockjaw',
            ids    = { 237 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [80] = { acc = 361, eva = 407, agi = 112, int = 106, mnd = 79, chr = 79, dex = 120, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 17,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Lurklox Dhalmelneck',
            ids    = { 250 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [80] = { acc = 398, eva = 321, agi = 120, int = 93, mnd = 99, chr = 93, dex = 99, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 18,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Ticktox Beadyeyes',
            ids    = { 290 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 19,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Karashix Swollenskull',
            ids    = { 315 },
            nm     = true,
            job    = 'sam/sam',
            levels = {
                [80] = { acc = 354, eva = 343, agi = 99, int = 93, mnd = 93, chr = 99, dex = 106, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { blind = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 20,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Rutrix Hamgams',
            ids    = { 319 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [80] = { acc = 354, eva = 328, agi = 85, int = 93, mnd = 93, chr = 120, dex = 106, def = 343,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 21,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Snypestix Eaglebeak',
            ids    = { 325 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [80] = { acc = 357, eva = 359, agi = 112, int = 99, mnd = 79, chr = 85, dex = 112, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 22,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Kikklix Longlegs',
            ids    = { 358 },
            nm     = true,
            levels = {
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 23,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Goblin Golem',
            ids    = { 363 },
            nm     = true,
            job    = 'whm/blm',
            levels = {
                [80] = { acc = 347, eva = 309, agi = 97, int = 102, mnd = 111, chr = 104, dex = 92, def = 341,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            weapon_dmg = { slashing = -50, piercing = -50, blunt = -50, hand_to_hand = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 100, item = 1453 },  -- montiont silverpiece
                { rate = 100, item = 1456 },  -- one hundred byne bill
                { rate = 100, item = 1450 },  -- lungo-nango jadeshell
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 150, item = 1455 },  -- one byne bill
                { rate = 150, item = 1449 },  -- tukuku whiteshell
                { rate = 100, item = 1474 },  -- infinity core
                { rate = 10, item = 748 },  -- gold beastcoin
                { rate = 50, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 1470 },  -- sparkling stone
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 24,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Statue / Weapons', notes = { 'Source species: Goblin Statue (ID 478); family ID 205.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 12500 }, mp = { [80] = 12500 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 30', notes = { 'Source base speed is 30; the ordinary monster default is 40. Animation speed is 30.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: None.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Store TP 100; Regen 1', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
        {
            name   = 'Scruffix Shaggychest',
            ids    = { 377 },
            nm     = true,
            job    = 'pld/pld',
            levels = {
                [80] = { acc = 347, eva = 325, agi = 79, int = 79, mnd = 106, chr = 106, dex = 93, def = 402,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { sleep = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 25,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Mobpix Mucousmouth',
            ids    = { 396 },
            nm     = true,
            job    = 'thf/thf',
            levels = {
                [80] = { acc = 361, eva = 407, agi = 112, int = 106, mnd = 79, chr = 79, dex = 120, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 26,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Tymexox Ninefingers',
            ids    = { 418 },
            nm     = true,
            job    = 'drk/drk',
            levels = {
                [80] = { acc = 354, eva = 335, agi = 99, int = 106, mnd = 79, chr = 79, dex = 106, def = 347,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 27,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Slystix Megapeepers',
            ids    = { 426 },
            nm     = true,
            job    = 'nin/nin',
            levels = {
                [80] = { acc = 357, eva = 359, agi = 112, int = 99, mnd = 79, chr = 85, dex = 112, def = 347,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { bind = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 28,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Anvilix Sootwrists',
            ids    = { 457 },
            nm     = true,
            levels = {
                [80] = { acc = 354, eva = 339, agi = 106, int = 85, mnd = 85, chr = 93, dex = 106, def = 353,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { virus = 25 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 29,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Distilix Stickytoes',
            ids    = { 465 },
            nm     = true,
            job    = 'whm/whm',
            levels = {
                [80] = { acc = 343, eva = 307, agi = 93, int = 93, mnd = 120, chr = 106, dex = 85, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 30,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Bootrix Jaggedelbow',
            ids    = { 473 },
            nm     = true,
            job    = 'mnk/mnk',
            levels = {
                [80] = { acc = 357, eva = 336, agi = 85, int = 79, mnd = 99, chr = 93, dex = 112, def = 354,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 31,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8180 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Prowlox Barrelbelly',
            ids    = { 483 },
            nm     = true,
            job    = 'rng/rng',
            levels = {
                [80] = { acc = 398, eva = 321, agi = 120, int = 93, mnd = 99, chr = 93, dex = 99, def = 343,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
            resist = { poison = 20 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 32,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Jabbrox Grannyguise',
            ids    = { 488 },
            nm     = true,
            job    = 'rdm/rdm',
            levels = {
                [80] = { acc = 350, eva = 323, agi = 93, int = 106, mnd = 106, chr = 99, dex = 99, def = 340,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 33,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Blazox Boneybod',
            ids    = { 495 },
            nm     = true,
            job    = 'bst/bst',
            levels = {
                [80] = { acc = 354, eva = 328, agi = 85, int = 93, mnd = 93, chr = 120, dex = 106, def = 343,
                         attack_skill = 281 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 34,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 0 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
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
            name   = 'Eremix Snottynostril',
            ids    = { 509 },
            nm     = true,
            job    = 'blm/blm',
            levels = {
                [80] = { acc = 354, eva = 314, agi = 106, int = 120, mnd = 93, chr = 99, dex = 106, def = 336,
                         attack_skill = 281 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -1 },
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
                { rate = 100, group = {  -- one of
                    { 1449, 1 },  -- tukuku whiteshell
                    { 1452, 1 },  -- ordelle bronzepiece
                    { 1455, 1 },  -- one byne bill
                } },
                { rate = 10, item = 1470 },  -- sparkling stone
                { rate = 10, item = 1520 },  -- jar of goblin grease
                { rate = 10, group = {  -- one of
                    { 15066, 1 },  -- relic shield
                    { 18326, 1 },  -- relic staff
                    { 18338, 1 },  -- relic horn
                    { 18344, 1 },  -- relic bow
                } },
                { rate = 50, group = {  -- one of
                    { 15102, 1 },  -- warriors mufflers
                    { 15144, 1 },  -- koga kyahan
                    { 15082, 1 },  -- scouts beret
                    { 15103, 1 },  -- melee gloves
                    { 15119, 1 },  -- clerics pantaloons
                    { 15121, 1 },  -- duelists tights
                    { 15124, 1 },  -- abyss flanchard
                    { 15135, 1 },  -- sorcerers sabots
                    { 15137, 1 },  -- assassins poulaines
                    { 15141, 1 },  -- bards slippers
                    { 15143, 1 },  -- saotome sune-ate
                    { 15115, 1 },  -- wyrm finger gauntlets
                } },
                { rate = 10, group = { { 16352, 1 }, { 15028, 1 } } },  -- one of pantin churidars, commodore gants
            },
            steal  = { 1449, 1452, 1455 },  -- tukuku whiteshell, ordelle bronzepiece, one byne bill
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 35,
            flags  = { scripted_defense = true },
            info = {
                family = { value = 'Goblin / Beastmen', notes = { 'Source species: Dynamis Goblin (ID 125); family ID 58.', 'Species names can be internal variants of the same visible family.' } },
                charm = { value = 'Not charm eligible', notes = { 'Eligibility only. This does not estimate Charm success or duration.', 'An existing master, encounter restrictions and current states can prevent Charm.' } },
                vitals = { value = 'Estimated maximum HP / MP', notes = { 'Estimated maximum at the stored level, not current HP or MP.', 'Uses the source default server HP/MP multipliers. Private server setting overrides are unknown.', 'Encounter setup or participant scaling can change these base estimates.', 'Scripts, jobs or battle state can change the maximum; this is a stored baseline.' }, hp = { [80] = 8000 }, mp = { [80] = 2342 }, uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = false },
                movement = { value = 'Base speed 40', notes = { 'Source base speed is 40; the ordinary monster default is 40. Animation speed is 40.', 'Chase speed, Gravity, movement modifiers and scripts can change actual movement.', 'The default server run multiplier is 2.5; this is not a safe kiting prediction.' } },
                pursuit = { value = 'No base scent tracking', notes = { 'Scent is a pursuit rule, separate from initial aggro.', 'Losing scent alone does not guarantee immediate deaggro; other detection and fight state still matter.' } },
                crystal = { value = 'Crystal reward disabled', notes = { 'Source crystal element: Fire.', 'Crystals are separate conditional rewards, not ordinary Treasure Hunter drop rolls.', 'Requires an eligible zone and battle, sufficient EXP eligibility, and an eligible Signet/Sanction recipient.', 'Stored encounter, zone or no-drops rules block the ordinary crystal reward.' } },
                rewards = { value = 'Conditional rewards', notes = { 'Actual EXP depends on level, party, claim, eligibility and server settings.', 'Stored encounter, zone or no-drops rules block the ordinary seal reward.' } },
                traits = { value = 'Base delay 240', notes = { 'Base attack delay 240 (source delay units), before haste, slows and fight changes.', 'Multi-attacks and counters are conditional; these are modifier values, not an exact attack timer.', 'Store TP changes the monster\'s TP gain, not the player\'s TP feed.', 'Lists stored job traits and literal modifiers. Buffs and conditional callbacks may add others.' } },
                dangers = danger[4],
                blue = { value = 'Unknown', notes = { 'Encounter setup can replace this monster\'s TP-move list; that setup is not resolved.' }, incomplete = true },
            },
        },
    },
    by_name = {},
}
