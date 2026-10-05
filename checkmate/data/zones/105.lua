-- Batallia Downs (zone 105).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Ahtu', 'Sobbing Sapling', 'Stalking Sapling', 'Tottering Toby', 'Treant' },
        [2] = { 'Ahtu', 'Sobbing Sapling', 'Stalking Sapling', 'Tottering Toby', 'Treant', 'Weeping Willow' },
        [3] = { 'May Fly' },
        [4] = { 'Goblin Bounty Hunter', 'Goblin Digger', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher',
                'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy', 'Vegnix Greenthumb' },
        [5] = { 'Orcish Beastrider', 'Orcish Brawler', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Impaler',
                'Orcish Nightraider', 'Orcish Serjeant' },
        [6] = { 'Ahtu', 'Sobbing Sapling', 'Stalking Sapling', 'Treant', 'Weeping Willow' },
        [7] = { 'Ba' },
        [8] = { 'Sobbing Sapling', 'Stalking Sapling', 'Tottering Toby', 'Treant', 'Weeping Willow' },
        [9] = { 'Goblin Bounty Hunter', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy', 'Vegnix Greenthumb' },
        [10] = { 'Suparna Fledgling' },
        [11] = { 'Suparna' },
        [12] = { 'Goblin Bounty Hunter', 'Goblin Digger', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher',
                 'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy' },
    },
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1 },
            levels = {
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22 },
                [21] = { acc = 76, eva = 69, agi = 16, int = 17, mnd = 24, chr = 24 },
                [22] = { acc = 79, eva = 71, agi = 16, int = 17, mnd = 24, chr = 24 },
                [23] = { acc = 82, eva = 74, agi = 16, int = 17, mnd = 24, chr = 24 },
            },
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
            name   = 'Land Pugil',
            ids    = { 2 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 19 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 19 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cutter',
            ids    = { 3 },
            levels = {
                [28] = { acc = 99, eva = 89, agi = 19, int = 20, mnd = 29, chr = 29 },
                [29] = { acc = 102, eva = 92, agi = 19, int = 20, mnd = 30, chr = 30 },
                [30] = { acc = 106, eva = 95, agi = 19, int = 21, mnd = 31, chr = 31 },
            },
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
            name   = 'Greater Pugil',
            ids    = { 4 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 19 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 19 },
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
                [37] = { acc = 132, eva = 124, agi = 38, int = 29, mnd = 29, chr = 32 },
                [38] = { acc = 135, eva = 127, agi = 38, int = 29, mnd = 29, chr = 33 },
                [39] = { acc = 139, eva = 131, agi = 40, int = 31, mnd = 31, chr = 35 },
                [40] = { acc = 142, eva = 134, agi = 40, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 10, item = 770 },  -- blue rock
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Weeping Willow',
            ids    = { 6 },
            nm     = true,
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 36, mnd = 36, chr = 38 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Sobbing Sapling',
            ids    = { 7, 8, 9, 10, 11 },
            levels = {
                [36] = { acc = 130, eva = 122, agi = 38, int = 28, mnd = 28, chr = 30 },
                [37] = { acc = 133, eva = 124, agi = 38, int = 29, mnd = 29, chr = 30 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Lumber Jack',
            ids    = { 12 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 192, agi = 52, int = 51, mnd = 38, chr = 40 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 4172 },  -- reraiser
                { rate = 1000, item = 4174 },  -- vile elixir
                { rate = 1000, item = 13617 },  -- lightning mantle
                { rate = 50, item = 16580 },  -- bloodsword
                { rate = 100, item = 1110 },  -- vial of black beetle blood
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'May Fly',
            ids    = { 13, 14, 15, 24, 25, 26, 35, 36, 37, 58, 59, 60, 76, 77, 98, 99, 106, 107, 116, 117, 151, 152,
                       158, 159, 166, 189, 190, 198, 199, 208, 226, 227, 235, 236, 247, 362, 363, 364, 365, 371,
                       376, 377, 378 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
            },
            links  = 3,
        },
        {
            name   = 'Stalking Sapling',
            ids    = { 16, 17, 18, 19, 27, 28, 29, 30, 38, 39, 40, 41, 61, 62, 63, 64, 69, 70, 71, 72, 78, 79, 80,
                       100, 101, 102, 108, 109, 110, 118, 119, 120, 153, 154, 160, 161, 167, 168, 184, 185, 186,
                       191, 192, 193, 200, 201, 209, 210, 228, 229, 237, 238, 239, 248, 249, 250, 268, 269, 278,
                       279, 305, 306, 307, 308, 317, 318, 319, 320, 323, 324, 325, 366, 367, 368, 372, 373, 374,
                       375, 379, 380, 381 },
            levels = {
                [23] = { acc = 84, eva = 78, agi = 24, int = 18, mnd = 18, chr = 19 },
                [24] = { acc = 88, eva = 82, agi = 26, int = 19, mnd = 19, chr = 19 },
            },
            spawn_levels = { [61] = { 23, 23 }, [71] = { 24, 24 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
            },
            links  = 2,
        },
        {
            name   = 'Sabertooth Tiger',
            ids    = { 20, 21, 22, 31, 32, 33, 42, 43, 44, 65, 66, 67, 73, 74, 81, 82, 103, 104, 111, 112, 121, 122,
                       155, 156, 162, 163, 164, 169, 194, 195, 202, 203, 211, 212, 230, 231, 232, 240, 241, 242,
                       251, 252, 270, 271, 272, 280, 281, 282, 309, 310, 321, 326, 369, 370, 382, 383, 384 },
            levels = {
                [31] = { acc = 114, eva = 105, agi = 33, int = 20, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 20, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 240, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Mauthe Doog BD',
            ids    = { 23, 34, 45, 68, 75, 83, 105, 113, 123, 157, 165, 196, 204, 213, 233, 243, 253, 273, 283,
                       311 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 33, int = 24, mnd = 23, chr = 31 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 24, mnd = 23, chr = 31 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 858 },  -- wolf hide
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Evil Spirit',
            ids    = { 46, 115, 205, 206, 244, 313, 314 },
            levels = {
                [35] = { acc = 126, eva = 118, agi = 36, int = 34, mnd = 26, chr = 34 },
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 47, 84, 131, 214, 327 },
            levels = {
                [26] = { acc = 98, eva = 107, agi = 33, int = 28, mnd = 19, chr = 19 },
                [27] = { acc = 102, eva = 110, agi = 33, int = 29, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 750 },  -- silver beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 48, 85, 132, 215, 328, 353, 385, 390 },
            levels = {
                [30] = { acc = 110, eva = 98, agi = 25, int = 26, mnd = 26, chr = 36 },
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 50, item = 1708 },  -- handful of counterfeit gil
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblins Dragonfly',
            ids    = { 49, 86, 133, 216, 329, 354, 386, 391 },
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            links  = 3,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 50, 87, 134, 217, 330 },
            levels = {
                [26] = { acc = 93, eva = 79, agi = 26, int = 23, mnd = 31, chr = 28 },
                [27] = { acc = 96, eva = 82, agi = 26, int = 24, mnd = 33, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 50, item = 4666 },  -- scroll of paralyze
                { rate = 10, item = 4680 },  -- scroll of barsleep
                { rate = 10, item = 750 },  -- silver beastcoin
                { rate = 10, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4681 },  -- scroll of barpoison
                { rate = 10, item = 4733 },  -- scroll of protectra
                { rate = 10, item = 4745 },  -- scroll of sneak
                { rate = 5, item = 4744 },  -- scroll of invisible
                { rate = 5, item = 4746 },  -- scroll of deodorize
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 51, 88, 95, 135, 148, 218, 331, 336, 355, 387, 392 },
            levels = {
                [30] = { acc = 131, eva = 95, agi = 38, int = 26, mnd = 28, chr = 26 },
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 850 },  -- square of sheep leather
                { rate = 10, item = 848 },  -- square of dhalmel leather
                { rate = 5, item = 855 },  -- square of black tiger leather
                { rate = 1, item = 506 },  -- square of coeurl leather
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 52, 89, 136, 219, 332 },
            levels = {
                [26] = { acc = 97, eva = 81, agi = 31, int = 31, mnd = 23, chr = 24 },
                [27] = { acc = 100, eva = 84, agi = 31, int = 33, mnd = 24, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 952 },  -- bag of poison flour
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 53, 90, 96, 137, 149, 220, 333, 337, 356, 388, 393 },
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 54, 91, 97, 138, 150, 221, 334, 338, 357, 389, 394 },
            levels = {
                [30] = { acc = 110, eva = 92, agi = 33, int = 36, mnd = 26, chr = 28 },
                [31] = { acc = 114, eva = 97, agi = 36, int = 39, mnd = 28, chr = 30 },
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
            links  = 4,
        },
        {
            name   = 'Wight war',
            ids    = { 55, 92, 139, 140, 177, 222, 261, 301, 358, 395 },
            levels = {
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 19, chr = 23 },
                [27] = { acc = 99, eva = 91, agi = 29, int = 21, mnd = 19, chr = 24 },
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 21, chr = 26 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 23, chr = 28 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4872 },  -- scroll of tractor
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wight blm',
            ids    = { 56, 93, 141, 142, 178, 223, 262, 302, 359, 396 },
            levels = {
                [26] = { acc = 96, eva = 80, agi = 28, int = 31, mnd = 22, chr = 24 },
                [27] = { acc = 99, eva = 83, agi = 29, int = 33, mnd = 22, chr = 26 },
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26 },
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26 },
                [30] = { acc = 109, eva = 91, agi = 31, int = 36, mnd = 24, chr = 28 },
                [31] = { acc = 114, eva = 95, agi = 33, int = 39, mnd = 27, chr = 30 },
                [32] = { acc = 117, eva = 97, agi = 33, int = 39, mnd = 27, chr = 30 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4872 },  -- scroll of tractor
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ignis Fatuus',
            ids    = { 57, 263, 335, 397 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 36, int = 24, mnd = 26, chr = 32 },
                [35] = { acc = 127, eva = 118, agi = 36, int = 26, mnd = 27, chr = 33 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 26, mnd = 28, chr = 35 },
            },
            spawn_levels = { [57] = { 34, 35 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 94, 143, 224 },
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 124, 170, 181, 254, 294 },
            levels = {
                [26] = { acc = 97, eva = 89, agi = 28, int = 17, mnd = 19, chr = 26 },
                [27] = { acc = 100, eva = 91, agi = 29, int = 17, mnd = 19, chr = 26 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Impaler',
            ids    = { 125, 144, 171, 255, 295 },
            levels = {
                [30] = { acc = 119, eva = 103, agi = 29, int = 19, mnd = 23, chr = 32 },
                [31] = { acc = 123, eva = 107, agi = 30, int = 20, mnd = 26, chr = 35 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1706 },  -- nyumomo doll
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Beastrider',
            ids    = { 126, 145, 172, 256, 296 },
            levels = {
                [30] = { acc = 110, eva = 100, agi = 29, int = 25, mnd = 19, chr = 24 },
                [31] = { acc = 114, eva = 104, agi = 30, int = 27, mnd = 22, chr = 27 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 10, virus = 10 },
            drops  = {
                { rate = 100, item = 1706 },  -- nyumomo doll
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Nightraider',
            ids    = { 127, 146, 173, 257, 297 },
            levels = {
                [30] = { acc = 131, eva = 103, agi = 35, int = 21, mnd = 25, chr = 28 },
                [31] = { acc = 135, eva = 107, agi = 37, int = 23, mnd = 27, chr = 31 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 10, virus = 10 },
            drops  = {
                { rate = 100, item = 1706 },  -- nyumomo doll
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 128, 174, 182, 258, 298 },
            levels = {
                [26] = { acc = 97, eva = 89, agi = 28, int = 26, mnd = 21, chr = 27 },
                [27] = { acc = 100, eva = 91, agi = 29, int = 27, mnd = 21, chr = 28 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Serjeant',
            ids    = { 129, 175, 183, 259, 299 },
            levels = {
                [26] = { acc = 95, eva = 85, agi = 21, int = 16, mnd = 25, chr = 30 },
                [27] = { acc = 98, eva = 88, agi = 22, int = 16, mnd = 25, chr = 30 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 10, virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Brawler',
            ids    = { 130, 147, 176, 260, 300 },
            levels = {
                [30] = { acc = 111, eva = 101, agi = 25, int = 17, mnd = 25, chr = 28 },
                [31] = { acc = 115, eva = 105, agi = 26, int = 19, mnd = 27, chr = 31 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1706 },  -- nyumomo doll
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Ice Elemental',
            ids    = { 179, 293, 360 },
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Tottering Toby',
            ids    = { 180 },
            nm     = true,
            levels = {
                [27] = { acc = 98, eva = 91, agi = 29, int = 21, mnd = 21, chr = 22 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 953 },  -- treant bulb
                { rate = 150, item = 13013 },  -- stumbling sandals
                { rate = 150, item = 574 },  -- bag of fruit seeds
            },
            links  = 6,
        },
        {
            name   = 'Treant',
            ids    = { 187, 398 },
            levels = {
                [36] = { acc = 130, eva = 120, agi = 34, int = 38, mnd = 27, chr = 25 },
                [37] = { acc = 133, eva = 122, agi = 34, int = 38, mnd = 27, chr = 25 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 923 },  -- dryad root
                { rate = 100, item = 918 },  -- sprig of mistletoe
                { rate = 50, item = 699 },  -- oak log
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Ba',
            ids    = { 188, 197, 207, 225, 234, 245, 246, 264, 265, 266, 267, 274, 275, 276, 277, 284, 285, 286,
                       303, 304, 315, 316, 322, 345, 346, 347 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
            links  = 7,
        },
        {
            name   = 'Clipper',
            ids    = { 287, 288, 289, 290, 291, 292, 348, 349, 350, 351, 352 },
            levels = {
                [24] = { acc = 85, eva = 77, agi = 16, int = 18, mnd = 26, chr = 26 },
                [25] = { acc = 89, eva = 80, agi = 17, int = 18, mnd = 26, chr = 26 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Evil Weapon',
            ids    = { 339, 340, 341, 342, 343 },
            levels = {
                [37] = { acc = 134, eva = 124, agi = 38, int = 37, mnd = 29, chr = 37 },
                [38] = { acc = 137, eva = 127, agi = 38, int = 37, mnd = 29, chr = 38 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Ahtu',
            ids    = { 361 },
            nm     = true,
            levels = {
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 45 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 535 },  -- engraved key
                { rate = 150, item = 918 },  -- sprig of mistletoe
                { rate = 240, item = 923 },  -- dryad root
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Goblin Digger',
            ids    = { 399 },
            levels = {
                [28] = { acc = 106, eva = 114, agi = 34, int = 29, mnd = 20, chr = 20 },
                [29] = { acc = 109, eva = 117, agi = 35, int = 30, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Sturmtiger',
            ids    = { 400 },
            nm     = true,
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 35, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Suparna',
            ids    = { 401 },
            nm     = true,
            levels = {
                [72] = { acc = 299, eva = 283, agi = 73, int = 64, mnd = 64, chr = 73 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 6, slow = 1, poison = 1, light_sleep = 10,
                       dark_sleep = 10, blind = 1, stun = 1, gravity = 4 },
            immune = { 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Suparna Fledgling',
            ids    = { 402 },
            nm     = true,
            levels = {
                [68] = { acc = 271, eva = 251, agi = 62, int = 66, mnd = 81, chr = 77 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 6, slow = 1, poison = 1, light_sleep = 10,
                       dark_sleep = 10, blind = 1, stun = 1, gravity = 4 },
            immune = { 'petrify' },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Badshah',
            ids    = { 403, 404, 405, 406, 407 },
            nm     = true,
            levels = {
                [43] = { acc = 155, eva = 144, agi = 44, int = 28, mnd = 33, chr = 38 },
                [44] = { acc = 160, eva = 148, agi = 47, int = 28, mnd = 34, chr = 39 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Vegnix Greenthumb',
            ids    = { 414 },
            nm     = true,
            levels = {
                [26] = { acc = 97, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23, resist = { virus = 10 } },
                [27] = { acc = 100, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24, resist = { virus = 10 } },
                [28] = { acc = 103, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25, resist = { virus = 10 } },
                [29] = { acc = 107, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25, resist = { virus = 10 } },
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Cherufe',
            ids    = { 427, 428, 429 },
            nm     = true,
            levels = {
                [93] = { acc = 427, eva = 390, agi = 85, int = 67, mnd = 67, chr = 80 },
                [94] = { acc = 434, eva = 396, agi = 86, int = 67, mnd = 67, chr = 80 },
            },
            ranks  = { fire = 1, ice = -2, wind = -2, earth = 3, thunder = 1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = 3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 1, gravity = -2 },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Goblin Bounty Hunter',
            ids    = { 474, 475, 476, 477, 478, 479, 480, 481, 482, 483, 484, 485, 486 },
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Awoken Freke',
            ids    = { 489 },
            nm     = true,
            levels = {
                [119] = { acc = 494, eva = 543, agi = 140, int = 110, mnd = 110, chr = 114 },
            },
            ranks  = { fire = 11, light = 10, dark = 10, light_sleep = 10, dark_sleep = 10, blind = 10 },
            magic_dmg = { all = -50 },
        },
    },
    by_name = {},
}
