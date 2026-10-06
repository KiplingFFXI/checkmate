-- Western Altepa Desert (zone 125).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Desert Spider' },
        [2] = { 'Celphie', 'Desert Dhalmel' },
        [3] = { 'Antican Eques', 'Antican Essedarius', 'Antican Hoplomachus', 'Antican Lanista',
                'Antican Retiarius', 'Antican Secutor' },
        [4] = { 'Desert Beetle' },
        [5] = { 'Desert Dhalmel' },
        [6] = { 'Goblin Bouncer', 'Goblin Digger', 'Goblin Enchanter', 'Goblin Hunter', 'Goblin Welldigger' },
        [7] = { 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter', 'Goblin Welldigger' },
        [8] = { 'Cactuar', 'Cactuar Cantautor', 'Sabotender Campeador', 'Sabotender Enamorado',
                'Sabotender Mercenario' },
    },
    monsters = {
        {
            name   = 'Ironshell',
            ids    = { 1 },
            levels = {
                [41] = { acc = 144, eva = 131, agi = 29, int = 31, mnd = 44, chr = 44 },
                [42] = { acc = 147, eva = 133, agi = 29, int = 31, mnd = 44, chr = 44 },
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
            name   = 'Apsaras',
            ids    = { 2 },
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 33 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 35 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bigclaw',
            ids    = { 3, 4 },
            levels = {
                [45] = { acc = 158, eva = 143, agi = 30, int = 32, mnd = 47, chr = 47 },
                [46] = { acc = 161, eva = 147, agi = 32, int = 34, mnd = 48, chr = 48 },
                [47] = { acc = 164, eva = 149, agi = 32, int = 35, mnd = 49, chr = 49 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Razorjaw Pugil',
            ids    = { 5 },
            levels = {
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 42 },
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 45 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Desert Spider',
            ids    = { 6, 7, 8, 9, 12, 13, 14, 15, 18, 19, 20, 21, 26, 27, 28, 29, 33, 34, 35, 42, 43, 44, 51, 52,
                       53, 57, 58, 59, 232, 256 },
            levels = {
                [40] = { acc = 145, eva = 134, agi = 40, int = 34, mnd = 34, chr = 30 },
                [41] = { acc = 150, eva = 139, agi = 44, int = 36, mnd = 36, chr = 32 },
                [42] = { acc = 153, eva = 141, agi = 44, int = 36, mnd = 36, chr = 32 },
                [43] = { acc = 156, eva = 144, agi = 44, int = 36, mnd = 36, chr = 33 },
                [44] = { acc = 161, eva = 148, agi = 47, int = 37, mnd = 37, chr = 33 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 50, item = 838 },  -- spider web
            },
            links  = 1,
        },
        {
            name   = 'Desert Dhalmel',
            ids    = { 10, 16, 22, 30, 36, 45, 46, 60, 61, 70, 190, 191, 199, 200, 208, 209, 221, 222, 234, 235,
                       236, 257, 258 },
            levels = {
                [44] = { acc = 158, eva = 147, agi = 44, int = 34, mnd = 34, chr = 39 },
                [45] = { acc = 161, eva = 150, agi = 45, int = 36, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 154, agi = 46, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 156, agi = 46, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 160, agi = 48, int = 37, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 100, item = 857 },  -- dhalmel hide
                { rate = 50, item = 857 },  -- dhalmel hide
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 50, item = 857 },  -- dhalmel hide
                { rate = 100, item = 893 },  -- giant femur
                { rate = 50, item = 938 },  -- sprig of papaka grass
            },
            links  = 2,
        },
        {
            name   = 'Desert Worm',
            ids    = { 11, 17, 24, 32, 39, 49, 56, 65, 66, 175, 176, 196, 197, 205, 206, 215, 216, 228, 229, 240,
                       241, 247, 262, 263 },
            levels = {
                [43] = { acc = 153, eva = 138, agi = 43, int = 53, mnd = 39, chr = 38 },
                [44] = { acc = 158, eva = 142, agi = 45, int = 55, mnd = 41, chr = 40 },
                [45] = { acc = 161, eva = 144, agi = 45, int = 56, mnd = 42, chr = 41 },
                [46] = { acc = 164, eva = 148, agi = 46, int = 57, mnd = 42, chr = 40 },
                [47] = { acc = 168, eva = 151, agi = 47, int = 58, mnd = 43, chr = 42 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
        },
        {
            name   = 'Antican Essedarius',
            ids    = { 23, 31, 37, 47, 54, 62, 63, 259 },
            levels = {
                [41] = { acc = 170, eva = 129, agi = 51, int = 37, mnd = 35, chr = 37 },
                [42] = { acc = 173, eva = 131, agi = 51, int = 37, mnd = 35, chr = 37 },
                [43] = { acc = 176, eva = 135, agi = 53, int = 38, mnd = 35, chr = 38 },
                [44] = { acc = 181, eva = 138, agi = 54, int = 39, mnd = 37, chr = 39 },
                [45] = { acc = 184, eva = 141, agi = 55, int = 40, mnd = 38, chr = 40 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { poison = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 50, item = 17320 },  -- iron arrow
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Earth Elemental',
            ids    = { 25, 41, 251, 254, 350, 358 },
            levels = {
                [56] = { acc = 212, eva = 192, agi = 57, int = 67, mnd = 54, chr = 55 },
                [57] = { acc = 217, eva = 196, agi = 57, int = 68, mnd = 54, chr = 55 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 68, mnd = 55, chr = 55 },
            },
            spawn_levels = { [350] = { 57, 58 } },
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
            name   = 'Cactuar',
            ids    = { 38, 48, 55, 64, 74, 75, 80, 81, 85, 86, 94, 95, 103, 104, 118, 143, 144, 153, 163, 164, 174,
                       261, 276, 277, 278, 279, 323, 324, 328, 336, 342, 343, 354, 362, 373, 412, 419 },
            levels = {
                [48] = { acc = 173, eva = 161, agi = 40, int = 33, mnd = 43, chr = 45 },
                [49] = { acc = 176, eva = 165, agi = 42, int = 33, mnd = 43, chr = 46 },
                [50] = { acc = 181, eva = 169, agi = 44, int = 33, mnd = 47, chr = 48 },
                [51] = { acc = 186, eva = 173, agi = 45, int = 36, mnd = 48, chr = 51 },
                [52] = { acc = 191, eva = 178, agi = 45, int = 36, mnd = 48, chr = 51 },
                [53] = { acc = 197, eva = 184, agi = 46, int = 36, mnd = 49, chr = 51 },
            },
            spawn_levels = { [38] = { 48, 52 }, [48] = { 48, 52 }, [55] = { 48, 52 }, [64] = { 48, 52 },
                             [74] = { 48, 52 }, [75] = { 48, 52 }, [80] = { 48, 52 }, [81] = { 48, 52 },
                             [85] = { 48, 52 }, [86] = { 48, 52 }, [94] = { 49, 53 }, [95] = { 48, 52 },
                             [103] = { 49, 53 }, [104] = { 49, 53 }, [118] = { 48, 52 }, [143] = { 49, 53 },
                             [144] = { 49, 53 }, [153] = { 49, 53 }, [163] = { 48, 52 }, [164] = { 49, 53 },
                             [174] = { 48, 52 }, [261] = { 48, 52 }, [276] = { 48, 52 }, [277] = { 48, 52 },
                             [278] = { 48, 52 }, [279] = { 48, 52 }, [323] = { 49, 53 }, [324] = { 49, 53 },
                             [328] = { 49, 53 }, [336] = { 49, 53 }, [342] = { 48, 52 }, [343] = { 48, 52 },
                             [354] = { 49, 53 }, [362] = { 49, 53 }, [373] = { 49, 53 }, [412] = { 49, 53 },
                             [419] = { 49, 53 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 4509 },  -- flask of distilled water
                { rate = 240, item = 1817 },  -- cactus arm
                { rate = 100, item = 916 },  -- cactuar needle
                { rate = 100, item = 1663 },  -- arnica root
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Tulwar Scorpion',
            ids    = { 40, 50, 73, 119, 145, 146, 147, 154, 155, 156, 165, 166, 167, 264, 329, 330, 338, 349, 357,
                       366, 367, 368, 369, 379, 392, 397, 398, 402, 407, 413, 420 },
            levels = {
                [53] = { acc = 195, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 200, eva = 190, agi = 58, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 206, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 212, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 1209 },  -- vial of desert venom
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Desert Beetle',
            ids    = { 67, 68, 69, 76, 77, 89, 90, 99, 100, 113, 114, 115, 122, 123, 124, 139, 140, 141, 149, 150,
                       159, 160, 169, 170, 192, 193, 201, 202, 210, 211, 212, 223, 224, 233, 242, 243, 265, 266,
                       267, 268, 269, 270, 271, 272, 273, 274, 275, 280, 281, 282, 283, 284, 285, 286, 287, 288,
                       289, 290, 291, 292, 293, 294, 295, 296, 297, 302, 303, 304, 307, 308, 309, 314, 318, 319,
                       320, 326, 327, 332, 333, 339, 340, 341, 351, 352, 353, 360, 361, 370, 371, 372, 387, 388,
                       389, 399, 400, 404, 405, 409, 416, 417 },
            levels = {
                [47] = { acc = 166, eva = 149, agi = 32, int = 32, mnd = 46, chr = 46 },
                [48] = { acc = 169, eva = 152, agi = 33, int = 33, mnd = 48, chr = 48 },
                [49] = { acc = 173, eva = 155, agi = 33, int = 33, mnd = 50, chr = 50 },
                [50] = { acc = 177, eva = 158, agi = 33, int = 33, mnd = 51, chr = 51 },
                [51] = { acc = 183, eva = 164, agi = 36, int = 36, mnd = 54, chr = 54 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 100, item = 889 },  -- beetle shell
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 4,
        },
        {
            name   = 'Antican Retiarius',
            ids    = { 71, 172, 194, 204, 213, 226, 227, 238, 239, 260, 300, 301 },
            levels = {
                [45] = { acc = 164, eva = 137, agi = 47, int = 55, mnd = 35, chr = 43 },
                [46] = { acc = 168, eva = 140, agi = 48, int = 55, mnd = 35, chr = 42 },
                [47] = { acc = 171, eva = 143, agi = 49, int = 57, mnd = 35, chr = 45 },
                [48] = { acc = 175, eva = 146, agi = 50, int = 57, mnd = 36, chr = 45 },
                [49] = { acc = 179, eva = 150, agi = 52, int = 58, mnd = 37, chr = 45 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1121 },  -- antican robe
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Antican Secutor',
            ids    = { 72, 78, 161, 171, 225, 230, 231, 244, 245, 298, 299, 305, 306, 310, 312, 313, 315, 316, 317,
                       321, 322, 334, 335, 390, 410 },
            levels = {
                [54] = { acc = 205, eva = 190, agi = 58, int = 43, mnd = 37, chr = 48, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 37, chr = 49, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 200, agi = 61, int = 44, mnd = 37, chr = 50, resist = { virus = 20 } },
                [57] = { acc = 222, eva = 205, agi = 61, int = 46, mnd = 40, chr = 50, resist = { virus = 20 } },
                [58] = { acc = 227, eva = 210, agi = 61, int = 46, mnd = 40, chr = 52, resist = { virus = 20 } },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 1540 },  -- dhalmel leather missive
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Antican Lanista',
            ids    = { 79, 84, 91, 101, 102, 108, 109, 112, 117, 126, 127, 132, 133, 137, 142, 151, 152, 162, 179,
                       182, 185, 186, 188, 189, 218, 219, 250, 311, 391, 395, 396, 401, 406, 411, 418, 424, 425,
                       429, 430, 432 },
            levels = {
                [54] = { acc = 205, eva = 173, agi = 58, int = 67, mnd = 42, chr = 52 },
                [55] = { acc = 210, eva = 177, agi = 58, int = 69, mnd = 43, chr = 52 },
                [56] = { acc = 216, eva = 183, agi = 61, int = 70, mnd = 43, chr = 55 },
                [57] = { acc = 222, eva = 187, agi = 61, int = 71, mnd = 44, chr = 55 },
                [58] = { acc = 227, eva = 192, agi = 61, int = 71, mnd = 46, chr = 55 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            drops  = {
                { rate = 150, item = 1980 },  -- jar of antican acid
                { rate = 100, item = 16995 },  -- piece of rotten meat
                { rate = 50, item = 1121 },  -- antican robe
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Desert Manticore',
            ids    = { 82, 87, 88, 96, 97, 98, 105, 106, 120, 121, 128, 129, 130, 426, 427, 428 },
            levels = {
                [53] = { acc = 195, eva = 183, agi = 54, int = 43, mnd = 43, chr = 42 },
                [54] = { acc = 200, eva = 188, agi = 55, int = 43, mnd = 43, chr = 42 },
                [55] = { acc = 206, eva = 194, agi = 56, int = 43, mnd = 43, chr = 43 },
                [56] = { acc = 212, eva = 199, agi = 58, int = 44, mnd = 44, chr = 43 },
                [57] = { acc = 217, eva = 204, agi = 58, int = 46, mnd = 46, chr = 44 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Antican Hoplomachus',
            ids    = { 83, 92, 93, 110, 111, 116, 125, 131, 135, 136, 177, 178, 180, 181, 183, 184, 187, 217, 220,
                       248, 249, 252, 253, 255, 394, 423, 433, 434, 435 },
            levels = {
                [54] = { acc = 200, eva = 180, agi = 39, int = 39, mnd = 52, chr = 58 },
                [55] = { acc = 206, eva = 185, agi = 39, int = 39, mnd = 52, chr = 58 },
                [56] = { acc = 211, eva = 190, agi = 41, int = 41, mnd = 54, chr = 61 },
                [57] = { acc = 216, eva = 195, agi = 41, int = 41, mnd = 55, chr = 61 },
                [58] = { acc = 222, eva = 200, agi = 41, int = 41, mnd = 55, chr = 61 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 50, item = 16995 },  -- piece of rotten meat
                { rate = 50, item = 1118 },  -- antican pauldron
                { rate = 10, item = 1478 },  -- xhifhut bow
                { rate = 10, item = 644 },  -- chunk of mythril ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 134, 138, 198, 207, 408, 415 },
            levels = {
                [56] = { acc = 212, eva = 192, agi = 57, int = 67, mnd = 54, chr = 55 },
                [57] = { acc = 217, eva = 196, agi = 57, int = 68, mnd = 54, chr = 55 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 68, mnd = 55, chr = 55 },
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
            name   = 'Phorusrhacos',
            ids    = { 148, 157, 158, 168, 393, 403, 414, 421, 431 },
            levels = {
                [57] = { acc = 220, eva = 207, agi = 65, int = 50, mnd = 50, chr = 54 },
                [58] = { acc = 225, eva = 212, agi = 65, int = 50, mnd = 50, chr = 56 },
                [59] = { acc = 231, eva = 218, agi = 67, int = 51, mnd = 51, chr = 57 },
                [60] = { acc = 236, eva = 223, agi = 67, int = 51, mnd = 51, chr = 57 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            drops  = {
                { rate = 150, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Antican Eques',
            ids    = { 173, 195, 203, 214, 246 },
            levels = {
                [45] = { acc = 160, eva = 144, agi = 32, int = 32, mnd = 42, chr = 47 },
                [46] = { acc = 164, eva = 148, agi = 34, int = 34, mnd = 43, chr = 48 },
                [47] = { acc = 167, eva = 150, agi = 35, int = 35, mnd = 43, chr = 49 },
                [48] = { acc = 171, eva = 153, agi = 35, int = 35, mnd = 44, chr = 50 },
                [49] = { acc = 174, eva = 156, agi = 35, int = 35, mnd = 47, chr = 52 },
            },
            ranks  = { fire = -1, ice = -2, wind = -3, earth = 4, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -3, slow = 4, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -3 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 150, item = 16995 },  -- piece of rotten meat
                { rate = 100, item = 1118 },  -- antican pauldron
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Celphie',
            ids    = { 237 },
            nm     = true,
            levels = {
                [47] = { acc = 169, eva = 156, agi = 37, int = 35, mnd = 43, chr = 41 },
                [48] = { acc = 173, eva = 160, agi = 39, int = 35, mnd = 43, chr = 42 },
                [49] = { acc = 177, eva = 164, agi = 41, int = 35, mnd = 43, chr = 42 },
                [50] = { acc = 181, eva = 168, agi = 42, int = 38, mnd = 47, chr = 45 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 893 },  -- giant femur
                { rate = 150, item = 15505 },  -- dhalmel whistle
                { rate = 240, item = 4359 },  -- slice of dhalmel meat
                { rate = 10, item = 938 },  -- sprig of papaka grass
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Fallen Knight',
            ids    = { 325, 337, 345, 346, 355, 363, 364, 375, 376 },
            levels = {
                [50] = { acc = 181, eva = 167, agi = 50, int = 54, mnd = 33, chr = 36 },
                [51] = { acc = 188, eva = 171, agi = 50, int = 56, mnd = 36, chr = 38 },
                [52] = { acc = 193, eva = 176, agi = 50, int = 56, mnd = 36, chr = 38 },
                [53] = { acc = 198, eva = 182, agi = 52, int = 57, mnd = 36, chr = 39 },
                [54] = { acc = 204, eva = 187, agi = 52, int = 58, mnd = 36, chr = 39 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Cactuar Cantautor',
            ids    = { 344 },
            nm     = true,
            levels = {
                [55] = { acc = 208, eva = 194, agi = 47, int = 37, mnd = 50, chr = 53 },
                [56] = { acc = 213, eva = 200, agi = 48, int = 38, mnd = 52, chr = 54 },
                [57] = { acc = 219, eva = 206, agi = 50, int = 38, mnd = 52, chr = 54 },
                [58] = { acc = 224, eva = 211, agi = 50, int = 39, mnd = 53, chr = 56 },
                [59] = { acc = 230, eva = 216, agi = 51, int = 39, mnd = 54, chr = 57 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 916 },  -- cactuar needle
                { rate = 1000, item = 1236 },  -- bag of cactus stems
                { rate = 1000, item = 916 },  -- cactuar needle
                { rate = 100, item = 14128 },  -- kung fu shoes
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lich',
            ids    = { 347, 348, 356, 365, 377, 378 },
            levels = {
                [49] = { acc = 178, eva = 150, agi = 52, int = 58, mnd = 40, chr = 45 },
                [50] = { acc = 181, eva = 153, agi = 54, int = 63, mnd = 42, chr = 50 },
                [51] = { acc = 188, eva = 158, agi = 56, int = 65, mnd = 45, chr = 50 },
                [52] = { acc = 193, eva = 163, agi = 56, int = 65, mnd = 45, chr = 50 },
                [53] = { acc = 198, eva = 167, agi = 57, int = 67, mnd = 45, chr = 52 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'King Vinegarroon',
            ids    = { 359 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { ice = -2, thunder = -2, water = 4, paralyze = -2, bind = -2, poison = 4, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'petrify' },
            drops  = {
                { rate = 240, item = 15223 },  -- aces helm
                { rate = 100, item = 901 },  -- venomous claw
                { rate = 100, item = 18255 },  -- heavy shell
            },
        },
        {
            name   = 'Goblin Welldigger',
            ids    = { 374, 383 },
            levels = {
                [51] = { acc = 193, eva = 224, agi = 63, int = 56, mnd = 38, chr = 38 },
                [52] = { acc = 198, eva = 229, agi = 63, int = 56, mnd = 38, chr = 38 },
                [53] = { acc = 204, eva = 235, agi = 64, int = 57, mnd = 39, chr = 39 },
                [54] = { acc = 209, eva = 240, agi = 65, int = 58, mnd = 39, chr = 39 },
                [55] = { acc = 216, eva = 246, agi = 67, int = 58, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 150, item = 4509 },  -- flask of distilled water
                { rate = 100, item = 605 },  -- pickaxe
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 50, item = 4518 },  -- strip of sheep jerky
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Bouncer',
            ids    = { 380, 381 },
            levels = {
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49, resist = { virus = 20 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Enchanter',
            ids    = { 382, 385 },
            levels = {
                [51] = { acc = 186, eva = 165, agi = 51, int = 56, mnd = 56, chr = 50 },
                [52] = { acc = 191, eva = 170, agi = 51, int = 56, mnd = 56, chr = 50 },
                [53] = { acc = 197, eva = 175, agi = 51, int = 57, mnd = 57, chr = 52 },
                [54] = { acc = 202, eva = 180, agi = 52, int = 58, mnd = 58, chr = 52 },
                [55] = { acc = 207, eva = 185, agi = 53, int = 58, mnd = 58, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 650 },  -- brass ingot
                { rate = 10, item = 744 },  -- silver ingot
                { rate = 5, item = 745 },  -- gold ingot
                { rate = 5, item = 746 },  -- platinum ingot
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Hunter',
            ids    = { 384, 386 },
            levels = {
                [51] = { acc = 221, eva = 164, agi = 69, int = 47, mnd = 50, chr = 47 },
                [52] = { acc = 226, eva = 169, agi = 69, int = 47, mnd = 50, chr = 47 },
                [53] = { acc = 232, eva = 174, agi = 70, int = 48, mnd = 52, chr = 48 },
                [54] = { acc = 237, eva = 179, agi = 71, int = 48, mnd = 52, chr = 48 },
                [55] = { acc = 242, eva = 184, agi = 73, int = 49, mnd = 52, chr = 49 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Digger',
            ids    = { 436 },
            levels = {
                [51] = { acc = 193, eva = 224, agi = 63, int = 56, mnd = 38, chr = 38 },
                [52] = { acc = 198, eva = 229, agi = 63, int = 56, mnd = 38, chr = 38 },
                [53] = { acc = 204, eva = 235, agi = 64, int = 57, mnd = 39, chr = 39 },
                [54] = { acc = 209, eva = 240, agi = 65, int = 58, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Sabotender Enamorado',
            ids    = { 437 },
            nm     = true,
            levels = {
                [63] = { acc = 248, eva = 239, agi = 70, int = 46, mnd = 46, chr = 59 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Eastern Sphinx',
            ids    = { 438 },
            nm     = true,
            levels = {
                [62] = { acc = 243, eva = 230, agi = 63, int = 58, mnd = 51, chr = 50 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Western Sphinx',
            ids    = { 439 },
            nm     = true,
            levels = {
                [62] = { acc = 243, eva = 230, agi = 63, int = 58, mnd = 51, chr = 50 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Maharaja',
            ids    = { 440 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 327, agi = 82, int = 52, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Sabotender Campeador',
            ids    = { 442 },
            nm     = true,
            levels = {},
            ranks  = { ice = -2, wind = 2, earth = 2, water = 6, light = 6, paralyze = -2, bind = -2, silence = 2,
                       slow = 2, poison = 6, light_sleep = 6, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sabotender Mercenario',
            ids    = { 443, 444, 445, 446, 447 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'King Uropygid',
            ids    = { 462 },
            nm     = true,
            levels = {},
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Awoken Dendainsonne',
            ids    = { 495 },
            nm     = true,
            levels = {
                [119] = { acc = 491, eva = 611, agi = 130, int = 107, mnd = 94, chr = 101 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
        },
    },
    by_name = {},
}
