-- South Gustaberg (zone 107).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Ding Bats', 'Fledermaus' } },
        [2] = { sight = { 'Carnero', 'Ornery Sheep' } },
        [3] = { sight = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } },
        [4] = { sound = { 'Bounding Belinda', 'Leaping Lizzy', 'Rock Lizard' } },
        [5] = { sound = { 'Amber Quadav', 'Amethyst Quadav', 'Young Quadav' } },
        [6] = { sight = { 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } },
    },
    monsters = {
        {
            name   = 'Stone Crab',
            ids    = { 1 },
            levels = {
                [2] = { acc = 12, eva = 10, agi = 6, int = 6, mnd = 9, chr = 9 },
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
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
                [7] = { acc = 29, eva = 25, agi = 8, int = 9, mnd = 13, chr = 13 },
                [8] = { acc = 32, eva = 28, agi = 9, int = 9, mnd = 13, chr = 13 },
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
            name   = 'Mole Crab',
            ids    = { 4 },
            levels = {
                [7] = { acc = 29, eva = 25, agi = 8, int = 9, mnd = 13, chr = 13 },
                [8] = { acc = 32, eva = 28, agi = 9, int = 9, mnd = 13, chr = 13 },
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
            name   = 'Passage Crab',
            ids    = { 5 },
            levels = {
                [9] = { acc = 35, eva = 31, agi = 9, int = 9, mnd = 14, chr = 14 },
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
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
            name   = 'Bubbly Bernie',
            ids    = { 6 },
            nm     = true,
            levels = {
                [9] = { acc = 35, eva = 31, agi = 9, int = 9, mnd = 14, chr = 14 },
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 550 },  -- steam clock
                { rate = 100, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Huge Hornet',
            ids    = { 7, 8, 9, 10, 11, 12, 13, 22, 23, 24, 25, 26, 27, 36, 37, 38, 39, 40, 41, 48, 49, 50, 51, 52,
                       53, 54 },
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
            ids    = { 14, 15, 16, 17, 28, 29, 30, 31, 42, 43, 44, 55, 56, 57 },
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
            ids    = { 18, 19, 20, 21, 32, 33, 34, 35, 45, 46, 47, 58, 59, 60, 61, 70, 71, 83, 84, 94, 105, 116,
                       128, 141, 153 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [18] = { 1, 1 }, [19] = { 1, 1 }, [20] = { 1, 1 }, [21] = { 1, 1 }, [32] = { 1, 1 },
                             [33] = { 1, 1 }, [34] = { 1, 1 }, [35] = { 1, 1 }, [45] = { 1, 1 }, [46] = { 1, 1 },
                             [47] = { 1, 1 }, [58] = { 1, 1 }, [59] = { 1, 1 }, [60] = { 1, 1 }, [61] = { 1, 1 },
                             [70] = { 2, 3 }, [71] = { 2, 3 }, [83] = { 3, 4 }, [84] = { 3, 4 }, [94] = { 2, 3 },
                             [105] = { 2, 3 }, [116] = { 2, 3 }, [128] = { 4, 5 }, [141] = { 3, 4 },
                             [153] = { 3, 4 } },
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
            ids    = { 62, 63, 64, 75, 76, 77, 87, 88, 98, 99, 109, 110, 120, 121, 133, 134, 146, 147, 426, 427,
                       428, 429, 430, 431, 443, 444, 445, 446, 447, 448 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [62] = { 3, 4 }, [63] = { 3, 4 }, [64] = { 3, 4 }, [75] = { 3, 4 }, [76] = { 3, 4 },
                             [77] = { 3, 4 }, [87] = { 3, 4 }, [88] = { 3, 4 }, [98] = { 3, 4 }, [99] = { 3, 4 },
                             [109] = { 3, 4 }, [110] = { 3, 4 }, [120] = { 4, 5 }, [121] = { 4, 5 },
                             [133] = { 4, 5 }, [134] = { 4, 5 }, [146] = { 4, 5 }, [147] = { 4, 5 },
                             [426] = { 5, 6 }, [427] = { 5, 6 }, [428] = { 5, 6 }, [429] = { 5, 6 },
                             [430] = { 5, 6 }, [431] = { 5, 6 }, [443] = { 5, 6 }, [444] = { 5, 6 },
                             [445] = { 5, 6 }, [446] = { 5, 6 }, [447] = { 5, 6 }, [448] = { 5, 6 } },
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
            ids    = { 65, 66, 78, 89, 100, 111, 122, 135, 148, 149, 163, 164, 165, 166, 167, 168, 169, 170, 176,
                       177, 178, 179, 180, 181, 182, 183, 191, 192, 193, 194, 195, 196, 197, 211, 212, 213, 214,
                       215, 216, 217, 218, 228, 229, 230, 231, 232, 233, 240, 241, 242, 243, 244, 245, 246, 247,
                       256, 257, 258, 274, 275, 302, 303, 319, 320, 336, 337, 359, 360 },
            levels = {
                [2] = { acc = 13, eva = 10, agi = 8, int = 11, mnd = 8, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
            },
            spawn_levels = { [65] = { 3, 4 }, [66] = { 3, 4 }, [78] = { 3, 4 }, [89] = { 3, 4 }, [100] = { 3, 4 },
                             [111] = { 3, 4 }, [122] = { 4, 5 }, [135] = { 4, 5 }, [148] = { 4, 5 },
                             [149] = { 4, 5 }, [163] = { 2, 3 }, [164] = { 2, 3 }, [165] = { 2, 3 },
                             [166] = { 2, 3 }, [167] = { 2, 3 }, [168] = { 2, 3 }, [169] = { 2, 3 },
                             [170] = { 2, 3 }, [176] = { 2, 3 }, [177] = { 2, 3 }, [178] = { 2, 3 },
                             [179] = { 2, 3 }, [180] = { 2, 3 }, [181] = { 2, 3 }, [182] = { 2, 3 },
                             [183] = { 2, 3 }, [191] = { 2, 3 }, [192] = { 2, 3 }, [193] = { 2, 3 },
                             [194] = { 2, 3 }, [195] = { 2, 3 }, [196] = { 2, 3 }, [197] = { 2, 3 },
                             [211] = { 2, 3 }, [212] = { 2, 3 }, [213] = { 2, 3 }, [214] = { 2, 3 },
                             [215] = { 2, 3 }, [216] = { 2, 3 }, [217] = { 2, 3 }, [218] = { 2, 3 },
                             [228] = { 2, 3 }, [229] = { 2, 3 }, [230] = { 2, 3 }, [231] = { 2, 3 },
                             [232] = { 2, 3 }, [233] = { 2, 3 }, [240] = { 3, 4 }, [241] = { 3, 4 },
                             [242] = { 3, 4 }, [243] = { 3, 4 }, [244] = { 3, 4 }, [245] = { 3, 4 },
                             [246] = { 3, 4 }, [247] = { 3, 4 }, [256] = { 4, 5 }, [257] = { 4, 5 },
                             [258] = { 4, 5 }, [274] = { 4, 5 }, [275] = { 4, 5 }, [302] = { 4, 5 },
                             [303] = { 4, 5 }, [319] = { 4, 5 }, [320] = { 4, 5 }, [336] = { 4, 5 },
                             [337] = { 4, 5 }, [359] = { 4, 5 }, [360] = { 4, 5 } },
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
            ids    = { 67, 68, 79, 80, 90, 91, 101, 102, 112, 113, 123, 124, 136, 137, 150, 157, 158, 160, 161, 291,
                       292 },
            levels = {
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [67] = { 5, 6 }, [68] = { 5, 6 }, [79] = { 5, 6 }, [80] = { 5, 6 }, [90] = { 5, 6 },
                             [91] = { 5, 6 }, [101] = { 5, 6 }, [102] = { 5, 6 }, [112] = { 5, 6 },
                             [113] = { 5, 6 }, [123] = { 7, 8 }, [124] = { 7, 8 }, [136] = { 7, 8 },
                             [137] = { 7, 8 }, [150] = { 7, 8 }, [157] = { 7, 8 }, [158] = { 7, 8 },
                             [160] = { 7, 8 }, [161] = { 7, 8 }, [291] = { 5, 6 }, [292] = { 5, 6 } },
            ph_for = { [124] = { 125, 138 } },
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
            ids    = { 69, 81, 82, 92, 93, 103, 114, 126, 139, 151, 152, 237, 293, 294, 299, 440, 457 },
            levels = {
                [3] = { acc = 18, eva = 17, agi = 10, int = 9, mnd = 6, chr = 6 },
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            spawn_levels = { [69] = { 4, 5 }, [81] = { 4, 5 }, [82] = { 4, 5 }, [92] = { 4, 5 }, [93] = { 4, 5 },
                             [103] = { 4, 5 }, [114] = { 4, 5 }, [126] = { 6, 7 }, [139] = { 6, 7 },
                             [151] = { 6, 7 }, [152] = { 6, 7 }, [237] = { 3, 4 }, [293] = { 6, 7 },
                             [294] = { 6, 7 }, [299] = { 5, 6 }, [440] = { 7, 8 }, [457] = { 7, 8 } },
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
            ids    = { 72, 73, 85, 95, 96, 106, 107, 117, 118, 129, 142, 154 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [72] = { 3, 4 }, [73] = { 3, 4 }, [85] = { 3, 4 }, [95] = { 3, 4 }, [96] = { 3, 4 },
                             [106] = { 3, 4 }, [107] = { 3, 4 }, [117] = { 3, 4 }, [118] = { 3, 4 },
                             [129] = { 4, 5 }, [142] = { 5, 6 }, [154] = { 4, 5 } },
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
            ids    = { 74, 86, 97, 108, 119, 130, 143, 155, 159, 162 },
            levels = {
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 10 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 11 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 9, mnd = 8, chr = 11 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
            },
            spawn_levels = { [74] = { 5, 6 }, [86] = { 5, 6 }, [119] = { 5, 6 } },
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
            name   = 'Goblin Weaver',
            ids    = { 104, 115, 127, 140, 253, 295, 296, 300, 301, 441, 458 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [104] = { 4, 5 }, [115] = { 4, 5 }, [127] = { 6, 7 }, [140] = { 6, 7 },
                             [253] = { 4, 5 }, [295] = { 6, 7 }, [296] = { 6, 7 }, [300] = { 5, 6 },
                             [301] = { 5, 6 }, [441] = { 7, 8 }, [458] = { 7, 8 } },
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
            name   = 'Carnero',
            ids    = { 125, 138 },
            nm     = true,
            levels = {
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 17811 },  -- katayama ichimonji
                { rate = 50, item = 882 },  -- sheep tooth
                { rate = 100, item = 505 },  -- sheepskin
                { rate = 100, item = 4372 },  -- slice of giant sheep meat
                { rate = 50, item = 1898 },  -- vial of fresh blood
            },
            links  = 2,
        },
        {
            name   = 'Enchanted Bones war',
            ids    = { 131, 144, 272, 289, 317, 334, 410, 425 },
            levels = {
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [131] = { 6, 7 }, [144] = { 6, 7 }, [272] = { 5, 6 }, [289] = { 6, 7 },
                             [317] = { 6, 7 }, [334] = { 6, 7 }, [410] = { 7, 8 }, [425] = { 7, 8 } },
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
            name   = 'Enchanted Bones blm',
            ids    = { 132, 145, 156, 297, 298, 354, 373, 391 },
            levels = {
                [4] = { acc = 21, eva = 16, agi = 11, int = 12, mnd = 7, chr = 9 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 15, mnd = 9, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            spawn_levels = { [132] = { 6, 7 }, [145] = { 6, 7 }, [156] = { 6, 7 }, [297] = { 6, 7 },
                             [298] = { 6, 7 }, [354] = { 4, 5 }, [373] = { 4, 5 }, [391] = { 7, 8 } },
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
            name   = 'Rock Lizard',
            ids    = { 171, 184, 198, 199, 219, 220, 259, 260, 276, 277, 304, 305, 321, 322, 338, 339, 361, 362,
                       375, 376, 377, 378, 379, 395, 396, 397, 398, 399, 411, 412, 413, 414, 415 },
            levels = {
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [171] = { 4, 5 }, [184] = { 4, 5 }, [198] = { 4, 5 }, [199] = { 4, 5 },
                             [219] = { 4, 5 }, [220] = { 4, 5 }, [259] = { 5, 6 }, [260] = { 5, 6 },
                             [276] = { 5, 6 }, [277] = { 5, 6 }, [304] = { 5, 6 }, [305] = { 5, 6 },
                             [321] = { 5, 6 }, [322] = { 5, 6 }, [338] = { 5, 6 }, [339] = { 5, 6 },
                             [361] = { 5, 6 }, [362] = { 5, 6 }, [375] = { 7, 8 }, [376] = { 7, 8 },
                             [377] = { 7, 8 }, [378] = { 7, 8 }, [379] = { 7, 8 }, [395] = { 7, 8 },
                             [396] = { 7, 8 }, [397] = { 7, 8 }, [398] = { 7, 8 }, [399] = { 7, 8 },
                             [411] = { 7, 8 }, [412] = { 7, 8 }, [413] = { 7, 8 }, [414] = { 7, 8 },
                             [415] = { 7, 8 } },
            ph_for = { [379] = { 380, 400 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
            },
            links  = 4,
        },
        {
            name   = 'Walking Sapling',
            ids    = { 172, 173, 185, 186, 200, 201, 221, 222, 234, 248, 249, 261, 262, 263, 264, 265, 266, 278,
                       279, 280, 281, 282, 283, 306, 307, 323, 324, 340, 341, 342, 343, 344, 345, 346, 347, 363,
                       364, 365, 366, 367, 381, 382, 383, 401, 402, 403, 416, 417, 418 },
            levels = {
                [3] = { acc = 16, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 18, agi = 11, int = 7, mnd = 7, chr = 7 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [172] = { 3, 4 }, [173] = { 3, 4 }, [185] = { 3, 4 }, [186] = { 3, 4 },
                             [200] = { 3, 4 }, [201] = { 3, 4 }, [221] = { 3, 4 }, [222] = { 3, 4 },
                             [234] = { 3, 4 }, [248] = { 4, 5 }, [249] = { 4, 5 }, [261] = { 4, 5 },
                             [262] = { 4, 5 }, [263] = { 4, 5 }, [264] = { 4, 5 }, [265] = { 4, 5 },
                             [266] = { 4, 5 }, [278] = { 4, 5 }, [279] = { 4, 5 }, [280] = { 4, 5 },
                             [281] = { 4, 5 }, [282] = { 4, 5 }, [283] = { 4, 5 }, [306] = { 4, 5 },
                             [307] = { 4, 5 }, [323] = { 4, 5 }, [324] = { 4, 5 }, [340] = { 4, 5 },
                             [341] = { 4, 5 }, [342] = { 4, 5 }, [343] = { 4, 5 }, [344] = { 4, 5 },
                             [345] = { 4, 5 }, [346] = { 4, 5 }, [347] = { 4, 5 }, [363] = { 4, 5 },
                             [364] = { 4, 5 }, [365] = { 4, 5 }, [366] = { 4, 5 }, [367] = { 4, 5 },
                             [381] = { 5, 6 }, [382] = { 5, 6 }, [383] = { 5, 6 }, [401] = { 5, 6 },
                             [402] = { 5, 6 }, [403] = { 5, 6 }, [416] = { 5, 6 }, [417] = { 5, 6 },
                             [418] = { 5, 6 } },
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
            ids    = { 174, 175, 187, 188, 202, 203, 223, 224, 235, 236, 250, 251, 252, 267, 268, 284, 285, 308,
                       309, 310, 311, 312, 313, 325, 326, 327, 328, 329, 330, 348, 349, 368, 369, 384, 385, 386,
                       404, 405, 406, 419, 420, 421 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
            },
            spawn_levels = { [174] = { 3, 4 }, [175] = { 3, 4 }, [187] = { 3, 4 }, [188] = { 3, 4 },
                             [202] = { 3, 4 }, [203] = { 3, 4 }, [223] = { 3, 4 }, [224] = { 3, 4 },
                             [235] = { 3, 4 }, [236] = { 3, 4 }, [250] = { 4, 5 }, [251] = { 4, 5 },
                             [252] = { 4, 5 }, [267] = { 4, 5 }, [268] = { 4, 5 }, [284] = { 4, 5 },
                             [285] = { 4, 5 }, [308] = { 5, 6 }, [309] = { 5, 6 }, [310] = { 5, 6 },
                             [311] = { 5, 6 }, [312] = { 5, 6 }, [313] = { 5, 6 }, [325] = { 5, 6 },
                             [326] = { 5, 6 }, [327] = { 5, 6 }, [328] = { 5, 6 }, [329] = { 5, 6 },
                             [330] = { 5, 6 }, [348] = { 4, 5 }, [349] = { 4, 5 }, [368] = { 4, 5 },
                             [369] = { 4, 5 }, [384] = { 6, 7 }, [385] = { 6, 7 }, [386] = { 6, 7 },
                             [404] = { 6, 7 }, [405] = { 6, 7 }, [406] = { 6, 7 }, [419] = { 6, 7 },
                             [420] = { 6, 7 }, [421] = { 6, 7 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
        },
        {
            name   = 'Young Quadav',
            ids    = { 189, 190, 204, 205, 208, 225, 226, 269, 286, 314, 315, 331, 332, 350, 351, 356, 370, 387,
                       392, 407, 408, 422, 423 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 6, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10, resist = { virus = 10 } },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11, resist = { virus = 10 } },
            },
            spawn_levels = { [189] = { 3, 4 }, [190] = { 3, 4 }, [204] = { 3, 4 }, [205] = { 3, 4 },
                             [208] = { 3, 4 }, [225] = { 3, 4 }, [226] = { 3, 4 }, [269] = { 5, 6 },
                             [286] = { 6, 7 }, [314] = { 6, 7 }, [315] = { 6, 7 }, [331] = { 6, 7 },
                             [332] = { 6, 7 }, [350] = { 4, 5 }, [351] = { 4, 5 }, [356] = { 4, 5 },
                             [370] = { 4, 5 }, [387] = { 7, 8 }, [392] = { 5, 6 }, [407] = { 7, 8 },
                             [408] = { 7, 8 }, [422] = { 7, 8 }, [423] = { 7, 8 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 12415 },  -- shell shield
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Amethyst Quadav',
            ids    = { 206, 209, 270, 287, 316, 352, 357, 371, 388, 393, 424 },
            levels = {
                [3] = { acc = 15, eva = 12, agi = 7, int = 7, mnd = 11, chr = 9 },
                [4] = { acc = 19, eva = 15, agi = 8, int = 7, mnd = 12, chr = 11 },
                [5] = { acc = 22, eva = 18, agi = 9, int = 9, mnd = 13, chr = 11 },
                [6] = { acc = 26, eva = 20, agi = 9, int = 9, mnd = 13, chr = 12 },
                [7] = { acc = 29, eva = 24, agi = 10, int = 9, mnd = 15, chr = 13 },
                [8] = { acc = 32, eva = 26, agi = 11, int = 11, mnd = 15, chr = 13 },
            },
            spawn_levels = { [206] = { 3, 4 }, [209] = { 3, 4 }, [270] = { 5, 6 }, [287] = { 6, 7 },
                             [316] = { 6, 7 }, [352] = { 4, 5 }, [357] = { 4, 5 }, [371] = { 4, 5 },
                             [388] = { 7, 8 }, [393] = { 5, 6 }, [424] = { 7, 8 } },
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
            links  = 5,
        },
        {
            name   = 'Amber Quadav',
            ids    = { 207, 210, 227, 271, 288, 333, 353, 358, 372, 389, 390, 394, 409 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 9, int = 11, mnd = 7, chr = 7 },
                [4] = { acc = 21, eva = 16, agi = 11, int = 11, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 14, mnd = 10, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            spawn_levels = { [207] = { 3, 4 }, [210] = { 3, 4 }, [227] = { 3, 4 }, [271] = { 5, 6 },
                             [288] = { 6, 7 }, [333] = { 6, 7 }, [353] = { 4, 5 }, [358] = { 4, 5 },
                             [372] = { 4, 5 }, [389] = { 7, 8 }, [390] = { 7, 8 }, [394] = { 5, 6 },
                             [409] = { 7, 8 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4862 },  -- scroll of blind
                { rate = 50, item = 4866 },  -- scroll of bind
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Goblin Fisher',
            ids    = { 238, 239, 254, 255 },
            levels = {
                [3] = { acc = 17, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
            },
            spawn_levels = { [238] = { 3, 4 }, [239] = { 3, 4 }, [254] = { 4, 5 }, [255] = { 4, 5 } },
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
            name   = 'Shrapnel',
            ids    = { 273, 318, 335, 355, 374, 442, 459 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 10, mnd = 11, chr = 13 },
            },
            spawn_levels = { [273] = { 8, 9 }, [318] = { 8, 9 } },
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
            name   = 'Leaping Lizzy',
            ids    = { 380, 400 },
            nm     = true,
            levels = {
                [10] = { acc = 41, eva = 37, agi = 15, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 926 },  -- lizard tail
                { rate = 150, item = 15351 },  -- bounding boots
                { rate = 100, item = 852 },  -- lizard skin
            },
            links  = 4,
        },
        {
            name   = 'Land Crab',
            ids    = { 432, 433, 434, 435, 436, 437, 438, 439, 449, 450, 451, 452, 453, 454, 455, 456 },
            levels = {
                [6] = { acc = 25, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
                [7] = { acc = 29, eva = 25, agi = 8, int = 9, mnd = 13, chr = 13 },
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
            name   = 'Goblin Digger',
            ids    = { 460 },
            levels = {
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
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
            links  = 6,
        },
        {
            name   = 'Bhishani',
            ids    = { 467, 468 },
            nm     = true,
            levels = {
                [99] = { acc = 474, eva = 396, agi = 101, int = 118, mnd = 85, chr = 92 },
            },
            ranks  = { fire = 1, ice = 1, wind = 11, earth = 1, thunder = 1, water = 1, light = 8, dark = 1,
                       paralyze = 1, bind = 1, silence = 11, slow = 1, poison = 1, light_sleep = 8, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 11 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bounding Belinda',
            ids    = { 639, 640, 641 },
            nm     = true,
            levels = {},
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            links  = 4,
        },
    },
    by_name = {},
}
