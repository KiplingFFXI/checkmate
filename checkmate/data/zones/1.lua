-- Phanauet Channel (zone 1).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1, 2 },
            levels = {
                [15] = { acc = 56, eva = 50, agi = 13, int = 13, mnd = 20, chr = 20 },
                [16] = { acc = 60, eva = 54, agi = 14, int = 15, mnd = 23, chr = 23 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 15, mnd = 23, chr = 23 },
                [18] = { acc = 67, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23 },
                [19] = { acc = 70, eva = 62, agi = 15, int = 16, mnd = 25, chr = 25 },
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
            name   = 'Big Jaw',
            ids    = { 3 },
            levels = {
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 20 },
                [21] = { acc = 80, eva = 76, agi = 30, int = 20, mnd = 20, chr = 22 },
                [22] = { acc = 83, eva = 78, agi = 30, int = 20, mnd = 20, chr = 22 },
                [23] = { acc = 86, eva = 81, agi = 30, int = 20, mnd = 20, chr = 22 },
                [24] = { acc = 90, eva = 85, agi = 32, int = 21, mnd = 21, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fishtrap',
            ids    = { 4 },
            levels = {
                [25] = { acc = 93, eva = 87, agi = 30, int = 23, mnd = 23, chr = 26 },
                [26] = { acc = 97, eva = 91, agi = 32, int = 23, mnd = 23, chr = 26 },
                [27] = { acc = 100, eva = 93, agi = 33, int = 24, mnd = 24, chr = 27 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 100, item = 1727 },  -- piece of garhada teak lumber
                { rate = 10, item = 1617 },  -- flytrap leaf
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Protozoan',
            ids    = { 5 },
            levels = {
                [29] = { acc = 107, eva = 99, agi = 33, int = 25, mnd = 28, chr = 28 },
                [30] = { acc = 110, eva = 102, agi = 33, int = 26, mnd = 28, chr = 29 },
                [31] = { acc = 114, eva = 107, agi = 36, int = 26, mnd = 29, chr = 31 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1727 },  -- piece of garhada teak lumber
                { rate = 50, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Aipaloovik',
            ids    = { 6 },
            nm     = true,
            levels = {
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 30 },
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 32 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
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
            name   = 'Thickshell',
            ids    = { 7 },
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 16, chr = 16 },
                [11] = { acc = 43, eva = 39, agi = 12, int = 12, mnd = 18, chr = 18 },
                [12] = { acc = 46, eva = 41, agi = 12, int = 12, mnd = 18, chr = 18 },
                [13] = { acc = 50, eva = 44, agi = 12, int = 13, mnd = 19, chr = 19 },
                [14] = { acc = 53, eva = 47, agi = 12, int = 13, mnd = 20, chr = 20 },
                [15] = { acc = 56, eva = 50, agi = 13, int = 13, mnd = 20, chr = 20 },
                [16] = { acc = 60, eva = 54, agi = 14, int = 15, mnd = 23, chr = 23 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 15, mnd = 23, chr = 23 },
                [18] = { acc = 67, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23 },
                [19] = { acc = 70, eva = 62, agi = 15, int = 16, mnd = 25, chr = 25 },
                [20] = { acc = 73, eva = 65, agi = 15, int = 16, mnd = 25, chr = 25 },
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
            name   = 'Giant Pugil',
            ids    = { 8 },
            levels = {
                [10] = { acc = 41, eva = 38, agi = 17, int = 12, mnd = 12, chr = 12 },
                [11] = { acc = 45, eva = 43, agi = 20, int = 12, mnd = 12, chr = 15 },
                [12] = { acc = 48, eva = 45, agi = 20, int = 12, mnd = 12, chr = 15 },
                [13] = { acc = 51, eva = 48, agi = 20, int = 14, mnd = 14, chr = 15 },
                [14] = { acc = 55, eva = 52, agi = 22, int = 14, mnd = 14, chr = 15 },
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 17 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 17 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 20 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 1727 },  -- piece of garhada teak lumber
                { rate = 50, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Flytrap',
            ids    = { 9, 10 },
            levels = {
                [15] = { acc = 58, eva = 54, agi = 20, int = 14, mnd = 14, chr = 17 },
                [16] = { acc = 62, eva = 58, agi = 23, int = 15, mnd = 15, chr = 18 },
                [17] = { acc = 65, eva = 60, agi = 23, int = 17, mnd = 17, chr = 18 },
                [18] = { acc = 68, eva = 63, agi = 23, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 67, agi = 25, int = 18, mnd = 18, chr = 21 },
                [20] = { acc = 75, eva = 70, agi = 25, int = 18, mnd = 18, chr = 21 },
                [21] = { acc = 80, eva = 75, agi = 28, int = 20, mnd = 20, chr = 23 },
                [22] = { acc = 83, eva = 77, agi = 28, int = 20, mnd = 20, chr = 23 },
                [23] = { acc = 86, eva = 80, agi = 28, int = 20, mnd = 20, chr = 23 },
                [24] = { acc = 90, eva = 84, agi = 30, int = 21, mnd = 21, chr = 24 },
                [25] = { acc = 93, eva = 87, agi = 30, int = 23, mnd = 23, chr = 26 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Ooze',
            ids    = { 11 },
            levels = {
                [25] = { acc = 93, eva = 86, agi = 29, int = 23, mnd = 25, chr = 26 },
                [26] = { acc = 97, eva = 90, agi = 31, int = 23, mnd = 26, chr = 26 },
                [27] = { acc = 100, eva = 92, agi = 31, int = 24, mnd = 26, chr = 27 },
                [28] = { acc = 103, eva = 96, agi = 32, int = 24, mnd = 26, chr = 28 },
                [29] = { acc = 107, eva = 99, agi = 33, int = 25, mnd = 28, chr = 28 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1727 },  -- piece of garhada teak lumber
                { rate = 50, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 12 },
            levels = {
                [27] = { acc = 100, eva = 89, agi = 31, int = 37, mnd = 29, chr = 30 },
                [28] = { acc = 103, eva = 91, agi = 31, int = 37, mnd = 30, chr = 30 },
                [29] = { acc = 106, eva = 95, agi = 32, int = 38, mnd = 30, chr = 30 },
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
            ids    = { 13 },
            levels = {
                [27] = { acc = 100, eva = 89, agi = 31, int = 37, mnd = 29, chr = 30 },
                [28] = { acc = 103, eva = 91, agi = 31, int = 37, mnd = 30, chr = 30 },
                [29] = { acc = 106, eva = 95, agi = 32, int = 38, mnd = 30, chr = 30 },
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
            name   = 'Vodyanoi',
            ids    = { 14 },
            nm     = true,
            levels = {
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 31, chr = 36 },
                [46] = { acc = 166, eva = 153, agi = 45, int = 51, mnd = 32, chr = 38 },
                [47] = { acc = 170, eva = 156, agi = 47, int = 52, mnd = 32, chr = 38 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 14335 },  -- nokizaru hakama
                { rate = 100, item = 15368 },  -- war hose
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Stubborn Dredvodd',
            ids    = { 15 },
            nm     = true,
            levels = {
                [33] = { acc = 130, eva = 114, agi = 34, int = 26, mnd = 34, chr = 40 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 15296 },  -- tathlum belt
                { rate = 100, item = 14667 },  -- carect ring
                { rate = 150, item = 15326 },  -- gargoyle boots
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
        },
        {
            name   = 'Orcs Wyvern',
            ids    = { 16 },
            levels = {
                [28] = { acc = 103, eva = 96, agi = 33, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
    },
    by_name = {},
}
