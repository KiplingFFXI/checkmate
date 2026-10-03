-- RuAun Gardens (zone 130).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Aellos Handmaiden' },
    },
    monsters = {
        {
            name   = 'Sprinkler',
            ids    = { 1, 2, 3, 5, 7, 11, 12, 13, 14, 15, 16, 17, 18, 20, 22, 27, 28, 29, 30, 31, 32, 33, 34, 36,
                       38, 54, 55, 56, 65, 66, 67, 68, 69, 70, 71, 72, 76, 77, 79, 90, 95, 96, 98, 108, 112, 113,
                       114, 115, 116, 120, 121, 122, 133, 139, 140, 142, 153, 156, 157, 158, 159, 160, 161, 164,
                       165, 167, 178, 181, 182, 184, 195, 198, 199, 200, 201, 202, 206, 207, 208, 219, 225, 226,
                       228, 239 },
            levels = {
                [73] = { acc = 304, eva = 284, agi = 64, int = 78, mnd = 74, chr = 72 },
                [74] = { acc = 309, eva = 289, agi = 64, int = 79, mnd = 76, chr = 73 },
                [75] = { acc = 314, eva = 295, agi = 66, int = 80, mnd = 76, chr = 73 },
                [76] = { acc = 321, eva = 299, agi = 67, int = 81, mnd = 78, chr = 75 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 100, item = 1430 },  -- red mages testimony
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1058 },  -- ruaun coffer key
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
            name   = 'Flamingo',
            ids    = { 4, 6, 8, 9, 10, 24, 25, 26, 48, 49, 50, 51, 59, 60, 61, 62, 82, 83, 85, 86, 88, 89, 100, 101,
                       103, 104, 106, 107, 124, 125, 127, 128, 130, 131, 145, 146, 148, 149, 150, 151, 170, 171,
                       173, 174, 175, 176, 187, 188, 190, 191, 192, 193, 211, 212, 214, 215, 217, 218, 231, 232,
                       234, 235, 237, 238 },
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 847 },  -- bird feather
                { rate = 100, item = 4570 },  -- bird egg
                { rate = 50, item = 1058 },  -- ruaun coffer key
            },
        },
        {
            name   = 'Groundskeeper',
            ids    = { 19, 21, 23, 35, 37, 39, 40, 41, 42, 43, 44, 45, 46, 47, 52, 53, 57, 58, 63, 64, 73, 74, 75,
                       81, 91, 92, 93, 94, 99, 110, 111, 117, 118, 119, 123, 135, 136, 137, 138, 144, 154, 155, 162,
                       163, 169, 179, 180, 185, 196, 197, 203, 204, 205, 210, 221, 222, 223, 224, 230, 240, 241 },
            levels = {
                [75] = { acc = 317, eva = 299, agi = 74, int = 58, mnd = 58, chr = 70 },
                [76] = { acc = 323, eva = 304, agi = 76, int = 59, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 309, agi = 76, int = 60, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 314, agi = 77, int = 60, mnd = 60, chr = 73 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 10, item = 1058 },  -- ruaun coffer key
            },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 78, 80, 84, 87 },
            levels = {
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Water Elemental',
            ids    = { 97, 102, 105, 109 },
            levels = {
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Air Elemental',
            ids    = { 126, 129, 132, 134 },
            levels = {
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
            },
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
            ids    = { 141, 143, 147, 152 },
            levels = {
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Light Elemental',
            ids    = { 166, 168, 172, 177 },
            levels = {
                [78] = { acc = 321, eva = 286, agi = 68, int = 68, mnd = 93, chr = 80 },
                [79] = { acc = 326, eva = 290, agi = 69, int = 69, mnd = 96, chr = 82 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            drops  = {
                { rate = 1000, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Dark Elemental',
            ids    = { 183, 186, 189, 194 },
            levels = {
                [78] = { acc = 331, eva = 312, agi = 72, int = 80, mnd = 54, chr = 54 },
                [79] = { acc = 337, eva = 318, agi = 75, int = 82, mnd = 55, chr = 55 },
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
            name   = 'Ice Elemental',
            ids    = { 209, 213, 216, 220 },
            levels = {
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
            },
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
            name   = 'Earth Elemental',
            ids    = { 227, 229, 233, 236 },
            levels = {
                [78] = { acc = 329, eva = 305, agi = 76, int = 89, mnd = 72, chr = 72 },
                [79] = { acc = 336, eva = 311, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Groundskeeper',
            ids    = { 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 259, 260,
                       261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278,
                       279, 280, 281, 282 },
            levels = {
                [75] = { acc = 317, eva = 299, agi = 74, int = 58, mnd = 58, chr = 70 },
                [76] = { acc = 323, eva = 304, agi = 76, int = 59, mnd = 59, chr = 71 },
                [77] = { acc = 328, eva = 309, agi = 76, int = 60, mnd = 60, chr = 71 },
                [78] = { acc = 333, eva = 314, agi = 77, int = 60, mnd = 60, chr = 73 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 10, item = 1058 },  -- ruaun coffer key
            },
            aggro  = true,
            detects = { 'magic' },
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Despot',
            ids    = { 258 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 325, agi = 78, int = 61, mnd = 61, chr = 74 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 64, mnd = 64, chr = 76 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 64, mnd = 64, chr = 76 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'slow', 'elegy', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1442 },  -- oblation abjuration
                { rate = 100, item = 18044 },  -- scarecrow scythe
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Mimic',
            ids    = { 283 },
            nm     = true,
            levels = {
                [70] = { acc = 289, eva = 278, agi = 81, int = 63, mnd = 63, chr = 53 },
            },
            drops  = {
                { rate = 1000, item = 1058 },  -- ruaun coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Genbu',
            ids    = { 284 },
            nm     = true,
            levels = {
                [88] = { acc = 388, eva = 357, agi = 66, int = 86, mnd = 105, chr = 102 },
                [89] = { acc = 394, eva = 362, agi = 66, int = 87, mnd = 107, chr = 104 },
                [90] = { acc = 401, eva = 367, agi = 67, int = 87, mnd = 107, chr = 105 },
            },
            ranks  = { fire = 10, ice = 4, wind = 4, earth = 4, thunder = -2, water = 10, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 11, slow = 4, poison = 10, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1404 },  -- seal of genbu
                { rate = 1000, item = 18161 },  -- arctic wind
                { rate = 150, item = 1404 },  -- seal of genbu
                { rate = 150, item = 12296 },  -- genbus shield
                { rate = 150, item = 12434 },  -- genbus kabuto
                { rate = 10, item = 1110 },  -- vial of black beetle blood
                { rate = 150, item = 901 },  -- venomous claw
                { rate = 100, item = 908 },  -- adamantoise shell
                { rate = 100, item = 1311 },  -- piece of oxblood
                { rate = 50, item = 655 },  -- adaman ingot
                { rate = 10, item = 722 },  -- divine log
                { rate = 1000, group = {  -- one of
                    { 1338, 3100 },  -- wyrmal abjuration feet
                    { 1326, 2300 },  -- aquarian abjuration hands
                    { 1324, 2300 },  -- aquarian abjuration head
                    { 1331, 2300 },  -- martial abjuration hands
                } },
                { rate = 100, group = {  -- one of
                    { 1338, 3100 },  -- wyrmal abjuration feet
                    { 1326, 2300 },  -- aquarian abjuration hands
                    { 1324, 2300 },  -- aquarian abjuration head
                    { 1331, 2300 },  -- martial abjuration hands
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Seiryu',
            ids    = { 285 },
            nm     = true,
            levels = {
                [88] = { acc = 395, eva = 366, agi = 85, int = 85, mnd = 71, chr = 74 },
                [89] = { acc = 402, eva = 372, agi = 86, int = 86, mnd = 72, chr = 74 },
                [90] = { acc = 408, eva = 377, agi = 87, int = 87, mnd = 72, chr = 75 },
            },
            ranks  = { fire = 4, ice = -2, wind = 10, earth = 10, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 10, slow = 10, poison = 4, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1405 },  -- seal of seiryu
                { rate = 150, item = 1405 },  -- seal of seiryu
                { rate = 1000, item = 18162 },  -- east wind
                { rate = 150, item = 17659 },  -- seiryus sword
                { rate = 150, item = 12690 },  -- seiryus kote
                { rate = 100, item = 903 },  -- dragon talon
                { rate = 100, item = 1133 },  -- vial of dragon blood
                { rate = 100, item = 4272 },  -- slice of dragon meat
                { rate = 10, item = 836 },  -- square of damascene cloth
                { rate = 10, item = 837 },  -- spool of malboro fiber
                { rate = 10, item = 4486 },  -- dragon heart
                { rate = 1000, group = {  -- one of
                    { 1336, 3100 },  -- wyrmal abjuration hands
                    { 1327, 2300 },  -- aquarian abjuration legs
                    { 1314, 2300 },  -- dryadic abjuration head
                    { 1329, 2300 },  -- martial abjuration head
                } },
                { rate = 100, group = {  -- one of
                    { 1336, 3100 },  -- wyrmal abjuration hands
                    { 1327, 2300 },  -- aquarian abjuration legs
                    { 1314, 2300 },  -- dryadic abjuration head
                    { 1329, 2300 },  -- martial abjuration head
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Byakko',
            ids    = { 286 },
            nm     = true,
            levels = {
                [88] = { acc = 397, eva = 436, agi = 90, int = 75, mnd = 76, chr = 71 },
                [89] = { acc = 405, eva = 441, agi = 90, int = 77, mnd = 76, chr = 71 },
                [90] = { acc = 411, eva = 447, agi = 92, int = 77, mnd = 77, chr = 72 },
            },
            ranks  = { fire = 4, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 10, dark = -2,
                       paralyze = 4, bind = 4, silence = 10, slow = 4, poison = 4, light_sleep = 10,
                       dark_sleep = -2, blind = -2, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1406 },  -- seal of byakko
                { rate = 1000, item = 18163 },  -- zephyr
                { rate = 150, item = 1406 },  -- seal of byakko
                { rate = 150, item = 18198 },  -- byakkos axe
                { rate = 100, item = 722 },  -- divine log
                { rate = 100, item = 837 },  -- spool of malboro fiber
                { rate = 100, item = 860 },  -- behemoth hide
                { rate = 100, item = 860 },  -- behemoth hide
                { rate = 150, item = 12818 },  -- byakkos haidate
                { rate = 10, item = 658 },  -- damascus ingot
                { rate = 10, item = 1311 },  -- piece of oxblood
                { rate = 1000, group = {  -- one of
                    { 1341, 3100 },  -- neptunal abjuration hands
                    { 1324, 2300 },  -- aquarian abjuration head
                    { 1317, 2300 },  -- dryadic abjuration legs
                    { 1323, 2300 },  -- earthen abjuration feet
                } },
                { rate = 100, group = {  -- one of
                    { 1341, 3100 },  -- neptunal abjuration hands
                    { 1324, 2300 },  -- aquarian abjuration head
                    { 1317, 2300 },  -- dryadic abjuration legs
                    { 1323, 2300 },  -- earthen abjuration feet
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Suzaku',
            ids    = { 287 },
            nm     = true,
            levels = {
                [88] = { acc = 394, eva = 397, agi = 86, int = 87, mnd = 87, chr = 85 },
                [89] = { acc = 400, eva = 402, agi = 87, int = 90, mnd = 90, chr = 86 },
                [90] = { acc = 407, eva = 407, agi = 87, int = 90, mnd = 90, chr = 87 },
            },
            ranks  = { fire = 10, ice = 10, wind = 4, earth = 4, thunder = 4, water = -2, light = 4, dark = 4,
                       paralyze = 4, bind = 10, silence = 10, slow = 4, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1407 },  -- seal of suzaku
                { rate = 150, item = 1407 },  -- seal of suzaku
                { rate = 1000, item = 18164 },  -- antarctic wind
                { rate = 150, item = 12946 },  -- suzakus sune-ate
                { rate = 150, item = 18043 },  -- suzakus scythe
                { rate = 100, item = 836 },  -- square of damascene cloth
                { rate = 50, item = 747 },  -- orichalcum ingot
                { rate = 50, item = 831 },  -- square of shining cloth
                { rate = 10, item = 901 },  -- venomous claw
                { rate = 100, item = 1110 },  -- vial of black beetle blood
                { rate = 150, item = 1313 },  -- lock of sirens hair
                { rate = 100, item = 1313 },  -- lock of sirens hair
                { rate = 100, item = 1313 },  -- lock of sirens hair
                { rate = 1000, group = {  -- one of
                    { 1343, 3100 },  -- neptunal abjuration feet
                    { 1327, 2300 },  -- aquarian abjuration legs
                    { 1316, 2300 },  -- dryadic abjuration hands
                    { 1319, 2300 },  -- earthen abjuration head
                } },
                { rate = 100, group = {  -- one of
                    { 1343, 3100 },  -- neptunal abjuration feet
                    { 1327, 2300 },  -- aquarian abjuration legs
                    { 1316, 2300 },  -- dryadic abjuration hands
                    { 1319, 2300 },  -- earthen abjuration head
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Eraser',
            ids    = { 288 },
            levels = {
                [1] = { acc = 11, eva = 9, agi = 9, int = 6, mnd = 6, chr = 8 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Aello',
            ids    = { 289, 293, 297 },
            nm     = true,
            levels = {
                [110] = { acc = 482, eva = 454, agi = 117, int = 135, mnd = 99, chr = 108 },
            },
            ranks  = { fire = 1, ice = -1, wind = 9, earth = 5, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = 9, slow = 5, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 9 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Aellos Handmaiden',
            ids    = { 290, 291, 292, 294, 295, 296, 298, 299, 300 },
            nm     = true,
            levels = {
                [100] = { acc = 467, eva = 413, agi = 85, int = 96, mnd = 107, chr = 95 },
            },
            ranks  = { fire = 1, ice = 1, wind = 11, earth = 1, thunder = 1, water = 1, light = 8, dark = 1,
                       paralyze = 1, bind = 1, silence = 11, slow = 1, poison = 1, light_sleep = 8, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 11 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
    },
    by_name = {},
}
