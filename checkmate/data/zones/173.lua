-- Korroloka Tunnel (zone 173).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Land Worm', 'Morion Worm' },
        [2] = { 'Combat', 'Seeker Bats' },
        [3] = { 'Jammer Leech', 'Korroloka Leech', 'Thread Leech' },
        [4] = { 'Falcatus Aranei', 'Huge Spider' },
        [5] = { 'Huge Spider' },
        [6] = { 'Gigas Foreman', 'Gigas Stonecarrier', 'Gigas Stonegrinder', 'Gigas Stonemason' },
        [7] = { 'Land Worm' },
        [8] = { 'Gloom Phantom', 'Goblin Bounty Hunter' },
    },
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1, 2 },
            levels = {
                [22] = { acc = 79, eva = 71, agi = 16, int = 17, mnd = 24, chr = 24 },
                [23] = { acc = 82, eva = 74, agi = 16, int = 17, mnd = 24, chr = 24 },
                [24] = { acc = 85, eva = 77, agi = 16, int = 18, mnd = 26, chr = 26 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3, 4 },
            levels = {
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 27 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 27 },
                [33] = { acc = 119, eva = 112, agi = 36, int = 26, mnd = 26, chr = 27 },
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
            name   = 'Kraken',
            ids    = { 5 },
            levels = {
                [35] = { acc = 125, eva = 118, agi = 36, int = 27, mnd = 27, chr = 30 },
                [36] = { acc = 129, eva = 122, agi = 38, int = 28, mnd = 28, chr = 32 },
                [37] = { acc = 132, eva = 124, agi = 38, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 10, item = 770 },  -- blue rock
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Land Worm',
            ids    = { 6, 7, 9, 10, 11, 13, 14, 16, 17, 19, 20, 22, 23, 93, 94, 95, 96, 97, 99, 100, 102, 103, 105,
                       106, 108, 109, 112, 113, 183, 184, 185, 186, 187, 191, 192, 193, 194 },
            levels = {
                [20] = { acc = 73, eva = 65, agi = 21, int = 27, mnd = 19, chr = 18 },
                [21] = { acc = 78, eva = 69, agi = 23, int = 29, mnd = 21, chr = 21 },
                [22] = { acc = 81, eva = 71, agi = 23, int = 29, mnd = 21, chr = 21 },
                [23] = { acc = 84, eva = 74, agi = 23, int = 30, mnd = 21, chr = 21 },
                [24] = { acc = 88, eva = 78, agi = 25, int = 31, mnd = 22, chr = 22 },
                [25] = { acc = 91, eva = 81, agi = 26, int = 32, mnd = 23, chr = 23 },
            },
            spawn_levels = { [16] = { 20, 24 }, [102] = { 20, 24 }, [186] = { 20, 24 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 643 },  -- chunk of iron ore
            },
            links  = 1,
        },
        {
            name   = 'Seeker Bats',
            ids    = { 8, 12, 15, 18, 21, 98, 101, 104, 107, 110, 111, 114, 115, 116, 117, 118, 119, 120, 129, 130,
                       131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 147, 148, 149, 150, 151, 152, 157, 158,
                       159, 163, 164, 167, 172, 173, 181, 182, 195, 196, 197, 198, 235, 236, 237, 238, 239, 240,
                       241, 242, 252, 253 },
            levels = {
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 2,
        },
        {
            name   = 'Thread Leech',
            ids    = { 24, 30, 36, 41, 47, 52, 58, 59, 60, 64, 65, 71, 72, 81, 82, 88, 256, 259, 260, 263, 264, 272,
                       287, 288, 289, 290, 292, 293, 296, 297, 298 },
            levels = {
                [28] = { acc = 101, eva = 94, agi = 29, int = 23, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 98, agi = 30, int = 25, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 101, agi = 31, int = 25, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 33, int = 27, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 3,
        },
        {
            name   = 'Huge Spider',
            ids    = { 25, 26, 27, 31, 32, 33, 37, 38, 42, 43, 48, 49, 53, 54, 61, 66, 67, 73, 74, 83, 84, 89, 90,
                       203, 204, 205, 206, 208, 209, 210, 211, 212, 213 },
            levels = {
                [28] = { acc = 103, eva = 94, agi = 29, int = 23, mnd = 23, chr = 21 },
                [29] = { acc = 107, eva = 98, agi = 30, int = 25, mnd = 25, chr = 22 },
                [30] = { acc = 110, eva = 101, agi = 31, int = 25, mnd = 25, chr = 22 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 27, mnd = 27, chr = 24 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 10, item = 838 },  -- spider web
            },
            links  = 4,
        },
        {
            name   = 'Combat',
            ids    = { 28, 34, 39, 44, 50, 55, 62, 68, 69, 75, 76, 85, 86, 91, 153, 154, 160, 161, 162, 165, 166,
                       168, 169, 188, 189, 190, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332,
                       333, 334, 335, 336, 337, 338, 339, 340, 341 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 2,
        },
        {
            name   = 'Jelly KT GM',
            ids    = { 29, 35, 40, 46, 51, 56, 63, 70, 78, 87, 92, 121, 141, 142, 144, 145, 170, 214, 243, 244 },
            levels = {
                [23] = { acc = 84, eva = 77, agi = 23, int = 18, mnd = 20, chr = 20 },
                [24] = { acc = 88, eva = 81, agi = 24, int = 19, mnd = 21, chr = 21 },
                [25] = { acc = 91, eva = 84, agi = 25, int = 20, mnd = 22, chr = 23 },
                [26] = { acc = 95, eva = 88, agi = 27, int = 20, mnd = 23, chr = 23 },
                [27] = { acc = 98, eva = 90, agi = 27, int = 21, mnd = 23, chr = 24 },
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
            name   = 'Thunder Elemental',
            ids    = { 45, 77 },
            levels = {
                [32] = { acc = 115, eva = 103, agi = 32, int = 37, mnd = 29, chr = 30 },
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
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
            name   = 'Sea Monk',
            ids    = { 57, 122, 155, 202, 245, 265 },
            levels = {
                [32] = { acc = 115, eva = 107, agi = 33, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 118, eva = 111, agi = 34, int = 26, mnd = 26, chr = 29 },
                [34] = { acc = 122, eva = 115, agi = 36, int = 26, mnd = 26, chr = 29 },
                [35] = { acc = 125, eva = 118, agi = 36, int = 27, mnd = 27, chr = 30 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 79, 123, 125, 127, 177, 179, 199, 200, 201, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234,
                       246, 248, 250, 266, 268, 270 },
            levels = {
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 27 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 27 },
                [33] = { acc = 119, eva = 112, agi = 36, int = 26, mnd = 26, chr = 27 },
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
            name   = 'Clipper',
            ids    = { 80, 124, 126, 128, 178, 180, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 247, 249, 251,
                       254, 255, 257, 258, 261, 262, 267, 269, 271 },
            levels = {
                [29] = { acc = 102, eva = 92, agi = 19, int = 20, mnd = 30, chr = 30 },
                [30] = { acc = 106, eva = 95, agi = 19, int = 21, mnd = 31, chr = 31 },
                [31] = { acc = 110, eva = 100, agi = 22, int = 23, mnd = 33, chr = 33 },
                [32] = { acc = 113, eva = 102, agi = 22, int = 23, mnd = 33, chr = 33 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 143, 146, 171, 306 },
            levels = {
                [32] = { acc = 115, eva = 103, agi = 32, int = 37, mnd = 29, chr = 30 },
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
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
            name   = 'Cargo Crab Colin',
            ids    = { 156 },
            nm     = true,
            levels = {
                [34] = { acc = 119, eva = 108, agi = 22, int = 24, mnd = 36, chr = 36 },
                [35] = { acc = 123, eva = 111, agi = 23, int = 24, mnd = 36, chr = 36 },
                [36] = { acc = 127, eva = 115, agi = 25, int = 27, mnd = 38, chr = 38 },
                [37] = { acc = 130, eva = 117, agi = 25, int = 27, mnd = 38, chr = 38 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4400 },  -- slice of land crab meat
                { rate = 1000, item = 4400 },  -- slice of land crab meat
                { rate = 240, item = 881 },  -- crab shell
                { rate = 240, item = 881 },  -- crab shell
                { rate = 100, item = 17650 },  -- nadrs
            },
        },
        {
            name   = 'Jammer Leech',
            ids    = { 174, 175, 176 },
            nm     = true,
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 51, mnd = 47, chr = 53 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Falcatus Aranei',
            ids    = { 207 },
            nm     = true,
            levels = {
                [32] = { acc = 117, eva = 107, agi = 33, int = 27, mnd = 27, chr = 24 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 240, item = 838 },  -- spider web
                { rate = 240, item = 838 },  -- spider web
                { rate = 240, item = 838 },  -- spider web
                { rate = 150, item = 18040 },  -- webcutter
            },
            links  = 5,
        },
        {
            name   = 'Bogy',
            ids    = { 291, 294, 295, 299, 300, 301, 302, 303, 304 },
            levels = {
                [30] = { acc = 108, eva = 101, agi = 31, int = 28, mnd = 22, chr = 28 },
                [31] = { acc = 112, eva = 105, agi = 33, int = 31, mnd = 24, chr = 32 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 31, mnd = 24, chr = 32 },
                [33] = { acc = 119, eva = 111, agi = 34, int = 32, mnd = 25, chr = 32 },
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
            name   = 'Dame Blanche',
            ids    = { 305 },
            nm     = true,
            levels = {
                [34] = { acc = 123, eva = 115, agi = 36, int = 34, mnd = 25, chr = 33 },
                [35] = { acc = 126, eva = 118, agi = 36, int = 34, mnd = 26, chr = 34 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 5, bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 5, stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 1280 },  -- square of sarcenet cloth
                { rate = 240, item = 1280 },  -- square of sarcenet cloth
                { rate = 150, item = 1280 },  -- square of sarcenet cloth
                { rate = 150, item = 1280 },  -- square of sarcenet cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Gigas Stonemason',
            ids    = { 342, 348, 353, 358 },
            levels = {
                [35] = { acc = 149, eva = 120, agi = 40, int = 26, mnd = 31, chr = 33 },
                [36] = { acc = 152, eva = 123, agi = 40, int = 26, mnd = 33, chr = 35 },
                [37] = { acc = 156, eva = 125, agi = 41, int = 27, mnd = 33, chr = 35 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 15 },
            drops  = {
                { rate = 100, item = 497 },  -- gigas socks
                { rate = 50, item = 12290 },  -- maple shield
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 5, item = 1836 },  -- marble slab
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gigas Stonecarrier',
            ids    = { 343, 349, 354, 359 },
            levels = {
                [35] = { acc = 128, eva = 117, agi = 35, int = 23, mnd = 27, chr = 33 },
                [36] = { acc = 132, eva = 121, agi = 36, int = 23, mnd = 28, chr = 35 },
                [37] = { acc = 135, eva = 123, agi = 36, int = 25, mnd = 29, chr = 35 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 497 },  -- gigas socks
                { rate = 50, item = 12290 },  -- maple shield
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 5, item = 1836 },  -- marble slab
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gigas Stonegrinder',
            ids    = { 344, 350, 355, 360 },
            levels = {
                [35] = { acc = 130, eva = 116, agi = 26, int = 20, mnd = 32, chr = 33 },
                [36] = { acc = 133, eva = 119, agi = 26, int = 22, mnd = 34, chr = 35 },
                [37] = { acc = 137, eva = 122, agi = 27, int = 23, mnd = 34, chr = 35 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 497 },  -- gigas socks
                { rate = 50, item = 12290 },  -- maple shield
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 5, item = 1836 },  -- marble slab
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gigas Foreman',
            ids    = { 345, 351, 356, 361 },
            levels = {
                [35] = { acc = 128, eva = 113, agi = 26, int = 26, mnd = 30, chr = 46 },
                [36] = { acc = 132, eva = 116, agi = 26, int = 27, mnd = 32, chr = 47 },
                [37] = { acc = 135, eva = 118, agi = 27, int = 28, mnd = 32, chr = 49 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 15 },
            drops  = {
                { rate = 100, item = 497 },  -- gigas socks
                { rate = 50, item = 12290 },  -- maple shield
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 5, item = 1836 },  -- marble slab
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gigass Spider',
            ids    = { 346, 352, 357, 362 },
            levels = {
                [28] = { acc = 103, eva = 94, agi = 29, int = 23, mnd = 23, chr = 21 },
                [29] = { acc = 107, eva = 98, agi = 30, int = 25, mnd = 25, chr = 22 },
                [30] = { acc = 110, eva = 101, agi = 31, int = 25, mnd = 25, chr = 22 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            links  = 4,
        },
        {
            name   = 'Korroloka Leech',
            ids    = { 363, 364, 365 },
            nm     = true,
            levels = {
                [32] = { acc = 115, eva = 107, agi = 33, int = 27, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Morion Worm',
            ids    = { 366 },
            nm     = true,
            levels = {
                [28] = { acc = 101, eva = 94, agi = 29, int = 33, mnd = 24, chr = 25 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            immune = { 'dark_sleep', 'silence', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 18136 },  -- morion tathlum
                { rate = 1000, group = {  -- one of
                    { 640, 7000 },  -- chunk of copper ore
                    { 643, 3000 },  -- chunk of iron ore
                } },
                { rate = 1000, group = {  -- one of
                    { 640, 6300 },  -- chunk of copper ore
                    { 641, 3000 },  -- chunk of tin ore
                    { 645, 700 },  -- chunk of darksteel ore
                } },
                { rate = 1000, group = {  -- one of
                    { 640, 6300 },  -- chunk of copper ore
                    { 641, 3000 },  -- chunk of tin ore
                    { 645, 700 },  -- chunk of darksteel ore
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 7,
        },
        {
            name   = 'Goblin Bounty Hunter',
            ids    = { 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385,
                       386 },
            levels = {
                [10] = { acc = 41, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Gloom Phantom',
            ids    = { 387 },
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
            ids    = { 388 },
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
            ids    = { 389 },
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
