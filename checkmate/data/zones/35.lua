-- The Garden of RuHmet (zone 35).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { true_sight = { 'Qnzdei' } },
        [2] = {
            both = { 'Indoor aern blm', 'Indoor aern brd', 'Indoor aern bst', 'Indoor aern drg', 'Indoor aern drk',
                     'Indoor aern mnk', 'Indoor aern nin', 'Indoor aern pld', 'Indoor aern rdm', 'Indoor aern rng',
                     'Indoor aern sam', 'Indoor aern smn', 'Indoor aern thf', 'Indoor aern war', 'Indoor aern whm',
                     'Ixaern drk', 'Qnaern' },
        },
        [3] = { sound = { 'Aweuvhi' } },
        [4] = { superlink = { 'Ixzdei' } },
        [5] = { superlink = { 'Kfghrah blm', 'Kfghrah whm' } },
        [6] = { superlink = { 'Jailer of Fortitude', 'Kfghrah blm' } },
        [7] = { superlink = { 'Jailer of Fortitude', 'Kfghrah whm' } },
        [8] = {
            both = { 'Indoor aern blm', 'Indoor aern brd', 'Indoor aern bst', 'Indoor aern drg', 'Indoor aern drk',
                     'Indoor aern mnk', 'Indoor aern nin', 'Indoor aern pld', 'Indoor aern rdm', 'Indoor aern rng',
                     'Indoor aern sam', 'Indoor aern smn', 'Indoor aern thf', 'Indoor aern war', 'Indoor aern whm',
                     'Qnaern' },
        },
        [9] = { superlink = { 'Ixaern drgs Wynav' } },
        [10] = { superlink = { 'Ixaern drg', 'Ixaern drgs Wynav' } },
    },
    monsters = {
        {
            name   = 'Qnzdei',
            ids    = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 188, 189, 190, 191 },
            nm     = true,
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 60, mnd = 60, chr = 71 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Indoor aern blm',
            ids    = { 13, 39, 70, 196, 221, 224 },
            levels = {
                [81] = { acc = 354, eva = 310, agi = 90, int = 112, mnd = 85, chr = 91 },
                [82] = { acc = 360, eva = 315, agi = 90, int = 112, mnd = 85, chr = 91 },
                [83] = { acc = 366, eva = 319, agi = 90, int = 115, mnd = 86, chr = 92 },
                [84] = { acc = 373, eva = 325, agi = 92, int = 115, mnd = 86, chr = 94 },
            },
            spawn_levels = { [13] = { 81, 83 }, [39] = { 81, 83 }, [70] = { 81, 83 }, [196] = { 83, 84 },
                             [221] = { 83, 84 }, [224] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern thf',
            ids    = { 14, 77, 209, 223 },
            levels = {
                [81] = { acc = 360, eva = 404, agi = 96, int = 99, mnd = 72, chr = 72 },
                [82] = { acc = 366, eva = 409, agi = 96, int = 99, mnd = 72, chr = 72 },
                [83] = { acc = 373, eva = 414, agi = 96, int = 100, mnd = 73, chr = 73 },
                [84] = { acc = 380, eva = 420, agi = 98, int = 101, mnd = 73, chr = 73 },
            },
            spawn_levels = { [14] = { 81, 83 }, [77] = { 81, 83 }, [209] = { 83, 84 }, [223] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern pld',
            ids    = { 15, 84, 193, 210 },
            levels = {
                [81] = { acc = 347, eva = 321, agi = 63, int = 72, mnd = 99, chr = 99 },
                [82] = { acc = 353, eva = 326, agi = 63, int = 72, mnd = 99, chr = 99 },
                [83] = { acc = 359, eva = 331, agi = 63, int = 73, mnd = 100, chr = 100 },
                [84] = { acc = 365, eva = 337, agi = 64, int = 73, mnd = 101, chr = 101 },
            },
            spawn_levels = { [15] = { 81, 83 }, [84] = { 81, 83 }, [193] = { 83, 84 }, [210] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern sam',
            ids    = { 16, 79, 200, 215 },
            levels = {
                [81] = { acc = 354, eva = 339, agi = 82, int = 85, mnd = 85, chr = 91 },
                [82] = { acc = 360, eva = 344, agi = 82, int = 85, mnd = 85, chr = 91 },
                [83] = { acc = 366, eva = 349, agi = 82, int = 86, mnd = 86, chr = 92 },
                [84] = { acc = 373, eva = 355, agi = 85, int = 86, mnd = 86, chr = 94 },
            },
            spawn_levels = { [16] = { 81, 83 }, [79] = { 81, 83 }, [200] = { 83, 84 }, [215] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern drk',
            ids    = { 17, 91, 194, 206 },
            levels = {
                [81] = { acc = 354, eva = 331, agi = 82, int = 99, mnd = 72, chr = 72 },
                [82] = { acc = 360, eva = 336, agi = 82, int = 99, mnd = 72, chr = 72 },
                [83] = { acc = 366, eva = 341, agi = 82, int = 100, mnd = 73, chr = 73 },
                [84] = { acc = 373, eva = 347, agi = 85, int = 101, mnd = 73, chr = 73 },
            },
            spawn_levels = { [17] = { 81, 83 }, [91] = { 81, 83 }, [194] = { 83, 84 }, [206] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern rng',
            ids    = { 18, 36, 75, 201, 226 },
            levels = {
                [81] = { acc = 398, eva = 316, agi = 103, int = 85, mnd = 91, chr = 85 },
                [82] = { acc = 404, eva = 321, agi = 103, int = 85, mnd = 91, chr = 85 },
                [83] = { acc = 410, eva = 326, agi = 105, int = 86, mnd = 92, chr = 86 },
                [84] = { acc = 417, eva = 332, agi = 106, int = 86, mnd = 94, chr = 86 },
            },
            spawn_levels = { [18] = { 81, 83 }, [36] = { 81, 83 }, [75] = { 81, 83 }, [201] = { 83, 84 },
                             [226] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern nin',
            ids    = { 19, 80, 205, 225 },
            levels = {
                [81] = { acc = 357, eva = 356, agi = 96, int = 91, mnd = 72, chr = 78 },
                [82] = { acc = 363, eva = 361, agi = 96, int = 91, mnd = 72, chr = 78 },
                [83] = { acc = 369, eva = 366, agi = 96, int = 92, mnd = 73, chr = 79 },
                [84] = { acc = 376, eva = 372, agi = 98, int = 94, mnd = 73, chr = 79 },
            },
            spawn_levels = { [19] = { 81, 83 }, [80] = { 81, 83 }, [205] = { 83, 84 }, [225] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern drg',
            ids    = { 20, 86, 207 },
            levels = {
                [81] = { acc = 372, eva = 339, agi = 82, int = 78, mnd = 85, chr = 99 },
                [82] = { acc = 378, eva = 344, agi = 82, int = 78, mnd = 85, chr = 99 },
                [83] = { acc = 384, eva = 349, agi = 82, int = 79, mnd = 86, chr = 100 },
                [84] = { acc = 391, eva = 355, agi = 85, int = 79, mnd = 86, chr = 101 },
            },
            spawn_levels = { [20] = { 81, 83 }, [86] = { 81, 83 }, [207] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Wynav',
            ids    = { 21, 87, 208 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 59, mnd = 49, chr = 55 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 60, mnd = 49, chr = 55 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 60, mnd = 49, chr = 55 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 61, mnd = 50, chr = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep' },
        },
        {
            name   = 'Indoor aern mnk',
            ids    = { 22, 38, 90, 199, 213 },
            levels = {
                [81] = { acc = 357, eva = 332, agi = 69, int = 72, mnd = 91, chr = 85 },
                [82] = { acc = 363, eva = 337, agi = 69, int = 72, mnd = 91, chr = 85 },
                [83] = { acc = 369, eva = 342, agi = 69, int = 73, mnd = 92, chr = 86 },
                [84] = { acc = 376, eva = 348, agi = 70, int = 73, mnd = 94, chr = 86 },
            },
            spawn_levels = { [22] = { 81, 83 }, [38] = { 81, 83 }, [90] = { 81, 83 }, [199] = { 83, 84 },
                             [213] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern whm',
            ids    = { 23, 85, 195, 220 },
            levels = {
                [81] = { acc = 343, eva = 303, agi = 76, int = 85, mnd = 112, chr = 99 },
                [82] = { acc = 349, eva = 308, agi = 76, int = 85, mnd = 112, chr = 99 },
                [83] = { acc = 355, eva = 312, agi = 76, int = 86, mnd = 115, chr = 100 },
                [84] = { acc = 362, eva = 317, agi = 77, int = 86, mnd = 115, chr = 101 },
            },
            spawn_levels = { [23] = { 81, 83 }, [85] = { 81, 83 }, [195] = { 83, 84 }, [220] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern rdm',
            ids    = { 24, 35, 76, 192, 202, 219 },
            levels = {
                [81] = { acc = 350, eva = 319, agi = 76, int = 99, mnd = 99, chr = 91 },
                [82] = { acc = 356, eva = 324, agi = 76, int = 99, mnd = 99, chr = 91 },
                [83] = { acc = 362, eva = 329, agi = 76, int = 100, mnd = 100, chr = 92 },
                [84] = { acc = 369, eva = 333, agi = 77, int = 101, mnd = 101, chr = 94 },
            },
            spawn_levels = { [24] = { 81, 83 }, [35] = { 81, 83 }, [76] = { 81, 83 }, [192] = { 83, 84 },
                             [202] = { 83, 84 }, [219] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern brd',
            ids    = { 25, 37, 71, 197, 214 },
            levels = {
                [81] = { acc = 350, eva = 315, agi = 69, int = 91, mnd = 91, chr = 105 },
                [82] = { acc = 356, eva = 320, agi = 69, int = 91, mnd = 91, chr = 105 },
                [83] = { acc = 362, eva = 325, agi = 69, int = 92, mnd = 92, chr = 106 },
                [84] = { acc = 369, eva = 330, agi = 70, int = 94, mnd = 94, chr = 107 },
            },
            spawn_levels = { [25] = { 81, 83 }, [37] = { 81, 83 }, [71] = { 81, 83 }, [197] = { 83, 84 },
                             [214] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Awghrah',
            ids    = { 26, 27, 28, 29, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 54, 57, 60, 63, 66, 69, 74,
                       78, 83, 88, 92, 94, 97, 100, 103, 106, 107, 113, 116, 119, 122, 125, 126, 132, 135, 138, 141,
                       144, 145, 151, 154, 157, 160, 163, 164, 170, 173, 176, 179, 182, 183, 216, 217, 218, 227,
                       228, 229, 230, 231, 232, 233, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 247, 249,
                       263, 264, 265, 284, 285, 286, 305, 306, 307, 326, 327, 328, 347, 348, 349, 357, 360, 365,
                       366, 367, 368, 373, 376, 381, 382, 383, 384, 389, 392, 397, 398, 399, 400, 405, 408, 413,
                       414, 415, 416, 421, 424, 429, 430, 431, 432 },
            levels = {
                [79] = { acc = 339, eva = 324, agi = 87, int = 73, mnd = 64, chr = 71 },
                [80] = { acc = 344, eva = 329, agi = 87, int = 73, mnd = 64, chr = 71 },
                [81] = { acc = 352, eva = 335, agi = 90, int = 75, mnd = 66, chr = 73 },
                [82] = { acc = 358, eva = 340, agi = 90, int = 75, mnd = 66, chr = 73 },
            },
            spawn_levels = { [26] = { 79, 80 }, [27] = { 79, 80 }, [28] = { 79, 80 }, [29] = { 79, 80 },
                             [40] = { 79, 80 }, [41] = { 79, 80 }, [42] = { 79, 80 }, [43] = { 79, 80 },
                             [44] = { 79, 80 }, [45] = { 79, 80 }, [46] = { 79, 80 }, [47] = { 79, 80 },
                             [48] = { 79, 80 }, [49] = { 79, 80 }, [50] = { 79, 80 }, [51] = { 79, 80 },
                             [54] = { 79, 80 }, [57] = { 79, 80 }, [60] = { 79, 80 }, [63] = { 79, 80 },
                             [66] = { 79, 80 }, [69] = { 79, 80 }, [74] = { 79, 80 }, [78] = { 79, 80 },
                             [83] = { 79, 80 }, [88] = { 79, 80 }, [92] = { 79, 80 }, [94] = { 79, 80 },
                             [97] = { 79, 80 }, [100] = { 79, 80 }, [103] = { 79, 80 }, [106] = { 79, 80 },
                             [107] = { 79, 80 }, [113] = { 79, 80 }, [116] = { 79, 80 }, [119] = { 79, 80 },
                             [122] = { 79, 80 }, [125] = { 79, 80 }, [126] = { 79, 80 }, [132] = { 79, 80 },
                             [135] = { 79, 80 }, [138] = { 79, 80 }, [141] = { 79, 80 }, [144] = { 79, 80 },
                             [145] = { 79, 80 }, [151] = { 79, 80 }, [154] = { 79, 80 }, [157] = { 79, 80 },
                             [160] = { 79, 80 }, [163] = { 79, 80 }, [164] = { 79, 80 }, [170] = { 79, 80 },
                             [173] = { 79, 80 }, [176] = { 79, 80 }, [179] = { 79, 80 }, [182] = { 79, 80 },
                             [183] = { 79, 80 }, [216] = { 80, 81 }, [217] = { 80, 81 }, [218] = { 80, 81 },
                             [227] = { 80, 81 }, [228] = { 80, 81 }, [229] = { 80, 81 }, [230] = { 80, 81 },
                             [231] = { 80, 81 }, [232] = { 80, 81 }, [233] = { 80, 81 }, [236] = { 80, 81 },
                             [237] = { 80, 81 }, [238] = { 80, 81 }, [239] = { 80, 81 }, [240] = { 80, 81 },
                             [241] = { 80, 81 }, [242] = { 80, 81 }, [243] = { 80, 81 }, [244] = { 80, 81 },
                             [245] = { 80, 81 }, [247] = { 80, 81 }, [249] = { 80, 81 }, [263] = { 80, 81 },
                             [264] = { 80, 81 }, [265] = { 80, 81 }, [284] = { 80, 81 }, [285] = { 80, 81 },
                             [286] = { 80, 81 }, [305] = { 80, 81 }, [306] = { 80, 81 }, [307] = { 80, 81 },
                             [326] = { 80, 81 }, [327] = { 80, 81 }, [328] = { 80, 81 }, [347] = { 80, 81 },
                             [348] = { 80, 81 }, [349] = { 80, 81 }, [357] = { 81, 82 }, [360] = { 81, 82 },
                             [365] = { 81, 82 }, [366] = { 81, 82 }, [367] = { 81, 82 }, [368] = { 81, 82 },
                             [373] = { 81, 82 }, [376] = { 81, 82 }, [381] = { 81, 82 }, [382] = { 81, 82 },
                             [383] = { 81, 82 }, [384] = { 81, 82 }, [389] = { 81, 82 }, [392] = { 81, 82 },
                             [397] = { 81, 82 }, [398] = { 81, 82 }, [399] = { 81, 82 }, [400] = { 81, 82 },
                             [405] = { 81, 82 }, [408] = { 81, 82 }, [413] = { 81, 82 }, [414] = { 81, 82 },
                             [415] = { 81, 82 }, [416] = { 81, 82 }, [421] = { 81, 82 }, [424] = { 81, 82 },
                             [429] = { 81, 82 }, [430] = { 81, 82 }, [431] = { 81, 82 }, [432] = { 81, 82 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1819 },  -- luminion chip
                { rate = 10, item = 1872 },  -- ghrah m chip
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
            name   = 'Indoor aern bst',
            ids    = { 30, 81, 203 },
            levels = {
                [81] = { acc = 354, eva = 324, agi = 69, int = 85, mnd = 85, chr = 112 },
                [82] = { acc = 360, eva = 329, agi = 69, int = 85, mnd = 85, chr = 112 },
                [83] = { acc = 366, eva = 334, agi = 69, int = 86, mnd = 86, chr = 115 },
                [84] = { acc = 373, eva = 340, agi = 70, int = 86, mnd = 86, chr = 115 },
            },
            spawn_levels = { [30] = { 81, 83 }, [81] = { 81, 83 }, [203] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Euvhi',
            ids    = { 31, 82, 204 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 70 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 70 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 53, mnd = 53, chr = 71 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 72 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            links  = 3,
        },
        {
            name   = 'Indoor aern war',
            ids    = { 32, 89, 198, 222 },
            levels = {
                [81] = { acc = 354, eva = 335, agi = 90, int = 78, mnd = 78, chr = 85 },
                [82] = { acc = 360, eva = 340, agi = 90, int = 78, mnd = 78, chr = 85 },
                [83] = { acc = 366, eva = 345, agi = 90, int = 79, mnd = 79, chr = 86 },
                [84] = { acc = 373, eva = 351, agi = 92, int = 79, mnd = 79, chr = 86 },
            },
            spawn_levels = { [32] = { 81, 83 }, [89] = { 81, 83 }, [198] = { 83, 84 }, [222] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Indoor aern smn',
            ids    = { 33, 72, 211 },
            levels = {
                [81] = { acc = 347, eva = 306, agi = 82, int = 105, mnd = 105, chr = 105 },
                [82] = { acc = 353, eva = 311, agi = 82, int = 105, mnd = 105, chr = 105 },
                [83] = { acc = 359, eva = 315, agi = 82, int = 106, mnd = 106, chr = 106 },
                [84] = { acc = 365, eva = 321, agi = 85, int = 107, mnd = 107, chr = 107 },
            },
            spawn_levels = { [33] = { 81, 83 }, [72] = { 81, 83 }, [211] = { 83, 84 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 1786 },  -- aern organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Elemental',
            ids    = { 34, 73, 212 },
            levels = {
                [65] = { acc = 260, eva = 244, agi = 61, int = 68, mnd = 53, chr = 51 },
                [66] = { acc = 265, eva = 248, agi = 61, int = 70, mnd = 55, chr = 52 },
                [67] = { acc = 270, eva = 254, agi = 63, int = 71, mnd = 56, chr = 54 },
                [68] = { acc = 275, eva = 259, agi = 63, int = 71, mnd = 56, chr = 54 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
        },
        {
            name   = 'Aweuvhi',
            ids    = { 52, 55, 58, 61, 64, 67, 95, 98, 101, 104, 114, 117, 120, 123, 133, 136, 139, 142, 152, 155,
                       158, 161, 171, 174, 177, 180, 246, 248, 251, 254, 257, 260, 270, 272, 275, 278, 281, 291,
                       293, 296, 299, 302, 312, 314, 317, 320, 323, 333, 335, 338, 341, 344, 354 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 82 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 61, chr = 83 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 61, chr = 83 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 64, mnd = 64, chr = 85 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 64, mnd = 64, chr = 85 },
            },
            spawn_levels = { [52] = { 80, 82 }, [55] = { 80, 82 }, [58] = { 80, 82 }, [61] = { 80, 80 },
                             [64] = { 80, 82 }, [67] = { 80, 82 }, [95] = { 80, 82 }, [98] = { 80, 82 },
                             [101] = { 80, 82 }, [104] = { 80, 82 }, [114] = { 80, 82 }, [117] = { 80, 82 },
                             [120] = { 80, 82 }, [123] = { 80, 82 }, [133] = { 80, 82 }, [136] = { 80, 82 },
                             [139] = { 80, 82 }, [142] = { 80, 82 }, [152] = { 80, 82 }, [155] = { 80, 82 },
                             [158] = { 80, 82 }, [161] = { 80, 82 }, [171] = { 80, 82 }, [174] = { 80, 82 },
                             [177] = { 80, 82 }, [180] = { 80, 82 }, [246] = { 80, 82 }, [248] = { 80, 82 },
                             [251] = { 80, 82 }, [254] = { 78, 80 }, [257] = { 78, 80 }, [260] = { 78, 80 },
                             [270] = { 80, 82 }, [272] = { 80, 82 }, [275] = { 80, 82 }, [278] = { 80, 82 },
                             [281] = { 80, 82 }, [291] = { 80, 82 }, [293] = { 78, 80 }, [296] = { 78, 80 },
                             [299] = { 78, 80 }, [302] = { 78, 80 }, [312] = { 80, 82 }, [314] = { 80, 82 },
                             [317] = { 80, 82 }, [320] = { 80, 82 }, [323] = { 80, 82 }, [333] = { 80, 82 },
                             [335] = { 80, 82 }, [338] = { 80, 82 }, [341] = { 80, 82 }, [344] = { 80, 82 },
                             [354] = { 80, 82 } },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1818 },  -- euvhi organ
                { rate = 50, item = 1899 },  -- high-quality euvhi organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
        },
        {
            name   = 'Aweuvhi',
            ids    = { 53, 56, 59, 62, 65, 68, 96, 99, 102, 105, 115, 118, 121, 124, 134, 137, 140, 143, 153, 156,
                       159, 162, 172, 175, 178, 181, 252, 253, 255, 256, 258, 259, 261, 262, 273, 274, 276, 277,
                       279, 280, 282, 283, 294, 295, 297, 298, 300, 301, 303, 304, 315, 316, 318, 319, 321, 322,
                       324, 325, 336, 337, 339, 340, 342, 343, 345, 346 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 82 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 61, chr = 83 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 61, chr = 83 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 64, mnd = 64, chr = 85 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 64, mnd = 64, chr = 85 },
            },
            spawn_levels = { [53] = { 78, 80 }, [56] = { 78, 80 }, [59] = { 78, 80 }, [62] = { 78, 80 },
                             [65] = { 78, 80 }, [68] = { 78, 80 }, [96] = { 78, 80 }, [99] = { 80, 82 },
                             [102] = { 80, 82 }, [105] = { 80, 82 }, [115] = { 78, 80 }, [118] = { 78, 80 },
                             [121] = { 78, 80 }, [124] = { 78, 80 }, [134] = { 78, 80 }, [137] = { 78, 80 },
                             [140] = { 78, 80 }, [143] = { 78, 80 }, [153] = { 78, 80 }, [156] = { 80, 82 },
                             [159] = { 80, 82 }, [162] = { 78, 80 }, [172] = { 80, 82 }, [175] = { 80, 82 },
                             [178] = { 80, 82 }, [181] = { 78, 80 }, [252] = { 80, 82 }, [253] = { 80, 82 },
                             [255] = { 78, 80 }, [256] = { 80, 82 }, [258] = { 78, 80 }, [259] = { 80, 82 },
                             [261] = { 78, 80 }, [262] = { 80, 82 }, [273] = { 80, 82 }, [274] = { 80, 82 },
                             [276] = { 80, 82 }, [277] = { 80, 82 }, [279] = { 80, 82 }, [280] = { 80, 82 },
                             [282] = { 80, 82 }, [283] = { 80, 82 }, [294] = { 78, 80 }, [295] = { 80, 82 },
                             [297] = { 78, 80 }, [298] = { 80, 82 }, [300] = { 78, 80 }, [301] = { 80, 82 },
                             [303] = { 80, 82 }, [304] = { 80, 82 }, [315] = { 80, 82 }, [316] = { 80, 82 },
                             [318] = { 80, 82 }, [319] = { 80, 82 }, [321] = { 80, 82 }, [322] = { 80, 82 },
                             [324] = { 80, 82 }, [325] = { 80, 82 }, [336] = { 80, 82 }, [337] = { 80, 82 },
                             [339] = { 80, 82 }, [340] = { 80, 82 }, [342] = { 80, 82 }, [343] = { 80, 82 },
                             [345] = { 80, 82 }, [346] = { 80, 82 } },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1818 },  -- euvhi organ
                { rate = 50, item = 1899 },  -- high-quality euvhi organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
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
            links  = 3,
        },
        {
            name   = 'Awzdei',
            ids    = { 93, 112, 131, 150, 169, 362, 364, 378, 380, 394, 396, 410, 412, 426, 428 },
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
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
            name   = 'Awzdei',
            ids    = { 108, 110, 127, 129, 146, 148, 165, 167, 184, 186, 266, 268, 287, 289, 308, 310, 329, 331,
                       350, 352, 369, 385, 401, 417, 433 },
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
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
            name   = 'Awzdei',
            ids    = { 109, 111, 128, 130, 147, 149, 166, 168, 185, 187, 267, 269, 288, 290, 309, 311, 330, 332,
                       351, 353, 370, 386, 402, 418, 434 },
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
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
            name   = 'Awzdei',
            ids    = { 234 },
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
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
            name   = 'Awzdei',
            ids    = { 235, 250, 271, 292, 313, 334, 361, 363, 377, 379, 393, 395, 409, 411, 425, 427 },
            levels = {
                [80] = { acc = 338, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
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
            name   = 'Awzdei',
            ids    = { 355, 356, 358, 359, 371, 372, 374, 375, 387, 388, 390, 391, 403, 404, 406, 407, 419, 420,
                       422, 423 },
            levels = {
                [83] = { acc = 357, eva = 329, agi = 58, int = 58, mnd = 85, chr = 90 },
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
            name   = 'Ixzdei',
            ids    = { 435, 436 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 303, agi = 72, int = 84, mnd = 76, chr = 77 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Ixzdei',
            ids    = { 437, 438 },
            nm     = true,
            levels = {
                [78] = { acc = 333, eva = 292, agi = 80, int = 93, mnd = 68, chr = 77 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Jailer of Fortitude',
            ids    = { 439 },
            nm     = true,
            levels = {
                [85] = { acc = 370, eva = 342, agi = 64, int = 59, mnd = 87, chr = 87 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'blind', 'petrify',
                       'plague' },
            drops  = {
                { rate = 1000, item = 1853 },  -- second virtue
                { rate = 1000, item = 18222 },  -- fortitude axe
                { rate = 100, item = 15511 },  -- fortitude torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Kfghrah whm',
            ids    = { 440 },
            nm     = true,
            levels = {
                [80] = { acc = 341, eva = 327, agi = 83, int = 64, mnd = 73, chr = 73 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'paralyze', 'petrify', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Kfghrah blm',
            ids    = { 441 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 329, agi = 87, int = 73, mnd = 64, chr = 71 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'paralyze', 'petrify', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Ixaern drk',
            ids    = { 442 },
            nm     = true,
            levels = {
                [82] = { acc = 360, eva = 336, agi = 82, int = 99, mnd = 72, chr = 72 },
                [83] = { acc = 366, eva = 341, agi = 82, int = 100, mnd = 73, chr = 73 },
                [84] = { acc = 373, eva = 347, agi = 85, int = 101, mnd = 73, chr = 73 },
                [85] = { acc = 379, eva = 352, agi = 85, int = 102, mnd = 74, chr = 74 },
                [86] = { acc = 386, eva = 357, agi = 86, int = 104, mnd = 75, chr = 75 },
                [87] = { acc = 392, eva = 362, agi = 87, int = 105, mnd = 76, chr = 76 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow',
                       'elegy', 'blind', 'terror' },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1854, 8500 },  -- deed of moderation
                    { 1902, 1500 },  -- vice of avarice
                } },
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 8,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Qnaern rng',
            ids    = { 443, 444 },
            levels = {
                [80] = { acc = 391, eva = 311, agi = 101, int = 83, mnd = 89, chr = 83 },
                [81] = { acc = 398, eva = 316, agi = 103, int = 85, mnd = 91, chr = 85 },
                [82] = { acc = 404, eva = 321, agi = 103, int = 85, mnd = 91, chr = 85 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'bind' },
            links  = 2,
        },
        {
            name   = 'Jailer of Faith',
            ids    = { 445 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 353, agi = 87, int = 90, mnd = 71, chr = 93 },
            },
            ranks  = { fire = -3, ice = -1, wind = -1, earth = -1, thunder = -1, water = 3, light = 3, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = 3,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'silence', 'stun', 'paralyze', 'slow', 'elegy',
                       'poison', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1856 },  -- third virtue
                { rate = 1000, item = 18360 },  -- faith baghnakhs
                { rate = 100, item = 15512 },  -- faith torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Ixaern drg',
            ids    = { 446 },
            nm     = true,
            levels = {
                [82] = { acc = 378, eva = 344, agi = 82, int = 78, mnd = 85, chr = 99 },
                [83] = { acc = 384, eva = 349, agi = 82, int = 79, mnd = 86, chr = 100 },
                [84] = { acc = 391, eva = 355, agi = 85, int = 79, mnd = 86, chr = 101 },
                [85] = { acc = 397, eva = 360, agi = 85, int = 81, mnd = 89, chr = 102 },
                [86] = { acc = 404, eva = 366, agi = 86, int = 81, mnd = 89, chr = 104 },
                [87] = { acc = 410, eva = 371, agi = 87, int = 82, mnd = 90, chr = 105 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun', 'terror' },
            drops  = {
                { rate = 1000, group = {  -- one of
                    { 1870, 8500 },  -- deed of sensibility
                    { 1903, 1500 },  -- vice of aspersion
                } },
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 9,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ixaern drgs Wynav',
            ids    = { 447, 448, 449 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 309, agi = 67, int = 77, mnd = 65, chr = 77 },
                [79] = { acc = 337, eva = 315, agi = 68, int = 79, mnd = 66, chr = 78 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind' },
            links  = 10,
        },
    },
    by_name = {},
}
