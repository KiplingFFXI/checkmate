-- Labyrinth of Onzozo (zone 213).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblin Trader', 'Mysticmaker Profblix', 'Soulstealer Skullnix' },
        },
        [2] = { sound = { 'Labyrinth Leech' } },
        [3] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Mysticmaker Profblix', 'Soulstealer Skullnix' },
        },
        [4] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblin Trader', 'Soulstealer Skullnix' },
        },
        [5] = {
            sight = { 'Goblin Alchemist', 'Goblin Bandit', 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter',
                      'Goblin Mercenary', 'Goblin Miner', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblin Trader', 'Mysticmaker Profblix' },
        },
    },
    monsters = {
        {
            name   = 'Goblin Poacher',
            ids    = { 1, 12 },
            levels = {
                [46] = { acc = 187, eva = 145, agi = 59, int = 40, mnd = 42, chr = 40 },
                [47] = { acc = 191, eva = 149, agi = 60, int = 41, mnd = 45, chr = 41 },
                [48] = { acc = 194, eva = 151, agi = 60, int = 42, mnd = 45, chr = 42 },
                [49] = { acc = 197, eva = 155, agi = 62, int = 42, mnd = 45, chr = 42 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Robber',
            ids    = { 2, 15 },
            levels = {
                [46] = { acc = 171, eva = 191, agi = 56, int = 48, mnd = 34, chr = 34 },
                [47] = { acc = 175, eva = 194, agi = 56, int = 49, mnd = 35, chr = 35 },
                [48] = { acc = 178, eva = 198, agi = 58, int = 50, mnd = 35, chr = 35 },
                [49] = { acc = 182, eva = 201, agi = 59, int = 52, mnd = 35, chr = 35 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 3, 16 },
            levels = {
                [46] = { acc = 168, eva = 154, agi = 46, int = 48, mnd = 34, chr = 34 },
                [47] = { acc = 171, eva = 157, agi = 48, int = 49, mnd = 35, chr = 35 },
                [48] = { acc = 175, eva = 160, agi = 48, int = 50, mnd = 35, chr = 35 },
                [49] = { acc = 179, eva = 163, agi = 49, int = 52, mnd = 35, chr = 35 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            drops  = {
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Labyrinth Leech',
            ids    = { 4, 5, 6, 8, 9 },
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 39, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 40, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 40, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 161, agi = 50, int = 40, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 240, item = 2014 },  -- vial of bird blood
                { rate = 150, item = 2014 },  -- vial of bird blood
                { rate = 150, item = 2014 },  -- vial of bird blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            links  = 2,
        },
        {
            name   = 'Air Elemental',
            ids    = { 7, 49, 61, 85, 117, 124, 143, 194 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60 },
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
            name   = 'Cockatrice',
            ids    = { 10, 11, 17, 18, 20, 21, 22, 23, 27, 28, 32, 33, 34, 35, 36, 38, 41, 45, 70, 72, 74, 76, 77,
                       83 },
            levels = {
                [50] = { acc = 178, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 185, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 190, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 195, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = 2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = 2, gravity = -3 },
            drops  = {
                { rate = 150, item = 4435 },  -- slice of cockatrice meat
                { rate = 100, item = 854 },  -- cockatrice skin
                { rate = 50, item = 1056 },  -- onzozo chest key
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Trader',
            ids    = { 13 },
            levels = {
                [46] = { acc = 168, eva = 151, agi = 40, int = 40, mnd = 40, chr = 55 },
                [47] = { acc = 171, eva = 153, agi = 40, int = 41, mnd = 41, chr = 57 },
                [48] = { acc = 175, eva = 156, agi = 40, int = 42, mnd = 42, chr = 57 },
                [49] = { acc = 179, eva = 160, agi = 42, int = 42, mnd = 42, chr = 58 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 15 },
            drops  = {
                { rate = 1, item = 828 },  -- square of velvet cloth
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblins Leech',
            ids    = { 14, 169, 175, 180 },
            levels = {
                [33] = { acc = 119, eva = 111, agi = 34, int = 28, mnd = 26, chr = 29 },
                [34] = { acc = 123, eva = 115, agi = 36, int = 29, mnd = 26, chr = 29 },
                [35] = { acc = 126, eva = 118, agi = 36, int = 30, mnd = 27, chr = 30 },
                [49] = { acc = 176, eva = 165, agi = 52, int = 42, mnd = 38, chr = 42 },
                [50] = { acc = 180, eva = 169, agi = 54, int = 44, mnd = 41, chr = 45 },
            },
            spawn_levels = { [14] = { 33, 35 }, [169] = { 49, 50 }, [175] = { 49, 50 }, [180] = { 49, 50 } },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            links  = 2,
        },
        {
            name   = 'Mushussu LO',
            ids    = { 19, 37, 50, 51, 64, 71, 73, 75, 78, 79, 80, 81, 82, 92, 93 },
            levels = {
                [51] = { acc = 185, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 190, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 195, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 200, eva = 190, agi = 58, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 206, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 212, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 217, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50 },
            },
            spawn_levels = { [19] = { 51, 54 }, [37] = { 52, 55 }, [50] = { 52, 55 }, [51] = { 52, 55 },
                             [64] = { 52, 55 }, [71] = { 51, 54 }, [73] = { 51, 54 }, [75] = { 51, 54 },
                             [78] = { 51, 54 }, [79] = { 51, 54 }, [80] = { 51, 54 }, [81] = { 51, 54 },
                             [82] = { 51, 54 }, [92] = { 54, 57 }, [93] = { 54, 57 } },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 150, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 50, item = 1056 },  -- onzozo chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Miner',
            ids    = { 24, 39, 48, 54, 58, 62, 65, 86, 90, 103, 107, 130, 136, 137 },
            levels = {
                [51] = { acc = 193, eva = 224, agi = 63, int = 56, mnd = 38, chr = 38 },
                [52] = { acc = 198, eva = 229, agi = 63, int = 56, mnd = 38, chr = 38 },
                [53] = { acc = 204, eva = 235, agi = 64, int = 57, mnd = 39, chr = 39 },
                [54] = { acc = 209, eva = 240, agi = 65, int = 58, mnd = 39, chr = 39 },
                [55] = { acc = 216, eva = 246, agi = 67, int = 58, mnd = 39, chr = 39 },
                [56] = { acc = 221, eva = 252, agi = 68, int = 61, mnd = 41, chr = 41 },
                [57] = { acc = 227, eva = 257, agi = 69, int = 61, mnd = 41, chr = 41 },
                [58] = { acc = 232, eva = 262, agi = 69, int = 61, mnd = 41, chr = 41 },
            },
            spawn_levels = { [24] = { 51, 54 }, [39] = { 51, 54 }, [48] = { 52, 55 }, [54] = { 53, 56 },
                             [58] = { 53, 56 }, [62] = { 53, 56 }, [65] = { 53, 56 }, [86] = { 53, 56 },
                             [90] = { 53, 56 }, [103] = { 55, 58 }, [107] = { 55, 58 }, [130] = { 54, 57 },
                             [136] = { 55, 58 }, [137] = { 55, 58 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { gravity = 15 },
            drops  = {
                { rate = 100, item = 605 },  -- pickaxe
                { rate = 50, item = 17314 },  -- quake grenade
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 10, item = 737 },  -- chunk of gold ore
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Bouncer',
            ids    = { 25, 40, 55, 59, 63, 69, 84, 89, 101, 112, 127, 134, 139 },
            levels = {
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47, resist = { virus = 15 } },
                [53] = { acc = 199, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [54] = { acc = 205, eva = 192, agi = 62, int = 43, mnd = 43, chr = 48, resist = { virus = 15 } },
                [55] = { acc = 210, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49, resist = { virus = 20 } },
                [56] = { acc = 216, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50, resist = { virus = 20 } },
                [57] = { acc = 222, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50, resist = { virus = 20 } },
                [58] = { acc = 227, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52, resist = { virus = 20 } },
            },
            spawn_levels = { [25] = { 51, 54 }, [40] = { 51, 54 }, [55] = { 53, 56 }, [59] = { 53, 56 },
                             [63] = { 53, 56 }, [69] = { 53, 56 }, [84] = { 53, 56 }, [89] = { 53, 56 },
                             [101] = { 55, 58 }, [112] = { 55, 58 }, [127] = { 54, 57 }, [134] = { 55, 58 },
                             [139] = { 55, 58 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Hunter',
            ids    = { 26, 31, 43, 53, 57, 68, 87, 100, 111, 128, 129, 141, 142 },
            levels = {
                [51] = { acc = 221, eva = 164, agi = 69, int = 47, mnd = 50, chr = 47 },
                [52] = { acc = 226, eva = 169, agi = 69, int = 47, mnd = 50, chr = 47 },
                [53] = { acc = 232, eva = 174, agi = 70, int = 48, mnd = 52, chr = 48 },
                [54] = { acc = 237, eva = 179, agi = 71, int = 48, mnd = 52, chr = 48 },
                [55] = { acc = 242, eva = 184, agi = 73, int = 49, mnd = 52, chr = 49 },
                [56] = { acc = 248, eva = 190, agi = 74, int = 50, mnd = 55, chr = 50 },
                [57] = { acc = 254, eva = 194, agi = 75, int = 50, mnd = 55, chr = 50 },
                [58] = { acc = 259, eva = 199, agi = 75, int = 52, mnd = 55, chr = 52 },
            },
            spawn_levels = { [26] = { 51, 54 }, [31] = { 51, 54 }, [43] = { 52, 55 }, [53] = { 53, 56 },
                             [57] = { 53, 56 }, [68] = { 53, 56 }, [87] = { 53, 56 }, [100] = { 55, 58 },
                             [111] = { 55, 58 }, [128] = { 56, 58 }, [129] = { 54, 57 }, [141] = { 54, 57 },
                             [142] = { 54, 57 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 1, item = 12444 },  -- raptor helm
                { rate = 1, item = 12700 },  -- raptor gloves
                { rate = 1, item = 12828 },  -- raptor trousers
                { rate = 1, item = 12956 },  -- raptor ledelsens
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Mysticmaker Profblix',
            ids    = { 29 },
            nm     = true,
            levels = {
                [50] = { acc = 183, eva = 154, agi = 57, int = 63, mnd = 45, chr = 50 },
                [51] = { acc = 189, eva = 160, agi = 60, int = 65, mnd = 47, chr = 50 },
                [52] = { acc = 194, eva = 165, agi = 60, int = 65, mnd = 47, chr = 50 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 510 },  -- goblin armor
                { rate = 1000, item = 511 },  -- goblin mask
                { rate = 150, item = 14724 },  -- moldavite earring
                { rate = 1000, group = {  -- one of
                    { 4774, 4500 },  -- scroll of thunder iii
                    { 4804, 2500 },  -- scroll of thundaga iii
                    { 4775, 2000 },  -- scroll of thunder iv
                    { 4820, 1000 },  -- scroll of burst
                } },
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Goblin Enchanter',
            ids    = { 30, 42, 46, 52, 56, 60, 88, 104, 108, 135, 138, 140 },
            levels = {
                [51] = { acc = 186, eva = 165, agi = 51, int = 56, mnd = 56, chr = 50 },
                [52] = { acc = 191, eva = 170, agi = 51, int = 56, mnd = 56, chr = 50 },
                [53] = { acc = 197, eva = 175, agi = 51, int = 57, mnd = 57, chr = 52 },
                [54] = { acc = 202, eva = 180, agi = 52, int = 58, mnd = 58, chr = 52 },
                [55] = { acc = 207, eva = 185, agi = 53, int = 58, mnd = 58, chr = 52 },
                [56] = { acc = 213, eva = 191, agi = 54, int = 61, mnd = 61, chr = 55 },
                [57] = { acc = 219, eva = 195, agi = 54, int = 61, mnd = 61, chr = 55 },
                [58] = { acc = 224, eva = 201, agi = 56, int = 61, mnd = 61, chr = 55 },
            },
            spawn_levels = { [30] = { 51, 54 }, [42] = { 52, 55 }, [46] = { 52, 55 }, [52] = { 53, 56 },
                             [56] = { 53, 56 }, [60] = { 53, 56 }, [88] = { 53, 56 }, [104] = { 55, 58 },
                             [108] = { 55, 58 }, [135] = { 54, 57 }, [138] = { 54, 57 }, [140] = { 54, 57 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 20 },
            drops  = {
                { rate = 50, item = 1056 },  -- onzozo chest key
                { rate = 10, item = 650 },  -- brass ingot
                { rate = 10, item = 744 },  -- silver ingot
                { rate = 5, item = 745 },  -- gold ingot
                { rate = 5, item = 746 },  -- platinum ingot
                { rate = 1, item = 12739 },  -- black mitts
                { rate = 1, item = 12867 },  -- white slacks
                { rate = 1, item = 12995 },  -- moccasins
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Flying Manta',
            ids    = { 44, 47, 66, 91, 94, 95, 96, 98, 99, 102, 105, 106, 109, 110, 132, 144 },
            levels = {
                [55] = { acc = 206, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 212, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 217, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 222, eva = 210, agi = 61, int = 46, mnd = 46, chr = 52 },
                [59] = { acc = 228, eva = 216, agi = 63, int = 47, mnd = 47, chr = 53 },
            },
            ph_for = { [66] = { 67 }, [96] = { 97 } },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 876 },  -- manta skin
                { rate = 100, item = 888 },  -- seashell
                { rate = 50, item = 4484 },  -- shall shell
                { rate = 10, item = 1056 },  -- onzozo chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lord of Onzozo',
            ids    = { 67 },
            nm     = true,
            levels = {
                [74] = { acc = 307, eva = 295, agi = 77, int = 68, mnd = 60, chr = 66 },
                [75] = { acc = 313, eva = 300, agi = 77, int = 69, mnd = 60, chr = 67 },
                [76] = { acc = 319, eva = 306, agi = 80, int = 70, mnd = 61, chr = 68 },
                [77] = { acc = 324, eva = 311, agi = 80, int = 71, mnd = 62, chr = 68 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 10, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 4484 },  -- shall shell
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 50, item = 18852 },  -- octave club
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Peg Powler',
            ids    = { 97 },
            nm     = true,
            levels = {
                [61] = { acc = 238, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 243, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = 10, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep' },
            drops  = {
                { rate = 1000, item = 16728 },  -- schwarz axt
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 150, item = 4484 },  -- shall shell
                { rate = 150, item = 792 },  -- pearl
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 113, 121, 145, 164, 166, 171, 177, 182, 195 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
                [61] = { acc = 239, eva = 218, agi = 62, int = 73, mnd = 59, chr = 60 },
                [62] = { acc = 244, eva = 223, agi = 62, int = 73, mnd = 59, chr = 60 },
            },
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
            name   = 'Torama',
            ids    = { 114, 115, 116, 118, 122, 125, 147, 148, 149, 150, 151, 152, 153, 155, 156, 159, 160 },
            levels = {
                [70] = { acc = 289, eva = 274, agi = 73, int = 59, mnd = 51, chr = 61 },
                [71] = { acc = 296, eva = 279, agi = 75, int = 60, mnd = 52, chr = 63 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 60, mnd = 52, chr = 63 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 62, mnd = 54, chr = 64 },
            },
            ph_for = { [153] = { 158 }, [156] = { 158 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 50, item = 927 },  -- coeurl whisker
                { rate = 100, item = 1591 },  -- high-quality coeurl hide
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Labyrinth Manticore',
            ids    = { 119, 123, 126, 157, 162, 185 },
            levels = {
                [71] = { acc = 292, eva = 278, agi = 72, int = 55, mnd = 55, chr = 55 },
                [72] = { acc = 297, eva = 283, agi = 72, int = 55, mnd = 55, chr = 55 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 58, mnd = 58, chr = 56 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 58, mnd = 58, chr = 56 },
            },
            ph_for = { [119] = { 120 }, [123] = { 120 } },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Narasimha',
            ids    = { 120 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 299, agi = 74, int = 58, mnd = 58, chr = 57 },
                [76] = { acc = 319, eva = 304, agi = 76, int = 59, mnd = 59, chr = 57 },
                [77] = { acc = 324, eva = 309, agi = 76, int = 60, mnd = 60, chr = 58 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 240, item = 1163 },  -- lock of manticore hair
                { rate = 1000, item = 1293 },  -- narasimha hide
                { rate = 150, item = 1293 },  -- narasimha hide
                { rate = 240, item = 1123 },  -- manticore fang
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 150, item = 1123 },  -- manticore fang
                { rate = 100, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1163 },  -- lock of manticore hair
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Hellion',
            ids    = { 131 },
            nm     = true,
            levels = {
                [66] = { acc = 267, eva = 253, agi = 70, int = 52, mnd = 49, chr = 63 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 18041 },  -- a loutrance
                { rate = 240, item = 849 },  -- undead skin
                { rate = 150, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Tainted Flesh LoO',
            ids    = { 133, 146 },
            levels = {
                [60] = { acc = 234, eva = 221, agi = 63, int = 47, mnd = 44, chr = 57 },
                [61] = { acc = 240, eva = 227, agi = 66, int = 49, mnd = 46, chr = 59 },
                [62] = { acc = 245, eva = 232, agi = 66, int = 49, mnd = 46, chr = 59 },
                [63] = { acc = 250, eva = 237, agi = 66, int = 49, mnd = 46, chr = 59 },
            },
            ph_for = { [133] = { 131 } },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Soulstealer Skullnix',
            ids    = { 154 },
            nm     = true,
            levels = {
                [69] = { acc = 292, eva = 324, agi = 82, int = 72, mnd = 48, chr = 48 },
                [70] = { acc = 297, eva = 342, agi = 83, int = 73, mnd = 49, chr = 49 },
                [71] = { acc = 303, eva = 348, agi = 84, int = 75, mnd = 51, chr = 51 },
                [72] = { acc = 308, eva = 353, agi = 84, int = 75, mnd = 51, chr = 51 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { gravity = 20 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 510 },  -- goblin armor
                { rate = 1000, item = 511 },  -- goblin mask
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 17982 },  -- kard
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Ose',
            ids    = { 158 },
            nm     = true,
            levels = {
                [74] = { acc = 314, eva = 360, agi = 79, int = 69, mnd = 52, chr = 60 },
                [75] = { acc = 319, eva = 365, agi = 79, int = 69, mnd = 53, chr = 61 },
                [76] = { acc = 325, eva = 371, agi = 81, int = 71, mnd = 53, chr = 62 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 1283 },  -- ose whisker
                { rate = 240, item = 1591 },  -- high-quality coeurl hide
                { rate = 240, item = 4377 },  -- slice of coeurl meat
                { rate = 150, item = 13805 },  -- assault jerkin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 161, 165, 172 },
            levels = {
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
                [69] = { acc = 277, eva = 243, agi = 65, int = 60, mnd = 84, chr = 72 },
            },
            ph_for = { [165] = { 154 } },
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
            links  = 1,
        },
        {
            name   = 'Wyvern',
            ids    = { 163 },
            levels = {
                [72] = { acc = 301, eva = 284, agi = 75, int = 63, mnd = 52, chr = 60 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 66, mnd = 54, chr = 60 },
                [74] = { acc = 312, eva = 295, agi = 77, int = 66, mnd = 54, chr = 60 },
                [75] = { acc = 317, eva = 300, agi = 77, int = 67, mnd = 55, chr = 62 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Goblin Bandit',
            ids    = { 167, 173, 178 },
            levels = {
                [66] = { acc = 276, eva = 307, agi = 79, int = 70, mnd = 47, chr = 47 },
                [67] = { acc = 281, eva = 312, agi = 79, int = 71, mnd = 48, chr = 48 },
                [68] = { acc = 286, eva = 318, agi = 81, int = 71, mnd = 48, chr = 48 },
                [69] = { acc = 292, eva = 324, agi = 82, int = 72, mnd = 48, chr = 48 },
            },
            ph_for = { [173] = { 154 } },
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
            links  = 1,
        },
        {
            name   = 'Goblin Shepherd',
            ids    = { 168, 174, 179 },
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
                { rate = 240, item = 17088 },  -- ash staff
                { rate = 150, item = 859 },  -- ram skin
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 50, item = 17865 },  -- jug of singing herbal broth
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 170, 176, 181, 184 },
            levels = {
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 286, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
            },
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
            links  = 1,
        },
        {
            name   = 'Ubume',
            ids    = { 196 },
            nm     = true,
            levels = {
                [54] = { acc = 203, eva = 189, agi = 57, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            immune = { 'dark_sleep', 'terror' },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Megapod Megalops',
            ids    = { 197 },
            nm     = true,
            levels = {
                [80] = { acc = 335, eva = 311, agi = 51, int = 55, mnd = 82, chr = 82 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Voso',
            ids    = { 198, 199, 200 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
