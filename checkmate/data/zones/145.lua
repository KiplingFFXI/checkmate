-- Giddeus (zone 145).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Hoo Mjuu the Torrent', 'Juu Duzu the Whirlwind', 'Vaa Huja the Erudite', 'Vuu Puqu the Beguiler',
                'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant', 'Yagudo Persecutor',
                'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist', 'Yagudo Votary',
                'Zhuu Buxu the Silent' },
        [2] = { 'Eyy Mon the Ironbreaker', 'Hoo Mjuu the Torrent', 'Juu Duzu the Whirlwind', 'Vaa Huja the Erudite',
                'Vuu Puqu the Beguiler', 'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant',
                'Yagudo Persecutor', 'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist',
                'Yagudo Votary' },
        [3] = { 'Eyy Mon the Ironbreaker', 'Hoo Mjuu the Torrent', 'Juu Duzu the Whirlwind', 'Vaa Huja the Erudite',
                'Vuu Puqu the Beguiler', 'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant',
                'Yagudo Persecutor', 'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist',
                'Yagudo Votary', 'Zhuu Buxu the Silent' },
        [4] = { 'Digger Wasp', 'Giddeus Bee' },
        [5] = { 'Eyy Mon the Ironbreaker', 'Hoo Mjuu the Torrent', 'Vaa Huja the Erudite', 'Vuu Puqu the Beguiler',
                'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant', 'Yagudo Persecutor',
                'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist', 'Yagudo Votary',
                'Zhuu Buxu the Silent' },
        [6] = { 'Earth Eater' },
        [7] = { 'Eyy Mon the Ironbreaker', 'Juu Duzu the Whirlwind', 'Vaa Huja the Erudite',
                'Vuu Puqu the Beguiler', 'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant',
                'Yagudo Persecutor', 'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist',
                'Yagudo Votary', 'Zhuu Buxu the Silent' },
        [8] = { 'Eyy Mon the Ironbreaker', 'Hoo Mjuu the Torrent', 'Juu Duzu the Whirlwind', 'Vaa Huja the Erudite',
                'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant', 'Yagudo Persecutor',
                'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist', 'Yagudo Votary',
                'Zhuu Buxu the Silent' },
        [9] = { 'Eyy Mon the Ironbreaker', 'Hoo Mjuu the Torrent', 'Juu Duzu the Whirlwind',
                'Vuu Puqu the Beguiler', 'Yagudo Acolyte', 'Yagudo Initiate', 'Yagudo Lookout', 'Yagudo Mendicant',
                'Yagudo Persecutor', 'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe', 'Yagudo Theologist',
                'Yagudo Votary', 'Zhuu Buxu the Silent' },
        [10] = { 'Eyy Mon the Ironbreaker', 'Hoo Mjuu the Torrent', 'Juu Duzu the Whirlwind',
                 'Vaa Huja the Erudite', 'Vuu Puqu the Beguiler', 'Yagudo Acolyte', 'Yagudo Initiate',
                 'Yagudo Mendicant', 'Yagudo Persecutor', 'Yagudo Piper', 'Yagudo Priest', 'Yagudo Scribe',
                 'Yagudo Theologist', 'Yagudo Votary', 'Zhuu Buxu the Silent' },
    },
    monsters = {
        {
            name   = 'Pugil',
            ids    = { 1, 2 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 7 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [1] = { 4, 5 } },
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
            name   = 'Pug Pugil',
            ids    = { 3 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11 },
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
            name   = 'Puffer Pugil',
            ids    = { 4 },
            levels = {
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
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
            name   = 'Land Pugil',
            ids    = { 5 },
            levels = {
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17 },
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
            name   = 'Eyy Mon the Ironbreaker',
            ids    = { 6 },
            nm     = true,
            levels = {
                [16] = { acc = 62, eva = 62, agi = 22, int = 17, mnd = 13, chr = 16 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 10 },
            drops  = {
                { rate = 1000, item = 16509 },  -- aspir knife
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Zhuu Buxu the Silent',
            ids    = { 7 },
            nm     = true,
            levels = {
                [16] = { acc = 62, eva = 62, agi = 22, int = 17, mnd = 13, chr = 16 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 10 },
            drops  = {
                { rate = 1000, item = 12298 },  -- parana shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Yagudo Initiate',
            ids    = { 8, 9, 16, 17, 23, 29, 34, 39, 42, 47, 50, 58, 61, 66, 69, 77, 83, 88, 93, 97, 100, 106, 112,
                       117, 121, 124, 129, 132, 135, 138, 191, 194, 208, 211, 218, 221 },
            levels = {
                [3] = { acc = 17, eva = 13, agi = 7, int = 6, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 17, agi = 8, int = 7, mnd = 8, chr = 9 },
                [5] = { acc = 24, eva = 20, agi = 9, int = 7, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 24, agi = 10, int = 8, mnd = 9, chr = 11 },
                [7] = { acc = 31, eva = 27, agi = 10, int = 9, mnd = 10, chr = 11 },
                [8] = { acc = 34, eva = 30, agi = 10, int = 9, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 12, int = 9, mnd = 11, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 12, int = 10, mnd = 12, chr = 13 },
            },
            spawn_levels = { [8] = { 3, 4 }, [9] = { 3, 4 }, [16] = { 3, 4 }, [17] = { 3, 4 }, [23] = { 3, 5 },
                             [29] = { 3, 5 }, [34] = { 3, 5 }, [39] = { 5, 7 }, [42] = { 5, 7 }, [47] = { 5, 7 },
                             [50] = { 5, 7 }, [58] = { 5, 7 }, [61] = { 5, 7 }, [66] = { 5, 7 }, [69] = { 5, 7 },
                             [77] = { 5, 7 }, [83] = { 5, 7 }, [88] = { 7, 10 }, [93] = { 5, 7 }, [97] = { 5, 7 },
                             [100] = { 5, 7 }, [106] = { 5, 7 }, [112] = { 5, 7 }, [117] = { 5, 7 },
                             [121] = { 5, 7 }, [124] = { 5, 7 }, [129] = { 7, 10 }, [132] = { 7, 10 },
                             [135] = { 7, 10 }, [138] = { 7, 10 }, [191] = { 7, 10 }, [194] = { 7, 10 },
                             [208] = { 7, 10 }, [211] = { 7, 10 }, [218] = { 7, 10 }, [221] = { 7, 10 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Acolyte',
            ids    = { 10, 18, 24, 30, 35, 40, 43, 48, 51, 59, 62, 67, 70, 78, 84, 89, 94, 98, 101, 107, 113, 118,
                       122, 125, 130, 133, 136, 139, 192, 195, 209, 212, 219, 222 },
            levels = {
                [3] = { acc = 15, eva = 13, agi = 8, int = 7, mnd = 11, chr = 10 },
                [4] = { acc = 19, eva = 15, agi = 9, int = 8, mnd = 11, chr = 12 },
                [5] = { acc = 22, eva = 19, agi = 10, int = 9, mnd = 13, chr = 12 },
                [6] = { acc = 26, eva = 21, agi = 11, int = 9, mnd = 13, chr = 14 },
                [7] = { acc = 29, eva = 24, agi = 11, int = 10, mnd = 14, chr = 14 },
                [8] = { acc = 32, eva = 27, agi = 12, int = 11, mnd = 15, chr = 14 },
                [9] = { acc = 36, eva = 30, agi = 13, int = 11, mnd = 16, chr = 16 },
                [10] = { acc = 39, eva = 32, agi = 13, int = 12, mnd = 16, chr = 16 },
            },
            spawn_levels = { [10] = { 3, 4 }, [18] = { 3, 4 }, [24] = { 3, 5 }, [30] = { 3, 5 }, [35] = { 3, 5 },
                             [40] = { 5, 7 }, [43] = { 5, 7 }, [48] = { 5, 7 }, [51] = { 5, 7 }, [59] = { 5, 7 },
                             [62] = { 5, 7 }, [67] = { 5, 7 }, [70] = { 5, 7 }, [78] = { 5, 7 }, [84] = { 5, 7 },
                             [89] = { 7, 10 }, [94] = { 5, 7 }, [98] = { 5, 7 }, [101] = { 5, 7 }, [107] = { 5, 7 },
                             [113] = { 5, 7 }, [118] = { 5, 7 }, [122] = { 5, 7 }, [125] = { 5, 7 },
                             [130] = { 7, 10 }, [133] = { 7, 10 }, [136] = { 7, 10 }, [139] = { 7, 10 },
                             [192] = { 7, 10 }, [195] = { 7, 10 }, [209] = { 7, 10 }, [212] = { 7, 10 },
                             [219] = { 7, 10 }, [222] = { 7, 10 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, group = {  -- one of
                    { 4666, 1 },  -- scroll of paralyze
                    { 4733, 1 },  -- scroll of protectra
                    { 4680, 1 },  -- scroll of barsleep
                    { 4745, 1 },  -- scroll of sneak
                } },
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12856 },  -- slops
                { rate = 50, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Scribe',
            ids    = { 11, 19, 25, 31, 36, 41, 44, 49, 52, 60, 63, 68, 71, 79, 85, 90, 95, 99, 102, 108, 114, 119,
                       123, 126, 131, 134, 137, 140, 193, 196, 210, 213, 220, 223 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 10, int = 11, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 17, agi = 12, int = 12, mnd = 7, chr = 10 },
                [5] = { acc = 24, eva = 20, agi = 12, int = 13, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 23, agi = 14, int = 13, mnd = 9, chr = 11 },
                [7] = { acc = 31, eva = 26, agi = 14, int = 15, mnd = 9, chr = 12 },
                [8] = { acc = 34, eva = 28, agi = 14, int = 15, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 32, agi = 16, int = 16, mnd = 11, chr = 13 },
                [10] = { acc = 41, eva = 34, agi = 16, int = 17, mnd = 11, chr = 14 },
            },
            spawn_levels = { [11] = { 3, 4 }, [19] = { 3, 4 }, [25] = { 3, 5 }, [31] = { 3, 5 }, [36] = { 3, 5 },
                             [41] = { 5, 7 }, [44] = { 5, 7 }, [49] = { 5, 7 }, [52] = { 5, 7 }, [60] = { 5, 7 },
                             [63] = { 5, 7 }, [68] = { 5, 7 }, [71] = { 5, 7 }, [79] = { 5, 7 }, [85] = { 5, 7 },
                             [90] = { 7, 10 }, [95] = { 5, 7 }, [99] = { 5, 7 }, [102] = { 5, 7 }, [108] = { 5, 7 },
                             [114] = { 5, 7 }, [119] = { 5, 7 }, [123] = { 5, 7 }, [126] = { 5, 7 },
                             [131] = { 7, 10 }, [134] = { 7, 10 }, [137] = { 7, 10 }, [140] = { 7, 10 },
                             [193] = { 7, 10 }, [196] = { 7, 10 }, [210] = { 7, 10 }, [213] = { 7, 10 },
                             [220] = { 7, 10 }, [223] = { 7, 10 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 50, item = 4862 },  -- scroll of blind
                { rate = 50, item = 4866 },  -- scroll of bind
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12856 },  -- slops
                { rate = 10, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Giddeus Bee',
            ids    = { 12, 20, 21, 22, 26, 27, 28, 32, 33, 37, 38, 45, 46, 53, 54, 64, 65, 72, 73 },
            levels = {
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [12] = { 2, 4 }, [20] = { 2, 4 }, [21] = { 2, 4 }, [22] = { 2, 4 }, [26] = { 2, 4 },
                             [27] = { 2, 4 }, [28] = { 2, 4 }, [32] = { 2, 4 }, [33] = { 2, 4 }, [37] = { 2, 4 },
                             [38] = { 2, 4 }, [45] = { 4, 5 }, [46] = { 4, 5 }, [53] = { 4, 5 }, [54] = { 4, 5 },
                             [64] = { 4, 5 }, [65] = { 4, 5 }, [72] = { 4, 5 }, [73] = { 4, 5 } },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 4,
        },
        {
            name   = 'Giddeus Pugil',
            ids    = { 13, 14, 15, 55, 56, 57, 74, 75, 76 },
            levels = {
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 7 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [13] = { 2, 4 }, [14] = { 2, 4 }, [15] = { 2, 4 }, [55] = { 4, 5 }, [56] = { 4, 5 },
                             [57] = { 4, 5 }, [74] = { 4, 5 }, [75] = { 4, 5 }, [76] = { 4, 5 } },
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
            name   = 'Dirt Eater',
            ids    = { 80, 81, 82, 86, 87, 91, 92, 96, 103, 104, 105, 109, 110, 111, 115, 116, 120, 127, 128 },
            levels = {
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
        },
        {
            name   = 'Yagudo Mendicant',
            ids    = { 141, 148, 152, 157, 166, 170, 175, 179, 187, 197, 201, 214, 224, 228, 234, 238, 244, 248,
                       254, 258, 264, 268, 273, 280, 284, 288, 294, 298, 304, 311, 317, 321, 325, 329, 333, 339,
                       346, 350, 354, 362, 368, 372, 377, 380, 386, 390, 394 },
            levels = {
                [11] = { acc = 43, eva = 36, agi = 15, int = 16, mnd = 16, chr = 18 },
                [12] = { acc = 46, eva = 38, agi = 15, int = 16, mnd = 16, chr = 18 },
                [13] = { acc = 49, eva = 42, agi = 16, int = 18, mnd = 17, chr = 19 },
                [14] = { acc = 53, eva = 44, agi = 17, int = 18, mnd = 17, chr = 20 },
                [15] = { acc = 56, eva = 47, agi = 17, int = 19, mnd = 19, chr = 21 },
                [16] = { acc = 60, eva = 50, agi = 19, int = 20, mnd = 19, chr = 22 },
                [17] = { acc = 63, eva = 53, agi = 19, int = 21, mnd = 20, chr = 23 },
                [18] = { acc = 66, eva = 55, agi = 19, int = 21, mnd = 21, chr = 23 },
            },
            spawn_levels = { [141] = { 11, 13 }, [148] = { 11, 13 }, [152] = { 11, 13 }, [157] = { 11, 13 },
                             [166] = { 12, 15 }, [170] = { 12, 15 }, [175] = { 12, 15 }, [179] = { 12, 15 },
                             [187] = { 14, 18 }, [197] = { 11, 13 }, [201] = { 11, 13 }, [214] = { 11, 13 },
                             [224] = { 11, 13 }, [228] = { 11, 13 }, [234] = { 12, 15 }, [238] = { 12, 15 },
                             [244] = { 14, 18 }, [248] = { 11, 13 }, [254] = { 12, 15 }, [258] = { 12, 15 },
                             [264] = { 12, 15 }, [268] = { 12, 15 }, [273] = { 12, 15 }, [280] = { 11, 13 },
                             [284] = { 11, 13 }, [288] = { 11, 13 }, [294] = { 11, 13 }, [298] = { 12, 15 },
                             [304] = { 12, 15 }, [311] = { 13, 14 }, [317] = { 11, 13 }, [321] = { 11, 13 },
                             [325] = { 11, 13 }, [329] = { 11, 13 }, [333] = { 11, 13 }, [339] = { 12, 15 },
                             [346] = { 12, 15 }, [350] = { 12, 15 }, [354] = { 12, 15 }, [362] = { 12, 15 },
                             [368] = { 14, 18 }, [372] = { 14, 18 }, [377] = { 12, 15 }, [380] = { 14, 18 },
                             [386] = { 14, 18 }, [390] = { 14, 18 }, [394] = { 14, 18 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, item = 750 },  -- silver beastcoin
                { rate = 10, item = 12736 },  -- mitts
                { rate = 10, item = 12864 },  -- slacks
                { rate = 10, item = 12992 },  -- solea
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudos Elemental',
            ids    = { 142, 149, 153, 158, 167, 171, 176, 180, 188, 198, 202, 215, 225, 229, 235, 239, 245, 249,
                       255, 259, 265, 269, 274, 281, 285, 289, 295, 299, 305, 312, 318, 322, 326, 330, 334, 340,
                       347, 351, 355, 363, 369, 373, 378, 381, 387, 391, 395 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 11, int = 12, mnd = 8, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 27, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Yagudo Piper',
            ids    = { 143, 150, 154, 159, 161, 168, 172, 177, 181, 189, 199, 203, 216, 226, 230, 236, 240, 246,
                       250, 256, 260, 266, 270, 275, 282, 286, 290, 296, 300, 306, 313, 319, 323, 327, 331, 335,
                       341, 348, 352, 356, 358, 364, 370, 374, 382, 388, 392, 396, 398, 441 },
            levels = {
                [11] = { acc = 43, eva = 37, agi = 13, int = 13, mnd = 13, chr = 18 },
                [12] = { acc = 46, eva = 39, agi = 13, int = 13, mnd = 13, chr = 18 },
                [13] = { acc = 50, eva = 43, agi = 14, int = 15, mnd = 14, chr = 19 },
                [14] = { acc = 53, eva = 46, agi = 15, int = 15, mnd = 14, chr = 20 },
                [15] = { acc = 56, eva = 48, agi = 15, int = 15, mnd = 15, chr = 21 },
                [16] = { acc = 60, eva = 52, agi = 16, int = 17, mnd = 16, chr = 22 },
                [17] = { acc = 63, eva = 55, agi = 17, int = 17, mnd = 16, chr = 23 },
                [18] = { acc = 66, eva = 57, agi = 17, int = 17, mnd = 17, chr = 23 },
            },
            spawn_levels = { [143] = { 11, 13 }, [150] = { 11, 13 }, [154] = { 11, 13 }, [159] = { 11, 13 },
                             [161] = { 11, 13 }, [168] = { 12, 15 }, [172] = { 12, 15 }, [177] = { 12, 15 },
                             [181] = { 12, 15 }, [189] = { 14, 18 }, [199] = { 11, 13 }, [203] = { 11, 13 },
                             [216] = { 11, 13 }, [226] = { 11, 13 }, [230] = { 11, 13 }, [236] = { 12, 15 },
                             [240] = { 12, 15 }, [246] = { 14, 18 }, [250] = { 11, 13 }, [256] = { 12, 15 },
                             [260] = { 12, 15 }, [266] = { 12, 15 }, [270] = { 12, 15 }, [275] = { 12, 15 },
                             [282] = { 11, 13 }, [286] = { 11, 13 }, [290] = { 11, 13 }, [296] = { 11, 13 },
                             [300] = { 12, 15 }, [306] = { 12, 15 }, [313] = { 12, 13 }, [319] = { 11, 13 },
                             [323] = { 11, 12 }, [327] = { 11, 13 }, [331] = { 11, 13 }, [335] = { 12, 15 },
                             [341] = { 12, 15 }, [348] = { 12, 15 }, [352] = { 12, 15 }, [356] = { 12, 15 },
                             [358] = { 12, 15 }, [364] = { 12, 15 }, [370] = { 14, 18 }, [374] = { 14, 18 },
                             [382] = { 14, 18 }, [388] = { 14, 18 }, [392] = { 14, 18 }, [396] = { 14, 18 },
                             [398] = { 14, 18 }, [441] = { 14, 18 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 10 },
            drops  = {
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, item = 5071 },  -- scroll of foe lullaby
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12856 },  -- slops
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Persecutor',
            ids    = { 144, 151, 155, 160, 162, 169, 173, 178, 182, 190, 200, 204, 217, 227, 231, 237, 241, 247,
                       251, 257, 261, 267, 271, 276, 283, 287, 291, 297, 301, 307, 314, 320, 324, 328, 332, 336,
                       342, 349, 353, 357, 359, 365, 366, 371, 383, 389, 393, 397 },
            levels = {
                [11] = { acc = 45, eva = 41, agi = 15, int = 13, mnd = 13, chr = 15 },
                [12] = { acc = 48, eva = 43, agi = 15, int = 13, mnd = 13, chr = 15 },
                [13] = { acc = 51, eva = 47, agi = 16, int = 14, mnd = 13, chr = 16 },
                [14] = { acc = 55, eva = 50, agi = 17, int = 14, mnd = 13, chr = 17 },
                [15] = { acc = 58, eva = 53, agi = 17, int = 15, mnd = 15, chr = 17 },
                [16] = { acc = 62, eva = 57, agi = 19, int = 16, mnd = 15, chr = 19 },
                [17] = { acc = 65, eva = 60, agi = 19, int = 16, mnd = 15, chr = 19 },
                [18] = { acc = 68, eva = 63, agi = 19, int = 17, mnd = 17, chr = 19 },
            },
            spawn_levels = { [144] = { 11, 13 }, [151] = { 11, 13 }, [155] = { 11, 13 }, [160] = { 11, 13 },
                             [162] = { 11, 13 }, [169] = { 12, 15 }, [173] = { 12, 15 }, [178] = { 12, 15 },
                             [182] = { 12, 15 }, [190] = { 14, 18 }, [200] = { 11, 13 }, [204] = { 11, 13 },
                             [217] = { 11, 13 }, [227] = { 11, 13 }, [231] = { 11, 13 }, [237] = { 12, 15 },
                             [241] = { 12, 15 }, [247] = { 14, 18 }, [251] = { 11, 13 }, [257] = { 12, 15 },
                             [261] = { 12, 15 }, [267] = { 12, 15 }, [271] = { 12, 15 }, [276] = { 12, 15 },
                             [283] = { 11, 13 }, [287] = { 11, 13 }, [291] = { 11, 13 }, [297] = { 11, 13 },
                             [301] = { 12, 15 }, [307] = { 12, 15 }, [314] = { 12, 15 }, [320] = { 11, 13 },
                             [324] = { 11, 13 }, [328] = { 11, 13 }, [332] = { 11, 13 }, [336] = { 12, 15 },
                             [342] = { 12, 15 }, [349] = { 12, 15 }, [353] = { 12, 15 }, [357] = { 12, 15 },
                             [359] = { 12, 15 }, [365] = { 12, 15 }, [366] = { 12, 15 }, [371] = { 14, 18 },
                             [383] = { 14, 18 }, [389] = { 14, 18 }, [393] = { 14, 18 }, [397] = { 14, 18 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { blind = 10 },
            drops  = {
                { rate = 150, item = 498 },  -- yagudo bead necklace
                { rate = 100, item = 750 },  -- silver beastcoin
                { rate = 10, item = 12456 },  -- hachimaki
                { rate = 10, item = 12712 },  -- tekko
                { rate = 10, item = 12840 },  -- sitabaki
                { rate = 10, item = 12968 },  -- kyahan
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Digger Wasp',
            ids    = { 145, 146, 147, 156, 163, 165, 174, 183, 184, 185, 186, 232, 233, 242, 243, 252, 253, 262,
                       272, 277, 278, 360, 361, 367, 375, 376, 384, 385, 405, 406, 410, 411, 412, 419, 426, 433,
                       440 },
            levels = {
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Juu Duzu the Whirlwind',
            ids    = { 164 },
            nm     = true,
            levels = {
                [13] = { acc = 51, eva = 51, agi = 19, int = 15, mnd = 11, chr = 14 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 10 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 13052, 8500 },  -- light soleas
                    { 17183, 1500 },  -- hunters longbow
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Giant Pugil',
            ids    = { 205, 206, 207 },
            levels = {
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            spawn_levels = { [205] = { 9, 11 }, [206] = { 9, 11 } },
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
            name   = 'Yagudo Votary',
            ids    = { 279, 401, 402, 407, 413, 416, 420, 423, 427, 430, 434, 437 },
            levels = {
                [21] = { acc = 80, eva = 73, agi = 20, int = 17, mnd = 21, chr = 22 },
                [22] = { acc = 83, eva = 75, agi = 20, int = 17, mnd = 21, chr = 22 },
                [23] = { acc = 86, eva = 78, agi = 20, int = 17, mnd = 21, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 50, item = 1026 },  -- giddeus chest key
                { rate = 50, item = 1530 },  -- seven-knot quipu
                { rate = 5, item = 12457 },  -- cotton hachimaki
                { rate = 5, item = 12713 },  -- cotton tekko
                { rate = 5, item = 12841 },  -- cotton sitabaki
                { rate = 5, item = 12969 },  -- cotton kyahan
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Earth Eater',
            ids    = { 292, 293, 302, 303, 308, 309, 310, 315, 316, 337, 338, 343, 344, 345 },
            levels = {
                [10] = { acc = 40, eva = 35, agi = 14, int = 18, mnd = 13, chr = 12 },
                [11] = { acc = 43, eva = 38, agi = 15, int = 20, mnd = 14, chr = 13 },
                [12] = { acc = 46, eva = 40, agi = 15, int = 20, mnd = 14, chr = 13 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 6,
        },
        {
            name   = 'Hoo Mjuu the Torrent',
            ids    = { 379 },
            nm     = true,
            levels = {
                [16] = { acc = 59, eva = 50, agi = 18, int = 16, mnd = 21, chr = 22 },
                [17] = { acc = 62, eva = 53, agi = 18, int = 16, mnd = 22, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 12798 },  -- zealots mitts
                { rate = 150, item = 4746 },  -- scroll of deodorize
                { rate = 50, item = 17132 },  -- monster signa
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Yagudo Theologist',
            ids    = { 399, 403, 408, 414, 417, 421, 424, 428, 431, 435, 438 },
            levels = {
                [21] = { acc = 79, eva = 67, agi = 26, int = 27, mnd = 19, chr = 24 },
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 19, chr = 24 },
                [23] = { acc = 85, eva = 72, agi = 26, int = 28, mnd = 19, chr = 24 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 50, item = 1026 },  -- giddeus chest key
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Yagudo Priest',
            ids    = { 400, 404, 409, 415, 418, 422, 425, 429, 432, 436, 439 },
            levels = {
                [21] = { acc = 76, eva = 65, agi = 22, int = 20, mnd = 26, chr = 26 },
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 26, chr = 26 },
                [23] = { acc = 82, eva = 70, agi = 22, int = 20, mnd = 27, chr = 26 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 50, item = 1026 },  -- giddeus chest key
                { rate = 10, item = 4695 },  -- scroll of barpoisonra
                { rate = 10, item = 4744 },  -- scroll of invisible
                { rate = 10, item = 4746 },  -- scroll of deodorize
                { rate = 50, item = 4667 },  -- scroll of silence
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Vuu Puqu the Beguiler',
            ids    = { 442 },
            nm     = true,
            levels = {
                [21] = { acc = 78, eva = 68, agi = 20, int = 22, mnd = 21, chr = 28 },
                [22] = { acc = 81, eva = 70, agi = 20, int = 22, mnd = 21, chr = 28 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 10 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 13072, 9000 },  -- bird whistle
                    { 13837, 1000 },  -- bonzes circlet
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Vaa Huja the Erudite',
            ids    = { 443 },
            nm     = true,
            levels = {
                [45] = { acc = 163, eva = 139, agi = 50, int = 55, mnd = 38, chr = 46 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Yagudo Lookout',
            ids    = { 444 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 642, agi = 147, int = 105, mnd = 98, chr = 125 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
    },
    by_name = {},
}
