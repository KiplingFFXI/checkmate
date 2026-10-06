-- Toraimarai Canal (zone 169).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Bloodsucker', 'Bouncing Ball' } },
        [2] = { sound = { 'Canal Bats', 'Dire Bat', 'Hell Bat', 'Impish Bats' } },
        [3] = { sight = { 'Starmite' } },
    },
    monsters = {
        {
            name   = 'Bigclaw',
            ids    = { 1 },
            levels = {
                [49] = { acc = 171, eva = 155, agi = 33, int = 35, mnd = 52, chr = 52 },
                [50] = { acc = 175, eva = 158, agi = 33, int = 36, mnd = 54, chr = 54 },
                [51] = { acc = 181, eva = 164, agi = 36, int = 38, mnd = 56, chr = 56 },
                [52] = { acc = 186, eva = 169, agi = 36, int = 38, mnd = 56, chr = 56 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 150, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Canal Leech',
            ids    = { 2 },
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 39, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 40, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 40, mnd = 37, chr = 41 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Rock Crab',
            ids    = { 3 },
            levels = {
                [52] = { acc = 186, eva = 169, agi = 36, int = 38, mnd = 56, chr = 56 },
                [53] = { acc = 192, eva = 174, agi = 36, int = 39, mnd = 57, chr = 57 },
                [54] = { acc = 197, eva = 179, agi = 36, int = 39, mnd = 58, chr = 58 },
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
            name   = 'Bloodsucker',
            ids    = { 4 },
            levels = {
                [54] = { acc = 202, eva = 190, agi = 58, int = 47, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 47, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 48, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 50, mnd = 46, chr = 50 },
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
            name   = 'Mousse',
            ids    = { 5 },
            levels = {
                [63] = { acc = 250, eva = 235, agi = 63, int = 49, mnd = 53, chr = 55 },
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Canal Bats TC',
            ids    = { 6, 7, 8, 9, 15, 16, 21, 22, 27, 28, 37, 38, 44, 45, 51, 52, 58 },
            levels = {
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Hell Bat TC',
            ids    = { 10, 11, 17, 18, 23, 24, 29, 30, 39, 40, 46, 47, 53, 54, 59, 77, 78, 79, 80, 81, 85, 86, 87,
                       91, 92, 98, 99, 160, 161 },
            levels = {
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42 },
                [49] = { acc = 176, eva = 167, agi = 56, int = 38, mnd = 38, chr = 42 },
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
            links  = 2,
        },
        {
            name   = 'Bigclaw',
            ids    = { 12, 13, 19, 25, 31, 32, 41, 42, 48, 49, 55, 56, 60, 61, 82, 83, 88, 89, 93 },
            levels = {
                [49] = { acc = 171, eva = 155, agi = 33, int = 35, mnd = 52, chr = 52 },
                [50] = { acc = 175, eva = 158, agi = 33, int = 36, mnd = 54, chr = 54 },
                [51] = { acc = 181, eva = 164, agi = 36, int = 38, mnd = 56, chr = 56 },
                [52] = { acc = 186, eva = 169, agi = 36, int = 38, mnd = 56, chr = 56 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 936 },  -- chunk of rock salt
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 150, item = 881 },  -- crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fallen Knight',
            ids    = { 14, 20, 26, 33, 34, 43, 50, 57, 62, 71, 72, 84, 90, 94, 272, 274, 275 },
            levels = {
                [52] = { acc = 193, eva = 176, agi = 50, int = 56, mnd = 36, chr = 38 },
                [53] = { acc = 198, eva = 182, agi = 52, int = 57, mnd = 36, chr = 39 },
                [54] = { acc = 204, eva = 187, agi = 52, int = 58, mnd = 36, chr = 39 },
                [55] = { acc = 209, eva = 192, agi = 52, int = 58, mnd = 37, chr = 39 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lich',
            ids    = { 35, 36, 73, 74, 273, 276, 277 },
            levels = {
                [54] = { acc = 204, eva = 173, agi = 58, int = 67, mnd = 45, chr = 52 },
                [55] = { acc = 209, eva = 177, agi = 58, int = 69, mnd = 47, chr = 52 },
                [56] = { acc = 215, eva = 183, agi = 61, int = 70, mnd = 47, chr = 55 },
                [57] = { acc = 220, eva = 187, agi = 61, int = 71, mnd = 47, chr = 55 },
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
            name   = 'Dark Aspic',
            ids    = { 63, 64, 65, 66, 67, 68, 95 },
            levels = {
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 46, chr = 48 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 47, chr = 48 },
                [55] = { acc = 207, eva = 194, agi = 56, int = 43, mnd = 47, chr = 49 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 100, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bloodsucker',
            ids    = { 69, 70, 96, 97, 152, 153, 154, 155, 261, 262, 263 },
            levels = {
                [54] = { acc = 202, eva = 190, agi = 58, int = 47, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 47, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 48, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 50, mnd = 46, chr = 50 },
                [64] = { acc = 256, eva = 243, agi = 68, int = 54, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59 },
            },
            spawn_levels = { [69] = { 54, 57 }, [70] = { 54, 57 }, [96] = { 54, 57 }, [97] = { 54, 57 },
                             [152] = { 54, 57 }, [153] = { 54, 57 }, [154] = { 54, 57 }, [155] = { 54, 57 },
                             [261] = { 64, 67 }, [262] = { 64, 67 }, [263] = { 64, 67 } },
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
            name   = 'Girtab',
            ids    = { 75, 100 },
            levels = {
                [58] = { acc = 222, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 228, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53 },
                [60] = { acc = 233, eva = 221, agi = 63, int = 47, mnd = 47, chr = 53 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 896 },  -- scorpion shell
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 50, item = 16676 },  -- viking axe
                { rate = 50, item = 1057 },  -- toraimarai coffer key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Magic Sludge',
            ids    = { 76 },
            nm     = true,
            levels = {
                [64] = { acc = 256, eva = 240, agi = 62, int = 68, mnd = 46, chr = 46 },
            },
            ranks  = { light = -3, dark = 10, silence = 9, light_sleep = -3, dark_sleep = 11, blind = 11,
                       stun = 10 },
            magic_dmg = { all = -75 },
            immune = { 'dark_sleep', 'light_sleep', 'blind' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Scavenger Crab',
            ids    = { 101, 102, 103, 104, 105, 106, 162, 163, 164, 165, 166, 167, 218, 219, 220, 230, 231, 232,
                       258, 259, 260 },
            levels = {
                [60] = { acc = 229, eva = 209, agi = 39, int = 42, mnd = 63, chr = 63 },
                [61] = { acc = 234, eva = 215, agi = 42, int = 45, mnd = 66, chr = 66 },
                [62] = { acc = 239, eva = 220, agi = 42, int = 45, mnd = 66, chr = 66 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fleshcraver',
            ids    = { 107, 108, 109, 110, 183, 184, 194, 195, 201, 202, 205, 206 },
            levels = {
                [60] = { acc = 236, eva = 221, agi = 63, int = 47, mnd = 44, chr = 53 },
                [61] = { acc = 242, eva = 227, agi = 66, int = 49, mnd = 46, chr = 55 },
                [62] = { acc = 247, eva = 232, agi = 66, int = 49, mnd = 46, chr = 55 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 1057 },  -- toraimarai coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Mindcraver',
            ids    = { 111, 112, 181, 182, 185, 186, 196, 197, 203, 204, 207, 208 },
            levels = {
                [60] = { acc = 236, eva = 202, agi = 63, int = 74, mnd = 50, chr = 57 },
                [61] = { acc = 242, eva = 208, agi = 66, int = 76, mnd = 52, chr = 60 },
                [62] = { acc = 247, eva = 213, agi = 66, int = 76, mnd = 52, chr = 60 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Rotten Sod',
            ids    = { 113 },
            levels = {
                [58] = { acc = 223, eva = 210, agi = 61, int = 46, mnd = 44, chr = 56 },
                [59] = { acc = 229, eva = 216, agi = 63, int = 47, mnd = 44, chr = 57 },
                [60] = { acc = 234, eva = 221, agi = 63, int = 47, mnd = 44, chr = 57 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 849 },  -- undead skin
                { rate = 50, item = 1057 },  -- toraimarai coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Makara',
            ids    = { 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131,
                       132, 133, 134, 139, 140, 141, 142, 143, 144, 145, 146, 148, 149, 150, 151 },
            levels = {
                [49] = { acc = 176, eva = 167, agi = 56, int = 38, mnd = 38, chr = 40 },
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 42 },
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 45 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 45 },
            },
            spawn_levels = { [114] = { 50, 51 } },
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
            name   = 'Bouncing Ball',
            ids    = { 135, 136, 137, 242, 243, 244, 249, 250, 251, 308, 309, 310, 311 },
            levels = {
                [64] = { acc = 256, eva = 243, agi = 68, int = 54, mnd = 50, chr = 56 },
                [65] = { acc = 261, eva = 248, agi = 68, int = 56, mnd = 52, chr = 58 },
                [66] = { acc = 267, eva = 253, agi = 70, int = 57, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 258, agi = 71, int = 57, mnd = 53, chr = 59 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 1057 },  -- toraimarai coffer key
                { rate = 10, item = 1125 },  -- carbuncles ruby
                { rate = 50, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Oni Carcass',
            ids    = { 147 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 50, chr = 64 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 54, mnd = 51, chr = 65 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 51, chr = 65 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 849 },  -- undead skin
                { rate = 240, item = 849 },  -- undead skin
                { rate = 240, item = 849 },  -- undead skin
                { rate = 150, item = 16969 },  -- onikiri
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Impish Bats',
            ids    = { 156, 157, 158, 159, 179, 180, 188, 193, 198, 199, 200, 221, 222, 223, 224, 225 },
            levels = {
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 53 },
                [60] = { acc = 234, eva = 223, agi = 67, int = 47, mnd = 47, chr = 53 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Stygian Pugil',
            ids    = { 168, 169, 170, 171, 172, 173, 174, 175, 234, 235, 236, 237, 238, 239, 240, 241, 245, 246,
                       247, 248, 295, 296 },
            levels = {
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 52 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 52 },
                [65] = { acc = 261, eva = 250, agi = 72, int = 52, mnd = 52, chr = 55 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cutlass Scorpion AC',
            ids    = { 176, 177, 178, 187, 209, 233 },
            levels = {
                [64] = { acc = 254, eva = 243, agi = 68, int = 50, mnd = 50, chr = 56 },
                [65] = { acc = 259, eva = 248, agi = 68, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 265, eva = 253, agi = 70, int = 52, mnd = 52, chr = 58 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mousse',
            ids    = { 189, 190, 191, 252, 253, 254 },
            levels = {
                [63] = { acc = 250, eva = 235, agi = 63, int = 49, mnd = 53, chr = 55 },
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 54, chr = 56 },
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 240, item = 637 },  -- vial of slime oil
                { rate = 150, item = 637 },  -- vial of slime oil
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Stygian Pugil',
            ids    = { 210, 211, 212, 213, 214, 215, 216, 217, 255, 256, 257, 264, 265, 266, 267, 268, 269, 270,
                       271 },
            levels = {
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 47 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 50 },
                [59] = { acc = 229, eva = 218, agi = 67, int = 47, mnd = 47, chr = 50 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Hinge Oil',
            ids    = { 226, 227, 228, 229 },
            levels = {
                [65] = { acc = 261, eva = 246, agi = 65, int = 52, mnd = 56, chr = 58 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Dire Bat UDT TC SSG',
            ids    = { 297, 298, 312, 313, 314, 315 },
            levels = {
                [62] = { acc = 245, eva = 234, agi = 70, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 239, agi = 70, int = 49, mnd = 49, chr = 55 },
                [64] = { acc = 256, eva = 245, agi = 72, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 1057 },  -- toraimarai coffer key
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Doom Mage TC',
            ids    = { 299, 300, 303, 304 },
            levels = {
                [65] = { acc = 263, eva = 227, agi = 68, int = 80, mnd = 55, chr = 62 },
                [66] = { acc = 269, eva = 233, agi = 70, int = 80, mnd = 55, chr = 62 },
                [67] = { acc = 273, eva = 237, agi = 71, int = 83, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 1057 },  -- toraimarai coffer key
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Doom Soldier TC',
            ids    = { 301, 302, 305, 306 },
            levels = {
                [65] = { acc = 263, eva = 245, agi = 62, int = 68, mnd = 43, chr = 46 },
                [66] = { acc = 269, eva = 249, agi = 62, int = 70, mnd = 44, chr = 47 },
                [67] = { acc = 273, eva = 255, agi = 65, int = 71, mnd = 44, chr = 48 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 1433 },  -- dark knights testimony
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 10, item = 1057 },  -- toraimarai coffer key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Starmite',
            ids    = { 316, 317, 318, 319, 320 },
            levels = {
                [65] = { acc = 258, eva = 235, agi = 43, int = 43, mnd = 65, chr = 65 },
                [66] = { acc = 263, eva = 240, agi = 44, int = 44, mnd = 67, chr = 67 },
                [67] = { acc = 267, eva = 245, agi = 44, int = 44, mnd = 67, chr = 67 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 240, item = 846 },  -- insect wing
                { rate = 100, item = 906 },  -- starmite shell
                { rate = 50, item = 894 },  -- beetle jaw
                { rate = 10, item = 1057 },  -- toraimarai coffer key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Mimic',
            ids    = { 321 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1057 },  -- toraimarai coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
    },
    by_name = {},
}
