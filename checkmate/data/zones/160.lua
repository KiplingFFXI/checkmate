-- Den of Rancor (zone 160).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Bistre-hearted Malberry', 'Carmine-tailed Janberry', 'Celeste-eyed Tozberry', 'Sozu Bliberry',
                'Tawny-fingered Mugberry', 'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator',
                'Tonberry Pontifex', 'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
        [2] = { 'Dire Bat', 'Succubus Bats' },
        [3] = { 'Bistre-hearted Malberry', 'Carmine-tailed Janberry', 'Celeste-eyed Tozberry',
                'Tawny-fingered Mugberry', 'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator',
                'Tonberry Pontifex', 'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
        [4] = { 'Bistre-hearted Malberry', 'Carmine-tailed Janberry', 'Sozu Bliberry', 'Tawny-fingered Mugberry',
                'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator', 'Tonberry Pontifex',
                'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
        [5] = { 'Cave Worm' },
        [6] = { 'Bistre-hearted Malberry', 'Celeste-eyed Tozberry', 'Sozu Bliberry', 'Tawny-fingered Mugberry',
                'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator', 'Tonberry Pontifex',
                'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
        [7] = { 'Tormentor' },
        [8] = { 'Puck' },
        [9] = { 'Bullbeggar' },
        [10] = { 'Bistre-hearted Malberry', 'Carmine-tailed Janberry', 'Celeste-eyed Tozberry', 'Sozu Bliberry',
                 'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator', 'Tonberry Pontifex',
                 'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
        [11] = { 'Carmine-tailed Janberry', 'Celeste-eyed Tozberry', 'Sozu Bliberry', 'Tawny-fingered Mugberry',
                 'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator', 'Tonberry Pontifex',
                 'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
        [12] = { 'Bistre-hearted Malberry', 'Carmine-tailed Janberry', 'Celeste-eyed Tozberry', 'Sozu Bliberry',
                 'Tawny-fingered Mugberry', 'Tonberry Beleaguerer', 'Tonberry Decapitator', 'Tonberry Imprecator',
                 'Tonberry Slasher', 'Tonberry Tracker', 'Tonberry Trailer' },
    },
    monsters = {
        {
            name   = 'Rock Crab',
            ids    = { 1 },
            levels = {
                [53] = { acc = 192, eva = 174, agi = 36, int = 39, mnd = 57, chr = 57 },
                [54] = { acc = 197, eva = 179, agi = 36, int = 39, mnd = 58, chr = 58 },
                [55] = { acc = 202, eva = 184, agi = 37, int = 39, mnd = 58, chr = 58 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Razorjaw Pugil',
            ids    = { 2 },
            levels = {
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 45 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 45 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 47 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bloodsucker',
            ids    = { 3 },
            levels = {
                [58] = { acc = 223, eva = 210, agi = 61, int = 50, mnd = 46, chr = 52 },
                [59] = { acc = 229, eva = 216, agi = 63, int = 51, mnd = 47, chr = 53 },
                [60] = { acc = 234, eva = 221, agi = 63, int = 51, mnd = 47, chr = 53 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mousse',
            ids    = { 4, 5 },
            levels = {
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1050 },  -- rancor den coffer key
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Rancor Torch',
            ids    = { 6 },
            nm     = true,
            levels = {
                [69] = { acc = 284, eva = 269, agi = 72, int = 51, mnd = 54, chr = 65 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 51, mnd = 55, chr = 65 },
                [71] = { acc = 296, eva = 279, agi = 75, int = 52, mnd = 55, chr = 68 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Mimic',
            ids    = { 7 },
            nm     = true,
            levels = {
                [65] = { acc = 263, eva = 251, agi = 75, int = 59, mnd = 59, chr = 51 },
            },
            drops  = {
                { rate = 1000, item = 1050 },  -- rancor den coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Tonberry Trailer',
            ids    = { 8, 10, 16, 21, 31, 38, 41, 45, 46, 49, 75, 89, 94, 100, 103, 107 },
            levels = {
                [62] = { acc = 252, eva = 286, agi = 77, int = 63, mnd = 42, chr = 45 },
                [63] = { acc = 258, eva = 291, agi = 77, int = 63, mnd = 42, chr = 45 },
                [64] = { acc = 263, eva = 298, agi = 80, int = 64, mnd = 42, chr = 46 },
                [65] = { acc = 269, eva = 303, agi = 80, int = 65, mnd = 43, chr = 46 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 1050 },  -- rancor den coffer key
                { rate = 50, item = 1145 },  -- tonberry board
                { rate = 10, item = 2387 },  -- flickering lantern
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Dire Bat',
            ids    = { 9, 11, 12, 15, 18, 19, 20, 22, 23, 24, 25, 26, 27, 28, 29, 30, 34, 35, 36, 37, 39, 40, 43,
                       44, 47, 50, 51, 54, 58, 59, 60, 61, 65, 66, 67, 68, 69, 70, 72, 81, 82, 93, 96, 97, 101, 102,
                       105, 106, 108, 110, 205, 206, 228, 229, 230, 233, 234, 235, 236, 239, 240, 241, 251, 252,
                       253, 256, 257, 258, 259, 261, 262, 263, 266, 277, 278, 287, 288, 290, 294, 298, 299, 302,
                       303, 304, 312, 313 },
            levels = {
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 13, 55, 216, 351 },
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
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
            name   = 'Tonberry Imprecator',
            ids    = { 14, 17, 32, 42, 71, 85, 86, 92, 95, 104, 109 },
            levels = {
                [62] = { acc = 247, eva = 216, agi = 73, int = 73, mnd = 52, chr = 60 },
                [63] = { acc = 252, eva = 220, agi = 73, int = 75, mnd = 52, chr = 60 },
                [64] = { acc = 258, eva = 226, agi = 75, int = 75, mnd = 52, chr = 62 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 100, item = 1429 },  -- black mages testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 1138 },  -- unlit lantern
                { rate = 50, item = 4803 },  -- scroll of thundaga ii
                { rate = 10, item = 4774 },  -- scroll of thunder iii
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Sozu Bliberry',
            ids    = { 33 },
            nm     = true,
            levels = {
                [65] = { acc = 263, eva = 230, agi = 75, int = 77, mnd = 55, chr = 62 },
                [66] = { acc = 269, eva = 237, agi = 78, int = 77, mnd = 55, chr = 62 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 150, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 4809 },  -- scroll of waterga iii
                { rate = 150, item = 4780 },  -- scroll of water iv
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Celeste-eyed Tozberry',
            ids    = { 48 },
            nm     = true,
            levels = {
                [67] = { acc = 275, eva = 279, agi = 82, int = 61, mnd = 44, chr = 53 },
                [68] = { acc = 281, eva = 285, agi = 85, int = 62, mnd = 45, chr = 53 },
                [69] = { acc = 287, eva = 290, agi = 85, int = 62, mnd = 45, chr = 54 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 100, item = 16912 },  -- kitsutsuki
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 240, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Tonberry Slasher',
            ids    = { 52, 53, 145, 146, 157, 208, 209, 211, 212, 217, 218, 225, 243, 250, 273, 274, 280, 291, 295,
                       338, 343, 344, 347, 352, 353, 378, 379, 380, 383, 388, 404, 407, 408, 416, 421, 422 },
            levels = {
                [67] = { acc = 275, eva = 279, agi = 82, int = 61, mnd = 44, chr = 53, resist = { bind = 20 } },
                [68] = { acc = 281, eva = 285, agi = 85, int = 62, mnd = 45, chr = 53, resist = { bind = 20 } },
                [69] = { acc = 287, eva = 290, agi = 85, int = 62, mnd = 45, chr = 54, resist = { bind = 20 } },
                [70] = { acc = 292, eva = 296, agi = 87, int = 63, mnd = 45, chr = 55, resist = { bind = 25 } },
                [71] = { acc = 298, eva = 301, agi = 87, int = 64, mnd = 48, chr = 55, resist = { bind = 25 } },
            },
            spawn_levels = { [52] = { 67, 69 }, [53] = { 67, 69 }, [145] = { 67, 69 }, [146] = { 67, 69 },
                             [157] = { 67, 69 }, [208] = { 67, 69 }, [209] = { 67, 69 }, [211] = { 67, 69 },
                             [212] = { 67, 69 }, [217] = { 67, 69 }, [218] = { 67, 69 }, [225] = { 67, 69 },
                             [243] = { 67, 69 }, [250] = { 67, 69 }, [273] = { 67, 69 }, [274] = { 67, 69 },
                             [280] = { 67, 69 }, [291] = { 67, 69 }, [295] = { 67, 69 }, [338] = { 67, 69 },
                             [343] = { 67, 69 }, [344] = { 67, 69 }, [347] = { 67, 69 }, [352] = { 67, 69 },
                             [353] = { 67, 69 }, [378] = { 67, 69 }, [379] = { 67, 69 }, [380] = { 67, 69 },
                             [383] = { 67, 69 }, [388] = { 67, 69 }, [404] = { 69, 71 }, [407] = { 69, 71 },
                             [408] = { 69, 71 }, [416] = { 69, 71 }, [421] = { 69, 71 }, [422] = { 69, 71 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 100, item = 1438 },  -- ninjas testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1050 },  -- rancor den coffer key
                { rate = 50, item = 1137 },  -- prelate key
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 10, item = 17303 },  -- manji shuriken
                { rate = 5, item = 4962 },  -- scroll of tonko ni
                { rate = 1, item = 4956 },  -- scroll of kurayami ni
                { rate = 1, item = 4953 },  -- scroll of hojo ni
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Tonberry Beleaguerer',
            ids    = { 56, 147, 213, 223, 226, 244, 246, 275, 281, 285, 292, 339, 348, 360, 381, 385, 389, 405, 409,
                       411, 423 },
            levels = {
                [66] = { acc = 263, eva = 233, agi = 70, int = 71, mnd = 71, chr = 74 },
                [67] = { acc = 267, eva = 238, agi = 72, int = 71, mnd = 71, chr = 75 },
                [68] = { acc = 273, eva = 243, agi = 73, int = 74, mnd = 74, chr = 77 },
                [69] = { acc = 278, eva = 247, agi = 73, int = 74, mnd = 74, chr = 77 },
                [70] = { acc = 283, eva = 253, agi = 75, int = 75, mnd = 75, chr = 79 },
                [71] = { acc = 290, eva = 257, agi = 75, int = 76, mnd = 76, chr = 79 },
                [72] = { acc = 295, eva = 262, agi = 75, int = 76, mnd = 76, chr = 79 },
            },
            spawn_levels = { [56] = { 66, 69 }, [147] = { 66, 69 }, [213] = { 66, 69 }, [223] = { 66, 69 },
                             [226] = { 66, 69 }, [244] = { 66, 69 }, [246] = { 66, 69 }, [275] = { 66, 69 },
                             [281] = { 66, 69 }, [285] = { 66, 69 }, [292] = { 66, 69 }, [339] = { 66, 69 },
                             [348] = { 66, 69 }, [360] = { 66, 69 }, [381] = { 66, 69 }, [385] = { 66, 69 },
                             [389] = { 66, 69 }, [405] = { 69, 72 }, [409] = { 69, 72 }, [411] = { 69, 72 },
                             [423] = { 69, 72 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 1440 },  -- summoners testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1050 },  -- rancor den coffer key
                { rate = 100, item = 4158 },  -- flask of venom potion
                { rate = 50, item = 4901 },  -- water spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 57, 84, 148, 214, 224, 227, 245, 247, 276, 282, 286, 293, 340, 349, 361, 382, 386, 390, 406,
                       410, 412, 424 },
            levels = {
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52 },
                [56] = { acc = 212, eva = 192, agi = 57, int = 67, mnd = 54, chr = 55 },
                [57] = { acc = 217, eva = 196, agi = 57, int = 68, mnd = 54, chr = 55 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 68, mnd = 55, chr = 55 },
                [59] = { acc = 228, eva = 208, agi = 60, int = 70, mnd = 56, chr = 57 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Bifrons DoR',
            ids    = { 62, 63, 158, 159, 366, 367 },
            levels = {
                [68] = { acc = 278, eva = 263, agi = 71, int = 50, mnd = 53, chr = 64 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 51, mnd = 54, chr = 65 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 51, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
                { rate = 50, item = 1050 },  -- rancor den coffer key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Friar Rush',
            ids    = { 64 },
            nm     = true,
            levels = {
                [70] = { acc = 289, eva = 274, agi = 73, int = 51, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 18139 },  -- bomb core
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Cave Worm DoR',
            ids    = { 73, 74, 76, 77, 78, 79, 80, 87, 88, 90, 91, 98, 99 },
            levels = {
                [61] = { acc = 239, eva = 218, agi = 62, int = 77, mnd = 59, chr = 57 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 77, mnd = 59, chr = 57 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 78, mnd = 59, chr = 57 },
                [64] = { acc = 255, eva = 233, agi = 64, int = 79, mnd = 60, chr = 58 },
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
            links  = 5,
        },
        {
            name   = 'Carmine-tailed Janberry',
            ids    = { 83 },
            nm     = true,
            levels = {
                [66] = { acc = 264, eva = 245, agi = 69, int = 70, mnd = 70, chr = 70 },
                [67] = { acc = 268, eva = 250, agi = 70, int = 70, mnd = 70, chr = 72 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { petrify = 20, slow = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 17454 },  -- asklepios
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 100, item = 4901 },  -- water spirit pact
                { rate = 240, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Tormentor',
            ids    = { 111, 112, 113, 114, 119, 120, 121, 122, 129, 130, 140, 141, 142, 143, 160, 163, 164, 165,
                       167, 168, 169, 184, 185, 186, 188, 199, 200, 201, 202, 203 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
            },
            links  = 7,
        },
        {
            name   = 'Puck',
            ids    = { 115, 123, 124, 125, 126, 127, 128, 131, 136, 137, 138, 139, 144, 166, 170, 171, 172, 174,
                       187, 195, 196, 198, 204 },
            levels = {
                [74] = { acc = 314, eva = 293, agi = 58, int = 52, mnd = 70, chr = 64 },
                [75] = { acc = 320, eva = 298, agi = 58, int = 52, mnd = 70, chr = 65 },
                [76] = { acc = 325, eva = 303, agi = 59, int = 54, mnd = 72, chr = 66 },
                [77] = { acc = 331, eva = 309, agi = 60, int = 54, mnd = 72, chr = 66 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 4368 },  -- two-leaf mandragora bud
                { rate = 50, item = 17868 },  -- jug of humus
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Bullbeggar',
            ids    = { 116, 117, 118, 132, 133, 134, 135, 149, 150, 151, 153, 154, 155, 161, 162, 175, 176, 177,
                       178, 179, 180, 181, 182, 192, 193, 194 },
            levels = {
                [78] = { acc = 335, eva = 320, agi = 89, int = 52, mnd = 52, chr = 77 },
                [79] = { acc = 341, eva = 326, agi = 91, int = 52, mnd = 52, chr = 78 },
                [80] = { acc = 346, eva = 331, agi = 91, int = 52, mnd = 52, chr = 78 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 17296 },  -- pebble
                { rate = 100, item = 4468 },  -- bunch of pamamas
                { rate = 50, item = 5187 },  -- elshimo coconut
                { rate = 10, item = 4596 },  -- bunch of wild pamamas
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Den Scorpion',
            ids    = { 152, 156, 173, 183, 189, 190, 191, 197 },
            levels = {
                [79] = { acc = 335, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
                [81] = { acc = 347, eva = 332, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 10, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mousse DoR PMS',
            ids    = { 207, 210, 215, 219, 220, 221, 231, 232, 237, 238, 242, 248, 249, 254, 255, 260, 264, 265,
                       267, 268, 270, 271, 279, 283, 284, 289, 296, 297, 300, 301, 305, 306, 307, 308, 309, 310,
                       311, 314, 315, 316, 317, 318, 319, 328, 357, 358, 364, 365 },
            levels = {
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1050 },  -- rancor den coffer key
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Tawny-fingered Mugberry',
            ids    = { 222 },
            nm     = true,
            levels = {
                [70] = { acc = 295, eva = 344, agi = 87, int = 69, mnd = 45, chr = 49 },
                [71] = { acc = 302, eva = 349, agi = 87, int = 72, mnd = 48, chr = 51 },
                [72] = { acc = 307, eva = 354, agi = 87, int = 72, mnd = 48, chr = 51 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 240, item = 1162 },  -- tonberry lantern
                { rate = 1000, item = 13147 },  -- uggalepih necklace
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Bistre-hearted Malberry',
            ids    = { 269 },
            nm     = true,
            levels = {
                [71] = { acc = 296, eva = 261, agi = 83, int = 84, mnd = 60, chr = 67 },
                [72] = { acc = 301, eva = 266, agi = 83, int = 84, mnd = 60, chr = 67 },
                [73] = { acc = 306, eva = 271, agi = 84, int = 85, mnd = 60, chr = 70 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 150, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 17455 },  -- skirnirs wand
                { rate = 100, item = 4809 },  -- scroll of waterga iii
                { rate = 50, item = 4780 },  -- scroll of water iv
                { rate = 100, item = 4808 },  -- scroll of waterga ii
                { rate = 50, item = 4779 },  -- scroll of water iii
                { rate = 50, item = 4822 },  -- scroll of flood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Water Elemental',
            ids    = { 272, 333, 417 },
            levels = {
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
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
            name   = 'Demonic Pugil',
            ids    = { 320, 321, 322, 324, 325, 326, 329, 330, 331, 334, 335 },
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 62 },
            },
            spawn_levels = { [334] = { 73, 75 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Doom Toad',
            ids    = { 323, 327, 332, 396, 397, 402, 403, 414, 415 },
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 55, chr = 70 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 55, chr = 71 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 57, chr = 73 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Succubus Bats',
            ids    = { 336, 337, 341, 342, 345, 346, 350, 354, 356, 362, 363 },
            levels = {
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 1050 },  -- rancor den coffer key
                { rate = 50, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Cutlass Scorpion DR',
            ids    = { 355, 359 },
            levels = {
                [68] = { acc = 275, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 280, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 285, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 10, item = 1473 },  -- high-quality scorpion shell
                { rate = 50, item = 1050 },  -- rancor den coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Million Eyes DR',
            ids    = { 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 384, 387, 391, 392, 393, 394, 395, 399,
                       400, 401, 418, 419, 420 },
            levels = {
                [73] = { acc = 304, eva = 277, agi = 76, int = 93, mnd = 64, chr = 70 },
                [74] = { acc = 309, eva = 282, agi = 77, int = 94, mnd = 64, chr = 70 },
                [75] = { acc = 314, eva = 286, agi = 77, int = 96, mnd = 65, chr = 70 },
                [76] = { acc = 321, eva = 293, agi = 80, int = 97, mnd = 66, chr = 72 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 939 },  -- hecteyes eye
                { rate = 50, item = 1288 },  -- wooden hakutaku eye
                { rate = 10, item = 4784 },  -- scroll of firaga iii
                { rate = 50, item = 4754 },  -- scroll of fire iii
                { rate = 10, item = 4755 },  -- scroll of fire iv
                { rate = 10, item = 4812 },  -- scroll of flare
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ogama',
            ids    = { 398 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 57, chr = 74 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 60, chr = 76 },
                [82] = { acc = 355, eva = 337, agi = 85, int = 64, mnd = 60, chr = 76 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 16911 },  -- amanojaku
                { rate = 240, item = 849 },  -- undead skin
                { rate = 150, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tonberry Decapitator',
            ids    = { 413, 426 },
            nm     = true,
            levels = {
                [72] = { acc = 303, eva = 306, agi = 87, int = 64, mnd = 48, chr = 55 },
                [73] = { acc = 309, eva = 313, agi = 90, int = 66, mnd = 48, chr = 58 },
                [74] = { acc = 314, eva = 318, agi = 90, int = 66, mnd = 48, chr = 58 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 25 },
            drops  = {
                { rate = 240, item = 1438 },  -- ninjas testimony
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 240, item = 1162 },  -- tonberry lantern
                { rate = 240, item = 17303 },  -- manji shuriken
                { rate = 50, item = 16904 },  -- fudo
                { rate = 50, item = 4962 },  -- scroll of tonko ni
                { rate = 50, item = 4956 },  -- scroll of kurayami ni
                { rate = 10, item = 4953 },  -- scroll of hojo ni
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Tonberry Tracker',
            ids    = { 425, 428 },
            nm     = true,
            levels = {
                [72] = { acc = 307, eva = 354, agi = 87, int = 72, mnd = 48, chr = 51 },
                [73] = { acc = 312, eva = 361, agi = 90, int = 72, mnd = 48, chr = 52 },
                [74] = { acc = 318, eva = 366, agi = 90, int = 73, mnd = 48, chr = 52 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 100, item = 1431 },  -- thiefs testimony
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 100, item = 1162 },  -- tonberry lantern
                { rate = 50, item = 12748 },  -- thiefs kote
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Tonberry Pontifex',
            ids    = { 427 },
            nm     = true,
            levels = {
                [75] = { acc = 317, eva = 281, agi = 86, int = 88, mnd = 62, chr = 70 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 240, item = 1429 },  -- black mages testimony
                { rate = 1000, item = 1119 },  -- tonberry coat
                { rate = 150, item = 1162 },  -- tonberry lantern
                { rate = 100, item = 4809 },  -- scroll of waterga iii
                { rate = 50, item = 4780 },  -- scroll of water iv
                { rate = 100, item = 4808 },  -- scroll of waterga ii
                { rate = 150, item = 4779 },  -- scroll of water iii
                { rate = 50, item = 4822 },  -- scroll of flood
                { rate = 240, item = 751 },  -- platinum beastcoin
                { rate = 50, item = 1443 },  -- pinch of dried mugwort
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Hakutaku',
            ids    = { 429 },
            nm     = true,
            levels = {
                [84] = { acc = 367, eva = 346, agi = 82, int = 101, mnd = 77, chr = 80 },
                [85] = { acc = 373, eva = 351, agi = 83, int = 102, mnd = 78, chr = 80 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = 11, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify' },
            drops  = {
                { rate = 1000, item = 13915 },  -- optical hat
                { rate = 10, item = 4174 },  -- vile elixir
                { rate = 240, item = 4175 },  -- vile elixir +1
                { rate = 240, item = 4173 },  -- hi-reraiser
                { rate = 100, item = 4754 },  -- scroll of fire iii
                { rate = 100, item = 4784 },  -- scroll of firaga iii
                { rate = 50, item = 4755 },  -- scroll of fire iv
                { rate = 10, item = 4812 },  -- scroll of flare
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mokumokuren',
            ids    = { 430 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 312, agi = 82, int = 101, mnd = 69, chr = 75 },
                [81] = { acc = 349, eva = 317, agi = 85, int = 103, mnd = 71, chr = 77 },
                [82] = { acc = 355, eva = 322, agi = 85, int = 103, mnd = 71, chr = 77 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Azrael',
            ids    = { 431, 432 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
