-- Empyreal Paradox (zone 36).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Promathia' },
        [2] = { 'Ealdnarche' },
        [3] = { 'Kamlanaut' },
    },
    monsters = {
        {
            name   = 'Promathia',
            ids    = { 1, 3, 5 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 318, agi = 64, int = 64, mnd = 91, chr = 91 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, dark = 11, paralyze = 2,
                       bind = 2, silence = 2, slow = 2, poison = 2, dark_sleep = 11, blind = 11, stun = 2,
                       gravity = 2 },
            magic_dmg = { all = -20 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'paralyze', 'blind' },
            links  = 1,
        },
        {
            name   = 'Promathia',
            ids    = { 2, 4, 6 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 318, agi = 64, int = 64, mnd = 91, chr = 91 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, dark = 11, paralyze = 2,
                       bind = 2, silence = 2, slow = 2, poison = 2, dark_sleep = 11, blind = 11, stun = 2,
                       gravity = 2 },
            magic_dmg = { all = -20 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'paralyze', 'blind' },
            links  = 1,
        },
        {
            name   = 'Kamlanaut',
            ids    = { 7, 9, 11 },
            nm     = true,
            levels = {
                [78] = { acc = 327, eva = 301, agi = 68, int = 80, mnd = 80, chr = 72 },
            },
            ranks  = { fire = 3, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 11, bind = 11, silence = 3, slow = 11, poison = 11, light_sleep = 11,
                       dark_sleep = 3, blind = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Ealdnarche',
            ids    = { 8, 10, 12 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 370, agi = 80, int = 82, mnd = 65, chr = 71 },
            },
            ranks  = { fire = 3, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 11, bind = 11, silence = 3, slow = 11, poison = 11, light_sleep = 11,
                       dark_sleep = 3, blind = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Metus',
            ids    = { 49 },
            nm     = true,
            levels = {
                [125] = { acc = 483, eva = 551, agi = 98, int = 98, mnd = 138, chr = 138 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, dark = 11, paralyze = 2,
                       bind = 2, silence = 2, slow = 2, poison = 2, dark_sleep = 11, blind = 11, stun = 2,
                       gravity = 2 },
            magic_dmg = { all = -20 },
        },
    },
    by_name = {},
}
