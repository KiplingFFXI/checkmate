-- Carpenters Landing (zone 2).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Beady Beetle', 'Diving Beetle', 'Hercules Beetle', 'Stag Beetle' } },
        [2] = { sound = { 'Marsh Funguar', 'Poison Funguar' } },
        [3] = { sound = { 'Bulldog Bats', 'Specter Bat' } },
        [4] = { sight = { 'Digger Wasp', 'Spider Wasp' } },
        [5] = {
            sight = { 'Bullheaded Grosvez', 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Grunt',
                      'Orcish Neckchopper', 'Orcish Serjeant', 'Orcish Stonechucker' },
        },
        [6] = { sight = { 'Cryptonberry Assassin' } },
        [7] = { sight = { 'Cryptonberry Assassin', 'Cryptonberry Executor' } },
        [8] = {
            sight = { 'Orcish Cursemaker', 'Orcish Fighter', 'Orcish Grunt', 'Orcish Neckchopper',
                      'Orcish Serjeant', 'Orcish Stonechucker' },
        },
        [9] = { sight = { 'Beady Beetle', 'Diving Beetle', 'Stag Beetle' } },
    },
    monsters = {
        {
            name   = 'Snipper',
            ids    = { 1 },
            levels = {
                [16] = { acc = 60, eva = 54, agi = 14, int = 15, mnd = 23, chr = 23 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 15, mnd = 23, chr = 23 },
                [18] = { acc = 67, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23 },
                [19] = { acc = 70, eva = 62, agi = 15, int = 16, mnd = 25, chr = 25 },
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
            name   = 'Triangle Crab',
            ids    = { 2 },
            levels = {
                [15] = { acc = 56, eva = 50, agi = 13, int = 13, mnd = 20, chr = 20 },
                [16] = { acc = 60, eva = 54, agi = 14, int = 15, mnd = 23, chr = 23 },
                [17] = { acc = 63, eva = 56, agi = 14, int = 15, mnd = 23, chr = 23 },
                [18] = { acc = 67, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23 },
                [19] = { acc = 70, eva = 62, agi = 15, int = 16, mnd = 25, chr = 25 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 936 },  -- chunk of rock salt
                { rate = 10, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Clipper',
            ids    = { 3 },
            levels = {
                [20] = { acc = 73, eva = 65, agi = 15, int = 16, mnd = 25, chr = 25 },
                [21] = { acc = 77, eva = 70, agi = 18, int = 19, mnd = 28, chr = 28 },
                [22] = { acc = 80, eva = 72, agi = 18, int = 19, mnd = 28, chr = 28 },
                [23] = { acc = 83, eva = 75, agi = 18, int = 19, mnd = 28, chr = 28 },
                [24] = { acc = 87, eva = 78, agi = 18, int = 20, mnd = 30, chr = 30 },
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
            name   = 'Greater Pugil',
            ids    = { 4 },
            levels = {
                [29] = { acc = 107, eva = 101, agi = 37, int = 25, mnd = 25, chr = 27 },
                [30] = { acc = 110, eva = 104, agi = 37, int = 26, mnd = 26, chr = 27 },
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 30 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fishtrap',
            ids    = { 5 },
            levels = {
                [26] = { acc = 97, eva = 91, agi = 32, int = 23, mnd = 23, chr = 26 },
                [27] = { acc = 100, eva = 93, agi = 33, int = 24, mnd = 24, chr = 27 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 100, item = 1727 },  -- piece of garhada teak lumber
                { rate = 10, item = 1617 },  -- flytrap leaf
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Beady Beetle',
            ids    = { 6, 7, 26, 27, 28, 29, 35, 43, 44, 45, 46, 47, 48 },
            levels = {
                [15] = { acc = 57, eva = 50, agi = 13, int = 13, mnd = 20, chr = 20 },
                [16] = { acc = 61, eva = 54, agi = 14, int = 14, mnd = 22, chr = 22 },
                [17] = { acc = 64, eva = 56, agi = 14, int = 14, mnd = 22, chr = 22 },
                [18] = { acc = 68, eva = 59, agi = 15, int = 15, mnd = 23, chr = 23 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 1,
        },
        {
            name   = 'Poison Funguar',
            ids    = { 8, 9, 10, 11, 12, 41, 42 },
            levels = {
                [16] = { acc = 62, eva = 58, agi = 23, int = 14, mnd = 15, chr = 18 },
                [17] = { acc = 65, eva = 60, agi = 23, int = 16, mnd = 17, chr = 18 },
                [18] = { acc = 68, eva = 63, agi = 23, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 67, agi = 25, int = 17, mnd = 18, chr = 21 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4374 },  -- sleepshroom
                { rate = 50, item = 4373 },  -- woozyshroom
            },
            links  = 2,
        },
        {
            name   = 'Specter Bat',
            ids    = { 13, 14 },
            levels = {
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 18 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 18 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 21 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 21 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Bulldog Bats',
            ids    = { 15, 16 },
            levels = {
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 18 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 18 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 21 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 21 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 150, item = 891 },  -- bat fang
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Digger Wasp',
            ids    = { 17, 18, 19, 20, 21, 22, 23 },
            levels = {
                [14] = { acc = 55, eva = 52, agi = 22, int = 14, mnd = 14, chr = 16 },
                [15] = { acc = 58, eva = 55, agi = 22, int = 14, mnd = 14, chr = 17 },
                [16] = { acc = 62, eva = 59, agi = 25, int = 15, mnd = 15, chr = 18 },
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 18 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 4,
        },
        {
            name   = 'Glide Bomb',
            ids    = { 24 },
            levels = {
                [20] = { acc = 76, eva = 70, agi = 25, int = 17, mnd = 18, chr = 23 },
                [21] = { acc = 81, eva = 75, agi = 28, int = 19, mnd = 20, chr = 25 },
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
            name   = 'Thunder Elemental',
            ids    = { 25, 90, 107, 188, 198, 269 },
            levels = {
                [24] = { acc = 89, eva = 80, agi = 28, int = 33, mnd = 26, chr = 27 },
                [25] = { acc = 92, eva = 82, agi = 29, int = 34, mnd = 27, chr = 27 },
                [26] = { acc = 96, eva = 86, agi = 30, int = 35, mnd = 28, chr = 27 },
                [29] = { acc = 106, eva = 95, agi = 32, int = 38, mnd = 30, chr = 30 },
                [30] = { acc = 110, eva = 98, agi = 33, int = 39, mnd = 31, chr = 32 },
                [31] = { acc = 113, eva = 102, agi = 35, int = 41, mnd = 33, chr = 32 },
                [36] = { acc = 131, eva = 117, agi = 39, int = 46, mnd = 37, chr = 37 },
                [37] = { acc = 134, eva = 120, agi = 39, int = 47, mnd = 37, chr = 37 },
                [38] = { acc = 137, eva = 123, agi = 40, int = 47, mnd = 38, chr = 37 },
            },
            spawn_levels = { [25] = { 24, 26 }, [90] = { 29, 31 }, [107] = { 29, 31 }, [188] = { 29, 31 },
                             [198] = { 29, 31 }, [269] = { 36, 38 } },
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
            name   = 'Flytrap',
            ids    = { 30, 31, 36, 37 },
            levels = {
                [18] = { acc = 68, eva = 63, agi = 23, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 67, agi = 25, int = 18, mnd = 18, chr = 21 },
                [20] = { acc = 75, eva = 70, agi = 25, int = 18, mnd = 18, chr = 21 },
                [21] = { acc = 80, eva = 75, agi = 28, int = 20, mnd = 20, chr = 23 },
                [22] = { acc = 83, eva = 77, agi = 28, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Orcish Grunt',
            ids    = { 32, 38, 49 },
            levels = {
                [16] = { acc = 62, eva = 58, agi = 21, int = 12, mnd = 16, chr = 23 },
                [17] = { acc = 66, eva = 61, agi = 21, int = 15, mnd = 17, chr = 23 },
                [18] = { acc = 69, eva = 64, agi = 21, int = 15, mnd = 19, chr = 24 },
                [19] = { acc = 73, eva = 68, agi = 23, int = 15, mnd = 19, chr = 26 },
                [20] = { acc = 76, eva = 71, agi = 23, int = 15, mnd = 19, chr = 26 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Stonechucker',
            ids    = { 33, 39, 50 },
            levels = {
                [16] = { acc = 72, eva = 59, agi = 25, int = 14, mnd = 17, chr = 20, resist = { virus = 10 } },
                [17] = { acc = 76, eva = 62, agi = 26, int = 16, mnd = 18, chr = 20, resist = { virus = 10 } },
                [18] = { acc = 79, eva = 65, agi = 26, int = 17, mnd = 19, chr = 22, resist = { virus = 10 } },
                [19] = { acc = 83, eva = 69, agi = 28, int = 17, mnd = 20, chr = 23, resist = { virus = 10 } },
                [20] = { acc = 86, eva = 72, agi = 28, int = 17, mnd = 20, chr = 23,
                         resist = { poison = 10, virus = 10 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Neckchopper',
            ids    = { 34, 40, 51 },
            levels = {
                [16] = { acc = 63, eva = 57, agi = 21, int = 17, mnd = 14, chr = 18, resist = { virus = 10 } },
                [17] = { acc = 67, eva = 59, agi = 21, int = 19, mnd = 15, chr = 18, resist = { virus = 10 } },
                [18] = { acc = 70, eva = 62, agi = 21, int = 19, mnd = 16, chr = 19, resist = { virus = 10 } },
                [19] = { acc = 74, eva = 66, agi = 23, int = 20, mnd = 16, chr = 20, resist = { virus = 10 } },
                [20] = { acc = 77, eva = 69, agi = 23, int = 20, mnd = 16, chr = 20,
                         resist = { paralyze = 10, virus = 10 } },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Land Pugil',
            ids    = { 52, 54, 56, 57 },
            levels = {
                [17] = { acc = 65, eva = 61, agi = 25, int = 17, mnd = 17, chr = 17 },
                [18] = { acc = 68, eva = 64, agi = 25, int = 17, mnd = 17, chr = 20 },
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Water Elemental',
            ids    = { 53, 55, 113, 115, 117, 191, 224, 275, 277, 279 },
            levels = {
                [24] = { acc = 89, eva = 80, agi = 28, int = 33, mnd = 26, chr = 27 },
                [25] = { acc = 92, eva = 82, agi = 29, int = 34, mnd = 27, chr = 27 },
                [26] = { acc = 96, eva = 86, agi = 30, int = 35, mnd = 28, chr = 27 },
                [29] = { acc = 106, eva = 95, agi = 32, int = 38, mnd = 30, chr = 30 },
                [30] = { acc = 110, eva = 98, agi = 33, int = 39, mnd = 31, chr = 32 },
                [31] = { acc = 113, eva = 102, agi = 35, int = 41, mnd = 33, chr = 32 },
                [36] = { acc = 131, eva = 117, agi = 39, int = 46, mnd = 37, chr = 37 },
                [37] = { acc = 134, eva = 120, agi = 39, int = 47, mnd = 37, chr = 37 },
                [38] = { acc = 137, eva = 123, agi = 40, int = 47, mnd = 38, chr = 37 },
            },
            spawn_levels = { [53] = { 24, 26 }, [55] = { 24, 26 }, [113] = { 29, 31 }, [115] = { 29, 31 },
                             [117] = { 29, 31 }, [191] = { 29, 31 }, [224] = { 29, 31 }, [275] = { 36, 38 },
                             [277] = { 36, 38 }, [279] = { 36, 38 } },
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
            name   = 'Stag Beetle',
            ids    = { 58, 59, 67, 75, 76, 77, 82, 85, 93, 94, 104, 108, 118, 119, 120, 123, 124, 125, 126, 130,
                       133, 134, 135, 141, 150, 151, 155, 157, 158, 160, 163, 169, 170, 171, 177, 181, 192, 193,
                       194, 199, 200, 201, 202, 215, 218 },
            levels = {
                [20] = { acc = 74, eva = 65, agi = 15, int = 15, mnd = 24, chr = 24 },
                [21] = { acc = 78, eva = 70, agi = 18, int = 18, mnd = 27, chr = 27 },
                [22] = { acc = 81, eva = 72, agi = 18, int = 18, mnd = 27, chr = 27 },
                [23] = { acc = 84, eva = 75, agi = 18, int = 18, mnd = 27, chr = 27 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 50, item = 894 },  -- beetle jaw
            },
            links  = 1,
        },
        {
            name   = 'Battrap',
            ids    = { 60, 61, 62, 63, 69, 70, 78, 79, 83, 84, 87, 88, 97, 98, 109, 110, 195, 196, 197, 205, 206,
                       207, 208, 209, 210, 211, 216, 217 },
            levels = {
                [23] = { acc = 86, eva = 80, agi = 28, int = 20, mnd = 20, chr = 23 },
                [24] = { acc = 90, eva = 84, agi = 30, int = 21, mnd = 21, chr = 24 },
                [25] = { acc = 93, eva = 87, agi = 30, int = 23, mnd = 23, chr = 26 },
                [26] = { acc = 97, eva = 91, agi = 32, int = 23, mnd = 23, chr = 26 },
                [27] = { acc = 100, eva = 93, agi = 33, int = 24, mnd = 24, chr = 27 },
            },
            spawn_levels = { [63] = { 23, 26 }, [69] = { 24, 27 }, [83] = { 23, 26 }, [84] = { 23, 26 },
                             [97] = { 23, 26 }, [98] = { 24, 27 }, [109] = { 24, 27 }, [110] = { 23, 25 },
                             [195] = { 24, 27 }, [197] = { 24, 26 }, [205] = { 24, 27 }, [206] = { 25, 26 },
                             [207] = { 25, 26 }, [209] = { 23, 26 }, [210] = { 24, 27 }, [211] = { 23, 26 },
                             [216] = { 24, 26 }, [217] = { 24, 27 } },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Orcish Fighter',
            ids    = { 64, 71, 80, 99 },
            levels = {
                [21] = { acc = 81, eva = 75, agi = 28, int = 17, mnd = 19, chr = 25 },
                [22] = { acc = 84, eva = 77, agi = 28, int = 17, mnd = 19, chr = 25 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 17, mnd = 19, chr = 25 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 17, mnd = 19, chr = 26 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 20, mnd = 22, chr = 28 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Cursemaker',
            ids    = { 65, 72, 100 },
            levels = {
                [21] = { acc = 81, eva = 75, agi = 28, int = 25, mnd = 21, chr = 26 },
                [22] = { acc = 84, eva = 77, agi = 28, int = 25, mnd = 21, chr = 26 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 26, mnd = 21, chr = 26 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 26, mnd = 21, chr = 28 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 29, mnd = 24, chr = 29 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Orcish Serjeant',
            ids    = { 66, 73, 81 },
            levels = {
                [21] = { acc = 80, eva = 72, agi = 22, int = 16, mnd = 24, chr = 28 },
                [22] = { acc = 83, eva = 74, agi = 22, int = 16, mnd = 24, chr = 28 },
                [23] = { acc = 86, eva = 77, agi = 22, int = 16, mnd = 24, chr = 28 },
                [24] = { acc = 89, eva = 80, agi = 23, int = 16, mnd = 25, chr = 30 },
                [25] = { acc = 93, eva = 83, agi = 23, int = 18, mnd = 27, chr = 31 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 10, virus = 10 },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Ghoul blm',
            ids    = { 68, 86, 95, 186, 203 },
            levels = {
                [21] = { acc = 81, eva = 68, agi = 28, int = 32, mnd = 22, chr = 25 },
                [22] = { acc = 84, eva = 70, agi = 28, int = 32, mnd = 22, chr = 25 },
                [23] = { acc = 87, eva = 73, agi = 28, int = 34, mnd = 22, chr = 25 },
                [24] = { acc = 91, eva = 76, agi = 30, int = 35, mnd = 22, chr = 27 },
                [25] = { acc = 94, eva = 79, agi = 30, int = 36, mnd = 25, chr = 27 },
                [26] = { acc = 98, eva = 82, agi = 32, int = 36, mnd = 25, chr = 27 },
                [27] = { acc = 101, eva = 85, agi = 33, int = 39, mnd = 25, chr = 30 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ghoul war',
            ids    = { 74, 89, 101, 187, 212 },
            levels = {
                [21] = { acc = 81, eva = 75, agi = 28, int = 20, mnd = 19, chr = 23 },
                [22] = { acc = 84, eva = 77, agi = 28, int = 20, mnd = 19, chr = 23 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 20, mnd = 19, chr = 23 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 21, mnd = 19, chr = 24 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 23, mnd = 22, chr = 26 },
                [26] = { acc = 98, eva = 91, agi = 32, int = 23, mnd = 22, chr = 26 },
                [27] = { acc = 101, eva = 93, agi = 33, int = 24, mnd = 22, chr = 27 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Marsh Funguar',
            ids    = { 91, 92, 105, 106, 127, 132, 136, 137, 138, 139, 140, 142, 143, 144, 145, 146, 156, 161, 162,
                       164, 165, 166, 167, 168, 172, 173, 174, 175, 176, 219, 220, 221 },
            levels = {
                [21] = { acc = 80, eva = 75, agi = 28, int = 19, mnd = 20, chr = 23 },
                [22] = { acc = 83, eva = 77, agi = 28, int = 19, mnd = 20, chr = 23 },
                [23] = { acc = 86, eva = 80, agi = 28, int = 19, mnd = 20, chr = 23 },
                [24] = { acc = 90, eva = 84, agi = 30, int = 19, mnd = 21, chr = 24 },
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
            links  = 2,
        },
        {
            name   = 'Will-o-the-Wisp',
            ids    = { 96, 204 },
            levels = {
                [25] = { acc = 94, eva = 87, agi = 30, int = 22, mnd = 23, chr = 28 },
                [26] = { acc = 98, eva = 91, agi = 32, int = 22, mnd = 23, chr = 29 },
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
            name   = 'Forest Tiger',
            ids    = { 102, 103, 178, 179, 180, 182, 183, 184, 213, 214 },
            levels = {
                [22] = { acc = 84, eva = 77, agi = 28, int = 17, mnd = 20, chr = 23 },
                [23] = { acc = 87, eva = 80, agi = 28, int = 17, mnd = 20, chr = 23 },
                [24] = { acc = 91, eva = 84, agi = 30, int = 17, mnd = 21, chr = 24 },
                [25] = { acc = 94, eva = 87, agi = 30, int = 20, mnd = 23, chr = 26 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 150, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Fosse Pugil',
            ids    = { 111, 112, 114, 116, 189, 190, 222, 223 },
            levels = {
                [22] = { acc = 83, eva = 78, agi = 30, int = 20, mnd = 20, chr = 22 },
                [23] = { acc = 86, eva = 81, agi = 30, int = 20, mnd = 20, chr = 22 },
                [24] = { acc = 90, eva = 85, agi = 32, int = 21, mnd = 21, chr = 22 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
        },
        {
            name   = 'Spider Wasp',
            ids    = { 121, 122, 128, 129, 131, 147, 148, 149, 152, 153, 154, 159 },
            levels = {
                [19] = { acc = 72, eva = 68, agi = 27, int = 18, mnd = 18, chr = 21 },
                [20] = { acc = 75, eva = 71, agi = 27, int = 18, mnd = 18, chr = 21 },
                [21] = { acc = 80, eva = 76, agi = 30, int = 20, mnd = 20, chr = 23 },
                [22] = { acc = 83, eva = 78, agi = 30, int = 20, mnd = 20, chr = 23 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 4,
        },
        {
            name   = 'Diving Beetle',
            ids    = { 225, 226, 232, 237, 238, 239, 253, 254, 260, 261, 262, 270, 280, 281, 282, 283, 285, 286,
                       290, 291, 292, 293, 294, 295 },
            levels = {
                [27] = { acc = 98, eva = 87, agi = 20, int = 20, mnd = 31, chr = 31 },
                [28] = { acc = 102, eva = 90, agi = 21, int = 21, mnd = 32, chr = 32 },
                [29] = { acc = 105, eva = 93, agi = 21, int = 21, mnd = 33, chr = 33 },
                [30] = { acc = 108, eva = 96, agi = 21, int = 21, mnd = 33, chr = 33 },
            },
            spawn_levels = { [285] = { 28, 29 } },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 50, item = 894 },  -- beetle jaw
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 1,
        },
        {
            name   = 'Birdtrap',
            ids    = { 227, 228, 229, 230, 233, 234, 235, 242, 243, 244, 245, 246, 255, 256, 257, 258, 263, 264,
                       265, 267, 271, 272 },
            levels = {
                [29] = { acc = 107, eva = 100, agi = 34, int = 25, mnd = 25, chr = 28 },
                [30] = { acc = 110, eva = 103, agi = 35, int = 26, mnd = 26, chr = 29 },
                [31] = { acc = 114, eva = 107, agi = 37, int = 26, mnd = 26, chr = 31 },
                [32] = { acc = 117, eva = 109, agi = 37, int = 26, mnd = 26, chr = 31 },
                [33] = { acc = 121, eva = 113, agi = 38, int = 29, mnd = 29, chr = 32 },
            },
            ph_for = { [267] = { 268 } },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Sabertooth Tiger',
            ids    = { 231, 236, 248, 249, 259, 266 },
            levels = {
                [29] = { acc = 108, eva = 100, agi = 34, int = 22, mnd = 25, chr = 28 },
                [30] = { acc = 111, eva = 103, agi = 35, int = 22, mnd = 26, chr = 29 },
                [31] = { acc = 116, eva = 107, agi = 37, int = 22, mnd = 26, chr = 31 },
                [32] = { acc = 119, eva = 109, agi = 37, int = 22, mnd = 26, chr = 31 },
            },
            ranks  = { fire = -3, thunder = -3, water = -2, poison = -2, stun = -3 },
            drops  = {
                { rate = 240, item = 884 },  -- black tiger fang
                { rate = 100, item = 861 },  -- black tiger hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Wight blm',
            ids    = { 240 },
            levels = {
                [29] = { acc = 108, eva = 91, agi = 34, int = 40, mnd = 27, chr = 30 },
                [30] = { acc = 111, eva = 93, agi = 35, int = 41, mnd = 27, chr = 32 },
                [31] = { acc = 116, eva = 97, agi = 37, int = 43, mnd = 30, chr = 32 },
                [32] = { acc = 119, eva = 99, agi = 37, int = 43, mnd = 30, chr = 32 },
                [33] = { acc = 122, eva = 103, agi = 38, int = 45, mnd = 30, chr = 35 },
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
            name   = 'Spunkie CL',
            ids    = { 241 },
            levels = {
                [32] = { acc = 119, eva = 109, agi = 37, int = 25, mnd = 26, chr = 34 },
                [33] = { acc = 122, eva = 113, agi = 38, int = 27, mnd = 29, chr = 34 },
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
            name   = 'Wendigo war',
            ids    = { 247 },
            levels = {
                [28] = { acc = 104, eva = 96, agi = 33, int = 24, mnd = 23, chr = 28 },
                [29] = { acc = 108, eva = 100, agi = 34, int = 25, mnd = 24, chr = 28 },
                [30] = { acc = 111, eva = 103, agi = 35, int = 26, mnd = 24, chr = 29 },
                [31] = { acc = 116, eva = 107, agi = 37, int = 26, mnd = 25, chr = 31 },
                [32] = { acc = 119, eva = 109, agi = 37, int = 26, mnd = 25, chr = 31 },
                [33] = { acc = 122, eva = 113, agi = 38, int = 29, mnd = 27, chr = 32 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Shrieker',
            ids    = { 250, 251, 252, 284, 287, 288, 289, 296, 297, 298, 299, 300 },
            levels = {
                [28] = { acc = 103, eva = 96, agi = 33, int = 23, mnd = 24, chr = 28 },
                [29] = { acc = 107, eva = 100, agi = 34, int = 24, mnd = 25, chr = 28 },
                [30] = { acc = 110, eva = 103, agi = 35, int = 24, mnd = 26, chr = 29 },
                [31] = { acc = 114, eva = 107, agi = 37, int = 25, mnd = 26, chr = 31 },
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
        },
        {
            name   = 'Orctrap',
            ids    = { 268 },
            nm     = true,
            levels = {
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 150, item = 1617 },  -- flytrap leaf
                { rate = 100, item = 17792 },  -- nikkariaoe
                { rate = 50, item = 15291 },  -- hojutsu belt
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Spinous Pugil',
            ids    = { 273, 274, 276, 278 },
            levels = {
                [29] = { acc = 107, eva = 101, agi = 37, int = 25, mnd = 25, chr = 27 },
                [30] = { acc = 110, eva = 104, agi = 37, int = 26, mnd = 26, chr = 27 },
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 30 },
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
            name   = 'Overgrown Ivy',
            ids    = { 301 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 41, mnd = 38, chr = 45 },
                [51] = { acc = 189, eva = 174, agi = 56, int = 41, mnd = 39, chr = 47 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cryptonberry Executor',
            ids    = { 302 },
            nm     = true,
            levels = {
                [68] = { acc = 281, eva = 285, agi = 85, int = 62, mnd = 45, chr = 53 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            resist = { bind = 20 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Cryptonberry Assassin',
            ids    = { 303 },
            nm     = true,
            levels = {
                [65] = { acc = 269, eva = 303, agi = 80, int = 65, mnd = 43, chr = 46 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            resist = { gravity = 15 },
            immune = { 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Cryptonberry Assassin',
            ids    = { 304 },
            nm     = true,
            levels = {
                [65] = { acc = 263, eva = 230, agi = 75, int = 77, mnd = 55, chr = 62 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            immune = { 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Cryptonberry Assassin',
            ids    = { 305 },
            nm     = true,
            levels = {
                [65] = { acc = 258, eva = 227, agi = 69, int = 70, mnd = 70, chr = 73 },
            },
            ranks  = { fire = -1, ice = -3, wind = -1, thunder = -2, water = 1, light = 4, paralyze = -3, bind = -3,
                       silence = -1, poison = 1, light_sleep = 4, stun = -2, gravity = -1 },
            meva   = { sleep = 90 },
            resist = { slow = 20 },
            immune = { 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Tonberrys Elemental',
            ids    = { 306 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60 },
                [63] = { acc = 249, eva = 228, agi = 62, int = 74, mnd = 59, chr = 60 },
                [64] = { acc = 255, eva = 233, agi = 64, int = 75, mnd = 60, chr = 62 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Tonberrys Avatar',
            ids    = { 307 },
            levels = {
                [60] = { acc = 234, eva = 202, agi = 63, int = 74, mnd = 53, chr = 57 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Para',
            ids    = { 308, 309, 310, 311, 312 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 38, mnd = 41, chr = 45 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 39, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            magic_dmg = { all = -40 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bullheaded Grosvez',
            ids    = { 313 },
            levels = {
                [45] = { acc = 166, eva = 150, agi = 37, int = 28, mnd = 43, chr = 45 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Mycophile',
            ids    = { 314 },
            nm     = true,
            levels = {
                [35] = { acc = 127, eva = 118, agi = 36, int = 35, mnd = 27, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            immune = { 'silence' },
            drops  = {
                { rate = 150, item = 14884 },  -- mycophile cuffs
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Hercules Beetle',
            ids    = { 315 },
            nm     = true,
            levels = {
                [34] = { acc = 126, eva = 113, agi = 33, int = 37, mnd = 24, chr = 24 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 894 },  -- beetle jaw
                { rate = 100, item = 15422 },  -- black hose
                { rate = 240, item = 846 },  -- insect wing
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Orcfeltrap',
            ids    = { 316, 317, 318 },
            nm     = true,
            levels = {},
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
        },
    },
    by_name = {},
}
