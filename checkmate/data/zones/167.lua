-- Bostaunieux Oubliette (zone 167).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Mousse' },
        [2] = { 'Arioch', 'Funnel Bats', 'Werebat' },
        [3] = { 'Phanduron the Condemned' },
        [4] = { 'Drexerion the Condemned' },
        [5] = { 'Funnel Bats', 'Werebat' },
        [6] = { 'Bloodsucker' },
    },
    monsters = {
        {
            name   = 'Bloodsucker',
            ids    = { 1, 3 },
            levels = {
                [57] = { acc = 218, eva = 205, agi = 61, int = 50, mnd = 46, chr = 50 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 50, mnd = 46, chr = 52 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60 },
            },
            spawn_levels = { [1] = { 65, 68 }, [3] = { 57, 58 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Acid Grease',
            ids    = { 2 },
            levels = {
                [52] = { acc = 191, eva = 178, agi = 54, int = 41, mnd = 45, chr = 47 },
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 46, chr = 48 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 47, chr = 48 },
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
            name   = 'Mousse',
            ids    = { 4, 5 },
            levels = {
                [60] = { acc = 234, eva = 220, agi = 60, int = 47, mnd = 51, chr = 53 },
                [61] = { acc = 240, eva = 225, agi = 63, int = 49, mnd = 53, chr = 55 },
                [62] = { acc = 245, eva = 230, agi = 63, int = 49, mnd = 53, chr = 55 },
                [63] = { acc = 250, eva = 235, agi = 63, int = 49, mnd = 53, chr = 55 },
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 57, chr = 60 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Funnel Bats BO',
            ids    = { 6, 7, 8, 9, 10, 11, 12, 13, 39, 40, 43, 44, 48, 50, 51, 52, 68, 70, 71 },
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
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
            links  = 2,
        },
        {
            name   = 'Hecatomb Hound',
            ids    = { 14, 19, 20, 23, 24, 99, 100, 101, 102, 103, 104, 105 },
            levels = {
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 41, chr = 54 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 43, chr = 54 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 46, mnd = 44, chr = 56 },
                [59] = { acc = 229, eva = 216, agi = 63, int = 47, mnd = 44, chr = 57 },
            },
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
            name   = 'Werebat',
            ids    = { 15, 16, 17, 18, 21, 22, 25, 26, 34, 35, 36, 37, 38, 74, 75, 76, 80, 81, 82, 83, 98, 106, 107,
                       108, 109, 110, 111, 112, 116, 117, 118, 119, 120, 131, 174, 175, 176, 177, 178, 179, 180,
                       181, 182, 183, 184 },
            levels = {
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53 },
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
            links  = 2,
        },
        {
            name   = 'Haunt',
            ids    = { 27, 32, 33, 47, 79, 88, 89, 93, 94, 114, 115, 128, 129 },
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 60, mnd = 46, chr = 58 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 62, mnd = 48, chr = 61 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 62, mnd = 48, chr = 61 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 63, mnd = 48, chr = 61 },
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
        {
            name   = 'Garm BO',
            ids    = { 28, 29, 30, 31, 60, 61, 62, 63, 64, 65, 66, 86, 87, 91, 92, 122, 123, 124, 132, 133 },
            levels = {
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 46, chr = 60 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 52, mnd = 49, chr = 62 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 49, chr = 63 },
            },
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
            name   = 'Dark Aspic',
            ids    = { 41, 42, 45, 46, 49, 69, 72, 73, 77, 78, 84, 85, 96, 97 },
            levels = {
                [52] = { acc = 191, eva = 178, agi = 54, int = 41, mnd = 45, chr = 47 },
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 46, chr = 48 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 47, chr = 48 },
            },
            spawn_levels = { [41] = { 52, 53 }, [84] = { 52, 53 }, [85] = { 52, 53 } },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mousse',
            ids    = { 53, 54, 55, 56, 57, 58, 113, 121, 125, 126, 127 },
            levels = {
                [58] = { acc = 223, eva = 209, agi = 59, int = 46, mnd = 50, chr = 52 },
                [59] = { acc = 229, eva = 215, agi = 60, int = 47, mnd = 51, chr = 53 },
                [60] = { acc = 234, eva = 220, agi = 60, int = 47, mnd = 51, chr = 53 },
                [61] = { acc = 240, eva = 225, agi = 63, int = 49, mnd = 53, chr = 55 },
                [62] = { acc = 245, eva = 230, agi = 63, int = 49, mnd = 53, chr = 55 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sewer Syrup',
            ids    = { 59 },
            nm     = true,
            levels = {
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            drops  = {
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 1000, group = { { 13303, 9500 }, { 0, 500 } } },  -- one of jelly ring, nothing
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Shii',
            ids    = { 67 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 51, chr = 65 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 55, mnd = 52, chr = 68 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 1000, item = 16980 },  -- sukesada
                { rate = 240, item = 858 },  -- wolf hide
                { rate = 240, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Drexerion the Condemned',
            ids    = { 90 },
            nm     = true,
            levels = {
                [72] = { acc = 344, eva = 291, agi = 88, int = 60, mnd = 63, chr = 68 },
                [73] = { acc = 350, eva = 296, agi = 89, int = 62, mnd = 66, chr = 68 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 150, item = 13912 },  -- shadow mask
                { rate = 100, item = 17234 },  -- flagellants crossbow
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Phanduron the Condemned',
            ids    = { 95 },
            nm     = true,
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 76, mnd = 60, chr = 71 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 79, mnd = 62, chr = 72 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'silence', 'stun' },
            drops  = {
                { rate = 150, item = 13912 },  -- shadow mask
                { rate = 50, item = 16943 },  -- ascalon
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Gespenst',
            ids    = { 130, 221, 222, 228, 229 },
            levels = {
                [68] = { acc = 276, eva = 263, agi = 71, int = 67, mnd = 52, chr = 66 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 69, mnd = 53, chr = 67 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 69, mnd = 53, chr = 67 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 829 },  -- square of silk cloth
                { rate = 150, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Arioch',
            ids    = { 185 },
            nm     = true,
            levels = {
                [56] = { acc = 213, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 1000, item = 1272 },  -- arioch fang
                { rate = 240, item = 922 },  -- bat wing
                { rate = 150, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Bloodsucker',
            ids    = { 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203,
                       204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 224,
                       225, 226, 227 },
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 57, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Manes',
            ids    = { 223 },
            nm     = true,
            levels = {
                [72] = { acc = 298, eva = 284, agi = 75, int = 71, mnd = 55, chr = 69 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 72, mnd = 56, chr = 70 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 1000, item = 1279 },  -- square of taffeta cloth
                { rate = 240, item = 1279 },  -- square of taffeta cloth
                { rate = 150, item = 1279 },  -- square of taffeta cloth
                { rate = 150, item = 1279 },  -- square of taffeta cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bloodsucker',
            ids    = { 230 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 274, agi = 73, int = 59, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 60, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 60, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 62, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            immune = { 'terror' },
            drops  = {
                { rate = 1000, item = 1271 },  -- pigeons blood ruby
                { rate = 150, item = 930 },  -- vial of beastman blood
                { rate = 150, item = 13302 },  -- bloodbead ring
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Bodach',
            ids    = { 231 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 57, chr = 69 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Garbage Gel',
            ids    = { 233, 234 },
            levels = {
                [122] = { acc = 485, eva = 552, agi = 106, int = 103, mnd = 110, chr = 112 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Trion',
            ids    = { 235 },
            nm     = true,
            levels = {
                [139] = { acc = 486, eva = 627, agi = 117, int = 121, mnd = 121, chr = 132 },
            },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
