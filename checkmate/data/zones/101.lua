-- East Ronfaure (zone 101).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Ding Bats', 'Mouse Bat' } },
        [2] = { sound = { 'Forest Funguar' } },
        [3] = { sight = { 'Scarab Beetle' } },
        [4] = { sight = { 'Orcish Fodder', 'Orcish Grappler', 'Orcish Mesmerizer' } },
        [5] = { sight = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } },
        [6] = { sight = { 'Wild Sheep' } },
        [7] = { sound = { 'Swamfisk' } },
        [8] = { sound = { 'Hugemaw Harold' } },
        [9] = { sight = { 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } },
        [10] = { sound = { 'Bigmouth Billy', 'Hugemaw Harold' } },
    },
    monsters = {
        {
            name   = 'Pugil',
            ids    = { 1 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 7 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
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
            name   = 'Cheval Pugil',
            ids    = { 2 },
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
            name   = 'Mud Pugil',
            ids    = { 3 },
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
            name   = 'Pug Pugil',
            ids    = { 4 },
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
            name   = 'Wild Rabbit',
            ids    = { 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 52, 53, 54, 55,
                       56 },
            levels = {
                [1] = { acc = 11, eva = 9, agi = 9, int = 6, mnd = 6, chr = 7 },
            },
            level_mod = -2,
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 856 },  -- rabbit hide
                { rate = 100, item = 856 },  -- rabbit hide
            },
        },
        {
            name   = 'Tunnel Worm',
            ids    = { 16, 17, 18, 19, 20, 36, 37, 38, 39, 40, 57, 58, 59 },
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
            ids    = { 21, 22, 23, 24, 25, 41, 42, 43, 44, 45, 60, 61, 62, 77, 78, 97, 98, 127, 128, 147, 148, 166,
                       167, 184, 185, 200, 201, 265, 266, 295, 296, 319, 320, 331, 332, 343, 344, 364, 365, 392,
                       402 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [21] = { 1, 1 }, [22] = { 1, 1 }, [23] = { 1, 1 }, [24] = { 1, 1 }, [25] = { 1, 1 },
                             [41] = { 1, 1 }, [42] = { 1, 1 }, [43] = { 1, 1 }, [44] = { 1, 1 }, [45] = { 1, 1 },
                             [60] = { 1, 1 }, [61] = { 1, 1 }, [62] = { 1, 1 }, [77] = { 2, 3 }, [78] = { 2, 3 },
                             [97] = { 2, 3 }, [98] = { 2, 3 }, [127] = { 3, 4 }, [128] = { 3, 4 }, [147] = { 2, 3 },
                             [148] = { 2, 3 }, [166] = { 4, 5 }, [167] = { 4, 5 }, [184] = { 4, 5 },
                             [185] = { 4, 5 }, [200] = { 4, 5 }, [201] = { 4, 5 }, [265] = { 4, 5 },
                             [266] = { 4, 5 }, [295] = { 4, 5 }, [296] = { 4, 5 }, [319] = { 4, 5 },
                             [320] = { 4, 5 }, [331] = { 4, 5 }, [332] = { 4, 5 }, [343] = { 4, 5 },
                             [344] = { 4, 5 }, [364] = { 4, 5 }, [365] = { 4, 5 }, [392] = { 4, 5 },
                             [402] = { 4, 5 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Pugil',
            ids    = { 46, 47, 48, 49, 50, 51, 105, 106, 107, 108, 109, 133, 134, 135, 136, 206, 207, 208, 275, 276,
                       375, 376, 377, 378 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 7 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [46] = { 1, 1 }, [47] = { 1, 1 }, [48] = { 1, 1 }, [49] = { 1, 1 }, [50] = { 1, 1 },
                             [51] = { 1, 1 }, [105] = { 2, 3 }, [106] = { 2, 3 }, [107] = { 2, 3 },
                             [108] = { 2, 3 }, [109] = { 2, 3 }, [133] = { 2, 3 }, [134] = { 2, 3 },
                             [135] = { 2, 3 }, [136] = { 2, 3 }, [206] = { 3, 4 }, [207] = { 3, 4 },
                             [208] = { 3, 4 }, [275] = { 4, 5 }, [276] = { 4, 5 }, [375] = { 4, 5 },
                             [376] = { 4, 5 }, [377] = { 4, 5 }, [378] = { 4, 5 } },
            ph_for = { [275] = { 277 }, [276] = { 277 }, [375] = { 379 }, [376] = { 379 }, [377] = { 379 },
                       [378] = { 379 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Forest Hare',
            ids    = { 63, 64, 65, 66, 67, 68, 83, 84, 85, 86, 87, 88, 110, 111, 112, 113, 114, 115, 137, 138, 139,
                       140, 141, 150, 151, 152, 153, 154, 155, 171, 172, 173, 174, 175, 192, 193, 194, 209, 210,
                       211, 212, 226, 227, 228, 229, 248, 249, 250, 251, 252, 278, 279, 280, 281, 302, 303, 304,
                       305, 306, 326, 327, 328, 334, 335, 336, 350, 351, 352, 368, 380, 381, 382, 383, 395, 396 },
            levels = {
                [2] = { acc = 14, eva = 11, agi = 9, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [63] = { 2, 3 }, [64] = { 2, 3 }, [65] = { 2, 3 }, [66] = { 2, 3 }, [67] = { 2, 3 },
                             [68] = { 2, 3 }, [83] = { 2, 3 }, [84] = { 2, 3 }, [85] = { 2, 3 }, [86] = { 2, 3 },
                             [87] = { 2, 3 }, [88] = { 2, 3 }, [110] = { 3, 4 }, [111] = { 3, 4 }, [112] = { 3, 4 },
                             [113] = { 3, 4 }, [114] = { 3, 4 }, [115] = { 3, 4 }, [137] = { 2, 3 },
                             [138] = { 2, 3 }, [139] = { 2, 3 }, [140] = { 2, 3 }, [141] = { 2, 3 },
                             [150] = { 3, 4 }, [151] = { 3, 4 }, [152] = { 3, 4 }, [153] = { 3, 4 },
                             [154] = { 3, 4 }, [155] = { 3, 4 }, [171] = { 4, 5 }, [172] = { 4, 5 },
                             [173] = { 4, 5 }, [174] = { 4, 5 }, [175] = { 4, 5 }, [192] = { 5, 6 },
                             [193] = { 5, 6 }, [194] = { 5, 6 }, [209] = { 3, 4 }, [210] = { 3, 4 },
                             [211] = { 3, 4 }, [212] = { 3, 4 }, [226] = { 3, 4 }, [227] = { 3, 4 },
                             [228] = { 3, 4 }, [229] = { 3, 4 }, [248] = { 4, 5 }, [249] = { 4, 5 },
                             [250] = { 4, 5 }, [251] = { 4, 5 }, [252] = { 4, 5 }, [278] = { 4, 5 },
                             [279] = { 4, 5 }, [280] = { 4, 5 }, [281] = { 4, 5 }, [302] = { 4, 5 },
                             [303] = { 4, 5 }, [304] = { 4, 5 }, [305] = { 4, 5 }, [306] = { 4, 5 },
                             [326] = { 5, 6 }, [327] = { 5, 6 }, [328] = { 5, 6 }, [334] = { 5, 6 },
                             [335] = { 5, 6 }, [336] = { 5, 6 }, [350] = { 5, 6 }, [351] = { 5, 6 },
                             [352] = { 5, 6 }, [368] = { 5, 6 }, [380] = { 5, 6 }, [381] = { 5, 6 },
                             [382] = { 5, 6 }, [383] = { 5, 6 }, [395] = { 5, 6 }, [396] = { 5, 6 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
            },
        },
        {
            name   = 'Carrion Worm',
            ids    = { 69, 70, 71, 89, 90, 91, 116, 117, 118, 142, 143, 144, 156, 157, 158, 159, 176, 177, 178, 195,
                       196, 213, 214, 230, 231, 253, 282, 283, 307, 384 },
            levels = {
                [2] = { acc = 13, eva = 10, agi = 8, int = 11, mnd = 8, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 15, mnd = 10, chr = 9 },
            },
            spawn_levels = { [69] = { 2, 3 }, [70] = { 2, 3 }, [71] = { 2, 3 }, [89] = { 2, 3 }, [90] = { 2, 3 },
                             [91] = { 2, 3 }, [116] = { 3, 4 }, [117] = { 3, 4 }, [118] = { 3, 4 },
                             [142] = { 2, 3 }, [143] = { 2, 3 }, [144] = { 2, 3 }, [156] = { 4, 5 },
                             [157] = { 4, 5 }, [158] = { 4, 5 }, [159] = { 4, 5 }, [176] = { 4, 5 },
                             [177] = { 4, 5 }, [178] = { 4, 5 }, [195] = { 5, 6 }, [196] = { 5, 6 },
                             [213] = { 3, 4 }, [214] = { 3, 4 }, [230] = { 3, 4 }, [231] = { 3, 4 },
                             [253] = { 4, 5 }, [282] = { 4, 5 }, [283] = { 4, 5 }, [307] = { 5, 6 },
                             [384] = { 5, 6 } },
            ph_for = { [282] = { 284 }, [283] = { 284 } },
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
            name   = 'Forest Funguar',
            ids    = { 72, 92, 93, 119, 160, 161, 254, 255, 256, 308, 309, 310, 353, 354, 355 },
            levels = {
                [4] = { acc = 20, eva = 18, agi = 11, int = 6, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [72] = { 4, 5 }, [92] = { 4, 5 }, [93] = { 4, 5 }, [119] = { 4, 5 }, [160] = { 4, 5 },
                             [161] = { 4, 5 }, [254] = { 5, 6 }, [255] = { 5, 6 }, [256] = { 5, 6 },
                             [308] = { 5, 6 }, [309] = { 5, 6 }, [310] = { 5, 6 }, [353] = { 5, 6 },
                             [354] = { 5, 6 }, [355] = { 5, 6 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
            },
            links  = 2,
        },
        {
            name   = 'Scarab Beetle',
            ids    = { 73, 74, 94, 120, 121, 145, 162, 179, 180, 215, 232, 257, 258, 285, 311, 312, 356, 357, 385,
                       386, 397, 398 },
            levels = {
                [4] = { acc = 19, eva = 16, agi = 6, int = 6, mnd = 10, chr = 10 },
                [5] = { acc = 23, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
                [6] = { acc = 26, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
                [7] = { acc = 29, eva = 25, agi = 8, int = 8, mnd = 12, chr = 12 },
            },
            spawn_levels = { [73] = { 4, 5 }, [74] = { 4, 5 }, [94] = { 4, 5 }, [120] = { 4, 5 }, [121] = { 4, 5 },
                             [145] = { 4, 5 }, [162] = { 4, 5 }, [179] = { 5, 6 }, [180] = { 5, 6 },
                             [215] = { 4, 5 }, [232] = { 4, 5 }, [257] = { 5, 6 }, [258] = { 5, 6 },
                             [285] = { 5, 6 }, [311] = { 5, 6 }, [312] = { 5, 6 }, [356] = { 6, 7 },
                             [357] = { 6, 7 }, [385] = { 6, 7 }, [386] = { 6, 7 }, [397] = { 6, 7 },
                             [398] = { 6, 7 } },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 894 },  -- beetle jaw
            },
            links  = 3,
        },
        {
            name   = 'Orcish Fodder',
            ids    = { 75, 76, 95, 96, 124, 241, 262, 272, 292, 316, 361, 389 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 5, mnd = 6, chr = 8 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 5, mnd = 6, chr = 9 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 7, mnd = 8, chr = 10, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 25, agi = 12, int = 7, mnd = 8, chr = 11, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 7, mnd = 8, chr = 11, resist = { virus = 10 } },
                [8] = { acc = 34, eva = 30, agi = 13, int = 7, mnd = 9, chr = 12, resist = { virus = 10 } },
            },
            spawn_levels = { [75] = { 3, 4 }, [76] = { 3, 4 }, [95] = { 3, 4 }, [96] = { 3, 4 }, [124] = { 4, 5 },
                             [241] = { 4, 5 }, [262] = { 5, 6 }, [272] = { 5, 6 }, [292] = { 5, 6 },
                             [316] = { 7, 8 }, [361] = { 7, 8 }, [389] = { 7, 8 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 16656 },  -- orcish axe
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Mouse Bat',
            ids    = { 79, 80, 99, 100, 129, 130, 149, 168, 169, 186, 187, 202, 203, 267, 268, 297, 298, 321, 322,
                       366, 393, 403 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
            },
            spawn_levels = { [79] = { 3, 4 }, [80] = { 3, 4 }, [99] = { 3, 4 }, [100] = { 3, 4 }, [129] = { 4, 5 },
                             [130] = { 4, 5 }, [149] = { 3, 4 }, [168] = { 4, 5 }, [169] = { 4, 5 },
                             [186] = { 5, 6 }, [187] = { 5, 6 }, [202] = { 6, 7 }, [203] = { 6, 7 },
                             [267] = { 5, 6 }, [268] = { 5, 6 }, [297] = { 5, 6 }, [298] = { 5, 6 },
                             [321] = { 5, 6 }, [322] = { 5, 6 }, [366] = { 5, 6 }, [393] = { 6, 7 },
                             [403] = { 6, 7 } },
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
            name   = 'Orcish Mesmerizer',
            ids    = { 81, 125, 242, 263, 273, 293, 317, 362, 390 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 9, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 9, mnd = 7, chr = 10 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 11, mnd = 9, chr = 10, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 25, agi = 12, int = 11, mnd = 9, chr = 11, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 12, mnd = 9, chr = 12, resist = { virus = 10 } },
                [8] = { acc = 34, eva = 30, agi = 13, int = 12, mnd = 11, chr = 12, resist = { virus = 10 } },
            },
            spawn_levels = { [81] = { 3, 4 }, [125] = { 4, 5 }, [242] = { 4, 5 }, [263] = { 5, 6 },
                             [273] = { 5, 6 }, [293] = { 5, 6 }, [317] = { 7, 8 }, [362] = { 7, 8 },
                             [390] = { 7, 8 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4866 },  -- scroll of bind
                { rate = 50, item = 4862 },  -- scroll of blind
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Grappler',
            ids    = { 82, 126, 243, 264, 274, 294, 318, 363, 391 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 7, int = 5, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 17, agi = 8, int = 5, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 20, agi = 9, int = 6, mnd = 9, chr = 10, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 23, agi = 9, int = 7, mnd = 9, chr = 11, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 10, int = 7, mnd = 10, chr = 11, resist = { virus = 10 } },
                [8] = { acc = 35, eva = 30, agi = 10, int = 7, mnd = 11, chr = 12, resist = { virus = 10 } },
            },
            spawn_levels = { [82] = { 3, 4 }, [126] = { 4, 5 }, [243] = { 4, 5 }, [264] = { 5, 6 },
                             [274] = { 5, 6 }, [294] = { 5, 6 }, [318] = { 7, 8 }, [363] = { 7, 8 },
                             [391] = { 7, 8 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Fisher',
            ids    = { 101, 102, 103, 104, 372, 373, 374 },
            levels = {
                [3] = { acc = 17, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
            },
            spawn_levels = { [101] = { 3, 4 }, [102] = { 3, 4 }, [103] = { 3, 4 }, [104] = { 3, 4 },
                             [372] = { 5, 6 }, [373] = { 5, 6 }, [374] = { 5, 6 } },
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
            links  = 5,
        },
        {
            name   = 'Wild Sheep',
            ids    = { 122, 123, 216, 217, 218, 219, 220, 233, 234, 235, 236, 237, 259, 260, 261, 286, 287, 288,
                       313, 314, 315, 337, 338, 339, 358, 359, 360, 387, 388, 399, 400, 401 },
            levels = {
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [122] = { 6, 7 }, [123] = { 6, 7 }, [216] = { 6, 7 }, [217] = { 6, 7 },
                             [218] = { 6, 7 }, [219] = { 6, 7 }, [220] = { 6, 7 }, [233] = { 6, 7 },
                             [234] = { 6, 7 }, [235] = { 6, 7 }, [236] = { 6, 7 }, [237] = { 6, 7 },
                             [259] = { 7, 8 }, [260] = { 7, 8 }, [261] = { 7, 8 }, [286] = { 7, 8 },
                             [287] = { 7, 8 }, [288] = { 7, 8 }, [313] = { 7, 8 }, [314] = { 7, 8 },
                             [315] = { 7, 8 }, [337] = { 7, 8 }, [338] = { 7, 8 }, [339] = { 7, 8 },
                             [358] = { 7, 8 }, [359] = { 7, 8 }, [360] = { 7, 8 }, [387] = { 7, 8 },
                             [388] = { 7, 8 }, [399] = { 7, 8 }, [400] = { 7, 8 }, [401] = { 7, 8 } },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4372 },  -- slice of giant sheep meat
                { rate = 50, item = 882 },  -- sheep tooth
                { rate = 100, item = 505 },  -- sheepskin
                { rate = 50, item = 882 },  -- sheep tooth, the despoil entry
            },
            links  = 6,
        },
        {
            name   = 'Tainted Hound',
            ids    = { 131, 224, 245, 269, 299, 324, 345 },
            levels = {
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 11 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 9, mnd = 8, chr = 11 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
            },
            spawn_levels = { [131] = { 6, 7 }, [224] = { 6, 7 }, [245] = { 6, 7 }, [269] = { 7, 8 },
                             [299] = { 7, 8 }, [324] = { 7, 8 }, [345] = { 7, 8 } },
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
            name   = 'Goblin Thug',
            ids    = { 146, 163, 164, 181, 182, 190, 197, 198, 204, 221, 222, 238, 239, 289, 329, 340, 348, 369 },
            levels = {
                [3] = { acc = 18, eva = 17, agi = 10, int = 9, mnd = 6, chr = 6 },
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            spawn_levels = { [146] = { 3, 4 }, [163] = { 3, 4 }, [164] = { 3, 4 }, [181] = { 6, 7 },
                             [182] = { 6, 7 }, [190] = { 4, 5 }, [197] = { 7, 8 }, [198] = { 7, 8 },
                             [204] = { 6, 7 }, [221] = { 4, 5 }, [222] = { 4, 5 }, [238] = { 4, 5 },
                             [239] = { 4, 5 }, [289] = { 5, 6 }, [329] = { 7, 8 }, [340] = { 7, 8 },
                             [348] = { 7, 8 }, [369] = { 6, 7 } },
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
            links  = 5,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 165, 183, 191, 199, 205, 223, 240, 290, 291, 330, 341, 342, 349, 370, 371 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [165] = { 4, 5 }, [183] = { 6, 7 }, [191] = { 5, 6 }, [199] = { 7, 8 },
                             [205] = { 6, 7 }, [223] = { 4, 5 }, [240] = { 4, 5 }, [290] = { 5, 6 },
                             [291] = { 5, 6 }, [330] = { 7, 8 }, [341] = { 7, 8 }, [342] = { 7, 8 },
                             [349] = { 7, 8 }, [370] = { 6, 7 }, [371] = { 6, 7 } },
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
            links  = 5,
        },
        {
            name   = 'Enchanted Bones blm',
            ids    = { 170, 188, 246, 247, 270, 271, 300, 301, 325, 333, 346, 347, 394 },
            levels = {
                [4] = { acc = 21, eva = 16, agi = 11, int = 12, mnd = 7, chr = 9 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 15, mnd = 9, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            spawn_levels = { [170] = { 4, 5 }, [188] = { 6, 7 }, [246] = { 5, 6 }, [247] = { 5, 6 },
                             [270] = { 4, 5 }, [271] = { 6, 7 }, [300] = { 6, 7 }, [301] = { 6, 7 },
                             [325] = { 6, 6 }, [333] = { 7, 8 }, [346] = { 6, 7 }, [347] = { 6, 7 },
                             [394] = { 7, 8 } },
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
            name   = 'Bomb',
            ids    = { 189, 244, 323 },
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
            name   = 'Enchanted Bones war',
            ids    = { 225, 367 },
            levels = {
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [225] = { 5, 6 }, [367] = { 7, 8 } },
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
            name   = 'Swamfisk',
            ids    = { 277, 379 },
            nm     = true,
            levels = {
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 13 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 17594 },  -- gelong staff
                { rate = 240, item = 868 },  -- handful of pugil scales
                { rate = 150, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Bigmouth Billy',
            ids    = { 284 },
            nm     = true,
            levels = {
                [9] = { acc = 36, eva = 31, agi = 13, int = 18, mnd = 12, chr = 11 },
                [10] = { acc = 40, eva = 35, agi = 14, int = 18, mnd = 13, chr = 12 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 240, item = 643 },  -- chunk of iron ore
                { rate = 240, item = 644 },  -- chunk of mythril ore
                { rate = 10, item = 769 },  -- red rock
                { rate = 10, item = 770 },  -- blue rock
                { rate = 10, item = 771 },  -- yellow rock
                { rate = 10, item = 772 },  -- green rock
                { rate = 10, item = 773 },  -- translucent rock
                { rate = 10, item = 774 },  -- purple rock
                { rate = 10, item = 775 },  -- black rock
                { rate = 10, item = 776 },  -- white rock
            },
            links  = 8,
        },
        {
            name   = 'Goblin Digger',
            ids    = { 404 },
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
            links  = 9,
        },
        {
            name   = 'Sarimanok',
            ids    = { 423, 424, 425 },
            nm     = true,
            levels = {
                [94] = { acc = 445, eva = 476, agi = 110, int = 111, mnd = 76, chr = 67 },
                [95] = { acc = 452, eva = 482, agi = 112, int = 113, mnd = 76, chr = 68 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
        },
        {
            name   = 'Hugemaw Harold',
            ids    = { 559, 560, 561 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 91, mnd = 69, chr = 67 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            links  = 10,
        },
    },
    by_name = {},
}
