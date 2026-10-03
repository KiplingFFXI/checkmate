-- La Theine Plateau (zone 102).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Steppe Hare' },
        [2] = { 'Akbaba', 'Nihniknoovi' },
        [3] = { 'Orcish Fodder', 'Orcish Grappler', 'Orcish Grunt', 'Orcish Mesmerizer', 'Orcish Neckchopper',
                'Orcish Stonechucker' },
        [4] = { 'Rock Eater' },
        [5] = { 'Mad Sheep' },
        [6] = { 'Goblin Ambusher', 'Goblin Archaeologist', 'Goblin Butcher', 'Goblin Digger', 'Goblin Fisher',
                'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver' },
        [7] = { 'Acro Bat', 'Gale Bats', 'Plague Bats', 'Poison Bat' },
        [8] = { 'Goblin Ambusher', 'Goblin Archaeologist', 'Goblin Butcher', 'Goblin Fisher', 'Goblin Thug',
                'Goblin Tinkerer', 'Goblin Weaver' },
        [9] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug',
                'Goblin Tinkerer', 'Goblin Weaver' },
        [10] = { 'Akbaba' },
    },
    monsters = {
        {
            name   = 'Coral Crab',
            ids    = { 1 },
            levels = {
                [8] = { acc = 32, eva = 28, agi = 9, int = 9, mnd = 13, chr = 13 },
                [9] = { acc = 35, eva = 31, agi = 9, int = 9, mnd = 14, chr = 14 },
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
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
            name   = 'Pug Pugil',
            ids    = { 2 },
            levels = {
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11 },
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
            name   = 'Thickshell',
            ids    = { 3 },
            levels = {
                [12] = { acc = 45, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Giant Pugil',
            ids    = { 4 },
            levels = {
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Puffer Pugil',
            ids    = { 5 },
            levels = {
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15 },
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
            name   = 'Steppe Hare',
            ids    = { 6, 7, 8, 9, 15, 16, 17, 18, 24, 25, 26, 27, 61, 62, 69, 70, 71, 77, 78, 79, 117, 118, 119,
                       126, 127, 128, 289, 290, 291, 296, 297, 303, 304, 347, 348, 349, 350, 355, 356, 363, 364,
                       380, 381, 387, 388 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 11, mnd = 11, chr = 12 },
            },
            spawn_levels = { [6] = { 8, 9 }, [7] = { 8, 9 }, [8] = { 8, 9 }, [9] = { 8, 9 }, [15] = { 8, 9 },
                             [16] = { 8, 9 }, [17] = { 8, 9 }, [18] = { 8, 9 }, [24] = { 8, 9 }, [25] = { 8, 9 },
                             [26] = { 8, 9 }, [27] = { 8, 9 }, [61] = { 8, 9 }, [62] = { 8, 9 }, [69] = { 9, 10 },
                             [70] = { 9, 10 }, [71] = { 9, 10 }, [77] = { 9, 10 }, [78] = { 9, 10 },
                             [79] = { 9, 10 }, [117] = { 9, 10 }, [118] = { 9, 10 }, [119] = { 9, 10 },
                             [126] = { 9, 10 }, [127] = { 9, 10 }, [128] = { 9, 10 }, [289] = { 9, 10 },
                             [290] = { 9, 10 }, [291] = { 9, 10 }, [296] = { 9, 10 }, [297] = { 9, 10 },
                             [303] = { 9, 10 }, [304] = { 9, 10 }, [347] = { 9, 10 }, [348] = { 9, 10 },
                             [349] = { 9, 10 }, [350] = { 9, 10 }, [355] = { 9, 10 }, [356] = { 9, 10 },
                             [363] = { 9, 10 }, [364] = { 9, 10 }, [380] = { 9, 10 }, [381] = { 9, 10 },
                             [387] = { 9, 10 }, [388] = { 9, 10 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 4366 },  -- la theine cabbage
            },
            links  = 1,
        },
        {
            name   = 'Strolling Sapling',
            ids    = { 10, 11, 12, 19, 20, 21, 28, 29, 30, 63, 64, 72, 73, 74, 80, 81, 82, 120, 121, 122, 129, 130,
                       131, 292, 293, 298, 299, 300, 305, 306, 351, 352, 357, 358, 365, 366, 367, 382, 383, 389,
                       390 },
            levels = {
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 11, mnd = 11, chr = 11 },
            },
            spawn_levels = { [10] = { 8, 9 }, [11] = { 8, 9 }, [12] = { 8, 9 }, [19] = { 8, 9 }, [20] = { 8, 9 },
                             [21] = { 8, 9 }, [28] = { 8, 9 }, [29] = { 8, 9 }, [30] = { 8, 9 }, [63] = { 8, 9 },
                             [64] = { 8, 9 }, [72] = { 9, 10 }, [73] = { 9, 10 }, [74] = { 9, 10 },
                             [80] = { 9, 10 }, [81] = { 9, 10 }, [82] = { 9, 10 }, [120] = { 9, 10 },
                             [121] = { 9, 10 }, [122] = { 9, 10 }, [129] = { 9, 10 }, [130] = { 9, 10 },
                             [131] = { 9, 10 }, [292] = { 9, 10 }, [293] = { 9, 10 }, [298] = { 9, 10 },
                             [299] = { 9, 10 }, [300] = { 9, 10 }, [305] = { 9, 10 }, [306] = { 9, 10 },
                             [351] = { 9, 10 }, [352] = { 9, 10 }, [357] = { 9, 10 }, [358] = { 9, 10 },
                             [365] = { 9, 10 }, [366] = { 9, 10 }, [367] = { 9, 10 }, [382] = { 9, 10 },
                             [383] = { 9, 10 }, [389] = { 9, 10 }, [390] = { 9, 10 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 100, item = 573 },  -- bag of vegetable seeds
                { rate = 50, item = 572 },  -- bag of herb seeds
            },
        },
        {
            name   = 'Akbaba LTP',
            ids    = { 13, 14, 22, 23, 31, 32, 65, 66, 67, 68, 75, 76, 83, 84, 123, 124, 125, 132, 133, 134, 294,
                       295, 301, 302, 307, 353, 354, 359, 360, 361, 362, 368, 369, 384, 385, 386, 391, 392 },
            levels = {
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [13] = { 11, 12 }, [14] = { 11, 12 }, [22] = { 11, 12 }, [23] = { 11, 12 },
                             [31] = { 11, 12 }, [32] = { 11, 12 }, [65] = { 11, 12 }, [66] = { 11, 12 },
                             [67] = { 11, 12 }, [68] = { 11, 12 }, [75] = { 11, 12 }, [76] = { 11, 12 },
                             [83] = { 11, 12 }, [84] = { 11, 12 }, [123] = { 12, 13 }, [124] = { 12, 13 },
                             [125] = { 12, 13 }, [132] = { 12, 13 }, [133] = { 12, 13 }, [134] = { 12, 13 },
                             [294] = { 12, 13 }, [295] = { 12, 13 }, [301] = { 12, 13 }, [302] = { 12, 13 },
                             [307] = { 12, 13 }, [353] = { 12, 13 }, [354] = { 12, 13 }, [359] = { 12, 13 },
                             [360] = { 12, 13 }, [361] = { 12, 13 }, [362] = { 12, 13 }, [368] = { 12, 13 },
                             [369] = { 12, 13 }, [384] = { 12, 13 }, [385] = { 12, 13 }, [386] = { 12, 13 },
                             [391] = { 12, 13 }, [392] = { 12, 13 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
            links  = 2,
        },
        {
            name   = 'Orcish Fodder',
            ids    = { 33, 34, 87, 138, 313, 372, 395, 454 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 7, mnd = 9, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 9, mnd = 10, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 9, mnd = 10, chr = 13 },
            },
            spawn_levels = { [33] = { 9, 10 }, [34] = { 9, 10 }, [87] = { 9, 10 }, [138] = { 8, 9 },
                             [313] = { 8, 9 }, [372] = { 9, 10 }, [395] = { 9, 10 }, [454] = { 8, 9 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 150, item = 16656 },  -- orcish axe
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Mesmerizer',
            ids    = { 35, 36, 89, 140, 315, 374, 397, 456 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 12, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 14, mnd = 11, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 14, mnd = 11, chr = 14 },
            },
            spawn_levels = { [35] = { 9, 10 }, [36] = { 9, 10 }, [89] = { 9, 10 }, [140] = { 8, 9 },
                             [315] = { 8, 9 }, [374] = { 9, 10 }, [397] = { 9, 10 }, [456] = { 9, 10 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 4866 },  -- scroll of bind
                { rate = 50, item = 4862 },  -- scroll of blind
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Grappler',
            ids    = { 37, 38, 90, 141, 316, 375, 398, 457 },
            levels = {
                [8] = { acc = 35, eva = 30, agi = 10, int = 7, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 33, agi = 11, int = 8, mnd = 11, chr = 13 },
                [10] = { acc = 42, eva = 37, agi = 12, int = 8, mnd = 12, chr = 13 },
            },
            spawn_levels = { [37] = { 9, 10 }, [38] = { 9, 10 }, [90] = { 9, 10 }, [141] = { 8, 9 },
                             [316] = { 8, 9 }, [375] = { 9, 10 }, [398] = { 9, 10 }, [457] = { 9, 10 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Skeleton Warrior',
            ids    = { 39, 58, 91, 114, 142, 162, 219, 286, 317, 344, 376, 399, 458 },
            levels = {
                [10] = { acc = 41, eva = 37, agi = 15, int = 11, mnd = 10, chr = 12 },
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skeleton Sorcerer',
            ids    = { 40, 59, 92, 115, 143, 163, 220, 287, 318, 345, 377, 400, 459 },
            levels = {
                [11] = { acc = 45, eva = 37, agi = 16, int = 18, mnd = 13, chr = 13 },
                [12] = { acc = 48, eva = 39, agi = 16, int = 18, mnd = 13, chr = 13 },
                [13] = { acc = 51, eva = 42, agi = 17, int = 20, mnd = 13, chr = 15 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Rock Eater',
            ids    = { 41, 42, 43, 44, 94, 95, 96, 97, 144, 145, 146, 147, 172, 173, 174, 175, 195, 196, 203, 204,
                       205, 206, 254, 255, 264, 265, 273, 274, 319, 320, 321, 329, 330, 331, 413, 414, 424, 425,
                       436, 437, 444, 445 },
            levels = {
                [10] = { acc = 40, eva = 35, agi = 14, int = 18, mnd = 13, chr = 12 },
                [11] = { acc = 43, eva = 38, agi = 15, int = 20, mnd = 14, chr = 13 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            links  = 4,
        },
        {
            name   = 'Mad Sheep',
            ids    = { 45, 46, 47, 98, 99, 100, 148, 149, 150, 176, 177, 197, 198, 199, 207, 208, 256, 257, 258,
                       259, 266, 267, 268, 269, 275, 276, 322, 323, 324, 332, 333, 334 },
            levels = {
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 12, mnd = 13, chr = 14 },
            },
            spawn_levels = { [45] = { 11, 12 }, [46] = { 11, 12 }, [47] = { 11, 12 }, [98] = { 11, 12 },
                             [99] = { 11, 12 }, [100] = { 11, 12 }, [148] = { 11, 12 }, [149] = { 11, 12 },
                             [150] = { 11, 12 }, [176] = { 12, 13 }, [177] = { 12, 13 }, [197] = { 12, 13 },
                             [198] = { 12, 13 }, [199] = { 12, 13 }, [207] = { 12, 13 }, [208] = { 12, 13 },
                             [256] = { 12, 13 }, [257] = { 12, 13 }, [258] = { 12, 13 }, [259] = { 12, 13 },
                             [266] = { 12, 13 }, [267] = { 12, 13 }, [268] = { 12, 13 }, [269] = { 12, 13 },
                             [275] = { 12, 13 }, [276] = { 12, 13 }, [322] = { 12, 13 }, [323] = { 12, 13 },
                             [324] = { 12, 13 }, [332] = { 12, 13 }, [333] = { 12, 13 }, [334] = { 12, 13 } },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 882 },  -- sheep tooth
                { rate = 150, item = 505 },  -- sheepskin
                { rate = 240, item = 4372 },  -- slice of giant sheep meat
                { rate = 50, item = 882 },  -- sheep tooth, the despoil entry
            },
            links  = 5,
        },
        {
            name   = 'Huge Wasp',
            ids    = { 48, 49, 50, 101, 102, 103, 151, 152, 168, 169, 225, 226, 227, 239, 240, 252, 253, 277, 278,
                       463, 464 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [48] = { 10, 11 }, [49] = { 10, 11 }, [50] = { 10, 11 }, [101] = { 10, 11 },
                             [102] = { 10, 11 }, [103] = { 10, 11 }, [151] = { 10, 11 }, [152] = { 10, 11 },
                             [168] = { 11, 12 }, [169] = { 11, 12 }, [225] = { 11, 12 }, [226] = { 11, 12 },
                             [227] = { 11, 12 }, [239] = { 11, 12 }, [240] = { 11, 12 }, [252] = { 11, 12 },
                             [253] = { 11, 12 }, [277] = { 11, 12 }, [278] = { 11, 12 }, [463] = { 11, 12 },
                             [464] = { 11, 12 } },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
        },
        {
            name   = 'Goblin Thug',
            ids    = { 51, 104, 153, 214, 281, 339 },
            levels = {
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
                [9] = { acc = 39, eva = 38, agi = 16, int = 14, mnd = 9, chr = 9 },
                [10] = { acc = 42, eva = 51, agi = 17, int = 15, mnd = 10, chr = 10 },
            },
            spawn_levels = { [51] = { 8, 9 }, [104] = { 9, 10 }, [153] = { 9, 10 }, [214] = { 9, 10 },
                             [281] = { 9, 10 }, [339] = { 9, 10 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 4387 },  -- wild onion
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 656 },  -- beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 52, 106, 155, 216, 283, 341 },
            levels = {
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
                [9] = { acc = 36, eva = 31, agi = 13, int = 14, mnd = 14, chr = 11 },
                [10] = { acc = 40, eva = 34, agi = 13, int = 15, mnd = 15, chr = 13, resist = { petrify = 10 } },
            },
            spawn_levels = { [52] = { 8, 9 }, [106] = { 9, 10 }, [155] = { 8, 9 }, [216] = { 8, 9 },
                             [283] = { 8, 9 }, [341] = { 8, 9 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 817 },  -- spool of grass thread
                { rate = 10, item = 824 },  -- square of grass cloth
                { rate = 10, item = 818 },  -- spool of cotton thread
                { rate = 5, item = 825 },  -- square of cotton cloth
                { rate = 10, item = 656 },  -- beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gale Bats',
            ids    = { 53, 54, 109, 110, 158, 159, 178, 179, 200, 209, 210, 260, 261, 270, 279, 325, 326, 335, 336,
                       407, 408, 418, 430, 442, 450 },
            levels = {
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
            },
            spawn_levels = { [53] = { 8, 9 }, [54] = { 8, 9 }, [109] = { 8, 9 }, [110] = { 8, 9 }, [158] = { 8, 9 },
                             [159] = { 8, 9 }, [178] = { 8, 9 }, [179] = { 8, 9 }, [200] = { 9, 10 },
                             [209] = { 9, 10 }, [210] = { 9, 10 }, [260] = { 8, 9 }, [261] = { 8, 9 },
                             [270] = { 8, 9 }, [279] = { 8, 9 }, [325] = { 9, 10 }, [326] = { 8, 9 },
                             [335] = { 9, 10 }, [336] = { 8, 9 }, [407] = { 9, 10 }, [408] = { 9, 10 },
                             [418] = { 9, 10 }, [430] = { 10, 10 }, [442] = { 10, 10 }, [450] = { 10, 10 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 7,
        },
        {
            name   = 'Acro Bat',
            ids    = { 55, 56, 111, 112, 160, 180, 201, 211, 262, 271, 327, 337, 409, 410, 419, 431, 443, 451 },
            levels = {
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [55] = { 8, 9 }, [56] = { 8, 9 }, [111] = { 8, 9 }, [112] = { 8, 9 }, [160] = { 8, 9 },
                             [180] = { 9, 10 }, [201] = { 9, 10 }, [211] = { 9, 10 }, [262] = { 9, 10 },
                             [271] = { 9, 10 }, [327] = { 9, 10 }, [337] = { 9, 10 }, [409] = { 10, 11 },
                             [410] = { 10, 11 }, [419] = { 10, 11 }, [431] = { 10, 11 }, [443] = { 10, 11 },
                             [451] = { 10, 11 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 7,
        },
        {
            name   = 'Wolf Zombie',
            ids    = { 57, 113, 161, 181, 202, 212, 263, 272, 280, 328, 338 },
            levels = {
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 11, mnd = 10, chr = 13 },
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
            name   = 'Air Elemental',
            ids    = { 60, 116, 164, 288, 346 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 23, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 25, mnd = 19, chr = 19 },
                [20] = { acc = 73, eva = 65, agi = 21, int = 25, mnd = 19, chr = 19 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'gravity', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Orcish Grunt',
            ids    = { 85, 136, 311, 370, 393, 452 },
            levels = {
                [12] = { acc = 47, eva = 43, agi = 14, int = 9, mnd = 13, chr = 17 },
                [13] = { acc = 51, eva = 47, agi = 16, int = 11, mnd = 13, chr = 17 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Stonechucker',
            ids    = { 86, 137, 312, 371, 394, 453 },
            levels = {
                [12] = { acc = 57, eva = 44, agi = 18, int = 11, mnd = 13, chr = 15 },
                [13] = { acc = 61, eva = 48, agi = 20, int = 12, mnd = 14, chr = 15 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Neckchopper',
            ids    = { 88, 139, 314, 373, 396, 455 },
            levels = {
                [12] = { acc = 48, eva = 42, agi = 14, int = 13, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 14, mnd = 11, chr = 13 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Grenade',
            ids    = { 93, 221, 379, 460 },
            levels = {
                [15] = { acc = 58, eva = 53, agi = 18, int = 13, mnd = 13, chr = 17 },
                [16] = { acc = 62, eva = 57, agi = 20, int = 13, mnd = 14, chr = 18 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 14, mnd = 15, chr = 18 },
            },
            spawn_levels = { [379] = { 15, 16 } },
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
            name   = 'Goblin Ambusher',
            ids    = { 105, 154, 215, 282, 340 },
            levels = {
                [12] = { acc = 56, eva = 41, agi = 20, int = 13, mnd = 13, chr = 13 },
                [13] = { acc = 60, eva = 44, agi = 21, int = 14, mnd = 15, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 937 },  -- block of animal glue
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 656 },  -- beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 107, 156, 217, 222, 284, 342 },
            levels = {
                [12] = { acc = 48, eva = 42, agi = 15, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 17, mnd = 12, chr = 12 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 656 },  -- beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 108, 157, 218, 285, 343 },
            levels = {
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 656 },  -- beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Battering Ram',
            ids    = { 135, 308 },
            levels = {
                [22] = { acc = 81, eva = 75, agi = 24, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 1000, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 531 },  -- lanolin cube
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Poison Funguar',
            ids    = { 165, 166, 167, 223, 224, 236, 237, 238, 248, 249, 250, 461, 462 },
            levels = {
                [14] = { acc = 54, eva = 50, agi = 18, int = 12, mnd = 13, chr = 14 },
                [15] = { acc = 57, eva = 53, agi = 18, int = 13, mnd = 13, chr = 15 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 4374 },  -- sleepshroom
                { rate = 150, item = 4374 },  -- sleepshroom
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Grass Funguar',
            ids    = { 170, 171, 402, 403, 404, 405, 406, 415, 416, 417, 426, 427, 428, 429, 438, 439, 440, 441,
                       446, 447, 448, 449 },
            levels = {
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 12, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 4374 },  -- sleepshroom
                { rate = 150, item = 4374 },  -- sleepshroom
            },
        },
        {
            name   = 'Ghost',
            ids    = { 182, 183, 184, 185, 378, 401 },
            levels = {
                [15] = { acc = 57, eva = 53, agi = 18, int = 16, mnd = 13, chr = 17 },
                [16] = { acc = 61, eva = 57, agi = 20, int = 17, mnd = 13, chr = 18 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Thickshell',
            ids    = { 186, 187, 188, 189, 190, 191, 420, 421, 432, 433 },
            levels = {
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Goblin Fisher',
            ids    = { 192, 193, 422, 434 },
            levels = {
                [9] = { acc = 38, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 41, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 656 },  -- beastcoin
                { rate = 10, item = 17390 },  -- yew fishing rod
                { rate = 10, item = 17389 },  -- bamboo fishing rod
                { rate = 5, item = 17383 },  -- clothespole
                { rate = 5, item = 17388 },  -- fastwater fishing rod
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Water Elemental',
            ids    = { 194, 423, 435 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 23, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 25, mnd = 19, chr = 19 },
                [20] = { acc = 73, eva = 65, agi = 21, int = 25, mnd = 19, chr = 19 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Plague Bats',
            ids    = { 228, 229, 232, 233, 241, 242, 243, 244 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [228] = { 10, 11 }, [229] = { 10, 11 }, [232] = { 10, 11 }, [233] = { 10, 11 },
                             [241] = { 11, 12 }, [242] = { 11, 12 }, [243] = { 11, 12 }, [244] = { 11, 12 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Poison Bat',
            ids    = { 230, 231, 234, 235, 245, 246, 247 },
            levels = {
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [230] = { 12, 13 }, [231] = { 12, 13 }, [234] = { 12, 13 }, [235] = { 12, 13 },
                             [245] = { 13, 14 }, [246] = { 13, 14 }, [247] = { 13, 14 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Tumbling Truffle',
            ids    = { 251 },
            nm     = true,
            levels = {
                [19] = { acc = 71, eva = 66, agi = 22, int = 15, mnd = 16, chr = 18 },
                [20] = { acc = 74, eva = 69, agi = 22, int = 15, mnd = 16, chr = 18 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 4374 },  -- sleepshroom
                { rate = 240, item = 4374 },  -- sleepshroom
                { rate = 150, item = 12485 },  -- fungus hat
                { rate = 240, item = 4374 },  -- sleepshroom
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lumbering Lambert',
            ids    = { 309 },
            nm     = true,
            levels = {
                [27] = { acc = 98, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 1000, item = 910 },  -- lumbering horn
                { rate = 240, item = 895 },  -- ram horn
                { rate = 1000, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bloodtear Baldurf',
            ids    = { 310 },
            nm     = true,
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 910 },  -- lumbering horn
                { rate = 240, item = 895 },  -- ram horn
                { rate = 1000, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 12356 },  -- viking shield
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
        },
        {
            name   = 'Poltergeist',
            ids    = { 411, 412 },
            levels = {
                [18] = { acc = 68, eva = 62, agi = 20, int = 20, mnd = 15, chr = 20 },
                [19] = { acc = 72, eva = 66, agi = 22, int = 21, mnd = 16, chr = 21 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 465 },
            levels = {
                [11] = { acc = 46, eva = 55, agi = 18, int = 16, mnd = 11, chr = 11 },
                [12] = { acc = 49, eva = 58, agi = 18, int = 16, mnd = 11, chr = 11 },
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
            links  = 8,
        },
        {
            name   = 'Goblin Archaeologist',
            ids    = { 466 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
                [37] = { acc = 135, eva = 125, agi = 41, int = 29, mnd = 29, chr = 32, resist = { virus = 15 } },
                [38] = { acc = 138, eva = 128, agi = 41, int = 29, mnd = 29, chr = 33, resist = { virus = 15 } },
                [39] = { acc = 142, eva = 132, agi = 43, int = 31, mnd = 31, chr = 35, resist = { virus = 15 } },
                [40] = { acc = 145, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35, resist = { virus = 15 } },
                [41] = { acc = 150, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37, resist = { virus = 15 } },
                [42] = { acc = 153, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37, resist = { virus = 15 } },
                [43] = { acc = 156, eva = 145, agi = 47, int = 33, mnd = 33, chr = 38, resist = { virus = 15 } },
                [44] = { acc = 161, eva = 150, agi = 50, int = 34, mnd = 34, chr = 39, resist = { virus = 15 } },
                [45] = { acc = 164, eva = 153, agi = 50, int = 36, mnd = 36, chr = 40, resist = { virus = 15 } },
                [46] = { acc = 168, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40, resist = { virus = 15 } },
                [47] = { acc = 171, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41, resist = { virus = 15 } },
                [48] = { acc = 175, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42, resist = { virus = 15 } },
                [49] = { acc = 179, eva = 167, agi = 56, int = 38, mnd = 38, chr = 42, resist = { virus = 15 } },
                [50] = { acc = 183, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45, resist = { virus = 15 } },
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50, resist = { virus = 20 } },
                [57] = { acc = 222, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50, resist = { virus = 20 } },
                [58] = { acc = 227, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52, resist = { virus = 20 } },
                [59] = { acc = 233, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53, resist = { virus = 20 } },
                [60] = { acc = 238, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53, resist = { virus = 20 } },
                [61] = { acc = 243, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55, resist = { virus = 20 } },
                [62] = { acc = 248, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55, resist = { virus = 20 } },
                [63] = { acc = 253, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55, resist = { virus = 20 } },
                [64] = { acc = 259, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56, resist = { virus = 20 } },
                [65] = { acc = 264, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58, resist = { virus = 20 } },
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58, resist = { virus = 20 } },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59, resist = { virus = 20 } },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60, resist = { virus = 20 } },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63, resist = { virus = 25 } },
                [73] = { acc = 308, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64, resist = { virus = 25 } },
                [74] = { acc = 313, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64, resist = { virus = 25 } },
                [75] = { acc = 319, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65, resist = { virus = 25 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 748 },  -- gold beastcoin
                { rate = 100, item = 748 },  -- gold beastcoin
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 50, item = 507 },  -- goblin mail
                { rate = 10, item = 856 },  -- rabbit hide
                { rate = 10, item = 4196 },  -- rotten quiver
                { rate = 10, item = 4495 },  -- chunk of goblin chocolate
                { rate = 10, item = 640 },  -- chunk of copper ore
                { rate = 10, item = 688 },  -- arrowwood log
                { rate = 10, item = 948 },  -- carnation
                { rate = 10, item = 4197 },  -- rusty bolt case
                { rate = 10, item = 833 },  -- clump of moko grass
                { rate = 10, item = 868 },  -- handful of pugil scales
                { rate = 10, item = 485 },  -- broken willow fishing rod
                { rate = 10, item = 605 },  -- pickaxe
                { rate = 10, item = 840 },  -- chocobo feather
                { rate = 10, item = 943 },  -- pinch of poison dust
                { rate = 10, item = 936 },  -- chunk of rock salt
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Nihniknoovi',
            ids    = { 467 },
            nm     = true,
            levels = {
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 1000, item = 15503 },  -- van pendant
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Pixie',
            ids    = { 468 },
            levels = {
                [51] = { acc = 178, eva = 153, agi = 47, int = 47, mnd = 65, chr = 56 },
                [52] = { acc = 183, eva = 158, agi = 47, int = 47, mnd = 65, chr = 56 },
                [53] = { acc = 189, eva = 163, agi = 48, int = 48, mnd = 67, chr = 57 },
                [54] = { acc = 194, eva = 168, agi = 48, int = 48, mnd = 67, chr = 58 },
            },
            ranks  = { fire = 1, ice = 1, wind = 11, earth = 1, thunder = 1, water = 1, light = 8, dark = 1,
                       paralyze = 1, bind = 1, silence = 11, slow = 1, poison = 1, light_sleep = 8, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 11 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 1000, item = 19210 },  -- pinch of stygian ash
            },
        },
        {
            name   = 'Stachysaurus',
            ids    = { 486, 487, 488 },
            nm     = true,
            levels = {
                [96] = { acc = 450, eva = 406, agi = 88, int = 68, mnd = 68, chr = 82 },
                [97] = { acc = 457, eva = 411, agi = 89, int = 70, mnd = 70, chr = 82 },
            },
            ranks  = { fire = 1, ice = -2, wind = -2, earth = 3, thunder = 1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = 3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 1, gravity = -2 },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Ironhorn Baldurno',
            ids    = { 562, 563 },
            nm     = true,
            levels = {},
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
        },
        {
            name   = 'Otherworldly Rimester',
            ids    = { 565 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
