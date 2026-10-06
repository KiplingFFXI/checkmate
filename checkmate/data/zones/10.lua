-- The Shrouded Maw (zone 10).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { superlink = { 'Diremite' } },
        [2] = { superlink = { 'Diremite Dominator' } },
    },
    monsters = {
        {
            name   = 'Diabolos',
            ids    = { 1, 8, 15 },
            nm     = true,
            levels = {
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Diremite',
            ids    = { 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 13, 14, 16, 17, 18, 19, 20, 21 },
            nm     = true,
            levels = {
                [38] = { acc = 138, eva = 126, agi = 37, int = 42, mnd = 28, chr = 28 },
                [39] = { acc = 142, eva = 131, agi = 40, int = 44, mnd = 29, chr = 29 },
                [40] = { acc = 145, eva = 134, agi = 40, int = 44, mnd = 29, chr = 29 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Pasuk',
            ids    = { 22, 24, 26 },
            levels = {
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 33 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            immune = { 'bind', 'gravity', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Diabolos',
            ids    = { 28, 35, 42 },
            nm     = true,
            levels = {
                [83] = { acc = 360, eva = 331, agi = 80, int = 95, mnd = 76, chr = 77 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Diremite Dominator',
            ids    = { 29, 30, 31, 32, 33, 34, 36, 37, 38, 39, 40, 41, 43, 44, 45, 46, 47, 48 },
            nm     = true,
            levels = {
                [73] = { acc = 304, eva = 287, agi = 70, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52 },
                [75] = { acc = 314, eva = 297, agi = 70, int = 77, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Diabolos',
            ids    = { 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63 },
            nm     = true,
            levels = {
                [99] = { acc = 473, eva = 414, agi = 96, int = 112, mnd = 90, chr = 92 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, dark = 4, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = 1, dark_sleep = 4, blind = 4, stun = 1,
                       gravity = 1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'slow', 'petrify', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
    },
    by_name = {},
}
