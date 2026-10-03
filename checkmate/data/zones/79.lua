-- Caedarva Mire (zone 79).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Llamhigyn Y Dwr' },
        [2] = { 'Marsh Murre' },
        [3] = { 'Mature Treant', 'Treant Sapling' },
        [4] = { 'Caedarva Leech' },
        [5] = { 'Dark Bugler', 'Heraldic Imp', 'Orderly Imp', 'Verdelet', 'Zikko' },
        [6] = { 'Experimental Lamia', 'Lamia Chaukidar', 'Lamia Fatedealer', 'Lamia Necromancer', 'Lamia No27',
                'Lamia Toxophilite', 'Merrow Shadowdancer', 'Merrow Typhoondancer' },
        [7] = { 'Spongilla Fly' },
        [8] = { 'Elder Treant' },
        [9] = { 'Qiqirn Mireguide', 'Qiqirn Rock Hound' },
        [10] = { 'Guard Skeleton' },
        [11] = { 'Experimental Lamia', 'Lamia Chaukidar', 'Lamia Fatedealer', 'Lamia No27', 'Lamia Toxophilite',
                 'Merrow Shadowdancer', 'Merrow Typhoondancer' },
        [12] = { 'Dark Esquire' },
        [13] = { 'Dark Bugler', 'Heraldic Imp', 'Orderly Imp', 'Verdelet' },
        [14] = { 'Experimental Lamia', 'Lamia Chaukidar', 'Lamia Fatedealer', 'Lamia Necromancer',
                 'Lamia Toxophilite', 'Merrow Shadowdancer', 'Merrow Typhoondancer' },
        [15] = { 'Dark Bugler', 'Heraldic Imp', 'Orderly Imp', 'Zikko' },
        [16] = { 'Arisen Soulflayer', 'Descended Winebibber', 'Soulflayer' },
        [17] = { 'Lamia Chaukidar', 'Lamia Fatedealer', 'Lamia Necromancer', 'Lamia No27', 'Lamia Toxophilite',
                 'Merrow Shadowdancer', 'Merrow Typhoondancer' },
        [18] = { 'Experimental Lamia', 'Lamia Chaukidar', 'Lamia Fatedealer', 'Lamia Necromancer', 'Lamia No27',
                 'Lamia Toxophilite', 'Merrow Typhoondancer' },
        [19] = { 'Descended Winebibber', 'Mahjlaef the Paintorn', 'Soulflayer' },
        [20] = { 'Arisen Soulflayer', 'Descended Winebibber', 'Mahjlaef the Paintorn', 'Soulflayer' },
    },
    monsters = {
        {
            name   = 'Caedarva Pondscum',
            ids    = { 1 },
            levels = {
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
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
            name   = 'Caedarva Marshscum',
            ids    = { 2 },
            levels = {
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
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
            name   = 'Suhur Mas',
            ids    = { 3 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 57 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Llamhigyn Y Dwr',
            ids    = { 4, 5 },
            levels = {
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 55, chr = 71 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 57, chr = 73 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Chigoe',
            ids    = { 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 },
            levels = {
                [62] = { acc = 255, eva = 288, agi = 81, int = 77, mnd = 35, chr = 35 },
                [63] = { acc = 262, eva = 294, agi = 82, int = 78, mnd = 35, chr = 35 },
                [64] = { acc = 267, eva = 300, agi = 84, int = 79, mnd = 35, chr = 35 },
                [65] = { acc = 273, eva = 305, agi = 85, int = 80, mnd = 35, chr = 35 },
                [66] = { acc = 278, eva = 311, agi = 86, int = 82, mnd = 37, chr = 37 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 2, thunder = 1, water = -1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 2, poison = -1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2365 },  -- vial of demon blood
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Puktrap',
            ids    = { 16, 27, 28, 30, 32, 33, 36, 42, 43, 45, 46, 48, 54, 55, 59, 60, 63, 65, 66, 67 },
            levels = {
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Marsh Murre',
            ids    = { 17, 18, 26, 34, 39, 41, 50, 57, 62, 64, 85, 126, 163, 179, 181, 182, 184, 185, 188, 189, 193,
                       201, 205, 206, 210, 215, 219, 220 },
            levels = {
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            spawn_levels = { [17] = { 64, 66 }, [18] = { 64, 66 }, [26] = { 64, 66 }, [34] = { 64, 66 },
                             [39] = { 64, 66 }, [41] = { 64, 66 }, [50] = { 64, 66 }, [57] = { 64, 66 },
                             [62] = { 64, 66 }, [64] = { 64, 66 }, [85] = { 66, 68 }, [126] = { 66, 68 },
                             [163] = { 64, 66 }, [179] = { 64, 66 }, [181] = { 64, 66 }, [182] = { 64, 66 },
                             [184] = { 64, 66 }, [185] = { 64, 66 }, [188] = { 64, 66 }, [189] = { 65, 67 },
                             [193] = { 65, 67 }, [201] = { 65, 67 }, [205] = { 65, 67 }, [206] = { 65, 67 },
                             [210] = { 65, 67 }, [215] = { 65, 67 }, [219] = { 65, 67 }, [220] = { 65, 67 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 150, item = 847 },  -- bird feather
                { rate = 50, item = 4570 },  -- bird egg
            },
            links  = 2,
        },
        {
            name   = 'Treant Sapling AS CM',
            ids    = { 19, 22, 25, 35, 38, 51, 58, 87, 88, 97, 98, 104, 105, 106, 107, 112, 114, 117, 118, 177, 178,
                       186, 187, 232, 300, 304 },
            levels = {
                [61] = { acc = 240, eva = 227, agi = 66, int = 49, mnd = 49, chr = 52 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 49, chr = 52 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 49, chr = 52 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            links  = 3,
        },
        {
            name   = 'Chigoe',
            ids    = { 20, 21, 23, 24, 52, 53, 90, 91, 93, 94, 100, 101, 102, 156, 157, 158, 216, 217 },
            levels = {
                [64] = { acc = 267, eva = 300, agi = 84, int = 79, mnd = 35, chr = 35 },
                [65] = { acc = 273, eva = 305, agi = 85, int = 80, mnd = 35, chr = 35 },
                [66] = { acc = 278, eva = 311, agi = 86, int = 82, mnd = 37, chr = 37 },
            },
            spawn_levels = { [94] = { 65, 66 } },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 2, thunder = 1, water = -1, light = 1, dark = 1,
                       paralyze = 1, bind = 1, silence = 1, slow = 2, poison = -1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2365 },  -- vial of demon blood
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Water Elemental',
            ids    = { 29, 61, 77, 135, 247, 274 },
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
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
            name   = 'Caedarva Leech',
            ids    = { 31, 37, 44, 47, 49, 56, 68, 69, 99, 153, 154, 155, 180, 183 },
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 53, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 54, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 4,
        },
        {
            name   = 'Orderly Imp',
            ids    = { 40, 95, 115, 192, 211, 218 },
            levels = {
                [63] = { acc = 252, eva = 219, agi = 70, int = 82, mnd = 45, chr = 64 },
                [64] = { acc = 258, eva = 225, agi = 72, int = 83, mnd = 45, chr = 66 },
                [65] = { acc = 263, eva = 229, agi = 72, int = 84, mnd = 47, chr = 66 },
                [66] = { acc = 269, eva = 235, agi = 75, int = 85, mnd = 48, chr = 67 },
                [67] = { acc = 273, eva = 239, agi = 75, int = 87, mnd = 48, chr = 69 },
                [68] = { acc = 278, eva = 244, agi = 75, int = 87, mnd = 49, chr = 69 },
            },
            spawn_levels = { [40] = { 63, 65 }, [95] = { 66, 68 }, [115] = { 66, 68 }, [192] = { 66, 68 },
                             [211] = { 66, 68 }, [218] = { 66, 68 } },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            drops  = {
                { rate = 150, item = 2163 },  -- imp wing
                { rate = 50, item = 2157 },  -- imp horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            aggro_note = 'night_sight',
            links  = 5,
        },
        {
            name   = 'Wild Karakul',
            ids    = { 70, 71, 72, 73, 74, 75, 76, 78, 79, 89, 92, 166, 168, 172 },
            levels = {
                [68] = { acc = 276, eva = 263, agi = 71, int = 50, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 51, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 51, mnd = 55, chr = 61 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = 1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = 1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 878 },  -- karakul skin
                { rate = 100, item = 5571 },  -- slice of karakul meat
            },
            aggro_note = 'sleeps',
            aggro_hours = { 6, 19 },
        },
        {
            name   = 'Jnun CM',
            ids    = { 80, 81, 84, 110, 133, 134, 136, 137, 243, 244, 266, 267, 268 },
            levels = {
                [72] = { acc = 298, eva = 284, agi = 75, int = 55, mnd = 52, chr = 68 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 54, chr = 68 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 55, chr = 70 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 55, chr = 71 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
            },
            spawn_levels = { [80] = { 72, 73 }, [81] = { 72, 73 }, [84] = { 72, 73 }, [110] = { 72, 73 },
                             [133] = { 76, 77 }, [134] = { 76, 77 }, [136] = { 76, 77 }, [137] = { 76, 77 },
                             [243] = { 75, 77 }, [244] = { 75, 77 }, [266] = { 75, 77 }, [267] = { 75, 77 },
                             [268] = { 75, 77 } },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro_note = 'sleeps',
        },
        {
            name   = 'Oil Slick CM',
            ids    = { 82, 83, 108, 109, 269, 270 },
            levels = {
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
                [66] = { acc = 267, eva = 251, agi = 67, int = 52, mnd = 57, chr = 58 },
                [67] = { acc = 271, eva = 256, agi = 67, int = 53, mnd = 57, chr = 59 },
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 57, chr = 60 },
                [69] = { acc = 282, eva = 267, agi = 69, int = 54, mnd = 59, chr = 60 },
            },
            spawn_levels = { [82] = { 65, 67 }, [83] = { 65, 67 }, [108] = { 65, 67 }, [109] = { 65, 67 },
                             [269] = { 67, 69 }, [270] = { 67, 69 } },
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
            name   = 'Mature Treant',
            ids    = { 86, 96, 103, 111, 113, 116, 122 },
            levels = {
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 55, mnd = 55, chr = 60 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 55, mnd = 55, chr = 60 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 923 },  -- dryad root
                { rate = 150, item = 918 },  -- sprig of mistletoe
                { rate = 100, item = 4448 },  -- puffball
                { rate = 50, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3000 },  -- mahogany log
                    { 702, 1500 },  -- ebony log
                    { 703, 1000 },  -- petrified log
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Lamia Fatedealer',
            ids    = { 119, 123 },
            levels = {
                [74] = { acc = 313, eva = 289, agi = 82, int = 85, mnd = 72, chr = 72 },
                [75] = { acc = 319, eva = 294, agi = 83, int = 86, mnd = 74, chr = 74 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 2332 },  -- corsairs testimony
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Reserve Draugar',
            ids    = { 120, 124 },
            levels = {
                [73] = { acc = 306, eva = 267, agi = 76, int = 89, mnd = 60, chr = 70 },
                [74] = { acc = 312, eva = 272, agi = 77, int = 89, mnd = 60, chr = 70 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Reserve Draugar',
            ids    = { 121, 125 },
            levels = {
                [73] = { acc = 312, eva = 357, agi = 82, int = 76, mnd = 48, chr = 52 },
                [74] = { acc = 318, eva = 362, agi = 82, int = 77, mnd = 48, chr = 52 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Heraldic Imp CM',
            ids    = { 127, 130, 131, 139, 142, 144, 145, 146, 149, 150, 151, 160, 161, 164, 221, 233, 265, 295,
                       301, 350, 351, 352, 355, 356, 359, 360, 361, 363, 364, 366, 369, 370, 371, 372, 375, 376,
                       377, 380, 381, 382, 383, 388, 389, 391, 392, 393, 394, 395, 396 },
            levels = {
                [79] = { acc = 339, eva = 299, agi = 87, int = 101, mnd = 56, chr = 80 },
                [80] = { acc = 344, eva = 304, agi = 87, int = 101, mnd = 56, chr = 80 },
                [81] = { acc = 352, eva = 310, agi = 90, int = 103, mnd = 58, chr = 82 },
                [82] = { acc = 358, eva = 315, agi = 90, int = 103, mnd = 58, chr = 82 },
            },
            spawn_levels = { [127] = { 79, 81 }, [130] = { 79, 81 }, [131] = { 79, 81 }, [139] = { 79, 81 },
                             [142] = { 79, 81 }, [144] = { 79, 81 }, [145] = { 79, 81 }, [146] = { 79, 81 },
                             [149] = { 79, 81 }, [150] = { 79, 81 }, [151] = { 79, 81 }, [160] = { 79, 81 },
                             [161] = { 79, 81 }, [164] = { 79, 81 }, [221] = { 79, 81 }, [233] = { 79, 81 },
                             [265] = { 79, 81 }, [295] = { 79, 81 }, [301] = { 79, 81 }, [350] = { 80, 82 },
                             [351] = { 80, 82 }, [352] = { 80, 82 }, [355] = { 80, 82 }, [356] = { 80, 82 },
                             [359] = { 80, 82 }, [360] = { 80, 82 }, [361] = { 80, 82 }, [363] = { 80, 82 },
                             [364] = { 80, 82 }, [366] = { 80, 82 }, [369] = { 80, 82 }, [370] = { 80, 82 },
                             [371] = { 80, 82 }, [372] = { 80, 82 }, [375] = { 80, 82 }, [376] = { 80, 82 },
                             [377] = { 80, 82 }, [380] = { 80, 82 }, [381] = { 80, 82 }, [382] = { 80, 82 },
                             [383] = { 80, 82 }, [388] = { 80, 82 }, [389] = { 80, 82 }, [391] = { 80, 82 },
                             [392] = { 80, 82 }, [393] = { 80, 82 }, [394] = { 80, 82 }, [395] = { 80, 82 },
                             [396] = { 80, 82 } },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            drops  = {
                { rate = 240, item = 2163 },  -- imp wing
                { rate = 50, item = 2157 },  -- imp horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            aggro_note = 'night_sight',
        },
        {
            name   = 'Spongilla Fly',
            ids    = { 128, 129, 132, 138, 140, 141, 143, 147, 148, 152, 159 },
            levels = {
                [78] = { acc = 331, eva = 318, agi = 85, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 337, eva = 324, agi = 87, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
            },
            links  = 7,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 162 },
            levels = {
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
            },
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
            name   = 'Mosshorn',
            ids    = { 165, 167, 171, 173, 175 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { ice = 2, earth = 2, thunder = -1, water = -1, paralyze = 2, bind = 2, slow = 2, poison = -1,
                       stun = -1 },
            drops  = {
                { rate = 1000, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 895 },  -- ram horn
                { rate = 1000, item = 531 },  -- lanolin cube
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Elder Treant',
            ids    = { 169, 170, 174, 176, 234, 235, 302, 303, 305, 306 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 65 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 67 },
                [82] = { acc = 355, eva = 337, agi = 85, int = 64, mnd = 64, chr = 67 },
            },
            ranks  = { fire = -2, ice = -1, wind = -1, earth = 1, thunder = -1, water = 1, light = 1, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = 1, poison = 1, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Qiqirn Rock Hound',
            ids    = { 190, 194, 199 },
            levels = {
                [67] = { acc = 307, eva = 245, agi = 87, int = 55, mnd = 65, chr = 59 },
                [68] = { acc = 312, eva = 250, agi = 87, int = 57, mnd = 65, chr = 60 },
                [69] = { acc = 317, eva = 255, agi = 89, int = 57, mnd = 65, chr = 60 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 2153 },  -- qiqirn sandbag
            },
            links  = 9,
        },
        {
            name   = 'Guard Skeleton blm',
            ids    = { 191, 198, 204, 209, 214 },
            levels = {
                [67] = { acc = 273, eva = 237, agi = 71, int = 83, mnd = 55, chr = 65 },
                [68] = { acc = 278, eva = 242, agi = 71, int = 83, mnd = 57, chr = 65 },
                [69] = { acc = 284, eva = 247, agi = 72, int = 84, mnd = 57, chr = 65 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 10,
        },
        {
            name   = 'Guard Skeleton war',
            ids    = { 195, 200 },
            levels = {
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 49, chr = 59 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 50, chr = 60 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 54, mnd = 51, chr = 60 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 10,
        },
        {
            name   = 'Qiqirn Mireguide',
            ids    = { 196, 202, 207, 212 },
            levels = {
                [67] = { acc = 281, eva = 312, agi = 79, int = 67, mnd = 48, chr = 48 },
                [68] = { acc = 286, eva = 318, agi = 81, int = 68, mnd = 48, chr = 48 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 69, mnd = 48, chr = 48 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 2153 },  -- qiqirn sandbag
            },
            links  = 9,
        },
        {
            name   = 'Lamia Idolater',
            ids    = { 222, 223, 224, 226, 227, 228, 229, 230, 231, 264, 271, 273, 278, 284, 286, 288, 292, 294,
                       298, 318, 331, 332, 333, 334 },
            levels = {
                [79] = { acc = 339, eva = 316, agi = 71, int = 82, mnd = 51, chr = 46 },
                [80] = { acc = 344, eva = 321, agi = 71, int = 82, mnd = 51, chr = 46 },
                [81] = { acc = 352, eva = 326, agi = 73, int = 85, mnd = 54, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            drops  = {
                { rate = 150, item = 2159 },  -- qutrub bandage
                { rate = 10, item = 2165 },  -- qutrub gorget
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Guard Bhoot',
            ids    = { 225, 255, 277 },
            levels = {
                [81] = { acc = 349, eva = 307, agi = 85, int = 103, mnd = 67, chr = 82 },
                [82] = { acc = 355, eva = 312, agi = 85, int = 103, mnd = 67, chr = 82 },
                [83] = { acc = 361, eva = 316, agi = 85, int = 105, mnd = 67, chr = 82 },
            },
            ranks  = { fire = -2, ice = 5, wind = -1, thunder = -2, water = -1, light = -2, dark = 5, paralyze = 5,
                       bind = 5, silence = -1, poison = -1, light_sleep = -2, dark_sleep = 5, blind = 5, stun = -2,
                       gravity = -1 },
            resist = { paralyze = 20 },
            magic_dmg = { all = -25 },
            undead = true,
            drops  = {
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 150, item = 2274 },  -- square of mohbwa cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 236, 240, 246, 251, 319 },
            levels = {
                [75] = { acc = 317, eva = 298, agi = 58, int = 52, mnd = 70, chr = 70 },
                [76] = { acc = 323, eva = 303, agi = 59, int = 54, mnd = 72, chr = 71 },
                [77] = { acc = 329, eva = 309, agi = 60, int = 54, mnd = 72, chr = 71 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 237, 242, 249, 253, 321 },
            levels = {
                [75] = { acc = 359, eva = 283, agi = 91, int = 65, mnd = 70, chr = 70 },
                [76] = { acc = 365, eva = 289, agi = 92, int = 66, mnd = 72, chr = 71 },
                [77] = { acc = 370, eva = 293, agi = 93, int = 66, mnd = 72, chr = 71 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 238, 241, 248, 252, 320 },
            levels = {
                [75] = { acc = 311, eva = 285, agi = 65, int = 77, mnd = 77, chr = 75 },
                [76] = { acc = 317, eva = 291, agi = 66, int = 80, mnd = 80, chr = 77 },
                [77] = { acc = 322, eva = 295, agi = 66, int = 80, mnd = 80, chr = 77 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 239, 245, 250, 254, 322 },
            levels = {
                [75] = { acc = 314, eva = 294, agi = 83, int = 77, mnd = 65, chr = 70 },
                [76] = { acc = 321, eva = 300, agi = 84, int = 80, mnd = 66, chr = 71 },
                [77] = { acc = 326, eva = 305, agi = 86, int = 80, mnd = 66, chr = 71 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Dark Elemental',
            ids    = { 256, 285 },
            levels = {
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52 },
                [75] = { acc = 314, eva = 297, agi = 70, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 321, eva = 302, agi = 72, int = 80, mnd = 54, chr = 54 },
            },
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
            name   = 'Draugar Servant',
            ids    = { 257, 259, 276, 327, 329 },
            levels = {
                [78] = { acc = 351, eva = 320, agi = 72, int = 60, mnd = 65, chr = 80 },
                [79] = { acc = 358, eva = 326, agi = 75, int = 61, mnd = 65, chr = 82 },
                [80] = { acc = 363, eva = 331, agi = 75, int = 61, mnd = 65, chr = 82 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Draugars Wyvern',
            ids    = { 258, 275, 328 },
            levels = {
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
        {
            name   = 'Lamia Idolater',
            ids    = { 260, 263, 272, 283, 287, 289, 291, 293, 297 },
            levels = {
                [79] = { acc = 339, eva = 295, agi = 78, int = 96, mnd = 65, chr = 66 },
                [80] = { acc = 344, eva = 300, agi = 78, int = 96, mnd = 65, chr = 66 },
                [81] = { acc = 352, eva = 305, agi = 81, int = 98, mnd = 67, chr = 68 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            drops  = {
                { rate = 150, item = 2159 },  -- qutrub bandage
                { rate = 10, item = 2165 },  -- qutrub gorget
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Draugar Servant',
            ids    = { 261, 282, 324 },
            levels = {
                [78] = { acc = 340, eva = 384, agi = 86, int = 80, mnd = 51, chr = 54 },
                [79] = { acc = 346, eva = 390, agi = 88, int = 82, mnd = 51, chr = 55 },
                [80] = { acc = 351, eva = 395, agi = 88, int = 82, mnd = 51, chr = 55 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Draugar Servant',
            ids    = { 262, 281, 323, 326 },
            levels = {
                [78] = { acc = 333, eva = 312, agi = 72, int = 80, mnd = 51, chr = 54 },
                [79] = { acc = 339, eva = 318, agi = 75, int = 82, mnd = 51, chr = 55 },
                [80] = { acc = 344, eva = 323, agi = 75, int = 82, mnd = 51, chr = 55 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Draugar Servant',
            ids    = { 279 },
            levels = {
                [78] = { acc = 333, eva = 292, agi = 80, int = 93, mnd = 65, chr = 72 },
                [79] = { acc = 339, eva = 297, agi = 82, int = 96, mnd = 65, chr = 75 },
                [80] = { acc = 344, eva = 302, agi = 82, int = 96, mnd = 65, chr = 75 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lamia Toxophilite',
            ids    = { 280, 325 },
            levels = {
                [82] = { acc = 404, eva = 319, agi = 98, int = 80, mnd = 86, chr = 80 },
                [83] = { acc = 410, eva = 324, agi = 100, int = 80, mnd = 86, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1869 },  -- lamia skin
                { rate = 150, item = 18688 },  -- lamian kaman -1
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamia Chaukidar',
            ids    = { 290, 330 },
            levels = {
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
                [83] = { acc = 366, eva = 336, agi = 91, int = 94, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1869 },  -- lamia skin
                { rate = 100, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamia Necromancer',
            ids    = { 296 },
            levels = {
                [82] = { acc = 360, eva = 312, agi = 85, int = 107, mnd = 80, chr = 86 },
                [83] = { acc = 366, eva = 316, agi = 85, int = 109, mnd = 80, chr = 86 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1869 },  -- lamia skin
                { rate = 100, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Dark Rider',
            ids    = { 336 },
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
            ids    = { 337, 338, 339 },
            levels = {
                [76] = { acc = 323, eva = 285, agi = 85, int = 97, mnd = 54, chr = 77 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 5,
        },
        {
            name   = 'Dark Esquire',
            ids    = { 340, 341, 342 },
            levels = {
                [76] = { acc = 323, eva = 306, agi = 80, int = 64, mnd = 50, chr = 71 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Peallaidh',
            ids    = { 343 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 55, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = 1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = 1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            immune = { 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 878 },  -- karakul skin
                { rate = 100, item = 5571 },  -- slice of karakul meat
            },
        },
        {
            name   = 'Zikko',
            ids    = { 344 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 304, agi = 87, int = 101, mnd = 56, chr = 80 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            immune = { 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15896 },  -- immortals sash
                { rate = 150, item = 18390 },  -- templar hammer
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 13,
        },
        {
            name   = 'Caedarva Toad',
            ids    = { 345 },
            nm     = true,
            levels = {
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 35, chr = 45 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 9, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 9, blind = 9 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Jazaraat',
            ids    = { 346 },
            nm     = true,
            levels = {
                [67] = { acc = 271, eva = 252, agi = 75, int = 71, mnd = 59, chr = 63 },
                [68] = { acc = 276, eva = 258, agi = 77, int = 71, mnd = 60, chr = 64 },
                [69] = { acc = 282, eva = 263, agi = 77, int = 72, mnd = 60, chr = 65 },
                [70] = { acc = 287, eva = 269, agi = 79, int = 73, mnd = 61, chr = 65 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lamia No27',
            ids    = { 348 },
            nm     = true,
            levels = {
                [79] = { acc = 341, eva = 297, agi = 82, int = 105, mnd = 78, chr = 84 },
                [80] = { acc = 346, eva = 302, agi = 82, int = 105, mnd = 78, chr = 84 },
                [81] = { acc = 354, eva = 307, agi = 85, int = 107, mnd = 80, chr = 86 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 14,
        },
        {
            name   = 'Moshdahn',
            ids    = { 349 },
            nm     = true,
            levels = {
                [79] = { acc = 339, eva = 316, agi = 71, int = 82, mnd = 51, chr = 46 },
                [80] = { acc = 344, eva = 321, agi = 71, int = 82, mnd = 51, chr = 46 },
                [81] = { acc = 352, eva = 326, agi = 73, int = 85, mnd = 54, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Soulflayer',
            ids    = { 353, 354, 357, 362, 365, 367, 368, 373, 374, 378, 379, 384, 385, 386, 387, 390 },
            levels = {
                [82] = { acc = 358, eva = 308, agi = 76, int = 112, mnd = 85, chr = 73 },
                [83] = { acc = 364, eva = 312, agi = 76, int = 115, mnd = 86, chr = 73 },
            },
            ranks  = { ice = 2, water = 9, light = -1, dark = 11, paralyze = 2, bind = 2, poison = 9,
                       light_sleep = -1, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 2335 },  -- soulflayer tentacle
                { rate = 100, item = 2336 },  -- soulflayer staff
                { rate = 50, item = 1724 },  -- soulflayer robe
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
        },
        {
            name   = 'Khimaira',
            ids    = { 397 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 356, agi = 92, int = 66, mnd = 71, chr = 79 },
            },
            ranks  = { fire = 8, ice = 5, wind = 8, earth = 7, thunder = 9, water = 5, light = 7, dark = 5,
                       paralyze = 7, bind = 7, silence = 7, slow = 7, poison = 7, light_sleep = 7, dark_sleep = 7,
                       blind = 7, stun = 9, gravity = 7 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 2371 },  -- khimaira horn
                { rate = 1000, item = 2372 },  -- khimaira mane
                { rate = 1000, item = 2373 },  -- khimaira tail
                { rate = 1000, item = 2372 },  -- khimaira mane
                { rate = 100, item = 18847 },  -- seveneyes
                { rate = 50, item = 17738 },  -- hauteclaire
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Verdelet',
            ids    = { 398 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 329, agi = 92, int = 107, mnd = 60, chr = 85 },
                [86] = { acc = 384, eva = 335, agi = 95, int = 108, mnd = 61, chr = 86 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -1, thunder = -1, water = -1, light = -1, dark = 8,
                       paralyze = -1, bind = -1, silence = 3, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = 8, blind = 8, stun = -1, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'slow' },
            drops  = {
                { rate = 1000, item = 2635 },  -- verdelets wing
                { rate = 150, item = 16239 },  -- solitaire cape
                { rate = 150, item = 16175 },  -- muse tariqah
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 15,
        },
        {
            name   = 'Tyger',
            ids    = { 399 },
            nm     = true,
            levels = {
                [88] = { acc = 396, eva = 371, agi = 95, int = 67, mnd = 72, chr = 81 },
                [89] = { acc = 403, eva = 377, agi = 97, int = 69, mnd = 75, chr = 82 },
                [90] = { acc = 409, eva = 382, agi = 97, int = 70, mnd = 75, chr = 82 },
            },
            ranks  = { fire = 8, ice = 5, wind = 8, earth = 7, thunder = 9, water = 5, light = 7, dark = 5,
                       paralyze = 5, bind = 5, silence = 8, slow = 7, poison = 5, light_sleep = 7, dark_sleep = 5,
                       blind = 5, stun = 9, gravity = 8 },
            meva   = { sleep = 30, bind = 30, gravity = 30 },
            magic_dmg = { all = -25 },
            immune = { 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 2373 },  -- khimaira tail
                { rate = 1000, item = 2371 },  -- khimaira horn
                { rate = 1000, item = 2372 },  -- khimaira mane
                { rate = 1000, item = 2629 },  -- tygers tail
                { rate = 1000, group = {  -- one of
                    { 16155, 1 },  -- aurum armet
                    { 16157, 1 },  -- enkidus cap
                    { 11282, 1 },  -- aurum cuirass
                } },
                { rate = 150, group = {  -- one of
                    { 15015, 1 },  -- hachiryu kote
                    { 18948, 1 },  -- enforcer
                    { 18857, 1 },  -- antares
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Mahjlaef the Paintorn',
            ids    = { 400 },
            nm     = true,
            levels = {
                [83] = { acc = 362, eva = 326, agi = 71, int = 110, mnd = 91, chr = 73 },
                [84] = { acc = 370, eva = 331, agi = 72, int = 110, mnd = 91, chr = 75 },
                [85] = { acc = 376, eva = 337, agi = 74, int = 112, mnd = 93, chr = 76 },
            },
            ranks  = { fire = 2, ice = 4, wind = 2, earth = 2, thunder = 2, water = 10, light = 1, dark = 11,
                       paralyze = 4, bind = 4, silence = 2, slow = 2, poison = 10, light_sleep = 1, dark_sleep = 11,
                       blind = 11 },
            magic_dmg = { all = -25 },
            immune = { 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 2630 },  -- mahjlaefs staff
                { rate = 240, item = 19031 },  -- fire grip
                { rate = 240, item = 19035 },  -- thunder grip
                { rate = 1000, group = {  -- one of
                    { 16177, 1 },  -- legion scutum
                    { 15021, 1 },  -- aurum gauntlets
                    { 16342, 1 },  -- oracles braconi
                } },
                { rate = 100, group = {  -- one of
                    { 16177, 1 },  -- legion scutum
                    { 15021, 1 },  -- aurum gauntlets
                    { 16342, 1 },  -- oracles braconi
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
            links  = 16,
        },
        {
            name   = 'Experimental Lamia',
            ids    = { 401 },
            nm     = true,
            levels = {
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
                [83] = { acc = 366, eva = 336, agi = 91, int = 94, mnd = 80, chr = 80 },
                [84] = { acc = 373, eva = 341, agi = 93, int = 96, mnd = 81, chr = 81 },
            },
            ranks  = { fire = 1, wind = 1, earth = 1, water = 5, dark = 4, silence = 1, slow = 1, poison = 5,
                       dark_sleep = 4, blind = 4, gravity = 1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity' },
            drops  = {
                { rate = 1000, item = 2631 },  -- experimental lamias armband
                { rate = 240, item = 19032 },  -- water grip
                { rate = 240, item = 19036 },  -- earth grip
                { rate = 1000, group = {  -- one of
                    { 18595, 1 },  -- mekki shakki
                    { 16341, 1 },  -- aurum cuisses
                    { 11378, 1 },  -- enkidus leggings
                } },
                { rate = 100, group = {  -- one of
                    { 18595, 1 },  -- mekki shakki
                    { 16341, 1 },  -- aurum cuisses
                    { 11378, 1 },  -- enkidus leggings
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 17,
        },
        {
            name   = 'Merrow Shadowdancer',
            ids    = { 402 },
            levels = {
                [73] = { acc = 305, eva = 276, agi = 64, int = 84, mnd = 84, chr = 78 },
                [74] = { acc = 310, eva = 280, agi = 64, int = 85, mnd = 85, chr = 78 },
                [75] = { acc = 315, eva = 285, agi = 65, int = 86, mnd = 86, chr = 79 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 18,
        },
        {
            name   = 'Merrow Typhoondancer',
            ids    = { 403, 404 },
            levels = {
                [73] = { acc = 308, eva = 294, agi = 70, int = 72, mnd = 72, chr = 78 },
                [74] = { acc = 313, eva = 299, agi = 70, int = 72, mnd = 72, chr = 78 },
                [75] = { acc = 319, eva = 304, agi = 70, int = 74, mnd = 74, chr = 79 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Brekekekex',
            ids    = { 405, 414, 423 },
            nm     = true,
            levels = {
                [95] = { acc = 442, eva = 384, agi = 113, int = 130, mnd = 77, chr = 93 },
                [96] = { acc = 450, eva = 390, agi = 115, int = 130, mnd = 77, chr = 96 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Chorus Toad',
            ids    = { 406, 407, 408, 409, 410, 411, 415, 416, 417, 418, 419, 420, 424, 425, 426, 427, 428, 429 },
            nm     = true,
            levels = {
                [95] = { acc = 442, eva = 414, agi = 113, int = 89, mnd = 68, chr = 87 },
                [96] = { acc = 450, eva = 419, agi = 115, int = 89, mnd = 68, chr = 88 },
            },
            ranks  = { ice = 2, earth = 1, thunder = -1, water = 8, light = 6, paralyze = 2, bind = 2, slow = 1,
                       poison = 8, light_sleep = 6, stun = -1 },
            resist = { virus = 25 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Shedu',
            ids    = { 433 },
            nm     = true,
            levels = {
                [99] = { acc = 483, eva = 502, agi = 112, int = 93, mnd = 77, chr = 80 },
            },
            ranks  = { fire = 8, ice = 5, wind = 8, earth = 7, thunder = 9, water = 5, light = 7, dark = 5,
                       paralyze = 7, bind = 7, silence = 7, slow = 7, poison = 7, light_sleep = 7, dark_sleep = 7,
                       blind = 7, stun = 9, gravity = 8 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Awoken Vampyr Jarl',
            ids    = { 435 },
            nm     = true,
            levels = {
                [119] = { acc = 487, eva = 529, agi = 113, int = 123, mnd = 78, chr = 69 },
            },
            ranks  = { fire = 1, ice = 4, wind = 3, earth = 3, thunder = 1, water = 1, light = -1, dark = 11,
                       paralyze = 4, bind = 4, silence = 3, slow = 3, poison = 1, light_sleep = -1, dark_sleep = 11,
                       blind = 11, stun = 1, gravity = 3 },
            magic_dmg = { all = -25 },
            undead = true,
        },
        {
            name   = 'Arisen Soulflayer',
            ids    = { 436 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 588, agi = 124, int = 185, mnd = 140, chr = 120 },
            },
            ranks  = { ice = 2, water = 9, light = -1, dark = 11, paralyze = 2, bind = 2, poison = 9,
                       light_sleep = -1, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
            links  = 19,
        },
        {
            name   = 'Descended Winebibber',
            ids    = { 437, 438, 439 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 588, agi = 124, int = 185, mnd = 140, chr = 120 },
            },
            ranks  = { ice = 2, water = 9, light = -1, dark = 11, paralyze = 2, bind = 2, poison = 9,
                       light_sleep = -1, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
            links  = 20,
        },
        {
            name   = 'Gloom Phantom',
            ids    = { 441 },
            nm     = true,
            levels = {
                [139] = { acc = 501, eva = 640, agi = 143, int = 116, mnd = 101, chr = 109 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 25, virus = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Magh Bihu',
            ids    = { 442 },
            nm     = true,
            levels = {
                [139] = { acc = 503, eva = 635, agi = 105, int = 94, mnd = 127, chr = 117 },
            },
            ranks  = { earth = 3, water = 3, dark = 3, slow = 3, poison = 3, dark_sleep = 3, blind = 3 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Dazbog',
            ids    = { 443 },
            nm     = true,
            levels = {
                [139] = { acc = 490, eva = 623, agi = 109, int = 94, mnd = 154, chr = 139 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = 3, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -1, slow = 3, poison = -1, light_sleep = -1, gravity = -1 },
            resist = { sleep = 25 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
