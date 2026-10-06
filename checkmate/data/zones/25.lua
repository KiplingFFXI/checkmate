-- Misareaux Coast (zone 25).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Death Jacket', 'Miner Bee' },
        [2] = { 'Tavnazian Sheep' },
        [3] = { 'Fomor Ranger', 'Fomor Thief' },
        [4] = { 'Fomor Ranger', 'Fomor Thief', 'Fomor Warrior' },
        [5] = { 'Tiyanak', 'Upyri', 'Vampire Bat', 'Wingrats' },
        [6] = { 'Gigas Braver', 'Gigas Catapulter', 'Gigas Martialist', 'Gigas Warwolf', 'Gration' },
        [7] = { 'Orcish Bowshooter', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Stonelauncher',
                'Orcish Trooper' },
        [8] = { 'Overgrown Rose' },
        [9] = { 'Tiyanak', 'Vampire Bat', 'Wingrats' },
        [10] = { 'Fomor Thief', 'Fomor Warrior' },
        [11] = { 'Diatryma' },
        [12] = { 'Warder Euphrosyne', 'Warder Thalia' },
        [13] = { 'Warder Aglaia', 'Warder Thalia' },
        [14] = { 'Warder Aglaia', 'Warder Euphrosyne' },
        [15] = { 'Gigas Braver', 'Gigas Catapulter', 'Gigas Martialist', 'Gigas Warwolf' },
        [16] = { 'Bloodswiller Fly' },
        [17] = { 'Upyri', 'Vampire Bat', 'Wingrats' },
    },
    monsters = {
        {
            name   = 'Clipper',
            ids    = { 1 },
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
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
            name   = 'Grindylow',
            ids    = { 2 },
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3, 4 },
            levels = {
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 32 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 35 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mantrap',
            ids    = { 5 },
            levels = {
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 173, eva = 162, agi = 52, int = 38, mnd = 38, chr = 44 },
                [49] = { acc = 176, eva = 165, agi = 53, int = 40, mnd = 40, chr = 44 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Miner Bee',
            ids    = { 6, 7, 10, 11, 15, 16, 20, 21, 24, 27, 30, 33, 34, 35, 36, 42, 43, 68, 69 },
            levels = {
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 31 },
                [32] = { acc = 117, eva = 111, agi = 40, int = 26, mnd = 26, chr = 31 },
                [33] = { acc = 121, eva = 114, agi = 40, int = 29, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 1,
        },
        {
            name   = 'Tavnazian Sheep',
            ids    = { 8, 9, 13, 14, 18, 19, 23, 26, 29, 32, 39, 40, 47, 48 },
            levels = {
                [33] = { acc = 121, eva = 113, agi = 38, int = 27, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 116, agi = 39, int = 27, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 28, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 28, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 29, mnd = 31, chr = 34 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4372 },  -- slice of giant sheep meat
                { rate = 150, item = 505 },  -- sheepskin
                { rate = 50, item = 4378 },  -- jug of selbina milk
                { rate = 50, item = 882 },  -- sheep tooth
                { rate = 10, item = 5154 },  -- tavnazian sheep liver
            },
            links  = 2,
        },
        {
            name   = 'Bugard',
            ids    = { 12, 17, 22, 25, 28, 31, 37, 38, 44, 45, 46 },
            levels = {
                [34] = { acc = 124, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1640 },  -- bugard skin
                { rate = 50, item = 1680 },  -- high-quality bugard skin
                { rate = 10, item = 1622 },  -- bugard tusk
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 41, 183, 192 },
            levels = {
                [42] = { acc = 151, eva = 136, agi = 44, int = 52, mnd = 42, chr = 42 },
                [43] = { acc = 154, eva = 139, agi = 44, int = 53, mnd = 42, chr = 42 },
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
                [55] = { acc = 206, eva = 186, agi = 55, int = 65, mnd = 52, chr = 52 },
                [56] = { acc = 212, eva = 192, agi = 57, int = 67, mnd = 54, chr = 55 },
            },
            spawn_levels = { [41] = { 42, 44 }, [183] = { 54, 56 }, [192] = { 54, 55 } },
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
            name   = 'Fomor Monk',
            ids    = { 50, 60, 203 },
            levels = {
                [36] = { acc = 132, eva = 121, agi = 30, int = 28, mnd = 37, chr = 37 },
                [37] = { acc = 136, eva = 124, agi = 31, int = 28, mnd = 37, chr = 37 },
                [38] = { acc = 139, eva = 127, agi = 31, int = 28, mnd = 37, chr = 39 },
                [49] = { acc = 178, eva = 164, agi = 40, int = 35, mnd = 47, chr = 48 },
                [50] = { acc = 182, eva = 167, agi = 41, int = 36, mnd = 50, chr = 48 },
                [51] = { acc = 187, eva = 171, agi = 41, int = 38, mnd = 50, chr = 51 },
            },
            spawn_levels = { [50] = { 36, 38 }, [60] = { 36, 38 }, [203] = { 49, 51 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 51, 63 },
            levels = {
                [35] = { acc = 127, eva = 120, agi = 35, int = 33, mnd = 33, chr = 38 },
                [36] = { acc = 132, eva = 124, agi = 37, int = 34, mnd = 34, chr = 40 },
                [37] = { acc = 135, eva = 127, agi = 37, int = 34, mnd = 34, chr = 40 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 52 },
            levels = {
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 36 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 30, mnd = 30, chr = 37 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 37 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 53, 199 },
            levels = {
                [35] = { acc = 131, eva = 151, agi = 42, int = 39, mnd = 26, chr = 29 },
                [36] = { acc = 135, eva = 154, agi = 43, int = 42, mnd = 28, chr = 31 },
                [37] = { acc = 138, eva = 158, agi = 45, int = 42, mnd = 28, chr = 31 },
                [48] = { acc = 177, eva = 197, agi = 56, int = 52, mnd = 35, chr = 38 },
                [49] = { acc = 181, eva = 200, agi = 56, int = 53, mnd = 35, chr = 39 },
                [50] = { acc = 184, eva = 217, agi = 59, int = 54, mnd = 36, chr = 39 },
            },
            spawn_levels = { [53] = { 35, 37 }, [199] = { 48, 50 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 4,
        },
        {
            name   = 'Air Elemental',
            ids    = { 54, 232 },
            levels = {
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50 },
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
            name   = 'Crimson Knight Crab',
            ids    = { 55, 56, 57, 58 },
            levels = {
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
                [35] = { acc = 124, eva = 112, agi = 25, int = 26, mnd = 39, chr = 39 },
                [36] = { acc = 128, eva = 116, agi = 26, int = 28, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1888 },  -- sack of silica
            },
        },
        {
            name   = 'Dark Elemental',
            ids    = { 59, 193 },
            levels = {
                [42] = { acc = 152, eva = 140, agi = 42, int = 47, mnd = 32, chr = 32 },
                [43] = { acc = 155, eva = 143, agi = 42, int = 47, mnd = 32, chr = 32 },
                [44] = { acc = 159, eva = 147, agi = 45, int = 49, mnd = 33, chr = 33 },
                [54] = { acc = 202, eva = 187, agi = 52, int = 58, mnd = 39, chr = 39 },
                [55] = { acc = 207, eva = 192, agi = 52, int = 58, mnd = 39, chr = 39 },
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 41 },
            },
            spawn_levels = { [59] = { 42, 44 }, [193] = { 54, 56 } },
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
            name   = 'Fomor Black Mage',
            ids    = { 61 },
            levels = {
                [35] = { acc = 127, eva = 108, agi = 39, int = 47, mnd = 33, chr = 38 },
                [36] = { acc = 132, eva = 112, agi = 42, int = 48, mnd = 34, chr = 40 },
                [37] = { acc = 135, eva = 115, agi = 42, int = 49, mnd = 34, chr = 40 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 62, 200, 273 },
            levels = {
                [36] = { acc = 151, eva = 115, agi = 48, int = 34, mnd = 37, chr = 37 },
                [37] = { acc = 154, eva = 118, agi = 49, int = 34, mnd = 37, chr = 37 },
                [38] = { acc = 157, eva = 120, agi = 49, int = 36, mnd = 37, chr = 39 },
                [49] = { acc = 195, eva = 155, agi = 62, int = 44, mnd = 47, chr = 48 },
                [50] = { acc = 213, eva = 157, agi = 63, int = 45, mnd = 50, chr = 48 },
                [51] = { acc = 218, eva = 162, agi = 65, int = 47, mnd = 50, chr = 51 },
            },
            spawn_levels = { [62] = { 36, 38 }, [200] = { 49, 51 }, [273] = { 49, 51 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 64, 198 },
            levels = {
                [36] = { acc = 132, eva = 121, agi = 37, int = 42, mnd = 28, chr = 31 },
                [37] = { acc = 135, eva = 123, agi = 37, int = 42, mnd = 28, chr = 31 },
                [38] = { acc = 138, eva = 126, agi = 37, int = 42, mnd = 28, chr = 31 },
                [48] = { acc = 173, eva = 159, agi = 47, int = 52, mnd = 35, chr = 38 },
                [49] = { acc = 176, eva = 162, agi = 47, int = 53, mnd = 35, chr = 39 },
                [50] = { acc = 180, eva = 167, agi = 50, int = 54, mnd = 36, chr = 39 },
            },
            spawn_levels = { [64] = { 36, 38 }, [198] = { 48, 50 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 65, 206 },
            levels = {
                [35] = { acc = 129, eva = 129, agi = 42, int = 35, mnd = 26, chr = 32 },
                [36] = { acc = 132, eva = 132, agi = 43, int = 37, mnd = 28, chr = 33 },
                [37] = { acc = 136, eva = 136, agi = 45, int = 37, mnd = 28, chr = 34 },
                [48] = { acc = 175, eva = 175, agi = 56, int = 47, mnd = 35, chr = 41 },
                [49] = { acc = 178, eva = 178, agi = 56, int = 47, mnd = 35, chr = 44 },
                [50] = { acc = 182, eva = 182, agi = 59, int = 50, mnd = 36, chr = 44 },
            },
            spawn_levels = { [65] = { 35, 37 }, [206] = { 48, 50 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 66, 197, 201, 205 },
            levels = {
                [36] = { acc = 128, eva = 117, agi = 28, int = 28, mnd = 42, chr = 45 },
                [37] = { acc = 131, eva = 119, agi = 28, int = 28, mnd = 42, chr = 45 },
                [38] = { acc = 135, eva = 122, agi = 28, int = 28, mnd = 42, chr = 45 },
                [49] = { acc = 172, eva = 156, agi = 35, int = 35, mnd = 53, chr = 57 },
                [50] = { acc = 175, eva = 160, agi = 36, int = 36, mnd = 54, chr = 57 },
                [51] = { acc = 181, eva = 165, agi = 38, int = 38, mnd = 56, chr = 60 },
            },
            spawn_levels = { [66] = { 36, 38 }, [197] = { 49, 51 }, [201] = { 49, 51 }, [205] = { 49, 51 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1843 },  -- square of spectral crimson
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Bard',
            ids    = { 67, 272 },
            levels = {
                [35] = { acc = 125, eva = 109, agi = 29, int = 35, mnd = 35, chr = 45 },
                [36] = { acc = 129, eva = 113, agi = 30, int = 37, mnd = 37, chr = 46 },
                [37] = { acc = 132, eva = 116, agi = 31, int = 37, mnd = 37, chr = 48 },
                [48] = { acc = 170, eva = 149, agi = 38, int = 47, mnd = 47, chr = 59 },
                [49] = { acc = 173, eva = 153, agi = 40, int = 47, mnd = 47, chr = 60 },
                [50] = { acc = 178, eva = 156, agi = 41, int = 50, mnd = 50, chr = 62 },
            },
            spawn_levels = { [67] = { 35, 37 }, [272] = { 48, 50 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1843 },  -- square of spectral crimson
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Vampire Bat',
            ids    = { 70, 71 },
            levels = {
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 5,
        },
        {
            name   = 'Wingrats',
            ids    = { 72, 73 },
            levels = {
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 5,
        },
        {
            name   = 'Gigantobugard',
            ids    = { 74, 78, 79, 80, 81, 82, 85, 86, 92, 107, 108, 109, 120, 122, 130, 135, 136, 143, 144, 149,
                       150, 151, 162, 163, 164, 218, 219 },
            levels = {
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 149, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 240, item = 1640 },  -- bugard skin
                { rate = 100, item = 1680 },  -- high-quality bugard skin
                { rate = 50, item = 1622 },  -- bugard tusk
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Death Jacket LM MC',
            ids    = { 75, 76, 77, 104, 105, 131, 132, 133, 134, 175 },
            levels = {
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 1,
        },
        {
            name   = 'Gigas Martialist',
            ids    = { 83, 88, 118, 145, 153, 166 },
            levels = {
                [41] = { acc = 153, eva = 137, agi = 33, int = 27, mnd = 42, chr = 42 },
                [42] = { acc = 156, eva = 139, agi = 33, int = 27, mnd = 42, chr = 42 },
                [43] = { acc = 159, eva = 142, agi = 33, int = 27, mnd = 42, chr = 42 },
                [44] = { acc = 163, eva = 145, agi = 33, int = 27, mnd = 45, chr = 43 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 150, item = 497 },  -- gigas socks
                { rate = 100, item = 12290 },  -- maple shield
                { rate = 50, item = 499 },  -- gigas necklace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Orcish Footsoldier MC',
            ids    = { 84, 114, 126, 139, 156, 169 },
            levels = {
                [41] = { acc = 152, eva = 140, agi = 47, int = 30, mnd = 33, chr = 42 },
                [42] = { acc = 155, eva = 142, agi = 47, int = 30, mnd = 33, chr = 42 },
                [43] = { acc = 158, eva = 145, agi = 47, int = 30, mnd = 33, chr = 42 },
                [44] = { acc = 162, eva = 149, agi = 49, int = 30, mnd = 33, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gigas Braver',
            ids    = { 87, 110, 123, 137, 152, 165 },
            levels = {
                [41] = { acc = 152, eva = 139, agi = 45, int = 30, mnd = 35, chr = 42 },
                [42] = { acc = 155, eva = 141, agi = 45, int = 30, mnd = 35, chr = 42 },
                [43] = { acc = 158, eva = 144, agi = 45, int = 30, mnd = 35, chr = 42 },
                [44] = { acc = 162, eva = 148, agi = 46, int = 30, mnd = 36, chr = 43 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            drops  = {
                { rate = 150, item = 497 },  -- gigas socks
                { rate = 100, item = 12290 },  -- maple shield
                { rate = 50, item = 499 },  -- gigas necklace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Orcish Stonelauncher',
            ids    = { 89, 113, 174, 221 },
            levels = {
                [43] = { acc = 158, eva = 147, agi = 50, int = 30, mnd = 33, chr = 39 },
                [44] = { acc = 162, eva = 151, agi = 52, int = 30, mnd = 33, chr = 40 },
                [45] = { acc = 165, eva = 154, agi = 52, int = 32, mnd = 35, chr = 42 },
                [46] = { acc = 169, eva = 158, agi = 55, int = 32, mnd = 35, chr = 42 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 10, item = 17292 },  -- long boomerang
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Orcish Trooper MC',
            ids    = { 90, 115, 127, 147, 158, 171 },
            levels = {
                [41] = { acc = 149, eva = 135, agi = 37, int = 28, mnd = 41, chr = 47 },
                [42] = { acc = 152, eva = 137, agi = 37, int = 28, mnd = 41, chr = 47 },
                [43] = { acc = 155, eva = 140, agi = 37, int = 28, mnd = 41, chr = 47 },
                [44] = { acc = 159, eva = 144, agi = 38, int = 28, mnd = 42, chr = 49 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Orcish Bowshooter MC',
            ids    = { 91, 116, 128, 141, 159, 172, 222 },
            levels = {
                [41] = { acc = 172, eva = 143, agi = 52, int = 33, mnd = 38, chr = 42 },
                [42] = { acc = 175, eva = 145, agi = 52, int = 33, mnd = 38, chr = 42 },
                [43] = { acc = 178, eva = 148, agi = 53, int = 33, mnd = 38, chr = 42 },
                [44] = { acc = 182, eva = 152, agi = 54, int = 33, mnd = 39, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Atomic Cluster',
            ids    = { 106, 161, 217 },
            levels = {
                [44] = { acc = 161, eva = 149, agi = 49, int = 36, mnd = 36, chr = 43 },
                [45] = { acc = 164, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45 },
                [46] = { acc = 168, eva = 156, agi = 51, int = 37, mnd = 37, chr = 46 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 17305 },  -- cluster arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Gigas Warwolf',
            ids    = { 111, 124, 146, 154, 167 },
            levels = {
                [41] = { acc = 152, eva = 133, agi = 33, int = 34, mnd = 39, chr = 57 },
                [42] = { acc = 155, eva = 135, agi = 33, int = 34, mnd = 39, chr = 57 },
                [43] = { acc = 158, eva = 138, agi = 33, int = 34, mnd = 39, chr = 59 },
                [44] = { acc = 162, eva = 141, agi = 33, int = 34, mnd = 40, chr = 60 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 15 },
            drops  = {
                { rate = 150, item = 497 },  -- gigas socks
                { rate = 100, item = 12290 },  -- maple shield
                { rate = 50, item = 499 },  -- gigas necklace
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gigas Catapulter',
            ids    = { 112, 125, 138, 155, 168, 220 },
            levels = {
                [41] = { acc = 172, eva = 142, agi = 50, int = 33, mnd = 40, chr = 42 },
                [42] = { acc = 175, eva = 144, agi = 50, int = 33, mnd = 40, chr = 42 },
                [43] = { acc = 178, eva = 147, agi = 51, int = 33, mnd = 40, chr = 42 },
                [44] = { acc = 182, eva = 150, agi = 51, int = 33, mnd = 42, chr = 43 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 150, item = 497 },  -- gigas socks
                { rate = 100, item = 12290 },  -- maple shield
                { rate = 50, item = 499 },  -- gigas necklace
                { rate = 10, item = 14018 },  -- gigas bracelets
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Gigass Sheep',
            ids    = { 117, 129, 148, 160, 173 },
            levels = {
                [34] = { acc = 124, eva = 116, agi = 39, int = 27, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 28, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 28, mnd = 30, chr = 34 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            links  = 2,
        },
        {
            name   = 'Orcish Gladiator MC',
            ids    = { 119, 140, 157, 170 },
            levels = {
                [41] = { acc = 153, eva = 140, agi = 39, int = 28, mnd = 38, chr = 42 },
                [42] = { acc = 156, eva = 142, agi = 39, int = 28, mnd = 38, chr = 42 },
                [43] = { acc = 159, eva = 145, agi = 39, int = 28, mnd = 38, chr = 42 },
                [44] = { acc = 163, eva = 149, agi = 40, int = 28, mnd = 39, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Odqan',
            ids    = { 121, 142 },
            nm     = true,
            levels = {
                [49] = { acc = 178, eva = 165, agi = 53, int = 40, mnd = 40, chr = 48 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 41, mnd = 41, chr = 48 },
                [51] = { acc = 188, eva = 174, agi = 56, int = 41, mnd = 41, chr = 51 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 150, item = 14658 },  -- atlauas ring
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 15373 },  -- bravos subligar
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Mantrap',
            ids    = { 176, 177, 178, 179, 180, 184, 185, 186, 187, 188, 189, 227, 228, 229, 230, 256, 261, 268,
                       269, 274, 276 },
            levels = {
                [45] = { acc = 162, eva = 152, agi = 49, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 156, agi = 51, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 159, agi = 52, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 173, eva = 162, agi = 52, int = 38, mnd = 38, chr = 44 },
                [49] = { acc = 176, eva = 165, agi = 53, int = 40, mnd = 40, chr = 44 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 100, item = 1695 },  -- bunch of habanero peppers
            },
        },
        {
            name   = 'Overgrown Rose',
            ids    = { 181, 182, 190, 191 },
            levels = {
                [47] = { acc = 172, eva = 159, agi = 52, int = 38, mnd = 35, chr = 43 },
                [48] = { acc = 176, eva = 162, agi = 52, int = 38, mnd = 36, chr = 44 },
                [49] = { acc = 179, eva = 165, agi = 53, int = 40, mnd = 38, chr = 44 },
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 38, chr = 45 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 100, item = 920 },  -- malboro vine
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Upyri',
            ids    = { 194 },
            nm     = true,
            levels = {
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 14443 },  -- vampire cloak
                { rate = 150, item = 15197 },  -- vampire mask
                { rate = 150, item = 15338 },  -- vampire boots
                { rate = 50, item = 14783 },  -- vampire earring
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 9,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 195 },
            levels = {
                [49] = { acc = 173, eva = 155, agi = 44, int = 53, mnd = 53, chr = 51 },
                [50] = { acc = 178, eva = 158, agi = 45, int = 54, mnd = 54, chr = 53 },
                [51] = { acc = 183, eva = 163, agi = 47, int = 56, mnd = 56, chr = 54 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1843 },  -- square of spectral crimson
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 196 },
            levels = {
                [48] = { acc = 192, eva = 151, agi = 61, int = 44, mnd = 47, chr = 47 },
                [49] = { acc = 195, eva = 155, agi = 62, int = 44, mnd = 47, chr = 48 },
                [50] = { acc = 213, eva = 157, agi = 63, int = 45, mnd = 50, chr = 48 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 10,
        },
        {
            name   = 'Fomor Summoner',
            ids    = { 202 },
            levels = {
                [48] = { acc = 169, eva = 144, agi = 47, int = 56, mnd = 56, chr = 59 },
                [49] = { acc = 172, eva = 147, agi = 47, int = 56, mnd = 56, chr = 60 },
                [50] = { acc = 175, eva = 151, agi = 50, int = 59, mnd = 59, chr = 62 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 204 },
            levels = {
                [42] = { acc = 151, eva = 136, agi = 44, int = 52, mnd = 42, chr = 42 },
                [43] = { acc = 154, eva = 139, agi = 44, int = 53, mnd = 42, chr = 42 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Diatryma',
            ids    = { 223, 224, 225, 226, 233, 252, 257, 265, 267, 275 },
            levels = {
                [47] = { acc = 171, eva = 160, agi = 55, int = 41, mnd = 41, chr = 46 },
                [48] = { acc = 174, eva = 163, agi = 55, int = 41, mnd = 41, chr = 47 },
                [49] = { acc = 178, eva = 167, agi = 57, int = 44, mnd = 44, chr = 48 },
                [50] = { acc = 181, eva = 170, agi = 57, int = 44, mnd = 44, chr = 48 },
                [51] = { acc = 188, eva = 176, agi = 60, int = 45, mnd = 45, chr = 51 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            drops  = {
                { rate = 150, item = 5209 },  -- slice of diatryma meat
                { rate = 100, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            links  = 11,
        },
        {
            name   = 'Bigclaw',
            ids    = { 234, 235, 236, 237, 240, 241, 242, 247, 248, 249, 253, 254, 258, 259, 262, 263 },
            levels = {
                [45] = { acc = 159, eva = 143, agi = 31, int = 33, mnd = 49, chr = 49 },
                [46] = { acc = 162, eva = 147, agi = 32, int = 34, mnd = 51, chr = 51 },
                [47] = { acc = 165, eva = 149, agi = 32, int = 35, mnd = 52, chr = 52 },
                [48] = { acc = 169, eva = 152, agi = 33, int = 35, mnd = 52, chr = 52 },
                [49] = { acc = 172, eva = 155, agi = 33, int = 35, mnd = 53, chr = 53 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1888 },  -- sack of silica
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
        },
        {
            name   = 'Makara',
            ids    = { 238, 239, 243, 244, 245, 246, 250, 251, 255, 260, 264, 266 },
            levels = {
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 40 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 40 },
                [48] = { acc = 173, eva = 163, agi = 55, int = 38, mnd = 38, chr = 42 },
                [49] = { acc = 176, eva = 167, agi = 57, int = 40, mnd = 40, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 1888 },  -- sack of silica
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 270 },
            levels = {
                [49] = { acc = 183, eva = 167, agi = 47, int = 40, mnd = 44, chr = 57 },
                [50] = { acc = 188, eva = 172, agi = 50, int = 41, mnd = 45, chr = 57 },
                [51] = { acc = 193, eva = 176, agi = 50, int = 41, mnd = 47, chr = 60 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Wyvern',
            ids    = { 271 },
            levels = {
                [42] = { acc = 152, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 149, agi = 49, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
        {
            name   = 'Warder Aglaia',
            ids    = { 277 },
            nm     = true,
            levels = {
                [62] = { acc = 247, eva = 237, agi = 77, int = 56, mnd = 46, chr = 59 },
                [63] = { acc = 252, eva = 243, agi = 78, int = 56, mnd = 46, chr = 59 },
            },
            ranks  = { thunder = -3, stun = -3 },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
            links  = 12,
        },
        {
            name   = 'Warder Euphrosyne',
            ids    = { 278 },
            nm     = true,
            levels = {
                [62] = { acc = 247, eva = 237, agi = 77, int = 56, mnd = 46, chr = 59 },
                [63] = { acc = 252, eva = 243, agi = 78, int = 56, mnd = 46, chr = 59 },
            },
            ranks  = { thunder = -3, stun = -3 },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
            links  = 13,
        },
        {
            name   = 'Warder Thalia',
            ids    = { 279 },
            nm     = true,
            levels = {
                [62] = { acc = 247, eva = 237, agi = 77, int = 56, mnd = 46, chr = 59 },
                [63] = { acc = 252, eva = 243, agi = 78, int = 56, mnd = 46, chr = 59 },
            },
            ranks  = { thunder = -3, stun = -3 },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
            links  = 14,
        },
        {
            name   = 'Bloody Coffin',
            ids    = { 280 },
            nm     = true,
            levels = {
                [50] = { acc = 178, eva = 157, agi = 42, int = 54, mnd = 54, chr = 50 },
                [51] = { acc = 183, eva = 162, agi = 45, int = 56, mnd = 56, chr = 50 },
                [52] = { acc = 188, eva = 167, agi = 45, int = 56, mnd = 56, chr = 50 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            immune = { 'petrify' },
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Boggelmann',
            ids    = { 281 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 272, agi = 69, int = 67, mnd = 51, chr = 53 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Alsha',
            ids    = { 282 },
            nm     = true,
            levels = {
                [55] = { acc = 204, eva = 177, agi = 59, int = 73, mnd = 54, chr = 54 },
            },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror', 'plague' },
        },
        {
            name   = 'Gration',
            ids    = { 283 },
            nm     = true,
            levels = {
                [85] = { acc = 378, eva = 339, agi = 79, int = 88, mnd = 78, chr = 85 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { petrify = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'paralyze', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sight' },
            links  = 15,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Ziphius',
            ids    = { 284 },
            nm     = true,
            levels = {
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 47 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 14807 },  -- hospitaler earring
            },
        },
        {
            name   = 'Tsui-Goab',
            ids    = { 285, 288, 291 },
            nm     = true,
            levels = {
                [65] = { acc = 259, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = 2, ice = -1, wind = 4, earth = 4, thunder = 2, water = -2, light = 2, dark = 2,
                       paralyze = -1, bind = -1, silence = 4, slow = 4, poison = -2, light_sleep = 2,
                       dark_sleep = 2, blind = 2, stun = 2, gravity = 6 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bloodswiller Fly',
            ids    = { 286, 287, 289, 290, 292, 293 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 16,
        },
        {
            name   = 'Tiyanak',
            ids    = { 295 },
            levels = {},
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 17,
        },
        {
            name   = 'Volatile Cluster',
            ids    = { 298 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
    },
    by_name = {},
}
