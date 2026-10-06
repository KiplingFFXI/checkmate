-- Outer Horutoto Ruins (zone 194).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver' },
        },
        [2] = { sound = { 'Battue Bats', 'Blade Bat', 'Combat', 'Stink Bats' } },
        [3] = {
            sound = { 'Eight of Batons', 'Eight of Coins', 'Eight of Cups', 'Eight of Swords', 'Five of Batons',
                      'Five of Coins', 'Five of Cups', 'Five of Swords', 'Four of Batons', 'Four of Coins',
                      'Four of Cups', 'Four of Swords', 'Nine of Batons', 'Nine of Coins', 'Nine of Cups',
                      'Nine of Swords', 'Seven of Batons', 'Seven of Coins', 'Seven of Cups', 'Seven of Swords',
                      'Six of Batons', 'Six of Coins', 'Six of Cups', 'Six of Swords', 'Ten of Batons',
                      'Ten of Coins', 'Ten of Cups', 'Ten of Swords', 'Three of Batons', 'Three of Coins',
                      'Three of Cups', 'Three of Swords', 'Two of Batons', 'Two of Coins', 'Two of Cups',
                      'Two of Swords' },
            true_sound = { 'Custom Cardian', 'Queen of Coins', 'Queen of Swords' },
        },
        [4] = { sound = { 'Doppelganger Dio', 'Doppelganger Gog' } },
        [5] = {
            sound = { 'Eight of Batons', 'Eight of Coins', 'Eight of Cups', 'Eight of Swords', 'Five of Batons',
                      'Five of Coins', 'Five of Cups', 'Five of Swords', 'Four of Batons', 'Four of Coins',
                      'Four of Cups', 'Four of Swords', 'Nine of Batons', 'Nine of Coins', 'Nine of Cups',
                      'Nine of Swords', 'Seven of Batons', 'Seven of Coins', 'Seven of Cups', 'Seven of Swords',
                      'Six of Batons', 'Six of Coins', 'Six of Cups', 'Six of Swords', 'Ten of Batons',
                      'Ten of Coins', 'Ten of Cups', 'Ten of Swords', 'Three of Batons', 'Three of Coins',
                      'Three of Cups', 'Three of Swords', 'Two of Batons', 'Two of Coins', 'Two of Cups',
                      'Two of Swords' },
            true_sound = { 'Custom Cardian', 'Queen of Coins' },
        },
        [6] = {
            sound = { 'Eight of Batons', 'Eight of Coins', 'Eight of Cups', 'Eight of Swords', 'Five of Batons',
                      'Five of Coins', 'Five of Cups', 'Five of Swords', 'Four of Batons', 'Four of Coins',
                      'Four of Cups', 'Four of Swords', 'Nine of Batons', 'Nine of Coins', 'Nine of Cups',
                      'Nine of Swords', 'Seven of Batons', 'Seven of Coins', 'Seven of Cups', 'Seven of Swords',
                      'Six of Batons', 'Six of Coins', 'Six of Cups', 'Six of Swords', 'Ten of Batons',
                      'Ten of Coins', 'Ten of Cups', 'Ten of Swords', 'Three of Batons', 'Three of Coins',
                      'Three of Cups', 'Three of Swords', 'Two of Batons', 'Two of Coins', 'Two of Cups',
                      'Two of Swords' },
            true_sound = { 'Custom Cardian', 'Queen of Swords' },
        },
    },
    monsters = {
        {
            name   = 'Goblin Ambusher',
            ids    = { 1, 5, 6, 13, 14, 21, 25, 38, 39, 44 },
            levels = {
                [10] = { acc = 50, eva = 35, agi = 18, int = 12, mnd = 13, chr = 12 },
                [11] = { acc = 53, eva = 39, agi = 20, int = 13, mnd = 13, chr = 13 },
                [12] = { acc = 56, eva = 41, agi = 20, int = 13, mnd = 13, chr = 13 },
                [13] = { acc = 60, eva = 44, agi = 21, int = 14, mnd = 15, chr = 14 },
                [14] = { acc = 63, eva = 47, agi = 22, int = 14, mnd = 15, chr = 14 },
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
            ids    = { 2, 7, 8, 15, 16, 22, 26, 40 },
            levels = {
                [10] = { acc = 41, eva = 37, agi = 14, int = 15, mnd = 10, chr = 10 },
                [11] = { acc = 45, eva = 40, agi = 15, int = 16, mnd = 11, chr = 11 },
                [12] = { acc = 48, eva = 42, agi = 15, int = 16, mnd = 11, chr = 11 },
                [13] = { acc = 51, eva = 46, agi = 16, int = 17, mnd = 12, chr = 12 },
                [14] = { acc = 55, eva = 49, agi = 17, int = 18, mnd = 12, chr = 12 },
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
            ids    = { 3, 9, 10, 17, 18, 23, 27, 41, 45, 46 },
            levels = {
                [10] = { acc = 41, eva = 38, agi = 16, int = 11, mnd = 11, chr = 12 },
                [11] = { acc = 45, eva = 42, agi = 18, int = 11, mnd = 11, chr = 13 },
                [12] = { acc = 48, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 51, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 55, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
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
            name   = 'Stink Bats OHR',
            ids    = { 4, 11, 12, 19, 20, 24, 28, 29, 47, 48, 49, 50, 64, 65 },
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
                { rate = 50, item = 1029 },  -- horutoto chest key
            },
            links  = 2,
        },
        {
            name   = 'Rotten Jam',
            ids    = { 31, 32, 42, 43 },
            levels = {
                [12] = { acc = 47, eva = 43, agi = 16, int = 11, mnd = 13, chr = 13 },
                [13] = { acc = 50, eva = 46, agi = 16, int = 13, mnd = 14, chr = 14 },
                [14] = { acc = 54, eva = 49, agi = 17, int = 13, mnd = 15, chr = 14 },
                [15] = { acc = 57, eva = 53, agi = 18, int = 13, mnd = 15, chr = 15 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Blade Bat',
            ids    = { 34, 35, 36, 37, 343, 344, 345, 348, 349, 350 },
            levels = {
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
            },
            spawn_levels = { [343] = { 4, 6 }, [344] = { 4, 6 }, [345] = { 4, 6 }, [348] = { 4, 6 },
                             [349] = { 4, 6 }, [350] = { 4, 6 } },
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
            name   = 'Black Slime',
            ids    = { 51, 52 },
            levels = {
                [23] = { acc = 84, eva = 77, agi = 23, int = 18, mnd = 20, chr = 20 },
                [24] = { acc = 88, eva = 81, agi = 24, int = 19, mnd = 21, chr = 21 },
                [25] = { acc = 91, eva = 84, agi = 25, int = 20, mnd = 22, chr = 23 },
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
            name   = 'Ghoul blm',
            ids    = { 53, 55, 57, 59, 72, 77, 78, 79, 80 },
            levels = {
                [23] = { acc = 85, eva = 71, agi = 24, int = 28, mnd = 19, chr = 22 },
                [24] = { acc = 89, eva = 74, agi = 26, int = 29, mnd = 19, chr = 24 },
                [25] = { acc = 92, eva = 77, agi = 26, int = 31, mnd = 22, chr = 24 },
                [26] = { acc = 96, eva = 80, agi = 28, int = 31, mnd = 22, chr = 24 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 100, item = 880 },  -- bone chip
                { rate = 50, item = 4824 },  -- scroll of gravity
                { rate = 50, item = 538 },  -- magicked skull
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ghoul war',
            ids    = { 54, 56, 58, 60, 70, 71, 73, 74, 75, 76 },
            levels = {
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
                { rate = 100, item = 880 },  -- bone chip
                { rate = 50, item = 4824 },  -- scroll of gravity
                { rate = 50, item = 538 },  -- magicked skull
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Combat',
            ids    = { 61, 62, 66, 67, 68, 69 },
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
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 150, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Two of Cups',
            ids    = { 89, 93, 97, 213, 217, 221, 225, 229, 233, 265, 269, 273, 277, 281, 285 },
            levels = {
                [1] = { acc = 9, eva = 7, agi = 7, int = 7, mnd = 10, chr = 10 },
                [2] = { acc = 12, eva = 9, agi = 7, int = 7, mnd = 10, chr = 10 },
                [3] = { acc = 15, eva = 12, agi = 7, int = 7, mnd = 11, chr = 10 },
                [4] = { acc = 19, eva = 14, agi = 7, int = 8, mnd = 12, chr = 12 },
                [5] = { acc = 22, eva = 18, agi = 9, int = 9, mnd = 13, chr = 12 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 961 },  -- two of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Two of Batons',
            ids    = { 90, 94, 98, 214, 218, 222, 226, 230, 234, 266, 270, 274, 278, 282, 286 },
            levels = {
                [1] = { acc = 11, eva = 8, agi = 9, int = 10, mnd = 7, chr = 8 },
                [2] = { acc = 14, eva = 10, agi = 9, int = 10, mnd = 7, chr = 8 },
                [3] = { acc = 17, eva = 13, agi = 9, int = 11, mnd = 7, chr = 8 },
                [4] = { acc = 21, eva = 16, agi = 10, int = 12, mnd = 8, chr = 10 },
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 10 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 974 },  -- two of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Two of Swords',
            ids    = { 91, 95, 99, 215, 219, 223, 227, 231, 235, 267, 271, 275, 279, 283, 287 },
            levels = {
                [1] = { acc = 10, eva = 8, agi = 6, int = 6, mnd = 9, chr = 10 },
                [2] = { acc = 13, eva = 10, agi = 6, int = 6, mnd = 9, chr = 10 },
                [3] = { acc = 16, eva = 13, agi = 6, int = 6, mnd = 9, chr = 10 },
                [4] = { acc = 19, eva = 16, agi = 6, int = 7, mnd = 11, chr = 12 },
                [5] = { acc = 23, eva = 19, agi = 7, int = 7, mnd = 11, chr = 12 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 987 },  -- two of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Two of Coins',
            ids    = { 92, 96, 100, 216, 220, 224, 228, 232, 236, 268, 272, 276, 280, 284, 288 },
            levels = {
                [1] = { acc = 10, eva = 7, agi = 7, int = 9, mnd = 9, chr = 8 },
                [2] = { acc = 13, eva = 9, agi = 7, int = 9, mnd = 9, chr = 8 },
                [3] = { acc = 16, eva = 12, agi = 7, int = 9, mnd = 9, chr = 8 },
                [4] = { acc = 20, eva = 15, agi = 7, int = 11, mnd = 11, chr = 10 },
                [5] = { acc = 23, eva = 18, agi = 9, int = 11, mnd = 11, chr = 10 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1000 },  -- two of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Three of Cups',
            ids    = { 101, 105, 109, 237, 241, 245, 249, 257, 261, 289, 293, 297, 309, 313, 317 },
            levels = {
                [1] = { acc = 9, eva = 7, agi = 7, int = 7, mnd = 10, chr = 10 },
                [2] = { acc = 12, eva = 9, agi = 7, int = 7, mnd = 10, chr = 10 },
                [3] = { acc = 15, eva = 12, agi = 7, int = 7, mnd = 11, chr = 10 },
                [4] = { acc = 19, eva = 14, agi = 7, int = 8, mnd = 12, chr = 12 },
                [5] = { acc = 22, eva = 18, agi = 9, int = 9, mnd = 13, chr = 12 },
                [6] = { acc = 26, eva = 20, agi = 9, int = 9, mnd = 13, chr = 14 },
                [7] = { acc = 29, eva = 23, agi = 9, int = 10, mnd = 15, chr = 14 },
                [8] = { acc = 32, eva = 26, agi = 11, int = 11, mnd = 15, chr = 14 },
                [9] = { acc = 36, eva = 29, agi = 11, int = 11, mnd = 16, chr = 16 },
            },
            spawn_levels = { [101] = { 5, 9 }, [105] = { 5, 9 }, [109] = { 5, 9 }, [237] = { 1, 5 },
                             [241] = { 5, 9 }, [245] = { 5, 9 }, [249] = { 5, 9 }, [257] = { 5, 9 },
                             [261] = { 5, 9 }, [289] = { 5, 9 }, [293] = { 5, 9 }, [297] = { 5, 9 },
                             [309] = { 5, 9 }, [313] = { 5, 9 }, [317] = { 5, 9 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 962 },  -- three of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Three of Batons',
            ids    = { 102, 106, 110, 238, 242, 246, 250, 258, 262, 290, 294, 298, 310, 314, 318 },
            levels = {
                [5] = { acc = 24, eva = 19, agi = 11, int = 13, mnd = 9, chr = 10 },
                [6] = { acc = 28, eva = 22, agi = 12, int = 13, mnd = 9, chr = 11 },
                [7] = { acc = 31, eva = 25, agi = 12, int = 15, mnd = 10, chr = 12 },
                [8] = { acc = 34, eva = 27, agi = 13, int = 15, mnd = 11, chr = 12 },
                [9] = { acc = 38, eva = 31, agi = 14, int = 16, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 975 },  -- three of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Three of Swords',
            ids    = { 103, 107, 111, 239, 243, 247, 251, 259, 263, 291, 295, 299, 311, 315, 319 },
            levels = {
                [5] = { acc = 23, eva = 19, agi = 7, int = 7, mnd = 11, chr = 12 },
                [6] = { acc = 26, eva = 23, agi = 8, int = 8, mnd = 12, chr = 14 },
                [7] = { acc = 29, eva = 25, agi = 8, int = 9, mnd = 13, chr = 14 },
                [8] = { acc = 33, eva = 28, agi = 9, int = 9, mnd = 13, chr = 14 },
                [9] = { acc = 36, eva = 31, agi = 9, int = 9, mnd = 14, chr = 16 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 988 },  -- three of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Three of Coins',
            ids    = { 104, 108, 112, 240, 244, 248, 252, 260, 264, 292, 296, 300, 312, 316, 320 },
            levels = {
                [5] = { acc = 23, eva = 18, agi = 9, int = 11, mnd = 11, chr = 10 },
                [6] = { acc = 26, eva = 21, agi = 9, int = 12, mnd = 12, chr = 11 },
                [7] = { acc = 30, eva = 24, agi = 9, int = 13, mnd = 13, chr = 12 },
                [8] = { acc = 33, eva = 27, agi = 11, int = 13, mnd = 13, chr = 12 },
                [9] = { acc = 36, eva = 30, agi = 11, int = 14, mnd = 14, chr = 13 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1001 },  -- three of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Four of Cups',
            ids    = { 113, 117 },
            levels = {
                [10] = { acc = 39, eva = 31, agi = 11, int = 12, mnd = 17, chr = 16 },
                [11] = { acc = 42, eva = 35, agi = 13, int = 13, mnd = 18, chr = 18 },
                [12] = { acc = 45, eva = 37, agi = 13, int = 13, mnd = 18, chr = 18 },
                [13] = { acc = 49, eva = 40, agi = 13, int = 14, mnd = 20, chr = 18 },
                [14] = { acc = 52, eva = 42, agi = 13, int = 14, mnd = 20, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 963 },  -- four of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Four of Batons',
            ids    = { 114, 118 },
            levels = {
                [10] = { acc = 41, eva = 33, agi = 14, int = 17, mnd = 12, chr = 14 },
                [11] = { acc = 45, eva = 37, agi = 16, int = 18, mnd = 13, chr = 15 },
                [12] = { acc = 48, eva = 39, agi = 16, int = 18, mnd = 13, chr = 15 },
                [13] = { acc = 51, eva = 42, agi = 16, int = 20, mnd = 14, chr = 16 },
                [14] = { acc = 55, eva = 44, agi = 17, int = 20, mnd = 14, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 976 },  -- four of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Four of Swords',
            ids    = { 115, 119 },
            levels = {
                [10] = { acc = 39, eva = 34, agi = 9, int = 10, mnd = 15, chr = 16 },
                [11] = { acc = 43, eva = 38, agi = 11, int = 11, mnd = 16, chr = 18 },
                [12] = { acc = 46, eva = 40, agi = 11, int = 11, mnd = 16, chr = 18 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 12, mnd = 17, chr = 18 },
                [14] = { acc = 53, eva = 46, agi = 11, int = 12, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 989 },  -- four of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Four of Coins',
            ids    = { 116, 120 },
            levels = {
                [10] = { acc = 40, eva = 33, agi = 11, int = 15, mnd = 15, chr = 14 },
                [11] = { acc = 43, eva = 37, agi = 13, int = 16, mnd = 16, chr = 15 },
                [12] = { acc = 46, eva = 39, agi = 13, int = 16, mnd = 16, chr = 15 },
                [13] = { acc = 50, eva = 42, agi = 13, int = 17, mnd = 17, chr = 16 },
                [14] = { acc = 53, eva = 45, agi = 13, int = 18, mnd = 18, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1002 },  -- four of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Five of Cups',
            ids    = { 121, 125, 129 },
            levels = {
                [15] = { acc = 55, eva = 46, agi = 15, int = 15, mnd = 21, chr = 20 },
                [16] = { acc = 59, eva = 48, agi = 15, int = 16, mnd = 22, chr = 22 },
                [17] = { acc = 62, eva = 51, agi = 15, int = 16, mnd = 23, chr = 22 },
                [18] = { acc = 65, eva = 54, agi = 17, int = 17, mnd = 23, chr = 22 },
                [19] = { acc = 69, eva = 57, agi = 17, int = 18, mnd = 25, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 964 },  -- five of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Five of Batons',
            ids    = { 122, 126, 130 },
            levels = {
                [15] = { acc = 58, eva = 48, agi = 18, int = 21, mnd = 15, chr = 17 },
                [16] = { acc = 62, eva = 50, agi = 19, int = 22, mnd = 16, chr = 19 },
                [17] = { acc = 65, eva = 53, agi = 19, int = 23, mnd = 16, chr = 19 },
                [18] = { acc = 68, eva = 56, agi = 20, int = 23, mnd = 17, chr = 19 },
                [19] = { acc = 72, eva = 59, agi = 21, int = 25, mnd = 18, chr = 21 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 977 },  -- five of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Five of Swords',
            ids    = { 123, 127, 131 },
            levels = {
                [15] = { acc = 56, eva = 50, agi = 12, int = 12, mnd = 18, chr = 20 },
                [16] = { acc = 60, eva = 53, agi = 13, int = 14, mnd = 20, chr = 22 },
                [17] = { acc = 63, eva = 55, agi = 13, int = 14, mnd = 20, chr = 22 },
                [18] = { acc = 66, eva = 59, agi = 14, int = 14, mnd = 20, chr = 22 },
                [19] = { acc = 70, eva = 62, agi = 14, int = 15, mnd = 22, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 990 },  -- five of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Five of Coins',
            ids    = { 124, 128, 132 },
            levels = {
                [15] = { acc = 56, eva = 48, agi = 15, int = 18, mnd = 18, chr = 17 },
                [16] = { acc = 60, eva = 51, agi = 15, int = 20, mnd = 20, chr = 19 },
                [17] = { acc = 63, eva = 54, agi = 15, int = 20, mnd = 20, chr = 19 },
                [18] = { acc = 66, eva = 57, agi = 17, int = 20, mnd = 20, chr = 19 },
                [19] = { acc = 70, eva = 60, agi = 17, int = 22, mnd = 22, chr = 21 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 1003 },  -- five of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Six of Cups',
            ids    = { 133, 137, 141 },
            levels = {
                [20] = { acc = 72, eva = 59, agi = 17, int = 18, mnd = 25, chr = 24 },
                [21] = { acc = 76, eva = 63, agi = 19, int = 20, mnd = 27, chr = 26 },
                [22] = { acc = 79, eva = 65, agi = 19, int = 20, mnd = 27, chr = 26 },
                [23] = { acc = 82, eva = 68, agi = 19, int = 20, mnd = 28, chr = 26 },
                [24] = { acc = 85, eva = 70, agi = 19, int = 21, mnd = 29, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 965 },  -- six of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Six of Batons',
            ids    = { 134, 138, 142 },
            levels = {
                [20] = { acc = 75, eva = 61, agi = 21, int = 25, mnd = 18, chr = 21 },
                [21] = { acc = 79, eva = 65, agi = 23, int = 27, mnd = 20, chr = 24 },
                [22] = { acc = 82, eva = 67, agi = 23, int = 27, mnd = 20, chr = 24 },
                [23] = { acc = 85, eva = 70, agi = 23, int = 28, mnd = 20, chr = 24 },
                [24] = { acc = 89, eva = 73, agi = 24, int = 29, mnd = 21, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 978 },  -- six of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Six of Swords',
            ids    = { 135, 139, 143 },
            levels = {
                [20] = { acc = 73, eva = 65, agi = 14, int = 15, mnd = 22, chr = 24 },
                [21] = { acc = 77, eva = 69, agi = 16, int = 17, mnd = 24, chr = 26 },
                [22] = { acc = 80, eva = 71, agi = 16, int = 17, mnd = 24, chr = 26 },
                [23] = { acc = 83, eva = 74, agi = 16, int = 17, mnd = 24, chr = 26 },
                [24] = { acc = 86, eva = 77, agi = 16, int = 18, mnd = 26, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 991 },  -- six of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Six of Coins',
            ids    = { 136, 140, 144 },
            levels = {
                [20] = { acc = 73, eva = 63, agi = 17, int = 22, mnd = 22, chr = 21 },
                [21] = { acc = 78, eva = 67, agi = 19, int = 24, mnd = 24, chr = 24 },
                [22] = { acc = 81, eva = 69, agi = 19, int = 24, mnd = 24, chr = 24 },
                [23] = { acc = 84, eva = 72, agi = 19, int = 24, mnd = 24, chr = 24 },
                [24] = { acc = 88, eva = 75, agi = 19, int = 26, mnd = 26, chr = 26 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 100, item = 1004 },  -- six of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Eight of Cups',
            ids    = { 145, 149, 153, 157 },
            levels = {
                [30] = { acc = 105, eva = 88, agi = 24, int = 26, mnd = 36, chr = 33 },
                [31] = { acc = 109, eva = 92, agi = 27, int = 28, mnd = 39, chr = 36 },
                [32] = { acc = 112, eva = 94, agi = 27, int = 28, mnd = 39, chr = 36 },
                [33] = { acc = 116, eva = 97, agi = 27, int = 29, mnd = 41, chr = 36 },
                [34] = { acc = 119, eva = 99, agi = 27, int = 29, mnd = 42, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 967 },  -- eight of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Eight of Batons',
            ids    = { 146, 150, 154, 158 },
            levels = {
                [30] = { acc = 109, eva = 90, agi = 29, int = 36, mnd = 26, chr = 30 },
                [31] = { acc = 114, eva = 95, agi = 32, int = 39, mnd = 28, chr = 33 },
                [32] = { acc = 117, eva = 97, agi = 32, int = 39, mnd = 28, chr = 33 },
                [33] = { acc = 120, eva = 100, agi = 32, int = 41, mnd = 29, chr = 34 },
                [34] = { acc = 124, eva = 103, agi = 34, int = 42, mnd = 29, chr = 35 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 980 },  -- eight of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Eight of Swords',
            ids    = { 147, 151, 155, 159 },
            levels = {
                [30] = { acc = 107, eva = 95, agi = 19, int = 21, mnd = 31, chr = 33 },
                [31] = { acc = 111, eva = 100, agi = 22, int = 23, mnd = 33, chr = 36 },
                [32] = { acc = 114, eva = 102, agi = 22, int = 23, mnd = 33, chr = 36 },
                [33] = { acc = 117, eva = 105, agi = 22, int = 24, mnd = 34, chr = 36 },
                [34] = { acc = 121, eva = 108, agi = 22, int = 24, mnd = 36, chr = 39 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 993 },  -- eight of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Eight of Coins',
            ids    = { 148, 152, 156, 160 },
            levels = {
                [30] = { acc = 108, eva = 94, agi = 24, int = 31, mnd = 31, chr = 30 },
                [31] = { acc = 112, eva = 98, agi = 27, int = 33, mnd = 33, chr = 33 },
                [32] = { acc = 115, eva = 100, agi = 27, int = 33, mnd = 33, chr = 33 },
                [33] = { acc = 119, eva = 103, agi = 27, int = 34, mnd = 34, chr = 34 },
                [34] = { acc = 122, eva = 106, agi = 27, int = 36, mnd = 36, chr = 35 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1006 },  -- eight of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Dancing Weapon',
            ids    = { 161, 162, 163, 164, 181, 182, 183, 184, 201, 202, 203, 204 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 29, int = 27, mnd = 21, chr = 29 },
                [29] = { acc = 106, eva = 98, agi = 30, int = 29, mnd = 22, chr = 29 },
                [30] = { acc = 109, eva = 101, agi = 31, int = 29, mnd = 23, chr = 30 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Seven of Cups',
            ids    = { 165, 169, 173, 177 },
            levels = {
                [25] = { acc = 89, eva = 75, agi = 22, int = 23, mnd = 31, chr = 28 },
                [26] = { acc = 92, eva = 77, agi = 22, int = 23, mnd = 31, chr = 31 },
                [27] = { acc = 95, eva = 80, agi = 22, int = 24, mnd = 33, chr = 31 },
                [28] = { acc = 98, eva = 83, agi = 24, int = 25, mnd = 34, chr = 31 },
                [29] = { acc = 102, eva = 86, agi = 24, int = 25, mnd = 35, chr = 33 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 966 },  -- seven of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Seven of Batons',
            ids    = { 166, 170, 174, 178 },
            levels = {
                [25] = { acc = 92, eva = 76, agi = 25, int = 31, mnd = 23, chr = 26 },
                [26] = { acc = 96, eva = 79, agi = 27, int = 31, mnd = 23, chr = 27 },
                [27] = { acc = 99, eva = 82, agi = 27, int = 33, mnd = 24, chr = 28 },
                [28] = { acc = 102, eva = 85, agi = 28, int = 34, mnd = 25, chr = 28 },
                [29] = { acc = 106, eva = 88, agi = 29, int = 35, mnd = 25, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 979 },  -- seven of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Seven of Swords',
            ids    = { 167, 171, 175, 179 },
            levels = {
                [25] = { acc = 90, eva = 80, agi = 17, int = 18, mnd = 26, chr = 28 },
                [26] = { acc = 94, eva = 84, agi = 18, int = 19, mnd = 28, chr = 31 },
                [27] = { acc = 97, eva = 86, agi = 18, int = 20, mnd = 29, chr = 31 },
                [28] = { acc = 100, eva = 89, agi = 19, int = 20, mnd = 29, chr = 31 },
                [29] = { acc = 104, eva = 92, agi = 19, int = 20, mnd = 30, chr = 33 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 992 },  -- seven of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Seven of Coins',
            ids    = { 168, 172, 176, 180 },
            levels = {
                [25] = { acc = 91, eva = 79, agi = 22, int = 26, mnd = 26, chr = 26 },
                [26] = { acc = 94, eva = 82, agi = 22, int = 28, mnd = 28, chr = 27 },
                [27] = { acc = 98, eva = 85, agi = 22, int = 29, mnd = 29, chr = 28 },
                [28] = { acc = 101, eva = 88, agi = 24, int = 29, mnd = 29, chr = 28 },
                [29] = { acc = 104, eva = 91, agi = 24, int = 30, mnd = 30, chr = 29 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1005 },  -- seven of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Nine of Batons',
            ids    = { 185, 189, 193, 197 },
            levels = {
                [35] = { acc = 127, eva = 106, agi = 35, int = 43, mnd = 30, chr = 35 },
                [36] = { acc = 131, eva = 109, agi = 36, int = 44, mnd = 32, chr = 37 },
                [37] = { acc = 134, eva = 112, agi = 36, int = 46, mnd = 32, chr = 37 },
                [38] = { acc = 137, eva = 114, agi = 37, int = 46, mnd = 33, chr = 37 },
                [39] = { acc = 141, eva = 118, agi = 38, int = 49, mnd = 35, chr = 40 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 981 },  -- nine of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Nine of Cups',
            ids    = { 186, 190, 194, 198 },
            levels = {
                [35] = { acc = 123, eva = 103, agi = 29, int = 30, mnd = 43, chr = 39 },
                [36] = { acc = 126, eva = 106, agi = 30, int = 32, mnd = 44, chr = 41 },
                [37] = { acc = 130, eva = 109, agi = 30, int = 32, mnd = 46, chr = 41 },
                [38] = { acc = 133, eva = 112, agi = 32, int = 33, mnd = 46, chr = 41 },
                [39] = { acc = 137, eva = 115, agi = 33, int = 35, mnd = 49, chr = 43 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 968 },  -- nine of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Nine of Swords',
            ids    = { 187, 191, 195, 199 },
            levels = {
                [35] = { acc = 124, eva = 111, agi = 23, int = 24, mnd = 36, chr = 39 },
                [36] = { acc = 128, eva = 115, agi = 25, int = 27, mnd = 38, chr = 41 },
                [37] = { acc = 131, eva = 117, agi = 25, int = 27, mnd = 38, chr = 41 },
                [38] = { acc = 135, eva = 121, agi = 26, int = 27, mnd = 38, chr = 41 },
                [39] = { acc = 139, eva = 124, agi = 26, int = 28, mnd = 40, chr = 43 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 994 },  -- nine of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Nine of Coins',
            ids    = { 188, 192, 196, 200 },
            levels = {
                [35] = { acc = 125, eva = 109, agi = 29, int = 36, mnd = 36, chr = 35 },
                [36] = { acc = 129, eva = 113, agi = 30, int = 38, mnd = 38, chr = 37 },
                [37] = { acc = 132, eva = 116, agi = 30, int = 38, mnd = 38, chr = 37 },
                [38] = { acc = 135, eva = 119, agi = 32, int = 38, mnd = 38, chr = 37 },
                [39] = { acc = 140, eva = 122, agi = 33, int = 40, mnd = 40, chr = 40 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1007 },  -- nine of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Ten of Cups',
            ids    = { 205, 209 },
            levels = {
                [40] = { acc = 140, eva = 117, agi = 33, int = 35, mnd = 49, chr = 43 },
                [41] = { acc = 144, eva = 121, agi = 35, int = 37, mnd = 51, chr = 47 },
                [42] = { acc = 147, eva = 123, agi = 35, int = 37, mnd = 51, chr = 47 },
                [43] = { acc = 150, eva = 127, agi = 36, int = 38, mnd = 53, chr = 47 },
                [44] = { acc = 153, eva = 129, agi = 36, int = 39, mnd = 54, chr = 50 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 969 },  -- ten of cups card
                { rate = 50, item = 4718 },  -- scroll of regen ii
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Ten of Batons',
            ids    = { 206, 210 },
            levels = {
                [40] = { acc = 144, eva = 120, agi = 38, int = 49, mnd = 35, chr = 40 },
                [41] = { acc = 149, eva = 125, agi = 42, int = 51, mnd = 37, chr = 43 },
                [42] = { acc = 152, eva = 127, agi = 42, int = 51, mnd = 37, chr = 43 },
                [43] = { acc = 155, eva = 130, agi = 42, int = 53, mnd = 38, chr = 43 },
                [44] = { acc = 160, eva = 133, agi = 44, int = 54, mnd = 39, chr = 46 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 982 },  -- ten of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Ten of Swords',
            ids    = { 207, 211 },
            levels = {
                [40] = { acc = 142, eva = 127, agi = 27, int = 29, mnd = 40, chr = 43 },
                [41] = { acc = 146, eva = 131, agi = 29, int = 31, mnd = 44, chr = 47 },
                [42] = { acc = 149, eva = 133, agi = 29, int = 31, mnd = 44, chr = 47 },
                [43] = { acc = 152, eva = 136, agi = 29, int = 31, mnd = 44, chr = 47 },
                [44] = { acc = 156, eva = 139, agi = 29, int = 32, mnd = 47, chr = 50 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 995 },  -- ten of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Ten of Coins',
            ids    = { 208, 212 },
            levels = {
                [40] = { acc = 143, eva = 125, agi = 33, int = 40, mnd = 40, chr = 40 },
                [41] = { acc = 147, eva = 129, agi = 35, int = 44, mnd = 44, chr = 43 },
                [42] = { acc = 150, eva = 131, agi = 35, int = 44, mnd = 44, chr = 43 },
                [43] = { acc = 153, eva = 135, agi = 36, int = 44, mnd = 44, chr = 43 },
                [44] = { acc = 158, eva = 138, agi = 36, int = 47, mnd = 47, chr = 46 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1008 },  -- ten of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Balloon OHR',
            ids    = { 253, 301, 305, 351, 353, 355 },
            levels = {
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 12 },
                [9] = { acc = 38, eva = 34, agi = 14, int = 10, mnd = 10, chr = 13 },
                [10] = { acc = 41, eva = 37, agi = 15, int = 10, mnd = 11, chr = 13 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 150, item = 928 },  -- pinch of bomb ash
                { rate = 100, item = 17316 },  -- bomb arm
                { rate = 50, item = 17290 },  -- coarse boomerang
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Bomb King',
            ids    = { 254, 302, 306 },
            nm     = true,
            levels = {
                [16] = { acc = 62, eva = 57, agi = 20, int = 13, mnd = 14, chr = 18 },
                [17] = { acc = 65, eva = 59, agi = 20, int = 14, mnd = 15, chr = 18 },
                [18] = { acc = 68, eva = 62, agi = 20, int = 15, mnd = 15, chr = 19 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 928 },  -- pinch of bomb ash
                { rate = 150, item = 13506 },  -- bomb ring
                { rate = 240, item = 17316 },  -- bomb arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Doppelganger Gog',
            ids    = { 255, 303, 307 },
            nm     = true,
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 22 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 23 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 25 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 940 },  -- revival tree root
                { rate = 150, item = 16863 },  -- cruel spear
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Doppelganger Dio',
            ids    = { 256, 304, 308 },
            nm     = true,
            levels = {
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 22 },
                [24] = { acc = 88, eva = 83, agi = 28, int = 19, mnd = 19, chr = 23 },
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 25 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 940 },  -- revival tree root
                { rate = 150, item = 16773 },  -- cruel scythe
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Battue Bats',
            ids    = { 321, 322, 323, 335, 336, 339, 340 },
            levels = {
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
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
            name   = 'Goblin Thug',
            ids    = { 324, 325, 327, 328, 330, 331, 333, 337, 341, 346 },
            levels = {
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 4387 },  -- wild onion
                { rate = 10, item = 12448 },  -- bronze cap
                { rate = 10, item = 12704 },  -- bronze mittens
                { rate = 10, item = 12832 },  -- bronze subligar
                { rate = 10, item = 12960 },  -- bronze leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 326, 329, 332, 334, 338, 342, 347, 352, 354, 356 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 817 },  -- spool of grass thread
                { rate = 10, item = 824 },  -- square of grass cloth
                { rate = 10, item = 818 },  -- spool of cotton thread
                { rate = 10, item = 825 },  -- square of cotton cloth
                { rate = 10, item = 12472 },  -- circlet
                { rate = 10, item = 12728 },  -- cuffs
                { rate = 10, item = 12856 },  -- slops
                { rate = 10, item = 12984 },  -- ash clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Jack of Cups',
            ids    = { 357 },
            nm     = true,
            levels = {
                [62] = { acc = 238, eva = 206, agi = 52, int = 55, mnd = 76, chr = 70 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 970 },  -- jack of cups card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Jack of Batons',
            ids    = { 358 },
            nm     = true,
            levels = {
                [62] = { acc = 247, eva = 211, agi = 63, int = 76, mnd = 55, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 983 },  -- jack of batons card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Jack of Swords',
            ids    = { 359 },
            nm     = true,
            levels = {
                [62] = { acc = 241, eva = 220, agi = 42, int = 45, mnd = 66, chr = 70 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 996 },  -- jack of swords card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Jack of Coins',
            ids    = { 360 },
            nm     = true,
            levels = {
                [62] = { acc = 244, eva = 218, agi = 52, int = 66, mnd = 66, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1009 },  -- jack of coins card
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Queen of Swords',
            ids    = { 361 },
            nm     = true,
            levels = {
                [72] = { acc = 295, eva = 271, agi = 48, int = 51, mnd = 75, chr = 80 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 100, item = 997 },  -- queen of swords card
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 5,
        },
        {
            name   = 'Queen of Coins',
            ids    = { 362 },
            nm     = true,
            levels = {
                [72] = { acc = 297, eva = 269, agi = 60, int = 75, mnd = 75, chr = 72 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 100, item = 1010 },  -- queen of coins card
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 6,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 363 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
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
            name   = 'Custom Cardian',
            ids    = { 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378 },
            nm     = true,
            levels = {
                [1] = { acc = 10, eva = 8, agi = 8, int = 9, mnd = 8, chr = 9 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            magic_dmg = { all = -25 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 3,
        },
        {
            name   = 'Voidwrought',
            ids    = { 379, 380 },
            nm     = true,
            levels = {},
            ranks  = { fire = 4, ice = 6, wind = 4, earth = 4, water = 2, light = 4, dark = 4, paralyze = 6,
                       bind = 6, silence = 4, slow = 4, poison = 2, light_sleep = 4, dark_sleep = 4, blind = 4,
                       gravity = 4 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
    },
    by_name = {},
}
