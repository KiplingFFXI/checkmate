-- Middle Delkfutts Tower (zone 157).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Big Bat', 'Mold Bats', 'Stirge', 'Tower Bats' } },
        [2] = { sight = { 'Goblin Furrier', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy' } },
        [3] = {
            sight = { 'Eurytos', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ogygos', 'Ophion', 'Polybotes',
                      'Rhoikos', 'Rhoitos' },
        },
        [4] = {
            sight = { 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ogygos', 'Ophion', 'Polybotes',
                      'Rhoikos', 'Rhoitos' },
        },
        [5] = {
            sight = { 'Eurytos', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ogygos', 'Ophion', 'Rhoikos',
                      'Rhoitos' },
        },
        [6] = {
            sight = { 'Eurytos', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ogygos', 'Ophion', 'Polybotes',
                      'Rhoikos' },
        },
        [7] = {
            sight = { 'Eurytos', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ogygos', 'Polybotes', 'Rhoikos',
                      'Rhoitos' },
        },
        [8] = {
            sight = { 'Eurytos', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ogygos', 'Ophion', 'Polybotes',
                      'Rhoitos' },
        },
        [9] = {
            sight = { 'Eurytos', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Jailer',
                      'Gigas Kettlemaster', 'Gigas Quarrier', 'Gigas Wallwatcher', 'Ophion', 'Polybotes', 'Rhoikos',
                      'Rhoitos' },
        },
        [10] = { sound = { 'Scythe Victim blm' } },
        [11] = { sound = { 'Scythe Victim war' } },
    },
    monsters = {
        {
            name   = 'Mold Bats',
            ids    = { 1, 2, 3, 55, 56, 60 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Stirge',
            ids    = { 4, 5, 57, 61, 62, 64, 65 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 6, 11, 16, 21, 42, 47, 67, 72, 79, 84, 135, 140, 145, 152, 157, 162, 167, 172, 177, 184, 189,
                       199, 204, 211, 216, 247, 252, 327, 332 },
            levels = {
                [30] = { acc = 110, eva = 98, agi = 25, int = 26, mnd = 26, chr = 36 },
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
                [32] = { acc = 117, eva = 104, agi = 27, int = 28, mnd = 28, chr = 39 },
                [33] = { acc = 121, eva = 108, agi = 28, int = 29, mnd = 29, chr = 41 },
                [34] = { acc = 125, eva = 111, agi = 29, int = 29, mnd = 29, chr = 42 },
            },
            spawn_levels = { [6] = { 30, 32 }, [11] = { 30, 32 }, [16] = { 30, 32 }, [21] = { 30, 32 },
                             [42] = { 30, 32 }, [47] = { 30, 32 }, [67] = { 30, 32 }, [72] = { 30, 32 },
                             [79] = { 30, 32 }, [84] = { 30, 32 }, [135] = { 30, 32 }, [140] = { 30, 32 },
                             [145] = { 30, 32 }, [152] = { 30, 32 }, [157] = { 30, 32 }, [162] = { 32, 34 },
                             [167] = { 32, 34 }, [172] = { 32, 34 }, [177] = { 32, 34 }, [184] = { 32, 34 },
                             [189] = { 32, 34 }, [199] = { 32, 34 }, [204] = { 32, 34 }, [211] = { 32, 34 },
                             [216] = { 32, 34 }, [247] = { 32, 34 }, [252] = { 32, 34 }, [327] = { 32, 34 },
                             [332] = { 32, 34 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 10, item = 12817 },  -- brass cuisses
                { rate = 10, item = 12433 },  -- brass mask
                { rate = 10, item = 12689 },  -- brass finger gauntlets
                { rate = 10, item = 12945 },  -- brass greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblins Bat',
            ids    = { 7, 12, 17, 22, 43, 48, 68, 73, 80, 85, 136, 141, 146, 153, 158, 163, 168, 173, 178, 185, 190,
                       200, 205, 212, 217, 248, 253, 328, 333 },
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 1,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 8, 13, 18, 23, 44, 49, 69, 74, 81, 86, 137, 142, 147, 154, 159, 164, 169, 174, 179, 186, 191,
                       201, 206, 213, 218, 249, 254, 329, 334 },
            levels = {
                [30] = { acc = 131, eva = 95, agi = 38, int = 26, mnd = 28, chr = 26 },
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
                [33] = { acc = 142, eva = 105, agi = 43, int = 29, mnd = 32, chr = 29 },
                [34] = { acc = 145, eva = 108, agi = 45, int = 29, mnd = 32, chr = 29 },
            },
            spawn_levels = { [8] = { 30, 32 }, [13] = { 30, 32 }, [18] = { 30, 32 }, [23] = { 30, 32 },
                             [44] = { 30, 32 }, [49] = { 30, 32 }, [69] = { 30, 32 }, [74] = { 30, 32 },
                             [81] = { 30, 32 }, [86] = { 30, 32 }, [137] = { 30, 32 }, [142] = { 30, 32 },
                             [147] = { 30, 32 }, [154] = { 30, 32 }, [159] = { 30, 32 }, [164] = { 32, 34 },
                             [169] = { 32, 34 }, [174] = { 32, 34 }, [179] = { 32, 34 }, [186] = { 32, 34 },
                             [191] = { 32, 34 }, [201] = { 32, 34 }, [206] = { 32, 34 }, [213] = { 32, 34 },
                             [218] = { 33, 33 }, [249] = { 32, 34 }, [254] = { 32, 34 }, [329] = { 32, 34 },
                             [334] = { 32, 34 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 10, item = 850 },  -- square of sheep leather
                { rate = 10, item = 848 },  -- square of dhalmel leather
                { rate = 5, item = 855 },  -- square of black tiger leather
                { rate = 1, item = 506 },  -- square of coeurl leather
                { rate = 5, item = 12442 },  -- studded bandana
                { rate = 5, item = 12698 },  -- studded gloves
                { rate = 5, item = 12826 },  -- studded trousers
                { rate = 5, item = 12954 },  -- studded boots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 9, 14, 19, 24, 45, 50, 70, 75, 82, 87, 138, 143, 148, 155, 160, 165, 170, 175, 180, 187, 192,
                       202, 207, 214, 219, 250, 255, 330, 335 },
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29 },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29 },
            },
            spawn_levels = { [9] = { 30, 32 }, [14] = { 30, 32 }, [19] = { 30, 32 }, [24] = { 30, 32 },
                             [45] = { 30, 32 }, [50] = { 30, 32 }, [70] = { 30, 32 }, [75] = { 30, 32 },
                             [82] = { 30, 32 }, [87] = { 30, 32 }, [138] = { 30, 32 }, [143] = { 30, 32 },
                             [148] = { 30, 32 }, [155] = { 30, 32 }, [160] = { 30, 32 }, [165] = { 32, 34 },
                             [170] = { 32, 34 }, [175] = { 32, 34 }, [180] = { 32, 34 }, [187] = { 32, 34 },
                             [192] = { 32, 34 }, [202] = { 32, 34 }, [207] = { 32, 34 }, [214] = { 32, 34 },
                             [219] = { 32, 32 }, [250] = { 32, 34 }, [255] = { 32, 34 }, [330] = { 32, 34 },
                             [335] = { 32, 34 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12424 },  -- iron mask
                { rate = 10, item = 12808 },  -- chain hose
                { rate = 10, item = 12680 },  -- chain mittens
                { rate = 10, item = 12936 },  -- greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 10, 15, 20, 25, 46, 51, 71, 76, 83, 88, 139, 144, 149, 156, 161, 166, 171, 176, 181, 188,
                       193, 203, 208, 215, 220, 251, 256, 331, 336 },
            levels = {
                [30] = { acc = 110, eva = 92, agi = 33, int = 36, mnd = 26, chr = 28 },
                [31] = { acc = 114, eva = 97, agi = 36, int = 39, mnd = 28, chr = 30 },
                [32] = { acc = 117, eva = 99, agi = 36, int = 39, mnd = 28, chr = 30 },
                [33] = { acc = 121, eva = 102, agi = 36, int = 41, mnd = 29, chr = 32 },
                [34] = { acc = 125, eva = 105, agi = 39, int = 42, mnd = 29, chr = 32 },
            },
            spawn_levels = { [10] = { 30, 32 }, [15] = { 30, 32 }, [20] = { 30, 32 }, [25] = { 30, 32 },
                             [46] = { 30, 32 }, [51] = { 30, 32 }, [71] = { 30, 32 }, [76] = { 30, 32 },
                             [83] = { 30, 32 }, [88] = { 30, 32 }, [139] = { 30, 32 }, [144] = { 30, 32 },
                             [149] = { 30, 32 }, [156] = { 30, 32 }, [161] = { 30, 32 }, [166] = { 32, 34 },
                             [171] = { 32, 34 }, [176] = { 32, 34 }, [181] = { 32, 34 }, [188] = { 32, 34 },
                             [193] = { 32, 34 }, [203] = { 32, 34 }, [208] = { 32, 34 }, [215] = { 32, 34 },
                             [220] = { 32, 32 }, [251] = { 32, 34 }, [256] = { 32, 34 }, [331] = { 32, 34 },
                             [336] = { 32, 34 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1, item = 12474 },  -- wool hat
                { rate = 1, item = 12730 },  -- wool cuffs
                { rate = 1, item = 12858 },  -- wool slops
                { rate = 1, item = 12986 },  -- chestnut sabots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Giant Gatekeeper',
            ids    = { 26, 31, 37, 89, 95, 100, 105, 110, 115, 120, 130 },
            levels = {
                [30] = { acc = 110, eva = 100, agi = 29, int = 19, mnd = 23, chr = 28 },
                [31] = { acc = 114, eva = 105, agi = 32, int = 20, mnd = 24, chr = 31 },
                [32] = { acc = 117, eva = 107, agi = 32, int = 20, mnd = 24, chr = 31 },
            },
            ph_for = { [37] = { 36 }, [95] = { 94 } },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Giant Guard',
            ids    = { 27, 32, 38, 90, 96, 101, 106, 111, 116, 121, 131 },
            levels = {
                [30] = { acc = 112, eva = 99, agi = 21, int = 17, mnd = 28, chr = 28 },
                [31] = { acc = 115, eva = 103, agi = 23, int = 19, mnd = 30, chr = 31 },
                [32] = { acc = 118, eva = 105, agi = 23, int = 19, mnd = 30, chr = 31 },
            },
            ph_for = { [38] = { 36 }, [131] = { 129 } },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Giant Sentry',
            ids    = { 28, 33, 39, 91, 97, 102, 107, 112, 117, 122, 132 },
            levels = {
                [30] = { acc = 110, eva = 97, agi = 23, int = 21, mnd = 25, chr = 36 },
                [31] = { acc = 114, eva = 101, agi = 25, int = 23, mnd = 27, chr = 39 },
                [32] = { acc = 117, eva = 103, agi = 25, int = 23, mnd = 27, chr = 39 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10, slow = 10 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Gigass Bat',
            ids    = { 29, 34, 40, 92, 98, 103, 108, 113, 118, 123, 133 },
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 1,
        },
        {
            name   = 'Giant Lobber',
            ids    = { 30, 35, 41, 93, 99, 104, 109, 114, 119, 124, 134 },
            levels = {
                [30] = { acc = 131, eva = 102, agi = 33, int = 21, mnd = 27, chr = 28 },
                [31] = { acc = 135, eva = 107, agi = 36, int = 23, mnd = 28, chr = 31 },
                [32] = { acc = 138, eva = 109, agi = 36, int = 23, mnd = 28, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            drops  = {
                { rate = 50, item = 1199 },  -- northern fur
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Eurytos',
            ids    = { 36 },
            nm     = true,
            levels = {
                [32] = { acc = 138, eva = 109, agi = 36, int = 23, mnd = 28, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Magic Pot',
            ids    = { 52, 58, 59, 127, 128 },
            levels = {
                [28] = { acc = 101, eva = 92, agi = 25, int = 31, mnd = 29, chr = 28 },
                [29] = { acc = 105, eva = 95, agi = 25, int = 32, mnd = 31, chr = 29 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Panzer Doll',
            ids    = { 53, 54, 125, 126 },
            levels = {
                [31] = { acc = 114, eva = 105, agi = 32, int = 24, mnd = 24, chr = 31 },
                [32] = { acc = 117, eva = 107, agi = 32, int = 24, mnd = 24, chr = 31 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1165 },  -- doll shard
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Banshee',
            ids    = { 63, 66, 77 },
            levels = {
                [32] = { acc = 115, eva = 107, agi = 33, int = 31, mnd = 24, chr = 32 },
                [33] = { acc = 119, eva = 111, agi = 34, int = 32, mnd = 25, chr = 32 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4871 },  -- scroll of escape
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Evil Spirit MDT',
            ids    = { 78, 243, 244, 294 },
            levels = {
                [34] = { acc = 123, eva = 115, agi = 36, int = 34, mnd = 25, chr = 33 },
                [35] = { acc = 126, eva = 118, agi = 36, int = 34, mnd = 26, chr = 34 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 50, item = 1036 },  -- delkfutt chest key
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Polybotes',
            ids    = { 94 },
            nm     = true,
            levels = {
                [34] = { acc = 125, eva = 114, agi = 34, int = 22, mnd = 26, chr = 32 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Rhoitos',
            ids    = { 129 },
            nm     = true,
            levels = {
                [34] = { acc = 126, eva = 112, agi = 24, int = 20, mnd = 32, chr = 32 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 150, 197, 245, 286, 302, 339 },
            levels = {
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
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
            name   = 'Light Elemental',
            ids    = { 151, 198, 246, 287, 303, 340 },
            levels = {
                [35] = { acc = 121, eva = 104, agi = 30, int = 30, mnd = 43, chr = 36 },
                [36] = { acc = 125, eva = 107, agi = 32, int = 32, mnd = 44, chr = 38 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            drops  = {
                { rate = 1000, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Tower Bats',
            ids    = { 182, 183, 209, 210, 233, 234, 235, 279, 280, 281, 288, 291, 292 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Big Bat',
            ids    = { 194, 195, 221, 222, 236, 237, 238, 282, 283, 289, 290, 293, 295, 296, 297, 298, 299, 300 },
            levels = {
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
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
            links  = 1,
        },
        {
            name   = 'Magic Jar',
            ids    = { 196, 301, 337 },
            levels = {
                [31] = { acc = 112, eva = 103, agi = 28, int = 35, mnd = 34, chr = 32 },
                [32] = { acc = 115, eva = 105, agi = 28, int = 35, mnd = 34, chr = 32 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gigas Wallwatcher',
            ids    = { 223, 228, 257, 262, 269, 274, 305, 307, 312, 317, 322 },
            levels = {
                [32] = { acc = 117, eva = 107, agi = 32, int = 20, mnd = 24, chr = 31 },
                [33] = { acc = 121, eva = 110, agi = 32, int = 22, mnd = 26, chr = 31 },
                [34] = { acc = 125, eva = 114, agi = 34, int = 22, mnd = 26, chr = 32 },
            },
            ph_for = { [305] = { 304 } },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Gigas Jailer',
            ids    = { 224, 229, 258, 263, 270, 275, 306, 308, 313, 318, 323 },
            levels = {
                [32] = { acc = 118, eva = 105, agi = 23, int = 19, mnd = 30, chr = 31 },
                [33] = { acc = 122, eva = 109, agi = 24, int = 20, mnd = 32, chr = 31 },
                [34] = { acc = 126, eva = 112, agi = 24, int = 20, mnd = 32, chr = 32 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Gigas Kettlemaster',
            ids    = { 225, 230, 239, 259, 264, 271, 276, 309, 314, 319, 324 },
            levels = {
                [32] = { acc = 117, eva = 103, agi = 25, int = 23, mnd = 27, chr = 39 },
                [33] = { acc = 121, eva = 107, agi = 26, int = 24, mnd = 28, chr = 40 },
                [34] = { acc = 125, eva = 110, agi = 27, int = 24, mnd = 28, chr = 41 },
            },
            ph_for = { [239] = { 241 } },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10, slow = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Gigass Bats',
            ids    = { 226, 231, 240, 242, 260, 265, 272, 277, 310, 315, 320, 325 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 1,
        },
        {
            name   = 'Gigas Quarrier',
            ids    = { 227, 232, 261, 266, 268, 273, 278, 311, 316, 321, 326 },
            levels = {
                [32] = { acc = 138, eva = 109, agi = 36, int = 23, mnd = 28, chr = 31 },
                [33] = { acc = 142, eva = 112, agi = 37, int = 24, mnd = 30, chr = 31 },
                [34] = { acc = 145, eva = 116, agi = 38, int = 24, mnd = 30, chr = 32 },
            },
            ph_for = { [268] = { 267 } },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Ophion',
            ids    = { 241 },
            nm     = true,
            levels = {
                [34] = { acc = 125, eva = 109, agi = 24, int = 25, mnd = 29, chr = 45 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Rhoikos',
            ids    = { 267 },
            nm     = true,
            levels = {
                [34] = { acc = 145, eva = 116, agi = 38, int = 24, mnd = 30, chr = 32 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Jagd Doll',
            ids    = { 284, 285, 338 },
            levels = {
                [33] = { acc = 120, eva = 110, agi = 32, int = 26, mnd = 26, chr = 31 },
                [34] = { acc = 124, eva = 114, agi = 34, int = 26, mnd = 26, chr = 32 },
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
        },
        {
            name   = 'Ogygos',
            ids    = { 304 },
            nm     = true,
            levels = {
                [35] = { acc = 128, eva = 117, agi = 35, int = 23, mnd = 27, chr = 33 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 12292 },  -- mahogany shield
                { rate = 100, item = 499 },  -- gigas necklace
                { rate = 100, item = 14019 },  -- ogygoss bracelets
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Gerwitzs Scythe',
            ids    = { 341 },
            nm     = true,
            levels = {
                [60] = { acc = 235, eva = 218, agi = 56, int = 74, mnd = 49, chr = 54 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Scythe Victim war',
            ids    = { 342 },
            levels = {
                [58] = { acc = 225, eva = 210, agi = 61, int = 46, mnd = 44, chr = 52 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 10,
        },
        {
            name   = 'Scythe Victim blm',
            ids    = { 343 },
            levels = {
                [58] = { acc = 225, eva = 192, agi = 61, int = 71, mnd = 50, chr = 55 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 11,
        },
    },
    by_name = {},
}
