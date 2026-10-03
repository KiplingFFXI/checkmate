-- Cloister of Tides (zone 211).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Water Elemental' },
        [2] = { 'Leviathan Prime', 'Water Elemental' },
    },
    monsters = {
        {
            name   = 'Leviathan Prime',
            ids    = { 1, 2, 3 },
            nm     = true,
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 56, mnd = 49, chr = 54 },
            },
            ranks  = { fire = 11, ice = 11, wind = 11, earth = 11, thunder = -3, water = -3, light = 11, dark = 11,
                       paralyze = 11, bind = 11, silence = 11, slow = 11, poison = 11, light_sleep = 11,
                       dark_sleep = 11, blind = 11, stun = -3, gravity = 11 },
            absorb = { water = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'elegy',
                       'blind', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Leviathan Prime',
            ids    = { 4, 5, 6 },
            nm     = true,
            levels = {
                [20] = { acc = 74, eva = 68, agi = 20, int = 22, mnd = 15, chr = 15 },
            },
            ranks  = { fire = 11, ice = 11, wind = -3, earth = 11, thunder = 11, water = -3, dark = 11,
                       paralyze = 11, bind = 11, silence = -3, slow = 11, poison = 11, light_sleep = 11,
                       dark_sleep = 11, blind = 11, stun = -3, gravity = 11 },
            meva   = { light = -35 },
            absorb = { water = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'blind',
                       'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Leviathan Prime',
            ids    = { 7, 12, 17 },
            nm     = true,
            levels = {
                [85] = { acc = 374, eva = 351, agi = 82, int = 92, mnd = 64, chr = 66 },
            },
            ranks  = { fire = 11, ice = 4, wind = 4, earth = 4, thunder = -3, water = -3, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = -3, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = -3, gravity = 11 },
            magic_dmg = { all = -20 },
            absorb = { water = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'poison', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
            links  = 1,
        },
        {
            name   = 'Water Elemental',
            ids    = { 8, 9, 10, 11, 13, 14, 15, 16, 18, 19, 20, 21 },
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
            },
            ranks  = { fire = 11, thunder = -3, water = -3, poison = 11, stun = -3 },
            absorb = { water = 100 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'poison' },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
            links  = 2,
        },
        {
            name   = 'Leviathan Prime',
            ids    = { 22, 23, 24 },
            nm     = true,
            levels = {
                [40] = { acc = 143, eva = 132, agi = 37, int = 44, mnd = 30, chr = 30 },
            },
            ranks  = { fire = 11, ice = 11, wind = 11, earth = 11, thunder = -3, water = 11, light = 11, dark = 11,
                       paralyze = 11, bind = 11, silence = 11, slow = 11, poison = 11, light_sleep = 11,
                       dark_sleep = 11, blind = 11, stun = -3, gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sight', 'magic' },
        },
    },
    by_name = {},
}
