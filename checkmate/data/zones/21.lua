-- Spire of Mea (zone 21).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Seether' },
        [2] = { 'Envier', 'Seether' },
    },
    monsters = {
        {
            name   = 'Delver',
            ids    = { 1, 2, 3 },
            levels = {
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Envier',
            ids    = { 4, 9, 14 },
            levels = {
                [36] = { acc = 132, eva = 124, agi = 42, int = 34, mnd = 34, chr = 35 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Seether',
            ids    = { 5, 6, 7, 10, 11, 12, 15, 16, 17 },
            levels = {
                [28] = { acc = 104, eva = 95, agi = 31, int = 27, mnd = 27, chr = 29 },
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
