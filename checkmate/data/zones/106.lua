-- North Gustaberg (zone 106).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Ding Bats', 'Fledermaus' },
        [2] = { 'Ornery Sheep' },
        [3] = { 'Gambilox Wanderling', 'Goblin Digger', 'Goblin Fisher', 'Goblin Gambler', 'Goblin Leecher',
                'Goblin Mugger', 'Goblin Thug', 'Goblin Weaver' },
        [4] = { 'Stinging Sophie' },
        [5] = { 'Rock Lizard' },
        [6] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'Heliodor Quadav', 'Lead Quadav', 'Old Quadav',
                'Sapphirine Quadav', 'Young Quadav' },
        [7] = { 'Maighdean Uaine', 'Walking Sapling' },
        [8] = { 'Gambilox Wanderling', 'Goblin Fisher', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                'Goblin Thug', 'Goblin Weaver' },
        [9] = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                'Goblin Thug', 'Goblin Weaver' },
        [10] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'Heliodor Quadav', 'Old Quadav',
                 'Sapphirine Quadav', 'Young Quadav' },
        [11] = { 'Sallow Seymour' },
    },
    monsters = {
        {
            name   = 'Stone Crab',
            ids    = { 1 },
            levels = {
                [2] = { acc = 12, eva = 10, agi = 6, int = 6, mnd = 9, chr = 9 },
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 11 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sand Crab',
            ids    = { 2 },
            levels = {
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 11 },
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
            name   = 'Land Crab',
            ids    = { 3 },
            levels = {
                [5] = { acc = 22, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
                [6] = { acc = 25, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
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
            ids    = { 4 },
            levels = {
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 9 },
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
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
            name   = 'Fighting Pugil',
            ids    = { 5 },
            levels = {
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
            name   = 'Huge Hornet',
            ids    = { 6, 7, 8, 9, 10, 11, 12, 13, 22, 23, 24, 25, 26, 27, 28, 29, 38, 39, 40, 41, 42, 43, 44, 45,
                       46, 47 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
            },
            level_mod = -2,
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 50, item = 4370 },  -- pot of honey
            },
        },
        {
            name   = 'Tunnel Worm',
            ids    = { 14, 15, 16, 17, 30, 31, 32, 33, 48, 49, 50, 51, 52 },
            levels = {
                [1] = { acc = 10, eva = 8, agi = 8, int = 11, mnd = 8, chr = 7 },
            },
            level_mod = -2,
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
            },
        },
        {
            name   = 'Ding Bats',
            ids    = { 18, 19, 20, 21, 34, 35, 36, 37, 53, 54, 55, 56, 57, 68, 69, 70, 84, 85, 100, 101, 102, 115,
                       116, 127, 136, 156, 157, 158, 180, 181, 182, 195, 196 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [18] = { 1, 1 }, [19] = { 1, 1 }, [20] = { 1, 1 }, [21] = { 1, 1 }, [34] = { 1, 1 },
                             [35] = { 1, 1 }, [36] = { 1, 1 }, [37] = { 1, 1 }, [53] = { 1, 1 }, [54] = { 1, 1 },
                             [55] = { 1, 1 }, [56] = { 1, 1 }, [57] = { 1, 1 }, [68] = { 2, 3 }, [69] = { 2, 3 },
                             [70] = { 2, 3 }, [84] = { 2, 3 }, [85] = { 2, 3 }, [100] = { 2, 3 }, [101] = { 2, 3 },
                             [102] = { 2, 3 }, [115] = { 2, 3 }, [116] = { 2, 3 }, [127] = { 2, 3 },
                             [136] = { 2, 3 }, [156] = { 3, 4 }, [157] = { 3, 4 }, [158] = { 3, 4 },
                             [180] = { 3, 4 }, [181] = { 3, 4 }, [182] = { 3, 4 }, [195] = { 4, 5 },
                             [196] = { 4, 5 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Maneating Hornet',
            ids    = { 58, 59, 60, 73, 74, 75, 76, 89, 90, 91, 92, 105, 106, 107, 120, 121, 130, 131, 139, 140, 141,
                       142, 143, 144, 164, 165, 166, 167, 168, 187, 188, 189, 190, 191, 279, 280, 281, 295, 296,
                       297 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [58] = { 3, 4 }, [59] = { 3, 4 }, [60] = { 3, 4 }, [73] = { 3, 4 }, [74] = { 3, 4 },
                             [75] = { 3, 4 }, [76] = { 3, 4 }, [89] = { 3, 4 }, [90] = { 3, 4 }, [91] = { 3, 4 },
                             [92] = { 3, 4 }, [105] = { 3, 4 }, [106] = { 3, 4 }, [107] = { 3, 4 },
                             [120] = { 3, 4 }, [121] = { 3, 4 }, [130] = { 3, 4 }, [131] = { 3, 4 },
                             [139] = { 4, 5 }, [140] = { 4, 5 }, [141] = { 4, 5 }, [142] = { 4, 5 },
                             [143] = { 4, 5 }, [144] = { 4, 5 }, [164] = { 4, 5 }, [165] = { 4, 5 },
                             [166] = { 4, 5 }, [167] = { 4, 5 }, [168] = { 4, 5 }, [187] = { 5, 6 },
                             [188] = { 5, 6 }, [189] = { 5, 6 }, [190] = { 5, 6 }, [191] = { 5, 6 },
                             [279] = { 3, 4 }, [280] = { 3, 4 }, [281] = { 3, 4 }, [295] = { 4, 5 },
                             [296] = { 4, 5 }, [297] = { 4, 5 } },
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
            name   = 'Stone Eater',
            ids    = { 61, 62, 63, 77, 78, 79, 93, 94, 95, 108, 109, 110, 122, 123, 132, 146, 147, 148, 170, 171,
                       172, 206, 207, 208, 209, 210, 222, 223, 224, 225, 226, 227, 237, 238, 248, 249, 250, 261,
                       262, 263, 264, 265, 282, 283, 284, 298, 299, 329, 330, 331, 332, 333, 363, 364, 365, 376,
                       377, 378, 389, 390, 403, 404, 405, 415, 416, 417, 427, 428, 429 },
            levels = {
                [2] = { acc = 13, eva = 10, agi = 8, int = 11, mnd = 8, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 15, mnd = 10, chr = 9 },
            },
            spawn_levels = { [61] = { 3, 4 }, [62] = { 3, 4 }, [63] = { 3, 4 }, [77] = { 3, 4 }, [78] = { 3, 4 },
                             [79] = { 3, 4 }, [93] = { 3, 4 }, [94] = { 3, 4 }, [95] = { 3, 4 }, [108] = { 3, 4 },
                             [109] = { 3, 4 }, [110] = { 3, 4 }, [122] = { 3, 4 }, [123] = { 3, 4 },
                             [132] = { 3, 4 }, [146] = { 4, 5 }, [147] = { 4, 5 }, [148] = { 4, 5 },
                             [170] = { 4, 5 }, [171] = { 4, 5 }, [172] = { 4, 5 }, [206] = { 2, 3 },
                             [207] = { 2, 3 }, [208] = { 2, 3 }, [209] = { 2, 3 }, [210] = { 2, 3 },
                             [222] = { 2, 3 }, [223] = { 2, 3 }, [224] = { 2, 3 }, [225] = { 2, 3 },
                             [226] = { 2, 3 }, [227] = { 2, 3 }, [237] = { 2, 3 }, [238] = { 2, 3 },
                             [248] = { 2, 3 }, [249] = { 2, 3 }, [250] = { 2, 3 }, [261] = { 2, 3 },
                             [262] = { 2, 3 }, [263] = { 2, 3 }, [264] = { 2, 3 }, [265] = { 2, 3 },
                             [282] = { 2, 3 }, [283] = { 2, 3 }, [284] = { 2, 3 }, [298] = { 4, 5 },
                             [299] = { 4, 5 }, [329] = { 5, 6 }, [330] = { 5, 6 }, [331] = { 5, 6 },
                             [332] = { 5, 6 }, [333] = { 5, 6 }, [363] = { 5, 6 }, [364] = { 5, 6 },
                             [365] = { 5, 6 }, [376] = { 5, 6 }, [377] = { 5, 6 }, [378] = { 5, 6 },
                             [389] = { 4, 5 }, [390] = { 4, 5 }, [403] = { 4, 5 }, [404] = { 4, 5 },
                             [405] = { 4, 5 }, [415] = { 5, 6 }, [416] = { 5, 6 }, [417] = { 5, 6 },
                             [427] = { 5, 6 }, [428] = { 5, 6 }, [429] = { 5, 6 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
        },
        {
            name   = 'Ornery Sheep',
            ids    = { 64, 65, 80, 81, 96, 97, 111, 112, 124, 125, 133, 134, 149, 150, 151, 152, 173, 174, 175, 176,
                       275, 276 },
            levels = {
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [64] = { 5, 6 }, [65] = { 5, 6 }, [80] = { 5, 6 }, [81] = { 5, 6 }, [96] = { 5, 6 },
                             [97] = { 5, 6 }, [111] = { 5, 6 }, [112] = { 5, 6 }, [124] = { 5, 6 },
                             [125] = { 5, 6 }, [133] = { 5, 6 }, [134] = { 5, 6 }, [149] = { 7, 8 },
                             [150] = { 7, 8 }, [151] = { 7, 8 }, [152] = { 7, 8 }, [173] = { 7, 8 },
                             [174] = { 7, 8 }, [175] = { 7, 8 }, [176] = { 7, 8 }, [275] = { 5, 6 },
                             [276] = { 5, 6 } },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4372 },  -- slice of giant sheep meat
                { rate = 100, item = 505 },  -- sheepskin
                { rate = 10, item = 1898 },  -- vial of fresh blood
                { rate = 10, item = 882 },  -- sheep tooth
                { rate = 50, item = 882 },  -- sheep tooth, the despoil entry
            },
            links  = 2,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 66, 67, 82, 98, 99, 113, 126, 153, 154, 177, 178, 192, 193, 277, 412, 436 },
            levels = {
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            spawn_levels = { [66] = { 4, 5 }, [67] = { 4, 5 }, [82] = { 4, 5 }, [98] = { 4, 5 }, [99] = { 4, 5 },
                             [113] = { 4, 5 }, [126] = { 4, 5 }, [153] = { 5, 6 }, [154] = { 5, 6 },
                             [177] = { 5, 6 }, [178] = { 5, 6 }, [192] = { 6, 7 }, [193] = { 6, 7 },
                             [277] = { 4, 5 }, [412] = { 6, 7 }, [436] = { 7, 8 } },
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
            links  = 3,
        },
        {
            name   = 'Fledermaus',
            ids    = { 71, 86, 87, 103, 117, 118, 128, 137, 159, 160, 183, 197, 198 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [71] = { 3, 4 }, [86] = { 3, 4 }, [87] = { 3, 4 }, [103] = { 3, 4 }, [117] = { 3, 4 },
                             [118] = { 3, 4 }, [128] = { 3, 4 }, [137] = { 3, 4 }, [159] = { 4, 5 },
                             [160] = { 4, 5 }, [183] = { 4, 5 }, [197] = { 5, 6 }, [198] = { 5, 6 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Black Wolf',
            ids    = { 72, 88, 104, 119, 129, 138, 161, 184, 400 },
            levels = {
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 10 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 11 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 9, mnd = 8, chr = 11 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
            },
            spawn_levels = { [72] = { 5, 6 }, [88] = { 5, 6 }, [104] = { 5, 6 }, [119] = { 5, 6 }, [129] = { 5, 6 },
                             [138] = { 5, 6 }, [161] = { 7, 8 }, [184] = { 7, 8 } },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 13096 },  -- dog collar
                { rate = 100, item = 858 },  -- wolf hide
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 83, 114, 135, 155, 179, 194, 278, 413, 437 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [83] = { 4, 5 }, [114] = { 4, 5 }, [135] = { 4, 5 }, [155] = { 5, 6 },
                             [179] = { 5, 6 }, [194] = { 6, 7 }, [278] = { 4, 5 }, [413] = { 6, 7 },
                             [437] = { 7, 8 } },
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
            links  = 3,
        },
        {
            name   = 'Stinging Sophie',
            ids    = { 145, 169 },
            nm     = true,
            levels = {
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 240, item = 912 },  -- beehive chip
                { rate = 150, item = 16486 },  -- beestinger
                { rate = 150, item = 4370 },  -- pot of honey
                { rate = 100, item = 846 },  -- insect wing
            },
            links  = 4,
        },
        {
            name   = 'Enchanted Bones blm',
            ids    = { 162, 163, 185, 186, 199, 201, 401, 438 },
            levels = {
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 15, mnd = 9, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
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
            name   = 'Enchanted Bones war',
            ids    = { 200, 374, 387, 414 },
            levels = {
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
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
            name   = 'River Crab',
            ids    = { 202, 203, 204, 205, 288, 289, 290, 291 },
            levels = {
                [2] = { acc = 12, eva = 10, agi = 6, int = 6, mnd = 9, chr = 9 },
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 11 },
                [5] = { acc = 22, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
            },
            spawn_levels = { [202] = { 2, 3 }, [203] = { 2, 3 }, [204] = { 2, 3 }, [205] = { 2, 3 },
                             [288] = { 4, 5 }, [289] = { 4, 5 }, [290] = { 4, 5 }, [291] = { 4, 5 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Rock Lizard',
            ids    = { 211, 228, 229, 266, 267, 366, 367, 368, 379, 380, 381, 391, 392, 406, 407, 408, 418, 419,
                       420, 430, 431, 432 },
            levels = {
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [211] = { 4, 5 }, [228] = { 4, 5 }, [229] = { 4, 5 }, [266] = { 4, 5 },
                             [267] = { 4, 5 }, [366] = { 7, 8 }, [367] = { 7, 8 }, [368] = { 7, 8 },
                             [379] = { 7, 8 }, [380] = { 7, 8 }, [381] = { 7, 8 }, [391] = { 7, 8 },
                             [392] = { 7, 8 }, [406] = { 7, 8 }, [407] = { 7, 8 }, [408] = { 7, 8 },
                             [418] = { 7, 8 }, [419] = { 7, 8 }, [420] = { 7, 8 }, [430] = { 7, 8 },
                             [431] = { 7, 8 }, [432] = { 7, 8 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
            },
            links  = 5,
        },
        {
            name   = 'Walking Sapling',
            ids    = { 212, 230, 231, 239, 251, 268, 285, 286, 300, 301, 302, 305, 306, 307, 308, 309, 317, 318,
                       319, 320, 321, 334, 335, 345, 346, 347, 348, 349, 350, 393, 394, 409, 410, 411, 421, 422,
                       423, 433, 434, 435 },
            levels = {
                [3] = { acc = 16, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 18, agi = 11, int = 7, mnd = 7, chr = 7 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [212] = { 3, 4 }, [230] = { 3, 4 }, [231] = { 3, 4 }, [239] = { 3, 4 },
                             [251] = { 3, 4 }, [268] = { 3, 4 }, [285] = { 3, 4 }, [286] = { 3, 4 },
                             [300] = { 4, 5 }, [301] = { 4, 5 }, [302] = { 4, 5 }, [305] = { 4, 5 },
                             [306] = { 4, 5 }, [307] = { 4, 5 }, [308] = { 4, 5 }, [309] = { 4, 5 },
                             [317] = { 5, 6 }, [318] = { 5, 6 }, [319] = { 5, 6 }, [320] = { 5, 6 },
                             [321] = { 5, 6 }, [334] = { 5, 6 }, [335] = { 5, 6 }, [345] = { 5, 6 },
                             [346] = { 5, 6 }, [347] = { 5, 6 }, [348] = { 5, 6 }, [349] = { 5, 6 },
                             [350] = { 5, 6 }, [393] = { 5, 6 }, [394] = { 5, 6 }, [409] = { 5, 6 },
                             [410] = { 5, 6 }, [411] = { 5, 6 }, [421] = { 5, 6 }, [422] = { 5, 6 },
                             [423] = { 5, 6 }, [433] = { 5, 6 }, [434] = { 5, 6 }, [435] = { 5, 6 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 100, item = 575 },  -- bag of grain seeds
                { rate = 50, item = 573 },  -- bag of vegetable seeds
            },
        },
        {
            name   = 'Vulture',
            ids    = { 213, 214, 215, 232, 233, 234, 240, 252, 253, 269, 270, 311, 312, 313, 323, 324, 325, 336,
                       337, 351, 352, 353, 369, 370, 382, 383, 395, 396 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
            },
            spawn_levels = { [213] = { 3, 4 }, [214] = { 3, 4 }, [215] = { 3, 4 }, [232] = { 3, 4 },
                             [233] = { 3, 4 }, [234] = { 3, 4 }, [240] = { 3, 4 }, [252] = { 3, 4 },
                             [253] = { 3, 4 }, [269] = { 3, 4 }, [270] = { 3, 4 }, [311] = { 5, 6 },
                             [312] = { 5, 6 }, [313] = { 5, 6 }, [323] = { 6, 7 }, [324] = { 6, 7 },
                             [325] = { 6, 7 }, [336] = { 6, 7 }, [337] = { 6, 7 }, [351] = { 6, 7 },
                             [352] = { 6, 7 }, [353] = { 6, 7 }, [369] = { 6, 7 }, [370] = { 6, 7 },
                             [382] = { 6, 7 }, [383] = { 6, 7 }, [395] = { 5, 6 }, [396] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
        },
        {
            name   = 'Young Quadav',
            ids    = { 216, 217, 219, 220, 235, 236, 241, 245, 246, 254, 258, 259, 271, 303, 304, 314, 326, 338,
                       339, 342, 354, 355, 358, 361, 362, 371, 384, 397, 424 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 6, mnd = 7, chr = 8 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10, resist = { virus = 10 } },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11, resist = { virus = 10 } },
            },
            spawn_levels = { [216] = { 3, 4 }, [217] = { 3, 4 }, [219] = { 3, 4 }, [220] = { 3, 4 },
                             [235] = { 3, 4 }, [236] = { 3, 4 }, [241] = { 3, 4 }, [245] = { 3, 4 },
                             [246] = { 3, 4 }, [254] = { 3, 4 }, [258] = { 3, 4 }, [259] = { 3, 4 },
                             [271] = { 3, 4 }, [303] = { 6, 7 }, [304] = { 6, 7 }, [314] = { 6, 7 },
                             [326] = { 7, 8 }, [338] = { 7, 8 }, [339] = { 7, 8 }, [342] = { 7, 8 },
                             [354] = { 6, 7 }, [355] = { 6, 7 }, [358] = { 7, 8 }, [361] = { 7, 8 },
                             [362] = { 7, 8 }, [371] = { 7, 8 }, [384] = { 7, 8 }, [397] = { 6, 7 },
                             [424] = { 7, 8 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 12415 },  -- shell shield
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Amber Quadav',
            ids    = { 218, 221, 243, 247, 256, 273, 316, 328, 341, 344, 357, 360, 373, 386, 399, 426 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 9, int = 11, mnd = 7, chr = 7 },
                [4] = { acc = 21, eva = 16, agi = 11, int = 11, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 14, mnd = 10, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            spawn_levels = { [218] = { 3, 4 }, [221] = { 3, 4 }, [243] = { 3, 4 }, [247] = { 3, 4 },
                             [256] = { 3, 4 }, [273] = { 3, 4 }, [316] = { 6, 7 }, [328] = { 7, 8 },
                             [341] = { 7, 8 }, [344] = { 7, 8 }, [357] = { 7, 8 }, [360] = { 7, 8 },
                             [373] = { 7, 8 }, [386] = { 7, 8 }, [399] = { 6, 7 }, [426] = { 7, 8 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4862 },  -- scroll of blind
                { rate = 50, item = 4866 },  -- scroll of bind
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Amethyst Quadav',
            ids    = { 242, 255, 260, 272, 315, 327, 340, 343, 356, 359, 372, 385, 398, 425 },
            levels = {
                [3] = { acc = 15, eva = 12, agi = 7, int = 7, mnd = 11, chr = 9 },
                [4] = { acc = 19, eva = 15, agi = 8, int = 7, mnd = 12, chr = 11 },
                [6] = { acc = 26, eva = 20, agi = 9, int = 9, mnd = 13, chr = 12 },
                [7] = { acc = 29, eva = 24, agi = 10, int = 9, mnd = 15, chr = 13 },
                [8] = { acc = 32, eva = 26, agi = 11, int = 11, mnd = 15, chr = 13 },
            },
            spawn_levels = { [242] = { 3, 4 }, [255] = { 3, 4 }, [260] = { 3, 3 }, [272] = { 3, 4 },
                             [315] = { 6, 7 }, [327] = { 7, 8 }, [340] = { 7, 8 }, [343] = { 7, 8 },
                             [356] = { 7, 8 }, [359] = { 7, 8 }, [372] = { 7, 8 }, [385] = { 7, 8 },
                             [398] = { 6, 7 }, [425] = { 7, 8 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 596 },  -- quadav backplate
                { rate = 100, group = {  -- one of
                    { 4666, 1 },  -- scroll of paralyze
                    { 4733, 1 },  -- scroll of protectra
                    { 4680, 1 },  -- scroll of barsleep
                    { 4745, 1 },  -- scroll of sneak
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Shrapnel',
            ids    = { 244, 257, 287, 375, 388, 402 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 10, mnd = 11, chr = 13 },
            },
            spawn_levels = { [257] = { 8, 8 }, [402] = { 8, 9 } },
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
            name   = 'Goblin Fisher',
            ids    = { 292, 293, 294 },
            levels = {
                [4] = { acc = 21, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
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
            links  = 3,
        },
        {
            name   = 'Maighdean Uaine',
            ids    = { 310, 322 },
            nm     = true,
            levels = {
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 14803 },  -- optical earring
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Sand Pugil',
            ids    = { 439, 440, 441, 447, 448, 449 },
            levels = {
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
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
            name   = 'Goblin Mugger',
            ids    = { 442, 450 },
            levels = {
                [21] = { acc = 81, eva = 90, agi = 28, int = 24, mnd = 17, chr = 17 },
                [22] = { acc = 84, eva = 93, agi = 28, int = 24, mnd = 17, chr = 17 },
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
            links  = 3,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 443, 445, 451, 453 },
            levels = {
                [21] = { acc = 76, eva = 65, agi = 22, int = 20, mnd = 27, chr = 24 },
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 27, chr = 24 },
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
            links  = 3,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 444, 446, 452, 454 },
            levels = {
                [21] = { acc = 79, eva = 67, agi = 26, int = 27, mnd = 20, chr = 22 },
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 20, chr = 22 },
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
            links  = 3,
        },
        {
            name   = 'Goblin Digger',
            ids    = { 455 },
            levels = {
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
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
            name   = 'Gambilox Wanderling',
            ids    = { 456 },
            nm     = true,
            levels = {
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { virus = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Old Quadav',
            ids    = { 457, 458 },
            levels = {
                [20] = { acc = 75, eva = 69, agi = 22, int = 15, mnd = 16, chr = 18 },
                [21] = { acc = 79, eva = 73, agi = 24, int = 17, mnd = 18, chr = 20 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 17, mnd = 18, chr = 20 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 17, mnd = 18, chr = 20 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 17, mnd = 19, chr = 21 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 19, mnd = 20, chr = 23 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Heliodor Quadav',
            ids    = { 459, 460 },
            levels = {
                [20] = { acc = 75, eva = 62, agi = 22, int = 24, mnd = 18, chr = 19 },
                [21] = { acc = 79, eva = 66, agi = 24, int = 26, mnd = 20, chr = 22 },
                [22] = { acc = 82, eva = 68, agi = 24, int = 26, mnd = 20, chr = 22 },
                [23] = { acc = 85, eva = 71, agi = 24, int = 27, mnd = 20, chr = 22 },
                [24] = { acc = 89, eva = 74, agi = 26, int = 27, mnd = 21, chr = 24 },
                [25] = { acc = 92, eva = 77, agi = 26, int = 30, mnd = 23, chr = 24 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Brass Quadav',
            ids    = { 461, 462 },
            levels = {
                [20] = { acc = 75, eva = 67, agi = 19, int = 21, mnd = 15, chr = 15 },
                [21] = { acc = 79, eva = 72, agi = 22, int = 23, mnd = 17, chr = 17 },
                [22] = { acc = 82, eva = 74, agi = 22, int = 23, mnd = 17, chr = 17 },
                [23] = { acc = 85, eva = 77, agi = 22, int = 23, mnd = 17, chr = 17 },
                [24] = { acc = 89, eva = 81, agi = 24, int = 24, mnd = 18, chr = 18 },
                [25] = { acc = 92, eva = 84, agi = 24, int = 25, mnd = 18, chr = 18 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { paralyze = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Sapphirine Quadav',
            ids    = { 463, 464 },
            levels = {
                [20] = { acc = 72, eva = 60, agi = 18, int = 17, mnd = 25, chr = 22 },
                [21] = { acc = 76, eva = 64, agi = 20, int = 19, mnd = 27, chr = 24 },
                [22] = { acc = 79, eva = 66, agi = 20, int = 19, mnd = 27, chr = 24 },
                [23] = { acc = 82, eva = 69, agi = 20, int = 19, mnd = 28, chr = 24 },
                [24] = { acc = 86, eva = 71, agi = 21, int = 19, mnd = 29, chr = 26 },
                [25] = { acc = 89, eva = 75, agi = 23, int = 22, mnd = 31, chr = 26 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Lead Quadav',
            ids    = { 465 },
            levels = {
                [25] = { acc = 91, eva = 81, agi = 18, int = 17, mnd = 26, chr = 26 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { sleep = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 10,
        },
        {
            name   = 'Sallow Seymour',
            ids    = { 490, 491, 492 },
            nm     = true,
            levels = {
                [100] = { acc = 474, eva = 401, agi = 101, int = 124, mnd = 85, chr = 87 },
                [101] = { acc = 476, eva = 407, agi = 104, int = 126, mnd = 87, chr = 90 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 11,
        },
        {
            name   = 'Bull [Herd1]',
            ids    = { 498 },
            levels = {
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Cow [Herd1]',
            ids    = { 499, 500, 501 },
            levels = {
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Calf [Herd1]',
            ids    = { 502, 504, 505, 506, 507 },
            levels = {
                [10] = { acc = 40, eva = 37, agi = 15, int = 10, mnd = 11, chr = 12 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
    },
    by_name = {},
}
