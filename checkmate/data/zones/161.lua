-- Castle Zvahl Baileys (zone 161).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Ahriman', 'Evil Eye', 'Morbid Eye' },
        [2] = { 'Abyssal Demon', 'Arch Demon', 'Blood Demon', 'Demon Banneret', 'Demon Chancellor',
                'Demon Commander', 'Demon General', 'Demon Knight', 'Demon Magistrate', 'Demon Pawn',
                'Demon Secretary', 'Demon Warlock', 'Demon Wizard', 'Doom Demon', 'Dread Demon', 'Duke Haborym',
                'Gore Demon', 'Grand Duke Batym', 'Judicator Demon', 'Marquis Allocen', 'Marquis Amon',
                'Marquis Andrealphus', 'Stygian Demon' },
        [3] = { 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber', 'Goblin Trader' },
        [4] = { 'Orcish Bowshooter', 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Trooper' },
        [5] = { 'Elder Quadav', 'Emerald Quadav', 'Iron Quadav', 'Spinel Quadav' },
        [6] = { 'Yagudo Conquistador', 'Yagudo Lutenist', 'Yagudo Prior', 'Yagudo Zealot' },
        [7] = { 'Abyssal Demon', 'Arch Demon', 'Blood Demon', 'Demon Banneret', 'Demon Chancellor',
                'Demon Commander', 'Demon General', 'Demon Knight', 'Demon Magistrate', 'Demon Pawn',
                'Demon Secretary', 'Demon Warlock', 'Demon Wizard', 'Doom Demon', 'Dread Demon', 'Duke Haborym',
                'Gore Demon', 'Grand Duke Batym', 'Judicator Demon', 'Marquis Amon', 'Marquis Andrealphus',
                'Stygian Demon' },
        [8] = { 'Abyssal Demon', 'Arch Demon', 'Blood Demon', 'Demon Banneret', 'Demon Chancellor',
                'Demon Commander', 'Demon General', 'Demon Knight', 'Demon Magistrate', 'Demon Pawn',
                'Demon Secretary', 'Demon Warlock', 'Demon Wizard', 'Doom Demon', 'Dread Demon', 'Duke Haborym',
                'Gore Demon', 'Grand Duke Batym', 'Judicator Demon', 'Marquis Allocen', 'Marquis Andrealphus',
                'Stygian Demon' },
        [9] = { 'Abyssal Demon', 'Arch Demon', 'Blood Demon', 'Demon Banneret', 'Demon Chancellor',
                'Demon Commander', 'Demon General', 'Demon Knight', 'Demon Magistrate', 'Demon Pawn',
                'Demon Secretary', 'Demon Warlock', 'Demon Wizard', 'Doom Demon', 'Dread Demon', 'Gore Demon',
                'Grand Duke Batym', 'Judicator Demon', 'Marquis Allocen', 'Marquis Amon', 'Marquis Andrealphus',
                'Stygian Demon' },
        [10] = { 'Abyssal Demon', 'Arch Demon', 'Blood Demon', 'Demon Banneret', 'Demon Chancellor',
                 'Demon Commander', 'Demon General', 'Demon Knight', 'Demon Magistrate', 'Demon Pawn',
                 'Demon Secretary', 'Demon Warlock', 'Demon Wizard', 'Doom Demon', 'Dread Demon', 'Duke Haborym',
                 'Gore Demon', 'Judicator Demon', 'Marquis Allocen', 'Marquis Amon', 'Marquis Andrealphus',
                 'Stygian Demon' },
        [11] = { 'Abyssal Demon', 'Arch Demon', 'Blood Demon', 'Demon Banneret', 'Demon Chancellor',
                 'Demon Commander', 'Demon General', 'Demon Knight', 'Demon Magistrate', 'Demon Pawn',
                 'Demon Secretary', 'Demon Warlock', 'Demon Wizard', 'Doom Demon', 'Dread Demon', 'Duke Haborym',
                 'Gore Demon', 'Grand Duke Batym', 'Judicator Demon', 'Marquis Allocen', 'Marquis Amon',
                 'Stygian Demon' },
    },
    monsters = {
        {
            name   = 'Evil Eye',
            ids    = { 1, 2, 4, 5, 10, 15, 18, 27, 40, 41, 43, 44, 99, 100, 101 },
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
            links  = 1,
        },
        {
            name   = 'Demon Pawn',
            ids    = { 3, 8, 9, 13, 14, 19, 21, 23, 25, 28, 29, 30, 32, 34, 37, 45, 46, 49, 50, 145, 146, 156,
                       157 },
            levels = {
                [48] = { acc = 173, eva = 161, agi = 50, int = 40, mnd = 31, chr = 45 },
                [49] = { acc = 178, eva = 165, agi = 52, int = 42, mnd = 33, chr = 46 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 44, mnd = 35, chr = 48 },
                [51] = { acc = 188, eva = 174, agi = 56, int = 45, mnd = 35, chr = 51 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 45, mnd = 35, chr = 51 },
            },
            spawn_levels = { [3] = { 48, 50 }, [8] = { 48, 50 }, [9] = { 48, 50 }, [13] = { 48, 50 },
                             [14] = { 48, 50 }, [19] = { 50, 52 }, [21] = { 50, 52 }, [23] = { 50, 52 },
                             [25] = { 50, 52 }, [28] = { 50, 52 }, [29] = { 50, 52 }, [30] = { 50, 52 },
                             [32] = { 50, 52 }, [34] = { 50, 52 }, [37] = { 50, 52 }, [45] = { 50, 52 },
                             [46] = { 50, 52 }, [49] = { 50, 52 }, [50] = { 50, 52 }, [145] = { 50, 52 },
                             [146] = { 50, 52 }, [156] = { 50, 52 }, [157] = { 50, 52 } },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1537 },  -- behemoth leather missive
                { rate = 50, item = 1038 },  -- zvahl chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Dark Elemental',
            ids    = { 6, 11, 16, 35, 38 },
            levels = {
                [48] = { acc = 172, eva = 158, agi = 45, int = 50, mnd = 35, chr = 35 },
                [49] = { acc = 176, eva = 161, agi = 45, int = 52, mnd = 35, chr = 35 },
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
            name   = 'Ice Elemental',
            ids    = { 7, 12, 17, 36, 39 },
            levels = {
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45 },
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
            name   = 'Demon Knight',
            ids    = { 20, 22, 24, 26, 48, 52, 72, 76, 97, 98, 163 },
            levels = {
                [50] = { acc = 181, eva = 167, agi = 50, int = 57, mnd = 30, chr = 39 },
                [51] = { acc = 188, eva = 171, agi = 50, int = 60, mnd = 32, chr = 42 },
                [52] = { acc = 193, eva = 176, agi = 50, int = 60, mnd = 32, chr = 42 },
            },
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
            links  = 2,
        },
        {
            name   = 'Demon Wizard',
            ids    = { 31, 33, 47, 51, 71, 75, 147, 158, 162, 164 },
            levels = {
                [50] = { acc = 181, eva = 169, agi = 54, int = 59, mnd = 38, chr = 51 },
                [51] = { acc = 188, eva = 174, agi = 56, int = 61, mnd = 39, chr = 53 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 61, mnd = 39, chr = 53 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1537 },  -- behemoth leather missive
                { rate = 50, item = 1038 },  -- zvahl chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Poacher',
            ids    = { 53, 62, 79, 88, 102 },
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
            ids    = { 54, 63, 80, 89, 103 },
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
            name   = 'Goblins Bats',
            ids    = { 55, 64, 81, 90, 104 },
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
            ids    = { 56, 65, 82, 91, 105 },
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
            ids    = { 57, 66, 83, 92, 106 },
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
            name   = 'Orcish Bowshooter',
            ids    = { 58, 67, 84, 93, 107 },
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
            ids    = { 59, 68, 85, 94, 108 },
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
            ids    = { 60, 69, 86, 95, 109 },
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
            ids    = { 61, 70, 87, 96, 110 },
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
            name   = 'Demon Warlock',
            ids    = { 73, 77, 165 },
            levels = {
                [50] = { acc = 177, eva = 151, agi = 50, int = 62, mnd = 53, chr = 62 },
                [51] = { acc = 183, eva = 155, agi = 50, int = 63, mnd = 53, chr = 63 },
                [52] = { acc = 188, eva = 160, agi = 50, int = 63, mnd = 53, chr = 63 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1038 },  -- zvahl chest key
                { rate = 10, item = 4897 },  -- ice spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Demons Elemental',
            ids    = { 74, 78, 166, 176, 181, 186, 191, 196, 203, 208, 213, 217, 224, 228, 240, 245, 250, 256, 275,
                       280, 285, 291 },
            levels = {
                [43] = { acc = 154, eva = 142, agi = 41, int = 41, mnd = 31, chr = 33 },
                [44] = { acc = 158, eva = 147, agi = 44, int = 43, mnd = 32, chr = 34 },
                [45] = { acc = 161, eva = 150, agi = 44, int = 44, mnd = 33, chr = 34 },
                [49] = { acc = 176, eva = 163, agi = 48, int = 47, mnd = 35, chr = 36 },
                [50] = { acc = 180, eva = 167, agi = 51, int = 50, mnd = 38, chr = 39 },
                [51] = { acc = 186, eva = 172, agi = 52, int = 51, mnd = 39, chr = 41 },
                [52] = { acc = 191, eva = 177, agi = 52, int = 51, mnd = 39, chr = 41 },
                [53] = { acc = 196, eva = 183, agi = 54, int = 52, mnd = 40, chr = 42 },
                [54] = { acc = 202, eva = 188, agi = 54, int = 53, mnd = 40, chr = 42 },
                [60] = { acc = 234, eva = 219, agi = 59, int = 58, mnd = 44, chr = 46 },
                [61] = { acc = 240, eva = 225, agi = 62, int = 60, mnd = 46, chr = 48 },
                [62] = { acc = 245, eva = 230, agi = 62, int = 60, mnd = 46, chr = 48 },
                [63] = { acc = 250, eva = 235, agi = 62, int = 60, mnd = 46, chr = 48 },
                [64] = { acc = 256, eva = 241, agi = 64, int = 62, mnd = 47, chr = 49 },
            },
            spawn_levels = { [74] = { 43, 45 }, [78] = { 43, 45 }, [166] = { 43, 45 }, [176] = { 49, 54 },
                             [181] = { 49, 54 }, [186] = { 49, 54 }, [191] = { 49, 54 }, [196] = { 49, 54 },
                             [203] = { 49, 54 }, [208] = { 49, 54 }, [213] = { 49, 54 }, [217] = { 49, 54 },
                             [224] = { 49, 54 }, [228] = { 49, 54 }, [240] = { 60, 64 }, [245] = { 60, 64 },
                             [250] = { 60, 64 }, [256] = { 60, 64 }, [275] = { 49, 54 }, [280] = { 49, 54 },
                             [285] = { 49, 54 }, [291] = { 49, 54 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            drops  = {
                { rate = 10, item = 1038 },  -- zvahl chest key
            },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Elder Quadav',
            ids    = { 111, 119, 127, 137, 148 },
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
            ids    = { 112, 120, 128, 138, 149 },
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
            ids    = { 113, 121, 129, 139, 150 },
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
            ids    = { 114, 122, 130, 140, 151 },
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
            name   = 'Yagudo Zealot',
            ids    = { 115, 123, 131, 141, 152 },
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
            ids    = { 116, 124, 132, 142, 153 },
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
            ids    = { 117, 125, 133, 143, 154 },
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
            ids    = { 118, 126, 134, 144, 155 },
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
            name   = 'Morbid Eye',
            ids    = { 135, 136, 159, 160, 161, 167, 168, 169, 170, 171 },
            levels = {
                [52] = { acc = 193, eva = 179, agi = 56, int = 53, mnd = 41, chr = 48 },
                [53] = { acc = 198, eva = 184, agi = 57, int = 54, mnd = 42, chr = 49 },
                [54] = { acc = 204, eva = 190, agi = 58, int = 55, mnd = 42, chr = 49 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 56, mnd = 43, chr = 50 },
            },
            spawn_levels = { [135] = { 52, 53 }, [136] = { 52, 53 }, [159] = { 52, 53 }, [160] = { 52, 53 },
                             [161] = { 52, 53 }, [167] = { 52, 53 }, [168] = { 54, 55 }, [169] = { 54, 55 },
                             [170] = { 54, 55 }, [171] = { 54, 55 } },
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
            links  = 1,
        },
        {
            name   = 'Demon Commander',
            ids    = { 172, 177, 182, 187, 192 },
            levels = {
                [57] = { acc = 220, eva = 205, agi = 61, int = 50, mnd = 40, chr = 54 },
                [58] = { acc = 225, eva = 210, agi = 61, int = 50, mnd = 40, chr = 56 },
                [59] = { acc = 231, eva = 216, agi = 63, int = 51, mnd = 40, chr = 57 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1106 },  -- whine cellar key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Demon General',
            ids    = { 173, 178, 183, 188, 193 },
            levels = {
                [57] = { acc = 220, eva = 202, agi = 55, int = 65, mnd = 35, chr = 45 },
                [58] = { acc = 225, eva = 207, agi = 55, int = 65, mnd = 35, chr = 45 },
                [59] = { acc = 231, eva = 213, agi = 57, int = 67, mnd = 35, chr = 46 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1106 },  -- whine cellar key
                { rate = 50, item = 1653 },  -- demon pen
                { rate = 10, item = 4876 },  -- scroll of absorb-vit
                { rate = 10, item = 4877 },  -- scroll of absorb-agi
                { rate = 50, item = 4878 },  -- scroll of absorb-int
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Demon Chancellor',
            ids    = { 174, 179, 184, 189, 194 },
            levels = {
                [57] = { acc = 220, eva = 187, agi = 61, int = 75, mnd = 44, chr = 59 },
                [58] = { acc = 225, eva = 192, agi = 61, int = 75, mnd = 46, chr = 59 },
                [59] = { acc = 231, eva = 197, agi = 63, int = 78, mnd = 46, chr = 61 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1157 },  -- handful of the sands of silence
                { rate = 100, item = 1106 },  -- whine cellar key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Demon Magistrate',
            ids    = { 175, 180, 185, 190, 195 },
            levels = {
                [57] = { acc = 215, eva = 184, agi = 55, int = 69, mnd = 59, chr = 69 },
                [58] = { acc = 221, eva = 189, agi = 55, int = 69, mnd = 59, chr = 69 },
                [59] = { acc = 226, eva = 194, agi = 57, int = 72, mnd = 61, chr = 72 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 1157 },  -- handful of the sands of silence
                { rate = 100, item = 1106 },  -- whine cellar key
                { rate = 10, item = 4897 },  -- ice spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Blood Demon',
            ids    = { 197, 200, 205, 214, 218, 225 },
            levels = {
                [64] = { acc = 258, eva = 246, agi = 62, int = 60, mnd = 48, chr = 66 },
                [65] = { acc = 263, eva = 251, agi = 62, int = 62, mnd = 51, chr = 66 },
                [66] = { acc = 269, eva = 256, agi = 62, int = 63, mnd = 51, chr = 67 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 17293 },  -- yagudo freezer
                { rate = 100, item = 1437 },  -- samurais testimony
                { rate = 50, item = 1048 },  -- zvahl coffer key
                { rate = 100, item = 1653 },  -- demon pen
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Doom Demon',
            ids    = { 198, 201, 206, 210, 219, 221 },
            levels = {
                [64] = { acc = 258, eva = 243, agi = 68, int = 73, mnd = 46, chr = 64 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 75, mnd = 49, chr = 65 },
                [66] = { acc = 269, eva = 253, agi = 70, int = 76, mnd = 49, chr = 66 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 50, item = 902 },  -- demon horn
                { rate = 50, item = 1048 },  -- zvahl coffer key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Arch Demon',
            ids    = { 199, 211, 215, 220, 222, 226 },
            levels = {
                [64] = { acc = 258, eva = 240, agi = 62, int = 72, mnd = 38, chr = 50 },
                [65] = { acc = 263, eva = 245, agi = 62, int = 72, mnd = 39, chr = 50 },
                [66] = { acc = 269, eva = 249, agi = 62, int = 75, mnd = 40, chr = 52 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 17415 },  -- shellbuster
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 1048 },  -- zvahl coffer key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Abyssal Demon',
            ids    = { 202, 207, 212, 216, 223, 227 },
            levels = {
                [64] = { acc = 252, eva = 220, agi = 62, int = 77, mnd = 65, chr = 77 },
                [65] = { acc = 258, eva = 224, agi = 62, int = 77, mnd = 66, chr = 77 },
                [66] = { acc = 263, eva = 229, agi = 62, int = 79, mnd = 67, chr = 79 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 16867 },  -- orc piercer
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 4897 },  -- ice spirit pact
                { rate = 50, item = 1048 },  -- zvahl coffer key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Ahriman',
            ids    = { 229, 230, 231, 232, 233, 234, 235, 236, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267,
                       268, 269, 270, 271 },
            levels = {
                [63] = { acc = 252, eva = 237, agi = 66, int = 63, mnd = 48, chr = 57 },
                [64] = { acc = 258, eva = 243, agi = 68, int = 64, mnd = 48, chr = 58 },
                [65] = { acc = 263, eva = 248, agi = 68, int = 65, mnd = 51, chr = 59 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 4, blind = 6 },
            resist = { silence = 20 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 921 },  -- bottle of ahriman tears
                { rate = 100, item = 557 },  -- ahriman lens
                { rate = 50, item = 1048 },  -- zvahl coffer key
                { rate = 50, item = 935 },  -- ahriman wing
            },
            aggro  = true,
            detects = { 'sight', 'sound' },
            links  = 1,
        },
        {
            name   = 'Dread Demon CZB',
            ids    = { 237, 248, 253, 272, 281, 283, 288 },
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 81, mnd = 52, chr = 71 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 81, mnd = 52, chr = 71 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 83, mnd = 54, chr = 72 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 902 },  -- demon horn
                { rate = 100, item = 4783 },  -- scroll of firaga ii
                { rate = 50, item = 4754 },  -- scroll of fire iii
                { rate = 10, item = 4755 },  -- scroll of fire iv
                { rate = 10, item = 4784 },  -- scroll of firaga iii
                { rate = 5, item = 4812 },  -- scroll of flare
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Judicator Demon CZB',
            ids    = { 238, 243, 254, 273, 278, 286, 289 },
            levels = {
                [71] = { acc = 296, eva = 275, agi = 67, int = 80, mnd = 43, chr = 56 },
                [72] = { acc = 301, eva = 280, agi = 67, int = 80, mnd = 43, chr = 56 },
                [73] = { acc = 306, eva = 287, agi = 70, int = 80, mnd = 44, chr = 56 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 17415 },  -- shellbuster
                { rate = 100, item = 902 },  -- demon horn
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Stygian Demon CZB',
            ids    = { 239, 244, 249, 274, 279, 284, 290 },
            levels = {
                [71] = { acc = 290, eva = 253, agi = 67, int = 84, mnd = 71, chr = 84 },
                [72] = { acc = 295, eva = 258, agi = 67, int = 84, mnd = 71, chr = 84 },
                [73] = { acc = 300, eva = 264, agi = 70, int = 86, mnd = 74, chr = 86 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 16867 },  -- orc piercer
                { rate = 100, item = 902 },  -- demon horn
                { rate = 50, item = 4897 },  -- ice spirit pact
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Marquis Allocen',
            ids    = { 241 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 306, agi = 80, int = 64, mnd = 50, chr = 71 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 902 },  -- demon horn
                { rate = 240, item = 16757 },  -- corsairs knife
                { rate = 150, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gore Demon CZB',
            ids    = { 242, 247, 252, 276, 277, 282, 287 },
            levels = {
                [71] = { acc = 296, eva = 279, agi = 75, int = 60, mnd = 47, chr = 68 },
                [72] = { acc = 301, eva = 284, agi = 75, int = 60, mnd = 47, chr = 68 },
                [73] = { acc = 306, eva = 290, agi = 76, int = 62, mnd = 50, chr = 68 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 100, item = 1437 },  -- samurais testimony
                { rate = 100, item = 17293 },  -- yagudo freezer
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Marquis Amon',
            ids    = { 246 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 283, agi = 80, int = 97, mnd = 57, chr = 77 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 902 },  -- demon horn
                { rate = 240, item = 17232 },  -- lion crossbow
                { rate = 100, item = 4754 },  -- scroll of fire iii
                { rate = 150, item = 886 },  -- demon skull
                { rate = 50, item = 4784 },  -- scroll of firaga iii
                { rate = 50, item = 4755 },  -- scroll of fire iv
                { rate = 10, item = 4812 },  -- scroll of flare
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Duke Haborym',
            ids    = { 251 },
            nm     = true,
            levels = {
                [76] = { acc = 323, eva = 302, agi = 72, int = 85, mnd = 45, chr = 59 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 902 },  -- demon horn
                { rate = 240, item = 16786 },  -- barbarians scythe
                { rate = 240, item = 4875 },  -- scroll of absorb-dex
                { rate = 150, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Grand Duke Batym',
            ids    = { 255 },
            nm     = true,
            levels = {
                [76] = { acc = 316, eva = 279, agi = 72, int = 89, mnd = 75, chr = 89 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 902 },  -- demon horn
                { rate = 150, item = 16787 },  -- demonslicer
                { rate = 150, item = 886 },  -- demon skull
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Demons Avatar',
            ids    = { 257 },
            levels = {
                [52] = { acc = 191, eva = 163, agi = 56, int = 65, mnd = 47, chr = 50 },
                [53] = { acc = 196, eva = 167, agi = 57, int = 67, mnd = 48, chr = 52 },
                [54] = { acc = 202, eva = 173, agi = 58, int = 67, mnd = 48, chr = 52 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
        },
        {
            name   = 'Dark Spark',
            ids    = { 292 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 193, agi = 54, int = 51, mnd = 40, chr = 46 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Mimic',
            ids    = { 293 },
            nm     = true,
            levels = {
                [60] = { acc = 236, eva = 225, agi = 70, int = 54, mnd = 54, chr = 46 },
            },
            drops  = {
                { rate = 1000, item = 1048 },  -- zvahl coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Marquis Andrealphus',
            ids    = { 294 },
            nm     = true,
            levels = {
                [52] = { acc = 193, eva = 176, agi = 50, int = 60, mnd = 32, chr = 42 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'slow', 'elegy', 'blind',
                       'poison', 'petrify', 'terror', 'plague' },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Demon Banneret',
            ids    = { 295, 297 },
            levels = {
                [47] = { acc = 170, eva = 157, agi = 49, int = 40, mnd = 31, chr = 44 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 40, mnd = 31, chr = 45 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'silence', 'petrify' },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Demon Secretary',
            ids    = { 296, 298 },
            levels = {
                [47] = { acc = 170, eva = 157, agi = 49, int = 55, mnd = 34, chr = 47 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 55, mnd = 35, chr = 47 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            immune = { 'silence', 'petrify' },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
    },
    by_name = {},
}
