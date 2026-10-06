-- Aydeewa Subterrane (zone 68).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Phlebotomic Slug' },
        [2] = { 'Treant Sapling' },
        [3] = { 'Bluestreak Gyugyuroon', 'Qiqirn Archaeologist', 'Qiqirn Enterpriser', 'Qiqirn Lieuter',
                'Qiqirn Mosstrooper' },
        [4] = { 'Anautogenous Slug', 'Phlebotomic Slug' },
        [5] = { 'Defoliator' },
        [6] = { 'Mycohopper' },
        [7] = { 'Mold Eater' },
        [8] = { 'Qiqirn Archaeologist', 'Qiqirn Enterpriser', 'Qiqirn Lieuter', 'Qiqirn Mosstrooper' },
        [9] = { 'Nosferatu Bats' },
        [10] = { 'Nosferatu', 'Nosferatu Bats' },
        [11] = { 'Nosferatu Wolf' },
        [12] = { 'Nosferatu Murk' },
        [13] = { 'Pandemonium Warden' },
        [14] = { 'Pandemonium Lamp' },
        [15] = { 'Morta' },
        [16] = { 'Ravishing Rafflesia' },
    },
    monsters = {
        {
            name   = 'Cave Mold',
            ids    = { 1, 2 },
            levels = {
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 57, chr = 60 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 59, chr = 60 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Anautogenous Slug',
            ids    = { 3 },
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Cave Pugil',
            ids    = { 4 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 57 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1888 },  -- sack of silica
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Aydeewa Crab',
            ids    = { 5 },
            levels = {
                [68] = { acc = 271, eva = 250, agi = 45, int = 48, mnd = 71, chr = 71 },
                [69] = { acc = 276, eva = 255, agi = 45, int = 48, mnd = 72, chr = 72 },
                [70] = { acc = 281, eva = 260, agi = 45, int = 49, mnd = 73, chr = 73 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Treant Sapling AS CM',
            ids    = { 6, 7, 12, 13, 14, 15, 16, 19, 20, 21, 32, 33, 36, 37, 38, 39, 130, 131, 218, 221, 368, 370,
                       371, 375 },
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 52, chr = 55 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 55 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 57 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 54, mnd = 54, chr = 57 },
            },
            spawn_levels = { [6] = { 66, 68 }, [7] = { 66, 68 }, [12] = { 66, 68 }, [13] = { 66, 68 },
                             [14] = { 66, 68 }, [15] = { 66, 68 }, [16] = { 66, 68 }, [19] = { 66, 68 },
                             [20] = { 66, 68 }, [21] = { 66, 68 }, [32] = { 66, 68 }, [33] = { 66, 68 },
                             [36] = { 66, 68 }, [37] = { 66, 68 }, [38] = { 66, 68 }, [39] = { 67, 68 },
                             [218] = { 67, 69 }, [221] = { 67, 68 }, [368] = { 67, 69 }, [370] = { 67, 69 },
                             [371] = { 67, 69 }, [375] = { 67, 69 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
                { rate = 10, item = 575 },  -- bag of grain seeds
            },
            links  = 2,
        },
        {
            name   = 'Puktrap',
            ids    = { 8, 9, 10, 11, 40, 41, 61, 64, 66, 70, 71, 204, 205, 207, 377, 378, 379, 394, 395, 397 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
            },
            spawn_levels = { [8] = { 67, 69 }, [9] = { 67, 69 }, [10] = { 67, 69 }, [11] = { 67, 69 },
                             [40] = { 67, 69 }, [41] = { 67, 69 }, [61] = { 67, 69 }, [64] = { 67, 69 },
                             [66] = { 67, 69 }, [70] = { 67, 69 }, [71] = { 67, 69 }, [204] = { 69, 70 },
                             [205] = { 69, 70 }, [207] = { 69, 70 }, [377] = { 69, 70 }, [378] = { 69, 70 },
                             [379] = { 69, 70 }, [394] = { 69, 70 }, [395] = { 69, 70 }, [397] = { 69, 70 } },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Slime Mold',
            ids    = { 17, 18, 24, 25, 34, 35, 42, 43, 167, 168, 193, 194, 199, 200, 219, 220, 230, 231, 304, 305,
                       317, 318, 319, 320, 321, 322, 325, 327, 328, 334, 342, 346, 364, 365 },
            levels = {
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 57, chr = 60 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 59, chr = 60 },
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 59, chr = 61 },
            },
            spawn_levels = { [17] = { 67, 69 }, [18] = { 67, 69 }, [24] = { 67, 69 }, [25] = { 67, 69 },
                             [34] = { 67, 69 }, [35] = { 67, 69 }, [42] = { 67, 69 }, [43] = { 67, 69 },
                             [167] = { 68, 70 }, [168] = { 68, 70 }, [193] = { 68, 70 }, [194] = { 68, 70 },
                             [199] = { 68, 70 }, [200] = { 68, 70 }, [219] = { 68, 70 }, [220] = { 68, 70 },
                             [230] = { 68, 70 }, [231] = { 68, 70 }, [304] = { 68, 70 }, [305] = { 68, 70 },
                             [317] = { 68, 70 }, [318] = { 68, 70 }, [319] = { 68, 70 }, [320] = { 68, 70 },
                             [321] = { 68, 70 }, [322] = { 68, 70 }, [325] = { 68, 70 }, [327] = { 68, 70 },
                             [328] = { 68, 70 }, [334] = { 68, 70 }, [342] = { 68, 70 }, [346] = { 68, 70 },
                             [364] = { 68, 70 }, [365] = { 68, 70 } },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Qiqirn Enterpriser',
            ids    = { 22, 23, 26, 27, 30, 31, 44, 45, 46, 49, 50, 51, 52, 55, 347, 360, 369, 372, 376, 398, 399,
                       401, 408, 409 },
            levels = {
                [68] = { acc = 312, eva = 250, agi = 87, int = 57, mnd = 65, chr = 60 },
                [69] = { acc = 317, eva = 255, agi = 89, int = 57, mnd = 65, chr = 60 },
                [70] = { acc = 336, eva = 260, agi = 89, int = 57, mnd = 67, chr = 61 },
            },
            spawn_levels = { [49] = { 69, 70 }, [398] = { 69, 70 }, [399] = { 69, 70 }, [401] = { 69, 70 },
                             [408] = { 69, 70 }, [409] = { 69, 70 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 3,
        },
        {
            name   = 'Qiqirn Lieuter',
            ids    = { 28, 47, 53, 348, 350, 373, 402 },
            levels = {
                [68] = { acc = 286, eva = 318, agi = 81, int = 68, mnd = 48, chr = 48 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 69, mnd = 48, chr = 48 },
                [70] = { acc = 297, eva = 342, agi = 83, int = 69, mnd = 49, chr = 49 },
            },
            spawn_levels = { [402] = { 69, 70 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 3,
        },
        {
            name   = 'Fossorial Flea',
            ids    = { 56, 57, 91, 92, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 122, 123, 140, 141, 142,
                       143, 144, 147, 148, 159, 160, 161, 162, 169, 189, 190, 209, 210, 214, 215, 216, 217, 228,
                       229, 247, 248, 249, 252, 255, 256, 258, 261, 262 },
            levels = {
                [66] = { acc = 278, eva = 311, agi = 86, int = 82, mnd = 37, chr = 37 },
                [67] = { acc = 283, eva = 316, agi = 87, int = 83, mnd = 37, chr = 37 },
                [68] = { acc = 288, eva = 322, agi = 89, int = 83, mnd = 37, chr = 37 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 2, thunder = 1, water = -1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 2, poison = -1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2365 },  -- vial of demon blood
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Phlebotomic Slug',
            ids    = { 58, 59, 60, 222, 244, 246, 251, 254, 293, 294, 295, 296, 297, 298, 299, 300, 301, 302, 303,
                       306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 323, 324, 326, 330, 331, 332, 333,
                       335, 336, 337, 338, 339, 340, 341, 344, 345, 400, 404, 405, 406, 407, 410 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 59, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61 },
            },
            spawn_levels = { [58] = { 68, 70 }, [59] = { 68, 70 }, [60] = { 68, 70 }, [222] = { 68, 70 },
                             [244] = { 68, 70 }, [246] = { 68, 70 }, [251] = { 68, 70 }, [254] = { 68, 70 },
                             [293] = { 68, 70 }, [294] = { 68, 70 }, [295] = { 68, 70 }, [296] = { 68, 70 },
                             [297] = { 68, 70 }, [298] = { 68, 70 }, [299] = { 68, 70 }, [300] = { 68, 70 },
                             [301] = { 69, 69 }, [302] = { 68, 70 }, [303] = { 68, 70 }, [306] = { 68, 70 },
                             [307] = { 68, 70 }, [308] = { 68, 70 }, [309] = { 68, 70 }, [310] = { 68, 70 },
                             [311] = { 68, 70 }, [312] = { 68, 70 }, [313] = { 68, 70 }, [314] = { 68, 70 },
                             [315] = { 68, 70 }, [316] = { 68, 70 }, [323] = { 68, 70 }, [324] = { 68, 70 },
                             [326] = { 68, 70 }, [330] = { 68, 70 }, [331] = { 68, 70 }, [332] = { 68, 70 },
                             [333] = { 68, 70 }, [335] = { 68, 70 }, [336] = { 68, 70 }, [337] = { 68, 70 },
                             [338] = { 68, 70 }, [339] = { 68, 70 }, [340] = { 68, 70 }, [341] = { 68, 70 },
                             [344] = { 68, 70 }, [345] = { 68, 70 }, [400] = { 67, 69 }, [404] = { 67, 69 },
                             [405] = { 67, 69 }, [406] = { 67, 69 }, [407] = { 67, 69 }, [410] = { 67, 69 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 4,
        },
        {
            name   = 'Defoliator',
            ids    = { 62, 63, 65, 67, 68, 69, 72, 73, 75, 76, 77, 78, 79, 80, 82, 84, 86, 87, 89, 111, 112, 113,
                       116, 117, 118, 120, 121 },
            levels = {
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 278, agi = 72, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 58, chr = 64 },
            },
            spawn_levels = { [62] = { 68, 70 }, [63] = { 68, 70 }, [65] = { 68, 70 }, [67] = { 68, 70 },
                             [68] = { 68, 70 }, [69] = { 68, 70 }, [72] = { 68, 70 }, [73] = { 68, 70 },
                             [75] = { 68, 70 }, [76] = { 68, 70 }, [77] = { 68, 70 }, [78] = { 68, 70 },
                             [79] = { 70, 72 }, [80] = { 70, 72 }, [82] = { 70, 72 }, [84] = { 70, 72 },
                             [86] = { 70, 72 }, [87] = { 70, 72 }, [89] = { 70, 72 }, [111] = { 71, 73 },
                             [112] = { 71, 73 }, [113] = { 71, 73 }, [116] = { 71, 73 }, [117] = { 71, 73 },
                             [118] = { 71, 73 }, [120] = { 71, 73 }, [121] = { 71, 73 } },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4357 },  -- crawler egg
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Air Elemental',
            ids    = { 74, 85, 114, 329, 343 },
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
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
            name   = 'Aydeewa Diremite',
            ids    = { 81, 83, 88, 90, 132, 133, 136, 137, 240, 241, 242, 275, 276, 277, 286, 287, 288, 289, 290,
                       291, 380, 381, 382, 383, 384, 385 },
            levels = {
                [70] = { acc = 287, eva = 271, agi = 67, int = 73, mnd = 49, chr = 49 },
                [71] = { acc = 293, eva = 275, agi = 67, int = 75, mnd = 51, chr = 51 },
                [72] = { acc = 298, eva = 280, agi = 67, int = 75, mnd = 51, chr = 51 },
                [73] = { acc = 304, eva = 287, agi = 70, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52 },
            },
            spawn_levels = { [81] = { 70, 72 }, [83] = { 70, 72 }, [88] = { 70, 72 }, [90] = { 70, 72 },
                             [240] = { 72, 74 }, [241] = { 72, 74 }, [242] = { 72, 74 }, [380] = { 72, 74 },
                             [381] = { 72, 74 }, [382] = { 72, 74 }, [383] = { 72, 74 }, [384] = { 72, 74 },
                             [385] = { 72, 74 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2463 },  -- tuft of colorful hair
                { rate = 100, item = 1700 },  -- spool of bloodthread
                { rate = 50, item = 1626 },  -- bottle of avatar blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mycohopper',
            ids    = { 93, 94, 95, 96, 124, 125, 126, 127, 232, 233, 234, 235, 236, 237, 238, 239, 279, 280, 281,
                       282, 283, 284, 285 },
            levels = {
                [68] = { acc = 276, eva = 263, agi = 71, int = 50, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 51, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 51, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 52, mnd = 55, chr = 63 },
            },
            spawn_levels = { [93] = { 68, 70 }, [94] = { 68, 70 }, [95] = { 68, 70 }, [96] = { 68, 70 },
                             [232] = { 70, 71 }, [233] = { 70, 71 }, [234] = { 70, 71 }, [235] = { 70, 71 },
                             [236] = { 70, 71 }, [237] = { 70, 71 }, [238] = { 70, 71 }, [239] = { 70, 71 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4373 },  -- woozyshroom
                { rate = 100, item = 4375 },  -- danceshroom
                { rate = 50, item = 4386 },  -- king truffle
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Great Ameretat',
            ids    = { 97, 109, 110, 115, 119, 128, 129, 264, 267, 270, 274 },
            levels = {
                [73] = { acc = 308, eva = 290, agi = 76, int = 58, mnd = 54, chr = 64 },
                [74] = { acc = 313, eva = 295, agi = 77, int = 58, mnd = 54, chr = 64 },
                [75] = { acc = 319, eva = 300, agi = 77, int = 58, mnd = 55, chr = 65 },
                [76] = { acc = 325, eva = 306, agi = 80, int = 59, mnd = 55, chr = 66 },
            },
            spawn_levels = { [97] = { 73, 75 }, [109] = { 73, 75 }, [110] = { 73, 75 }, [115] = { 73, 75 },
                             [119] = { 73, 75 }, [128] = { 73, 75 }, [129] = { 73, 75 }, [264] = { 75, 76 },
                             [267] = { 75, 76 }, [270] = { 75, 76 }, [274] = { 75, 76 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = 3, thunder = -1, water = 3, light = -1, dark = 4,
                       paralyze = -1, bind = -1, silence = -1, slow = 3, poison = 3, light_sleep = -1,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 2307 },  -- vial of jodys acid
                { rate = 100, item = 2361 },  -- ameretat vine
                { rate = 100, item = 2361 },  -- ameretat vine
                { rate = 10, item = 1446 },  -- lacquer tree log
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cave Tiger',
            ids    = { 134, 135, 243, 245, 250, 253, 257, 259, 260, 263, 265, 266, 268, 269, 271, 272, 273, 278 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 50, mnd = 58, chr = 64 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 50, mnd = 58, chr = 64 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 50, mnd = 58, chr = 65 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 50, mnd = 59, chr = 66 },
            },
            spawn_levels = { [243] = { 73, 75 }, [245] = { 73, 75 }, [250] = { 73, 75 }, [253] = { 73, 75 },
                             [257] = { 73, 75 }, [259] = { 73, 75 }, [260] = { 73, 75 }, [263] = { 75, 76 },
                             [265] = { 75, 76 }, [266] = { 75, 76 }, [268] = { 75, 76 }, [269] = { 75, 76 },
                             [271] = { 75, 76 }, [272] = { 75, 76 }, [273] = { 75, 76 } },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Qiqirn Archaeologist',
            ids    = { 138, 139, 149, 150, 155, 156, 163, 170, 178, 181, 184, 191, 192, 195, 196, 197, 198, 203,
                       206, 208, 211, 223, 226, 227 },
            levels = {
                [73] = { acc = 353, eva = 275, agi = 93, int = 60, mnd = 70, chr = 64 },
                [74] = { acc = 358, eva = 281, agi = 94, int = 60, mnd = 70, chr = 64 },
                [75] = { acc = 363, eva = 286, agi = 96, int = 62, mnd = 70, chr = 65 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 3,
        },
        {
            name   = 'Qiqirn Mosstrooper',
            ids    = { 145, 151, 153, 157, 172, 187, 201, 212, 224 },
            levels = {
                [73] = { acc = 314, eva = 359, agi = 86, int = 72, mnd = 52, chr = 52, resist = { gravity = 20 } },
                [74] = { acc = 319, eva = 364, agi = 87, int = 73, mnd = 52, chr = 52, resist = { gravity = 20 } },
                [75] = { acc = 326, eva = 370, agi = 88, int = 74, mnd = 52, chr = 52, resist = { gravity = 25 } },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 3,
        },
        {
            name   = 'Mold Eater',
            ids    = { 164, 165, 166, 171, 174, 175, 176, 177, 179, 180, 182, 183, 185, 186, 292, 352, 353, 354,
                       356, 357, 358, 359, 361, 362, 363, 366, 367 },
            levels = {
                [69] = { acc = 281, eva = 259, agi = 68, int = 85, mnd = 64, chr = 62 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 85, mnd = 65, chr = 63 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 88, mnd = 67, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 7,
        },
        {
            name   = 'Qiqirn Mine',
            ids    = { 349, 374, 403 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            magic_dmg = { all = -50 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Crystal Eater',
            ids    = { 411 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 55, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            immune = { 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15978 },  -- rapture earring
                { rate = 100, item = 16072 },  -- brigands mask
            },
        },
        {
            name   = 'Bluestreak Gyugyuroon',
            ids    = { 412 },
            nm     = true,
            levels = {
                [80] = { acc = 391, eva = 311, agi = 101, int = 65, mnd = 75, chr = 69 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15531 },  -- qiqirn collar
                { rate = 100, item = 18706 },  -- peacemaker
            },
            links  = 8,
        },
        {
            name   = 'Nosferatu',
            ids    = { 413 },
            nm     = true,
            levels = {
                [87] = { acc = 383, eva = 333, agi = 82, int = 105, mnd = 91, chr = 82 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 107, mnd = 93, chr = 83 },
            },
            ranks  = { fire = 1, ice = 4, wind = 3, earth = 3, thunder = 1, water = 1, light = -1, dark = 11,
                       paralyze = 4, bind = 4, silence = 3, slow = 3, poison = 1, light_sleep = -1, dark_sleep = 11,
                       blind = 11, stun = 1, gravity = 3 },
            magic_dmg = { all = -25 },
            undead = true,
            drops  = {
                { rate = 1000, item = 2620 },  -- nosferatus claw
                { rate = 240, item = 19036 },  -- earth grip
                { rate = 240, item = 19033 },  -- wind grip
                { rate = 1000, group = {  -- one of
                    { 17960, 1 },  -- labrys
                    { 15021, 1 },  -- aurum gauntlets
                    { 11378, 1 },  -- enkidus leggings
                } },
                { rate = 100, group = {  -- one of
                    { 17960, 1 },  -- labrys
                    { 15021, 1 },  -- aurum gauntlets
                    { 11378, 1 },  -- enkidus leggings
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
            links  = 9,
        },
        {
            name   = 'Nosferatu Bats',
            ids    = { 414, 415, 416 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 10,
        },
        {
            name   = 'Nosferatu Wolf',
            ids    = { 417, 418, 419 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 54, chr = 68 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 54, chr = 69 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 55, chr = 70 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 11,
        },
        {
            name   = 'Nosferatu Murk',
            ids    = { 420, 421, 422 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 58, chr = 68 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 69 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 70 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 12,
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 423 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, meva = { all = 94 } },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, meva = { all = 88 } },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, meva = { all = 82 } },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 3503 },  -- chunk of mulcibars scoria
                { rate = 50, item = 3503 },  -- chunk of mulcibars scoria
                { rate = 1000, item = 2372 },  -- khimaira mane
                { rate = 1000, item = 2169 },  -- cerberus hide
                { rate = 1000, item = 2172 },  -- hydra scale
                { rate = 240, item = 2158 },  -- hydra fang
                { rate = 240, item = 2168 },  -- cerberus claw
                { rate = 240, item = 2371 },  -- khimaira horn
                { rate = 240, item = 11281 },  -- hachiryu haramaki
                { rate = 240, item = 18447 },  -- nanatsusayanotachi
                { rate = 240, item = 18759 },  -- shenlongs baghnakhs
                { rate = 240, item = 18594 },  -- dorje
            },
            links  = 13,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 424 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101, meva = { all = 94 } },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101, meva = { all = 88 } },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102, meva = { all = 82 } },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            resist = { status = 50 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            links  = 13,
        },
        {
            name   = 'Pandemonium Lamp',
            ids    = { 425, 426, 427, 428, 429, 430, 431, 432 },
            nm     = true,
            levels = {
                [77] = { acc = 326, eva = 315, agi = 89, int = 82, mnd = 78, chr = 58 },
                [78] = { acc = 331, eva = 320, agi = 89, int = 82, mnd = 79, chr = 59 },
                [79] = { acc = 337, eva = 326, agi = 91, int = 84, mnd = 80, chr = 60 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11 },
            magic_dmg = { all = -6.3 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            links  = 14,
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 433 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 434 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 435 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 436, 437, 438 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 331, agi = 86, int = 110, mnd = 91, chr = 95 },
                [87] = { acc = 383, eva = 335, agi = 87, int = 111, mnd = 91, chr = 96 },
                [88] = { acc = 389, eva = 340, agi = 87, int = 112, mnd = 93, chr = 97 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Pandemonium Warden',
            ids    = { 439, 440, 441 },
            nm     = true,
            levels = {
                [86] = { acc = 377, eva = 328, agi = 80, int = 101, mnd = 86, chr = 101 },
                [87] = { acc = 383, eva = 333, agi = 82, int = 101, mnd = 86, chr = 101 },
                [88] = { acc = 389, eva = 338, agi = 82, int = 102, mnd = 87, chr = 102 },
            },
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Chigre',
            ids    = { 442 },
            nm     = true,
            levels = {
                [82] = { acc = 369, eva = 413, agi = 105, int = 99, mnd = 45, chr = 45 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 2, thunder = 1, water = -1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 2, poison = -1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 2638 },  -- chigre
                { rate = 150, item = 15827 },  -- insect ring
                { rate = 150, item = 15828 },  -- blood ring
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Morta',
            ids    = { 443, 450, 457 },
            nm     = true,
            levels = {
                [94] = { acc = 444, eva = 472, agi = 102, int = 96, mnd = 65, chr = 65 },
                [95] = { acc = 452, eva = 478, agi = 104, int = 96, mnd = 65, chr = 65 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 3, thunder = 1, water = 6, light = 2, dark = 6,
                       paralyze = 2, bind = 2, silence = -1, slow = 3, poison = 6, light_sleep = 2, dark_sleep = 6,
                       blind = 6, stun = 1, gravity = 1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 15,
        },
        {
            name   = 'Ravishing Rafflesia',
            ids    = { 444, 445, 446, 447, 448, 449, 451, 452, 453, 454, 455, 456, 458, 459, 460, 461, 462, 463 },
            nm     = true,
            levels = {
                [92] = { acc = 429, eva = 461, agi = 100, int = 94, mnd = 64, chr = 60 },
                [93] = { acc = 437, eva = 467, agi = 102, int = 95, mnd = 65, chr = 60 },
            },
            ranks  = { fire = -2, wind = -1, earth = 3, thunder = 1, light = 2, silence = -1, slow = 3,
                       light_sleep = 2, stun = 1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
            links  = 16,
        },
        {
            name   = 'Missabikong',
            ids    = { 620 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 635, agi = 132, int = 113, mnd = 113, chr = 125 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 3, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 3, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Awoken Hrungnir',
            ids    = { 621 },
            nm     = true,
            levels = {
                [119] = { acc = 487, eva = 530, agi = 114, int = 97, mnd = 97, chr = 108 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
        },
    },
    by_name = {},
}
