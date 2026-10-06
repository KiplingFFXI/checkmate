-- Dangruf Wadi (zone 191).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Chocoboleech', 'Wadi Leech' } },
        [2] = { sound = { 'Rock Lizard', 'Steam Lizard' } },
        [3] = { sound = { 'Geyser Lizard', 'Rock Lizard', 'Steam Lizard' } },
        [4] = {
            sight = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Fisher', 'Goblin Gambler', 'Goblin Leecher',
                      'Goblin Mugger', 'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver' },
        },
        [5] = { sight = { 'Hoarder Hare', 'Wadi Hare' } },
        [6] = { sound = { 'Witchetty Grub' } },
        [7] = { sound = { 'Wadi Leech' } },
    },
    monsters = {
        {
            name   = 'Land Crab',
            ids    = { 1, 2 },
            levels = {
                [5] = { acc = 22, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
                [6] = { acc = 25, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
                [7] = { acc = 29, eva = 25, agi = 8, int = 9, mnd = 13, chr = 13 },
            },
            spawn_levels = { [2] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Coral Crab',
            ids    = { 3 },
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
                [11] = { acc = 42, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 45, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Wadi Leech',
            ids    = { 4 },
            levels = {
                [15] = { acc = 57, eva = 53, agi = 18, int = 15, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 57, agi = 20, int = 16, mnd = 14, chr = 16 },
                [17] = { acc = 64, eva = 59, agi = 20, int = 17, mnd = 15, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Thread Leech',
            ids    = { 5 },
            levels = {
                [21] = { acc = 78, eva = 73, agi = 24, int = 20, mnd = 18, chr = 20 },
                [22] = { acc = 81, eva = 75, agi = 24, int = 20, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 20, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Geyser Lizard',
            ids    = { 6 },
            nm     = true,
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 22, chr = 25 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 23, chr = 26 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 12567 },  -- steam scale mail
                { rate = 150, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Rock Lizard',
            ids    = { 7, 8, 9, 13, 14, 15, 16, 17, 51, 52, 53, 60, 70, 74, 75, 76, 83, 93, 97, 102, 108, 126, 127,
                       131, 132, 137, 138 },
            levels = {
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
            },
            links  = 3,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 10, 11, 18, 20, 25, 27, 54, 57, 64, 67, 77, 80, 87, 90, 98, 100, 104, 106, 133, 134, 135,
                       141, 142, 143 },
            levels = {
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 4387 },  -- wild onion
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 12, 19, 21, 26, 28, 55, 58, 65, 68, 78, 81, 88, 91, 99, 101, 105, 107, 136, 144 },
            levels = {
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 817 },  -- spool of grass thread
                { rate = 10, item = 824 },  -- square of grass cloth
                { rate = 10, item = 818 },  -- spool of cotton thread
                { rate = 10, item = 825 },  -- square of cotton cloth
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12856 },  -- slops
                { rate = 10, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Hoarder Hare',
            ids    = { 22, 23, 24, 29, 30, 31, 145, 146, 147, 148, 149, 150 },
            levels = {
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 5,
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 33, 34, 41, 42, 110, 111, 118, 119, 239, 248, 256, 280, 281, 282 },
            levels = {
                [12] = { acc = 56, eva = 41, agi = 20, int = 13, mnd = 13, chr = 13 },
                [13] = { acc = 60, eva = 44, agi = 21, int = 14, mnd = 15, chr = 14 },
                [14] = { acc = 63, eva = 47, agi = 22, int = 14, mnd = 15, chr = 14 },
                [15] = { acc = 67, eva = 50, agi = 23, int = 15, mnd = 15, chr = 15 },
                [16] = { acc = 70, eva = 53, agi = 24, int = 16, mnd = 17, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 937 },  -- block of animal glue
                { rate = 10, item = 1028 },  -- dangruf chest key
                { rate = 10, item = 12440 },  -- leather bandana
                { rate = 10, item = 12696 },  -- leather gloves
                { rate = 10, item = 12824 },  -- leather trousers
                { rate = 10, item = 12952 },  -- leather highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 35, 43, 112, 120, 158, 169, 170, 177, 178, 179, 236, 251, 252, 253, 258, 285, 286, 287, 288,
                       289 },
            levels = {
                [12] = { acc = 48, eva = 42, agi = 15, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 17, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 49, agi = 17, int = 18, mnd = 12, chr = 12 },
                [15] = { acc = 58, eva = 52, agi = 17, int = 18, mnd = 12, chr = 12 },
                [16] = { acc = 62, eva = 56, agi = 19, int = 20, mnd = 14, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 1028 },  -- dangruf chest key
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12944 },  -- scale greaves
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 36, 44, 113, 121, 160, 163, 164, 175, 176, 227, 240, 241, 249, 250, 257, 267, 283, 284 },
            levels = {
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
                [15] = { acc = 58, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 62, eva = 58, agi = 22, int = 14, mnd = 14, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 1028 },  -- dangruf chest key
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Wadi Hare',
            ids    = { 37, 38, 39, 45, 46, 47, 49, 50, 165, 166, 167, 168, 228, 229, 230, 231, 232, 233, 234, 235,
                       242, 243, 244, 245, 246, 247 },
            levels = {
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 46, agi = 17, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 50, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 150, item = 534 },  -- clump of gausebit wildgrass
            },
            links  = 5,
        },
        {
            name   = 'Steam Lizard',
            ids    = { 40, 48, 117, 125, 180, 181, 182, 183, 216, 217, 218, 219 },
            levels = {
                [16] = { acc = 62, eva = 57, agi = 20, int = 14, mnd = 14, chr = 16 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 68, eva = 62, agi = 20, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 72, eva = 66, agi = 22, int = 16, mnd = 16, chr = 18 },
                [20] = { acc = 75, eva = 69, agi = 22, int = 16, mnd = 16, chr = 18 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 1028 },  -- dangruf chest key
            },
            links  = 3,
        },
        {
            name   = 'Goblin Fisher',
            ids    = { 56, 59, 66, 69, 79, 82, 89, 92, 139, 140 },
            levels = {
                [5] = { acc = 24, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 34, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 17390 },  -- yew fishing rod
                { rate = 10, item = 17389 },  -- bamboo fishing rod
                { rate = 5, item = 17383 },  -- clothespole
                { rate = 10, item = 17388 },  -- fastwater fishing rod
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Stone Eater',
            ids    = { 61, 62, 63, 71, 72, 73 },
            levels = {
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 50, item = 13475 },  -- hermits ring
                { rate = 240, item = 768 },  -- flint stone
                { rate = 150, item = 1108 },  -- pinch of sulfur
                { rate = 100, item = 642 },  -- chunk of zinc ore
            },
        },
        {
            name   = 'Wadi Crab',
            ids    = { 84, 85, 86, 94, 95, 96, 103, 109 },
            levels = {
                [7] = { acc = 29, eva = 25, agi = 8, int = 9, mnd = 13, chr = 13 },
                [8] = { acc = 32, eva = 28, agi = 9, int = 9, mnd = 13, chr = 13 },
                [9] = { acc = 35, eva = 31, agi = 9, int = 9, mnd = 14, chr = 14 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Wadi Leech',
            ids    = { 114, 115, 116, 122, 123, 124 },
            levels = {
                [7] = { acc = 30, eva = 27, agi = 13, int = 10, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 10, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 12, mnd = 10, chr = 11 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Witchetty Grub',
            ids    = { 128, 129, 130, 159, 161, 162, 171, 172, 173, 174, 225, 226, 237, 238, 254, 255, 268, 269 },
            levels = {
                [9] = { acc = 36, eva = 31, agi = 13, int = 18, mnd = 12, chr = 11 },
                [10] = { acc = 40, eva = 35, agi = 14, int = 18, mnd = 13, chr = 12 },
                [11] = { acc = 43, eva = 38, agi = 15, int = 20, mnd = 14, chr = 13 },
                [12] = { acc = 46, eva = 40, agi = 15, int = 20, mnd = 14, chr = 13 },
            },
            spawn_levels = { [128] = { 9, 10 }, [129] = { 9, 10 }, [130] = { 9, 10 }, [159] = { 9, 10 },
                             [161] = { 9, 10 }, [162] = { 9, 10 }, [171] = { 9, 10 }, [172] = { 9, 10 },
                             [173] = { 9, 10 }, [174] = { 9, 10 }, [225] = { 11, 12 }, [226] = { 11, 12 },
                             [237] = { 11, 12 }, [238] = { 11, 12 }, [254] = { 11, 12 }, [255] = { 11, 12 },
                             [268] = { 11, 12 }, [269] = { 11, 12 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 1000, item = 768 },  -- flint stone
                { rate = 150, item = 1108 },  -- pinch of sulfur
                { rate = 100, item = 642 },  -- chunk of zinc ore
                { rate = 50, item = 13475 },  -- hermits ring
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 6,
        },
        {
            name   = 'Wadi Leech',
            ids    = { 151, 152, 153, 154, 155, 156, 157, 259, 260, 261, 262, 263, 264, 265, 266, 270, 271, 272,
                       273, 274, 275, 276, 277, 278, 279 },
            levels = {
                [11] = { acc = 44, eva = 41, agi = 16, int = 13, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 13, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 14, mnd = 13, chr = 14 },
                [14] = { acc = 54, eva = 50, agi = 18, int = 15, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 184, 185, 186, 187, 205, 206, 207, 208, 214, 220 },
            levels = {
                [21] = { acc = 79, eva = 67, agi = 26, int = 27, mnd = 20, chr = 22 },
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 20, chr = 22 },
                [23] = { acc = 85, eva = 72, agi = 26, int = 28, mnd = 20, chr = 22 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 952 },  -- bag of poison flour
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 188, 189, 194, 209, 210, 211, 212, 221, 223 },
            levels = {
                [21] = { acc = 76, eva = 65, agi = 22, int = 20, mnd = 27, chr = 24 },
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 27, chr = 24 },
                [23] = { acc = 82, eva = 70, agi = 22, int = 20, mnd = 28, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4666 },  -- scroll of paralyze
                { rate = 50, item = 4680 },  -- scroll of barsleep
                { rate = 50, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4681 },  -- scroll of barpoison
                { rate = 10, item = 4683 },  -- scroll of barblind
                { rate = 50, item = 4733 },  -- scroll of protectra
                { rate = 50, item = 4745 },  -- scroll of sneak
                { rate = 10, item = 4744 },  -- scroll of invisible
                { rate = 10, item = 4746 },  -- scroll of deodorize
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 190, 191, 192, 193, 195, 196, 213, 215, 222, 224 },
            levels = {
                [21] = { acc = 81, eva = 90, agi = 28, int = 24, mnd = 17, chr = 17 },
                [22] = { acc = 84, eva = 93, agi = 28, int = 24, mnd = 17, chr = 17 },
                [23] = { acc = 87, eva = 96, agi = 28, int = 24, mnd = 17, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12705 },  -- brass mittens
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12961 },  -- brass leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Wadi Crab',
            ids    = { 197, 198, 199, 200, 201, 202, 203, 204 },
            levels = {
                [16] = { acc = 59, eva = 53, agi = 13, int = 14, mnd = 20, chr = 20 },
                [17] = { acc = 62, eva = 55, agi = 13, int = 14, mnd = 20, chr = 20 },
                [18] = { acc = 65, eva = 59, agi = 14, int = 14, mnd = 20, chr = 20 },
                [19] = { acc = 69, eva = 62, agi = 14, int = 15, mnd = 22, chr = 22 },
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Chocoboleech',
            ids    = { 317 },
            nm     = true,
            levels = {
                [24] = { acc = 88, eva = 82, agi = 26, int = 21, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 85, agi = 26, int = 22, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 1000, item = 18412 },  -- gassan
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 318 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Celaeno',
            ids    = { 319, 320, 321 },
            nm     = true,
            levels = {
                [100] = { acc = 477, eva = 404, agi = 107, int = 124, mnd = 91, chr = 98 },
            },
            ranks  = { fire = 1, ice = -1, wind = 9, earth = 5, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = 9, slow = 5, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 9 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
