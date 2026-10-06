-- Promyvion-Mea (zone 20).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Wanderer',
            ids    = { 1, 2, 5, 7, 8, 23, 24, 25, 34, 37, 40, 41, 42, 44, 47, 48, 50, 52, 55, 57, 96, 98, 100, 108,
                       111, 112, 113, 121, 122, 128, 129, 133, 134, 138, 143, 144, 148, 152, 156, 192, 193, 204,
                       207, 213, 225, 233, 235, 269, 270, 277, 281, 282 },
            levels = {
                [24] = { acc = 90, eva = 82, agi = 26, int = 24, mnd = 24, chr = 25 },
                [25] = { acc = 93, eva = 86, agi = 28, int = 25, mnd = 25, chr = 26 },
                [26] = { acc = 97, eva = 89, agi = 29, int = 26, mnd = 26, chr = 26 },
                [28] = { acc = 104, eva = 95, agi = 30, int = 27, mnd = 27, chr = 29 },
                [29] = { acc = 108, eva = 98, agi = 31, int = 28, mnd = 28, chr = 29 },
                [30] = { acc = 111, eva = 101, agi = 31, int = 29, mnd = 29, chr = 30 },
                [32] = { acc = 118, eva = 108, agi = 34, int = 30, mnd = 30, chr = 31 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [36] = { acc = 132, eva = 121, agi = 37, int = 34, mnd = 34, chr = 35 },
            },
            spawn_levels = { [1] = { 24, 26 }, [2] = { 24, 26 }, [5] = { 24, 26 }, [7] = { 24, 26 },
                             [8] = { 24, 26 }, [23] = { 28, 30 }, [24] = { 28, 30 }, [25] = { 28, 30 },
                             [34] = { 34, 36 }, [37] = { 34, 36 }, [40] = { 28, 30 }, [41] = { 28, 30 },
                             [42] = { 28, 30 }, [44] = { 28, 30 }, [47] = { 28, 30 }, [48] = { 28, 30 },
                             [50] = { 28, 30 }, [52] = { 28, 30 }, [55] = { 28, 30 }, [57] = { 28, 30 },
                             [96] = { 34, 36 }, [98] = { 32, 34 }, [100] = { 32, 34 }, [108] = { 32, 34 },
                             [111] = { 32, 34 }, [112] = { 32, 34 }, [113] = { 32, 34 }, [121] = { 32, 34 },
                             [122] = { 32, 34 }, [128] = { 32, 34 }, [129] = { 32, 34 }, [133] = { 32, 34 },
                             [134] = { 32, 34 }, [138] = { 32, 34 }, [143] = { 32, 34 }, [144] = { 32, 34 },
                             [148] = { 32, 34 }, [152] = { 32, 34 }, [156] = { 32, 34 }, [192] = { 32, 34 },
                             [193] = { 32, 34 }, [204] = { 32, 34 }, [207] = { 32, 34 }, [213] = { 32, 34 },
                             [225] = { 28, 30 }, [233] = { 32, 34 }, [235] = { 32, 34 }, [269] = { 28, 30 },
                             [270] = { 28, 30 }, [277] = { 28, 30 }, [281] = { 24, 26 }, [282] = { 24, 26 } },
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
            ids    = { 3, 4, 6, 9, 10, 11, 13, 14, 15, 16, 26, 27, 31, 32, 35, 36, 38, 39, 43, 45, 51, 53, 54, 56,
                       59, 60, 61, 63, 64, 97, 101, 103, 104, 105, 106, 109, 110, 139, 140, 141, 142, 145, 146, 149,
                       150, 153, 155, 211, 214, 215, 216, 217, 218, 219, 220, 223, 226, 227, 266, 267, 268, 272,
                       273, 275, 278, 279, 280, 283 },
            levels = {
                [25] = { acc = 93, eva = 86, agi = 28, int = 25, mnd = 25, chr = 26 },
                [26] = { acc = 97, eva = 89, agi = 29, int = 26, mnd = 26, chr = 26 },
                [27] = { acc = 101, eva = 91, agi = 29, int = 27, mnd = 27, chr = 28 },
                [29] = { acc = 108, eva = 98, agi = 31, int = 28, mnd = 28, chr = 29 },
                [30] = { acc = 111, eva = 101, agi = 31, int = 29, mnd = 29, chr = 30 },
                [31] = { acc = 115, eva = 106, agi = 34, int = 30, mnd = 30, chr = 31 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 127, agi = 39, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [3] = { 25, 27 }, [4] = { 25, 27 }, [6] = { 25, 27 }, [9] = { 37, 38 },
                             [10] = { 37, 38 }, [11] = { 37, 38 }, [13] = { 37, 38 }, [14] = { 37, 38 },
                             [15] = { 37, 38 }, [16] = { 37, 38 }, [26] = { 29, 31 }, [27] = { 37, 38 },
                             [31] = { 37, 38 }, [32] = { 37, 38 }, [35] = { 37, 38 }, [36] = { 37, 38 },
                             [38] = { 37, 38 }, [39] = { 29, 31 }, [43] = { 29, 31 }, [45] = { 29, 31 },
                             [51] = { 29, 31 }, [53] = { 29, 31 }, [54] = { 29, 31 }, [56] = { 29, 31 },
                             [59] = { 29, 31 }, [60] = { 29, 31 }, [61] = { 29, 31 }, [63] = { 29, 31 },
                             [64] = { 29, 31 }, [97] = { 37, 38 }, [101] = { 33, 35 }, [103] = { 33, 35 },
                             [104] = { 33, 35 }, [105] = { 33, 35 }, [106] = { 33, 35 }, [109] = { 33, 35 },
                             [110] = { 33, 35 }, [139] = { 33, 35 }, [140] = { 33, 35 }, [141] = { 33, 35 },
                             [142] = { 33, 35 }, [145] = { 33, 35 }, [146] = { 33, 35 }, [149] = { 33, 35 },
                             [150] = { 33, 35 }, [153] = { 33, 35 }, [155] = { 33, 35 }, [211] = { 33, 35 },
                             [214] = { 33, 35 }, [215] = { 33, 35 }, [216] = { 33, 35 }, [217] = { 33, 35 },
                             [218] = { 33, 35 }, [219] = { 33, 35 }, [220] = { 33, 35 }, [223] = { 29, 31 },
                             [226] = { 29, 31 }, [227] = { 29, 31 }, [266] = { 29, 31 }, [267] = { 29, 31 },
                             [268] = { 29, 31 }, [272] = { 29, 31 }, [273] = { 29, 31 }, [275] = { 29, 31 },
                             [278] = { 29, 31 }, [279] = { 29, 31 }, [280] = { 29, 31 }, [283] = { 25, 27 } },
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
            name   = 'Seether Prom',
            ids    = { 12, 28, 29, 30, 33, 46, 49, 58, 62, 99, 107, 118, 126, 127, 136, 147, 151, 154, 196, 198,
                       205, 212, 222, 224, 228, 229, 231, 271, 284, 287, 291, 296, 302, 303, 306, 310, 316, 319,
                       323, 324, 325 },
            levels = {
                [31] = { acc = 115, eva = 106, agi = 35, int = 30, mnd = 30, chr = 31 },
                [32] = { acc = 118, eva = 108, agi = 35, int = 30, mnd = 30, chr = 31 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 115, agi = 37, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 37, int = 32, mnd = 32, chr = 34 },
                [36] = { acc = 132, eva = 122, agi = 39, int = 34, mnd = 34, chr = 35 },
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [12] = { 37, 38 }, [28] = { 37, 38 }, [29] = { 37, 38 }, [30] = { 37, 38 },
                             [33] = { 37, 38 }, [46] = { 31, 33 }, [49] = { 31, 33 }, [58] = { 31, 33 },
                             [62] = { 31, 33 }, [99] = { 34, 36 }, [107] = { 34, 36 }, [118] = { 34, 36 },
                             [126] = { 34, 36 }, [127] = { 34, 36 }, [136] = { 34, 36 }, [147] = { 34, 36 },
                             [151] = { 34, 36 }, [154] = { 34, 36 }, [196] = { 34, 36 }, [198] = { 34, 36 },
                             [205] = { 34, 36 }, [212] = { 34, 36 }, [222] = { 34, 36 }, [224] = { 31, 33 },
                             [228] = { 31, 33 }, [229] = { 31, 33 }, [231] = { 34, 36 }, [271] = { 31, 33 },
                             [284] = { 37, 38 }, [287] = { 37, 38 }, [291] = { 37, 38 }, [296] = { 37, 38 },
                             [302] = { 37, 38 }, [303] = { 37, 38 }, [306] = { 37, 38 }, [310] = { 37, 38 },
                             [316] = { 37, 38 }, [319] = { 37, 38 }, [323] = { 37, 38 }, [324] = { 37, 38 },
                             [325] = { 37, 38 } },
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
            name   = 'Craver',
            ids    = { 17, 102, 221 },
            levels = {
                [30] = { acc = 111, eva = 103, agi = 35, int = 29, mnd = 29, chr = 30 },
                [31] = { acc = 115, eva = 108, agi = 38, int = 30, mnd = 30, chr = 31 },
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [17] = { 30, 32 }, [102] = { 36, 38 }, [221] = { 36, 38 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 50, item = 1722 },  -- indigo memosphere
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
            ids    = { 19, 69, 76, 83, 90, 160, 169, 178, 240, 249, 258 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29 },
            },
            magic_dmg = { all = -50 },
        },
        {
            name   = 'Stray',
            ids    = { 20, 21, 22, 70, 71, 72, 73, 74, 77, 78, 79, 80, 81, 84, 85, 86, 87, 88, 91, 92, 93, 94, 95,
                       161, 162, 163, 164, 165, 166, 167, 170, 171, 172, 173, 174, 175, 176, 179, 180, 181, 182,
                       183, 184, 185, 241, 242, 243, 244, 245, 246, 247, 250, 251, 252, 253, 254, 255, 256, 259,
                       260, 261, 262, 263, 264, 265 },
            nm     = true,
            levels = {
                [20] = { acc = 76, eva = 70, agi = 24, int = 18, mnd = 18, chr = 21 },
                [21] = { acc = 81, eva = 74, agi = 27, int = 20, mnd = 20, chr = 23 },
                [23] = { acc = 87, eva = 79, agi = 27, int = 20, mnd = 20, chr = 23 },
                [24] = { acc = 91, eva = 83, agi = 28, int = 21, mnd = 21, chr = 24 },
                [26] = { acc = 98, eva = 90, agi = 31, int = 23, mnd = 23, chr = 26 },
                [27] = { acc = 101, eva = 92, agi = 31, int = 24, mnd = 24, chr = 27 },
            },
            spawn_levels = { [20] = { 20, 21 }, [21] = { 20, 21 }, [22] = { 20, 21 }, [70] = { 23, 24 },
                             [71] = { 23, 24 }, [72] = { 23, 24 }, [73] = { 23, 24 }, [74] = { 23, 24 },
                             [77] = { 23, 24 }, [78] = { 23, 24 }, [79] = { 23, 24 }, [80] = { 23, 24 },
                             [81] = { 23, 24 }, [84] = { 23, 24 }, [85] = { 23, 24 }, [86] = { 23, 24 },
                             [87] = { 23, 24 }, [88] = { 23, 24 }, [91] = { 23, 24 }, [92] = { 23, 24 },
                             [93] = { 23, 24 }, [94] = { 23, 24 }, [95] = { 23, 24 }, [161] = { 26, 27 },
                             [162] = { 26, 27 }, [163] = { 26, 27 }, [164] = { 26, 27 }, [165] = { 26, 27 },
                             [166] = { 26, 27 }, [167] = { 26, 27 }, [170] = { 26, 27 }, [171] = { 26, 27 },
                             [172] = { 26, 27 }, [173] = { 26, 27 }, [174] = { 26, 27 }, [175] = { 26, 27 },
                             [176] = { 26, 27 }, [179] = { 26, 27 }, [180] = { 26, 27 }, [181] = { 26, 27 },
                             [182] = { 26, 27 }, [183] = { 26, 27 }, [184] = { 26, 27 }, [185] = { 26, 27 },
                             [241] = { 26, 27 }, [242] = { 26, 27 }, [243] = { 26, 27 }, [244] = { 26, 27 },
                             [245] = { 26, 27 }, [246] = { 26, 27 }, [247] = { 26, 27 }, [250] = { 26, 27 },
                             [251] = { 26, 27 }, [252] = { 26, 27 }, [253] = { 26, 27 }, [254] = { 26, 27 },
                             [255] = { 26, 27 }, [256] = { 26, 27 }, [259] = { 26, 27 }, [260] = { 26, 27 },
                             [261] = { 26, 27 }, [262] = { 26, 27 }, [263] = { 26, 27 }, [264] = { 26, 27 },
                             [265] = { 26, 27 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Craver',
            ids    = { 65, 66, 67, 157, 158, 237, 238, 331, 332, 333, 334, 335 },
            levels = {
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 117, agi = 40, int = 32, mnd = 32, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
                [39] = { acc = 143, eva = 133, agi = 45, int = 36, mnd = 36, chr = 38 },
                [40] = { acc = 146, eva = 136, agi = 45, int = 36, mnd = 36, chr = 38 },
            },
            spawn_levels = { [65] = { 32, 34 }, [66] = { 32, 34 }, [67] = { 32, 34 }, [157] = { 36, 38 },
                             [158] = { 36, 38 }, [237] = { 36, 38 }, [238] = { 36, 38 }, [331] = { 38, 40 },
                             [332] = { 38, 40 }, [333] = { 38, 40 }, [334] = { 38, 40 }, [335] = { 38, 40 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 50, item = 1722 },  -- indigo memosphere
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
            ids    = { 114, 115, 116, 117, 119, 120, 123, 124, 125, 130, 131, 132, 135, 137, 186, 187, 188, 189,
                       190, 191, 194, 195, 197, 199, 200, 201, 202, 203, 206, 208, 209, 210, 230, 232, 234, 236,
                       285, 286, 289, 290, 292, 293, 294, 295, 299, 300, 301, 304, 305, 307, 308, 309, 312, 313,
                       314, 315, 317, 318, 321, 322, 326, 330 },
            levels = {
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 127, agi = 39, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [114] = { 33, 35 }, [115] = { 33, 35 }, [116] = { 33, 35 }, [117] = { 33, 35 },
                             [119] = { 33, 35 }, [120] = { 33, 35 }, [123] = { 33, 35 }, [124] = { 33, 35 },
                             [125] = { 33, 35 }, [130] = { 33, 35 }, [131] = { 33, 35 }, [132] = { 33, 35 },
                             [135] = { 33, 35 }, [137] = { 33, 35 }, [186] = { 33, 35 }, [187] = { 33, 35 },
                             [188] = { 33, 35 }, [189] = { 33, 35 }, [190] = { 33, 35 }, [191] = { 33, 35 },
                             [194] = { 33, 35 }, [195] = { 33, 35 }, [197] = { 33, 35 }, [199] = { 33, 35 },
                             [200] = { 33, 35 }, [201] = { 33, 35 }, [202] = { 33, 35 }, [203] = { 33, 35 },
                             [206] = { 33, 35 }, [208] = { 33, 35 }, [209] = { 33, 35 }, [210] = { 33, 35 },
                             [230] = { 33, 35 }, [232] = { 33, 35 }, [234] = { 33, 35 }, [236] = { 33, 35 },
                             [285] = { 37, 38 }, [286] = { 37, 38 }, [289] = { 37, 38 }, [290] = { 37, 38 },
                             [292] = { 37, 38 }, [293] = { 37, 38 }, [294] = { 37, 38 }, [295] = { 37, 38 },
                             [299] = { 37, 38 }, [300] = { 37, 38 }, [301] = { 37, 38 }, [304] = { 37, 38 },
                             [305] = { 37, 38 }, [307] = { 37, 38 }, [308] = { 37, 38 }, [309] = { 37, 38 },
                             [312] = { 37, 38 }, [313] = { 37, 38 }, [314] = { 37, 38 }, [315] = { 37, 38 },
                             [317] = { 37, 38 }, [318] = { 37, 38 }, [321] = { 37, 38 }, [322] = { 37, 38 },
                             [326] = { 37, 38 }, [330] = { 37, 38 } },
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
            name   = 'Wanderer',
            ids    = { 288, 297, 311, 320, 328 },
            levels = {
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [36] = { acc = 132, eva = 121, agi = 37, int = 34, mnd = 34, chr = 35 },
            },
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
            name   = 'Coveter',
            ids    = { 336 },
            nm     = true,
            levels = {
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            drops  = {
                { rate = 1000, item = 1757 },  -- remnant of a coveter
                { rate = 240, item = 1722 },  -- indigo memosphere
                { rate = 240, item = 1722 },  -- indigo memosphere
                { rate = 240, item = 1722 },  -- indigo memosphere
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
