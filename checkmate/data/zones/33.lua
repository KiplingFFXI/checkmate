-- AlTaieu (zone 33).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            both = { 'Absolute Virtue', 'Omaern', 'Omaern bst', 'Omaern drg', 'Omaern smn', 'Ulaern' },
            true_both = { 'Ruaern' },
        },
        [2] = { true_sound = { 'Jailer of Prudence', 'Omhpemde', 'Ulhpemde' } },
        [3] = { sight = { 'Aerns Wynav' } },
        [4] = { sight = { 'Omxzomit' } },
        [5] = { superlink = { 'Qnxzomit' } },
        [6] = { superlink = { 'Jailer of Justice', 'Qnxzomit' } },
        [7] = { superlink = { 'Qnhpemde', 'Qnxzomit', 'Ruphuabo' } },
        [8] = { superlink = { 'Jailer of Love', 'Qnhpemde', 'Qnxzomit', 'Ruphuabo' } },
        [9] = { both = { 'Omaern', 'Omaern bst', 'Omaern drg', 'Omaern smn', 'Ulaern' }, true_both = { 'Ruaern' } },
    },
    monsters = {
        {
            name   = 'Ulaern war',
            ids    = { 1, 2 },
            levels = {
                [70] = { acc = 291, eva = 276, agi = 77, int = 67, mnd = 67, chr = 73 },
                [71] = { acc = 297, eva = 282, agi = 80, int = 68, mnd = 68, chr = 76 },
                [72] = { acc = 302, eva = 287, agi = 80, int = 68, mnd = 68, chr = 76 },
                [73] = { acc = 308, eva = 292, agi = 80, int = 71, mnd = 71, chr = 77 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern whm',
            ids    = { 3 },
            levels = {
                [70] = { acc = 282, eva = 248, agi = 65, int = 73, mnd = 97, chr = 85 },
                [71] = { acc = 287, eva = 254, agi = 68, int = 76, mnd = 100, chr = 88 },
                [72] = { acc = 292, eva = 259, agi = 68, int = 76, mnd = 100, chr = 88 },
                [73] = { acc = 299, eva = 263, agi = 68, int = 77, mnd = 102, chr = 89 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern blm',
            ids    = { 4 },
            levels = {
                [70] = { acc = 291, eva = 254, agi = 77, int = 97, mnd = 73, chr = 79 },
                [71] = { acc = 297, eva = 260, agi = 80, int = 100, mnd = 76, chr = 80 },
                [72] = { acc = 302, eva = 265, agi = 80, int = 100, mnd = 76, chr = 80 },
                [73] = { acc = 308, eva = 269, agi = 80, int = 102, mnd = 77, chr = 83 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern rdm',
            ids    = { 5 },
            levels = {
                [70] = { acc = 288, eva = 262, agi = 65, int = 85, mnd = 85, chr = 79 },
                [71] = { acc = 293, eva = 268, agi = 68, int = 88, mnd = 88, chr = 80 },
                [72] = { acc = 298, eva = 273, agi = 68, int = 88, mnd = 88, chr = 80 },
                [73] = { acc = 305, eva = 278, agi = 68, int = 89, mnd = 89, chr = 83 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern brd',
            ids    = { 6 },
            levels = {
                [70] = { acc = 288, eva = 259, agi = 59, int = 79, mnd = 79, chr = 91 },
                [71] = { acc = 293, eva = 264, agi = 60, int = 80, mnd = 80, chr = 92 },
                [72] = { acc = 298, eva = 269, agi = 60, int = 80, mnd = 80, chr = 92 },
                [73] = { acc = 305, eva = 275, agi = 62, int = 83, mnd = 83, chr = 95 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern rng',
            ids    = { 7 },
            levels = {
                [70] = { acc = 336, eva = 260, agi = 89, int = 73, mnd = 79, chr = 73 },
                [71] = { acc = 341, eva = 266, agi = 92, int = 76, mnd = 80, chr = 76 },
                [72] = { acc = 346, eva = 271, agi = 92, int = 76, mnd = 80, chr = 76 },
                [73] = { acc = 353, eva = 275, agi = 93, int = 77, mnd = 83, chr = 77 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern sam',
            ids    = { 8, 9 },
            levels = {
                [70] = { acc = 291, eva = 280, agi = 71, int = 73, mnd = 73, chr = 79 },
                [71] = { acc = 297, eva = 285, agi = 72, int = 76, mnd = 76, chr = 80 },
                [72] = { acc = 302, eva = 290, agi = 72, int = 76, mnd = 76, chr = 80 },
                [73] = { acc = 308, eva = 296, agi = 74, int = 77, mnd = 77, chr = 83 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulxzomit',
            ids    = { 10, 25, 38, 42, 45, 48, 51, 59, 62, 65, 68, 71, 84, 161, 164 },
            levels = {
                [68] = { acc = 275, eva = 252, agi = 48, int = 54, mnd = 62, chr = 67 },
                [69] = { acc = 280, eva = 257, agi = 49, int = 55, mnd = 63, chr = 68 },
                [70] = { acc = 285, eva = 262, agi = 49, int = 55, mnd = 63, chr = 69 },
                [71] = { acc = 292, eva = 267, agi = 51, int = 57, mnd = 65, chr = 71 },
            },
            spawn_levels = { [51] = { 70, 71 }, [71] = { 70, 71 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 1000, item = 1785 },  -- xzomit organ
                { rate = 100, item = 1855 },  -- high-quality xzomit organ
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
        },
        {
            name   = 'Ulxzomit',
            ids    = { 11, 12, 26, 27, 39, 40, 43, 44, 46, 47, 49, 50, 52, 53, 60, 61, 63, 64, 66, 67, 69, 70, 72,
                       73, 85, 86, 162, 163, 165, 166 },
            levels = {
                [68] = { acc = 280, eva = 260, agi = 51, int = 54, mnd = 58, chr = 60 },
                [69] = { acc = 286, eva = 266, agi = 53, int = 55, mnd = 58, chr = 60 },
                [70] = { acc = 291, eva = 271, agi = 53, int = 55, mnd = 59, chr = 61 },
                [71] = { acc = 297, eva = 276, agi = 54, int = 57, mnd = 60, chr = 63 },
            },
            spawn_levels = { [12] = { 70, 71 }, [27] = { 70, 71 }, [40] = { 70, 71 }, [50] = { 70, 71 },
                             [52] = { 70, 71 }, [53] = { 70, 71 }, [63] = { 70, 71 }, [64] = { 70, 71 },
                             [72] = { 70, 71 }, [73] = { 70, 71 }, [86] = { 70, 71 }, [163] = { 70, 71 },
                             [166] = { 70, 71 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 10, item = 1785 },  -- xzomit organ
                { rate = 10, item = 1855 },  -- high-quality xzomit organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
        },
        {
            name   = 'Ulhpemde',
            ids    = { 13, 14, 15, 16, 28, 29, 35, 36, 54, 55, 56, 58, 74, 75, 78, 79, 80, 81, 82, 83, 167, 168,
                       169, 170, 171, 172, 173, 174, 175 },
            levels = {
                [68] = { acc = 297, eva = 267, agi = 65, int = 53, mnd = 60, chr = 68 },
                [69] = { acc = 303, eva = 272, agi = 65, int = 54, mnd = 60, chr = 69 },
                [70] = { acc = 308, eva = 278, agi = 67, int = 55, mnd = 61, chr = 69 },
                [71] = { acc = 314, eva = 282, agi = 67, int = 55, mnd = 63, chr = 72 },
                [72] = { acc = 319, eva = 287, agi = 67, int = 55, mnd = 63, chr = 72 },
            },
            spawn_levels = { [15] = { 69, 72 }, [36] = { 69, 72 }, [75] = { 69, 72 }, [167] = { 69, 72 },
                             [172] = { 69, 72 } },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1871 },  -- high-quality hpemde organ
                { rate = 50, item = 1787 },  -- hpemde organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Ulphuabo',
            ids    = { 17, 18, 30, 41, 57, 76, 77, 87, 176, 177 },
            levels = {
                [75] = { acc = 311, eva = 295, agi = 66, int = 66, mnd = 82, chr = 82 },
                [76] = { acc = 316, eva = 299, agi = 67, int = 67, mnd = 85, chr = 85 },
                [77] = { acc = 321, eva = 305, agi = 68, int = 68, mnd = 85, chr = 85 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1784 },  -- phuabo organ
                { rate = 50, item = 1784 },  -- phuabo organ
                { rate = 50, item = 1852 },  -- high-quality phuabo organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ulaern mnk',
            ids    = { 19 },
            levels = {
                [70] = { acc = 294, eva = 274, agi = 59, int = 61, mnd = 79, chr = 73 },
                [71] = { acc = 299, eva = 279, agi = 60, int = 64, mnd = 80, chr = 76 },
                [72] = { acc = 304, eva = 284, agi = 60, int = 64, mnd = 80, chr = 76 },
                [73] = { acc = 311, eva = 290, agi = 62, int = 65, mnd = 83, chr = 77 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern pld',
            ids    = { 20 },
            levels = {
                [70] = { acc = 285, eva = 264, agi = 53, int = 61, mnd = 85, chr = 85 },
                [71] = { acc = 291, eva = 270, agi = 56, int = 64, mnd = 88, chr = 88 },
                [72] = { acc = 296, eva = 275, agi = 56, int = 64, mnd = 88, chr = 88 },
                [73] = { acc = 302, eva = 280, agi = 56, int = 65, mnd = 89, chr = 89 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern bst',
            ids    = { 21 },
            levels = {
                [70] = { acc = 291, eva = 267, agi = 59, int = 73, mnd = 73, chr = 97 },
                [71] = { acc = 297, eva = 272, agi = 60, int = 76, mnd = 76, chr = 100 },
                [72] = { acc = 302, eva = 277, agi = 60, int = 76, mnd = 76, chr = 100 },
                [73] = { acc = 308, eva = 283, agi = 62, int = 77, mnd = 77, chr = 102 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern drg',
            ids    = { 22 },
            levels = {
                [70] = { acc = 310, eva = 280, agi = 71, int = 67, mnd = 73, chr = 85 },
                [71] = { acc = 315, eva = 285, agi = 72, int = 68, mnd = 76, chr = 88 },
                [72] = { acc = 320, eva = 290, agi = 72, int = 68, mnd = 76, chr = 88 },
                [73] = { acc = 327, eva = 296, agi = 74, int = 71, mnd = 77, chr = 89 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Wynav',
            ids    = { 23, 97, 136, 189, 190, 290, 343, 364, 493, 494, 495, 496, 497, 498 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 59, mnd = 49, chr = 55 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 60, mnd = 49, chr = 55 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 60, mnd = 49, chr = 55 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 61, mnd = 50, chr = 57 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 62, mnd = 51, chr = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep' },
            links  = 3,
        },
        {
            name   = 'Aerns Xzomit',
            ids    = { 24, 99, 147, 230, 283, 341 },
            levels = {
                [65] = { acc = 263, eva = 244, agi = 61, int = 56, mnd = 49, chr = 58 },
                [66] = { acc = 269, eva = 249, agi = 63, int = 57, mnd = 49, chr = 58 },
                [67] = { acc = 273, eva = 254, agi = 63, int = 57, mnd = 49, chr = 59 },
                [68] = { acc = 278, eva = 259, agi = 63, int = 57, mnd = 50, chr = 60 },
                [69] = { acc = 284, eva = 265, agi = 65, int = 59, mnd = 51, chr = 60 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            links  = 4,
        },
        {
            name   = 'Ulaern thf',
            ids    = { 31 },
            levels = {
                [70] = { acc = 297, eva = 342, agi = 83, int = 85, mnd = 61, chr = 61 },
                [71] = { acc = 303, eva = 348, agi = 84, int = 88, mnd = 64, chr = 64 },
                [72] = { acc = 308, eva = 353, agi = 84, int = 88, mnd = 64, chr = 64 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 89, mnd = 65, chr = 65 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern drk',
            ids    = { 32 },
            levels = {
                [70] = { acc = 291, eva = 273, agi = 71, int = 85, mnd = 61, chr = 61 },
                [71] = { acc = 297, eva = 278, agi = 72, int = 88, mnd = 64, chr = 64 },
                [72] = { acc = 302, eva = 283, agi = 72, int = 88, mnd = 64, chr = 64 },
                [73] = { acc = 308, eva = 289, agi = 74, int = 89, mnd = 65, chr = 65 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern nin',
            ids    = { 33 },
            levels = {
                [70] = { acc = 294, eva = 294, agi = 83, int = 79, mnd = 61, chr = 67 },
                [71] = { acc = 299, eva = 300, agi = 84, int = 80, mnd = 64, chr = 68 },
                [72] = { acc = 304, eva = 305, agi = 84, int = 80, mnd = 64, chr = 68 },
                [73] = { acc = 311, eva = 311, agi = 86, int = 83, mnd = 65, chr = 71 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Ulaern smn',
            ids    = { 34 },
            levels = {
                [70] = { acc = 285, eva = 251, agi = 71, int = 91, mnd = 91, chr = 91 },
                [71] = { acc = 291, eva = 256, agi = 72, int = 92, mnd = 92, chr = 92 },
                [72] = { acc = 296, eva = 261, agi = 72, int = 92, mnd = 92, chr = 92 },
                [73] = { acc = 302, eva = 266, agi = 74, int = 95, mnd = 95, chr = 95 },
            },
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Aerns Elemental',
            ids    = { 37, 98, 146, 209, 329, 379 },
            levels = {
                [65] = { acc = 260, eva = 244, agi = 61, int = 68, mnd = 53, chr = 51 },
                [66] = { acc = 265, eva = 248, agi = 61, int = 70, mnd = 55, chr = 52 },
                [67] = { acc = 270, eva = 254, agi = 63, int = 71, mnd = 56, chr = 54 },
                [68] = { acc = 275, eva = 259, agi = 63, int = 71, mnd = 56, chr = 54 },
                [69] = { acc = 281, eva = 264, agi = 63, int = 72, mnd = 56, chr = 54 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
        },
        {
            name   = 'Omaern whm',
            ids    = { 88, 104, 200, 294, 326, 377 },
            levels = {
                [75] = { acc = 309, eva = 273, agi = 70, int = 79, mnd = 105, chr = 91 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 79, mnd = 105, chr = 93 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 80, mnd = 107, chr = 94 },
                [78] = { acc = 325, eva = 288, agi = 73, int = 82, mnd = 107, chr = 94 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern bst',
            ids    = { 89, 144, 225, 282, 340 },
            levels = {
                [75] = { acc = 319, eva = 293, agi = 63, int = 79, mnd = 79, chr = 105 },
                [76] = { acc = 325, eva = 298, agi = 64, int = 79, mnd = 79, chr = 105 },
                [77] = { acc = 330, eva = 303, agi = 65, int = 80, mnd = 80, chr = 107 },
                [78] = { acc = 335, eva = 308, agi = 65, int = 82, mnd = 82, chr = 107 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern drg',
            ids    = { 90, 135, 187, 188, 289, 342, 363 },
            levels = {
                [75] = { acc = 337, eva = 306, agi = 75, int = 72, mnd = 79, chr = 91 },
                [76] = { acc = 343, eva = 312, agi = 77, int = 72, mnd = 79, chr = 93 },
                [77] = { acc = 348, eva = 317, agi = 77, int = 74, mnd = 80, chr = 94 },
                [78] = { acc = 353, eva = 322, agi = 77, int = 74, mnd = 82, chr = 94 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern smn',
            ids    = { 91, 145, 204, 328, 378 },
            levels = {
                [75] = { acc = 313, eva = 275, agi = 75, int = 97, mnd = 97, chr = 97 },
                [76] = { acc = 318, eva = 281, agi = 77, int = 97, mnd = 97, chr = 97 },
                [77] = { acc = 323, eva = 285, agi = 77, int = 100, mnd = 100, chr = 100 },
                [78] = { acc = 329, eva = 290, agi = 77, int = 100, mnd = 100, chr = 100 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omhpemde',
            ids    = { 92, 93, 94, 95, 96, 112, 113, 114, 123, 124, 125, 126, 127, 128, 129, 130, 148, 149, 150,
                       151, 154, 155, 156, 157, 205, 206, 207, 208, 215, 216, 217, 218, 219, 220, 226, 227, 228,
                       229 },
            levels = {
                [73] = { acc = 325, eva = 294, agi = 70, int = 58, mnd = 64, chr = 72 },
                [74] = { acc = 330, eva = 299, agi = 70, int = 58, mnd = 64, chr = 73 },
                [75] = { acc = 335, eva = 304, agi = 70, int = 58, mnd = 65, chr = 74 },
                [76] = { acc = 341, eva = 310, agi = 72, int = 59, mnd = 66, chr = 76 },
                [77] = { acc = 346, eva = 315, agi = 72, int = 60, mnd = 66, chr = 76 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1871 },  -- high-quality hpemde organ
                { rate = 100, item = 1787 },  -- hpemde organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Omxzomit',
            ids    = { 100, 120, 137, 140, 191, 194, 196, 198, 210, 231, 242, 244, 247, 249, 252, 258, 276, 298,
                       300, 303, 305, 307, 313, 316, 323, 391, 396, 401, 403, 405, 408, 410, 412, 416, 422 },
            levels = {
                [72] = { acc = 297, eva = 272, agi = 51, int = 57, mnd = 65, chr = 71 },
                [73] = { acc = 302, eva = 278, agi = 52, int = 58, mnd = 66, chr = 72 },
                [74] = { acc = 307, eva = 283, agi = 52, int = 59, mnd = 67, chr = 73 },
                [75] = { acc = 313, eva = 288, agi = 52, int = 59, mnd = 68, chr = 73 },
                [76] = { acc = 319, eva = 293, agi = 54, int = 61, mnd = 69, chr = 75 },
            },
            spawn_levels = { [100] = { 73, 76 }, [120] = { 73, 76 }, [137] = { 73, 76 }, [140] = { 73, 76 },
                             [191] = { 73, 76 }, [194] = { 73, 76 }, [196] = { 73, 76 }, [198] = { 73, 76 },
                             [210] = { 73, 76 }, [231] = { 73, 76 }, [242] = { 73, 76 }, [244] = { 72, 75 },
                             [247] = { 73, 76 }, [249] = { 72, 74 }, [252] = { 73, 76 }, [258] = { 74, 76 },
                             [276] = { 73, 76 }, [298] = { 72, 75 }, [300] = { 73, 76 }, [303] = { 72, 75 },
                             [305] = { 72, 75 }, [307] = { 73, 76 }, [313] = { 73, 74 }, [316] = { 73, 76 },
                             [323] = { 73, 76 }, [391] = { 73, 76 }, [396] = { 72, 75 }, [401] = { 72, 75 },
                             [403] = { 73, 76 }, [405] = { 73, 76 }, [408] = { 72, 75 }, [410] = { 72, 75 },
                             [412] = { 72, 75 }, [416] = { 72, 75 }, [422] = { 72, 75 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1785 },  -- xzomit organ
                { rate = 100, item = 1855 },  -- high-quality xzomit organ
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
            links  = 4,
        },
        {
            name   = 'Omxzomit',
            ids    = { 101, 102, 121, 122, 138, 139, 141, 142, 192, 195, 197, 199, 211, 232, 243, 245, 248, 250,
                       253, 259, 260, 277, 299, 301, 304, 306, 308, 314, 315, 317, 324, 392, 397, 402, 404, 406,
                       409, 411, 413, 417, 421 },
            levels = {
                [72] = { acc = 302, eva = 281, agi = 54, int = 57, mnd = 60, chr = 63 },
                [73] = { acc = 308, eva = 287, agi = 56, int = 58, mnd = 62, chr = 64 },
                [74] = { acc = 313, eva = 292, agi = 56, int = 59, mnd = 62, chr = 64 },
                [75] = { acc = 319, eva = 297, agi = 56, int = 59, mnd = 63, chr = 65 },
                [76] = { acc = 325, eva = 302, agi = 57, int = 61, mnd = 64, chr = 66 },
            },
            spawn_levels = { [101] = { 73, 76 }, [102] = { 73, 76 }, [121] = { 73, 75 }, [122] = { 73, 76 },
                             [138] = { 73, 76 }, [139] = { 73, 76 }, [141] = { 73, 76 }, [142] = { 73, 76 },
                             [192] = { 73, 76 }, [195] = { 73, 76 }, [197] = { 73, 76 }, [199] = { 73, 76 },
                             [211] = { 73, 76 }, [232] = { 73, 76 }, [243] = { 73, 76 }, [245] = { 73, 76 },
                             [248] = { 73, 76 }, [250] = { 73, 76 }, [253] = { 73, 76 }, [259] = { 73, 76 },
                             [260] = { 73, 76 }, [277] = { 73, 76 }, [299] = { 73, 76 }, [301] = { 73, 76 },
                             [304] = { 72, 75 }, [306] = { 73, 73 }, [308] = { 73, 76 }, [314] = { 73, 76 },
                             [315] = { 73, 76 }, [317] = { 73, 76 }, [324] = { 74, 75 }, [392] = { 73, 76 },
                             [397] = { 73, 76 }, [402] = { 73, 76 }, [404] = { 73, 76 }, [406] = { 73, 76 },
                             [409] = { 73, 76 }, [411] = { 73, 76 }, [413] = { 72, 75 }, [417] = { 73, 76 },
                             [421] = { 73, 76 } },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 1785 },  -- xzomit organ
                { rate = 100, item = 1855 },  -- high-quality xzomit organ
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
            links  = 4,
        },
        {
            name   = 'Omaern war',
            ids    = { 103, 178, 179, 310, 338 },
            levels = {
                [75] = { acc = 319, eva = 303, agi = 82, int = 72, mnd = 72, chr = 79 },
                [76] = { acc = 325, eva = 308, agi = 85, int = 72, mnd = 72, chr = 79 },
                [77] = { acc = 330, eva = 313, agi = 85, int = 74, mnd = 74, chr = 80 },
                [78] = { acc = 335, eva = 318, agi = 85, int = 74, mnd = 74, chr = 82 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern pld',
            ids    = { 105, 201, 287, 311, 381 },
            levels = {
                [75] = { acc = 313, eva = 290, agi = 57, int = 66, mnd = 91, chr = 91 },
                [76] = { acc = 318, eva = 295, agi = 59, int = 67, mnd = 93, chr = 93 },
                [77] = { acc = 323, eva = 300, agi = 59, int = 68, mnd = 94, chr = 94 },
                [78] = { acc = 329, eva = 305, agi = 59, int = 68, mnd = 94, chr = 94 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern drk',
            ids    = { 106, 107, 202, 295, 331, 339 },
            levels = {
                [75] = { acc = 319, eva = 299, agi = 75, int = 91, mnd = 66, chr = 66 },
                [76] = { acc = 325, eva = 304, agi = 77, int = 93, mnd = 67, chr = 67 },
                [77] = { acc = 330, eva = 309, agi = 77, int = 94, mnd = 68, chr = 68 },
                [78] = { acc = 335, eva = 314, agi = 77, int = 94, mnd = 68, chr = 68 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern brd',
            ids    = { 108, 109, 203, 332, 371 },
            levels = {
                [75] = { acc = 315, eva = 284, agi = 63, int = 84, mnd = 84, chr = 97 },
                [76] = { acc = 321, eva = 290, agi = 64, int = 85, mnd = 85, chr = 97 },
                [77] = { acc = 326, eva = 294, agi = 65, int = 86, mnd = 86, chr = 100 },
                [78] = { acc = 331, eva = 299, agi = 65, int = 86, mnd = 86, chr = 100 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern sam',
            ids    = { 110, 111, 185, 271, 325, 369 },
            levels = {
                [75] = { acc = 319, eva = 306, agi = 75, int = 79, mnd = 79, chr = 84 },
                [76] = { acc = 325, eva = 312, agi = 77, int = 79, mnd = 79, chr = 85 },
                [77] = { acc = 330, eva = 317, agi = 77, int = 80, mnd = 80, chr = 86 },
                [78] = { acc = 335, eva = 322, agi = 77, int = 82, mnd = 82, chr = 86 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern mnk',
            ids    = { 115, 180, 181, 221, 264, 376 },
            levels = {
                [75] = { acc = 322, eva = 300, agi = 63, int = 66, mnd = 84, chr = 79 },
                [76] = { acc = 327, eva = 306, agi = 64, int = 67, mnd = 85, chr = 79 },
                [77] = { acc = 333, eva = 311, agi = 65, int = 68, mnd = 86, chr = 80 },
                [78] = { acc = 338, eva = 316, agi = 65, int = 68, mnd = 86, chr = 82 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern blm',
            ids    = { 116, 133, 222, 234, 265, 322, 361 },
            levels = {
                [75] = { acc = 319, eva = 279, agi = 82, int = 105, mnd = 79, chr = 84 },
                [76] = { acc = 325, eva = 285, agi = 85, int = 105, mnd = 79, chr = 85 },
                [77] = { acc = 330, eva = 289, agi = 85, int = 107, mnd = 80, chr = 86 },
                [78] = { acc = 335, eva = 294, agi = 85, int = 107, mnd = 82, chr = 86 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern rdm',
            ids    = { 117, 143, 223, 235, 266, 312, 362 },
            levels = {
                [75] = { acc = 315, eva = 288, agi = 70, int = 91, mnd = 91, chr = 84 },
                [76] = { acc = 321, eva = 293, agi = 71, int = 93, mnd = 93, chr = 85 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 94, mnd = 94, chr = 86 },
                [78] = { acc = 331, eva = 303, agi = 73, int = 94, mnd = 94, chr = 86 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern thf',
            ids    = { 118, 182, 224, 272, 348, 358, 370 },
            levels = {
                [75] = { acc = 326, eva = 370, agi = 88, int = 91, mnd = 66, chr = 66 },
                [76] = { acc = 331, eva = 375, agi = 89, int = 93, mnd = 67, chr = 67 },
                [77] = { acc = 337, eva = 381, agi = 91, int = 94, mnd = 68, chr = 68 },
                [78] = { acc = 342, eva = 386, agi = 91, int = 94, mnd = 68, chr = 68 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omaern nin',
            ids    = { 119, 134, 186, 288, 333, 372 },
            levels = {
                [75] = { acc = 322, eva = 322, agi = 88, int = 84, mnd = 66, chr = 72 },
                [76] = { acc = 327, eva = 327, agi = 89, int = 85, mnd = 67, chr = 72 },
                [77] = { acc = 333, eva = 333, agi = 91, int = 86, mnd = 68, chr = 74 },
                [78] = { acc = 338, eva = 338, agi = 91, int = 86, mnd = 68, chr = 74 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omphuabo',
            ids    = { 131, 132, 152, 153, 158, 159, 160, 193, 212, 213, 214, 233, 246, 251, 256, 257, 263, 269,
                       270, 275, 280, 286, 293, 302, 309, 318, 319, 320, 321, 330, 336, 337, 346, 347, 350, 351,
                       355, 356, 357, 360, 367, 368, 373, 374, 375, 380, 383, 390, 395, 400, 407, 414, 415, 420,
                       425, 426 },
            levels = {
                [79] = { acc = 333, eva = 315, agi = 69, int = 69, mnd = 87, chr = 87 },
                [80] = { acc = 338, eva = 320, agi = 69, int = 69, mnd = 87, chr = 87 },
                [81] = { acc = 345, eva = 326, agi = 72, int = 72, mnd = 90, chr = 90 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 1784 },  -- phuabo organ
                { rate = 100, item = 1784 },  -- phuabo organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 10, item = 1852 },  -- high-quality phuabo organ
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Omaern rng',
            ids    = { 183, 184, 281, 327, 359, 382 },
            levels = {
                [75] = { acc = 363, eva = 286, agi = 96, int = 79, mnd = 84, chr = 79 },
                [76] = { acc = 369, eva = 291, agi = 97, int = 79, mnd = 85, chr = 79 },
                [77] = { acc = 374, eva = 296, agi = 98, int = 80, mnd = 86, chr = 80 },
                [78] = { acc = 379, eva = 301, agi = 98, int = 82, mnd = 86, chr = 82 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1786 },  -- aern organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 1,
            flags  = { scripted_drops = true, scripted_stats = true },
        },
        {
            name   = 'Omyovra',
            ids    = { 236, 237, 238, 239, 428, 430, 432, 434, 436, 438, 440, 442, 444 },
            nm     = true,
            levels = {
                [84] = { acc = 371, eva = 342, agi = 75, int = 86, mnd = 58, chr = 63 },
                [85] = { acc = 377, eva = 348, agi = 76, int = 88, mnd = 60, chr = 64 },
            },
            ranks  = { earth = -2, thunder = 6, light = 2, dark = -1, slow = -2, light_sleep = 2, dark_sleep = -1,
                       blind = -1, stun = 6 },
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 1788 },  -- yovra organ
                { rate = 50, item = 1788 },  -- yovra organ
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
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ulyovra',
            ids    = { 240, 241 },
            nm     = true,
            levels = {
                [79] = { acc = 339, eva = 316, agi = 71, int = 82, mnd = 55, chr = 59 },
                [80] = { acc = 344, eva = 321, agi = 71, int = 82, mnd = 55, chr = 59 },
            },
            ranks  = { earth = -2, thunder = 6, light = 2, dark = -1, slow = -2, light_sleep = 2, dark_sleep = -1,
                       blind = -1, stun = 6 },
            immune = { 'paralyze' },
            drops  = {
                { rate = 240, item = 1788 },  -- yovra organ
                { rate = 50, item = 1783 },  -- sample of luminian tissue
                { rate = 100, group = {  -- one of
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
            name   = 'Omhpemde',
            ids    = { 254, 255, 261, 262, 267, 268, 273, 274, 278, 279, 284, 285, 291, 292, 296, 297, 334, 335,
                       344, 345, 349, 352, 353, 354, 365, 366, 384, 385, 386, 387, 388, 389, 393, 394, 398, 399,
                       418, 419, 423, 424 },
            levels = {
                [73] = { acc = 325, eva = 294, agi = 70, int = 58, mnd = 64, chr = 72 },
                [74] = { acc = 330, eva = 299, agi = 70, int = 58, mnd = 64, chr = 73 },
                [75] = { acc = 335, eva = 304, agi = 70, int = 58, mnd = 65, chr = 74 },
                [76] = { acc = 341, eva = 310, agi = 72, int = 59, mnd = 66, chr = 76 },
                [77] = { acc = 346, eva = 315, agi = 72, int = 60, mnd = 66, chr = 76 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 1871 },  -- high-quality hpemde organ
                { rate = 100, item = 1787 },  -- hpemde organ
                { rate = 10, item = 1783 },  -- sample of luminian tissue
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
            links  = 2,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Aweuvhi',
            ids    = { 427, 429, 431, 433, 435, 437, 439, 441, 443 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 60, mnd = 60, chr = 82 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 61, mnd = 61, chr = 83 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 61, mnd = 61, chr = 83 },
            },
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
            no_aggro = true,
        },
        {
            name   = 'Ruaern war',
            ids    = { 445 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 276, agi = 77, int = 67, mnd = 67, chr = 73 },
                [71] = { acc = 297, eva = 282, agi = 80, int = 68, mnd = 68, chr = 76 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern whm',
            ids    = { 446 },
            nm     = true,
            levels = {
                [70] = { acc = 282, eva = 248, agi = 65, int = 73, mnd = 97, chr = 85 },
                [71] = { acc = 287, eva = 254, agi = 68, int = 76, mnd = 100, chr = 88 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern sam',
            ids    = { 447 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 280, agi = 71, int = 73, mnd = 73, chr = 79 },
                [71] = { acc = 297, eva = 285, agi = 72, int = 76, mnd = 76, chr = 80 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern drk',
            ids    = { 448 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 273, agi = 71, int = 85, mnd = 61, chr = 61 },
                [71] = { acc = 297, eva = 278, agi = 72, int = 88, mnd = 64, chr = 64 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern rdm',
            ids    = { 449 },
            nm     = true,
            levels = {
                [70] = { acc = 288, eva = 262, agi = 65, int = 85, mnd = 85, chr = 79 },
                [71] = { acc = 293, eva = 268, agi = 68, int = 88, mnd = 88, chr = 80 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern rng',
            ids    = { 450 },
            nm     = true,
            levels = {
                [70] = { acc = 336, eva = 260, agi = 89, int = 73, mnd = 79, chr = 73 },
                [71] = { acc = 341, eva = 266, agi = 92, int = 76, mnd = 80, chr = 76 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern pld',
            ids    = { 451 },
            nm     = true,
            levels = {
                [70] = { acc = 285, eva = 264, agi = 53, int = 61, mnd = 85, chr = 85 },
                [71] = { acc = 291, eva = 270, agi = 56, int = 64, mnd = 88, chr = 88 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern blm',
            ids    = { 452 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 254, agi = 77, int = 97, mnd = 73, chr = 79 },
                [71] = { acc = 297, eva = 260, agi = 80, int = 100, mnd = 76, chr = 80 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Ruaern mnk',
            ids    = { 453 },
            nm     = true,
            levels = {
                [70] = { acc = 294, eva = 274, agi = 59, int = 61, mnd = 79, chr = 73 },
                [71] = { acc = 299, eva = 279, agi = 60, int = 64, mnd = 80, chr = 76 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 1,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Jailer of Hope',
            ids    = { 454 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 391, agi = 102, int = 93, mnd = 74, chr = 81 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'blind',
                       'poison', 'petrify' },
            drops  = {
                { rate = 1000, item = 1847 },  -- fifth virtue
                { rate = 1000, item = 17595 },  -- hope staff
                { rate = 100, item = 15509 },  -- hope torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Jailer of Justice',
            ids    = { 455 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 338, agi = 57, int = 79, mnd = 70, chr = 102 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'stun', 'blind', 'petrify', 'terror',
                       'plague' },
            drops  = {
                { rate = 1000, item = 1848 },  -- fourth virtue
                { rate = 1000, item = 17710 },  -- justice sword
                { rate = 100, item = 15508 },  -- justice torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Qnxzomit',
            ids    = { 456, 457, 458, 459, 460, 461 },
            nm     = true,
            levels = {
                [80] = { acc = 347, eva = 342, agi = 79, int = 80, mnd = 51, chr = 61 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'stun', 'blind', 'petrify' },
            links  = 6,
        },
        {
            name   = 'Jailer of Prudence',
            ids    = { 462, 463 },
            nm     = true,
            levels = {
                [85] = { acc = 384, eva = 422, agi = 93, int = 87, mnd = 59, chr = 55 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'stun', 'paralyze', 'slow', 'blind', 'poison' },
            drops  = {
                { rate = 1000, item = 1849 },  -- sixth virtue
                { rate = 1000, item = 18397 },  -- prudence rod
                { rate = 100, item = 15510 },  -- prudence torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Jailer of Love',
            ids    = { 464 },
            nm     = true,
            levels = {
                [90] = { acc = 402, eva = 365, agi = 75, int = 90, mnd = 90, chr = 90 },
            },
            ranks  = { earth = -2, thunder = 6, light = 2, dark = -1, slow = -2, light_sleep = 2, dark_sleep = -1,
                       blind = -1, stun = 6 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow',
                       'elegy', 'blind', 'poison', 'requiem', 'terror' },
            drops  = {
                { rate = 1000, item = 18100 },  -- love halberd
                { rate = 150, item = 1911 },  -- aura of adulation
                { rate = 150, item = 1912 },  -- aura of voracity
                { rate = 150, item = 15514 },  -- love torque
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 7,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Ruphuabo',
            ids    = { 465, 466, 467, 468, 469, 470, 471, 472, 473 },
            nm     = true,
            levels = {
                [80] = { acc = 338, eva = 320, agi = 69, int = 69, mnd = 87, chr = 87 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = 1, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = 1,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Qnxzomit',
            ids    = { 474, 475, 476, 477, 478, 479, 480, 481, 482 },
            nm     = true,
            levels = {
                [80] = { acc = 347, eva = 342, agi = 79, int = 80, mnd = 51, chr = 61 },
            },
            ranks  = { fire = -2, ice = -2, earth = -2, thunder = -2, water = -2, paralyze = -2, bind = -2,
                       slow = -2, poison = -2, stun = -2 },
            links  = 8,
        },
        {
            name   = 'Qnhpemde',
            ids    = { 483, 484, 485, 486, 487, 488, 489, 490, 491 },
            nm     = true,
            levels = {
                [80] = { acc = 363, eva = 331, agi = 75, int = 61, mnd = 69, chr = 78 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 1, dark = -1,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -2 },
            links  = 8,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Absolute Virtue',
            ids    = { 492 },
            nm     = true,
            levels = {
                [92] = { acc = 446, eva = 399, agi = 94, int = 99, mnd = 95, chr = 107 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = 6, dark = -2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = 6,
                       dark_sleep = -2, blind = -2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 1000, item = 1916 },  -- sin of invidiousness
                { rate = 1000, item = 1917 },  -- sin of insolence
                { rate = 1000, item = 1918 },  -- sin of infatuation
                { rate = 150, item = 1919 },  -- sin of intemperance
                { rate = 150, item = 1914 },  -- sin of indolence
                { rate = 150, item = 1913 },  -- sin of indignation
                { rate = 50, item = 1915 },  -- sin of indulgence
            },
            links  = 9,
            flags  = { scripted_stats = true, scripted_elements = true },
        },
    },
    by_name = {},
}
