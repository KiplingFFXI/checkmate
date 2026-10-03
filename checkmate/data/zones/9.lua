-- PsoXja (zone 9).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Camazotz', 'Dire Bat', 'Purgatory Bat', 'Vampire Bat' },
        [2] = { 'Frost Lizard', 'Labyrinth Lizard', 'Maze Lizard', 'Snow Lizard' },
        [3] = { 'Cryptonberry Cutter', 'Cryptonberry Harrier', 'Cryptonberry Plaguer', 'Cryptonberry Stalker',
                'Golden-Tongued Culberry' },
        [4] = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Jeweler',
                'Goblin Mercenary', 'Goblin Veterinarian' },
        [5] = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Hunter', 'Goblin Jeweler',
                'Goblin Mercenary', 'Goblin Veterinarian' },
        [6] = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                'Goblin Mercenary', 'Goblin Veterinarian' },
        [7] = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Enchanter', 'Goblin Hunter', 'Goblin Jeweler',
                'Goblin Mercenary', 'Goblin Veterinarian' },
        [8] = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                'Goblin Jeweler', 'Goblin Mercenary', 'Goblin Veterinarian' },
        [9] = { 'Cryptonberry Cutter', 'Cryptonberry Harrier', 'Cryptonberry Plaguer', 'Cryptonberry Stalker' },
    },
    monsters = {
        {
            name   = 'Gargoyle',
            ids    = { 1 },
            nm     = true,
            levels = {
                [51] = { acc = 188, eva = 173, agi = 54, int = 41, mnd = 41, chr = 51 },
                [52] = { acc = 193, eva = 178, agi = 54, int = 41, mnd = 41, chr = 51 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 2 },
            nm     = true,
            levels = {
                [51] = { acc = 188, eva = 173, agi = 54, int = 41, mnd = 41, chr = 51 },
                [52] = { acc = 193, eva = 178, agi = 54, int = 41, mnd = 41, chr = 51 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 3 },
            nm     = true,
            levels = {
                [52] = { acc = 193, eva = 178, agi = 54, int = 41, mnd = 41, chr = 51 },
                [53] = { acc = 198, eva = 183, agi = 54, int = 43, mnd = 43, chr = 51 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 4 },
            nm     = true,
            levels = {
                [52] = { acc = 193, eva = 178, agi = 54, int = 41, mnd = 41, chr = 51 },
                [53] = { acc = 198, eva = 183, agi = 54, int = 43, mnd = 43, chr = 51 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 5 },
            nm     = true,
            levels = {
                [53] = { acc = 198, eva = 183, agi = 54, int = 43, mnd = 43, chr = 51 },
                [54] = { acc = 204, eva = 188, agi = 55, int = 43, mnd = 43, chr = 52 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 6 },
            nm     = true,
            levels = {
                [53] = { acc = 198, eva = 183, agi = 54, int = 43, mnd = 43, chr = 51 },
                [54] = { acc = 204, eva = 188, agi = 55, int = 43, mnd = 43, chr = 52 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 7 },
            nm     = true,
            levels = {
                [54] = { acc = 204, eva = 188, agi = 55, int = 43, mnd = 43, chr = 52 },
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 8 },
            nm     = true,
            levels = {
                [54] = { acc = 204, eva = 188, agi = 55, int = 43, mnd = 43, chr = 52 },
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 9 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53 },
                [56] = { acc = 215, eva = 199, agi = 58, int = 44, mnd = 44, chr = 54 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 10 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53 },
                [56] = { acc = 215, eva = 199, agi = 58, int = 44, mnd = 44, chr = 54 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 11 },
            nm     = true,
            levels = {
                [56] = { acc = 215, eva = 199, agi = 58, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 220, eva = 204, agi = 58, int = 46, mnd = 46, chr = 54 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 12 },
            nm     = true,
            levels = {
                [56] = { acc = 215, eva = 199, agi = 58, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 220, eva = 204, agi = 58, int = 46, mnd = 46, chr = 54 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 13 },
            nm     = true,
            levels = {
                [57] = { acc = 220, eva = 204, agi = 58, int = 46, mnd = 46, chr = 54 },
                [58] = { acc = 225, eva = 209, agi = 59, int = 46, mnd = 46, chr = 56 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 14 },
            nm     = true,
            levels = {
                [57] = { acc = 220, eva = 204, agi = 58, int = 46, mnd = 46, chr = 54 },
                [58] = { acc = 225, eva = 209, agi = 59, int = 46, mnd = 46, chr = 56 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 15 },
            nm     = true,
            levels = {
                [58] = { acc = 225, eva = 209, agi = 59, int = 46, mnd = 46, chr = 56 },
                [59] = { acc = 231, eva = 215, agi = 60, int = 47, mnd = 47, chr = 57 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 16 },
            nm     = true,
            levels = {
                [58] = { acc = 225, eva = 209, agi = 59, int = 46, mnd = 46, chr = 56 },
                [59] = { acc = 231, eva = 215, agi = 60, int = 47, mnd = 47, chr = 57 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Vampire Bat',
            ids    = { 17, 18, 266, 267, 271, 272, 275, 276, 277, 278 },
            levels = {
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 173, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44 },
                [49] = { acc = 176, eva = 167, agi = 57, int = 40, mnd = 40, chr = 44 },
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45 },
            },
            spawn_levels = { [17] = { 45, 47 }, [18] = { 45, 47 }, [266] = { 45, 47 }, [267] = { 45, 47 },
                             [271] = { 48, 50 }, [272] = { 48, 50 }, [275] = { 48, 50 }, [276] = { 48, 50 },
                             [277] = { 48, 50 }, [278] = { 48, 50 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 10, item = 1782 },  -- florid stone
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 1,
        },
        {
            name   = 'Maze Lizard',
            ids    = { 19, 20, 21, 22, 23, 24, 253, 254, 257, 258, 259, 262, 282, 283, 286, 287 },
            levels = {
                [43] = { acc = 157, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 161, eva = 149, agi = 49, int = 36, mnd = 36, chr = 40 },
                [45] = { acc = 164, eva = 152, agi = 49, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 168, eva = 156, agi = 51, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 171, eva = 159, agi = 52, int = 38, mnd = 38, chr = 43 },
            },
            spawn_levels = { [19] = { 45, 47 }, [20] = { 45, 47 }, [21] = { 45, 47 }, [22] = { 45, 47 },
                             [23] = { 45, 47 }, [24] = { 45, 47 }, [253] = { 43, 45 }, [254] = { 43, 45 },
                             [257] = { 43, 45 }, [258] = { 43, 45 }, [259] = { 43, 45 }, [262] = { 43, 45 },
                             [282] = { 43, 45 }, [283] = { 43, 45 }, [286] = { 43, 45 }, [287] = { 43, 45 } },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
            },
            links  = 2,
        },
        {
            name   = 'Blubber Eyes PX',
            ids    = { 25, 28, 29, 32, 57 },
            levels = {
                [53] = { acc = 196, eva = 177, agi = 57, int = 70, mnd = 48, chr = 52 },
                [54] = { acc = 202, eva = 183, agi = 58, int = 71, mnd = 48, chr = 52 },
                [55] = { acc = 207, eva = 187, agi = 58, int = 73, mnd = 49, chr = 52 },
                [56] = { acc = 213, eva = 193, agi = 61, int = 74, mnd = 50, chr = 55 },
                [57] = { acc = 218, eva = 197, agi = 61, int = 75, mnd = 50, chr = 55 },
                [58] = { acc = 223, eva = 202, agi = 61, int = 75, mnd = 52, chr = 55 },
            },
            spawn_levels = { [25] = { 53, 55 }, [28] = { 53, 55 }, [29] = { 53, 55 }, [32] = { 53, 55 },
                             [57] = { 56, 58 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 50, item = 1064 },  -- psoxja chest key
                { rate = 150, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cryptonberry Plaguer',
            ids    = { 26, 27, 38, 51, 52, 116, 134, 159, 172, 180, 209 },
            levels = {
                [53] = { acc = 198, eva = 170, agi = 63, int = 64, mnd = 45, chr = 52 },
                [54] = { acc = 204, eva = 176, agi = 64, int = 64, mnd = 45, chr = 52 },
                [55] = { acc = 209, eva = 180, agi = 65, int = 67, mnd = 47, chr = 52 },
                [56] = { acc = 215, eva = 186, agi = 67, int = 67, mnd = 47, chr = 55 },
                [57] = { acc = 220, eva = 191, agi = 68, int = 68, mnd = 47, chr = 55 },
                [58] = { acc = 225, eva = 196, agi = 68, int = 69, mnd = 50, chr = 55 },
                [59] = { acc = 231, eva = 201, agi = 70, int = 71, mnd = 50, chr = 57 },
                [60] = { acc = 236, eva = 206, agi = 70, int = 71, mnd = 50, chr = 57 },
            },
            spawn_levels = { [26] = { 54, 56 }, [27] = { 54, 56 }, [38] = { 54, 56 }, [51] = { 56, 58 },
                             [52] = { 56, 58 }, [116] = { 54, 57 }, [134] = { 57, 59 }, [159] = { 53, 56 },
                             [172] = { 53, 56 }, [180] = { 56, 58 }, [209] = { 59, 60 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1728 },  -- chunk of ordrynite
                { rate = 100, item = 4171 },  -- flask of vitriol
                { rate = 10, item = 1064 },  -- psoxja chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Cryptonberry Cutter',
            ids    = { 30, 31, 45, 56, 117, 158, 176, 182, 192 },
            levels = {
                [53] = { acc = 200, eva = 201, agi = 67, int = 49, mnd = 36, chr = 43 },
                [54] = { acc = 205, eva = 206, agi = 67, int = 49, mnd = 36, chr = 43 },
                [55] = { acc = 211, eva = 213, agi = 70, int = 50, mnd = 37, chr = 43 },
                [56] = { acc = 217, eva = 218, agi = 70, int = 52, mnd = 38, chr = 44 },
                [57] = { acc = 222, eva = 224, agi = 72, int = 52, mnd = 38, chr = 46 },
                [58] = { acc = 227, eva = 229, agi = 72, int = 53, mnd = 39, chr = 46 },
            },
            spawn_levels = { [30] = { 54, 56 }, [31] = { 54, 56 }, [45] = { 54, 56 }, [56] = { 56, 58 },
                             [117] = { 54, 57 }, [158] = { 53, 56 }, [176] = { 56, 58 }, [182] = { 56, 58 },
                             [192] = { 54, 56 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1064 },  -- psoxja chest key
                { rate = 100, item = 4171 },  -- flask of vitriol
                { rate = 10, item = 17303 },  -- manji shuriken
                { rate = 10, item = 4962 },  -- scroll of tonko ni
                { rate = 5, item = 4956 },  -- scroll of kurayami ni
                { rate = 5, item = 4953 },  -- scroll of hojo ni
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Camazotz PX',
            ids    = { 33, 34, 171, 177, 179, 190, 191, 204, 205 },
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
            },
            spawn_levels = { [33] = { 54, 57 }, [34] = { 54, 57 }, [171] = { 52, 54 }, [177] = { 52, 54 },
                             [179] = { 52, 54 }, [190] = { 54, 57 }, [191] = { 54, 57 }, [204] = { 54, 57 },
                             [205] = { 54, 57 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 50, item = 1782 },  -- florid stone
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 1064 },  -- psoxja chest key
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Magic Millstone',
            ids    = { 35, 36, 61, 169, 170, 186, 187, 188, 189, 197, 198, 202, 203 },
            levels = {
                [54] = { acc = 202, eva = 185, agi = 48, int = 59, mnd = 57, chr = 55 },
                [55] = { acc = 207, eva = 191, agi = 50, int = 60, mnd = 57, chr = 55 },
                [56] = { acc = 213, eva = 195, agi = 51, int = 61, mnd = 59, chr = 57 },
                [57] = { acc = 218, eva = 200, agi = 51, int = 63, mnd = 60, chr = 57 },
                [58] = { acc = 223, eva = 206, agi = 53, int = 63, mnd = 60, chr = 58 },
            },
            spawn_levels = { [35] = { 54, 56 }, [36] = { 54, 56 }, [61] = { 54, 56 }, [169] = { 54, 56 },
                             [170] = { 54, 56 }, [186] = { 54, 56 }, [187] = { 54, 56 }, [188] = { 54, 56 },
                             [189] = { 54, 56 }, [197] = { 56, 58 }, [198] = { 56, 58 }, [202] = { 56, 58 },
                             [203] = { 56, 58 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 10, item = 1064 },  -- psoxja chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Snoll',
            ids    = { 37, 58, 111, 112, 114, 119, 121, 123 },
            levels = {
                [56] = { acc = 215, eva = 200, agi = 61, int = 41, mnd = 44, chr = 54 },
                [57] = { acc = 220, eva = 205, agi = 61, int = 43, mnd = 46, chr = 54 },
                [58] = { acc = 225, eva = 210, agi = 61, int = 44, mnd = 46, chr = 56 },
                [59] = { acc = 231, eva = 216, agi = 63, int = 44, mnd = 47, chr = 57 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 50, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Cryptonberry Harrier',
            ids    = { 39, 42, 53, 126, 143, 155, 173, 193 },
            levels = {
                [53] = { acc = 193, eva = 168, agi = 58, int = 58, mnd = 58, chr = 61, resist = { slow = 15 } },
                [54] = { acc = 199, eva = 173, agi = 58, int = 58, mnd = 58, chr = 61, resist = { slow = 15 } },
                [55] = { acc = 204, eva = 177, agi = 59, int = 61, mnd = 61, chr = 63, resist = { slow = 15 } },
                [56] = { acc = 210, eva = 183, agi = 61, int = 61, mnd = 61, chr = 64, resist = { slow = 15 } },
                [57] = { acc = 215, eva = 188, agi = 62, int = 62, mnd = 62, chr = 65, resist = { slow = 15 } },
                [58] = { acc = 221, eva = 193, agi = 62, int = 63, mnd = 63, chr = 65, resist = { slow = 15 } },
                [59] = { acc = 226, eva = 198, agi = 64, int = 65, mnd = 65, chr = 68, resist = { slow = 15 } },
                [60] = { acc = 231, eva = 203, agi = 64, int = 65, mnd = 65, chr = 68, resist = { slow = 20 } },
            },
            spawn_levels = { [39] = { 54, 56 }, [42] = { 54, 56 }, [53] = { 56, 58 }, [126] = { 57, 59 },
                             [143] = { 59, 60 }, [155] = { 53, 56 }, [173] = { 53, 56 }, [193] = { 54, 56 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1064 },  -- psoxja chest key
                { rate = 100, item = 4171 },  -- flask of vitriol
                { rate = 10, item = 4901 },  -- water spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 40, 43, 54, 127, 144, 156, 174, 194 },
            levels = {
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50 },
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Cryptonberry Stalker',
            ids    = { 41, 44, 55, 124, 135, 157, 166, 175, 181, 351 },
            levels = {
                [53] = { acc = 203, eva = 236, agi = 67, int = 54, mnd = 36, chr = 39 },
                [54] = { acc = 208, eva = 241, agi = 67, int = 55, mnd = 36, chr = 39 },
                [55] = { acc = 214, eva = 248, agi = 70, int = 56, mnd = 37, chr = 39 },
                [56] = { acc = 220, eva = 253, agi = 70, int = 58, mnd = 38, chr = 41 },
                [57] = { acc = 225, eva = 259, agi = 72, int = 58, mnd = 38, chr = 41 },
                [58] = { acc = 230, eva = 264, agi = 72, int = 59, mnd = 39, chr = 41 },
                [59] = { acc = 237, eva = 270, agi = 75, int = 60, mnd = 39, chr = 42 },
                [60] = { acc = 242, eva = 275, agi = 75, int = 60, mnd = 39, chr = 42 },
            },
            spawn_levels = { [41] = { 54, 56 }, [44] = { 54, 56 }, [55] = { 56, 58 }, [124] = { 57, 59 },
                             [135] = { 59, 60 }, [157] = { 53, 56 }, [166] = { 53, 56 }, [175] = { 53, 56 },
                             [181] = { 56, 58 }, [351] = { 59, 60 } },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 150, item = 1119 },  -- tonberry coat
                { rate = 50, item = 1728 },  -- chunk of ordrynite
                { rate = 50, item = 724 },  -- piece of magnolia lumber
                { rate = 50, item = 1064 },  -- psoxja chest key
                { rate = 10, item = 4171 },  -- flask of vitriol
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Diremite Stalker',
            ids    = { 46, 47, 48, 49, 206, 207, 208 },
            levels = {
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 41 },
                [57] = { acc = 218, eva = 202, agi = 55, int = 61, mnd = 41, chr = 41 },
                [58] = { acc = 223, eva = 207, agi = 55, int = 61, mnd = 41, chr = 41 },
                [59] = { acc = 229, eva = 213, agi = 57, int = 63, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1782 },  -- florid stone
                { rate = 150, item = 1700 },  -- spool of bloodthread
                { rate = 100, item = 1694 },  -- gray chip
                { rate = 50, item = 1626 },  -- bottle of avatar blood
            },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 50, 131, 133, 138, 195, 222, 274, 333, 347, 350 },
            levels = {
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
                [65] = { acc = 260, eva = 238, agi = 65, int = 76, mnd = 61, chr = 62 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
            },
            spawn_levels = { [50] = { 65, 65 }, [131] = { 65, 65 }, [133] = { 65, 65 }, [138] = { 65, 65 },
                             [195] = { 60, 60 }, [222] = { 65, 65 }, [274] = { 50, 50 }, [333] = { 75, 75 },
                             [347] = { 80, 80 }, [350] = { 80, 80 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Goblin Hunter',
            ids    = { 59 },
            levels = {
                [56] = { acc = 248, eva = 190, agi = 74, int = 50, mnd = 55, chr = 50 },
                [57] = { acc = 254, eva = 194, agi = 75, int = 50, mnd = 55, chr = 50 },
                [58] = { acc = 259, eva = 199, agi = 75, int = 52, mnd = 55, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Enchanter',
            ids    = { 60 },
            levels = {
                [56] = { acc = 213, eva = 191, agi = 54, int = 61, mnd = 61, chr = 55 },
                [57] = { acc = 219, eva = 195, agi = 54, int = 61, mnd = 61, chr = 55 },
                [58] = { acc = 224, eva = 201, agi = 56, int = 61, mnd = 61, chr = 55 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 650 },  -- brass ingot
                { rate = 10, item = 744 },  -- silver ingot
                { rate = 5, item = 745 },  -- gold ingot
                { rate = 5, item = 746 },  -- platinum ingot
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblin Jeweler',
            ids    = { 62 },
            levels = {
                [56] = { acc = 221, eva = 252, agi = 68, int = 61, mnd = 41, chr = 41 },
                [57] = { acc = 227, eva = 257, agi = 69, int = 61, mnd = 41, chr = 41 },
                [58] = { acc = 232, eva = 262, agi = 69, int = 61, mnd = 41, chr = 41 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 150, item = 4509 },  -- flask of distilled water
                { rate = 100, item = 605 },  -- pickaxe
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 50, item = 4518 },  -- strip of sheep jerky
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Bouncer',
            ids    = { 63 },
            levels = {
                [56] = { acc = 216, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 222, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 227, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 64, 83, 102, 103 },
            levels = {
                [63] = { acc = 253, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 259, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 264, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            spawn_levels = { [64] = { 63, 66 }, [83] = { 63, 66 }, [102] = { 66, 68 }, [103] = { 66, 68 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 1426 },  -- warriors testimony
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 65, 84, 86, 90, 104 },
            levels = {
                [62] = { acc = 240, eva = 209, agi = 59, int = 55, mnd = 76, chr = 66 },
                [63] = { acc = 245, eva = 213, agi = 59, int = 55, mnd = 78, chr = 66 },
                [64] = { acc = 250, eva = 219, agi = 60, int = 56, mnd = 79, chr = 68 },
                [65] = { acc = 256, eva = 224, agi = 62, int = 58, mnd = 80, chr = 68 },
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
            },
            spawn_levels = { [65] = { 62, 65 }, [84] = { 65, 67 }, [86] = { 65, 67 }, [90] = { 66, 68 },
                             [104] = { 66, 68 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1428 },  -- white mages testimony
                { rate = 50, item = 4719 },  -- scroll of regen iii
                { rate = 10, item = 4613 },  -- scroll of cure v
                { rate = 10, item = 4618 },  -- scroll of curaga iv
                { rate = 50, item = 4741 },  -- scroll of shellra iv
                { rate = 50, item = 4750 },  -- scroll of reraise iii
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Goblin Bandit',
            ids    = { 66, 85, 88, 92, 105 },
            levels = {
                [62] = { acc = 253, eva = 285, agi = 74, int = 66, mnd = 45, chr = 45, resist = { gravity = 15 } },
                [63] = { acc = 259, eva = 290, agi = 74, int = 66, mnd = 45, chr = 45, resist = { gravity = 15 } },
                [64] = { acc = 265, eva = 296, agi = 77, int = 68, mnd = 46, chr = 46, resist = { gravity = 15 } },
                [65] = { acc = 270, eva = 301, agi = 77, int = 68, mnd = 46, chr = 46, resist = { gravity = 15 } },
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47, resist = { gravity = 20 } },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48, resist = { gravity = 20 } },
            },
            spawn_levels = { [66] = { 62, 65 }, [85] = { 65, 67 }, [88] = { 65, 67 }, [92] = { 66, 67 },
                             [105] = { 66, 67 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Maledict Millstone',
            ids    = { 67, 70, 97, 98, 99, 140, 141, 142, 293, 294, 295 },
            levels = {
                [64] = { acc = 256, eva = 237, agi = 56, int = 69, mnd = 66, chr = 64 },
                [65] = { acc = 261, eva = 243, agi = 58, int = 70, mnd = 67, chr = 65 },
                [66] = { acc = 267, eva = 247, agi = 59, int = 72, mnd = 69, chr = 66 },
                [67] = { acc = 271, eva = 252, agi = 59, int = 72, mnd = 69, chr = 67 },
                [68] = { acc = 276, eva = 258, agi = 61, int = 73, mnd = 69, chr = 67 },
            },
            spawn_levels = { [67] = { 64, 66 }, [70] = { 64, 66 }, [97] = { 64, 66 }, [98] = { 64, 66 },
                             [99] = { 64, 66 }, [140] = { 66, 68 }, [141] = { 66, 68 }, [142] = { 66, 68 },
                             [293] = { 66, 68 }, [294] = { 66, 68 }, [295] = { 66, 68 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 50, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Dire Bat',
            ids    = { 68, 69, 73, 76, 220, 221, 291, 292, 298, 299, 301, 302, 308, 309 },
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            spawn_levels = { [68] = { 65, 68 }, [69] = { 65, 68 }, [73] = { 65, 68 }, [76] = { 65, 68 },
                             [220] = { 63, 65 }, [221] = { 63, 65 }, [291] = { 66, 68 }, [292] = { 66, 68 },
                             [298] = { 66, 68 }, [299] = { 66, 68 }, [301] = { 66, 68 }, [302] = { 66, 68 },
                             [308] = { 66, 68 }, [309] = { 66, 68 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 10, item = 1782 },  -- florid stone
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Diremite Assaulter',
            ids    = { 71, 72, 74, 75, 77, 78, 80, 81, 96, 145, 146, 147, 215, 216, 217, 218, 300, 303, 304, 305 },
            levels = {
                [63] = { acc = 250, eva = 234, agi = 60, int = 66, mnd = 45, chr = 45 },
                [64] = { acc = 256, eva = 240, agi = 62, int = 68, mnd = 46, chr = 46 },
                [65] = { acc = 261, eva = 245, agi = 62, int = 68, mnd = 46, chr = 46 },
                [66] = { acc = 267, eva = 249, agi = 62, int = 70, mnd = 47, chr = 47 },
                [67] = { acc = 271, eva = 255, agi = 65, int = 71, mnd = 48, chr = 48 },
                [68] = { acc = 276, eva = 260, agi = 65, int = 71, mnd = 48, chr = 48 },
            },
            spawn_levels = { [71] = { 65, 68 }, [72] = { 65, 68 }, [74] = { 65, 68 }, [75] = { 65, 68 },
                             [77] = { 65, 68 }, [78] = { 65, 68 }, [80] = { 65, 68 }, [81] = { 65, 68 },
                             [96] = { 65, 68 }, [145] = { 66, 68 }, [146] = { 66, 68 }, [147] = { 66, 68 },
                             [215] = { 63, 65 }, [216] = { 63, 65 }, [217] = { 63, 65 }, [218] = { 63, 65 },
                             [300] = { 66, 68 }, [303] = { 66, 68 }, [304] = { 66, 68 }, [305] = { 66, 68 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1694 },  -- gray chip
                { rate = 150, item = 1782 },  -- florid stone
                { rate = 100, item = 1626 },  -- bottle of avatar blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Thousand Eyes PX',
            ids    = { 79, 82, 87, 89, 91, 93, 108, 109, 148, 149, 290, 296, 297 },
            levels = {
                [64] = { acc = 256, eva = 233, agi = 68, int = 83, mnd = 56, chr = 62 },
                [65] = { acc = 261, eva = 237, agi = 68, int = 84, mnd = 58, chr = 62 },
                [66] = { acc = 267, eva = 243, agi = 70, int = 85, mnd = 58, chr = 62 },
                [67] = { acc = 271, eva = 247, agi = 71, int = 87, mnd = 59, chr = 65 },
                [68] = { acc = 276, eva = 252, agi = 71, int = 87, mnd = 60, chr = 65 },
            },
            spawn_levels = { [79] = { 64, 66 }, [82] = { 64, 66 }, [87] = { 64, 66 }, [89] = { 64, 66 },
                             [91] = { 64, 66 }, [93] = { 64, 66 }, [108] = { 64, 66 }, [109] = { 64, 66 },
                             [148] = { 66, 68 }, [149] = { 66, 68 }, [290] = { 66, 68 }, [296] = { 66, 68 },
                             [297] = { 66, 68 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 914 },  -- vial of mercury
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 939 },  -- hecteyes eye
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Veterinarian',
            ids    = { 94, 100, 106 },
            levels = {
                [63] = { acc = 253, eva = 230, agi = 53, int = 55, mnd = 55, chr = 78 },
                [64] = { acc = 259, eva = 236, agi = 54, int = 56, mnd = 56, chr = 79 },
                [65] = { acc = 264, eva = 242, agi = 56, int = 58, mnd = 58, chr = 80 },
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83 },
            },
            spawn_levels = { [94] = { 63, 66 }, [100] = { 66, 68 }, [106] = { 66, 68 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 17088 },  -- ash staff
                { rate = 150, item = 859 },  -- ram skin
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 50, item = 17865 },  -- jug of singing herbal broth
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Goblins Bat',
            ids    = { 95, 101, 107 },
            levels = {
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 1,
        },
        {
            name   = 'Morozko',
            ids    = { 110, 125, 150 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 49, mnd = 52, chr = 62 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Labyrinth Lizard',
            ids    = { 113, 115, 118, 120, 122, 160, 161, 164, 165, 168, 184, 185, 199, 200, 201, 223, 224 },
            levels = {
                [53] = { acc = 198, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 204, eva = 190, agi = 58, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 220, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 225, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52 },
            },
            spawn_levels = { [113] = { 56, 58 }, [115] = { 56, 58 }, [118] = { 56, 58 }, [120] = { 56, 58 },
                             [122] = { 56, 58 }, [160] = { 53, 55 }, [161] = { 53, 55 }, [164] = { 53, 55 },
                             [165] = { 53, 55 }, [168] = { 53, 55 }, [184] = { 56, 58 }, [185] = { 56, 58 },
                             [199] = { 56, 58 }, [200] = { 56, 58 }, [201] = { 56, 58 }, [223] = { 56, 58 },
                             [224] = { 56, 58 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 10, item = 1064 },  -- psoxja chest key
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
            },
            links  = 2,
        },
        {
            name   = 'Snow Lizard',
            ids    = { 128, 129, 136, 139, 306, 307 },
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
            },
            spawn_levels = { [128] = { 63, 65 }, [129] = { 63, 65 }, [136] = { 63, 65 }, [139] = { 63, 65 },
                             [306] = { 66, 68 }, [307] = { 66, 68 } },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1692 },  -- carmine chip
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
            },
            links  = 2,
        },
        {
            name   = 'Dark Elemental',
            ids    = { 130, 132, 137, 273, 332, 346, 349 },
            levels = {
                [50] = { acc = 180, eva = 167, agi = 50, int = 54, mnd = 36, chr = 36 },
                [63] = { acc = 250, eva = 234, agi = 60, int = 66, mnd = 45, chr = 45 },
                [80] = { acc = 342, eva = 323, agi = 75, int = 82, mnd = 55, chr = 55 },
            },
            spawn_levels = { [130] = { 63, 63 }, [132] = { 63, 63 }, [137] = { 63, 63 }, [273] = { 50, 50 },
                             [332] = { 80, 80 }, [346] = { 80, 80 }, [349] = { 80, 80 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'blind' },
            drops  = {
                { rate = 1000, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
                { rate = 150, item = 4111 },  -- dark cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle-Iota',
            ids    = { 151 },
            nm     = true,
            levels = {
                [52] = { acc = 188, eva = 169, agi = 36, int = 38, mnd = 56, chr = 60 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle-Kappa',
            ids    = { 152 },
            nm     = true,
            levels = {
                [52] = { acc = 188, eva = 169, agi = 36, int = 38, mnd = 56, chr = 60 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle-Lambda',
            ids    = { 153 },
            nm     = true,
            levels = {
                [53] = { acc = 194, eva = 175, agi = 39, int = 45, mnd = 57, chr = 58 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle-Mu',
            ids    = { 154 },
            nm     = true,
            levels = {
                [54] = { acc = 199, eva = 180, agi = 39, int = 45, mnd = 58, chr = 60 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gargoyle',
            ids    = { 162, 163, 211, 212, 213, 214 },
            levels = {
                [53] = { acc = 198, eva = 183, agi = 54, int = 43, mnd = 43, chr = 51 },
                [54] = { acc = 204, eva = 188, agi = 55, int = 43, mnd = 43, chr = 52 },
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53 },
                [56] = { acc = 215, eva = 199, agi = 58, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 220, eva = 204, agi = 58, int = 46, mnd = 46, chr = 54 },
            },
            spawn_levels = { [162] = { 53, 55 }, [163] = { 53, 55 }, [211] = { 56, 57 }, [212] = { 56, 57 },
                             [213] = { 56, 57 }, [214] = { 56, 57 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1064 },  -- psoxja chest key
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Treasure Chest',
            ids    = { 167, 178, 183, 196, 210, 219 },
            levels = {
                [55] = { acc = 209, eva = 198, agi = 65, int = 50, mnd = 50, chr = 43 },
                [56] = { acc = 215, eva = 203, agi = 67, int = 50, mnd = 50, chr = 43 },
                [57] = { acc = 220, eva = 209, agi = 68, int = 53, mnd = 53, chr = 44 },
                [58] = { acc = 225, eva = 214, agi = 68, int = 53, mnd = 53, chr = 46 },
                [59] = { acc = 231, eva = 220, agi = 70, int = 54, mnd = 54, chr = 46 },
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Gazer PX',
            ids    = { 225, 226, 227, 228, 232, 236, 242, 243, 246, 247 },
            levels = {
                [42] = { acc = 152, eva = 139, agi = 47, int = 57, mnd = 39, chr = 42 },
                [43] = { acc = 155, eva = 142, agi = 47, int = 59, mnd = 39, chr = 42 },
                [44] = { acc = 159, eva = 145, agi = 49, int = 60, mnd = 40, chr = 45 },
                [45] = { acc = 162, eva = 148, agi = 49, int = 61, mnd = 42, chr = 45 },
                [46] = { acc = 166, eva = 151, agi = 51, int = 62, mnd = 42, chr = 45 },
            },
            spawn_levels = { [225] = { 42, 44 }, [226] = { 42, 44 }, [227] = { 42, 44 }, [228] = { 42, 44 },
                             [232] = { 42, 44 }, [236] = { 43, 46 }, [242] = { 43, 46 }, [243] = { 43, 46 },
                             [246] = { 43, 46 }, [247] = { 43, 46 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 150, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Diremite',
            ids    = { 229, 230, 233, 234, 235, 237, 238, 239, 244, 245, 248, 249, 250, 255, 256, 260, 261, 263,
                       265, 268, 269, 270, 284, 285 },
            levels = {
                [42] = { acc = 152, eva = 140, agi = 42, int = 47, mnd = 32, chr = 32 },
                [43] = { acc = 155, eva = 143, agi = 42, int = 47, mnd = 32, chr = 32 },
                [44] = { acc = 159, eva = 147, agi = 45, int = 49, mnd = 33, chr = 33 },
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 33 },
                [46] = { acc = 166, eva = 153, agi = 45, int = 51, mnd = 34, chr = 34 },
                [47] = { acc = 170, eva = 156, agi = 47, int = 52, mnd = 35, chr = 35 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 52, mnd = 35, chr = 35 },
            },
            spawn_levels = { [229] = { 42, 43 }, [230] = { 42, 43 }, [233] = { 42, 43 }, [234] = { 42, 43 },
                             [235] = { 42, 43 }, [237] = { 42, 43 }, [238] = { 42, 43 }, [239] = { 42, 43 },
                             [244] = { 42, 44 }, [245] = { 42, 44 }, [248] = { 42, 44 }, [249] = { 42, 44 },
                             [250] = { 42, 44 }, [255] = { 44, 46 }, [256] = { 44, 46 }, [260] = { 44, 46 },
                             [261] = { 44, 46 }, [263] = { 44, 46 }, [265] = { 45, 47 }, [268] = { 46, 47 },
                             [269] = { 47, 48 }, [270] = { 47, 48 }, [284] = { 43, 45 }, [285] = { 44, 44 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 2013 },  -- vial of lizard blood
                { rate = 240, item = 2013 },  -- vial of lizard blood
                { rate = 150, item = 1782 },  -- florid stone
                { rate = 100, item = 1694 },  -- gray chip
                { rate = 50, item = 1626 },  -- bottle of avatar blood
            },
        },
        {
            name   = 'Snowball',
            ids    = { 231, 241, 252, 279, 280, 288, 289 },
            levels = {
                [43] = { acc = 157, eva = 145, agi = 47, int = 33, mnd = 35, chr = 42 },
                [44] = { acc = 161, eva = 149, agi = 49, int = 33, mnd = 36, chr = 43 },
                [45] = { acc = 164, eva = 152, agi = 49, int = 35, mnd = 37, chr = 45 },
                [46] = { acc = 168, eva = 156, agi = 51, int = 35, mnd = 37, chr = 46 },
                [47] = { acc = 171, eva = 159, agi = 52, int = 35, mnd = 38, chr = 46 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 36, mnd = 38, chr = 47 },
                [49] = { acc = 178, eva = 165, agi = 53, int = 38, mnd = 40, chr = 48 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 38, mnd = 41, chr = 48 },
            },
            spawn_levels = { [231] = { 43, 46 }, [241] = { 43, 46 }, [252] = { 43, 46 }, [279] = { 47, 50 },
                             [280] = { 47, 50 }, [288] = { 43, 46 }, [289] = { 43, 46 } },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
                { rate = 10, item = 1064 },  -- psoxja chest key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Gyre-Carlin',
            ids    = { 240, 251, 264 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 167, agi = 50, int = 54, mnd = 36, chr = 36 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1782 },  -- florid stone
                { rate = 100, item = 14866 },  -- concealing cuffs
                { rate = 100, item = 17247 },  -- rikonodo
                { rate = 100, item = 1626 },  -- bottle of avatar blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Nunyunuwi',
            ids    = { 281 },
            nm     = true,
            levels = {
                [56] = { acc = 215, eva = 199, agi = 58, int = 48, mnd = 48, chr = 54 },
                [57] = { acc = 220, eva = 204, agi = 58, int = 50, mnd = 50, chr = 54 },
                [58] = { acc = 225, eva = 209, agi = 59, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Avalanche',
            ids    = { 310, 313, 319 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 55, mnd = 58, chr = 70 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Purgatory Bat',
            ids    = { 311, 312, 318, 324, 329, 341, 342 },
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
            },
            spawn_levels = { [311] = { 72, 74 }, [312] = { 72, 74 }, [318] = { 72, 74 }, [324] = { 72, 74 },
                             [329] = { 72, 74 }, [341] = { 73, 76 }, [342] = { 73, 76 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 10, item = 1782 },  -- florid stone
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Million Eyes PX',
            ids    = { 314, 315, 316, 317, 335, 336, 337, 338 },
            levels = {
                [74] = { acc = 309, eva = 282, agi = 77, int = 94, mnd = 64, chr = 70 },
                [75] = { acc = 314, eva = 286, agi = 77, int = 96, mnd = 65, chr = 70 },
                [76] = { acc = 321, eva = 293, agi = 80, int = 97, mnd = 66, chr = 72 },
                [77] = { acc = 326, eva = 297, agi = 80, int = 98, mnd = 66, chr = 72 },
            },
            spawn_levels = { [314] = { 74, 75 }, [315] = { 74, 75 }, [316] = { 74, 75 }, [317] = { 74, 75 },
                             [335] = { 75, 77 }, [336] = { 75, 77 }, [337] = { 75, 77 }, [338] = { 75, 77 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 150, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Demonic Millstone',
            ids    = { 320, 321, 334 },
            levels = {
                [72] = { acc = 298, eva = 279, agi = 64, int = 76, mnd = 73, chr = 71 },
                [73] = { acc = 304, eva = 284, agi = 64, int = 78, mnd = 74, chr = 72 },
                [74] = { acc = 309, eva = 289, agi = 64, int = 79, mnd = 76, chr = 73 },
                [75] = { acc = 314, eva = 295, agi = 66, int = 80, mnd = 76, chr = 73 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Frost Lizard',
            ids    = { 322, 323, 327, 328, 343, 344 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
            },
            spawn_levels = { [322] = { 73, 75 }, [323] = { 73, 75 }, [327] = { 73, 75 }, [328] = { 73, 75 },
                             [343] = { 75, 77 }, [344] = { 75, 77 } },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1692 },  -- carmine chip
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
            },
            links  = 2,
        },
        {
            name   = 'Diremite Dominator',
            ids    = { 325, 326, 330, 331, 339, 340 },
            levels = {
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52 },
                [75] = { acc = 314, eva = 297, agi = 70, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 321, eva = 302, agi = 72, int = 80, mnd = 54, chr = 54 },
                [77] = { acc = 326, eva = 307, agi = 72, int = 80, mnd = 54, chr = 54 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1694 },  -- gray chip
                { rate = 150, item = 1782 },  -- florid stone
                { rate = 100, item = 1626 },  -- bottle of avatar blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Archaic Chest',
            ids    = { 345, 348 },
            levels = {
                [80] = { acc = 344, eva = 331, agi = 91, int = 70, mnd = 70, chr = 60 },
            },
            drops  = {
                { rate = 240, item = 1693 },  -- cyan chip
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Golden-Tongued Culberry',
            ids    = { 352 },
            nm     = true,
            levels = {
                [84] = { acc = 367, eva = 324, agi = 91, int = 86, mnd = 77, chr = 82 },
                [85] = { acc = 373, eva = 329, agi = 92, int = 89, mnd = 79, chr = 82 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'paralyze', 'petrify' },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
            flags  = { scripted_drops = true },
        },
    },
    by_name = {},
}
