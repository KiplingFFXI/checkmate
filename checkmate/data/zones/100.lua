-- West Ronfaure (zone 100).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Ding Bats', 'Mouse Bat' } },
        [2] = { sight = { 'Fungus Beetle', 'Lancing Lamorak', 'Scarab Beetle' } },
        [3] = {
            sight = { 'Marauder Dvogzog', 'Orcish Chasseur', 'Orcish Cursemaker', 'Orcish Fighter',
                      'Orcish Fighterchief', 'Orcish Fodder', 'Orcish Grappler', 'Orcish Mesmerizer',
                      'Orcish Serjeant' },
        },
        [4] = { sound = { 'Forest Funguar' } },
        [5] = { sight = { 'Wild Sheep' } },
        [6] = { sight = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } },
        [7] = { sight = { 'Lancing Lamorak', 'Scarab Beetle' } },
        [8] = { sight = { 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } },
        [9] = {
            sight = { 'Orcish Chasseur', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Fighterchief',
                      'Orcish Fodder', 'Orcish Grappler', 'Orcish Mesmerizer', 'Orcish Serjeant' },
        },
        [10] = {
            sight = { 'Marauder Dvogzog', 'Orcish Chasseur', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Fodder',
                      'Orcish Grappler', 'Orcish Mesmerizer', 'Orcish Serjeant' },
        },
    },
    monsters = {
        {
            name   = 'Tree Crab',
            ids    = { 1 },
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
            name   = 'Limicoline Crab',
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
            name   = 'Vermivorous Crab',
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
            name   = 'Wild Rabbit',
            ids    = { 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 46, 47, 48, 49,
                       50, 51, 52 },
            levels = {
                [1] = { acc = 11, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            level_mod = -2,
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
            },
        },
        {
            name   = 'Tunnel Worm',
            ids    = { 16, 17, 18, 19, 20, 36, 37, 38, 39, 40, 53, 54, 55, 56 },
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
            ids    = { 21, 22, 23, 24, 25, 41, 42, 43, 44, 45, 57, 58, 59, 72, 73, 89, 90, 107, 108, 123, 124, 152,
                       153, 167, 168, 183, 184, 199, 200, 221, 263, 264, 309, 310, 350, 351, 376, 377, 419, 453 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [21] = { 1, 1 }, [22] = { 1, 1 }, [23] = { 1, 1 }, [24] = { 1, 1 }, [25] = { 1, 1 },
                             [41] = { 1, 1 }, [42] = { 1, 1 }, [43] = { 1, 1 }, [44] = { 1, 1 }, [45] = { 1, 1 },
                             [57] = { 1, 1 }, [58] = { 1, 1 }, [59] = { 1, 1 }, [72] = { 2, 3 }, [73] = { 2, 3 },
                             [89] = { 2, 3 }, [90] = { 2, 3 }, [107] = { 2, 3 }, [108] = { 2, 3 }, [123] = { 3, 4 },
                             [124] = { 3, 4 }, [152] = { 3, 4 }, [153] = { 3, 4 }, [167] = { 3, 4 },
                             [168] = { 3, 4 }, [183] = { 3, 4 }, [184] = { 3, 4 }, [199] = { 3, 4 },
                             [200] = { 3, 4 }, [221] = { 4, 5 }, [263] = { 4, 5 }, [264] = { 4, 5 },
                             [309] = { 4, 5 }, [310] = { 4, 5 }, [350] = { 4, 5 }, [351] = { 4, 5 },
                             [376] = { 4, 5 }, [377] = { 4, 5 }, [419] = { 4, 5 }, [453] = { 4, 5 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Forest Hare',
            ids    = { 60, 61, 62, 63, 64, 65, 76, 77, 78, 79, 80, 81, 94, 95, 96, 97, 98, 99, 112, 113, 114, 141,
                       142, 143, 144, 145, 156, 157, 158, 159, 160, 171, 172, 173, 174, 175, 187, 188, 189, 190,
                       191, 203, 204, 205, 206, 225, 226, 227, 246, 247, 248, 249, 250, 274, 275, 276, 277, 292,
                       293, 294, 315, 316, 317, 318, 335, 336, 337, 338, 357, 358, 359, 360, 386, 387, 388, 407,
                       408, 409, 410, 425, 426, 427, 428, 440, 441, 442 },
            levels = {
                [2] = { acc = 14, eva = 11, agi = 9, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [60] = { 2, 3 }, [61] = { 2, 3 }, [62] = { 2, 3 }, [63] = { 2, 3 }, [64] = { 2, 3 },
                             [65] = { 2, 3 }, [76] = { 2, 3 }, [77] = { 2, 3 }, [78] = { 2, 3 }, [79] = { 2, 3 },
                             [80] = { 2, 3 }, [81] = { 2, 3 }, [94] = { 2, 3 }, [95] = { 2, 3 }, [96] = { 2, 3 },
                             [97] = { 2, 3 }, [98] = { 2, 3 }, [99] = { 2, 3 }, [112] = { 3, 4 }, [113] = { 3, 4 },
                             [114] = { 3, 4 }, [141] = { 3, 4 }, [142] = { 3, 4 }, [143] = { 3, 4 },
                             [144] = { 3, 4 }, [145] = { 3, 4 }, [156] = { 3, 4 }, [157] = { 3, 4 },
                             [158] = { 3, 4 }, [159] = { 3, 4 }, [160] = { 3, 4 }, [171] = { 3, 4 },
                             [172] = { 3, 4 }, [173] = { 3, 4 }, [174] = { 3, 4 }, [175] = { 3, 4 },
                             [187] = { 3, 4 }, [188] = { 3, 4 }, [189] = { 3, 4 }, [190] = { 3, 4 },
                             [191] = { 3, 4 }, [203] = { 4, 5 }, [204] = { 4, 5 }, [205] = { 4, 5 },
                             [206] = { 4, 5 }, [225] = { 4, 5 }, [226] = { 4, 5 }, [227] = { 4, 5 },
                             [246] = { 4, 5 }, [247] = { 4, 5 }, [248] = { 4, 5 }, [249] = { 4, 5 },
                             [250] = { 4, 5 }, [274] = { 4, 5 }, [275] = { 4, 5 }, [276] = { 4, 5 },
                             [277] = { 4, 5 }, [292] = { 4, 5 }, [293] = { 4, 5 }, [294] = { 4, 5 },
                             [315] = { 4, 5 }, [316] = { 4, 5 }, [317] = { 4, 5 }, [318] = { 4, 5 },
                             [335] = { 4, 5 }, [336] = { 4, 5 }, [337] = { 4, 5 }, [338] = { 4, 5 },
                             [357] = { 4, 5 }, [358] = { 4, 5 }, [359] = { 4, 5 }, [360] = { 4, 5 },
                             [386] = { 5, 6 }, [387] = { 5, 6 }, [388] = { 5, 6 }, [407] = { 5, 6 },
                             [408] = { 5, 6 }, [409] = { 5, 6 }, [410] = { 5, 6 }, [425] = { 5, 6 },
                             [426] = { 5, 6 }, [427] = { 5, 6 }, [428] = { 5, 6 }, [440] = { 5, 6 },
                             [441] = { 5, 6 }, [442] = { 5, 6 } },
            ph_for = { [294] = { 295 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 856 },  -- rabbit hide
                { rate = 100, item = 856 },  -- rabbit hide
            },
        },
        {
            name   = 'Carrion Worm',
            ids    = { 66, 67, 68, 82, 83, 84, 100, 101, 102, 115, 116, 146, 147, 161, 162, 176, 177, 192, 193, 207,
                       208, 228, 229, 251, 278, 279, 296, 319, 320, 339, 361, 411, 412, 429, 443, 444 },
            levels = {
                [2] = { acc = 13, eva = 10, agi = 8, int = 11, mnd = 8, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 15, mnd = 10, chr = 9 },
            },
            spawn_levels = { [66] = { 2, 3 }, [67] = { 2, 3 }, [68] = { 2, 3 }, [82] = { 2, 3 }, [83] = { 2, 3 },
                             [84] = { 2, 3 }, [100] = { 2, 3 }, [101] = { 2, 3 }, [102] = { 2, 3 },
                             [115] = { 3, 4 }, [116] = { 3, 4 }, [146] = { 3, 4 }, [147] = { 3, 4 },
                             [161] = { 3, 4 }, [162] = { 3, 4 }, [176] = { 3, 4 }, [177] = { 3, 4 },
                             [192] = { 3, 4 }, [193] = { 3, 4 }, [207] = { 4, 5 }, [208] = { 4, 5 },
                             [228] = { 4, 5 }, [229] = { 4, 5 }, [251] = { 4, 5 }, [278] = { 4, 5 },
                             [279] = { 4, 5 }, [296] = { 4, 5 }, [319] = { 4, 5 }, [320] = { 4, 5 },
                             [339] = { 5, 6 }, [361] = { 5, 6 }, [411] = { 5, 6 }, [412] = { 5, 6 },
                             [429] = { 5, 6 }, [443] = { 5, 6 }, [444] = { 5, 6 } },
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
            name   = 'Scarab Beetle',
            ids    = { 69, 86, 104, 148, 149, 178, 209, 210, 211, 230, 255, 256, 298, 299, 321, 322, 342, 343, 344,
                       365, 366, 367, 392, 393, 430 },
            levels = {
                [4] = { acc = 19, eva = 16, agi = 6, int = 6, mnd = 10, chr = 10 },
                [5] = { acc = 23, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
                [6] = { acc = 26, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
                [7] = { acc = 29, eva = 25, agi = 8, int = 8, mnd = 12, chr = 12 },
            },
            spawn_levels = { [69] = { 4, 5 }, [86] = { 4, 5 }, [104] = { 4, 5 }, [148] = { 4, 5 }, [149] = { 4, 5 },
                             [178] = { 4, 5 }, [209] = { 5, 6 }, [210] = { 5, 6 }, [211] = { 5, 6 },
                             [230] = { 5, 6 }, [255] = { 6, 7 }, [256] = { 6, 7 }, [298] = { 5, 6 },
                             [299] = { 5, 6 }, [321] = { 5, 6 }, [322] = { 5, 6 }, [342] = { 6, 7 },
                             [343] = { 6, 7 }, [344] = { 6, 7 }, [365] = { 6, 7 }, [366] = { 6, 7 },
                             [367] = { 6, 7 }, [392] = { 6, 7 }, [393] = { 6, 7 }, [430] = { 6, 7 } },
            ph_for = { [210] = { 231 } },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 894 },  -- beetle jaw
            },
            links  = 2,
        },
        {
            name   = 'Orcish Fodder',
            ids    = { 70, 87, 93, 105, 106, 117, 118, 126, 129, 132, 135, 136, 138, 165, 197, 218, 240, 260, 271,
                       287, 306 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 5, mnd = 6, chr = 8 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 5, mnd = 6, chr = 9 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 7, mnd = 8, chr = 10, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 25, agi = 12, int = 7, mnd = 8, chr = 11, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 7, mnd = 8, chr = 11, resist = { virus = 10 } },
            },
            spawn_levels = { [70] = { 3, 4 }, [87] = { 3, 4 }, [93] = { 3, 4 }, [105] = { 3, 4 }, [106] = { 3, 4 },
                             [117] = { 4, 5 }, [118] = { 4, 5 }, [126] = { 4, 5 }, [129] = { 4, 5 },
                             [132] = { 6, 7 }, [135] = { 6, 7 }, [136] = { 6, 7 }, [138] = { 6, 7 },
                             [165] = { 4, 5 }, [197] = { 4, 5 }, [218] = { 4, 5 }, [240] = { 4, 5 },
                             [260] = { 6, 7 }, [271] = { 6, 7 }, [287] = { 6, 7 }, [306] = { 6, 7 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 16656 },  -- orcish axe
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Grappler',
            ids    = { 71, 88, 121, 122, 128, 131, 134, 140, 151, 166, 182, 220, 242, 262, 273, 289, 308, 375 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 7, int = 5, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 17, agi = 8, int = 5, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 20, agi = 9, int = 6, mnd = 9, chr = 10, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 23, agi = 9, int = 7, mnd = 9, chr = 11, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 10, int = 7, mnd = 10, chr = 11, resist = { virus = 10 } },
                [8] = { acc = 35, eva = 30, agi = 10, int = 7, mnd = 11, chr = 12, resist = { virus = 10 } },
            },
            spawn_levels = { [71] = { 3, 4 }, [88] = { 3, 4 }, [121] = { 4, 5 }, [122] = { 4, 5 }, [128] = { 4, 5 },
                             [131] = { 4, 5 }, [134] = { 6, 7 }, [140] = { 6, 7 }, [151] = { 4, 5 },
                             [166] = { 4, 5 }, [182] = { 4, 5 }, [220] = { 4, 5 }, [242] = { 4, 5 },
                             [262] = { 6, 7 }, [273] = { 6, 7 }, [289] = { 6, 7 }, [308] = { 6, 7 },
                             [375] = { 7, 8 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Mouse Bat',
            ids    = { 74, 75, 91, 92, 109, 110, 125, 137, 154, 155, 169, 170, 185, 186, 201, 202, 222, 265, 266,
                       311, 352, 353, 378, 379, 420, 454 },
            levels = {
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [74] = { 3, 4 }, [75] = { 3, 4 }, [91] = { 2, 3 }, [92] = { 3, 4 }, [109] = { 3, 4 },
                             [110] = { 3, 4 }, [125] = { 4, 5 }, [137] = { 4, 5 }, [154] = { 4, 5 },
                             [155] = { 4, 5 }, [169] = { 4, 5 }, [170] = { 4, 5 }, [185] = { 4, 5 },
                             [186] = { 4, 5 }, [201] = { 4, 5 }, [202] = { 4, 5 }, [222] = { 5, 6 },
                             [265] = { 5, 6 }, [266] = { 5, 6 }, [311] = { 5, 6 }, [352] = { 5, 6 },
                             [353] = { 5, 6 }, [378] = { 5, 6 }, [379] = { 5, 6 }, [420] = { 4, 5 },
                             [454] = { 5, 6 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Forest Funguar',
            ids    = { 85, 103, 163, 164, 252, 253, 254, 297, 340, 341, 362, 363, 364, 389, 390, 391, 445, 446,
                       447 },
            levels = {
                [4] = { acc = 20, eva = 18, agi = 11, int = 6, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [85] = { 4, 5 }, [103] = { 4, 5 }, [163] = { 4, 5 }, [164] = { 4, 5 },
                             [252] = { 5, 6 }, [253] = { 5, 6 }, [254] = { 5, 6 }, [297] = { 5, 6 },
                             [340] = { 5, 6 }, [341] = { 5, 6 }, [362] = { 5, 6 }, [363] = { 5, 6 },
                             [364] = { 5, 6 }, [389] = { 5, 6 }, [390] = { 5, 6 }, [391] = { 5, 6 },
                             [445] = { 5, 6 }, [446] = { 5, 6 }, [447] = { 5, 6 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
            },
            links  = 4,
        },
        {
            name   = 'Orcish Mesmerizer',
            ids    = { 119, 120, 127, 130, 133, 139, 150, 181, 198, 219, 241, 261, 272, 288, 307, 374 },
            levels = {
                [4] = { acc = 21, eva = 18, agi = 11, int = 9, mnd = 7, chr = 10 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 11, mnd = 9, chr = 10, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 25, agi = 12, int = 11, mnd = 9, chr = 11, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 12, mnd = 9, chr = 12, resist = { virus = 10 } },
                [8] = { acc = 34, eva = 30, agi = 13, int = 12, mnd = 11, chr = 12, resist = { virus = 10 } },
            },
            spawn_levels = { [119] = { 4, 5 }, [120] = { 4, 5 }, [127] = { 4, 5 }, [130] = { 4, 5 },
                             [133] = { 6, 7 }, [139] = { 6, 7 }, [150] = { 4, 5 }, [181] = { 4, 5 },
                             [198] = { 4, 5 }, [219] = { 4, 5 }, [241] = { 4, 5 }, [261] = { 6, 7 },
                             [272] = { 6, 7 }, [288] = { 6, 7 }, [307] = { 6, 7 }, [374] = { 7, 8 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4866 },  -- scroll of bind
                { rate = 50, item = 4862 },  -- scroll of blind
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Wild Sheep',
            ids    = { 179, 180, 194, 195, 196, 212, 213, 214, 232, 233, 234, 235, 236, 257, 258, 259, 280, 281,
                       282, 283, 284, 300, 301, 302, 303, 323, 324, 325, 326, 345, 346, 347, 368, 369, 370, 413,
                       414, 415, 431, 432, 433, 434, 448, 449, 450 },
            levels = {
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [179] = { 5, 6 }, [180] = { 5, 6 }, [194] = { 5, 6 }, [195] = { 5, 6 },
                             [196] = { 5, 6 }, [212] = { 5, 6 }, [213] = { 5, 6 }, [214] = { 5, 6 },
                             [232] = { 5, 6 }, [233] = { 5, 6 }, [234] = { 5, 6 }, [235] = { 5, 6 },
                             [236] = { 5, 6 }, [257] = { 7, 8 }, [258] = { 7, 8 }, [259] = { 7, 8 },
                             [280] = { 7, 8 }, [281] = { 7, 8 }, [282] = { 7, 8 }, [283] = { 7, 8 },
                             [284] = { 7, 8 }, [300] = { 7, 8 }, [301] = { 7, 8 }, [302] = { 7, 8 },
                             [303] = { 7, 8 }, [323] = { 7, 8 }, [324] = { 7, 8 }, [325] = { 7, 8 },
                             [326] = { 7, 8 }, [345] = { 7, 8 }, [346] = { 7, 8 }, [347] = { 7, 8 },
                             [368] = { 7, 8 }, [369] = { 7, 8 }, [370] = { 7, 8 }, [413] = { 7, 8 },
                             [414] = { 7, 8 }, [415] = { 7, 8 }, [431] = { 7, 8 }, [432] = { 7, 8 },
                             [433] = { 7, 8 }, [434] = { 7, 8 }, [448] = { 7, 8 }, [449] = { 7, 8 },
                             [450] = { 7, 8 } },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4372 },  -- slice of giant sheep meat
                { rate = 50, item = 882 },  -- sheep tooth
                { rate = 100, item = 505 },  -- sheepskin
                { rate = 50, item = 882 },  -- sheep tooth, the despoil entry
            },
            links  = 5,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 215, 216, 237, 238, 285, 304, 327, 328, 332, 333, 348, 371, 372, 383, 384, 416, 417, 422,
                       423, 435, 451 },
            levels = {
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            spawn_levels = { [215] = { 4, 5 }, [216] = { 4, 5 }, [237] = { 4, 5 }, [238] = { 4, 5 },
                             [285] = { 5, 6 }, [304] = { 5, 6 }, [327] = { 5, 6 }, [328] = { 5, 6 },
                             [332] = { 5, 6 }, [333] = { 5, 6 }, [348] = { 5, 6 }, [371] = { 6, 7 },
                             [372] = { 6, 7 }, [383] = { 6, 7 }, [384] = { 6, 7 }, [416] = { 7, 8 },
                             [417] = { 7, 8 }, [422] = { 7, 8 }, [423] = { 7, 8 }, [435] = { 7, 8 },
                             [451] = { 7, 8 } },
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
            ids    = { 217, 239, 286, 305, 329, 334, 349, 373, 385, 394, 418, 424, 436, 452 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [217] = { 4, 5 }, [239] = { 4, 5 }, [286] = { 5, 6 }, [305] = { 5, 6 },
                             [329] = { 5, 6 }, [334] = { 5, 6 }, [349] = { 5, 6 }, [373] = { 6, 7 },
                             [385] = { 6, 7 }, [394] = { 6, 7 }, [418] = { 7, 8 }, [424] = { 7, 8 },
                             [436] = { 7, 8 }, [452] = { 7, 8 } },
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
            name   = 'Tainted Hound',
            ids    = { 223, 243, 267, 290, 312, 330, 354, 380, 421, 437 },
            levels = {
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 10 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 11 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 9, mnd = 8, chr = 11 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
            },
            spawn_levels = { [223] = { 5, 6 }, [243] = { 5, 6 }, [267] = { 5, 6 }, [290] = { 6, 7 },
                             [312] = { 6, 7 }, [330] = { 7, 8 }, [354] = { 7, 8 }, [380] = { 7, 8 },
                             [421] = { 7, 8 }, [437] = { 7, 8 } },
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
            name   = 'Enchanted Bones war',
            ids    = { 224, 244, 291, 313, 331, 355, 381 },
            levels = {
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 6, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
            },
            spawn_levels = { [224] = { 4, 5 }, [244] = { 4, 5 }, [291] = { 5, 6 }, [313] = { 6, 7 },
                             [331] = { 5, 6 }, [355] = { 5, 6 }, [381] = { 6, 7 } },
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
            name   = 'Fungus Beetle',
            ids    = { 231 },
            nm     = true,
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 9, mnd = 14, chr = 14 },
                [11] = { acc = 43, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 46, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 11, mnd = 16, chr = 16 },
                [14] = { acc = 53, eva = 46, agi = 11, int = 11, mnd = 17, chr = 17 },
                [15] = { acc = 56, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 12371 },  -- clipeus
                { rate = 100, item = 894 },  -- beetle jaw
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 7,
        },
        {
            name   = 'Bomb',
            ids    = { 245, 270, 356 },
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
            name   = 'Enchanted Bones blm',
            ids    = { 268, 269, 314, 382, 438, 439, 455 },
            levels = {
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 15, mnd = 9, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            spawn_levels = { [268] = { 6, 7 }, [269] = { 6, 7 }, [314] = { 6, 7 }, [382] = { 7, 8 },
                             [438] = { 7, 8 }, [439] = { 7, 8 }, [455] = { 7, 8 } },
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
            name   = 'Jaggedy-Eared Jack',
            ids    = { 295 },
            nm     = true,
            levels = {
                [9] = { acc = 39, eva = 37, agi = 14, int = 14, mnd = 9, chr = 9 },
                [10] = { acc = 42, eva = 51, agi = 16, int = 15, mnd = 10, chr = 10 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 10, item = 13112 },  -- rabbit charm
            },
        },
        {
            name   = 'Goblin Fisher',
            ids    = { 395, 396, 397, 398 },
            levels = {
                [6] = { acc = 28, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
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
            name   = 'River Crab',
            ids    = { 399, 400, 401, 402, 403, 404, 405, 406 },
            levels = {
                [5] = { acc = 22, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
                [6] = { acc = 25, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 1019 },  -- chunk of lufet salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 456 },
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
            links  = 8,
        },
        {
            name   = 'Marauder Dvogzog',
            ids    = { 457 },
            nm     = true,
            levels = {
                [67] = { acc = 277, eva = 256, agi = 53, int = 40, mnd = 61, chr = 63 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = 10, dark_sleep = 10, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 458, 459 },
            levels = {
                [20] = { acc = 75, eva = 69, agi = 22, int = 21, mnd = 17, chr = 21 },
                [21] = { acc = 79, eva = 73, agi = 24, int = 23, mnd = 19, chr = 23 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 23, mnd = 19, chr = 23 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 24, mnd = 19, chr = 23 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 24, mnd = 19, chr = 25 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 26, mnd = 21, chr = 26 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Serjeant',
            ids    = { 460, 461 },
            levels = {
                [20] = { acc = 74, eva = 66, agi = 16, int = 12, mnd = 20, chr = 23 },
                [21] = { acc = 78, eva = 70, agi = 18, int = 14, mnd = 22, chr = 25 },
                [22] = { acc = 81, eva = 72, agi = 18, int = 14, mnd = 22, chr = 25 },
                [23] = { acc = 84, eva = 75, agi = 18, int = 14, mnd = 22, chr = 25 },
                [24] = { acc = 87, eva = 78, agi = 19, int = 14, mnd = 23, chr = 27 },
                [25] = { acc = 91, eva = 81, agi = 19, int = 15, mnd = 24, chr = 28 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 10, virus = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 462, 463 },
            levels = {
                [20] = { acc = 75, eva = 69, agi = 22, int = 13, mnd = 15, chr = 20 },
                [21] = { acc = 79, eva = 73, agi = 24, int = 15, mnd = 17, chr = 22 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 15, mnd = 17, chr = 22 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 15, mnd = 17, chr = 22 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 15, mnd = 17, chr = 23 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 17, mnd = 19, chr = 25 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Chasseur',
            ids    = { 464, 465 },
            levels = {
                [20] = { acc = 84, eva = 63, agi = 25, int = 15, mnd = 18, chr = 20 },
                [21] = { acc = 88, eva = 67, agi = 27, int = 17, mnd = 21, chr = 22 },
                [22] = { acc = 91, eva = 69, agi = 27, int = 17, mnd = 21, chr = 22 },
                [23] = { acc = 94, eva = 73, agi = 28, int = 17, mnd = 21, chr = 22 },
                [24] = { acc = 98, eva = 75, agi = 29, int = 17, mnd = 22, chr = 23 },
                [25] = { acc = 101, eva = 79, agi = 31, int = 20, mnd = 23, chr = 25 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Fighterchief',
            ids    = { 466 },
            levels = {
                [25] = { acc = 93, eva = 84, agi = 20, int = 15, mnd = 23, chr = 25 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Gougetooth Ganzaga',
            ids    = { 472 },
            levels = {
                [1] = { acc = 11, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Lancing Lamorak',
            ids    = { 473, 474, 475 },
            levels = {
                [94] = { acc = 442, eva = 467, agi = 93, int = 101, mnd = 70, chr = 75 },
                [95] = { acc = 450, eva = 473, agi = 95, int = 103, mnd = 72, chr = 76 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Cow [Herd2]',
            ids    = { 530 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Calf [Herd2]',
            ids    = { 531, 532, 534, 535, 536 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Bull [Herd3]',
            ids    = { 537 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Cow [Herd3]',
            ids    = { 538, 540 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
        {
            name   = 'Calf [Herd3]',
            ids    = { 541, 542, 543, 544, 545, 546 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
        },
    },
    by_name = {},
}
