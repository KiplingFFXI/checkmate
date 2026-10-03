-- RoMaeve (zone 122).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Apocalyptic Weapon', 'Douma Weapon', 'Infernal Weapon', 'Katashiro Weapon', 'Killing Weapon',
                'Ominous Weapon' },
        [2] = { 'Mimic Jester', 'Mimic King', 'Mimic Mage' },
    },
    monsters = {
        {
            name   = 'Mokkurkalfi',
            ids    = { 1, 2 },
            nm     = true,
            levels = {
                [68] = { acc = 278, eva = 262, agi = 68, int = 57, mnd = 57, chr = 64 },
                [69] = { acc = 284, eva = 267, agi = 69, int = 59, mnd = 59, chr = 65 },
                [70] = { acc = 289, eva = 272, agi = 69, int = 59, mnd = 59, chr = 65 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify' },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Killing Weapon',
            ids    = { 3, 4, 6, 9, 12, 13, 25, 26, 27, 30, 32, 34, 36, 39, 41, 43, 45, 48, 55, 58, 65 },
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 58, mnd = 47, chr = 60 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 60, mnd = 49, chr = 62 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 60, mnd = 49, chr = 62 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 61, mnd = 49, chr = 62 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 61, mnd = 50, chr = 63 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Ominous Weapon',
            ids    = { 5, 7, 10, 14, 15, 16, 18, 20, 21, 28, 37, 46, 50, 52, 56, 60, 62, 66, 67 },
            levels = {
                [61] = { acc = 239, eva = 214, agi = 55, int = 77, mnd = 66, chr = 67 },
                [62] = { acc = 244, eva = 219, agi = 55, int = 77, mnd = 66, chr = 67 },
                [63] = { acc = 249, eva = 224, agi = 55, int = 78, mnd = 66, chr = 67 },
                [64] = { acc = 255, eva = 229, agi = 56, int = 79, mnd = 68, chr = 69 },
                [65] = { acc = 260, eva = 235, agi = 58, int = 80, mnd = 68, chr = 69 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Cursed Puppet',
            ids    = { 8, 11, 17, 19, 22, 23, 29, 31, 38, 40, 47, 57, 68, 72, 74, 78, 82, 86, 89, 91, 99, 102, 106,
                       107, 108, 109, 110, 111 },
            levels = {
                [65] = { acc = 263, eva = 246, agi = 65, int = 52, mnd = 52, chr = 62 },
                [66] = { acc = 269, eva = 251, agi = 67, int = 52, mnd = 52, chr = 63 },
                [67] = { acc = 273, eva = 256, agi = 67, int = 53, mnd = 53, chr = 63 },
                [68] = { acc = 278, eva = 262, agi = 68, int = 53, mnd = 53, chr = 64 },
                [69] = { acc = 284, eva = 267, agi = 69, int = 54, mnd = 54, chr = 65 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 150, item = 1408 },  -- bottle of illuminink
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1165 },  -- doll shard
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Cannonball',
            ids    = { 24, 69, 112, 113 },
            levels = {
                [66] = { acc = 269, eva = 253, agi = 70, int = 49, mnd = 52, chr = 63 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 49, mnd = 53, chr = 63 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 50, mnd = 53, chr = 64 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 51, mnd = 54, chr = 65 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 51, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 33, 79 },
            levels = {
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
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
            name   = 'Magic Flagon',
            ids    = { 35, 44, 49, 51, 53, 59, 61, 63, 122, 123, 124, 125, 126, 127, 128, 129, 143, 144, 145, 146,
                       147, 148, 149, 150, 164, 165, 166, 167, 168, 169, 170, 171, 185, 186, 187, 188, 189, 190,
                       191, 192 },
            levels = {
                [64] = { acc = 256, eva = 237, agi = 56, int = 69, mnd = 66, chr = 64 },
                [65] = { acc = 261, eva = 243, agi = 58, int = 70, mnd = 67, chr = 65 },
                [66] = { acc = 267, eva = 247, agi = 59, int = 72, mnd = 69, chr = 66 },
                [67] = { acc = 271, eva = 252, agi = 59, int = 72, mnd = 69, chr = 67 },
                [68] = { acc = 276, eva = 258, agi = 61, int = 73, mnd = 69, chr = 67 },
                [69] = { acc = 282, eva = 263, agi = 61, int = 74, mnd = 71, chr = 68 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 1408 },  -- bottle of illuminink
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 100, item = 1430 },  -- red mages testimony
                { rate = 50, group = {  -- one of
                    { 4774, 3500 },  -- scroll of thunder iii
                    { 4659, 2000 },  -- scroll of shell iv
                    { 4804, 2000 },  -- scroll of thundaga iii
                    { 4775, 1500 },  -- scroll of thunder iv
                    { 4820, 1000 },  -- scroll of burst
                } },
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 42, 96 },
            levels = {
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
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
            name   = 'Nightmare Vase',
            ids    = { 54, 64 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 268, agi = 61, int = 75, mnd = 71, chr = 69 },
                [71] = { acc = 293, eva = 274, agi = 64, int = 76, mnd = 73, chr = 71 },
                [72] = { acc = 298, eva = 279, agi = 64, int = 76, mnd = 73, chr = 71 },
                [73] = { acc = 304, eva = 284, agi = 64, int = 78, mnd = 74, chr = 72 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 10, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 954 },  -- magic pot shard
                { rate = 1000, item = 954 },  -- magic pot shard
                { rate = 1000, item = 914 },  -- vial of mercury
                { rate = 150, item = 942 },  -- philosophers stone
                { rate = 1000, item = 954 },  -- magic pot shard
                { rate = 1000, item = 954 },  -- magic pot shard
                { rate = 1000, item = 914 },  -- vial of mercury
                { rate = 50, item = 16913 },  -- shinogi
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Apocalyptic Weapon',
            ids    = { 70, 73, 75, 77, 80, 84, 87, 90, 92, 94, 97, 100, 114, 115, 117, 119, 130, 133, 136, 138, 140,
                       152, 155, 157, 159, 161, 172, 176, 178, 180, 182, 193, 196 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 74, mnd = 60, chr = 77 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 75, mnd = 61, chr = 78 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 75, mnd = 61, chr = 78 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Infernal Weapon',
            ids    = { 71, 76, 81, 85, 88, 93, 95, 98, 101, 116, 118, 120, 121, 131, 135, 137, 139, 141, 142, 153,
                       158, 160, 162, 163, 173, 179, 181, 183, 184, 194 },
            levels = {
                [79] = { acc = 336, eva = 306, agi = 69, int = 96, mnd = 82, chr = 84 },
                [80] = { acc = 341, eva = 311, agi = 69, int = 96, mnd = 82, chr = 84 },
                [81] = { acc = 348, eva = 316, agi = 71, int = 99, mnd = 85, chr = 86 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Mythril Golem',
            ids    = { 103, 104, 105 },
            levels = {
                [68] = { acc = 278, eva = 262, agi = 68, int = 57, mnd = 57, chr = 64 },
                [69] = { acc = 284, eva = 267, agi = 69, int = 59, mnd = 59, chr = 65 },
                [70] = { acc = 289, eva = 272, agi = 69, int = 59, mnd = 59, chr = 65 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 50, item = 955 },  -- golem shard
                { rate = 50, item = 644 },  -- chunk of mythril ore
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Darksteel Golem',
            ids    = { 132, 134, 154, 156, 174, 177, 195, 197 },
            levels = {
                [80] = { acc = 344, eva = 325, agi = 78, int = 66, mnd = 66, chr = 74 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 69, mnd = 69, chr = 76 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 69, mnd = 69, chr = 76 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 50, item = 955 },  -- golem shard
                { rate = 50, item = 644 },  -- chunk of mythril ore
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Eldhrimnir',
            ids    = { 198 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 320, agi = 69, int = 84, mnd = 80, chr = 78 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 10, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Shikigami Weapon',
            ids    = { 199 },
            nm     = true,
            levels = {
                [77] = { acc = 326, eva = 306, agi = 71, int = 87, mnd = 73, chr = 79 },
                [78] = { acc = 331, eva = 312, agi = 72, int = 87, mnd = 73, chr = 80 },
                [79] = { acc = 337, eva = 317, agi = 73, int = 89, mnd = 75, chr = 82 },
                [80] = { acc = 342, eva = 322, agi = 73, int = 89, mnd = 75, chr = 82 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            immune = { 'silence' },
            drops  = {
                { rate = 240, item = 14468 },  -- yinyang robe
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Jackpot',
            ids    = { 200 },
            levels = {
                [1] = { acc = 10, eva = 8, agi = 8, int = 11, mnd = 9, chr = 8 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Mimic King',
            ids    = { 210, 213, 216 },
            nm     = true,
            levels = {
                [93] = { acc = 432, eva = 400, agi = 105, int = 82, mnd = 82, chr = 70 },
                [94] = { acc = 440, eva = 406, agi = 106, int = 82, mnd = 82, chr = 70 },
                [95] = { acc = 447, eva = 411, agi = 107, int = 83, mnd = 83, chr = 71 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 2,
        },
        {
            name   = 'Mimic Jester',
            ids    = { 211, 214, 217 },
            nm     = true,
            levels = {
                [90] = { acc = 409, eva = 385, agi = 102, int = 80, mnd = 80, chr = 67 },
                [91] = { acc = 418, eva = 390, agi = 104, int = 80, mnd = 80, chr = 69 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 2,
        },
        {
            name   = 'Mimic Mage',
            ids    = { 212, 215, 218 },
            nm     = true,
            levels = {
                [90] = { acc = 409, eva = 357, agi = 102, int = 117, mnd = 87, chr = 75 },
                [91] = { acc = 418, eva = 362, agi = 104, int = 119, mnd = 89, chr = 75 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 2,
        },
        {
            name   = 'Douma Weapon',
            ids    = { 219, 226, 233 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Katashiro Weapon',
            ids    = { 220, 221, 222, 223, 224, 225, 227, 228, 229, 230, 231, 232, 234, 235, 236, 237, 238, 239 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
    },
    by_name = {},
}
