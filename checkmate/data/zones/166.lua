-- Ranguemont Pass (zone 166).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Blade Bat', 'Seeker Bats', 'Stirge', 'Wind Bats' },
        [2] = { 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger', 'Goblin Shaman',
                'Goblin Smithy', 'Goblin Thug', 'Goblin Weaver' },
        [3] = { 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger', 'Goblin Shaman', 'Goblin Smithy',
                'Goblin Thug', 'Goblin Weaver' },
        [4] = { 'Goblin Furrier', 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger', 'Goblin Smithy',
                'Goblin Thug', 'Goblin Weaver' },
    },
    monsters = {
        {
            name   = 'Wind Bats',
            ids    = { 1, 2, 9, 10, 11 },
            levels = {
                [3] = { acc = 16, eva = 15, agi = 10, int = 6, mnd = 6, chr = 7 },
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
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
            name   = 'Blade Bat',
            ids    = { 3, 4, 12, 13, 17, 18 },
            levels = {
                [4] = { acc = 20, eva = 19, agi = 12, int = 7, mnd = 7, chr = 8 },
                [5] = { acc = 23, eva = 22, agi = 12, int = 8, mnd = 8, chr = 9 },
                [6] = { acc = 27, eva = 26, agi = 14, int = 8, mnd = 8, chr = 9 },
                [7] = { acc = 30, eva = 28, agi = 14, int = 9, mnd = 9, chr = 10 },
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
            name   = 'Oil Slick RP',
            ids    = { 5, 6 },
            levels = {
                [7] = { acc = 30, eva = 27, agi = 12, int = 9, mnd = 10, chr = 10 },
                [8] = { acc = 33, eva = 30, agi = 13, int = 9, mnd = 10, chr = 11 },
                [9] = { acc = 37, eva = 34, agi = 14, int = 10, mnd = 12, chr = 11 },
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
            name   = 'Goblin Thug',
            ids    = { 7, 14 },
            levels = {
                [4] = { acc = 21, eva = 21, agi = 12, int = 11, mnd = 7, chr = 7 },
                [5] = { acc = 25, eva = 24, agi = 12, int = 11, mnd = 7, chr = 7 },
                [6] = { acc = 28, eva = 28, agi = 14, int = 12, mnd = 8, chr = 8 },
                [7] = { acc = 32, eva = 31, agi = 14, int = 13, mnd = 9, chr = 9 },
                [8] = { acc = 35, eva = 34, agi = 15, int = 13, mnd = 9, chr = 9 },
            },
            spawn_levels = { [7] = { 4, 6 }, [14] = { 6, 8 } },
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
            ids    = { 8, 15, 16 },
            levels = {
                [4] = { acc = 20, eva = 16, agi = 9, int = 11, mnd = 11, chr = 9 },
                [5] = { acc = 23, eva = 19, agi = 10, int = 11, mnd = 11, chr = 9 },
                [6] = { acc = 26, eva = 22, agi = 11, int = 12, mnd = 12, chr = 9 },
                [7] = { acc = 30, eva = 25, agi = 11, int = 13, mnd = 13, chr = 11 },
                [8] = { acc = 33, eva = 28, agi = 12, int = 13, mnd = 13, chr = 11 },
            },
            spawn_levels = { [8] = { 4, 6 }, [15] = { 6, 8 }, [16] = { 6, 8 } },
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
            name   = 'Goblin Mugger',
            ids    = { 19, 22, 31, 34, 39, 40, 65, 68 },
            levels = {
                [26] = { acc = 98, eva = 107, agi = 33, int = 28, mnd = 19, chr = 19 },
                [27] = { acc = 102, eva = 110, agi = 33, int = 29, mnd = 20, chr = 20 },
                [28] = { acc = 106, eva = 114, agi = 34, int = 29, mnd = 20, chr = 20 },
                [29] = { acc = 109, eva = 117, agi = 35, int = 30, mnd = 20, chr = 20 },
                [30] = { acc = 113, eva = 133, agi = 37, int = 31, mnd = 21, chr = 21 },
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
            links  = 2,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 20, 23, 32, 35, 41, 66, 69 },
            levels = {
                [26] = { acc = 93, eva = 79, agi = 26, int = 23, mnd = 31, chr = 28 },
                [27] = { acc = 96, eva = 82, agi = 26, int = 24, mnd = 33, chr = 29 },
                [28] = { acc = 99, eva = 84, agi = 27, int = 25, mnd = 34, chr = 29 },
                [29] = { acc = 103, eva = 88, agi = 28, int = 25, mnd = 35, chr = 30 },
                [30] = { acc = 106, eva = 90, agi = 28, int = 26, mnd = 36, chr = 31 },
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
            links  = 2,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 21, 24, 33, 36, 67, 70 },
            levels = {
                [26] = { acc = 97, eva = 81, agi = 31, int = 31, mnd = 23, chr = 24 },
                [27] = { acc = 100, eva = 84, agi = 31, int = 33, mnd = 24, chr = 26 },
                [28] = { acc = 103, eva = 86, agi = 31, int = 34, mnd = 25, chr = 26 },
                [29] = { acc = 107, eva = 90, agi = 33, int = 35, mnd = 25, chr = 26 },
                [30] = { acc = 110, eva = 92, agi = 33, int = 36, mnd = 26, chr = 28 },
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
            links  = 2,
        },
        {
            name   = 'Seeker Bats',
            ids    = { 25, 26, 27, 28, 29, 37, 38, 43, 44, 45, 46, 47, 48, 49, 50, 56, 57, 75, 76, 85, 86, 87, 88,
                       94, 95, 96, 97, 98 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
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
            links  = 1,
        },
        {
            name   = 'Ooze',
            ids    = { 30, 53, 54, 91, 92 },
            levels = {
                [28] = { acc = 101, eva = 94, agi = 28, int = 21, mnd = 23, chr = 25 },
                [29] = { acc = 105, eva = 97, agi = 29, int = 22, mnd = 25, chr = 25 },
                [30] = { acc = 108, eva = 100, agi = 29, int = 23, mnd = 25, chr = 26 },
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
            name   = 'Cave Scorpion',
            ids    = { 42, 55 },
            levels = {
                [30] = { acc = 107, eva = 101, agi = 31, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 105, agi = 33, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 118, eva = 111, agi = 34, int = 26, mnd = 26, chr = 29 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 150, item = 896 },  -- scorpion shell
                { rate = 50, item = 16784 },  -- frostreaper
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Stirge',
            ids    = { 51, 58, 59, 60, 71, 72, 82, 83, 89, 90, 101, 102, 103, 104, 105, 112, 113, 114, 115, 116,
                       117, 118, 119, 120, 124, 125, 126, 127, 128, 132, 133, 134, 135, 136, 137, 138, 139, 140,
                       141, 142 },
            levels = {
                [30] = { acc = 108, eva = 102, agi = 33, int = 23, mnd = 23, chr = 26 },
                [31] = { acc = 112, eva = 107, agi = 36, int = 24, mnd = 24, chr = 28 },
                [32] = { acc = 115, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28 },
                [33] = { acc = 119, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29 },
            },
            spawn_levels = { [58] = { 31, 33 }, [59] = { 31, 33 }, [60] = { 30, 32 }, [82] = { 32, 32 },
                             [83] = { 31, 31 }, [89] = { 31, 31 }, [90] = { 32, 32 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 150, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Taisai',
            ids    = { 61, 62, 63 },
            levels = {
                [35] = { acc = 126, eva = 117, agi = 36, int = 46, mnd = 30, chr = 32 },
                [36] = { acc = 130, eva = 120, agi = 38, int = 47, mnd = 32, chr = 34 },
                [37] = { acc = 133, eva = 123, agi = 38, int = 49, mnd = 32, chr = 34 },
                [38] = { acc = 136, eva = 125, agi = 38, int = 49, mnd = 33, chr = 34 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 914 },  -- vial of mercury
                { rate = 150, item = 939 },  -- hecteyes eye
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Taisaijin',
            ids    = { 64 },
            nm     = true,
            levels = {
                [60] = { acc = 234, eva = 231, agi = 63, int = 60, mnd = 49, chr = 54 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = 9, bind = -2, silence = 9, slow = 9, poison = 9, light_sleep = -2, dark_sleep = 2,
                       blind = 9, stun = -2, gravity = -2 },
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 150, item = 914 },  -- vial of mercury
                { rate = 150, item = 939 },  -- hecteyes eye
                { rate = 50, item = 15222 },  -- spelunkers hat
                { rate = 240, item = 4717 },  -- scroll of refresh
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
        },
        {
            name   = 'Giant Scorpion',
            ids    = { 73 },
            levels = {
                [38] = { acc = 135, eva = 127, agi = 38, int = 29, mnd = 29, chr = 33 },
                [39] = { acc = 139, eva = 131, agi = 40, int = 31, mnd = 31, chr = 35 },
                [40] = { acc = 142, eva = 134, agi = 40, int = 31, mnd = 31, chr = 35 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 150, item = 896 },  -- scorpion shell
                { rate = 50, item = 16785 },  -- harvester
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bat Eye',
            ids    = { 74 },
            levels = {
                [42] = { acc = 152, eva = 141, agi = 44, int = 41, mnd = 32, chr = 38 },
                [43] = { acc = 155, eva = 144, agi = 44, int = 42, mnd = 33, chr = 38 },
                [44] = { acc = 160, eva = 148, agi = 47, int = 43, mnd = 33, chr = 40 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 557 },  -- ahriman lens
                { rate = 50, item = 16675 },  -- storm axe
                { rate = 1000, item = 921 },  -- bottle of ahriman tears
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Hecteyes RP',
            ids    = { 77, 78, 79, 80, 81 },
            levels = {
                [31] = { acc = 112, eva = 105, agi = 33, int = 42, mnd = 28, chr = 30 },
                [32] = { acc = 115, eva = 107, agi = 33, int = 42, mnd = 28, chr = 30 },
                [33] = { acc = 119, eva = 111, agi = 34, int = 43, mnd = 29, chr = 32 },
                [34] = { acc = 123, eva = 114, agi = 36, int = 45, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 100, item = 939 },  -- hecteyes eye
                { rate = 100, item = 939 },  -- hecteyes eye
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Furrier',
            ids    = { 99 },
            levels = {
                [32] = { acc = 138, eva = 102, agi = 42, int = 28, mnd = 30, chr = 28 },
                [33] = { acc = 142, eva = 105, agi = 43, int = 29, mnd = 32, chr = 29 },
                [34] = { acc = 145, eva = 108, agi = 45, int = 29, mnd = 32, chr = 29 },
                [35] = { acc = 148, eva = 112, agi = 46, int = 30, mnd = 32, chr = 30 },
                [36] = { acc = 152, eva = 114, agi = 47, int = 32, mnd = 34, chr = 32 },
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
            links  = 3,
        },
        {
            name   = 'Goblin Shaman',
            ids    = { 100 },
            levels = {
                [32] = { acc = 117, eva = 99, agi = 36, int = 39, mnd = 28, chr = 30 },
                [33] = { acc = 121, eva = 102, agi = 36, int = 41, mnd = 29, chr = 32 },
                [34] = { acc = 125, eva = 105, agi = 39, int = 42, mnd = 29, chr = 32 },
                [35] = { acc = 128, eva = 108, agi = 39, int = 43, mnd = 30, chr = 32 },
                [36] = { acc = 132, eva = 111, agi = 41, int = 44, mnd = 32, chr = 34 },
            },
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
            links  = 4,
        },
        {
            name   = 'Goblin Smithy',
            ids    = { 106, 108, 110, 111 },
            levels = {
                [32] = { acc = 117, eva = 109, agi = 36, int = 24, mnd = 24, chr = 28, resist = { virus = 10 } },
                [33] = { acc = 121, eva = 112, agi = 36, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [34] = { acc = 125, eva = 116, agi = 39, int = 26, mnd = 26, chr = 29, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 119, agi = 39, int = 27, mnd = 27, chr = 30, resist = { virus = 15 } },
                [36] = { acc = 132, eva = 123, agi = 41, int = 28, mnd = 28, chr = 32, resist = { virus = 15 } },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Evil Weapon',
            ids    = { 121, 122, 123 },
            levels = {
                [35] = { acc = 127, eva = 118, agi = 36, int = 35, mnd = 27, chr = 35 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 35, mnd = 28, chr = 36 },
                [37] = { acc = 134, eva = 124, agi = 38, int = 37, mnd = 29, chr = 37 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1107 },  -- pinch of glittersand
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Bat Eye',
            ids    = { 129, 130, 131 },
            levels = {
                [34] = { acc = 124, eva = 115, agi = 36, int = 34, mnd = 25, chr = 30 },
                [35] = { acc = 127, eva = 118, agi = 36, int = 34, mnd = 26, chr = 31 },
                [36] = { acc = 131, eva = 122, agi = 38, int = 35, mnd = 27, chr = 32 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 557 },  -- ahriman lens
                { rate = 50, item = 16675 },  -- storm axe
                { rate = 1000, item = 921 },  -- bottle of ahriman tears
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Tros',
            ids    = { 157 },
            nm     = true,
            levels = {
                [44] = { acc = 157, eva = 148, agi = 47, int = 40, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 10, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Harnessed Smilodon',
            ids    = { 160 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 638, agi = 139, int = 90, mnd = 105, chr = 117 },
            },
            ranks  = { fire = -2, ice = 1, earth = 1, thunder = -1, water = -1, light = 1, dark = 1, paralyze = 1,
                       bind = 1, slow = 1, poison = -1, light_sleep = 1, dark_sleep = 1, blind = 1, stun = -1 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
