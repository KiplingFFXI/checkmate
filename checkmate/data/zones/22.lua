-- Promyvion-Vahzl (zone 22).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Offspring' },
    },
    monsters = {
        {
            name   = 'Ponderer',
            ids    = { 1 },
            nm     = true,
            levels = {
                [56] = { acc = 214, eva = 198, agi = 57, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 203, agi = 57, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Propagator',
            ids    = { 2 },
            nm     = true,
            levels = {
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Offspring',
            ids    = { 3, 4 },
            levels = {
                [47] = { acc = 171, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 174, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Solicitor',
            ids    = { 5 },
            nm     = true,
            levels = {
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Wanderer',
            ids    = { 6, 7, 9, 10, 11, 12, 13, 14, 16, 17, 19, 20, 21, 23, 24, 25, 28, 29, 33, 34, 36, 37, 38, 40,
                       42, 44, 46, 47, 49, 51, 69, 72, 73, 75, 76, 81, 82, 83, 85, 88, 90, 99, 100, 124, 127, 128,
                       134, 135, 136, 138, 139, 147, 150, 154, 155, 156, 158, 203, 206, 210, 211, 218, 221, 235,
                       237, 240, 241, 243, 244, 247, 251, 254, 257, 258, 300, 303, 309, 310, 311, 315, 320, 334,
                       337, 342, 345, 347, 355, 357 },
            levels = {
                [49] = { acc = 177, eva = 163, agi = 48, int = 44, mnd = 44, chr = 45 },
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48 },
                [52] = { acc = 192, eva = 176, agi = 51, int = 46, mnd = 46, chr = 48 },
                [53] = { acc = 197, eva = 181, agi = 51, int = 48, mnd = 48, chr = 49 },
                [54] = { acc = 203, eva = 187, agi = 52, int = 48, mnd = 48, chr = 49 },
                [55] = { acc = 208, eva = 192, agi = 53, int = 48, mnd = 48, chr = 50 },
                [56] = { acc = 214, eva = 197, agi = 54, int = 50, mnd = 50, chr = 52 },
            },
            spawn_levels = { [6] = { 49, 51 }, [7] = { 49, 51 }, [9] = { 49, 51 }, [10] = { 49, 51 },
                             [11] = { 49, 51 }, [12] = { 49, 51 }, [13] = { 49, 51 }, [14] = { 49, 51 },
                             [16] = { 49, 51 }, [17] = { 49, 51 }, [19] = { 49, 51 }, [20] = { 49, 51 },
                             [21] = { 49, 51 }, [23] = { 49, 51 }, [24] = { 49, 51 }, [25] = { 49, 51 },
                             [28] = { 49, 51 }, [29] = { 49, 51 }, [33] = { 49, 51 }, [34] = { 49, 51 },
                             [36] = { 49, 51 }, [37] = { 49, 51 }, [38] = { 49, 51 }, [40] = { 49, 51 },
                             [42] = { 49, 51 }, [44] = { 49, 51 }, [46] = { 49, 51 }, [47] = { 49, 51 },
                             [49] = { 49, 51 }, [51] = { 49, 51 }, [69] = { 51, 53 }, [72] = { 51, 53 },
                             [73] = { 51, 53 }, [75] = { 51, 53 }, [76] = { 51, 53 }, [81] = { 49, 51 },
                             [82] = { 49, 51 }, [83] = { 51, 53 }, [85] = { 51, 53 }, [88] = { 51, 53 },
                             [90] = { 51, 53 }, [99] = { 51, 53 }, [100] = { 52, 54 }, [124] = { 52, 54 },
                             [127] = { 52, 54 }, [128] = { 52, 54 }, [134] = { 52, 54 }, [135] = { 52, 54 },
                             [136] = { 52, 54 }, [138] = { 52, 54 }, [139] = { 52, 54 }, [147] = { 52, 54 },
                             [150] = { 52, 54 }, [154] = { 52, 54 }, [155] = { 52, 54 }, [156] = { 52, 54 },
                             [158] = { 52, 54 }, [203] = { 52, 54 }, [206] = { 53, 55 }, [210] = { 53, 55 },
                             [211] = { 53, 55 }, [218] = { 53, 55 }, [221] = { 53, 55 }, [235] = { 53, 55 },
                             [237] = { 54, 56 }, [240] = { 54, 56 }, [241] = { 54, 56 }, [243] = { 54, 56 },
                             [244] = { 54, 56 }, [247] = { 54, 56 }, [251] = { 54, 56 }, [254] = { 54, 56 },
                             [257] = { 53, 55 }, [258] = { 53, 55 }, [300] = { 54, 56 }, [303] = { 54, 56 },
                             [309] = { 54, 56 }, [310] = { 54, 56 }, [311] = { 54, 56 }, [315] = { 54, 56 },
                             [320] = { 54, 56 }, [334] = { 54, 56 }, [337] = { 54, 56 }, [342] = { 52, 54 },
                             [345] = { 52, 54 }, [347] = { 52, 54 }, [355] = { 53, 55 }, [357] = { 53, 55 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Weeper',
            ids    = { 8, 15, 18, 22, 26, 27, 30, 31, 32, 35, 39, 41, 43, 45, 48, 50, 68, 70, 71, 77, 78, 79, 80,
                       84, 87, 91, 92, 93, 94, 95, 96, 97, 98, 125, 129, 131, 132, 140, 141, 143, 144, 145, 148,
                       149, 152, 153, 159, 160, 161, 162, 165, 204, 205, 207, 208, 212, 213, 214, 216, 219, 222,
                       223, 227, 228, 231, 232, 236, 238, 242, 245, 248, 249, 253, 256, 259, 301, 302, 304, 305,
                       307, 308, 313, 314, 317, 318, 321, 322, 324, 325, 327, 328, 333, 335, 338, 339, 341, 343,
                       344, 346, 348, 349, 350, 354, 356, 359, 360 },
            levels = {
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48 },
                [52] = { acc = 192, eva = 176, agi = 51, int = 46, mnd = 46, chr = 48 },
                [53] = { acc = 197, eva = 181, agi = 51, int = 48, mnd = 48, chr = 49 },
                [54] = { acc = 203, eva = 187, agi = 52, int = 48, mnd = 48, chr = 49 },
                [55] = { acc = 208, eva = 192, agi = 53, int = 48, mnd = 48, chr = 50 },
                [56] = { acc = 214, eva = 197, agi = 54, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 202, agi = 54, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 208, agi = 56, int = 51, mnd = 51, chr = 53 },
            },
            spawn_levels = { [8] = { 50, 51 }, [15] = { 50, 51 }, [18] = { 50, 51 }, [22] = { 50, 51 },
                             [26] = { 50, 51 }, [27] = { 50, 51 }, [30] = { 50, 51 }, [31] = { 50, 51 },
                             [32] = { 50, 51 }, [35] = { 50, 51 }, [39] = { 50, 51 }, [41] = { 50, 51 },
                             [43] = { 50, 51 }, [45] = { 50, 51 }, [48] = { 50, 51 }, [50] = { 50, 51 },
                             [68] = { 52, 53 }, [70] = { 52, 53 }, [71] = { 52, 53 }, [77] = { 52, 53 },
                             [78] = { 50, 51 }, [79] = { 50, 51 }, [80] = { 50, 51 }, [84] = { 52, 53 },
                             [87] = { 52, 53 }, [91] = { 52, 53 }, [92] = { 52, 53 }, [93] = { 52, 53 },
                             [94] = { 52, 53 }, [95] = { 52, 53 }, [96] = { 52, 53 }, [97] = { 52, 53 },
                             [98] = { 52, 53 }, [125] = { 54, 55 }, [129] = { 54, 55 }, [131] = { 54, 55 },
                             [132] = { 54, 55 }, [140] = { 54, 55 }, [141] = { 54, 55 }, [143] = { 54, 55 },
                             [144] = { 54, 55 }, [145] = { 54, 55 }, [148] = { 54, 55 }, [149] = { 54, 55 },
                             [152] = { 54, 55 }, [153] = { 54, 55 }, [159] = { 54, 55 }, [160] = { 54, 55 },
                             [161] = { 54, 55 }, [162] = { 54, 55 }, [165] = { 54, 55 }, [204] = { 55, 56 },
                             [205] = { 55, 56 }, [207] = { 55, 56 }, [208] = { 55, 56 }, [212] = { 55, 56 },
                             [213] = { 55, 56 }, [214] = { 52, 54 }, [216] = { 55, 56 }, [219] = { 55, 56 },
                             [222] = { 55, 56 }, [223] = { 55, 56 }, [227] = { 55, 56 }, [228] = { 55, 56 },
                             [231] = { 55, 56 }, [232] = { 55, 56 }, [236] = { 52, 53 }, [238] = { 55, 56 },
                             [242] = { 55, 56 }, [245] = { 55, 56 }, [248] = { 55, 56 }, [249] = { 55, 56 },
                             [253] = { 55, 56 }, [256] = { 55, 56 }, [259] = { 55, 56 }, [301] = { 56, 58 },
                             [302] = { 56, 58 }, [304] = { 56, 58 }, [305] = { 56, 58 }, [307] = { 56, 58 },
                             [308] = { 56, 58 }, [313] = { 56, 58 }, [314] = { 56, 58 }, [317] = { 56, 58 },
                             [318] = { 56, 58 }, [321] = { 56, 58 }, [322] = { 56, 58 }, [324] = { 56, 58 },
                             [325] = { 56, 58 }, [327] = { 56, 58 }, [328] = { 56, 58 }, [333] = { 56, 58 },
                             [335] = { 56, 58 }, [338] = { 56, 58 }, [339] = { 56, 58 }, [341] = { 56, 58 },
                             [343] = { 54, 55 }, [344] = { 54, 55 }, [346] = { 54, 55 }, [348] = { 54, 55 },
                             [349] = { 54, 55 }, [350] = { 55, 56 }, [354] = { 55, 56 }, [356] = { 55, 56 },
                             [359] = { 55, 56 }, [360] = { 55, 56 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Thinker',
            ids    = { 52, 55, 103, 106, 166, 169, 172, 260, 263, 266, 269, 363, 366, 369, 372 },
            levels = {
                [54] = { acc = 203, eva = 188, agi = 55, int = 48, mnd = 48, chr = 49 },
                [55] = { acc = 208, eva = 193, agi = 55, int = 48, mnd = 48, chr = 50 },
                [56] = { acc = 214, eva = 198, agi = 57, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 203, agi = 57, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53 },
                [59] = { acc = 230, eva = 215, agi = 60, int = 52, mnd = 52, chr = 54 },
                [60] = { acc = 235, eva = 220, agi = 60, int = 52, mnd = 52, chr = 54 },
            },
            spawn_levels = { [52] = { 54, 55 }, [55] = { 54, 55 }, [103] = { 55, 56 }, [106] = { 55, 56 },
                             [166] = { 56, 57 }, [169] = { 56, 57 }, [172] = { 56, 57 }, [260] = { 57, 58 },
                             [263] = { 57, 58 }, [266] = { 57, 58 }, [269] = { 57, 58 }, [363] = { 59, 60 },
                             [366] = { 59, 60 }, [369] = { 59, 60 }, [372] = { 59, 60 } },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 50, item = 1723 },  -- white memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Gorger',
            ids    = { 53, 56, 104, 107, 167, 170, 173, 246, 261, 264, 267, 270, 364, 367, 370, 373, 375 },
            levels = {
                [54] = { acc = 203, eva = 190, agi = 59, int = 48, mnd = 48, chr = 49 },
                [55] = { acc = 208, eva = 195, agi = 59, int = 48, mnd = 48, chr = 50 },
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53 },
                [59] = { acc = 230, eva = 217, agi = 64, int = 52, mnd = 52, chr = 54 },
                [60] = { acc = 235, eva = 222, agi = 64, int = 52, mnd = 52, chr = 54 },
            },
            spawn_levels = { [53] = { 54, 55 }, [56] = { 54, 55 }, [104] = { 55, 56 }, [107] = { 55, 56 },
                             [167] = { 56, 57 }, [170] = { 56, 57 }, [173] = { 56, 57 }, [246] = { 59, 60 },
                             [261] = { 58, 59 }, [264] = { 58, 59 }, [267] = { 58, 59 }, [270] = { 58, 59 },
                             [364] = { 59, 60 }, [367] = { 59, 60 }, [370] = { 59, 60 }, [373] = { 59, 60 },
                             [375] = { 59, 60 } },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 50, item = 1723 },  -- white memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Craver',
            ids    = { 54, 57, 105, 108, 168, 171, 174, 262, 265, 268, 271, 365, 368, 371, 374, 376 },
            levels = {
                [54] = { acc = 203, eva = 190, agi = 59, int = 48, mnd = 48, chr = 49 },
                [55] = { acc = 208, eva = 195, agi = 59, int = 48, mnd = 48, chr = 50 },
                [56] = { acc = 214, eva = 200, agi = 61, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 205, agi = 61, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 211, agi = 62, int = 51, mnd = 51, chr = 53 },
                [59] = { acc = 230, eva = 217, agi = 64, int = 52, mnd = 52, chr = 54 },
                [60] = { acc = 235, eva = 222, agi = 64, int = 52, mnd = 52, chr = 54 },
            },
            spawn_levels = { [54] = { 54, 55 }, [57] = { 54, 55 }, [105] = { 55, 56 }, [108] = { 55, 56 },
                             [168] = { 56, 57 }, [171] = { 56, 57 }, [174] = { 56, 57 }, [262] = { 57, 58 },
                             [265] = { 57, 58 }, [268] = { 57, 58 }, [271] = { 57, 58 }, [365] = { 59, 60 },
                             [368] = { 59, 60 }, [371] = { 59, 60 }, [374] = { 59, 60 }, [376] = { 59, 60 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 50, item = 1723 },  -- white memosphere
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Memory Receptacle',
            ids    = { 59, 64, 111, 118, 176, 183, 190, 197, 273, 282, 291 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
            },
            magic_dmg = { all = -50 },
        },
        {
            name   = 'Stray',
            ids    = { 60, 61, 62, 65, 66, 67, 112, 113, 114, 115, 116, 119, 120, 121, 122, 123, 177, 178, 179, 180,
                       184, 185, 186, 187, 191, 192, 193, 194, 198, 199, 200, 201, 274, 275, 277, 278, 279, 283,
                       284, 286, 287, 288, 292, 293, 295, 296, 297 },
            nm     = true,
            levels = {
                [39] = { acc = 143, eva = 131, agi = 40, int = 36, mnd = 36, chr = 38 },
                [40] = { acc = 146, eva = 134, agi = 40, int = 36, mnd = 36, chr = 38 },
                [41] = { acc = 150, eva = 138, agi = 42, int = 39, mnd = 39, chr = 40 },
                [42] = { acc = 153, eva = 140, agi = 42, int = 39, mnd = 39, chr = 40 },
                [43] = { acc = 156, eva = 143, agi = 42, int = 39, mnd = 39, chr = 40 },
                [44] = { acc = 160, eva = 146, agi = 43, int = 40, mnd = 40, chr = 42 },
                [45] = { acc = 163, eva = 150, agi = 45, int = 41, mnd = 41, chr = 43 },
                [47] = { acc = 170, eva = 156, agi = 46, int = 43, mnd = 43, chr = 44 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 43, mnd = 43, chr = 45 },
                [49] = { acc = 177, eva = 163, agi = 48, int = 44, mnd = 44, chr = 45 },
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48 },
            },
            spawn_levels = { [60] = { 39, 42 }, [61] = { 39, 42 }, [62] = { 39, 42 }, [65] = { 39, 42 },
                             [66] = { 39, 42 }, [67] = { 39, 42 }, [112] = { 43, 45 }, [113] = { 43, 45 },
                             [114] = { 43, 45 }, [115] = { 43, 45 }, [116] = { 43, 45 }, [119] = { 43, 45 },
                             [120] = { 43, 45 }, [121] = { 43, 45 }, [122] = { 43, 45 }, [123] = { 43, 45 },
                             [177] = { 47, 49 }, [178] = { 47, 49 }, [179] = { 47, 49 }, [180] = { 47, 49 },
                             [184] = { 47, 49 }, [185] = { 47, 49 }, [186] = { 47, 49 }, [187] = { 47, 49 },
                             [191] = { 47, 49 }, [192] = { 47, 49 }, [193] = { 47, 49 }, [194] = { 47, 49 },
                             [198] = { 47, 49 }, [199] = { 47, 49 }, [200] = { 47, 49 }, [201] = { 47, 49 },
                             [274] = { 49, 51 }, [275] = { 49, 51 }, [277] = { 49, 51 }, [278] = { 49, 51 },
                             [279] = { 49, 51 }, [283] = { 49, 51 }, [284] = { 49, 51 }, [286] = { 49, 51 },
                             [287] = { 49, 51 }, [288] = { 49, 51 }, [292] = { 49, 51 }, [293] = { 49, 51 },
                             [295] = { 49, 51 }, [296] = { 49, 51 }, [297] = { 49, 51 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Seether',
            ids    = { 74, 86, 89, 101, 102, 109, 126, 130, 133, 142, 146, 151, 157, 163, 164, 209, 215, 217, 220,
                       224, 225, 229, 230, 233, 234, 239, 250, 252, 255, 299, 306, 312, 316, 319, 323, 326, 330,
                       331, 332, 336, 340, 351, 352, 353, 358, 361, 362 },
            levels = {
                [51] = { acc = 187, eva = 172, agi = 53, int = 46, mnd = 46, chr = 48 },
                [52] = { acc = 192, eva = 177, agi = 53, int = 46, mnd = 46, chr = 48 },
                [53] = { acc = 197, eva = 183, agi = 54, int = 48, mnd = 48, chr = 49 },
                [54] = { acc = 203, eva = 188, agi = 55, int = 48, mnd = 48, chr = 49 },
                [55] = { acc = 208, eva = 193, agi = 55, int = 48, mnd = 48, chr = 50 },
                [56] = { acc = 214, eva = 198, agi = 57, int = 50, mnd = 50, chr = 52 },
                [57] = { acc = 219, eva = 203, agi = 57, int = 51, mnd = 51, chr = 52 },
                [58] = { acc = 224, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53 },
            },
            spawn_levels = { [74] = { 51, 52 }, [86] = { 51, 52 }, [89] = { 51, 52 }, [101] = { 51, 52 },
                             [102] = { 51, 52 }, [109] = { 51, 52 }, [126] = { 53, 54 }, [130] = { 53, 54 },
                             [133] = { 53, 54 }, [142] = { 53, 54 }, [146] = { 53, 54 }, [151] = { 53, 54 },
                             [157] = { 53, 54 }, [163] = { 53, 54 }, [164] = { 53, 54 }, [209] = { 55, 56 },
                             [215] = { 55, 56 }, [217] = { 55, 56 }, [220] = { 55, 56 }, [224] = { 55, 56 },
                             [225] = { 55, 56 }, [229] = { 55, 56 }, [230] = { 55, 56 }, [233] = { 55, 56 },
                             [234] = { 55, 56 }, [239] = { 57, 58 }, [250] = { 57, 58 }, [252] = { 57, 58 },
                             [255] = { 57, 58 }, [299] = { 57, 58 }, [306] = { 57, 58 }, [312] = { 57, 58 },
                             [316] = { 57, 58 }, [319] = { 57, 58 }, [323] = { 57, 58 }, [326] = { 57, 58 },
                             [330] = { 57, 58 }, [331] = { 57, 58 }, [332] = { 57, 58 }, [336] = { 57, 58 },
                             [340] = { 57, 58 }, [351] = { 55, 56 }, [352] = { 55, 56 }, [353] = { 55, 56 },
                             [358] = { 55, 56 }, [361] = { 55, 56 }, [362] = { 55, 56 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, group = {  -- one of
                    { 1606, 1 },  -- remnant of a burning memory
                    { 1607, 1 },  -- remnant of a bitter memory
                    { 1608, 1 },  -- remnant of a fleeting memory
                    { 1609, 1 },  -- remnant of a profane memory
                    { 1610, 1 },  -- remnant of a startling memory
                    { 1611, 1 },  -- remnant of a somber memory
                    { 1612, 1 },  -- remnant of a radiant memory
                    { 1613, 1 },  -- remnant of a malevolent memory
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Deviator',
            ids    = { 137 },
            nm     = true,
            levels = {
                [58] = { acc = 225, eva = 209, agi = 59, int = 54, mnd = 48, chr = 53 },
                [59] = { acc = 231, eva = 215, agi = 60, int = 56, mnd = 49, chr = 54 },
                [60] = { acc = 236, eva = 220, agi = 60, int = 56, mnd = 49, chr = 54 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, water = -3, paralyze = 11, bind = 11, silence = 11,
                       poison = -3 },
            immune = { 'silence' },
            drops  = {
                { rate = 1000, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1759 },  -- recollection of suffering
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Stray',
            ids    = { 181, 188, 195, 202, 276, 285, 294 },
            nm     = true,
            levels = {
                [47] = { acc = 170, eva = 156, agi = 46, int = 43, mnd = 43, chr = 44 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 43, mnd = 43, chr = 45 },
                [49] = { acc = 177, eva = 163, agi = 48, int = 44, mnd = 44, chr = 45 },
                [50] = { acc = 181, eva = 166, agi = 48, int = 45, mnd = 45, chr = 47 },
                [51] = { acc = 187, eva = 171, agi = 51, int = 46, mnd = 46, chr = 48 },
            },
            spawn_levels = { [181] = { 47, 49 }, [188] = { 47, 49 }, [195] = { 47, 49 }, [202] = { 47, 49 },
                             [276] = { 49, 51 }, [285] = { 49, 51 }, [294] = { 49, 51 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Wailer',
            ids    = { 226 },
            nm     = true,
            levels = {
                [58] = { acc = 224, eva = 208, agi = 56, int = 51, mnd = 51, chr = 53 },
                [59] = { acc = 230, eva = 213, agi = 57, int = 52, mnd = 52, chr = 54 },
                [60] = { acc = 235, eva = 218, agi = 57, int = 52, mnd = 52, chr = 54 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, light = -3, dark = 11, paralyze = 11, bind = 11,
                       poison = -3, light_sleep = -3, dark_sleep = 11, blind = 11 },
            drops  = {
                { rate = 1000, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1760 },  -- recollection of animosity
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Stray',
            ids    = { 280, 289, 298 },
            nm     = true,
            levels = {
                [49] = { acc = 177, eva = 164, agi = 50, int = 44, mnd = 44, chr = 45 },
                [50] = { acc = 181, eva = 167, agi = 51, int = 45, mnd = 45, chr = 47 },
                [51] = { acc = 187, eva = 172, agi = 53, int = 46, mnd = 46, chr = 48 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Provoker',
            ids    = { 329 },
            nm     = true,
            levels = {
                [58] = { acc = 274, eva = 209, agi = 58, int = 51, mnd = 51, chr = 53 },
                [59] = { acc = 280, eva = 215, agi = 60, int = 52, mnd = 52, chr = 54 },
                [60] = { acc = 285, eva = 220, agi = 60, int = 52, mnd = 52, chr = 54 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            drops  = {
                { rate = 1000, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1723 },  -- white memosphere
                { rate = 240, item = 1761 },  -- recollection of anxiety
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
    },
    by_name = {},
}
