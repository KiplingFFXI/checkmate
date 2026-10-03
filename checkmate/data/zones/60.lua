-- The Ashu Talif (zone 60).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Yazquhl' },
        [2] = { 'Gowam' },
        [3] = { 'Ashu Talif Captain', 'Ashu Talif Crew' },
        [4] = { 'Ashu Talif Crew' },
    },
    monsters = {
        {
            name   = 'Gowam',
            ids    = { 1 },
            nm     = true,
            levels = {
                [66] = { acc = 325, eva = 247, agi = 58, int = 58, mnd = 58, chr = 58 },
            },
            ranks  = { light_sleep = 10, dark_sleep = 10 },
            immune = { 'silence' },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Yazquhl',
            ids    = { 2 },
            nm     = true,
            levels = {
                [67] = { acc = 325, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
            },
            ranks  = { light_sleep = 10, dark_sleep = 10 },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Ashu Talif Crew',
            ids    = { 4, 10 },
            nm     = true,
            levels = {
                [60] = { acc = 237, eva = 219, agi = 47, int = 42, mnd = 57, chr = 57 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Ashu Talif Crew',
            ids    = { 5, 6, 11 },
            nm     = true,
            levels = {
                [60] = { acc = 231, eva = 209, agi = 53, int = 63, mnd = 63, chr = 61 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Ashu Talif Crew',
            ids    = { 7, 8, 12, 13 },
            nm     = true,
            levels = {
                [60] = { acc = 266, eva = 208, agi = 74, int = 53, mnd = 57, chr = 57 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Ashu Talif Captain',
            ids    = { 9 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 258, agi = 77, int = 71, mnd = 60, chr = 64 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
    },
    by_name = {},
}
