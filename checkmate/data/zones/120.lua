-- Sauromugue Champaign (zone 120).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Hill Lizard' },
        [2] = { 'Midnight Wings', 'Moon Bat' },
        [3] = { 'Yagudo Drummer', 'Yagudo Herald', 'Yagudo Interrogator', 'Yagudo Oracle', 'Yagudo Priest',
                'Yagudo Theologist', 'Yagudo Votary' },
        [4] = { 'Climbpix Highrise', 'Dribblix Greasemaw', 'Goblin Bounty Hunter', 'Goblin Digger',
                'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger', 'Goblin Pathfinder',
                'Goblin Shaman', 'Goblin Smithy' },
        [5] = { 'Diving Beetle' },
        [6] = { 'Old Sabertooth', 'Sabertooth Tiger' },
        [7] = { 'Sabertooth Tiger' },
        [8] = { 'Climbpix Highrise', 'Dribblix Greasemaw', 'Goblin Bounty Hunter', 'Goblin Furrier',
                'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman',
                'Goblin Smithy' },
        [9] = { 'Climbpix Highrise', 'Goblin Bounty Hunter', 'Goblin Digger', 'Goblin Furrier', 'Goblin Gambler',
                'Goblin Leecher', 'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy' },
        [10] = { 'Arke' },
    },
    monsters = {
        {
            name   = 'Big Jaw',
            ids    = { 1 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 19 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 19 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Snipper',
            ids    = { 2 },
            levels = {
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22 },
                [21] = { acc = 76, eva = 69, agi = 16, int = 17, mnd = 24, chr = 24 },
                [22] = { acc = 79, eva = 71, agi = 16, int = 17, mnd = 24, chr = 24 },
                [23] = { acc = 82, eva = 74, agi = 16, int = 17, mnd = 24, chr = 24 },
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
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 24 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cutter',
            ids    = { 4 },
            levels = {
                [28] = { acc = 99, eva = 89, agi = 19, int = 20, mnd = 29, chr = 29 },
                [29] = { acc = 102, eva = 92, agi = 19, int = 20, mnd = 30, chr = 30 },
                [30] = { acc = 106, eva = 95, agi = 19, int = 21, mnd = 31, chr = 31 },
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
            name   = 'Kraken',
            ids    = { 5 },
            levels = {
                [38] = { acc = 135, eva = 127, agi = 38, int = 29, mnd = 29, chr = 33 },
                [39] = { acc = 139, eva = 131, agi = 40, int = 31, mnd = 31, chr = 35 },
                [40] = { acc = 142, eva = 134, agi = 40, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 10, item = 770 },  -- blue rock
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Hill Lizard',
            ids    = { 6, 7, 8, 9, 13, 14, 15, 16, 20, 21, 22, 38, 39, 40, 46, 47, 48, 131, 132, 140, 141, 147, 148,
                       154, 155, 286, 287, 293, 294, 295, 301, 302, 303, 325, 326, 327, 333, 334, 335 },
            levels = {
                [25] = { acc = 92, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 100, item = 852 },  -- lizard skin
            },
            links  = 1,
        },
        {
            name   = 'Midnight Wings',
            ids    = { 10, 11, 17, 18, 23, 24, 43, 44, 49, 50, 77, 78, 85, 86, 92, 93, 116, 117, 118, 136, 137, 138,
                       144, 145, 151, 152, 158, 159, 184, 185, 190, 191, 208, 209, 216, 217, 224, 225, 248, 249,
                       250, 255, 256, 258, 259, 260, 261, 288, 289, 296, 297, 304, 305, 328, 329, 336, 337 },
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
            },
            spawn_levels = { [24] = { 24, 24 }, [145] = { 24, 24 }, [224] = { 24, 24 }, [289] = { 24, 24 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 2,
        },
        {
            name   = 'Moon Bat',
            ids    = { 12, 19, 25, 45, 51, 79, 87, 94, 119, 139, 146, 153, 160, 186, 192, 210, 218, 226, 251, 257,
                       262, 263, 290, 298, 306, 330, 338 },
            levels = {
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            spawn_levels = { [12] = { 25, 26 }, [19] = { 25, 26 }, [25] = { 25, 26 }, [45] = { 25, 26 },
                             [51] = { 25, 26 }, [79] = { 25, 26 }, [87] = { 25, 26 }, [94] = { 24, 25 },
                             [119] = { 25, 26 }, [139] = { 24, 25 }, [146] = { 25, 26 }, [153] = { 25, 26 },
                             [160] = { 25, 26 }, [186] = { 25, 26 }, [192] = { 25, 26 }, [210] = { 25, 26 },
                             [218] = { 25, 26 }, [226] = { 25, 26 }, [251] = { 25, 26 }, [257] = { 25, 26 },
                             [262] = { 25, 26 }, [263] = { 25, 26 }, [290] = { 25, 26 }, [298] = { 25, 26 },
                             [306] = { 25, 26 }, [330] = { 25, 26 }, [338] = { 25, 26 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 2,
        },
        {
            name   = 'Champaign Coeurl',
            ids    = { 26, 95, 112, 161, 193 },
            levels = {
                [33] = { acc = 120, eva = 111, agi = 34, int = 28, mnd = 24, chr = 29 },
                [34] = { acc = 124, eva = 115, agi = 36, int = 29, mnd = 24, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 927 },  -- coeurl whisker
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 863 },  -- coeurl hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Yagudo Votary',
            ids    = { 27, 96, 194, 227 },
            levels = {
                [27] = { acc = 100, eva = 91, agi = 23, int = 20, mnd = 24, chr = 26 },
                [28] = { acc = 104, eva = 94, agi = 23, int = 20, mnd = 25, chr = 27 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Herald',
            ids    = { 28, 97, 107, 195, 228 },
            levels = {
                [32] = { acc = 118, eva = 118, agi = 38, int = 30, mnd = 22, chr = 27 },
                [33] = { acc = 121, eva = 121, agi = 39, int = 32, mnd = 22, chr = 28 },
            },
            spawn_levels = { [97] = { 32, 32 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 15 },
            drops  = {
                { rate = 100, item = 17301 },  -- shuriken
                { rate = 50, item = 17302 },  -- juji shuriken
                { rate = 50, item = 1707 },  -- piece of eastern paper
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Theologist',
            ids    = { 29, 98, 196, 229, 238 },
            levels = {
                [27] = { acc = 99, eva = 84, agi = 31, int = 33, mnd = 22, chr = 28 },
                [28] = { acc = 102, eva = 86, agi = 31, int = 34, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Drummer',
            ids    = { 30, 99, 108, 197, 230 },
            levels = {
                [32] = { acc = 115, eva = 100, agi = 27, int = 30, mnd = 29, chr = 38 },
                [33] = { acc = 119, eva = 104, agi = 28, int = 32, mnd = 30, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 15 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Oracle',
            ids    = { 31, 100, 109, 198, 231, 239 },
            levels = {
                [32] = { acc = 114, eva = 97, agi = 33, int = 35, mnd = 34, chr = 38 },
                [33] = { acc = 117, eva = 101, agi = 34, int = 37, mnd = 35, chr = 39 },
            },
            spawn_levels = { [109] = { 33, 33 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 50, item = 4898 },  -- air spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudos Elemental',
            ids    = { 32, 101, 110, 199, 232, 240 },
            levels = {
                [23] = { acc = 84, eva = 71, agi = 24, int = 28, mnd = 20, chr = 22 },
                [24] = { acc = 88, eva = 74, agi = 26, int = 29, mnd = 21, chr = 24 },
                [25] = { acc = 91, eva = 77, agi = 26, int = 31, mnd = 23, chr = 24 },
                [26] = { acc = 95, eva = 80, agi = 28, int = 31, mnd = 23, chr = 24 },
                [27] = { acc = 98, eva = 83, agi = 29, int = 33, mnd = 24, chr = 26 },
                [28] = { acc = 101, eva = 85, agi = 29, int = 34, mnd = 25, chr = 26 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Yagudo Priest',
            ids    = { 33, 102, 200, 233, 241 },
            levels = {
                [27] = { acc = 95, eva = 82, agi = 26, int = 24, mnd = 31, chr = 31 },
                [28] = { acc = 98, eva = 84, agi = 27, int = 25, mnd = 33, chr = 31 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 100, item = 750 },  -- silver beastcoin
                { rate = 10, item = 4695 },  -- scroll of barpoisonra
                { rate = 10, item = 4744 },  -- scroll of invisible
                { rate = 10, item = 4746 },  -- scroll of deodorize
                { rate = 50, item = 4667 },  -- scroll of silence
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Interrogator',
            ids    = { 34, 103, 111, 201, 234, 242 },
            levels = {
                [32] = { acc = 117, eva = 110, agi = 33, int = 28, mnd = 27, chr = 33 },
                [33] = { acc = 120, eva = 114, agi = 34, int = 29, mnd = 27, chr = 34 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { blind = 15 },
            drops  = {
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 150, item = 841 },  -- yagudo feather
                { rate = 50, item = 1707 },  -- piece of eastern paper
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Wight war',
            ids    = { 35, 61, 104, 128, 170, 202, 235, 315, 347 },
            levels = {
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 19, chr = 23 },
                [27] = { acc = 99, eva = 91, agi = 29, int = 21, mnd = 19, chr = 24 },
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 21, chr = 26 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 23, chr = 28 },
                [33] = { acc = 120, eva = 111, agi = 34, int = 26, mnd = 24, chr = 29 },
                [34] = { acc = 124, eva = 115, agi = 36, int = 26, mnd = 24, chr = 29 },
            },
            spawn_levels = { [35] = { 29, 34 }, [61] = { 26, 28 }, [104] = { 29, 34 }, [128] = { 28, 33 },
                             [170] = { 28, 33 }, [202] = { 28, 34 }, [235] = { 28, 34 }, [315] = { 27, 33 },
                             [347] = { 27, 33 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4872 },  -- scroll of tractor
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wight blm',
            ids    = { 36, 62, 105, 129, 171, 203, 236, 316, 348 },
            levels = {
                [26] = { acc = 96, eva = 80, agi = 28, int = 31, mnd = 22, chr = 24 },
                [27] = { acc = 99, eva = 83, agi = 29, int = 33, mnd = 22, chr = 26 },
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26 },
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26 },
                [30] = { acc = 109, eva = 91, agi = 31, int = 36, mnd = 24, chr = 28 },
                [31] = { acc = 114, eva = 95, agi = 33, int = 39, mnd = 27, chr = 30 },
                [32] = { acc = 117, eva = 97, agi = 33, int = 39, mnd = 27, chr = 30 },
                [33] = { acc = 120, eva = 101, agi = 34, int = 41, mnd = 27, chr = 32 },
                [34] = { acc = 124, eva = 104, agi = 36, int = 42, mnd = 27, chr = 32 },
            },
            spawn_levels = { [36] = { 29, 34 }, [62] = { 26, 28 }, [105] = { 29, 34 }, [129] = { 28, 33 },
                             [171] = { 28, 33 }, [203] = { 28, 34 }, [236] = { 28, 34 }, [316] = { 27, 33 },
                             [348] = { 27, 33 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4872 },  -- scroll of tractor
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ignis Fatuus',
            ids    = { 37, 106, 237 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 36, int = 24, mnd = 26, chr = 32 },
                [35] = { acc = 127, eva = 118, agi = 36, int = 26, mnd = 27, chr = 33 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 26, mnd = 28, chr = 35 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Tabar Beak',
            ids    = { 41, 42, 76, 84, 91, 113, 114, 214, 215, 222, 223, 246, 247 },
            levels = {
                [36] = { acc = 129, eva = 122, agi = 38, int = 28, mnd = 28, chr = 32 },
                [37] = { acc = 132, eva = 124, agi = 38, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 100, item = 842 },  -- giant bird feather
                { rate = 10, item = 854 },  -- cockatrice skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 53, 120, 162, 173, 264, 307, 339 },
            levels = {
                [26] = { acc = 98, eva = 107, agi = 33, int = 28, mnd = 19, chr = 19 },
                [27] = { acc = 102, eva = 110, agi = 33, int = 29, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 750 },  -- silver beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 54, 64, 121, 163, 174, 265, 308, 318, 340 },
            levels = {
                [26] = { acc = 97, eva = 86, agi = 23, int = 23, mnd = 23, chr = 31 },
                [27] = { acc = 100, eva = 88, agi = 23, int = 24, mnd = 24, chr = 33 },
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
                [32] = { acc = 117, eva = 104, agi = 27, int = 28, mnd = 28, chr = 39 },
            },
            spawn_levels = { [54] = { 26, 27 }, [64] = { 31, 32 }, [121] = { 31, 32 }, [163] = { 31, 32 },
                             [174] = { 31, 32 }, [265] = { 31, 32 }, [308] = { 31, 32 }, [318] = { 31, 32 },
                             [340] = { 31, 32 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 50, item = 1708 },  -- handful of counterfeit gil
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblins Beetle',
            ids    = { 55, 65, 122, 164, 175, 266, 309, 319, 341 },
            levels = {
                [23] = { acc = 85, eva = 76, agi = 21, int = 23, mnd = 16, chr = 16 },
                [24] = { acc = 89, eva = 80, agi = 22, int = 24, mnd = 16, chr = 16 },
                [25] = { acc = 92, eva = 83, agi = 23, int = 25, mnd = 17, chr = 17 },
                [26] = { acc = 96, eva = 86, agi = 23, int = 27, mnd = 18, chr = 18 },
                [27] = { acc = 99, eva = 89, agi = 24, int = 27, mnd = 18, chr = 18 },
            },
            spawn_levels = { [175] = { 26, 27 }, [266] = { 26, 27 }, [341] = { 26, 27 } },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            links  = 5,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 56, 123, 165, 267, 310, 342 },
            levels = {
                [26] = { acc = 93, eva = 79, agi = 26, int = 23, mnd = 31, chr = 28 },
                [27] = { acc = 96, eva = 82, agi = 26, int = 24, mnd = 33, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 50, item = 4666 },  -- scroll of paralyze
                { rate = 10, item = 4680 },  -- scroll of barsleep
                { rate = 10, item = 750 },  -- silver beastcoin
                { rate = 10, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4681 },  -- scroll of barpoison
                { rate = 10, item = 4733 },  -- scroll of protectra
                { rate = 10, item = 4745 },  -- scroll of sneak
                { rate = 5, item = 4744 },  -- scroll of invisible
                { rate = 5, item = 4746 },  -- scroll of deodorize
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 57, 66, 124, 166, 268, 311, 320, 343 },
            levels = {
                [26] = { acc = 105, eva = 83, agi = 34, int = 23, mnd = 24, chr = 23 },
                [27] = { acc = 108, eva = 86, agi = 35, int = 24, mnd = 26, chr = 24 },
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
            },
            spawn_levels = { [57] = { 26, 27 }, [66] = { 31, 32 }, [124] = { 31, 32 }, [166] = { 31, 32 },
                             [268] = { 31, 32 }, [311] = { 31, 32 }, [320] = { 31, 32 }, [343] = { 31, 32 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 850 },  -- square of sheep leather
                { rate = 10, item = 848 },  -- square of dhalmel leather
                { rate = 5, item = 855 },  -- square of black tiger leather
                { rate = 1, item = 506 },  -- square of coeurl leather
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 58, 125, 167, 176, 269, 312, 344 },
            levels = {
                [26] = { acc = 97, eva = 81, agi = 31, int = 31, mnd = 23, chr = 24 },
                [27] = { acc = 100, eva = 84, agi = 31, int = 33, mnd = 24, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 952 },  -- bag of poison flour
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 59, 67, 126, 168, 177, 270, 313, 321, 345 },
            levels = {
                [26] = { acc = 97, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 100, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
            },
            spawn_levels = { [59] = { 26, 27 }, [67] = { 31, 32 }, [126] = { 31, 32 }, [168] = { 31, 32 },
                             [177] = { 31, 32 }, [270] = { 31, 32 }, [313] = { 31, 32 }, [321] = { 31, 32 },
                             [345] = { 31, 32 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 60, 68, 127, 169, 271, 314, 322, 346 },
            levels = {
                [26] = { acc = 97, eva = 81, agi = 31, int = 31, mnd = 23, chr = 24 },
                [27] = { acc = 100, eva = 84, agi = 31, int = 33, mnd = 24, chr = 26 },
                [31] = { acc = 114, eva = 97, agi = 36, int = 39, mnd = 28, chr = 30 },
                [32] = { acc = 117, eva = 99, agi = 36, int = 39, mnd = 28, chr = 30 },
            },
            spawn_levels = { [60] = { 26, 27 }, [68] = { 31, 32 }, [127] = { 31, 32 }, [169] = { 31, 32 },
                             [271] = { 31, 32 }, [314] = { 31, 32 }, [322] = { 31, 32 }, [346] = { 31, 32 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Earth Elemental',
            ids    = { 63, 172, 272 },
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Sabertooth Tiger',
            ids    = { 69, 70, 71 },
            levels = {
                [31] = { acc = 114, eva = 105, agi = 33, int = 20, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 20, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 240, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Old Sabertooth',
            ids    = { 72 },
            nm     = true,
            levels = {
                [20] = { acc = 75, eva = 69, agi = 22, int = 13, mnd = 16, chr = 18 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            links  = 7,
        },
        {
            name   = 'Sauromugue Skink',
            ids    = { 73, 74, 75, 81, 82, 83, 88, 89, 90, 181, 182, 183, 187, 188, 189, 204, 205, 211, 212, 213,
                       219, 220, 221, 243, 244, 245, 252, 285, 291, 292, 299, 300, 323, 324, 331, 332 },
            levels = {
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1710 },  -- copy of fernans diaries
                { rate = 50, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Deadly Dodo',
            ids    = { 115 },
            nm     = true,
            levels = {
                [39] = { acc = 139, eva = 131, agi = 40, int = 31, mnd = 31, chr = 35 },
                [40] = { acc = 142, eva = 134, agi = 40, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 240, item = 4435 },  -- slice of cockatrice meat
                { rate = 240, item = 854 },  -- cockatrice skin
                { rate = 240, item = 842 },  -- giant bird feather
                { rate = 150, item = 1014 },  -- dodo skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 130, 317, 349 },
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37 },
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
            name   = 'Diving Beetle',
            ids    = { 133, 134, 135, 142, 143, 149, 150, 156, 157, 206, 207, 253, 254, 281, 282, 283, 284 },
            levels = {
                [27] = { acc = 97, eva = 86, agi = 18, int = 18, mnd = 27, chr = 27 },
                [28] = { acc = 100, eva = 89, agi = 19, int = 19, mnd = 28, chr = 28 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 100, item = 889 },  -- beetle shell
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 5,
        },
        {
            name   = 'Evil Weapon',
            ids    = { 178, 179, 180, 273, 274, 275, 276, 277, 278, 279 },
            levels = {
                [37] = { acc = 134, eva = 124, agi = 38, int = 37, mnd = 29, chr = 37 },
                [38] = { acc = 137, eva = 127, agi = 38, int = 37, mnd = 29, chr = 38 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Evil Spirit',
            ids    = { 350, 351, 352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367,
                       368 },
            levels = {
                [35] = { acc = 126, eva = 118, agi = 36, int = 34, mnd = 26, chr = 34 },
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 369 },
            levels = {
                [29] = { acc = 109, eva = 117, agi = 35, int = 30, mnd = 20, chr = 20 },
                [30] = { acc = 113, eva = 133, agi = 37, int = 31, mnd = 21, chr = 21 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Roc',
            ids    = { 370 },
            nm     = true,
            levels = {
                [55] = { acc = 550, eva = 425, agi = 51, int = 54, mnd = 67, chr = 64 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            immune = { 'dark_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 4172 },  -- reraiser
                { rate = 1000, item = 4174 },  -- vile elixir
                { rate = 1000, item = 16822 },  -- crimson blade
                { rate = 150, item = 18587 },  -- dryad staff
                { rate = 50, item = 658 },  -- damascus ingot
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Climbpix Highrise',
            ids    = { 371 },
            nm     = true,
            levels = {
                [55] = { acc = 216, eva = 246, agi = 67, int = 58, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 1000, item = 17474 },  -- grapnel
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Balam-Agab',
            ids    = { 377 },
            nm     = true,
            levels = {
                [30] = { acc = 105, eva = 89, agi = 26, int = 28, mnd = 34, chr = 31 },
                [31] = { acc = 109, eva = 93, agi = 28, int = 31, mnd = 38, chr = 33 },
                [32] = { acc = 112, eva = 95, agi = 28, int = 31, mnd = 38, chr = 33 },
                [33] = { acc = 116, eva = 98, agi = 29, int = 31, mnd = 39, chr = 34 },
                [34] = { acc = 119, eva = 100, agi = 29, int = 32, mnd = 40, chr = 36 },
                [35] = { acc = 123, eva = 104, agi = 30, int = 33, mnd = 42, chr = 36 },
                [36] = { acc = 126, eva = 107, agi = 32, int = 35, mnd = 42, chr = 38 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Dribblix Greasemaw',
            ids    = { 378 },
            nm     = true,
            levels = {
                [30] = { acc = 131, eva = 95, agi = 38, int = 26, mnd = 28, chr = 26 },
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
                [33] = { acc = 142, eva = 105, agi = 43, int = 29, mnd = 32, chr = 29 },
                [34] = { acc = 145, eva = 108, agi = 45, int = 29, mnd = 32, chr = 29 },
                [35] = { acc = 148, eva = 112, agi = 46, int = 30, mnd = 32, chr = 30 },
                [36] = { acc = 152, eva = 114, agi = 47, int = 32, mnd = 34, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Goji',
            ids    = { 391, 393 },
            nm     = true,
            levels = {
                [92] = { acc = 425, eva = 390, agi = 94, int = 76, mnd = 60, chr = 85 },
                [93] = { acc = 432, eva = 395, agi = 95, int = 77, mnd = 62, chr = 85 },
                [94] = { acc = 440, eva = 401, agi = 96, int = 78, mnd = 62, chr = 86 },
            },
            ranks  = { ice = 2, wind = -1, earth = 4, thunder = 1, light = -1, dark = 5, paralyze = 2, bind = 2,
                       silence = -1, slow = 4, light_sleep = -1, dark_sleep = 5, blind = 5, stun = 1,
                       gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Arke',
            ids    = { 394, 396 },
            nm     = true,
            levels = {},
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Goblin Bounty Hunter',
            ids    = { 438, 439, 440, 441, 442 },
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
    },
    by_name = {},
}
