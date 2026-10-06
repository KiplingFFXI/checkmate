-- Zeruhn Mines (zone 172).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Ding Bats', 'Mouse Bat' } },
        [2] = { sound = { 'Poison Leech' } },
        [3] = { sound = { 'Brass Quadav', 'Copper Quadav' } },
        [4] = { sound = { 'Brass Quadav', 'Old Quadav' } },
        [5] = { sound = { 'Copper Quadav', 'Old Quadav' } },
    },
    monsters = {
        {
            name   = 'Ding Bats',
            ids    = { 1, 2, 3, 4, 5, 6, 8, 10, 12, 13, 22, 25, 26, 36, 37 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
            },
            spawn_levels = { [1] = { 1, 2 }, [2] = { 1, 2 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 560 },  -- pinch of zeruhn soot
            },
            links  = 1,
        },
        {
            name   = 'River Crab',
            ids    = { 7, 9, 11 },
            levels = {
                [2] = { acc = 12, eva = 10, agi = 6, int = 6, mnd = 9, chr = 9 },
                [3] = { acc = 15, eva = 13, agi = 6, int = 6, mnd = 9, chr = 9 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 11 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 560 },  -- pinch of zeruhn soot
                { rate = 150, item = 936 },  -- chunk of rock salt
            },
        },
        {
            name   = 'Tunnel Worm',
            ids    = { 14, 15, 16, 20, 21, 27, 28, 32, 33, 34, 40, 41, 42 },
            levels = {
                [1] = { acc = 10, eva = 8, agi = 8, int = 11, mnd = 8, chr = 7 },
                [2] = { acc = 13, eva = 10, agi = 8, int = 11, mnd = 8, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
            },
        },
        {
            name   = 'Mouse Bat',
            ids    = { 17, 18, 19, 23, 24, 35, 38, 39 },
            levels = {
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Poison Leech',
            ids    = { 29, 30, 31 },
            levels = {
                [3] = { acc = 16, eva = 14, agi = 9, int = 7, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 18, agi = 11, int = 8, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 21, agi = 11, int = 9, mnd = 8, chr = 9 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 560 },  -- pinch of zeruhn soot
            },
            links  = 2,
        },
        {
            name   = 'Gloom Phantom',
            ids    = { 62 },
            nm     = true,
            levels = {
                [139] = { acc = 501, eva = 640, agi = 143, int = 116, mnd = 101, chr = 109 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 25, virus = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Do\'Bho Venomtail',
            ids    = { 63 },
            nm     = true,
            levels = {
                [139] = { acc = 501, eva = 595, agi = 139, int = 147, mnd = 110, chr = 135 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Old Quadav',
            ids    = { 64 },
            nm     = true,
            levels = {
                [139] = { acc = 490, eva = 616, agi = 94, int = 87, mnd = 139, chr = 139 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { sleep = 25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Copper Quadav',
            ids    = { 65 },
            nm     = true,
            levels = {
                [139] = { acc = 490, eva = 616, agi = 94, int = 87, mnd = 139, chr = 139 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { sleep = 25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Brass Quadav',
            ids    = { 66 },
            nm     = true,
            levels = {
                [139] = { acc = 490, eva = 616, agi = 94, int = 87, mnd = 139, chr = 139 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { sleep = 25 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
    },
    by_name = {},
}
