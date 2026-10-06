-- FeiYin (zone 204).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Camazotz', 'Undead Bats', 'Underworld Bats', 'Vampire Bat' } },
        [2] = {
            sound = { 'Australis Shadow', 'Borealis Shadow', 'Eastern Shadow', 'Northern Shadow',
                      'Occidentalis Shadow', 'Orientalis Shadow', 'Shadow', 'Southern Shadow', 'Specter',
                      'Western Shadow' },
        },
        [3] = {
            sound = { 'Altedour I Tavnazia', 'Australis Shadow', 'Borealis Shadow', 'Eastern Shadow',
                      'Northern Shadow', 'Occidentalis Shadow', 'Orientalis Shadow', 'Shadow', 'Southern Shadow',
                      'Specter', 'Western Shadow' },
        },
        [4] = {
            sound = { 'Altedour I Tavnazia', 'Australis Shadow', 'Borealis Shadow', 'Eastern Shadow',
                      'Northern Shadow', 'Occidentalis Shadow', 'Orientalis Shadow', 'Shadow', 'Southern Shadow',
                      'Specter' },
        },
        [5] = {
            sound = { 'Altedour I Tavnazia', 'Australis Shadow', 'Borealis Shadow', 'Eastern Shadow',
                      'Occidentalis Shadow', 'Orientalis Shadow', 'Shadow', 'Southern Shadow', 'Specter',
                      'Western Shadow' },
        },
        [6] = {
            sound = { 'Altedour I Tavnazia', 'Australis Shadow', 'Borealis Shadow', 'Northern Shadow',
                      'Occidentalis Shadow', 'Orientalis Shadow', 'Shadow', 'Southern Shadow', 'Specter',
                      'Western Shadow' },
        },
        [7] = {
            sound = { 'Altedour I Tavnazia', 'Australis Shadow', 'Borealis Shadow', 'Eastern Shadow',
                      'Northern Shadow', 'Occidentalis Shadow', 'Orientalis Shadow', 'Shadow', 'Specter',
                      'Western Shadow' },
        },
    },
    monsters = {
        {
            name   = 'Undead Bats',
            ids    = { 1, 2, 3, 4, 5, 22, 23, 24, 27, 28, 52, 53, 68, 69, 82, 83, 84, 104, 164, 165, 166 },
            levels = {
                [38] = { acc = 136, eva = 128, agi = 41, int = 29, mnd = 29, chr = 33 },
                [39] = { acc = 140, eva = 132, agi = 43, int = 31, mnd = 31, chr = 35 },
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
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
            links  = 1,
        },
        {
            name   = 'Revenant SoZ ENS FY',
            ids    = { 6, 7, 12, 13, 17, 18, 33, 37, 41, 44, 85, 86 },
            levels = {
                [40] = { acc = 143, eva = 134, agi = 40, int = 39, mnd = 30, chr = 38 },
                [41] = { acc = 148, eva = 139, agi = 44, int = 41, mnd = 32, chr = 41 },
                [42] = { acc = 151, eva = 141, agi = 44, int = 41, mnd = 32, chr = 41 },
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
            name   = 'Drone',
            ids    = { 8, 14, 19, 25, 26, 29, 30, 31, 32, 54, 55, 60, 61, 64, 65 },
            levels = {
                [41] = { acc = 149, eva = 138, agi = 42, int = 33, mnd = 33, chr = 40 },
                [42] = { acc = 152, eva = 140, agi = 42, int = 33, mnd = 33, chr = 40 },
                [43] = { acc = 155, eva = 143, agi = 42, int = 33, mnd = 33, chr = 41 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Vampire Bat FY',
            ids    = { 9, 10, 15, 16, 20, 21, 34, 35, 38, 39, 42, 43, 45, 46, 87, 88, 89, 102, 154, 155, 156, 159,
                       160, 161 },
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37 },
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
            links  = 1,
        },
        {
            name   = 'Altedour I Tavnazia',
            ids    = { 36 },
            nm     = true,
            levels = {
                [65] = { acc = 261, eva = 229, agi = 72, int = 80, mnd = 58, chr = 66 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = 11,
                       dark_sleep = 11, blind = 4 },
            magic_dmg = { all = -50 },
            undead = true,
            immune = { 'silence', 'stun' },
            drops  = {
                { rate = 1000, item = 13842 },  -- tavnazian mask
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 2,
        },
        {
            name   = 'Clockwork Pod FY',
            ids    = { 47, 48, 56, 57, 58, 157, 162 },
            levels = {
                [41] = { acc = 148, eva = 135, agi = 37, int = 46, mnd = 44, chr = 42 },
                [42] = { acc = 151, eva = 137, agi = 37, int = 46, mnd = 44, chr = 42 },
                [43] = { acc = 154, eva = 140, agi = 37, int = 46, mnd = 44, chr = 43 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 50, item = 1200 },  -- piece of eastern pottery
                { rate = 10, item = 805 },  -- zircon
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Miser Murphy',
            ids    = { 49 },
            nm     = true,
            levels = {
                [62] = { acc = 243, eva = 221, agi = 59, int = 73, mnd = 59, chr = 64 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 10, bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 10, stun = 10, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 1093 },  -- antique coin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ore Golem',
            ids    = { 50, 51, 62, 63, 66, 67, 103, 158, 163 },
            levels = {
                [43] = { acc = 155, eva = 143, agi = 42, int = 36, mnd = 36, chr = 41 },
                [44] = { acc = 160, eva = 147, agi = 44, int = 37, mnd = 37, chr = 42 },
                [45] = { acc = 163, eva = 150, agi = 45, int = 39, mnd = 39, chr = 43 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 50, item = 955 },  -- golem shard
                { rate = 10, item = 1037 },  -- feiyin chest key
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Shadow war',
            ids    = { 70, 74, 75, 80, 91, 96, 100, 145, 149 },
            levels = {
                [44] = { acc = 158, eva = 150, agi = 50, int = 34, mnd = 34, chr = 42 },
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 43 },
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 44 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1682 },  -- ingot of royal treasury gold
                { rate = 50, item = 1037 },  -- feiyin chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Shadow blm',
            ids    = { 71, 77, 79, 90, 93, 95, 98, 101, 143, 147, 152 },
            levels = {
                [44] = { acc = 158, eva = 136, agi = 50, int = 54, mnd = 39, chr = 46 },
                [45] = { acc = 161, eva = 139, agi = 50, int = 55, mnd = 40, chr = 46 },
                [46] = { acc = 165, eva = 142, agi = 52, int = 55, mnd = 40, chr = 46 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1682 },  -- ingot of royal treasury gold
                { rate = 50, item = 1037 },  -- feiyin chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Shadow thf',
            ids    = { 72, 78, 94, 99, 144, 148, 153 },
            levels = {
                [44] = { acc = 162, eva = 183, agi = 53, int = 47, mnd = 32, chr = 35 },
                [45] = { acc = 165, eva = 186, agi = 53, int = 47, mnd = 32, chr = 35 },
                [46] = { acc = 168, eva = 191, agi = 56, int = 48, mnd = 34, chr = 38 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1682 },  -- ingot of royal treasury gold
                { rate = 50, item = 1037 },  -- feiyin chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Shadow rng',
            ids    = { 73, 76, 81, 92, 97, 142, 146, 150, 151 },
            levels = {
                [44] = { acc = 178, eva = 139, agi = 57, int = 39, mnd = 43, chr = 42 },
                [45] = { acc = 181, eva = 143, agi = 58, int = 40, mnd = 43, chr = 43 },
                [46] = { acc = 184, eva = 145, agi = 59, int = 40, mnd = 42, chr = 44 },
            },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1682 },  -- ingot of royal treasury gold
                { rate = 50, item = 1037 },  -- feiyin chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Underworld Bats',
            ids    = { 167, 168, 177, 178, 183, 184, 185, 192, 193, 194, 213, 218, 223, 232, 233, 237, 255, 256,
                       257, 258, 265, 266, 267, 268, 283, 284, 285, 288, 289, 290, 296, 297, 303, 304, 310, 311,
                       312, 313, 321, 322, 323, 326, 327 },
            levels = {
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 10, item = 1037 },  -- feiyin chest key
                { rate = 240, item = 891 },  -- bat fang
                { rate = 240, item = 922 },  -- bat wing
                { rate = 240, item = 891 },  -- bat fang
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Talos',
            ids    = { 169, 170, 171, 172, 259, 260, 261, 262, 263, 264 },
            levels = {
                [53] = { acc = 198, eva = 183, agi = 54, int = 43, mnd = 43, chr = 51 },
                [54] = { acc = 204, eva = 188, agi = 55, int = 43, mnd = 43, chr = 52 },
                [55] = { acc = 209, eva = 194, agi = 56, int = 43, mnd = 43, chr = 53 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            drops  = {
                { rate = 50, item = 1165 },  -- doll shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Droma FY',
            ids    = { 173, 174, 175, 198, 199, 234, 235, 236, 324, 325 },
            levels = {
                [54] = { acc = 202, eva = 185, agi = 48, int = 59, mnd = 57, chr = 55 },
                [55] = { acc = 207, eva = 191, agi = 50, int = 60, mnd = 57, chr = 55 },
                [56] = { acc = 213, eva = 195, agi = 51, int = 61, mnd = 59, chr = 57 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 240, item = 954 },  -- magic pot shard
                { rate = 50, item = 914 },  -- vial of mercury
                { rate = 10, item = 797 },  -- painite
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Camazotz FY',
            ids    = { 176, 179, 180, 181, 182, 196, 197, 201, 202, 204, 205, 207, 208, 269, 270, 271, 272 },
            levels = {
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 240, item = 891 },  -- bat fang
                { rate = 240, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Utukku EN FY',
            ids    = { 186, 187, 195, 203, 206, 209, 241, 242, 243, 281, 282, 314, 315 },
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 56, mnd = 43, chr = 54 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 57, mnd = 43, chr = 56 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 58, mnd = 44, chr = 56 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 1158 },  -- wandering bulb
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Specter war',
            ids    = { 188, 214, 219, 224, 291, 298, 305, 316 },
            levels = {
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 53 },
                [56] = { acc = 213, eva = 202, agi = 65, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 54 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 56 },
            },
            spawn_levels = { [188] = { 55, 57 }, [214] = { 55, 57 }, [219] = { 55, 57 }, [224] = { 55, 57 },
                             [291] = { 56, 58 }, [298] = { 56, 58 }, [305] = { 56, 58 }, [316] = { 56, 58 } },
            ph_for = { [298] = { 302 } },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Specter blm',
            ids    = { 189, 215, 220, 225, 292, 299, 306, 317 },
            levels = {
                [55] = { acc = 207, eva = 179, agi = 62, int = 69, mnd = 49, chr = 56 },
                [56] = { acc = 213, eva = 185, agi = 65, int = 70, mnd = 50, chr = 59 },
                [57] = { acc = 218, eva = 189, agi = 65, int = 71, mnd = 50, chr = 59 },
                [58] = { acc = 223, eva = 194, agi = 65, int = 71, mnd = 52, chr = 59 },
            },
            spawn_levels = { [189] = { 55, 57 }, [215] = { 55, 57 }, [220] = { 55, 57 }, [225] = { 55, 57 },
                             [292] = { 56, 58 }, [299] = { 56, 58 }, [306] = { 56, 58 }, [317] = { 56, 58 } },
            ph_for = { [317] = { 320 } },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Specter rng',
            ids    = { 190, 216, 221, 226, 293, 300, 307, 318 },
            levels = {
                [55] = { acc = 239, eva = 184, agi = 73, int = 49, mnd = 52, chr = 53 },
                [56] = { acc = 245, eva = 190, agi = 74, int = 50, mnd = 55, chr = 54 },
                [57] = { acc = 250, eva = 194, agi = 75, int = 50, mnd = 55, chr = 54 },
                [58] = { acc = 255, eva = 199, agi = 75, int = 52, mnd = 55, chr = 56 },
            },
            spawn_levels = { [190] = { 55, 57 }, [216] = { 55, 57 }, [221] = { 55, 57 }, [226] = { 55, 57 },
                             [293] = { 56, 58 }, [300] = { 56, 58 }, [307] = { 56, 58 }, [318] = { 56, 58 } },
            ph_for = { [293] = { 295 } },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Specter thf',
            ids    = { 191, 217, 222, 227, 294, 301, 308, 319 },
            levels = {
                [55] = { acc = 212, eva = 246, agi = 67, int = 58, mnd = 39, chr = 43 },
                [56] = { acc = 218, eva = 252, agi = 68, int = 61, mnd = 41, chr = 45 },
                [57] = { acc = 223, eva = 257, agi = 69, int = 61, mnd = 41, chr = 45 },
                [58] = { acc = 228, eva = 262, agi = 69, int = 61, mnd = 41, chr = 45 },
            },
            spawn_levels = { [191] = { 55, 57 }, [217] = { 55, 57 }, [222] = { 55, 57 }, [227] = { 55, 57 },
                             [294] = { 56, 58 }, [301] = { 56, 58 }, [308] = { 56, 58 }, [319] = { 56, 58 } },
            ph_for = { [308] = { 309 } },
            ranks  = { fire = -3, ice = 2, light = -3, dark = 2, paralyze = 2, bind = 2, light_sleep = -3,
                       dark_sleep = 2, blind = 2 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Colossus',
            ids    = { 200, 210, 244, 246, 248, 249, 250, 252, 254, 286, 287 },
            levels = {
                [56] = { acc = 215, eva = 199, agi = 58, int = 48, mnd = 48, chr = 54 },
                [57] = { acc = 220, eva = 204, agi = 58, int = 50, mnd = 50, chr = 54 },
                [58] = { acc = 225, eva = 209, agi = 59, int = 50, mnd = 50, chr = 56 },
            },
            ph_for = { [244] = { 245 }, [246] = { 245 }, [248] = { 245 }, [249] = { 245 }, [250] = { 245 },
                       [252] = { 245 }, [254] = { 245 } },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 50, item = 955 },  -- golem shard
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Ice Elemental',
            ids    = { 211 },
            levels = {
                [56] = { acc = 212, eva = 192, agi = 57, int = 67, mnd = 54, chr = 55 },
                [57] = { acc = 217, eva = 196, agi = 57, int = 68, mnd = 54, chr = 55 },
                [58] = { acc = 222, eva = 202, agi = 58, int = 68, mnd = 55, chr = 55 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'bind', 'gravity', 'silence', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
                { rate = 150, item = 4105 },  -- ice cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Dark Elemental',
            ids    = { 212 },
            levels = {
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 41 },
                [57] = { acc = 218, eva = 202, agi = 55, int = 61, mnd = 41, chr = 41 },
                [58] = { acc = 223, eva = 207, agi = 55, int = 61, mnd = 41, chr = 41 },
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
            name   = 'Killing Weapon',
            ids    = { 228, 229, 238, 273, 275, 277, 279 },
            levels = {
                [59] = { acc = 231, eva = 216, agi = 63, int = 58, mnd = 47, chr = 60 },
                [60] = { acc = 236, eva = 221, agi = 63, int = 58, mnd = 47, chr = 60 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 60, mnd = 49, chr = 62 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Hellish Weapon',
            ids    = { 230, 231, 239, 240, 274, 276, 278, 280 },
            levels = {
                [61] = { acc = 239, eva = 214, agi = 55, int = 77, mnd = 66, chr = 67 },
                [62] = { acc = 244, eva = 219, agi = 55, int = 77, mnd = 66, chr = 67 },
                [63] = { acc = 249, eva = 224, agi = 55, int = 78, mnd = 66, chr = 67 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 50, item = 4749 },  -- scroll of reraise ii
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Goliath',
            ids    = { 245, 247, 251, 253 },
            nm     = true,
            levels = {
                [62] = { acc = 247, eva = 230, agi = 63, int = 53, mnd = 53, chr = 59 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            drops  = {
                { rate = 1000, item = 1465 },  -- slab of granite
                { rate = 150, item = 644 },  -- chunk of mythril ore
                { rate = 150, item = 955 },  -- golem shard
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Western Shadow',
            ids    = { 295 },
            nm     = true,
            levels = {
                [63] = { acc = 252, eva = 236, agi = 53, int = 45, mnd = 60, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 940 },  -- revival tree root
                { rate = 150, item = 18752 },  -- retaliators
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Northern Shadow',
            ids    = { 302 },
            nm     = true,
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 940 },  -- revival tree root
                { rate = 100, item = 16723 },  -- executioner
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
            links  = 5,
        },
        {
            name   = 'Eastern Shadow',
            ids    = { 309 },
            nm     = true,
            levels = {
                [63] = { acc = 282, eva = 225, agi = 82, int = 55, mnd = 60, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 940 },  -- revival tree root
                { rate = 100, item = 18714 },  -- valis bow
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
            links  = 6,
        },
        {
            name   = 'Southern Shadow',
            ids    = { 320 },
            nm     = true,
            levels = {
                [63] = { acc = 248, eva = 228, agi = 63, int = 70, mnd = 62, chr = 64 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 1000, item = 940 },  -- revival tree root
                { rate = 150, item = 12344 },  -- master shield
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
            links  = 7,
        },
        {
            name   = 'Dabotzs Ghost',
            ids    = { 328 },
            nm     = true,
            levels = {
                [53] = { acc = 196, eva = 184, agi = 57, int = 54, mnd = 42, chr = 52 },
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
            name   = 'Capricious Cassie',
            ids    = { 329 },
            nm     = true,
            levels = {
                [70] = { acc = 291, eva = 274, agi = 73, int = 55, mnd = 51, chr = 61 },
            },
            ranks  = { fire = -2, water = 4, light = -2, dark = 4, poison = 4, light_sleep = -2, dark_sleep = 4,
                       blind = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'paralyze' },
            drops  = {
                { rate = 240, item = 4172 },  -- reraiser
                { rate = 240, item = 4174 },  -- vile elixir
                { rate = 240, item = 13622 },  -- amity cape
                { rate = 150, item = 4175 },  -- vile elixir +1
                { rate = 150, item = 13978 },  -- aiming bracelets
                { rate = 150, item = 4173 },  -- hi-reraiser
                { rate = 150, item = 13402 },  -- cassie earring
                { rate = 100, item = 837 },  -- spool of malboro fiber
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Orientalis Shadow',
            ids    = { 334, 338 },
            nm     = true,
            levels = {
                [128] = { acc = 530, eva = 555, agi = 156, int = 108, mnd = 117, chr = 115 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Borealis Shadow',
            ids    = { 335, 339 },
            nm     = true,
            levels = {
                [128] = { acc = 488, eva = 583, agi = 135, int = 96, mnd = 96, chr = 115 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Australis Shadow',
            ids    = { 336, 340 },
            nm     = true,
            levels = {
                [128] = { acc = 482, eva = 559, agi = 115, int = 128, mnd = 128, chr = 124 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Occidentalis Shadow',
            ids    = { 337, 341 },
            nm     = true,
            levels = {
                [128] = { acc = 493, eva = 580, agi = 103, int = 87, mnd = 117, chr = 115 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 3,
        },
        {
            name   = 'Carousing Celine',
            ids    = { 342, 343, 344 },
            nm     = true,
            levels = {
                [128] = { acc = 495, eva = 580, agi = 128, int = 96, mnd = 90, chr = 108 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Arcus Blades',
            ids    = { 345 },
            nm     = true,
            levels = {
                [125] = { acc = 492, eva = 533, agi = 140, int = 154, mnd = 140, chr = 139 },
            },
            ranks  = { fire = -2, ice = 2, earth = -1, water = -1, light = -2, dark = 2, paralyze = 2, bind = 2,
                       slow = -1, poison = -1, light_sleep = -2, dark_sleep = 2, blind = 2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
