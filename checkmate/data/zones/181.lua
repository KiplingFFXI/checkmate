-- The Celestial Nexus (zone 181).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { true_sight = { 'Ealdnarche 2' }, sound = { 'Orbital' }, true_sound = { 'Exoplates' } },
        [2] = { true_sight = { 'Ealdnarche', 'Ealdnarche 2' }, sound = { 'Orbital' } },
        [3] = { true_sight = { 'Ealdnarche' }, sound = { 'Orbital' }, true_sound = { 'Exoplates' } },
        [4] = {
            true_sight = { 'Ealdnarche', 'Ealdnarche 2' },
            sound = { 'Orbital' },
            true_sound = { 'Exoplates' },
        },
    },
    monsters = {
        {
            name   = 'Ealdnarche',
            ids    = { 4, 9, 14 },
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 82, mnd = 65, chr = 71 },
            },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Exoplates',
            ids    = { 5, 10, 15 },
            nm     = true,
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70 },
            },
            ranks  = { fire = 1, ice = 1, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Ealdnarche 2',
            ids    = { 6, 11, 16 },
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 82, mnd = 65, chr = 71 },
            },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orbital',
            ids    = { 7, 8, 12, 13, 17, 18 },
            nm     = true,
            levels = {
                [68] = { acc = 278, eva = 269, agi = 83, int = 61, mnd = 50, chr = 64 },
            },
            ranks  = { thunder = -3, stun = -3 },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
            links  = 4,
        },
        {
            name   = 'Ealdnarche',
            ids    = { 94, 106, 118 },
            levels = {
                [139] = { acc = 493, eva = 638, agi = 139, int = 143, mnd = 113, chr = 124 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Orbital',
            ids    = { 95, 96, 107, 108, 119, 120 },
            levels = {
                [139] = { acc = 497, eva = 650, agi = 162, int = 120, mnd = 98, chr = 125 },
            },
            ranks  = { thunder = -3, stun = -3 },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Kamlanaut',
            ids    = { 97, 109, 121 },
            levels = {
                [139] = { acc = 487, eva = 612, agi = 117, int = 139, mnd = 139, chr = 127 },
            },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angel HM',
            ids    = { 98, 110, 122 },
            levels = {
                [139] = { acc = 495, eva = 669, agi = 143, int = 112, mnd = 101, chr = 113 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angel MR',
            ids    = { 99, 111, 123 },
            levels = {
                [139] = { acc = 497, eva = 702, agi = 113, int = 117, mnd = 109, chr = 124 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angels Behemoth',
            ids    = { 100, 112, 124 },
            levels = {
                [139] = { acc = 501, eva = 721, agi = 151, int = 124, mnd = 109, chr = 117 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angels Adamantoise',
            ids    = { 101, 113, 125 },
            levels = {
                [139] = { acc = 486, eva = 623, agi = 109, int = 140, mnd = 155, chr = 158 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ark Angel EV',
            ids    = { 102, 114, 126 },
            levels = {
                [139] = { acc = 480, eva = 624, agi = 110, int = 125, mnd = 140, chr = 139 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angel TT',
            ids    = { 103, 115, 127 },
            levels = {
                [139] = { acc = 505, eva = 644, agi = 150, int = 154, mnd = 102, chr = 101 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angel GK',
            ids    = { 104, 116, 128 },
            levels = {
                [139] = { acc = 510, eva = 639, agi = 112, int = 98, mnd = 132, chr = 131 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ark Angels Wyvern',
            ids    = { 105, 117, 129 },
            levels = {
                [139] = { acc = 511, eva = 648, agi = 131, int = 105, mnd = 113, chr = 132 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
