-- Riverne-Site B01 (zone 29).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Lesser Roc' },
        [2] = { 'Book Browser Bokabraq', 'Chemical Cook Chemachiq' },
        [3] = { 'Book Browser Bokabraq', 'Spell Spitter Spilospok' },
        [4] = { 'Chemical Cook Chemachiq', 'Spell Spitter Spilospok' },
        [5] = { 'Airi', 'Iruci', 'Jormungand', 'Ouryu', 'Pey', 'Tiamat', 'Vrtra' },
        [6] = { 'Airi', 'Bahamut', 'Iruci', 'Jormungand', 'Pey', 'Tiamat', 'Vrtra' },
        [7] = { 'Airi', 'Bahamut', 'Iruci', 'Jormungand', 'Ouryu', 'Pey', 'Vrtra' },
        [8] = { 'Airi', 'Bahamut', 'Iruci', 'Ouryu', 'Pey', 'Tiamat', 'Vrtra' },
        [9] = { 'Airi', 'Bahamut', 'Iruci', 'Jormungand', 'Ouryu', 'Pey', 'Tiamat' },
        [10] = { 'Ziryu' },
        [11] = { 'Airi', 'Bahamut', 'Iruci', 'Jormungand', 'Ouryu', 'Pey', 'Tiamat', 'Vrtra' },
    },
    monsters = {
        {
            name   = 'Lesser Roc',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 22, 23, 32, 33, 34, 40, 41, 42, 93, 94, 95, 96, 98, 99, 100,
                       111, 116 },
            levels = {
                [47] = { acc = 169, eva = 159, agi = 52, int = 43, mnd = 49, chr = 49 },
                [48] = { acc = 172, eva = 162, agi = 52, int = 43, mnd = 49, chr = 50 },
                [49] = { acc = 176, eva = 166, agi = 54, int = 45, mnd = 51, chr = 51 },
                [50] = { acc = 179, eva = 169, agi = 54, int = 45, mnd = 51, chr = 51 },
                [51] = { acc = 185, eva = 174, agi = 57, int = 47, mnd = 53, chr = 54 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            drops  = {
                { rate = 150, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            links  = 1,
        },
        {
            name   = 'Pyrodrake',
            ids    = { 11, 12, 18, 24, 25, 26, 27, 28, 31, 35, 36, 112, 113, 114 },
            levels = {
                [50] = { acc = 181, eva = 169, agi = 54, int = 47, mnd = 38, chr = 42 },
                [51] = { acc = 188, eva = 174, agi = 56, int = 47, mnd = 39, chr = 45 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 47, mnd = 39, chr = 45 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 49, mnd = 40, chr = 45 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 50, item = 1122 },  -- wyvern skin
                { rate = 10, item = 1124 },  -- wyvern wing
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Nimbus Hippogryph',
            ids    = { 13, 14, 15, 16, 17, 19, 20, 29, 30, 37, 38, 39, 101, 102, 103, 104, 105, 106, 108, 109, 110,
                       117 },
            levels = {
                [49] = { acc = 181, eva = 200, agi = 56, int = 53, mnd = 35, chr = 35 },
                [50] = { acc = 184, eva = 217, agi = 59, int = 54, mnd = 36, chr = 36 },
                [51] = { acc = 190, eva = 222, agi = 59, int = 56, mnd = 38, chr = 38 },
                [52] = { acc = 195, eva = 227, agi = 59, int = 56, mnd = 38, chr = 38 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 10, item = 1619 },  -- hippogryph feather
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 21, 51 },
            levels = {
                [57] = { acc = 217, eva = 196, agi = 57, int = 68, mnd = 54, chr = 55 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 68, mnd = 55, chr = 55 },
                [59] = { acc = 228, eva = 208, agi = 60, int = 70, mnd = 56, chr = 57 },
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 74, mnd = 59, chr = 60 },
                [64] = { acc = 255, eva = 233, agi = 64, int = 75, mnd = 60, chr = 62 },
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
            name   = 'Strato Hippogryph',
            ids    = { 43, 44, 45, 46, 67, 68, 70, 71, 74, 75, 78, 79, 80, 81, 82, 83, 124, 125, 143, 144, 145, 146,
                       147 },
            levels = {
                [55] = { acc = 212, eva = 244, agi = 63, int = 58, mnd = 39, chr = 39 },
                [56] = { acc = 218, eva = 250, agi = 64, int = 61, mnd = 41, chr = 41 },
                [57] = { acc = 223, eva = 255, agi = 65, int = 61, mnd = 41, chr = 41 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 10, item = 1619 },  -- hippogryph feather
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Lunantishee',
            ids    = { 47, 48, 49, 50, 69, 72, 73, 76, 77, 84, 85, 86, 120, 121, 122, 126, 127, 128, 129, 130, 133,
                       148 },
            levels = {
                [55] = { acc = 210, eva = 195, agi = 58, int = 43, mnd = 41, chr = 49 },
                [56] = { acc = 216, eva = 200, agi = 61, int = 44, mnd = 41, chr = 50 },
                [57] = { acc = 222, eva = 205, agi = 61, int = 46, mnd = 43, chr = 50 },
                [58] = { acc = 227, eva = 210, agi = 61, int = 46, mnd = 44, chr = 52 },
            },
            spawn_levels = { [84] = { 55, 57 } },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 10, item = 1446 },  -- lacquer tree log
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ignidrake',
            ids    = { 52, 53, 54, 55, 56, 65, 66, 132, 135, 136, 137, 138, 139, 149 },
            levels = {
                [57] = { acc = 220, eva = 205, agi = 61, int = 53, mnd = 43, chr = 47 },
                [58] = { acc = 225, eva = 210, agi = 61, int = 53, mnd = 44, chr = 50 },
                [59] = { acc = 231, eva = 216, agi = 63, int = 54, mnd = 44, chr = 50 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 50, item = 1122 },  -- wyvern skin
                { rate = 10, item = 1124 },  -- wyvern wing
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Nitro Cluster',
            ids    = { 57, 58, 59, 60, 61, 62, 63, 64, 118, 119, 140, 141, 150, 151 },
            levels = {
                [55] = { acc = 209, eva = 195, agi = 58, int = 43, mnd = 43, chr = 53 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 220, eva = 205, agi = 61, int = 46, mnd = 46, chr = 54 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 150, item = 1880 },  -- pot of clustered tar
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 17305 },  -- cluster arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 97, 115, 123, 134, 142 },
            levels = {
                [57] = { acc = 217, eva = 196, agi = 57, int = 68, mnd = 54, chr = 55 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 68, mnd = 55, chr = 55 },
                [59] = { acc = 228, eva = 208, agi = 60, int = 70, mnd = 56, chr = 57 },
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60 },
            },
            spawn_levels = { [97] = { 57, 60 }, [115] = { 57, 60 }, [123] = { 58, 61 }, [134] = { 58, 61 },
                             [142] = { 58, 61 } },
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
            name   = 'Imdugud',
            ids    = { 107 },
            nm     = true,
            levels = {
                [60] = { acc = 240, eva = 272, agi = 68, int = 63, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -2, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 14758 },  -- knightly earring
                { rate = 100, item = 18096 },  -- heavy lance
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Boroka',
            ids    = { 131 },
            nm     = true,
            levels = {
                [58] = { acc = 220, eva = 196, agi = 46, int = 55, mnd = 55, chr = 65 },
                [59] = { acc = 226, eva = 201, agi = 47, int = 57, mnd = 57, chr = 68 },
                [60] = { acc = 231, eva = 206, agi = 47, int = 57, mnd = 57, chr = 68 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -2, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            immune = { 'bind', 'gravity', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 13692 },  -- skulkers cape
                { rate = 240, item = 14874 },  -- horomusha kote
                { rate = 240, item = 13178 },  -- auditory torque
                { rate = 240, item = 14763 },  -- boroka earring
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Spell Spitter Spilospok',
            ids    = { 152 },
            levels = {
                [55] = { acc = 209, eva = 195, agi = 59, int = 48, mnd = 48, chr = 50 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            resist = { virus = 20, petrify = 20 },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
        },
        {
            name   = 'Chemical Cook Chemachiq',
            ids    = { 153 },
            levels = {
                [55] = { acc = 203, eva = 174, agi = 53, int = 49, mnd = 69, chr = 58 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
        },
        {
            name   = 'Book Browser Bokabraq',
            ids    = { 154 },
            levels = {
                [55] = { acc = 210, eva = 179, agi = 62, int = 69, mnd = 49, chr = 52 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, thunder = -1, water = -1, light = -3, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, poison = -1, light_sleep = -3, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = -1 },
            aggro  = true,
            any_level = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 4,
        },
        {
            name   = 'Unstable Cluster',
            ids    = { 155 },
            nm     = true,
            levels = {
                [56] = { acc = 215, eva = 200, agi = 61, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 220, eva = 205, agi = 61, int = 46, mnd = 46, chr = 54 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 17813 },  -- soboro sukehiro
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 150, item = 1630 },  -- pinch of cluster ash
                { rate = 150, item = 17305 },  -- cluster arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Bahamut',
            ids    = { 156 },
            levels = {
                [85] = { acc = 373, eva = 341, agi = 83, int = 97, mnd = 78, chr = 80 },
            },
            ranks  = { fire = 4, dark = 6, dark_sleep = 6, blind = 6 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bahamut',
            ids    = { 157 },
            levels = {
                [92] = { acc = 420, eva = 377, agi = 89, int = 125, mnd = 84, chr = 85 },
            },
            ranks  = { fire = 4, dark = 6, dark_sleep = 6, blind = 6 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'petrify', 'terror' },
            drops  = {
                { rate = 240, item = 1704 },  -- chunk of kunwu iron
                { rate = 240, item = 1703 },  -- chunk of kunwu ore
                { rate = 240, item = 647 },  -- chunk of molybdenum ore
                { rate = 240, item = 647 },  -- chunk of molybdenum ore
                { rate = 150, item = 1714 },  -- square of cashmere cloth
                { rate = 150, item = 1713 },  -- spool of cashmere thread
                { rate = 240, item = 1816 },  -- wyrm horn
                { rate = 1000, group = {  -- one of
                    { 17597, 7500 },  -- dragon staff
                    { 17598, 2500 },  -- bahamuts staff
                } },
                { rate = 1000, group = {  -- one of
                    { 15599, 4500 },  -- bahamuts hose
                    { 15264, 3000 },  -- bahamuts mask
                    { 18061, 2500 },  -- bahamuts zaghnal
                } },
                { rate = 1000, group = {  -- one of
                    { 1313, 7500 },  -- lock of sirens hair
                    { 722, 2500 },  -- divine log
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Ouryu',
            ids    = { 158 },
            nm     = true,
            levels = {
                [88] = { acc = 394, eva = 359, agi = 71, int = 76, mnd = 80, chr = 100 },
            },
            ranks  = { wind = -2, earth = 11, thunder = 11, silence = -2, slow = 11, stun = 11, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'slow', 'elegy', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 6,
        },
        {
            name   = 'Tiamat',
            ids    = { 159 },
            nm     = true,
            levels = {
                [88] = { acc = 413, eva = 417, agi = 100, int = 95, mnd = 60, chr = 88 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, paralyze = 11, bind = 11, poison = -2 },
            magic_dmg = { all = -40 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 7,
        },
        {
            name   = 'Jormungand',
            ids    = { 160 },
            nm     = true,
            levels = {
                [88] = { acc = 410, eva = 426, agi = 95, int = 110, mnd = 56, chr = 78 },
            },
            ranks  = { fire = -2, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            meva   = { curse = 1000 },
            magic_dmg = { all = -40 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 8,
        },
        {
            name   = 'Vrtra',
            ids    = { 161 },
            nm     = true,
            levels = {
                [88] = { acc = 411, eva = 417, agi = 92, int = 110, mnd = 66, chr = 100 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, light = -2, dark = 11, paralyze = 11, bind = 11,
                       poison = -2, light_sleep = -2, dark_sleep = 11, blind = 11 },
            meva   = { dark = 100 },
            magic_dmg = { all = -40 },
            immune = { 'dark_sleep', 'light_sleep', 'blind', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 9,
        },
        {
            name   = 'Ziryu',
            ids    = { 162, 163, 164, 165 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 90, mnd = 68, chr = 66 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 91, mnd = 69, chr = 67 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 93, mnd = 71, chr = 68 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 10,
        },
        {
            name   = 'Water Elemental',
            ids    = { 166 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 167 },
            levels = {
                [74] = { acc = 308, eva = 284, agi = 73, int = 85, mnd = 68, chr = 70 },
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Pey',
            ids    = { 168, 169 },
            nm     = true,
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 57, chr = 68 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 57, chr = 69 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 11,
        },
        {
            name   = 'Iruci',
            ids    = { 170, 171 },
            nm     = true,
            levels = {
                [78] = { acc = 333, eva = 292, agi = 80, int = 93, mnd = 65, chr = 72 },
                [79] = { acc = 339, eva = 297, agi = 82, int = 96, mnd = 65, chr = 75 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 11,
        },
        {
            name   = 'Airi',
            ids    = { 172, 173 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 292, agi = 80, int = 98, mnd = 65, chr = 77 },
                [79] = { acc = 337, eva = 297, agi = 82, int = 101, mnd = 65, chr = 80 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 11,
        },
    },
    by_name = {},
}
