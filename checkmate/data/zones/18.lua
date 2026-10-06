-- Promyvion-Dem (zone 18).
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
            ids    = { 1, 2, 3, 4, 5, 6, 7, 9, 10, 12, 13, 15, 16, 18, 19, 20, 23, 33, 36, 38, 40, 44, 45, 49, 50,
                       53, 55, 58, 60, 67, 68, 70, 71, 72, 73, 109, 111, 113, 116, 118, 156, 159, 161, 162, 167,
                       180, 189, 193, 197, 199, 202, 203, 204, 205, 245, 246, 247, 248, 252, 261, 312, 318, 321,
                       322 },
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
            spawn_levels = { [1] = { 24, 26 }, [2] = { 24, 26 }, [3] = { 24, 26 }, [4] = { 24, 26 },
                             [5] = { 24, 26 }, [6] = { 24, 26 }, [7] = { 24, 26 }, [9] = { 24, 26 },
                             [10] = { 24, 26 }, [12] = { 24, 26 }, [13] = { 24, 26 }, [15] = { 24, 26 },
                             [16] = { 24, 26 }, [18] = { 24, 26 }, [19] = { 24, 26 }, [20] = { 24, 26 },
                             [23] = { 24, 26 }, [33] = { 28, 30 }, [36] = { 28, 30 }, [38] = { 28, 30 },
                             [40] = { 28, 30 }, [44] = { 28, 30 }, [45] = { 28, 30 }, [49] = { 28, 30 },
                             [50] = { 28, 30 }, [53] = { 28, 30 }, [55] = { 28, 30 }, [58] = { 28, 30 },
                             [60] = { 28, 30 }, [67] = { 28, 30 }, [68] = { 28, 30 }, [70] = { 28, 30 },
                             [71] = { 28, 30 }, [72] = { 28, 30 }, [73] = { 28, 30 }, [109] = { 32, 34 },
                             [111] = { 32, 34 }, [113] = { 32, 34 }, [116] = { 32, 34 }, [118] = { 32, 34 },
                             [156] = { 32, 34 }, [159] = { 32, 34 }, [161] = { 32, 34 }, [162] = { 32, 34 },
                             [167] = { 32, 34 }, [180] = { 32, 34 }, [189] = { 24, 26 }, [193] = { 28, 30 },
                             [197] = { 28, 30 }, [199] = { 28, 30 }, [202] = { 28, 30 }, [203] = { 28, 30 },
                             [204] = { 28, 30 }, [205] = { 28, 30 }, [245] = { 28, 30 }, [246] = { 28, 30 },
                             [247] = { 28, 30 }, [248] = { 28, 30 }, [252] = { 32, 34 }, [261] = { 32, 34 },
                             [312] = { 32, 34 }, [318] = { 34, 36 }, [321] = { 34, 36 }, [322] = { 34, 36 } },
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
            name   = 'Weeper',
            ids    = { 8, 11, 14, 17, 21, 22, 25, 26, 32, 34, 35, 37, 39, 41, 42, 43, 46, 47, 48, 51, 57, 59, 61,
                       62, 63, 64, 66, 74, 190, 192, 194, 196, 200, 201, 249, 250, 251, 253, 254, 255, 256, 257,
                       258, 259, 260, 307, 308, 310, 313, 314, 316, 317, 319 },
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
            spawn_levels = { [8] = { 25, 27 }, [11] = { 25, 27 }, [14] = { 25, 27 }, [17] = { 25, 27 },
                             [21] = { 25, 27 }, [22] = { 25, 27 }, [25] = { 25, 27 }, [26] = { 25, 27 },
                             [32] = { 29, 31 }, [34] = { 29, 31 }, [35] = { 29, 31 }, [37] = { 29, 31 },
                             [39] = { 29, 31 }, [41] = { 29, 31 }, [42] = { 29, 31 }, [43] = { 29, 31 },
                             [46] = { 29, 31 }, [47] = { 29, 31 }, [48] = { 29, 31 }, [51] = { 29, 31 },
                             [57] = { 29, 31 }, [59] = { 29, 31 }, [61] = { 29, 31 }, [62] = { 29, 31 },
                             [63] = { 29, 31 }, [64] = { 29, 31 }, [66] = { 29, 31 }, [74] = { 29, 31 },
                             [190] = { 25, 27 }, [192] = { 29, 31 }, [194] = { 29, 31 }, [196] = { 29, 31 },
                             [200] = { 29, 31 }, [201] = { 29, 31 }, [249] = { 29, 31 }, [250] = { 33, 35 },
                             [251] = { 33, 35 }, [253] = { 33, 35 }, [254] = { 33, 35 }, [255] = { 33, 35 },
                             [256] = { 33, 35 }, [257] = { 33, 35 }, [258] = { 33, 35 }, [259] = { 33, 35 },
                             [260] = { 33, 35 }, [307] = { 33, 35 }, [308] = { 33, 35 }, [310] = { 33, 35 },
                             [313] = { 33, 35 }, [314] = { 33, 35 }, [316] = { 33, 35 }, [317] = { 33, 35 },
                             [319] = { 37, 38 } },
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
            name   = 'Gorger',
            ids    = { 24, 198, 305, 306 },
            levels = {
                [30] = { acc = 111, eva = 103, agi = 35, int = 29, mnd = 29, chr = 30 },
                [31] = { acc = 115, eva = 108, agi = 38, int = 30, mnd = 30, chr = 31 },
                [32] = { acc = 118, eva = 110, agi = 38, int = 30, mnd = 30, chr = 31 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 117, agi = 40, int = 32, mnd = 32, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [24] = { 30, 32 }, [198] = { 32, 34 }, [305] = { 36, 38 }, [306] = { 36, 38 } },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 50, item = 1721 },  -- beryl memosphere
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
            ids    = { 28, 82, 89, 96, 103, 129, 138, 147, 208, 217, 226 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29 },
            },
            magic_dmg = { all = -50 },
        },
        {
            name   = 'Stray',
            ids    = { 29, 30, 31, 83, 84, 85, 86, 87, 90, 91, 92, 93, 94, 97, 98, 99, 100, 101, 104, 105, 106, 107,
                       108, 130, 131, 132, 133, 134, 135, 136, 139, 140, 141, 142, 143, 144, 145, 148, 149, 150,
                       151, 152, 153, 154, 209, 210, 211, 212, 213, 214, 215, 218, 219, 220, 221, 222, 223, 224,
                       227, 228, 229, 230, 231, 232, 233 },
            nm     = true,
            levels = {
                [20] = { acc = 76, eva = 70, agi = 24, int = 18, mnd = 18, chr = 21 },
                [21] = { acc = 81, eva = 74, agi = 27, int = 20, mnd = 20, chr = 23 },
                [23] = { acc = 87, eva = 79, agi = 27, int = 20, mnd = 20, chr = 23 },
                [24] = { acc = 91, eva = 83, agi = 28, int = 21, mnd = 21, chr = 24 },
                [26] = { acc = 98, eva = 90, agi = 31, int = 23, mnd = 23, chr = 26 },
                [27] = { acc = 101, eva = 92, agi = 31, int = 24, mnd = 24, chr = 27 },
            },
            spawn_levels = { [29] = { 20, 21 }, [30] = { 20, 21 }, [31] = { 21, 21 }, [83] = { 23, 24 },
                             [84] = { 23, 24 }, [85] = { 23, 24 }, [86] = { 23, 24 }, [87] = { 23, 24 },
                             [90] = { 23, 24 }, [91] = { 23, 24 }, [92] = { 23, 24 }, [93] = { 23, 24 },
                             [94] = { 23, 24 }, [97] = { 23, 24 }, [98] = { 23, 24 }, [99] = { 23, 24 },
                             [100] = { 23, 24 }, [101] = { 23, 24 }, [104] = { 23, 24 }, [105] = { 23, 24 },
                             [106] = { 23, 24 }, [107] = { 23, 24 }, [108] = { 23, 24 }, [130] = { 26, 27 },
                             [131] = { 26, 27 }, [132] = { 26, 27 }, [133] = { 26, 27 }, [134] = { 26, 27 },
                             [135] = { 26, 27 }, [136] = { 26, 27 }, [139] = { 26, 27 }, [140] = { 26, 27 },
                             [141] = { 26, 27 }, [142] = { 26, 27 }, [143] = { 26, 27 }, [144] = { 26, 27 },
                             [145] = { 26, 27 }, [148] = { 26, 27 }, [149] = { 26, 27 }, [150] = { 26, 27 },
                             [151] = { 26, 27 }, [152] = { 26, 27 }, [153] = { 26, 27 }, [154] = { 26, 27 },
                             [209] = { 26, 27 }, [210] = { 26, 27 }, [211] = { 26, 27 }, [212] = { 26, 27 },
                             [213] = { 26, 27 }, [214] = { 26, 27 }, [215] = { 26, 27 }, [218] = { 26, 27 },
                             [219] = { 26, 27 }, [220] = { 26, 27 }, [221] = { 26, 27 }, [222] = { 26, 27 },
                             [223] = { 26, 27 }, [224] = { 26, 27 }, [227] = { 26, 27 }, [228] = { 26, 27 },
                             [229] = { 26, 27 }, [230] = { 26, 27 }, [231] = { 26, 27 }, [232] = { 26, 27 },
                             [233] = { 26, 27 } },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Seether Prom',
            ids    = { 52, 54, 56, 65, 69, 75, 120, 124, 170, 173, 178, 183, 184, 195, 234, 235, 236, 237, 242, 243,
                       263, 266, 267, 270, 273, 274, 278, 279, 287, 292, 293, 309, 311, 315, 320 },
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
            spawn_levels = { [52] = { 31, 33 }, [54] = { 31, 33 }, [56] = { 31, 33 }, [65] = { 31, 33 },
                             [69] = { 31, 33 }, [75] = { 31, 33 }, [120] = { 34, 36 }, [124] = { 34, 36 },
                             [170] = { 34, 36 }, [173] = { 34, 36 }, [178] = { 34, 36 }, [183] = { 34, 36 },
                             [184] = { 34, 36 }, [195] = { 34, 36 }, [234] = { 37, 38 }, [235] = { 37, 38 },
                             [236] = { 37, 38 }, [237] = { 37, 38 }, [242] = { 37, 38 }, [243] = { 37, 38 },
                             [263] = { 37, 38 }, [266] = { 37, 38 }, [267] = { 37, 38 }, [270] = { 37, 38 },
                             [273] = { 37, 38 }, [274] = { 37, 38 }, [278] = { 37, 38 }, [279] = { 37, 38 },
                             [287] = { 37, 38 }, [292] = { 37, 38 }, [293] = { 37, 38 }, [309] = { 34, 36 },
                             [311] = { 34, 36 }, [315] = { 34, 36 }, [320] = { 37, 38 } },
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
            name   = 'Gorger',
            ids    = { 76, 77, 78, 79, 80, 126, 127, 187, 188, 296, 297, 298, 299, 300, 301, 302, 303, 304 },
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
            spawn_levels = { [76] = { 32, 34 }, [77] = { 32, 34 }, [78] = { 32, 34 }, [79] = { 32, 34 },
                             [80] = { 32, 34 }, [126] = { 36, 38 }, [127] = { 36, 38 }, [187] = { 36, 38 },
                             [188] = { 36, 38 }, [296] = { 38, 40 }, [297] = { 38, 40 }, [298] = { 38, 40 },
                             [299] = { 38, 40 }, [300] = { 38, 40 }, [301] = { 38, 40 }, [302] = { 38, 40 },
                             [303] = { 38, 40 }, [304] = { 38, 40 } },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 100, item = 1689 },  -- recollection of guilt
                { rate = 100, item = 1688 },  -- recollection of pain
                { rate = 50, item = 1721 },  -- beryl memosphere
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
            ids    = { 110, 112, 114, 115, 117, 119, 121, 122, 123, 125, 155, 157, 158, 160, 163, 164, 165, 166,
                       168, 169, 171, 172, 174, 175, 176, 177, 179, 181, 182, 185, 186, 238, 240, 241, 264, 265,
                       268, 269, 271, 276, 280, 281, 282, 283, 285, 286, 288, 289, 290, 291 },
            levels = {
                [33] = { acc = 121, eva = 111, agi = 34, int = 32, mnd = 32, chr = 33 },
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 127, agi = 39, int = 35, mnd = 35, chr = 36 },
            },
            spawn_levels = { [110] = { 33, 35 }, [112] = { 33, 35 }, [114] = { 33, 35 }, [115] = { 33, 35 },
                             [117] = { 33, 35 }, [119] = { 33, 35 }, [121] = { 33, 35 }, [122] = { 33, 35 },
                             [123] = { 33, 35 }, [125] = { 33, 35 }, [155] = { 33, 35 }, [157] = { 33, 35 },
                             [158] = { 33, 35 }, [160] = { 33, 35 }, [163] = { 33, 35 }, [164] = { 33, 35 },
                             [165] = { 33, 35 }, [166] = { 33, 35 }, [168] = { 33, 35 }, [169] = { 33, 35 },
                             [171] = { 33, 35 }, [172] = { 33, 35 }, [174] = { 33, 35 }, [175] = { 33, 35 },
                             [176] = { 33, 35 }, [177] = { 33, 35 }, [179] = { 33, 35 }, [181] = { 33, 35 },
                             [182] = { 33, 35 }, [185] = { 33, 35 }, [186] = { 33, 35 }, [238] = { 37, 38 },
                             [240] = { 37, 38 }, [241] = { 37, 38 }, [264] = { 37, 38 }, [265] = { 37, 38 },
                             [268] = { 37, 38 }, [269] = { 37, 38 }, [271] = { 37, 38 }, [276] = { 37, 38 },
                             [280] = { 37, 38 }, [281] = { 37, 38 }, [282] = { 37, 38 }, [283] = { 37, 38 },
                             [285] = { 37, 38 }, [286] = { 37, 38 }, [288] = { 37, 38 }, [289] = { 37, 38 },
                             [290] = { 37, 38 }, [291] = { 37, 38 } },
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
            name   = 'Wanderer',
            ids    = { 239, 262, 272, 275, 277, 284, 294, 295 },
            levels = {
                [34] = { acc = 125, eva = 114, agi = 35, int = 32, mnd = 32, chr = 33 },
                [35] = { acc = 128, eva = 118, agi = 36, int = 32, mnd = 32, chr = 34 },
                [36] = { acc = 132, eva = 121, agi = 37, int = 34, mnd = 34, chr = 35 },
            },
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
            name   = 'Satiator',
            ids    = { 323 },
            nm     = true,
            levels = {
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            drops  = {
                { rate = 1000, item = 1758 },  -- remnant of a satiator
                { rate = 240, item = 1721 },  -- beryl memosphere
                { rate = 240, item = 1721 },  -- beryl memosphere
                { rate = 240, item = 1721 },  -- beryl memosphere
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
