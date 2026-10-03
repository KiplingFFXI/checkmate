-- Promyvion-Holla (zone 16).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Memory Receptacle' },
    },
    monsters = {
        {
            name   = 'Wanderer',
            ids    = { 1, 2, 4, 5, 7, 8, 9, 15, 24, 33, 34, 35, 37, 38, 40, 41, 42, 43, 44, 46, 47, 57, 60, 61, 62,
                       63, 68, 69, 72, 73, 74, 75, 76, 77, 83, 84, 116, 117, 124, 127, 164, 167, 172, 181, 217, 218,
                       219, 220, 222, 224, 230, 233, 240 },
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
            spawn_levels = { [1] = { 24, 26 }, [2] = { 24, 26 }, [4] = { 24, 26 }, [5] = { 24, 26 },
                             [7] = { 24, 26 }, [8] = { 24, 26 }, [9] = { 24, 26 }, [15] = { 34, 36 },
                             [24] = { 34, 36 }, [33] = { 28, 30 }, [34] = { 28, 30 }, [35] = { 28, 30 },
                             [37] = { 28, 30 }, [38] = { 28, 30 }, [40] = { 28, 30 }, [41] = { 28, 30 },
                             [42] = { 28, 30 }, [43] = { 28, 30 }, [44] = { 28, 30 }, [46] = { 28, 30 },
                             [47] = { 28, 30 }, [57] = { 28, 30 }, [60] = { 34, 36 }, [61] = { 34, 36 },
                             [62] = { 34, 36 }, [63] = { 34, 36 }, [68] = { 34, 36 }, [69] = { 34, 36 },
                             [72] = { 34, 36 }, [73] = { 34, 36 }, [74] = { 24, 26 }, [75] = { 24, 26 },
                             [76] = { 24, 26 }, [77] = { 28, 30 }, [83] = { 28, 30 }, [84] = { 28, 30 },
                             [116] = { 32, 34 }, [117] = { 32, 34 }, [124] = { 32, 34 }, [127] = { 32, 34 },
                             [164] = { 32, 34 }, [167] = { 32, 34 }, [172] = { 32, 34 }, [181] = { 34, 36 },
                             [217] = { 24, 26 }, [218] = { 24, 26 }, [219] = { 24, 26 }, [220] = { 24, 26 },
                             [222] = { 28, 30 }, [224] = { 28, 30 }, [230] = { 28, 30 }, [233] = { 32, 34 },
                             [240] = { 32, 34 } },
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
            name   = 'Weeper',
            ids    = { 3, 6, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 22, 23, 25, 36, 39, 48, 49, 50, 51, 53, 54, 55,
                       56, 58, 59, 64, 66, 70, 71, 78, 80, 221, 226, 227, 228, 229, 231, 232, 234, 235, 236, 237,
                       238, 239, 242, 243 },
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
            spawn_levels = { [3] = { 25, 27 }, [6] = { 25, 27 }, [10] = { 25, 27 }, [11] = { 25, 27 },
                             [12] = { 25, 27 }, [13] = { 37, 38 }, [14] = { 37, 38 }, [16] = { 37, 38 },
                             [17] = { 37, 38 }, [18] = { 37, 38 }, [19] = { 37, 38 }, [20] = { 37, 38 },
                             [22] = { 37, 38 }, [23] = { 37, 38 }, [25] = { 37, 38 }, [36] = { 29, 31 },
                             [39] = { 29, 31 }, [48] = { 29, 31 }, [49] = { 29, 31 }, [50] = { 29, 31 },
                             [51] = { 29, 31 }, [53] = { 29, 31 }, [54] = { 29, 31 }, [55] = { 29, 31 },
                             [56] = { 29, 31 }, [58] = { 29, 31 }, [59] = { 29, 31 }, [64] = { 37, 38 },
                             [66] = { 37, 38 }, [70] = { 37, 38 }, [71] = { 37, 38 }, [78] = { 29, 31 },
                             [80] = { 29, 31 }, [221] = { 25, 27 }, [226] = { 29, 31 }, [227] = { 29, 31 },
                             [228] = { 29, 31 }, [229] = { 29, 31 }, [231] = { 29, 31 }, [232] = { 33, 35 },
                             [234] = { 33, 35 }, [235] = { 33, 35 }, [236] = { 33, 35 }, [237] = { 33, 35 },
                             [238] = { 33, 35 }, [239] = { 33, 35 }, [242] = { 33, 35 }, [243] = { 33, 35 } },
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
            name   = 'Seether Prom',
            ids    = { 21, 26, 52, 65, 79, 81, 82, 85, 120, 126, 128, 129, 130, 163, 171, 174, 175, 177, 216, 223,
                       225, 245, 248, 252, 255, 256, 257, 259, 265, 268, 272, 273, 274, 277, 280, 284, 286 },
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
            spawn_levels = { [21] = { 37, 38 }, [26] = { 37, 38 }, [52] = { 31, 33 }, [65] = { 37, 38 },
                             [79] = { 31, 33 }, [81] = { 31, 33 }, [82] = { 31, 33 }, [85] = { 31, 33 },
                             [120] = { 34, 36 }, [126] = { 34, 36 }, [128] = { 34, 36 }, [129] = { 34, 36 },
                             [130] = { 34, 36 }, [163] = { 34, 36 }, [171] = { 34, 36 }, [174] = { 34, 36 },
                             [175] = { 34, 36 }, [177] = { 34, 36 }, [216] = { 37, 38 }, [223] = { 31, 33 },
                             [225] = { 31, 33 }, [245] = { 37, 38 }, [248] = { 37, 38 }, [252] = { 37, 38 },
                             [255] = { 37, 38 }, [256] = { 37, 38 }, [257] = { 37, 38 }, [259] = { 37, 38 },
                             [265] = { 37, 38 }, [268] = { 37, 38 }, [272] = { 37, 38 }, [273] = { 37, 38 },
                             [274] = { 37, 38 }, [277] = { 37, 38 }, [280] = { 37, 38 }, [284] = { 37, 38 },
                             [286] = { 37, 38 } },
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
            name   = 'Thinker',
            ids    = { 27, 67, 241 },
            levels = {
                [30] = { acc = 111, eva = 102, agi = 33, int = 29, mnd = 29, chr = 30 },
                [31] = { acc = 115, eva = 106, agi = 35, int = 30, mnd = 30, chr = 31 },
                [32] = { acc = 118, eva = 108, agi = 35, int = 30, mnd = 30, chr = 31 },
                [36] = { acc = 132, eva = 122, agi = 39, int = 34, mnd = 34, chr = 35 },
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36 },
                [39] = { acc = 143, eva = 132, agi = 42, int = 36, mnd = 36, chr = 38 },
                [40] = { acc = 146, eva = 135, agi = 42, int = 36, mnd = 36, chr = 38 },
            },
            spawn_levels = { [27] = { 30, 32 }, [67] = { 38, 40 }, [241] = { 36, 38 } },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 50, item = 1720 },  -- teal memosphere
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
            ids    = { 29, 89, 96, 103, 110, 136, 145, 154, 188, 197, 206 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29 },
            },
            magic_dmg = { all = -50 },
            links  = 1,
        },
        {
            name   = 'Stray',
            ids    = { 30, 31, 32, 90, 91, 92, 93, 94, 97, 98, 99, 100, 101, 104, 105, 106, 107, 108, 111, 112, 113,
                       114, 115, 137, 138, 139, 140, 141, 142, 143, 146, 147, 148, 149, 150, 151, 152, 155, 156,
                       157, 158, 159, 160, 161, 189, 190, 191, 192, 193, 194, 195, 198, 199, 200, 201, 202, 203,
                       204, 207, 208, 209, 210, 211, 212, 213 },
            nm     = true,
            levels = {
                [20] = { acc = 76, eva = 70, agi = 24, int = 18, mnd = 18, chr = 21 },
                [21] = { acc = 81, eva = 74, agi = 27, int = 20, mnd = 20, chr = 23 },
                [23] = { acc = 87, eva = 79, agi = 27, int = 20, mnd = 20, chr = 23 },
                [24] = { acc = 91, eva = 83, agi = 28, int = 21, mnd = 21, chr = 24 },
                [26] = { acc = 98, eva = 90, agi = 31, int = 23, mnd = 23, chr = 26 },
                [27] = { acc = 101, eva = 92, agi = 31, int = 24, mnd = 24, chr = 27 },
            },
            spawn_levels = { [30] = { 20, 21 }, [31] = { 20, 21 }, [32] = { 20, 21 }, [90] = { 23, 24 },
                             [91] = { 23, 24 }, [92] = { 23, 24 }, [93] = { 23, 24 }, [94] = { 23, 24 },
                             [97] = { 23, 24 }, [98] = { 23, 24 }, [99] = { 23, 24 }, [100] = { 23, 24 },
                             [101] = { 23, 24 }, [104] = { 23, 24 }, [105] = { 23, 24 }, [106] = { 23, 24 },
                             [107] = { 23, 24 }, [108] = { 23, 24 }, [111] = { 23, 24 }, [112] = { 23, 24 },
                             [113] = { 23, 24 }, [114] = { 23, 24 }, [115] = { 23, 24 }, [137] = { 26, 27 },
                             [138] = { 26, 27 }, [139] = { 26, 27 }, [140] = { 26, 27 }, [141] = { 26, 27 },
                             [142] = { 26, 27 }, [143] = { 26, 27 }, [146] = { 26, 27 }, [147] = { 26, 27 },
                             [148] = { 26, 27 }, [149] = { 26, 27 }, [150] = { 26, 27 }, [151] = { 26, 27 },
                             [152] = { 26, 27 }, [155] = { 26, 27 }, [156] = { 26, 27 }, [157] = { 26, 27 },
                             [158] = { 26, 27 }, [159] = { 26, 27 }, [160] = { 26, 27 }, [161] = { 26, 27 },
                             [189] = { 26, 27 }, [190] = { 26, 27 }, [191] = { 26, 27 }, [192] = { 26, 27 },
                             [193] = { 26, 27 }, [194] = { 26, 27 }, [195] = { 26, 27 }, [198] = { 26, 27 },
                             [199] = { 26, 27 }, [200] = { 26, 27 }, [201] = { 26, 27 }, [202] = { 26, 27 },
                             [203] = { 26, 27 }, [204] = { 26, 27 }, [207] = { 26, 27 }, [208] = { 26, 27 },
                             [209] = { 26, 27 }, [210] = { 26, 27 }, [211] = { 26, 27 }, [212] = { 26, 27 },
                             [213] = { 26, 27 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Thinker',
            ids    = { 45, 86, 87, 133, 134, 185, 186, 276, 287, 288, 289, 290 },
            levels = {
                [32] = { acc = 118, eva = 108, agi = 35, int = 30, mnd = 30, chr = 31 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 115, agi = 37, int = 32, mnd = 32, chr = 33 },
                [36] = { acc = 132, eva = 122, agi = 39, int = 34, mnd = 34, chr = 35 },
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36 },
                [39] = { acc = 143, eva = 132, agi = 42, int = 36, mnd = 36, chr = 38 },
                [40] = { acc = 146, eva = 135, agi = 42, int = 36, mnd = 36, chr = 38 },
            },
            spawn_levels = { [45] = { 32, 34 }, [86] = { 32, 34 }, [87] = { 32, 34 }, [133] = { 36, 38 },
                             [134] = { 36, 38 }, [185] = { 36, 38 }, [186] = { 36, 38 }, [276] = { 38, 40 },
                             [287] = { 38, 40 }, [288] = { 38, 40 }, [289] = { 38, 40 }, [290] = { 38, 40 } },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 100, item = 1687 },  -- recollection of fear
                { rate = 50, item = 1720 },  -- teal memosphere
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
            ids    = { 118, 119, 121, 122, 123, 125, 131, 132, 162, 165, 166, 168, 169, 170, 173, 176, 178, 179,
                       180, 182, 183, 184, 214, 215, 244, 246, 247, 249, 250, 251, 253, 254, 258, 260, 263, 264,
                       266, 267, 269, 270, 271, 275, 279, 281, 282, 283 },
            levels = {
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 127, agi = 39, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [118] = { 33, 35 }, [119] = { 33, 35 }, [121] = { 33, 35 }, [122] = { 33, 35 },
                             [123] = { 33, 35 }, [125] = { 33, 35 }, [131] = { 33, 35 }, [132] = { 33, 35 },
                             [162] = { 33, 35 }, [165] = { 33, 35 }, [166] = { 33, 35 }, [168] = { 33, 35 },
                             [169] = { 33, 35 }, [170] = { 33, 35 }, [173] = { 33, 35 }, [176] = { 33, 35 },
                             [178] = { 33, 35 }, [179] = { 33, 35 }, [180] = { 33, 35 }, [182] = { 33, 35 },
                             [183] = { 33, 35 }, [184] = { 33, 35 }, [214] = { 37, 38 }, [215] = { 37, 38 },
                             [244] = { 37, 38 }, [246] = { 37, 38 }, [247] = { 37, 38 }, [249] = { 37, 38 },
                             [250] = { 37, 38 }, [251] = { 37, 38 }, [253] = { 37, 38 }, [254] = { 37, 38 },
                             [258] = { 37, 38 }, [260] = { 37, 38 }, [263] = { 37, 38 }, [264] = { 37, 38 },
                             [266] = { 37, 38 }, [267] = { 37, 38 }, [269] = { 37, 38 }, [270] = { 37, 38 },
                             [271] = { 37, 38 }, [275] = { 37, 38 }, [279] = { 37, 38 }, [281] = { 37, 38 },
                             [282] = { 37, 38 }, [283] = { 37, 38 } },
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
            name   = 'Wanderer',
            ids    = { 261, 262, 278, 285 },
            levels = {
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [36] = { acc = 132, eva = 121, agi = 37, int = 34, mnd = 34, chr = 35 },
            },
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
            name   = 'Cerebrator',
            ids    = { 291 },
            nm     = true,
            levels = {
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            drops  = {
                { rate = 1000, item = 1756 },  -- remnant of a cerebrator
                { rate = 240, item = 1720 },  -- teal memosphere
                { rate = 240, item = 1720 },  -- teal memosphere
                { rate = 240, item = 1720 },  -- teal memosphere
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
