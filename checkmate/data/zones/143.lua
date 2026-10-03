-- Palborough Mines (zone 143).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'BuGhi Howlblade', 'Copper Quadav',
                'Greater Quadav', 'NiGhu Nestfender', 'NoMho Crimsonarmor', 'Old Quadav', 'Onyx Quadav',
                'Veteran Quadav', 'Young Quadav', 'ZiGhi Boneeater' },
        [2] = { 'Pit Hare', 'Rabid Rat' },
        [3] = { 'Cave Funguar' },
        [4] = { 'Copper Beetle' },
        [5] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'Copper Quadav', 'Greater Quadav',
                'NiGhu Nestfender', 'NoMho Crimsonarmor', 'Old Quadav', 'Onyx Quadav', 'Veteran Quadav',
                'Young Quadav', 'ZiGhi Boneeater' },
        [6] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'BuGhi Howlblade', 'Copper Quadav',
                'Greater Quadav', 'NiGhu Nestfender', 'NoMho Crimsonarmor', 'Old Quadav', 'Onyx Quadav',
                'Veteran Quadav', 'Young Quadav' },
        [7] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'BuGhi Howlblade', 'Copper Quadav',
                'Greater Quadav', 'NiGhu Nestfender', 'Old Quadav', 'Onyx Quadav', 'Veteran Quadav', 'Young Quadav',
                'ZiGhi Boneeater' },
        [8] = { 'Amber Quadav', 'Amethyst Quadav', 'Brass Quadav', 'BuGhi Howlblade', 'Copper Quadav',
                'Greater Quadav', 'NoMho Crimsonarmor', 'Old Quadav', 'Onyx Quadav', 'Veteran Quadav',
                'Young Quadav', 'ZiGhi Boneeater' },
    },
    monsters = {
        {
            name   = 'Mine Crab',
            ids    = { 1, 2 },
            levels = {
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 11 },
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
            name   = 'Coral Crab',
            ids    = { 3 },
            levels = {
                [9] = { acc = 35, eva = 31, agi = 9, int = 9, mnd = 14, chr = 14 },
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
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
            name   = 'Stag Crab',
            ids    = { 4 },
            levels = {
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18 },
                [15] = { acc = 55, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
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
            name   = 'Snipper',
            ids    = { 5 },
            levels = {
                [18] = { acc = 65, eva = 59, agi = 14, int = 14, mnd = 20, chr = 20 },
                [19] = { acc = 69, eva = 62, agi = 14, int = 15, mnd = 22, chr = 22 },
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Young Quadav',
            ids    = { 6, 7, 11, 12, 16, 19, 22, 26, 31, 35, 38, 42, 45, 49, 54, 63, 68, 71, 74, 83, 92, 96, 99,
                       104, 108, 111, 112, 115, 118, 119, 122, 123, 127, 130, 137, 140, 143, 147, 150, 153, 154,
                       160, 161, 164, 203, 204, 217, 218 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 6, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9, resist = { virus = 10 } },
                [7] = { acc = 31, eva = 27, agi = 13, int = 8, mnd = 9, chr = 10, resist = { virus = 10 } },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11, resist = { virus = 10 } },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11, resist = { virus = 10 } },
                [10] = { acc = 41, eva = 37, agi = 15, int = 10, mnd = 11, chr = 12, resist = { virus = 10 } },
            },
            spawn_levels = { [6] = { 3, 4 }, [7] = { 3, 4 }, [11] = { 3, 4 }, [12] = { 3, 4 }, [16] = { 3, 4 },
                             [19] = { 3, 4 }, [22] = { 3, 4 }, [26] = { 3, 5 }, [31] = { 3, 5 }, [35] = { 3, 5 },
                             [38] = { 3, 5 }, [42] = { 3, 5 }, [45] = { 3, 5 }, [49] = { 4, 5 }, [54] = { 4, 5 },
                             [63] = { 4, 5 }, [68] = { 5, 7 }, [71] = { 5, 7 }, [74] = { 5, 7 }, [83] = { 4, 5 },
                             [92] = { 4, 5 }, [96] = { 5, 7 }, [99] = { 5, 7 }, [104] = { 5, 7 }, [108] = { 5, 7 },
                             [111] = { 5, 7 }, [112] = { 5, 7 }, [115] = { 7, 10 }, [118] = { 7, 10 },
                             [119] = { 7, 10 }, [122] = { 7, 10 }, [123] = { 7, 10 }, [127] = { 7, 10 },
                             [130] = { 7, 10 }, [137] = { 7, 10 }, [140] = { 7, 10 }, [143] = { 7, 10 },
                             [147] = { 7, 10 }, [150] = { 7, 10 }, [153] = { 7, 10 }, [154] = { 7, 10 },
                             [160] = { 7, 10 }, [161] = { 7, 10 }, [164] = { 7, 10 }, [203] = { 7, 10 },
                             [204] = { 7, 10 }, [217] = { 7, 10 }, [218] = { 7, 10 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 12415 },  -- shell shield
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Amethyst Quadav',
            ids    = { 8, 13, 20, 23, 27, 32, 36, 39, 43, 46, 50, 55, 64, 69, 72, 75, 84, 93, 97, 100, 105, 109,
                       113, 116, 120, 124, 128, 131, 138, 141, 144, 148, 151, 155, 162, 165, 205, 219 },
            levels = {
                [3] = { acc = 15, eva = 12, agi = 7, int = 7, mnd = 11, chr = 9 },
                [4] = { acc = 19, eva = 15, agi = 8, int = 7, mnd = 12, chr = 11 },
                [5] = { acc = 22, eva = 18, agi = 9, int = 9, mnd = 13, chr = 11 },
                [6] = { acc = 26, eva = 20, agi = 9, int = 9, mnd = 13, chr = 12 },
                [7] = { acc = 29, eva = 24, agi = 10, int = 9, mnd = 15, chr = 13 },
                [8] = { acc = 32, eva = 26, agi = 11, int = 11, mnd = 15, chr = 13 },
                [9] = { acc = 36, eva = 29, agi = 11, int = 11, mnd = 16, chr = 14 },
                [10] = { acc = 39, eva = 32, agi = 12, int = 11, mnd = 17, chr = 15 },
            },
            spawn_levels = { [8] = { 3, 4 }, [13] = { 3, 4 }, [20] = { 3, 4 }, [23] = { 3, 4 }, [27] = { 3, 5 },
                             [32] = { 3, 5 }, [36] = { 3, 5 }, [39] = { 3, 5 }, [43] = { 3, 5 }, [46] = { 3, 5 },
                             [50] = { 4, 5 }, [55] = { 4, 5 }, [64] = { 4, 5 }, [69] = { 5, 7 }, [72] = { 5, 7 },
                             [75] = { 5, 7 }, [84] = { 4, 5 }, [93] = { 4, 5 }, [97] = { 5, 7 }, [100] = { 5, 7 },
                             [105] = { 5, 7 }, [109] = { 5, 7 }, [113] = { 5, 7 }, [116] = { 7, 10 },
                             [120] = { 7, 10 }, [124] = { 7, 10 }, [128] = { 7, 10 }, [131] = { 7, 10 },
                             [138] = { 8, 10 }, [141] = { 7, 10 }, [144] = { 7, 10 }, [148] = { 7, 10 },
                             [151] = { 7, 10 }, [155] = { 7, 10 }, [162] = { 7, 10 }, [165] = { 7, 10 },
                             [205] = { 9, 10 }, [219] = { 7, 10 } },
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
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12984 },  -- ash clogs
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12856 },  -- slops
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Amber Quadav',
            ids    = { 9, 14, 21, 24, 28, 33, 37, 40, 44, 47, 51, 56, 65, 70, 73, 76, 85, 94, 98, 101, 106, 110,
                       114, 117, 121, 125, 129, 132, 139, 142, 145, 149, 152, 156, 163, 166, 206, 220 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 9, int = 11, mnd = 7, chr = 7 },
                [4] = { acc = 21, eva = 16, agi = 11, int = 11, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 14, mnd = 10, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
                [9] = { acc = 38, eva = 31, agi = 14, int = 16, mnd = 11, chr = 11 },
                [10] = { acc = 41, eva = 33, agi = 15, int = 16, mnd = 12, chr = 13 },
            },
            spawn_levels = { [9] = { 3, 4 }, [14] = { 3, 4 }, [21] = { 3, 4 }, [24] = { 3, 4 }, [28] = { 3, 5 },
                             [33] = { 3, 5 }, [37] = { 3, 5 }, [40] = { 3, 5 }, [44] = { 3, 5 }, [47] = { 3, 5 },
                             [51] = { 4, 5 }, [56] = { 4, 5 }, [65] = { 4, 5 }, [70] = { 5, 7 }, [73] = { 5, 7 },
                             [76] = { 5, 7 }, [85] = { 4, 5 }, [94] = { 4, 5 }, [98] = { 5, 7 }, [101] = { 5, 7 },
                             [106] = { 5, 7 }, [110] = { 5, 7 }, [114] = { 5, 7 }, [117] = { 7, 10 },
                             [121] = { 7, 10 }, [125] = { 7, 10 }, [129] = { 7, 10 }, [132] = { 7, 10 },
                             [139] = { 7, 10 }, [142] = { 7, 10 }, [145] = { 7, 10 }, [149] = { 7, 10 },
                             [152] = { 7, 10 }, [156] = { 7, 10 }, [163] = { 7, 10 }, [166] = { 7, 10 },
                             [206] = { 7, 10 }, [220] = { 7, 10 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 4866 },  -- scroll of bind
                { rate = 10, item = 4862 },  -- scroll of blind
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Pit Hare',
            ids    = { 10, 15, 17, 18, 25, 29, 30, 34, 41, 48, 52, 53, 57, 58, 59, 60, 61, 62, 66, 67, 77, 78, 79,
                       80, 81, 82, 86, 87, 95, 102, 103, 107, 126, 133, 134, 135, 146, 157, 158, 159, 207, 208 },
            levels = {
                [2] = { acc = 14, eva = 11, agi = 9, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [10] = { 2, 4 }, [15] = { 2, 4 }, [17] = { 2, 4 }, [18] = { 2, 4 }, [25] = { 2, 4 },
                             [29] = { 2, 4 }, [30] = { 2, 4 }, [34] = { 2, 4 }, [41] = { 2, 4 }, [48] = { 2, 4 },
                             [52] = { 3, 6 }, [53] = { 3, 6 }, [57] = { 3, 6 }, [58] = { 3, 6 }, [59] = { 3, 6 },
                             [60] = { 3, 6 }, [61] = { 3, 6 }, [62] = { 3, 6 }, [66] = { 3, 6 }, [67] = { 3, 6 },
                             [77] = { 3, 6 }, [78] = { 3, 6 }, [79] = { 3, 6 }, [80] = { 3, 6 }, [81] = { 3, 6 },
                             [82] = { 3, 6 }, [86] = { 3, 6 }, [87] = { 3, 6 }, [95] = { 3, 6 }, [102] = { 3, 6 },
                             [103] = { 3, 6 }, [107] = { 3, 6 }, [126] = { 5, 6 }, [133] = { 5, 6 },
                             [134] = { 5, 6 }, [135] = { 5, 6 }, [146] = { 5, 6 }, [157] = { 5, 6 },
                             [158] = { 5, 6 }, [159] = { 5, 6 }, [207] = { 5, 6 }, [208] = { 5, 6 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 2,
        },
        {
            name   = 'Cave Funguar',
            ids    = { 88, 89, 90, 91, 209, 210, 211, 212, 213, 214, 215 },
            levels = {
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 10, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 4374 },  -- sleepshroom
            },
            links  = 3,
        },
        {
            name   = 'Veteran Quadav',
            ids    = { 167, 172, 177, 180, 185, 188, 191, 194, 197, 200, 221, 224, 228, 238, 242, 246, 249, 252,
                       255, 258, 261, 265, 268, 271, 279, 285, 288, 291, 298, 301, 304, 309, 317, 322, 327, 330,
                       333, 336, 341 },
            levels = {
                [11] = { acc = 43, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 46, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
                [13] = { acc = 50, eva = 44, agi = 12, int = 11, mnd = 17, chr = 17 },
                [14] = { acc = 53, eva = 47, agi = 12, int = 11, mnd = 18, chr = 18 },
                [15] = { acc = 57, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
                [16] = { acc = 60, eva = 54, agi = 14, int = 13, mnd = 20, chr = 20 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 13, mnd = 20, chr = 20 },
                [18] = { acc = 67, eva = 59, agi = 14, int = 14, mnd = 20, chr = 20 },
            },
            spawn_levels = { [167] = { 11, 12 }, [172] = { 11, 13 }, [177] = { 12, 15 }, [180] = { 12, 15 },
                             [185] = { 12, 15 }, [188] = { 12, 15 }, [191] = { 12, 15 }, [194] = { 12, 15 },
                             [197] = { 12, 15 }, [200] = { 12, 15 }, [221] = { 11, 13 }, [224] = { 11, 13 },
                             [228] = { 11, 13 }, [238] = { 12, 15 }, [242] = { 12, 15 }, [246] = { 12, 15 },
                             [249] = { 12, 15 }, [252] = { 12, 15 }, [255] = { 12, 15 }, [258] = { 12, 15 },
                             [261] = { 12, 15 }, [265] = { 12, 15 }, [268] = { 12, 15 }, [271] = { 14, 18 },
                             [279] = { 12, 15 }, [285] = { 12, 15 }, [288] = { 14, 18 }, [291] = { 14, 18 },
                             [298] = { 14, 18 }, [301] = { 14, 18 }, [304] = { 14, 18 }, [309] = { 14, 18 },
                             [317] = { 14, 18 }, [322] = { 14, 18 }, [327] = { 14, 18 }, [330] = { 14, 18 },
                             [333] = { 14, 18 }, [336] = { 14, 18 }, [341] = { 14, 18 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
                { rate = 150, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Greater Quadav',
            ids    = { 168, 173, 178, 181, 186, 189, 192, 195, 198, 201, 222, 225, 229, 239, 243, 247, 250, 253,
                       256, 259, 262, 266, 269, 272, 280, 286, 289, 292, 299, 302, 305, 310, 318, 323, 328, 331,
                       334, 337, 342 },
            levels = {
                [11] = { acc = 45, eva = 39, agi = 13, int = 16, mnd = 11, chr = 11 },
                [12] = { acc = 48, eva = 41, agi = 13, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 45, agi = 15, int = 16, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 48, agi = 15, int = 17, mnd = 12, chr = 12 },
                [15] = { acc = 58, eva = 51, agi = 15, int = 18, mnd = 12, chr = 12 },
                [16] = { acc = 62, eva = 55, agi = 17, int = 19, mnd = 14, chr = 14 },
                [17] = { acc = 65, eva = 57, agi = 17, int = 19, mnd = 14, chr = 14 },
                [18] = { acc = 68, eva = 60, agi = 17, int = 20, mnd = 14, chr = 14 },
            },
            spawn_levels = { [168] = { 11, 13 }, [173] = { 11, 13 }, [178] = { 12, 15 }, [181] = { 12, 15 },
                             [186] = { 12, 15 }, [189] = { 12, 15 }, [192] = { 12, 15 }, [195] = { 12, 15 },
                             [198] = { 12, 15 }, [201] = { 12, 15 }, [222] = { 11, 13 }, [225] = { 11, 13 },
                             [229] = { 11, 13 }, [239] = { 12, 15 }, [243] = { 12, 15 }, [247] = { 12, 15 },
                             [250] = { 12, 15 }, [253] = { 12, 15 }, [256] = { 12, 15 }, [259] = { 12, 15 },
                             [262] = { 12, 15 }, [266] = { 12, 15 }, [269] = { 12, 15 }, [272] = { 14, 18 },
                             [280] = { 12, 15 }, [286] = { 12, 15 }, [289] = { 14, 18 }, [292] = { 14, 18 },
                             [299] = { 14, 18 }, [302] = { 14, 18 }, [305] = { 14, 18 }, [310] = { 14, 18 },
                             [318] = { 14, 18 }, [323] = { 14, 18 }, [328] = { 16, 18 }, [331] = { 14, 18 },
                             [334] = { 14, 18 }, [337] = { 14, 18 }, [342] = { 14, 18 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 13116 },  -- silver name tag
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Onyx Quadav',
            ids    = { 169, 174, 179, 182, 187, 190, 193, 196, 199, 202, 223, 226, 230, 240, 244, 248, 251, 254,
                       257, 260, 263, 267, 270, 273, 281, 287, 290, 293, 300, 303, 306, 311, 319, 324, 329, 332,
                       335, 338, 343 },
            levels = {
                [11] = { acc = 43, eva = 37, agi = 13, int = 16, mnd = 16, chr = 13 },
                [12] = { acc = 46, eva = 39, agi = 13, int = 16, mnd = 16, chr = 13 },
                [13] = { acc = 50, eva = 43, agi = 14, int = 16, mnd = 17, chr = 15 },
                [14] = { acc = 53, eva = 46, agi = 14, int = 17, mnd = 18, chr = 15 },
                [15] = { acc = 57, eva = 48, agi = 15, int = 18, mnd = 18, chr = 15 },
                [16] = { acc = 60, eva = 52, agi = 16, int = 19, mnd = 20, chr = 17 },
                [17] = { acc = 64, eva = 55, agi = 16, int = 19, mnd = 20, chr = 17 },
                [18] = { acc = 67, eva = 57, agi = 17, int = 20, mnd = 20, chr = 17 },
            },
            spawn_levels = { [169] = { 11, 13 }, [174] = { 11, 13 }, [179] = { 12, 15 }, [182] = { 12, 15 },
                             [187] = { 12, 15 }, [190] = { 12, 15 }, [193] = { 12, 15 }, [196] = { 12, 15 },
                             [199] = { 12, 15 }, [202] = { 12, 15 }, [223] = { 11, 13 }, [226] = { 11, 13 },
                             [230] = { 11, 13 }, [240] = { 12, 15 }, [244] = { 12, 15 }, [248] = { 12, 15 },
                             [251] = { 12, 15 }, [254] = { 12, 15 }, [257] = { 12, 15 }, [260] = { 12, 15 },
                             [263] = { 12, 15 }, [267] = { 12, 15 }, [270] = { 12, 15 }, [273] = { 14, 18 },
                             [281] = { 12, 15 }, [287] = { 14, 18 }, [290] = { 14, 18 }, [293] = { 14, 18 },
                             [300] = { 14, 18 }, [303] = { 14, 18 }, [306] = { 14, 18 }, [311] = { 14, 18 },
                             [319] = { 14, 18 }, [324] = { 14, 18 }, [329] = { 14, 17 }, [332] = { 14, 16 },
                             [335] = { 14, 18 }, [338] = { 14, 18 }, [343] = { 14, 18 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { petrify = 10 },
            drops  = {
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
                { rate = 150, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Copper Beetle',
            ids    = { 170, 171, 175, 176, 183, 184, 227, 231, 232, 233, 234, 235, 236, 241, 245 },
            levels = {
                [9] = { acc = 36, eva = 31, agi = 9, int = 9, mnd = 14, chr = 14 },
                [10] = { acc = 39, eva = 34, agi = 9, int = 9, mnd = 14, chr = 14 },
                [11] = { acc = 43, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 46, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 894 },  -- beetle jaw
            },
            links  = 4,
        },
        {
            name   = 'Mine Scorpion',
            ids    = { 216, 296, 339 },
            levels = {
                [14] = { acc = 53, eva = 50, agi = 18, int = 13, mnd = 13, chr = 14 },
                [15] = { acc = 57, eva = 53, agi = 18, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 60, eva = 57, agi = 20, int = 14, mnd = 14, chr = 16 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 16783 },  -- plantreaper
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'BuGhi Howlblade',
            ids    = { 237 },
            nm     = true,
            levels = {
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 1000, group = { { 12340, 9500 }, { 13071, 500 } } },  -- one of marine shield, scale gorget
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'ZiGhi Boneeater',
            ids    = { 264 },
            nm     = true,
            levels = {
                [15] = { acc = 57, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
                [16] = { acc = 60, eva = 54, agi = 14, int = 13, mnd = 20, chr = 20 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 12797, 9000 },  -- coarse gauntlets
                    { 16934, 1000 },  -- braveheart
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Rabid Rat',
            ids    = { 274, 275, 276, 277, 278, 282, 283, 284, 294, 295, 325, 326 },
            levels = {
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 46, agi = 17, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [282] = { 11, 12 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 2,
        },
        {
            name   = 'Scimitar Scorpion',
            ids    = { 297, 340 },
            levels = {
                [19] = { acc = 70, eva = 66, agi = 22, int = 16, mnd = 16, chr = 18 },
                [20] = { acc = 73, eva = 69, agi = 22, int = 16, mnd = 16, chr = 18 },
                [21] = { acc = 77, eva = 73, agi = 24, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1025 },  -- palborough chest key
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 16783 },  -- plantreaper
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Old Quadav',
            ids    = { 307, 312, 315, 320, 344, 347, 350, 353, 356, 359, 360, 362, 365, 368, 371 },
            levels = {
                [21] = { acc = 79, eva = 73, agi = 24, int = 17, mnd = 18, chr = 20 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 17, mnd = 18, chr = 20 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 17, mnd = 18, chr = 20 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 1025 },  -- palborough chest key
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12961 },  -- brass leggings
                { rate = 10, item = 12705 },  -- brass mittens
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Copper Quadav',
            ids    = { 308, 313, 316, 321, 345, 348, 351, 354, 357, 363, 366, 369, 372 },
            levels = {
                [21] = { acc = 81, eva = 89, agi = 26, int = 23, mnd = 17, chr = 17 },
                [22] = { acc = 84, eva = 92, agi = 26, int = 23, mnd = 17, chr = 17 },
                [23] = { acc = 87, eva = 95, agi = 26, int = 23, mnd = 17, chr = 17 },
            },
            spawn_levels = { [366] = { 22, 23 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 1025 },  -- palborough chest key
                { rate = 50, item = 1529 },  -- darksteel engraving
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12961 },  -- brass leggings
                { rate = 10, item = 12705 },  -- brass mittens
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Brass Quadav',
            ids    = { 346, 349, 352, 355, 358, 364, 367, 370, 373 },
            levels = {
                [21] = { acc = 79, eva = 72, agi = 22, int = 23, mnd = 17, chr = 17 },
                [22] = { acc = 82, eva = 74, agi = 22, int = 23, mnd = 17, chr = 17 },
                [23] = { acc = 85, eva = 77, agi = 22, int = 23, mnd = 17, chr = 17 },
            },
            spawn_levels = { [355] = { 21, 22 }, [358] = { 21, 22 }, [367] = { 21, 22 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { paralyze = 10 },
            drops  = {
                { rate = 150, item = 17397 },  -- shell bug
                { rate = 50, item = 1025 },  -- palborough chest key
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12961 },  -- brass leggings
                { rate = 10, item = 12705 },  -- brass mittens
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'NoMho Crimsonarmor',
            ids    = { 361 },
            nm     = true,
            levels = {
                [22] = { acc = 82, eva = 74, agi = 23, int = 17, mnd = 19, chr = 21 },
                [23] = { acc = 85, eva = 77, agi = 23, int = 17, mnd = 19, chr = 21 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 1000, group = { { 13837, 9000 }, { 17414, 1000 } } },  -- one of bonzes circlet, pixie mace
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'NiGhu Nestfender',
            ids    = { 374 },
            nm     = true,
            levels = {
                [53] = { acc = 195, eva = 175, agi = 39, int = 36, mnd = 57, chr = 57 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = 2, light_sleep = 9,
                       dark_sleep = 9, blind = -2, stun = -3, gravity = -2 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 1000, item = 1101 },  -- mottled quadav egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Incensed Pineapple',
            ids    = { 375 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Mind-warped Scorpion',
            ids    = { 376 },
            nm     = true,
            levels = {
                [139] = { acc = 490, eva = 638, agi = 139, int = 105, mnd = 105, chr = 117 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Awoken Ariri Samariri',
            ids    = { 377 },
            nm     = true,
            levels = {
                [119] = { acc = 481, eva = 506, agi = 140, int = 160, mnd = 95, chr = 117 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 1, thunder = -1, water = 8, light = 6, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 1, poison = 8, light_sleep = 6, dark_sleep = 2,
                       blind = 2, stun = 1, gravity = 2 },
            magic_dmg = { all = -25 },
        },
    },
    by_name = {},
}
