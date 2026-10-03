-- Inner Horutoto Ruins (zone 192).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Battle Bat', 'Battue Bats', 'Blade Bat' },
        [2] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver', 'Slendlix Spindlethumb' },
        [3] = { 'Beady Beetle' },
        [4] = { 'Goblin Ambusher', 'Goblin Butcher', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger',
                'Goblin Thug', 'Goblin Tinkerer', 'Goblin Weaver' },
    },
    monsters = {
        {
            name   = 'Battue Bats',
            ids    = { 1, 2, 3, 4, 10, 11, 16, 17, 33, 34, 40, 41, 44, 45, 46, 47, 57, 58, 155, 156 },
            levels = {
                [1] = { acc = 10, eva = 10, agi = 10, int = 6, mnd = 6, chr = 7 },
                [2] = { acc = 13, eva = 12, agi = 10, int = 6, mnd = 6, chr = 7 },
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
            },
            spawn_levels = { [1] = { 1, 3 }, [2] = { 1, 3 }, [3] = { 1, 3 }, [4] = { 1, 3 }, [10] = { 1, 3 },
                             [11] = { 1, 3 }, [16] = { 1, 3 }, [17] = { 1, 3 }, [155] = { 1, 3 },
                             [156] = { 1, 3 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Goblin Thug',
            ids    = { 5, 6, 7, 9, 12, 14, 15, 20, 25, 27, 29, 31, 37, 38, 42, 52, 53, 59, 61, 62, 68, 71 },
            levels = {
                [1] = { acc = 11, eva = 11, agi = 10, int = 9, mnd = 6, chr = 6 },
                [2] = { acc = 14, eva = 14, agi = 10, int = 9, mnd = 6, chr = 6 },
                [3] = { acc = 18, eva = 17, agi = 10, int = 9, mnd = 6, chr = 6 },
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
            },
            spawn_levels = { [5] = { 1, 3 }, [6] = { 1, 3 }, [7] = { 1, 3 }, [9] = { 1, 3 }, [12] = { 1, 3 },
                             [14] = { 1, 3 }, [15] = { 1, 3 }, [20] = { 3, 6 }, [25] = { 3, 4 }, [27] = { 3, 4 },
                             [29] = { 3, 4 }, [31] = { 3, 4 } },
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
            links  = 2,
        },
        {
            name   = 'Goblin Weaver',
            ids    = { 8, 13, 21, 24, 26, 28, 30, 39, 43, 60, 63, 69, 70, 72 },
            levels = {
                [1] = { acc = 10, eva = 8, agi = 8, int = 9, mnd = 9, chr = 7 },
                [2] = { acc = 13, eva = 10, agi = 8, int = 9, mnd = 9, chr = 7 },
                [3] = { acc = 16, eva = 13, agi = 8, int = 9, mnd = 9, chr = 7 },
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [21] = { 3, 6 }, [24] = { 3, 6 }, [26] = { 3, 4 }, [28] = { 3, 4 }, [30] = { 3, 4 } },
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
            links  = 2,
        },
        {
            name   = 'Blade Bat',
            ids    = { 18, 19, 32, 35, 36, 48, 49, 50, 51, 73 },
            levels = {
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
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
            name   = 'Magicked Bones club',
            ids    = { 22, 54, 55, 56, 64, 65, 66, 67 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 6, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 16753 },  -- ceremonial dagger
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Magicked Bones dagger',
            ids    = { 23 },
            levels = {
                [3] = { acc = 17, eva = 14, agi = 9, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 21, eva = 18, agi = 11, int = 7, mnd = 6, chr = 8 },
                [5] = { acc = 24, eva = 21, agi = 11, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 28, eva = 25, agi = 12, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 31, eva = 27, agi = 13, int = 9, mnd = 8, chr = 10 },
                [8] = { acc = 34, eva = 30, agi = 13, int = 9, mnd = 9, chr = 11 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 16753 },  -- ceremonial dagger
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Beady Beetle',
            ids    = { 74, 75, 76, 80, 81, 86, 87, 88, 98 },
            levels = {
                [11] = { acc = 43, eva = 38, agi = 11, int = 11, mnd = 16, chr = 16 },
                [12] = { acc = 46, eva = 40, agi = 11, int = 11, mnd = 16, chr = 16 },
                [13] = { acc = 49, eva = 43, agi = 11, int = 11, mnd = 16, chr = 16 },
                [14] = { acc = 53, eva = 46, agi = 11, int = 11, mnd = 17, chr = 17 },
                [15] = { acc = 56, eva = 50, agi = 12, int = 12, mnd = 18, chr = 18 },
                [16] = { acc = 60, eva = 53, agi = 13, int = 13, mnd = 19, chr = 19 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
                { rate = 50, item = 894 },  -- beetle jaw
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Battue Bats',
            ids    = { 77, 78, 79, 82, 83, 84, 85, 89, 90, 93 },
            levels = {
                [12] = { acc = 47, eva = 44, agi = 18, int = 11, mnd = 11, chr = 13 },
                [13] = { acc = 50, eva = 47, agi = 18, int = 13, mnd = 13, chr = 14 },
                [14] = { acc = 54, eva = 51, agi = 20, int = 13, mnd = 13, chr = 14 },
                [15] = { acc = 57, eva = 54, agi = 20, int = 13, mnd = 13, chr = 15 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 50, item = 1029 },  -- horutoto chest key
            },
            links  = 1,
        },
        {
            name   = 'Goblin Ambusher',
            ids    = { 91, 94 },
            levels = {
                [20] = { acc = 84, eva = 64, agi = 27, int = 18, mnd = 19, chr = 18 },
                [21] = { acc = 88, eva = 68, agi = 29, int = 20, mnd = 22, chr = 20 },
                [22] = { acc = 91, eva = 70, agi = 29, int = 20, mnd = 22, chr = 20 },
                [23] = { acc = 94, eva = 74, agi = 30, int = 20, mnd = 22, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 10 },
            drops  = {
                { rate = 150, item = 937 },  -- block of animal glue
                { rate = 10, item = 12440 },  -- leather bandana
                { rate = 10, item = 12696 },  -- leather gloves
                { rate = 10, item = 12824 },  -- leather trousers
                { rate = 10, item = 12952 },  -- leather highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Tinkerer',
            ids    = { 92, 97 },
            levels = {
                [20] = { acc = 75, eva = 68, agi = 21, int = 22, mnd = 15, chr = 15 },
                [21] = { acc = 79, eva = 73, agi = 24, int = 24, mnd = 17, chr = 17 },
                [22] = { acc = 82, eva = 75, agi = 24, int = 24, mnd = 17, chr = 17 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 24, mnd = 17, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 10 },
            drops  = {
                { rate = 10, item = 12432 },  -- faceguard
                { rate = 10, item = 12688 },  -- scale finger gauntlets
                { rate = 10, item = 12816 },  -- scale cuisses
                { rate = 10, item = 12944 },  -- scale greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Butcher',
            ids    = { 95, 96 },
            levels = {
                [20] = { acc = 75, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18 },
                [21] = { acc = 79, eva = 74, agi = 26, int = 18, mnd = 18, chr = 20 },
                [22] = { acc = 82, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 85, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 10 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
                { rate = 10, item = 656 },  -- beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Blob',
            ids    = { 99, 100 },
            levels = {
                [15] = { acc = 57, eva = 53, agi = 18, int = 13, mnd = 15, chr = 15 },
                [16] = { acc = 61, eva = 56, agi = 19, int = 14, mnd = 16, chr = 16 },
                [17] = { acc = 64, eva = 58, agi = 19, int = 15, mnd = 17, chr = 16 },
                [18] = { acc = 67, eva = 62, agi = 20, int = 15, mnd = 17, chr = 17 },
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
            name   = 'Maltha',
            ids    = { 101 },
            nm     = true,
            levels = {
                [22] = { acc = 81, eva = 73, agi = 21, int = 24, mnd = 19, chr = 17 },
                [23] = { acc = 84, eva = 76, agi = 21, int = 24, mnd = 19, chr = 17 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 240, item = 14464 },  -- trailers tunica
                { rate = 240, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Balloon',
            ids    = { 102, 103 },
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
                { rate = 50, item = 12796 },  -- asbestos mitts
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 104, 109, 114, 117, 122, 125, 128, 131, 134 },
            levels = {
                [20] = { acc = 77, eva = 86, agi = 26, int = 22, mnd = 15, chr = 15 },
                [21] = { acc = 81, eva = 90, agi = 28, int = 24, mnd = 17, chr = 17 },
                [22] = { acc = 84, eva = 93, agi = 28, int = 24, mnd = 17, chr = 17 },
                [23] = { acc = 87, eva = 96, agi = 28, int = 24, mnd = 17, chr = 17 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 10 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 10, item = 12449 },  -- brass cap
                { rate = 10, item = 12705 },  -- brass mittens
                { rate = 10, item = 12833 },  -- brass subligar
                { rate = 10, item = 12961 },  -- brass leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 105, 110, 115, 118, 123, 126, 129, 132, 135 },
            levels = {
                [20] = { acc = 72, eva = 61, agi = 20, int = 18, mnd = 25, chr = 22 },
                [21] = { acc = 76, eva = 65, agi = 22, int = 20, mnd = 27, chr = 24 },
                [22] = { acc = 79, eva = 67, agi = 22, int = 20, mnd = 27, chr = 24 },
                [23] = { acc = 82, eva = 70, agi = 22, int = 20, mnd = 28, chr = 24 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
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
            links  = 2,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 106, 111, 116, 119, 124, 127, 130, 133, 136 },
            levels = {
                [20] = { acc = 75, eva = 63, agi = 24, int = 25, mnd = 18, chr = 19 },
                [21] = { acc = 79, eva = 67, agi = 26, int = 27, mnd = 20, chr = 22 },
                [22] = { acc = 82, eva = 69, agi = 26, int = 27, mnd = 20, chr = 22 },
                [23] = { acc = 85, eva = 72, agi = 26, int = 28, mnd = 20, chr = 22 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 10, item = 1029 },  -- horutoto chest key
                { rate = 50, item = 952 },  -- bag of poison flour
                { rate = 5, item = 12473 },  -- poets circlet
                { rate = 5, item = 12729 },  -- linen cuffs
                { rate = 5, item = 12857 },  -- linen slops
                { rate = 5, item = 12985 },  -- holly clogs
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Battle Bat',
            ids    = { 107, 108, 112, 113, 120, 121, 138, 139, 140, 164, 165, 169, 170, 174, 175, 179, 180 },
            levels = {
                [17] = { acc = 64, eva = 60, agi = 22, int = 15, mnd = 15, chr = 16 },
                [18] = { acc = 67, eva = 63, agi = 22, int = 15, mnd = 15, chr = 17 },
                [19] = { acc = 71, eva = 67, agi = 24, int = 16, mnd = 16, chr = 18 },
                [20] = { acc = 74, eva = 70, agi = 24, int = 16, mnd = 16, chr = 18 },
            },
            spawn_levels = { [180] = { 19, 20 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 50, item = 1029 },  -- horutoto chest key
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Slendlix Spindlethumb',
            ids    = { 137 },
            nm     = true,
            levels = {
                [33] = { acc = 117, eva = 99, agi = 31, int = 29, mnd = 41, chr = 34 },
                [34] = { acc = 120, eva = 102, agi = 32, int = 29, mnd = 42, chr = 36 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 11494 },  -- circes hat
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Will-o-the-Wisp',
            ids    = { 141, 144, 154, 157, 158 },
            levels = {
                [23] = { acc = 85, eva = 78, agi = 24, int = 17, mnd = 18, chr = 22 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 17, mnd = 19, chr = 23 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 19, mnd = 20, chr = 25 },
            },
            spawn_levels = { [141] = { 24, 25 } },
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
            name   = 'Boggart',
            ids    = { 142, 143, 145, 146, 147, 148, 149, 150, 151, 152, 159, 160 },
            levels = {
                [22] = { acc = 82, eva = 75, agi = 24, int = 23, mnd = 18, chr = 23 },
                [23] = { acc = 85, eva = 78, agi = 24, int = 24, mnd = 18, chr = 23 },
                [24] = { acc = 89, eva = 82, agi = 26, int = 24, mnd = 19, chr = 24 },
                [25] = { acc = 92, eva = 85, agi = 26, int = 26, mnd = 20, chr = 26 },
                [26] = { acc = 96, eva = 89, agi = 28, int = 26, mnd = 20, chr = 27 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 4716 },  -- scroll of regen
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Wendigo war',
            ids    = { 161, 162, 166, 167, 171, 176, 181, 182, 185, 187, 188 },
            levels = {
                [25] = { acc = 92, eva = 85, agi = 26, int = 20, mnd = 19, chr = 23 },
                [26] = { acc = 96, eva = 89, agi = 28, int = 20, mnd = 19, chr = 23 },
                [27] = { acc = 99, eva = 91, agi = 29, int = 21, mnd = 19, chr = 24 },
                [28] = { acc = 102, eva = 94, agi = 29, int = 21, mnd = 20, chr = 25 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 16447 },  -- rusty dagger
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Wendigo blm',
            ids    = { 163, 168, 172, 173, 177, 178, 183, 184, 186, 189 },
            levels = {
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
                { rate = 50, item = 544 },  -- pile of answer sheets
                { rate = 10, item = 4824 },  -- scroll of gravity
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
