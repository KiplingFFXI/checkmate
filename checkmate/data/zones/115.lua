-- West Sarutabaruta (zone 115).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Crawler' },
        [2] = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' },
        [3] = { 'Yagudo Acolyte', 'Yagudo Condottiere', 'Yagudo Follower', 'Yagudo Initiate', 'Yagudo Priest',
                'Yagudo Scribe', 'Yagudo Theologist', 'Yagudo Votary' },
        [4] = { 'Tom Tit Tat' },
        [5] = { 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' },
        [6] = { 'Yagudo Acolyte', 'Yagudo Follower', 'Yagudo Initiate', 'Yagudo Priest', 'Yagudo Scribe',
                'Yagudo Theologist', 'Yagudo Votary' },
    },
    monsters = {
        {
            name   = 'Palm Crab',
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
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Savanna Crab',
            ids    = { 2 },
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
            name   = 'Mugger Crab',
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
                { rate = 10, item = 4400 },  -- slice of land crab meat
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
            name   = 'Tiny Mandragora',
            ids    = { 6, 7, 8, 9, 10, 11, 18, 19, 20, 21, 22, 28, 29, 30, 31, 32, 33 },
            levels = {
                [1] = { acc = 11, eva = 8, agi = 6, int = 6, mnd = 7, chr = 7 },
            },
            level_mod = -2,
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 50, item = 4368 },  -- two-leaf mandragora bud
            },
        },
        {
            name   = 'Bumblebee',
            ids    = { 12, 13, 14, 15, 23, 24, 25, 34, 35, 36 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
            },
            level_mod = -2,
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 100, item = 4444 },  -- rarab tail
                { rate = 50, item = 4370 },  -- pot of honey
            },
        },
        {
            name   = 'Savanna Rarab',
            ids    = { 16, 17, 26, 27, 42, 43, 44, 45, 55, 56, 57, 58, 59, 60, 61, 62, 63, 75, 76, 77, 78, 79, 80,
                       81, 82, 83, 93, 94, 95, 96, 97, 119, 120, 121, 122, 123, 124, 125, 126, 127, 146, 147, 148,
                       149, 165, 166, 167, 168, 183, 184, 185, 255, 256, 257, 274, 275, 276, 294, 295, 296, 311,
                       312, 313, 330, 331, 339 },
            levels = {
                [2] = { acc = 14, eva = 11, agi = 9, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [16] = { 2, 3 }, [17] = { 2, 3 }, [26] = { 2, 3 }, [27] = { 2, 3 }, [42] = { 2, 3 },
                             [43] = { 2, 3 }, [44] = { 2, 3 }, [45] = { 2, 3 }, [55] = { 2, 3 }, [56] = { 2, 3 },
                             [57] = { 2, 3 }, [58] = { 2, 3 }, [59] = { 2, 3 }, [60] = { 2, 3 }, [61] = { 2, 3 },
                             [62] = { 2, 3 }, [63] = { 2, 3 }, [75] = { 2, 3 }, [76] = { 2, 3 }, [77] = { 2, 3 },
                             [78] = { 2, 3 }, [79] = { 2, 3 }, [80] = { 2, 3 }, [81] = { 2, 3 }, [82] = { 2, 3 },
                             [83] = { 2, 3 }, [93] = { 2, 3 }, [94] = { 2, 3 }, [95] = { 2, 3 }, [96] = { 2, 3 },
                             [97] = { 2, 3 }, [119] = { 2, 3 }, [120] = { 2, 3 }, [121] = { 2, 3 },
                             [122] = { 2, 3 }, [123] = { 2, 3 }, [124] = { 2, 3 }, [125] = { 2, 3 },
                             [126] = { 2, 3 }, [127] = { 2, 3 }, [146] = { 4, 5 }, [147] = { 4, 5 },
                             [148] = { 4, 5 }, [149] = { 4, 5 }, [165] = { 4, 5 }, [166] = { 4, 5 },
                             [167] = { 4, 5 }, [168] = { 4, 5 }, [183] = { 4, 5 }, [184] = { 4, 5 },
                             [185] = { 4, 5 }, [255] = { 4, 5 }, [256] = { 4, 5 }, [257] = { 4, 5 },
                             [274] = { 4, 5 }, [275] = { 4, 5 }, [276] = { 4, 5 }, [294] = { 4, 5 },
                             [295] = { 4, 5 }, [296] = { 4, 5 }, [311] = { 4, 5 }, [312] = { 4, 5 },
                             [313] = { 4, 5 }, [330] = { 4, 5 }, [331] = { 4, 5 }, [339] = { 4, 5 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 584 },  -- torn epistle
            },
        },
        {
            name   = 'River Crab',
            ids    = { 37, 38, 39, 102, 103, 104, 105, 106, 107, 108, 109 },
            levels = {
                [2] = { acc = 12, eva = 10, agi = 6, int = 6, mnd = 9, chr = 9 },
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
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
            name   = 'Crawler',
            ids    = { 40, 41, 51, 52, 53, 54, 71, 72, 73, 74, 91, 92, 115, 116, 117, 118, 143, 144, 145, 162, 163,
                       164, 180, 181, 182, 252, 253, 254, 291, 292, 293, 307, 308, 309, 310 },
            levels = {
                [4] = { acc = 20, eva = 18, agi = 10, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 27, agi = 12, int = 9, mnd = 9, chr = 10 },
            },
            spawn_levels = { [40] = { 4, 5 }, [41] = { 4, 5 }, [51] = { 4, 5 }, [52] = { 4, 5 }, [53] = { 4, 5 },
                             [54] = { 4, 5 }, [71] = { 4, 5 }, [72] = { 4, 5 }, [73] = { 4, 5 }, [74] = { 4, 5 },
                             [91] = { 4, 5 }, [92] = { 4, 5 }, [115] = { 4, 5 }, [116] = { 4, 5 }, [117] = { 4, 5 },
                             [118] = { 4, 5 }, [143] = { 5, 6 }, [144] = { 5, 6 }, [145] = { 5, 6 },
                             [162] = { 5, 6 }, [163] = { 5, 6 }, [164] = { 5, 6 }, [180] = { 5, 6 },
                             [181] = { 5, 6 }, [182] = { 5, 6 }, [252] = { 5, 6 }, [253] = { 5, 6 },
                             [254] = { 5, 6 }, [291] = { 6, 7 }, [292] = { 6, 7 }, [293] = { 6, 7 },
                             [307] = { 5, 6 }, [308] = { 5, 6 }, [309] = { 5, 6 }, [310] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
                { rate = 100, item = 1156 },  -- crawler calculus
                { rate = 50, item = 583 },  -- smooth stone
            },
            links  = 1,
        },
        {
            name   = 'Carrion Crow',
            ids    = { 46, 47, 48, 64, 65, 66, 67, 84, 85, 86, 87, 98, 99, 128, 129, 130, 131, 150, 151, 152, 169,
                       170, 171, 186, 198, 199, 220, 238, 258, 259, 260, 277, 278, 297, 298, 314, 315, 340 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [46] = { 3, 4 }, [47] = { 3, 4 }, [48] = { 3, 4 }, [64] = { 3, 4 }, [65] = { 3, 4 },
                             [66] = { 3, 4 }, [67] = { 3, 4 }, [84] = { 3, 4 }, [85] = { 3, 4 }, [86] = { 3, 4 },
                             [87] = { 3, 4 }, [98] = { 3, 4 }, [99] = { 3, 4 }, [128] = { 3, 4 }, [129] = { 3, 4 },
                             [130] = { 3, 4 }, [131] = { 3, 4 }, [150] = { 4, 5 }, [151] = { 4, 5 },
                             [152] = { 4, 5 }, [169] = { 4, 5 }, [170] = { 4, 5 }, [171] = { 4, 5 },
                             [186] = { 4, 5 }, [198] = { 5, 6 }, [199] = { 5, 6 }, [220] = { 5, 6 },
                             [238] = { 5, 6 }, [258] = { 4, 5 }, [259] = { 4, 5 }, [260] = { 4, 5 },
                             [277] = { 5, 6 }, [278] = { 5, 6 }, [297] = { 5, 6 }, [298] = { 5, 6 },
                             [314] = { 4, 5 }, [315] = { 4, 5 }, [340] = { 4, 5 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
        },
        {
            name   = 'Goblin Thug',
            ids    = { 49, 50, 68, 69, 88, 89, 100, 110, 132, 133, 135, 136 },
            levels = {
                [3] = { acc = 18, eva = 17, agi = 10, int = 9, mnd = 6, chr = 6 },
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
            },
            spawn_levels = { [49] = { 3, 4 }, [50] = { 3, 4 }, [68] = { 3, 4 }, [69] = { 3, 4 }, [88] = { 3, 4 },
                             [89] = { 3, 4 }, [100] = { 3, 4 }, [110] = { 3, 4 }, [132] = { 4, 5 },
                             [133] = { 4, 5 }, [135] = { 4, 5 }, [136] = { 4, 5 } },
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
            links  = 2,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 70, 90, 101, 111, 134, 137 },
            levels = {
                [3] = { acc = 16, eva = 13, agi = 8, int = 9, mnd = 9, chr = 7 },
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
            },
            spawn_levels = { [70] = { 3, 4 }, [90] = { 3, 4 }, [101] = { 3, 4 }, [111] = { 3, 4 }, [134] = { 4, 5 },
                             [137] = { 4, 5 } },
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
            links  = 2,
        },
        {
            name   = 'Goblin Fisher',
            ids    = { 112, 113, 114 },
            levels = {
                [3] = { acc = 17, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
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
            links  = 2,
        },
        {
            name   = 'Mandragora',
            ids    = { 138, 139, 140, 141, 142, 157, 158, 159, 160, 161, 178, 179, 188, 189, 210, 211, 228, 229,
                       249, 250, 251, 267, 268, 287, 288, 289, 290, 304, 305, 306, 333, 334 },
            levels = {
                [4] = { acc = 21, eva = 16, agi = 7, int = 7, mnd = 9, chr = 8 },
                [5] = { acc = 24, eva = 20, agi = 8, int = 7, mnd = 9, chr = 9 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 17344 },  -- cornette
                { rate = 100, item = 4368 },  -- two-leaf mandragora bud
                { rate = 50, item = 934 },  -- pinch of yuhtunga sulfur
                { rate = 10, item = 4369 },  -- four-leaf mandragora bud
            },
        },
        {
            name   = 'Yagudo Initiate',
            ids    = { 153, 172, 200, 207, 221, 239, 246, 262, 279, 284, 299, 316, 317, 318, 323, 324 },
            levels = {
                [4] = { acc = 21, eva = 17, agi = 8, int = 7, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 20, agi = 9, int = 7, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 24, agi = 10, int = 8, mnd = 9, chr = 11 },
            },
            spawn_levels = { [153] = { 4, 5 }, [172] = { 4, 5 }, [200] = { 5, 6 }, [207] = { 5, 6 },
                             [221] = { 5, 6 }, [239] = { 5, 6 }, [246] = { 4, 5 }, [262] = { 4, 5 },
                             [279] = { 5, 6 }, [284] = { 5, 6 }, [299] = { 5, 6 }, [316] = { 5, 6 },
                             [317] = { 5, 6 }, [318] = { 5, 6 }, [323] = { 5, 6 }, [324] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 100, item = 841 },  -- yagudo feather
                { rate = 100, item = 841 },  -- yagudo feather
                { rate = 100, item = 498 },  -- yagudo bead necklace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Acolyte',
            ids    = { 154, 173, 201, 208, 222, 240, 247, 263, 280, 285, 300, 319, 325 },
            levels = {
                [4] = { acc = 19, eva = 15, agi = 9, int = 8, mnd = 11, chr = 12 },
                [5] = { acc = 22, eva = 19, agi = 10, int = 9, mnd = 13, chr = 12 },
                [6] = { acc = 26, eva = 21, agi = 11, int = 9, mnd = 13, chr = 14 },
            },
            spawn_levels = { [154] = { 4, 5 }, [173] = { 4, 5 }, [201] = { 5, 6 }, [208] = { 5, 6 },
                             [222] = { 5, 6 }, [240] = { 5, 6 }, [247] = { 4, 5 }, [263] = { 4, 5 },
                             [280] = { 5, 6 }, [285] = { 5, 6 }, [300] = { 5, 6 }, [319] = { 5, 6 },
                             [325] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, group = {  -- one of
                    { 4666, 1 },  -- scroll of paralyze
                    { 4733, 1 },  -- scroll of protectra
                    { 4680, 1 },  -- scroll of barsleep
                    { 4745, 1 },  -- scroll of sneak
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Scribe',
            ids    = { 155, 174, 202, 209, 223, 241, 248, 264, 281, 286, 301, 320 },
            levels = {
                [4] = { acc = 21, eva = 17, agi = 12, int = 12, mnd = 7, chr = 10 },
                [5] = { acc = 24, eva = 20, agi = 12, int = 13, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 23, agi = 14, int = 13, mnd = 9, chr = 11 },
            },
            spawn_levels = { [155] = { 4, 5 }, [174] = { 4, 5 }, [202] = { 5, 6 }, [209] = { 5, 6 },
                             [223] = { 5, 6 }, [241] = { 5, 6 }, [248] = { 4, 5 }, [264] = { 4, 5 },
                             [281] = { 5, 6 }, [286] = { 5, 6 }, [301] = { 5, 6 }, [320] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 50, item = 4862 },  -- scroll of blind
                { rate = 50, item = 4866 },  -- scroll of bind
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Balloon',
            ids    = { 156, 177, 206, 227, 245 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 10, mnd = 11, chr = 13 },
            },
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
            name   = 'Mad Fox',
            ids    = { 175, 187, 265, 282, 302 },
            levels = {
                [4] = { acc = 20, eva = 18, agi = 11, int = 7, mnd = 6, chr = 9 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 10 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 11 },
            },
            spawn_levels = { [282] = { 4, 5 } },
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
            name   = 'Magicked Bones club',
            ids    = { 176, 203, 224, 242, 266, 283, 303, 321 },
            levels = {
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 6, chr = 8 },
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
            name   = 'Crawler',
            ids    = { 190, 191, 213, 214, 231, 232 },
            levels = {
                [7] = { acc = 30, eva = 27, agi = 12, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
                { rate = 100, item = 1156 },  -- crawler calculus
                { rate = 50, item = 583 },  -- smooth stone
                { rate = 50, item = 582 },  -- meteorite
            },
            links  = 1,
        },
        {
            name   = 'Giant Bee',
            ids    = { 192, 193, 194, 195, 196, 197, 215, 216, 217, 218, 219, 233, 234, 235, 236, 237, 269, 270,
                       271, 272, 273, 326, 327, 328, 329, 335, 336, 337, 338 },
            levels = {
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
            },
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
            name   = 'Magicked Bones blm',
            ids    = { 204, 205, 225, 226, 243, 244, 322 },
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
            name   = 'Tom Tit Tat',
            ids    = { 212, 230 },
            nm     = true,
            levels = {
                [9] = { acc = 38, eva = 33, agi = 10, int = 9, mnd = 11, chr = 11 },
                [10] = { acc = 41, eva = 36, agi = 11, int = 10, mnd = 13, chr = 12 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 240, item = 4368 },  -- two-leaf mandragora bud
                { rate = 150, item = 834 },  -- ball of saruta cotton
                { rate = 150, item = 16443 },  -- fruit punches
                { rate = 10, item = 4369 },  -- four-leaf mandragora bud
            },
            links  = 4,
        },
        {
            name   = 'Nunyenunc',
            ids    = { 261 },
            nm     = true,
            levels = {
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            meva   = { light = 50 },
            immune = { 'dark_sleep', 'light_sleep', 'requiem', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 18394 },  -- pilgrims wand
            },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 341 },
            levels = {
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
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
            links  = 5,
        },
        {
            name   = 'Yagudo Votary',
            ids    = { 342, 343 },
            levels = {
                [20] = { acc = 76, eva = 69, agi = 18, int = 15, mnd = 18, chr = 20 },
                [21] = { acc = 80, eva = 73, agi = 20, int = 17, mnd = 21, chr = 22 },
                [22] = { acc = 83, eva = 75, agi = 20, int = 17, mnd = 21, chr = 22 },
                [23] = { acc = 86, eva = 78, agi = 20, int = 17, mnd = 21, chr = 22 },
                [24] = { acc = 90, eva = 81, agi = 21, int = 18, mnd = 22, chr = 23 },
                [25] = { acc = 93, eva = 85, agi = 22, int = 18, mnd = 23, chr = 25 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Theologist',
            ids    = { 344, 345 },
            levels = {
                [20] = { acc = 75, eva = 63, agi = 24, int = 25, mnd = 17, chr = 21 },
                [21] = { acc = 79, eva = 67, agi = 26, int = 27, mnd = 19, chr = 24 },
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 19, chr = 24 },
                [23] = { acc = 85, eva = 72, agi = 26, int = 28, mnd = 19, chr = 24 },
                [24] = { acc = 89, eva = 75, agi = 28, int = 29, mnd = 19, chr = 26 },
                [25] = { acc = 92, eva = 78, agi = 28, int = 31, mnd = 22, chr = 26 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Follower',
            ids    = { 346, 347 },
            levels = {
                [20] = { acc = 75, eva = 70, agi = 21, int = 18, mnd = 17, chr = 21, resist = { blind = 10 } },
                [21] = { acc = 79, eva = 75, agi = 24, int = 20, mnd = 19, chr = 24, resist = { blind = 10 } },
                [22] = { acc = 82, eva = 77, agi = 24, int = 20, mnd = 19, chr = 24, resist = { blind = 10 } },
                [23] = { acc = 85, eva = 80, agi = 24, int = 20, mnd = 19, chr = 24, resist = { blind = 10 } },
                [24] = { acc = 89, eva = 84, agi = 26, int = 21, mnd = 19, chr = 26, resist = { blind = 10 } },
                [25] = { acc = 92, eva = 87, agi = 26, int = 23, mnd = 22, chr = 26, resist = { blind = 15 } },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Priest',
            ids    = { 348, 349 },
            levels = {
                [20] = { acc = 72, eva = 61, agi = 20, int = 18, mnd = 24, chr = 24 },
                [21] = { acc = 76, eva = 65, agi = 22, int = 20, mnd = 26, chr = 26 },
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 26, chr = 26 },
                [23] = { acc = 82, eva = 70, agi = 22, int = 20, mnd = 27, chr = 26 },
                [24] = { acc = 85, eva = 72, agi = 23, int = 21, mnd = 27, chr = 28 },
                [25] = { acc = 89, eva = 76, agi = 25, int = 23, mnd = 30, chr = 28 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Condottiere',
            ids    = { 350 },
            levels = {
                [25] = { acc = 92, eva = 92, agi = 29, int = 23, mnd = 17, chr = 23 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 10, bind = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Virvatuli',
            ids    = { 369, 370, 371 },
            nm     = true,
            levels = {
                [89] = { acc = 400, eva = 379, agi = 101, int = 94, mnd = 90, chr = 66 },
                [90] = { acc = 407, eva = 385, agi = 102, int = 95, mnd = 90, chr = 67 },
            },
            ranks  = { ice = 2, earth = 2, water = 2, light = -1, dark = 6, paralyze = 2, bind = 2, slow = 2,
                       poison = 2, light_sleep = -1, dark_sleep = 6, blind = 6 },
            magic_dmg = { all = -6.3 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Chepelle',
            ids    = { 500 },
            nm     = true,
            levels = {
                [139] = { acc = 505, eva = 634, agi = 131, int = 113, mnd = 106, chr = 132 },
            },
        },
        {
            name   = 'Chepelles Tiger',
            ids    = { 501 },
            levels = {
                [139] = { acc = 497, eva = 638, agi = 139, int = 90, mnd = 105, chr = 117 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
        },
        {
            name   = 'Chepelles Sheep',
            ids    = { 502 },
            levels = {
                [139] = { acc = 493, eva = 638, agi = 139, int = 98, mnd = 105, chr = 117 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Chepelles Hare',
            ids    = { 503 },
            levels = {
                [139] = { acc = 497, eva = 638, agi = 139, int = 105, mnd = 105, chr = 117 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
        },
    },
    by_name = {},
}
