-- Monarch Linn (zone 31).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Mammet-19 Epsilon' },
        [2] = { 'Guard Hippogryph' },
        [3] = { 'Watch Hippogryph' },
        [4] = { 'Mammet-800' },
    },
    monsters = {
        {
            name   = 'Mammet-19 Epsilon',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9 },
            nm     = true,
            levels = {
                [43] = { acc = 153, eva = 138, agi = 42, int = 47, mnd = 47, chr = 42 },
                [44] = { acc = 157, eva = 141, agi = 43, int = 49, mnd = 49, chr = 45 },
            },
            ranks  = { thunder = -1, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 240, item = 5264 },  -- bottle of yellow liquid
                { rate = 150, item = 5264 },  -- bottle of yellow liquid
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Ouryu',
            ids    = { 10, 11, 12 },
            nm     = true,
            levels = {
                [54] = { acc = 202, eva = 183, agi = 45, int = 49, mnd = 52, chr = 64 },
                [55] = { acc = 208, eva = 189, agi = 46, int = 50, mnd = 52, chr = 65 },
            },
            ranks  = { wind = -2, earth = 11, thunder = 11, silence = -2, slow = 11, stun = 11, gravity = -2 },
            magic_dmg = { all = -35 },
            immune = { 'stun', 'slow', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Hamadryad',
            ids    = { 13, 15, 17 },
            levels = {
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Razon',
            ids    = { 19, 21, 23 },
            levels = {
                [45] = { acc = 164, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            magic_dmg = { all = 100 },
            immune = { 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Watch Hippogryph',
            ids    = { 25, 28, 31 },
            nm     = true,
            levels = {
                [60] = { acc = 240, eva = 272, agi = 68, int = 63, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -2, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'blind', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Guard Hippogryph',
            ids    = { 26, 29, 32 },
            nm     = true,
            levels = {
                [55] = { acc = 204, eva = 180, agi = 43, int = 52, mnd = 52, chr = 63 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -2, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'blind', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Hotupuku',
            ids    = { 34, 36, 38 },
            levels = {
                [50] = { acc = 178, eva = 166, agi = 48, int = 39, mnd = 45, chr = 48 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'paralyze' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Mammet Master',
            ids    = { 40, 50, 60 },
            levels = {
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { thunder = -1, stun = -1 },
        },
        {
            name   = 'Mammet-800',
            ids    = { 41, 42, 43, 44, 45, 46, 47, 48, 49, 51, 52, 53, 54, 55, 56, 57, 58, 59, 61, 62, 63, 64, 65,
                       66, 67, 68, 69 },
            levels = {
                [80] = { acc = 338, eva = 314, agi = 74, int = 82, mnd = 82, chr = 75 },
            },
            ranks  = { thunder = -1, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'petrify' },
            drops  = {
                { rate = 1000, item = 5264 },  -- bottle of yellow liquid
                { rate = 240, item = 5264 },  -- bottle of yellow liquid
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 4,
        },
        {
            name   = 'Gullinkambi',
            ids    = { 70, 76, 82 },
            nm     = true,
            levels = {},
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Gullin Baelfyr',
            ids    = { 71, 77, 83 },
            levels = {},
            ranks  = { fire = 11, ice = 1, wind = 1, earth = 1, thunder = 1, water = -3, light = 11, dark = -3,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = -3, light_sleep = 11,
                       dark_sleep = -3, blind = -3, stun = 1, gravity = 1 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gefyrst',
            ids    = { 72, 78, 84 },
            levels = {},
            ranks  = { fire = -3, ice = 11, wind = 1, earth = 1, thunder = -3, water = 11, light = 1, dark = 1,
                       paralyze = 11, bind = 11, silence = 1, slow = 1, poison = 11, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -3, gravity = 1 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gullin Ungeweder',
            ids    = { 73, 79, 85 },
            levels = {},
            ranks  = { fire = 1, ice = -3, wind = 11, earth = -3, thunder = 11, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 11, slow = -3, poison = 1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = 11, gravity = 11 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gullin Byrgen',
            ids    = { 74, 80, 86 },
            levels = {},
            ranks  = { fire = 1, ice = 1, wind = -3, earth = 11, thunder = 1, water = 1, light = -3, dark = 11,
                       paralyze = 1, bind = 1, silence = -3, slow = 11, poison = 1, light_sleep = -3,
                       dark_sleep = 11, blind = 11, stun = 1, gravity = -3 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Ouryu',
            ids    = { 97, 106, 115 },
            nm     = true,
            levels = {
                [99] = { acc = 475, eva = 416, agi = 79, int = 85, mnd = 90, chr = 112 },
            },
            ranks  = { wind = -2, earth = 11, thunder = 11, silence = -2, slow = 11, stun = 11, gravity = -2 },
            magic_dmg = { all = -35 },
            immune = { 'stun', 'slow', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 98, 99, 107, 108, 116, 117 },
            levels = {
                [99] = { acc = 473, eva = 414, agi = 96, int = 112, mnd = 90, chr = 92 },
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
    },
    by_name = {},
}
