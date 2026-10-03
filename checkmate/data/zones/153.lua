-- The Boyahda Tree (zone 153).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Blood Ball' },
        [2] = { 'Bark Spider', 'Bark Tarantula' },
        [3] = { 'Death Cap', 'Ellyllon' },
        [4] = { 'Death Cap' },
        [5] = { 'Korrigan', 'Mourioche' },
        [6] = { 'Moss Eater', 'Unut' },
        [7] = { 'Knight Crawler', 'Processionaire', 'Templar Crawler' },
        [8] = { 'Ancient Goobbue', 'Elder Goobbue', 'Old Goobbue' },
        [9] = { 'Moss Eater' },
        [10] = { 'Beet Leafhopper', 'Darter', 'Skimmer' },
        [11] = { 'Blood Ball', 'Bouncing Ball' },
        [12] = { 'Elder Goobbue', 'Old Goobbue' },
        [13] = { 'Boyahda Sapling', 'Leshonki', 'Modron', 'Modrons Druid' },
        [14] = { 'Boyahda Sapling', 'Modron', 'Modrons Druid' },
        [15] = { 'Darter', 'Skimmer' },
        [16] = { 'Knight Crawler', 'Processionaire' },
    },
    monsters = {
        {
            name   = 'Scavenger Crab',
            ids    = { 1 },
            levels = {
                [60] = { acc = 229, eva = 209, agi = 39, int = 42, mnd = 63, chr = 63 },
                [61] = { acc = 234, eva = 215, agi = 42, int = 45, mnd = 66, chr = 66 },
                [62] = { acc = 239, eva = 220, agi = 42, int = 45, mnd = 66, chr = 66 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 4400 },  -- slice of land crab meat
                { rate = 50, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Stygian Pugil',
            ids    = { 2 },
            levels = {
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 50 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 52 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 52 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1052 },  -- boyahda coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bouncing Ball',
            ids    = { 3 },
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1052 },  -- boyahda coffer key
                { rate = 10, item = 1125 },  -- carbuncles ruby
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Demonic Pugil',
            ids    = { 4, 5 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bark Spider',
            ids    = { 6, 7, 8, 9, 15, 16, 21, 22, 23, 24, 25, 26, 27, 36, 37, 38, 39, 40, 41, 53, 54, 55, 56, 57,
                       58, 59, 60, 61, 62, 63 },
            levels = {
                [60] = { acc = 238, eva = 221, agi = 63, int = 51, mnd = 51, chr = 46 },
                [61] = { acc = 243, eva = 227, agi = 66, int = 53, mnd = 53, chr = 48 },
                [62] = { acc = 248, eva = 232, agi = 66, int = 53, mnd = 53, chr = 48 },
                [63] = { acc = 253, eva = 237, agi = 66, int = 53, mnd = 53, chr = 48 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 100, item = 838 },  -- spider web
                { rate = 50, item = 1052 },  -- boyahda coffer key
            },
            links  = 2,
        },
        {
            name   = 'Death Cap',
            ids    = { 10, 11, 12, 13, 14, 17, 18, 19, 20, 28, 29, 30, 31, 32, 33, 34, 42, 43, 44, 45, 46, 47, 48,
                       49, 50, 51, 52 },
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 44, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 46, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 46, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 46, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1052 },  -- boyahda coffer key
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 100, item = 4373 },  -- woozyshroom
                { rate = 50, item = 4375 },  -- danceshroom
            },
            links  = 3,
        },
        {
            name   = 'Ellyllon',
            ids    = { 35 },
            nm     = true,
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 49, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 49, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4374 },  -- sleepshroom
                { rate = 150, item = 13913 },  -- mushroom helm
                { rate = 50, item = 4386 },  -- king truffle
                { rate = 100, item = 4449 },  -- reishi mushroom
            },
            links  = 4,
        },
        {
            name   = 'Mourioche',
            ids    = { 64, 65, 66, 69, 70, 71, 72, 75, 76, 79, 80, 81, 82, 87, 88, 106, 107, 108, 109, 117, 118,
                       119, 120, 131, 132, 133, 134, 135, 136, 141, 142, 143, 144, 145, 146, 151, 152, 153, 168,
                       170, 171, 172, 173, 174, 175, 176, 177, 181, 182, 183, 184, 187, 188, 189, 193, 194, 195 },
            levels = {
                [62] = { acc = 249, eva = 229, agi = 49, int = 45, mnd = 60, chr = 55 },
                [63] = { acc = 254, eva = 234, agi = 49, int = 45, mnd = 60, chr = 55 },
                [64] = { acc = 260, eva = 240, agi = 50, int = 46, mnd = 62, chr = 56 },
                [65] = { acc = 265, eva = 246, agi = 52, int = 46, mnd = 62, chr = 58 },
                [66] = { acc = 271, eva = 251, agi = 52, int = 47, mnd = 62, chr = 58 },
                [67] = { acc = 275, eva = 256, agi = 53, int = 48, mnd = 65, chr = 59 },
                [68] = { acc = 281, eva = 261, agi = 53, int = 48, mnd = 65, chr = 60 },
            },
            spawn_levels = { [64] = { 62, 65 }, [65] = { 62, 65 }, [66] = { 62, 65 }, [69] = { 62, 65 },
                             [70] = { 62, 65 }, [71] = { 62, 65 }, [72] = { 62, 65 }, [75] = { 62, 65 },
                             [76] = { 62, 65 }, [79] = { 62, 65 }, [80] = { 62, 65 }, [81] = { 62, 65 },
                             [82] = { 62, 65 }, [87] = { 62, 64 }, [88] = { 63, 66 }, [106] = { 63, 66 },
                             [107] = { 63, 66 }, [108] = { 63, 66 }, [109] = { 63, 66 }, [117] = { 64, 67 },
                             [118] = { 64, 67 }, [119] = { 64, 67 }, [120] = { 64, 67 }, [131] = { 64, 67 },
                             [132] = { 64, 67 }, [133] = { 64, 67 }, [134] = { 64, 67 }, [135] = { 64, 67 },
                             [136] = { 64, 67 }, [141] = { 64, 67 }, [142] = { 64, 67 }, [143] = { 64, 67 },
                             [144] = { 64, 67 }, [145] = { 64, 67 }, [146] = { 64, 67 }, [151] = { 64, 67 },
                             [152] = { 64, 67 }, [153] = { 64, 67 }, [168] = { 65, 68 }, [170] = { 65, 68 },
                             [171] = { 65, 68 }, [172] = { 65, 68 }, [173] = { 65, 68 }, [174] = { 65, 68 },
                             [175] = { 65, 68 }, [176] = { 65, 68 }, [177] = { 65, 68 }, [181] = { 65, 68 },
                             [182] = { 65, 68 }, [183] = { 65, 68 }, [184] = { 65, 68 }, [187] = { 65, 68 },
                             [188] = { 65, 68 }, [189] = { 65, 68 }, [193] = { 65, 68 }, [194] = { 65, 68 },
                             [195] = { 65, 68 } },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 100, item = 4368 },  -- two-leaf mandragora bud
                { rate = 50, item = 17868 },  -- jug of humus
                { rate = 50, item = 1052 },  -- boyahda coffer key
                { rate = 10, item = 1150 },  -- snobby letter
            },
            links  = 5,
        },
        {
            name   = 'Moss Eater',
            ids    = { 67, 68, 73, 74, 83, 84, 85, 110, 111, 112, 114, 115, 116, 121, 122, 123, 126, 127, 128, 137,
                       138, 139, 147, 148, 149, 154, 155, 156, 178, 179, 190, 191, 197, 198, 201, 202, 205, 206,
                       209, 210, 213, 214, 227, 228 },
            levels = {
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1052 },  -- boyahda coffer key
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
            },
            links  = 6,
        },
        {
            name   = 'Knight Crawler BT',
            ids    = { 77, 78, 102, 103, 104, 129, 130 },
            levels = {
                [62] = { acc = 245, eva = 230, agi = 63, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 235, agi = 63, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 53, chr = 59 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 10, item = 4357 },  -- crawler egg
                { rate = 50, item = 4600 },  -- lucky egg
                { rate = 50, item = 1052 },  -- boyahda coffer key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Old Goobbue',
            ids    = { 86, 113, 124, 140, 150, 157, 180, 192 },
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -2, dark = -2, dark_sleep = -2, blind = -2 },
            drops  = {
                { rate = 10, item = 1052 },  -- boyahda coffer key
                { rate = 150, item = 919 },  -- clump of boyahda moss
                { rate = 100, item = 1237 },  -- bag of tree cuttings
                { rate = 50, item = 1181 },  -- clump of goobbue humus
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Robber Crab',
            ids    = { 89, 90, 91, 93, 94, 95, 98, 99, 100, 158, 159, 161, 162, 163, 165, 166, 262, 264 },
            levels = {
                [62] = { acc = 239, eva = 220, agi = 42, int = 45, mnd = 66, chr = 66 },
                [63] = { acc = 244, eva = 225, agi = 42, int = 45, mnd = 66, chr = 66 },
                [64] = { acc = 250, eva = 230, agi = 42, int = 46, mnd = 68, chr = 68 },
                [65] = { acc = 256, eva = 235, agi = 43, int = 46, mnd = 68, chr = 68 },
                [66] = { acc = 261, eva = 240, agi = 44, int = 47, mnd = 70, chr = 70 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1052 },  -- boyahda coffer key
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 92, 97, 101, 160, 164, 167, 241, 246, 251, 258, 261, 263, 265, 267, 322, 325, 328, 362 },
            levels = {
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
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
        {
            name   = 'Aquarius',
            ids    = { 96 },
            nm     = true,
            levels = {
                [69] = { acc = 276, eva = 255, agi = 45, int = 48, mnd = 72, chr = 72 },
                [70] = { acc = 281, eva = 260, agi = 45, int = 49, mnd = 73, chr = 73 },
                [71] = { acc = 287, eva = 266, agi = 48, int = 51, mnd = 75, chr = 75 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = 9, silence = 9, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'poison' },
            drops  = {
                { rate = 1000, item = 881 },  -- crab shell
                { rate = 1000, item = 4400 },  -- slice of land crab meat
                { rate = 1000, group = { { 17925, 9000 }, { 0, 1000 } } },  -- one of fransisca, nothing
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 105, 169, 196, 279, 283, 285, 287, 331, 365, 376 },
            levels = {
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
            },
            spawn_levels = { [279] = { 70, 72 }, [331] = { 71, 72 }, [376] = { 71, 72 } },
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
            name   = 'Unut',
            ids    = { 125 },
            nm     = true,
            levels = {
                [69] = { acc = 288, eva = 320, agi = 75, int = 66, mnd = 50, chr = 52 },
                [70] = { acc = 293, eva = 339, agi = 77, int = 67, mnd = 51, chr = 53 },
                [71] = { acc = 300, eva = 345, agi = 78, int = 68, mnd = 52, chr = 55 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 856 },  -- rabbit hide
                { rate = 1000, item = 856 },  -- rabbit hide
                { rate = 1000, item = 856 },  -- rabbit hide
                { rate = 100, item = 14287 },  -- luna subligar
            },
            links  = 9,
        },
        {
            name   = 'Morbol Menace',
            ids    = { 185, 186 },
            levels = {
                [67] = { acc = 275, eva = 258, agi = 71, int = 53, mnd = 49, chr = 59 },
                [68] = { acc = 280, eva = 263, agi = 71, int = 53, mnd = 50, chr = 60 },
                [69] = { acc = 286, eva = 269, agi = 72, int = 54, mnd = 51, chr = 60 },
                [70] = { acc = 291, eva = 274, agi = 73, int = 55, mnd = 51, chr = 61 },
            },
            ranks  = { fire = -2, ice = -1, wind = -1, earth = -1, thunder = -1, water = 4, light = -1, dark = 4,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 4, light_sleep = -1,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 50, item = 1446 },  -- lacquer tree log
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Elder Goobbue',
            ids    = { 199, 200, 203, 204, 207, 208, 211, 212, 215, 216, 219, 220, 221, 224, 225, 226, 229, 230,
                       274, 290, 295, 307, 313, 374, 375, 379, 380, 383, 384, 385 },
            levels = {
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { fire = -2, dark = -2, dark_sleep = -2, blind = -2 },
            drops  = {
                { rate = 240, item = 919 },  -- clump of boyahda moss
                { rate = 240, item = 1237 },  -- bag of tree cuttings
                { rate = 100, item = 1414 },  -- piece of wisteria lumber
                { rate = 50, item = 1181 },  -- clump of goobbue humus
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Korrigan',
            ids    = { 217, 218, 222, 223, 288, 289, 291, 292, 293, 294, 296, 297, 305, 306, 310, 311, 312, 314,
                       315, 316, 317, 366, 367, 368, 369, 370, 371, 372, 373 },
            levels = {
                [72] = { acc = 303, eva = 281, agi = 55, int = 51, mnd = 67, chr = 63 },
                [73] = { acc = 309, eva = 288, agi = 58, int = 52, mnd = 70, chr = 64 },
                [74] = { acc = 314, eva = 293, agi = 58, int = 52, mnd = 70, chr = 64 },
                [75] = { acc = 320, eva = 298, agi = 58, int = 52, mnd = 70, chr = 65 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            drops  = {
                { rate = 50, item = 4368 },  -- two-leaf mandragora bud
                { rate = 50, item = 17868 },  -- jug of humus
                { rate = 10, item = 1265 },  -- four-leaf korrigan bud
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Skimmer',
            ids    = { 231, 232, 233, 234, 235, 236, 242, 243, 247, 248, 252, 253, 259, 260, 268, 269 },
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 10,
        },
        {
            name   = 'Steelshell',
            ids    = { 237, 238, 239, 240, 244, 245, 249, 250, 254, 255, 256, 257 },
            levels = {
                [73] = { acc = 298, eva = 276, agi = 48, int = 52, mnd = 76, chr = 76 },
                [74] = { acc = 303, eva = 281, agi = 48, int = 52, mnd = 77, chr = 77 },
                [75] = { acc = 308, eva = 286, agi = 49, int = 52, mnd = 77, chr = 77 },
                [76] = { acc = 314, eva = 291, agi = 50, int = 54, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Steelshell',
            ids    = { 266, 298, 299, 300, 301, 302 },
            levels = {
                [73] = { acc = 298, eva = 276, agi = 48, int = 52, mnd = 76, chr = 76 },
                [74] = { acc = 303, eva = 281, agi = 48, int = 52, mnd = 77, chr = 77 },
                [75] = { acc = 308, eva = 286, agi = 49, int = 52, mnd = 77, chr = 77 },
                [76] = { acc = 314, eva = 291, agi = 50, int = 54, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 240, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Processionaire',
            ids    = { 270, 271, 272, 273, 275, 276, 277, 278, 280, 281, 282, 284, 286, 329, 330, 332, 333, 334,
                       342, 343, 354, 355, 356, 363, 364, 377, 378, 381, 382 },
            levels = {
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 293, agi = 73, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
                { rate = 10, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Darter',
            ids    = { 303, 304, 308, 309, 320, 321, 324, 327, 335, 336, 337, 340, 341, 344, 345, 348, 349, 352,
                       353, 357, 358 },
            levels = {
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 313, agi = 85, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 331, eva = 318, agi = 85, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 10,
        },
        {
            name   = 'Blood Ball',
            ids    = { 318, 319, 323, 326, 338, 339, 346, 347, 350, 351 },
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 63, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 64, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 65, mnd = 60, chr = 66 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 65, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            links  = 11,
        },
        {
            name   = 'Ancient Goobbue',
            ids    = { 386 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -2, dark = -2, dark_sleep = -2, blind = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 919 },  -- clump of boyahda moss
                { rate = 1000, item = 1237 },  -- bag of tree cuttings
                { rate = 1000, item = 1264 },  -- clump of great boyahda moss
                { rate = 50, item = 16990 },  -- daihannya
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 12,
        },
        {
            name   = 'Boyahda Sapling',
            ids    = { 387, 388, 389, 390, 391, 392, 397, 398, 400, 404, 405, 407, 408, 411, 415, 423, 424, 425 },
            levels = {
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 62 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 59, chr = 62 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 62 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
            },
            links  = 13,
        },
        {
            name   = 'Bark Tarantula',
            ids    = { 393, 394, 399, 401, 402, 406, 409, 410, 412, 413, 416, 417, 418, 419, 420, 421, 422, 428,
                       429, 430, 431 },
            levels = {
                [75] = { acc = 319, eva = 300, agi = 77, int = 63, mnd = 63, chr = 57 },
                [76] = { acc = 325, eva = 306, agi = 80, int = 64, mnd = 64, chr = 57 },
                [77] = { acc = 330, eva = 311, agi = 80, int = 65, mnd = 65, chr = 58 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 65, mnd = 65, chr = 60 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 100, item = 838 },  -- spider web
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Demonic Rose',
            ids    = { 395, 403, 414, 426 },
            levels = {
                [75] = { acc = 319, eva = 300, agi = 77, int = 58, mnd = 55, chr = 65 },
                [76] = { acc = 325, eva = 306, agi = 80, int = 59, mnd = 55, chr = 66 },
                [77] = { acc = 330, eva = 311, agi = 80, int = 60, mnd = 56, chr = 66 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 60, mnd = 57, chr = 68 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 50, item = 1446 },  -- lacquer tree log
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Leshonki',
            ids    = { 396 },
            nm     = true,
            levels = {
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 61, chr = 65 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 65 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 67 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 574 },  -- bag of fruit seeds
                { rate = 1000, item = 574 },  -- bag of fruit seeds
                { rate = 1000, item = 1263 },  -- leshonki bulb
                { rate = 150, item = 1236 },  -- bag of cactus stems
                { rate = 100, item = 953 },  -- treant bulb
            },
            links  = 14,
        },
        {
            name   = 'Voluptuous Vivian',
            ids    = { 427 },
            nm     = true,
            levels = {
                [80] = { acc = 346, eva = 332, agi = 77, int = 66, mnd = 62, chr = 73 },
                [81] = { acc = 354, eva = 338, agi = 80, int = 69, mnd = 65, chr = 75 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'paralyze' },
            drops  = {
                { rate = 1000, item = 920 },  -- malboro vine
                { rate = 100, item = 13574 },  -- black ribbon
                { rate = 50, item = 837 },  -- spool of malboro fiber
                { rate = 50, item = 13301 },  -- vivian ring
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mimic',
            ids    = { 432 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1052 },  -- boyahda coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Agas',
            ids    = { 433 },
            nm     = true,
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 85, mnd = 60, chr = 68 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 86, mnd = 60, chr = 70 },
            },
            ranks  = { light = -2, dark = 6, silence = 10, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Beet Leafhopper',
            ids    = { 434 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 15,
        },
        {
            name   = 'Modron',
            ids    = { 435, 438, 441 },
            nm     = true,
            levels = {
                [94] = { acc = 437, eva = 372, agi = 96, int = 111, mnd = 80, chr = 82 },
                [95] = { acc = 444, eva = 376, agi = 96, int = 113, mnd = 81, chr = 83 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 13,
        },
        {
            name   = 'Modrons Druid',
            ids    = { 436, 437, 439, 440, 442, 443 },
            nm     = true,
            levels = {
                [92] = { acc = 422, eva = 390, agi = 94, int = 70, mnd = 70, chr = 75 },
                [93] = { acc = 429, eva = 395, agi = 95, int = 72, mnd = 72, chr = 75 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 13,
        },
        {
            name   = 'Ayapec',
            ids    = { 444, 445, 446 },
            nm     = true,
            levels = {
                [125] = { acc = 477, eva = 541, agi = 79, int = 85, mnd = 125, chr = 125 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Hidhaegg',
            ids    = { 447, 448 },
            nm     = true,
            levels = {
                [135] = { acc = 502, eva = 624, agi = 149, int = 124, mnd = 87, chr = 128 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, light = -2, paralyze = 11, bind = 11, poison = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Templar Crawler',
            ids    = { 450 },
            nm     = true,
            levels = {
                [139] = { acc = 493, eva = 635, agi = 132, int = 105, mnd = 105, chr = 117 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 16,
        },
    },
    by_name = {},
}
