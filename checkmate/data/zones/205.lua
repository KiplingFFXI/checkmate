-- Ifrits Cauldron (zone 205).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Ash Lizard', 'Tarasque' },
        [2] = { 'Old Opo-opo' },
        [3] = { 'Dire Bat', 'Nightmare Bats' },
        [4] = { 'Volcano Wasp' },
        [5] = { 'Foreseer Oramix', 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Mercenary', 'Goblin Shepherd' },
        [6] = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Mercenary', 'Goblin Shepherd' },
        [7] = { 'Ash Lizard', 'Salamander', 'Tarasque' },
        [8] = { 'Bomb Bastard', 'Bomb Prince', 'Bomb Princess' },
        [9] = { 'Bomb Prince', 'Bomb Princess' },
        [10] = { 'Ash Lizard', 'Salamander' },
        [11] = { 'Coca' },
    },
    monsters = {
        {
            name   = 'Salamander',
            ids    = { 1 },
            nm     = true,
            levels = {
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Magma',
            ids    = { 2 },
            nm     = true,
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 49, mnd = 52, chr = 62 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1160 },  -- frag rock
                { rate = 1000, item = 1160 },  -- frag rock
                { rate = 1000, item = 1160 },  -- frag rock
                { rate = 1000, item = 1160 },  -- frag rock
                { rate = 1000, item = 1160 },  -- frag rock
                { rate = 1000, item = 1160 },  -- frag rock
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Volcanic Gas',
            ids    = { 3, 8, 16, 21, 29, 34, 35, 38, 39, 42, 43, 46, 47, 49, 50, 55, 56, 58, 61, 65, 70, 72, 73, 74,
                       75, 76, 77, 85, 88, 89, 92, 94, 95, 96, 97, 98, 101, 102, 106, 107, 108, 109, 113, 133, 137,
                       138, 139, 140, 142, 143, 144, 146, 147, 149, 152, 155, 174, 175, 176, 178 },
            levels = {
                [62] = { acc = 247, eva = 232, agi = 66, int = 46, mnd = 49, chr = 59 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 46, mnd = 49, chr = 59 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 46, mnd = 50, chr = 60 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 49, mnd = 52, chr = 62 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 49, mnd = 52, chr = 63 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 49, mnd = 53, chr = 63 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 50, mnd = 53, chr = 64 },
            },
            spawn_levels = { [3] = { 62, 65 }, [8] = { 62, 65 }, [16] = { 62, 65 }, [21] = { 62, 65 },
                             [29] = { 62, 65 }, [34] = { 63, 66 }, [35] = { 63, 66 }, [38] = { 63, 66 },
                             [39] = { 63, 66 }, [42] = { 63, 66 }, [43] = { 63, 66 }, [46] = { 63, 66 },
                             [47] = { 63, 66 }, [49] = { 63, 66 }, [50] = { 63, 66 }, [55] = { 63, 65 },
                             [56] = { 62, 64 }, [58] = { 62, 64 }, [61] = { 63, 65 }, [65] = { 63, 65 },
                             [70] = { 63, 65 }, [72] = { 63, 65 }, [73] = { 63, 65 }, [74] = { 64, 66 },
                             [75] = { 64, 66 }, [76] = { 64, 66 }, [77] = { 64, 66 }, [85] = { 64, 66 },
                             [88] = { 64, 66 }, [89] = { 64, 66 }, [92] = { 64, 66 }, [94] = { 64, 66 },
                             [95] = { 64, 66 }, [96] = { 64, 66 }, [97] = { 64, 66 }, [98] = { 64, 66 },
                             [101] = { 67, 68 }, [102] = { 67, 68 }, [106] = { 67, 68 }, [107] = { 67, 68 },
                             [108] = { 64, 66 }, [109] = { 64, 66 }, [113] = { 67, 68 }, [133] = { 64, 66 },
                             [137] = { 64, 66 }, [138] = { 66, 68 }, [139] = { 66, 68 }, [140] = { 66, 68 },
                             [142] = { 66, 68 }, [143] = { 66, 68 }, [144] = { 66, 68 }, [146] = { 66, 68 },
                             [147] = { 66, 68 }, [149] = { 64, 66 }, [152] = { 64, 66 }, [155] = { 64, 66 },
                             [174] = { 64, 66 }, [175] = { 64, 66 }, [176] = { 64, 66 }, [178] = { 64, 66 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 50, item = 1053 },  -- cauldron coffer key
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 240, item = 17316 },  -- bomb arm
                { rate = 50, item = 1187 },  -- pinch of bomb queen ash
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Old Opo-opo',
            ids    = { 4, 5, 6, 9, 10, 11, 13, 14, 17, 18, 19, 22, 23, 24, 25, 27, 30, 31, 32, 36, 37, 40, 41, 44,
                       45, 48 },
            levels = {
                [61] = { acc = 243, eva = 230, agi = 73, int = 42, mnd = 42, chr = 62 },
                [62] = { acc = 248, eva = 235, agi = 73, int = 42, mnd = 42, chr = 62 },
                [63] = { acc = 253, eva = 240, agi = 73, int = 42, mnd = 42, chr = 62 },
                [64] = { acc = 259, eva = 246, agi = 75, int = 42, mnd = 42, chr = 63 },
                [65] = { acc = 264, eva = 251, agi = 75, int = 45, mnd = 45, chr = 65 },
            },
            spawn_levels = { [4] = { 61, 64 }, [5] = { 61, 64 }, [6] = { 61, 64 }, [9] = { 61, 64 },
                             [10] = { 61, 64 }, [11] = { 61, 64 }, [13] = { 61, 64 }, [14] = { 61, 64 },
                             [17] = { 61, 64 }, [18] = { 61, 64 }, [19] = { 61, 64 }, [22] = { 61, 64 },
                             [23] = { 61, 64 }, [24] = { 61, 64 }, [25] = { 61, 64 }, [27] = { 61, 64 },
                             [30] = { 61, 64 }, [31] = { 61, 64 }, [32] = { 61, 64 }, [36] = { 63, 65 },
                             [37] = { 63, 65 }, [40] = { 63, 65 }, [41] = { 63, 65 }, [44] = { 63, 65 },
                             [45] = { 63, 65 }, [48] = { 63, 65 } },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 17296 },  -- pebble
                { rate = 100, item = 4468 },  -- bunch of pamamas
                { rate = 50, item = 1053 },  -- cauldron coffer key
                { rate = 50, item = 4432 },  -- kazham pineapple
                { rate = 10, item = 4412 },  -- thundermelon
            },
            links  = 2,
        },
        {
            name   = 'Dire Bat',
            ids    = { 7, 12, 15, 20, 26, 28, 33, 60, 64, 67, 69, 71 },
            levels = {
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 50, item = 1053 },  -- cauldron coffer key
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Volcano Wasp',
            ids    = { 51, 52, 53, 54, 57, 59, 62, 63, 66, 68 },
            levels = {
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 50, item = 1053 },  -- cauldron coffer key
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 4,
        },
        {
            name   = 'Goblin Bandit',
            ids    = { 78, 118, 123, 128, 162, 167, 172 },
            levels = {
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47 },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48 },
                [68] = { acc = 286, eva = 318, agi = 81, int = 71, mnd = 48, chr = 48 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 72, mnd = 48, chr = 48 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblin Shepherd',
            ids    = { 79, 119, 124, 129, 157, 163, 168 },
            levels = {
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83 },
                [69] = { acc = 286, eva = 262, agi = 59, int = 60, mnd = 60, chr = 84 },
            },
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
            links  = 5,
        },
        {
            name   = 'Goblins Bats',
            ids    = { 80, 120, 125, 130, 158, 164, 169 },
            levels = {
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 3,
        },
        {
            name   = 'Dodomeki',
            ids    = { 81, 84, 87, 91, 93, 145, 148 },
            levels = {
                [63] = { acc = 250, eva = 227, agi = 66, int = 82, mnd = 55, chr = 60 },
                [64] = { acc = 256, eva = 233, agi = 68, int = 83, mnd = 56, chr = 62 },
                [65] = { acc = 261, eva = 237, agi = 68, int = 84, mnd = 58, chr = 62 },
                [66] = { acc = 267, eva = 243, agi = 70, int = 85, mnd = 58, chr = 62 },
                [67] = { acc = 271, eva = 247, agi = 71, int = 87, mnd = 59, chr = 65 },
                [68] = { acc = 276, eva = 252, agi = 71, int = 87, mnd = 60, chr = 65 },
            },
            spawn_levels = { [81] = { 63, 66 }, [84] = { 63, 66 }, [87] = { 63, 66 }, [91] = { 63, 66 },
                             [93] = { 63, 66 }, [145] = { 66, 68 }, [148] = { 66, 68 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 939 },  -- hecteyes eye
                { rate = 100, item = 4754 },  -- scroll of fire iii
                { rate = 50, item = 1292 },  -- damp hakutaku eye
                { rate = 50, item = 1053 },  -- cauldron coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 82, 121, 126, 131, 159, 160, 170, 173 },
            levels = {
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
                [69] = { acc = 277, eva = 243, agi = 65, int = 60, mnd = 84, chr = 72 },
            },
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
            links  = 5,
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 83, 122, 127, 132, 161, 165, 171 },
            levels = {
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 1426 },  -- warriors testimony
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Sulfur Scorpion',
            ids    = { 86, 90, 99, 100, 104, 105, 110, 114, 134 },
            levels = {
                [70] = { acc = 285, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 292, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 297, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 302, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 10, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Tyrannic Tunnok',
            ids    = { 103 },
            nm     = true,
            levels = {
                [74] = { acc = 307, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 313, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 319, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'poison' },
            drops  = {
                { rate = 1000, item = 17927 },  -- lohar
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 1000, item = 896 },  -- scorpion shell
                { rate = 10, item = 901 },  -- venomous claw
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Eotyrannus',
            ids    = { 111, 112, 115, 116, 135, 136, 141, 150, 151, 153, 154, 156, 177 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lindwurm',
            ids    = { 117 },
            nm     = true,
            levels = {
                [74] = { acc = 313, eva = 363, agi = 85, int = 71, mnd = 54, chr = 56 },
                [75] = { acc = 319, eva = 369, agi = 86, int = 71, mnd = 54, chr = 56 },
                [76] = { acc = 325, eva = 375, agi = 88, int = 73, mnd = 56, chr = 58 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 1277 },  -- lindwurm skin
                { rate = 100, item = 1277 },  -- lindwurm skin
                { rate = 100, item = 17983 },  -- valiant knife
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Foreseer Oramix',
            ids    = { 166 },
            nm     = true,
            levels = {
                [69] = { acc = 277, eva = 243, agi = 65, int = 60, mnd = 84, chr = 72 },
                [70] = { acc = 282, eva = 248, agi = 65, int = 61, mnd = 85, chr = 73 },
                [71] = { acc = 287, eva = 254, agi = 68, int = 63, mnd = 87, chr = 75 },
                [72] = { acc = 292, eva = 259, agi = 68, int = 63, mnd = 87, chr = 75 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 9, slow = -2, poison = -2, light_sleep = 10,
                       dark_sleep = 10, stun = -2, gravity = -2 },
            immune = { 'stun', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 17563 },  -- power staff
                { rate = 1000, item = 511 },  -- goblin mask
                { rate = 1000, item = 510 },  -- goblin armor
                { rate = 100, item = 4719 },  -- scroll of regen iii
                { rate = 100, item = 4613 },  -- scroll of cure v
                { rate = 50, item = 4618 },  -- scroll of curaga iv
                { rate = 150, item = 4741 },  -- scroll of shellra iv
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Volcanic Bomb',
            ids    = { 179, 180, 181, 183, 185, 188, 190, 191, 192, 193, 194, 198, 200, 202, 206, 207, 211, 213,
                       215, 216, 218, 223, 227, 230, 235, 236, 237, 238, 239, 240, 242, 244, 246, 247, 248, 252,
                       253, 254, 255, 256, 257, 258, 259, 260 },
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 52, mnd = 55, chr = 68 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 55, mnd = 58, chr = 70 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 55, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 56, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 57, mnd = 60, chr = 73 },
            },
            spawn_levels = { [179] = { 71, 75 }, [180] = { 71, 75 }, [181] = { 71, 75 }, [183] = { 71, 75 },
                             [185] = { 71, 75 }, [188] = { 71, 75 }, [190] = { 71, 75 }, [191] = { 71, 75 },
                             [192] = { 71, 75 }, [193] = { 71, 75 }, [194] = { 71, 75 }, [198] = { 71, 75 },
                             [200] = { 71, 75 }, [202] = { 71, 75 }, [206] = { 71, 75 }, [207] = { 71, 75 },
                             [211] = { 71, 75 }, [213] = { 71, 75 }, [215] = { 71, 75 }, [216] = { 71, 75 },
                             [218] = { 71, 75 }, [223] = { 71, 75 }, [227] = { 71, 75 }, [230] = { 71, 75 },
                             [235] = { 71, 75 }, [236] = { 71, 75 }, [237] = { 71, 75 }, [238] = { 71, 75 },
                             [239] = { 74, 78 }, [240] = { 74, 78 }, [242] = { 74, 78 }, [244] = { 74, 78 },
                             [246] = { 74, 78 }, [247] = { 74, 78 }, [248] = { 74, 78 }, [252] = { 74, 78 },
                             [253] = { 74, 78 }, [254] = { 74, 78 }, [255] = { 74, 78 }, [256] = { 74, 78 },
                             [257] = { 74, 78 }, [258] = { 74, 78 }, [259] = { 72, 75 }, [260] = { 72, 75 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 240, item = 17316 },  -- bomb arm
                { rate = 50, item = 1186 },  -- bomb queen core
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Nightmare Bats',
            ids    = { 182, 184, 186, 187, 189, 195, 196, 197, 199, 201, 203, 208, 212, 214 },
            levels = {
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1133 },  -- vial of dragon blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Ash Lizard',
            ids    = { 204, 205, 209, 210, 217, 219, 220, 224, 228, 231, 232, 241, 243, 249, 250 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 10, item = 1189 },  -- rattling egg
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
            },
            links  = 7,
        },
        {
            name   = 'Hurricane Wyvern',
            ids    = { 221, 222, 225, 226, 229, 233, 245 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 67, mnd = 55, chr = 62 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 67, mnd = 55, chr = 62 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 69, mnd = 56, chr = 62 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 69, mnd = 57, chr = 65 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 100, item = 905 },  -- wyvern skull
                { rate = 100, item = 1122 },  -- wyvern skin
                { rate = 10, item = 1124 },  -- wyvern wing
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Vouivre',
            ids    = { 234 },
            nm     = true,
            levels = {
                [79] = { acc = 342, eva = 388, agi = 84, int = 77, mnd = 55, chr = 60 },
                [80] = { acc = 347, eva = 393, agi = 84, int = 77, mnd = 55, chr = 60 },
                [81] = { acc = 354, eva = 399, agi = 87, int = 80, mnd = 58, chr = 63 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 16885 },  -- gae bolg
                { rate = 1000, item = 1124 },  -- wyvern wing
                { rate = 240, item = 1124 },  -- wyvern wing
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 1000, item = 866 },  -- handful of wyvern scales
            },
        },
        {
            name   = 'Ash Dragon',
            ids    = { 251 },
            nm     = true,
            levels = {
                [82] = { acc = 358, eva = 340, agi = 90, int = 69, mnd = 69, chr = 71 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 903 },  -- dragon talon
                { rate = 150, item = 867 },  -- handful of dragon scales
                { rate = 50, item = 1133 },  -- vial of dragon blood
                { rate = 50, item = 4486 },  -- dragon heart
                { rate = 10, item = 16961 },  -- murasame
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mimic',
            ids    = { 261 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1053 },  -- cauldron coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Bomb Queen',
            ids    = { 262 },
            nm     = true,
            levels = {
                [79] = { acc = 339, eva = 322, agi = 82, int = 80, mnd = 66, chr = 78 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 80, mnd = 66, chr = 78 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 83, mnd = 69, chr = 80 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 13567 },  -- bomb queen ring
                { rate = 1000, item = 928 },  -- pinch of bomb ash
                { rate = 1000, item = 17316 },  -- bomb arm
                { rate = 100, item = 16426 },  -- avengers
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Bomb Princess',
            ids    = { 263, 265 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sight', 'magic' },
            links  = 8,
        },
        {
            name   = 'Bomb Prince',
            ids    = { 264, 266 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sight', 'magic' },
            links  = 8,
        },
        {
            name   = 'Bomb Bastard',
            ids    = { 267 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify', 'terror' },
            aggro  = true,
            detects = { 'sight', 'magic' },
            links  = 9,
        },
        {
            name   = 'Tarasque',
            ids    = { 268 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 100, item = 18042 },  -- ascention
                { rate = 1000, item = 1276 },  -- tarasque skin
                { rate = 150, item = 1276 },  -- tarasque skin
                { rate = 100, item = 1276 },  -- tarasque skin
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 10,
        },
        {
            name   = 'Cailleach Bheur',
            ids    = { 269 },
            levels = {
                [82] = { acc = 358, eva = 312, agi = 85, int = 98, mnd = 67, chr = 77 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ildebrann',
            ids    = { 270, 273, 276 },
            nm     = true,
            levels = {
                [98] = { acc = 475, eva = 397, agi = 110, int = 132, mnd = 74, chr = 101 },
                [99] = { acc = 483, eva = 402, agi = 112, int = 135, mnd = 74, chr = 103 },
            },
            ranks  = { fire = 11, ice = 11, wind = -2, earth = 11, thunder = 11, water = -2, light = -2,
                       silence = -2, slow = 11, poison = -2, light_sleep = 6, dark_sleep = 6, stun = 11,
                       gravity = -2 },
            magic_dmg = { all = -50 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Hraun Dragon',
            ids    = { 271, 272, 274, 275, 277, 278 },
            nm     = true,
            levels = {
                [95] = { acc = 447, eva = 409, agi = 102, int = 78, mnd = 78, chr = 81 },
                [96] = { acc = 455, eva = 414, agi = 105, int = 79, mnd = 79, chr = 82 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Coca',
            ids    = { 279, 280 },
            nm     = true,
            levels = {
                [125] = { acc = 490, eva = 564, agi = 125, int = 108, mnd = 89, chr = 100 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
    },
    by_name = {},
}
