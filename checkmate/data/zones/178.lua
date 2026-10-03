-- The Shrine of RuAvitau (zone 178).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Aura Gear' },
    },
    monsters = {
        {
            name   = 'Aura Weapon',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125,
                       126, 183, 184, 185, 186, 187, 188, 189, 208, 209, 210, 211, 212, 213, 214, 278, 279, 280,
                       281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298,
                       299, 300, 301, 302, 303, 304, 305, 306, 307 },
            levels = {
                [80] = { acc = 341, eva = 311, agi = 69, int = 96, mnd = 82, chr = 84 },
                [81] = { acc = 348, eva = 316, agi = 71, int = 99, mnd = 85, chr = 86 },
                [82] = { acc = 354, eva = 321, agi = 71, int = 99, mnd = 85, chr = 86 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Aura Pot',
            ids    = { 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 39,
                       40, 41, 42, 43, 44, 45, 46, 47, 342, 343, 344, 345, 346, 347 },
            levels = {
                [75] = { acc = 314, eva = 295, agi = 66, int = 80, mnd = 76, chr = 73 },
                [76] = { acc = 321, eva = 299, agi = 67, int = 81, mnd = 78, chr = 75 },
                [77] = { acc = 326, eva = 304, agi = 67, int = 82, mnd = 78, chr = 75 },
                [78] = { acc = 331, eva = 310, agi = 69, int = 82, mnd = 78, chr = 76 },
                [79] = { acc = 337, eva = 315, agi = 69, int = 84, mnd = 80, chr = 78 },
                [80] = { acc = 342, eva = 320, agi = 69, int = 84, mnd = 80, chr = 78 },
            },
            spawn_levels = { [27] = { 77, 80 }, [28] = { 77, 80 }, [29] = { 77, 80 }, [30] = { 77, 80 },
                             [31] = { 77, 80 }, [32] = { 77, 80 }, [33] = { 77, 80 }, [34] = { 77, 80 },
                             [35] = { 77, 80 }, [36] = { 77, 80 }, [39] = { 77, 80 }, [40] = { 77, 80 },
                             [41] = { 77, 80 }, [42] = { 77, 80 }, [43] = { 77, 80 }, [44] = { 77, 80 },
                             [45] = { 77, 80 }, [46] = { 77, 80 }, [47] = { 77, 80 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 100, item = 954 },  -- magic pot shard
                { rate = 100, item = 1430 },  -- red mages testimony
                { rate = 50, item = 914 },  -- vial of mercury
                { rate = 50, item = 1195 },  -- flask of romaeve spring water
                { rate = 10, group = {  -- one of
                    { 4774, 3500 },  -- scroll of thunder iii
                    { 4659, 2000 },  -- scroll of shell iv
                    { 4804, 2000 },  -- scroll of thundaga iii
                    { 4775, 1500 },  -- scroll of thunder iv
                    { 4820, 1000 },  -- scroll of burst
                } },
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 25, 26, 37, 38 },
            levels = {
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Aura Butler',
            ids    = { 48, 49, 50, 51, 52, 53, 54, 55, 56, 59, 60, 61, 62, 63, 64, 65, 67, 68, 69, 150, 151, 152,
                       153, 161, 162, 163, 164, 165, 166, 167, 168, 190, 191, 192, 193, 215, 216, 217, 218, 245,
                       246, 247, 248, 273, 274, 275, 276 },
            levels = {
                [77] = { acc = 328, eva = 309, agi = 76, int = 60, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 314, agi = 77, int = 60, mnd = 60, chr = 73 },
                [79] = { acc = 339, eva = 320, agi = 78, int = 61, mnd = 61, chr = 74 },
                [80] = { acc = 344, eva = 325, agi = 78, int = 61, mnd = 61, chr = 74 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 64, mnd = 64, chr = 76 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 64, mnd = 64, chr = 76 },
            },
            spawn_levels = { [48] = { 79, 82 }, [49] = { 79, 82 }, [50] = { 79, 82 }, [51] = { 79, 82 },
                             [52] = { 79, 82 }, [53] = { 79, 82 }, [54] = { 79, 82 }, [55] = { 79, 82 },
                             [56] = { 79, 82 }, [59] = { 79, 82 }, [60] = { 79, 82 }, [61] = { 79, 82 },
                             [62] = { 79, 82 }, [63] = { 79, 82 }, [64] = { 79, 82 }, [65] = { 79, 82 },
                             [67] = { 79, 82 }, [68] = { 79, 82 }, [69] = { 79, 82 }, [150] = { 77, 78 },
                             [151] = { 77, 78 }, [152] = { 77, 78 }, [153] = { 77, 78 }, [161] = { 77, 78 },
                             [162] = { 77, 78 }, [163] = { 77, 78 }, [164] = { 77, 78 }, [165] = { 77, 78 },
                             [166] = { 77, 78 }, [167] = { 77, 78 }, [168] = { 77, 78 }, [190] = { 77, 78 },
                             [191] = { 77, 78 }, [192] = { 77, 78 }, [193] = { 77, 78 }, [215] = { 77, 78 },
                             [216] = { 77, 78 }, [217] = { 77, 78 }, [218] = { 77, 78 }, [245] = { 77, 78 },
                             [246] = { 77, 78 }, [247] = { 77, 78 }, [248] = { 77, 78 }, [273] = { 77, 78 },
                             [274] = { 77, 78 }, [275] = { 77, 78 }, [276] = { 77, 78 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 57, 58, 70, 71 },
            levels = {
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Faust',
            ids    = { 66 },
            nm     = true,
            levels = {
                [83] = { acc = 364, eva = 340, agi = 81, int = 64, mnd = 64, chr = 76 },
                [84] = { acc = 371, eva = 346, agi = 82, int = 65, mnd = 65, chr = 77 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'slow', 'elegy', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1442 },  -- oblation abjuration
                { rate = 100, item = 16838 },  -- tonbo-giri
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Defender',
            ids    = { 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 171, 173, 175, 177, 181, 196, 198, 200, 202, 206,
                       233, 235, 237, 239, 243, 261, 263, 265, 267, 271 },
            levels = {
                [71] = { acc = 296, eva = 286, agi = 88, int = 63, mnd = 52, chr = 68 },
                [72] = { acc = 301, eva = 291, agi = 88, int = 63, mnd = 52, chr = 68 },
                [73] = { acc = 306, eva = 296, agi = 89, int = 66, mnd = 54, chr = 68 },
                [74] = { acc = 312, eva = 302, agi = 90, int = 66, mnd = 54, chr = 69 },
                [75] = { acc = 317, eva = 307, agi = 91, int = 67, mnd = 55, chr = 70 },
                [76] = { acc = 323, eva = 312, agi = 93, int = 67, mnd = 55, chr = 71 },
            },
            spawn_levels = { [72] = { 73, 76 }, [74] = { 73, 76 }, [76] = { 73, 76 }, [78] = { 73, 76 },
                             [80] = { 73, 76 }, [82] = { 73, 76 }, [84] = { 73, 76 }, [86] = { 73, 76 },
                             [88] = { 73, 76 }, [90] = { 73, 76 }, [171] = { 73, 76 }, [173] = { 73, 76 },
                             [175] = { 73, 76 }, [177] = { 73, 76 }, [181] = { 73, 76 }, [196] = { 73, 76 },
                             [198] = { 73, 76 }, [200] = { 73, 76 }, [202] = { 73, 76 }, [206] = { 73, 76 },
                             [233] = { 71, 74 }, [235] = { 71, 74 }, [237] = { 71, 74 }, [239] = { 71, 74 },
                             [243] = { 71, 74 }, [261] = { 71, 74 }, [263] = { 71, 74 }, [265] = { 71, 74 },
                             [267] = { 71, 74 }, [271] = { 71, 74 } },
            ranks  = { thunder = -3, stun = -3 },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Aura Gear',
            ids    = { 73, 75, 77, 79, 81, 83, 85, 87, 89, 91, 172, 174, 176, 178, 182, 197, 199, 201, 203, 207,
                       234, 236, 238, 240, 244, 262, 264, 266, 268, 272 },
            levels = {
                [76] = { acc = 323, eva = 304, agi = 76, int = 59, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 309, agi = 76, int = 60, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 314, agi = 77, int = 60, mnd = 60, chr = 73 },
                [79] = { acc = 339, eva = 320, agi = 78, int = 61, mnd = 61, chr = 74 },
                [80] = { acc = 344, eva = 325, agi = 78, int = 61, mnd = 61, chr = 74 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 64, mnd = 64, chr = 76 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 1,
        },
        {
            name   = 'Mother Globe',
            ids    = { 92 },
            nm     = true,
            levels = {
                [83] = { acc = 364, eva = 350, agi = 100, int = 85, mnd = 62, chr = 78 },
                [84] = { acc = 371, eva = 355, agi = 101, int = 86, mnd = 62, chr = 80 },
            },
            ranks  = { thunder = -3, stun = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1441 },  -- libation abjuration
                { rate = 100, item = 17774 },  -- shiranui
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Slave Globe',
            ids    = { 93, 94, 95, 96, 97, 98 },
            nm     = true,
            levels = {
                [77] = { acc = 328, eva = 318, agi = 94, int = 69, mnd = 56, chr = 71 },
                [78] = { acc = 333, eva = 323, agi = 94, int = 69, mnd = 57, chr = 73 },
                [79] = { acc = 339, eva = 329, agi = 96, int = 70, mnd = 57, chr = 74 },
            },
            ranks  = { thunder = -3, stun = -3 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Aura Statue',
            ids    = { 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 310, 311, 312, 313,
                       314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331,
                       332, 333, 336, 337, 338, 339, 340, 341 },
            levels = {
                [81] = { acc = 352, eva = 330, agi = 81, int = 69, mnd = 69, chr = 76 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 69, mnd = 69, chr = 76 },
                [83] = { acc = 364, eva = 340, agi = 81, int = 69, mnd = 69, chr = 76 },
                [84] = { acc = 371, eva = 346, agi = 82, int = 70, mnd = 70, chr = 77 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 100, item = 644 },  -- chunk of mythril ore
                { rate = 50, item = 955 },  -- golem shard
                { rate = 10, item = 1132 },  -- square of raxa
                { rate = 10, item = 2388 },  -- chunk of diorite
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ullikummi',
            ids    = { 114 },
            nm     = true,
            levels = {
                [85] = { acc = 366, eva = 318, agi = 70, int = 79, mnd = 107, chr = 92 },
                [86] = { acc = 373, eva = 323, agi = 70, int = 80, mnd = 108, chr = 95 },
                [87] = { acc = 379, eva = 327, agi = 70, int = 80, mnd = 110, chr = 95 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1442 },  -- oblation abjuration
                { rate = 100, item = 18199 },  -- ulfhedinn axe
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Decorative Weapon',
            ids    = { 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144,
                       145, 146, 147, 148, 149, 154, 155, 156, 157, 158, 159, 160, 219, 220, 221, 222, 223, 224,
                       225, 226, 227, 228, 229, 230, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 277 },
            levels = {
                [79] = { acc = 339, eva = 322, agi = 82, int = 75, mnd = 61, chr = 78 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 75, mnd = 61, chr = 78 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 78, mnd = 64, chr = 80 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 169, 170, 179, 180 },
            levels = {
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
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
            name   = 'Water Elemental',
            ids    = { 194, 195, 204, 205 },
            levels = {
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 231, 232, 241, 242 },
            levels = {
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
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
            name   = 'Earth Elemental',
            ids    = { 259, 260, 269, 270 },
            levels = {
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
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
            name   = 'Dark Elemental',
            ids    = { 308, 309, 334, 335 },
            levels = {
                [73] = { acc = 304, eva = 287, agi = 70, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52 },
            },
            spawn_levels = { [309] = { 74, 74 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'blind' },
            drops  = {
                { rate = 1000, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Olla Pequena',
            ids    = { 363 },
            nm     = true,
            levels = {
                [82] = { acc = 355, eva = 331, agi = 72, int = 87, mnd = 83, chr = 80 },
                [83] = { acc = 361, eva = 336, agi = 72, int = 87, mnd = 83, chr = 80 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Olla Media',
            ids    = { 364 },
            nm     = true,
            levels = {
                [84] = { acc = 371, eva = 343, agi = 77, int = 89, mnd = 66, chr = 68 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Olla Grande',
            ids    = { 365 },
            nm     = true,
            levels = {
                [85] = { acc = 370, eva = 347, agi = 74, int = 80, mnd = 95, chr = 88 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1441 },  -- libation abjuration
                { rate = 100, item = 16956 },  -- skofnung
                { rate = 50, item = 1445 },  -- freyas tear
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Kirin',
            ids    = { 366 },
            nm     = true,
            levels = {
                [92] = { acc = 415, eva = 357, agi = 84, int = 103, mnd = 93, chr = 85 },
            },
            ranks  = { fire = 4, ice = 4, wind = -2, earth = 10, thunder = 10, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = -2, slow = 10, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 11, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 17567 },  -- kirins pole
                { rate = 150, item = 12562 },  -- kirins osode
                { rate = 100, item = 4748 },  -- scroll of raise iii
                { rate = 100, item = 4818 },  -- scroll of quake
                { rate = 150, group = {  -- one of
                    { 831, 4000 },  -- square of shining cloth
                    { 658, 3000 },  -- damascus ingot
                    { 747, 3000 },  -- orichalcum ingot
                } },
                { rate = 150, group = {  -- one of
                    { 831, 4000 },  -- square of shining cloth
                    { 658, 3000 },  -- damascus ingot
                    { 747, 3000 },  -- orichalcum ingot
                } },
                { rate = 150, group = {  -- one of
                    { 1315, 4000 },  -- dryadic abjuration body
                    { 1340, 3000 },  -- neptunal abjuration body
                    { 1337, 3000 },  -- wyrmal abjuration legs
                } },
                { rate = 150, group = {  -- one of
                    { 1315, 4000 },  -- dryadic abjuration body
                    { 1340, 3000 },  -- neptunal abjuration body
                    { 1337, 3000 },  -- wyrmal abjuration legs
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Genbu',
            ids    = { 367 },
            nm     = true,
            levels = {
                [82] = { acc = 349, eva = 326, agi = 62, int = 81, mnd = 99, chr = 96 },
                [83] = { acc = 355, eva = 331, agi = 62, int = 82, mnd = 100, chr = 97 },
                [84] = { acc = 362, eva = 336, agi = 63, int = 82, mnd = 101, chr = 99 },
            },
            ranks  = { fire = 10, ice = 4, wind = 4, earth = 4, thunder = -2, water = 10, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 10, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = -2, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Seiryu',
            ids    = { 368 },
            nm     = true,
            levels = {
                [82] = { acc = 356, eva = 335, agi = 80, int = 80, mnd = 67, chr = 69 },
                [83] = { acc = 362, eva = 340, agi = 80, int = 80, mnd = 67, chr = 69 },
                [84] = { acc = 370, eva = 346, agi = 82, int = 81, mnd = 67, chr = 70 },
            },
            ranks  = { fire = 4, ice = -2, wind = 10, earth = 10, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 10, slow = 10, poison = 4, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 10 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Byakko',
            ids    = { 369 },
            nm     = true,
            levels = {
                [82] = { acc = 359, eva = 403, agi = 84, int = 71, mnd = 71, chr = 67 },
                [83] = { acc = 365, eva = 408, agi = 84, int = 71, mnd = 72, chr = 67 },
                [84] = { acc = 372, eva = 414, agi = 86, int = 72, mnd = 73, chr = 68 },
            },
            ranks  = { fire = 4, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 10, dark = -2,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 10, dark_sleep = -2,
                       blind = -2, stun = 4, gravity = 4 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Suzaku',
            ids    = { 370 },
            nm     = true,
            levels = {
                [82] = { acc = 355, eva = 335, agi = 81, int = 83, mnd = 83, chr = 80 },
                [83] = { acc = 361, eva = 340, agi = 81, int = 83, mnd = 83, chr = 80 },
                [84] = { acc = 368, eva = 346, agi = 82, int = 85, mnd = 85, chr = 82 },
            },
            ranks  = { fire = 10, ice = 10, wind = 4, earth = 4, thunder = 4, water = -2, light = 4, dark = 4,
                       paralyze = 10, bind = 10, silence = 4, slow = 4, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Kirins Avatar',
            ids    = { 371 },
            levels = {
                [78] = { acc = 331, eva = 292, agi = 80, int = 93, mnd = 68, chr = 72 },
                [79] = { acc = 337, eva = 297, agi = 82, int = 96, mnd = 69, chr = 75 },
                [80] = { acc = 342, eva = 302, agi = 82, int = 96, mnd = 69, chr = 75 },
                [81] = { acc = 349, eva = 307, agi = 85, int = 98, mnd = 71, chr = 77 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
        },
        {
            name   = 'Qilin',
            ids    = { 372, 377, 382 },
            nm     = true,
            levels = {
                [100] = { acc = 466, eva = 396, agi = 90, int = 112, mnd = 101, chr = 92 },
                [101] = { acc = 468, eva = 401, agi = 93, int = 114, mnd = 103, chr = 95 },
            },
            ranks  = { fire = 4, ice = 4, wind = -2, earth = 10, thunder = 10, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = -2, slow = 10, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 10, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bai Hu',
            ids    = { 373, 378, 383 },
            nm     = true,
            levels = {
                [98] = { acc = 471, eva = 490, agi = 99, int = 84, mnd = 83, chr = 78 },
                [99] = { acc = 479, eva = 496, agi = 101, int = 85, mnd = 85, chr = 79 },
            },
            ranks  = { fire = 4, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 10, dark = -2,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 10, dark_sleep = -2,
                       blind = -2, stun = 4, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Qing Long',
            ids    = { 374, 379, 384 },
            nm     = true,
            levels = {
                [98] = { acc = 472, eva = 423, agi = 83, int = 94, mnd = 84, chr = 82 },
                [99] = { acc = 480, eva = 429, agi = 84, int = 96, mnd = 85, chr = 82 },
            },
            ranks  = { fire = 4, ice = -2, wind = 10, earth = 10, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 10, slow = 10, poison = 4, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 10 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Zhu Que',
            ids    = { 375, 380, 385 },
            nm     = true,
            levels = {
                [98] = { acc = 465, eva = 406, agi = 90, int = 105, mnd = 105, chr = 96 },
                [99] = { acc = 473, eva = 411, agi = 91, int = 107, mnd = 107, chr = 98 },
            },
            ranks  = { fire = 10, ice = 10, wind = 4, earth = 4, thunder = 4, water = -2, light = 4, dark = 4,
                       paralyze = 10, bind = 10, silence = 4, slow = 4, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Xuan Wu',
            ids    = { 376, 381, 386 },
            nm     = true,
            levels = {
                [98] = { acc = 461, eva = 411, agi = 78, int = 100, mnd = 111, chr = 113 },
                [99] = { acc = 469, eva = 416, agi = 79, int = 102, mnd = 113, chr = 115 },
            },
            ranks  = { fire = 10, ice = 4, wind = 4, earth = 4, thunder = -2, water = 10, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 10, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 11, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
