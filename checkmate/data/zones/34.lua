-- Grand Palace of HuXzoi (zone 34).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Eoeuvhi' },
        [2] = { 'Indoor aern blm', 'Indoor aern brd', 'Indoor aern bst', 'Indoor aern drg', 'Indoor aern drk',
                'Indoor aern mnk', 'Indoor aern nin', 'Indoor aern pld', 'Indoor aern rdm', 'Indoor aern rng',
                'Indoor aern sam', 'Indoor aern smn', 'Indoor aern thf', 'Indoor aern war', 'Indoor aern whm' },
        [3] = { 'Qnaern' },
        [4] = { 'Ixaern mnk', 'Qnaern' },
    },
    monsters = {
        {
            name   = 'Eoghrah',
            ids    = { 1, 3, 4, 6, 14, 15, 16, 17, 18, 20, 21, 23, 32, 33, 34, 36, 37, 39, 48, 49, 51, 53, 54, 56,
                       64, 65, 67, 69, 70, 72, 81, 82, 92, 103, 112, 130, 140, 153, 171, 172, 173, 174, 176, 177,
                       184, 185, 186, 187, 189, 190, 191, 192, 194, 195, 201, 202, 204, 205, 206, 207, 209, 210,
                       217, 218, 221, 222, 223, 224, 226, 227, 233, 234, 237, 238, 239, 240, 242, 243, 249, 250,
                       258, 259, 271, 274, 285, 286, 291, 292, 293, 304, 307, 318, 319 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 69, mnd = 60, chr = 67 },
                [76] = { acc = 323, eva = 308, agi = 85, int = 70, mnd = 61, chr = 68 },
                [77] = { acc = 328, eva = 313, agi = 85, int = 71, mnd = 62, chr = 68 },
            },
            spawn_levels = { [3] = { 76, 76 }, [4] = { 76, 76 }, [6] = { 75, 75 }, [20] = { 77, 77 },
                             [21] = { 77, 77 }, [67] = { 75, 75 }, [69] = { 75, 75 }, [70] = { 77, 77 },
                             [72] = { 77, 77 }, [81] = { 75, 75 }, [82] = { 75, 75 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
                { rate = 50, item = 1872 },  -- ghrah m chip
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            aggro_note = 'form',
            flags  = { scripted_stats = true, scripted_elements = true },
        },
        {
            name   = 'Eozdei',
            ids    = { 2, 7, 19, 24, 35, 40, 52, 57, 68, 73, 175, 188, 208, 225, 241 },
            levels = {
                [77] = { acc = 321, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85 },
                [78] = { acc = 327, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Eozdei',
            ids    = { 5, 8, 22, 25, 38, 41, 55, 58, 71, 74, 170, 193, 203, 220, 236 },
            levels = {
                [77] = { acc = 321, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85 },
                [78] = { acc = 327, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Eozdei',
            ids    = { 9, 28, 45, 61, 80, 100, 101, 120, 121, 128, 129, 149, 150, 168, 169, 178, 198, 214, 230, 248,
                       267, 284, 300, 317 },
            levels = {
                [77] = { acc = 321, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85 },
                [78] = { acc = 327, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85 },
            },
            spawn_levels = { [284] = { 78, 78 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Eoeuvhi',
            ids    = { 10, 11, 12, 13, 26, 27, 29, 30, 42, 43, 44, 46, 47, 59, 60, 62, 63, 75, 76, 78, 79, 90, 91,
                       102, 111, 139, 179, 180, 181, 182, 183, 196, 197, 199, 200, 211, 212, 213, 215, 216, 219,
                       228, 229, 231, 232, 244, 245, 246, 247, 269, 270, 272, 273, 287, 288, 289, 290, 302, 303,
                       305, 306 },
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 77 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 79 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 79 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 80 },
            },
            spawn_levels = { [10] = { 75, 77 }, [11] = { 75, 77 }, [12] = { 75, 77 }, [13] = { 75, 77 },
                             [26] = { 75, 77 }, [27] = { 75, 77 }, [29] = { 75, 77 }, [30] = { 76, 76 },
                             [42] = { 74, 76 }, [43] = { 75, 77 }, [44] = { 75, 77 }, [46] = { 75, 76 },
                             [47] = { 75, 77 }, [59] = { 75, 77 }, [60] = { 75, 77 }, [62] = { 75, 77 },
                             [63] = { 75, 77 }, [75] = { 75, 77 }, [76] = { 75, 77 }, [78] = { 75, 77 },
                             [79] = { 75, 77 }, [90] = { 75, 77 }, [91] = { 74, 76 }, [102] = { 74, 76 },
                             [111] = { 74, 76 }, [139] = { 74, 76 }, [179] = { 75, 77 }, [180] = { 75, 77 },
                             [181] = { 74, 76 }, [182] = { 75, 77 }, [196] = { 75, 77 }, [197] = { 75, 77 },
                             [199] = { 75, 77 }, [200] = { 75, 77 }, [211] = { 75, 77 }, [212] = { 75, 77 },
                             [213] = { 75, 77 }, [215] = { 75, 77 }, [216] = { 76, 76 }, [219] = { 75, 77 },
                             [228] = { 75, 77 }, [229] = { 75, 77 }, [231] = { 75, 77 }, [232] = { 75, 77 },
                             [244] = { 75, 77 }, [245] = { 75, 77 }, [246] = { 75, 77 }, [247] = { 75, 77 },
                             [269] = { 76, 76 }, [270] = { 74, 76 }, [272] = { 75, 76 }, [273] = { 74, 76 },
                             [287] = { 75, 76 }, [288] = { 74, 76 }, [289] = { 76, 76 }, [290] = { 74, 74 },
                             [302] = { 74, 76 }, [303] = { 74, 76 }, [305] = { 74, 76 }, [306] = { 74, 76 } },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, item = 1818 },  -- euvhi organ
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
        },
        {
            name   = 'Eoeuvhi',
            ids    = { 31, 50, 66, 77, 131, 151, 152, 235, 268, 275, 301, 308 },
            levels = {
                [74] = { acc = 312, eva = 295, agi = 77, int = 58, mnd = 58, chr = 77 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 58, chr = 79 },
                [76] = { acc = 323, eva = 306, agi = 80, int = 59, mnd = 59, chr = 79 },
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 80 },
            },
            spawn_levels = { [31] = { 74, 76 }, [50] = { 74, 76 }, [66] = { 74, 76 }, [77] = { 74, 76 },
                             [131] = { 75, 77 }, [151] = { 74, 76 }, [152] = { 75, 77 }, [235] = { 76, 76 },
                             [268] = { 74, 76 }, [275] = { 74, 76 }, [301] = { 74, 76 }, [308] = { 74, 76 } },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, item = 1818 },  -- euvhi organ
                { rate = 50, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 1,
        },
        {
            name   = 'Indoor aern war',
            ids    = { 83, 113, 132, 251, 252, 276, 309 },
            levels = {
                [79] = { acc = 341, eva = 324, agi = 87, int = 75, mnd = 75, chr = 83 },
                [80] = { acc = 346, eva = 329, agi = 87, int = 75, mnd = 75, chr = 83 },
                [81] = { acc = 354, eva = 335, agi = 90, int = 78, mnd = 78, chr = 85 },
                [82] = { acc = 360, eva = 340, agi = 90, int = 78, mnd = 78, chr = 85 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern mnk',
            ids    = { 84, 85, 141, 154, 253, 320, 321 },
            levels = {
                [79] = { acc = 344, eva = 322, agi = 66, int = 69, mnd = 89, chr = 83 },
                [80] = { acc = 349, eva = 327, agi = 66, int = 69, mnd = 89, chr = 83 },
                [81] = { acc = 357, eva = 332, agi = 69, int = 72, mnd = 91, chr = 85 },
                [82] = { acc = 363, eva = 337, agi = 69, int = 72, mnd = 91, chr = 85 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern blm',
            ids    = { 86, 123, 124, 161, 254, 295, 327 },
            levels = {
                [79] = { acc = 341, eva = 299, agi = 87, int = 110, mnd = 83, chr = 89 },
                [80] = { acc = 346, eva = 304, agi = 87, int = 110, mnd = 83, chr = 89 },
                [81] = { acc = 354, eva = 310, agi = 90, int = 112, mnd = 85, chr = 91 },
                [82] = { acc = 360, eva = 315, agi = 90, int = 112, mnd = 85, chr = 91 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern rdm',
            ids    = { 87, 142, 143, 155, 255, 322 },
            levels = {
                [79] = { acc = 338, eva = 309, agi = 74, int = 96, mnd = 96, chr = 89 },
                [80] = { acc = 343, eva = 314, agi = 74, int = 96, mnd = 96, chr = 89 },
                [81] = { acc = 350, eva = 319, agi = 76, int = 99, mnd = 99, chr = 91 },
                [82] = { acc = 356, eva = 324, agi = 76, int = 99, mnd = 99, chr = 91 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern smn',
            ids    = { 88, 137, 146, 256, 313, 314 },
            levels = {
                [79] = { acc = 335, eva = 296, agi = 80, int = 102, mnd = 102, chr = 102 },
                [80] = { acc = 340, eva = 301, agi = 80, int = 102, mnd = 102, chr = 102 },
                [81] = { acc = 347, eva = 306, agi = 82, int = 105, mnd = 105, chr = 105 },
                [82] = { acc = 353, eva = 311, agi = 82, int = 105, mnd = 105, chr = 105 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Elemental',
            ids    = { 89, 138, 148, 257, 315, 316 },
            levels = {
                [63] = { acc = 249, eva = 233, agi = 58, int = 66, mnd = 52, chr = 50 },
                [64] = { acc = 255, eva = 239, agi = 60, int = 68, mnd = 53, chr = 51 },
                [65] = { acc = 260, eva = 244, agi = 61, int = 68, mnd = 53, chr = 51 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
        },
        {
            name   = 'Indoor aern thf',
            ids    = { 93, 135, 144, 260, 261, 311 },
            levels = {
                [79] = { acc = 348, eva = 392, agi = 93, int = 96, mnd = 69, chr = 69 },
                [80] = { acc = 353, eva = 397, agi = 93, int = 96, mnd = 69, chr = 69 },
                [81] = { acc = 360, eva = 404, agi = 96, int = 99, mnd = 72, chr = 72 },
                [82] = { acc = 366, eva = 409, agi = 96, int = 99, mnd = 72, chr = 72 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern pld',
            ids    = { 94, 105, 114, 162, 163, 262, 277, 328 },
            levels = {
                [79] = { acc = 335, eva = 311, agi = 60, int = 69, mnd = 96, chr = 96 },
                [80] = { acc = 340, eva = 316, agi = 60, int = 69, mnd = 96, chr = 96 },
                [81] = { acc = 347, eva = 321, agi = 63, int = 72, mnd = 99, chr = 99 },
                [82] = { acc = 353, eva = 326, agi = 63, int = 72, mnd = 99, chr = 99 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern rng',
            ids    = { 95, 96, 126, 158, 263, 298, 324 },
            levels = {
                [79] = { acc = 386, eva = 306, agi = 101, int = 83, mnd = 89, chr = 83 },
                [80] = { acc = 391, eva = 311, agi = 101, int = 83, mnd = 89, chr = 83 },
                [81] = { acc = 398, eva = 316, agi = 103, int = 85, mnd = 91, chr = 85 },
                [82] = { acc = 404, eva = 321, agi = 103, int = 85, mnd = 91, chr = 85 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern nin',
            ids    = { 97, 116, 117, 166, 264, 279, 331 },
            levels = {
                [79] = { acc = 344, eva = 344, agi = 93, int = 89, mnd = 69, chr = 75 },
                [80] = { acc = 349, eva = 349, agi = 93, int = 89, mnd = 69, chr = 75 },
                [81] = { acc = 357, eva = 356, agi = 96, int = 91, mnd = 72, chr = 78 },
                [82] = { acc = 363, eva = 361, agi = 96, int = 91, mnd = 72, chr = 78 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern drg',
            ids    = { 98, 118, 159, 265, 280, 281, 325 },
            levels = {
                [79] = { acc = 360, eva = 329, agi = 80, int = 75, mnd = 83, chr = 96 },
                [80] = { acc = 365, eva = 334, agi = 80, int = 75, mnd = 83, chr = 96 },
                [81] = { acc = 372, eva = 339, agi = 82, int = 78, mnd = 85, chr = 99 },
                [82] = { acc = 378, eva = 344, agi = 82, int = 78, mnd = 85, chr = 99 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Wynav',
            ids    = { 99, 119, 160, 266, 282, 283, 326 },
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 56, mnd = 46, chr = 52 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 57, mnd = 46, chr = 52 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 59, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep' },
        },
        {
            name   = 'Indoor aern whm',
            ids    = { 104, 122, 133, 134, 294, 310 },
            levels = {
                [79] = { acc = 331, eva = 293, agi = 74, int = 83, mnd = 110, chr = 96 },
                [80] = { acc = 336, eva = 298, agi = 74, int = 83, mnd = 110, chr = 96 },
                [81] = { acc = 343, eva = 303, agi = 76, int = 85, mnd = 112, chr = 99 },
                [82] = { acc = 349, eva = 308, agi = 76, int = 85, mnd = 112, chr = 99 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern bst',
            ids    = { 106, 145, 164, 329 },
            levels = {
                [79] = { acc = 341, eva = 314, agi = 66, int = 83, mnd = 83, chr = 110 },
                [80] = { acc = 346, eva = 319, agi = 66, int = 83, mnd = 83, chr = 110 },
                [81] = { acc = 354, eva = 324, agi = 69, int = 85, mnd = 85, chr = 112 },
                [82] = { acc = 360, eva = 329, agi = 69, int = 85, mnd = 85, chr = 112 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern brd',
            ids    = { 107, 115, 156, 157, 278, 323 },
            levels = {
                [79] = { acc = 338, eva = 305, agi = 66, int = 89, mnd = 89, chr = 102 },
                [80] = { acc = 343, eva = 310, agi = 66, int = 89, mnd = 89, chr = 102 },
                [81] = { acc = 350, eva = 315, agi = 69, int = 91, mnd = 91, chr = 105 },
                [82] = { acc = 356, eva = 320, agi = 69, int = 91, mnd = 91, chr = 105 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern sam',
            ids    = { 108, 109, 127, 165, 299, 330 },
            levels = {
                [79] = { acc = 341, eva = 329, agi = 80, int = 83, mnd = 83, chr = 89 },
                [80] = { acc = 346, eva = 334, agi = 80, int = 83, mnd = 83, chr = 89 },
                [81] = { acc = 354, eva = 339, agi = 82, int = 85, mnd = 85, chr = 91 },
                [82] = { acc = 360, eva = 344, agi = 82, int = 85, mnd = 85, chr = 91 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Euvhi',
            ids    = { 110, 147, 167, 332 },
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 67 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 67 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 70 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            links  = 1,
        },
        {
            name   = 'Indoor aern drk',
            ids    = { 125, 136, 296, 297, 312 },
            levels = {
                [79] = { acc = 341, eva = 321, agi = 80, int = 96, mnd = 69, chr = 69 },
                [80] = { acc = 346, eva = 326, agi = 80, int = 96, mnd = 69, chr = 69 },
                [81] = { acc = 354, eva = 331, agi = 82, int = 99, mnd = 72, chr = 72 },
                [82] = { acc = 360, eva = 336, agi = 82, int = 99, mnd = 72, chr = 72 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1900 },  -- high-quality aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, group = {  -- one of
                    { 4104, 1 },  -- fire cluster
                    { 4105, 1 },  -- ice cluster
                    { 4106, 1 },  -- wind cluster
                    { 4107, 1 },  -- earth cluster
                    { 4108, 1 },  -- lightning cluster
                    { 4109, 1 },  -- water cluster
                    { 4110, 1 },  -- light cluster
                    { 4111, 1 },  -- dark cluster
                } },
            },
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ixghrah',
            ids    = { 333 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 328, eva = 313, agi = 85, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Jailer of Temperance',
            ids    = { 334 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 368, agi = 80, int = 74, mnd = 74, chr = 85 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'stun', 'paralyze', 'slow', 'elegy', 'blind', 'petrify',
                       'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1850 },  -- first virtue
                { rate = 1000, item = 17948 },  -- temperance axe
                { rate = 100, item = 15513 },  -- temperance torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true, scripted_elements = true },
        },
        {
            name   = 'Ixaern mnk',
            ids    = { 335 },
            nm     = true,
            levels = {
                [83] = { acc = 369, eva = 342, agi = 69, int = 73, mnd = 92, chr = 86 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun', 'paralyze', 'blind', 'terror' },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 3,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Qnaern rdm',
            ids    = { 336 },
            nm     = true,
            levels = {
                [80] = { acc = 343, eva = 314, agi = 74, int = 96, mnd = 96, chr = 89 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'terror' },
            links  = 4,
        },
        {
            name   = 'Qnaern whm',
            ids    = { 337 },
            nm     = true,
            levels = {
                [80] = { acc = 336, eva = 298, agi = 74, int = 83, mnd = 110, chr = 96 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'terror' },
            links  = 4,
        },
    },
    by_name = {},
}
