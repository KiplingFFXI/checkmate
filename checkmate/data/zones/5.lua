-- Uleguerand Range (zone 5).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Uleguerand Tiger' } },
        [2] = { sound = { 'Esbat', 'Nightmare Bats', 'Succubus Bats' } },
        [3] = { sound = { 'Glacier Eater', 'Mountain Worm', 'Mountain Worm NM' } },
        [4] = {
            sight = { 'Dread Demon', 'Gore Demon', 'Judicator Demon', 'Kindred Black Mage', 'Kindred Dark Knight',
                      'Kindred Summoner', 'Kindred Warrior', 'Stygian Demon' },
            true_sight = { 'Brontotaur', 'Molech', 'Tyrannotaur' },
        },
        [5] = { sound = { 'Glacier Eater', 'Mountain Worm' } },
        [6] = { true_both = { 'Isarukitsck', 'Little Wingman' } },
    },
    monsters = {
        {
            name   = 'Variable Hare',
            ids    = { 1, 2, 3, 8, 9, 10, 15, 16, 17, 31, 32, 33, 34, 35, 36, 37, 39, 48, 49, 50, 339, 343, 348,
                       349, 362, 363, 364, 365, 366, 367, 368, 369, 371, 372 },
            levels = {
                [58] = { acc = 225, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 231, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 4382 },  -- frost turnip
            },
        },
        {
            name   = 'Uleguerand Tiger',
            ids    = { 4, 5, 6, 11, 12, 13, 18, 19, 20, 340, 341, 344, 345, 346 },
            levels = {
                [61] = { acc = 242, eva = 227, agi = 66, int = 42, mnd = 49, chr = 55 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 42, mnd = 49, chr = 55 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 42, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
                { rate = 50, item = 1725 },  -- snow lily
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Cwn Annwn',
            ids    = { 7, 14, 21, 30, 342, 347, 361 },
            levels = {
                [59] = { acc = 229, eva = 216, agi = 63, int = 47, mnd = 44, chr = 57 },
                [60] = { acc = 234, eva = 221, agi = 63, int = 47, mnd = 44, chr = 57 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 49, mnd = 46, chr = 59 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 46, chr = 59 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 46, chr = 59 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 46, chr = 60 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 50, item = 858 },  -- wolf hide
                { rate = 100, item = 1725 },  -- snow lily
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Snoll',
            ids    = { 22, 23, 24, 25, 38, 41, 43, 44, 45, 46, 351, 352, 353, 373, 374 },
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 44, mnd = 47, chr = 57 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 46, mnd = 49, chr = 59 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 46, mnd = 49, chr = 59 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 46, mnd = 49, chr = 59 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Buffalo',
            ids    = { 26, 27, 28, 29, 354, 355, 356, 357, 358, 359 },
            levels = {
                [62] = { acc = 239, eva = 221, agi = 45, int = 45, mnd = 66, chr = 66 },
                [63] = { acc = 244, eva = 226, agi = 45, int = 45, mnd = 66, chr = 66 },
                [64] = { acc = 250, eva = 232, agi = 46, int = 46, mnd = 68, chr = 68 },
                [65] = { acc = 256, eva = 237, agi = 46, int = 46, mnd = 68, chr = 68 },
            },
            ph_for = { [359] = { 360 } },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 5152 },  -- slice of buffalo meat
                { rate = 10, item = 1628 },  -- buffalo hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 40, 47, 82, 115, 154, 158, 199, 201, 224, 279, 280, 281, 286, 296, 299, 350, 370 },
            levels = {
                [64] = { acc = 255, eva = 233, agi = 64, int = 75, mnd = 60, chr = 62 },
                [65] = { acc = 260, eva = 238, agi = 65, int = 76, mnd = 61, chr = 62 },
                [66] = { acc = 265, eva = 244, agi = 66, int = 77, mnd = 62, chr = 62 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [71] = { acc = 292, eva = 269, agi = 71, int = 83, mnd = 67, chr = 67 },
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
                [77] = { acc = 324, eva = 299, agi = 75, int = 89, mnd = 71, chr = 72 },
                [82] = { acc = 354, eva = 326, agi = 80, int = 94, mnd = 76, chr = 77 },
                [83] = { acc = 360, eva = 331, agi = 80, int = 95, mnd = 76, chr = 77 },
                [84] = { acc = 367, eva = 336, agi = 82, int = 96, mnd = 77, chr = 80 },
            },
            spawn_levels = { [40] = { 64, 65 }, [47] = { 64, 65 }, [82] = { 71, 72 }, [115] = { 71, 72 },
                             [154] = { 76, 77 }, [158] = { 76, 77 }, [199] = { 82, 84 }, [201] = { 82, 84 },
                             [224] = { 82, 84 }, [279] = { 82, 84 }, [280] = { 82, 84 }, [281] = { 82, 84 },
                             [286] = { 82, 84 }, [296] = { 82, 84 }, [299] = { 82, 84 }, [350] = { 66, 68 },
                             [370] = { 66, 68 } },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Esbat',
            ids    = { 51, 54, 375, 377, 379 },
            levels = {
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 229, agi = 70, int = 49, mnd = 49, chr = 55 },
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
            name   = 'Glacier Eater',
            ids    = { 52, 53, 55, 56, 376, 378, 380, 381 },
            levels = {
                [58] = { acc = 222, eva = 202, agi = 58, int = 72, mnd = 55, chr = 53 },
                [59] = { acc = 228, eva = 208, agi = 60, int = 74, mnd = 56, chr = 54 },
                [60] = { acc = 233, eva = 213, agi = 60, int = 74, mnd = 56, chr = 54 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 77, mnd = 59, chr = 57 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 77, mnd = 59, chr = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 1885 },  -- chunk of zincite
                { rate = 150, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            links  = 3,
        },
        {
            name   = 'Nival Raptor',
            ids    = { 57, 58, 61, 62, 63, 67, 68, 69, 70, 71, 83, 84, 85, 86, 89, 90, 91, 92, 93, 101, 102, 104,
                       107 },
            levels = {
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
            },
            ranks  = { fire = -3, earth = -2, thunder = -2, water = -2, light = -2, dark = -2, slow = -2,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Polar Hare',
            ids    = { 59, 60, 64, 65, 66, 72, 73, 75, 76, 77, 78, 79, 80, 87, 88 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 50, item = 4382 },  -- frost turnip
            },
        },
        {
            name   = 'Morozko',
            ids    = { 81, 110, 111, 112, 124, 127 },
            levels = {
                [67] = { acc = 273, eva = 258, agi = 71, int = 49, mnd = 53, chr = 63 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 50, mnd = 53, chr = 64 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 51, mnd = 54, chr = 65 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 51, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Giant Buffalo',
            ids    = { 94, 95, 96, 97, 98, 99, 100 },
            levels = {
                [68] = { acc = 271, eva = 252, agi = 48, int = 48, mnd = 71, chr = 71 },
                [69] = { acc = 276, eva = 257, agi = 48, int = 48, mnd = 72, chr = 72 },
                [70] = { acc = 281, eva = 262, agi = 49, int = 49, mnd = 73, chr = 73 },
                [71] = { acc = 287, eva = 267, agi = 51, int = 51, mnd = 75, chr = 75 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 5152 },  -- slice of buffalo meat
                { rate = 50, item = 1628 },  -- buffalo hide
                { rate = 10, item = 1615 },  -- buffalo horn
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Brontotaur',
            ids    = { 103, 105, 106, 108, 109 },
            levels = {
                [68] = { acc = 281, eva = 260, agi = 50, int = 45, mnd = 69, chr = 64 },
                [69] = { acc = 287, eva = 265, agi = 51, int = 45, mnd = 70, chr = 65 },
                [70] = { acc = 292, eva = 270, agi = 51, int = 45, mnd = 71, chr = 65 },
                [71] = { acc = 298, eva = 275, agi = 52, int = 48, mnd = 72, chr = 68 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1620 },  -- taurus horn
                { rate = 50, item = 1621 },  -- taurus wing
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Snow Maiden',
            ids    = { 113 },
            nm     = true,
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 52, mnd = 55, chr = 68 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 240, item = 17306 },  -- snoll arm
                { rate = 150, item = 15507 },  -- purgatory collar
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Father Frost',
            ids    = { 114 },
            nm     = true,
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 55, mnd = 58, chr = 70 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 240, item = 17306 },  -- snoll arm
                { rate = 150, item = 15507 },  -- purgatory collar
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Phasma',
            ids    = { 116 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 67, mnd = 51, chr = 65 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 67, mnd = 52, chr = 66 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 69, mnd = 53, chr = 67 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 69, mnd = 53, chr = 67 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 71, mnd = 55, chr = 69 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 71, mnd = 55, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 4788 },  -- scroll of blizzaga ii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Succubus Bats',
            ids    = { 117, 118, 119, 120, 123, 126 },
            levels = {
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
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
            name   = 'Doom Soldier',
            ids    = { 121, 122, 125 },
            levels = {
                [66] = { acc = 269, eva = 249, agi = 62, int = 70, mnd = 44, chr = 47 },
                [67] = { acc = 273, eva = 255, agi = 65, int = 71, mnd = 44, chr = 48 },
                [68] = { acc = 278, eva = 260, agi = 65, int = 71, mnd = 45, chr = 48 },
                [69] = { acc = 284, eva = 265, agi = 65, int = 72, mnd = 45, chr = 48 },
                [70] = { acc = 289, eva = 271, agi = 67, int = 73, mnd = 45, chr = 49 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fachan',
            ids    = { 128, 129, 130, 131, 132, 133, 134 },
            levels = {
                [73] = { acc = 306, eva = 290, agi = 76, int = 72, mnd = 56, chr = 66 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 73, mnd = 56, chr = 66 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 74, mnd = 57, chr = 67 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 50, item = 935 },  -- ahriman wing
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Dread Demon UR',
            ids    = { 135, 140 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 85, mnd = 55, chr = 73 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 86, mnd = 55, chr = 75 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 87, mnd = 56, chr = 75 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 50, item = 4754 },  -- scroll of fire iii
                { rate = 50, item = 4783 },  -- scroll of firaga ii
                { rate = 10, item = 4784 },  -- scroll of firaga iii
                { rate = 10, item = 4755 },  -- scroll of fire iv
                { rate = 5, item = 4812 },  -- scroll of flare
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Judicator Demon UR',
            ids    = { 136, 143 },
            levels = {
                [75] = { acc = 317, eva = 297, agi = 70, int = 82, mnd = 44, chr = 57 },
                [76] = { acc = 323, eva = 302, agi = 72, int = 85, mnd = 45, chr = 59 },
                [77] = { acc = 328, eva = 307, agi = 72, int = 85, mnd = 46, chr = 59 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 50, item = 4875 },  -- scroll of absorb-dex
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Tyrannotaur',
            ids    = { 137, 138, 141, 142, 146, 147, 151, 152 },
            levels = {
                [72] = { acc = 303, eva = 280, agi = 52, int = 48, mnd = 72, chr = 68 },
                [73] = { acc = 309, eva = 286, agi = 54, int = 48, mnd = 74, chr = 68 },
                [74] = { acc = 314, eva = 291, agi = 54, int = 48, mnd = 75, chr = 69 },
                [75] = { acc = 320, eva = 296, agi = 55, int = 49, mnd = 75, chr = 70 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1620 },  -- taurus horn
                { rate = 50, item = 1621 },  -- taurus wing
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Gore Demon UR',
            ids    = { 139, 148 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 63, mnd = 50, chr = 70 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 64, mnd = 50, chr = 71 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 65, mnd = 52, chr = 71 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Stygian Demon UR',
            ids    = { 144, 149 },
            levels = {
                [75] = { acc = 311, eva = 273, agi = 70, int = 88, mnd = 75, chr = 88 },
                [76] = { acc = 316, eva = 279, agi = 72, int = 89, mnd = 75, chr = 89 },
                [77] = { acc = 321, eva = 283, agi = 72, int = 91, mnd = 78, chr = 91 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 50, item = 4897 },  -- ice spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Demons Elemental',
            ids    = { 145, 150, 181, 188, 196, 222, 230, 238, 248, 264, 269 },
            levels = {
                [66] = { acc = 267, eva = 250, agi = 65, int = 64, mnd = 49, chr = 51 },
                [72] = { acc = 298, eva = 282, agi = 70, int = 68, mnd = 52, chr = 55 },
                [73] = { acc = 304, eva = 288, agi = 72, int = 70, mnd = 54, chr = 56 },
                [74] = { acc = 309, eva = 293, agi = 72, int = 71, mnd = 54, chr = 56 },
            },
            spawn_levels = { [145] = { 72, 74 }, [150] = { 66, 66 }, [181] = { 72, 74 }, [188] = { 72, 74 },
                             [196] = { 72, 74 }, [222] = { 72, 74 }, [230] = { 72, 74 }, [238] = { 72, 74 },
                             [248] = { 72, 74 }, [264] = { 72, 74 }, [269] = { 72, 74 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Akselloak',
            ids    = { 153, 155, 156, 157 },
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 52, mnd = 55, chr = 68 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 52, mnd = 55, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 54, mnd = 58, chr = 68 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 54, mnd = 58, chr = 69 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Srei Ap',
            ids    = { 159, 160, 161 },
            levels = {
                [71] = { acc = 293, eva = 279, agi = 75, int = 71, mnd = 55, chr = 69 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 71, mnd = 55, chr = 69 },
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
                { rate = 50, item = 1844 },  -- square of spectral goldenrod
                { rate = 50, item = 4788 },  -- scroll of blizzaga ii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Nightmare Bats',
            ids    = { 162, 168, 170, 172, 173, 174, 202, 204, 207, 209, 302, 304, 316, 318, 319, 331, 332 },
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
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
            links  = 2,
        },
        {
            name   = 'Doom Mage',
            ids    = { 163, 164, 165, 166, 167, 169, 171, 203, 205, 206, 208, 210, 211, 212, 213, 214, 215 },
            levels = {
                [74] = { acc = 312, eva = 272, agi = 77, int = 89, mnd = 60, chr = 70 },
                [75] = { acc = 317, eva = 276, agi = 77, int = 91, mnd = 62, chr = 70 },
                [76] = { acc = 323, eva = 283, agi = 80, int = 92, mnd = 62, chr = 72 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Smolenkos',
            ids    = { 175, 176, 183, 191, 216, 217, 225, 234, 241 },
            levels = {
                [80] = { acc = 344, eva = 327, agi = 82, int = 78, mnd = 60, chr = 71 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 80, mnd = 62, chr = 73 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 80, mnd = 62, chr = 73 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 50, item = 935 },  -- ahriman wing
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Kindred Warrior UR',
            ids    = { 177, 184, 192, 218, 226, 235, 242, 246, 260, 265 },
            levels = {
                [81] = { acc = 352, eva = 332, agi = 85, int = 69, mnd = 55, chr = 76 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 69, mnd = 55, chr = 76 },
                [83] = { acc = 364, eva = 342, agi = 85, int = 69, mnd = 55, chr = 76 },
                [84] = { acc = 371, eva = 348, agi = 87, int = 70, mnd = 55, chr = 77 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Kindred Black Mage UR',
            ids    = { 178, 185, 193, 219, 227, 243, 261, 266 },
            levels = {
                [81] = { acc = 352, eva = 307, agi = 85, int = 103, mnd = 62, chr = 82 },
                [82] = { acc = 358, eva = 312, agi = 85, int = 103, mnd = 62, chr = 82 },
                [83] = { acc = 364, eva = 316, agi = 85, int = 105, mnd = 62, chr = 82 },
                [84] = { acc = 371, eva = 322, agi = 87, int = 106, mnd = 62, chr = 85 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 4783 },  -- scroll of firaga ii
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Kindred Dark Knight UR',
            ids    = { 179, 186, 194, 220, 228, 236, 244, 262, 267 },
            levels = {
                [81] = { acc = 352, eva = 328, agi = 77, int = 90, mnd = 49, chr = 63 },
                [82] = { acc = 358, eva = 333, agi = 77, int = 90, mnd = 49, chr = 63 },
                [83] = { acc = 364, eva = 338, agi = 77, int = 90, mnd = 49, chr = 63 },
                [84] = { acc = 371, eva = 345, agi = 80, int = 92, mnd = 49, chr = 64 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Kindred Summoner UR',
            ids    = { 180, 187, 195, 221, 229, 237, 247, 263, 268 },
            levels = {
                [81] = { acc = 345, eva = 303, agi = 77, int = 96, mnd = 82, chr = 96 },
                [82] = { acc = 351, eva = 308, agi = 77, int = 96, mnd = 82, chr = 96 },
                [83] = { acc = 357, eva = 312, agi = 77, int = 96, mnd = 82, chr = 96 },
                [84] = { acc = 363, eva = 319, agi = 80, int = 98, mnd = 83, chr = 98 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 886 },  -- demon skull
                { rate = 10, item = 4903 },  -- dark spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Molech',
            ids    = { 182, 189, 190, 197, 223, 231, 233, 239, 240, 245, 270, 271 },
            levels = {
                [79] = { acc = 342, eva = 317, agi = 57, int = 51, mnd = 80, chr = 74 },
                [80] = { acc = 347, eva = 322, agi = 57, int = 51, mnd = 80, chr = 74 },
                [81] = { acc = 355, eva = 328, agi = 60, int = 54, mnd = 82, chr = 76 },
                [82] = { acc = 361, eva = 333, agi = 60, int = 54, mnd = 82, chr = 76 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1620 },  -- taurus horn
                { rate = 50, item = 1621 },  -- taurus wing
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Agloolik',
            ids    = { 198, 200, 232, 274, 275, 276, 277, 278, 287, 288, 289, 290, 291, 292, 293, 294, 297, 300,
                       301 },
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 56, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 57, mnd = 60, chr = 73 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 57, mnd = 61, chr = 74 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 57, mnd = 61, chr = 74 },
            },
            ranks  = { fire = -1, ice = 3, wind = 1, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = 3, bind = 3, silence = 1, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 1 },
            drops  = {
                { rate = 150, item = 17306 },  -- snoll arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Jormungand',
            ids    = { 273 },
            nm     = true,
            levels = {
                [95] = { acc = 498, eva = 460, agi = 101, int = 119, mnd = 60, chr = 83 },
            },
            ranks  = { fire = -2, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -50 },
            immune = { 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 1000, item = 647 },  -- chunk of molybdenum ore
                { rate = 150, item = 17586 },  -- mercurial pole
                { rate = 240, group = {  -- one of
                    { 903, 4500 },  -- dragon talon
                    { 1133, 4500 },  -- vial of dragon blood
                    { 4272, 1000 },  -- slice of dragon meat
                } },
                { rate = 240, group = { { 1816, 7500 }, { 4486, 2500 } } },  -- one of wyrm horn, dragon heart
                { rate = 240, group = {  -- one of
                    { 655, 1 },  -- adaman ingot
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
            name   = 'King Buffalo',
            ids    = { 282, 283, 284, 285, 295, 298 },
            levels = {
                [79] = { acc = 330, eva = 308, agi = 55, int = 55, mnd = 82, chr = 82 },
                [80] = { acc = 335, eva = 313, agi = 55, int = 55, mnd = 82, chr = 82 },
                [81] = { acc = 342, eva = 319, agi = 58, int = 58, mnd = 85, chr = 85 },
                [82] = { acc = 348, eva = 324, agi = 58, int = 58, mnd = 85, chr = 85 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 5152 },  -- slice of buffalo meat
                { rate = 50, item = 1628 },  -- buffalo hide
                { rate = 10, item = 1615 },  -- buffalo horn
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Mountain Worm',
            ids    = { 303, 305, 307, 308, 309, 310, 311, 313, 315, 320, 322, 324, 326, 327, 329, 333, 334 },
            levels = {
                [66] = { acc = 265, eva = 244, agi = 66, int = 82, mnd = 62, chr = 59 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 83, mnd = 63, chr = 61 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 83, mnd = 64, chr = 62 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 85, mnd = 64, chr = 62 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 85, mnd = 65, chr = 63 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 1885 },  -- chunk of zincite
                { rate = 100, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            links  = 3,
        },
        {
            name   = 'Mindgazer',
            ids    = { 306, 312, 314, 317, 321, 323, 325, 328, 330, 336, 337, 338 },
            levels = {
                [69] = { acc = 282, eva = 257, agi = 72, int = 89, mnd = 60, chr = 65 },
                [70] = { acc = 287, eva = 262, agi = 73, int = 89, mnd = 61, chr = 67 },
                [71] = { acc = 293, eva = 267, agi = 75, int = 92, mnd = 63, chr = 67 },
                [72] = { acc = 298, eva = 272, agi = 75, int = 92, mnd = 63, chr = 67 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 150, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mountain Worm NM',
            ids    = { 335 },
            nm     = true,
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 88, mnd = 67, chr = 64 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 89, mnd = 68, chr = 66 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 90, mnd = 68, chr = 66 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 100, item = 14886 },  -- heavy gauntlets
                { rate = 150, item = 1885 },  -- chunk of zincite
            },
            links  = 5,
        },
        {
            name   = 'Bonnacon',
            ids    = { 360 },
            nm     = true,
            levels = {
                [69] = { acc = 276, eva = 257, agi = 48, int = 48, mnd = 72, chr = 72 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 5152 },  -- slice of buffalo meat
                { rate = 150, item = 1628 },  -- buffalo hide
                { rate = 100, item = 18052 },  -- tredecim scythe
                { rate = 100, item = 15323 },  -- cure clogs
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Geush Urvan',
            ids    = { 382 },
            nm     = true,
            levels = {
                [85] = { acc = 375, eva = 358, agi = 80, int = 88, mnd = 76, chr = 78 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'paralyze', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 15465 },  -- toreadors cape
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'White Coney',
            ids    = { 383 },
            nm     = true,
            levels = {
                [70] = { acc = 289, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 296, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
            },
            ranks  = { fire = -2, ice = 4, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = 4, bind = 4, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 17212 },  -- selenes bow
                { rate = 50, item = 4382 },  -- frost turnip
            },
        },
        {
            name   = 'Black Coney',
            ids    = { 384 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 338, agi = 75, int = 61, mnd = 53, chr = 57 },
                [71] = { acc = 298, eva = 344, agi = 76, int = 62, mnd = 54, chr = 59 },
                [72] = { acc = 303, eva = 349, agi = 76, int = 62, mnd = 54, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = 4, bind = 4, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 17212 },  -- selenes bow
                { rate = 50, item = 4382 },  -- frost turnip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Isarukitsck',
            ids    = { 385, 389, 393 },
            nm     = true,
            levels = {},
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
        },
        {
            name   = 'Little Wingman',
            ids    = { 386, 387, 388, 390, 391, 392, 394, 395, 396 },
            nm     = true,
            levels = {},
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
        },
        {
            name   = 'Camahueto',
            ids    = { 397, 398, 399 },
            nm     = true,
            levels = {},
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
