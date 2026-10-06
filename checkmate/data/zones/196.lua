-- Gusgen Mines (zone 196).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Fly Agaric', 'Myconid' } },
        [2] = { sound = { 'Amphisbaena', 'Ore Eater' } },
        [3] = { sound = { 'Aroma Fly', 'Gallinipper', 'Sadfly' } },
        [4] = { sound = { 'Gallinipper', 'Sadfly' } },
    },
    monsters = {
        {
            name   = 'Pirate Pugil',
            ids    = { 1, 2 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 17 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 19 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 22 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 22 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ooze',
            ids    = { 4 },
            levels = {
                [30] = { acc = 108, eva = 100, agi = 29, int = 23, mnd = 25, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 32, int = 24, mnd = 27, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 32, int = 24, mnd = 27, chr = 28 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mush',
            ids    = { 5 },
            levels = {
                [35] = { acc = 126, eva = 117, agi = 35, int = 27, mnd = 30, chr = 30 },
                [36] = { acc = 130, eva = 121, agi = 36, int = 28, mnd = 31, chr = 32 },
                [37] = { acc = 133, eva = 123, agi = 36, int = 29, mnd = 32, chr = 32 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Blind Moby',
            ids    = { 6 },
            nm     = true,
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 22 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 563 },  -- chunk of glocolite
                { rate = 240, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Smothered Schmidt',
            ids    = { 7 },
            nm     = true,
            levels = {
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
                [37] = { acc = 133, eva = 124, agi = 38, int = 37, mnd = 28, chr = 35 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 37, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze' },
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Crushed Krause',
            ids    = { 8 },
            nm     = true,
            levels = {
                [37] = { acc = 133, eva = 124, agi = 38, int = 37, mnd = 28, chr = 35 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 37, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 825 },  -- square of cotton cloth
                { rate = 150, item = 13508 },  -- maldust ring
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Pulverized Pfeffer',
            ids    = { 9 },
            nm     = true,
            levels = {
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
                [37] = { acc = 133, eva = 124, agi = 38, int = 37, mnd = 28, chr = 35 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 37, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 825 },  -- square of cotton cloth
                { rate = 150, item = 13509 },  -- malfrost ring
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Burned Bergmann',
            ids    = { 10 },
            nm     = true,
            levels = {
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
                [37] = { acc = 133, eva = 124, agi = 38, int = 37, mnd = 28, chr = 35 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 37, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 825 },  -- square of cotton cloth
                { rate = 150, item = 13510 },  -- malflame ring
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wounded Wurfel',
            ids    = { 11 },
            nm     = true,
            levels = {
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
                [37] = { acc = 133, eva = 124, agi = 38, int = 37, mnd = 28, chr = 35 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 37, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 825 },  -- square of cotton cloth
                { rate = 150, item = 13511 },  -- malflash ring
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Asphyxiated Amsel',
            ids    = { 12 },
            nm     = true,
            levels = {
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
                [37] = { acc = 133, eva = 124, agi = 38, int = 37, mnd = 28, chr = 35 },
                [38] = { acc = 136, eva = 127, agi = 38, int = 37, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze' },
            drops  = {
                { rate = 1000, item = 825 },  -- square of cotton cloth
                { rate = 150, item = 13512 },  -- malgust ring
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Skeleton Warrior GM',
            ids    = { 13, 14, 15, 16, 17, 18, 74, 75 },
            levels = {
                [15] = { acc = 58, eva = 53, agi = 18, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 62, eva = 57, agi = 20, int = 14, mnd = 13, chr = 16 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 15, mnd = 14, chr = 16 },
            },
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
            name   = 'Fly Agaric GM',
            ids    = { 19, 20, 21, 22, 23, 24, 25, 26 },
            levels = {
                [20] = { acc = 74, eva = 69, agi = 22, int = 15, mnd = 16, chr = 18 },
                [21] = { acc = 78, eva = 73, agi = 24, int = 17, mnd = 18, chr = 20 },
                [22] = { acc = 81, eva = 75, agi = 24, int = 17, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 17, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 100, item = 4373 },  -- woozyshroom
            },
            links  = 1,
        },
        {
            name   = 'Ghoul war GM MoS',
            ids    = { 27, 28, 29, 41, 42, 44, 45, 46, 52, 53, 54, 60, 61, 62, 66, 67, 68, 70, 71, 76, 77, 80, 81 },
            levels = {
                [20] = { acc = 75, eva = 69, agi = 22, int = 16, mnd = 15, chr = 18 },
                [21] = { acc = 79, eva = 73, agi = 24, int = 18, mnd = 17, chr = 20 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 18, mnd = 17, chr = 20 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 18, mnd = 17, chr = 20 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 19, mnd = 17, chr = 21 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 538 },  -- magicked skull
                { rate = 10, item = 4824 },  -- scroll of gravity
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ghoul blm GM',
            ids    = { 30, 43, 47, 55, 56, 63 },
            levels = {
                [23] = { acc = 85, eva = 71, agi = 24, int = 28, mnd = 19, chr = 22 },
                [24] = { acc = 89, eva = 74, agi = 26, int = 29, mnd = 19, chr = 24 },
                [25] = { acc = 92, eva = 77, agi = 26, int = 31, mnd = 22, chr = 24 },
                [26] = { acc = 96, eva = 80, agi = 28, int = 31, mnd = 22, chr = 24 },
                [27] = { acc = 99, eva = 83, agi = 29, int = 33, mnd = 22, chr = 26 },
            },
            spawn_levels = { [43] = { 24, 27 }, [47] = { 24, 27 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 538 },  -- magicked skull
                { rate = 10, item = 4824 },  -- scroll of gravity
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bandersnatch',
            ids    = { 31, 32, 33, 37, 48, 49, 64, 65, 69, 72, 73, 78, 79 },
            levels = {
                [21] = { acc = 78, eva = 73, agi = 24, int = 18, mnd = 17, chr = 22 },
                [22] = { acc = 81, eva = 75, agi = 24, int = 18, mnd = 17, chr = 22 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 18, mnd = 17, chr = 22 },
                [24] = { acc = 88, eva = 82, agi = 26, int = 19, mnd = 17, chr = 23 },
            },
            spawn_levels = { [37] = { 22, 24 }, [69] = { 22, 24 } },
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
            name   = 'Ore Eater',
            ids    = { 34, 35, 36, 38, 39, 40, 100, 101, 102, 155, 156, 157, 158, 159, 160 },
            levels = {
                [23] = { acc = 84, eva = 74, agi = 23, int = 30, mnd = 21, chr = 21 },
                [24] = { acc = 88, eva = 78, agi = 25, int = 31, mnd = 22, chr = 22 },
                [25] = { acc = 91, eva = 81, agi = 26, int = 32, mnd = 23, chr = 23 },
                [26] = { acc = 94, eva = 84, agi = 27, int = 34, mnd = 24, chr = 23 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            links  = 2,
        },
        {
            name   = 'Spunkie GM',
            ids    = { 50, 51, 59, 116, 117, 128, 129 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 20, mnd = 21, chr = 27 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 21, mnd = 22, chr = 28 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 21, mnd = 23, chr = 28 },
            },
            spawn_levels = { [50] = { 29, 30 }, [51] = { 28, 29 }, [59] = { 29, 30 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
                { rate = 10, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Bogy',
            ids    = { 57, 58, 92, 93, 94, 110, 111, 112, 140, 141 },
            levels = {
                [27] = { acc = 98, eva = 91, agi = 29, int = 25, mnd = 20, chr = 26 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 26, mnd = 21, chr = 27 },
                [29] = { acc = 105, eva = 98, agi = 30, int = 28, mnd = 22, chr = 28 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 540 },  -- bloody robe
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wendigo war',
            ids    = { 82, 87, 95, 96, 97, 104, 105, 107, 108, 109, 120, 121, 122, 133, 138, 139, 195, 196, 199,
                       201 },
            levels = {
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 19, chr = 23 },
                [27] = { acc = 99, eva = 91, agi = 29, int = 21, mnd = 19, chr = 24 },
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 21, chr = 26 },
            },
            spawn_levels = { [107] = { 30, 30 }, [108] = { 28, 30 }, [109] = { 28, 30 }, [120] = { 28, 30 },
                             [121] = { 28, 30 }, [122] = { 28, 30 }, [133] = { 28, 30 }, [138] = { 28, 30 },
                             [139] = { 28, 30 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Sadfly',
            ids    = { 83, 84, 85, 88, 89, 90, 114, 115, 142, 143, 144, 145, 146, 147, 148, 149 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
            },
            spawn_levels = { [114] = { 27, 29 }, [115] = { 27, 29 }, [142] = { 27, 29 }, [143] = { 27, 29 },
                             [144] = { 27, 29 }, [145] = { 27, 29 }, [146] = { 27, 29 }, [147] = { 27, 29 },
                             [148] = { 27, 29 }, [149] = { 27, 29 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            links  = 3,
        },
        {
            name   = 'Jelly KT GM',
            ids    = { 86, 91, 103, 113, 161, 162 },
            levels = {
                [27] = { acc = 98, eva = 90, agi = 27, int = 21, mnd = 23, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 28, int = 21, mnd = 23, chr = 25 },
                [29] = { acc = 105, eva = 97, agi = 29, int = 22, mnd = 25, chr = 25 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Wight blm',
            ids    = { 98, 99, 106, 118, 119, 130, 134, 135, 150, 151, 153, 154 },
            levels = {
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26 },
                [30] = { acc = 109, eva = 91, agi = 31, int = 36, mnd = 24, chr = 28 },
                [31] = { acc = 114, eva = 95, agi = 33, int = 39, mnd = 27, chr = 30 },
                [32] = { acc = 117, eva = 97, agi = 33, int = 39, mnd = 27, chr = 30 },
                [33] = { acc = 120, eva = 101, agi = 34, int = 41, mnd = 27, chr = 32 },
                [34] = { acc = 124, eva = 104, agi = 36, int = 42, mnd = 27, chr = 32 },
            },
            spawn_levels = { [98] = { 29, 33 }, [99] = { 29, 33 }, [106] = { 29, 33 }, [118] = { 30, 34 },
                             [119] = { 30, 34 }, [130] = { 30, 34 }, [134] = { 30, 34 }, [135] = { 30, 34 },
                             [150] = { 30, 34 }, [151] = { 30, 34 }, [153] = { 30, 34 }, [154] = { 30, 34 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1031 },  -- gusgen chest key
                { rate = 10, item = 4872 },  -- scroll of tractor
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Amphisbaena',
            ids    = { 123, 124, 125, 126, 127, 233, 234, 235, 236, 239, 240, 241 },
            levels = {
                [28] = { acc = 101, eva = 90, agi = 28, int = 35, mnd = 26, chr = 25 },
                [29] = { acc = 104, eva = 93, agi = 29, int = 37, mnd = 26, chr = 25 },
                [30] = { acc = 108, eva = 97, agi = 30, int = 37, mnd = 27, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 150, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 736 },  -- chunk of silver ore
                { rate = 10, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 2,
        },
        {
            name   = 'Banshee GM',
            ids    = { 131, 132, 136, 137, 152, 243, 244, 245, 298, 299, 304 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 33, int = 31, mnd = 24, chr = 32 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 31, mnd = 24, chr = 32 },
                [33] = { acc = 119, eva = 111, agi = 34, int = 32, mnd = 25, chr = 32 },
                [34] = { acc = 123, eva = 115, agi = 36, int = 34, mnd = 25, chr = 33 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4871 },  -- scroll of escape
                { rate = 50, item = 1031 },  -- gusgen chest key
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Mauthe Doog GM',
            ids    = { 163, 164, 197, 198, 200, 202, 232, 238, 250, 251, 289, 290, 293, 297, 300 },
            levels = {
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 20, chr = 27 },
                [29] = { acc = 105, eva = 98, agi = 30, int = 22, mnd = 21, chr = 28 },
                [30] = { acc = 108, eva = 101, agi = 31, int = 23, mnd = 21, chr = 28 },
                [31] = { acc = 112, eva = 105, agi = 33, int = 24, mnd = 23, chr = 31 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 4,
                       bind = 4, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 858 },  -- wolf hide
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Myconid',
            ids    = { 203, 204, 205, 206, 207, 212, 213, 253, 254, 255, 260, 261, 262 },
            levels = {
                [30] = { acc = 108, eva = 101, agi = 31, int = 21, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 33, int = 23, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 23, mnd = 24, chr = 28 },
            },
            spawn_levels = { [260] = { 31, 32 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 100, item = 4373 },  -- woozyshroom
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Feu Follet',
            ids    = { 208, 209, 223, 224, 230, 231 },
            levels = {
                [35] = { acc = 127, eva = 118, agi = 36, int = 26, mnd = 27, chr = 33 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 26, mnd = 28, chr = 35 },
                [37] = { acc = 134, eva = 124, agi = 38, int = 27, mnd = 29, chr = 35 },
                [38] = { acc = 137, eva = 127, agi = 38, int = 28, mnd = 29, chr = 36 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
                { rate = 10, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 210, 214 },
            levels = {
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 211, 215 },
            levels = {
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Juggler Hecatomb',
            ids    = { 216 },
            nm     = true,
            levels = {
                [46] = { acc = 164, eva = 145, agi = 40, int = 57, mnd = 48, chr = 48 },
                [47] = { acc = 168, eva = 148, agi = 41, int = 58, mnd = 49, chr = 50 },
                [48] = { acc = 171, eva = 151, agi = 42, int = 59, mnd = 50, chr = 51 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 240, item = 16868 },  -- heavy halberd
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Rancid Ooze',
            ids    = { 217, 237, 242, 275, 276 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 32, int = 24, mnd = 27, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 32, int = 24, mnd = 27, chr = 28 },
                [33] = { acc = 119, eva = 110, agi = 32, int = 26, mnd = 28, chr = 29 },
                [34] = { acc = 123, eva = 114, agi = 34, int = 26, mnd = 29, chr = 29 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Gallinipper GM',
            ids    = { 218, 219, 220, 221, 222, 225, 226, 227, 228, 229, 266, 267, 268, 272, 273, 274 },
            levels = {
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 119, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29 },
                [34] = { acc = 123, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29 },
                [35] = { acc = 126, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Wight war GM',
            ids    = { 246, 247, 248, 256, 257, 258, 263, 264, 269, 270, 291, 292, 294, 295, 301, 302 },
            levels = {
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 23, chr = 28 },
                [33] = { acc = 120, eva = 111, agi = 34, int = 26, mnd = 24, chr = 29 },
                [34] = { acc = 124, eva = 115, agi = 36, int = 26, mnd = 24, chr = 29 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1031 },  -- gusgen chest key
                { rate = 10, item = 4872 },  -- scroll of tractor
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ghast blm GM',
            ids    = { 249, 259, 265, 271, 296, 303 },
            levels = {
                [33] = { acc = 120, eva = 101, agi = 34, int = 41, mnd = 27, chr = 32 },
                [34] = { acc = 124, eva = 104, agi = 36, int = 42, mnd = 27, chr = 32 },
                [35] = { acc = 127, eva = 107, agi = 36, int = 43, mnd = 29, chr = 32 },
                [36] = { acc = 131, eva = 110, agi = 38, int = 44, mnd = 30, chr = 34 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 240, item = 880 },  -- bone chip
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Foul Meat',
            ids    = { 252, 288 },
            levels = {
                [43] = { acc = 154, eva = 144, agi = 44, int = 33, mnd = 31, chr = 41 },
                [44] = { acc = 158, eva = 148, agi = 47, int = 34, mnd = 31, chr = 42 },
                [45] = { acc = 161, eva = 151, agi = 47, int = 36, mnd = 34, chr = 43 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 100, item = 849 },  -- undead skin
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 13120 },  -- clay amulet
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287 },
            levels = {
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 27 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
                { rate = 50, item = 1031 },  -- gusgen chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Wandering Ghost',
            ids    = { 305 },
            nm     = true,
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 44, mnd = 35, chr = 44 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 10, bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 10, stun = 10, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 13122 },  -- miners pendant
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Pudding',
            ids    = { 306, 307 },
            nm     = true,
            levels = {
                [22] = { acc = 81, eva = 74, agi = 23, int = 18, mnd = 20, chr = 20 },
                [23] = { acc = 84, eva = 77, agi = 23, int = 18, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 308 },
            nm     = true,
            levels = {
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
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
            name   = 'Aroma Fly',
            ids    = { 309 },
            nm     = true,
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Lorbulcrud',
            ids    = { 311, 312 },
            nm     = true,
            levels = {
                [90] = { acc = 407, eva = 366, agi = 65, int = 77, mnd = 82, chr = 107 },
                [91] = { acc = 415, eva = 371, agi = 66, int = 79, mnd = 85, chr = 109 },
                [92] = { acc = 422, eva = 376, agi = 66, int = 79, mnd = 85, chr = 109 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            magic_dmg = { all = -25 },
        },
    },
    by_name = {},
}
