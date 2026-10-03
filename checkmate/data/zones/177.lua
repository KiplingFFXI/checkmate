-- VeLugannon Palace (zone 177).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Caretaker' },
    },
    monsters = {
        {
            name   = 'Ornamental Weapon',
            ids    = { 1, 2, 5, 6, 7, 8, 9, 10, 25, 26, 29, 30, 45, 46, 47, 48, 49, 50, 53, 54, 57, 58, 59, 60, 65,
                       66, 67, 68, 73, 74, 75 },
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 71, mnd = 58, chr = 72 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 72, mnd = 58, chr = 74 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 72, mnd = 59, chr = 74 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 1060 },  -- velugannon coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Detector',
            ids    = { 3, 13, 21, 23, 33, 35, 37, 39, 41, 51, 55, 78, 80, 82, 84, 86, 96, 100, 121, 127, 135, 139,
                       141, 143, 145, 147, 151, 159, 163, 165, 189, 195, 203, 207, 209, 211, 213, 215, 219, 227,
                       231, 253, 259, 267, 271, 273, 275, 277, 279, 283, 291, 295, 327, 329, 331, 333, 335, 337,
                       339, 341, 343, 345, 347, 349, 351, 353, 355, 357 },
            levels = {
                [72] = { acc = 301, eva = 291, agi = 88, int = 63, mnd = 52, chr = 68 },
                [73] = { acc = 306, eva = 296, agi = 89, int = 66, mnd = 54, chr = 68 },
                [74] = { acc = 312, eva = 302, agi = 90, int = 66, mnd = 54, chr = 69 },
            },
            ranks  = { thunder = -3, stun = -3 },
            drops  = {
                { rate = 50, item = 1060 },  -- velugannon coffer key
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Caretaker',
            ids    = { 4, 14, 22, 24, 34, 36, 38, 40, 42, 52, 56, 79, 81, 83, 85, 87, 97, 101, 122, 128, 136, 140,
                       142, 144, 146, 148, 152, 160, 164, 166, 190, 196, 204, 208, 210, 212, 214, 216, 220, 228,
                       232, 254, 260, 268, 272, 274, 276, 278, 280, 284, 292, 296, 328, 330, 332, 334, 336, 338,
                       340, 342, 344, 346, 348, 350, 352, 354, 356, 358 },
            levels = {
                [76] = { acc = 323, eva = 304, agi = 76, int = 59, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 309, agi = 76, int = 60, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 314, agi = 77, int = 60, mnd = 60, chr = 73 },
                [79] = { acc = 339, eva = 320, agi = 78, int = 61, mnd = 61, chr = 74 },
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
            name   = 'Mystic Weapon',
            ids    = { 11, 12, 15, 16, 17, 18, 19, 20, 27, 28, 90, 91, 92, 93, 94, 95, 98, 99, 102, 103, 104, 105,
                       110, 111, 114, 115, 118, 119, 120 },
            levels = {
                [74] = { acc = 308, eva = 280, agi = 64, int = 90, mnd = 77, chr = 78 },
                [75] = { acc = 313, eva = 285, agi = 65, int = 91, mnd = 77, chr = 79 },
                [76] = { acc = 319, eva = 291, agi = 66, int = 93, mnd = 80, chr = 80 },
                [77] = { acc = 324, eva = 295, agi = 66, int = 94, mnd = 80, chr = 81 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 1060 },  -- velugannon coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 31, 32, 43, 44, 61, 62, 63, 64, 69, 70, 71, 72 },
            levels = {
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            ids    = { 76, 77, 88, 89, 106, 107, 108, 109, 112, 113, 116, 117 },
            levels = {
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Dustbuster',
            ids    = { 123, 124, 125, 126, 129, 130, 131, 132, 133, 134, 153, 154, 155, 156, 157, 158, 161, 162,
                       167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184,
                       185, 186, 187, 188, 191, 192, 193, 194, 197, 198, 199, 200, 201, 202, 221, 222, 223, 224,
                       225, 226, 229, 230, 233, 234, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248,
                       249, 250, 251, 252 },
            levels = {
                [75] = { acc = 314, eva = 295, agi = 66, int = 80, mnd = 76, chr = 73 },
                [76] = { acc = 321, eva = 299, agi = 67, int = 81, mnd = 78, chr = 75 },
                [77] = { acc = 326, eva = 304, agi = 67, int = 82, mnd = 78, chr = 75 },
                [78] = { acc = 331, eva = 310, agi = 69, int = 82, mnd = 78, chr = 76 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 10, item = 1060 },  -- velugannon coffer key
                { rate = 100, item = 1430 },  -- red mages testimony
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, group = {  -- one of
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
            name   = 'Thunder Elemental',
            ids    = { 137, 138, 149, 150 },
            levels = {
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            ids    = { 205, 206, 217, 218, 235, 236 },
            levels = {
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Enkidu',
            ids    = { 255, 256, 257, 258, 261, 262, 263, 264, 265, 266, 285, 286, 287, 288, 289, 290, 293, 294,
                       297, 298, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 316, 317, 318, 319, 320,
                       321, 322, 323, 324, 325, 326 },
            levels = {
                [77] = { acc = 328, eva = 309, agi = 76, int = 65, mnd = 65, chr = 71 },
                [78] = { acc = 333, eva = 314, agi = 77, int = 65, mnd = 65, chr = 73 },
                [79] = { acc = 339, eva = 320, agi = 78, int = 66, mnd = 66, chr = 74 },
                [80] = { acc = 344, eva = 325, agi = 78, int = 66, mnd = 66, chr = 74 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 50, item = 955 },  -- golem shard
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 269, 270, 299, 300, 301, 302 },
            levels = {
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Fire Elemental',
            ids    = { 281, 282, 314, 315 },
            levels = {
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Mimic',
            ids    = { 359 },
            nm     = true,
            levels = {
                [70] = { acc = 289, eva = 278, agi = 81, int = 63, mnd = 63, chr = 53 },
            },
            drops  = {
                { rate = 1000, item = 1060 },  -- velugannon coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Brigandish Blade',
            ids    = { 360 },
            nm     = true,
            levels = {
                [82] = { acc = 358, eva = 337, agi = 85, int = 78, mnd = 64, chr = 80 },
                [83] = { acc = 364, eva = 342, agi = 85, int = 79, mnd = 64, chr = 80 },
                [84] = { acc = 371, eva = 348, agi = 87, int = 79, mnd = 65, chr = 81 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1441 },  -- libation abjuration
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Steam Cleaner',
            ids    = { 361 },
            nm     = true,
            levels = {
                [81] = { acc = 349, eva = 326, agi = 72, int = 87, mnd = 83, chr = 80 },
                [82] = { acc = 355, eva = 331, agi = 72, int = 87, mnd = 83, chr = 80 },
                [83] = { acc = 361, eva = 336, agi = 72, int = 87, mnd = 83, chr = 80 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1441 },  -- libation abjuration
                { rate = 100, item = 17511 },  -- indra katars
                { rate = 50, item = 1445 },  -- freyas tear
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Zipacna',
            ids    = { 362 },
            nm     = true,
            levels = {
                [83] = { acc = 364, eva = 340, agi = 81, int = 69, mnd = 69, chr = 76 },
                [84] = { acc = 371, eva = 346, agi = 82, int = 70, mnd = 70, chr = 77 },
                [85] = { acc = 377, eva = 351, agi = 83, int = 71, mnd = 71, chr = 79 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1442 },  -- oblation abjuration
                { rate = 100, item = 17804 },  -- ushikirimaru
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Uptala',
            ids    = { 363, 366, 369 },
            nm     = true,
            levels = {
                [95] = { acc = 447, eva = 409, agi = 102, int = 78, mnd = 78, chr = 87 },
                [96] = { acc = 455, eva = 414, agi = 105, int = 79, mnd = 79, chr = 88 },
            },
            ranks  = { ice = 5, wind = 2, earth = 3, thunder = 2, water = 2, dark = 9, paralyze = 5, bind = 5,
                       silence = 2, slow = 3, poison = 2, dark_sleep = 9, blind = 9, stun = 2, gravity = 2 },
            magic_dmg = { all = 10 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bisa',
            ids    = { 364, 367, 370 },
            nm     = true,
            levels = {
                [91] = { acc = 418, eva = 385, agi = 94, int = 70, mnd = 66, chr = 79 },
                [92] = { acc = 425, eva = 390, agi = 94, int = 70, mnd = 66, chr = 79 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Trna',
            ids    = { 365, 368, 371 },
            nm     = true,
            levels = {
                [91] = { acc = 418, eva = 385, agi = 94, int = 70, mnd = 66, chr = 79 },
                [92] = { acc = 425, eva = 390, agi = 94, int = 70, mnd = 66, chr = 79 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
