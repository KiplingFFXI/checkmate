-- Fort Ghelsba (zone 141).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Chariotbuster Byakzak', 'Hundredscar Hajwaj', 'Orcish Cursemaker', 'Orcish Fighter',
                'Orcish Flamethrower', 'Orcish Fodder', 'Orcish Grappler', 'Orcish Grunt', 'Orcish Mesmerizer',
                'Orcish Neckchopper', 'Orcish Panzer', 'Orcish Serjeant', 'Orcish Stonechucker' },
        [2] = { 'Cheiroptera', 'Spectacled Bats' },
        [3] = { 'Chariotbuster Byakzak', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Flamethrower',
                'Orcish Fodder', 'Orcish Grappler', 'Orcish Grunt', 'Orcish Mesmerizer', 'Orcish Neckchopper',
                'Orcish Panzer', 'Orcish Serjeant', 'Orcish Stonechucker' },
        [4] = { 'Sentry Lizard' },
        [5] = { 'Chariotbuster Byakzak', 'Hundredscar Hajwaj', 'Orcish Cursemaker', 'Orcish Fighter',
                'Orcish Flamethrower', 'Orcish Fodder', 'Orcish Grappler', 'Orcish Grunt', 'Orcish Mesmerizer',
                'Orcish Neckchopper', 'Orcish Serjeant', 'Orcish Stonechucker' },
        [6] = { 'Hundredscar Hajwaj', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Flamethrower', 'Orcish Fodder',
                'Orcish Grappler', 'Orcish Grunt', 'Orcish Mesmerizer', 'Orcish Neckchopper', 'Orcish Panzer',
                'Orcish Serjeant', 'Orcish Stonechucker' },
        [7] = { 'Chariotbuster Byakzak', 'Hundredscar Hajwaj', 'Orcish Cursemaker', 'Orcish Fighter',
                'Orcish Flamethrower', 'Orcish Fodder', 'Orcish Grappler', 'Orcish Grunt', 'Orcish Mesmerizer',
                'Orcish Neckchopper', 'Orcish Panzer', 'Orcish Stonechucker' },
    },
    monsters = {
        {
            name   = 'Pug Pugil',
            ids    = { 1, 2 },
            levels = {
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 9 },
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
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
            name   = 'Giant Pugil',
            ids    = { 3 },
            levels = {
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 11 },
                [11] = { acc = 44, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Puffer Pugil',
            ids    = { 4 },
            levels = {
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 13 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 15 },
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
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 17 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
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
            name   = 'Orcish Fodder',
            ids    = { 6, 9, 15, 20, 23, 26, 29, 33, 39, 42, 45, 51, 54, 57, 60, 64, 71, 77, 80 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 7, mnd = 9, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 9, mnd = 10, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 9, mnd = 10, chr = 13 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, item = 16656 },  -- orcish axe
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Mesmerizer',
            ids    = { 7, 10, 16, 21, 24, 27, 30, 34, 40, 43, 46, 52, 55, 58, 61, 65, 72, 74, 78, 81 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 12, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 14, mnd = 11, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 14, mnd = 11, chr = 14 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 4866 },  -- scroll of bind
                { rate = 50, item = 4862 },  -- scroll of blind
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12856 },  -- slops
                { rate = 10, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Grappler',
            ids    = { 8, 11, 17, 22, 25, 28, 31, 35, 41, 44, 47, 53, 56, 59, 62, 66, 73, 75, 79, 82 },
            levels = {
                [8] = { acc = 35, eva = 30, agi = 10, int = 7, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 33, agi = 11, int = 8, mnd = 11, chr = 13 },
                [10] = { acc = 42, eva = 37, agi = 12, int = 8, mnd = 12, chr = 13 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
                { rate = 10, item = 12704 },  -- bronze mittens
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Spectacled Bats',
            ids    = { 12, 13, 18, 36, 37, 48, 49, 67, 68, 89, 98, 102, 110, 117, 125 },
            levels = {
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 2,
        },
        {
            name   = 'Cheiroptera FG',
            ids    = { 14, 19, 38, 50, 69, 70, 90, 99, 103, 111, 118, 126, 159, 169, 178, 188, 195, 202, 216, 217 },
            levels = {
                [8] = { acc = 33, eva = 31, agi = 14, int = 9, mnd = 9, chr = 11 },
                [9] = { acc = 37, eva = 35, agi = 16, int = 10, mnd = 10, chr = 11 },
                [10] = { acc = 40, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
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
            name   = 'Orcish Flamethrower',
            ids    = { 32, 63, 127, 145, 168, 177, 181, 209 },
            levels = {
                [16] = { acc = 62, eva = 58, agi = 22, int = 11, mnd = 13, chr = 16 },
                [17] = { acc = 65, eva = 60, agi = 22, int = 13, mnd = 14, chr = 16 },
                [18] = { acc = 68, eva = 63, agi = 22, int = 13, mnd = 15, chr = 17 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Hundredscar Hajwaj',
            ids    = { 76 },
            nm     = true,
            levels = {
                [12] = { acc = 48, eva = 43, agi = 16, int = 9, mnd = 11, chr = 15 },
                [13] = { acc = 51, eva = 46, agi = 17, int = 11, mnd = 12, chr = 15 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 13051, 9000 },  -- coarse leggings
                    { 17412, 1000 },  -- wild cudgel
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Orcish Grunt',
            ids    = { 83, 86, 92, 95, 100, 104, 107, 114, 119, 122, 128, 131, 135, 138, 146, 149, 162, 165, 171,
                       174, 182, 185, 189, 192, 196, 199, 203, 210, 213, 218, 221, 224, 227 },
            levels = {
                [11] = { acc = 44, eva = 41, agi = 14, int = 9, mnd = 13, chr = 17 },
                [12] = { acc = 47, eva = 43, agi = 14, int = 9, mnd = 13, chr = 17 },
                [13] = { acc = 51, eva = 47, agi = 16, int = 11, mnd = 13, chr = 17 },
                [14] = { acc = 54, eva = 50, agi = 16, int = 11, mnd = 13, chr = 19 },
                [15] = { acc = 57, eva = 53, agi = 16, int = 11, mnd = 15, chr = 19 },
                [16] = { acc = 61, eva = 57, agi = 18, int = 11, mnd = 15, chr = 21 },
                [17] = { acc = 64, eva = 60, agi = 18, int = 13, mnd = 15, chr = 21 },
            },
            spawn_levels = { [83] = { 11, 13 }, [86] = { 11, 13 }, [92] = { 11, 13 }, [95] = { 11, 13 },
                             [100] = { 11, 13 }, [104] = { 11, 13 }, [107] = { 11, 13 }, [114] = { 11, 13 },
                             [119] = { 11, 13 }, [122] = { 11, 13 }, [128] = { 12, 15 }, [131] = { 12, 15 },
                             [135] = { 12, 15 }, [138] = { 12, 15 }, [146] = { 12, 15 }, [149] = { 12, 15 },
                             [162] = { 12, 15 }, [165] = { 12, 15 }, [171] = { 12, 15 }, [174] = { 12, 15 },
                             [182] = { 14, 17 }, [185] = { 14, 17 }, [189] = { 14, 17 }, [192] = { 14, 17 },
                             [196] = { 14, 17 }, [199] = { 14, 17 }, [203] = { 14, 17 }, [210] = { 14, 17 },
                             [213] = { 14, 17 }, [218] = { 14, 17 }, [221] = { 14, 17 }, [224] = { 14, 17 },
                             [227] = { 14, 17 } },
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
            ids    = { 84, 87, 91, 93, 96, 105, 108, 112, 115, 120, 123, 129, 132, 136, 139, 147, 150, 153, 160,
                       161, 163, 166, 172, 175, 179, 183, 186, 190, 193, 197, 200, 205, 211, 214, 219, 222, 225,
                       228 },
            levels = {
                [11] = { acc = 54, eva = 42, agi = 18, int = 11, mnd = 13, chr = 15 },
                [12] = { acc = 57, eva = 44, agi = 18, int = 11, mnd = 13, chr = 15 },
                [13] = { acc = 61, eva = 48, agi = 20, int = 12, mnd = 14, chr = 15 },
                [14] = { acc = 64, eva = 51, agi = 20, int = 12, mnd = 14, chr = 16 },
                [15] = { acc = 67, eva = 54, agi = 21, int = 13, mnd = 15, chr = 17 },
                [16] = { acc = 71, eva = 58, agi = 22, int = 13, mnd = 16, chr = 18 },
                [17] = { acc = 74, eva = 60, agi = 23, int = 14, mnd = 16, chr = 18 },
            },
            spawn_levels = { [84] = { 11, 13 }, [87] = { 11, 13 }, [91] = { 11, 13 }, [93] = { 11, 13 },
                             [96] = { 11, 13 }, [105] = { 11, 13 }, [108] = { 11, 13 }, [112] = { 11, 13 },
                             [115] = { 11, 13 }, [120] = { 11, 13 }, [123] = { 11, 13 }, [129] = { 12, 15 },
                             [132] = { 12, 15 }, [136] = { 12, 15 }, [139] = { 12, 15 }, [147] = { 12, 15 },
                             [150] = { 12, 15 }, [153] = { 12, 15 }, [160] = { 12, 15 }, [161] = { 12, 15 },
                             [163] = { 12, 15 }, [166] = { 12, 15 }, [172] = { 12, 15 }, [175] = { 12, 15 },
                             [179] = { 11, 13 }, [183] = { 14, 17 }, [186] = { 14, 17 }, [190] = { 14, 17 },
                             [193] = { 14, 17 }, [197] = { 14, 17 }, [200] = { 14, 17 }, [205] = { 14, 17 },
                             [211] = { 14, 17 }, [214] = { 14, 17 }, [219] = { 14, 17 }, [222] = { 14, 17 },
                             [225] = { 14, 17 }, [228] = { 14, 17 } },
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
            ids    = { 85, 88, 94, 97, 101, 106, 109, 116, 121, 124, 130, 133, 137, 140, 148, 151, 164, 167, 173,
                       176, 184, 187, 191, 194, 198, 201, 207, 212, 215, 220, 223, 226, 229 },
            levels = {
                [11] = { acc = 45, eva = 40, agi = 14, int = 13, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 42, agi = 14, int = 13, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 14, mnd = 11, chr = 13 },
                [14] = { acc = 55, eva = 49, agi = 16, int = 15, mnd = 11, chr = 14 },
                [15] = { acc = 58, eva = 52, agi = 16, int = 15, mnd = 12, chr = 14 },
                [16] = { acc = 62, eva = 56, agi = 18, int = 16, mnd = 13, chr = 16 },
                [17] = { acc = 65, eva = 58, agi = 18, int = 17, mnd = 13, chr = 16 },
            },
            spawn_levels = { [85] = { 11, 13 }, [88] = { 11, 13 }, [94] = { 11, 13 }, [97] = { 11, 12 },
                             [101] = { 11, 13 }, [106] = { 11, 13 }, [109] = { 11, 13 }, [116] = { 11, 13 },
                             [121] = { 11, 13 }, [124] = { 11, 13 }, [130] = { 12, 15 }, [133] = { 12, 15 },
                             [137] = { 12, 15 }, [140] = { 12, 15 }, [148] = { 12, 15 }, [151] = { 12, 15 },
                             [164] = { 12, 15 }, [167] = { 12, 15 }, [173] = { 12, 15 }, [176] = { 12, 15 },
                             [184] = { 14, 17 }, [187] = { 14, 17 }, [191] = { 14, 17 }, [194] = { 14, 17 },
                             [198] = { 14, 17 }, [201] = { 14, 17 }, [207] = { 14, 17 }, [212] = { 14, 17 },
                             [215] = { 14, 17 }, [220] = { 14, 17 }, [223] = { 14, 17 }, [226] = { 14, 17 },
                             [229] = { 14, 17 } },
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
            name   = 'Orcish Fighter',
            ids    = { 113, 180 },
            levels = {
                [21] = { acc = 79, eva = 73, agi = 24, int = 15, mnd = 17, chr = 22 },
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
            name   = 'Sentry Lizard',
            ids    = { 134, 141, 152, 154, 155, 156, 157, 158 },
            levels = {
                [11] = { acc = 45, eva = 41, agi = 16, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 43, agi = 16, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 46, agi = 17, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 50, agi = 18, int = 13, mnd = 13, chr = 14 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 100, item = 926 },  -- lizard tail
                { rate = 10, item = 852 },  -- lizard skin
            },
            links  = 4,
        },
        {
            name   = 'Orcish Panzer',
            ids    = { 142 },
            nm     = true,
            levels = {
                [20] = { acc = 75, eva = 70, agi = 24, int = 13, mnd = 15, chr = 18 },
                [21] = { acc = 79, eva = 74, agi = 26, int = 15, mnd = 17, chr = 20 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            resist = { virus = 10 },
            immune = { 'terror' },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 143 },
            levels = {
                [21] = { acc = 79, eva = 73, agi = 24, int = 15, mnd = 17, chr = 22 },
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
            name   = 'Chariotbuster Byakzak',
            ids    = { 144 },
            nm     = true,
            levels = {
                [23] = { acc = 85, eva = 78, agi = 24, int = 15, mnd = 17, chr = 22 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 15, mnd = 17, chr = 23 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 1000, item = 17708 },  -- auriga xiphos
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 204, 206, 208, 230 },
            levels = {
                [21] = { acc = 79, eva = 73, agi = 24, int = 23, mnd = 19, chr = 23 },
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
            ids    = { 231 },
            levels = {
                [21] = { acc = 78, eva = 70, agi = 18, int = 14, mnd = 22, chr = 25 },
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
            links  = 7,
        },
    },
    by_name = {},
}
