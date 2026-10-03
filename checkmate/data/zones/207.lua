-- Cloister of Flames (zone 207).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Fire Elemental' },
        [2] = { 'Fire Elemental', 'Ifrit Prime' },
    },
    monsters = {
        {
            name   = 'Ifrit Prime',
            ids    = { 1, 2, 3 },
            nm     = true,
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 56, mnd = 49, chr = 54 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, earth = 11, thunder = 11, water = -3, light = 11, dark = 11,
                       paralyze = 11, bind = 11, silence = 11, slow = 11, poison = -3, light_sleep = 11,
                       dark_sleep = 11, blind = 11, stun = 11, gravity = 11 },
            absorb = { fire = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'elegy',
                       'blind', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ifrit Prime',
            ids    = { 4, 5, 6 },
            nm     = true,
            levels = {
                [20] = { acc = 74, eva = 62, agi = 22, int = 25, mnd = 18, chr = 19 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, earth = 11, thunder = 11, water = -3, dark = 11,
                       paralyze = 11, bind = 11, silence = 11, slow = 11, poison = -3, light_sleep = 11,
                       dark_sleep = 11, blind = 11, stun = 11, gravity = 11 },
            meva   = { light = -35 },
            absorb = { fire = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'blind',
                       'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ifrit Prime',
            ids    = { 7, 12, 17 },
            nm     = true,
            levels = {
                [85] = { acc = 374, eva = 351, agi = 82, int = 92, mnd = 64, chr = 66 },
            },
            ranks  = { fire = -3, ice = 11, wind = 4, earth = 4, thunder = 4, water = -3, light = 4, dark = 4,
                       paralyze = 11, bind = 11, silence = 4, slow = 4, poison = -3, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 11 },
            magic_dmg = { all = -20 },
            absorb = { fire = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            links  = 1,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 8, 9, 10, 11, 13, 14, 15, 16, 18, 19, 20, 21 },
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
            },
            ranks  = { fire = -3, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            absorb = { fire = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze' },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
            links  = 2,
        },
        {
            name   = 'Ifrit Prime',
            ids    = { 22, 23, 24 },
            nm     = true,
            levels = {
                [40] = { acc = 143, eva = 132, agi = 37, int = 44, mnd = 30, chr = 30 },
            },
            ranks  = { fire = 11, ice = 11, wind = 11, earth = 11, thunder = 11, water = -3, light = 11, dark = 11,
                       paralyze = 11, bind = 11, silence = 11, slow = 11, poison = -3, light_sleep = 11,
                       dark_sleep = 11, blind = 11, stun = 11, gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
    },
    by_name = {},
}
