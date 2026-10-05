-- Konschtat Highlands (zone 108).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Mist Lizard' },
        [2] = { 'Rock Eater' },
        [3] = { 'Goblin Ambusher', 'Goblin Archaeologist', 'Goblin Butcher', 'Goblin Digger', 'Goblin Thug',
                'Goblin Tinkerer', 'Goblin Weaver' },
        [4] = { 'Amber Quadav', 'Amethyst Quadav', 'Greater Quadav', 'Onyx Quadav', 'Veteran Quadav',
                'Young Quadav' },
        [5] = { 'Mad Sheep', 'Stray Mary' },
        [6] = { 'Goblin Ambusher', 'Goblin Archaeologist', 'Goblin Butcher', 'Goblin Thug', 'Goblin Tinkerer',
                'Goblin Weaver' },
        [7] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Digger', 'Goblin Thug', 'Goblin Tinkerer',
                'Goblin Weaver' },
        [8] = { 'Gwynn ap Nudd' },
    },
    monsters = {
        {
            name   = 'Mist Lizard',
            ids    = { 1, 2, 3, 4, 5, 6, 26, 27, 28, 29, 30, 46, 47, 48, 49, 50, 51, 60, 61, 62, 97, 98, 99, 115,
                       116, 117, 118, 119, 120, 127, 128, 129, 130, 155, 156, 157, 158, 159, 170, 171, 191, 192,
                       264, 265, 266, 275, 276, 277, 288, 289, 290, 325, 326, 327, 374, 375, 384, 385, 386, 394,
                       395, 396 },
            levels = {
                [10] = { acc = 41, eva = 37, agi = 15, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [1] = { 10, 11 }, [2] = { 10, 11 }, [3] = { 10, 11 }, [4] = { 10, 11 },
                             [5] = { 10, 11 }, [6] = { 10, 11 }, [26] = { 10, 11 }, [27] = { 10, 11 },
                             [28] = { 10, 11 }, [29] = { 10, 11 }, [30] = { 10, 11 }, [46] = { 11, 12 },
                             [47] = { 11, 12 }, [48] = { 11, 12 }, [49] = { 11, 12 }, [50] = { 11, 12 },
                             [51] = { 11, 12 }, [60] = { 11, 12 }, [61] = { 11, 12 }, [62] = { 11, 12 },
                             [97] = { 11, 12 }, [98] = { 11, 12 }, [99] = { 11, 12 }, [115] = { 11, 12 },
                             [116] = { 11, 12 }, [117] = { 11, 12 }, [118] = { 12, 12 }, [119] = { 11, 12 },
                             [120] = { 11, 12 }, [127] = { 11, 12 }, [128] = { 11, 11 }, [129] = { 11, 12 },
                             [130] = { 11, 12 }, [155] = { 11, 11 }, [156] = { 11, 12 }, [157] = { 11, 12 },
                             [158] = { 11, 12 }, [159] = { 11, 12 }, [170] = { 11, 12 }, [171] = { 11, 12 },
                             [191] = { 11, 12 }, [192] = { 11, 12 }, [264] = { 11, 12 }, [265] = { 11, 12 },
                             [266] = { 11, 12 }, [275] = { 11, 12 }, [276] = { 11, 12 }, [277] = { 11, 12 },
                             [288] = { 11, 12 }, [289] = { 11, 12 }, [290] = { 11, 12 }, [325] = { 11, 12 },
                             [326] = { 11, 12 }, [327] = { 11, 12 }, [374] = { 11, 12 }, [375] = { 11, 12 },
                             [384] = { 11, 12 }, [385] = { 11, 12 }, [386] = { 11, 12 }, [394] = { 11, 12 },
                             [395] = { 11, 12 }, [396] = { 11, 12 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 50, item = 852 },  -- lizard skin
            },
            links  = 1,
        },
        {
            name   = 'Strolling Sapling',
            ids    = { 7, 8, 9, 10, 11, 12, 31, 32, 33, 34, 58, 59, 67, 68, 69, 70, 71, 72, 75, 76, 104, 105, 106,
                       107, 108, 109, 124, 125, 126, 135, 136, 137, 138, 167, 168, 179, 180, 200, 201, 212, 213,
                       222, 223, 232, 233, 261, 262, 272, 273, 274, 282, 283, 284, 285, 286, 287, 295, 296, 297,
                       298, 299, 300, 322, 323, 333, 334, 350, 351, 359, 360, 381, 382, 392, 393, 401, 402 },
            levels = {
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 11, mnd = 11, chr = 11 },
                [11] = { acc = 44, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 13, mnd = 13, chr = 13 },
            },
            spawn_levels = { [7] = { 8, 9 }, [8] = { 8, 9 }, [9] = { 8, 9 }, [10] = { 8, 9 }, [11] = { 8, 9 },
                             [12] = { 8, 9 }, [31] = { 8, 9 }, [32] = { 8, 9 }, [33] = { 8, 9 }, [34] = { 8, 9 },
                             [58] = { 8, 9 }, [59] = { 8, 9 }, [67] = { 8, 9 }, [68] = { 8, 9 }, [69] = { 8, 9 },
                             [70] = { 8, 9 }, [71] = { 8, 9 }, [72] = { 8, 9 }, [75] = { 9, 10 }, [76] = { 9, 10 },
                             [104] = { 8, 9 }, [105] = { 8, 9 }, [106] = { 8, 9 }, [107] = { 8, 9 },
                             [108] = { 8, 9 }, [109] = { 8, 9 }, [124] = { 9, 10 }, [125] = { 9, 10 },
                             [126] = { 9, 10 }, [135] = { 9, 10 }, [136] = { 9, 10 }, [137] = { 9, 10 },
                             [138] = { 8, 9 }, [167] = { 8, 9 }, [168] = { 8, 9 }, [179] = { 8, 9 },
                             [180] = { 8, 9 }, [200] = { 8, 9 }, [201] = { 8, 9 }, [212] = { 8, 9 },
                             [213] = { 8, 9 }, [222] = { 8, 9 }, [223] = { 9, 9 }, [232] = { 12, 13 },
                             [233] = { 12, 13 }, [261] = { 8, 9 }, [262] = { 8, 9 }, [272] = { 8, 9 },
                             [273] = { 8, 9 }, [274] = { 8, 9 }, [282] = { 8, 9 }, [283] = { 8, 9 },
                             [284] = { 8, 9 }, [285] = { 8, 9 }, [286] = { 8, 9 }, [287] = { 8, 9 },
                             [295] = { 8, 9 }, [296] = { 8, 9 }, [297] = { 8, 9 }, [298] = { 8, 9 },
                             [299] = { 8, 9 }, [300] = { 8, 9 }, [322] = { 8, 9 }, [323] = { 8, 9 },
                             [333] = { 8, 9 }, [334] = { 8, 9 }, [350] = { 10, 11 }, [351] = { 10, 11 },
                             [359] = { 10, 11 }, [360] = { 10, 11 }, [381] = { 10, 11 }, [382] = { 10, 11 },
                             [392] = { 10, 11 }, [393] = { 10, 11 }, [401] = { 10, 11 }, [402] = { 10, 11 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 100, item = 575 },  -- bag of grain seeds
                { rate = 50, item = 573 },  -- bag of vegetable seeds
            },
        },
        {
            name   = 'Rock Eater',
            ids    = { 13, 14, 15, 16, 17, 18, 36, 37, 38, 77, 78, 79, 80, 81, 82, 151, 152, 153, 154, 335, 336,
                       337, 338, 339 },
            levels = {
                [10] = { acc = 40, eva = 35, agi = 14, int = 18, mnd = 13, chr = 12 },
                [11] = { acc = 43, eva = 38, agi = 15, int = 20, mnd = 14, chr = 13 },
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
            links  = 2,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 19, 23, 182, 183, 235, 236, 252, 363 },
            levels = {
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
                [9] = { acc = 39, eva = 38, agi = 16, int = 14, mnd = 9, chr = 9 },
                [10] = { acc = 42, eva = 51, agi = 17, int = 15, mnd = 10, chr = 10 },
                [12] = { acc = 49, eva = 58, agi = 18, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 53, eva = 61, agi = 19, int = 17, mnd = 12, chr = 12 },
            },
            spawn_levels = { [19] = { 9, 10 }, [23] = { 9, 10 }, [182] = { 9, 10 }, [183] = { 9, 10 },
                             [235] = { 12, 13 }, [236] = { 8, 10 }, [252] = { 8, 9 }, [363] = { 9, 10 } },
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
            links  = 3,
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 20, 184, 237, 238, 253, 364, 365, 404 },
            levels = {
                [12] = { acc = 56, eva = 41, agi = 20, int = 13, mnd = 13, chr = 13 },
                [13] = { acc = 60, eva = 44, agi = 21, int = 14, mnd = 15, chr = 14 },
                [14] = { acc = 63, eva = 47, agi = 22, int = 14, mnd = 15, chr = 14 },
                [15] = { acc = 67, eva = 50, agi = 23, int = 15, mnd = 15, chr = 15 },
                [16] = { acc = 70, eva = 53, agi = 24, int = 16, mnd = 17, chr = 16 },
            },
            spawn_levels = { [20] = { 12, 13 }, [184] = { 12, 13 }, [364] = { 13, 14 }, [365] = { 13, 14 },
                             [404] = { 13, 14 } },
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
            links  = 3,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 21, 24, 185, 239, 240, 241, 249, 254, 366, 367 },
            levels = {
                [9] = { acc = 36, eva = 31, agi = 13, int = 14, mnd = 14, chr = 11 },
                [10] = { acc = 40, eva = 34, agi = 13, int = 15, mnd = 15, chr = 13, resist = { petrify = 10 } },
                [11] = { acc = 43, eva = 38, agi = 15, int = 16, mnd = 16, chr = 13, resist = { petrify = 10 } },
                [12] = { acc = 46, eva = 40, agi = 15, int = 16, mnd = 16, chr = 13, resist = { petrify = 10 } },
                [13] = { acc = 50, eva = 43, agi = 15, int = 17, mnd = 17, chr = 15, resist = { petrify = 10 } },
            },
            spawn_levels = { [21] = { 9, 10 }, [24] = { 9, 10 }, [185] = { 9, 10 }, [239] = { 9, 10 },
                             [240] = { 12, 13 }, [241] = { 12, 13 }, [249] = { 12, 13 }, [254] = { 11, 11 },
                             [366] = { 9, 10 }, [367] = { 9, 10 } },
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
            links  = 3,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 22, 25, 187, 244, 245, 251, 369, 370, 406 },
            levels = {
                [8] = { acc = 34, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 38, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 41, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [22] = { 12, 13 }, [25] = { 12, 13 }, [187] = { 12, 13 }, [244] = { 9, 10 },
                             [245] = { 9, 10 }, [251] = { 8, 9 }, [369] = { 13, 14 }, [370] = { 13, 14 },
                             [406] = { 13, 14 } },
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
            links  = 3,
        },
        {
            name   = 'Young Quadav',
            ids    = { 39, 43, 86, 87, 304 },
            levels = {
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 10, mnd = 11, chr = 12 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 12415 },  -- shell shield
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Onyx Quadav',
            ids    = { 40, 90, 141, 307, 409 },
            levels = {
                [13] = { acc = 50, eva = 43, agi = 14, int = 16, mnd = 17, chr = 15 },
                [14] = { acc = 53, eva = 46, agi = 14, int = 17, mnd = 18, chr = 15 },
                [15] = { acc = 57, eva = 48, agi = 15, int = 18, mnd = 18, chr = 15 },
            },
            spawn_levels = { [40] = { 13, 14 }, [90] = { 13, 14 }, [141] = { 13, 14 }, [307] = { 13, 14 },
                             [409] = { 14, 15 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { petrify = 10 },
            drops  = {
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Amethyst Quadav',
            ids    = { 41, 44, 91, 142, 149, 308 },
            levels = {
                [9] = { acc = 36, eva = 29, agi = 11, int = 11, mnd = 16, chr = 14 },
                [10] = { acc = 39, eva = 32, agi = 12, int = 11, mnd = 17, chr = 15 },
                [14] = { acc = 52, eva = 43, agi = 14, int = 13, mnd = 20, chr = 18 },
                [15] = { acc = 56, eva = 46, agi = 15, int = 15, mnd = 21, chr = 18 },
            },
            spawn_levels = { [41] = { 9, 10 }, [44] = { 9, 10 }, [91] = { 9, 10 }, [142] = { 9, 10 },
                             [149] = { 14, 15 }, [308] = { 9, 10 } },
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
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Amber Quadav',
            ids    = { 42, 45, 92, 143, 150, 309 },
            levels = {
                [9] = { acc = 38, eva = 31, agi = 14, int = 16, mnd = 11, chr = 11 },
                [10] = { acc = 41, eva = 33, agi = 15, int = 16, mnd = 12, chr = 13 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4862 },  -- scroll of blind
                { rate = 50, item = 4866 },  -- scroll of bind
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Huge Wasp',
            ids    = { 52, 53, 54, 55, 56, 57, 63, 64, 65, 66, 73, 74, 100, 101, 102, 103, 121, 122, 123, 131, 132,
                       133, 134, 160, 161, 162, 163, 164, 172, 173, 193, 194, 195, 196, 197, 204, 205, 215, 216,
                       225, 226, 255, 256, 267, 268, 269, 278, 279, 280, 281, 291, 292, 293, 294, 315, 316, 317,
                       328, 329, 330, 342, 343, 353, 354, 376, 377, 387, 388, 397, 398 },
            levels = {
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [52] = { 9, 10 }, [53] = { 9, 10 }, [54] = { 9, 10 }, [55] = { 9, 10 },
                             [56] = { 9, 10 }, [57] = { 9, 10 }, [63] = { 9, 10 }, [64] = { 9, 10 },
                             [65] = { 9, 10 }, [66] = { 9, 10 }, [73] = { 9, 10 }, [74] = { 9, 10 },
                             [100] = { 9, 10 }, [101] = { 9, 10 }, [102] = { 9, 10 }, [103] = { 9, 10 },
                             [121] = { 10, 11 }, [122] = { 10, 11 }, [123] = { 10, 11 }, [131] = { 10, 11 },
                             [132] = { 10, 11 }, [133] = { 10, 11 }, [134] = { 10, 11 }, [160] = { 9, 10 },
                             [161] = { 9, 10 }, [162] = { 9, 10 }, [163] = { 9, 10 }, [164] = { 9, 10 },
                             [172] = { 9, 10 }, [173] = { 9, 10 }, [193] = { 9, 10 }, [194] = { 9, 10 },
                             [195] = { 9, 10 }, [196] = { 9, 10 }, [197] = { 9, 10 }, [204] = { 9, 10 },
                             [205] = { 9, 10 }, [215] = { 9, 10 }, [216] = { 9, 10 }, [225] = { 9, 10 },
                             [226] = { 9, 10 }, [255] = { 11, 12 }, [256] = { 11, 12 }, [267] = { 11, 12 },
                             [268] = { 11, 12 }, [269] = { 11, 12 }, [278] = { 9, 10 }, [279] = { 9, 10 },
                             [280] = { 9, 10 }, [281] = { 9, 10 }, [291] = { 9, 10 }, [292] = { 9, 10 },
                             [293] = { 9, 10 }, [294] = { 9, 10 }, [315] = { 9, 10 }, [316] = { 9, 10 },
                             [317] = { 9, 10 }, [328] = { 9, 10 }, [329] = { 9, 10 }, [330] = { 9, 10 },
                             [342] = { 10, 11 }, [343] = { 10, 11 }, [353] = { 10, 11 }, [354] = { 10, 11 },
                             [376] = { 10, 11 }, [377] = { 10, 11 }, [387] = { 10, 11 }, [388] = { 10, 11 },
                             [397] = { 10, 11 }, [398] = { 10, 11 } },
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
            name   = 'Ghost',
            ids    = { 83, 84, 85, 312, 340 },
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
            name   = 'Veteran Quadav',
            ids    = { 88, 139, 148, 305, 407 },
            levels = {
                [13] = { acc = 50, eva = 44, agi = 12, int = 11, mnd = 17, chr = 17 },
                [14] = { acc = 53, eva = 47, agi = 12, int = 11, mnd = 18, chr = 18 },
                [15] = { acc = 57, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
            },
            spawn_levels = { [88] = { 13, 14 }, [139] = { 13, 14 }, [148] = { 14, 15 }, [305] = { 13, 14 },
                             [407] = { 14, 15 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Greater Quadav',
            ids    = { 89, 140, 306, 408 },
            levels = {
                [13] = { acc = 51, eva = 45, agi = 15, int = 16, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 48, agi = 15, int = 17, mnd = 12, chr = 12 },
                [15] = { acc = 58, eva = 51, agi = 15, int = 18, mnd = 12, chr = 12 },
            },
            spawn_levels = { [89] = { 13, 14 }, [140] = { 13, 14 }, [306] = { 13, 14 }, [408] = { 14, 15 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Skeleton Warrior',
            ids    = { 93, 94, 144, 145, 188, 246, 310, 371, 410 },
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
            ids    = { 95, 146, 189, 247, 311, 372, 411 },
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
            name   = 'Thunder Elemental',
            ids    = { 96, 373, 412 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 23, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 25, mnd = 19, chr = 19 },
                [20] = { acc = 73, eva = 65, agi = 21, int = 25, mnd = 19, chr = 19 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Poltergeist',
            ids    = { 110, 111, 112, 113, 114 },
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
            name   = 'Grenade',
            ids    = { 147, 248, 313 },
            levels = {
                [15] = { acc = 58, eva = 53, agi = 18, int = 13, mnd = 13, chr = 17 },
                [16] = { acc = 62, eva = 57, agi = 20, int = 13, mnd = 14, chr = 18 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 14, mnd = 15, chr = 18 },
            },
            spawn_levels = { [147] = { 15, 16 }, [313] = { 15, 16 } },
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
            name   = 'Mad Sheep',
            ids    = { 165, 166, 174, 175, 176, 177, 178, 198, 199, 206, 207, 208, 209, 210, 217, 218, 219, 220,
                       221, 227, 228, 229, 230, 231, 257, 258, 259, 260, 270, 271, 318, 319, 320, 321, 331, 332,
                       344, 345, 346, 347, 348, 355, 356, 357, 358, 378, 379, 380, 389, 390, 391, 399, 400 },
            levels = {
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 10, mnd = 11, chr = 12 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 12, mnd = 13, chr = 14 },
                [14] = { acc = 54, eva = 50, agi = 18, int = 12, mnd = 13, chr = 14 },
            },
            spawn_levels = { [165] = { 12, 13 }, [166] = { 12, 13 }, [174] = { 12, 13 }, [175] = { 12, 13 },
                             [176] = { 12, 13 }, [177] = { 12, 13 }, [178] = { 12, 13 }, [198] = { 12, 13 },
                             [199] = { 12, 13 }, [206] = { 12, 13 }, [207] = { 12, 13 }, [208] = { 12, 13 },
                             [209] = { 12, 13 }, [210] = { 12, 13 }, [217] = { 12, 13 }, [218] = { 12, 13 },
                             [219] = { 12, 13 }, [220] = { 12, 13 }, [221] = { 12, 13 }, [227] = { 12, 13 },
                             [228] = { 12, 13 }, [229] = { 9, 10 }, [230] = { 9, 10 }, [231] = { 9, 10 },
                             [257] = { 9, 10 }, [258] = { 9, 10 }, [259] = { 9, 10 }, [260] = { 9, 10 },
                             [270] = { 12, 13 }, [271] = { 12, 13 }, [318] = { 12, 13 }, [319] = { 12, 13 },
                             [320] = { 12, 13 }, [321] = { 12, 13 }, [331] = { 12, 13 }, [332] = { 12, 13 },
                             [344] = { 12, 13 }, [345] = { 12, 13 }, [346] = { 12, 13 }, [347] = { 12, 13 },
                             [348] = { 12, 13 }, [355] = { 12, 13 }, [356] = { 12, 13 }, [357] = { 12, 13 },
                             [358] = { 12, 13 }, [378] = { 13, 14 }, [379] = { 13, 14 }, [380] = { 13, 14 },
                             [389] = { 13, 14 }, [390] = { 13, 14 }, [391] = { 13, 14 }, [399] = { 13, 14 },
                             [400] = { 13, 14 } },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 882 },  -- sheep tooth
                { rate = 150, item = 505 },  -- sheepskin
                { rate = 240, item = 4372 },  -- slice of giant sheep meat
                { rate = 50, item = 882 },  -- sheep tooth, the despoil entry
            },
            links  = 5,
        },
        {
            name   = 'Wolf Zombie',
            ids    = { 169, 181, 202, 214, 224, 234, 263, 324, 352, 361, 383 },
            levels = {
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 40, eva = 37, agi = 15, int = 11, mnd = 10, chr = 13 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 11, chr = 15 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 13, mnd = 12, chr = 15 },
                [14] = { acc = 54, eva = 50, agi = 18, int = 13, mnd = 12, chr = 16 },
            },
            spawn_levels = { [169] = { 12, 13 }, [181] = { 12, 13 }, [202] = { 12, 13 }, [214] = { 12, 13 },
                             [224] = { 12, 13 }, [234] = { 9, 10 }, [263] = { 9, 10 }, [324] = { 12, 13 },
                             [352] = { 12, 13 }, [361] = { 12, 13 }, [383] = { 13, 14 } },
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
            name   = 'Goblin Tinkerer',
            ids    = { 186, 242, 243, 250, 362, 368, 405 },
            levels = {
                [9] = { acc = 38, eva = 33, agi = 13, int = 14, mnd = 9, chr = 9 },
                [10] = { acc = 41, eva = 37, agi = 14, int = 15, mnd = 10, chr = 10 },
                [12] = { acc = 48, eva = 42, agi = 15, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 17, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 49, agi = 17, int = 18, mnd = 12, chr = 12 },
            },
            spawn_levels = { [186] = { 12, 13 }, [242] = { 9, 10 }, [243] = { 12, 13 }, [250] = { 12, 13 },
                             [362] = { 12, 13 }, [368] = { 13, 14 }, [405] = { 13, 14 } },
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
            links  = 3,
        },
        {
            name   = 'Earth Elemental',
            ids    = { 190, 314, 341 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 23, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 25, mnd = 19, chr = 19 },
                [20] = { acc = 73, eva = 65, agi = 21, int = 25, mnd = 19, chr = 19 },
            },
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
            name   = 'Stray Mary',
            ids    = { 211, 349 },
            nm     = true,
            levels = {
                [19] = { acc = 71, eva = 66, agi = 22, int = 15, mnd = 16, chr = 18 },
                [20] = { acc = 74, eva = 69, agi = 22, int = 15, mnd = 16, chr = 18 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4527 },  -- jug of marys milk
                { rate = 150, item = 505 },  -- sheepskin
                { rate = 240, item = 4372 },  -- slice of giant sheep meat
                { rate = 100, item = 4378 },  -- jug of selbina milk
                { rate = 150, item = 17366 },  -- marys horn
                { rate = 50, item = 882 },  -- sheep tooth
            },
            links  = 5,
        },
        {
            name   = 'Tremor Ram',
            ids    = { 301, 403 },
            levels = {
                [22] = { acc = 81, eva = 75, agi = 24, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 1000, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Rampaging Ram',
            ids    = { 302 },
            nm     = true,
            levels = {
                [27] = { acc = 98, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 1000, item = 911 },  -- rampaging horn
                { rate = 240, item = 895 },  -- ram horn
                { rate = 1000, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Steelfleece Baldarich',
            ids    = { 303 },
            nm     = true,
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 911 },  -- rampaging horn
                { rate = 240, item = 895 },  -- ram horn
                { rate = 1000, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 12356 },  -- viking shield
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 413 },
            levels = {
                [13] = { acc = 53, eva = 61, agi = 19, int = 17, mnd = 12, chr = 12 },
                [14] = { acc = 56, eva = 65, agi = 20, int = 18, mnd = 12, chr = 12 },
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
            name   = 'Goblin Archaeologist',
            ids    = { 414 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
                [37] = { acc = 135, eva = 125, agi = 41, int = 29, mnd = 29, chr = 32, resist = { virus = 15 } },
                [38] = { acc = 138, eva = 128, agi = 41, int = 29, mnd = 29, chr = 33, resist = { virus = 15 } },
                [39] = { acc = 142, eva = 132, agi = 43, int = 31, mnd = 31, chr = 35, resist = { virus = 15 } },
                [40] = { acc = 145, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35, resist = { virus = 15 } },
                [41] = { acc = 150, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37, resist = { virus = 15 } },
                [42] = { acc = 153, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37, resist = { virus = 15 } },
                [43] = { acc = 156, eva = 145, agi = 47, int = 33, mnd = 33, chr = 38, resist = { virus = 15 } },
                [44] = { acc = 161, eva = 150, agi = 50, int = 34, mnd = 34, chr = 39, resist = { virus = 15 } },
                [45] = { acc = 164, eva = 153, agi = 50, int = 36, mnd = 36, chr = 40, resist = { virus = 15 } },
                [46] = { acc = 168, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40, resist = { virus = 15 } },
                [47] = { acc = 171, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41, resist = { virus = 15 } },
                [48] = { acc = 175, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42, resist = { virus = 15 } },
                [49] = { acc = 179, eva = 167, agi = 56, int = 38, mnd = 38, chr = 42, resist = { virus = 15 } },
                [50] = { acc = 183, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45, resist = { virus = 15 } },
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50, resist = { virus = 20 } },
                [57] = { acc = 222, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50, resist = { virus = 20 } },
                [58] = { acc = 227, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52, resist = { virus = 20 } },
                [59] = { acc = 233, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53, resist = { virus = 20 } },
                [60] = { acc = 238, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53, resist = { virus = 20 } },
                [61] = { acc = 243, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55, resist = { virus = 20 } },
                [62] = { acc = 248, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55, resist = { virus = 20 } },
                [63] = { acc = 253, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55, resist = { virus = 20 } },
                [64] = { acc = 259, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56, resist = { virus = 20 } },
                [65] = { acc = 264, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58, resist = { virus = 20 } },
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58, resist = { virus = 20 } },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59, resist = { virus = 20 } },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60, resist = { virus = 20 } },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63, resist = { virus = 25 } },
                [73] = { acc = 308, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64, resist = { virus = 25 } },
                [74] = { acc = 313, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64, resist = { virus = 25 } },
                [75] = { acc = 319, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65, resist = { virus = 25 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 748 },  -- gold beastcoin
                { rate = 100, item = 748 },  -- gold beastcoin
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 50, item = 507 },  -- goblin mail
                { rate = 10, item = 856 },  -- rabbit hide
                { rate = 10, item = 4196 },  -- rotten quiver
                { rate = 10, item = 4495 },  -- chunk of goblin chocolate
                { rate = 10, item = 640 },  -- chunk of copper ore
                { rate = 10, item = 688 },  -- arrowwood log
                { rate = 10, item = 948 },  -- carnation
                { rate = 10, item = 4197 },  -- rusty bolt case
                { rate = 10, item = 833 },  -- clump of moko grass
                { rate = 10, item = 868 },  -- handful of pugil scales
                { rate = 10, item = 485 },  -- broken willow fishing rod
                { rate = 10, item = 605 },  -- pickaxe
                { rate = 10, item = 840 },  -- chocobo feather
                { rate = 10, item = 943 },  -- pinch of poison dust
                { rate = 10, item = 936 },  -- chunk of rock salt
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Forger',
            ids    = { 415 },
            nm     = true,
            levels = {
                [32] = { acc = 117, eva = 107, agi = 33, int = 23, mnd = 24, chr = 31 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            magic_dmg = { all = 50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1152 },  -- lump of bomb steel
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Haty',
            ids    = { 416 },
            nm     = true,
            levels = {
                [14] = { acc = 54, eva = 50, agi = 18, int = 13, mnd = 12, chr = 16 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 18246 },  -- rogetsurin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bendigeit Vran',
            ids    = { 417 },
            nm     = true,
            levels = {
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 16 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 18246 },  -- rogetsurin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Gwynn ap Nudd',
            ids    = { 436, 437, 438 },
            nm     = true,
            levels = {
                [94] = { acc = 437, eva = 377, agi = 106, int = 111, mnd = 96, chr = 72 },
                [95] = { acc = 444, eva = 381, agi = 107, int = 113, mnd = 98, chr = 72 },
            },
            ranks  = { fire = 2, ice = 4, wind = 2, earth = 4, thunder = 2, water = 4, light = 4, dark = 8,
                       paralyze = 4, bind = 4, silence = 2, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 8,
                       blind = 8, stun = 2, gravity = 2 },
            magic_dmg = { all = -6.3 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 8,
        },
        {
            name   = 'Otherworldly Rimester',
            ids    = { 515 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
