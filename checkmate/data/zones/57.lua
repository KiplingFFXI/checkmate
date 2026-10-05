-- Talacca Cove (zone 57).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Imp Bandsman' },
        [2] = { 'Gessho' },
    },
    monsters = {
        {
            name   = 'Wootzshell fished',
            ids    = { 1 },
            levels = {
                [73] = { acc = 298, eva = 276, agi = 48, int = 52, mnd = 76, chr = 76 },
                [74] = { acc = 303, eva = 281, agi = 48, int = 52, mnd = 77, chr = 77 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Arrapago Leech',
            ids    = { 2 },
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 62, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 63, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Talacca Clot',
            ids    = { 3 },
            levels = {
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 63, chr = 65 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lahama',
            ids    = { 4 },
            levels = {
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Llamhigyn Y Dwr',
            ids    = { 5 },
            levels = {
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 57, chr = 73 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 57, chr = 74 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Giant Orobon',
            ids    = { 6 },
            levels = {
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 5563 },  -- chunk of orobon meat
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Imp Bandsman',
            ids    = { 7, 13, 19 },
            levels = {
                [63] = { acc = 252, eva = 219, agi = 70, int = 82, mnd = 45, chr = 64 },
                [64] = { acc = 258, eva = 225, agi = 72, int = 83, mnd = 45, chr = 66 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'paralyze', 'slow', 'poison' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
        },
        {
            name   = 'Imp Bandsman',
            ids    = { 8, 9, 10, 11, 14, 15, 16, 17, 20, 21, 22, 23 },
            levels = {
                [60] = { acc = 236, eva = 204, agi = 67, int = 78, mnd = 43, chr = 61 },
                [61] = { acc = 242, eva = 210, agi = 70, int = 80, mnd = 45, chr = 64 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
        },
        {
            name   = 'Angler Orobon',
            ids    = { 25, 27, 29 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Valkeng',
            ids    = { 31, 32, 33 },
            nm     = true,
            levels = {
                [66] = { acc = 263, eva = 240, agi = 58, int = 70, mnd = 70, chr = 62 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'silence', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Qultada',
            ids    = { 34, 35, 36 },
            levels = {
                [70] = { acc = 287, eva = 271, agi = 83, int = 85, mnd = 57, chr = 61 },
            },
            immune = { 'light_sleep' },
        },
        {
            name   = 'Gessho',
            ids    = { 37, 79, 80, 81, 82, 83, 84, 85, 100, 101, 102, 103, 104, 105, 106, 121, 122, 123, 124, 125,
                       126, 127, 142, 143, 144, 145, 146, 147, 148 },
            nm     = true,
            levels = {
                [80] = { acc = 347, eva = 349, agi = 93, int = 75, mnd = 51, chr = 66 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Gessho',
            ids    = { 38, 39, 40, 41, 42, 43 },
            nm     = true,
            levels = {
                [70] = { acc = 292, eva = 294, agi = 83, int = 67, mnd = 45, chr = 59 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Medusa',
            ids    = { 163, 168, 173 },
            levels = {
                [85] = { acc = 423, eva = 334, agi = 102, int = 83, mnd = 89, chr = 83 },
            },
            ranks  = { fire = 4, ice = 4, wind = 4, earth = 2, thunder = 9, water = 9, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 2, poison = 9, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 9, gravity = 4 },
            resist = { poison = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'poison' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Lamia Exon',
            ids    = { 164, 165, 169, 170, 174, 175 },
            levels = {
                [85] = { acc = 379, eva = 326, agi = 87, int = 111, mnd = 83, chr = 89 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Lamia Exon',
            ids    = { 166, 167, 171, 172, 176, 177 },
            levels = {
                [85] = { acc = 379, eva = 346, agi = 93, int = 96, mnd = 83, chr = 83 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
