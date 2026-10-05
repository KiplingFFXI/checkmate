-- Castle Zvahl Keep (zone 162).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Baron Vapula', 'Baronet Romwe', 'Count Bifrons', 'Demon Knight', 'Demon Pawn', 'Demon Warlock',
                'Demon Wizard', 'Viscount Morax' },
        [2] = { 'Deadly Iris', 'Evil Eye', 'Morbid Eye' },
        [3] = { 'Goblin Bouncer', 'Goblin Enchanter', 'Goblin Hunter', 'Goblin Poacher', 'Goblin Reaper',
                'Goblin Robber', 'Goblin Trader' },
        [4] = { 'Orcish Bowshooter', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Predator', 'Orcish Trooper',
                'Orcish Veteran', 'Orcish Warchief', 'Orcish Zerker' },
        [5] = { 'Elder Quadav', 'Emerald Quadav', 'Gold Quadav', 'Iron Quadav', 'Mythril Quadav', 'Spinel Quadav',
                'Steel Quadav', 'Topaz Quadav' },
        [6] = { 'Yagudo Abbot', 'Yagudo Chanter', 'Yagudo Conquistador', 'Yagudo Inquisitor', 'Yagudo Lutenist',
                'Yagudo Prior', 'Yagudo Sentinel', 'Yagudo Zealot' },
        [7] = { 'Baronet Romwe', 'Count Bifrons', 'Demon Knight', 'Demon Pawn', 'Demon Warlock', 'Demon Wizard',
                'Viscount Morax' },
        [8] = { 'Baron Vapula', 'Baronet Romwe', 'Demon Knight', 'Demon Pawn', 'Demon Warlock', 'Demon Wizard',
                'Viscount Morax' },
        [9] = { 'Baron Vapula', 'Baronet Romwe', 'Count Bifrons', 'Demon Knight', 'Demon Pawn', 'Demon Warlock',
                'Demon Wizard' },
        [10] = { 'Baron Vapula', 'Count Bifrons', 'Demon Knight', 'Demon Pawn', 'Demon Warlock', 'Demon Wizard',
                 'Viscount Morax' },
    },
    monsters = {
        {
            name   = 'Demon Pawn',
            ids    = { 1, 183, 184, 185, 190, 197, 203, 210, 211, 212, 213, 214, 215, 216, 217, 221, 226, 235 },
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 45, mnd = 35, chr = 51 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 46, mnd = 37, chr = 51 },
                [54] = { acc = 204, eva = 190, agi = 58, int = 47, mnd = 37, chr = 52 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 47, mnd = 37, chr = 53 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 48, mnd = 37, chr = 54 },
            },
            spawn_levels = { [1] = { 52, 55 }, [183] = { 52, 55 }, [184] = { 52, 55 }, [185] = { 52, 55 },
                             [190] = { 52, 55 }, [197] = { 52, 55 }, [203] = { 52, 55 }, [210] = { 52, 55 },
                             [211] = { 52, 55 }, [212] = { 52, 55 }, [213] = { 52, 55 }, [214] = { 52, 55 },
                             [215] = { 52, 55 }, [216] = { 52, 55 }, [217] = { 52, 55 }, [221] = { 55, 56 },
                             [226] = { 55, 56 }, [235] = { 55, 56 } },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1537 },  -- behemoth leather missive
                { rate = 50, item = 1038 },  -- zvahl chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Evil Eye',
            ids    = { 2, 3, 4, 6, 8, 11, 107, 108, 109, 110, 179, 180, 181, 182 },
            levels = {
                [46] = { acc = 167, eva = 155, agi = 48, int = 45, mnd = 35, chr = 40 },
                [47] = { acc = 170, eva = 157, agi = 49, int = 45, mnd = 35, chr = 42 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 45, mnd = 36, chr = 43 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 921 },  -- bottle of ahriman tears
                { rate = 50, item = 557 },  -- ahriman lens
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 2,
        },
        {
            name   = 'Demon Wizard',
            ids    = { 5, 194, 196, 202, 222, 227, 236, 243 },
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 61, mnd = 39, chr = 53 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 62, mnd = 40, chr = 54 },
                [54] = { acc = 204, eva = 190, agi = 58, int = 63, mnd = 40, chr = 55 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 64, mnd = 41, chr = 55 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 65, mnd = 41, chr = 57 },
            },
            spawn_levels = { [5] = { 52, 55 }, [194] = { 52, 55 }, [196] = { 52, 55 }, [202] = { 52, 55 },
                             [222] = { 55, 56 }, [227] = { 55, 56 }, [236] = { 55, 56 }, [243] = { 55, 56 } },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1537 },  -- behemoth leather missive
                { rate = 50, item = 1038 },  -- zvahl chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Demon Knight',
            ids    = { 7, 191, 200, 204, 223, 228, 239, 242 },
            levels = {
                [52] = { acc = 193, eva = 176, agi = 50, int = 60, mnd = 32, chr = 42 },
                [53] = { acc = 198, eva = 182, agi = 52, int = 60, mnd = 33, chr = 42 },
                [54] = { acc = 204, eva = 187, agi = 52, int = 62, mnd = 33, chr = 43 },
                [55] = { acc = 209, eva = 192, agi = 52, int = 62, mnd = 33, chr = 43 },
                [56] = { acc = 215, eva = 197, agi = 55, int = 65, mnd = 34, chr = 45 },
            },
            spawn_levels = { [7] = { 52, 55 }, [191] = { 52, 55 }, [200] = { 52, 55 }, [204] = { 52, 55 },
                             [223] = { 55, 56 }, [228] = { 55, 56 }, [239] = { 55, 56 }, [242] = { 55, 56 } },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1537 },  -- behemoth leather missive
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Demon Warlock',
            ids    = { 9, 192, 198, 205, 224, 229, 237, 240 },
            levels = {
                [52] = { acc = 188, eva = 160, agi = 50, int = 63, mnd = 53, chr = 63 },
                [53] = { acc = 193, eva = 165, agi = 52, int = 64, mnd = 55, chr = 64 },
                [54] = { acc = 199, eva = 170, agi = 52, int = 65, mnd = 55, chr = 65 },
                [55] = { acc = 204, eva = 174, agi = 52, int = 67, mnd = 57, chr = 67 },
                [56] = { acc = 210, eva = 180, agi = 55, int = 68, mnd = 57, chr = 68 },
            },
            spawn_levels = { [9] = { 52, 55 }, [192] = { 52, 55 }, [198] = { 52, 55 }, [205] = { 52, 55 },
                             [224] = { 55, 56 }, [229] = { 55, 56 }, [237] = { 55, 56 }, [240] = { 55, 56 } },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 10, item = 4897 },  -- ice spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Demons Elemental',
            ids    = { 10, 193, 199, 206, 208, 225, 230, 238, 241 },
            levels = {
                [45] = { acc = 161, eva = 150, agi = 44, int = 44, mnd = 33, chr = 34 },
                [46] = { acc = 165, eva = 153, agi = 44, int = 45, mnd = 34, chr = 35 },
                [47] = { acc = 168, eva = 156, agi = 46, int = 46, mnd = 35, chr = 36 },
                [48] = { acc = 172, eva = 159, agi = 47, int = 46, mnd = 35, chr = 36 },
                [49] = { acc = 176, eva = 163, agi = 48, int = 47, mnd = 35, chr = 36 },
                [50] = { acc = 180, eva = 167, agi = 51, int = 50, mnd = 38, chr = 39 },
                [51] = { acc = 186, eva = 172, agi = 52, int = 51, mnd = 39, chr = 41 },
                [52] = { acc = 191, eva = 177, agi = 52, int = 51, mnd = 39, chr = 41 },
                [53] = { acc = 196, eva = 183, agi = 54, int = 52, mnd = 40, chr = 42 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Goblin Poacher',
            ids    = { 12, 17, 22, 27 },
            levels = {
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
            links  = 3,
        },
        {
            name   = 'Goblin Trader',
            ids    = { 13, 18, 23, 28 },
            levels = {
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
            name   = 'Goblins Bat',
            ids    = { 14, 19, 24, 29 },
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
        },
        {
            name   = 'Goblin Robber',
            ids    = { 15, 20, 25, 30 },
            levels = {
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
            links  = 3,
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 16, 21, 26, 31 },
            levels = {
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
            links  = 3,
        },
        {
            name   = 'Goblin Hunter',
            ids    = { 32, 35, 38, 41, 44, 47, 50, 53, 56 },
            levels = {
                [50] = { acc = 216, eva = 159, agi = 66, int = 45, mnd = 50, chr = 45 },
                [51] = { acc = 221, eva = 164, agi = 69, int = 47, mnd = 50, chr = 47 },
                [52] = { acc = 226, eva = 169, agi = 69, int = 47, mnd = 50, chr = 47 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 1, item = 12444 },  -- raptor helm
                { rate = 1, item = 12700 },  -- raptor gloves
                { rate = 1, item = 12828 },  -- raptor trousers
                { rate = 1, item = 12956 },  -- raptor ledelsens
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblin Bouncer',
            ids    = { 33, 36, 39, 42, 45, 48, 51, 54, 57 },
            levels = {
                [50] = { acc = 183, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Goblin Enchanter',
            ids    = { 34, 37, 40, 43, 46, 49, 52, 55, 58 },
            levels = {
                [50] = { acc = 181, eva = 160, agi = 48, int = 54, mnd = 54, chr = 50 },
                [51] = { acc = 186, eva = 165, agi = 51, int = 56, mnd = 56, chr = 50 },
                [52] = { acc = 191, eva = 170, agi = 51, int = 56, mnd = 56, chr = 50 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { petrify = 20 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
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
            links  = 3,
        },
        {
            name   = 'Orcish Bowshooter',
            ids    = { 59, 63, 67, 71, 75 },
            levels = {
                [47] = { acc = 191, eva = 160, agi = 55, int = 34, mnd = 40, chr = 44 },
                [48] = { acc = 195, eva = 164, agi = 56, int = 35, mnd = 41, chr = 45 },
                [49] = { acc = 199, eva = 168, agi = 58, int = 36, mnd = 41, chr = 46 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Footsoldier',
            ids    = { 60, 64, 68, 72, 76 },
            levels = {
                [47] = { acc = 171, eva = 157, agi = 49, int = 31, mnd = 34, chr = 44 },
                [48] = { acc = 175, eva = 161, agi = 50, int = 31, mnd = 35, chr = 45 },
                [49] = { acc = 179, eva = 165, agi = 52, int = 33, mnd = 36, chr = 46 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 1686 },  -- soiled letter
                { rate = 5, item = 12425 },  -- silver mask
                { rate = 5, item = 12681 },  -- silver mittens
                { rate = 5, item = 12809 },  -- silver hose
                { rate = 5, item = 12937 },  -- silver greaves
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Gladiator',
            ids    = { 61, 65, 69, 73, 77 },
            levels = {
                [47] = { acc = 172, eva = 158, agi = 40, int = 29, mnd = 40, chr = 44 },
                [48] = { acc = 176, eva = 161, agi = 41, int = 29, mnd = 41, chr = 45 },
                [49] = { acc = 180, eva = 165, agi = 43, int = 30, mnd = 41, chr = 46 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Trooper',
            ids    = { 62, 66, 70, 74, 78 },
            levels = {
                [47] = { acc = 168, eva = 152, agi = 38, int = 29, mnd = 43, chr = 50 },
                [48] = { acc = 172, eva = 155, agi = 39, int = 29, mnd = 44, chr = 50 },
                [49] = { acc = 176, eva = 159, agi = 40, int = 30, mnd = 45, chr = 52 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            drops  = {
                { rate = 100, item = 554 },  -- gold orcmask
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 1, item = 12416 },  -- sallet
                { rate = 1, item = 12672 },  -- gauntlets
                { rate = 1, item = 12800 },  -- cuisses
                { rate = 1, item = 12928 },  -- plate leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Veteran',
            ids    = { 79, 83, 87, 91, 95, 99, 103 },
            levels = {
                [50] = { acc = 183, eva = 169, agi = 54, int = 35, mnd = 38, chr = 48 },
                [51] = { acc = 189, eva = 174, agi = 56, int = 35, mnd = 39, chr = 51 },
                [52] = { acc = 194, eva = 179, agi = 56, int = 35, mnd = 39, chr = 51 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Predator',
            ids    = { 80, 84, 88, 92, 96, 100, 104 },
            levels = {
                [50] = { acc = 216, eva = 172, agi = 60, int = 38, mnd = 44, chr = 48 },
                [51] = { acc = 222, eva = 177, agi = 62, int = 39, mnd = 45, chr = 51 },
                [52] = { acc = 227, eva = 182, agi = 62, int = 39, mnd = 45, chr = 51 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Zerker',
            ids    = { 81, 85, 89, 93, 97, 101, 105 },
            levels = {
                [50] = { acc = 183, eva = 167, agi = 51, int = 44, mnd = 35, chr = 42 },
                [51] = { acc = 189, eva = 172, agi = 52, int = 45, mnd = 37, chr = 45 },
                [52] = { acc = 194, eva = 177, agi = 52, int = 45, mnd = 37, chr = 45 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 50, item = 4878 },  -- scroll of absorb-int
                { rate = 50, item = 4876 },  -- scroll of absorb-vit
                { rate = 50, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4860 },  -- scroll of stun
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Warchief',
            ids    = { 82, 86, 90, 94, 98, 102, 106 },
            levels = {
                [50] = { acc = 180, eva = 163, agi = 42, int = 32, mnd = 47, chr = 54 },
                [51] = { acc = 186, eva = 168, agi = 44, int = 33, mnd = 49, chr = 57 },
                [52] = { acc = 191, eva = 173, agi = 44, int = 33, mnd = 49, chr = 57 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Elder Quadav',
            ids    = { 111, 115, 119, 123, 127 },
            levels = {
                [47] = { acc = 171, eva = 157, agi = 49, int = 34, mnd = 37, chr = 41 },
                [48] = { acc = 175, eva = 161, agi = 50, int = 35, mnd = 37, chr = 42 },
                [49] = { acc = 179, eva = 165, agi = 52, int = 36, mnd = 38, chr = 42 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 1, item = 12416 },  -- sallet
                { rate = 1, item = 12672 },  -- gauntlets
                { rate = 1, item = 12800 },  -- cuisses
                { rate = 1, item = 12928 },  -- plate leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Iron Quadav',
            ids    = { 112, 116, 120, 124, 128 },
            levels = {
                [47] = { acc = 167, eva = 150, agi = 35, int = 32, mnd = 49, chr = 49 },
                [48] = { acc = 171, eva = 153, agi = 35, int = 33, mnd = 50, chr = 50 },
                [49] = { acc = 174, eva = 156, agi = 35, int = 33, mnd = 52, chr = 52 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { sleep = 15 },
            drops  = {
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 1, item = 12416 },  -- sallet
                { rate = 1, item = 12672 },  -- gauntlets
                { rate = 1, item = 12800 },  -- cuisses
                { rate = 1, item = 12928 },  -- plate leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Spinel Quadav',
            ids    = { 113, 117, 121, 125, 129 },
            levels = {
                [47] = { acc = 171, eva = 143, agi = 49, int = 54, mnd = 41, chr = 45 },
                [48] = { acc = 175, eva = 146, agi = 50, int = 55, mnd = 42, chr = 45 },
                [49] = { acc = 179, eva = 150, agi = 52, int = 56, mnd = 42, chr = 45 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 5, item = 12475 },  -- velvet hat
                { rate = 5, item = 12731 },  -- velvet cuffs
                { rate = 5, item = 12859 },  -- velvet slops
                { rate = 5, item = 12987 },  -- ebony sabots
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Emerald Quadav',
            ids    = { 114, 118, 122, 126, 130 },
            levels = {
                [47] = { acc = 169, eva = 148, agi = 41, int = 46, mnd = 49, chr = 45 },
                [48] = { acc = 172, eva = 151, agi = 42, int = 48, mnd = 50, chr = 45 },
                [49] = { acc = 175, eva = 154, agi = 42, int = 50, mnd = 52, chr = 45 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { petrify = 15 },
            drops  = {
                { rate = 50, item = 1685 },  -- bottle of warding oil
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Steel Quadav',
            ids    = { 131, 135, 139, 143 },
            levels = {
                [50] = { acc = 180, eva = 163, agi = 42, int = 35, mnd = 50, chr = 51 },
                [51] = { acc = 186, eva = 168, agi = 44, int = 37, mnd = 51, chr = 53 },
                [52] = { acc = 191, eva = 173, agi = 44, int = 37, mnd = 51, chr = 53 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 4720 },  -- scroll of flash
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Mythril Quadav',
            ids    = { 132, 136, 140, 144 },
            levels = {
                [50] = { acc = 183, eva = 167, agi = 51, int = 47, mnd = 38, chr = 39 },
                [51] = { acc = 189, eva = 172, agi = 52, int = 49, mnd = 39, chr = 41 },
                [52] = { acc = 194, eva = 177, agi = 52, int = 49, mnd = 39, chr = 41 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { paralyze = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
                { rate = 10, item = 4878 },  -- scroll of absorb-int
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Gold Quadav',
            ids    = { 133, 137, 141, 145 },
            levels = {
                [50] = { acc = 186, eva = 216, agi = 57, int = 47, mnd = 38, chr = 39 },
                [51] = { acc = 192, eva = 222, agi = 58, int = 49, mnd = 39, chr = 41 },
                [52] = { acc = 197, eva = 227, agi = 58, int = 49, mnd = 39, chr = 41 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 15, gravity = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 5, item = 12450 },  -- padded cap
                { rate = 5, item = 12706 },  -- iron mittens
                { rate = 5, item = 12836 },  -- iron subligar
                { rate = 5, item = 12962 },  -- leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Topaz Quadav',
            ids    = { 134, 138, 142, 146 },
            levels = {
                [50] = { acc = 178, eva = 166, agi = 48, int = 41, mnd = 56, chr = 51 },
                [51] = { acc = 184, eva = 171, agi = 50, int = 43, mnd = 57, chr = 53 },
                [52] = { acc = 189, eva = 176, agi = 50, int = 43, mnd = 57, chr = 53 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 50, item = 1114 },  -- vial of quadav mage blood
                { rate = 100, item = 4743 },  -- scroll of reraise
                { rate = 1, item = 12739 },  -- black mitts
                { rate = 1, item = 12867 },  -- white slacks
                { rate = 1, item = 12995 },  -- moccasins
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Yagudo Zealot',
            ids    = { 147, 151, 155, 159, 163 },
            levels = {
                [47] = { acc = 172, eva = 158, agi = 40, int = 35, mnd = 42, chr = 44 },
                [48] = { acc = 176, eva = 161, agi = 40, int = 35, mnd = 43, chr = 45 },
                [49] = { acc = 179, eva = 165, agi = 42, int = 35, mnd = 43, chr = 46 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Conquistador',
            ids    = { 148, 152, 156, 160, 164 },
            levels = {
                [47] = { acc = 172, eva = 172, agi = 56, int = 45, mnd = 32, chr = 40 },
                [48] = { acc = 176, eva = 176, agi = 58, int = 45, mnd = 33, chr = 40 },
                [49] = { acc = 179, eva = 179, agi = 59, int = 45, mnd = 33, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 15 },
            drops  = {
                { rate = 50, item = 17302 },  -- juji shuriken
                { rate = 10, item = 4941 },  -- scroll of raiton ni
                { rate = 10, item = 4944 },  -- scroll of suiton ni
                { rate = 10, item = 4929 },  -- scroll of katon ni
                { rate = 10, item = 4932 },  -- scroll of hyoton ni
                { rate = 10, item = 4935 },  -- scroll of huton ni
                { rate = 10, item = 4938 },  -- scroll of doton ni
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Lutenist',
            ids    = { 149, 153, 157, 161, 165 },
            levels = {
                [47] = { acc = 168, eva = 148, agi = 40, int = 45, mnd = 42, chr = 56 },
                [48] = { acc = 171, eva = 150, agi = 40, int = 45, mnd = 43, chr = 58 },
                [49] = { acc = 174, eva = 154, agi = 42, int = 45, mnd = 43, chr = 59 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 20 },
            drops  = {
                { rate = 50, item = 5008 },  -- scroll of blade madrigal
                { rate = 10, item = 5012 },  -- scroll of dragonfoe mambo
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Prior',
            ids    = { 150, 154, 158, 162, 166 },
            levels = {
                [47] = { acc = 170, eva = 145, agi = 52, int = 57, mnd = 38, chr = 48 },
                [48] = { acc = 173, eva = 147, agi = 53, int = 57, mnd = 40, chr = 48 },
                [49] = { acc = 178, eva = 152, agi = 56, int = 58, mnd = 40, chr = 49 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 1, item = 12739 },  -- black mitts
                { rate = 1, item = 12867 },  -- white slacks
                { rate = 1, item = 12995 },  -- moccasins
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Sentinel',
            ids    = { 167, 171, 175 },
            levels = {
                [50] = { acc = 183, eva = 171, agi = 48, int = 38, mnd = 44, chr = 48 },
                [51] = { acc = 189, eva = 176, agi = 50, int = 39, mnd = 45, chr = 51 },
                [52] = { acc = 194, eva = 181, agi = 50, int = 39, mnd = 45, chr = 51 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 5, item = 12443 },  -- cuir bandana
                { rate = 5, item = 12699 },  -- cuir gloves
                { rate = 5, item = 12827 },  -- cuir trousers
                { rate = 5, item = 12955 },  -- cuir highboots
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Chanter',
            ids    = { 168, 172, 176 },
            levels = {
                [50] = { acc = 180, eva = 166, agi = 48, int = 47, mnd = 44, chr = 57 },
                [51] = { acc = 186, eva = 171, agi = 50, int = 47, mnd = 45, chr = 59 },
                [52] = { acc = 191, eva = 176, agi = 50, int = 47, mnd = 45, chr = 59 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 20, virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 10, item = 4980 },  -- scroll of foe requiem v
                { rate = 50, item = 5020 },  -- scroll of gold capriccio
                { rate = 10, item = 5030 },  -- scroll of carnage elegy
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Inquisitor',
            ids    = { 169, 173, 177 },
            levels = {
                [50] = { acc = 181, eva = 174, agi = 54, int = 44, mnd = 41, chr = 51 },
                [51] = { acc = 188, eva = 179, agi = 56, int = 45, mnd = 43, chr = 53 },
                [52] = { acc = 193, eva = 184, agi = 56, int = 45, mnd = 43, chr = 53 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { blind = 20, virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 1, item = 12444 },  -- raptor helm
                { rate = 1, item = 12700 },  -- raptor gloves
                { rate = 1, item = 12828 },  -- raptor trousers
                { rate = 1, item = 12956 },  -- raptor ledelsens
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Yagudo Abbot',
            ids    = { 170, 174, 178 },
            levels = {
                [50] = { acc = 177, eva = 167, agi = 51, int = 44, mnd = 53, chr = 54 },
                [51] = { acc = 183, eva = 173, agi = 54, int = 45, mnd = 55, chr = 57 },
                [52] = { acc = 188, eva = 178, agi = 54, int = 45, mnd = 55, chr = 57 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 150, item = 1097 },  -- canteen of yagudo holy water
                { rate = 10, item = 4743 },  -- scroll of reraise
                { rate = 5, item = 12611 },  -- white cloak
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Morbid Eye',
            ids    = { 186, 187, 188, 189 },
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 53, mnd = 41, chr = 48 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 54, mnd = 42, chr = 49 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 50, item = 935 },  -- ahriman wing
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 2,
        },
        {
            name   = 'Baron Vapula',
            ids    = { 195 },
            nm     = true,
            levels = {
                [68] = { acc = 278, eva = 242, agi = 71, int = 87, mnd = 52, chr = 69 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 150, item = 902 },  -- demon horn
                { rate = 150, item = 4803 },  -- scroll of thundaga ii
                { rate = 150, item = 886 },  -- demon skull
                { rate = 150, item = 4794 },  -- scroll of aeroga iii
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Count Bifrons',
            ids    = { 201 },
            nm     = true,
            levels = {
                [68] = { acc = 278, eva = 260, agi = 65, int = 75, mnd = 40, chr = 52 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 240, item = 902 },  -- demon horn
                { rate = 100, item = 16792 },  -- goshishos scythe
                { rate = 150, item = 886 },  -- demon skull
                { rate = 150, item = 4875 },  -- scroll of absorb-dex
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Viscount Morax',
            ids    = { 207 },
            nm     = true,
            levels = {
                [68] = { acc = 273, eva = 239, agi = 65, int = 81, mnd = 69, chr = 81 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 150, item = 886 },  -- demon skull
                { rate = 150, item = 902 },  -- demon horn
                { rate = 100, item = 4903 },  -- dark spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Demons Avatar',
            ids    = { 209 },
            levels = {
                [42] = { acc = 151, eva = 128, agi = 44, int = 51, mnd = 37, chr = 40 },
                [43] = { acc = 154, eva = 131, agi = 44, int = 53, mnd = 38, chr = 40 },
                [44] = { acc = 158, eva = 134, agi = 47, int = 54, mnd = 39, chr = 43 },
                [45] = { acc = 161, eva = 137, agi = 47, int = 55, mnd = 40, chr = 43 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
        },
        {
            name   = 'Baronet Romwe',
            ids    = { 218 },
            nm     = true,
            levels = {
                [68] = { acc = 278, eva = 263, agi = 71, int = 57, mnd = 45, chr = 64 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 150, item = 902 },  -- demon horn
                { rate = 100, item = 16711 },  -- demons axe
                { rate = 150, item = 886 },  -- demon skull
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Deadly Iris',
            ids    = { 219, 220, 231, 232, 233, 234 },
            levels = {
                [55] = { acc = 209, eva = 195, agi = 58, int = 56, mnd = 43, chr = 50 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 57, mnd = 43, chr = 52 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 50, item = 935 },  -- ahriman wing
                { rate = 10, item = 1038 },  -- zvahl chest key
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 2,
        },
    },
    by_name = {},
}
