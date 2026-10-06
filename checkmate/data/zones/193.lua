-- Ordelles Caves (zone 193).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Poison Leech', 'Thread Leech' } },
        [2] = { sound = { 'Ancient Bat', 'Hognosed Bat', 'Seeker Bats', 'Stink Bats' } },
        [3] = { sound = { 'Snipper' } },
        [4] = { sight = { 'Blood Bunny', 'Vorpal Bunny' } },
        [5] = {
            sight = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher',
                      'Goblin Mugger', 'Goblin Pathfinder', 'Goblin Shaman', 'Goblin Smithy', 'Goblin Tinkerer' },
        },
        [6] = { sound = { 'Fly Agaric', 'Shrieker' } },
        [7] = { sight = { 'Dung Beetle', 'Goliath Beetle' } },
        [8] = { sound = { 'Slash Pine', 'Stalking Sapling' } },
    },
    monsters = {
        {
            name   = 'Stag Crab',
            ids    = { 1, 2 },
            levels = {
                [15] = { acc = 55, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
                [16] = { acc = 59, eva = 53, agi = 13, int = 14, mnd = 20, chr = 20 },
                [17] = { acc = 62, eva = 55, agi = 13, int = 14, mnd = 20, chr = 20 },
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
            name   = 'Thread Leech',
            ids    = { 3 },
            levels = {
                [21] = { acc = 78, eva = 73, agi = 24, int = 20, mnd = 18, chr = 20 },
                [22] = { acc = 81, eva = 75, agi = 24, int = 20, mnd = 18, chr = 20 },
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
            name   = 'Poison Leech',
            ids    = { 4 },
            levels = {
                [25] = { acc = 91, eva = 85, agi = 26, int = 22, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 89, agi = 28, int = 23, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 91, agi = 29, int = 23, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Rancid Ooze',
            ids    = { 5 },
            levels = {
                [34] = { acc = 123, eva = 114, agi = 34, int = 26, mnd = 29, chr = 29 },
                [35] = { acc = 126, eva = 117, agi = 35, int = 27, mnd = 30, chr = 30 },
                [36] = { acc = 130, eva = 121, agi = 36, int = 28, mnd = 31, chr = 32 },
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
            name   = 'Stink Bats',
            ids    = { 6, 7, 8, 9, 12, 13, 14, 17, 18, 32, 33, 35, 37, 38, 41, 43, 44, 58, 59, 67, 68, 80, 81, 122,
                       125, 126, 135, 136, 151, 221, 222, 229, 230, 241, 242, 247, 248, 249, 250, 261, 262, 273,
                       274, 275, 276, 279, 280, 282, 283, 291, 292, 293, 296, 297, 299 },
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
            links  = 2,
        },
        {
            name   = 'Snipper OC',
            ids    = { 10, 11 },
            levels = {
                [17] = { acc = 62, eva = 55, agi = 13, int = 14, mnd = 20, chr = 20 },
                [18] = { acc = 65, eva = 59, agi = 14, int = 14, mnd = 20, chr = 20 },
                [19] = { acc = 69, eva = 62, agi = 14, int = 15, mnd = 22, chr = 22 },
                [20] = { acc = 72, eva = 65, agi = 14, int = 15, mnd = 22, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 4400 },  -- slice of land crab meat
                { rate = 10, item = 881 },  -- crab shell
            },
            links  = 3,
        },
        {
            name   = 'Blood Bunny',
            ids    = { 15, 16, 19, 20, 29, 30, 34, 36, 39, 40, 42, 231, 232, 233, 234, 243, 244, 245, 246 },
            levels = {
                [17] = { acc = 65, eva = 59, agi = 20, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 68, eva = 62, agi = 20, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 72, eva = 66, agi = 22, int = 16, mnd = 16, chr = 18 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 4,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 21, 24, 27, 224, 227, 236, 239 },
            levels = {
                [17] = { acc = 65, eva = 58, agi = 19, int = 20, mnd = 14, chr = 14 },
                [18] = { acc = 68, eva = 61, agi = 19, int = 20, mnd = 14, chr = 14 },
                [19] = { acc = 72, eva = 65, agi = 21, int = 22, mnd = 15, chr = 15 },
                [20] = { acc = 75, eva = 68, agi = 21, int = 22, mnd = 15, chr = 15, resist = { paralyze = 10 } },
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
            links  = 5,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 22, 25, 28, 225, 228, 237, 240 },
            levels = {
                [17] = { acc = 65, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 68, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 72, eva = 67, agi = 24, int = 16, mnd = 16, chr = 18 },
                [20] = { acc = 75, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18 },
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
            links  = 5,
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 23, 26, 31, 223, 226, 235, 238 },
            levels = {
                [17] = { acc = 74, eva = 56, agi = 25, int = 16, mnd = 17, chr = 16 },
                [18] = { acc = 77, eva = 58, agi = 25, int = 17, mnd = 17, chr = 17 },
                [19] = { acc = 81, eva = 62, agi = 27, int = 18, mnd = 19, chr = 18 },
                [20] = { acc = 84, eva = 64, agi = 27, int = 18, mnd = 19, chr = 18, resist = { poison = 10 } },
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
            links  = 5,
        },
        {
            name   = 'Hognosed Bat',
            ids    = { 45, 46, 47, 60, 69, 82, 88, 89, 90, 123, 124, 127, 137, 152, 159, 160, 161, 190, 191, 192,
                       193, 196, 197, 198, 251, 252, 253, 263, 264, 265, 298, 300, 301, 302, 303, 304 },
            levels = {
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 18 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Stalking Sapling',
            ids    = { 48, 49, 50, 51, 70, 71, 72, 73, 83, 84, 85, 86, 128, 129, 130, 138, 139, 140, 194, 195, 199,
                       200, 254, 255, 256, 266, 267, 268 },
            levels = {
                [18] = { acc = 67, eva = 62, agi = 20, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 66, agi = 22, int = 16, mnd = 16, chr = 17 },
                [20] = { acc = 74, eva = 69, agi = 22, int = 16, mnd = 16, chr = 17 },
                [21] = { acc = 78, eva = 73, agi = 24, int = 18, mnd = 18, chr = 19 },
            },
            spawn_levels = { [194] = { 19, 21 } },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 100, item = 573 },  -- bag of vegetable seeds
                { rate = 50, item = 572 },  -- bag of herb seeds
                { rate = 10, item = 575 },  -- bag of grain seeds
            },
        },
        {
            name   = 'Fly Agaric OC',
            ids    = { 52, 53, 54, 55, 56, 286, 287, 288, 289, 290 },
            levels = {
                [21] = { acc = 78, eva = 73, agi = 24, int = 17, mnd = 18, chr = 20 },
                [22] = { acc = 81, eva = 75, agi = 24, int = 17, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 78, agi = 24, int = 17, mnd = 18, chr = 20 },
                [24] = { acc = 88, eva = 82, agi = 26, int = 17, mnd = 19, chr = 21 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
            },
            links  = 6,
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 61, 64, 74, 77, 87, 94, 104, 113, 143, 158, 164, 165, 174 },
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
            links  = 5,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 62, 65, 75, 78, 93, 102, 103, 112, 133, 141, 142, 163, 172, 173 },
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
            links  = 5,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 63, 66, 76, 79, 91, 92, 101, 110, 111, 131, 132, 162, 171 },
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
            links  = 5,
        },
        {
            name   = 'Will-o-the-Wisp',
            ids    = { 95, 175, 313, 314, 315 },
            levels = {
                [23] = { acc = 85, eva = 78, agi = 24, int = 17, mnd = 18, chr = 22 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 17, mnd = 19, chr = 23 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 19, mnd = 20, chr = 25 },
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
            name   = 'Dung Beetle',
            ids    = { 96, 97, 98, 99, 100, 105, 106, 107, 108, 109, 208, 210, 211, 212 },
            levels = {
                [23] = { acc = 83, eva = 74, agi = 16, int = 16, mnd = 23, chr = 23 },
                [24] = { acc = 86, eva = 77, agi = 16, int = 16, mnd = 24, chr = 24 },
                [25] = { acc = 90, eva = 80, agi = 17, int = 17, mnd = 25, chr = 25 },
                [26] = { acc = 94, eva = 84, agi = 18, int = 18, mnd = 27, chr = 27 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 100, item = 889 },  -- beetle shell
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 7,
        },
        {
            name   = 'Jelly MS OC',
            ids    = { 114, 153, 154, 155, 156, 213, 214, 319 },
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
            name   = 'Stroper',
            ids    = { 115, 189, 201, 380, 381, 382 },
            levels = {
                [31] = { acc = 114, eva = 105, agi = 33, int = 24, mnd = 23, chr = 28 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 24, mnd = 23, chr = 28 },
                [33] = { acc = 121, eva = 111, agi = 34, int = 26, mnd = 24, chr = 29 },
                [34] = { acc = 125, eva = 115, agi = 36, int = 26, mnd = 24, chr = 29 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 920 },  -- malboro vine
                { rate = 150, item = 920 },  -- malboro vine
                { rate = 100, item = 920 },  -- malboro vine
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 50, item = 13118 },  -- shield pendant
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Stroper Chyme',
            ids    = { 116, 202, 339, 389 },
            levels = {
                [33] = { acc = 119, eva = 110, agi = 32, int = 26, mnd = 28, chr = 29 },
                [34] = { acc = 123, eva = 114, agi = 34, int = 26, mnd = 29, chr = 29 },
                [35] = { acc = 126, eva = 117, agi = 35, int = 27, mnd = 30, chr = 30 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 10, item = 15551 },  -- shikaree ring
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Vorpal Bunny',
            ids    = { 134, 144, 166, 167, 168, 169, 170, 176, 177, 178, 179, 180, 203, 204, 205, 209 },
            levels = {
                [23] = { acc = 85, eva = 78, agi = 24, int = 18, mnd = 18, chr = 20 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -2, earth = -1, thunder = -3, water = -3, light = -1, dark = -3,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -3, light_sleep = -1,
                       dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 856 },  -- rabbit hide
                { rate = 150, item = 4358 },  -- slice of hare meat
            },
            links  = 4,
        },
        {
            name   = 'Poison Leech',
            ids    = { 145, 146, 147, 148, 149, 150 },
            levels = {
                [25] = { acc = 91, eva = 85, agi = 26, int = 22, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 89, agi = 28, int = 23, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 91, agi = 29, int = 23, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Seeker Bats',
            ids    = { 181, 182, 183, 184, 206, 207, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 340,
                       341, 345, 346, 361, 362, 364, 365 },
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
            links  = 2,
        },
        {
            name   = 'Goblin Pathfinder',
            ids    = { 185, 347, 352, 367, 372 },
            levels = {
                [31] = { acc = 114, eva = 102, agi = 27, int = 28, mnd = 28, chr = 39 },
                [32] = { acc = 117, eva = 104, agi = 27, int = 28, mnd = 28, chr = 39 },
                [33] = { acc = 121, eva = 108, agi = 28, int = 29, mnd = 29, chr = 41 },
                [34] = { acc = 125, eva = 111, agi = 29, int = 29, mnd = 29, chr = 42 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 10 },
            drops  = {
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 50, item = 1531 },  -- sack of galka fangs
                { rate = 10, item = 12817 },  -- brass cuisses
                { rate = 10, item = 12433 },  -- brass mask
                { rate = 10, item = 12689 },  -- brass finger gauntlets
                { rate = 10, item = 12945 },  -- brass greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Goblins Bats',
            ids    = { 186, 348, 353, 368, 373 },
            levels = {
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 2,
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 187, 349, 354, 369, 374 },
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
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 50, item = 1531 },  -- sack of galka fangs
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
            links  = 5,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 188, 351, 356, 371, 376 },
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
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 1, item = 12474 },  -- wool hat
                { rate = 1, item = 12730 },  -- wool cuffs
                { rate = 1, item = 12858 },  -- wool slops
                { rate = 1, item = 12986 },  -- chestnut sabots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Thread Leech OC',
            ids    = { 257, 258, 259, 260, 269, 270, 271, 272, 277, 278, 281, 284, 285, 294, 295 },
            levels = {
                [18] = { acc = 67, eva = 62, agi = 20, int = 17, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 66, agi = 22, int = 18, mnd = 16, chr = 18 },
                [20] = { acc = 74, eva = 69, agi = 22, int = 18, mnd = 16, chr = 18 },
                [21] = { acc = 78, eva = 73, agi = 24, int = 20, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Shrieker OC',
            ids    = { 305, 306, 307, 308, 309, 310, 311, 312 },
            levels = {
                [24] = { acc = 88, eva = 82, agi = 26, int = 17, mnd = 19, chr = 21 },
                [25] = { acc = 91, eva = 85, agi = 26, int = 19, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 89, agi = 28, int = 19, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 91, agi = 29, int = 19, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 100, item = 4373 },  -- woozyshroom
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Clipper',
            ids    = { 316, 317, 318 },
            levels = {
                [26] = { acc = 92, eva = 84, agi = 18, int = 19, mnd = 28, chr = 28 },
                [27] = { acc = 96, eva = 86, agi = 18, int = 20, mnd = 29, chr = 29 },
                [28] = { acc = 99, eva = 89, agi = 19, int = 20, mnd = 29, chr = 29 },
                [29] = { acc = 102, eva = 92, agi = 19, int = 20, mnd = 30, chr = 30 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 50, item = 881 },  -- crab shell
            },
        },
        {
            name   = 'Goliath Beetle',
            ids    = { 320, 321, 335, 336, 337, 338, 343, 344 },
            levels = {
                [29] = { acc = 104, eva = 92, agi = 19, int = 19, mnd = 29, chr = 29 },
                [30] = { acc = 107, eva = 95, agi = 19, int = 19, mnd = 29, chr = 29 },
                [31] = { acc = 111, eva = 100, agi = 22, int = 22, mnd = 32, chr = 32 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 10, item = 1030 },  -- ordelle chest key
                { rate = 240, item = 846 },  -- insect wing
                { rate = 150, item = 889 },  -- beetle shell
                { rate = 100, item = 894 },  -- beetle jaw
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Ancient Bat',
            ids    = { 333, 334, 342, 363, 366, 377, 378, 379 },
            levels = {
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 350, 355, 370, 375 },
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
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 10, item = 12424 },  -- iron mask
                { rate = 10, item = 12808 },  -- chain hose
                { rate = 10, item = 12680 },  -- chain mittens
                { rate = 10, item = 12936 },  -- greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Slash Pine',
            ids    = { 357, 358, 359, 360 },
            levels = {
                [27] = { acc = 98, eva = 91, agi = 29, int = 21, mnd = 21, chr = 22 },
                [28] = { acc = 101, eva = 94, agi = 29, int = 21, mnd = 21, chr = 24 },
                [29] = { acc = 105, eva = 98, agi = 30, int = 22, mnd = 22, chr = 24 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 100, item = 575 },  -- bag of grain seeds
                { rate = 50, item = 572 },  -- bag of herb seeds
                { rate = 10, item = 17134 },  -- dolphin staff
            },
            links  = 8,
        },
        {
            name   = 'Morbolger',
            ids    = { 383 },
            nm     = true,
            levels = {
                [42] = { acc = 153, eva = 141, agi = 44, int = 33, mnd = 31, chr = 37 },
                [43] = { acc = 156, eva = 144, agi = 44, int = 33, mnd = 31, chr = 38 },
                [44] = { acc = 161, eva = 148, agi = 47, int = 34, mnd = 31, chr = 39 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 1013 },  -- morbolger vine
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 240, item = 920 },  -- malboro vine
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
        },
        {
            name   = 'Napalm',
            ids    = { 384, 385 },
            levels = {
                [31] = { acc = 114, eva = 105, agi = 33, int = 23, mnd = 24, chr = 31 },
                [32] = { acc = 117, eva = 107, agi = 33, int = 23, mnd = 24, chr = 31 },
                [33] = { acc = 120, eva = 111, agi = 34, int = 24, mnd = 26, chr = 31 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
                { rate = 50, item = 1030 },  -- ordelle chest key
                { rate = 50, item = 16522 },  -- flame degen
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 386 },
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
                { rate = 50, item = 1030 },  -- ordelle chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 387 },
            levels = {
                [33] = { acc = 119, eva = 106, agi = 33, int = 39, mnd = 30, chr = 32 },
                [34] = { acc = 122, eva = 110, agi = 34, int = 40, mnd = 31, chr = 32 },
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 50, item = 1030 },  -- ordelle chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Polevik',
            ids    = { 390 },
            nm     = true,
            levels = {
                [45] = { acc = 160, eva = 143, agi = 42, int = 49, mnd = 45, chr = 43 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 10, gravity = -3 },
            magic_dmg = { all = -75 },
            immune = { 'dark_sleep', 'light_sleep', 'slow', 'elegy', 'terror' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Gerwitzs Axe',
            ids    = { 391 },
            nm     = true,
            levels = {
                [50] = { acc = 728, eva = 169, agi = 54, int = 50, mnd = 41, chr = 51 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 16681 },  -- gerwitzs axe
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Gerwitzs Sword',
            ids    = { 392 },
            nm     = true,
            levels = {
                [52] = { acc = 192, eva = 175, agi = 49, int = 66, mnd = 44, chr = 48 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 16940 },  -- gerwitzs sword
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Gerwitzs Soul',
            ids    = { 393 },
            nm     = true,
            levels = {
                [54] = { acc = 202, eva = 190, agi = 58, int = 55, mnd = 42, chr = 53 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 10, bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 10, stun = 10, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Necroplasm',
            ids    = { 394 },
            nm     = true,
            levels = {
                [23] = { acc = 84, eva = 78, agi = 24, int = 18, mnd = 17, chr = 22 },
                [24] = { acc = 88, eva = 82, agi = 26, int = 19, mnd = 17, chr = 23 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 395 },
            nm     = true,
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
                { rate = 50, item = 1030 },  -- ordelle chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Aroma Leech',
            ids    = { 396 },
            nm     = true,
            levels = {
                [38] = { acc = 136, eva = 127, agi = 38, int = 32, mnd = 29, chr = 33 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Metallic Slime',
            ids    = { 397 },
            levels = {
                [34] = { acc = 123, eva = 114, agi = 34, int = 26, mnd = 29, chr = 29 },
                [35] = { acc = 126, eva = 117, agi = 35, int = 27, mnd = 30, chr = 30 },
                [36] = { acc = 130, eva = 121, agi = 36, int = 28, mnd = 31, chr = 32 },
                [37] = { acc = 133, eva = 123, agi = 36, int = 29, mnd = 32, chr = 32 },
                [38] = { acc = 136, eva = 126, agi = 37, int = 29, mnd = 32, chr = 33 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Krabimanjaro',
            ids    = { 398, 399, 400 },
            nm     = true,
            levels = {
                [95] = { acc = 441, eva = 399, agi = 82, int = 97, mnd = 86, chr = 90 },
                [96] = { acc = 449, eva = 403, agi = 83, int = 98, mnd = 88, chr = 93 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
        },
    },
    by_name = {},
}
