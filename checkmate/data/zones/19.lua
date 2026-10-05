-- Spire of Dem (zone 19).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Offspring' },
        [2] = { 'Offspring', 'Progenerator' },
        [3] = { 'Neogorger', 'Neoingester', 'Neosatiator', 'Wanderer' },
        [4] = { 'Ingester', 'Neogorger', 'Neosatiator', 'Wanderer' },
        [5] = { 'Ingester', 'Neoingester', 'Neosatiator', 'Wanderer' },
        [6] = { 'Ingester', 'Neogorger', 'Neoingester', 'Wanderer' },
        [7] = { 'Ingester', 'Neogorger', 'Neoingester', 'Neosatiator' },
    },
    monsters = {
        {
            name   = 'Progenerator',
            ids    = { 1, 6, 11 },
            levels = {
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35 },
                [38] = { acc = 138, eva = 129, agi = 43, int = 35, mnd = 35, chr = 36 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Offspring',
            ids    = { 2, 3, 4, 5, 7, 8, 9, 10, 12, 13, 14, 15 },
            levels = {
                [27] = { acc = 101, eva = 94, agi = 35, int = 24, mnd = 24, chr = 27 },
                [28] = { acc = 104, eva = 97, agi = 35, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Ingester',
            ids    = { 16, 22, 28 },
            levels = {
                [37] = { acc = 135, eva = 126, agi = 42, int = 35, mnd = 35, chr = 35 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Neoingester',
            ids    = { 17, 23, 29 },
            levels = {
                [30] = { acc = 111, eva = 103, agi = 34, int = 35, mnd = 23, chr = 23 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Neogorger',
            ids    = { 18, 24, 30 },
            levels = {
                [30] = { acc = 111, eva = 103, agi = 34, int = 35, mnd = 23, chr = 23 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Neosatiator',
            ids    = { 19, 25, 31 },
            levels = {
                [30] = { acc = 111, eva = 103, agi = 34, int = 35, mnd = 23, chr = 23 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            drops  = {
                { rate = 1000, item = 4374 },  -- sleepshroom
                { rate = 150, item = 4373 },  -- woozyshroom
                { rate = 50, item = 1040 },  -- nest chest key
                { rate = 50, item = 4375 },  -- danceshroom
                { rate = 150, item = 1089 },  -- clump of exoray mold
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Wanderer',
            ids    = { 20, 26, 32 },
            levels = {
                [30] = { acc = 111, eva = 101, agi = 31, int = 29, mnd = 29, chr = 30 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 7,
        },
    },
    by_name = {},
}
