-- Ship bound for Mhaura Pirates (zone 228).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Sea Pugil',
            ids    = { 1 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 13 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 15 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
            },
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
            name   = 'Ocean Crab',
            ids    = { 2 },
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
                [11] = { acc = 42, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 45, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18 },
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
            name   = 'Ocean Pugil',
            ids    = { 3 },
            levels = {
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 15 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Pirate Pugil',
            ids    = { 4 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 19 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sea Monk',
            ids    = { 5 },
            levels = {
                [21] = { acc = 77, eva = 73, agi = 24, int = 18, mnd = 18, chr = 20 },
                [22] = { acc = 80, eva = 75, agi = 24, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 83, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 87, eva = 82, agi = 26, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 90, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 94, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 97, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 104, eva = 98, agi = 30, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sea Crab',
            ids    = { 6, 7 },
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 15 },
                [11] = { acc = 42, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 45, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 17 },
                [14] = { acc = 52, eva = 46, agi = 11, int = 12, mnd = 18, chr = 18 },
                [15] = { acc = 55, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
                [16] = { acc = 59, eva = 53, agi = 13, int = 14, mnd = 20, chr = 20 },
                [17] = { acc = 62, eva = 55, agi = 13, int = 14, mnd = 20, chr = 20 },
                [18] = { acc = 65, eva = 59, agi = 14, int = 14, mnd = 20, chr = 20 },
                [19] = { acc = 69, eva = 62, agi = 14, int = 15, mnd = 22, chr = 22 },
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
        },
        {
            name   = 'Sea Pugil',
            ids    = { 8, 9 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 13 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 15 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Sea Monk',
            ids    = { 10 },
            levels = {
                [21] = { acc = 77, eva = 73, agi = 24, int = 18, mnd = 18, chr = 20 },
                [22] = { acc = 80, eva = 75, agi = 24, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 83, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 87, eva = 82, agi = 26, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 90, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 94, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 97, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 104, eva = 98, agi = 30, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Phantom',
            ids    = { 11 },
            levels = {
                [22] = { acc = 81, eva = 75, agi = 24, int = 21, mnd = 17, chr = 23 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 21, mnd = 17, chr = 23 },
                [24] = { acc = 88, eva = 82, agi = 26, int = 22, mnd = 17, chr = 24 },
                [25] = { acc = 91, eva = 85, agi = 26, int = 24, mnd = 20, chr = 25 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4858 },  -- scroll of ice spikes
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Crossbones',
            ids    = { 12, 13 },
            levels = {
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26 },
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26 },
                [30] = { acc = 109, eva = 91, agi = 31, int = 36, mnd = 24, chr = 28 },
                [31] = { acc = 114, eva = 95, agi = 33, int = 39, mnd = 27, chr = 30 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 13095 },  -- sand charm
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Crossbones',
            ids    = { 14, 15 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 21, chr = 26 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 13095 },  -- sand charm
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ship Wight',
            ids    = { 16 },
            levels = {
                [36] = { acc = 131, eva = 110, agi = 38, int = 44, mnd = 30, chr = 34 },
                [37] = { acc = 134, eva = 113, agi = 38, int = 46, mnd = 30, chr = 34 },
                [38] = { acc = 137, eva = 115, agi = 38, int = 46, mnd = 32, chr = 34 },
                [39] = { acc = 141, eva = 119, agi = 40, int = 49, mnd = 33, chr = 37 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
        },
        {
            name   = 'Silverhook',
            ids    = { 17 },
            nm     = true,
            levels = {
                [68] = { acc = 278, eva = 263, agi = 71, int = 73, mnd = 55, chr = 63 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 74, mnd = 55, chr = 63 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 75, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = 11, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 150, item = 18395 },  -- seawolf cudgel
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
