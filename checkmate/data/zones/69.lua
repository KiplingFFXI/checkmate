-- Leujaoam Sanctum (zone 69).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Leujaoam Worm' },
        [2] = { 'Mineral Eater' },
    },
    monsters = {
        {
            name   = 'Leujaoam Worm',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
            levels = {
                [51] = { acc = 186, eva = 158, agi = 56, int = 69, mnd = 47, chr = 48 },
                [52] = { acc = 191, eva = 163, agi = 56, int = 69, mnd = 47, chr = 48 },
                [53] = { acc = 196, eva = 167, agi = 57, int = 70, mnd = 48, chr = 49 },
                [61] = { acc = 240, eva = 208, agi = 66, int = 80, mnd = 55, chr = 57 },
                [62] = { acc = 245, eva = 213, agi = 66, int = 80, mnd = 55, chr = 57 },
                [63] = { acc = 250, eva = 217, agi = 66, int = 82, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 257, agi = 75, int = 92, mnd = 63, chr = 64 },
                [72] = { acc = 298, eva = 262, agi = 75, int = 92, mnd = 63, chr = 64 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 93, mnd = 64, chr = 66 },
                [76] = { acc = 321, eva = 283, agi = 80, int = 97, mnd = 66, chr = 68 },
                [77] = { acc = 326, eva = 287, agi = 80, int = 98, mnd = 66, chr = 68 },
                [78] = { acc = 331, eva = 292, agi = 80, int = 98, mnd = 68, chr = 69 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            links  = 1,
        },
        {
            name   = 'Qiqirn Miner',
            ids    = { 16, 17, 18, 19, 20, 21, 22, 23 },
            levels = {},
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
        },
        {
            name   = 'Mineral Eater',
            ids    = { 24, 25, 26, 27, 28, 29, 30, 31, 32, 33 },
            levels = {
                [77] = { acc = 324, eva = 299, agi = 75, int = 94, mnd = 71, chr = 68 },
                [78] = { acc = 329, eva = 305, agi = 76, int = 94, mnd = 72, chr = 69 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 2,
        },
    },
    by_name = {},
}
