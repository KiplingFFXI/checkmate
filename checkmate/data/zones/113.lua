-- Cape Teriggan (zone 113).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [2] = { sound = { 'Sand Lizard' } },
        [3] = { sight = { 'Beach Bunny' } },
        [4] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin White Mage' },
        },
        [5] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior' },
        },
        [6] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [7] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [8] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [9] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [10] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [11] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Boss', 'Goblin Doctor', 'Goblin Duelist',
                      'Goblin Mercenary', 'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd',
                      'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [12] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Doctor', 'Goblin Duelist', 'Goblin Mercenary',
                      'Goblin Pirate', 'Goblin Professor', 'Goblin Shepherd', 'Hobgoblin Beastmaster',
                      'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage',
                      'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
    },
    monsters = {
        {
            name   = 'Razorjaw Pugil',
            ids    = { 1 },
            levels = {
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 50 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 50 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Rock Crab',
            ids    = { 2 },
            levels = {
                [59] = { acc = 224, eva = 204, agi = 39, int = 42, mnd = 63, chr = 63 },
                [60] = { acc = 229, eva = 209, agi = 39, int = 42, mnd = 63, chr = 63 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Stygian Pugil',
            ids    = { 3, 4, 5 },
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 52 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 55 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 55 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 55 },
            },
            spawn_levels = { [3] = { 63, 63 }, [4] = { 65, 67 }, [5] = { 66, 66 } },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Devil Manta',
            ids    = { 6 },
            levels = {
                [68] = { acc = 275, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 280, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 285, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 7, 12, 41, 49, 60, 101, 210, 224, 225, 242, 243, 252, 283, 290, 321, 324 },
            levels = {
                [65] = { acc = 264, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 1426 },  -- warriors testimony
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Sand Lizard CT',
            ids    = { 8, 13, 14, 15, 21, 22, 23, 30, 31, 45, 46, 47, 52, 53, 62, 63, 73, 74, 75, 76, 83, 84, 85,
                       86, 87, 96, 97, 98, 99, 100, 105, 106, 107, 110, 111, 112 },
            levels = {
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
            },
            spawn_levels = { [15] = { 64, 65 }, [22] = { 63, 64 }, [23] = { 63, 66 }, [31] = { 65, 66 },
                             [45] = { 62, 65 }, [75] = { 62, 65 }, [96] = { 63, 66 }, [97] = { 62, 65 },
                             [107] = { 63, 65 }, [111] = { 63, 66 }, [112] = { 62, 65 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 50, item = 4362 },  -- lizard egg
                { rate = 50, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
            },
            links  = 2,
        },
        {
            name   = 'Beach Bunny',
            ids    = { 9, 10, 11, 16, 17, 18, 24, 25, 26, 32, 33, 34, 35, 38, 39, 42, 43, 44, 54, 55, 56, 64, 65,
                       124, 125, 146, 147, 163, 164, 169, 170, 173 },
            levels = {
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4358 },  -- slice of hare meat
                { rate = 100, item = 856 },  -- rabbit hide
            },
            links  = 3,
        },
        {
            name   = 'Goblin Shepherd',
            ids    = { 19, 27, 50, 81, 92, 226, 232, 240, 271, 284, 288 },
            levels = {
                [65] = { acc = 264, eva = 242, agi = 56, int = 58, mnd = 58, chr = 80 },
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 17088 },  -- ash staff
                { rate = 150, item = 859 },  -- ram skin
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 50, item = 17865 },  -- jug of singing herbal broth
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblins Rabbit',
            ids    = { 20, 28, 51, 82, 93, 227, 233, 241, 272, 285, 289, 359 },
            levels = {
                [48] = { acc = 173, eva = 161, agi = 50, int = 37, mnd = 37, chr = 42 },
                [49] = { acc = 178, eva = 165, agi = 52, int = 38, mnd = 38, chr = 42 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 289, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
            },
            spawn_levels = { [20] = { 49, 50 }, [28] = { 48, 50 }, [51] = { 48, 50 }, [82] = { 48, 50 },
                             [93] = { 48, 50 }, [227] = { 48, 50 }, [233] = { 49, 50 }, [241] = { 48, 50 },
                             [272] = { 48, 50 }, [285] = { 48, 50 }, [289] = { 48, 50 }, [359] = { 68, 70 } },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            links  = 3,
        },
        {
            name   = 'Goblin Bandit',
            ids    = { 29, 61, 69, 91, 235, 274, 281, 282, 291, 323 },
            levels = {
                [65] = { acc = 270, eva = 301, agi = 77, int = 68, mnd = 46, chr = 46, resist = { gravity = 15 } },
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47, resist = { gravity = 20 } },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48, resist = { gravity = 20 } },
                [68] = { acc = 286, eva = 318, agi = 81, int = 71, mnd = 48, chr = 48, resist = { gravity = 20 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Doom Soldier',
            ids    = { 36, 48, 57, 58, 67, 78, 215, 230, 231, 248, 258, 279, 280, 287 },
            levels = {
                [66] = { acc = 269, eva = 249, agi = 62, int = 70, mnd = 44, chr = 47 },
                [67] = { acc = 273, eva = 255, agi = 65, int = 71, mnd = 44, chr = 48 },
                [68] = { acc = 278, eva = 260, agi = 65, int = 71, mnd = 45, chr = 48 },
                [69] = { acc = 284, eva = 265, agi = 65, int = 72, mnd = 45, chr = 48 },
                [70] = { acc = 289, eva = 271, agi = 67, int = 73, mnd = 45, chr = 49 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 1000, item = 880 },  -- bone chip
                { rate = 50, item = 907 },  -- cold bone
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 50, item = 1433 },  -- dark knights testimony
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 37, 70, 109, 211, 217, 234, 244, 273, 286, 292, 322 },
            levels = {
                [65] = { acc = 256, eva = 224, agi = 62, int = 58, mnd = 80, chr = 68 },
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
            },
            spawn_levels = { [234] = { 66, 68 }, [292] = { 65, 67 }, [322] = { 66, 67 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1428 },  -- white mages testimony
                { rate = 50, item = 4750 },  -- scroll of reraise iii
                { rate = 50, item = 4719 },  -- scroll of regen iii
                { rate = 50, item = 4741 },  -- scroll of shellra iv
                { rate = 10, item = 4613 },  -- scroll of cure v
                { rate = 5, item = 4618 },  -- scroll of curaga iv
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Doom Mage',
            ids    = { 40, 79, 89, 216, 222, 249 },
            levels = {
                [67] = { acc = 273, eva = 237, agi = 71, int = 83, mnd = 55, chr = 65 },
                [68] = { acc = 278, eva = 242, agi = 71, int = 83, mnd = 57, chr = 65 },
                [69] = { acc = 284, eva = 247, agi = 72, int = 84, mnd = 57, chr = 65 },
                [70] = { acc = 289, eva = 252, agi = 73, int = 85, mnd = 57, chr = 67 },
                [71] = { acc = 296, eva = 257, agi = 75, int = 87, mnd = 60, chr = 67 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 59, 80, 239, 250 },
            levels = {
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
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
            name   = 'Velociraptor',
            ids    = { 66, 77, 88, 94, 95, 102, 103, 104, 117, 118, 127, 128, 131, 132, 135, 136, 137, 140, 141,
                       142, 143, 144, 145, 177, 178, 179, 187, 188, 194, 197, 198, 202, 203, 206, 207, 212, 213,
                       214, 218, 219, 220, 221, 228, 229, 236, 237, 238, 245, 246, 247, 253, 275, 276, 277 },
            levels = {
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fantasma',
            ids    = { 68, 90, 162, 223 },
            levels = {
                [65] = { acc = 261, eva = 248, agi = 68, int = 65, mnd = 51, chr = 63 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 66, mnd = 51, chr = 64 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 67, mnd = 51, chr = 65 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 67, mnd = 52, chr = 66 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 827 },  -- square of wool cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Robber Crab',
            ids    = { 71, 72, 119, 120, 121, 122, 123, 148, 149, 150, 155, 156, 157, 165, 166, 167, 171, 172, 174,
                       175, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269, 270 },
            levels = {
                [64] = { acc = 250, eva = 230, agi = 42, int = 46, mnd = 68, chr = 68 },
                [65] = { acc = 256, eva = 235, agi = 43, int = 46, mnd = 68, chr = 68 },
                [66] = { acc = 261, eva = 240, agi = 44, int = 47, mnd = 70, chr = 70 },
                [67] = { acc = 265, eva = 245, agi = 44, int = 48, mnd = 71, chr = 71 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Enna-enna',
            ids    = { 108, 115, 259, 278 },
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 49, mnd = 52, chr = 62 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 49, mnd = 52, chr = 63 },
                [67] = { acc = 273, eva = 258, agi = 71, int = 49, mnd = 53, chr = 63 },
                [68] = { acc = 278, eva = 263, agi = 71, int = 50, mnd = 53, chr = 64 },
                [69] = { acc = 284, eva = 269, agi = 72, int = 51, mnd = 54, chr = 65 },
            },
            spawn_levels = { [108] = { 65, 67 } },
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
            name   = 'Sand Cockatrice',
            ids    = { 113, 114, 126, 129, 130, 133, 134, 138, 139, 180, 181, 182, 183, 184, 185, 186, 189, 190,
                       191, 192, 193, 195, 196, 199, 200, 204, 205, 208, 209, 254, 255, 256, 257, 293, 294, 299,
                       302, 306, 314, 325, 326, 327, 330, 331, 332, 337, 338, 339, 340, 345, 346, 347, 348 },
            levels = {
                [71] = { acc = 292, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 297, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 302, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 307, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 100, item = 854 },  -- cockatrice skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Terror Pugil',
            ids    = { 151, 152, 153, 158, 159, 160, 161, 176 },
            levels = {
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 55 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 55 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 57 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 57 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57 },
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
            name   = 'Air Elemental',
            ids    = { 154, 201, 313, 320 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
            },
            spawn_levels = { [154] = { 67, 69 }, [201] = { 52, 54 }, [313] = { 52, 54 }, [320] = { 52, 54 } },
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
            name   = 'Greater Manticore',
            ids    = { 295, 296, 297, 298, 300, 301, 303, 304, 305, 307, 308, 309, 310, 311, 315, 316, 317, 318,
                       319, 328, 329, 333, 334, 335, 336, 341, 342, 343, 344 },
            levels = {
                [76] = { acc = 319, eva = 304, agi = 76, int = 59, mnd = 59, chr = 57 },
                [77] = { acc = 324, eva = 309, agi = 76, int = 60, mnd = 60, chr = 58 },
                [78] = { acc = 329, eva = 314, agi = 77, int = 60, mnd = 60, chr = 60 },
                [79] = { acc = 335, eva = 320, agi = 78, int = 61, mnd = 61, chr = 60 },
            },
            ph_for = { [307] = { 312 }, [308] = { 312 }, [309] = { 312 }, [310] = { 312 } },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Frostmane',
            ids    = { 312 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 325, agi = 78, int = 61, mnd = 61, chr = 60 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 1116 },  -- manticore hide
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 240, item = 1123 },  -- manticore fang
                { rate = 50, item = 16944 },  -- lockheart
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Kreutzet',
            ids    = { 349 },
            nm     = true,
            levels = {
                [79] = { acc = 339, eva = 324, agi = 87, int = 66, mnd = 66, chr = 74 },
                [80] = { acc = 344, eva = 329, agi = 87, int = 66, mnd = 66, chr = 74 },
            },
            ranks  = { fire = 10, ice = 10, wind = 4, earth = 4, thunder = 4, water = -2, light = 4, dark = 4,
                       paralyze = 10, bind = 10, silence = 4, slow = 4, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 4, gravity = 4 },
            immune = { 'dark_sleep', 'terror' },
            drops  = {
                { rate = 240, item = 18018 },  -- sirocco kukri
                { rate = 240, item = 842 },  -- giant bird feather
                { rate = 100, item = 843 },  -- giant bird plume
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Axesarion the Wanderer',
            ids    = { 350 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 64 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = 11,
                       dark_sleep = 11, blind = 4 },
            magic_dmg = { all = -50 },
            undead = true,
            immune = { 'silence', 'stun' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Hobgoblin Warrior',
            ids    = { 351 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 297, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 302, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 308, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Hobgoblin White Mage',
            ids    = { 352 },
            nm     = true,
            levels = {
                [70] = { acc = 282, eva = 248, agi = 65, int = 61, mnd = 85, chr = 73 },
                [71] = { acc = 287, eva = 254, agi = 68, int = 63, mnd = 87, chr = 75 },
                [72] = { acc = 292, eva = 259, agi = 68, int = 63, mnd = 87, chr = 75 },
                [73] = { acc = 299, eva = 263, agi = 68, int = 64, mnd = 89, chr = 76 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Hobgoblin Black Mage',
            ids    = { 353 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 254, agi = 77, int = 85, mnd = 61, chr = 67 },
                [71] = { acc = 297, eva = 260, agi = 80, int = 87, mnd = 63, chr = 67 },
                [72] = { acc = 302, eva = 265, agi = 80, int = 87, mnd = 63, chr = 67 },
                [73] = { acc = 308, eva = 269, agi = 80, int = 89, mnd = 64, chr = 70 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Hobgoblin Red Mage',
            ids    = { 354 },
            nm     = true,
            levels = {
                [70] = { acc = 288, eva = 262, agi = 65, int = 73, mnd = 73, chr = 67 },
                [71] = { acc = 293, eva = 268, agi = 68, int = 75, mnd = 75, chr = 67 },
                [72] = { acc = 298, eva = 273, agi = 68, int = 75, mnd = 75, chr = 67 },
                [73] = { acc = 305, eva = 278, agi = 68, int = 76, mnd = 76, chr = 70 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Hobgoblin Thief',
            ids    = { 355 },
            nm     = true,
            levels = {
                [70] = { acc = 297, eva = 342, agi = 83, int = 73, mnd = 49, chr = 49 },
                [71] = { acc = 303, eva = 348, agi = 84, int = 75, mnd = 51, chr = 51 },
                [72] = { acc = 308, eva = 353, agi = 84, int = 75, mnd = 51, chr = 51 },
                [73] = { acc = 314, eva = 359, agi = 86, int = 76, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Hobgoblin Dark Knight',
            ids    = { 356 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 273, agi = 71, int = 73, mnd = 49, chr = 49 },
                [71] = { acc = 297, eva = 278, agi = 72, int = 75, mnd = 51, chr = 51 },
                [72] = { acc = 302, eva = 283, agi = 72, int = 75, mnd = 51, chr = 51 },
                [73] = { acc = 308, eva = 289, agi = 74, int = 76, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Hobgoblin Ranger',
            ids    = { 357 },
            nm     = true,
            levels = {
                [70] = { acc = 336, eva = 260, agi = 89, int = 61, mnd = 67, chr = 61 },
                [71] = { acc = 341, eva = 266, agi = 92, int = 63, mnd = 67, chr = 63 },
                [72] = { acc = 346, eva = 271, agi = 92, int = 63, mnd = 67, chr = 63 },
                [73] = { acc = 353, eva = 275, agi = 93, int = 64, mnd = 70, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Beastmaster',
            ids    = { 358 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 267, agi = 59, int = 61, mnd = 61, chr = 85 },
                [71] = { acc = 297, eva = 272, agi = 60, int = 63, mnd = 63, chr = 87 },
                [72] = { acc = 302, eva = 277, agi = 60, int = 63, mnd = 63, chr = 87 },
                [73] = { acc = 308, eva = 283, agi = 62, int = 64, mnd = 64, chr = 89 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Stolas',
            ids    = { 360 },
            nm     = true,
            levels = {
                [80] = { acc = 346, eva = 396, agi = 91, int = 75, mnd = 57, chr = 60 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Pirate',
            ids    = { 361, 362 },
            levels = {
                [75] = { acc = 326, eva = 370, agi = 88, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 331, eva = 375, agi = 89, int = 80, mnd = 54, chr = 54 },
                [77] = { acc = 337, eva = 381, agi = 91, int = 80, mnd = 54, chr = 54 },
                [78] = { acc = 342, eva = 386, agi = 91, int = 80, mnd = 54, chr = 54 },
                [79] = { acc = 348, eva = 392, agi = 93, int = 82, mnd = 55, chr = 55 },
                [80] = { acc = 353, eva = 397, agi = 93, int = 82, mnd = 55, chr = 55 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Duelist',
            ids    = { 363, 364 },
            levels = {
                [75] = { acc = 315, eva = 288, agi = 70, int = 77, mnd = 77, chr = 70 },
                [76] = { acc = 321, eva = 293, agi = 71, int = 80, mnd = 80, chr = 72 },
                [77] = { acc = 326, eva = 297, agi = 71, int = 80, mnd = 80, chr = 72 },
                [78] = { acc = 331, eva = 303, agi = 73, int = 80, mnd = 80, chr = 72 },
                [79] = { acc = 338, eva = 309, agi = 74, int = 82, mnd = 82, chr = 75 },
                [80] = { acc = 343, eva = 314, agi = 74, int = 82, mnd = 82, chr = 75 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Doctor',
            ids    = { 365, 366 },
            levels = {
                [75] = { acc = 309, eva = 273, agi = 70, int = 65, mnd = 91, chr = 77 },
                [76] = { acc = 314, eva = 278, agi = 71, int = 66, mnd = 92, chr = 80 },
                [77] = { acc = 320, eva = 282, agi = 71, int = 66, mnd = 93, chr = 80 },
                [78] = { acc = 325, eva = 288, agi = 73, int = 68, mnd = 93, chr = 80 },
                [79] = { acc = 331, eva = 293, agi = 74, int = 69, mnd = 96, chr = 82 },
                [80] = { acc = 336, eva = 298, agi = 74, int = 69, mnd = 96, chr = 82 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Professor',
            ids    = { 367, 368 },
            levels = {
                [75] = { acc = 319, eva = 279, agi = 82, int = 91, mnd = 65, chr = 70 },
                [76] = { acc = 325, eva = 285, agi = 85, int = 92, mnd = 66, chr = 72 },
                [77] = { acc = 330, eva = 289, agi = 85, int = 93, mnd = 66, chr = 72 },
                [78] = { acc = 335, eva = 294, agi = 85, int = 93, mnd = 68, chr = 72 },
                [79] = { acc = 341, eva = 299, agi = 87, int = 96, mnd = 69, chr = 75 },
                [80] = { acc = 346, eva = 304, agi = 87, int = 96, mnd = 69, chr = 75 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Boss',
            ids    = { 369 },
            levels = {
                [80] = { acc = 346, eva = 329, agi = 87, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Vedrfolnir',
            ids    = { 371, 372, 373 },
            nm     = true,
            levels = {
                [99] = { acc = 477, eva = 430, agi = 107, int = 82, mnd = 82, chr = 91 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Glazemane',
            ids    = { 374, 375, 376 },
            nm     = true,
            levels = {},
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
