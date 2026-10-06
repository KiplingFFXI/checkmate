-- Bibiki Bay (zone 4).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Coastal Opo-opo' } },
        [2] = { sound = { 'Alraune', 'Peerifool' } },
        [3] = { sight = { 'Island Rarab', 'Tropical Rarab' } },
        [4] = { sight = { 'Catoblepas', 'Marine Dhalmel' } },
        [5] = { sound = { 'Raven', 'Tragopan' } },
        [6] = { sound = { 'Eft', 'Intuila', 'Intulo', 'Tartarus Eft' } },
        [7] = {
            sight = { 'Goblin Pathfinder', 'Hobgoblin Alastor', 'Hobgoblin Angler', 'Hobgoblin Animalier',
                      'Hobgoblin Blagger', 'Hobgoblin Fascinator', 'Hobgoblin Martialist', 'Hobgoblin Physician',
                      'Hobgoblin Toreador', 'Hobgoblin Venerer' },
        },
        [8] = { sound = { 'Eft', 'Intuila', 'Tartarus Eft' } },
        [9] = {
            sight = { 'Goblin Shaman', 'Hobgoblin Alastor', 'Hobgoblin Angler', 'Hobgoblin Animalier',
                      'Hobgoblin Blagger', 'Hobgoblin Fascinator', 'Hobgoblin Martialist', 'Hobgoblin Physician',
                      'Hobgoblin Toreador', 'Hobgoblin Venerer' },
        },
        [10] = {
            sight = { 'Goblin Pathfinder', 'Goblin Shaman', 'Hobgoblin Alastor', 'Hobgoblin Angler',
                      'Hobgoblin Animalier', 'Hobgoblin Blagger', 'Hobgoblin Fascinator', 'Hobgoblin Martialist',
                      'Hobgoblin Physician', 'Hobgoblin Toreador', 'Hobgoblin Venerer' },
        },
        [11] = {
            sight = { 'Goblin Pathfinder', 'Goblin Shaman', 'Hobgoblin Alastor', 'Hobgoblin Animalier',
                      'Hobgoblin Blagger', 'Hobgoblin Fascinator', 'Hobgoblin Martialist', 'Hobgoblin Physician',
                      'Hobgoblin Toreador', 'Hobgoblin Venerer' },
        },
        [12] = { magic = { 'Shens Filtrate' } },
    },
    monsters = {
        {
            name   = 'Ghost Crab',
            ids    = { 1 },
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Grindylow',
            ids    = { 2 },
            levels = {
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3 },
            levels = {
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Apsaras',
            ids    = { 4 },
            levels = {
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 35 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 37 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Kraken',
            ids    = { 5 },
            levels = {
                [44] = { acc = 158, eva = 149, agi = 49, int = 36, mnd = 36, chr = 40 },
                [45] = { acc = 161, eva = 152, agi = 49, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 165, eva = 156, agi = 51, int = 37, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lancet Jagil',
            ids    = { 6 },
            nm     = true,
            levels = {
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 35 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 37 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 1668 },  -- cleanly snapped rod
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Jagil',
            ids    = { 7, 36, 40, 41, 45, 49, 51, 64, 76, 78, 99, 100, 106 },
            levels = {
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 32 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 35 },
            },
            ph_for = { [45] = { 46 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
                { rate = 50, item = 4484 },  -- shall shell
            },
        },
        {
            name   = 'Coralline Uragnite',
            ids    = { 8, 9, 10, 11, 14, 15, 17, 37, 38, 42, 43, 62, 63, 65, 66, 86, 87, 89, 90 },
            levels = {
                [32] = { acc = 117, eva = 109, agi = 37, int = 26, mnd = 26, chr = 31 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 29, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
            },
            spawn_levels = { [8] = { 32, 34 }, [9] = { 32, 34 }, [10] = { 32, 34 }, [11] = { 32, 34 },
                             [14] = { 32, 34 }, [15] = { 32, 34 }, [17] = { 32, 34 }, [37] = { 32, 34 },
                             [38] = { 33, 35 }, [42] = { 33, 35 }, [43] = { 33, 35 }, [62] = { 33, 35 },
                             [63] = { 33, 35 }, [65] = { 33, 35 }, [66] = { 33, 35 }, [86] = { 33, 35 },
                             [87] = { 33, 35 }, [89] = { 33, 35 }, [90] = { 33, 35 } },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 100, item = 1889 },  -- sack of white sand
                { rate = 50, item = 1618 },  -- uragnite shell
            },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Kraken',
            ids    = { 12, 44, 67, 91 },
            levels = {
                [37] = { acc = 134, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 137, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 141, eva = 133, agi = 44, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 144, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Viscous Clot',
            ids    = { 13, 16, 39, 47, 70, 71, 88, 95 },
            levels = {
                [38] = { acc = 138, eva = 128, agi = 41, int = 31, mnd = 34, chr = 36 },
                [39] = { acc = 142, eva = 132, agi = 42, int = 32, mnd = 35, chr = 37 },
                [40] = { acc = 145, eva = 135, agi = 42, int = 32, mnd = 35, chr = 37 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            drops  = {
                { rate = 50, item = 1633 },  -- handful of clot plasma
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ignis Fatuus',
            ids    = { 18, 32, 94, 110, 126 },
            levels = {
                [35] = { acc = 129, eva = 119, agi = 39, int = 28, mnd = 29, chr = 36 },
                [36] = { acc = 133, eva = 124, agi = 42, int = 28, mnd = 30, chr = 37 },
                [37] = { acc = 136, eva = 126, agi = 42, int = 29, mnd = 31, chr = 37 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 928 },  -- pinch of bomb ash
                { rate = 150, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Coastal Opo-opo',
            ids    = { 19, 20, 25, 26, 27, 29, 30, 48, 53, 54, 56, 59, 73, 74, 83, 84, 85, 96, 97, 102, 109 },
            levels = {
                [37] = { acc = 137, eva = 128, agi = 47, int = 27, mnd = 27, chr = 39 },
                [38] = { acc = 140, eva = 131, agi = 47, int = 27, mnd = 27, chr = 41 },
                [39] = { acc = 144, eva = 135, agi = 49, int = 27, mnd = 27, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 17296 },  -- pebble
                { rate = 100, item = 4468 },  -- bunch of pamamas
                { rate = 50, item = 5187 },  -- elshimo coconut
                { rate = 10, item = 4412 },  -- thundermelon
            },
            links  = 1,
        },
        {
            name   = 'Alraune',
            ids    = { 21, 23, 24, 33, 34, 35, 52, 55, 57, 58, 60, 61, 72, 80, 81, 82, 93, 103, 104, 107, 108 },
            levels = {
                [38] = { acc = 141, eva = 127, agi = 31, int = 28, mnd = 37, chr = 36 },
                [39] = { acc = 145, eva = 131, agi = 32, int = 29, mnd = 40, chr = 37 },
                [40] = { acc = 148, eva = 134, agi = 32, int = 29, mnd = 40, chr = 37 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 4368 },  -- two-leaf mandragora bud
                { rate = 50, item = 4369 },  -- four-leaf mandragora bud
            },
            links  = 2,
        },
        {
            name   = 'Toucan',
            ids    = { 22, 28, 31, 50, 68, 69, 75, 77, 79, 92, 101, 105 },
            levels = {
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 50, item = 4570 },  -- bird egg
            },
        },
        {
            name   = 'Serra',
            ids    = { 46 },
            nm     = true,
            levels = {
                [44] = { acc = 169, eva = 154, agi = 51, int = 36, mnd = 37, chr = 40 },
                [45] = { acc = 172, eva = 157, agi = 51, int = 37, mnd = 39, chr = 42 },
                [46] = { acc = 175, eva = 161, agi = 53, int = 37, mnd = 39, chr = 43 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 15347 },  -- volans greaves
                { rate = 50, item = 868 },  -- handful of pugil scales
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Peerifool',
            ids    = { 111, 112, 113, 114, 115, 116 },
            nm     = true,
            levels = {
                [48] = { acc = 176, eva = 160, agi = 38, int = 35, mnd = 47, chr = 44 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Island Rarab',
            ids    = { 117, 118, 125, 128, 149 },
            levels = {
                [34] = { acc = 126, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 129, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
                [36] = { acc = 133, eva = 124, agi = 42, int = 30, mnd = 30, chr = 34 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 3,
        },
        {
            name   = 'Marine Dhalmel',
            ids    = { 119, 120, 122, 127, 143, 144, 148 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 37, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 38, int = 29, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 123, agi = 40, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 125, agi = 40, int = 31, mnd = 31, chr = 34 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 50, item = 893 },  -- giant femur
                { rate = 100, item = 4359 },  -- slice of dhalmel meat
                { rate = 100, item = 4359 },  -- slice of dhalmel meat
                { rate = 10, item = 857 },  -- dhalmel hide
                { rate = 10, item = 857 },  -- dhalmel hide
                { rate = 10, item = 938 },  -- sprig of papaka grass
            },
            links  = 4,
        },
        {
            name   = 'Raven',
            ids    = { 121, 124, 138, 139, 140 },
            levels = {
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 50, item = 4570 },  -- bird egg
            },
            links  = 5,
        },
        {
            name   = 'Eft',
            ids    = { 123, 130, 131, 132, 133, 134, 135, 136, 137, 141, 145 },
            levels = {
                [33] = { acc = 121, eva = 113, agi = 38, int = 29, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
            },
            ph_for = { [141] = { 142 } },
            ranks  = { fire = -1, ice = -2, wind = 2, earth = 2, thunder = -1, water = 2, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 2, slow = 2, poison = 2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 1623 },  -- eft skin
                { rate = 10, item = 1741 },  -- high-quality eft skin
            },
            links  = 6,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 129 },
            levels = {
                [34] = { acc = 126, eva = 107, agi = 42, int = 45, mnd = 32, chr = 35 },
                [35] = { acc = 130, eva = 110, agi = 42, int = 47, mnd = 33, chr = 35 },
                [36] = { acc = 134, eva = 113, agi = 45, int = 48, mnd = 34, chr = 37 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Intulo',
            ids    = { 142 },
            nm     = true,
            levels = {
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 43 },
            },
            ranks  = { fire = -1, ice = -2, wind = 2, earth = 2, thunder = -1, water = 2, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 2, slow = 2, poison = 2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 150, item = 14759 },  -- curaga earring
                { rate = 100, item = 15372 },  -- magic slacks
                { rate = 100, item = 1623 },  -- eft skin
            },
            links  = 8,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 146 },
            levels = {
                [34] = { acc = 126, eva = 113, agi = 32, int = 32, mnd = 32, chr = 45, resist = { slow = 10 } },
                [35] = { acc = 130, eva = 116, agi = 32, int = 33, mnd = 33, chr = 47, resist = { slow = 15 } },
                [36] = { acc = 134, eva = 119, agi = 33, int = 34, mnd = 34, chr = 48, resist = { slow = 15 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1708 },  -- handful of counterfeit gil
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Goblins Rarab',
            ids    = { 147, 152, 178, 198 },
            levels = {
                [29] = { acc = 108, eva = 100, agi = 34, int = 25, mnd = 25, chr = 28 },
                [30] = { acc = 111, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29 },
                [31] = { acc = 116, eva = 107, agi = 37, int = 26, mnd = 26, chr = 31 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
            },
            spawn_levels = { [147] = { 29, 31 }, [152] = { 66, 69 }, [178] = { 66, 69 }, [198] = { 66, 69 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Hobgoblin Martialist',
            ids    = { 150, 184, 196 },
            levels = {
                [72] = { acc = 302, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 308, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 313, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Animalier',
            ids    = { 151, 177, 197 },
            levels = {
                [72] = { acc = 302, eva = 277, agi = 60, int = 63, mnd = 63, chr = 87 },
                [73] = { acc = 308, eva = 283, agi = 62, int = 64, mnd = 64, chr = 89 },
                [74] = { acc = 313, eva = 288, agi = 63, int = 64, mnd = 64, chr = 89 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Teine Sith',
            ids    = { 153, 167 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 55, mnd = 58, chr = 70 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 55, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 56, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 57, mnd = 60, chr = 73 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Tropical Rarab',
            ids    = { 154, 155, 156, 162, 163, 164, 173, 187, 191, 203, 204, 205, 228, 235 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 3,
        },
        {
            name   = 'Hobgoblin Venerer',
            ids    = { 157, 185, 199 },
            levels = {
                [72] = { acc = 346, eva = 271, agi = 92, int = 63, mnd = 67, chr = 63 },
                [73] = { acc = 353, eva = 275, agi = 93, int = 64, mnd = 70, chr = 64 },
                [74] = { acc = 358, eva = 281, agi = 94, int = 64, mnd = 70, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Catoblepas',
            ids    = { 158, 168, 169, 171, 172, 182, 190, 194, 195, 206, 207, 212, 213, 219, 220, 221 },
            levels = {
                [76] = { acc = 321, eva = 304, agi = 76, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 309, agi = 76, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 150, item = 4359 },  -- slice of dhalmel meat
                { rate = 100, item = 4359 },  -- slice of dhalmel meat
                { rate = 50, item = 893 },  -- giant femur
                { rate = 100, item = 2123 },  -- catoblepas hide
            },
            links  = 4,
        },
        {
            name   = 'Hobgoblin Fascinator',
            ids    = { 159, 180, 192 },
            levels = {
                [72] = { acc = 302, eva = 265, agi = 80, int = 87, mnd = 63, chr = 67 },
                [73] = { acc = 308, eva = 269, agi = 80, int = 89, mnd = 64, chr = 70 },
                [74] = { acc = 313, eva = 275, agi = 82, int = 89, mnd = 64, chr = 70 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Tragopan',
            ids    = { 160, 161, 165, 166, 170, 183, 186, 193 },
            levels = {
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 50, item = 4570 },  -- bird egg
            },
            links  = 5,
        },
        {
            name   = 'Tartarus Eft',
            ids    = { 174, 175, 179, 181, 188, 189, 210, 211, 214, 215, 216, 217, 223, 224, 225, 226, 229, 230,
                       231, 232, 240, 241 },
            levels = {
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { fire = -1, ice = -2, wind = 2, earth = 2, thunder = -1, water = 2, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 2, slow = 2, poison = 2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 150, item = 1741 },  -- high-quality eft skin
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 1623 },  -- eft skin
            },
            links  = 6,
        },
        {
            name   = 'Hobgoblin Toreador',
            ids    = { 200, 201, 218, 238, 239 },
            levels = {
                [72] = { acc = 298, eva = 273, agi = 68, int = 75, mnd = 75, chr = 67 },
                [73] = { acc = 305, eva = 278, agi = 68, int = 76, mnd = 76, chr = 70 },
                [74] = { acc = 310, eva = 282, agi = 69, int = 77, mnd = 77, chr = 70 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Blagger',
            ids    = { 202, 209 },
            levels = {
                [72] = { acc = 308, eva = 353, agi = 84, int = 75, mnd = 51, chr = 51 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 319, eva = 364, agi = 87, int = 77, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 50, item = 1878 },  -- air tank
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Physician',
            ids    = { 208, 233, 236 },
            levels = {
                [72] = { acc = 292, eva = 259, agi = 68, int = 63, mnd = 87, chr = 75 },
                [73] = { acc = 299, eva = 263, agi = 68, int = 64, mnd = 89, chr = 76 },
                [74] = { acc = 304, eva = 268, agi = 69, int = 64, mnd = 89, chr = 77 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Alastor',
            ids    = { 222, 227, 237 },
            levels = {
                [72] = { acc = 302, eva = 283, agi = 72, int = 75, mnd = 51, chr = 51 },
                [73] = { acc = 308, eva = 289, agi = 74, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 313, eva = 294, agi = 75, int = 77, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Angler',
            ids    = { 234 },
            levels = {
                [72] = { acc = 302, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 308, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 313, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Dalham',
            ids    = { 328 },
            nm     = true,
            levels = {
                [65] = { acc = 259, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            magic_dmg = { all = -12.5 },
            absorb = { water = 100 },
            immune = { 'light_sleep', 'silence', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Shen',
            ids    = { 329 },
            nm     = true,
            levels = {
                [83] = { acc = 361, eva = 316, agi = 85, int = 100, mnd = 71, chr = 77 },
                [84] = { acc = 368, eva = 322, agi = 87, int = 101, mnd = 72, chr = 80 },
            },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            absorb = { water = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'blind',
                       'poison', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 14469 },  -- reverend mail
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Shens Filtrate',
            ids    = { 330, 331 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 84, mnd = 66, chr = 73 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 87, mnd = 69, chr = 75 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison', 'plague' },
            links  = 12,
        },
        {
            name   = 'Bismarck',
            ids    = { 332 },
            nm     = true,
            levels = {
                [95] = { acc = 444, eva = 406, agi = 96, int = 72, mnd = 72, chr = 81 },
                [96] = { acc = 452, eva = 411, agi = 99, int = 73, mnd = 73, chr = 82 },
                [97] = { acc = 459, eva = 416, agi = 99, int = 75, mnd = 75, chr = 82 },
                [98] = { acc = 466, eva = 421, agi = 99, int = 75, mnd = 75, chr = 84 },
            },
            ranks  = { fire = 1, ice = 3, wind = 3, earth = 1, thunder = 4, water = 8, light = 4, dark = 2,
                       paralyze = 3, bind = 3, silence = 3, slow = 1, poison = 8, light_sleep = 4, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 3 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Intuila',
            ids    = { 365, 366, 367 },
            nm     = true,
            levels = {
                [99] = { acc = 474, eva = 427, agi = 101, int = 76, mnd = 76, chr = 85 },
            },
            ranks  = { fire = -1, ice = -2, wind = 2, earth = 2, thunder = -1, water = 2, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 2, slow = 2, poison = 2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            links  = 6,
        },
    },
    by_name = {},
}
