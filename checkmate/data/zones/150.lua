-- Monastic Cavern (zone 150).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Orcish Bewitcher', 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Hexspinner',
                'Orcish Overlord', 'Orcish Predator', 'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran',
                'Orcish Warchief', 'Orcish Warlord', 'Orcish Zerker', 'Overlord Bakgodek' },
        [2] = { 'Orcish Bewitcher', 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Overlord', 'Orcish Predator',
                'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Warlord',
                'Orcish Zerker', 'Overlord Bakgodek' },
        [3] = { 'Orcish Bewitcher', 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Hexspinner',
                'Orcish Predator', 'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief',
                'Orcish Warlord', 'Orcish Zerker', 'Overlord Bakgodek' },
        [4] = { 'Orcish Bewitcher', 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought',
                'Orcish Farkiller', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Hexspinner',
                'Orcish Overlord', 'Orcish Predator', 'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran',
                'Orcish Warchief', 'Orcish Warlord', 'Orcish Zerker' },
        [5] = { 'Orcish Bowshooter', 'Orcish Champion', 'Orcish Dragoon', 'Orcish Dreadnought', 'Orcish Farkiller',
                'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Hexspinner', 'Orcish Overlord', 'Orcish Predator',
                'Orcish Protector', 'Orcish Trooper', 'Orcish Veteran', 'Orcish Warchief', 'Orcish Warlord',
                'Orcish Zerker', 'Overlord Bakgodek' },
    },
    monsters = {
        {
            name   = 'Orcish Bowshooter',
            ids    = { 1, 5, 9, 17, 168, 172, 178, 182 },
            levels = {
                [42] = { acc = 174, eva = 143, agi = 49, int = 31, mnd = 36, chr = 40 },
                [43] = { acc = 177, eva = 147, agi = 50, int = 31, mnd = 36, chr = 41 },
                [44] = { acc = 181, eva = 151, agi = 52, int = 31, mnd = 37, chr = 42 },
                [45] = { acc = 184, eva = 154, agi = 53, int = 34, mnd = 39, chr = 43 },
                [46] = { acc = 188, eva = 157, agi = 53, int = 34, mnd = 39, chr = 44 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Footsoldier',
            ids    = { 2, 6, 10, 18, 169, 173, 179, 183 },
            levels = {
                [43] = { acc = 156, eva = 144, agi = 44, int = 28, mnd = 31, chr = 41 },
                [44] = { acc = 161, eva = 148, agi = 47, int = 28, mnd = 31, chr = 42 },
                [45] = { acc = 164, eva = 151, agi = 47, int = 31, mnd = 34, chr = 43 },
                [46] = { acc = 168, eva = 155, agi = 48, int = 31, mnd = 34, chr = 44 },
                [47] = { acc = 171, eva = 157, agi = 49, int = 31, mnd = 34, chr = 44 },
            },
            spawn_levels = { [10] = { 44, 47 }, [18] = { 44, 47 }, [169] = { 44, 44 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 1686 },  -- soiled letter
                { rate = 50, item = 1033 },  -- davoi chest key
                { rate = 5, item = 12425 },  -- silver mask
                { rate = 5, item = 12681 },  -- silver mittens
                { rate = 5, item = 12809 },  -- silver hose
                { rate = 5, item = 12937 },  -- silver greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Gladiator',
            ids    = { 3, 7, 11, 19, 170, 174, 180, 184 },
            levels = {
                [44] = { acc = 162, eva = 148, agi = 38, int = 26, mnd = 37, chr = 42 },
                [45] = { acc = 165, eva = 151, agi = 39, int = 28, mnd = 39, chr = 43 },
                [46] = { acc = 169, eva = 154, agi = 39, int = 29, mnd = 39, chr = 44 },
                [47] = { acc = 172, eva = 158, agi = 40, int = 29, mnd = 40, chr = 44 },
                [48] = { acc = 176, eva = 161, agi = 41, int = 29, mnd = 41, chr = 45 },
            },
            spawn_levels = { [11] = { 47, 48 }, [180] = { 47, 48 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1033 },  -- davoi chest key
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Trooper',
            ids    = { 4, 8, 12, 20, 171, 175, 181, 185 },
            levels = {
                [45] = { acc = 161, eva = 146, agi = 36, int = 28, mnd = 42, chr = 48 },
                [46] = { acc = 165, eva = 149, agi = 37, int = 29, mnd = 43, chr = 50 },
                [47] = { acc = 168, eva = 152, agi = 38, int = 29, mnd = 43, chr = 50 },
                [48] = { acc = 172, eva = 155, agi = 39, int = 29, mnd = 44, chr = 50 },
                [49] = { acc = 176, eva = 159, agi = 40, int = 30, mnd = 45, chr = 52 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            drops  = {
                { rate = 100, item = 554 },  -- gold orcmask
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 50, item = 1033 },  -- davoi chest key
                { rate = 1, item = 12416 },  -- sallet
                { rate = 1, item = 12672 },  -- gauntlets
                { rate = 1, item = 12800 },  -- cuisses
                { rate = 1, item = 12928 },  -- plate leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Veteran',
            ids    = { 13, 21, 25, 29, 33, 37, 41, 45, 49, 55, 59, 63, 67, 71, 77, 81, 85, 90, 94, 166 },
            levels = {
                [52] = { acc = 194, eva = 179, agi = 56, int = 35, mnd = 39, chr = 51, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 184, agi = 57, int = 37, mnd = 40, chr = 51, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 190, agi = 58, int = 37, mnd = 40, chr = 52, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 195, agi = 58, int = 37, mnd = 41, chr = 53, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 200, agi = 61, int = 37, mnd = 41, chr = 54, resist = { virus = 20 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Predator',
            ids    = { 14, 22, 26, 30, 34, 38, 42, 46, 50, 56, 60, 64, 68, 72, 78, 82, 86, 91, 95, 176 },
            levels = {
                [53] = { acc = 233, eva = 188, agi = 64, int = 40, mnd = 46, chr = 51,
                         resist = { poison = 15, virus = 15 } },
                [54] = { acc = 238, eva = 193, agi = 64, int = 40, mnd = 46, chr = 52,
                         resist = { poison = 15, virus = 15 } },
                [55] = { acc = 243, eva = 198, agi = 65, int = 41, mnd = 47, chr = 53,
                         resist = { poison = 15, virus = 20 } },
                [56] = { acc = 249, eva = 203, agi = 67, int = 41, mnd = 48, chr = 54,
                         resist = { poison = 15, virus = 20 } },
                [57] = { acc = 255, eva = 209, agi = 68, int = 43, mnd = 49, chr = 54,
                         resist = { poison = 15, virus = 20 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Zerker',
            ids    = { 15, 23, 27, 31, 35, 39, 43, 47, 51, 57, 61, 65, 69, 73, 79, 83, 87, 92, 96, 177 },
            levels = {
                [54] = { acc = 205, eva = 188, agi = 54, int = 47, mnd = 37, chr = 46,
                         resist = { paralyze = 15, virus = 15 } },
                [55] = { acc = 210, eva = 193, agi = 54, int = 47, mnd = 38, chr = 46,
                         resist = { paralyze = 15, virus = 20 } },
                [56] = { acc = 216, eva = 198, agi = 57, int = 48, mnd = 39, chr = 48,
                         resist = { paralyze = 15, virus = 20 } },
                [57] = { acc = 222, eva = 203, agi = 57, int = 50, mnd = 40, chr = 48,
                         resist = { paralyze = 15, virus = 20 } },
                [58] = { acc = 227, eva = 208, agi = 57, int = 50, mnd = 41, chr = 49,
                         resist = { paralyze = 15, virus = 20 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4878 },  -- scroll of absorb-int
                { rate = 50, item = 4876 },  -- scroll of absorb-vit
                { rate = 50, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Warchief',
            ids    = { 16, 24, 28, 32, 36, 40, 44, 48, 52, 58, 62, 66, 70, 74, 80, 84, 88, 93, 97, 167 },
            levels = {
                [55] = { acc = 207, eva = 188, agi = 45, int = 34, mnd = 51, chr = 59 },
                [56] = { acc = 213, eva = 194, agi = 48, int = 35, mnd = 52, chr = 61 },
                [57] = { acc = 218, eva = 199, agi = 48, int = 37, mnd = 53, chr = 61 },
                [58] = { acc = 224, eva = 204, agi = 48, int = 37, mnd = 54, chr = 62 },
                [59] = { acc = 229, eva = 209, agi = 49, int = 37, mnd = 55, chr = 64 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 20 },
            drops  = {
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Farkiller',
            ids    = { 53, 75, 98, 102, 106, 112, 116, 120, 124, 128, 132, 136, 140, 145, 152, 157, 162 },
            levels = {
                [62] = { acc = 281, eva = 235, agi = 73, int = 46, mnd = 53, chr = 59,
                         resist = { poison = 20, virus = 20 } },
                [63] = { acc = 286, eva = 241, agi = 74, int = 46, mnd = 53, chr = 59,
                         resist = { poison = 20, virus = 20 } },
                [64] = { acc = 292, eva = 246, agi = 75, int = 46, mnd = 54, chr = 60,
                         resist = { poison = 20, virus = 20 } },
                [65] = { acc = 297, eva = 252, agi = 76, int = 49, mnd = 56, chr = 62,
                         resist = { poison = 20, virus = 20 } },
                [66] = { acc = 303, eva = 256, agi = 77, int = 49, mnd = 56, chr = 63,
                         resist = { poison = 20, virus = 20 } },
                [67] = { acc = 308, eva = 262, agi = 79, int = 49, mnd = 57, chr = 63,
                         resist = { poison = 20, virus = 20 } },
                [68] = { acc = 313, eva = 267, agi = 79, int = 50, mnd = 58, chr = 64,
                         resist = { poison = 20, virus = 20 } },
                [69] = { acc = 318, eva = 273, agi = 80, int = 51, mnd = 58, chr = 65,
                         resist = { poison = 20, virus = 20 } },
                [70] = { acc = 337, eva = 278, agi = 81, int = 51, mnd = 59, chr = 65,
                         resist = { poison = 20, virus = 25 } },
                [71] = { acc = 343, eva = 283, agi = 83, int = 52, mnd = 60, chr = 68,
                         resist = { poison = 20, virus = 25 } },
                [72] = { acc = 348, eva = 288, agi = 83, int = 52, mnd = 60, chr = 68,
                         resist = { poison = 20, virus = 25 } },
            },
            spawn_levels = { [53] = { 62, 66 }, [75] = { 62, 66 }, [98] = { 62, 66 }, [102] = { 62, 66 },
                             [112] = { 62, 66 }, [116] = { 62, 66 }, [120] = { 62, 66 }, [124] = { 62, 66 },
                             [128] = { 69, 71 }, [136] = { 69, 71 }, [140] = { 69, 71 }, [145] = { 69, 71 },
                             [152] = { 71, 72 }, [157] = { 71, 72 }, [162] = { 71, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1436 },  -- rangers testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
                { rate = 10, item = 5010 },  -- scroll of archers prelude
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Dreadnought',
            ids    = { 54, 76, 99, 103, 107, 110, 113, 117, 121, 125, 129, 133, 137, 141, 146, 153, 158, 163 },
            levels = {
                [63] = { acc = 253, eva = 237, agi = 66, int = 42, mnd = 46, chr = 59, resist = { virus = 20 } },
                [64] = { acc = 259, eva = 243, agi = 68, int = 42, mnd = 46, chr = 60, resist = { virus = 20 } },
                [65] = { acc = 264, eva = 248, agi = 68, int = 45, mnd = 49, chr = 62, resist = { virus = 20 } },
                [66] = { acc = 271, eva = 253, agi = 70, int = 45, mnd = 49, chr = 63, resist = { virus = 20 } },
                [67] = { acc = 275, eva = 258, agi = 71, int = 45, mnd = 49, chr = 63, resist = { virus = 20 } },
                [68] = { acc = 280, eva = 263, agi = 71, int = 45, mnd = 50, chr = 64, resist = { virus = 20 } },
                [69] = { acc = 286, eva = 269, agi = 72, int = 47, mnd = 51, chr = 65, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 274, agi = 73, int = 47, mnd = 51, chr = 65, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 279, agi = 75, int = 47, mnd = 52, chr = 68, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 284, agi = 75, int = 47, mnd = 52, chr = 68, resist = { virus = 25 } },
            },
            spawn_levels = { [54] = { 63, 66 }, [76] = { 63, 66 }, [99] = { 63, 66 }, [103] = { 63, 66 },
                             [107] = { 63, 66 }, [110] = { 63, 66 }, [113] = { 63, 66 }, [117] = { 63, 66 },
                             [121] = { 63, 66 }, [125] = { 63, 66 }, [133] = { 69, 71 }, [137] = { 69, 71 },
                             [141] = { 69, 71 }, [146] = { 71, 72 }, [158] = { 71, 72 }, [163] = { 71, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1426 },  -- warriors testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Champion',
            ids    = { 89, 100, 104, 108, 114, 118, 122, 126, 130, 134, 138, 142, 147, 154, 159, 164 },
            levels = {
                [64] = { acc = 261, eva = 243, agi = 56, int = 39, mnd = 54, chr = 60, resist = { virus = 20 } },
                [65] = { acc = 266, eva = 248, agi = 57, int = 41, mnd = 56, chr = 62, resist = { virus = 20 } },
                [66] = { acc = 272, eva = 254, agi = 58, int = 42, mnd = 56, chr = 63, resist = { virus = 20 } },
                [67] = { acc = 276, eva = 259, agi = 59, int = 42, mnd = 57, chr = 63, resist = { virus = 20 } },
                [68] = { acc = 282, eva = 264, agi = 59, int = 42, mnd = 58, chr = 64, resist = { virus = 20 } },
                [69] = { acc = 287, eva = 270, agi = 60, int = 43, mnd = 58, chr = 65, resist = { virus = 20 } },
                [70] = { acc = 293, eva = 275, agi = 61, int = 43, mnd = 59, chr = 65, resist = { virus = 25 } },
                [71] = { acc = 299, eva = 280, agi = 62, int = 44, mnd = 60, chr = 68, resist = { virus = 25 } },
                [72] = { acc = 304, eva = 285, agi = 62, int = 44, mnd = 60, chr = 68, resist = { virus = 25 } },
            },
            spawn_levels = { [89] = { 64, 68 }, [100] = { 64, 68 }, [104] = { 64, 68 }, [108] = { 64, 68 },
                             [118] = { 64, 68 }, [122] = { 64, 68 }, [126] = { 64, 68 }, [130] = { 69, 71 },
                             [134] = { 69, 71 }, [138] = { 69, 71 }, [142] = { 69, 71 }, [154] = { 70, 72 },
                             [159] = { 70, 72 }, [164] = { 70, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1427 },  -- monks testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Dragoon',
            ids    = { 101, 105, 109, 115, 119, 123, 127, 131, 135, 139, 143, 148, 155, 160, 165 },
            levels = {
                [65] = { acc = 284, eva = 252, agi = 64, int = 45, mnd = 53, chr = 69, resist = { virus = 20 } },
                [66] = { acc = 290, eva = 257, agi = 65, int = 45, mnd = 53, chr = 71, resist = { virus = 20 } },
                [67] = { acc = 295, eva = 263, agi = 67, int = 45, mnd = 53, chr = 71, resist = { virus = 20 } },
                [68] = { acc = 300, eva = 268, agi = 67, int = 45, mnd = 55, chr = 71, resist = { virus = 20 } },
                [69] = { acc = 305, eva = 273, agi = 67, int = 47, mnd = 55, chr = 73, resist = { virus = 20 } },
                [70] = { acc = 311, eva = 279, agi = 69, int = 47, mnd = 55, chr = 73, resist = { virus = 25 } },
                [71] = { acc = 317, eva = 284, agi = 70, int = 47, mnd = 57, chr = 76, resist = { virus = 25 } },
                [72] = { acc = 322, eva = 289, agi = 70, int = 47, mnd = 57, chr = 76, resist = { virus = 25 } },
            },
            spawn_levels = { [101] = { 65, 69 }, [105] = { 65, 69 }, [109] = { 65, 69 }, [115] = { 66, 69 },
                             [119] = { 66, 69 }, [123] = { 66, 69 }, [127] = { 66, 69 }, [135] = { 69, 71 },
                             [139] = { 69, 71 }, [143] = { 69, 71 }, [148] = { 69, 71 }, [155] = { 71, 72 },
                             [160] = { 71, 72 }, [165] = { 71, 72 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1439 },  -- dragoons testimony
                { rate = 50, item = 1042 },  -- davoi coffer key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Warlord',
            ids    = { 111, 150 },
            nm     = true,
            levels = {
                [72] = { acc = 302, eva = 282, agi = 70, int = 60, mnd = 49, chr = 60 },
                [73] = { acc = 308, eva = 288, agi = 72, int = 62, mnd = 50, chr = 60 },
                [74] = { acc = 313, eva = 293, agi = 72, int = 63, mnd = 50, chr = 61 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 20, virus = 25 },
            drops  = {
                { rate = 240, item = 1433 },  -- dark knights testimony
                { rate = 150, item = 4860 },  -- scroll of stun
                { rate = 50, item = 4798 },  -- scroll of stonega ii
                { rate = 10, item = 4769 },  -- scroll of stone iii
                { rate = 10, item = 4770 },  -- scroll of stone iv
                { rate = 10, item = 4799 },  -- scroll of stonega iii
                { rate = 10, item = 4818 },  -- scroll of quake
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Protector',
            ids    = { 144, 151, 156, 161 },
            levels = {
                [70] = { acc = 287, eva = 266, agi = 57, int = 43, mnd = 63, chr = 73 },
                [71] = { acc = 293, eva = 271, agi = 59, int = 44, mnd = 65, chr = 76 },
                [72] = { acc = 298, eva = 276, agi = 59, int = 44, mnd = 65, chr = 76 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 20, virus = 25 },
            drops  = {
                { rate = 100, item = 1432 },  -- paladins testimony
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Orcish Hexspinner',
            ids    = { 149 },
            nm     = true,
            levels = {
                [71] = { acc = 297, eva = 279, agi = 75, int = 68, mnd = 57, chr = 71 },
                [72] = { acc = 302, eva = 284, agi = 75, int = 68, mnd = 57, chr = 71 },
                [73] = { acc = 308, eva = 290, agi = 76, int = 71, mnd = 58, chr = 72 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 240, item = 1429 },  -- black mages testimony
                { rate = 150, item = 4769 },  -- scroll of stone iii
                { rate = 50, item = 4799 },  -- scroll of stonega iii
                { rate = 100, item = 4798 },  -- scroll of stonega ii
                { rate = 50, item = 4818 },  -- scroll of quake
                { rate = 10, item = 4770 },  -- scroll of stone iv
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Orcish Overlord',
            ids    = { 186 },
            nm     = true,
            levels = {
                [75] = { acc = 315, eva = 292, agi = 60, int = 46, mnd = 68, chr = 78 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 25, virus = 25 },
            drops  = {
                { rate = 1000, item = 554 },  -- gold orcmask
                { rate = 1000, item = 751 },  -- platinum beastcoin
                { rate = 1000, item = 1432 },  -- paladins testimony
                { rate = 100, item = 16938 },  -- glorious sword
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Overlord Bakgodek',
            ids    = { 187 },
            nm     = true,
            levels = {
                [85] = { acc = 372, eva = 339, agi = 59, int = 50, mnd = 83, chr = 92 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, paralyze = 8,
                       silence = 11, slow = 8, poison = -3, light_sleep = 11, dark_sleep = 11, blind = -2,
                       stun = -2, gravity = -2 },
            resist = { sleep = 25 },
            drops  = {
                { rate = 1000, item = 1432 },  -- paladins testimony
                { rate = 240, item = 17928 },  -- juggernaut
                { rate = 10, item = 4172 },  -- reraiser
                { rate = 10, item = 4174 },  -- vile elixir
                { rate = 10, item = 4175 },  -- vile elixir +1
                { rate = 1000, group = {  -- one of
                    { 942, 3000 },  -- philosophers stone
                    { 844, 3000 },  -- phoenix feather
                    { 1132, 1000 },  -- square of raxa
                    { 658, 750 },  -- damascus ingot
                    { 837, 750 },  -- spool of malboro fiber
                    { 836, 750 },  -- square of damascene cloth
                    { 1110, 750 },  -- vial of black beetle blood
                } },
                { rate = 1000, group = {  -- one of
                    { 1132, 1550 },  -- square of raxa
                    { 645, 650 },  -- chunk of darksteel ore
                    { 737, 650 },  -- chunk of gold ore
                    { 644, 650 },  -- chunk of mythril ore
                    { 738, 650 },  -- chunk of platinum ore
                    { 887, 650 },  -- coral fragment
                    { 902, 650 },  -- demon horn
                    { 702, 650 },  -- ebony log
                    { 866, 650 },  -- handful of wyvern scales
                    { 700, 650 },  -- mahogany log
                    { 703, 650 },  -- petrified log
                    { 895, 650 },  -- ram horn
                    { 823, 650 },  -- spool of gold thread
                    { 830, 650 },  -- square of rainbow cloth
                } },
                { rate = 1000, group = {  -- one of
                    { 17649, 8500 },  -- nightmare sword
                    { 12362, 1500 },  -- highlanders targe
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Bugaboo',
            ids    = { 188 },
            nm     = true,
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 63, mnd = 48, chr = 61 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 10, bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 10, stun = 10, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Mimic',
            ids    = { 189 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1042 },  -- davoi coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Orcish Bewitcher',
            ids    = { 197 },
            nm     = true,
            levels = {
                [139] = { acc = 501, eva = 636, agi = 135, int = 139, mnd = 102, chr = 124 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
    },
    by_name = {},
}
