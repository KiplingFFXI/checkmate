-- Mamook (zone 65).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Mamool Ja', 'Mamool Ja Bounder', 'Mamool Ja Conservator', 'Mamool Ja Mimicker',
                      'Mamool Ja Savant', 'Mamool Ja Sophist', 'Mamool Ja Spearman', 'Mamool Ja Strapper',
                      'Mamool Ja Zenist' },
            true_sight = { 'Mamool Ja Blusterer', 'Mamool Ja Infiltrator', 'Mamool Ja Lurker', 'Mamool Ja Mimer',
                           'Mamool Ja Philosopher', 'Mamool Ja Pikeman', 'Mamool Ja Stabler' },
        },
        [2] = { sound = { 'Carriage Lizard' } },
        [3] = { sound = { 'Mamool Ja Diver', 'Mamool Ja Frogman' } },
        [4] = { true_sound = { 'Poroggo' } },
        [5] = { sight = { 'Qiqirn Goldsmith' } },
        [6] = { sight = { 'Qiqirn Poulterer' } },
        [7] = { sound = { 'Spinner' } },
        [8] = { sound = { 'Nipper' } },
        [9] = {
            sight = { 'Mamool Ja Bounder', 'Mamool Ja Conservator', 'Mamool Ja Mimicker', 'Mamool Ja Savant',
                      'Mamool Ja Sophist', 'Mamool Ja Spearman', 'Mamool Ja Strapper', 'Mamool Ja Zenist' },
            true_sight = { 'Mamool Ja Blusterer', 'Mamool Ja Infiltrator', 'Mamool Ja Lurker', 'Mamool Ja Mimer',
                           'Mamool Ja Philosopher', 'Mamool Ja Pikeman', 'Mamool Ja Stabler' },
        },
        [10] = { sound = { 'Mikiluru', 'Mikirulu', 'Mikiruru', 'Nikilulu' } },
        [11] = { sound = { 'Mikilulu', 'Mikiluru', 'Mikirulu', 'Nikilulu' } },
        [12] = { sound = { 'Mikilulu', 'Mikiluru', 'Mikirulu', 'Mikiruru' } },
        [13] = { sound = { 'Mikilulu', 'Mikirulu', 'Mikiruru', 'Nikilulu' } },
        [14] = { sound = { 'Mikilulu', 'Mikiluru', 'Mikiruru', 'Nikilulu' } },
    },
    monsters = {
        {
            name   = 'Suhur Mas',
            ids    = { 1, 2 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mamool Ja Bloodsucker',
            ids    = { 3 },
            levels = {
                [69] = { acc = 282, eva = 269, agi = 72, int = 59, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mamook Mush',
            ids    = { 4 },
            levels = {
                [78] = { acc = 331, eva = 314, agi = 77, int = 60, mnd = 65, chr = 68 },
                [79] = { acc = 337, eva = 320, agi = 78, int = 61, mnd = 66, chr = 69 },
                [80] = { acc = 342, eva = 325, agi = 78, int = 61, mnd = 66, chr = 69 },
                [81] = { acc = 349, eva = 330, agi = 81, int = 64, mnd = 69, chr = 71 },
                [82] = { acc = 355, eva = 335, agi = 81, int = 64, mnd = 69, chr = 71 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mamook Crab',
            ids    = { 5 },
            levels = {
                [75] = { acc = 308, eva = 286, agi = 49, int = 52, mnd = 77, chr = 77 },
                [76] = { acc = 314, eva = 291, agi = 50, int = 54, mnd = 80, chr = 80 },
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
            name   = 'Mamool Ja Mimicker',
            ids    = { 6, 19, 56, 83, 91, 93, 120, 127, 160, 190, 195, 235, 237 },
            levels = {
                [73] = { acc = 302, eva = 286, agi = 68, int = 64, mnd = 64, chr = 64 },
                [74] = { acc = 307, eva = 291, agi = 69, int = 64, mnd = 64, chr = 64 },
                [75] = { acc = 313, eva = 297, agi = 70, int = 65, mnd = 65, chr = 65 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2331 },  -- blue mages testimony
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Hunting Raptor',
            ids    = { 7, 8, 9, 11, 12, 73, 74, 77, 78, 79, 80, 81, 340, 341, 342, 345, 349, 350, 368 },
            levels = {
                [73] = { acc = 310, eva = 359, agi = 86, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 315, eva = 364, agi = 87, int = 77, mnd = 52, chr = 52 },
                [75] = { acc = 321, eva = 370, agi = 88, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 327, eva = 375, agi = 89, int = 80, mnd = 54, chr = 54 },
            },
            spawn_levels = { [7] = { 73, 74 }, [8] = { 73, 74 }, [9] = { 73, 74 }, [11] = { 73, 74 },
                             [12] = { 73, 74 }, [73] = { 73, 74 }, [74] = { 73, 74 }, [77] = { 73, 74 },
                             [78] = { 73, 74 }, [79] = { 73, 74 }, [80] = { 73, 74 }, [81] = { 73, 74 },
                             [340] = { 75, 76 }, [341] = { 75, 76 }, [342] = { 75, 76 }, [345] = { 75, 76 },
                             [349] = { 75, 76 }, [350] = { 75, 76 }, [368] = { 75, 76 } },
            ranks  = { ice = -2, wind = 1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 1 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Colibri',
            ids    = { 13, 14, 20, 44, 45, 46, 47, 48, 84, 112, 113, 114, 220, 221, 222 },
            levels = {
                [70] = { acc = 282, eva = 278, agi = 57, int = 85, mnd = 85, chr = 79 },
                [71] = { acc = 288, eva = 284, agi = 60, int = 88, mnd = 88, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            drops  = {
                { rate = 240, item = 2150 },  -- colibri feather
                { rate = 100, item = 2171 },  -- colibri beak
            },
        },
        {
            name   = 'Mamool Ja Zenist',
            ids    = { 15, 25, 26, 57, 61, 72, 90, 121, 129, 163, 176, 179, 231 },
            levels = {
                [73] = { acc = 311, eva = 311, agi = 86, int = 70, mnd = 52, chr = 58 },
                [74] = { acc = 316, eva = 316, agi = 87, int = 70, mnd = 52, chr = 58 },
                [75] = { acc = 322, eva = 322, agi = 88, int = 70, mnd = 52, chr = 58 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Savant',
            ids    = { 16, 27, 36, 51, 59, 62, 87, 119, 122, 128, 135, 177, 194, 233 },
            levels = {
                [74] = { acc = 304, eva = 268, agi = 69, int = 64, mnd = 89, chr = 77 },
                [75] = { acc = 309, eva = 273, agi = 70, int = 65, mnd = 91, chr = 77 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Sophist',
            ids    = { 17, 28, 37, 52, 58, 65, 88, 117, 123, 131, 178, 180, 234 },
            levels = {
                [74] = { acc = 313, eva = 275, agi = 82, int = 89, mnd = 64, chr = 70 },
                [75] = { acc = 319, eva = 279, agi = 82, int = 91, mnd = 65, chr = 70 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Bounder',
            ids    = { 18, 53, 60, 69, 89, 118, 124, 130, 134, 184, 232, 236 },
            levels = {
                [73] = { acc = 314, eva = 359, agi = 86, int = 76, mnd = 52, chr = 52, resist = { gravity = 20 } },
                [74] = { acc = 319, eva = 364, agi = 87, int = 77, mnd = 52, chr = 52, resist = { gravity = 20 } },
                [75] = { acc = 326, eva = 370, agi = 88, int = 77, mnd = 52, chr = 52, resist = { gravity = 25 } },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2331 },  -- blue mages testimony
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Strapper',
            ids    = { 21, 85, 147, 174, 227, 229 },
            levels = {
                [73] = { acc = 308, eva = 283, agi = 62, int = 64, mnd = 64, chr = 89, resist = { slow = 20 } },
                [74] = { acc = 313, eva = 288, agi = 63, int = 64, mnd = 64, chr = 89, resist = { slow = 20 } },
                [75] = { acc = 319, eva = 293, agi = 63, int = 65, mnd = 65, chr = 91, resist = { slow = 25 } },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2331 },  -- blue mages testimony
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Jas Lizard',
            ids    = { 22, 86, 148, 175, 228, 230 },
            levels = {
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Carriage Lizard',
            ids    = { 23, 24, 63, 64, 66, 67, 68, 70, 71, 94, 95, 132, 133, 136, 161, 162, 164, 165, 181, 182, 183,
                       185, 186, 187, 188, 189, 191, 192, 193, 196 },
            levels = {
                [70] = { acc = 289, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 296, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
            },
            spawn_levels = { [64] = { 72, 72 }, [95] = { 72, 72 }, [165] = { 72, 72 }, [191] = { 72, 72 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
            },
            links  = 2,
        },
        {
            name   = 'Ziz',
            ids    = { 29, 30, 31, 32, 33, 34, 35, 38, 39, 96, 97, 99, 101, 102, 104, 105, 106, 107, 108, 369, 372,
                       380 },
            levels = {
                [76] = { acc = 319, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            spawn_levels = { [29] = { 76, 77 }, [30] = { 76, 77 }, [31] = { 76, 77 }, [32] = { 76, 77 },
                             [33] = { 76, 77 }, [34] = { 76, 77 }, [35] = { 76, 77 }, [38] = { 76, 77 },
                             [39] = { 76, 77 }, [96] = { 76, 77 }, [97] = { 76, 77 }, [99] = { 76, 77 },
                             [101] = { 76, 77 }, [102] = { 76, 77 }, [104] = { 76, 77 }, [105] = { 76, 77 },
                             [106] = { 76, 77 }, [107] = { 76, 77 }, [108] = { 76, 77 }, [369] = { 77, 78 },
                             [372] = { 77, 78 }, [380] = { 77, 78 } },
            ph_for = { [97] = { 98 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, thunder = 2, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -2, slow = 2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 2, gravity = -2 },
            drops  = {
                { rate = 100, item = 842 },  -- giant bird feather
                { rate = 150, item = 5581 },  -- slice of ziz meat
            },
            aggro  = true,
            detects = { 'sight' },
            aggro_note = 'sleeps',
            aggro_hours = { 4, 19 },
        },
        {
            name   = 'Suhur Mas',
            ids    = { 40, 41, 42, 43, 109, 110, 111, 137, 139, 140, 141, 216, 217, 218, 219 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60 },
            },
            spawn_levels = { [40] = { 71, 71 }, [137] = { 71, 71 }, [216] = { 71, 71 } },
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
            name   = 'Mamool Ja Spearman',
            ids    = { 49, 54, 115, 125, 149, 223, 225 },
            levels = {
                [73] = { acc = 327, eva = 296, agi = 74, int = 58, mnd = 64, chr = 76 },
                [74] = { acc = 332, eva = 301, agi = 75, int = 58, mnd = 64, chr = 77 },
                [75] = { acc = 337, eva = 306, agi = 75, int = 58, mnd = 65, chr = 77 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2225 },  -- mamook tanscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Jas Wyvern',
            ids    = { 50, 55, 116, 126, 150, 224, 226, 294, 300, 339, 356 },
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            spawn_levels = { [50] = { 66, 68 }, [55] = { 66, 68 }, [116] = { 66, 68 }, [126] = { 66, 68 },
                             [150] = { 66, 68 }, [224] = { 66, 68 }, [226] = { 66, 68 }, [294] = { 77, 78 },
                             [300] = { 77, 78 }, [339] = { 77, 78 }, [356] = { 66, 68 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Puk M',
            ids    = { 75, 82, 92, 100, 103, 169, 198, 199, 200, 201, 205, 206, 238, 239 },
            levels = {
                [70] = { acc = 289, eva = 278, agi = 81, int = 63, mnd = 59, chr = 57 },
                [71] = { acc = 296, eva = 283, agi = 83, int = 63, mnd = 60, chr = 60 },
                [72] = { acc = 301, eva = 288, agi = 83, int = 63, mnd = 60, chr = 60 },
            },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            absorb = { wind = 100 },
            drops  = {
                { rate = 150, item = 2148 },  -- puk wing
                { rate = 50, item = 5569 },  -- puk egg
                { rate = 10, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Zizzy Zillah',
            ids    = { 98 },
            nm     = true,
            levels = {
                [83] = { acc = 359, eva = 342, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 18437 },  -- namikirimaru
                { rate = 150, item = 14945 },  -- fencing bracers
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Mamool Ja Frogman',
            ids    = { 138, 144, 146 },
            levels = {
                [75] = { acc = 315, eva = 286, agi = 67, int = 70, mnd = 70, chr = 88 },
                [76] = { acc = 321, eva = 291, agi = 67, int = 72, mnd = 72, chr = 89 },
            },
            ranks  = { ice = -2, wind = -1, earth = -1, thunder = -3, water = 4, paralyze = -2, bind = -2,
                       silence = -1, slow = -1, poison = 4, stun = -3, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 240, item = 2224 },  -- mamook silverscale key
                { rate = 150, item = 888 },  -- seashell
                { rate = 100, item = 4484 },  -- shall shell
                { rate = 50, item = 887 },  -- coral fragment
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Mamool Ja Diver',
            ids    = { 142, 143, 145 },
            levels = {
                [75] = { acc = 322, eva = 302, agi = 67, int = 52, mnd = 70, chr = 70 },
                [76] = { acc = 327, eva = 307, agi = 67, int = 54, mnd = 72, chr = 71 },
            },
            ranks  = { ice = -2, wind = -1, earth = -1, thunder = -3, water = 4, paralyze = -2, bind = -2,
                       silence = -1, slow = -1, poison = 4, stun = -3, gravity = -1 },
            meva   = { water = 128 },
            drops  = {
                { rate = 240, item = 2224 },  -- mamook silverscale key
                { rate = 150, item = 888 },  -- seashell
                { rate = 100, item = 4484 },  -- shall shell
                { rate = 50, item = 887 },  -- coral fragment
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Poroggo',
            ids    = { 151, 152, 153, 154, 155, 156, 157, 159 },
            levels = {
                [75] = { acc = 313, eva = 276, agi = 77, int = 100, mnd = 62, chr = 58 },
                [76] = { acc = 319, eva = 283, agi = 80, int = 100, mnd = 62, chr = 60 },
                [77] = { acc = 324, eva = 287, agi = 80, int = 102, mnd = 62, chr = 60 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            drops  = {
                { rate = 150, item = 2334 },  -- poroggo hat
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Air Elemental',
            ids    = { 158, 197, 348, 379 },
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
                [77] = { acc = 324, eva = 299, agi = 75, int = 89, mnd = 71, chr = 72 },
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
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
            name   = 'Battle Bugard',
            ids    = { 166, 167, 168, 207, 208, 214, 215 },
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1640 },  -- bugard skin
                { rate = 10, item = 1622 },  -- bugard tusk
                { rate = 50, item = 1680 },  -- high-quality bugard skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Tyrannobugard',
            ids    = { 171, 172, 173 },
            levels = {
                [112] = { acc = 480, eva = 495, agi = 113, int = 84, mnd = 84, chr = 95 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Brei',
            ids    = { 202, 203, 204 },
            levels = {
                [77] = { acc = 326, eva = 309, agi = 76, int = 60, mnd = 65, chr = 66 },
                [78] = { acc = 331, eva = 314, agi = 77, int = 60, mnd = 65, chr = 68 },
            },
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
            name   = 'Qiqirn Poulterer',
            ids    = { 240 },
            levels = {
                [77] = { acc = 374, eva = 296, agi = 98, int = 62, mnd = 72, chr = 66 },
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
            links  = 5,
        },
        {
            name   = 'Qiqirn Goldsmith',
            ids    = { 241 },
            levels = {
                [77] = { acc = 337, eva = 381, agi = 91, int = 76, mnd = 54, chr = 54 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 25 },
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
            links  = 6,
        },
        {
            name   = 'Spinner',
            ids    = { 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 257, 258, 259, 261, 263,
                       264, 267, 268, 312, 313, 351, 352, 353, 354, 360, 361, 362, 363, 373, 374, 375, 376, 377,
                       378 },
            levels = {
                [79] = { acc = 341, eva = 322, agi = 82, int = 66, mnd = 66, chr = 60 },
                [80] = { acc = 346, eva = 327, agi = 82, int = 66, mnd = 66, chr = 60 },
                [81] = { acc = 354, eva = 332, agi = 85, int = 69, mnd = 69, chr = 62 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 150, item = 838 },  -- spider web
            },
            links  = 7,
        },
        {
            name   = 'Mamool Ja Lurker',
            ids    = { 256, 260, 272, 304, 305, 334, 343, 364, 381, 384, 387 },
            levels = {
                [81] = { acc = 360, eva = 404, agi = 96, int = 85, mnd = 58, chr = 58 },
                [82] = { acc = 366, eva = 409, agi = 96, int = 85, mnd = 58, chr = 58 },
                [83] = { acc = 373, eva = 414, agi = 96, int = 85, mnd = 58, chr = 58 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 17716 },  -- macuahuitl -1
                { rate = 100, item = 16167 },  -- tariqah -1
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Philosopher',
            ids    = { 262, 271, 303, 308, 311, 332, 358, 367, 383, 386 },
            levels = {
                [81] = { acc = 354, eva = 310, agi = 90, int = 98, mnd = 71, chr = 77 },
                [82] = { acc = 360, eva = 315, agi = 90, int = 98, mnd = 71, chr = 77 },
                [83] = { acc = 366, eva = 319, agi = 90, int = 100, mnd = 71, chr = 77 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2226 },  -- mamook blackscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Mimer',
            ids    = { 265, 273, 301, 306, 309, 335, 344, 359, 366 },
            levels = {
                [81] = { acc = 347, eva = 328, agi = 76, int = 71, mnd = 71, chr = 71 },
                [82] = { acc = 353, eva = 333, agi = 76, int = 71, mnd = 71, chr = 71 },
                [83] = { acc = 359, eva = 338, agi = 76, int = 71, mnd = 71, chr = 71 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 240, item = 17716 },  -- macuahuitl -1
                { rate = 100, item = 16167 },  -- tariqah -1
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Infiltrator',
            ids    = { 266, 269, 274, 307, 336, 337, 347, 382, 388 },
            levels = {
                [81] = { acc = 357, eva = 356, agi = 96, int = 77, mnd = 58, chr = 64 },
                [82] = { acc = 363, eva = 361, agi = 96, int = 77, mnd = 58, chr = 64 },
                [83] = { acc = 369, eva = 366, agi = 96, int = 77, mnd = 58, chr = 64 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25 },
            drops  = {
                { rate = 100, item = 2226 },  -- mamook blackscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Blusterer',
            ids    = { 270, 275, 302, 310, 333, 346, 357, 365, 385 },
            levels = {
                [81] = { acc = 343, eva = 303, agi = 76, int = 71, mnd = 98, chr = 85 },
                [82] = { acc = 349, eva = 308, agi = 76, int = 71, mnd = 98, chr = 85 },
                [83] = { acc = 355, eva = 312, agi = 76, int = 71, mnd = 100, chr = 85 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2226 },  -- mamook blackscale key
                { rate = 10, item = 2227 },  -- mamool ja collar
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Watch Wyvern',
            ids    = { 276, 277, 281, 282, 285, 288, 314, 315, 316, 317, 318 },
            levels = {
                [81] = { acc = 352, eva = 332, agi = 85, int = 73, mnd = 60, chr = 67 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 73, mnd = 60, chr = 67 },
                [83] = { acc = 364, eva = 342, agi = 85, int = 73, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Sea Puk M',
            ids    = { 278, 279, 283, 284, 286, 287, 295, 296, 328, 329, 330, 331 },
            levels = {
                [76] = { acc = 323, eva = 310, agi = 88, int = 67, mnd = 64, chr = 62 },
                [77] = { acc = 328, eva = 315, agi = 89, int = 69, mnd = 65, chr = 62 },
                [78] = { acc = 333, eva = 320, agi = 89, int = 69, mnd = 65, chr = 65 },
            },
            spawn_levels = { [278] = { 76, 77 }, [279] = { 76, 77 }, [283] = { 76, 77 }, [284] = { 76, 77 },
                             [286] = { 76, 77 }, [287] = { 76, 77 }, [295] = { 77, 78 }, [296] = { 77, 78 },
                             [328] = { 77, 78 }, [329] = { 77, 78 }, [330] = { 77, 78 }, [331] = { 77, 78 } },
            ranks  = { fire = -1, ice = -2, wind = 11, earth = -1, water = -1, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 11, slow = -1, poison = -1, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = 11 },
            absorb = { wind = 100 },
            drops  = {
                { rate = 240, item = 2148 },  -- puk wing
                { rate = 150, item = 5569 },  -- puk egg
                { rate = 100, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Nipper M',
            ids    = { 289, 290, 291, 292, 324, 325, 326, 327 },
            levels = {
                [77] = { acc = 319, eva = 296, agi = 50, int = 54, mnd = 80, chr = 80 },
                [78] = { acc = 325, eva = 301, agi = 51, int = 54, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1888 },  -- sack of silica
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            links  = 8,
        },
        {
            name   = 'Mamool Ja Pikeman',
            ids    = { 293, 299, 338, 355 },
            levels = {
                [81] = { acc = 372, eva = 339, agi = 82, int = 64, mnd = 71, chr = 85 },
                [82] = { acc = 378, eva = 344, agi = 82, int = 64, mnd = 71, chr = 85 },
                [83] = { acc = 384, eva = 349, agi = 82, int = 64, mnd = 71, chr = 85 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            drops  = {
                { rate = 100, item = 2226 },  -- mamook blackscale key
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Stabler',
            ids    = { 297, 319, 321, 370, 389 },
            levels = {
                [81] = { acc = 354, eva = 324, agi = 69, int = 71, mnd = 71, chr = 98 },
                [82] = { acc = 360, eva = 329, agi = 69, int = 71, mnd = 71, chr = 98 },
                [83] = { acc = 366, eva = 334, agi = 69, int = 71, mnd = 71, chr = 100 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { slow = 25 },
            drops  = {
                { rate = 100, item = 2226 },  -- mamook blackscale key
                { rate = 100, item = 16167 },  -- tariqah -1
                { rate = 10, item = 2162 },  -- mamool ja helmet
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Jas Raptor',
            ids    = { 298, 320, 322, 371, 390 },
            levels = {
                [76] = { acc = 327, eva = 375, agi = 89, int = 80, mnd = 54, chr = 54 },
                [77] = { acc = 332, eva = 381, agi = 91, int = 80, mnd = 54, chr = 54 },
                [78] = { acc = 337, eva = 386, agi = 91, int = 80, mnd = 54, chr = 54 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Archaic Mirror',
            ids    = { 391, 392, 393, 394, 395, 396, 397, 398 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70 },
            },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 1000, item = 2174 },  -- archaic mirror
            },
        },
        {
            name   = 'Mamool Ja Conservator',
            ids    = { 399, 401, 403, 405, 407, 409, 411, 413 },
            levels = {
                [81] = { acc = 357, eva = 356, agi = 96, int = 77, mnd = 58, chr = 64 },
                [82] = { acc = 363, eva = 361, agi = 96, int = 77, mnd = 58, chr = 64 },
                [83] = { acc = 369, eva = 366, agi = 96, int = 77, mnd = 58, chr = 64 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { bind = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mamool Ja Treasurer',
            ids    = { 400, 402, 404, 406, 408, 410, 412, 414 },
            levels = {
                [81] = { acc = 354, eva = 310, agi = 90, int = 98, mnd = 71, chr = 77 },
                [82] = { acc = 360, eva = 315, agi = 90, int = 98, mnd = 71, chr = 77 },
                [83] = { acc = 366, eva = 319, agi = 90, int = 100, mnd = 71, chr = 77 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Mamool Ja',
            ids    = { 415 },
            nm     = true,
            levels = {
                [75] = { acc = 319, eva = 293, agi = 63, int = 65, mnd = 65, chr = 91 },
                [76] = { acc = 325, eva = 298, agi = 64, int = 66, mnd = 66, chr = 92 },
                [77] = { acc = 330, eva = 303, agi = 65, int = 66, mnd = 66, chr = 93 },
                [78] = { acc = 335, eva = 308, agi = 65, int = 68, mnd = 68, chr = 93 },
                [79] = { acc = 341, eva = 314, agi = 66, int = 69, mnd = 69, chr = 96 },
                [80] = { acc = 346, eva = 319, agi = 66, int = 69, mnd = 69, chr = 96 },
                [81] = { acc = 354, eva = 324, agi = 69, int = 71, mnd = 71, chr = 98 },
                [82] = { acc = 360, eva = 329, agi = 69, int = 71, mnd = 71, chr = 98 },
                [83] = { acc = 366, eva = 334, agi = 69, int = 71, mnd = 71, chr = 100 },
            },
            ranks  = { ice = -2, wind = 2, thunder = -1, dark = -1, paralyze = -2, bind = -2, silence = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = 2 },
            resist = { slow = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Poroggo Casanova',
            ids    = { 425 },
            levels = {
                [60] = { acc = 233, eva = 202, agi = 63, int = 81, mnd = 50, chr = 47 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mikilulu',
            ids    = { 426 },
            nm     = true,
            levels = {
                [50] = { acc = 178, eva = 157, agi = 63, int = 72, mnd = 39, chr = 53 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 10,
        },
        {
            name   = 'Mikiruru',
            ids    = { 427 },
            nm     = true,
            levels = {
                [50] = { acc = 178, eva = 157, agi = 63, int = 72, mnd = 39, chr = 53 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 11,
        },
        {
            name   = 'Nikilulu',
            ids    = { 428 },
            nm     = true,
            levels = {
                [50] = { acc = 178, eva = 157, agi = 63, int = 72, mnd = 39, chr = 53 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 12,
        },
        {
            name   = 'Mikiluru',
            ids    = { 429 },
            nm     = true,
            levels = {
                [50] = { acc = 178, eva = 157, agi = 63, int = 72, mnd = 39, chr = 53 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 13,
        },
        {
            name   = 'Mikirulu',
            ids    = { 430 },
            nm     = true,
            levels = {
                [50] = { acc = 178, eva = 157, agi = 63, int = 72, mnd = 39, chr = 53 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 14,
        },
        {
            name   = 'Chamrosh',
            ids    = { 431 },
            nm     = true,
            levels = {
                [78] = { acc = 327, eva = 321, agi = 69, int = 98, mnd = 90, chr = 86 },
                [79] = { acc = 332, eva = 326, agi = 69, int = 101, mnd = 92, chr = 89 },
                [80] = { acc = 337, eva = 331, agi = 69, int = 101, mnd = 92, chr = 89 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
            immune = { 'silence', 'stun', 'paralyze' },
            drops  = {
                { rate = 1000, item = 2617 },  -- chamroshs beak
                { rate = 150, item = 16240 },  -- eratos cape
                { rate = 150, item = 16000 },  -- dragoons earring
            },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Iriri Samariri',
            ids    = { 432 },
            nm     = true,
            levels = {
                [84] = { acc = 366, eva = 329, agi = 101, int = 115, mnd = 67, chr = 85 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 1000, item = 2615 },  -- iriri samariris hat
                { rate = 150, item = 15017 },  -- toad mittens
                { rate = 150, item = 16339 },  -- paddock trousers
            },
        },
        {
            name   = 'Yalungur',
            ids    = { 437, 443, 449 },
            levels = {
                [99] = { acc = 467, eva = 406, agi = 80, int = 118, mnd = 118, chr = 109 },
            },
            ranks  = { wind = 7, earth = 1, light = 1, dark = -1, silence = 7, slow = 1, light_sleep = 1,
                       dark_sleep = -1, blind = -1, gravity = 7 },
            magic_dmg = { all = -90 },
        },
        {
            name   = 'Predatory Colibri',
            ids    = { 438, 439, 440, 441, 442, 444, 445, 446, 447, 450, 451, 452 },
            levels = {
                [99] = { acc = 467, eva = 426, agi = 80, int = 118, mnd = 118, chr = 109 },
            },
            ranks  = { fire = -1, ice = -2, wind = 6, thunder = -1, water = -1, dark = -2, paralyze = -2, bind = -2,
                       silence = 6, poison = -1, dark_sleep = -2, blind = -2, stun = -1, gravity = 6 },
        },
    },
    by_name = {},
}
