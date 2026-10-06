-- Rolanberry Fields (zone 110).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Berry Grub' } },
        [2] = { sight = { 'Death Wasp' } },
        [3] = { sound = { 'Black Triple Stars', 'Midnight Wings', 'Moon Bat' } },
        [4] = { sound = { 'Berry Grub', 'Silk Caterpillar' } },
        [5] = {
            sound = { 'Brass Quadav', 'Bronze Quadav', 'Copper Quadav', 'Garnet Quadav', 'Old Quadav',
                      'Silver Quadav', 'Zircon Quadav' },
        },
        [6] = {
            sight = { 'Chuglix Berrypaws', 'Goblin Digger', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher',
                      'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy' },
        },
        [7] = { sound = { 'Poison Leech' } },
        [8] = {
            sight = { 'Chuglix Berrypaws', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                      'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy' },
        },
        [9] = {
            sight = { 'Goblin Digger', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                      'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy' },
        },
        [10] = { true_sight = { 'Yatagarasu' } },
    },
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1 },
            levels = {
                [22] = { acc = 79, eva = 71, agi = 16, int = 17, mnd = 24, chr = 24 },
                [23] = { acc = 82, eva = 74, agi = 16, int = 17, mnd = 24, chr = 24 },
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
            name   = 'Big Jaw',
            ids    = { 2 },
            levels = {
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 19 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 19 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Horrid Fluke',
            ids    = { 3 },
            levels = {
                [29] = { acc = 105, eva = 98, agi = 30, int = 25, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 101, agi = 31, int = 25, mnd = 23, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 4 },
            levels = {
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24 },
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 24 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Big Leech',
            ids    = { 5 },
            levels = {
                [34] = { acc = 123, eva = 115, agi = 36, int = 29, mnd = 26, chr = 29 },
                [35] = { acc = 126, eva = 118, agi = 36, int = 30, mnd = 27, chr = 30 },
                [36] = { acc = 130, eva = 122, agi = 38, int = 31, mnd = 28, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Silk Caterpillar',
            ids    = { 6 },
            nm     = true,
            levels = {
                [28] = { acc = 101, eva = 94, agi = 28, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 97, agi = 29, int = 22, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 100, agi = 29, int = 23, mnd = 23, chr = 26 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4526 },  -- silkworm egg
                { rate = 150, item = 816 },  -- spool of silk thread
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Death Wasp',
            ids    = { 7, 8, 9, 10, 19, 20, 21, 22, 33, 34, 35, 36, 127, 128, 129, 130, 139, 140, 141, 142, 149,
                       150, 151, 152, 254, 255, 256, 257, 265, 266, 267, 268, 276, 277, 278, 279, 381, 382, 383,
                       384, 392, 393, 394, 395, 403, 404, 423, 424, 425, 426, 431, 432, 433, 434, 439, 440, 441,
                       442 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
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
            links  = 2,
        },
        {
            name   = 'Moon Bat',
            ids    = { 11, 12, 13, 23, 24, 25, 37, 38, 39, 131, 132, 133, 143, 144, 145, 153, 154, 155, 258, 259,
                       260, 269, 270, 271, 280, 281, 282, 388, 389, 390, 398, 399, 407, 408, 429, 430, 437, 438,
                       445, 446 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 3,
        },
        {
            name   = 'Goobbue Farmer',
            ids    = { 14, 26, 40, 134, 146, 156, 248, 261, 272, 283, 391, 409 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 33, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, dark = -2, dark_sleep = -2, blind = -2 },
            drops  = {
                { rate = 50, item = 953 },  -- treant bulb
                { rate = 50, item = 1237 },  -- bag of tree cuttings
                { rate = 50, item = 959 },  -- dahlia
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Berry Grub',
            ids    = { 15, 16, 17, 18, 27, 28, 29, 30, 31, 32, 41, 42, 43, 44, 45, 56, 57, 58, 59, 66, 67, 68, 69,
                       76, 77, 78, 79, 86, 87, 88, 89, 96, 97, 98, 99, 116, 117, 118, 119, 135, 136, 137, 138, 147,
                       148, 157, 158, 169, 170, 171, 178, 179, 180, 187, 188, 189, 207, 208, 209, 217, 218, 219,
                       226, 227, 262, 263, 264, 273, 274, 275, 284, 285, 286, 287, 288, 289, 290, 301, 302, 303,
                       311, 316, 331, 332, 335, 336, 344, 345, 400, 401, 402 },
            levels = {
                [27] = { acc = 98, eva = 90, agi = 27, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 28, int = 21, mnd = 21, chr = 25 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            links  = 4,
        },
        {
            name   = 'Old Quadav',
            ids    = { 46, 159, 291, 412 },
            levels = {
                [27] = { acc = 100, eva = 91, agi = 29, int = 19, mnd = 21, chr = 24 },
                [28] = { acc = 103, eva = 94, agi = 29, int = 20, mnd = 21, chr = 25 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Copper Quadav',
            ids    = { 47, 160, 292, 413 },
            levels = {
                [27] = { acc = 102, eva = 109, agi = 31, int = 27, mnd = 20, chr = 20 },
                [28] = { acc = 106, eva = 113, agi = 32, int = 28, mnd = 20, chr = 20 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { gravity = 10 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Bronze Quadav',
            ids    = { 48, 161, 293, 414 },
            levels = {
                [32] = { acc = 115, eva = 102, agi = 23, int = 22, mnd = 33, chr = 33 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 22, mnd = 34, chr = 34 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { sleep = 10 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Brass Quadav',
            ids    = { 49, 162, 294, 415 },
            levels = {
                [27] = { acc = 100, eva = 90, agi = 26, int = 27, mnd = 20, chr = 20 },
                [28] = { acc = 103, eva = 93, agi = 26, int = 28, mnd = 20, chr = 20 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { paralyze = 10 },
            drops  = {
                { rate = 150, item = 17397 },  -- shell bug
                { rate = 100, group = {  -- one of
                    { 608, 1 },  -- quadav fetich arms
                    { 609, 1 },  -- quadav fetich legs
                    { 606, 1 },  -- quadav fetich head
                    { 607, 1 },  -- quadav fetich torso
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Silver Quadav',
            ids    = { 50, 163, 295, 416 },
            levels = {
                [32] = { acc = 120, eva = 138, agi = 35, int = 32, mnd = 23, chr = 23 },
                [33] = { acc = 124, eva = 142, agi = 37, int = 32, mnd = 24, chr = 24 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { gravity = 10 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Zircon Quadav',
            ids    = { 51, 164, 296, 417 },
            levels = {
                [32] = { acc = 117, eva = 97, agi = 33, int = 38, mnd = 28, chr = 30 },
                [33] = { acc = 121, eva = 101, agi = 34, int = 39, mnd = 29, chr = 32 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Garnet Quadav',
            ids    = { 52, 165, 297, 418 },
            levels = {
                [32] = { acc = 113, eva = 95, agi = 28, int = 27, mnd = 39, chr = 33 },
                [33] = { acc = 117, eva = 98, agi = 29, int = 27, mnd = 41, chr = 34 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 17045 },  -- maul
                { rate = 100, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4744 },  -- scroll of invisible
                { rate = 50, item = 4681 },  -- scroll of barpoison
                { rate = 10, item = 4746 },  -- scroll of deodorize
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Wight war',
            ids    = { 53, 114, 166, 205, 242, 298, 329, 368, 419 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 23, mnd = 21, chr = 26 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 23, chr = 28 },
                [33] = { acc = 120, eva = 111, agi = 34, int = 26, mnd = 24, chr = 29 },
                [34] = { acc = 124, eva = 115, agi = 36, int = 26, mnd = 24, chr = 29 },
            },
            spawn_levels = { [53] = { 32, 34 }, [114] = { 31, 33 }, [166] = { 32, 34 }, [205] = { 28, 33 },
                             [242] = { 28, 33 }, [298] = { 32, 34 }, [329] = { 28, 33 }, [368] = { 28, 33 },
                             [419] = { 32, 34 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4872 },  -- scroll of tractor
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wight blm',
            ids    = { 54, 115, 167, 206, 243, 299, 330, 369, 420 },
            levels = {
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26 },
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26 },
                [30] = { acc = 109, eva = 91, agi = 31, int = 36, mnd = 24, chr = 28 },
                [31] = { acc = 114, eva = 95, agi = 33, int = 39, mnd = 27, chr = 30 },
                [32] = { acc = 117, eva = 97, agi = 33, int = 39, mnd = 27, chr = 30 },
                [33] = { acc = 120, eva = 101, agi = 34, int = 41, mnd = 27, chr = 32 },
                [34] = { acc = 124, eva = 104, agi = 36, int = 42, mnd = 27, chr = 32 },
            },
            spawn_levels = { [54] = { 32, 34 }, [115] = { 31, 33 }, [167] = { 32, 34 }, [206] = { 28, 33 },
                             [243] = { 28, 33 }, [299] = { 32, 34 }, [330] = { 28, 33 }, [369] = { 28, 33 },
                             [420] = { 32, 34 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4872 },  -- scroll of tractor
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 55, 168, 334 },
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37 },
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
            name   = 'Ochu',
            ids    = { 60, 61, 70, 71, 80, 81, 90, 91, 100, 101, 120, 121, 172, 173, 181, 182, 190, 191, 210, 211,
                       220, 221, 304, 305, 312, 317, 346, 359, 410, 459 },
            levels = {
                [36] = { acc = 132, eva = 122, agi = 38, int = 28, mnd = 26, chr = 32 },
                [37] = { acc = 135, eva = 124, agi = 38, int = 29, mnd = 27, chr = 32 },
            },
            ph_for = { [459] = { 460 } },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 50, item = 1709 },  -- naphille pochette
                { rate = 50, item = 13838 },  -- dodge headband
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Midnight Wings',
            ids    = { 62, 63, 64, 65, 72, 73, 74, 75, 82, 83, 84, 85, 92, 93, 94, 95, 102, 103, 104, 105, 122, 123,
                       124, 125, 174, 175, 176, 177, 183, 184, 185, 186, 192, 193, 194, 195, 212, 213, 214, 215,
                       222, 223, 224, 225, 232, 233, 249, 250, 306, 307, 308, 309, 313, 314, 315, 318, 319, 320,
                       339, 340, 352, 353, 385, 386, 387, 396, 397, 405, 406, 427, 428, 435, 436, 443, 444 },
            levels = {
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
            },
            ph_for = { [192] = { 196 }, [212] = { 216 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 3,
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 106, 197, 234, 321, 360, 447 },
            levels = {
                [26] = { acc = 98, eva = 107, agi = 33, int = 28, mnd = 19, chr = 19 },
                [27] = { acc = 102, eva = 110, agi = 33, int = 29, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 750 },  -- silver beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 107, 198, 235, 322, 361, 448 },
            levels = {
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
                [32] = { acc = 117, eva = 104, agi = 27, int = 28, mnd = 28, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 50, item = 1708 },  -- handful of counterfeit gil
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblins Bee',
            ids    = { 108, 199, 236, 323, 362, 449 },
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            links  = 2,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 109, 200, 237, 324, 363, 450 },
            levels = {
                [26] = { acc = 93, eva = 79, agi = 26, int = 23, mnd = 31, chr = 28 },
                [27] = { acc = 96, eva = 82, agi = 26, int = 24, mnd = 33, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 50, item = 4666 },  -- scroll of paralyze
                { rate = 10, item = 4680 },  -- scroll of barsleep
                { rate = 10, item = 750 },  -- silver beastcoin
                { rate = 10, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4681 },  -- scroll of barpoison
                { rate = 10, item = 4733 },  -- scroll of protectra
                { rate = 10, item = 4745 },  -- scroll of sneak
                { rate = 5, item = 4744 },  -- scroll of invisible
                { rate = 5, item = 4746 },  -- scroll of deodorize
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 110, 201, 238, 325, 364, 451 },
            levels = {
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
                { rate = 10, item = 850 },  -- square of sheep leather
                { rate = 10, item = 848 },  -- square of dhalmel leather
                { rate = 5, item = 855 },  -- square of black tiger leather
                { rate = 1, item = 506 },  -- square of coeurl leather
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 111, 202, 239, 326, 365, 452 },
            levels = {
                [26] = { acc = 97, eva = 81, agi = 31, int = 31, mnd = 23, chr = 24 },
                [27] = { acc = 100, eva = 84, agi = 31, int = 33, mnd = 24, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 952 },  -- bag of poison flour
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 112, 203, 240, 327, 366, 453 },
            levels = {
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
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
            links  = 6,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 113, 204, 241, 328, 367, 454 },
            levels = {
                [31] = { acc = 114, eva = 97, agi = 36, int = 39, mnd = 28, chr = 30 },
                [32] = { acc = 117, eva = 99, agi = 36, int = 39, mnd = 28, chr = 30 },
            },
            spawn_levels = { [113] = { 31, 31 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 749 },  -- mythril beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Ignis Fatuus',
            ids    = { 126, 300, 421 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 36, int = 24, mnd = 26, chr = 32 },
                [35] = { acc = 127, eva = 118, agi = 36, int = 26, mnd = 27, chr = 33 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 26, mnd = 28, chr = 35 },
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
            name   = 'Black Triple Stars',
            ids    = { 196, 216 },
            nm     = true,
            levels = {
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 1000, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
            },
            links  = 3,
        },
        {
            name   = 'Poison Leech',
            ids    = { 228, 229, 230, 231, 337, 338, 347, 348, 349, 350, 351, 455, 456, 457, 458 },
            levels = {
                [25] = { acc = 91, eva = 85, agi = 26, int = 22, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 89, agi = 28, int = 23, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 7,
        },
        {
            name   = 'Clipper',
            ids    = { 244, 245, 246, 341, 342, 354, 355, 356, 357, 461, 462, 463, 464 },
            levels = {
                [24] = { acc = 85, eva = 77, agi = 16, int = 18, mnd = 26, chr = 26 },
                [25] = { acc = 89, eva = 80, agi = 17, int = 18, mnd = 26, chr = 26 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 247, 343, 358 },
            levels = {
                [38] = { acc = 135, eva = 121, agi = 37, int = 43, mnd = 34, chr = 34 },
                [39] = { acc = 140, eva = 126, agi = 40, int = 45, mnd = 35, chr = 37 },
                [40] = { acc = 143, eva = 129, agi = 40, int = 45, mnd = 35, chr = 37 },
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
            name   = 'Evil Weapon',
            ids    = { 251, 252, 253, 372, 373, 375, 376, 377, 378, 379, 380 },
            levels = {
                [37] = { acc = 134, eva = 124, agi = 38, int = 37, mnd = 29, chr = 37 },
                [38] = { acc = 137, eva = 127, agi = 38, int = 37, mnd = 29, chr = 38 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Evil Spirit',
            ids    = { 333, 370, 371, 411, 422 },
            levels = {
                [35] = { acc = 126, eva = 118, agi = 36, int = 34, mnd = 26, chr = 34 },
                [36] = { acc = 130, eva = 122, agi = 38, int = 35, mnd = 27, chr = 35 },
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
            name   = 'Drooling Daisy',
            ids    = { 460 },
            nm     = true,
            levels = {
                [39] = { acc = 142, eva = 131, agi = 40, int = 31, mnd = 29, chr = 35 },
                [40] = { acc = 145, eva = 134, agi = 40, int = 31, mnd = 29, chr = 35 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 150, item = 13838 },  -- dodge headband
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Digger',
            ids    = { 465 },
            levels = {
                [28] = { acc = 106, eva = 114, agi = 34, int = 29, mnd = 20, chr = 20 },
                [29] = { acc = 109, eva = 117, agi = 35, int = 30, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Simurgh',
            ids    = { 466 },
            nm     = true,
            levels = {
                [58] = { acc = 550, eva = 430, agi = 60, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = 10, ice = 10, wind = 4, earth = 4, thunder = 4, water = -2, light = 4, dark = 4,
                       paralyze = 10, bind = 10, silence = 4, slow = 4, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 4172 },  -- reraiser
                { rate = 1000, item = 4174 },  -- vile elixir
                { rate = 1000, item = 17416 },  -- arcana breaker
                { rate = 150, item = 15736 },  -- trotter boots
                { rate = 50, item = 658 },  -- damascus ingot
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Chuglix Berrypaws',
            ids    = { 473 },
            nm     = true,
            levels = {
                [1] = { acc = 11, eva = 11, agi = 10, int = 9, mnd = 6, chr = 6 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Yatagarasu',
            ids    = { 486, 487, 488 },
            nm     = true,
            levels = {
                [94] = { acc = 440, eva = 404, agi = 102, int = 78, mnd = 78, chr = 86 },
                [95] = { acc = 447, eva = 409, agi = 102, int = 78, mnd = 78, chr = 87 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Strix',
            ids    = { 490 },
            nm     = true,
            levels = {},
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
