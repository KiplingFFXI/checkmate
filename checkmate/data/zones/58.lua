-- Silver Sea route to Nashmau (zone 58).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { both = { 'Apkallu' } },
    },
    monsters = {
        {
            name   = 'Cyan Deep Crab',
            ids    = { 1 },
            levels = {
                [49] = { acc = 172, eva = 155, agi = 33, int = 35, mnd = 53, chr = 53 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 50, item = 881 },  -- crab shell
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Submarine Nipper',
            ids    = { 2 },
            levels = {
                [52] = { acc = 186, eva = 169, agi = 36, int = 38, mnd = 56, chr = 56 },
                [53] = { acc = 192, eva = 174, agi = 36, int = 39, mnd = 57, chr = 57 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 50, item = 881 },  -- crab shell
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Thalassic Pugil',
            ids    = { 3 },
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 45 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 45 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 45 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Abyssal Pugil',
            ids    = { 4 },
            levels = {
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 45 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 47 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bathybic Kulshedra',
            ids    = { 5 },
            levels = {
                [63] = { acc = 248, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 254, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Orobon',
            ids    = { 6 },
            levels = {
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Apkallu',
            ids    = { 7, 8 },
            levels = {
                [54] = { acc = 205, eva = 187, agi = 43, int = 39, mnd = 52, chr = 48 },
                [55] = { acc = 211, eva = 192, agi = 43, int = 39, mnd = 52, chr = 49 },
                [56] = { acc = 217, eva = 198, agi = 44, int = 41, mnd = 55, chr = 50 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 2149 },  -- apkallu feather
                { rate = 150, item = 5568 },  -- apkallu egg
            },
            links  = 1,
        },
        {
            name   = 'Bigclaw',
            ids    = { 9, 10 },
            levels = {
                [49] = { acc = 172, eva = 155, agi = 33, int = 35, mnd = 53, chr = 53 },
                [50] = { acc = 175, eva = 158, agi = 33, int = 36, mnd = 54, chr = 54 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 10, item = 1193 },  -- high-quality crab shell
                { rate = 100, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Cyan Deep Pugil',
            ids    = { 11 },
            levels = {
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 42 },
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 45 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 45 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 45 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 45 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 47 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Kulshedra',
            ids    = { 12 },
            levels = {
                [61] = { acc = 238, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 243, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 248, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 1000, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Utukku S',
            ids    = { 13 },
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 56, mnd = 43, chr = 54 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 57, mnd = 43, chr = 56 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Imp',
            ids    = { 14 },
            levels = {
                [54] = { acc = 204, eva = 175, agi = 62, int = 71, mnd = 39, chr = 56 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            drops  = {
                { rate = 150, item = 2163 },  -- imp wing
                { rate = 50, item = 2157 },  -- imp horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 15 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'gravity', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 16 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Proteus',
            ids    = { 17 },
            nm     = true,
            levels = {
                [79] = { acc = 289, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 150, item = 15532 },  -- shark necklace
                { rate = 100, item = 17722 },  -- phantom fleuret
            },
            aggro  = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
