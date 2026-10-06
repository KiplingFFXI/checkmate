-- East Sarutabaruta (zone 116).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Crawler', 'Prickly Pitriv', 'Spiny Spipi' },
        [2] = { 'Yagudo Acolyte', 'Yagudo Centurion', 'Yagudo Initiate', 'Yagudo Scribe', 'Yagudo Underling',
                'Yagudo Vicar' },
        [3] = { 'Sharp-Eared Ropipi' },
        [4] = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' },
        [5] = { 'Crawler', 'Prickly Pitriv' },
        [6] = { 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' },
        [7] = { 'Yagudo Acolyte', 'Yagudo Centurion', 'Yagudo Initiate', 'Yagudo Scribe', 'Yagudo Underling' },
        [8] = { 'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Scribe', 'Yagudo Underling', 'Yagudo Vicar' },
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
            name   = 'Mud Pugil',
            ids    = { 3 },
            levels = {
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
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
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
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
            name   = 'Tiny Mandragora',
            ids    = { 6, 7, 8, 9, 10, 17, 18, 19, 20 },
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
            ids    = { 11, 12, 13, 14, 21, 22, 23, 24 },
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
            ids    = { 15, 16, 25, 26, 29, 30, 31, 32, 33, 34, 42, 43, 44, 45, 46, 47, 55, 56, 57, 58, 59, 60, 72,
                       73, 74, 75, 76, 77, 88, 89, 90, 91, 92, 93, 104, 105, 106, 107, 108, 109, 119, 120, 121, 122,
                       123, 124, 135, 136, 154, 155, 189, 190, 207, 208, 245, 246, 247, 255, 256, 257, 314, 315,
                       316, 332, 333, 334, 365, 366, 387, 388, 399, 400, 420, 421, 434, 435, 449, 450 },
            levels = {
                [2] = { acc = 14, eva = 11, agi = 9, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [15] = { 2, 3 }, [16] = { 2, 3 }, [25] = { 2, 3 }, [26] = { 2, 3 }, [29] = { 2, 3 },
                             [30] = { 2, 3 }, [31] = { 2, 3 }, [32] = { 2, 3 }, [33] = { 2, 3 }, [34] = { 2, 3 },
                             [42] = { 2, 3 }, [43] = { 2, 3 }, [44] = { 2, 3 }, [45] = { 2, 3 }, [46] = { 2, 3 },
                             [47] = { 2, 3 }, [55] = { 2, 3 }, [56] = { 2, 3 }, [57] = { 2, 3 }, [58] = { 2, 3 },
                             [59] = { 2, 3 }, [60] = { 2, 3 }, [72] = { 2, 3 }, [73] = { 2, 3 }, [74] = { 2, 3 },
                             [75] = { 2, 3 }, [76] = { 2, 3 }, [77] = { 2, 3 }, [88] = { 2, 3 }, [89] = { 2, 3 },
                             [90] = { 2, 3 }, [91] = { 2, 3 }, [92] = { 2, 3 }, [93] = { 2, 3 }, [104] = { 2, 3 },
                             [105] = { 2, 3 }, [106] = { 2, 3 }, [107] = { 2, 3 }, [108] = { 2, 3 },
                             [109] = { 2, 3 }, [119] = { 2, 3 }, [120] = { 2, 3 }, [121] = { 2, 3 },
                             [122] = { 2, 3 }, [123] = { 2, 3 }, [124] = { 2, 3 }, [135] = { 2, 3 },
                             [136] = { 2, 3 }, [154] = { 2, 3 }, [155] = { 2, 3 }, [189] = { 4, 5 },
                             [190] = { 4, 5 }, [207] = { 4, 5 }, [208] = { 4, 5 }, [245] = { 4, 5 },
                             [246] = { 4, 5 }, [247] = { 4, 5 }, [255] = { 4, 5 }, [256] = { 4, 5 },
                             [257] = { 4, 5 }, [314] = { 5, 6 }, [315] = { 5, 6 }, [316] = { 5, 6 },
                             [332] = { 4, 5 }, [333] = { 4, 5 }, [334] = { 4, 5 }, [365] = { 4, 5 },
                             [366] = { 4, 5 }, [387] = { 4, 5 }, [388] = { 4, 5 }, [399] = { 4, 5 },
                             [400] = { 4, 5 }, [420] = { 4, 5 }, [421] = { 4, 5 }, [434] = { 4, 5 },
                             [435] = { 4, 5 }, [449] = { 4, 5 }, [450] = { 4, 5 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 585 },  -- muddy bar tab
            },
        },
        {
            name   = 'Crawler',
            ids    = { 27, 28, 40, 41, 53, 54, 69, 70, 71, 86, 87, 102, 103, 116, 117, 118, 133, 134, 152, 153, 187,
                       188, 205, 206, 280, 281, 282, 302, 303, 304, 363, 364, 381, 382, 396, 397, 398, 416, 417,
                       418, 419, 432, 433, 447, 448 },
            levels = {
                [4] = { acc = 20, eva = 18, agi = 10, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [27] = { 4, 5 }, [28] = { 4, 5 }, [40] = { 4, 5 }, [41] = { 4, 5 }, [53] = { 4, 5 },
                             [54] = { 4, 5 }, [69] = { 4, 5 }, [70] = { 4, 5 }, [71] = { 4, 5 }, [86] = { 4, 5 },
                             [87] = { 4, 5 }, [102] = { 4, 5 }, [103] = { 4, 5 }, [116] = { 4, 5 },
                             [117] = { 4, 5 }, [118] = { 4, 5 }, [133] = { 4, 5 }, [134] = { 4, 5 },
                             [152] = { 4, 5 }, [153] = { 4, 5 }, [187] = { 4, 5 }, [188] = { 5, 6 },
                             [205] = { 5, 6 }, [206] = { 5, 6 }, [280] = { 5, 6 }, [281] = { 5, 6 },
                             [282] = { 5, 6 }, [302] = { 5, 6 }, [303] = { 5, 6 }, [304] = { 5, 6 },
                             [363] = { 5, 6 }, [364] = { 5, 6 }, [381] = { 5, 6 }, [382] = { 5, 6 },
                             [396] = { 5, 6 }, [397] = { 5, 6 }, [398] = { 5, 6 }, [416] = { 5, 6 },
                             [417] = { 5, 6 }, [418] = { 5, 6 }, [419] = { 5, 6 }, [432] = { 5, 6 },
                             [433] = { 5, 6 }, [447] = { 5, 6 }, [448] = { 5, 6 } },
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
            ids    = { 35, 36, 37, 48, 49, 50, 61, 62, 63, 78, 79, 80, 94, 95, 96, 110, 111, 112, 125, 126, 127,
                       138, 139, 140, 141, 142, 157, 158, 159, 160, 161, 383, 384, 385, 386, 401, 402, 403, 404,
                       422, 423 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [35] = { 3, 4 }, [36] = { 3, 4 }, [37] = { 3, 4 }, [48] = { 3, 4 }, [49] = { 3, 4 },
                             [50] = { 3, 4 }, [61] = { 3, 4 }, [62] = { 3, 4 }, [63] = { 3, 4 }, [78] = { 3, 4 },
                             [79] = { 3, 4 }, [80] = { 3, 4 }, [94] = { 3, 4 }, [95] = { 3, 4 }, [96] = { 3, 4 },
                             [110] = { 3, 4 }, [111] = { 3, 4 }, [112] = { 3, 4 }, [125] = { 3, 4 },
                             [126] = { 3, 4 }, [127] = { 3, 4 }, [138] = { 3, 4 }, [139] = { 3, 4 },
                             [140] = { 3, 4 }, [141] = { 3, 4 }, [142] = { 3, 4 }, [157] = { 3, 4 },
                             [158] = { 3, 4 }, [159] = { 3, 4 }, [160] = { 3, 4 }, [161] = { 3, 4 },
                             [383] = { 4, 5 }, [384] = { 4, 5 }, [385] = { 4, 5 }, [386] = { 4, 5 },
                             [401] = { 4, 5 }, [402] = { 4, 5 }, [403] = { 4, 5 }, [404] = { 4, 5 },
                             [422] = { 4, 5 }, [423] = { 4, 5 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
            },
        },
        {
            name   = 'Yagudo Initiate',
            ids    = { 38, 39, 51, 52, 64, 81, 97, 113, 128, 191, 209, 210, 216, 389, 405, 406, 413, 436, 451 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 7, int = 6, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 17, agi = 8, int = 7, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 20, agi = 9, int = 7, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 24, agi = 10, int = 8, mnd = 9, chr = 11 },
            },
            spawn_levels = { [38] = { 3, 4 }, [39] = { 3, 4 }, [51] = { 3, 4 }, [52] = { 3, 4 }, [64] = { 3, 4 },
                             [81] = { 3, 4 }, [97] = { 3, 4 }, [113] = { 3, 4 }, [128] = { 3, 4 }, [191] = { 5, 6 },
                             [209] = { 5, 6 }, [210] = { 5, 6 }, [216] = { 5, 6 }, [389] = { 5, 6 },
                             [405] = { 5, 6 }, [406] = { 5, 6 }, [413] = { 5, 6 }, [436] = { 5, 6 },
                             [451] = { 5, 6 } },
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
            links  = 2,
        },
        {
            name   = 'Yagudo Acolyte',
            ids    = { 65, 82, 98, 114, 129, 192, 211, 217, 226, 390, 407, 414, 437, 452 },
            levels = {
                [3] = { acc = 15, eva = 13, agi = 8, int = 7, mnd = 11, chr = 10 },
                [4] = { acc = 19, eva = 15, agi = 9, int = 8, mnd = 11, chr = 12 },
                [5] = { acc = 22, eva = 19, agi = 10, int = 9, mnd = 13, chr = 12 },
                [6] = { acc = 26, eva = 21, agi = 11, int = 9, mnd = 13, chr = 14 },
            },
            spawn_levels = { [65] = { 3, 4 }, [82] = { 3, 4 }, [98] = { 3, 4 }, [114] = { 3, 4 }, [129] = { 3, 4 },
                             [192] = { 5, 6 }, [211] = { 5, 6 }, [217] = { 5, 6 }, [226] = { 5, 6 },
                             [390] = { 5, 6 }, [407] = { 5, 6 }, [414] = { 5, 6 }, [437] = { 5, 6 },
                             [452] = { 5, 6 } },
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
            links  = 2,
        },
        {
            name   = 'Yagudo Scribe',
            ids    = { 66, 83, 99, 115, 130, 193, 212, 218, 227, 391, 408, 415, 438, 453 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 10, int = 11, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 17, agi = 12, int = 12, mnd = 7, chr = 10 },
                [5] = { acc = 24, eva = 20, agi = 12, int = 13, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 23, agi = 14, int = 13, mnd = 9, chr = 11 },
            },
            spawn_levels = { [66] = { 3, 4 }, [83] = { 3, 4 }, [99] = { 3, 4 }, [115] = { 3, 4 }, [130] = { 3, 4 },
                             [193] = { 5, 6 }, [212] = { 5, 6 }, [218] = { 5, 6 }, [227] = { 5, 6 },
                             [391] = { 5, 6 }, [408] = { 5, 6 }, [415] = { 5, 6 }, [438] = { 5, 6 },
                             [453] = { 5, 6 } },
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
            links  = 2,
        },
        {
            name   = 'Mad Fox',
            ids    = { 67, 84, 100, 131, 165, 194, 213, 409, 439, 454 },
            levels = {
                [3] = { acc = 16, eva = 14, agi = 9, int = 6, mnd = 6, chr = 8 },
                [4] = { acc = 20, eva = 18, agi = 11, int = 7, mnd = 6, chr = 9 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 8, mnd = 8, chr = 10 },
                [6] = { acc = 27, eva = 25, agi = 12, int = 8, mnd = 8, chr = 11 },
                [7] = { acc = 30, eva = 27, agi = 13, int = 9, mnd = 8, chr = 11 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
            },
            spawn_levels = { [67] = { 3, 5 }, [84] = { 3, 5 }, [100] = { 3, 5 }, [131] = { 3, 5 }, [165] = { 3, 4 },
                             [194] = { 6, 8 }, [213] = { 6, 8 }, [409] = { 6, 8 }, [439] = { 6, 8 },
                             [454] = { 6, 8 } },
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
            ids    = { 68, 85, 101, 195, 214, 308, 392, 410, 440, 455 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 6, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [68] = { 3, 5 }, [85] = { 3, 5 }, [101] = { 3, 5 }, [195] = { 6, 8 }, [214] = { 6, 8 },
                             [308] = { 6, 8 }, [392] = { 6, 8 }, [410] = { 6, 8 }, [440] = { 6, 8 },
                             [455] = { 6, 8 } },
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
            name   = 'Magicked Bones blm',
            ids    = { 132, 147, 148, 166, 287, 288, 393, 411, 456 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 9, int = 11, mnd = 7, chr = 7 },
                [4] = { acc = 21, eva = 16, agi = 11, int = 12, mnd = 7, chr = 9 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 15, mnd = 9, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            spawn_levels = { [132] = { 3, 5 }, [147] = { 3, 5 }, [148] = { 3, 5 }, [166] = { 3, 5 },
                             [287] = { 6, 8 }, [288] = { 6, 8 }, [393] = { 6, 8 }, [411] = { 6, 8 },
                             [456] = { 6, 8 } },
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
            name   = 'Sharp-Eared Ropipi',
            ids    = { 137, 156 },
            nm     = true,
            levels = {
                [10] = { acc = 42, eva = 51, agi = 16, int = 15, mnd = 10, chr = 10 },
                [11] = { acc = 46, eva = 54, agi = 16, int = 16, mnd = 11, chr = 11 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 15218 },  -- entrancing ribbon
            },
            links  = 3,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 143, 144, 149, 150, 162, 163, 283, 284, 289, 290, 306, 424 },
            levels = {
                [3] = { acc = 18, eva = 17, agi = 10, int = 9, mnd = 6, chr = 6 },
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
            },
            spawn_levels = { [143] = { 3, 4 }, [144] = { 3, 4 }, [149] = { 3, 4 }, [150] = { 3, 4 },
                             [162] = { 3, 4 }, [163] = { 3, 4 }, [283] = { 5, 6 }, [284] = { 5, 6 },
                             [289] = { 5, 6 }, [290] = { 5, 6 }, [306] = { 5, 6 }, [424] = { 5, 6 } },
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
            name   = 'Goblin Weaver',
            ids    = { 145, 146, 151, 164, 285, 286, 291, 307, 320, 338, 368, 425, 426 },
            levels = {
                [3] = { acc = 16, eva = 13, agi = 8, int = 9, mnd = 9, chr = 7 },
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
            },
            spawn_levels = { [145] = { 3, 4 }, [146] = { 3, 4 }, [151] = { 3, 4 }, [164] = { 3, 4 },
                             [285] = { 5, 6 }, [286] = { 5, 6 }, [291] = { 5, 6 }, [307] = { 5, 6 },
                             [320] = { 5, 6 }, [338] = { 5, 6 }, [368] = { 5, 6 }, [425] = { 5, 6 },
                             [426] = { 5, 6 } },
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
            name   = 'River Crab',
            ids    = { 167, 168, 169, 170, 171, 228, 230, 231, 232, 233, 238, 260, 261, 262, 266, 267, 322, 323,
                       324, 339, 340, 341, 342, 347, 349, 351, 352, 353, 354, 369, 370, 374, 376 },
            levels = {
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 11 },
                [5] = { acc = 22, eva = 19, agi = 7, int = 7, mnd = 11, chr = 11 },
                [6] = { acc = 25, eva = 23, agi = 8, int = 8, mnd = 12, chr = 12 },
            },
            spawn_levels = { [167] = { 3, 4 }, [168] = { 3, 4 }, [169] = { 3, 4 }, [170] = { 3, 4 },
                             [171] = { 3, 4 }, [228] = { 3, 4 }, [230] = { 3, 4 }, [231] = { 3, 4 },
                             [232] = { 3, 4 }, [233] = { 3, 4 }, [238] = { 3, 4 }, [260] = { 3, 4 },
                             [261] = { 3, 4 }, [262] = { 3, 4 }, [266] = { 3, 4 }, [267] = { 3, 4 },
                             [322] = { 4, 5 }, [323] = { 4, 5 }, [324] = { 4, 5 }, [339] = { 4, 5 },
                             [340] = { 4, 5 }, [341] = { 4, 5 }, [342] = { 4, 5 }, [347] = { 4, 5 },
                             [349] = { 4, 5 }, [351] = { 4, 5 }, [352] = { 4, 5 }, [353] = { 4, 5 },
                             [354] = { 4, 5 }, [369] = { 5, 6 }, [370] = { 5, 6 }, [374] = { 5, 6 },
                             [376] = { 5, 6 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 1016 },  -- remi shell
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Pug Pugil',
            ids    = { 172, 173, 174, 175, 176, 229, 234, 235, 236, 237, 239, 263, 264, 265, 268, 269, 325, 326,
                       327, 343, 344, 345, 346, 348, 350, 355, 356, 357, 358, 371, 372, 375, 377 },
            levels = {
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 9 },
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
            },
            spawn_levels = { [172] = { 5, 6 }, [173] = { 5, 6 }, [174] = { 5, 6 }, [175] = { 5, 6 },
                             [176] = { 5, 6 }, [229] = { 5, 6 }, [234] = { 5, 6 }, [235] = { 5, 6 },
                             [236] = { 5, 6 }, [237] = { 5, 6 }, [239] = { 5, 6 }, [263] = { 5, 6 },
                             [264] = { 5, 6 }, [265] = { 5, 5 }, [268] = { 5, 6 }, [269] = { 5, 6 },
                             [325] = { 6, 7 }, [326] = { 6, 7 }, [327] = { 6, 7 }, [343] = { 6, 7 },
                             [344] = { 6, 7 }, [345] = { 6, 7 }, [346] = { 6, 7 }, [348] = { 6, 7 },
                             [350] = { 6, 7 }, [355] = { 6, 7 }, [356] = { 6, 7 }, [357] = { 6, 7 },
                             [358] = { 6, 7 }, [371] = { 7, 8 }, [372] = { 7, 8 }, [375] = { 7, 8 },
                             [377] = { 7, 8 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Mandragora',
            ids    = { 177, 178, 179, 180, 197, 198, 199, 219, 220, 221, 240, 241, 242, 243, 244, 250, 251, 252,
                       253, 254, 270, 271, 272, 273, 274, 292, 293, 294, 295, 296, 310, 311, 312, 313, 328, 329,
                       330, 331, 359, 360, 361, 362, 378, 379, 380, 394, 395, 427, 428, 442, 443 },
            levels = {
                [4] = { acc = 21, eva = 16, agi = 7, int = 7, mnd = 9, chr = 8 },
                [5] = { acc = 24, eva = 20, agi = 8, int = 7, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 23, agi = 8, int = 8, mnd = 9, chr = 9 },
            },
            spawn_levels = { [177] = { 4, 5 }, [178] = { 4, 5 }, [179] = { 4, 5 }, [180] = { 4, 5 },
                             [197] = { 4, 5 }, [198] = { 4, 5 }, [199] = { 4, 5 }, [219] = { 4, 5 },
                             [220] = { 4, 5 }, [221] = { 4, 5 }, [240] = { 4, 5 }, [241] = { 4, 5 },
                             [242] = { 4, 5 }, [243] = { 4, 5 }, [244] = { 4, 5 }, [250] = { 4, 5 },
                             [251] = { 4, 5 }, [252] = { 4, 5 }, [253] = { 4, 5 }, [254] = { 4, 5 },
                             [270] = { 4, 5 }, [271] = { 4, 5 }, [272] = { 4, 5 }, [273] = { 4, 5 },
                             [274] = { 4, 5 }, [292] = { 4, 5 }, [293] = { 4, 5 }, [294] = { 4, 5 },
                             [295] = { 4, 5 }, [296] = { 4, 5 }, [310] = { 5, 6 }, [311] = { 5, 6 },
                             [312] = { 5, 6 }, [313] = { 5, 6 }, [328] = { 4, 5 }, [329] = { 4, 5 },
                             [330] = { 4, 5 }, [331] = { 4, 5 }, [359] = { 4, 5 }, [360] = { 4, 5 },
                             [361] = { 4, 5 }, [362] = { 4, 5 }, [378] = { 4, 5 }, [379] = { 4, 5 },
                             [380] = { 4, 5 }, [394] = { 4, 5 }, [395] = { 4, 5 }, [427] = { 4, 5 },
                             [428] = { 4, 5 }, [442] = { 4, 5 }, [443] = { 4, 5 } },
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
            name   = 'Giant Bee',
            ids    = { 181, 182, 183, 184, 185, 186, 200, 201, 202, 203, 204, 222, 223, 224, 225, 275, 276, 277,
                       278, 279, 297, 298, 299, 300, 301, 429, 430, 431, 444, 445, 446 },
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
            name   = 'Balloon',
            ids    = { 196, 215, 309, 321, 412, 441 },
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
            name   = 'Goblin Fisher',
            ids    = { 248, 249, 258, 259, 317, 318, 319, 335, 336, 337, 367 },
            levels = {
                [4] = { acc = 21, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
            },
            spawn_levels = { [248] = { 4, 5 }, [249] = { 4, 5 }, [258] = { 4, 5 }, [259] = { 4, 5 },
                             [317] = { 5, 6 }, [318] = { 5, 6 }, [319] = { 5, 6 }, [335] = { 5, 6 },
                             [336] = { 5, 6 }, [337] = { 5, 6 }, [367] = { 5, 6 } },
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
            links  = 4,
        },
        {
            name   = 'Spiny Spipi',
            ids    = { 305 },
            nm     = true,
            levels = {
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 37, agi = 14, int = 11, mnd = 11, chr = 12 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, item = 816 },  -- spool of silk thread
                { rate = 150, item = 13607 },  -- mist silk cape
                { rate = 240, item = 816 },  -- spool of silk thread
                { rate = 240, item = 816 },  -- spool of silk thread
            },
            links  = 5,
        },
        {
            name   = 'Goblin Digger',
            ids    = { 457 },
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
            links  = 6,
        },
        {
            name   = 'Rw Nw Prt M Hrw',
            ids    = { 464 },
            nm     = true,
            levels = {
                [95] = { acc = 442, eva = 369, agi = 83, int = 104, mnd = 87, chr = 102 },
                [96] = { acc = 451, eva = 375, agi = 85, int = 105, mnd = 90, chr = 105 },
                [97] = { acc = 458, eva = 379, agi = 85, int = 106, mnd = 90, chr = 105 },
            },
            ranks  = { fire = -1, ice = 5, wind = 5, earth = 5, thunder = 5, water = -1, light = 7, dark = 7,
                       paralyze = 5, bind = 5, silence = 5, slow = 5, poison = -1, light_sleep = 7, dark_sleep = 7,
                       blind = 7, stun = 5, gravity = 5 },
            magic_dmg = { all = -50 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Prickly Pitriv',
            ids    = { 636, 637, 638 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 325, agi = 78, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Yagudo Vicar',
            ids    = { 639 },
            nm     = true,
            levels = {
                [139] = { acc = 486, eva = 635, agi = 132, int = 113, mnd = 136, chr = 140 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Yagudo Centurion',
            ids    = { 640 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 642, agi = 147, int = 105, mnd = 98, chr = 125 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Yagudo Underling',
            ids    = { 641, 642 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 642, agi = 147, int = 105, mnd = 98, chr = 125 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
    },
    by_name = {},
}
