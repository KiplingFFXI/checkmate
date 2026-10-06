-- King Ranperres Tomb (zone 190).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sound = { 'Ding Bats', 'Dire Bat', 'Grave Bat', 'Mouse Bat', 'Plague Bats', 'Tomb Bat', 'Wind Bats' },
        },
        [2] = {
            sight = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                      'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver' },
        },
        [3] = { sound = { 'Airi' } },
        [4] = { sound = { 'Cemetery Cherry', 'Cherry Sapling' } },
        [5] = { sound = { 'Cherry Sapling' } },
        [6] = { sound = { 'Iruci', 'Pey' } },
        [7] = { sound = { 'Airi', 'Spook' } },
        [8] = { sight = { 'Locus Armet Beetle' } },
    },
    monsters = {
        {
            name   = 'Ding Bats',
            ids    = { 1, 2, 5, 6, 13, 14, 52, 53, 59, 60, 66, 67, 73, 74, 80, 81, 87, 88, 104, 105, 111, 112, 116,
                       117, 124, 125, 131, 132, 136, 137 },
            levels = {
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [1] = { 2, 4 }, [2] = { 2, 4 }, [5] = { 2, 4 }, [6] = { 2, 4 }, [13] = { 2, 4 },
                             [14] = { 2, 4 }, [52] = { 3, 5 }, [53] = { 3, 5 }, [59] = { 3, 5 }, [60] = { 3, 5 },
                             [66] = { 3, 5 }, [67] = { 3, 5 }, [73] = { 3, 5 }, [74] = { 3, 5 }, [80] = { 3, 5 },
                             [81] = { 3, 5 }, [87] = { 3, 5 }, [88] = { 3, 5 }, [104] = { 3, 5 }, [105] = { 3, 5 },
                             [111] = { 3, 5 }, [112] = { 3, 5 }, [116] = { 3, 5 }, [117] = { 3, 5 },
                             [124] = { 3, 5 }, [125] = { 3, 5 }, [131] = { 3, 5 }, [132] = { 3, 5 },
                             [136] = { 3, 5 }, [137] = { 3, 5 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 1112 },  -- handful of orcish mail scales
            },
            links  = 1,
        },
        {
            name   = 'Carrion Worm',
            ids    = { 3, 4, 7, 8, 9, 10, 11, 54, 61, 68, 75, 82, 89, 96, 101, 106, 113, 126, 133 },
            levels = {
                [2] = { acc = 13, eva = 10, agi = 8, int = 11, mnd = 8, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 12, mnd = 8, chr = 7 },
                [4] = { acc = 20, eva = 17, agi = 10, int = 13, mnd = 9, chr = 8 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
            },
            spawn_levels = { [3] = { 2, 4 }, [4] = { 2, 4 }, [7] = { 2, 4 }, [8] = { 2, 4 }, [9] = { 2, 4 },
                             [10] = { 2, 4 }, [11] = { 2, 4 }, [54] = { 3, 5 }, [61] = { 3, 5 }, [68] = { 3, 5 },
                             [75] = { 3, 5 }, [82] = { 3, 5 }, [89] = { 3, 5 }, [96] = { 3, 5 }, [101] = { 3, 5 },
                             [106] = { 3, 5 }, [113] = { 3, 5 }, [126] = { 3, 5 }, [133] = { 3, 5 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
        },
        {
            name   = 'Goblin Thug',
            ids    = { 12, 17, 31, 33, 37, 39, 43, 45, 50, 57, 64, 71, 78, 85, 92, 94, 97, 99, 102, 109, 122, 129 },
            levels = {
                [3] = { acc = 18, eva = 17, agi = 10, int = 9, mnd = 6, chr = 6 },
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            spawn_levels = { [12] = { 4, 8 }, [17] = { 4, 8 }, [31] = { 4, 8 }, [33] = { 4, 8 }, [37] = { 4, 8 },
                             [39] = { 4, 8 }, [43] = { 3, 6 }, [45] = { 4, 8 }, [50] = { 4, 8 }, [57] = { 4, 8 },
                             [64] = { 4, 8 }, [71] = { 4, 8 }, [78] = { 4, 8 }, [85] = { 4, 8 }, [92] = { 4, 8 },
                             [94] = { 4, 8 }, [97] = { 4, 8 }, [99] = { 4, 8 }, [102] = { 4, 8 }, [109] = { 6, 8 },
                             [122] = { 4, 8 }, [129] = { 4, 8 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 4387 },  -- wild onion
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Mouse Bat',
            ids    = { 15, 16, 19, 20, 21, 22, 23, 24, 25, 26, 29, 30, 35, 36, 41, 42, 47, 48, 49 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 18, 32, 34, 38, 40, 44, 46, 51, 58, 65, 72, 79, 86, 93, 95, 98, 100, 103, 110, 123, 130 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [79] = { 4, 7 }, [110] = { 5, 8 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 817 },  -- spool of grass thread
                { rate = 10, item = 824 },  -- square of grass cloth
                { rate = 10, item = 818 },  -- spool of cotton thread
                { rate = 10, item = 825 },  -- square of cotton cloth
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12856 },  -- slops
                { rate = 10, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Stone Eater',
            ids    = { 27, 28, 149, 155, 162, 169 },
            levels = {
                [5] = { acc = 23, eva = 19, agi = 10, int = 14, mnd = 10, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 15, mnd = 10, chr = 9 },
                [7] = { acc = 30, eva = 26, agi = 12, int = 16, mnd = 11, chr = 10 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 50, item = 13440 },  -- ascetics ring
                { rate = 240, item = 768 },  -- flint stone
                { rate = 150, item = 640 },  -- chunk of copper ore
                { rate = 100, item = 642 },  -- chunk of zinc ore
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
        },
        {
            name   = 'Enchanted Bones blm',
            ids    = { 55, 56, 62, 63, 69, 70, 77, 83, 84, 91, 107, 108, 114, 115, 119, 121, 128, 135, 139, 141 },
            levels = {
                [4] = { acc = 21, eva = 16, agi = 11, int = 12, mnd = 7, chr = 9 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 9 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 9 },
                [7] = { acc = 31, eva = 25, agi = 13, int = 15, mnd = 9, chr = 11 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 11 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Enchanted Bones war',
            ids    = { 76, 90, 118, 120, 127, 134, 138, 140 },
            levels = {
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 6, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Spook',
            ids    = { 142 },
            levels = {
                [11] = { acc = 44, eva = 41, agi = 16, int = 14, mnd = 11, chr = 15 },
                [12] = { acc = 47, eva = 43, agi = 16, int = 14, mnd = 11, chr = 15 },
                [13] = { acc = 50, eva = 46, agi = 17, int = 15, mnd = 12, chr = 15 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 13613 },  -- travelers mantle
                { rate = 50, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Wind Bats',
            ids    = { 143, 147, 148, 153, 154, 159, 160, 166, 167, 176, 177 },
            levels = {
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
            links  = 1,
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 144, 150, 156, 163, 170, 173, 179, 224, 227, 232, 235, 240, 243 },
            levels = {
                [12] = { acc = 56, eva = 41, agi = 20, int = 13, mnd = 13, chr = 13 },
                [13] = { acc = 60, eva = 44, agi = 21, int = 14, mnd = 15, chr = 14 },
                [14] = { acc = 63, eva = 47, agi = 22, int = 14, mnd = 15, chr = 14 },
                [15] = { acc = 67, eva = 50, agi = 23, int = 15, mnd = 15, chr = 15 },
                [16] = { acc = 70, eva = 53, agi = 24, int = 16, mnd = 17, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 937 },  -- block of animal glue
                { rate = 10, item = 1027 },  -- ranperre chest key
                { rate = 10, item = 12440 },  -- leather bandana
                { rate = 10, item = 12696 },  -- leather gloves
                { rate = 10, item = 12824 },  -- leather trousers
                { rate = 10, item = 12952 },  -- leather highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 145, 151, 157, 164, 171, 174, 180, 225, 228, 233, 236, 241, 244 },
            levels = {
                [12] = { acc = 48, eva = 42, agi = 15, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 17, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 49, agi = 17, int = 18, mnd = 12, chr = 12 },
                [15] = { acc = 58, eva = 52, agi = 17, int = 18, mnd = 12, chr = 12 },
                [16] = { acc = 62, eva = 56, agi = 19, int = 20, mnd = 14, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 1027 },  -- ranperre chest key
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 146, 152, 158, 165, 172, 175, 181, 226, 229, 234, 237, 242, 245 },
            levels = {
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
                [15] = { acc = 58, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 62, eva = 58, agi = 22, int = 14, mnd = 14, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 1027 },  -- ranperre chest key
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Grave Bat',
            ids    = { 161, 168, 178, 182, 183, 184, 195, 196, 201, 202, 207, 217, 222, 223, 230, 231, 238, 239,
                       246, 247 },
            levels = {
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            spawn_levels = { [161] = { 12, 12 }, [230] = { 11, 12 }, [238] = { 11, 12 }, [239] = { 11, 12 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 100, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Rock Eater',
            ids    = { 185, 186, 187, 188, 189, 190, 191, 192, 256, 257, 260, 261, 268, 269, 272, 273, 280, 281,
                       289, 290 },
            levels = {
                [14] = { acc = 53, eva = 47, agi = 17, int = 22, mnd = 15, chr = 14 },
                [15] = { acc = 56, eva = 49, agi = 17, int = 23, mnd = 16, chr = 15 },
                [16] = { acc = 60, eva = 53, agi = 19, int = 24, mnd = 17, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 1000, item = 768 },  -- flint stone
                { rate = 150, item = 640 },  -- chunk of copper ore
                { rate = 100, item = 642 },  -- chunk of zinc ore
                { rate = 50, item = 13440 },  -- ascetics ring
                { rate = 50, item = 1027 },  -- ranperre chest key
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
        },
        {
            name   = 'Goblin Gruel',
            ids    = { 193, 194 },
            levels = {
                [18] = { acc = 67, eva = 62, agi = 20, int = 15, mnd = 17, chr = 17 },
                [19] = { acc = 71, eva = 65, agi = 21, int = 16, mnd = 18, chr = 18 },
                [20] = { acc = 74, eva = 68, agi = 21, int = 16, mnd = 18, chr = 18 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 13364 },  -- valor earring
                { rate = 50, item = 1027 },  -- ranperre chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Nachzehrer war',
            ids    = { 197, 199, 203, 205, 213, 215, 218, 220, 248, 250 },
            levels = {
                [15] = { acc = 58, eva = 53, agi = 18, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 62, eva = 57, agi = 20, int = 14, mnd = 13, chr = 16 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 15, mnd = 14, chr = 16 },
                [18] = { acc = 68, eva = 62, agi = 20, int = 15, mnd = 15, chr = 17 },
            },
            spawn_levels = { [213] = { 16, 18 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1027 },  -- ranperre chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Nachzehrer blm',
            ids    = { 198, 200, 204, 206, 214, 216, 219, 221, 249, 251 },
            levels = {
                [15] = { acc = 58, eva = 48, agi = 18, int = 21, mnd = 15, chr = 15 },
                [16] = { acc = 62, eva = 51, agi = 20, int = 22, mnd = 15, chr = 17 },
                [17] = { acc = 65, eva = 54, agi = 20, int = 23, mnd = 15, chr = 17 },
                [18] = { acc = 68, eva = 56, agi = 20, int = 23, mnd = 17, chr = 17 },
            },
            spawn_levels = { [219] = { 15, 17 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1027 },  -- ranperre chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tomb Bat',
            ids    = { 209, 210, 211 },
            levels = {
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 18 },
            },
            ph_for = { [211] = { 212 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 50, item = 1027 },  -- ranperre chest key
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Crypt Ghost',
            ids    = { 212 },
            levels = {
                [20] = { acc = 74, eva = 69, agi = 22, int = 19, mnd = 15, chr = 20 },
                [21] = { acc = 78, eva = 73, agi = 24, int = 21, mnd = 17, chr = 23 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 100, item = 12922 },  -- martial slacks
                { rate = 50, item = 529 },  -- luminicloth
                { rate = 10, item = 1027 },  -- ranperre chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Plague Bats',
            ids    = { 252, 254, 255, 258, 259, 262, 263, 264, 266, 267, 270, 271, 282, 291 },
            levels = {
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 16 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 50, item = 1027 },  -- ranperre chest key
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 274, 277, 283, 286 },
            levels = {
                [21] = { acc = 81, eva = 90, agi = 28, int = 24, mnd = 17, chr = 17 },
                [22] = { acc = 84, eva = 93, agi = 28, int = 24, mnd = 17, chr = 17 },
                [23] = { acc = 87, eva = 96, agi = 28, int = 24, mnd = 17, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12705 },  -- brass mittens
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12961 },  -- brass leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 275, 278, 284, 287 },
            levels = {
                [21] = { acc = 76, eva = 65, agi = 22, int = 20, mnd = 27, chr = 24 },
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 27, chr = 24 },
                [23] = { acc = 82, eva = 70, agi = 22, int = 20, mnd = 28, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4666 },  -- scroll of paralyze
                { rate = 50, item = 4680 },  -- scroll of barsleep
                { rate = 50, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4681 },  -- scroll of barpoison
                { rate = 50, item = 4733 },  -- scroll of protectra
                { rate = 50, item = 4745 },  -- scroll of sneak
                { rate = 10, item = 4744 },  -- scroll of invisible
                { rate = 10, item = 4746 },  -- scroll of deodorize
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 276, 279, 285, 288 },
            levels = {
                [21] = { acc = 79, eva = 67, agi = 26, int = 27, mnd = 20, chr = 22 },
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 20, chr = 22 },
                [23] = { acc = 85, eva = 72, agi = 26, int = 28, mnd = 20, chr = 22 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 952 },  -- bag of poison flour
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Cherry Sapling',
            ids    = { 292, 293, 294, 295, 296, 297, 299, 300 },
            levels = {
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 49, chr = 52 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 49, chr = 52 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 50, chr = 52 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Cemetery Cherry',
            ids    = { 298 },
            nm     = true,
            levels = {
                [72] = { acc = 298, eva = 282, agi = 70, int = 79, mnd = 55, chr = 53 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 80, mnd = 56, chr = 54 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 50, item = 17070 },  -- living rod
                { rate = 50, item = 722 },  -- divine log
                { rate = 1000, group = {  -- one of
                    { 701, 1 },  -- rosewood log
                    { 702, 1 },  -- ebony log
                    { 703, 1 },  -- petrified log
                } },
                { rate = 1000, group = { { 700, 1 }, { 701, 1 } } },  -- one of mahogany log, rosewood log
                { rate = 1000, group = { { 700, 1 }, { 701, 1 } } },  -- one of mahogany log, rosewood log
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Hati',
            ids    = { 301, 304, 375, 377, 378, 379, 398, 399, 405, 416, 417, 425, 426 },
            levels = {
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 57, chr = 73 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 57, chr = 74 },
            },
            spawn_levels = { [301] = { 77, 78 }, [304] = { 77, 78 } },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 858 },  -- wolf hide
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Spartoi Warrior',
            ids    = { 302, 305, 376, 380, 381, 382, 388, 389, 394, 395, 396, 400, 406, 407, 410, 411, 418, 419,
                       420, 427, 428, 429, 430 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 57, chr = 68 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 57, chr = 69 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 57, chr = 69 },
            },
            spawn_levels = { [302] = { 78, 79 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 240, item = 880 },  -- bone chip
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Spartoi Sorcerer',
            ids    = { 303, 306, 384, 385, 386, 387, 391, 392, 393, 397, 402, 403, 404, 408, 409, 412, 413, 414,
                       415, 422, 423, 424, 433, 434, 435, 436, 437 },
            levels = {
                [80] = { acc = 344, eva = 302, agi = 82, int = 96, mnd = 65, chr = 75 },
                [81] = { acc = 352, eva = 307, agi = 85, int = 98, mnd = 67, chr = 77 },
                [82] = { acc = 358, eva = 312, agi = 85, int = 98, mnd = 67, chr = 77 },
            },
            spawn_levels = { [303] = { 80, 81 }, [306] = { 80, 81 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 240, item = 880 },  -- bone chip
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 10, item = 4759 },  -- scroll of blizzard iii
                { rate = 10, item = 4788 },  -- scroll of blizzaga ii
                { rate = 10, item = 4789 },  -- scroll of blizzaga iii
                { rate = 10, item = 4760 },  -- scroll of blizzard iv
                { rate = 10, item = 4814 },  -- scroll of freeze
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Vrtra',
            ids    = { 307 },
            nm     = true,
            levels = {
                [95] = { acc = 498, eva = 450, agi = 99, int = 119, mnd = 71, chr = 107 },
            },
            ranks  = { light = -2, dark = 11, light_sleep = -2, dark_sleep = 11, blind = 11 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'bind', 'blind', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1712 },  -- clump of cashmere wool
                { rate = 1000, item = 1712 },  -- clump of cashmere wool
                { rate = 1000, item = 1713 },  -- spool of cashmere thread
                { rate = 1000, item = 1713 },  -- spool of cashmere thread
                { rate = 150, item = 15175 },  -- revilers helm
                { rate = 240, group = {  -- one of
                    { 903, 4500 },  -- dragon talon
                    { 1133, 4500 },  -- vial of dragon blood
                    { 4272, 1000 },  -- slice of dragon meat
                } },
                { rate = 240, group = { { 1816, 7500 }, { 4486, 2500 } } },  -- one of wyrm horn, dragon heart
                { rate = 240, group = {  -- one of
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
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Pey',
            ids    = { 308, 309 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 55, chr = 66 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 6,
        },
        {
            name   = 'Iruci',
            ids    = { 310, 311 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 283, agi = 80, int = 92, mnd = 62, chr = 72 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 6,
        },
        {
            name   = 'Airi',
            ids    = { 312, 313 },
            nm     = true,
            levels = {
                [81] = { acc = 349, eva = 307, agi = 85, int = 103, mnd = 67, chr = 82 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 7,
        },
        {
            name   = 'Corrupted Yorgos',
            ids    = { 314 },
            nm     = true,
            levels = {
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 46, chr = 56 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Corrupted Soffeil',
            ids    = { 315 },
            nm     = true,
            levels = {
                [63] = { acc = 252, eva = 217, agi = 66, int = 78, mnd = 52, chr = 60 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Corrupted Ulbrig',
            ids    = { 316 },
            nm     = true,
            levels = {
                [63] = { acc = 252, eva = 217, agi = 66, int = 78, mnd = 52, chr = 60 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Hahava',
            ids    = { 317, 318, 319 },
            nm     = true,
            levels = {
                [94] = { acc = 440, eva = 404, agi = 102, int = 104, mnd = 83, chr = 91 },
                [95] = { acc = 447, eva = 409, agi = 102, int = 105, mnd = 84, chr = 91 },
            },
            ranks  = { ice = 5, wind = 2, earth = 3, thunder = 2, water = 2, dark = 9, paralyze = 5, bind = 5,
                       silence = 2, slow = 3, poison = 2, dark_sleep = 9, blind = 9, stun = 2, gravity = 2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Arcus Blades',
            ids    = { 320 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Locus Tomb Worm',
            ids    = { 321, 322, 327, 328, 329, 330, 331, 332, 337, 338, 339, 340, 341, 345, 346, 348, 349, 350,
                       351, 352, 355, 356, 357, 358, 362, 363, 366, 367, 368 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 74, mnd = 56, chr = 54 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 77, mnd = 59, chr = 57 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 77, mnd = 59, chr = 57 },
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
        },
        {
            name   = 'Dire Bat UDT TC SSG',
            ids    = { 323, 324, 325, 326, 333, 334, 335, 342, 343, 347, 353, 369 },
            levels = {
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
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
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Cutlass Scorpion AC',
            ids    = { 336, 344, 354 },
            levels = {
                [63] = { acc = 248, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 254, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 259, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
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
            name   = 'Locus Armet Beetle',
            ids    = { 359, 360, 361, 364, 365 },
            levels = {
                [64] = { acc = 252, eva = 230, agi = 42, int = 42, mnd = 64, chr = 64 },
                [65] = { acc = 258, eva = 235, agi = 43, int = 43, mnd = 65, chr = 65 },
                [66] = { acc = 263, eva = 240, agi = 44, int = 44, mnd = 67, chr = 67 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 100, item = 889 },  -- beetle shell
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 8,
        },
        {
            name   = 'Dodomeki',
            ids    = { 370, 371, 372, 373, 374 },
            levels = {
                [60] = { acc = 234, eva = 212, agi = 63, int = 78, mnd = 53, chr = 57 },
                [61] = { acc = 240, eva = 218, agi = 66, int = 80, mnd = 55, chr = 60 },
                [62] = { acc = 245, eva = 223, agi = 66, int = 80, mnd = 55, chr = 60 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 150, item = 914 },  -- vial of mercury
                { rate = 50, item = 1289 },  -- burning hakutaku eye
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ghost',
            ids    = { 383, 390, 401, 421, 431, 432, 438 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 78, mnd = 60, chr = 76 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 827 },  -- square of wool cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
