-- The Eldieme Necropolis (zone 195).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Dark Stalker', 'Ka', 'Shade', 'Spriggan' },
        [2] = { 'Dog Guardian', 'Owl Guardian' },
        [3] = { 'Owl Guardian', 'Yum Kimil' },
        [4] = { 'Dog Guardian', 'Yum Kimil' },
        [5] = { 'Trombe' },
        [6] = { 'Taifun' },
    },
    monsters = {
        {
            name   = 'Lich C Magnus',
            ids    = { 1 },
            levels = {
                [58] = { acc = 225, eva = 192, agi = 61, int = 71, mnd = 50, chr = 55 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 1000, item = 880 },  -- bone chip
                { rate = 150, item = 17072 },  -- liliths rod
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Gluttony',
            ids    = { 2 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 801 },  -- chrysoberyl
                { rate = 100, item = 16830 },  -- gluttony sword
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Greed',
            ids    = { 3 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 810 },  -- fluorite
                { rate = 100, item = 16831 },  -- greed scimitar
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Sloth',
            ids    = { 4 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 65, mnd = 48, chr = 56 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 805 },  -- zircon
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Lust',
            ids    = { 5 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 797 },  -- painite
                { rate = 100, item = 16765 },  -- lust dagger
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Pride',
            ids    = { 6 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 65, mnd = 48, chr = 56 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 791 },  -- aquamarine
                { rate = 100, item = 17522 },  -- pride staff
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Envy',
            ids    = { 7 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 784 },  -- jadeite
                { rate = 100, item = 16870 },  -- envy spear
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skull of Wrath',
            ids    = { 8 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 803 },  -- sunstone
                { rate = 100, item = 16679 },  -- wrath tabar
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Marchosias',
            ids    = { 9, 14, 15, 16, 31, 32, 39, 40, 41, 50, 51 },
            levels = {
                [40] = { acc = 143, eva = 134, agi = 40, int = 31, mnd = 29, chr = 38 },
                [41] = { acc = 148, eva = 139, agi = 44, int = 33, mnd = 31, chr = 40 },
                [42] = { acc = 151, eva = 141, agi = 44, int = 33, mnd = 31, chr = 40 },
                [43] = { acc = 154, eva = 144, agi = 44, int = 33, mnd = 31, chr = 41 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 858 },  -- wolf hide
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lost Soul war EN',
            ids    = { 10, 11, 33, 34, 35, 52, 53, 69, 70, 123, 124, 155, 156 },
            levels = {
                [42] = { acc = 152, eva = 141, agi = 44, int = 33, mnd = 31, chr = 37 },
                [43] = { acc = 155, eva = 144, agi = 44, int = 33, mnd = 31, chr = 38 },
                [45] = { acc = 163, eva = 151, agi = 47, int = 36, mnd = 34, chr = 40 },
                [46] = { acc = 167, eva = 155, agi = 48, int = 36, mnd = 34, chr = 40 },
            },
            spawn_levels = { [10] = { 42, 43 }, [11] = { 42, 43 }, [33] = { 42, 43 }, [34] = { 42, 43 },
                             [35] = { 42, 43 }, [52] = { 45, 46 }, [53] = { 45, 46 }, [69] = { 45, 46 },
                             [70] = { 45, 46 }, [123] = { 42, 43 }, [124] = { 42, 43 }, [155] = { 45, 46 },
                             [156] = { 45, 46 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lost Soul blm EN',
            ids    = { 12, 13, 21, 22, 36, 37, 54, 55, 61, 62, 63, 71, 125, 126, 133, 134, 135, 157, 158, 248, 249,
                       304, 305, 306, 307 },
            levels = {
                [42] = { acc = 152, eva = 128, agi = 44, int = 51, mnd = 35, chr = 40 },
                [43] = { acc = 155, eva = 131, agi = 44, int = 53, mnd = 36, chr = 40 },
                [44] = { acc = 160, eva = 134, agi = 47, int = 54, mnd = 36, chr = 43 },
                [45] = { acc = 163, eva = 137, agi = 47, int = 55, mnd = 38, chr = 43 },
                [46] = { acc = 167, eva = 140, agi = 48, int = 55, mnd = 38, chr = 42 },
            },
            spawn_levels = { [12] = { 42, 43 }, [13] = { 42, 43 }, [36] = { 42, 43 }, [37] = { 42, 43 },
                             [54] = { 45, 46 }, [55] = { 45, 46 }, [71] = { 45, 46 }, [125] = { 42, 43 },
                             [126] = { 42, 43 }, [157] = { 45, 46 }, [158] = { 45, 46 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Shade war',
            ids    = { 17, 20, 244, 247, 300, 303 },
            levels = {
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 40 },
                [43] = { acc = 154, eva = 145, agi = 47, int = 33, mnd = 33, chr = 41 },
                [44] = { acc = 158, eva = 150, agi = 50, int = 34, mnd = 34, chr = 42 },
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 43 },
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 44 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 44 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 45 },
            },
            spawn_levels = { [17] = { 42, 46 }, [20] = { 46, 48 }, [244] = { 46, 48 }, [247] = { 46, 48 },
                             [300] = { 46, 48 }, [303] = { 46, 48 } },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Shade thf',
            ids    = { 18, 245, 301 },
            levels = {
                [46] = { acc = 168, eva = 191, agi = 56, int = 48, mnd = 34, chr = 38 },
                [47] = { acc = 172, eva = 194, agi = 56, int = 49, mnd = 35, chr = 38 },
                [48] = { acc = 175, eva = 198, agi = 58, int = 50, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Shade drk',
            ids    = { 19, 246, 302 },
            levels = {
                [46] = { acc = 165, eva = 154, agi = 46, int = 48, mnd = 34, chr = 38 },
                [47] = { acc = 168, eva = 157, agi = 48, int = 49, mnd = 35, chr = 38 },
                [48] = { acc = 172, eva = 160, agi = 48, int = 50, mnd = 35, chr = 38 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Tomb Wolf',
            ids    = { 23, 24, 25, 59, 60, 114, 115, 116, 117, 217, 218, 221, 222, 225, 226, 229, 230, 233, 234,
                       235, 236, 237, 238 },
            levels = {
                [53] = { acc = 196, eva = 184, agi = 57, int = 43, mnd = 40, chr = 51 },
                [54] = { acc = 202, eva = 190, agi = 58, int = 43, mnd = 40, chr = 52 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 41, chr = 53 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 150, item = 858 },  -- wolf hide
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lich',
            ids    = { 26, 27, 86, 89, 92, 93, 104, 105, 112, 113, 147, 148, 202, 203, 205, 206, 209, 212, 256,
                       259 },
            levels = {
                [51] = { acc = 188, eva = 158, agi = 56, int = 65, mnd = 45, chr = 50 },
                [52] = { acc = 193, eva = 163, agi = 56, int = 65, mnd = 45, chr = 50 },
                [53] = { acc = 198, eva = 167, agi = 57, int = 67, mnd = 45, chr = 52 },
                [54] = { acc = 204, eva = 173, agi = 58, int = 67, mnd = 45, chr = 52 },
                [55] = { acc = 209, eva = 177, agi = 58, int = 69, mnd = 47, chr = 52 },
            },
            spawn_levels = { [86] = { 51, 53 }, [89] = { 51, 53 }, [92] = { 51, 53 }, [93] = { 51, 53 },
                             [104] = { 51, 53 }, [105] = { 51, 53 }, [112] = { 51, 53 }, [113] = { 51, 53 },
                             [147] = { 52, 54 }, [148] = { 52, 54 }, [202] = { 52, 54 }, [203] = { 52, 54 },
                             [205] = { 52, 54 }, [206] = { 52, 54 }, [209] = { 52, 54 }, [212] = { 52, 54 },
                             [256] = { 53, 55 }, [259] = { 53, 55 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 1088 },  -- piece of ancient papyrus
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1039 },  -- eldieme chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fallen Knight EN',
            ids    = { 28, 29, 201, 204, 207, 208, 210, 211, 254, 255, 257, 258 },
            levels = {
                [54] = { acc = 204, eva = 187, agi = 52, int = 58, mnd = 36, chr = 39 },
                [55] = { acc = 209, eva = 192, agi = 52, int = 58, mnd = 37, chr = 39 },
                [56] = { acc = 215, eva = 197, agi = 55, int = 61, mnd = 38, chr = 41 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 240, item = 880 },  -- bone chip
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tomb Warrior',
            ids    = { 30, 43, 241, 242, 270, 271, 285, 286, 296, 297, 315, 316, 317, 320, 321, 324, 325 },
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 46, chr = 55 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 46, chr = 55 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1046 },  -- eldieme coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Revenant NGS EN GC',
            ids    = { 38, 64, 65, 66, 67, 68, 160, 161, 162 },
            levels = {
                [44] = { acc = 158, eva = 148, agi = 47, int = 43, mnd = 33, chr = 43 },
                [45] = { acc = 161, eva = 151, agi = 47, int = 44, mnd = 35, chr = 44 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 45, mnd = 35, chr = 44 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 45, mnd = 35, chr = 45 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tomb Mage',
            ids    = { 42, 44, 243, 272, 287, 288, 298, 299, 318, 319, 322, 323, 326, 327 },
            levels = {
                [60] = { acc = 236, eva = 202, agi = 63, int = 74, mnd = 50, chr = 57 },
                [61] = { acc = 242, eva = 208, agi = 66, int = 76, mnd = 52, chr = 60 },
                [62] = { acc = 247, eva = 213, agi = 66, int = 76, mnd = 52, chr = 60 },
                [63] = { acc = 252, eva = 217, agi = 66, int = 78, mnd = 52, chr = 60 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
                { rate = 50, item = 1046 },  -- eldieme coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Utukku EN FY',
            ids    = { 45, 46, 47, 48, 49, 119, 120, 121, 122, 180, 181, 182, 194, 195, 196 },
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 56, mnd = 43, chr = 54 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 57, mnd = 43, chr = 56 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 58, mnd = 44, chr = 56 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 10, item = 1039 },  -- eldieme chest key
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Hell Hound',
            ids    = { 56, 57, 58, 82, 83, 94, 159, 163, 164, 165, 166, 167, 168 },
            levels = {
                [46] = { acc = 165, eva = 155, agi = 48, int = 36, mnd = 34, chr = 44 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 37, mnd = 34, chr = 44 },
                [48] = { acc = 172, eva = 161, agi = 50, int = 37, mnd = 35, chr = 45 },
                [49] = { acc = 176, eva = 165, agi = 52, int = 38, mnd = 36, chr = 46 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 858 },  -- wolf hide
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Anemone',
            ids    = { 72, 131 },
            levels = {
                [45] = { acc = 164, eva = 151, agi = 47, int = 36, mnd = 34, chr = 40 },
                [46] = { acc = 168, eva = 155, agi = 48, int = 36, mnd = 34, chr = 40 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 50, item = 13368 },  -- avengers earring
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Gazer',
            ids    = { 73, 74, 75, 76, 77, 78, 79, 127, 128, 129, 130, 144 },
            levels = {
                [41] = { acc = 148, eva = 136, agi = 44, int = 54, mnd = 37, chr = 40 },
                [42] = { acc = 151, eva = 138, agi = 44, int = 54, mnd = 37, chr = 40 },
                [43] = { acc = 154, eva = 141, agi = 44, int = 56, mnd = 38, chr = 40 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 914 },  -- vial of mercury
                { rate = 240, item = 939 },  -- hecteyes eye
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Puroboros EN GC',
            ids    = { 80, 81, 132 },
            levels = {
                [42] = { acc = 152, eva = 141, agi = 44, int = 31, mnd = 33, chr = 40 },
                [43] = { acc = 155, eva = 144, agi = 44, int = 31, mnd = 33, chr = 41 },
                [44] = { acc = 160, eva = 148, agi = 47, int = 31, mnd = 34, chr = 42 },
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
            name   = 'Mummy',
            ids    = { 84, 85, 87, 88, 90, 91, 102, 103, 110, 111 },
            levels = {
                [50] = { acc = 181, eva = 169, agi = 54, int = 41, mnd = 38, chr = 45 },
                [51] = { acc = 188, eva = 174, agi = 56, int = 41, mnd = 39, chr = 47 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Blood Soul',
            ids    = { 95, 96, 97, 173, 174, 175, 187, 188, 189 },
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 51, mnd = 39, chr = 50 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 53, mnd = 41, chr = 52 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 53, mnd = 41, chr = 52 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ka war',
            ids    = { 98, 107, 169, 183, 213, 250 },
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 51 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 51 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 52 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Ka blm',
            ids    = { 99, 108, 170, 184, 214, 251 },
            levels = {
                [52] = { acc = 191, eva = 165, agi = 60, int = 65, mnd = 47, chr = 54 },
                [53] = { acc = 196, eva = 169, agi = 60, int = 67, mnd = 48, chr = 55 },
                [54] = { acc = 202, eva = 175, agi = 62, int = 67, mnd = 48, chr = 56 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Ka thf',
            ids    = { 100, 101, 109, 171, 185, 215, 252 },
            levels = {
                [52] = { acc = 195, eva = 229, agi = 63, int = 56, mnd = 38, chr = 42 },
                [53] = { acc = 201, eva = 235, agi = 64, int = 57, mnd = 39, chr = 42 },
                [54] = { acc = 206, eva = 240, agi = 65, int = 58, mnd = 39, chr = 43 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Ka rng',
            ids    = { 106, 172, 186, 216, 253 },
            levels = {
                [52] = { acc = 223, eva = 169, agi = 69, int = 47, mnd = 50, chr = 51 },
                [53] = { acc = 229, eva = 174, agi = 70, int = 48, mnd = 52, chr = 51 },
                [54] = { acc = 234, eva = 179, agi = 71, int = 48, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Cwn Cyrff',
            ids    = { 118 },
            nm     = true,
            levels = {
                [63] = { acc = 250, eva = 235, agi = 62, int = 60, mnd = 43, chr = 52 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 240, item = 17709 },  -- swan bilbo
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Spriggan war',
            ids    = { 136, 140, 273, 277, 289, 308 },
            levels = {
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 60 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 62 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 63 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1046 },  -- eldieme coffer key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Spriggan blm',
            ids    = { 137, 141, 274, 278, 290, 309 },
            levels = {
                [64] = { acc = 256, eva = 225, agi = 72, int = 79, mnd = 56, chr = 66 },
                [65] = { acc = 261, eva = 229, agi = 72, int = 80, mnd = 58, chr = 66 },
                [66] = { acc = 267, eva = 235, agi = 75, int = 80, mnd = 58, chr = 67 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1046 },  -- eldieme coffer key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Spriggan thf',
            ids    = { 138, 142, 275, 279, 291, 310 },
            levels = {
                [64] = { acc = 261, eva = 296, agi = 77, int = 68, mnd = 46, chr = 50 },
                [65] = { acc = 267, eva = 301, agi = 77, int = 68, mnd = 46, chr = 50 },
                [66] = { acc = 272, eva = 307, agi = 79, int = 70, mnd = 47, chr = 52 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1046 },  -- eldieme coffer key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Spriggan rng',
            ids    = { 139, 143, 276, 280, 292, 311 },
            levels = {
                [64] = { acc = 288, eva = 230, agi = 83, int = 56, mnd = 62, chr = 60 },
                [65] = { acc = 293, eva = 235, agi = 84, int = 58, mnd = 62, chr = 62 },
                [66] = { acc = 298, eva = 240, agi = 85, int = 58, mnd = 62, chr = 63 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1046 },  -- eldieme coffer key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Dark Stalker',
            ids    = { 176, 190, 260, 264 },
            levels = {
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 54 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 56 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 57 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1098 },  -- tavnazia bell
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Dark Stalker blm',
            ids    = { 177, 191, 261, 265 },
            levels = {
                [57] = { acc = 218, eva = 189, agi = 65, int = 71, mnd = 50, chr = 59 },
                [58] = { acc = 223, eva = 194, agi = 65, int = 71, mnd = 52, chr = 59 },
                [59] = { acc = 229, eva = 199, agi = 67, int = 74, mnd = 53, chr = 61 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1098 },  -- tavnazia bell
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Dark Stalker thf',
            ids    = { 178, 192, 262, 266 },
            levels = {
                [57] = { acc = 223, eva = 257, agi = 69, int = 61, mnd = 41, chr = 45 },
                [58] = { acc = 228, eva = 262, agi = 69, int = 61, mnd = 41, chr = 45 },
                [59] = { acc = 235, eva = 269, agi = 72, int = 63, mnd = 42, chr = 46 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1098 },  -- tavnazia bell
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Dark Stalker rng',
            ids    = { 179, 193, 263, 267 },
            levels = {
                [57] = { acc = 250, eva = 194, agi = 75, int = 50, mnd = 55, chr = 54 },
                [58] = { acc = 255, eva = 199, agi = 75, int = 52, mnd = 55, chr = 56 },
                [59] = { acc = 261, eva = 205, agi = 78, int = 53, mnd = 57, chr = 57 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1098 },  -- tavnazia bell
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Azer',
            ids    = { 197, 198, 199, 200 },
            levels = {
                [51] = { acc = 188, eva = 174, agi = 56, int = 39, mnd = 41, chr = 51 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 39, mnd = 41, chr = 51 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 40, mnd = 43, chr = 51 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 50, item = 1039 },  -- eldieme chest key
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 219, 223, 227, 231, 268 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52 },
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
            ids    = { 220, 224, 228, 232, 269 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52 },
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
            name   = 'Haunt EN',
            ids    = { 239, 240, 281, 282, 283, 284, 293, 294, 295, 312, 313, 314 },
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 63, mnd = 48, chr = 61 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 64, mnd = 48, chr = 62 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 65, mnd = 51, chr = 63 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 4788 },  -- scroll of blizzaga ii
                { rate = 50, item = 1046 },  -- eldieme coffer key
                { rate = 50, item = 4814 },  -- scroll of freeze
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Yum Kimil',
            ids    = { 328 },
            nm     = true,
            levels = {
                [54] = { acc = 204, eva = 173, agi = 58, int = 67, mnd = 45, chr = 52 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       paralyze = 4, bind = 4, silence = -2, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 11, blind = 4, stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 2,
        },
        {
            name   = 'Dog Guardian',
            ids    = { 329 },
            nm     = true,
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Owl Guardian',
            ids    = { 330 },
            nm     = true,
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Sturm',
            ids    = { 331 },
            nm     = true,
            levels = {
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 46, chr = 59 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Taifun',
            ids    = { 332 },
            levels = {
                [58] = { acc = 225, eva = 210, agi = 61, int = 40, mnd = 46, chr = 52 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Trombe',
            ids    = { 333 },
            levels = {
                [58] = { acc = 225, eva = 210, agi = 61, int = 40, mnd = 46, chr = 52 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Mimic',
            ids    = { 334 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1046 },  -- eldieme coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 335 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
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
            name   = 'Namorodo',
            ids    = { 336 },
            nm     = true,
            levels = {
                [61] = { acc = 242, eva = 208, agi = 66, int = 76, mnd = 52, chr = 60 },
                [62] = { acc = 247, eva = 213, agi = 66, int = 76, mnd = 52, chr = 60 },
                [63] = { acc = 252, eva = 217, agi = 66, int = 78, mnd = 52, chr = 60 },
                [64] = { acc = 258, eva = 223, agi = 68, int = 79, mnd = 52, chr = 62 },
                [65] = { acc = 263, eva = 227, agi = 68, int = 80, mnd = 55, chr = 62 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Gasha-1stform',
            ids    = { 339, 340, 341 },
            levels = {
                [94] = { acc = 440, eva = 401, agi = 96, int = 72, mnd = 67, chr = 80 },
                [95] = { acc = 447, eva = 406, agi = 96, int = 72, mnd = 68, chr = 81 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
