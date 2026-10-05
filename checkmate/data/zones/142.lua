-- Yughott Grotto (zone 142).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Ashmaker Gotblut', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Grunt', 'Orcish Neckchopper',
                'Orcish Serjeant', 'Orcish Stonechucker' },
        [2] = { 'Grotto Bats', 'Stealth Bat' },
        [3] = { 'Riding Lizard' },
        [4] = { 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Grunt', 'Orcish Neckchopper', 'Orcish Serjeant',
                'Orcish Stonechucker' },
    },
    monsters = {
        {
            name   = 'Orcish Grunt',
            ids    = { 1, 2, 5, 9, 10, 13, 17, 22, 25, 31, 34, 39, 42, 52, 55, 60, 65, 69, 72, 77, 80, 85, 89, 94,
                       97, 103, 106, 112, 118, 121, 131, 138 },
            levels = {
                [14] = { acc = 54, eva = 50, agi = 16, int = 11, mnd = 13, chr = 19 },
                [15] = { acc = 57, eva = 53, agi = 16, int = 11, mnd = 15, chr = 19 },
                [16] = { acc = 61, eva = 57, agi = 18, int = 11, mnd = 15, chr = 21 },
                [17] = { acc = 64, eva = 60, agi = 18, int = 13, mnd = 15, chr = 21 },
                [18] = { acc = 67, eva = 63, agi = 18, int = 13, mnd = 17, chr = 21 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12944 },  -- scale greaves
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Stonechucker',
            ids    = { 3, 6, 11, 14, 18, 23, 26, 32, 35, 40, 43, 53, 56, 61, 66, 70, 73, 78, 81, 86, 90, 95, 98,
                       104, 107, 113, 119, 122, 132, 139 },
            levels = {
                [14] = { acc = 64, eva = 51, agi = 20, int = 12, mnd = 14, chr = 16 },
                [15] = { acc = 67, eva = 54, agi = 21, int = 13, mnd = 15, chr = 17 },
                [16] = { acc = 71, eva = 58, agi = 22, int = 13, mnd = 16, chr = 18 },
                [17] = { acc = 74, eva = 60, agi = 23, int = 14, mnd = 16, chr = 18 },
                [18] = { acc = 77, eva = 63, agi = 23, int = 15, mnd = 17, chr = 19 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12440 },  -- leather bandana
                { rate = 10, item = 12696 },  -- leather gloves
                { rate = 10, item = 12824 },  -- leather trousers
                { rate = 10, item = 12952 },  -- leather highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Neckchopper',
            ids    = { 4, 7, 12, 15, 19, 24, 27, 33, 36, 41, 44, 54, 57, 62, 67, 71, 74, 79, 87, 91, 96, 99, 105,
                       108, 114, 120, 123, 133, 140 },
            levels = {
                [14] = { acc = 55, eva = 49, agi = 16, int = 15, mnd = 11, chr = 14 },
                [15] = { acc = 58, eva = 52, agi = 16, int = 15, mnd = 12, chr = 14 },
                [16] = { acc = 62, eva = 56, agi = 18, int = 16, mnd = 13, chr = 16 },
                [17] = { acc = 65, eva = 58, agi = 18, int = 17, mnd = 13, chr = 16 },
                [18] = { acc = 68, eva = 61, agi = 18, int = 17, mnd = 14, chr = 16 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12944 },  -- scale greaves
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Grotto Bats',
            ids    = { 8, 16, 20, 21, 30, 38, 47, 58, 63, 64, 68, 75, 76, 82, 83, 88, 92, 93, 102, 111, 117, 126,
                       129, 130, 137, 144, 145 },
            levels = {
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Riding Lizard',
            ids    = { 28, 29, 37, 45, 46, 48, 49, 50, 51 },
            levels = {
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 46, agi = 17, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 50, agi = 18, int = 13, mnd = 13, chr = 14 },
                [15] = { acc = 58, eva = 53, agi = 18, int = 13, mnd = 13, chr = 15 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 50, item = 852 },  -- lizard skin
            },
            links  = 3,
        },
        {
            name   = 'Stealth Bat',
            ids    = { 59, 150, 151, 152, 157, 158, 159, 160, 164, 169, 170, 171, 176, 177, 178, 184, 185, 186,
                       187 },
            levels = {
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 16 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Ashmaker Gotblut',
            ids    = { 84 },
            nm     = true,
            levels = {
                [17] = { acc = 65, eva = 54, agi = 20, int = 21, mnd = 15, chr = 19 },
                [18] = { acc = 68, eva = 56, agi = 20, int = 21, mnd = 17, chr = 19 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1000, group = { { 17413, 8500 }, { 13729, 1500 } } },  -- one of hermits wand, priests robe
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 100, 109, 115, 124, 127, 134, 135, 141, 142, 146, 148, 153, 155, 161, 165, 167, 172, 174,
                       179, 181 },
            levels = {
                [21] = { acc = 79, eva = 73, agi = 24, int = 15, mnd = 17, chr = 22 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 15, mnd = 17, chr = 22 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 15, mnd = 17, chr = 22 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 150, item = 1662 },  -- cathedral tapestry
                { rate = 50, item = 1024 },  -- ghelsba chest key
                { rate = 50, item = 1528 },  -- red cryptex
                { rate = 10, item = 12441 },  -- lizard helm
                { rate = 10, item = 12697 },  -- lizard gloves
                { rate = 10, item = 12825 },  -- lizard trousers
                { rate = 10, item = 12953 },  -- lizard ledelsens
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 101, 110, 116, 125, 128, 136, 143, 147, 149, 154, 156, 162, 166, 168, 173, 175, 180, 182 },
            levels = {
                [21] = { acc = 79, eva = 73, agi = 24, int = 23, mnd = 19, chr = 23 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 23, mnd = 19, chr = 23 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 24, mnd = 19, chr = 23 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 1018 },  -- bulb of shaman garlic
                { rate = 50, item = 1024 },  -- ghelsba chest key
                { rate = 5, item = 12737 },  -- white mitts
                { rate = 5, item = 12865 },  -- black slacks
                { rate = 5, item = 12993 },  -- sandals
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Serjeant',
            ids    = { 163, 183 },
            levels = {
                [21] = { acc = 78, eva = 70, agi = 18, int = 14, mnd = 22, chr = 25 },
                [22] = { acc = 81, eva = 72, agi = 18, int = 14, mnd = 22, chr = 25 },
                [23] = { acc = 84, eva = 75, agi = 18, int = 14, mnd = 22, chr = 25 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 10, virus = 10 },
            drops  = {
                { rate = 50, item = 1024 },  -- ghelsba chest key
                { rate = 50, item = 530 },  -- copy of the castle floor plans
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
    },
    by_name = {},
}
