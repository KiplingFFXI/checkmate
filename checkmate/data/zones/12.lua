-- Newton Movalpolos (zone 12).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Bugbear Deathsman', 'Bugbear Matman', 'Bugbear Trashman', 'Bugbear Watchman', 'Goblin Collector',
                'Goblin Fireman', 'Goblin Foreman', 'Goblin Hangman', 'Goblin Headman', 'Goblin Junkman',
                'Goblin Lengthman', 'Goblin Marksman', 'Goblin Packman', 'Goblin Swordsman', 'Moblin Aidman',
                'Moblin Draftsman', 'Moblin Engineman', 'Moblin Groundman', 'Moblin Roadman', 'Moblin Scalpelman',
                'Moblin Tankman', 'Moblin Topsman', 'Moblin Workman', 'Moblin Yardman', 'Swashstox Beadblinker' },
        [2] = { 'Dire Bat', 'Nightmare Bats', 'Purgatory Bat', 'Succubus Bats' },
        [3] = { 'Bugbear Deathsman', 'Bugbear Matman', 'Bugbear Trashman', 'Bugbear Watchman', 'Goblin Fireman',
                'Goblin Foreman', 'Goblin Hangman', 'Goblin Headman', 'Goblin Junkman', 'Goblin Lengthman',
                'Goblin Marksman', 'Goblin Packman', 'Goblin Swordsman', 'Moblin Aidman', 'Moblin Draftsman',
                'Moblin Engineman', 'Moblin Groundman', 'Moblin Roadman', 'Moblin Scalpelman', 'Moblin Tankman',
                'Moblin Topsman', 'Moblin Workman', 'Moblin Yardman', 'Swashstox Beadblinker' },
        [4] = { 'Bugbear Deathsman', 'Bugbear Trashman', 'Bugbear Watchman', 'Goblin Collector', 'Goblin Fireman',
                'Goblin Foreman', 'Goblin Hangman', 'Goblin Headman', 'Goblin Junkman', 'Goblin Lengthman',
                'Goblin Marksman', 'Goblin Packman', 'Goblin Swordsman', 'Moblin Aidman', 'Moblin Draftsman',
                'Moblin Engineman', 'Moblin Groundman', 'Moblin Roadman', 'Moblin Scalpelman', 'Moblin Tankman',
                'Moblin Topsman', 'Moblin Workman', 'Moblin Yardman', 'Swashstox Beadblinker' },
    },
    monsters = {
        {
            name   = 'Goblin Foreman',
            ids    = { 1, 13, 28, 47, 70, 76, 91, 107 },
            levels = {
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83 },
                [69] = { acc = 286, eva = 262, agi = 59, int = 60, mnd = 60, chr = 84 },
            },
            spawn_levels = { [1] = { 66, 68 }, [13] = { 66, 68 }, [28] = { 66, 68 }, [47] = { 66, 68 },
                             [70] = { 66, 68 }, [76] = { 66, 68 }, [91] = { 66, 68 }, [107] = { 68, 69 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 1684 },  -- gold key
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblins Bat',
            ids    = { 2, 14, 29, 48, 71, 77, 92, 108 },
            levels = {
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Goblin Packman',
            ids    = { 3, 9, 17, 35, 38, 52, 79, 82, 87, 103 },
            levels = {
                [66] = { acc = 271, eva = 251, agi = 67, int = 70, mnd = 47, chr = 47 },
                [67] = { acc = 275, eva = 257, agi = 69, int = 71, mnd = 48, chr = 48 },
                [68] = { acc = 280, eva = 262, agi = 69, int = 71, mnd = 48, chr = 48 },
                [69] = { acc = 286, eva = 268, agi = 70, int = 72, mnd = 48, chr = 48 },
            },
            spawn_levels = { [3] = { 66, 68 }, [9] = { 66, 68 }, [17] = { 66, 68 }, [35] = { 66, 68 },
                             [38] = { 66, 68 }, [52] = { 66, 68 }, [79] = { 66, 68 }, [82] = { 66, 68 },
                             [87] = { 66, 68 }, [103] = { 68, 69 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 20 },
            drops  = {
                { rate = 100, item = 1684 },  -- gold key
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Bugbear Trashman',
            ids    = { 4, 7, 15, 24, 27, 31, 49, 51, 68, 83, 85, 86, 110 },
            levels = {
                [65] = { acc = 267, eva = 249, agi = 59, int = 46, mnd = 62, chr = 58 },
                [66] = { acc = 273, eva = 255, agi = 60, int = 47, mnd = 62, chr = 58 },
                [67] = { acc = 277, eva = 260, agi = 60, int = 48, mnd = 65, chr = 59 },
            },
            spawn_levels = { [4] = { 65, 66 }, [7] = { 66, 66 }, [15] = { 66, 66 }, [24] = { 66, 66 },
                             [27] = { 65, 65 }, [31] = { 65, 66 }, [49] = { 66, 67 }, [51] = { 66, 67 },
                             [68] = { 66, 67 }, [83] = { 66, 67 }, [85] = { 66, 67 }, [86] = { 66, 67 },
                             [110] = { 66, 67 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1781 },  -- sylvan stone
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 150, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 10, item = 1654 },  -- igneous rock
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Fireman',
            ids    = { 5, 8, 20, 21, 34, 37, 50, 74, 101, 102 },
            levels = {
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
            },
            spawn_levels = { [5] = { 66, 68 }, [8] = { 66, 68 }, [20] = { 66, 68 }, [21] = { 66, 68 },
                             [34] = { 66, 68 }, [37] = { 66, 68 }, [50] = { 66, 68 }, [74] = { 66, 68 },
                             [101] = { 68, 69 }, [102] = { 68, 69 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 100, item = 1684 },  -- gold key
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Lengthman',
            ids    = { 6, 10, 18, 30, 36, 39, 53, 69, 75, 96, 104, 109 },
            levels = {
                [66] = { acc = 302, eva = 240, agi = 85, int = 58, mnd = 62, chr = 58 },
                [67] = { acc = 307, eva = 245, agi = 87, int = 59, mnd = 65, chr = 59 },
                [68] = { acc = 312, eva = 250, agi = 87, int = 60, mnd = 65, chr = 60 },
                [69] = { acc = 317, eva = 255, agi = 89, int = 60, mnd = 65, chr = 60 },
            },
            spawn_levels = { [6] = { 66, 68 }, [10] = { 66, 68 }, [18] = { 66, 68 }, [30] = { 66, 68 },
                             [36] = { 66, 68 }, [39] = { 66, 68 }, [53] = { 66, 68 }, [69] = { 66, 68 },
                             [75] = { 66, 68 }, [96] = { 66, 68 }, [104] = { 68, 69 }, [109] = { 68, 69 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 100, item = 1684 },  -- gold key
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Bugbear Watchman',
            ids    = { 11, 12, 72, 73, 111, 121, 122 },
            levels = {
                [71] = { acc = 299, eva = 280, agi = 63, int = 51, mnd = 67, chr = 63 },
                [76] = { acc = 327, eva = 307, agi = 67, int = 54, mnd = 72, chr = 66 },
            },
            spawn_levels = { [11] = { 71, 71 }, [12] = { 71, 71 }, [72] = { 71, 71 }, [73] = { 71, 71 },
                             [111] = { 76, 76 }, [121] = { 76, 76 }, [122] = { 76, 76 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1781 },  -- sylvan stone
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 100, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 50, item = 1063 },  -- newton coffer key
                { rate = 10, item = 1654 },  -- igneous rock
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Workman',
            ids    = { 16, 23, 32, 46, 54, 60, 63, 78, 99 },
            levels = {
                [66] = { acc = 267, eva = 242, agi = 63, int = 70, mnd = 70, chr = 62 },
                [67] = { acc = 272, eva = 246, agi = 63, int = 71, mnd = 71, chr = 65 },
                [68] = { acc = 277, eva = 252, agi = 64, int = 71, mnd = 71, chr = 65 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 20 },
            drops  = {
                { rate = 50, item = 1684 },  -- gold key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Tankman',
            ids    = { 19, 43, 44, 58, 64, 84, 97 },
            levels = {
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1684 },  -- gold key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 10, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Draftsman',
            ids    = { 22, 45, 56, 57, 61, 81, 90, 98, 105 },
            levels = {
                [66] = { acc = 271, eva = 235, agi = 75, int = 80, mnd = 58, chr = 62 },
                [67] = { acc = 275, eva = 239, agi = 75, int = 83, mnd = 59, chr = 65 },
                [68] = { acc = 280, eva = 244, agi = 75, int = 83, mnd = 60, chr = 65 },
                [69] = { acc = 286, eva = 249, agi = 77, int = 84, mnd = 60, chr = 65 },
            },
            spawn_levels = { [22] = { 66, 68 }, [45] = { 66, 68 }, [56] = { 66, 68 }, [57] = { 66, 68 },
                             [61] = { 66, 68 }, [81] = { 66, 68 }, [90] = { 66, 68 }, [98] = { 66, 68 },
                             [105] = { 68, 69 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
                { rate = 10, item = 4769 },  -- scroll of stone iii
                { rate = 10, item = 4798 },  -- scroll of stonega ii
                { rate = 10, item = 4799 },  -- scroll of stonega iii
                { rate = 10, item = 4818 },  -- scroll of quake
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Dire Bat',
            ids    = { 25, 26, 59 },
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 2,
        },
        {
            name   = 'Moblin Yardman',
            ids    = { 33, 42, 55, 80, 88, 100 },
            levels = {
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47 },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48 },
                [68] = { acc = 286, eva = 318, agi = 81, int = 71, mnd = 48, chr = 48 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 50, item = 1684 },  -- gold key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 10, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Succubus Bats',
            ids    = { 40, 41, 62, 65, 89, 93 },
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
            },
            spawn_levels = { [65] = { 64, 65 }, [89] = { 64, 65 }, [93] = { 64, 65 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 2,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 66, 94, 194 },
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
            },
            spawn_levels = { [66] = { 70, 70 }, [94] = { 70, 70 }, [194] = { 80, 80 } },
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
            name   = 'Earth Elemental',
            ids    = { 67, 95, 195 },
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
            },
            spawn_levels = { [67] = { 70, 70 }, [95] = { 70, 70 }, [195] = { 80, 80 } },
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
            name   = 'Goblin Headman',
            ids    = { 112, 124, 155, 160, 172 },
            levels = {
                [75] = { acc = 319, eva = 293, agi = 63, int = 65, mnd = 65, chr = 91 },
                [76] = { acc = 325, eva = 298, agi = 64, int = 66, mnd = 66, chr = 92 },
                [77] = { acc = 330, eva = 303, agi = 65, int = 66, mnd = 66, chr = 93 },
                [78] = { acc = 335, eva = 308, agi = 65, int = 68, mnd = 68, chr = 93 },
                [79] = { acc = 341, eva = 314, agi = 66, int = 69, mnd = 69, chr = 96 },
            },
            spawn_levels = { [112] = { 75, 77 }, [124] = { 75, 77 }, [155] = { 75, 77 }, [160] = { 76, 79 },
                             [172] = { 76, 79 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 25 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 100, item = 947 },  -- jar of firesand
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblins Bat',
            ids    = { 113, 125, 156, 161, 173 },
            levels = {
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Nightmare Bats',
            ids    = { 114, 137, 138 },
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
            },
            spawn_levels = { [114] = { 72, 73 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 1063 },  -- newton coffer key
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 2,
        },
        {
            name   = 'Goblin Junkman',
            ids    = { 115, 118, 133, 153, 159 },
            levels = {
                [75] = { acc = 319, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 325, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 330, eva = 313, agi = 85, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 335, eva = 318, agi = 85, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 341, eva = 324, agi = 87, int = 61, mnd = 61, chr = 69 },
            },
            spawn_levels = { [115] = { 75, 77 }, [118] = { 75, 77 }, [133] = { 75, 77 }, [153] = { 75, 77 },
                             [159] = { 76, 79 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 100, item = 947 },  -- jar of firesand
                { rate = 50, item = 1063 },  -- newton coffer key
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Aidman',
            ids    = { 116, 127, 130, 162, 169, 182, 190, 191 },
            levels = {
                [75] = { acc = 309, eva = 273, agi = 70, int = 65, mnd = 91, chr = 77 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 66, mnd = 92, chr = 80 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 66, mnd = 93, chr = 80 },
                [78] = { acc = 325, eva = 288, agi = 73, int = 68, mnd = 93, chr = 80 },
                [79] = { acc = 331, eva = 293, agi = 74, int = 69, mnd = 96, chr = 82 },
            },
            spawn_levels = { [116] = { 75, 77 }, [127] = { 75, 77 }, [130] = { 75, 77 }, [162] = { 75, 77 },
                             [169] = { 75, 77 }, [182] = { 78, 79 }, [190] = { 78, 79 }, [191] = { 78, 79 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 1063 },  -- newton coffer key
                { rate = 150, item = 1651 },  -- spool of moblin thread
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Purgatory Bat',
            ids    = { 117, 134, 135 },
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
            },
            spawn_levels = { [117] = { 73, 74 }, [135] = { 73, 74 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 1063 },  -- newton coffer key
                { rate = 50, item = 930 },  -- vial of beastman blood
            },
            links  = 2,
        },
        {
            name   = 'Moblin Topsman',
            ids    = { 119, 167, 171, 185, 188, 189 },
            levels = {
                [75] = { acc = 315, eva = 288, agi = 70, int = 77, mnd = 77, chr = 70 },
                [76] = { acc = 321, eva = 293, agi = 71, int = 80, mnd = 80, chr = 72 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 80, mnd = 80, chr = 72 },
                [78] = { acc = 331, eva = 303, agi = 73, int = 80, mnd = 80, chr = 72 },
                [79] = { acc = 338, eva = 309, agi = 74, int = 82, mnd = 82, chr = 75 },
            },
            spawn_levels = { [119] = { 75, 77 }, [167] = { 76, 79 }, [171] = { 76, 79 }, [185] = { 76, 79 },
                             [188] = { 76, 79 }, [189] = { 76, 79 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 150, item = 1651 },  -- spool of moblin thread
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Bugbear Deathsman',
            ids    = { 120, 126, 157, 165, 168 },
            levels = {
                [74] = { acc = 316, eva = 297, agi = 66, int = 52, mnd = 70, chr = 64 },
                [75] = { acc = 322, eva = 302, agi = 67, int = 52, mnd = 70, chr = 65 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1781 },  -- sylvan stone
                { rate = 50, item = 1624 },  -- bugbear mask
                { rate = 100, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 50, item = 1063 },  -- newton coffer key
                { rate = 10, item = 1654 },  -- igneous rock
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Marksman',
            ids    = { 123, 158, 175, 177 },
            levels = {
                [75] = { acc = 363, eva = 286, agi = 96, int = 65, mnd = 70, chr = 65 },
                [76] = { acc = 369, eva = 291, agi = 97, int = 66, mnd = 72, chr = 66 },
                [77] = { acc = 374, eva = 296, agi = 98, int = 66, mnd = 72, chr = 66 },
                [78] = { acc = 379, eva = 301, agi = 98, int = 68, mnd = 72, chr = 68 },
                [79] = { acc = 386, eva = 306, agi = 101, int = 69, mnd = 75, chr = 69 },
            },
            spawn_levels = { [123] = { 75, 77 }, [158] = { 75, 77 }, [175] = { 76, 79 }, [177] = { 76, 79 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 100, item = 947 },  -- jar of firesand
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Engineman',
            ids    = { 128, 131, 136, 163, 170, 178, 192, 193 },
            levels = {
                [75] = { acc = 319, eva = 279, agi = 82, int = 91, mnd = 65, chr = 70 },
                [76] = { acc = 325, eva = 285, agi = 85, int = 92, mnd = 66, chr = 72 },
                [77] = { acc = 330, eva = 289, agi = 85, int = 93, mnd = 66, chr = 72 },
                [78] = { acc = 335, eva = 294, agi = 85, int = 93, mnd = 68, chr = 72 },
                [79] = { acc = 341, eva = 299, agi = 87, int = 96, mnd = 69, chr = 75 },
            },
            spawn_levels = { [128] = { 75, 77 }, [131] = { 75, 77 }, [136] = { 75, 77 }, [163] = { 76, 79 },
                             [170] = { 76, 79 }, [178] = { 76, 79 }, [192] = { 76, 79 }, [193] = { 76, 79 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 947 },  -- jar of firesand
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
                { rate = 10, item = 4764 },  -- scroll of aero iii
                { rate = 10, item = 4765 },  -- scroll of aero iv
                { rate = 10, item = 4793 },  -- scroll of aeroga ii
                { rate = 10, item = 4794 },  -- scroll of aeroga iii
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Roadman',
            ids    = { 129, 154, 176, 183, 184, 186, 187 },
            levels = {
                [75] = { acc = 326, eva = 370, agi = 88, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 331, eva = 375, agi = 89, int = 80, mnd = 54, chr = 54 },
                [77] = { acc = 337, eva = 381, agi = 91, int = 80, mnd = 54, chr = 54 },
                [78] = { acc = 342, eva = 386, agi = 91, int = 80, mnd = 54, chr = 54 },
                [79] = { acc = 348, eva = 392, agi = 93, int = 82, mnd = 55, chr = 55 },
            },
            spawn_levels = { [129] = { 75, 77 }, [154] = { 75, 77 }, [176] = { 78, 79 }, [183] = { 78, 79 },
                             [184] = { 78, 79 }, [186] = { 78, 79 }, [187] = { 78, 79 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 150, item = 947 },  -- jar of firesand
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 17385 },  -- glass fiber fishing rod
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Hangman',
            ids    = { 132, 164, 166, 174 },
            levels = {
                [75] = { acc = 319, eva = 299, agi = 75, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 80, mnd = 54, chr = 54 },
                [77] = { acc = 330, eva = 309, agi = 77, int = 80, mnd = 54, chr = 54 },
                [78] = { acc = 335, eva = 314, agi = 77, int = 80, mnd = 54, chr = 54 },
                [79] = { acc = 341, eva = 321, agi = 80, int = 82, mnd = 55, chr = 55 },
            },
            spawn_levels = { [132] = { 75, 77 }, [164] = { 76, 79 }, [166] = { 76, 79 }, [174] = { 76, 79 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 100, item = 947 },  -- jar of firesand
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Swordsman',
            ids    = { 139, 146, 179 },
            levels = {
                [78] = { acc = 335, eva = 318, agi = 85, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 1000, item = 1781 },  -- sylvan stone
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Aidman',
            ids    = { 140, 143, 147, 150, 180 },
            levels = {
                [75] = { acc = 309, eva = 273, agi = 70, int = 65, mnd = 91, chr = 77 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 66, mnd = 92, chr = 80 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 66, mnd = 93, chr = 80 },
                [78] = { acc = 325, eva = 288, agi = 73, int = 68, mnd = 93, chr = 80 },
                [79] = { acc = 331, eva = 293, agi = 74, int = 69, mnd = 96, chr = 82 },
            },
            spawn_levels = { [140] = { 75, 77 }, [143] = { 75, 77 }, [147] = { 75, 77 }, [150] = { 75, 77 },
                             [180] = { 78, 79 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 1063 },  -- newton coffer key
                { rate = 150, item = 1651 },  -- spool of moblin thread
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Engineman',
            ids    = { 141, 144, 148, 151 },
            levels = {
                [75] = { acc = 319, eva = 279, agi = 82, int = 91, mnd = 65, chr = 70 },
                [76] = { acc = 325, eva = 285, agi = 85, int = 92, mnd = 66, chr = 72 },
                [77] = { acc = 330, eva = 289, agi = 85, int = 93, mnd = 66, chr = 72 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 947 },  -- jar of firesand
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
                { rate = 10, item = 4764 },  -- scroll of aero iii
                { rate = 10, item = 4765 },  -- scroll of aero iv
                { rate = 10, item = 4793 },  -- scroll of aeroga ii
                { rate = 10, item = 4794 },  -- scroll of aeroga iii
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Swashstox Beadblinker',
            ids    = { 142, 149 },
            nm     = true,
            levels = {
                [80] = { acc = 346, eva = 329, agi = 87, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 100, item = 1781 },  -- sylvan stone
                { rate = 150, item = 15371 },  -- darksteel codpiece
                { rate = 100, item = 13172 },  -- pachamacs collar
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Groundman',
            ids    = { 145, 152 },
            levels = {
                [77] = { acc = 326, eva = 297, agi = 71, int = 80, mnd = 80, chr = 72 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 150, item = 1729 },  -- moblin hotrok
                { rate = 100, item = 1625 },  -- moblin helm
                { rate = 50, item = 1632 },  -- moblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Moblin Topsman',
            ids    = { 181 },
            levels = {
                [76] = { acc = 321, eva = 293, agi = 71, int = 80, mnd = 80, chr = 72 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 80, mnd = 80, chr = 72 },
                [78] = { acc = 331, eva = 303, agi = 73, int = 80, mnd = 80, chr = 72 },
                [79] = { acc = 338, eva = 309, agi = 74, int = 82, mnd = 82, chr = 75 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 150, item = 1651 },  -- spool of moblin thread
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mimic',
            ids    = { 196 },
            nm     = true,
            levels = {
                [70] = { acc = 289, eva = 278, agi = 81, int = 63, mnd = 63, chr = 53 },
            },
            drops  = {
                { rate = 1000, item = 1063 },  -- newton coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Moblin Scalpelman',
            ids    = { 197, 198, 199, 200 },
            levels = {
                [78] = { acc = 329, eva = 303, agi = 73, int = 76, mnd = 84, chr = 75 },
                [79] = { acc = 335, eva = 309, agi = 74, int = 78, mnd = 87, chr = 77 },
                [80] = { acc = 340, eva = 314, agi = 74, int = 78, mnd = 87, chr = 77 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Collector',
            ids    = { 201 },
            nm     = true,
            levels = {
                [83] = { acc = 361, eva = 407, agi = 83, int = 76, mnd = 86, chr = 76 },
                [84] = { acc = 368, eva = 413, agi = 84, int = 77, mnd = 87, chr = 78 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'blind', 'terror',
                       'plague' },
            drops  = {
                { rate = 100, item = 14889 },  -- barbarian mittens
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Bugbear Matman',
            ids    = { 202 },
            nm     = true,
            levels = {
                [78] = { acc = 337, eva = 322, agi = 76, int = 56, mnd = 68, chr = 68 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = 8, poison = -1, light_sleep = -3,
                       dark_sleep = 10, blind = 2, stun = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 150, item = 15349 },  -- rutter sabatons
                { rate = 100, item = 1781 },  -- sylvan stone
                { rate = 50, item = 1650 },  -- chunk of kopparnickel ore
                { rate = 10, item = 1624 },  -- bugbear mask
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Awoken Andhrimnir',
            ids    = { 203 },
            nm     = true,
            levels = {
                [119] = { acc = 484, eva = 499, agi = 127, int = 140, mnd = 101, chr = 97 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
        },
    },
    by_name = {},
}
