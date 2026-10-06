-- Kuftal Tunnel (zone 174).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Amemet', 'Sand Lizard' } },
        [2] = { sound = { 'Cave Worm', 'Kuftal Digger', 'Phantom Worm', 'Specter Worm' } },
        [3] = { sound = { 'Arachne', 'Recluse Spider' } },
        [4] = { sound = { 'Sand Lizard' } },
        [5] = {
            sight = { 'Bloodthirster Madkix', 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Mercenary',
                      'Goblin Tamer' },
        },
        [6] = { sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Mercenary', 'Goblin Tamer' } },
        [7] = { sound = { 'Recluse Spider' } },
        [8] = { sound = { 'Cave Worm', 'Kuftal Digger', 'Specter Worm' } },
    },
    monsters = {
        {
            name   = 'Scavenger Crab',
            ids    = { 1, 2 },
            levels = {
                [60] = { acc = 229, eva = 209, agi = 39, int = 42, mnd = 63, chr = 63 },
                [61] = { acc = 234, eva = 215, agi = 42, int = 45, mnd = 66, chr = 66 },
                [62] = { acc = 239, eva = 220, agi = 42, int = 45, mnd = 66, chr = 66 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1051 },  -- kuftal coffer key
                { rate = 240, item = 936 },  -- chunk of rock salt
                { rate = 240, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Stygian Pugil',
            ids    = { 3, 4 },
            levels = {
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 52 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 55 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 55 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1051 },  -- kuftal coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Devil Manta',
            ids    = { 5 },
            levels = {
                [66] = { acc = 265, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 269, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 275, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 876 },  -- manta skin
                { rate = 100, item = 4484 },  -- shall shell
                { rate = 50, item = 1312 },  -- piece of angel skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Gordovs Ghost',
            ids    = { 6 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 242, agi = 71, int = 87, mnd = 57, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Dervos Ghost',
            ids    = { 7 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 242, agi = 71, int = 87, mnd = 57, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Gizerls Ghost',
            ids    = { 8 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 242, agi = 71, int = 87, mnd = 57, chr = 69 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Sand Lizard',
            ids    = { 9, 10, 11, 12, 13, 14, 74, 80, 81, 82, 83, 84, 85, 88, 89, 90, 91, 92, 95, 101 },
            levels = {
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 252, eva = 237, agi = 66, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
            },
            ph_for = { [82] = { 96 }, [95] = { 96 } },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 100, item = 4362 },  -- lizard egg
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 50, item = 1051 },  -- kuftal coffer key
            },
            links  = 1,
        },
        {
            name   = 'Robber Crab',
            ids    = { 15, 16, 17, 18, 20, 21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 41, 42, 50, 52, 53, 56, 86, 87,
                       93, 94, 102, 103, 120, 121, 127, 128, 129, 130, 131, 132, 133, 134, 135, 137, 138, 148, 149,
                       150, 151, 152, 153, 154, 155, 156, 158, 159, 160, 161, 162, 163, 164, 165, 219, 220, 222,
                       223 },
            levels = {
                [60] = { acc = 229, eva = 209, agi = 39, int = 42, mnd = 63, chr = 63 },
                [61] = { acc = 234, eva = 215, agi = 42, int = 45, mnd = 66, chr = 66 },
                [62] = { acc = 239, eva = 220, agi = 42, int = 45, mnd = 66, chr = 66 },
                [63] = { acc = 244, eva = 225, agi = 42, int = 45, mnd = 66, chr = 66 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1051 },  -- kuftal coffer key
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Haunt',
            ids    = { 19, 22, 23, 24, 25, 26, 27, 49, 108, 136 },
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 63, mnd = 48, chr = 61 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 64, mnd = 48, chr = 62 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 65, mnd = 51, chr = 63 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 66, mnd = 51, chr = 64 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 827 },  -- square of wool cloth
                { rate = 50, item = 1844 },  -- square of spectral goldenrod
                { rate = 50, item = 1051 },  -- kuftal coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Cave Worm KT',
            ids    = { 37, 38, 45, 46, 69, 70, 76, 77, 97, 98, 104, 105, 122, 123, 124, 139, 140, 141, 144, 145 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 74, mnd = 56, chr = 54 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 77, mnd = 59, chr = 57 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 77, mnd = 59, chr = 57 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 78, mnd = 59, chr = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 641 },  -- chunk of tin ore
                { rate = 50, item = 1051 },  -- kuftal coffer key
                { rate = 10, item = 737 },  -- chunk of gold ore
            },
            links  = 2,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 39, 47, 71, 78, 99, 106, 125, 142, 146 },
            levels = {
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
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
            name   = 'Air Elemental',
            ids    = { 40, 48, 72, 79, 100, 107, 126, 143, 147 },
            levels = {
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 80, mnd = 64, chr = 65 },
                [70] = { acc = 286, eva = 264, agi = 69, int = 81, mnd = 65, chr = 67 },
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
            name   = 'Sabotender Sediendo',
            ids    = { 43, 44, 51, 54, 55, 57, 58, 59, 61, 62, 63, 64, 65, 66, 67, 75 },
            levels = {
                [64] = { acc = 256, eva = 242, agi = 54, int = 42, mnd = 58, chr = 60 },
                [65] = { acc = 262, eva = 248, agi = 56, int = 43, mnd = 59, chr = 62 },
                [66] = { acc = 267, eva = 253, agi = 57, int = 44, mnd = 59, chr = 63 },
                [67] = { acc = 271, eva = 258, agi = 57, int = 44, mnd = 61, chr = 63 },
            },
            spawn_levels = { [57] = { 65, 67 } },
            ph_for = { [59] = { 60 }, [66] = { 60 } },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 100, item = 4509 },  -- flask of distilled water
                { rate = 100, item = 1817 },  -- cactus arm
                { rate = 100, item = 1236 },  -- bag of cactus stems
                { rate = 100, item = 916 },  -- cactuar needle
                { rate = 50, item = 1051 },  -- kuftal coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sabotender Mariachi',
            ids    = { 60 },
            nm     = true,
            levels = {
                [68] = { acc = 275, eva = 265, agi = 75, int = 50, mnd = 50, chr = 64 },
                [69] = { acc = 280, eva = 271, agi = 77, int = 51, mnd = 51, chr = 65 },
                [70] = { acc = 285, eva = 276, agi = 77, int = 51, mnd = 51, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = 4, light = 4, dark = -3, paralyze = -3, bind = -3,
                       poison = 4, light_sleep = 4, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 916 },  -- cactuar needle
                { rate = 100, item = 17981 },  -- bano del sol
                { rate = 100, item = 1236 },  -- bag of cactus stems
                { rate = 100, item = 1592 },  -- cactuar root
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Recluse Spider',
            ids    = { 68, 73, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 291, 292, 294, 295, 296, 299,
                       300, 301, 302, 304, 305, 306, 307, 308, 309 },
            levels = {
                [63] = { acc = 253, eva = 237, agi = 66, int = 53, mnd = 53, chr = 48 },
                [64] = { acc = 259, eva = 243, agi = 68, int = 54, mnd = 54, chr = 48 },
                [65] = { acc = 264, eva = 248, agi = 68, int = 56, mnd = 56, chr = 51 },
                [66] = { acc = 271, eva = 253, agi = 70, int = 57, mnd = 57, chr = 51 },
            },
            ph_for = { [292] = { 297 }, [296] = { 297 }, [300] = { 297 } },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 50, item = 1051 },  -- kuftal coffer key
                { rate = 100, item = 838 },  -- spider web
                { rate = 50, item = 1148 },  -- clump of shoalweed
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Amemet',
            ids    = { 96 },
            nm     = true,
            levels = {
                [65] = { acc = 263, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 1275 },  -- amemet skin
                { rate = 240, item = 1275 },  -- amemet skin
                { rate = 150, item = 1275 },  -- amemet skin
                { rate = 150, item = 1275 },  -- amemet skin
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Diplopod',
            ids    = { 157, 270, 271 },
            levels = {
                [68] = { acc = 275, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 280, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 285, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 292, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 10, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Ovinnik',
            ids    = { 166, 167, 168, 169, 170, 171, 172, 175, 176, 182, 183, 189, 191, 195, 196 },
            levels = {
                [77] = { acc = 328, eva = 311, agi = 80, int = 52, mnd = 60, chr = 66 },
                [78] = { acc = 333, eva = 316, agi = 80, int = 52, mnd = 60, chr = 68 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 52, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 2121 },  -- ovinnik hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Greater Cockatrice',
            ids    = { 173, 174, 177, 178, 180, 185, 186, 187, 192, 193, 197, 198, 199, 200, 201, 202 },
            levels = {
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 335, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ph_for = { [180] = { 181 } },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 100, item = 842 },  -- giant bird feather
                { rate = 10, item = 854 },  -- cockatrice skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Ladon',
            ids    = { 179, 184, 188, 190, 194, 204 },
            levels = {
                [80] = { acc = 344, eva = 327, agi = 82, int = 70, mnd = 57, chr = 65 },
                [81] = { acc = 352, eva = 332, agi = 85, int = 73, mnd = 60, chr = 67 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 73, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
                { rate = 50, item = 866 },  -- handful of wyvern scales
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Pelican',
            ids    = { 181 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
                [81] = { acc = 347, eva = 332, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 12382 },  -- astral aspis
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 150, item = 854 },  -- cockatrice skin
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 150, item = 854 },  -- cockatrice skin
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 150, item = 854 },  -- cockatrice skin
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 150, item = 854 },  -- cockatrice skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Deinonychus',
            ids    = { 221, 224, 226, 228, 240, 241, 247, 248, 254, 255, 256, 257, 263, 265, 266, 280, 281, 282,
                       283, 285, 286, 287, 290, 293, 298, 303 },
            levels = {
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            ph_for = { [281] = { 284 }, [283] = { 284 } },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
                { rate = 10, item = 1051 },  -- kuftal coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 225, 233, 238, 246, 253, 262, 264 },
            levels = {
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
            },
            ph_for = { [238] = { 239 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 1426 },  -- warriors testimony
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 227, 229, 234, 242, 249, 258 },
            levels = {
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
                [69] = { acc = 277, eva = 243, agi = 65, int = 60, mnd = 84, chr = 72 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1428 },  -- white mages testimony
                { rate = 50, item = 4719 },  -- scroll of regen iii
                { rate = 10, item = 4613 },  -- scroll of cure v
                { rate = 10, item = 4618 },  -- scroll of curaga iv
                { rate = 50, item = 4741 },  -- scroll of shellra iv
                { rate = 50, item = 4750 },  -- scroll of reraise iii
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblin Bandit',
            ids    = { 230, 235, 243, 250, 259, 267 },
            levels = {
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47 },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48 },
                [68] = { acc = 286, eva = 318, agi = 81, int = 71, mnd = 48, chr = 48 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 72, mnd = 48, chr = 48 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 20 },
            drops  = {
                { rate = 50, item = 511 },  -- goblin mask
                { rate = 10, item = 510 },  -- goblin armor
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblin Tamer',
            ids    = { 231, 236, 244, 251, 260 },
            levels = {
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83 },
                [69] = { acc = 286, eva = 262, agi = 59, int = 60, mnd = 60, chr = 84 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 150, item = 1541 },  -- sack of beach bunny fangs
                { rate = 100, item = 17017 },  -- pet food beta biscuit
                { rate = 240, group = {  -- one of
                    { 17860, 4000 },  -- jug of carrot broth
                    { 17864, 2000 },  -- jug of herbal broth
                    { 17876, 1000 },  -- jug of fish broth
                    { 17870, 1000 },  -- jug of meat broth
                    { 17872, 1000 },  -- jug of tree sap
                    { 17867, 500 },  -- jug of cold carrion broth
                    { 17877, 500 },  -- jug of fish oil broth
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblins Spider',
            ids    = { 232, 237, 245, 252, 261 },
            levels = {
                [53] = { acc = 199, eva = 184, agi = 57, int = 46, mnd = 46, chr = 42 },
                [54] = { acc = 205, eva = 190, agi = 58, int = 47, mnd = 47, chr = 42 },
                [55] = { acc = 210, eva = 195, agi = 58, int = 47, mnd = 47, chr = 43 },
            },
            spawn_levels = { [261] = { 54, 55 } },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            links  = 3,
        },
        {
            name   = 'Bloodthirster Madkix',
            ids    = { 239 },
            nm     = true,
            levels = {
                [70] = { acc = 390, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 391, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 391, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { virus = 25 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 507 },  -- goblin mail
                { rate = 1000, item = 508 },  -- goblin helm
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 17926 },  -- acha darmas
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Kuftal Digger',
            ids    = { 268, 269, 272, 273, 274, 275, 276, 277, 278, 279, 288, 289 },
            levels = {
                [66] = { acc = 265, eva = 244, agi = 66, int = 82, mnd = 62, chr = 59 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 83, mnd = 63, chr = 61 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 83, mnd = 64, chr = 62 },
                [69] = { acc = 281, eva = 259, agi = 68, int = 85, mnd = 64, chr = 62 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 768 },  -- flint stone
                { rate = 100, item = 640 },  -- chunk of copper ore
                { rate = 50, item = 641 },  -- chunk of tin ore
                { rate = 10, item = 738 },  -- chunk of platinum ore
            },
            links  = 2,
        },
        {
            name   = 'Yowie',
            ids    = { 284 },
            nm     = true,
            levels = {
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 63 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            drops  = {
                { rate = 1000, item = 1296 },  -- yowie skin
                { rate = 100, item = 1296 },  -- yowie skin
                { rate = 50, item = 1296 },  -- yowie skin
                { rate = 150, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Arachne',
            ids    = { 297 },
            nm     = true,
            levels = {
                [67] = { acc = 275, eva = 258, agi = 71, int = 57, mnd = 57, chr = 51 },
                [68] = { acc = 280, eva = 263, agi = 71, int = 57, mnd = 57, chr = 52 },
                [69] = { acc = 286, eva = 269, agi = 72, int = 59, mnd = 59, chr = 53 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 1000, item = 1270 },  -- arachne web
                { rate = 240, item = 1270 },  -- arachne web
                { rate = 150, item = 1270 },  -- arachne web
                { rate = 150, item = 1270 },  -- arachne web
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Mimic',
            ids    = { 310 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1051 },  -- kuftal coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Cancer',
            ids    = { 311 },
            nm     = true,
            levels = {
                [65] = { acc = 256, eva = 235, agi = 43, int = 46, mnd = 68, chr = 68 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4400 },  -- slice of land crab meat
                { rate = 240, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 16945 },  -- arondight
                { rate = 1000, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Robber Crab',
            ids    = { 312 },
            levels = {
                [60] = { acc = 229, eva = 209, agi = 39, int = 42, mnd = 63, chr = 63 },
                [61] = { acc = 234, eva = 215, agi = 42, int = 45, mnd = 66, chr = 66 },
                [62] = { acc = 239, eva = 220, agi = 42, int = 45, mnd = 66, chr = 66 },
                [63] = { acc = 244, eva = 225, agi = 42, int = 45, mnd = 66, chr = 66 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1051 },  -- kuftal coffer key
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Phantom Worm',
            ids    = { 313 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 274, agi = 73, int = 79, mnd = 59, chr = 61 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 81, mnd = 60, chr = 63 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 81, mnd = 60, chr = 63 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            immune = { 'dark_sleep', 'silence', 'plague' },
            drops  = {
                { rate = 100, item = 18140 },  -- phantom tathlum
                { rate = 1000, group = {  -- one of
                    { 736, 6000 },  -- chunk of silver ore
                    { 643, 2500 },  -- chunk of iron ore
                    { 645, 1000 },  -- chunk of darksteel ore
                    { 646, 500 },  -- chunk of adaman ore
                } },
                { rate = 1000, group = {  -- one of
                    { 736, 6000 },  -- chunk of silver ore
                    { 643, 2500 },  -- chunk of iron ore
                    { 645, 1000 },  -- chunk of darksteel ore
                    { 646, 500 },  -- chunk of adaman ore
                } },
                { rate = 1000, group = {  -- one of
                    { 736, 6000 },  -- chunk of silver ore
                    { 643, 2500 },  -- chunk of iron ore
                    { 645, 1000 },  -- chunk of darksteel ore
                    { 646, 500 },  -- chunk of adaman ore
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 8,
        },
        {
            name   = 'Guivre',
            ids    = { 314 },
            nm     = true,
            levels = {
                [84] = { acc = 371, eva = 348, agi = 87, int = 74, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1124 },  -- wyvern wing
                { rate = 150, item = 1122 },  -- wyvern skin
                { rate = 240, item = 909 },  -- guivres skull
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
        },
        {
            name   = 'Kettenkaefer',
            ids    = { 315 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 321, agi = 71, int = 78, mnd = 51, chr = 51 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Tangaroa',
            ids    = { 316, 320, 324 },
            nm     = true,
            levels = {
                [96] = { acc = 452, eva = 382, agi = 99, int = 114, mnd = 82, chr = 90 },
                [97] = { acc = 459, eva = 386, agi = 99, int = 115, mnd = 82, chr = 90 },
            },
            ranks  = { fire = 3, ice = -1, wind = -1, earth = -1, thunder = -3, water = 3, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = 3, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -3, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Koura',
            ids    = { 317, 321, 325 },
            nm     = true,
            levels = {
                [92] = { acc = 414, eva = 373, agi = 60, int = 64, mnd = 94, chr = 94 },
                [93] = { acc = 422, eva = 378, agi = 60, int = 65, mnd = 95, chr = 95 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Pekapeka',
            ids    = { 318, 322, 326 },
            nm     = true,
            levels = {
                [92] = { acc = 423, eva = 387, agi = 70, int = 64, mnd = 85, chr = 79 },
                [93] = { acc = 430, eva = 393, agi = 72, int = 65, mnd = 87, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Moki',
            ids    = { 319, 323, 327 },
            nm     = true,
            levels = {
                [92] = { acc = 422, eva = 393, agi = 100, int = 70, mnd = 70, chr = 75 },
                [93] = { acc = 429, eva = 398, agi = 100, int = 72, mnd = 72, chr = 75 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Specter Worm',
            ids    = { 328, 329, 330 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 2,
        },
    },
    by_name = {},
}
