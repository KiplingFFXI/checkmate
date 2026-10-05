-- Spire of Holla (zone 17).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Weeper' },
        [2] = { 'Cogitator', 'Weeper' },
    },
    monsters = {
        {
            name   = 'Wreaker',
            ids    = { 1, 2, 3 },
            levels = {
                [37] = { acc = 135, eva = 124, agi = 39, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 128, agi = 40, int = 35, mnd = 35, chr = 36 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cogitator',
            ids    = { 4, 9, 14 },
            levels = {
                [34] = { acc = 125, eva = 115, agi = 37, int = 32, mnd = 32, chr = 33 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Weeper',
            ids    = { 5, 6, 7, 10, 11, 12, 15, 16, 17 },
            levels = {
                [28] = { acc = 104, eva = 95, agi = 30, int = 27, mnd = 27, chr = 29 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
        },
    },
    by_name = {},
}
