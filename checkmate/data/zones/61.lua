-- Mount Zhayolm (zone 61).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Sicklemoon Jagil' } },
        [2] = { sound = { 'Energetic Eruca', 'Magmatic Eruca' } },
        [3] = { sound = { 'Assassin Fly' } },
        [4] = { sound = { 'Brass Borer', 'Wamoura Prince' }, true_sound = { 'Wamoura' } },
        [5] = {
            sight = { 'Hilltroll Dark Knight', 'Hilltroll Monk', 'Hilltroll Paladin', 'Hilltroll Puppetmaster',
                      'Hilltroll Ranger', 'Hilltroll Red Mage', 'Hilltroll Warrior', 'Troll Artilleryman',
                      'Troll Cuirasser', 'Troll Grenadier', 'Troll Hammersmith', 'Troll Speculator' },
            true_sight = { 'Garfurlar the Rabid', 'Garharlor the Unruly', 'Garhorlur the Brutal',
                           'Khromasoul Bhurborlor' },
        },
        [6] = { sound = { 'Volcanic Leech' } },
        [7] = { both = { 'Vanasarvik' }, true_both = { 'Dark Bugler', 'Elders Imp' } },
        [8] = { sight = { 'Dark Esquire' } },
        [9] = { sound = { 'Magmatic Eruca' } },
        [10] = {
            sight = { 'Hilltroll Dark Knight', 'Hilltroll Monk', 'Hilltroll Paladin', 'Hilltroll Puppetmaster',
                      'Hilltroll Ranger', 'Hilltroll Red Mage', 'Hilltroll Warrior', 'Troll Artilleryman',
                      'Troll Cuirasser', 'Troll Grenadier', 'Troll Hammersmith', 'Troll Speculator' },
            true_sight = { 'Garfurlar the Rabid', 'Garhorlur the Brutal', 'Khromasoul Bhurborlor' },
        },
        [11] = {
            sight = { 'Hilltroll Dark Knight', 'Hilltroll Monk', 'Hilltroll Paladin', 'Hilltroll Puppetmaster',
                      'Hilltroll Ranger', 'Hilltroll Red Mage', 'Hilltroll Warrior', 'Troll Artilleryman',
                      'Troll Cuirasser', 'Troll Grenadier', 'Troll Hammersmith', 'Troll Speculator' },
            true_sight = { 'Garharlor the Unruly', 'Garhorlur the Brutal', 'Khromasoul Bhurborlor' },
        },
        [12] = {
            sight = { 'Hilltroll Dark Knight', 'Hilltroll Monk', 'Hilltroll Paladin', 'Hilltroll Puppetmaster',
                      'Hilltroll Ranger', 'Hilltroll Red Mage', 'Hilltroll Warrior', 'Troll Artilleryman',
                      'Troll Cuirasser', 'Troll Grenadier', 'Troll Hammersmith', 'Troll Speculator' },
            true_sight = { 'Garfurlar the Rabid', 'Garharlor the Unruly', 'Khromasoul Bhurborlor' },
        },
        [13] = { sound = { 'Wamoura Prince' }, true_sound = { 'Wamoura' } },
        [14] = {
            sight = { 'Hilltroll Dark Knight', 'Hilltroll Monk', 'Hilltroll Paladin', 'Hilltroll Puppetmaster',
                      'Hilltroll Ranger', 'Hilltroll Red Mage', 'Hilltroll Warrior', 'Troll Artilleryman',
                      'Troll Cuirasser', 'Troll Grenadier', 'Troll Hammersmith', 'Troll Speculator' },
            true_sight = { 'Garfurlar the Rabid', 'Garharlor the Unruly', 'Garhorlur the Brutal' },
        },
        [15] = { sight = { 'Grand Grenade' } },
    },
    monsters = {
        {
            name   = 'Sicklemoon Crab',
            ids    = { 1 },
            levels = {
                [71] = { acc = 287, eva = 266, agi = 48, int = 51, mnd = 75, chr = 75 },
                [72] = { acc = 292, eva = 271, agi = 48, int = 51, mnd = 75, chr = 75 },
                [73] = { acc = 298, eva = 276, agi = 48, int = 52, mnd = 76, chr = 76 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Zazalda Clot',
            ids    = { 2 },
            levels = {
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 63, chr = 65 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Vozold Clot',
            ids    = { 3 },
            levels = {
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 63, chr = 65 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Zazalda Jagil',
            ids    = { 4 },
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 868 },  -- handful of pugil scales
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Vozold Jagil',
            ids    = { 5 },
            levels = {
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 60 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 62 },
                [77] = { acc = 326, eva = 313, agi = 85, int = 60, mnd = 60, chr = 62 },
                [78] = { acc = 331, eva = 318, agi = 85, int = 60, mnd = 60, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Giant Orobon',
            ids    = { 6 },
            levels = {
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 5563 },  -- chunk of orobon meat
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Wootzshell',
            ids    = { 7, 8, 9, 10, 11, 16, 18, 22, 26, 32, 33, 34, 38, 47 },
            levels = {
                [70] = { acc = 281, eva = 260, agi = 45, int = 49, mnd = 73, chr = 73 },
                [71] = { acc = 287, eva = 266, agi = 48, int = 51, mnd = 75, chr = 75 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sicklemoon Jagil',
            ids    = { 12, 13, 14, 17, 23, 25, 28, 29, 30, 31, 35, 36, 45, 46, 143, 145, 146, 153, 158, 159, 160 },
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 62 },
            },
            spawn_levels = { [12] = { 74, 76 }, [23] = { 74, 76 }, [25] = { 74, 76 }, [28] = { 74, 76 },
                             [29] = { 74, 76 }, [30] = { 74, 76 }, [31] = { 74, 76 }, [35] = { 74, 76 },
                             [36] = { 74, 76 }, [143] = { 74, 76 }, [145] = { 73, 75 }, [146] = { 73, 75 },
                             [153] = { 73, 75 }, [158] = { 73, 75 }, [159] = { 73, 75 }, [160] = { 73, 75 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Magmatic Eruca',
            ids    = { 15, 19, 20, 54, 55, 56, 57, 58, 59, 63, 64, 65, 67, 68, 69, 70, 72, 73, 74, 78, 79, 80, 85,
                       86, 87, 88, 139, 140, 141, 142, 147, 162, 163, 165, 166, 169, 170, 176, 178, 180, 181, 186,
                       187, 188, 189, 190, 201, 202 },
            levels = {
                [71] = { acc = 293, eva = 278, agi = 72, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 293, agi = 73, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 58, chr = 65 },
            },
            spawn_levels = { [54] = { 73, 75 }, [55] = { 73, 75 }, [56] = { 73, 75 }, [57] = { 73, 75 },
                             [58] = { 73, 75 }, [59] = { 73, 75 }, [63] = { 73, 75 }, [64] = { 73, 75 },
                             [65] = { 73, 75 }, [67] = { 73, 75 }, [68] = { 73, 75 }, [69] = { 73, 75 },
                             [70] = { 73, 75 }, [72] = { 73, 75 }, [73] = { 73, 75 }, [74] = { 73, 75 },
                             [78] = { 73, 75 }, [79] = { 73, 75 }, [80] = { 73, 75 }, [85] = { 73, 75 },
                             [86] = { 73, 75 }, [87] = { 73, 75 }, [88] = { 73, 75 }, [139] = { 72, 74 },
                             [140] = { 72, 74 }, [141] = { 72, 74 }, [142] = { 72, 74 }, [147] = { 72, 74 },
                             [162] = { 72, 74 }, [163] = { 72, 74 }, [165] = { 72, 74 }, [166] = { 72, 74 },
                             [169] = { 72, 74 }, [170] = { 72, 74 }, [176] = { 72, 74 }, [178] = { 72, 74 },
                             [180] = { 72, 74 }, [181] = { 72, 74 }, [186] = { 72, 74 }, [187] = { 72, 74 },
                             [188] = { 72, 74 }, [189] = { 72, 74 }, [190] = { 72, 74 }, [201] = { 71, 73 },
                             [202] = { 71, 73 } },
            ph_for = { [74] = { 394 } },
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
            links  = 2,
        },
        {
            name   = 'Phasma',
            ids    = { 21, 24, 27, 37, 40, 44, 71, 144, 155, 179, 185, 222, 233, 241, 243, 254, 261, 299, 302, 352,
                       360, 364 },
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 72, mnd = 56, chr = 70 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 73, mnd = 56, chr = 71 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 74, mnd = 57, chr = 72 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 75, mnd = 57, chr = 73 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 39, 50, 97, 151, 216, 265, 279 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
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
            name   = 'Assassin Fly',
            ids    = { 41, 42, 43, 52, 53, 61, 62, 76, 77, 137, 138, 183, 184, 225, 226, 231, 232, 239, 240 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
            },
            spawn_levels = { [52] = { 71, 73 }, [53] = { 71, 73 }, [61] = { 71, 73 }, [62] = { 71, 73 },
                             [76] = { 71, 73 }, [77] = { 71, 73 }, [137] = { 71, 73 }, [138] = { 71, 73 },
                             [183] = { 71, 73 }, [184] = { 71, 73 }, [225] = { 72, 74 }, [226] = { 72, 74 },
                             [231] = { 72, 74 }, [232] = { 72, 74 }, [239] = { 72, 74 }, [240] = { 72, 74 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 3,
        },
        {
            name   = 'Wamoura Prince',
            ids    = { 48, 124, 127, 130, 131, 132, 266, 268, 271, 272, 273, 292, 293, 300, 301, 303, 316, 317, 318,
                       319, 320, 321, 322, 324, 326, 331, 332, 340, 341, 342, 343, 344, 355, 358, 359, 361, 362,
                       363, 365, 366 },
            levels = {
                [79] = { acc = 335, eva = 320, agi = 78, int = 57, mnd = 57, chr = 65 },
                [80] = { acc = 340, eva = 325, agi = 78, int = 57, mnd = 57, chr = 65 },
                [81] = { acc = 347, eva = 330, agi = 81, int = 60, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2173 },  -- wamoura cocoon
            },
            links  = 4,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Sweeping Cluster',
            ids    = { 49, 133, 134, 227, 228, 229, 234, 235, 236, 237, 242, 244, 245, 267, 333, 334, 336, 337,
                       338 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 58, mnd = 58, chr = 68 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 69 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 70 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 73 },
            },
            spawn_levels = { [133] = { 77, 78 }, [134] = { 77, 78 }, [227] = { 73, 75 }, [228] = { 73, 75 },
                             [229] = { 73, 75 }, [234] = { 73, 75 }, [235] = { 73, 75 }, [236] = { 73, 75 },
                             [237] = { 73, 75 }, [242] = { 73, 75 }, [244] = { 73, 75 }, [245] = { 73, 75 },
                             [267] = { 77, 78 }, [333] = { 77, 78 }, [334] = { 77, 78 }, [336] = { 77, 78 },
                             [337] = { 77, 78 }, [338] = { 77, 78 } },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 17305 },  -- cluster arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Assassin Fly',
            ids    = { 51, 60, 75, 136, 182, 224, 230, 238 },
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
            },
            spawn_levels = { [51] = { 73, 75 }, [60] = { 73, 75 }, [75] = { 73, 75 }, [136] = { 73, 75 },
                             [182] = { 73, 75 }, [224] = { 74, 76 }, [230] = { 74, 76 }, [238] = { 74, 76 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 3,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 66, 110, 164, 215, 253, 258, 280 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
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
            name   = 'Mountain Clot',
            ids    = { 81, 82, 83, 84, 118, 119, 120, 121, 122, 123, 135, 191, 192, 193, 194, 195, 196, 197, 198,
                       199, 203, 204 },
            levels = {
                [71] = { acc = 293, eva = 278, agi = 72, int = 55, mnd = 60, chr = 63 },
                [72] = { acc = 298, eva = 283, agi = 72, int = 55, mnd = 60, chr = 63 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 58, mnd = 62, chr = 64 },
                [74] = { acc = 309, eva = 293, agi = 73, int = 58, mnd = 63, chr = 64 },
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 63, chr = 65 },
            },
            spawn_levels = { [81] = { 72, 74 }, [82] = { 72, 74 }, [83] = { 72, 74 }, [84] = { 72, 74 },
                             [118] = { 74, 75 }, [119] = { 74, 75 }, [120] = { 74, 75 }, [121] = { 74, 75 },
                             [122] = { 74, 75 }, [123] = { 74, 75 }, [135] = { 74, 75 }, [191] = { 72, 74 },
                             [192] = { 72, 74 }, [193] = { 72, 74 }, [194] = { 72, 74 }, [195] = { 72, 74 },
                             [196] = { 74, 75 }, [197] = { 71, 73 }, [198] = { 71, 73 }, [199] = { 71, 73 },
                             [203] = { 72, 74 }, [204] = { 72, 74 } },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Hilltroll Warrior',
            ids    = { 89, 106, 117, 281, 289 },
            levels = {
                [79] = { acc = 339, eva = 320, agi = 78, int = 57, mnd = 66, chr = 69 },
                [80] = { acc = 344, eva = 325, agi = 78, int = 57, mnd = 66, chr = 69 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 60, mnd = 69, chr = 71 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 60, mnd = 69, chr = 71 },
                [83] = { acc = 364, eva = 340, agi = 81, int = 60, mnd = 69, chr = 71 },
            },
            spawn_levels = { [89] = { 79, 81 }, [106] = { 79, 81 }, [117] = { 79, 81 }, [281] = { 81, 83 },
                             [289] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            drops  = {
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Hilltroll Puppetmaster',
            ids    = { 90, 108, 259 },
            levels = {
                [79] = { acc = 342, eva = 376, agi = 78, int = 65, mnd = 66, chr = 82 },
                [80] = { acc = 347, eva = 381, agi = 78, int = 65, mnd = 66, chr = 82 },
                [81] = { acc = 355, eva = 386, agi = 81, int = 67, mnd = 69, chr = 85 },
                [82] = { acc = 361, eva = 391, agi = 81, int = 67, mnd = 69, chr = 85 },
                [83] = { acc = 367, eva = 396, agi = 81, int = 67, mnd = 69, chr = 85 },
            },
            spawn_levels = { [90] = { 79, 81 }, [108] = { 79, 81 }, [259] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            drops  = {
                { rate = 10, item = 2160 },  -- troll pauldron
                { rate = 100, group = {  -- one of
                    { 2253, 1 },  -- armor plate ii
                    { 2241, 1 },  -- tension spring ii
                    { 2261, 1 },  -- mana jammer ii
                    { 2245, 1 },  -- loudspeaker ii
                    { 2249, 1 },  -- accelerator ii
                    { 2269, 1 },  -- mana tank ii
                    { 2257, 1 },  -- stabilizer ii
                    { 2265, 1 },  -- auto-repair kit ii
                } },
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
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Trolls Automaton',
            ids    = { 91, 109, 260, 291 },
            levels = {
                [77] = { acc = 316, eva = 280, agi = 66, int = 66, mnd = 93, chr = 80 },
                [78] = { acc = 321, eva = 286, agi = 68, int = 68, mnd = 93, chr = 80 },
                [79] = { acc = 326, eva = 290, agi = 69, int = 69, mnd = 96, chr = 82 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Hilltroll Dark Knight',
            ids    = { 92, 101, 113, 263, 286 },
            levels = {
                [79] = { acc = 339, eva = 316, agi = 71, int = 78, mnd = 60, chr = 55 },
                [80] = { acc = 344, eva = 321, agi = 71, int = 78, mnd = 60, chr = 55 },
                [81] = { acc = 352, eva = 326, agi = 73, int = 81, mnd = 63, chr = 58 },
                [82] = { acc = 358, eva = 331, agi = 73, int = 81, mnd = 63, chr = 58 },
                [83] = { acc = 364, eva = 336, agi = 73, int = 81, mnd = 63, chr = 58 },
            },
            spawn_levels = { [92] = { 79, 81 }, [101] = { 79, 81 }, [113] = { 79, 81 }, [263] = { 81, 83 },
                             [286] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Hilltroll Monk',
            ids    = { 93, 99, 116, 257, 276 },
            levels = {
                [79] = { acc = 342, eva = 317, agi = 57, int = 51, mnd = 80, chr = 69 },
                [80] = { acc = 347, eva = 322, agi = 57, int = 51, mnd = 80, chr = 69 },
                [81] = { acc = 355, eva = 328, agi = 60, int = 54, mnd = 82, chr = 71 },
                [82] = { acc = 361, eva = 333, agi = 60, int = 54, mnd = 82, chr = 71 },
                [83] = { acc = 367, eva = 338, agi = 60, int = 54, mnd = 82, chr = 71 },
            },
            spawn_levels = { [93] = { 79, 81 }, [99] = { 79, 81 }, [116] = { 79, 81 }, [257] = { 81, 83 },
                             [276] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            drops  = {
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Volcanic Leech',
            ids    = { 94, 95, 100, 102, 104, 112, 205, 208, 210, 219 },
            levels = {
                [72] = { acc = 298, eva = 284, agi = 75, int = 60, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 62, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 63, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 63, mnd = 58, chr = 65 },
            },
            spawn_levels = { [94] = { 73, 75 }, [95] = { 73, 75 }, [100] = { 73, 75 }, [102] = { 73, 75 },
                             [104] = { 73, 75 }, [112] = { 73, 75 }, [205] = { 72, 73 }, [208] = { 72, 73 },
                             [210] = { 72, 73 }, [219] = { 72, 73 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 6,
        },
        {
            name   = 'Hilltroll Red Mage',
            ids    = { 96, 103, 107, 115, 262, 284, 288 },
            levels = {
                [79] = { acc = 336, eva = 304, agi = 65, int = 78, mnd = 87, chr = 75 },
                [80] = { acc = 341, eva = 309, agi = 65, int = 78, mnd = 87, chr = 75 },
                [81] = { acc = 348, eva = 314, agi = 67, int = 81, mnd = 90, chr = 77 },
                [82] = { acc = 354, eva = 319, agi = 67, int = 81, mnd = 90, chr = 77 },
                [83] = { acc = 360, eva = 324, agi = 67, int = 81, mnd = 90, chr = 77 },
            },
            spawn_levels = { [96] = { 79, 81 }, [103] = { 79, 81 }, [107] = { 79, 81 }, [115] = { 79, 81 },
                             [262] = { 81, 83 }, [284] = { 81, 83 }, [288] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Hilltroll Paladin',
            ids    = { 98, 105, 114, 264, 278, 287 },
            levels = {
                [79] = { acc = 333, eva = 306, agi = 51, int = 51, mnd = 87, chr = 82 },
                [80] = { acc = 338, eva = 311, agi = 51, int = 51, mnd = 87, chr = 82 },
                [81] = { acc = 345, eva = 317, agi = 54, int = 54, mnd = 90, chr = 85 },
                [82] = { acc = 351, eva = 322, agi = 54, int = 54, mnd = 90, chr = 85 },
                [83] = { acc = 357, eva = 327, agi = 54, int = 54, mnd = 90, chr = 85 },
            },
            spawn_levels = { [98] = { 79, 81 }, [105] = { 79, 81 }, [114] = { 79, 81 }, [264] = { 81, 83 },
                             [278] = { 81, 83 }, [287] = { 81, 83 } },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 150, item = 18409 },  -- jadagna -1
                { rate = 100, item = 16166 },  -- januwiyah -1
                { rate = 10, item = 2161 },  -- troll vambrace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Wamoura Prince',
            ids    = { 125, 128, 269, 274, 345, 347, 353, 356 },
            levels = {
                [79] = { acc = 335, eva = 320, agi = 78, int = 57, mnd = 57, chr = 65 },
                [80] = { acc = 340, eva = 325, agi = 78, int = 57, mnd = 57, chr = 65 },
                [81] = { acc = 347, eva = 330, agi = 81, int = 60, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 1, ice = -2, wind = -1, earth = 2, water = -2, light = -1, paralyze = -2, bind = -2,
                       silence = -1, slow = 2, poison = -2, light_sleep = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 2173 },  -- wamoura cocoon
            },
            links  = 4,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Wamoura',
            ids    = { 126, 129, 270, 275, 346, 348, 354, 357 },
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
            links  = 4,
        },
        {
            name   = 'Zhayolm Apkallu',
            ids    = { 148, 149, 150, 152, 154, 157, 161, 167, 168, 171, 172, 173, 174, 175, 177, 200, 206, 207,
                       209, 211, 212, 213, 214, 217, 218, 220, 221, 223 },
            levels = {
                [70] = { acc = 292, eva = 272, agi = 55, int = 49, mnd = 67, chr = 61 },
                [71] = { acc = 298, eva = 276, agi = 55, int = 51, mnd = 67, chr = 63 },
                [72] = { acc = 303, eva = 281, agi = 55, int = 51, mnd = 67, chr = 63 },
                [73] = { acc = 309, eva = 288, agi = 58, int = 52, mnd = 70, chr = 64 },
                [74] = { acc = 314, eva = 293, agi = 58, int = 52, mnd = 70, chr = 64 },
            },
            spawn_levels = { [148] = { 72, 74 }, [149] = { 72, 74 }, [150] = { 72, 74 }, [152] = { 72, 74 },
                             [154] = { 72, 74 }, [157] = { 72, 74 }, [161] = { 72, 74 }, [167] = { 72, 74 },
                             [168] = { 72, 74 }, [171] = { 72, 74 }, [172] = { 72, 74 }, [173] = { 72, 74 },
                             [174] = { 72, 74 }, [175] = { 72, 74 }, [177] = { 72, 74 }, [200] = { 70, 72 },
                             [206] = { 70, 72 }, [207] = { 70, 72 }, [209] = { 70, 72 }, [211] = { 70, 72 },
                             [212] = { 70, 72 }, [213] = { 70, 72 }, [214] = { 70, 72 }, [217] = { 70, 72 },
                             [218] = { 70, 72 }, [220] = { 70, 72 }, [221] = { 70, 72 }, [223] = { 70, 72 } },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 2149 },  -- apkallu feather
                { rate = 100, item = 5568 },  -- apkallu egg
            },
            aggro_note = 'apkallu',
        },
        {
            name   = 'Ebony Pudding',
            ids    = { 246, 247, 248, 249, 250, 251, 252, 255, 335, 339 },
            levels = {
                [79] = { acc = 337, eva = 297, agi = 82, int = 101, mnd = 65, chr = 80 },
                [80] = { acc = 342, eva = 302, agi = 82, int = 101, mnd = 65, chr = 80 },
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
            name   = 'Hilltroll Ranger',
            ids    = { 256, 277, 282, 283, 285 },
            levels = {
                [81] = { acc = 396, eva = 312, agi = 94, int = 67, mnd = 82, chr = 71 },
                [82] = { acc = 402, eva = 317, agi = 94, int = 67, mnd = 82, chr = 71 },
                [83] = { acc = 408, eva = 322, agi = 96, int = 67, mnd = 82, chr = 71 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 25 },
            drops  = {
                { rate = 10, item = 2160 },  -- troll pauldron
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Troll Speculator',
            ids    = { 290 },
            levels = {
                [80] = { acc = 347, eva = 381, agi = 78, int = 65, mnd = 66, chr = 82 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { slow = 20 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'King Apkallu',
            ids    = { 294, 295, 296, 297, 298, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 323,
                       325 },
            levels = {
                [78] = { acc = 336, eva = 314, agi = 60, int = 54, mnd = 72, chr = 68 },
                [79] = { acc = 342, eva = 319, agi = 61, int = 55, mnd = 75, chr = 69 },
                [80] = { acc = 347, eva = 324, agi = 61, int = 55, mnd = 75, chr = 69 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 2149 },  -- apkallu feather
                { rate = 100, item = 5568 },  -- apkallu egg
            },
            aggro_note = 'apkallu',
        },
        {
            name   = 'Wamoura',
            ids    = { 349, 350 },
            levels = {
                [80] = { acc = 340, eva = 325, agi = 78, int = 57, mnd = 57, chr = 65 },
                [81] = { acc = 347, eva = 330, agi = 81, int = 60, mnd = 60, chr = 67 },
                [82] = { acc = 353, eva = 335, agi = 81, int = 60, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, dark = -1, paralyze = -2, bind = -2,
                       silence = 2, slow = -1, poison = -2, dark_sleep = -1, blind = -1, gravity = 2 },
            drops  = {
                { rate = 50, item = 2173 },  -- wamoura cocoon
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 4,
        },
        {
            name   = 'Dahak',
            ids    = { 382, 383, 384, 385 },
            levels = {
                [81] = { acc = 352, eva = 335, agi = 90, int = 69, mnd = 69, chr = 71 },
                [82] = { acc = 358, eva = 340, agi = 90, int = 69, mnd = 69, chr = 71 },
                [83] = { acc = 364, eva = 345, agi = 90, int = 69, mnd = 69, chr = 71 },
            },
            ranks  = { fire = 4, ice = 2, wind = 2, earth = 2, thunder = 2, water = 1, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 1, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cerberus',
            ids    = { 386 },
            nm     = true,
            levels = {
                [85] = { acc = 382, eva = 361, agi = 102, int = 81, mnd = 81, chr = 83 },
            },
            ranks  = { fire = 7, ice = 7, wind = 7, earth = 7, thunder = 7, water = 7, light = 7, dark = 7,
                       paralyze = 7, bind = 7, slow = 7, poison = 7, light_sleep = 10, dark_sleep = 10, blind = 7,
                       gravity = 7 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'plague' },
            drops  = {
                { rate = 1000, item = 2168 },  -- cerberus claw
                { rate = 1000, item = 2169 },  -- cerberus hide
                { rate = 1000, item = 5565 },  -- slice of cerberus meat
                { rate = 1000, item = 2168 },  -- cerberus claw
                { rate = 240, item = 18385 },  -- algol
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Dark Rider',
            ids    = { 387 },
            nm     = true,
            levels = {
                [95] = { acc = 444, eva = 399, agi = 82, int = 91, mnd = 70, chr = 81 },
            },
            ranks  = { fire = 5, ice = 7, wind = 5, earth = 7, thunder = 5, water = 7, light = 4, dark = 11,
                       paralyze = 7, bind = 7, silence = 5, slow = 7, poison = 7, light_sleep = 4, dark_sleep = 11,
                       blind = 11, stun = 5, gravity = 5 },
        },
        {
            name   = 'Dark Bugler',
            ids    = { 388, 389, 390 },
            levels = {
                [76] = { acc = 323, eva = 285, agi = 85, int = 97, mnd = 54, chr = 77 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
        },
        {
            name   = 'Dark Esquire',
            ids    = { 391, 392, 393 },
            levels = {
                [76] = { acc = 323, eva = 306, agi = 80, int = 64, mnd = 50, chr = 71 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Energetic Eruca',
            ids    = { 394 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 325, agi = 78, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = 1, ice = -1, wind = -1, thunder = -1, water = -2, dark = -1, paralyze = -1, bind = -1,
                       silence = -1, poison = -2, dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 18584 },  -- astral staff
                { rate = 100, item = 14947 },  -- hanzo tekko
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 9,
        },
        {
            name   = 'Garharlor the Unruly',
            ids    = { 395 },
            nm     = true,
            levels = {
                [80] = { acc = 389, eva = 307, agi = 92, int = 65, mnd = 80, chr = 69 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 14948 },  -- genie gages
                { rate = 150, item = 15895 },  -- trance belt
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Garfurlar the Rabid',
            ids    = { 396 },
            nm     = true,
            levels = {
                [80] = { acc = 341, eva = 309, agi = 65, int = 78, mnd = 87, chr = 75 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Garhorlur the Brutal',
            ids    = { 397 },
            nm     = true,
            levels = {
                [80] = { acc = 338, eva = 311, agi = 51, int = 51, mnd = 87, chr = 82 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { sleep = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Brass Borer',
            ids    = { 399 },
            nm     = true,
            levels = {
                [83] = { acc = 359, eva = 340, agi = 81, int = 60, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 11, ice = -2, wind = 2, earth = -1, water = -2, light = -1, dark = -1, paralyze = -2,
                       bind = -2, silence = 2, slow = -1, poison = -2, light_sleep = -1, dark_sleep = -1,
                       blind = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2626 },  -- brass borers cocoon
                { rate = 150, item = 15018 },  -- ritterhentzes
                { rate = 150, item = 17961 },  -- lion tamer
            },
            links  = 13,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Claret',
            ids    = { 400 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 314, agi = 77, int = 60, mnd = 65, chr = 68 },
                [79] = { acc = 337, eva = 320, agi = 78, int = 61, mnd = 66, chr = 69 },
                [80] = { acc = 342, eva = 325, agi = 78, int = 61, mnd = 66, chr = 69 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            meva   = { bind = 40 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2627 },  -- globule of claret
                { rate = 150, item = 18859 },  -- kerykeion
                { rate = 150, item = 16274 },  -- almah torque
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Anantaboga',
            ids    = { 401 },
            nm     = true,
            levels = {
                [85] = { acc = 373, eva = 335, agi = 71, int = 85, mnd = 85, chr = 93 },
                [86] = { acc = 380, eva = 341, agi = 72, int = 86, mnd = 86, chr = 95 },
                [87] = { acc = 386, eva = 345, agi = 72, int = 87, mnd = 87, chr = 96 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 1000, item = 2623 },  -- anantabogas heart
                { rate = 150, item = 19109 },  -- trilling dagger
                { rate = 150, item = 18448 },  -- hacchonenbutsu dangozashi
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Khromasoul Bhurborlor',
            ids    = { 402 },
            nm     = true,
            levels = {
                [82] = { acc = 351, eva = 322, agi = 54, int = 54, mnd = 90, chr = 85 },
                [83] = { acc = 357, eva = 327, agi = 54, int = 54, mnd = 90, chr = 85 },
                [84] = { acc = 363, eva = 332, agi = 54, int = 54, mnd = 92, chr = 87 },
            },
            ranks  = { fire = 5, ice = 2, wind = 1, earth = 2, thunder = 2, light = 1, dark = 1, paralyze = 2,
                       bind = 2, silence = 1, slow = 2, light_sleep = 1, dark_sleep = 1, blind = 1, stun = 2,
                       gravity = 1 },
            resist = { sleep = 25 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 2621 },  -- bhurborlors vambrace
                { rate = 240, item = 19034 },  -- ice grip
                { rate = 240, item = 19038 },  -- dark grip
                { rate = 1000, group = {  -- one of
                    { 16176, 1 },  -- simba buckler
                    { 15022, 1 },  -- oracles gloves
                    { 16343, 1 },  -- enkidus subligar
                } },
                { rate = 100, group = {  -- one of
                    { 16176, 1 },  -- simba buckler
                    { 15022, 1 },  -- oracles gloves
                    { 16343, 1 },  -- enkidus subligar
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 14,
        },
        {
            name   = 'Troll Grenadier',
            ids    = { 403, 404, 405 },
            levels = {
                [73] = { acc = 351, eva = 271, agi = 85, int = 60, mnd = 74, chr = 64 },
                [74] = { acc = 356, eva = 276, agi = 85, int = 60, mnd = 75, chr = 64 },
                [75] = { acc = 361, eva = 282, agi = 88, int = 62, mnd = 75, chr = 65 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Troll Cuirasser',
            ids    = { 406, 407, 408 },
            levels = {
                [73] = { acc = 303, eva = 274, agi = 60, int = 72, mnd = 80, chr = 70 },
                [74] = { acc = 308, eva = 278, agi = 60, int = 73, mnd = 82, chr = 70 },
                [75] = { acc = 313, eva = 284, agi = 62, int = 74, mnd = 82, chr = 70 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Troll Artilleryman',
            ids    = { 409, 410 },
            levels = {
                [73] = { acc = 351, eva = 271, agi = 85, int = 60, mnd = 74, chr = 64 },
                [74] = { acc = 356, eva = 276, agi = 85, int = 60, mnd = 75, chr = 64 },
                [75] = { acc = 361, eva = 282, agi = 88, int = 62, mnd = 75, chr = 65 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { poison = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Troll Hammersmith',
            ids    = { 411, 412 },
            levels = {
                [73] = { acc = 306, eva = 288, agi = 72, int = 54, mnd = 62, chr = 64 },
                [74] = { acc = 312, eva = 293, agi = 73, int = 54, mnd = 63, chr = 64 },
                [75] = { acc = 317, eva = 299, agi = 74, int = 55, mnd = 63, chr = 65 },
            },
            ranks  = { fire = 3, wind = -1, water = -2, light = -1, dark = -1, silence = -1, poison = -2,
                       light_sleep = -1, dark_sleep = -1, blind = -1, gravity = -1 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Sarameya',
            ids    = { 413 },
            nm     = true,
            levels = {
                [88] = { acc = 399, eva = 362, agi = 96, int = 110, mnd = 100, chr = 92 },
                [89] = { acc = 405, eva = 367, agi = 97, int = 112, mnd = 102, chr = 92 },
            },
            meva   = { all = 95, silence = 20, gravity = 20, lullaby = 30 },
            magic_dmg = { all = -50 },
            immune = { 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 5565 },  -- slice of cerberus meat
                { rate = 1000, item = 2168 },  -- cerberus claw
                { rate = 1000, item = 2169 },  -- cerberus hide
                { rate = 1000, item = 2619 },  -- sarameyas hide
                { rate = 1000, group = {  -- one of
                    { 16155, 1 },  -- aurum armet
                    { 16156, 1 },  -- oracles cap
                    { 11283, 1 },  -- oracles robe
                } },
                { rate = 150, group = {  -- one of
                    { 18446, 1 },  -- pachipachio
                    { 18497, 1 },  -- foolkiller
                    { 16337, 1 },  -- hachiryu haidate
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Vanasarvik',
            ids    = { 414, 419, 424 },
            nm     = true,
            levels = {
                [99] = { acc = 477, eva = 399, agi = 107, int = 124, mnd = 69, chr = 98 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Elders Imp',
            ids    = { 415, 416, 417, 418, 420, 421, 422, 423, 425, 426, 427, 428 },
            levels = {
                [99] = { acc = 477, eva = 399, agi = 107, int = 124, mnd = 69, chr = 98 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
        },
        {
            name   = 'Grand Grenade',
            ids    = { 429, 430, 431 },
            levels = {
                [99] = { acc = 477, eva = 427, agi = 101, int = 71, mnd = 76, chr = 91 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            detects = { 'sight', 'magic' },
            links  = 15,
        },
        {
            name   = 'Sarama',
            ids    = { 432, 433 },
            nm     = true,
            levels = {
                [99] = { acc = 483, eva = 436, agi = 118, int = 93, mnd = 93, chr = 96 },
            },
            ranks  = { fire = 11, light = 10, dark = 10, light_sleep = 10, dark_sleep = 10, blind = 10 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Awoken Mokkuralfi',
            ids    = { 435 },
            nm     = true,
            levels = {
                [119] = { acc = 484, eva = 496, agi = 120, int = 147, mnd = 95, chr = 117 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
        },
    },
    by_name = {},
}
