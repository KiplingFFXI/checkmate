-- Attohwa Chasm (zone 7).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Alastor Antlion', 'Ambusher Antlion', 'Burrow Antlion', 'Cave Antlion', 'Executioner Antlion',
                'Feeler Antlion', 'Hunter Antlion', 'Lioumere', 'Pit Antlion', 'Tracer Antlion', 'Tracker Antlion',
                'Trench Antlion' },
        [2] = { 'Gallinipper', 'Monarch Ogrefly', 'Ogrefly' },
        [3] = { 'Goblin Furrier', 'Goblin Pathfinder', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                'Goblin Shaman', 'Goblin Smithy', 'Goblin Trader' },
        [4] = { 'Doom Scorpion' },
        [5] = { 'Bane Lizard', 'Chasm Lizard', 'Sand Lizard' },
        [6] = { 'Alastor Antlion', 'Ambusher Antlion', 'Burrow Antlion', 'Cave Antlion', 'Executioner Antlion',
                'Feeler Antlion', 'Hunter Antlion', 'Pit Antlion', 'Tracer Antlion', 'Tracker Antlion',
                'Trench Antlion' },
        [7] = { 'Flesh Eater' },
        [8] = { 'Muut', 'Xolotl' },
        [9] = { 'Citipati', 'Muut' },
        [10] = { 'Alastor Antlion', 'Ambusher Antlion', 'Burrow Antlion', 'Cave Antlion', 'Executioner Antlion',
                 'Hunter Antlion', 'Lioumere', 'Pit Antlion', 'Tracer Antlion', 'Tracker Antlion',
                 'Trench Antlion' },
        [11] = { 'Ambusher Antlion', 'Burrow Antlion', 'Cave Antlion', 'Executioner Antlion', 'Feeler Antlion',
                 'Hunter Antlion', 'Lioumere', 'Pit Antlion', 'Tracer Antlion', 'Tracker Antlion',
                 'Trench Antlion' },
        [12] = { 'Alastor Antlion', 'Burrow Antlion', 'Cave Antlion', 'Executioner Antlion', 'Feeler Antlion',
                 'Hunter Antlion', 'Lioumere', 'Pit Antlion', 'Tracer Antlion', 'Tracker Antlion',
                 'Trench Antlion' },
        [13] = { 'Citipati', 'Xolotl' },
    },
    monsters = {
        {
            name   = 'Tracer Antlion',
            ids    = { 1, 2, 7, 12, 13, 22, 36, 37, 40, 58, 59, 68, 75, 81, 82 },
            levels = {
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 133, agi = 44, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 10, item = 1616 },  -- antlion jaw
            },
            links  = 1,
        },
        {
            name   = 'Gallinipper AC',
            ids    = { 3, 4, 10, 11, 19, 20, 23, 28, 31, 32, 42, 47, 53, 55, 57, 64, 71, 72, 87, 89, 90 },
            levels = {
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
            },
            spawn_levels = { [3] = { 36, 38 }, [4] = { 36, 38 }, [10] = { 36, 38 }, [11] = { 36, 38 },
                             [19] = { 36, 38 }, [20] = { 36, 38 }, [23] = { 36, 38 }, [28] = { 36, 38 },
                             [31] = { 36, 38 }, [32] = { 36, 38 }, [42] = { 37, 39 }, [47] = { 37, 39 },
                             [53] = { 37, 39 }, [55] = { 37, 39 }, [57] = { 37, 39 }, [64] = { 37, 39 },
                             [71] = { 37, 39 }, [72] = { 37, 39 }, [87] = { 37, 39 }, [89] = { 37, 39 },
                             [90] = { 37, 39 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 100, item = 1683 },  -- piece of attohwa ginseng
            },
            links  = 2,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 5, 25, 33, 51, 56, 83 },
            levels = {
                [36] = { acc = 134, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 137, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 140, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 144, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
            },
            spawn_levels = { [5] = { 37, 39 }, [25] = { 36, 38 }, [33] = { 37, 39 }, [51] = { 37, 39 },
                             [56] = { 37, 39 }, [83] = { 37, 39 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 6, 14, 30, 65, 66, 67, 84 },
            levels = {
                [35] = { acc = 130, eva = 110, agi = 42, int = 47, mnd = 33, chr = 35 },
                [36] = { acc = 134, eva = 113, agi = 45, int = 48, mnd = 34, chr = 37 },
                [37] = { acc = 137, eva = 116, agi = 45, int = 49, mnd = 34, chr = 37 },
                [38] = { acc = 140, eva = 118, agi = 45, int = 49, mnd = 36, chr = 37 },
                [39] = { acc = 144, eva = 122, agi = 47, int = 52, mnd = 37, chr = 40 },
            },
            spawn_levels = { [6] = { 35, 37 }, [14] = { 35, 37 }, [30] = { 35, 37 }, [65] = { 35, 37 },
                             [66] = { 35, 37 }, [67] = { 35, 37 }, [84] = { 37, 39 } },
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
            links  = 3,
        },
        {
            name   = 'Doom Scorpion',
            ids    = { 8, 9, 26, 27, 41, 45, 46, 114, 115, 116 },
            levels = {
                [41] = { acc = 148, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 154, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 158, eva = 149, agi = 49, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 15, 18, 24, 29, 60, 62 },
            levels = {
                [35] = { acc = 150, eva = 114, agi = 50, int = 33, mnd = 35, chr = 33 },
                [36] = { acc = 153, eva = 116, agi = 51, int = 34, mnd = 37, chr = 34 },
                [37] = { acc = 157, eva = 120, agi = 52, int = 34, mnd = 37, chr = 34 },
            },
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
            links  = 3,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 16, 38, 69 },
            levels = {
                [36] = { acc = 134, eva = 119, agi = 33, int = 34, mnd = 34, chr = 48 },
                [37] = { acc = 137, eva = 122, agi = 34, int = 34, mnd = 34, chr = 49 },
                [38] = { acc = 140, eva = 125, agi = 34, int = 36, mnd = 36, chr = 49 },
                [39] = { acc = 144, eva = 128, agi = 35, int = 37, mnd = 37, chr = 52 },
            },
            spawn_levels = { [16] = { 36, 38 }, [38] = { 38, 39 }, [69] = { 38, 39 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblins Gallinipper',
            ids    = { 17, 39, 70 },
            levels = {
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 31 },
                [32] = { acc = 117, eva = 111, agi = 40, int = 26, mnd = 26, chr = 31 },
                [33] = { acc = 121, eva = 114, agi = 40, int = 29, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            links  = 2,
        },
        {
            name   = 'Attohwa Coeurl',
            ids    = { 21, 34, 35, 43, 44, 73, 76, 77, 79, 88 },
            levels = {
                [37] = { acc = 136, eva = 126, agi = 42, int = 34, mnd = 29, chr = 34 },
                [38] = { acc = 139, eva = 129, agi = 42, int = 34, mnd = 30, chr = 36 },
                [39] = { acc = 143, eva = 133, agi = 44, int = 35, mnd = 30, chr = 37 },
            },
            spawn_levels = { [44] = { 38, 39 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 927 },  -- coeurl whisker
                { rate = 100, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 863 },  -- coeurl hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Chasm Lizard',
            ids    = { 48, 50, 52, 54, 61, 63, 80, 85 },
            levels = {
                [40] = { acc = 146, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 151, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 154, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
            },
            links  = 5,
        },
        {
            name   = 'Burrow Antlion',
            ids    = { 49, 78, 86, 96, 103, 106 },
            levels = {
                [41] = { acc = 149, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 149, agi = 49, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1616 },  -- antlion jaw
                { rate = 50, item = 1649 },  -- scarlet stone
            },
            aggro  = true,
            ambush = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Goblin Robber',
            ids    = { 91, 98 },
            levels = {
                [42] = { acc = 158, eva = 177, agi = 53, int = 47, mnd = 32, chr = 32 },
                [43] = { acc = 162, eva = 180, agi = 53, int = 47, mnd = 32, chr = 32 },
                [44] = { acc = 166, eva = 184, agi = 55, int = 49, mnd = 33, chr = 33 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblin Trader',
            ids    = { 92, 109 },
            levels = {
                [42] = { acc = 155, eva = 138, agi = 38, int = 39, mnd = 39, chr = 54 },
                [43] = { acc = 158, eva = 141, agi = 38, int = 39, mnd = 39, chr = 56 },
                [44] = { acc = 162, eva = 144, agi = 39, int = 40, mnd = 40, chr = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 1, item = 828 },  -- square of velvet cloth
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblins Ogrefly',
            ids    = { 93, 110 },
            levels = {
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            links  = 2,
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 94, 99 },
            levels = {
                [42] = { acc = 155, eva = 141, agi = 45, int = 47, mnd = 32, chr = 32 },
                [43] = { acc = 158, eva = 144, agi = 45, int = 47, mnd = 32, chr = 32 },
                [44] = { acc = 162, eva = 149, agi = 48, int = 49, mnd = 33, chr = 33 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Master Coeurl',
            ids    = { 95, 102, 128, 130, 140, 142 },
            levels = {
                [46] = { acc = 168, eva = 156, agi = 51, int = 41, mnd = 35, chr = 42 },
                [47] = { acc = 171, eva = 159, agi = 52, int = 41, mnd = 35, chr = 43 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 41, mnd = 36, chr = 44 },
            },
            spawn_levels = { [95] = { 46, 47 }, [102] = { 46, 47 }, [128] = { 47, 48 }, [130] = { 47, 48 },
                             [140] = { 47, 48 }, [142] = { 47, 48 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 863 },  -- coeurl hide
                { rate = 150, item = 927 },  -- coeurl whisker
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Poacher',
            ids    = { 97, 108 },
            levels = {
                [42] = { acc = 174, eva = 134, agi = 57, int = 39, mnd = 42, chr = 39 },
                [43] = { acc = 177, eva = 138, agi = 59, int = 39, mnd = 42, chr = 39 },
                [44] = { acc = 182, eva = 141, agi = 60, int = 40, mnd = 45, chr = 40 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Ogrefly',
            ids    = { 100, 101, 105, 107, 112, 113, 119, 120, 127, 129, 131, 135, 139, 141 },
            levels = {
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43 },
            },
            spawn_levels = { [100] = { 44, 46 }, [101] = { 44, 46 }, [105] = { 44, 46 }, [107] = { 44, 46 },
                             [112] = { 44, 46 }, [113] = { 44, 46 }, [119] = { 45, 47 }, [120] = { 45, 47 },
                             [127] = { 45, 47 }, [129] = { 45, 47 }, [131] = { 46, 47 }, [135] = { 45, 47 },
                             [139] = { 45, 47 }, [141] = { 46, 47 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 100, item = 1683 },  -- piece of attohwa ginseng
            },
            links  = 2,
        },
        {
            name   = 'Hunter Antlion',
            ids    = { 104, 111, 124, 125, 133, 134 },
            levels = {
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 37, chr = 42 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1616 },  -- antlion jaw
            },
            links  = 1,
        },
        {
            name   = 'Bane Lizard',
            ids    = { 117, 118, 121, 122, 126, 137, 138 },
            levels = {
                [47] = { acc = 171, eva = 159, agi = 52, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 38, mnd = 38, chr = 44 },
                [49] = { acc = 178, eva = 165, agi = 53, int = 40, mnd = 40, chr = 44 },
            },
            spawn_levels = { [117] = { 47, 48 }, [118] = { 47, 48 }, [121] = { 47, 48 }, [122] = { 47, 48 },
                             [126] = { 47, 48 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
            },
            links  = 5,
        },
        {
            name   = 'Pit Antlion',
            ids    = { 123, 132, 136 },
            levels = {
                [49] = { acc = 176, eva = 165, agi = 53, int = 40, mnd = 40, chr = 44 },
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 100, item = 1616 },  -- antlion jaw
                { rate = 50, item = 1649 },  -- scarlet stone
            },
            aggro  = true,
            ambush = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Lioumere',
            ids    = { 143 },
            nm     = true,
            levels = {
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            aggro  = true,
            any_level = true,
            ambush = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Hecteyes AC',
            ids    = { 144, 145, 146, 147, 149, 150, 154, 155, 156, 157, 170, 171, 173, 176, 178, 179, 187, 188,
                       191, 192, 197, 198, 203, 204, 210, 211, 212, 213 },
            levels = {
                [35] = { acc = 127, eva = 118, agi = 39, int = 50, mnd = 33, chr = 35 },
                [36] = { acc = 132, eva = 122, agi = 42, int = 51, mnd = 34, chr = 37 },
                [37] = { acc = 135, eva = 125, agi = 42, int = 52, mnd = 34, chr = 37 },
                [38] = { acc = 138, eva = 127, agi = 42, int = 52, mnd = 36, chr = 37 },
                [39] = { acc = 142, eva = 131, agi = 44, int = 55, mnd = 37, chr = 40 },
            },
            spawn_levels = { [144] = { 35, 37 }, [145] = { 35, 37 }, [146] = { 35, 37 }, [147] = { 35, 37 },
                             [149] = { 35, 37 }, [150] = { 35, 37 }, [154] = { 35, 37 }, [155] = { 35, 37 },
                             [156] = { 35, 37 }, [157] = { 36, 37 }, [170] = { 35, 37 }, [171] = { 35, 37 },
                             [173] = { 35, 37 }, [176] = { 35, 37 }, [178] = { 35, 37 }, [179] = { 35, 37 },
                             [187] = { 36, 38 }, [188] = { 36, 38 }, [191] = { 36, 38 }, [192] = { 36, 38 },
                             [197] = { 36, 38 }, [198] = { 36, 39 }, [203] = { 36, 39 }, [204] = { 36, 39 },
                             [210] = { 36, 39 }, [211] = { 36, 39 }, [212] = { 36, 39 }, [213] = { 36, 39 } },
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
            name   = 'Flesh Eater AC',
            ids    = { 148, 151, 152, 158, 160, 161, 163, 164, 165, 167, 168, 174, 175, 177, 182, 183, 185, 186,
                       193, 194, 195, 196, 199, 201, 202, 205, 206, 208, 214, 215, 216, 217 },
            levels = {
                [34] = { acc = 124, eva = 111, agi = 37, int = 46, mnd = 34, chr = 33 },
                [35] = { acc = 127, eva = 113, agi = 37, int = 47, mnd = 35, chr = 34 },
                [36] = { acc = 131, eva = 117, agi = 39, int = 49, mnd = 37, chr = 35 },
                [37] = { acc = 134, eva = 120, agi = 39, int = 50, mnd = 37, chr = 35 },
            },
            spawn_levels = { [148] = { 34, 35 }, [151] = { 34, 35 }, [152] = { 34, 35 }, [158] = { 34, 35 },
                             [160] = { 34, 35 }, [161] = { 34, 35 }, [163] = { 34, 35 }, [164] = { 34, 35 },
                             [165] = { 34, 35 }, [167] = { 34, 35 }, [168] = { 34, 35 }, [174] = { 34, 35 },
                             [175] = { 34, 35 }, [177] = { 34, 35 }, [182] = { 34, 35 }, [183] = { 34, 35 },
                             [185] = { 34, 35 }, [186] = { 35, 36 }, [193] = { 34, 36 }, [194] = { 35, 36 },
                             [195] = { 35, 36 }, [196] = { 35, 36 }, [199] = { 35, 36 }, [201] = { 34, 36 },
                             [202] = { 34, 36 }, [205] = { 34, 36 }, [206] = { 34, 36 }, [208] = { 34, 36 },
                             [214] = { 35, 36 }, [215] = { 36, 37 }, [216] = { 36, 37 }, [217] = { 36, 37 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 50, item = 1654 },  -- igneous rock
                { rate = 100, item = 640 },  -- chunk of copper ore
            },
            links  = 7,
        },
        {
            name   = 'Will-o-the-Wykes',
            ids    = { 153, 159, 172, 189, 190, 200 },
            levels = {
                [40] = { acc = 146, eva = 136, agi = 44, int = 30, mnd = 32, chr = 40 },
                [41] = { acc = 151, eva = 140, agi = 47, int = 33, mnd = 35, chr = 42 },
                [42] = { acc = 154, eva = 142, agi = 47, int = 33, mnd = 35, chr = 42 },
                [43] = { acc = 157, eva = 145, agi = 47, int = 33, mnd = 35, chr = 42 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 928 },  -- pinch of bomb ash
                { rate = 150, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 162, 180, 181, 333, 347, 348 },
            levels = {
                [40] = { acc = 144, eva = 130, agi = 42, int = 49, mnd = 39, chr = 40 },
                [41] = { acc = 148, eva = 134, agi = 44, int = 52, mnd = 42, chr = 42 },
                [42] = { acc = 151, eva = 136, agi = 44, int = 52, mnd = 42, chr = 42 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
            },
            spawn_levels = { [162] = { 40, 42 }, [180] = { 40, 42 }, [181] = { 40, 42 }, [333] = { 40, 42 },
                             [347] = { 75, 76 }, [348] = { 75, 76 } },
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
            name   = 'Air Elemental',
            ids    = { 166, 169, 184, 207, 209, 218, 345, 346 },
            levels = {
                [40] = { acc = 144, eva = 130, agi = 42, int = 49, mnd = 39, chr = 40 },
                [41] = { acc = 148, eva = 134, agi = 44, int = 52, mnd = 42, chr = 42 },
                [42] = { acc = 151, eva = 136, agi = 44, int = 52, mnd = 42, chr = 42 },
                [43] = { acc = 154, eva = 139, agi = 44, int = 53, mnd = 42, chr = 42 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
            },
            spawn_levels = { [166] = { 40, 42 }, [169] = { 40, 42 }, [184] = { 41, 43 }, [207] = { 41, 43 },
                             [209] = { 41, 43 }, [218] = { 41, 43 }, [345] = { 75, 76 }, [346] = { 75, 76 } },
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
            name   = 'Tulwar Scorpion',
            ids    = { 219, 220, 223, 224, 226, 227 },
            levels = {
                [58] = { acc = 222, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 228, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sand Lizard',
            ids    = { 221, 222, 231, 232, 235, 236, 237, 245, 246, 248, 249, 276, 278, 281, 290, 291, 292, 301,
                       303, 311, 312, 316, 317, 321, 330 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
            },
            spawn_levels = { [221] = { 65, 67 }, [222] = { 65, 67 }, [231] = { 65, 67 }, [232] = { 65, 67 },
                             [235] = { 65, 67 }, [236] = { 65, 67 }, [237] = { 65, 67 }, [245] = { 65, 67 },
                             [246] = { 65, 67 }, [248] = { 66, 68 }, [249] = { 66, 68 }, [276] = { 66, 68 },
                             [278] = { 66, 68 }, [281] = { 66, 68 }, [290] = { 66, 68 }, [291] = { 66, 68 },
                             [292] = { 66, 68 }, [301] = { 66, 68 }, [303] = { 66, 68 }, [311] = { 66, 68 },
                             [312] = { 66, 68 }, [316] = { 66, 68 }, [317] = { 66, 68 }, [321] = { 66, 68 },
                             [330] = { 66, 68 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
            },
            links  = 5,
        },
        {
            name   = 'Monarch Ogrefly',
            ids    = { 225, 228, 230, 238, 239, 255, 256, 258, 266, 271, 282, 284, 288, 289, 297, 299, 305, 307,
                       308, 309, 310, 318, 319, 320, 322 },
            levels = {
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
            },
            spawn_levels = { [225] = { 65, 66 }, [228] = { 65, 66 }, [230] = { 65, 66 }, [238] = { 65, 66 },
                             [239] = { 65, 66 }, [255] = { 65, 66 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 100, item = 1683 },  -- piece of attohwa ginseng
            },
            links  = 2,
        },
        {
            name   = 'Tracker Antlion',
            ids    = { 233, 240, 241, 242, 243, 244, 252, 253, 254, 275, 293, 294, 300, 302, 304, 306, 314, 315,
                       331, 332, 338 },
            levels = {
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
            },
            spawn_levels = { [233] = { 71, 73 }, [240] = { 70, 72 }, [241] = { 70, 72 }, [242] = { 70, 72 },
                             [243] = { 70, 72 }, [244] = { 70, 72 }, [252] = { 70, 72 }, [253] = { 70, 72 },
                             [254] = { 71, 73 }, [275] = { 71, 73 }, [293] = { 71, 72 }, [294] = { 71, 73 },
                             [300] = { 70, 72 }, [302] = { 70, 72 }, [304] = { 70, 72 }, [306] = { 71, 73 },
                             [314] = { 71, 72 }, [315] = { 70, 71 }, [331] = { 70, 72 }, [332] = { 70, 72 },
                             [338] = { 70, 72 } },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1616 },  -- antlion jaw
                { rate = 10, item = 1649 },  -- scarlet stone
            },
            links  = 1,
        },
        {
            name   = 'Trench Antlion',
            ids    = { 234, 247, 260, 283, 295, 298 },
            levels = {
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1649 },  -- scarlet stone
                { rate = 150, item = 1864 },  -- high-quality antlion jaw
                { rate = 100, item = 1616 },  -- antlion jaw
            },
            aggro  = true,
            ambush = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Cutlass Scorpion AC',
            ids    = { 250, 251, 261, 262, 265, 269, 286, 287, 296, 313, 323, 324, 325, 326, 334 },
            levels = {
                [67] = { acc = 269, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 275, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 280, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Tomb Mage',
            ids    = { 257, 280, 336 },
            levels = {
                [70] = { acc = 289, eva = 252, agi = 73, int = 85, mnd = 57, chr = 67 },
                [71] = { acc = 296, eva = 257, agi = 75, int = 87, mnd = 60, chr = 67 },
                [72] = { acc = 301, eva = 262, agi = 75, int = 87, mnd = 60, chr = 67 },
                [73] = { acc = 306, eva = 267, agi = 76, int = 89, mnd = 60, chr = 70 },
            },
            spawn_levels = { [257] = { 70, 72 }, [280] = { 72, 73 }, [336] = { 72, 73 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tomb Warrior',
            ids    = { 259, 279, 335 },
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 55, mnd = 52, chr = 63 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 55, mnd = 52, chr = 63 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 58, mnd = 54, chr = 64 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Mummy',
            ids    = { 263, 272, 277 },
            levels = {
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 46, chr = 55 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 46, chr = 55 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 46, chr = 56 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lich',
            ids    = { 264, 268, 285 },
            levels = {
                [62] = { acc = 247, eva = 213, agi = 66, int = 76, mnd = 52, chr = 60 },
                [63] = { acc = 252, eva = 217, agi = 66, int = 78, mnd = 52, chr = 60 },
                [64] = { acc = 258, eva = 223, agi = 68, int = 79, mnd = 52, chr = 62 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Corse',
            ids    = { 267, 270, 273 },
            levels = {
                [66] = { acc = 267, eva = 235, agi = 75, int = 80, mnd = 58, chr = 55 },
                [67] = { acc = 271, eva = 239, agi = 75, int = 83, mnd = 59, chr = 57 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            drops  = {
                { rate = 240, item = 880 },  -- bone chip
                { rate = 100, item = 1740 },  -- iolite
                { rate = 50, item = 1614 },  -- corse bracelet
                { rate = 10, item = 1639 },  -- corse robe
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Citipati',
            ids    = { 274 },
            nm     = true,
            levels = {
                [67] = { acc = 275, eva = 312, agi = 78, int = 75, mnd = 52, chr = 46 },
                [68] = { acc = 280, eva = 317, agi = 79, int = 75, mnd = 52, chr = 46 },
                [69] = { acc = 286, eva = 323, agi = 80, int = 76, mnd = 52, chr = 47 },
                [70] = { acc = 291, eva = 341, agi = 81, int = 77, mnd = 53, chr = 47 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 10,
                       paralyze = 2, bind = 10, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 100, item = 15374 },  -- druids slops
                { rate = 100, item = 1614 },  -- corse bracelet
                { rate = 50, item = 18001 },  -- harpe
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 8,
        },
        {
            name   = 'Xolotl',
            ids    = { 327 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 87, mnd = 60, chr = 53 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 89, mnd = 62, chr = 55 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 10,
                       paralyze = 2, bind = 10, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 240, item = 15182 },  -- zoolater hat
                { rate = 100, item = 14873 },  -- bandomusha kote
                { rate = 50, item = 18002 },  -- perseuss harpe
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 9,
        },
        {
            name   = 'Xolotls Hound Warrior',
            ids    = { 328 },
            levels = {
                [72] = { acc = 301, eva = 262, agi = 75, int = 87, mnd = 60, chr = 67 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Xolotls Sacrifice',
            ids    = { 329 },
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 55, mnd = 52, chr = 63 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Arch Corse',
            ids    = { 337, 340, 341, 342 },
            levels = {
                [75] = { acc = 314, eva = 279, agi = 82, int = 91, mnd = 65, chr = 62 },
                [76] = { acc = 321, eva = 285, agi = 85, int = 92, mnd = 66, chr = 63 },
                [77] = { acc = 326, eva = 289, agi = 85, int = 93, mnd = 66, chr = 64 },
                [78] = { acc = 331, eva = 294, agi = 85, int = 93, mnd = 68, chr = 64 },
                [79] = { acc = 337, eva = 299, agi = 87, int = 96, mnd = 69, chr = 66 },
                [80] = { acc = 342, eva = 304, agi = 87, int = 96, mnd = 69, chr = 66 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            drops  = {
                { rate = 150, item = 1740 },  -- iolite
                { rate = 100, item = 1614 },  -- corse bracelet
                { rate = 50, item = 1639 },  -- corse robe
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tiamat',
            ids    = { 339 },
            nm     = true,
            levels = {
                [95] = { acc = 500, eva = 450, agi = 107, int = 103, mnd = 65, chr = 94 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, paralyze = 11, bind = 11, poison = -2 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -50 },
            immune = { 'light_sleep', 'bind', 'paralyze', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 14869 },  -- noritsune kote
                { rate = 150, item = 15322 },  -- heralds gaiters
                { rate = 240, group = { { 1816, 7500 }, { 4486, 2500 } } },  -- one of wyrm horn, dragon heart
                { rate = 240, group = {  -- one of
                    { 903, 4500 },  -- dragon talon
                    { 1133, 4500 },  -- vial of dragon blood
                    { 4272, 1000 },  -- slice of dragon meat
                } },
                { rate = 240, group = {  -- one of
                    { 655, 1 },  -- adaman ingot
                    { 658, 1 },  -- damascus ingot
                    { 722, 1 },  -- divine log
                    { 836, 1 },  -- square of damascene cloth
                    { 837, 1 },  -- spool of malboro fiber
                    { 860, 1 },  -- behemoth hide
                    { 1110, 1 },  -- vial of black beetle blood
                    { 1311, 1 },  -- piece of oxblood
                    { 1313, 1 },  -- lock of sirens hair
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bifrons',
            ids    = { 343, 344 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 55, mnd = 58, chr = 70 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 928 },  -- pinch of bomb ash
                { rate = 150, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Cave Antlion',
            ids    = { 349, 350, 351, 352, 353 },
            levels = {
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1649 },  -- scarlet stone
                { rate = 150, item = 1864 },  -- high-quality antlion jaw
                { rate = 100, item = 1616 },  -- antlion jaw
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Feeler Antlion',
            ids    = { 354 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow',
                       'elegy', 'blind', 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound' },
            links  = 10,
        },
        {
            name   = 'Executioner Antlion',
            ids    = { 355, 356, 357, 358, 359 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            immune = { 'bind', 'gravity', 'stun', 'slow', 'elegy', 'petrify', 'plague' },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Alastor Antlion',
            ids    = { 360 },
            nm     = true,
            levels = {
                [83] = { acc = 361, eva = 316, agi = 85, int = 100, mnd = 71, chr = 77 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'paralyze', 'slow', 'elegy', 'blind',
                       'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 15350 },  -- rostrum pumps
            },
            links  = 11,
        },
        {
            name   = 'Ambusher Antlion',
            ids    = { 361 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 14467 },  -- archers jupon
                { rate = 50, item = 1616 },  -- antlion jaw
            },
            aggro  = true,
            ambush = true,
            detects = { 'sound' },
            links  = 12,
        },
        {
            name   = 'Fjalar',
            ids    = { 362 },
            nm     = true,
            levels = {},
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 6, thunder = 4, water = 6, light = 2, dark = 11,
                       paralyze = 6, bind = 6, silence = 4, slow = 6, poison = 6, light_sleep = 2, dark_sleep = 11,
                       blind = 11, stun = 2, gravity = 2 },
            magic_dmg = { all = -37.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bloody Skull',
            ids    = { 363, 364, 365 },
            nm     = true,
            levels = {},
            ranks  = { ice = 2, earth = 2, water = 2, light = -1, dark = 6, paralyze = 2, bind = 2, slow = 2,
                       poison = 2, light_sleep = -1, dark_sleep = 6, blind = 6 },
            magic_dmg = { all = -6.3 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Muut',
            ids    = { 374 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 13,
        },
        {
            name   = 'Muuts Hound Warrior',
            ids    = { 375, 377, 379, 381 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Muuts Sacrifice',
            ids    = { 376, 378, 380, 382 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
