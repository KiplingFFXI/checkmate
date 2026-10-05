-- Halvung (zone 62).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Qiqirn Diamantaire', 'Qiqirn Mercenary' },
        [2] = { 'Qiqirn Mercenary' },
        [3] = { 'Purgatory Bat', 'Volcanic Bats' },
        [4] = { 'Hilltroll Mirror Guard', 'Troll Artilleryman', 'Troll Cameist', 'Troll Combatant',
                'Troll Cuirasser', 'Troll Engraver', 'Troll Gemologist', 'Troll Grenadier', 'Troll Ironworker',
                'Troll Lapidarist', 'Troll Machinist', 'Troll Mythril Guard', 'Troll Scrimer', 'Troll Smelter',
                'Troll Stoneworker', 'Troll Targeteer', 'Woodtroll Mirror Guard' },
        [5] = { 'Achamoth', 'Achamoth Nympha', 'Achamothcampa', 'Wamoura', 'Wamouracampa' },
        [6] = { 'Magmatic Eruca' },
        [7] = { 'Moblin Billionaire', 'Moblin Millionaire' },
        [8] = { 'Achamoth Nympha', 'Achamothcampa', 'Wamoura', 'Wamouracampa' },
    },
    monsters = {
        {
            name   = 'Qiqirn Mercenary',
            ids    = { 1, 101 },
            levels = {
                [72] = { acc = 346, eva = 271, agi = 92, int = 60, mnd = 67, chr = 63 },
                [73] = { acc = 353, eva = 275, agi = 93, int = 60, mnd = 70, chr = 64 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 1,
        },
        {
            name   = 'Qiqirn Diamantaire',
            ids    = { 2 },
            levels = {
                [72] = { acc = 308, eva = 353, agi = 84, int = 72, mnd = 51, chr = 51 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 72, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 2,
        },
        {
            name   = 'Volcanic Bats',
            ids    = { 4, 7, 13, 14, 46, 51, 100, 102, 103 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
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
            links  = 3,
        },
        {
            name   = 'Purgatory Bat',
            ids    = { 5, 8, 12, 15, 47, 48, 53, 104, 105 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
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
            links  = 3,
        },
        {
            name   = 'Troll Gemologist',
            ids    = { 6, 32, 38, 56, 57, 75, 87, 99, 124, 130, 179, 182, 195 },
            levels = {
                [71] = { acc = 290, eva = 266, agi = 48, int = 48, mnd = 80, chr = 75, resist = { sleep = 20 } },
                [72] = { acc = 295, eva = 271, agi = 48, int = 48, mnd = 80, chr = 75, resist = { sleep = 20 } },
                [73] = { acc = 300, eva = 276, agi = 48, int = 48, mnd = 80, chr = 76, resist = { sleep = 20 } },
                [74] = { acc = 305, eva = 281, agi = 48, int = 48, mnd = 82, chr = 77, resist = { sleep = 20 } },
                [75] = { acc = 311, eva = 286, agi = 49, int = 49, mnd = 82, chr = 77, resist = { sleep = 25 } },
            },
            spawn_levels = { [6] = { 73, 73 }, [32] = { 73, 75 }, [38] = { 73, 75 }, [56] = { 73, 75 },
                             [57] = { 73, 75 }, [75] = { 73, 75 }, [87] = { 71, 73 }, [99] = { 73, 75 },
                             [124] = { 73, 75 }, [130] = { 71, 73 }, [179] = { 73, 75 }, [182] = { 73, 75 },
                             [195] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Stoneworker',
            ids    = { 9, 16, 20, 45, 85, 125, 193, 282 },
            levels = {
                [71] = { acc = 298, eva = 275, agi = 52, int = 48, mnd = 72, chr = 63 },
                [72] = { acc = 303, eva = 280, agi = 52, int = 48, mnd = 72, chr = 63 },
                [73] = { acc = 309, eva = 286, agi = 54, int = 48, mnd = 74, chr = 64 },
                [74] = { acc = 314, eva = 291, agi = 54, int = 48, mnd = 75, chr = 64 },
                [75] = { acc = 320, eva = 296, agi = 55, int = 49, mnd = 75, chr = 65 },
            },
            spawn_levels = { [9] = { 71, 72 }, [16] = { 73, 75 }, [20] = { 73, 75 }, [45] = { 73, 75 },
                             [85] = { 71, 73 }, [125] = { 73, 75 }, [193] = { 73, 75 }, [282] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Lapidarist',
            ids    = { 10, 26, 40, 58, 73, 79, 89, 123, 131, 183 },
            levels = {
                [71] = { acc = 296, eva = 274, agi = 64, int = 72, mnd = 56, chr = 51, resist = { paralyze = 20 } },
                [72] = { acc = 301, eva = 279, agi = 64, int = 72, mnd = 56, chr = 51, resist = { paralyze = 20 } },
                [73] = { acc = 306, eva = 285, agi = 66, int = 72, mnd = 56, chr = 52, resist = { paralyze = 20 } },
                [74] = { acc = 312, eva = 290, agi = 66, int = 73, mnd = 57, chr = 52, resist = { paralyze = 20 } },
                [75] = { acc = 317, eva = 295, agi = 67, int = 74, mnd = 57, chr = 52, resist = { paralyze = 25 } },
            },
            spawn_levels = { [10] = { 71, 73 }, [26] = { 73, 75 }, [40] = { 73, 75 }, [58] = { 73, 75 },
                             [73] = { 73, 75 }, [79] = { 71, 73 }, [89] = { 71, 73 }, [123] = { 73, 75 },
                             [131] = { 71, 73 }, [183] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Smelter',
            ids    = { 11, 25, 37, 61, 185, 196 },
            levels = {
                [71] = { acc = 340, eva = 262, agi = 84, int = 60, mnd = 72, chr = 63 },
                [72] = { acc = 345, eva = 267, agi = 84, int = 60, mnd = 72, chr = 63 },
                [73] = { acc = 351, eva = 271, agi = 85, int = 60, mnd = 74, chr = 64 },
                [74] = { acc = 356, eva = 276, agi = 85, int = 60, mnd = 75, chr = 64 },
                [75] = { acc = 361, eva = 282, agi = 88, int = 62, mnd = 75, chr = 65 },
            },
            spawn_levels = { [11] = { 71, 73 }, [25] = { 73, 75 }, [37] = { 73, 75 }, [61] = { 73, 75 },
                             [185] = { 71, 73 }, [196] = { 71, 73 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Engraver',
            ids    = { 17, 29, 63, 76, 128, 134, 175, 186, 191 },
            levels = {
                [71] = { acc = 298, eva = 320, agi = 72, int = 60, mnd = 60, chr = 75 },
                [72] = { acc = 303, eva = 325, agi = 72, int = 60, mnd = 60, chr = 75 },
                [73] = { acc = 309, eva = 330, agi = 72, int = 60, mnd = 62, chr = 76 },
                [74] = { acc = 314, eva = 335, agi = 73, int = 60, mnd = 63, chr = 77 },
                [75] = { acc = 320, eva = 341, agi = 74, int = 62, mnd = 63, chr = 77 },
            },
            spawn_levels = { [17] = { 73, 75 }, [29] = { 73, 75 }, [63] = { 73, 75 }, [76] = { 71, 73 },
                             [128] = { 71, 73 }, [134] = { 71, 73 }, [175] = { 73, 75 }, [186] = { 73, 75 },
                             [191] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 2333 },  -- puppetmasters testimony
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Trolls Automaton',
            ids    = { 18, 30, 64, 77, 129, 135, 176, 187, 192, 235, 258, 271, 304, 311, 336, 346, 358, 373, 383 },
            levels = {
                [69] = { acc = 273, eva = 241, agi = 60, int = 60, mnd = 84, chr = 72 },
                [70] = { acc = 278, eva = 246, agi = 61, int = 61, mnd = 85, chr = 73 },
                [71] = { acc = 283, eva = 251, agi = 63, int = 63, mnd = 87, chr = 75 },
                [72] = { acc = 288, eva = 256, agi = 63, int = 63, mnd = 87, chr = 75 },
                [73] = { acc = 295, eva = 261, agi = 64, int = 64, mnd = 89, chr = 76 },
                [74] = { acc = 300, eva = 266, agi = 64, int = 64, mnd = 89, chr = 77 },
                [75] = { acc = 305, eva = 270, agi = 65, int = 65, mnd = 91, chr = 77 },
                [76] = { acc = 310, eva = 276, agi = 66, int = 66, mnd = 92, chr = 80 },
                [77] = { acc = 316, eva = 280, agi = 66, int = 66, mnd = 93, chr = 80 },
                [78] = { acc = 321, eva = 286, agi = 68, int = 68, mnd = 93, chr = 80 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Troll Cameist',
            ids    = { 19, 22, 36, 42, 54, 86, 98, 127, 178, 180, 190 },
            levels = {
                [71] = { acc = 292, eva = 264, agi = 60, int = 72, mnd = 80, chr = 67 },
                [72] = { acc = 297, eva = 269, agi = 60, int = 72, mnd = 80, chr = 67 },
                [73] = { acc = 303, eva = 274, agi = 60, int = 72, mnd = 80, chr = 70 },
                [74] = { acc = 308, eva = 278, agi = 60, int = 73, mnd = 82, chr = 70 },
                [75] = { acc = 313, eva = 284, agi = 62, int = 74, mnd = 82, chr = 70 },
            },
            spawn_levels = { [19] = { 73, 75 }, [22] = { 73, 75 }, [36] = { 73, 75 }, [42] = { 73, 75 },
                             [54] = { 73, 75 }, [86] = { 71, 73 }, [98] = { 73, 75 }, [127] = { 71, 73 },
                             [178] = { 73, 75 }, [180] = { 73, 75 }, [190] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Ironworker',
            ids    = { 21, 31, 41, 60, 78, 126, 177, 184, 189, 197 },
            levels = {
                [71] = { acc = 296, eva = 278, agi = 72, int = 52, mnd = 60, chr = 63 },
                [72] = { acc = 301, eva = 283, agi = 72, int = 52, mnd = 60, chr = 63 },
                [73] = { acc = 306, eva = 288, agi = 72, int = 54, mnd = 62, chr = 64 },
                [74] = { acc = 312, eva = 293, agi = 73, int = 54, mnd = 63, chr = 64 },
                [75] = { acc = 317, eva = 299, agi = 74, int = 55, mnd = 63, chr = 65 },
            },
            spawn_levels = { [21] = { 73, 75 }, [31] = { 73, 75 }, [41] = { 73, 75 }, [60] = { 73, 75 },
                             [78] = { 71, 73 }, [126] = { 73, 75 }, [177] = { 73, 75 }, [184] = { 73, 75 },
                             [189] = { 73, 75 }, [197] = { 73, 75 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 50, item = 2223 },  -- halvung brass key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Earth Elemental',
            ids    = { 23, 139, 157, 287 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
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
            name   = 'Black Pudding',
            ids    = { 24, 27, 28, 34, 39, 43, 44, 55, 59, 62, 65, 141, 145 },
            levels = {
                [72] = { acc = 298, eva = 262, agi = 75, int = 92, mnd = 60, chr = 72 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 93, mnd = 60, chr = 74 },
                [74] = { acc = 309, eva = 272, agi = 77, int = 94, mnd = 60, chr = 75 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            drops  = {
                { rate = 240, item = 2175 },  -- chunk of flan meat
            },
            aggro  = true,
            detects = { 'sight', 'ability' },
        },
        {
            name   = 'Wamouracampa',
            ids    = { 33, 35, 94, 96, 136, 137, 138, 140, 142, 143, 146, 147, 148, 151, 152, 153, 163, 166, 168,
                       170, 172, 202, 207 },
            levels = {
                [72] = { acc = 297, eva = 283, agi = 72, int = 52, mnd = 52, chr = 60 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62 },
                [76] = { acc = 319, eva = 304, agi = 76, int = 55, mnd = 55, chr = 62 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2173 },  -- wamoura cocoon
            },
            links  = 5,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Magmatic Eruca',
            ids    = { 49, 50, 66, 67, 68, 69, 70, 71, 72, 80, 81, 82, 83, 84, 90, 91, 106, 107, 108, 109, 110, 111,
                       112, 113, 114, 115, 116, 117, 118, 132, 133, 154, 155, 156, 158, 159, 160, 161, 162 },
            levels = {
                [71] = { acc = 293, eva = 278, agi = 72, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 293, agi = 73, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 58, chr = 65 },
            },
            spawn_levels = { [49] = { 71, 73 }, [50] = { 71, 73 }, [66] = { 72, 74 }, [67] = { 72, 74 },
                             [68] = { 72, 74 }, [69] = { 72, 74 }, [70] = { 72, 74 }, [71] = { 72, 74 },
                             [72] = { 72, 74 }, [80] = { 73, 75 }, [81] = { 73, 75 }, [82] = { 73, 75 },
                             [83] = { 73, 75 }, [84] = { 73, 75 }, [90] = { 71, 73 }, [91] = { 71, 73 },
                             [106] = { 71, 73 }, [107] = { 71, 73 }, [108] = { 71, 73 }, [109] = { 71, 73 },
                             [110] = { 71, 73 }, [111] = { 71, 73 }, [112] = { 71, 73 }, [113] = { 71, 73 },
                             [114] = { 71, 73 }, [115] = { 71, 73 }, [116] = { 71, 73 }, [117] = { 71, 73 },
                             [118] = { 71, 73 }, [132] = { 71, 73 }, [133] = { 71, 73 }, [154] = { 73, 75 },
                             [155] = { 73, 75 }, [156] = { 73, 75 }, [158] = { 73, 75 }, [159] = { 73, 75 },
                             [160] = { 73, 75 }, [161] = { 73, 75 }, [162] = { 73, 75 } },
            ranks  = { fire = 1, ice = -1, wind = -1, thunder = -1, water = -2, dark = -1, paralyze = -1, bind = -1,
                       silence = -1, poison = -2, dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 839 },  -- piece of crawler cocoon
                { rate = 50, item = 816 },  -- spool of silk thread
                { rate = 150, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'sleeps',
            aggro_hours = { 6, 20 },
            links  = 6,
        },
        {
            name   = 'Moblin Millionaire',
            ids    = { 74, 194, 308 },
            levels = {
                [74] = { acc = 304, eva = 268, agi = 69, int = 64, mnd = 89, chr = 77 },
                [75] = { acc = 309, eva = 273, agi = 70, int = 65, mnd = 91, chr = 77 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 66, mnd = 92, chr = 80 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 66, mnd = 93, chr = 80 },
            },
            spawn_levels = { [74] = { 74, 75 }, [194] = { 74, 75 }, [308] = { 76, 77 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 1000, item = 2221 },  -- halvung shakudo key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 100, item = 1861 },  -- moblin sheepskin
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 88, 122, 212, 224, 232, 295 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Friars Lantern',
            ids    = { 92, 93, 95, 97, 119, 120, 121, 149, 150, 164, 165, 203, 204, 205, 206, 211, 213, 216, 217,
                       218, 219, 220, 221, 222, 223, 227, 228, 229, 294, 296, 297, 320, 321, 328, 329, 331, 337,
                       338, 340, 349, 351, 355, 359, 363, 366, 371, 375, 387 },
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 63, mnd = 58, chr = 69 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 64, mnd = 60, chr = 70 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 64, mnd = 60, chr = 71 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 66, mnd = 60, chr = 72 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 66, mnd = 61, chr = 73 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 67, mnd = 62, chr = 73 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 68, mnd = 63, chr = 74 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 69, mnd = 64, chr = 76 },
            },
            spawn_levels = { [92] = { 72, 76 }, [93] = { 72, 76 }, [95] = { 72, 76 }, [97] = { 72, 76 },
                             [119] = { 72, 76 }, [120] = { 72, 76 }, [121] = { 72, 76 }, [149] = { 72, 76 },
                             [150] = { 72, 76 }, [164] = { 72, 76 }, [165] = { 72, 76 }, [203] = { 72, 76 },
                             [204] = { 72, 76 }, [205] = { 72, 76 }, [206] = { 72, 76 }, [211] = { 72, 76 },
                             [213] = { 72, 76 }, [216] = { 72, 76 }, [217] = { 72, 76 }, [218] = { 72, 76 },
                             [219] = { 72, 76 }, [220] = { 72, 76 }, [221] = { 72, 76 }, [222] = { 72, 76 },
                             [223] = { 72, 76 }, [227] = { 72, 76 }, [228] = { 72, 76 }, [229] = { 72, 76 },
                             [294] = { 72, 76 }, [296] = { 72, 76 }, [297] = { 76, 76 }, [320] = { 77, 79 },
                             [321] = { 77, 79 }, [328] = { 77, 79 }, [329] = { 77, 79 }, [331] = { 77, 79 },
                             [337] = { 77, 79 }, [338] = { 77, 79 }, [340] = { 77, 79 }, [349] = { 77, 79 },
                             [351] = { 77, 79 }, [355] = { 77, 79 }, [359] = { 77, 79 }, [363] = { 77, 79 },
                             [366] = { 77, 79 }, [371] = { 77, 79 }, [375] = { 77, 79 }, [387] = { 77, 79 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 240, item = 928 },  -- pinch of bomb ash
                { rate = 50, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Wamoura',
            ids    = { 167, 169, 171, 174 },
            levels = {
                [80] = { acc = 340, eva = 325, agi = 78, int = 57, mnd = 57, chr = 65 },
                [81] = { acc = 347, eva = 330, agi = 81, int = 60, mnd = 60, chr = 67 },
                [82] = { acc = 353, eva = 335, agi = 81, int = 60, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            drops  = {
                { rate = 150, item = 2337 },  -- clump of wamoura hair
                { rate = 240, item = 2338 },  -- wamoura scale
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 5,
        },
        {
            name   = 'Wamouracampa',
            ids    = { 173 },
            levels = {
                [72] = { acc = 297, eva = 283, agi = 72, int = 52, mnd = 52, chr = 60 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62 },
                [76] = { acc = 319, eva = 304, agi = 76, int = 55, mnd = 55, chr = 62 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 2173 },  -- wamoura cocoon
            },
            links  = 5,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Moblin Billionaire',
            ids    = { 181, 188, 312 },
            levels = {
                [74] = { acc = 310, eva = 282, agi = 69, int = 77, mnd = 77, chr = 70 },
                [75] = { acc = 315, eva = 288, agi = 70, int = 77, mnd = 77, chr = 70 },
                [76] = { acc = 321, eva = 293, agi = 71, int = 80, mnd = 80, chr = 72 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 80, mnd = 80, chr = 72 },
            },
            spawn_levels = { [181] = { 74, 75 }, [188] = { 74, 75 }, [312] = { 76, 77 } },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 1000, item = 2221 },  -- halvung shakudo key
                { rate = 100, item = 1638 },  -- moblin mask
                { rate = 50, item = 1631 },  -- moblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Troll Artilleryman',
            ids    = { 198, 240, 254, 265, 300, 309, 318, 325, 333, 343, 369, 380, 388 },
            levels = {
                [78] = { acc = 377, eva = 297, agi = 90, int = 65, mnd = 77, chr = 68, resist = { poison = 20 } },
                [79] = { acc = 384, eva = 302, agi = 92, int = 65, mnd = 80, chr = 69, resist = { poison = 20 } },
                [80] = { acc = 389, eva = 307, agi = 92, int = 65, mnd = 80, chr = 69, resist = { poison = 20 } },
                [81] = { acc = 396, eva = 312, agi = 94, int = 67, mnd = 82, chr = 71, resist = { poison = 25 } },
                [82] = { acc = 402, eva = 317, agi = 94, int = 67, mnd = 82, chr = 71, resist = { poison = 25 } },
                [83] = { acc = 408, eva = 322, agi = 96, int = 67, mnd = 82, chr = 71, resist = { poison = 25 } },
            },
            spawn_levels = { [198] = { 78, 82 }, [240] = { 78, 82 }, [254] = { 78, 82 }, [265] = { 78, 82 },
                             [300] = { 78, 82 }, [309] = { 78, 82 }, [318] = { 78, 82 }, [325] = { 78, 82 },
                             [333] = { 78, 82 }, [343] = { 78, 82 }, [369] = { 78, 82 }, [380] = { 78, 82 },
                             [388] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Combatant',
            ids    = { 199, 256, 268, 319, 334, 353, 370, 381, 393, 394 },
            levels = {
                [78] = { acc = 336, eva = 312, agi = 57, int = 51, mnd = 77, chr = 68 },
                [79] = { acc = 342, eva = 317, agi = 57, int = 51, mnd = 80, chr = 69 },
                [80] = { acc = 347, eva = 322, agi = 57, int = 51, mnd = 80, chr = 69 },
                [81] = { acc = 355, eva = 328, agi = 60, int = 54, mnd = 82, chr = 71 },
                [82] = { acc = 361, eva = 333, agi = 60, int = 54, mnd = 82, chr = 71 },
                [83] = { acc = 367, eva = 338, agi = 60, int = 54, mnd = 82, chr = 71 },
            },
            spawn_levels = { [199] = { 78, 82 }, [256] = { 78, 82 }, [268] = { 78, 82 }, [319] = { 78, 82 },
                             [334] = { 78, 82 }, [353] = { 78, 82 }, [370] = { 78, 82 }, [381] = { 78, 82 },
                             [393] = { 81, 83 }, [394] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Targeteer',
            ids    = { 200, 238, 251, 252, 307, 315, 323, 326, 350, 364, 378, 385, 395, 396 },
            levels = {
                [78] = { acc = 327, eva = 301, agi = 51, int = 51, mnd = 85, chr = 80 },
                [79] = { acc = 333, eva = 306, agi = 51, int = 51, mnd = 87, chr = 82 },
                [80] = { acc = 338, eva = 311, agi = 51, int = 51, mnd = 87, chr = 82 },
                [81] = { acc = 345, eva = 317, agi = 54, int = 54, mnd = 90, chr = 85 },
                [82] = { acc = 351, eva = 322, agi = 54, int = 54, mnd = 90, chr = 85 },
                [83] = { acc = 357, eva = 327, agi = 54, int = 54, mnd = 90, chr = 85 },
            },
            spawn_levels = { [200] = { 78, 82 }, [238] = { 78, 82 }, [251] = { 78, 82 }, [252] = { 78, 82 },
                             [307] = { 78, 82 }, [315] = { 78, 82 }, [323] = { 78, 82 }, [326] = { 78, 82 },
                             [350] = { 78, 82 }, [364] = { 78, 82 }, [378] = { 78, 82 }, [385] = { 78, 82 },
                             [395] = { 81, 83 }, [396] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 150, item = 18409 },  -- jadagna -1
                { rate = 100, item = 16166 },  -- januwiyah -1
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Friars Lantern Grow',
            ids    = { 201, 298, 299 },
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 63, mnd = 58, chr = 69 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 64, mnd = 60, chr = 70 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 64, mnd = 60, chr = 71 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 66, mnd = 60, chr = 72 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 66, mnd = 61, chr = 73 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 67, mnd = 62, chr = 73 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 68, mnd = 63, chr = 74 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 69, mnd = 64, chr = 76 },
            },
            spawn_levels = { [201] = { 72, 76 }, [298] = { 77, 79 }, [299] = { 77, 79 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 50, item = 2384 },  -- smoke-filled flask
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ebony Pudding',
            ids    = { 208, 209, 210, 214, 215, 225, 226, 243, 244, 245, 246, 247, 248, 255, 260, 262, 283, 284,
                       285, 288, 289, 291, 292, 293, 339, 341, 342, 344, 347, 348 },
            levels = {
                [77] = { acc = 326, eva = 287, agi = 80, int = 98, mnd = 62, chr = 77 },
                [78] = { acc = 331, eva = 292, agi = 80, int = 98, mnd = 65, chr = 77 },
                [79] = { acc = 337, eva = 297, agi = 82, int = 101, mnd = 65, chr = 80 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            drops  = {
                { rate = 240, item = 2175 },  -- chunk of flan meat
            },
            aggro  = true,
            detects = { 'sight', 'ability' },
        },
        {
            name   = 'Friars Lantern Grow',
            ids    = { 230, 231, 241, 242, 266, 267 },
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 67, mnd = 62, chr = 73 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 68, mnd = 63, chr = 74 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 69, mnd = 64, chr = 76 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 50, item = 2384 },  -- smoke-filled flask
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Big Bomb',
            ids    = { 233 },
            nm     = true,
            levels = {
                [83] = { acc = 364, eva = 342, agi = 85, int = 72, mnd = 66, chr = 78 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 9, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 17471 },  -- horrent mace
                { rate = 100, item = 18707 },  -- fire bomblet
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Troll Machinist',
            ids    = { 234, 257, 270, 303, 310, 335, 345, 357, 372, 382 },
            levels = {
                [78] = { acc = 336, eva = 370, agi = 77, int = 65, mnd = 65, chr = 80 },
                [79] = { acc = 342, eva = 376, agi = 78, int = 65, mnd = 66, chr = 82 },
                [80] = { acc = 347, eva = 381, agi = 78, int = 65, mnd = 66, chr = 82 },
                [81] = { acc = 355, eva = 386, agi = 81, int = 67, mnd = 69, chr = 85 },
                [82] = { acc = 361, eva = 391, agi = 81, int = 67, mnd = 69, chr = 85 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
                { rate = 50, group = {  -- one of
                    { 2263, 1 },  -- flashbulb
                    { 2244, 1 },  -- scanner
                    { 2248, 1 },  -- pattern reader
                    { 2259, 1 },  -- heatsink
                    { 2267, 1 },  -- mana converter
                    { 2238, 1 },  -- strobe
                    { 2252, 1 },  -- analyzer
                    { 2256, 1 },  -- heat seeker
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Scrimer',
            ids    = { 236, 259, 269, 305, 316, 330, 361, 376, 384, 389, 390 },
            levels = {
                [78] = { acc = 333, eva = 314, agi = 77, int = 57, mnd = 65, chr = 68 },
                [79] = { acc = 339, eva = 320, agi = 78, int = 57, mnd = 66, chr = 69 },
                [80] = { acc = 344, eva = 325, agi = 78, int = 57, mnd = 66, chr = 69 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 60, mnd = 69, chr = 71 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 60, mnd = 69, chr = 71 },
                [83] = { acc = 364, eva = 340, agi = 81, int = 60, mnd = 69, chr = 71 },
            },
            spawn_levels = { [236] = { 78, 82 }, [259] = { 78, 82 }, [269] = { 78, 82 }, [305] = { 78, 82 },
                             [316] = { 78, 82 }, [330] = { 78, 82 }, [361] = { 78, 82 }, [376] = { 78, 82 },
                             [384] = { 78, 82 }, [389] = { 81, 83 }, [390] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Grenadier',
            ids    = { 237, 261, 275, 317, 322, 327, 362, 377 },
            levels = {
                [78] = { acc = 377, eva = 297, agi = 90, int = 65, mnd = 77, chr = 68, resist = { poison = 20 } },
                [79] = { acc = 384, eva = 302, agi = 92, int = 65, mnd = 80, chr = 69, resist = { poison = 20 } },
                [80] = { acc = 389, eva = 307, agi = 92, int = 65, mnd = 80, chr = 69, resist = { poison = 20 } },
                [81] = { acc = 396, eva = 312, agi = 94, int = 67, mnd = 82, chr = 71, resist = { poison = 25 } },
                [82] = { acc = 402, eva = 317, agi = 94, int = 67, mnd = 82, chr = 71, resist = { poison = 25 } },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Troll Cuirasser',
            ids    = { 239, 253, 280, 301, 324, 332, 352, 367, 379, 386, 391, 392 },
            levels = {
                [78] = { acc = 329, eva = 299, agi = 65, int = 77, mnd = 85, chr = 72 },
                [79] = { acc = 336, eva = 304, agi = 65, int = 78, mnd = 87, chr = 75 },
                [80] = { acc = 341, eva = 309, agi = 65, int = 78, mnd = 87, chr = 75 },
                [81] = { acc = 348, eva = 314, agi = 67, int = 81, mnd = 90, chr = 77 },
                [82] = { acc = 354, eva = 319, agi = 67, int = 81, mnd = 90, chr = 77 },
                [83] = { acc = 360, eva = 324, agi = 67, int = 81, mnd = 90, chr = 77 },
            },
            spawn_levels = { [239] = { 78, 82 }, [253] = { 78, 82 }, [280] = { 78, 82 }, [301] = { 78, 82 },
                             [324] = { 78, 82 }, [332] = { 78, 82 }, [352] = { 78, 82 }, [367] = { 78, 82 },
                             [379] = { 78, 82 }, [386] = { 81, 83 }, [391] = { 81, 83 }, [392] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 100, item = 2222 },  -- halvung bronze key
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Antares H',
            ids    = { 249, 250, 263, 264, 276, 277, 279, 281, 286, 290, 302, 306, 354, 356, 360, 368, 374 },
            levels = {
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 335, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
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
            name   = 'Troll Mythril Guard',
            ids    = { 273, 274 },
            levels = {
                [82] = { acc = 358, eva = 331, agi = 73, int = 81, mnd = 63, chr = 58 },
                [83] = { acc = 364, eva = 336, agi = 73, int = 81, mnd = 63, chr = 58 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Dahak',
            ids    = { 365 },
            levels = {
                [79] = { acc = 339, eva = 324, agi = 87, int = 66, mnd = 66, chr = 69 },
                [80] = { acc = 344, eva = 329, agi = 87, int = 66, mnd = 66, chr = 69 },
                [81] = { acc = 352, eva = 335, agi = 90, int = 69, mnd = 69, chr = 71 },
                [82] = { acc = 358, eva = 340, agi = 90, int = 69, mnd = 69, chr = 71 },
            },
            ranks  = { fire = 4, ice = 2, wind = 2, earth = 2, thunder = 2, water = 1, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 1, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Archaic Mirror',
            ids    = { 400, 401, 402, 403, 404, 405, 406, 407 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70 },
            },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 1000, item = 2174 },  -- archaic mirror
            },
        },
        {
            name   = 'Hilltroll Mirror Guard',
            ids    = { 408, 410, 412, 414, 416, 418, 420, 422 },
            levels = {
                [81] = { acc = 348, eva = 314, agi = 67, int = 81, mnd = 90, chr = 77 },
                [82] = { acc = 354, eva = 319, agi = 67, int = 81, mnd = 90, chr = 77 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Woodtroll Mirror Guard',
            ids    = { 409, 411, 413, 415, 417, 419, 421, 423 },
            nm     = true,
            levels = {
                [81] = { acc = 352, eva = 326, agi = 73, int = 81, mnd = 63, chr = 58 },
                [82] = { acc = 358, eva = 331, agi = 73, int = 81, mnd = 63, chr = 58 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Dextrose',
            ids    = { 430 },
            nm     = true,
            levels = {
                [80] = { acc = 341, eva = 316, agi = 78, int = 96, mnd = 69, chr = 80 },
                [81] = { acc = 348, eva = 321, agi = 80, int = 99, mnd = 72, chr = 82 },
                [82] = { acc = 354, eva = 326, agi = 80, int = 99, mnd = 72, chr = 82 },
            },
            ranks  = { ice = 2, wind = 2, earth = 2, water = 4, dark = 3, paralyze = 2, bind = 2, silence = 2,
                       slow = 2, poison = 4, dark_sleep = 3, blind = 3, gravity = 2 },
            magic_dmg = { all = 25 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2625 },  -- blob of dextroses blubber
                { rate = 150, item = 18127 },  -- achilles spear
                { rate = 150, item = 16338 },  -- ruby seraweels
            },
            aggro  = true,
            detects = { 'sight', 'ability' },
        },
        {
            name   = 'Reacton',
            ids    = { 431 },
            nm     = true,
            levels = {
                [81] = { acc = 352, eva = 307, agi = 85, int = 94, mnd = 71, chr = 82 },
                [82] = { acc = 358, eva = 312, agi = 85, int = 94, mnd = 71, chr = 82 },
                [83] = { acc = 364, eva = 316, agi = 85, int = 96, mnd = 71, chr = 82 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun' },
            drops  = {
                { rate = 1000, item = 2624 },  -- pile of reactons ashes
                { rate = 150, item = 19028 },  -- magic strap
                { rate = 150, item = 19211 },  -- reacton arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Achamoth',
            ids    = { 432 },
            nm     = true,
            levels = {
                [86] = { acc = 379, eva = 356, agi = 85, int = 62, mnd = 62, chr = 70 },
                [87] = { acc = 385, eva = 361, agi = 85, int = 62, mnd = 62, chr = 70 },
                [88] = { acc = 392, eva = 367, agi = 86, int = 63, mnd = 63, chr = 72 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2622 },  -- achamoths antenna
                { rate = 240, item = 19034 },  -- ice grip
                { rate = 240, item = 19035 },  -- thunder grip
                { rate = 1000, group = {  -- one of
                    { 17753, 1 },  -- organics
                    { 11376, 1 },  -- aurum sabatons
                    { 16342, 1 },  -- oracles braconi
                } },
                { rate = 100, group = {  -- one of
                    { 17753, 1 },  -- organics
                    { 11376, 1 },  -- aurum sabatons
                    { 16342, 1 },  -- oracles braconi
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 8,
        },
        {
            name   = 'Achamothcampa',
            ids    = { 433, 434 },
            nm     = true,
            levels = {
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 2, slow = -1, poison = -2, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Achamoth Nympha',
            ids    = { 435, 436 },
            levels = {
                [73] = { acc = 302, eva = 288, agi = 72, int = 54, mnd = 54, chr = 60 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 54, mnd = 54, chr = 60 },
                [75] = { acc = 313, eva = 299, agi = 74, int = 55, mnd = 55, chr = 62 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 5,
        },
    },
    by_name = {},
}
