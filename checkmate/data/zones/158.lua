-- Upper Delkfutts Tower (zone 158).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Alkyoneus', 'Enkelados', 'Gigas Bonecutter', 'Gigas Spirekeeper', 'Gigas Stonemason',
                'Gigas Torturer', 'Jotunn Gatekeeper', 'Jotunn Hallkeeper', 'Jotunn Wallkeeper',
                'Jotunn Wildkeeper', 'Mimas', 'Pallas', 'Porphyrion' },
        [2] = { 'Dire Bat', 'Incubus Bats' },
        [3] = { 'Alkyoneus', 'Enkelados', 'Gigas Bonecutter', 'Gigas Spirekeeper', 'Gigas Stonemason',
                'Gigas Torturer', 'Jotunn Gatekeeper', 'Jotunn Hallkeeper', 'Jotunn Wallkeeper',
                'Jotunn Wildkeeper', 'Pallas', 'Porphyrion' },
        [4] = { 'Alkyoneus', 'Enkelados', 'Gigas Bonecutter', 'Gigas Spirekeeper', 'Gigas Stonemason',
                'Gigas Torturer', 'Jotunn Gatekeeper', 'Jotunn Hallkeeper', 'Jotunn Wallkeeper',
                'Jotunn Wildkeeper', 'Mimas', 'Pallas' },
        [5] = { 'Alkyoneus', 'Enkelados', 'Gigas Bonecutter', 'Gigas Spirekeeper', 'Gigas Stonemason',
                'Gigas Torturer', 'Jotunn Gatekeeper', 'Jotunn Hallkeeper', 'Jotunn Wallkeeper',
                'Jotunn Wildkeeper', 'Mimas', 'Porphyrion' },
        [6] = { 'Ixtab' },
        [7] = { 'Enkelados', 'Gigas Bonecutter', 'Gigas Spirekeeper', 'Gigas Stonemason', 'Gigas Torturer',
                'Jotunn Gatekeeper', 'Jotunn Hallkeeper', 'Jotunn Wallkeeper', 'Jotunn Wildkeeper', 'Mimas',
                'Pallas', 'Porphyrion' },
    },
    monsters = {
        {
            name   = 'Enkelados',
            ids    = { 1, 39 },
            nm     = true,
            levels = {
                [40] = { acc = 145, eva = 128, agi = 29, int = 30, mnd = 35, chr = 52 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 15 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 240, item = 12292 },  -- mahogany shield
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14020 },  -- enkeladoss bracelets
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Gigass Bats',
            ids    = { 2, 5, 10, 17, 24, 31, 40, 43, 51, 56 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Gigas Torturer',
            ids    = { 3, 8, 15, 22, 29, 49, 54 },
            levels = {
                [34] = { acc = 126, eva = 112, agi = 24, int = 20, mnd = 32, chr = 32 },
                [35] = { acc = 130, eva = 116, agi = 26, int = 20, mnd = 32, chr = 33 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Gigas Bonecutter',
            ids    = { 4, 9, 16, 23, 30, 42, 50, 55 },
            levels = {
                [34] = { acc = 125, eva = 109, agi = 24, int = 25, mnd = 29, chr = 45, resist = { slow = 10 } },
                [35] = { acc = 128, eva = 113, agi = 26, int = 26, mnd = 30, chr = 46, resist = { slow = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Gigas Stonemason',
            ids    = { 6, 11, 18, 25, 32, 44, 52, 57 },
            levels = {
                [34] = { acc = 145, eva = 116, agi = 38, int = 24, mnd = 30, chr = 32,
                         resist = { poison = 10, virus = 10 } },
                [35] = { acc = 149, eva = 120, agi = 40, int = 26, mnd = 31, chr = 33,
                         resist = { poison = 10, virus = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Gigas Spirekeeper',
            ids    = { 7, 14, 21, 28, 41, 48, 53 },
            levels = {
                [34] = { acc = 125, eva = 114, agi = 34, int = 22, mnd = 26, chr = 32, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 117, agi = 35, int = 23, mnd = 27, chr = 33, resist = { virus = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 12, 19, 26, 33, 46 },
            levels = {
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
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
            ids    = { 13, 20, 27, 34, 47 },
            levels = {
                [35] = { acc = 121, eva = 104, agi = 30, int = 30, mnd = 43, chr = 36 },
                [36] = { acc = 125, eva = 107, agi = 32, int = 32, mnd = 44, chr = 38 },
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
            name   = 'Mimas',
            ids    = { 35 },
            nm     = true,
            levels = {
                [36] = { acc = 132, eva = 121, agi = 36, int = 23, mnd = 28, chr = 35 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 16721 },  -- huge moth axe
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Magic Urn',
            ids    = { 36, 37, 38 },
            levels = {
                [34] = { acc = 123, eva = 111, agi = 29, int = 37, mnd = 36, chr = 34 },
                [35] = { acc = 126, eva = 115, agi = 31, int = 39, mnd = 37, chr = 34 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Porphyrion',
            ids    = { 45 },
            nm     = true,
            levels = {
                [36] = { acc = 132, eva = 121, agi = 36, int = 23, mnd = 28, chr = 35 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            drops  = {
                { rate = 1000, item = 549 },  -- delkfutt key
                { rate = 1000, item = 549 },  -- delkfutt key
                { rate = 1000, item = 549 },  -- delkfutt key
                { rate = 1000, item = 549 },  -- delkfutt key
                { rate = 1000, item = 549 },  -- delkfutt key
                { rate = 1000, item = 549 },  -- delkfutt key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Demonic Doll',
            ids    = { 58, 59, 97, 98, 99 },
            levels = {
                [68] = { acc = 278, eva = 262, agi = 68, int = 53, mnd = 53, chr = 64 },
                [69] = { acc = 284, eva = 267, agi = 69, int = 54, mnd = 54, chr = 65 },
                [70] = { acc = 289, eva = 272, agi = 69, int = 55, mnd = 55, chr = 65 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Pallas',
            ids    = { 60 },
            nm     = true,
            levels = {
                [72] = { acc = 302, eva = 273, agi = 52, int = 55, mnd = 63, chr = 92 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 12292 },  -- mahogany shield
                { rate = 100, item = 499 },  -- gigas necklace
                { rate = 50, item = 14021 },  -- pallass bracelets
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Gigass Bat',
            ids    = { 61 },
            levels = {
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Magic Pot UDT',
            ids    = { 62, 63, 64, 100, 101 },
            levels = {
                [68] = { acc = 276, eva = 258, agi = 61, int = 73, mnd = 69, chr = 67 },
                [69] = { acc = 282, eva = 263, agi = 61, int = 74, mnd = 71, chr = 68 },
                [70] = { acc = 287, eva = 268, agi = 61, int = 75, mnd = 71, chr = 69 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
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
            name   = 'Dire Bat UDT TC SSG',
            ids    = { 65, 66, 67, 102, 103 },
            levels = {
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
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
            name   = 'Jotunn Wallkeeper',
            ids    = { 68, 73, 78, 83, 105, 110, 115, 120 },
            levels = {
                [65] = { acc = 296, eva = 231, agi = 77, int = 51, mnd = 62, chr = 62 },
                [66] = { acc = 302, eva = 236, agi = 77, int = 51, mnd = 62, chr = 63 },
                [67] = { acc = 307, eva = 241, agi = 79, int = 51, mnd = 65, chr = 63 },
                [68] = { acc = 312, eva = 247, agi = 80, int = 52, mnd = 65, chr = 64 },
                [69] = { acc = 317, eva = 251, agi = 81, int = 53, mnd = 65, chr = 65 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 20 },
            drops  = {
                { rate = 100, item = 1436 },  -- rangers testimony
                { rate = 10, item = 5010 },  -- scroll of archers prelude
                { rate = 150, item = 497 },  -- gigas socks
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, group = {  -- one of
                    { 2386, 7500 },  -- hoary battle horn
                    { 2385, 2500 },  -- moldy buckler
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Jotunn Gatekeeper',
            ids    = { 69, 74, 79, 84, 106, 111, 116, 121 },
            levels = {
                [65] = { acc = 264, eva = 246, agi = 65, int = 45, mnd = 52, chr = 62 },
                [66] = { acc = 271, eva = 251, agi = 67, int = 45, mnd = 52, chr = 63 },
                [67] = { acc = 275, eva = 256, agi = 67, int = 45, mnd = 53, chr = 63 },
                [68] = { acc = 280, eva = 262, agi = 68, int = 45, mnd = 53, chr = 64 },
                [69] = { acc = 286, eva = 267, agi = 69, int = 47, mnd = 54, chr = 65 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 20 },
            drops  = {
                { rate = 100, item = 1426 },  -- warriors testimony
                { rate = 100, item = 497 },  -- gigas socks
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, group = {  -- one of
                    { 2386, 7500 },  -- hoary battle horn
                    { 2385, 2500 },  -- moldy buckler
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Jotunn Hallkeeper',
            ids    = { 70, 75, 80, 85, 107, 112, 117, 122 },
            levels = {
                [65] = { acc = 267, eva = 244, agi = 49, int = 39, mnd = 62, chr = 62 },
                [66] = { acc = 273, eva = 249, agi = 49, int = 40, mnd = 62, chr = 63 },
                [67] = { acc = 277, eva = 254, agi = 49, int = 40, mnd = 65, chr = 63 },
                [68] = { acc = 283, eva = 260, agi = 50, int = 40, mnd = 65, chr = 64 },
                [69] = { acc = 288, eva = 265, agi = 51, int = 41, mnd = 65, chr = 65 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 1427 },  -- monks testimony
                { rate = 100, item = 497 },  -- gigas socks
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, group = {  -- one of
                    { 2386, 7500 },  -- hoary battle horn
                    { 2385, 2500 },  -- moldy buckler
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Jotunn Wildkeeper',
            ids    = { 71, 76, 81, 86, 108, 113, 118, 123 },
            levels = {
                [65] = { acc = 264, eva = 238, agi = 49, int = 51, mnd = 58, chr = 84 },
                [66] = { acc = 271, eva = 242, agi = 49, int = 51, mnd = 58, chr = 85 },
                [67] = { acc = 275, eva = 247, agi = 49, int = 51, mnd = 59, chr = 87 },
                [68] = { acc = 280, eva = 253, agi = 50, int = 52, mnd = 60, chr = 87 },
                [69] = { acc = 286, eva = 258, agi = 51, int = 53, mnd = 60, chr = 89 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 150, item = 497 },  -- gigas socks
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, group = {  -- one of
                    { 2386, 7500 },  -- hoary battle horn
                    { 2385, 2500 },  -- moldy buckler
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Gigass Bat',
            ids    = { 72, 77, 82, 87, 109, 114, 119, 124 },
            levels = {
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Phasma UDT',
            ids    = { 88, 89, 90, 125, 126, 127 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 67, mnd = 51, chr = 65 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 67, mnd = 52, chr = 66 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 69, mnd = 53, chr = 67 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 827 },  -- square of wool cloth
                { rate = 150, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ixtab',
            ids    = { 91, 128 },
            nm     = true,
            levels = {
                [71] = { acc = 293, eva = 279, agi = 75, int = 71, mnd = 55, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 10, paralyze = 9,
                       bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 10,
                       stun = 10, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 100, item = 1281 },  -- square of cheviot cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 6,
        },
        {
            name   = 'Incubus Bats UDT',
            ids    = { 92, 93, 94, 95, 129, 130, 131, 132 },
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
            links  = 2,
        },
        {
            name   = 'Alkyoneus',
            ids    = { 96 },
            nm     = true,
            levels = {
                [75] = { acc = 319, eva = 299, agi = 74, int = 50, mnd = 58, chr = 70 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 240, item = 12292 },  -- mahogany shield
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 100, item = 499 },  -- gigas necklace
                { rate = 50, item = 14022 },  -- alkyoneuss bracelets
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
    },
    by_name = {},
}
