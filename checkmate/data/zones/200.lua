-- Garlaige Citadel (zone 200).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Citadel Bats', 'Funnel Bats', 'Funnel Bats GC', 'Old Two-Wings', 'Siege Bat', 'Wingrats' },
        [2] = { 'Citadel Bats', 'Funnel Bats', 'Funnel Bats GC', 'Siege Bat', 'Wingrats' },
        [3] = { 'Chamber Beetle' },
        [4] = { 'Mephitas' },
    },
    monsters = {
        {
            name   = 'Borer Beetle',
            ids    = { 1, 4, 18, 40, 43, 48, 51 },
            levels = {
                [41] = { acc = 146, eva = 131, agi = 29, int = 29, mnd = 42, chr = 42 },
                [42] = { acc = 149, eva = 133, agi = 29, int = 29, mnd = 42, chr = 42 },
                [43] = { acc = 152, eva = 136, agi = 29, int = 29, mnd = 42, chr = 42 },
                [44] = { acc = 156, eva = 139, agi = 29, int = 29, mnd = 44, chr = 44 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 1000, item = 846 },  -- insect wing
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 240, item = 894 },  -- beetle jaw
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Siege Bat',
            ids    = { 2, 3, 5, 6, 7, 8, 9, 19, 20, 21, 22, 26, 29, 36, 41, 42, 44, 45, 49, 50, 52, 53 },
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37 },
                [43] = { acc = 154, eva = 145, agi = 47, int = 33, mnd = 33, chr = 38 },
            },
            spawn_levels = { [2] = { 40, 42 }, [3] = { 40, 42 }, [5] = { 40, 42 }, [6] = { 40, 42 },
                             [7] = { 40, 42 }, [8] = { 40, 42 }, [9] = { 40, 42 }, [19] = { 41, 43 },
                             [20] = { 41, 43 }, [21] = { 41, 43 }, [22] = { 41, 43 }, [26] = { 40, 42 },
                             [29] = { 40, 42 }, [36] = { 41, 43 }, [41] = { 41, 43 }, [42] = { 41, 43 },
                             [44] = { 41, 43 }, [45] = { 41, 43 }, [49] = { 41, 43 }, [50] = { 41, 43 },
                             [52] = { 41, 43 }, [53] = { 41, 43 } },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 922 },  -- bat wing
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 1,
        },
        {
            name   = 'Wingrats GC',
            ids    = { 10, 11, 12, 13, 27, 28, 30, 31, 32, 33 },
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 922 },  -- bat wing
            },
            links  = 1,
        },
        {
            name   = 'Fallen Evacuee war',
            ids    = { 14, 16, 34 },
            levels = {
                [42] = { acc = 152, eva = 141, agi = 44, int = 33, mnd = 31, chr = 37 },
                [43] = { acc = 155, eva = 144, agi = 44, int = 33, mnd = 31, chr = 38 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 502 },  -- garlaige key
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 5, item = 4876 },  -- scroll of absorb-vit
                { rate = 5, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fallen Evacuee blm',
            ids    = { 15, 17, 35 },
            levels = {
                [42] = { acc = 152, eva = 128, agi = 44, int = 51, mnd = 35, chr = 40 },
                [43] = { acc = 155, eva = 131, agi = 44, int = 53, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 502 },  -- garlaige key
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 5, item = 4876 },  -- scroll of absorb-vit
                { rate = 5, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Puroboros EN GC',
            ids    = { 23, 37 },
            levels = {
                [43] = { acc = 155, eva = 144, agi = 44, int = 31, mnd = 33, chr = 41 },
                [44] = { acc = 160, eva = 148, agi = 47, int = 31, mnd = 34, chr = 42 },
                [45] = { acc = 163, eva = 151, agi = 47, int = 34, mnd = 36, chr = 43 },
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
            name   = 'Oil Spill',
            ids    = { 24, 25 },
            levels = {
                [43] = { acc = 154, eva = 143, agi = 42, int = 33, mnd = 36, chr = 38 },
                [44] = { acc = 158, eva = 147, agi = 44, int = 34, mnd = 37, chr = 39 },
                [45] = { acc = 161, eva = 150, agi = 45, int = 36, mnd = 39, chr = 40 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Clockwork Pod GC',
            ids    = { 38, 39 },
            levels = {
                [44] = { acc = 158, eva = 144, agi = 38, int = 48, mnd = 46, chr = 45 },
                [45] = { acc = 161, eva = 148, agi = 40, int = 49, mnd = 47, chr = 45 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 10, item = 801 },  -- chrysoberyl
                { rate = 50, item = 1200 },  -- piece of eastern pottery
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Revenant NGS EN GC',
            ids    = { 46, 47 },
            levels = {
                [44] = { acc = 158, eva = 148, agi = 47, int = 43, mnd = 33, chr = 43 },
                [45] = { acc = 161, eva = 151, agi = 47, int = 44, mnd = 35, chr = 44 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 45, mnd = 35, chr = 44 },
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
            name   = 'Citadel Bats',
            ids    = { 54, 55, 56, 57, 58, 66, 67, 68, 72, 73, 74, 78, 79, 80, 81, 82, 213, 214, 215, 216, 217,
                       218 },
            levels = {
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Demonic Weapon',
            ids    = { 59, 60, 70, 71, 76, 77, 83, 84 },
            levels = {
                [47] = { acc = 170, eva = 157, agi = 49, int = 46, mnd = 37, chr = 46 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 46, mnd = 37, chr = 48 },
                [49] = { acc = 178, eva = 165, agi = 52, int = 48, mnd = 38, chr = 48 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Fallen Soldier war',
            ids    = { 61, 63, 85, 87 },
            levels = {
                [47] = { acc = 170, eva = 157, agi = 49, int = 37, mnd = 34, chr = 41 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 37, mnd = 35, chr = 42 },
                [49] = { acc = 178, eva = 165, agi = 52, int = 38, mnd = 36, chr = 42 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fallen Soldier blm',
            ids    = { 62, 64, 86, 88 },
            levels = {
                [47] = { acc = 170, eva = 143, agi = 49, int = 57, mnd = 38, chr = 45 },
                [48] = { acc = 173, eva = 146, agi = 50, int = 57, mnd = 40, chr = 45 },
                [49] = { acc = 178, eva = 150, agi = 52, int = 58, mnd = 40, chr = 45 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bhuta',
            ids    = { 65, 69, 75, 89 },
            levels = {
                [47] = { acc = 168, eva = 157, agi = 49, int = 45, mnd = 35, chr = 45 },
                [48] = { acc = 172, eva = 161, agi = 50, int = 45, mnd = 36, chr = 46 },
                [49] = { acc = 176, eva = 165, agi = 52, int = 47, mnd = 37, chr = 47 },
            },
            spawn_levels = { [65] = { 47, 48 }, [69] = { 49, 49 }, [89] = { 47, 48 } },
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
            name   = 'Old Two-Wings',
            ids    = { 90 },
            nm     = true,
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 1000, item = 924 },  -- vial of fiend blood
                { rate = 240, item = 13598 },  -- bat cape
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Skewer Sam',
            ids    = { 91 },
            nm     = true,
            levels = {
                [54] = { acc = 200, eva = 190, agi = 58, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 1000, item = 854 },  -- cockatrice skin
                { rate = 150, item = 16857 },  -- wind spear
                { rate = 240, item = 854 },  -- cockatrice skin
                { rate = 240, item = 854 },  -- cockatrice skin
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
        },
        {
            name   = 'Funnel Bats GC',
            ids    = { 92, 93, 95, 96, 97, 98, 118, 119, 121, 124, 125, 137, 149, 150, 151, 166, 167, 168 },
            levels = {
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 891 },  -- bat fang
                { rate = 240, item = 891 },  -- bat fang
                { rate = 240, item = 922 },  -- bat wing
                { rate = 50, item = 1041 },  -- garlaige chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Fetid Flesh',
            ids    = { 94, 120 },
            levels = {
                [54] = { acc = 202, eva = 190, agi = 58, int = 43, mnd = 40, chr = 52 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 41, chr = 53 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 41, chr = 54 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 849 },  -- undead skin
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 50, item = 1041 },  -- garlaige chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Explosure',
            ids    = { 99, 100, 101, 107, 108, 109, 126, 131, 132, 154, 157, 160, 163 },
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 39, mnd = 41, chr = 51 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 40, mnd = 43, chr = 51 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 240, item = 1090 },  -- chunk of bomb coal
                { rate = 50, item = 1041 },  -- garlaige chest key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 102, 110, 187 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            immune = { 'stun', 'poison' },
            drops  = {
                { rate = 1000, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 150, item = 4108 },  -- lightning cluster
                { rate = 50, item = 1041 },  -- garlaige chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 103, 111, 188 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Droma GC',
            ids    = { 105, 106, 112, 127, 128, 135, 136, 152, 153, 164, 165, 173 },
            levels = {
                [52] = { acc = 191, eva = 175, agi = 48, int = 57, mnd = 55, chr = 53 },
                [53] = { acc = 196, eva = 180, agi = 48, int = 58, mnd = 55, chr = 54 },
                [54] = { acc = 202, eva = 185, agi = 48, int = 59, mnd = 57, chr = 55 },
            },
            spawn_levels = { [105] = { 53, 54 }, [106] = { 53, 54 }, [128] = { 53, 54 }, [136] = { 53, 54 },
                             [153] = { 53, 54 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1041 },  -- garlaige chest key
                { rate = 10, item = 784 },  -- jadeite
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Fallen Officer war',
            ids    = { 113, 114, 129, 133, 141, 142, 143, 146, 155, 161, 169, 170 },
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 41, mnd = 39, chr = 47 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 43, mnd = 40, chr = 48 },
                [54] = { acc = 204, eva = 190, agi = 58, int = 43, mnd = 40, chr = 48 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 43, mnd = 41, chr = 49 },
            },
            spawn_levels = { [113] = { 52, 54 }, [114] = { 52, 54 }, [129] = { 52, 54 }, [133] = { 53, 54 },
                             [141] = { 53, 55 }, [142] = { 53, 55 }, [143] = { 53, 55 }, [146] = { 53, 55 },
                             [155] = { 53, 55 }, [161] = { 52, 54 }, [169] = { 52, 54 }, [170] = { 52, 54 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1041 },  -- garlaige chest key
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fallen Officer blm',
            ids    = { 115, 116, 130, 134, 144, 145, 147, 148, 156, 162, 171, 172 },
            levels = {
                [52] = { acc = 193, eva = 163, agi = 56, int = 65, mnd = 45, chr = 50 },
                [53] = { acc = 198, eva = 167, agi = 57, int = 67, mnd = 45, chr = 52 },
                [54] = { acc = 204, eva = 173, agi = 58, int = 67, mnd = 45, chr = 52 },
                [55] = { acc = 209, eva = 177, agi = 58, int = 69, mnd = 47, chr = 52 },
            },
            spawn_levels = { [115] = { 52, 54 }, [116] = { 52, 54 }, [130] = { 53, 54 }, [134] = { 52, 54 },
                             [144] = { 53, 55 }, [145] = { 53, 55 }, [147] = { 53, 55 }, [148] = { 53, 55 },
                             [156] = { 52, 54 }, [162] = { 52, 54 }, [171] = { 52, 54 }, [172] = { 52, 54 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1041 },  -- garlaige chest key
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Chandelier',
            ids    = { 117 },
            nm     = true,
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 46, mnd = 49, chr = 59 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 1091 },  -- lump of chandelier coal
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Acid Grease',
            ids    = { 122, 123, 138, 139, 158, 159 },
            levels = {
                [52] = { acc = 191, eva = 178, agi = 54, int = 41, mnd = 45, chr = 47 },
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 46, chr = 48 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 47, chr = 48 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
                { rate = 50, item = 637 },  -- vial of slime oil
                { rate = 50, item = 1041 },  -- garlaige chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Wraith',
            ids    = { 140, 201, 206, 211, 300, 301, 302, 303, 305 },
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 60, mnd = 46, chr = 58 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 62, mnd = 48, chr = 61 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 62, mnd = 48, chr = 61 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 1047 },  -- garlaige coffer key
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Chamber Beetle',
            ids    = { 174, 175, 176, 177, 178, 179, 180, 193, 194, 195, 196, 231, 232, 233, 234, 241, 242, 243,
                       246 },
            levels = {
                [56] = { acc = 210, eva = 189, agi = 38, int = 38, mnd = 58, chr = 58 },
                [57] = { acc = 215, eva = 194, agi = 38, int = 38, mnd = 58, chr = 58 },
                [58] = { acc = 221, eva = 199, agi = 39, int = 39, mnd = 59, chr = 59 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 1000, item = 846 },  -- insect wing
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 240, item = 894 },  -- beetle jaw
                { rate = 240, item = 889 },  -- beetle shell
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Tainted Flesh GC',
            ids    = { 181, 182, 225, 226 },
            levels = {
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 46, chr = 59 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 50, mnd = 46, chr = 60 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 52, mnd = 49, chr = 62 },
            },
            spawn_levels = { [181] = { 63, 64 }, [182] = { 63, 64 }, [226] = { 63, 64 } },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 50, item = 1047 },  -- garlaige coffer key
                { rate = 100, item = 849 },  -- undead skin
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Hellmine',
            ids    = { 184, 185, 186, 255, 256, 310, 311 },
            levels = {
                [59] = { acc = 231, eva = 216, agi = 63, int = 44, mnd = 47, chr = 57 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 44, mnd = 47, chr = 57 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 46, mnd = 49, chr = 59 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 46, mnd = 49, chr = 59 },
            },
            spawn_levels = { [184] = { 59, 61 }, [185] = { 59, 61 }, [186] = { 59, 61 }, [255] = { 60, 62 },
                             [256] = { 60, 62 }, [310] = { 60, 62 }, [311] = { 60, 62 } },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 50, item = 1047 },  -- garlaige coffer key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Over Weapon',
            ids    = { 189, 191, 202, 204, 219, 220, 221 },
            levels = {
                [59] = { acc = 231, eva = 216, agi = 63, int = 58, mnd = 47, chr = 60 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 58, mnd = 47, chr = 60 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 60, mnd = 49, chr = 62 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 60, mnd = 49, chr = 62 },
            },
            spawn_levels = { [189] = { 59, 61 }, [191] = { 59, 61 }, [202] = { 59, 60 }, [204] = { 59, 61 },
                             [219] = { 60, 62 }, [220] = { 60, 62 }, [221] = { 60, 62 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 1047 },  -- garlaige coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Vault Weapon',
            ids    = { 190, 192, 203, 205, 222, 223, 224 },
            levels = {
                [60] = { acc = 233, eva = 209, agi = 53, int = 74, mnd = 63, chr = 64 },
                [61] = { acc = 239, eva = 214, agi = 55, int = 77, mnd = 66, chr = 67 },
                [62] = { acc = 244, eva = 219, agi = 55, int = 77, mnd = 66, chr = 67 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 1047 },  -- garlaige coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Fallen Major',
            ids    = { 197, 198, 207, 208, 249, 250, 253, 254 },
            levels = {
                [59] = { acc = 231, eva = 216, agi = 63, int = 47, mnd = 44, chr = 53 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 46, chr = 55 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 46, chr = 55 },
            },
            spawn_levels = { [197] = { 60, 62 }, [198] = { 60, 62 }, [207] = { 60, 62 }, [208] = { 60, 62 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1047 },  -- garlaige coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fallen Mage',
            ids    = { 199, 200, 209, 210, 247, 248, 251, 252 },
            levels = {
                [59] = { acc = 231, eva = 197, agi = 63, int = 74, mnd = 50, chr = 57 },
                [60] = { acc = 236, eva = 202, agi = 63, int = 74, mnd = 50, chr = 57 },
                [61] = { acc = 242, eva = 208, agi = 66, int = 76, mnd = 52, chr = 60 },
                [62] = { acc = 247, eva = 213, agi = 66, int = 76, mnd = 52, chr = 60 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 1047 },  -- garlaige coffer key
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Guardian Statue',
            ids    = { 227 },
            nm     = true,
            levels = {
                [61] = { acc = 242, eva = 225, agi = 63, int = 49, mnd = 49, chr = 59 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            magic_dmg = { all = -75 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'paralyze', 'slow', 'elegy', 'blind' },
            drops  = {
                { rate = 1000, item = 1094 },  -- nail puller
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Funnel Bats GC',
            ids    = { 228, 229, 230, 237, 238, 239, 240, 244, 245 },
            levels = {
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 891 },  -- bat fang
                { rate = 240, item = 891 },  -- bat fang
                { rate = 240, item = 922 },  -- bat wing
                { rate = 50, item = 1041 },  -- garlaige chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Magic Jug',
            ids    = { 235, 236, 306, 307, 308, 309 },
            levels = {
                [62] = { acc = 245, eva = 227, agi = 56, int = 67, mnd = 64, chr = 62 },
                [63] = { acc = 250, eva = 232, agi = 56, int = 67, mnd = 64, chr = 62 },
                [64] = { acc = 256, eva = 237, agi = 56, int = 69, mnd = 66, chr = 64 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 50, item = 1047 },  -- garlaige coffer key
                { rate = 50, item = 4659 },  -- scroll of shell iv
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Serket',
            ids    = { 304 },
            nm     = true,
            levels = {
                [70] = { acc = 284, eva = 272, agi = 69, int = 61, mnd = 61, chr = 63 },
            },
            ranks  = { ice = -2, thunder = -2, water = 4, paralyze = -2, bind = -2, poison = 4, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'poison' },
            drops  = {
                { rate = 1000, item = 4172 },  -- reraiser
                { rate = 150, item = 4173 },  -- hi-reraiser
                { rate = 1000, item = 4174 },  -- vile elixir
                { rate = 150, item = 4175 },  -- vile elixir +1
                { rate = 150, item = 12348 },  -- serket shield
                { rate = 150, item = 13552 },  -- serket ring
                { rate = 100, item = 901 },  -- venomous claw
                { rate = 150, item = 16767 },  -- triple dagger
            },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Mimic',
            ids    = { 312 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1047 },  -- garlaige coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Light Elemental',
            ids    = { 313 },
            nm     = true,
            levels = {
                [75] = { acc = 305, eva = 270, agi = 65, int = 65, mnd = 91, chr = 77 },
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
            name   = 'Roly-Poly',
            ids    = { 314, 315, 316 },
            nm     = true,
            levels = {
                [91] = { acc = 403, eva = 349, agi = 79, int = 85, mnd = 105, chr = 100 },
                [92] = { acc = 410, eva = 354, agi = 79, int = 85, mnd = 105, chr = 100 },
                [93] = { acc = 418, eva = 359, agi = 80, int = 85, mnd = 106, chr = 100 },
            },
            ranks  = { fire = -1, ice = 1, wind = 1, earth = 1, thunder = -1, water = 3, light = -1, dark = 2,
                       paralyze = 1, bind = 1, silence = 1, slow = 1, poison = 3, light_sleep = -1, dark_sleep = 2,
                       blind = 2, stun = -1, gravity = 1 },
            magic_dmg = { all = 25 },
            aggro  = true,
            detects = { 'sight', 'ability' },
        },
        {
            name   = 'Mephitas',
            ids    = { 317, 318, 319 },
            nm     = true,
            levels = {
                [99] = { acc = 472, eva = 427, agi = 101, int = 76, mnd = 76, chr = 85 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
    },
    by_name = {},
}
