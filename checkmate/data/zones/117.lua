-- Tahrongi Canyon (zone 117).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Canyon Rarab' },
        [2] = { 'Akbaba' },
        [3] = { 'Canyon Crawler' },
        [4] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Digger', 'Goblin Thug', 'Goblin Tinkerer',
                'Goblin Weaver' },
        [5] = { 'Serpopard Ishtar', 'Wild Dhalmel' },
        [6] = { 'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Mendicant', 'Yagudo Persecutor', 'Yagudo Piper',
                'Yagudo Scribe' },
        [7] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver' },
        [8] = { 'Strolling Sapling' },
    },
    monsters = {
        {
            name   = 'Canyon Rarab',
            ids    = { 1, 2, 3, 4, 14, 15, 16, 17, 25, 26, 27, 28, 46, 47, 48, 49, 59, 60, 61, 62, 83, 84, 93, 94,
                       106, 107, 127, 128, 129, 130, 139, 140, 141, 149, 150, 151, 189, 190, 203, 204, 217, 218,
                       230, 231, 266, 267, 278, 279, 280, 290, 291, 292, 325, 326, 327, 337, 338, 339, 349, 350,
                       351, 374, 375, 389, 390, 391, 401, 402, 412, 413, 446, 447 },
            levels = {
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [1] = { 7, 8 }, [2] = { 7, 8 }, [3] = { 7, 8 }, [4] = { 7, 8 }, [14] = { 7, 8 },
                             [15] = { 7, 8 }, [16] = { 7, 8 }, [17] = { 7, 8 }, [25] = { 7, 8 }, [26] = { 7, 8 },
                             [27] = { 7, 8 }, [28] = { 7, 8 }, [46] = { 9, 10 }, [47] = { 9, 10 }, [48] = { 9, 10 },
                             [49] = { 9, 10 }, [59] = { 9, 10 }, [60] = { 9, 10 }, [61] = { 9, 10 },
                             [62] = { 9, 10 }, [83] = { 9, 10 }, [84] = { 9, 10 }, [93] = { 9, 10 },
                             [94] = { 9, 10 }, [106] = { 9, 10 }, [107] = { 9, 10 }, [127] = { 9, 10 },
                             [128] = { 9, 10 }, [129] = { 9, 10 }, [130] = { 9, 10 }, [139] = { 9, 10 },
                             [140] = { 9, 10 }, [141] = { 9, 10 }, [149] = { 9, 10 }, [150] = { 9, 10 },
                             [151] = { 9, 10 }, [189] = { 9, 10 }, [190] = { 9, 10 }, [203] = { 9, 10 },
                             [204] = { 9, 10 }, [217] = { 9, 10 }, [218] = { 9, 10 }, [230] = { 10, 11 },
                             [231] = { 10, 11 }, [266] = { 9, 10 }, [267] = { 9, 10 }, [278] = { 9, 10 },
                             [279] = { 9, 10 }, [280] = { 9, 10 }, [290] = { 9, 10 }, [291] = { 9, 10 },
                             [292] = { 9, 10 }, [325] = { 9, 10 }, [326] = { 9, 10 }, [327] = { 9, 10 },
                             [337] = { 9, 10 }, [338] = { 9, 10 }, [339] = { 9, 10 }, [349] = { 9, 10 },
                             [350] = { 9, 10 }, [351] = { 9, 10 }, [374] = { 10, 11 }, [375] = { 10, 11 },
                             [389] = { 10, 11 }, [390] = { 10, 11 }, [391] = { 10, 11 }, [401] = { 10, 11 },
                             [402] = { 10, 11 }, [412] = { 10, 11 }, [413] = { 10, 11 }, [446] = { 9, 10 },
                             [447] = { 9, 10 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 50, item = 586 },  -- odd postcard
                { rate = 50, item = 587 },  -- damp envelope
            },
            links  = 1,
        },
        {
            name   = 'Pygmaioi',
            ids    = { 5, 6, 7, 8, 18, 19, 20, 29, 30, 31, 50, 51, 52, 63, 64, 65, 85, 95, 108, 131, 132, 142, 143,
                       152, 153, 154, 191, 192, 193, 205, 206, 219, 220, 232, 233, 268, 269, 281, 282, 283, 293,
                       294, 295, 328, 329, 330, 340, 341, 342, 352, 353, 354, 376, 377, 392, 393, 394, 403, 404,
                       414, 415 },
            levels = {
                [8] = { acc = 34, eva = 29, agi = 9, int = 9, mnd = 11, chr = 11 },
                [9] = { acc = 38, eva = 33, agi = 10, int = 9, mnd = 11, chr = 11 },
                [10] = { acc = 41, eva = 36, agi = 11, int = 10, mnd = 13, chr = 12 },
                [11] = { acc = 45, eva = 39, agi = 11, int = 11, mnd = 13, chr = 13 },
            },
            spawn_levels = { [5] = { 8, 9 }, [6] = { 8, 9 }, [7] = { 8, 9 }, [8] = { 8, 9 }, [18] = { 8, 9 },
                             [19] = { 8, 9 }, [20] = { 8, 9 }, [29] = { 8, 9 }, [30] = { 8, 9 }, [31] = { 8, 9 },
                             [50] = { 10, 11 }, [51] = { 10, 11 }, [52] = { 10, 11 }, [63] = { 10, 11 },
                             [64] = { 10, 11 }, [65] = { 10, 11 }, [85] = { 10, 11 }, [95] = { 10, 11 },
                             [108] = { 10, 11 }, [131] = { 10, 11 }, [132] = { 10, 11 }, [142] = { 10, 11 },
                             [143] = { 10, 11 }, [152] = { 10, 11 }, [153] = { 10, 11 }, [154] = { 10, 11 },
                             [191] = { 10, 11 }, [192] = { 10, 11 }, [193] = { 10, 11 }, [205] = { 10, 11 },
                             [206] = { 10, 11 }, [219] = { 10, 11 }, [220] = { 10, 11 }, [232] = { 10, 11 },
                             [233] = { 10, 11 }, [268] = { 10, 11 }, [269] = { 10, 11 }, [281] = { 10, 11 },
                             [282] = { 10, 11 }, [283] = { 10, 11 }, [293] = { 10, 11 }, [294] = { 10, 11 },
                             [295] = { 10, 11 }, [328] = { 10, 11 }, [329] = { 10, 11 }, [330] = { 10, 11 },
                             [340] = { 10, 11 }, [341] = { 10, 11 }, [342] = { 10, 11 }, [352] = { 10, 11 },
                             [353] = { 10, 11 }, [354] = { 10, 11 }, [376] = { 10, 11 }, [377] = { 10, 11 },
                             [392] = { 10, 11 }, [393] = { 10, 11 }, [394] = { 10, 11 }, [403] = { 10, 11 },
                             [404] = { 10, 11 }, [414] = { 10, 11 }, [415] = { 10, 11 } },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 834 },  -- ball of saruta cotton
                { rate = 100, item = 4368 },  -- two-leaf mandragora bud
                { rate = 50, item = 934 },  -- pinch of yuhtunga sulfur
                { rate = 5, item = 4369 },  -- four-leaf mandragora bud
            },
        },
        {
            name   = 'Strolling Sapling',
            ids    = { 9, 10, 11, 12, 13, 21, 22, 23, 24, 32, 33, 34, 35, 53, 54, 55, 66, 67, 68, 86, 96, 109, 133,
                       134, 144, 145, 146, 155, 156, 194, 195, 196, 207, 208, 221, 222, 234, 235, 270, 271, 284,
                       285, 286, 296, 297, 298, 331, 332, 333, 343, 344, 345, 355, 356, 357, 378, 379, 395, 396,
                       397, 405, 406, 416, 417 },
            levels = {
                [7] = { acc = 30, eva = 27, agi = 13, int = 9, mnd = 9, chr = 9 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 11, mnd = 11, chr = 11 },
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [9] = { 7, 8 }, [10] = { 7, 8 }, [11] = { 7, 8 }, [12] = { 7, 8 }, [13] = { 7, 8 },
                             [21] = { 7, 8 }, [22] = { 7, 8 }, [23] = { 7, 8 }, [24] = { 7, 8 }, [32] = { 7, 8 },
                             [33] = { 7, 8 }, [34] = { 7, 8 }, [35] = { 7, 8 }, [53] = { 9, 10 }, [54] = { 9, 10 },
                             [55] = { 9, 10 }, [66] = { 9, 10 }, [67] = { 9, 10 }, [68] = { 9, 10 },
                             [86] = { 9, 10 }, [96] = { 9, 10 }, [109] = { 9, 10 }, [133] = { 9, 10 },
                             [134] = { 9, 10 }, [144] = { 9, 10 }, [145] = { 9, 10 }, [146] = { 9, 10 },
                             [155] = { 9, 10 }, [156] = { 9, 10 }, [194] = { 9, 10 }, [195] = { 9, 10 },
                             [196] = { 9, 10 }, [207] = { 9, 10 }, [208] = { 9, 10 }, [221] = { 9, 10 },
                             [222] = { 9, 10 }, [234] = { 10, 11 }, [235] = { 10, 11 }, [270] = { 9, 10 },
                             [271] = { 9, 10 }, [284] = { 9, 10 }, [285] = { 9, 10 }, [286] = { 9, 10 },
                             [296] = { 9, 10 }, [297] = { 9, 10 }, [298] = { 9, 10 }, [331] = { 9, 10 },
                             [332] = { 9, 10 }, [333] = { 9, 10 }, [343] = { 9, 10 }, [344] = { 9, 10 },
                             [345] = { 9, 10 }, [355] = { 9, 10 }, [356] = { 9, 10 }, [357] = { 9, 10 },
                             [378] = { 10, 11 }, [379] = { 10, 11 }, [395] = { 10, 11 }, [396] = { 10, 11 },
                             [397] = { 10, 11 }, [405] = { 10, 11 }, [406] = { 10, 11 }, [416] = { 10, 11 },
                             [417] = { 10, 11 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 100, item = 572 },  -- bag of herb seeds
                { rate = 50, item = 575 },  -- bag of grain seeds
            },
        },
        {
            name   = 'Akbaba TC',
            ids    = { 36, 37, 38, 39, 256, 257, 258, 259, 260, 310, 311, 312, 313, 314, 315, 434, 435, 436, 437,
                       438, 439 },
            levels = {
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [36] = { 11, 12 }, [37] = { 11, 12 }, [38] = { 11, 12 }, [39] = { 11, 12 },
                             [256] = { 11, 12 }, [257] = { 11, 12 }, [258] = { 11, 12 }, [259] = { 11, 12 },
                             [260] = { 11, 12 }, [310] = { 12, 13 }, [311] = { 12, 13 }, [312] = { 12, 13 },
                             [313] = { 12, 13 }, [314] = { 12, 13 }, [315] = { 12, 13 }, [434] = { 12, 13 },
                             [435] = { 12, 13 }, [436] = { 12, 13 }, [437] = { 12, 13 }, [438] = { 12, 13 },
                             [439] = { 12, 13 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
            links  = 2,
        },
        {
            name   = 'Skeleton Warrior',
            ids    = { 40, 41, 80, 124, 164, 253, 261, 262, 307, 316, 317, 368, 431, 440, 441 },
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
            ids    = { 42, 81, 125, 165, 254, 263, 308, 318, 369, 432, 442, 443 },
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
            name   = 'Ghost',
            ids    = { 43, 44, 264, 265, 319, 320, 321, 444, 445, 449 },
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
            name   = 'Killer Bee',
            ids    = { 56, 57, 58, 69, 70, 71, 87, 88, 97, 98, 110, 111, 135, 136, 147, 148, 157, 158, 167, 168,
                       169, 170, 171, 178, 179, 180, 181, 182, 197, 198, 199, 209, 210, 223, 236, 237, 272, 273,
                       287, 288, 289, 299, 300, 301, 334, 335, 336, 346, 347, 348, 358, 359, 360, 380, 381, 398,
                       399, 400, 407, 418 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [56] = { 10, 11 }, [57] = { 10, 11 }, [58] = { 10, 11 }, [69] = { 10, 11 },
                             [70] = { 10, 11 }, [71] = { 10, 11 }, [87] = { 10, 11 }, [88] = { 10, 11 },
                             [97] = { 10, 11 }, [98] = { 10, 11 }, [110] = { 10, 11 }, [111] = { 10, 11 },
                             [135] = { 10, 11 }, [136] = { 10, 11 }, [147] = { 10, 11 }, [148] = { 10, 11 },
                             [157] = { 10, 11 }, [158] = { 10, 11 }, [167] = { 11, 12 }, [168] = { 11, 12 },
                             [169] = { 11, 12 }, [170] = { 11, 12 }, [171] = { 11, 12 }, [178] = { 11, 12 },
                             [179] = { 11, 12 }, [180] = { 11, 12 }, [181] = { 11, 12 }, [182] = { 11, 12 },
                             [197] = { 10, 11 }, [198] = { 10, 11 }, [199] = { 10, 11 }, [209] = { 10, 11 },
                             [210] = { 10, 11 }, [223] = { 10, 11 }, [236] = { 11, 12 }, [237] = { 11, 12 },
                             [272] = { 10, 11 }, [273] = { 10, 11 }, [287] = { 10, 11 }, [288] = { 10, 11 },
                             [289] = { 10, 11 }, [299] = { 10, 11 }, [300] = { 10, 11 }, [301] = { 10, 11 },
                             [334] = { 10, 11 }, [335] = { 10, 11 }, [336] = { 10, 11 }, [346] = { 10, 11 },
                             [347] = { 10, 11 }, [348] = { 10, 11 }, [358] = { 10, 11 }, [359] = { 10, 11 },
                             [360] = { 10, 11 }, [380] = { 11, 12 }, [381] = { 11, 12 }, [398] = { 11, 12 },
                             [399] = { 11, 12 }, [400] = { 11, 12 }, [407] = { 11, 12 }, [418] = { 11, 12 } },
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
            name   = 'Canyon Crawler',
            ids    = { 72, 73, 74, 103, 104, 105, 137, 138, 200, 201, 202, 215, 216, 228, 229, 244, 245, 386, 387 },
            levels = {
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 16, int = 13, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            links  = 3,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 75, 159, 302 },
            levels = {
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
                [9] = { acc = 39, eva = 38, agi = 16, int = 14, mnd = 9, chr = 9 },
            },
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
            links  = 4,
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 76, 160, 172, 173, 183, 184, 303 },
            levels = {
                [12] = { acc = 56, eva = 41, agi = 20, int = 13, mnd = 13, chr = 13 },
                [13] = { acc = 60, eva = 44, agi = 21, int = 14, mnd = 15, chr = 14 },
                [14] = { acc = 63, eva = 47, agi = 22, int = 14, mnd = 15, chr = 14 },
            },
            spawn_levels = { [76] = { 12, 13 }, [160] = { 12, 13 }, [172] = { 13, 14 }, [173] = { 13, 14 },
                             [183] = { 13, 14 }, [184] = { 13, 14 }, [303] = { 12, 13 } },
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
            links  = 4,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 77, 161, 304 },
            levels = {
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
                [9] = { acc = 36, eva = 31, agi = 13, int = 14, mnd = 14, chr = 11 },
            },
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
            links  = 4,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 78, 162, 174, 185, 186, 305 },
            levels = {
                [12] = { acc = 48, eva = 42, agi = 15, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 17, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 49, agi = 17, int = 18, mnd = 12, chr = 12 },
            },
            spawn_levels = { [78] = { 12, 13 }, [162] = { 12, 13 }, [174] = { 13, 14 }, [185] = { 13, 14 },
                             [186] = { 13, 14 }, [305] = { 12, 13 } },
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
            links  = 4,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 79, 163, 175, 176, 187, 306 },
            levels = {
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [79] = { 12, 13 }, [163] = { 12, 13 }, [175] = { 13, 14 }, [176] = { 13, 14 },
                             [187] = { 13, 14 }, [306] = { 12, 13 } },
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
            links  = 4,
        },
        {
            name   = 'Air Elemental',
            ids    = { 82, 166, 309, 323 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 23, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 25, mnd = 19, chr = 19 },
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
            name   = 'Wild Dhalmel',
            ids    = { 89, 90, 91, 99, 100, 101, 112, 113, 114, 211, 212, 213, 224, 225, 226, 238, 239, 240, 241,
                       274, 275, 276, 382, 383, 384, 408, 409, 410, 419, 420, 421 },
            levels = {
                [14] = { acc = 54, eva = 49, agi = 17, int = 13, mnd = 13, chr = 14 },
                [15] = { acc = 57, eva = 53, agi = 18, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 56, agi = 19, int = 14, mnd = 14, chr = 16 },
            },
            spawn_levels = { [89] = { 14, 15 }, [90] = { 14, 15 }, [91] = { 14, 15 }, [99] = { 14, 15 },
                             [100] = { 14, 15 }, [101] = { 14, 15 }, [112] = { 14, 15 }, [113] = { 14, 15 },
                             [114] = { 14, 15 }, [211] = { 14, 15 }, [212] = { 14, 15 }, [213] = { 14, 15 },
                             [224] = { 14, 15 }, [225] = { 14, 15 }, [226] = { 14, 15 }, [238] = { 15, 16 },
                             [239] = { 15, 16 }, [240] = { 15, 16 }, [241] = { 15, 16 }, [274] = { 14, 15 },
                             [275] = { 14, 15 }, [276] = { 14, 15 }, [382] = { 14, 15 }, [383] = { 14, 15 },
                             [384] = { 14, 15 }, [408] = { 15, 16 }, [409] = { 15, 16 }, [410] = { 15, 16 },
                             [419] = { 15, 16 }, [420] = { 15, 16 }, [421] = { 15, 16 } },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 100, item = 857 },  -- dhalmel hide
                { rate = 100, item = 893 },  -- giant femur
                { rate = 50, item = 857 },  -- dhalmel hide
                { rate = 50, item = 857 },  -- dhalmel hide
                { rate = 50, item = 938 },  -- sprig of papaka grass
            },
            links  = 5,
        },
        {
            name   = 'Barghest',
            ids    = { 92, 102, 116, 214, 227, 243, 277, 385, 411, 422 },
            levels = {
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 11, mnd = 10, chr = 13 },
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 15 },
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
            name   = 'Serpopard Ishtar',
            ids    = { 115, 242 },
            nm     = true,
            levels = {
                [19] = { acc = 71, eva = 65, agi = 21, int = 16, mnd = 16, chr = 18 },
                [20] = { acc = 74, eva = 68, agi = 21, int = 16, mnd = 16, chr = 18 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 893 },  -- giant femur
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 100, item = 857 },  -- dhalmel hide
                { rate = 100, item = 857 },  -- dhalmel hide
                { rate = 100, item = 857 },  -- dhalmel hide
                { rate = 150, item = 13086 },  -- cerulean pendant
                { rate = 100, item = 938 },  -- sprig of papaka grass
            },
            links  = 5,
        },
        {
            name   = 'Yagudo Initiate',
            ids    = { 117, 246, 361 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 10, int = 9, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 12, int = 9, mnd = 11, chr = 13 },
            },
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
            links  = 6,
        },
        {
            name   = 'Yagudo Mendicant',
            ids    = { 118, 247, 362, 423, 425 },
            levels = {
                [13] = { acc = 49, eva = 42, agi = 16, int = 18, mnd = 17, chr = 19 },
                [14] = { acc = 53, eva = 44, agi = 17, int = 18, mnd = 17, chr = 20 },
                [15] = { acc = 56, eva = 47, agi = 17, int = 19, mnd = 19, chr = 21 },
            },
            spawn_levels = { [118] = { 13, 14 }, [247] = { 13, 14 }, [362] = { 13, 14 }, [423] = { 14, 15 },
                             [425] = { 14, 15 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, item = 750 },  -- silver beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudos Elemental',
            ids    = { 119, 248, 363, 424, 426 },
            levels = {
                [8] = { acc = 33, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
                [9] = { acc = 37, eva = 31, agi = 14, int = 16, mnd = 11, chr = 11 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Yagudo Acolyte',
            ids    = { 120, 249, 364 },
            levels = {
                [8] = { acc = 32, eva = 27, agi = 12, int = 11, mnd = 15, chr = 14 },
                [9] = { acc = 36, eva = 30, agi = 13, int = 11, mnd = 16, chr = 16 },
            },
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
            links  = 6,
        },
        {
            name   = 'Yagudo Scribe',
            ids    = { 121, 250, 365 },
            levels = {
                [8] = { acc = 34, eva = 28, agi = 14, int = 15, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 32, agi = 16, int = 16, mnd = 11, chr = 13 },
            },
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
            links  = 6,
        },
        {
            name   = 'Yagudo Piper',
            ids    = { 122, 251, 366, 427, 429 },
            levels = {
                [13] = { acc = 50, eva = 43, agi = 14, int = 15, mnd = 14, chr = 19 },
                [14] = { acc = 53, eva = 46, agi = 15, int = 15, mnd = 14, chr = 20 },
                [15] = { acc = 56, eva = 48, agi = 15, int = 15, mnd = 15, chr = 21 },
            },
            spawn_levels = { [122] = { 13, 14 }, [251] = { 13, 14 }, [366] = { 13, 14 }, [427] = { 14, 15 },
                             [429] = { 14, 15 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 10 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, item = 750 },  -- silver beastcoin
                { rate = 50, item = 5071 },  -- scroll of foe lullaby
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Persecutor',
            ids    = { 123, 252, 367, 428, 430 },
            levels = {
                [13] = { acc = 51, eva = 47, agi = 16, int = 14, mnd = 13, chr = 16 },
                [14] = { acc = 55, eva = 50, agi = 17, int = 14, mnd = 13, chr = 17 },
                [15] = { acc = 58, eva = 53, agi = 17, int = 15, mnd = 15, chr = 17 },
            },
            spawn_levels = { [123] = { 13, 14 }, [252] = { 13, 14 }, [367] = { 13, 14 }, [428] = { 14, 15 },
                             [430] = { 14, 15 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { blind = 10 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, item = 750 },  -- silver beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Earth Elemental',
            ids    = { 126, 255, 324, 433 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 23, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 25, mnd = 19, chr = 19 },
                [20] = { acc = 73, eva = 65, agi = 21, int = 25, mnd = 19, chr = 19 },
            },
            spawn_levels = { [126] = { 18, 19 }, [255] = { 18, 19 }, [324] = { 18, 19 } },
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
            name   = 'Grenade',
            ids    = { 177, 188, 322, 370, 448 },
            levels = {
                [15] = { acc = 58, eva = 53, agi = 18, int = 13, mnd = 13, chr = 17 },
                [16] = { acc = 62, eva = 57, agi = 20, int = 13, mnd = 14, chr = 18 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 14, mnd = 15, chr = 18 },
            },
            spawn_levels = { [322] = { 15, 16 }, [370] = { 15, 16 } },
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
            name   = 'Poltergeist',
            ids    = { 371, 372, 373 },
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
            ids    = { 450 },
            levels = {
                [12] = { acc = 49, eva = 58, agi = 18, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 53, eva = 61, agi = 19, int = 17, mnd = 12, chr = 12 },
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
            links  = 7,
        },
        {
            name   = 'Yara Ma Yha Who',
            ids    = { 452 },
            nm     = true,
            levels = {
                [14] = { acc = 54, eva = 50, agi = 18, int = 13, mnd = 13, chr = 13 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 15546 },  -- fasting ring
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 10, item = 572 },  -- bag of herb seeds
                { rate = 50, item = 573 },  -- bag of vegetable seeds
                { rate = 150, item = 575 },  -- bag of grain seeds
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Smierc',
            ids    = { 473 },
            nm     = true,
            levels = {
                [92] = { acc = 425, eva = 362, agi = 94, int = 109, mnd = 75, chr = 85 },
                [93] = { acc = 432, eva = 366, agi = 95, int = 111, mnd = 75, chr = 87 },
                [94] = { acc = 440, eva = 372, agi = 96, int = 111, mnd = 75, chr = 87 },
                [95] = { acc = 447, eva = 376, agi = 96, int = 113, mnd = 77, chr = 87 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
