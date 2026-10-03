-- Maze of Shakhrami (zone 198).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher',
                'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy', 'Goblin Tinkerer' },
        [2] = { 'Abyss Worm', 'Maze Maker' },
        [3] = { 'Ancient Bat', 'Combat', 'Seeker Bats', 'Stink Bats' },
        [4] = { 'Aroma Crawler', 'Carnivorous Crawler', 'Caterchipillar' },
        [5] = { 'Leech King', 'Poison Leech' },
        [6] = { 'Poison Leech' },
        [7] = { 'Wyrmfly' },
        [8] = { 'Carnivorous Crawler', 'Caterchipillar' },
        [9] = { 'Ogbunabali' },
    },
    monsters = {
        {
            name   = 'Ichorous Ire',
            ids    = { 1 },
            nm     = true,
            levels = {
                [35] = { acc = 126, eva = 117, agi = 35, int = 27, mnd = 30, chr = 30 },
                [36] = { acc = 130, eva = 121, agi = 36, int = 28, mnd = 31, chr = 32 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 16511 },  -- burnite shell stone
                { rate = 100, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 2, 5, 17, 20, 39, 42, 55, 58, 73, 76, 250, 253, 277, 280 },
            levels = {
                [16] = { acc = 70, eva = 53, agi = 24, int = 16, mnd = 17, chr = 16 },
                [17] = { acc = 74, eva = 56, agi = 25, int = 16, mnd = 17, chr = 16 },
                [18] = { acc = 77, eva = 58, agi = 25, int = 17, mnd = 17, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 937 },  -- block of animal glue
                { rate = 10, item = 12440 },  -- leather bandana
                { rate = 10, item = 12696 },  -- leather gloves
                { rate = 10, item = 12824 },  -- leather trousers
                { rate = 10, item = 12952 },  -- leather highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 3, 6, 18, 21, 40, 43, 56, 59, 74, 77, 251, 254, 278, 281 },
            levels = {
                [16] = { acc = 62, eva = 56, agi = 19, int = 20, mnd = 14, chr = 14 },
                [17] = { acc = 65, eva = 58, agi = 19, int = 20, mnd = 14, chr = 14 },
                [18] = { acc = 68, eva = 61, agi = 19, int = 20, mnd = 14, chr = 14 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 4, 7, 19, 22, 41, 44, 57, 60, 75, 78, 252, 255, 279, 282 },
            levels = {
                [16] = { acc = 62, eva = 58, agi = 22, int = 14, mnd = 14, chr = 16 },
                [17] = { acc = 65, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 68, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Maze Maker',
            ids    = { 8, 9, 10, 11, 23, 24, 25, 26, 45, 46, 47, 52, 53, 256, 257, 258, 267, 268, 272, 273 },
            levels = {
                [18] = { acc = 66, eva = 58, agi = 19, int = 25, mnd = 18, chr = 17 },
                [19] = { acc = 70, eva = 62, agi = 21, int = 27, mnd = 19, chr = 18 },
                [20] = { acc = 73, eva = 65, agi = 21, int = 27, mnd = 19, chr = 18 },
                [21] = { acc = 78, eva = 69, agi = 23, int = 29, mnd = 21, chr = 21 },
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
            name   = 'Stink Bats',
            ids    = { 12, 13, 14, 15, 27, 28, 29, 33, 34, 48, 49, 61, 62, 63, 69, 70, 71, 259, 260, 269, 270, 274,
                       275, 283, 284 },
            levels = {
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
                [16] = { acc = 61, eva = 58, agi = 22, int = 14, mnd = 14, chr = 16 },
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
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
            name   = 'Combat MoS',
            ids    = { 16, 30, 31, 35, 36, 50, 51, 64, 65, 79, 80, 89, 90, 96, 97, 105, 106, 261, 262, 271, 276,
                       285 },
            levels = {
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18 },
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 20 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
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
            name   = 'Carnivorous Crawler',
            ids    = { 32, 37, 38, 66, 67, 68, 81, 82, 91, 92, 98, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116,
                       120, 121, 378, 379, 380, 381, 382, 391, 392, 393 },
            levels = {
                [22] = { acc = 81, eva = 74, agi = 23, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 77, agi = 23, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 81, agi = 24, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 84, agi = 25, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            links  = 4,
        },
        {
            name   = 'Maze Scorpion',
            ids    = { 72, 117, 118, 119, 142, 143, 159, 174, 383, 384 },
            levels = {
                [25] = { acc = 90, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 94, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 97, eva = 91, agi = 29, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 25 },
            },
            spawn_levels = { [72] = { 25, 27 }, [117] = { 25, 27 }, [118] = { 25, 27 }, [119] = { 25, 27 },
                             [383] = { 25, 27 }, [384] = { 25, 27 } },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 100, item = 1017 },  -- scorpion stinger
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 83, 86, 286, 366, 369, 372, 375 },
            levels = {
                [22] = { acc = 84, eva = 93, agi = 28, int = 24, mnd = 17, chr = 17 },
                [23] = { acc = 87, eva = 96, agi = 28, int = 24, mnd = 17, chr = 17 },
                [24] = { acc = 91, eva = 100, agi = 30, int = 26, mnd = 18, chr = 18 },
                [25] = { acc = 95, eva = 103, agi = 30, int = 26, mnd = 18, chr = 18 },
                [26] = { acc = 98, eva = 107, agi = 33, int = 28, mnd = 19, chr = 19 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12705 },  -- brass mittens
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12961 },  -- brass leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 84, 87, 287, 367, 370, 373, 376 },
            levels = {
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 27, chr = 24 },
                [23] = { acc = 82, eva = 70, agi = 22, int = 20, mnd = 28, chr = 24 },
                [24] = { acc = 86, eva = 72, agi = 23, int = 21, mnd = 29, chr = 26 },
                [25] = { acc = 89, eva = 76, agi = 25, int = 23, mnd = 31, chr = 26 },
                [26] = { acc = 93, eva = 79, agi = 26, int = 23, mnd = 31, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 4666 },  -- scroll of paralyze
                { rate = 50, item = 4680 },  -- scroll of barsleep
                { rate = 50, item = 4667 },  -- scroll of silence
                { rate = 10, item = 4681 },  -- scroll of barpoison
                { rate = 50, item = 4733 },  -- scroll of protectra
                { rate = 50, item = 4745 },  -- scroll of sneak
                { rate = 10, item = 4744 },  -- scroll of invisible
                { rate = 10, item = 4746 },  -- scroll of deodorize
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 85, 88, 288, 368, 371, 374, 377 },
            levels = {
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 20, chr = 22 },
                [23] = { acc = 85, eva = 72, agi = 26, int = 28, mnd = 20, chr = 22 },
                [24] = { acc = 89, eva = 75, agi = 28, int = 29, mnd = 21, chr = 24 },
                [25] = { acc = 92, eva = 78, agi = 28, int = 31, mnd = 23, chr = 24 },
                [26] = { acc = 97, eva = 81, agi = 31, int = 31, mnd = 23, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 952 },  -- bag of poison flour
                { rate = 10, item = 12473 },  -- poets circlet
                { rate = 10, item = 12729 },  -- linen cuffs
                { rate = 10, item = 12857 },  -- linen slops
                { rate = 10, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Ghoul war GM MoS',
            ids    = { 93, 94, 99, 100, 101, 102, 103, 126, 226, 235, 236, 237, 238, 246, 248, 263, 264, 385, 387,
                       389, 394, 396 },
            levels = {
                [22] = { acc = 82, eva = 75, agi = 24, int = 18, mnd = 17, chr = 20 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 18, mnd = 17, chr = 20 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 19, mnd = 17, chr = 21 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 20, mnd = 19, chr = 23 },
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 19, chr = 23 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 538 },  -- magicked skull
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wendigo blm MoS',
            ids    = { 95, 104, 158, 172, 173, 227, 239, 240, 247, 249, 386, 388, 390, 395, 397 },
            levels = {
                [24] = { acc = 89, eva = 74, agi = 26, int = 29, mnd = 19, chr = 24 },
                [25] = { acc = 92, eva = 77, agi = 26, int = 31, mnd = 22, chr = 24 },
                [26] = { acc = 96, eva = 80, agi = 28, int = 31, mnd = 22, chr = 24 },
                [27] = { acc = 99, eva = 83, agi = 29, int = 33, mnd = 22, chr = 26 },
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 4824 },  -- scroll of gravity
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Jelly MS OC',
            ids    = { 122, 123, 144, 160, 161, 162, 175, 233, 234, 265, 266 },
            levels = {
                [26] = { acc = 95, eva = 88, agi = 27, int = 20, mnd = 23, chr = 23 },
                [27] = { acc = 98, eva = 90, agi = 27, int = 21, mnd = 23, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 28, int = 21, mnd = 23, chr = 25 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Poison Leech',
            ids    = { 124, 125, 130, 133, 134, 135, 136, 137, 138, 141, 152, 153, 156, 157, 168, 169, 170, 171,
                       224, 225, 398, 399, 453, 454, 455, 456, 457, 458, 459, 460, 462, 463, 464, 465, 466, 467,
                       468, 469 },
            levels = {
                [24] = { acc = 88, eva = 82, agi = 26, int = 21, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 85, agi = 26, int = 22, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 89, agi = 28, int = 23, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 91, agi = 29, int = 23, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 23, mnd = 21, chr = 25 },
            },
            spawn_levels = { [398] = { 26, 27 }, [399] = { 26, 27 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 5,
        },
        {
            name   = 'Seeker Bats',
            ids    = { 127, 128, 129, 146, 149, 150, 151, 163, 164, 165, 166, 167, 222, 223, 231, 232, 243, 244,
                       290, 291, 300 },
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Air Elemental',
            ids    = { 131, 139, 147, 154, 317, 341 },
            levels = {
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'gravity', 'silence', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
                { rate = 150, item = 4106 },  -- wind cluster
                { rate = 50, item = 1032 },  -- shakhrami chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 132, 140, 148, 155, 318, 342 },
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
                { rate = 50, item = 1032 },  -- shakhrami chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Labyrinth Scorpion',
            ids    = { 145, 315, 316, 329, 330, 339, 340, 343, 344, 362, 447, 448 },
            levels = {
                [30] = { acc = 107, eva = 101, agi = 31, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 33, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 118, eva = 111, agi = 34, int = 26, mnd = 26, chr = 29 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 150, item = 1017 },  -- scorpion stinger
                { rate = 100, item = 896 },  -- scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ancient Bat LDT MoS',
            ids    = { 220, 221, 228, 229, 230, 241, 242, 292, 313, 314, 327, 328, 337, 338, 360, 361, 400, 401,
                       414, 415, 416, 420, 421, 423, 424, 451, 452 },
            levels = {
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Abyss Worm',
            ids    = { 289, 293, 294, 295, 297, 298, 299, 309, 310, 311, 312, 323, 324, 325, 326, 334, 335, 336 },
            levels = {
                [27] = { acc = 98, eva = 88, agi = 28, int = 35, mnd = 25, chr = 24 },
                [28] = { acc = 101, eva = 90, agi = 28, int = 35, mnd = 26, chr = 25 },
                [29] = { acc = 104, eva = 93, agi = 29, int = 37, mnd = 26, chr = 25 },
                [30] = { acc = 108, eva = 97, agi = 30, int = 37, mnd = 27, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 240, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 642 },  -- chunk of zinc ore
                { rate = 10, item = 1032 },  -- shakhrami chest key
                { rate = 10, item = 736 },  -- chunk of silver ore
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 2,
        },
        {
            name   = 'Wight war',
            ids    = { 296, 301, 303, 305, 306, 307, 319, 320, 321, 331, 332, 346, 348, 350, 352, 354, 356, 358,
                       472, 474, 475 },
            levels = {
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 23, chr = 28 },
                [33] = { acc = 120, eva = 111, agi = 34, int = 26, mnd = 24, chr = 29 },
                [34] = { acc = 124, eva = 115, agi = 36, int = 26, mnd = 24, chr = 29 },
                [35] = { acc = 127, eva = 118, agi = 36, int = 27, mnd = 26, chr = 30 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 543 },  -- rusty key
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 10, item = 4872 },  -- scroll of tractor
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wight blm',
            ids    = { 302, 304, 308, 322, 333, 347, 349, 351, 353, 355, 357, 359, 471, 473, 476 },
            levels = {
                [32] = { acc = 117, eva = 97, agi = 33, int = 39, mnd = 27, chr = 30 },
                [33] = { acc = 120, eva = 101, agi = 34, int = 41, mnd = 27, chr = 32 },
                [34] = { acc = 124, eva = 104, agi = 36, int = 42, mnd = 27, chr = 32 },
                [35] = { acc = 127, eva = 107, agi = 36, int = 43, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 543 },  -- rusty key
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 10, item = 4872 },  -- scroll of tractor
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Protozoan',
            ids    = { 345, 363, 364, 449, 470 },
            levels = {
                [29] = { acc = 105, eva = 97, agi = 29, int = 22, mnd = 25, chr = 25 },
                [30] = { acc = 108, eva = 100, agi = 29, int = 23, mnd = 25, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 32, int = 24, mnd = 27, chr = 28 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 50, item = 637 },  -- vial of slime oil
                { rate = 50, item = 1032 },  -- shakhrami chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Caterchipillar',
            ids    = { 402, 403, 417, 418, 419, 422, 425, 426 },
            levels = {
                [29] = { acc = 105, eva = 97, agi = 29, int = 22, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 100, agi = 29, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 32, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
                { rate = 50, item = 1032 },  -- shakhrami chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 404, 409, 427, 432, 437, 442 },
            levels = {
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
                [32] = { acc = 117, eva = 104, agi = 27, int = 28, mnd = 28, chr = 39 },
                [33] = { acc = 121, eva = 108, agi = 28, int = 29, mnd = 29, chr = 41 },
                [34] = { acc = 125, eva = 111, agi = 29, int = 29, mnd = 29, chr = 42 },
            },
            spawn_levels = { [437] = { 33, 34 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 10, item = 12817 },  -- brass cuisses
                { rate = 10, item = 12433 },  -- brass mask
                { rate = 10, item = 12689 },  -- brass finger gauntlets
                { rate = 10, item = 12945 },  -- brass greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblins Bat',
            ids    = { 405, 410, 428, 433, 438, 443 },
            levels = {
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 3,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 406, 411, 429, 434, 439, 444 },
            levels = {
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
                [33] = { acc = 142, eva = 105, agi = 43, int = 29, mnd = 32, chr = 29 },
                [34] = { acc = 145, eva = 108, agi = 45, int = 29, mnd = 32, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 10, item = 850 },  -- square of sheep leather
                { rate = 10, item = 848 },  -- square of dhalmel leather
                { rate = 5, item = 855 },  -- square of black tiger leather
                { rate = 1, item = 506 },  -- square of coeurl leather
                { rate = 5, item = 12442 },  -- studded bandana
                { rate = 5, item = 12698 },  -- studded gloves
                { rate = 5, item = 12826 },  -- studded trousers
                { rate = 5, item = 12954 },  -- studded boots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 407, 412, 430, 435, 440, 445 },
            levels = {
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29 },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 50, item = 1534 },  -- sack of mithra fangs
                { rate = 10, item = 12424 },  -- iron mask
                { rate = 10, item = 12808 },  -- chain hose
                { rate = 10, item = 12680 },  -- chain mittens
                { rate = 10, item = 12936 },  -- greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 408, 413, 431, 436, 441, 446 },
            levels = {
                [31] = { acc = 114, eva = 97, agi = 36, int = 39, mnd = 28, chr = 30 },
                [32] = { acc = 117, eva = 99, agi = 36, int = 39, mnd = 28, chr = 30 },
                [33] = { acc = 121, eva = 102, agi = 36, int = 41, mnd = 29, chr = 32 },
                [34] = { acc = 125, eva = 105, agi = 39, int = 42, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1032 },  -- shakhrami chest key
                { rate = 50, item = 1534 },  -- sack of mithra fangs
                { rate = 1, item = 12474 },  -- wool hat
                { rate = 1, item = 12730 },  -- wool cuffs
                { rate = 1, item = 12858 },  -- wool slops
                { rate = 1, item = 12986 },  -- chestnut sabots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Argus',
            ids    = { 450 },
            nm     = true,
            levels = {
                [36] = { acc = 130, eva = 132, agi = 38, int = 35, mnd = 29, chr = 32 },
                [37] = { acc = 133, eva = 134, agi = 38, int = 37, mnd = 30, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 914 },  -- vial of mercury
                { rate = 240, item = 939 },  -- hecteyes eye
                { rate = 240, item = 939 },  -- hecteyes eye
                { rate = 240, item = 15515 },  -- peacock amulet
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Leech King',
            ids    = { 461 },
            nm     = true,
            levels = {
                [35] = { acc = 126, eva = 118, agi = 36, int = 30, mnd = 27, chr = 30 },
                [36] = { acc = 130, eva = 122, agi = 38, int = 31, mnd = 28, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 150, item = 13359 },  -- bloodbead earring
                { rate = 240, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Wyrmfly',
            ids    = { 477, 478, 479 },
            nm     = true,
            levels = {
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Dark Elemental',
            ids    = { 480 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 297, agi = 70, int = 77, mnd = 52, chr = 52 },
            },
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
            name   = 'Aroma Crawler',
            ids    = { 481 },
            nm     = true,
            levels = {
                [40] = { acc = 143, eva = 133, agi = 38, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Lost Soul NM',
            ids    = { 482 },
            nm     = true,
            levels = {
                [45] = { acc = 163, eva = 151, agi = 47, int = 36, mnd = 34, chr = 40 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ogbunabali',
            ids    = { 483, 485 },
            nm     = true,
            levels = {
                [94] = { acc = 437, eva = 405, agi = 87, int = 80, mnd = 80, chr = 87 },
                [95] = { acc = 444, eva = 410, agi = 87, int = 81, mnd = 81, chr = 87 },
            },
            ranks  = { wind = -2, earth = 3, light = -3, dark = 3, silence = -2, slow = 3, light_sleep = -3,
                       dark_sleep = 3, blind = 3, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 9,
        },
    },
    by_name = {},
}
