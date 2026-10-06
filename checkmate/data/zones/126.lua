-- Qufim Island (zone 126).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Ancient Bat', 'Dark Bats', 'Glow Bat', 'Seeker Bats' } },
        [2] = {
            sight = { 'Giant Ascetic', 'Giant Beastmaster', 'Giant High Ranger', 'Giant Hunter', 'Giant Monk',
                      'Giant Ranger', 'Giant Trapper', 'Giant Warrior', 'Hunting Chief' },
            true_sight = { 'Echion' },
        },
        [3] = { sound = { 'Acrophies' } },
        [4] = { sound = { 'Greater Pugil' } },
        [5] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage',
                      'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage', 'Hobgoblin Thief',
                      'Hobgoblin White Mage' },
        },
        [6] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage',
                      'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage', 'Hobgoblin Thief',
                      'Hobgoblin Warrior' },
        },
        [7] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [8] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage',
                      'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Thief', 'Hobgoblin Warrior',
                      'Hobgoblin White Mage' },
        },
        [9] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage',
                      'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage', 'Hobgoblin Warrior',
                      'Hobgoblin White Mage' },
        },
        [10] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [11] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage',
                      'Hobgoblin Dark Knight', 'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior',
                      'Hobgoblin White Mage' },
        },
        [12] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Black Mage', 'Hobgoblin Dark Knight', 'Hobgoblin Ranger',
                      'Hobgoblin Red Mage', 'Hobgoblin Thief', 'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [13] = {
            sight = { 'Giant Ascetic', 'Giant Beastmaster', 'Giant High Ranger', 'Giant Hunter', 'Giant Monk',
                      'Giant Ranger', 'Giant Trapper', 'Hunting Chief' },
            true_sight = { 'Echion' },
        },
        [14] = {
            sight = { 'Giant Ascetic', 'Giant Beastmaster', 'Giant High Ranger', 'Giant Hunter', 'Giant Ranger',
                      'Giant Trapper', 'Giant Warrior', 'Hunting Chief' },
            true_sight = { 'Echion' },
        },
        [15] = {
            sight = { 'Giant Ascetic', 'Giant High Ranger', 'Giant Hunter', 'Giant Monk', 'Giant Ranger',
                      'Giant Trapper', 'Giant Warrior', 'Hunting Chief' },
            true_sight = { 'Echion' },
        },
        [16] = {
            sight = { 'Giant Ascetic', 'Giant Beastmaster', 'Giant Hunter', 'Giant Monk', 'Giant Ranger',
                      'Giant Trapper', 'Giant Warrior', 'Hunting Chief' },
            true_sight = { 'Echion' },
        },
        [17] = {
            sight = { 'Giant Ascetic', 'Giant Beastmaster', 'Giant High Ranger', 'Giant Hunter', 'Giant Monk',
                      'Giant Ranger', 'Giant Trapper', 'Giant Warrior' },
            true_sight = { 'Echion' },
        },
        [18] = { sound = { 'Seed Mandragora' } },
        [19] = {
            sight = { 'Goblin Bounty Hunter', 'Hobgoblin Beastmaster', 'Hobgoblin Black Mage',
                      'Hobgoblin Dark Knight', 'Hobgoblin Ranger', 'Hobgoblin Red Mage', 'Hobgoblin Thief',
                      'Hobgoblin Warrior', 'Hobgoblin White Mage' },
        },
        [20] = {
            sight = { 'Giant Ascetic', 'Giant Beastmaster', 'Giant High Ranger', 'Giant Hunter', 'Giant Monk',
                      'Giant Ranger', 'Giant Trapper', 'Giant Warrior', 'Hunting Chief' },
        },
    },
    monsters = {
        {
            name   = 'Qufim Pugil',
            ids    = { 1 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 22 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 22 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 2 },
            levels = {
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 24 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 868 },  -- handful of pugil scales
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Sea Bishop',
            ids    = { 3 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 33, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 24, mnd = 24, chr = 28 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 10, item = 770 },  -- blue rock
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Vepar',
            ids    = { 4 },
            levels = {
                [35] = { acc = 126, eva = 119, agi = 39, int = 27, mnd = 27, chr = 29 },
                [36] = { acc = 130, eva = 123, agi = 41, int = 28, mnd = 28, chr = 30 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Kraken',
            ids    = { 5, 6 },
            nm     = true,
            levels = {
                [39] = { acc = 139, eva = 131, agi = 40, int = 31, mnd = 31, chr = 35 },
                [40] = { acc = 142, eva = 134, agi = 40, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 50, item = 1726 },  -- egret fishing rod
                { rate = 10, item = 770 },  -- blue rock
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Seeker Bats',
            ids    = { 7, 8, 10, 11, 14, 15, 286, 287, 288, 293, 294, 299, 300 },
            levels = {
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Dancing Weapon',
            ids    = { 9, 12, 13, 16, 42, 221, 222, 223, 224, 303, 304 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 27, mnd = 21, chr = 29 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 29, mnd = 22, chr = 29 },
            },
            ph_for = { [224] = { 225 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 16631 },  -- kaiser sword
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Land Worm',
            ids    = { 17, 18, 23, 24, 25, 59, 60, 82, 83, 100, 101, 123, 124, 125, 126, 127, 134, 135 },
            levels = {
                [26] = { acc = 94, eva = 84, agi = 27, int = 34, mnd = 24, chr = 23 },
                [27] = { acc = 98, eva = 88, agi = 28, int = 35, mnd = 25, chr = 24 },
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
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
        },
        {
            name   = 'Clipper',
            ids    = { 19, 20, 21, 22, 43, 44, 45, 46, 55, 56, 57, 58, 78, 79, 80, 81, 97, 98, 99, 113, 114, 115,
                       118, 119, 120, 121, 122, 130, 131, 132, 133, 146, 147, 148, 149, 158, 159, 160, 161, 175,
                       176, 177, 178, 193, 195, 196, 197, 198, 199, 226, 227, 228, 229, 230, 252, 253, 254, 255,
                       270, 271, 272, 273 },
            levels = {
                [28] = { acc = 99, eva = 89, agi = 19, int = 20, mnd = 29, chr = 29 },
                [29] = { acc = 102, eva = 92, agi = 19, int = 20, mnd = 30, chr = 30 },
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
            name   = 'Dark Bats',
            ids    = { 26, 27, 61, 62, 84, 85, 102, 136, 137, 179, 180, 200, 201, 231, 232, 233, 256, 257 },
            levels = {
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Glow Bat',
            ids    = { 28, 63, 86, 103, 104, 138, 183, 205, 206, 237, 260, 261 },
            levels = {
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Giant Ranger',
            ids    = { 29, 34, 64, 69, 87, 105, 139, 184, 207, 212, 238, 243, 262 },
            levels = {
                [29] = { acc = 107, eva = 97, agi = 29, int = 19, mnd = 22, chr = 28 },
                [30] = { acc = 110, eva = 100, agi = 29, int = 19, mnd = 23, chr = 28 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Giant Ascetic',
            ids    = { 30, 35, 65, 70, 88, 106, 140, 185, 208, 213, 239, 244, 263 },
            levels = {
                [29] = { acc = 108, eva = 96, agi = 21, int = 17, mnd = 26, chr = 28 },
                [30] = { acc = 112, eva = 99, agi = 21, int = 17, mnd = 28, chr = 28 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Giant Trapper',
            ids    = { 31, 36, 66, 71, 89, 107, 141, 186, 209, 214, 240, 245, 264 },
            levels = {
                [29] = { acc = 107, eva = 93, agi = 21, int = 22, mnd = 25, chr = 38 },
                [30] = { acc = 110, eva = 96, agi = 21, int = 22, mnd = 26, chr = 38 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 10 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Gigass Leech',
            ids    = { 32, 37, 67, 72, 90, 108, 142, 187, 210, 215, 241, 246, 265, 318 },
            levels = {
                [24] = { acc = 88, eva = 82, agi = 26, int = 21, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 85, agi = 26, int = 22, mnd = 20, chr = 23 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 23, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 98, agi = 30, int = 25, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 101, agi = 31, int = 25, mnd = 23, chr = 26 },
            },
            spawn_levels = { [32] = { 24, 25 }, [37] = { 24, 25 }, [67] = { 24, 25 }, [72] = { 24, 25 },
                             [90] = { 24, 25 }, [108] = { 24, 25 }, [142] = { 24, 25 }, [187] = { 24, 25 },
                             [210] = { 24, 25 }, [215] = { 24, 25 }, [241] = { 24, 25 }, [246] = { 24, 25 },
                             [265] = { 24, 25 }, [318] = { 28, 30 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            links  = 3,
        },
        {
            name   = 'Giant Hunter',
            ids    = { 33, 38, 68, 73, 91, 109, 143, 188, 211, 216, 242, 247, 266 },
            levels = {
                [29] = { acc = 115, eva = 99, agi = 33, int = 21, mnd = 25, chr = 28 },
                [30] = { acc = 131, eva = 102, agi = 33, int = 21, mnd = 27, chr = 28 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            drops  = {
                { rate = 50, item = 1199 },  -- northern fur
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Wight war',
            ids    = { 39, 74, 75, 92, 110, 116, 144, 189, 190, 194, 217, 248, 249, 267, 291, 292, 297, 298 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 22, mnd = 21, chr = 25 },
            },
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
            ids    = { 40, 93, 111, 117, 145, 191, 218, 219, 250, 268 },
            levels = {
                [28] = { acc = 102, eva = 85, agi = 29, int = 34, mnd = 24, chr = 26 },
                [29] = { acc = 106, eva = 89, agi = 30, int = 35, mnd = 24, chr = 26 },
            },
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
            name   = 'Light Elemental',
            ids    = { 41, 76, 94, 112, 192, 220, 251, 269 },
            levels = {
                [35] = { acc = 121, eva = 104, agi = 30, int = 30, mnd = 43, chr = 36 },
                [36] = { acc = 125, eva = 107, agi = 32, int = 32, mnd = 44, chr = 38 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            drops  = {
                { rate = 1000, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
                { rate = 150, item = 4110 },  -- light cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 47, 48, 49, 50, 51, 52, 150, 151, 152, 153, 154, 155, 162, 163, 164, 165, 274, 275, 276,
                       277 },
            levels = {
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 24 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 24 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
                { rate = 50, item = 4484 },  -- shall shell
            },
            links  = 4,
        },
        {
            name   = 'Banshee',
            ids    = { 53, 95, 96, 128, 129, 156, 170, 171, 282, 283 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 33, int = 31, mnd = 24, chr = 32 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 31, mnd = 24, chr = 32 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4871 },  -- scroll of escape
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 54, 157, 172, 284 },
            levels = {
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
            },
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
            name   = 'Acrophies',
            ids    = { 166, 167, 168, 169, 181, 182, 202, 203, 204, 234, 235, 236, 258, 259, 278, 279, 280, 281 },
            levels = {
                [33] = { acc = 119, eva = 111, agi = 34, int = 28, mnd = 26, chr = 29 },
                [34] = { acc = 123, eva = 115, agi = 36, int = 29, mnd = 26, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 3,
        },
        {
            name   = 'Kraken',
            ids    = { 174 },
            levels = {
                [37] = { acc = 132, eva = 124, agi = 38, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Trickster Kinetix',
            ids    = { 225 },
            nm     = true,
            levels = {
                [35] = { acc = 127, eva = 118, agi = 36, int = 35, mnd = 27, chr = 35 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 35, mnd = 28, chr = 36 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 16657 },  -- tabar
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Ancient Bat',
            ids    = { 289, 290, 295, 296, 301, 302 },
            levels = {
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
            links  = 1,
        },
        {
            name   = 'Hobgoblin Warrior',
            ids    = { 305 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Hobgoblin White Mage',
            ids    = { 306 },
            nm     = true,
            levels = {
                [30] = { acc = 106, eva = 90, agi = 28, int = 26, mnd = 36, chr = 31 },
                [31] = { acc = 110, eva = 94, agi = 31, int = 28, mnd = 39, chr = 33 },
                [32] = { acc = 113, eva = 96, agi = 31, int = 28, mnd = 39, chr = 33 },
                [33] = { acc = 117, eva = 99, agi = 31, int = 29, mnd = 41, chr = 34 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Hobgoblin Black Mage',
            ids    = { 307 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 92, agi = 33, int = 36, mnd = 26, chr = 28 },
                [31] = { acc = 114, eva = 97, agi = 36, int = 39, mnd = 28, chr = 30 },
                [32] = { acc = 117, eva = 99, agi = 36, int = 39, mnd = 28, chr = 30 },
                [33] = { acc = 121, eva = 102, agi = 36, int = 41, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Hobgoblin Red Mage',
            ids    = { 308 },
            nm     = true,
            levels = {
                [30] = { acc = 109, eva = 96, agi = 28, int = 31, mnd = 31, chr = 28 },
                [31] = { acc = 113, eva = 100, agi = 31, int = 33, mnd = 33, chr = 30 },
                [32] = { acc = 116, eva = 102, agi = 31, int = 33, mnd = 33, chr = 30 },
                [33] = { acc = 120, eva = 105, agi = 31, int = 34, mnd = 34, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Hobgoblin Thief',
            ids    = { 309 },
            nm     = true,
            levels = {
                [30] = { acc = 113, eva = 133, agi = 37, int = 31, mnd = 21, chr = 21 },
                [31] = { acc = 117, eva = 137, agi = 38, int = 33, mnd = 23, chr = 23 },
                [32] = { acc = 120, eva = 140, agi = 38, int = 33, mnd = 23, chr = 23 },
                [33] = { acc = 124, eva = 143, agi = 39, int = 34, mnd = 24, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Hobgoblin Dark Knight',
            ids    = { 310 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 101, agi = 30, int = 31, mnd = 21, chr = 21 },
                [31] = { acc = 114, eva = 105, agi = 33, int = 33, mnd = 23, chr = 23 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 33, mnd = 23, chr = 23 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 34, mnd = 24, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Hobgoblin Ranger',
            ids    = { 311 },
            nm     = true,
            levels = {
                [30] = { acc = 131, eva = 95, agi = 38, int = 26, mnd = 28, chr = 26 },
                [31] = { acc = 135, eva = 100, agi = 42, int = 28, mnd = 30, chr = 28 },
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
                [33] = { acc = 142, eva = 105, agi = 43, int = 29, mnd = 32, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Hobgoblin Beastmaster',
            ids    = { 312 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 98, agi = 25, int = 26, mnd = 26, chr = 36 },
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
                [32] = { acc = 117, eva = 104, agi = 27, int = 28, mnd = 28, chr = 39 },
                [33] = { acc = 121, eva = 108, agi = 28, int = 29, mnd = 29, chr = 41 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Goblins Leech',
            ids    = { 313 },
            levels = {
                [28] = { acc = 101, eva = 94, agi = 29, int = 23, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 98, agi = 30, int = 25, mnd = 22, chr = 25 },
                [30] = { acc = 108, eva = 101, agi = 31, int = 25, mnd = 23, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            links  = 3,
        },
        {
            name   = 'Giant Warrior',
            ids    = { 314 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 100, agi = 29, int = 19, mnd = 23, chr = 28 },
                [31] = { acc = 114, eva = 105, agi = 32, int = 20, mnd = 24, chr = 31 },
                [32] = { acc = 117, eva = 107, agi = 32, int = 20, mnd = 24, chr = 31 },
                [33] = { acc = 121, eva = 110, agi = 32, int = 22, mnd = 26, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Giant Monk',
            ids    = { 315 },
            nm     = true,
            levels = {
                [30] = { acc = 112, eva = 99, agi = 21, int = 17, mnd = 28, chr = 28 },
                [31] = { acc = 115, eva = 103, agi = 23, int = 19, mnd = 30, chr = 31 },
                [32] = { acc = 118, eva = 105, agi = 23, int = 19, mnd = 30, chr = 31 },
                [33] = { acc = 122, eva = 109, agi = 24, int = 20, mnd = 32, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            aggro  = true,
            detects = { 'sight' },
            links  = 14,
        },
        {
            name   = 'Giant Beastmaster',
            ids    = { 316 },
            nm     = true,
            levels = {
                [30] = { acc = 110, eva = 97, agi = 23, int = 21, mnd = 25, chr = 36 },
                [31] = { acc = 114, eva = 101, agi = 25, int = 23, mnd = 27, chr = 39 },
                [32] = { acc = 117, eva = 103, agi = 25, int = 23, mnd = 27, chr = 39 },
                [33] = { acc = 121, eva = 107, agi = 26, int = 24, mnd = 28, chr = 40 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10, slow = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 15,
        },
        {
            name   = 'Giant High Ranger',
            ids    = { 317 },
            nm     = true,
            levels = {
                [30] = { acc = 131, eva = 102, agi = 33, int = 21, mnd = 27, chr = 28 },
                [31] = { acc = 135, eva = 107, agi = 36, int = 23, mnd = 28, chr = 31 },
                [32] = { acc = 138, eva = 109, agi = 36, int = 23, mnd = 28, chr = 31 },
                [33] = { acc = 142, eva = 112, agi = 37, int = 24, mnd = 30, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 16,
        },
        {
            name   = 'Giant Ranger',
            ids    = { 319, 320, 323, 324 },
            levels = {
                [30] = { acc = 110, eva = 100, agi = 29, int = 19, mnd = 23, chr = 28, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 105, agi = 32, int = 20, mnd = 24, chr = 31, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 107, agi = 32, int = 20, mnd = 24, chr = 31, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 110, agi = 32, int = 22, mnd = 26, chr = 31, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 114, agi = 34, int = 22, mnd = 26, chr = 32, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 117, agi = 35, int = 23, mnd = 27, chr = 33, resist = { virus = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Giant Hunter',
            ids    = { 321, 322, 325, 326 },
            levels = {
                [30] = { acc = 131, eva = 102, agi = 33, int = 21, mnd = 27, chr = 28,
                         resist = { poison = 10, virus = 10 } },
                [31] = { acc = 135, eva = 107, agi = 36, int = 23, mnd = 28, chr = 31,
                         resist = { poison = 10, virus = 10 } },
                [32] = { acc = 138, eva = 109, agi = 36, int = 23, mnd = 28, chr = 31,
                         resist = { poison = 10, virus = 10 } },
                [33] = { acc = 142, eva = 112, agi = 37, int = 24, mnd = 30, chr = 31,
                         resist = { poison = 10, virus = 10 } },
                [34] = { acc = 145, eva = 116, agi = 38, int = 24, mnd = 30, chr = 32,
                         resist = { poison = 10, virus = 10 } },
                [35] = { acc = 149, eva = 120, agi = 40, int = 26, mnd = 31, chr = 33,
                         resist = { poison = 10, virus = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Hunting Chief',
            ids    = { 327 },
            levels = {
                [35] = { acc = 130, eva = 116, agi = 26, int = 20, mnd = 32, chr = 33 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 1604 },  -- mannequin legs
                { rate = 100, item = 1605 },  -- mannequin feet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 17,
        },
        {
            name   = 'Dosetsu Tree',
            ids    = { 328 },
            nm     = true,
            levels = {
                [35] = { acc = 126, eva = 118, agi = 36, int = 27, mnd = 27, chr = 29 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'blind',
                       'terror', 'plague' },
            drops  = {
                { rate = 150, item = 17814 },  -- raikiri
            },
        },
        {
            name   = 'Malefic Fencer',
            ids    = { 330 },
            nm     = true,
            levels = {
                [32] = { acc = 115, eva = 101, agi = 28, int = 40, mnd = 33, chr = 34 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Seed Mandragora',
            ids    = { 331, 332, 333, 334, 335 },
            nm     = true,
            levels = {
                [32] = { acc = 118, eva = 106, agi = 24, int = 23, mnd = 30, chr = 28 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            links  = 18,
        },
        {
            name   = 'Kaggen',
            ids    = { 336, 337 },
            nm     = true,
            levels = {
                [95] = { acc = 442, eva = 376, agi = 96, int = 113, mnd = 81, chr = 87 },
                [96] = { acc = 450, eva = 382, agi = 99, int = 114, mnd = 82, chr = 90 },
            },
            ranks  = { ice = -1, wind = 4, earth = 4, water = -2, light = 2, dark = 2, paralyze = -1, bind = -1,
                       silence = 4, slow = 4, poison = -2, light_sleep = 2, dark_sleep = 2, blind = 2,
                       gravity = 4 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Bounty Hunter',
            ids    = { 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349, 350 },
            levels = {
                [10] = { acc = 41, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12, resist = { virus = 10 } },
                [11] = { acc = 45, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13, resist = { virus = 10 } },
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13, resist = { virus = 10 } },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14, resist = { virus = 10 } },
                [30] = { acc = 110, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26, resist = { virus = 10 } },
                [31] = { acc = 114, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
            },
            spawn_levels = { [339] = { 30, 36 }, [340] = { 30, 36 }, [341] = { 30, 36 }, [342] = { 30, 36 },
                             [343] = { 30, 36 }, [344] = { 30, 36 }, [345] = { 30, 36 }, [346] = { 30, 36 },
                             [347] = { 30, 36 }, [348] = { 30, 36 }, [349] = { 30, 36 }, [350] = { 10, 13 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 19,
        },
        {
            name   = 'Jester Malatrix',
            ids    = { 351, 352, 353 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Ophiotaurus',
            ids    = { 354 },
            levels = {
                [43] = { acc = 155, eva = 145, agi = 47, int = 36, mnd = 36, chr = 41 },
            },
            ranks  = { fire = 7, wind = 2, earth = 4, thunder = 2, water = -2, light = 1, dark = 1, silence = 2,
                       slow = 4, poison = -2, light_sleep = 1, dark_sleep = 1, blind = 1, stun = 2, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'low_hp' },
        },
        {
            name   = 'Echion',
            ids    = { 355 },
            nm     = true,
            levels = {
                [139] = { acc = 501, eva = 635, agi = 132, int = 90, mnd = 105, chr = 125 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 20,
        },
        {
            name   = 'Awoken Tanngrisnir',
            ids    = { 359 },
            nm     = true,
            levels = {
                [119] = { acc = 487, eva = 536, agi = 127, int = 97, mnd = 97, chr = 101 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
        },
    },
    by_name = {},
}
