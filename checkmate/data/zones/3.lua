-- Manaclipper (zone 3).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Ghost Crab',
            ids    = { 1, 2 },
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3 },
            levels = {
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 32 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 35 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Kraken',
            ids    = { 4 },
            levels = {
                [40] = { acc = 144, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Harajnite',
            ids    = { 5 },
            nm     = true,
            levels = {
                [51] = { acc = 181, eva = 165, agi = 38, int = 38, mnd = 56, chr = 56 },
            },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            drops  = {
                { rate = 100, item = 1618 },  -- uragnite shell
                { rate = 50, item = 1719 },  -- harajnite shell
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Cyclopean Conch',
            ids    = { 6 },
            nm     = true,
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
            },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            drops  = {
                { rate = 50, item = 1618 },  -- uragnite shell
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Cutter',
            ids    = { 7 },
            levels = {
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Fatty Pugil',
            ids    = { 8 },
            levels = {
                [25] = { acc = 93, eva = 88, agi = 32, int = 23, mnd = 23, chr = 25 },
                [26] = { acc = 97, eva = 92, agi = 35, int = 23, mnd = 23, chr = 25 },
                [27] = { acc = 100, eva = 94, agi = 35, int = 24, mnd = 24, chr = 25 },
                [28] = { acc = 103, eva = 97, agi = 35, int = 24, mnd = 24, chr = 27 },
                [29] = { acc = 107, eva = 101, agi = 37, int = 25, mnd = 25, chr = 27 },
                [30] = { acc = 110, eva = 104, agi = 37, int = 26, mnd = 26, chr = 27 },
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 30 },
                [32] = { acc = 117, eva = 111, agi = 40, int = 26, mnd = 26, chr = 30 },
                [33] = { acc = 121, eva = 114, agi = 40, int = 29, mnd = 29, chr = 30 },
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 30 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
                { rate = 50, item = 4484 },  -- shall shell
            },
        },
        {
            name   = 'Uragnite',
            ids    = { 9, 10 },
            levels = {
                [31] = { acc = 114, eva = 107, agi = 37, int = 26, mnd = 26, chr = 31 },
                [32] = { acc = 117, eva = 109, agi = 37, int = 26, mnd = 26, chr = 31 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 29, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 133, agi = 44, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
            },
            spawn_levels = { [9] = { 31, 35 }, [10] = { 35, 40 } },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 50, item = 1618 },  -- uragnite shell
            },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Clot',
            ids    = { 11, 12 },
            levels = {
                [31] = { acc = 114, eva = 107, agi = 36, int = 26, mnd = 29, chr = 31 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 26, mnd = 29, chr = 31 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 29, mnd = 31, chr = 32 },
                [34] = { acc = 124, eva = 115, agi = 37, int = 29, mnd = 32, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 38, int = 29, mnd = 32, chr = 33 },
                [36] = { acc = 132, eva = 123, agi = 40, int = 30, mnd = 33, chr = 34 },
                [37] = { acc = 135, eva = 125, agi = 40, int = 31, mnd = 34, chr = 34 },
            },
            spawn_levels = { [11] = { 31, 35 }, [12] = { 36, 37 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            drops  = {
                { rate = 50, item = 1633 },  -- handful of clot plasma
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Colossal Calamari',
            ids    = { 13 },
            levels = {
                [41] = { acc = 148, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Zoredonite',
            ids    = { 14 },
            nm     = true,
            levels = {
                [61] = { acc = 234, eva = 216, agi = 45, int = 45, mnd = 66, chr = 66 },
                [62] = { acc = 239, eva = 221, agi = 45, int = 45, mnd = 66, chr = 66 },
            },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            drops  = {
                { rate = 50, item = 888 },  -- seashell
                { rate = 150, item = 14668 },  -- zoredonite ring
                { rate = 150, item = 15173 },  -- kosshin
                { rate = 1000, item = 15300 },  -- nebimonite belt
                { rate = 150, item = 17450 },  -- healing mace
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
    },
    by_name = {},
}
