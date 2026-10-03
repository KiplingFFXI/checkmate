-- Open sea route to Mhaura (zone 47).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Passage Crab',
            ids    = { 1, 2 },
            levels = {
                [35] = { acc = 124, eva = 112, agi = 25, int = 26, mnd = 39, chr = 39 },
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
            name   = 'Gugru Jagil',
            ids    = { 3, 4 },
            levels = {
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 30 },
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 32 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
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
            name   = 'Blanched Kraken',
            ids    = { 5 },
            levels = {
                [45] = { acc = 161, eva = 152, agi = 49, int = 37, mnd = 37, chr = 42 },
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
            name   = 'Gugru Orobon',
            ids    = { 6 },
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
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
            name   = 'Southern Piranu',
            ids    = { 7 },
            levels = {
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 18419 },  -- kugui
                { rate = 100, item = 15702 },  -- spagyric nails
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Gugru Crab',
            ids    = { 8, 9 },
            levels = {
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
                [35] = { acc = 124, eva = 112, agi = 25, int = 26, mnd = 39, chr = 39 },
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
        },
        {
            name   = 'Ocean Jagil',
            ids    = { 10, 11 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 44, int = 39, mnd = 32, chr = 30 },
                [35] = { acc = 127, eva = 117, agi = 45, int = 39, mnd = 33, chr = 32 },
                [36] = { acc = 132, eva = 121, agi = 46, int = 42, mnd = 34, chr = 32 },
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
            name   = 'Ocean Kraken',
            ids    = { 12 },
            levels = {
                [41] = { acc = 148, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 154, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
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
            name   = 'Revenant SoZ ENS FY',
            ids    = { 13 },
            levels = {
                [41] = { acc = 149, eva = 140, agi = 47, int = 44, mnd = 34, chr = 43 },
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
            name   = 'Thunder Elemental',
            ids    = { 14 },
            levels = {
                [39] = { acc = 141, eva = 127, agi = 42, int = 49, mnd = 39, chr = 40 },
                [40] = { acc = 144, eva = 130, agi = 42, int = 49, mnd = 39, chr = 40 },
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
            name   = 'Water Elemental',
            ids    = { 15 },
            levels = {
                [39] = { acc = 141, eva = 127, agi = 42, int = 49, mnd = 39, chr = 40 },
                [40] = { acc = 144, eva = 130, agi = 42, int = 49, mnd = 39, chr = 40 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
    },
    by_name = {},
}
