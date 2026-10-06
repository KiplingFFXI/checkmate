-- Phomiuna Aqueducts (zone 27).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { true_sight = { 'Mahisha', 'Minotaur', 'Stegotaur', 'Taurus' } },
        [2] = { sound = { 'Canal Bats', 'Hell Bat', 'Tres Duendes', 'Vampire Bat' } },
        [3] = { superlink = { 'Fomor Ninja' } },
        [4] = { superlink = { 'Fomor Dragoon' } },
        [5] = {
            superlink = { 'Fomor Summoner', 'Fomor Thief' },
            sound = { 'Duendes Amoroso', 'Fomor Ranger', 'Fomor Thief' },
        },
        [6] = {
            superlink = { 'Fomor Summoner', 'Fomor Warrior' },
            sound = { 'Duendes Amoroso', 'Fomor Ranger', 'Fomor Thief' },
        },
        [7] = {
            superlink = { 'Fomor Thief', 'Fomor Warrior' },
            sound = { 'Duendes Amoroso', 'Fomor Ranger', 'Fomor Thief' },
        },
        [8] = { true_sight = { 'Minotaur', 'Stegotaur', 'Taurus' } },
        [9] = { true_sight = { 'Mahisha', 'Stegotaur', 'Taurus' } },
        [10] = { superlink = { 'Fomor Dark Knight', 'Fomor Ninja', 'Fomor Ranger' } },
        [11] = { superlink = { 'Fomor Dark Knight', 'Fomor Ninja', 'Fomor Samurai' } },
        [12] = { superlink = { 'Fomor Ninja', 'Fomor Ranger', 'Fomor Samurai' } },
        [13] = { superlink = { 'Fomor Dark Knight', 'Fomor Ranger', 'Fomor Samurai' } },
        [14] = { sound = { 'Canal Bats', 'Hell Bat', 'Vampire Bat' } },
        [15] = {
            superlink = { 'Fomor Summoner', 'Fomor Thief', 'Fomor Warrior' },
            sound = { 'Fomor Ranger', 'Fomor Summoner', 'Fomor Thief', 'Fomor Warrior' },
        },
        [16] = { superlink = { 'Fomor Red Mage', 'Fomor Samurai' } },
        [17] = { superlink = { 'Fomor Paladin', 'Fomor Red Mage' } },
        [18] = { superlink = { 'Fomor Paladin', 'Fomor Samurai' } },
        [19] = {
            superlink = { 'Fomor Summoner', 'Fomor Thief', 'Fomor Warrior' },
            sound = { 'Duendes Amoroso', 'Fomor Ranger', 'Fomor Summoner', 'Fomor Thief', 'Fomor Warrior' },
        },
        [20] = {
            superlink = { 'Fomor Summoner', 'Fomor Thief', 'Fomor Warrior' },
            sound = { 'Duendes Amoroso', 'Fomor Summoner', 'Fomor Thief', 'Fomor Warrior' },
        },
        [21] = { superlink = { 'Fomor Dark Knight', 'Fomor Warrior' } },
        [22] = { superlink = { 'Fomor Black Mage', 'Fomor Dark Knight' } },
        [23] = { superlink = { 'Fomor Black Mage', 'Fomor Warrior' } },
        [24] = { superlink = { 'Fomor Bard' } },
        [25] = { superlink = { 'Fomor Ranger' } },
        [26] = { superlink = { 'Fomor Paladin' } },
        [27] = { superlink = { 'Fomor Black Mage' } },
        [28] = { superlink = { 'Fomor Red Mage' } },
        [29] = { superlink = { 'Fomor Monk' } },
        [30] = { superlink = { 'Fomor Samurai' } },
        [31] = { superlink = { 'Fomor Warrior' } },
        [32] = { superlink = { 'Fomor Thief' } },
    },
    monsters = {
        {
            name   = 'Sponge',
            ids    = { 1 },
            levels = {
                [25] = { acc = 93, eva = 86, agi = 29, int = 23, mnd = 25, chr = 26 },
                [26] = { acc = 97, eva = 90, agi = 31, int = 23, mnd = 26, chr = 26 },
                [27] = { acc = 100, eva = 92, agi = 31, int = 24, mnd = 26, chr = 27 },
                [28] = { acc = 103, eva = 96, agi = 32, int = 24, mnd = 26, chr = 28 },
                [29] = { acc = 107, eva = 99, agi = 33, int = 25, mnd = 28, chr = 28 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Water Pumpkin',
            ids    = { 2 },
            levels = {
                [25] = { acc = 93, eva = 86, agi = 29, int = 23, mnd = 25, chr = 26 },
                [26] = { acc = 97, eva = 90, agi = 31, int = 23, mnd = 26, chr = 26 },
                [27] = { acc = 100, eva = 92, agi = 31, int = 24, mnd = 26, chr = 27 },
                [28] = { acc = 103, eva = 96, agi = 32, int = 24, mnd = 26, chr = 28 },
                [29] = { acc = 107, eva = 99, agi = 33, int = 25, mnd = 28, chr = 28 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Freshwater Trepang',
            ids    = { 3 },
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 26, mnd = 28, chr = 29 },
                [31] = { acc = 114, eva = 107, agi = 36, int = 26, mnd = 29, chr = 31 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 26, mnd = 29, chr = 31 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 29, mnd = 31, chr = 32 },
                [34] = { acc = 124, eva = 115, agi = 37, int = 29, mnd = 32, chr = 32 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ogreish Risotto',
            ids    = { 4 },
            levels = {
                [35] = { acc = 127, eva = 119, agi = 38, int = 29, mnd = 32, chr = 33 },
                [36] = { acc = 132, eva = 123, agi = 40, int = 30, mnd = 33, chr = 34 },
                [37] = { acc = 135, eva = 125, agi = 40, int = 31, mnd = 34, chr = 34 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bavarois',
            ids    = { 5 },
            levels = {
                [39] = { acc = 142, eva = 132, agi = 42, int = 32, mnd = 35, chr = 37 },
                [40] = { acc = 145, eva = 135, agi = 42, int = 32, mnd = 35, chr = 37 },
                [41] = { acc = 149, eva = 139, agi = 45, int = 35, mnd = 38, chr = 39 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Big Jaw',
            ids    = { 6, 8, 9, 14, 15, 16 },
            levels = {
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 35 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1888 },  -- sack of silica
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Gloop',
            ids    = { 7, 10, 11, 13, 29 },
            levels = {
                [36] = { acc = 132, eva = 123, agi = 40, int = 30, mnd = 33, chr = 34 },
                [37] = { acc = 135, eva = 125, agi = 40, int = 31, mnd = 34, chr = 34 },
                [38] = { acc = 138, eva = 128, agi = 41, int = 31, mnd = 34, chr = 36 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Addled Tumor',
            ids    = { 12 },
            levels = {
                [36] = { acc = 132, eva = 124, agi = 42, int = 30, mnd = 28, chr = 37 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 29, chr = 37 },
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 30, chr = 39 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Taurus',
            ids    = { 17, 18, 19 },
            levels = {
                [37] = { acc = 138, eva = 123, agi = 29, int = 26, mnd = 40, chr = 37 },
                [38] = { acc = 141, eva = 127, agi = 30, int = 27, mnd = 40, chr = 39 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1697 },  -- piece of spruce lumber
                { rate = 50, item = 1877 },  -- fomor codex
                { rate = 50, item = 1620 },  -- taurus horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Vampire Bat',
            ids    = { 20, 21, 22 },
            levels = {
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
            },
            spawn_levels = { [20] = { 37, 38 }, [22] = { 38, 38 } },
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
            name   = 'Diremite',
            ids    = { 23, 24, 26, 28, 32, 33, 35, 41, 62, 64, 65, 66, 69, 70, 71, 93, 103, 109, 128, 130, 131, 134,
                       135, 146, 161, 184 },
            levels = {
                [42] = { acc = 152, eva = 140, agi = 42, int = 47, mnd = 32, chr = 32 },
                [43] = { acc = 155, eva = 143, agi = 42, int = 47, mnd = 32, chr = 32 },
                [44] = { acc = 159, eva = 147, agi = 45, int = 49, mnd = 33, chr = 33 },
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 33 },
                [46] = { acc = 166, eva = 153, agi = 45, int = 51, mnd = 34, chr = 34 },
                [47] = { acc = 170, eva = 156, agi = 47, int = 52, mnd = 35, chr = 35 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 52, mnd = 35, chr = 35 },
            },
            spawn_levels = { [23] = { 42, 44 }, [24] = { 42, 44 }, [26] = { 42, 44 }, [28] = { 42, 44 },
                             [32] = { 42, 44 }, [33] = { 42, 44 }, [35] = { 42, 44 }, [41] = { 42, 44 },
                             [62] = { 44, 46 }, [64] = { 44, 46 }, [65] = { 44, 46 }, [66] = { 44, 46 },
                             [69] = { 44, 46 }, [70] = { 44, 46 }, [71] = { 44, 46 }, [93] = { 44, 46 },
                             [103] = { 44, 46 }, [109] = { 44, 46 }, [128] = { 44, 46 }, [130] = { 44, 46 },
                             [131] = { 44, 46 }, [134] = { 44, 46 }, [135] = { 44, 46 }, [146] = { 44, 46 },
                             [161] = { 47, 48 }, [184] = { 47, 48 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -3, light = -2, dark = 3,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -3, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1700 },  -- spool of bloodthread
                { rate = 10, item = 1626 },  -- bottle of avatar blood
            },
        },
        {
            name   = 'Canal Bats PA',
            ids    = { 25, 27, 30, 31, 39, 40, 67, 72, 83, 86, 108 },
            levels = {
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42 },
            },
            spawn_levels = { [25] = { 41, 43 }, [27] = { 41, 43 }, [30] = { 41, 43 }, [31] = { 41, 43 },
                             [39] = { 44, 46 }, [40] = { 44, 46 }, [67] = { 44, 46 }, [72] = { 44, 46 },
                             [83] = { 44, 46 }, [86] = { 44, 46 }, [108] = { 44, 46 } },
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
            name   = 'Hell Bat',
            ids    = { 34, 63, 68, 87, 143, 144, 149, 150 },
            levels = {
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42 },
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
            name   = 'Stegotaur PA',
            ids    = { 36, 37, 38, 44, 50, 51, 61, 73, 74, 82, 85, 89, 111, 127, 129, 132, 162, 163, 172, 173, 182,
                       183, 193, 194 },
            levels = {
                [44] = { acc = 162, eva = 145, agi = 33, int = 30, mnd = 48, chr = 43 },
                [45] = { acc = 165, eva = 149, agi = 35, int = 31, mnd = 48, chr = 45 },
                [46] = { acc = 170, eva = 152, agi = 35, int = 32, mnd = 49, chr = 46 },
                [47] = { acc = 173, eva = 155, agi = 35, int = 32, mnd = 50, chr = 46 },
                [48] = { acc = 176, eva = 159, agi = 36, int = 33, mnd = 50, chr = 47 },
            },
            spawn_levels = { [36] = { 44, 46 }, [37] = { 44, 46 }, [38] = { 44, 46 }, [44] = { 44, 46 },
                             [50] = { 44, 46 }, [51] = { 44, 46 }, [61] = { 45, 47 }, [73] = { 44, 46 },
                             [74] = { 44, 46 }, [82] = { 44, 46 }, [85] = { 44, 46 }, [89] = { 44, 46 },
                             [111] = { 44, 46 }, [127] = { 44, 46 }, [129] = { 44, 46 }, [132] = { 44, 46 },
                             [162] = { 46, 48 }, [163] = { 46, 48 }, [172] = { 46, 48 }, [173] = { 46, 48 },
                             [182] = { 46, 48 }, [183] = { 46, 48 }, [193] = { 46, 48 }, [194] = { 46, 48 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1697 },  -- piece of spruce lumber
                { rate = 50, item = 1877 },  -- fomor codex
                { rate = 50, item = 1620 },  -- taurus horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Fomor Beastmaster',
            ids    = { 42, 138 },
            levels = {
                [41] = { acc = 149, eva = 134, agi = 35, int = 39, mnd = 39, chr = 57 },
                [42] = { acc = 152, eva = 136, agi = 35, int = 39, mnd = 39, chr = 57 },
                [43] = { acc = 155, eva = 139, agi = 35, int = 39, mnd = 39, chr = 59 },
                [44] = { acc = 159, eva = 143, agi = 36, int = 40, mnd = 40, chr = 60 },
                [45] = { acc = 162, eva = 146, agi = 37, int = 42, mnd = 42, chr = 61 },
                [46] = { acc = 166, eva = 149, agi = 37, int = 42, mnd = 42, chr = 62 },
            },
            spawn_levels = { [42] = { 41, 44 }, [138] = { 44, 46 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15388 },  -- ophiuchus subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Bat',
            ids    = { 43, 139 },
            levels = {
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Makara',
            ids    = { 45, 46, 53, 54, 78, 79, 80, 84, 88, 110, 115, 118, 119, 122, 124, 147, 148, 203 },
            levels = {
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 37 },
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 40 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 40 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 40 },
            },
            spawn_levels = { [45] = { 44, 45 }, [46] = { 44, 45 }, [53] = { 45, 47 }, [54] = { 45, 47 },
                             [78] = { 45, 47 }, [79] = { 45, 47 }, [80] = { 45, 47 }, [84] = { 45, 47 },
                             [88] = { 45, 47 }, [110] = { 45, 47 }, [115] = { 44, 45 }, [118] = { 44, 45 },
                             [119] = { 44, 45 }, [122] = { 44, 45 }, [124] = { 44, 45 }, [147] = { 45, 47 },
                             [148] = { 45, 47 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1888 },  -- sack of silica
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 47 },
            levels = {
                [41] = { acc = 157, eva = 142, agi = 42, int = 35, mnd = 39, chr = 50 },
                [42] = { acc = 160, eva = 144, agi = 42, int = 35, mnd = 39, chr = 50 },
                [43] = { acc = 163, eva = 147, agi = 42, int = 35, mnd = 39, chr = 50 },
                [44] = { acc = 167, eva = 151, agi = 45, int = 36, mnd = 40, chr = 52 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15379 },  -- leo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
        },
        {
            name   = 'Fomors Wyvern',
            ids    = { 48, 137 },
            levels = {
                [36] = { acc = 132, eva = 124, agi = 42, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 133, agi = 44, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 149, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 49 },
            levels = {
                [41] = { acc = 151, eva = 151, agi = 50, int = 42, mnd = 32, chr = 38 },
                [42] = { acc = 154, eva = 154, agi = 50, int = 42, mnd = 32, chr = 38 },
                [43] = { acc = 157, eva = 157, agi = 50, int = 42, mnd = 32, chr = 38 },
                [44] = { acc = 161, eva = 161, agi = 52, int = 45, mnd = 33, chr = 39 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15376 },  -- taurus subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 4,
        },
        {
            name   = 'Oil Spill',
            ids    = { 52, 55, 116, 117, 120, 123, 125, 204 },
            levels = {
                [44] = { acc = 159, eva = 148, agi = 46, int = 36, mnd = 39, chr = 40 },
                [45] = { acc = 162, eva = 151, agi = 47, int = 37, mnd = 40, chr = 42 },
                [46] = { acc = 166, eva = 155, agi = 49, int = 37, mnd = 41, chr = 42 },
                [47] = { acc = 170, eva = 157, agi = 49, int = 38, mnd = 41, chr = 43 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 56 },
            levels = {
                [44] = { acc = 159, eva = 149, agi = 49, int = 36, mnd = 36, chr = 43 },
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45 },
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 37, chr = 46 },
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 5,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 57 },
            levels = {
                [44] = { acc = 163, eva = 183, agi = 52, int = 49, mnd = 33, chr = 36 },
                [45] = { acc = 167, eva = 186, agi = 52, int = 49, mnd = 33, chr = 36 },
                [46] = { acc = 170, eva = 190, agi = 54, int = 51, mnd = 34, chr = 38 },
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15377 },  -- gemini subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 6,
        },
        {
            name   = 'Fomor Summoner',
            ids    = { 58 },
            levels = {
                [44] = { acc = 155, eva = 133, agi = 45, int = 52, mnd = 52, chr = 55 },
                [45] = { acc = 159, eva = 136, agi = 45, int = 52, mnd = 52, chr = 55 },
                [46] = { acc = 162, eva = 138, agi = 45, int = 54, mnd = 54, chr = 58 },
                [47] = { acc = 165, eva = 142, agi = 47, int = 55, mnd = 55, chr = 58 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15384 },  -- capricornus subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 7,
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 59, 152 },
            levels = {
                [36] = { acc = 131, eva = 117, agi = 39, int = 46, mnd = 37, chr = 37 },
                [37] = { acc = 134, eva = 120, agi = 39, int = 47, mnd = 37, chr = 37 },
                [38] = { acc = 137, eva = 123, agi = 40, int = 47, mnd = 38, chr = 37 },
                [39] = { acc = 141, eva = 127, agi = 42, int = 49, mnd = 39, chr = 40 },
                [40] = { acc = 144, eva = 130, agi = 42, int = 49, mnd = 39, chr = 40 },
                [41] = { acc = 148, eva = 134, agi = 44, int = 52, mnd = 42, chr = 42 },
                [42] = { acc = 151, eva = 136, agi = 44, int = 52, mnd = 42, chr = 42 },
                [43] = { acc = 154, eva = 139, agi = 44, int = 53, mnd = 42, chr = 42 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Foul Meat',
            ids    = { 60, 105, 106, 107, 121, 126, 205 },
            levels = {
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 35, chr = 45 },
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 35, chr = 46 },
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 35, chr = 46 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 75 },
            levels = {
                [44] = { acc = 155, eva = 141, agi = 33, int = 33, mnd = 49, chr = 52 },
                [45] = { acc = 159, eva = 144, agi = 33, int = 33, mnd = 49, chr = 52 },
                [46] = { acc = 162, eva = 148, agi = 34, int = 34, mnd = 51, chr = 55 },
                [47] = { acc = 165, eva = 150, agi = 35, int = 35, mnd = 52, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15386 },  -- pisces subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Bard',
            ids    = { 76 },
            levels = {
                [44] = { acc = 157, eva = 138, agi = 36, int = 45, mnd = 45, chr = 55 },
                [45] = { acc = 160, eva = 140, agi = 37, int = 45, mnd = 45, chr = 55 },
                [46] = { acc = 163, eva = 143, agi = 37, int = 45, mnd = 45, chr = 58 },
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Mahisha',
            ids    = { 77 },
            nm     = true,
            levels = {
                [50] = { acc = 181, eva = 167, agi = 51, int = 38, mnd = 44, chr = 48 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 15219 },  -- sinister mask
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Minotaur',
            ids    = { 81 },
            nm     = true,
            levels = {
                [46] = { acc = 170, eva = 152, agi = 35, int = 32, mnd = 49, chr = 46 },
                [47] = { acc = 173, eva = 155, agi = 35, int = 32, mnd = 50, chr = 46 },
                [48] = { acc = 176, eva = 159, agi = 36, int = 33, mnd = 50, chr = 47 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Air Elemental',
            ids    = { 90, 155 },
            levels = {
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
            },
            spawn_levels = { [90] = { 45, 45 }, [155] = { 50, 50 } },
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
            name   = 'Thunder Elemental',
            ids    = { 91, 156 },
            levels = {
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
            },
            spawn_levels = { [91] = { 45, 45 }, [156] = { 50, 50 } },
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
            name   = 'Dark Elemental',
            ids    = { 92, 133, 157 },
            levels = {
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 33 },
                [50] = { acc = 180, eva = 167, agi = 50, int = 54, mnd = 36, chr = 36 },
            },
            spawn_levels = { [92] = { 45, 45 }, [133] = { 45, 45 }, [157] = { 50, 50 } },
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
            name   = 'Fomor Monk',
            ids    = { 94, 102, 104 },
            levels = {
                [44] = { acc = 161, eva = 147, agi = 36, int = 33, mnd = 45, chr = 43 },
                [45] = { acc = 164, eva = 150, agi = 37, int = 33, mnd = 45, chr = 45 },
                [46] = { acc = 168, eva = 153, agi = 37, int = 34, mnd = 45, chr = 46 },
            },
            spawn_levels = { [94] = { 44, 45 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 95 },
            levels = {
                [44] = { acc = 159, eva = 151, agi = 45, int = 40, mnd = 40, chr = 48 },
                [45] = { acc = 162, eva = 154, agi = 45, int = 42, mnd = 42, chr = 48 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15378 },  -- cancer subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 10,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 96 },
            levels = {
                [44] = { acc = 179, eva = 139, agi = 57, int = 40, mnd = 45, chr = 43 },
                [45] = { acc = 182, eva = 143, agi = 58, int = 42, mnd = 45, chr = 45 },
                [46] = { acc = 185, eva = 145, agi = 58, int = 42, mnd = 45, chr = 46 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 11,
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 97 },
            levels = {
                [44] = { acc = 159, eva = 147, agi = 45, int = 49, mnd = 33, chr = 36 },
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 36 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 12,
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 98 },
            levels = {
                [44] = { acc = 161, eva = 161, agi = 52, int = 45, mnd = 33, chr = 39 },
                [45] = { acc = 164, eva = 164, agi = 52, int = 45, mnd = 33, chr = 40 },
                [46] = { acc = 168, eva = 168, agi = 54, int = 45, mnd = 34, chr = 41 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15376 },  -- taurus subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 13,
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 99 },
            levels = {
                [45] = { acc = 162, eva = 138, agi = 49, int = 58, mnd = 42, chr = 48 },
                [46] = { acc = 166, eva = 141, agi = 51, int = 58, mnd = 42, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15375 },  -- aries subligar
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Tres Duendes',
            ids    = { 100 },
            nm     = true,
            levels = {
                [47] = { acc = 171, eva = 189, agi = 47, int = 46, mnd = 40, chr = 52 },
                [48] = { acc = 174, eva = 192, agi = 47, int = 47, mnd = 41, chr = 52 },
                [49] = { acc = 178, eva = 196, agi = 49, int = 47, mnd = 41, chr = 53 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            immune = { 'petrify' },
            drops  = {
                { rate = 240, item = 17510 },  -- vampiric claws
                { rate = 240, item = 18007 },  -- chiroptera dagger
                { rate = 240, item = 17794 },  -- niokiyotsuna
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
            links  = 14,
        },
        {
            name   = 'Duendes Amoroso',
            ids    = { 101 },
            levels = {
                [45] = { acc = 162, eva = 138, agi = 49, int = 58, mnd = 42, chr = 48 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 15,
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 112 },
            levels = {
                [44] = { acc = 155, eva = 141, agi = 33, int = 33, mnd = 49, chr = 52 },
                [45] = { acc = 159, eva = 144, agi = 33, int = 33, mnd = 49, chr = 52 },
                [46] = { acc = 162, eva = 148, agi = 34, int = 34, mnd = 51, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15386 },  -- pisces subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 16,
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 113 },
            levels = {
                [44] = { acc = 159, eva = 151, agi = 45, int = 40, mnd = 40, chr = 48 },
                [45] = { acc = 162, eva = 154, agi = 45, int = 42, mnd = 42, chr = 48 },
                [46] = { acc = 166, eva = 157, agi = 45, int = 42, mnd = 42, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15378 },  -- cancer subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 17,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 114 },
            levels = {
                [44] = { acc = 157, eva = 140, agi = 40, int = 49, mnd = 49, chr = 48 },
                [45] = { acc = 160, eva = 143, agi = 42, int = 49, mnd = 49, chr = 48 },
                [46] = { acc = 163, eva = 146, agi = 42, int = 51, mnd = 51, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 18,
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 136 },
            levels = {
                [44] = { acc = 167, eva = 151, agi = 45, int = 36, mnd = 40, chr = 52 },
                [45] = { acc = 170, eva = 154, agi = 45, int = 37, mnd = 42, chr = 52 },
                [46] = { acc = 173, eva = 157, agi = 45, int = 37, mnd = 42, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15379 },  -- leo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Thief',
            ids    = { 140 },
            levels = {
                [44] = { acc = 163, eva = 183, agi = 52, int = 49, mnd = 33, chr = 36 },
                [45] = { acc = 167, eva = 186, agi = 52, int = 49, mnd = 33, chr = 36 },
                [46] = { acc = 170, eva = 190, agi = 54, int = 51, mnd = 34, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15377 },  -- gemini subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 19,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 141 },
            levels = {
                [44] = { acc = 179, eva = 139, agi = 57, int = 40, mnd = 45, chr = 43 },
                [45] = { acc = 182, eva = 143, agi = 58, int = 42, mnd = 45, chr = 45 },
                [46] = { acc = 185, eva = 145, agi = 58, int = 42, mnd = 45, chr = 46 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 20,
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 142, 154 },
            levels = {
                [44] = { acc = 161, eva = 161, agi = 52, int = 45, mnd = 33, chr = 39 },
                [45] = { acc = 164, eva = 164, agi = 52, int = 45, mnd = 33, chr = 40 },
                [46] = { acc = 168, eva = 168, agi = 54, int = 45, mnd = 34, chr = 41 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15376 },  -- taurus subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Eba',
            ids    = { 145 },
            nm     = true,
            levels = {
                [48] = { acc = 173, eva = 159, agi = 47, int = 52, mnd = 35, chr = 38 },
                [49] = { acc = 176, eva = 162, agi = 47, int = 53, mnd = 35, chr = 39 },
                [50] = { acc = 180, eva = 167, agi = 50, int = 54, mnd = 36, chr = 39 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 240, item = 14466 },  -- fomor tunic
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fomor Summoner',
            ids    = { 151 },
            levels = {
                [44] = { acc = 155, eva = 133, agi = 45, int = 52, mnd = 52, chr = 55 },
                [45] = { acc = 159, eva = 136, agi = 45, int = 52, mnd = 52, chr = 55 },
                [46] = { acc = 162, eva = 138, agi = 45, int = 54, mnd = 54, chr = 58 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15384 },  -- capricornus subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 153 },
            levels = {
                [44] = { acc = 159, eva = 147, agi = 45, int = 49, mnd = 33, chr = 36 },
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 36 },
                [46] = { acc = 166, eva = 153, agi = 45, int = 51, mnd = 34, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 158 },
            levels = {
                [44] = { acc = 159, eva = 135, agi = 49, int = 57, mnd = 40, chr = 48 },
                [45] = { acc = 162, eva = 138, agi = 49, int = 58, mnd = 42, chr = 48 },
                [46] = { acc = 166, eva = 141, agi = 51, int = 58, mnd = 42, chr = 49 },
                [47] = { acc = 170, eva = 145, agi = 52, int = 61, mnd = 43, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15375 },  -- aries subligar
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 21,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 159 },
            levels = {
                [44] = { acc = 159, eva = 149, agi = 49, int = 36, mnd = 36, chr = 43 },
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45 },
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 37, chr = 46 },
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 22,
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 160 },
            levels = {
                [44] = { acc = 159, eva = 147, agi = 45, int = 49, mnd = 33, chr = 36 },
                [45] = { acc = 162, eva = 150, agi = 45, int = 49, mnd = 33, chr = 36 },
                [46] = { acc = 166, eva = 153, agi = 45, int = 51, mnd = 34, chr = 38 },
                [47] = { acc = 170, eva = 156, agi = 47, int = 52, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 23,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 164 },
            levels = {
                [47] = { acc = 189, eva = 149, agi = 61, int = 43, mnd = 47, chr = 46 },
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 24,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 165 },
            levels = {
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 25,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 166 },
            levels = {
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 25,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 167 },
            levels = {
                [47] = { acc = 189, eva = 149, agi = 61, int = 43, mnd = 47, chr = 46 },
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 24,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 168 },
            levels = {
                [47] = { acc = 189, eva = 149, agi = 61, int = 43, mnd = 47, chr = 46 },
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 26,
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 169 },
            levels = {
                [47] = { acc = 165, eva = 150, agi = 35, int = 35, mnd = 52, chr = 55 },
                [48] = { acc = 169, eva = 153, agi = 35, int = 35, mnd = 52, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15386 },  -- pisces subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 25,
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 170 },
            levels = {
                [47] = { acc = 165, eva = 150, agi = 35, int = 35, mnd = 52, chr = 55 },
                [48] = { acc = 169, eva = 153, agi = 35, int = 35, mnd = 52, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15386 },  -- pisces subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 25,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 171 },
            levels = {
                [47] = { acc = 189, eva = 149, agi = 61, int = 43, mnd = 47, chr = 46 },
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 26,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 174 },
            levels = {
                [47] = { acc = 167, eva = 149, agi = 43, int = 52, mnd = 52, chr = 50 },
                [48] = { acc = 170, eva = 152, agi = 44, int = 52, mnd = 52, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 27,
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 175 },
            levels = {
                [47] = { acc = 170, eva = 145, agi = 52, int = 61, mnd = 43, chr = 50 },
                [48] = { acc = 173, eva = 147, agi = 52, int = 61, mnd = 44, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15375 },  -- aries subligar
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 28,
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 176 },
            levels = {
                [47] = { acc = 170, eva = 145, agi = 52, int = 61, mnd = 43, chr = 50 },
                [48] = { acc = 173, eva = 147, agi = 52, int = 61, mnd = 44, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15375 },  -- aries subligar
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 28,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 177 },
            levels = {
                [47] = { acc = 167, eva = 149, agi = 43, int = 52, mnd = 52, chr = 50 },
                [48] = { acc = 170, eva = 152, agi = 44, int = 52, mnd = 52, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 27,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 178 },
            levels = {
                [47] = { acc = 167, eva = 149, agi = 43, int = 52, mnd = 52, chr = 50 },
                [48] = { acc = 170, eva = 152, agi = 44, int = 52, mnd = 52, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 29,
        },
        {
            name   = 'Fomor Monk',
            ids    = { 179 },
            levels = {
                [47] = { acc = 171, eva = 157, agi = 38, int = 35, mnd = 47, chr = 46 },
                [48] = { acc = 175, eva = 160, agi = 38, int = 35, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 28,
        },
        {
            name   = 'Fomor Monk',
            ids    = { 180 },
            levels = {
                [47] = { acc = 171, eva = 157, agi = 38, int = 35, mnd = 47, chr = 46 },
                [48] = { acc = 175, eva = 160, agi = 38, int = 35, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 28,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 181 },
            levels = {
                [47] = { acc = 167, eva = 149, agi = 43, int = 52, mnd = 52, chr = 50 },
                [48] = { acc = 170, eva = 152, agi = 44, int = 52, mnd = 52, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 29,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 185 },
            levels = {
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
                [48] = { acc = 173, eva = 162, agi = 52, int = 38, mnd = 38, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 30,
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 186 },
            levels = {
                [47] = { acc = 170, eva = 161, agi = 47, int = 43, mnd = 43, chr = 50 },
                [48] = { acc = 173, eva = 164, agi = 47, int = 44, mnd = 44, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15378 },  -- cancer subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 31,
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 187 },
            levels = {
                [47] = { acc = 170, eva = 161, agi = 47, int = 43, mnd = 43, chr = 50 },
                [48] = { acc = 173, eva = 164, agi = 47, int = 44, mnd = 44, chr = 50 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15378 },  -- cancer subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 100, item = 1738 },  -- shakudo ingot
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 31,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 188 },
            levels = {
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
                [48] = { acc = 173, eva = 162, agi = 52, int = 38, mnd = 38, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 30,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 189 },
            levels = {
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
                [48] = { acc = 173, eva = 162, agi = 52, int = 38, mnd = 38, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 25,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 190 },
            levels = {
                [47] = { acc = 189, eva = 149, agi = 61, int = 43, mnd = 47, chr = 46 },
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 31,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 191 },
            levels = {
                [47] = { acc = 189, eva = 149, agi = 61, int = 43, mnd = 47, chr = 46 },
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15380 },  -- virgo subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 31,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 192 },
            levels = {
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
                [48] = { acc = 173, eva = 162, agi = 52, int = 38, mnd = 38, chr = 47 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 25,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 195 },
            levels = {
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 32,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 196 },
            levels = {
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 38 },
                [48] = { acc = 177, eva = 197, agi = 56, int = 52, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15377 },  -- gemini subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 24,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 197 },
            levels = {
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 38 },
                [48] = { acc = 177, eva = 197, agi = 56, int = 52, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15377 },  -- gemini subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 24,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 198 },
            levels = {
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 32,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 199 },
            levels = {
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 32,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 200 },
            levels = {
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 38 },
                [48] = { acc = 177, eva = 197, agi = 56, int = 52, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15377 },  -- gemini subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 24,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 201 },
            levels = {
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 38 },
                [48] = { acc = 177, eva = 197, agi = 56, int = 52, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15377 },  -- gemini subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 24,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 202 },
            levels = {
                [47] = { acc = 167, eva = 147, agi = 38, int = 47, mnd = 47, chr = 58 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 15381 },  -- libra subligar
                { rate = 50, item = 1660 },  -- bronze key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 32,
        },
    },
    by_name = {},
}
