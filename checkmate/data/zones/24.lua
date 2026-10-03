-- Lufaise Meadows (zone 24).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Acrophies' },
        [2] = { 'Death Jacket', 'Miner Bee' },
        [3] = { 'Padfoot', 'Tavnazian Sheep' },
        [4] = { 'Blackbone Frazdiz', 'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler',
                'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Impaler', 'Orcish Nightraider',
                'Orcish Stonelauncher', 'Orcish Trooper', 'Rainbringer Yjatvot', 'Splinterspine Grukjuk' },
        [5] = { 'Blackbone Frazdiz', 'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler',
                'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Impaler', 'Orcish Nightraider', 'Orcish Trooper',
                'Rainbringer Yjatvot', 'Splinterspine Grukjuk' },
        [6] = { 'Acrophies', 'Cetic Parasite' },
        [7] = { 'Gigas Braver', 'Gigas Catapulter', 'Gigas Fighter', 'Gigas Martialist', 'Gigas Slinger',
                'Gigas Warwolf', 'Gigas Wrestler' },
        [8] = { 'Vampire Bat', 'Wingrats' },
        [9] = { 'Fomor Bard', 'Fomor Beastmaster', 'Fomor Black Mage', 'Fomor Dark Knight', 'Fomor Dragoon',
                'Fomor Monk', 'Fomor Paladin', 'Fomor Ranger', 'Fomor Red Mage', 'Fomor Thief', 'Fomor Warrior' },
        [10] = { 'Amaltheia', 'Tavnazian Ram' },
        [11] = { 'Fomor Bard', 'Fomor Beastmaster', 'Fomor Black Mage', 'Fomor Dark Knight', 'Fomor Dragoon',
                 'Fomor Monk', 'Fomor Ranger', 'Fomor Red Mage', 'Fomor Thief', 'Fomor Warrior' },
        [12] = { 'Fomor Bard', 'Fomor Beastmaster', 'Fomor Black Mage', 'Fomor Dark Knight', 'Fomor Monk',
                 'Fomor Paladin', 'Fomor Ranger', 'Fomor Red Mage', 'Fomor Thief', 'Fomor Warrior' },
        [13] = { 'Fomor Bard', 'Fomor Beastmaster', 'Fomor Dark Knight', 'Fomor Dragoon', 'Fomor Monk',
                 'Fomor Paladin', 'Fomor Ranger', 'Fomor Red Mage', 'Fomor Thief', 'Fomor Warrior' },
        [14] = { 'Fomor Bard', 'Fomor Beastmaster', 'Fomor Black Mage', 'Fomor Dark Knight', 'Fomor Dragoon',
                 'Fomor Monk', 'Fomor Paladin', 'Fomor Red Mage', 'Fomor Thief', 'Fomor Warrior' },
        [15] = { 'Colorful Leshy', 'Defoliate Leshy', 'Leshachikha', 'Leshy' },
        [16] = { 'Defoliate Leshy', 'Leshachikha', 'Leshy' },
        [17] = { 'Colorful Leshy', 'Leshachikha', 'Leshy' },
        [18] = { 'Blackbone Frazdiz', 'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler',
                 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Impaler', 'Orcish Nightraider',
                 'Orcish Stonelauncher', 'Orcish Trooper', 'Rainbringer Yjatvot' },
        [19] = { 'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler', 'Orcish Footsoldier',
                 'Orcish Gladiator', 'Orcish Impaler', 'Orcish Nightraider', 'Orcish Stonelauncher',
                 'Orcish Trooper', 'Rainbringer Yjatvot', 'Splinterspine Grukjuk' },
        [20] = { 'Blackbone Frazdiz', 'Orcish Beastrider', 'Orcish Bowshooter', 'Orcish Brawler',
                 'Orcish Footsoldier', 'Orcish Gladiator', 'Orcish Impaler', 'Orcish Nightraider',
                 'Orcish Stonelauncher', 'Orcish Trooper', 'Splinterspine Grukjuk' },
        [21] = { 'Tavnazian Ram' },
        [22] = { 'Abununnu', 'Gloam Servitor' },
        [23] = { 'Vermillion Fishfly' },
    },
    monsters = {
        {
            name   = 'Clipper',
            ids    = { 1 },
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
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
            name   = 'Grindylow',
            ids    = { 2 },
            levels = {
                [30] = { acc = 107, eva = 96, agi = 21, int = 23, mnd = 35, chr = 35 },
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 936 },  -- chunk of rock salt
                { rate = 100, item = 4400 },  -- slice of land crab meat
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Pugil',
            ids    = { 3, 4 },
            levels = {
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 32 },
                [36] = { acc = 132, eva = 125, agi = 45, int = 30, mnd = 30, chr = 32 },
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 32 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 35 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 35 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Apsaras',
            ids    = { 5 },
            levels = {
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 35 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 37 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Asrai',
            ids    = { 6 },
            nm     = true,
            levels = {
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Abhac',
            ids    = { 7 },
            nm     = true,
            levels = {
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 35 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 37 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Vu-Murt',
            ids    = { 8 },
            nm     = true,
            levels = {
                [31] = { acc = 114, eva = 105, agi = 26, int = 25, mnd = 32, chr = 31 },
                [32] = { acc = 117, eva = 107, agi = 26, int = 25, mnd = 32, chr = 31 },
                [33] = { acc = 121, eva = 111, agi = 29, int = 26, mnd = 35, chr = 32 },
                [34] = { acc = 124, eva = 114, agi = 29, int = 26, mnd = 35, chr = 32 },
                [35] = { acc = 128, eva = 117, agi = 29, int = 26, mnd = 35, chr = 33 },
                [36] = { acc = 131, eva = 121, agi = 30, int = 28, mnd = 37, chr = 34 },
                [37] = { acc = 135, eva = 124, agi = 31, int = 28, mnd = 37, chr = 34 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Petrocrab',
            ids    = { 9 },
            nm     = true,
            levels = {
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
                [35] = { acc = 124, eva = 112, agi = 25, int = 26, mnd = 39, chr = 39 },
                [36] = { acc = 128, eva = 116, agi = 26, int = 28, mnd = 42, chr = 42 },
                [37] = { acc = 131, eva = 118, agi = 26, int = 28, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cetic Parasite',
            ids    = { 10 },
            nm     = true,
            levels = {
                [34] = { acc = 124, eva = 116, agi = 39, int = 32, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 32, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 33, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 34, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 129, agi = 42, int = 34, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 133, agi = 44, int = 35, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Ferrocrab',
            ids    = { 11 },
            nm     = true,
            levels = {
                [31] = { acc = 111, eva = 101, agi = 24, int = 25, mnd = 37, chr = 37 },
                [32] = { acc = 114, eva = 103, agi = 24, int = 25, mnd = 37, chr = 37 },
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
                [35] = { acc = 124, eva = 112, agi = 25, int = 26, mnd = 39, chr = 39 },
                [36] = { acc = 128, eva = 116, agi = 26, int = 28, mnd = 42, chr = 42 },
                [37] = { acc = 131, eva = 118, agi = 26, int = 28, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Nakki',
            ids    = { 12 },
            nm     = true,
            levels = {
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 30, chr = 39 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Miner Bee',
            ids    = { 13, 14, 15, 17, 18, 19, 46, 47, 81, 82 },
            levels = {
                [31] = { acc = 114, eva = 109, agi = 40, int = 26, mnd = 26, chr = 31 },
                [32] = { acc = 117, eva = 111, agi = 40, int = 26, mnd = 26, chr = 31 },
                [33] = { acc = 121, eva = 114, agi = 40, int = 29, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 2,
        },
        {
            name   = 'Tavnazian Sheep',
            ids    = { 16, 21, 29, 30, 31, 33, 35, 40, 41, 48, 55, 56, 57, 67, 79, 91, 92, 93, 94, 100, 101, 104,
                       105 },
            levels = {
                [33] = { acc = 121, eva = 113, agi = 38, int = 27, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 116, agi = 39, int = 27, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 28, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 28, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 29, mnd = 31, chr = 34 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4372 },  -- slice of giant sheep meat
                { rate = 50, item = 882 },  -- sheep tooth
                { rate = 50, item = 505 },  -- sheepskin
                { rate = 50, item = 505 },  -- sheepskin
                { rate = 10, item = 4378 },  -- jug of selbina milk
                { rate = 10, item = 4378 },  -- jug of selbina milk
                { rate = 10, item = 5154 },  -- tavnazian sheep liver
            },
            links  = 3,
        },
        {
            name   = 'Bugard',
            ids    = { 20, 23, 24, 34, 37, 38, 49, 50, 62, 74, 75, 83, 85, 86, 87, 96, 97, 103 },
            levels = {
                [34] = { acc = 124, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 30, mnd = 30, chr = 34 },
                [37] = { acc = 135, eva = 126, agi = 42, int = 31, mnd = 31, chr = 34 },
            },
            spawn_levels = { [24] = { 37, 37 }, [62] = { 37, 37 }, [87] = { 37, 37 } },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1640 },  -- bugard skin
                { rate = 10, item = 1622 },  -- bugard tusk
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Cluster',
            ids    = { 22, 73, 84 },
            levels = {
                [38] = { acc = 139, eva = 129, agi = 42, int = 31, mnd = 31, chr = 39 },
                [39] = { acc = 143, eva = 133, agi = 44, int = 32, mnd = 32, chr = 40 },
                [40] = { acc = 146, eva = 136, agi = 44, int = 32, mnd = 32, chr = 40 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 50, item = 17305 },  -- cluster arm
                { rate = 100, item = 1630 },  -- pinch of cluster ash
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Orcish Brawler LM',
            ids    = { 25, 36, 51, 63 },
            levels = {
                [35] = { acc = 131, eva = 119, agi = 32, int = 23, mnd = 32, chr = 36 },
                [36] = { acc = 134, eva = 123, agi = 34, int = 24, mnd = 33, chr = 37 },
                [37] = { acc = 138, eva = 126, agi = 35, int = 25, mnd = 33, chr = 37 },
                [38] = { acc = 141, eva = 129, agi = 35, int = 25, mnd = 34, chr = 39 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Beastrider LM',
            ids    = { 26, 52, 59, 64 },
            levels = {
                [35] = { acc = 130, eva = 118, agi = 36, int = 32, mnd = 26, chr = 31 },
                [36] = { acc = 134, eva = 122, agi = 39, int = 33, mnd = 27, chr = 33 },
                [37] = { acc = 137, eva = 124, agi = 39, int = 34, mnd = 27, chr = 33 },
                [38] = { acc = 140, eva = 127, agi = 39, int = 34, mnd = 28, chr = 34 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 10, virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Nightraider LM',
            ids    = { 27, 53, 60, 65, 232 },
            levels = {
                [35] = { acc = 150, eva = 122, agi = 44, int = 28, mnd = 32, chr = 36 },
                [36] = { acc = 154, eva = 126, agi = 46, int = 28, mnd = 33, chr = 37 },
                [37] = { acc = 158, eva = 128, agi = 47, int = 29, mnd = 33, chr = 37 },
                [38] = { acc = 161, eva = 131, agi = 47, int = 30, mnd = 34, chr = 39 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 10, virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Impaler LM',
            ids    = { 28, 54, 61, 66 },
            levels = {
                [35] = { acc = 138, eva = 121, agi = 36, int = 25, mnd = 31, chr = 40 },
                [36] = { acc = 142, eva = 125, agi = 39, int = 25, mnd = 31, chr = 42 },
                [37] = { acc = 146, eva = 128, agi = 39, int = 27, mnd = 31, chr = 42 },
                [38] = { acc = 149, eva = 131, agi = 39, int = 27, mnd = 33, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Padfoot',
            ids    = { 32, 58, 95, 183, 228 },
            nm     = true,
            levels = {
                [38] = { acc = 138, eva = 129, agi = 42, int = 30, mnd = 31, chr = 36 },
            },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror', 'plague' },
            links  = 3,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Orcish Stonelauncher',
            ids    = { 39 },
            levels = {
                [37] = { acc = 137, eva = 127, agi = 45, int = 27, mnd = 29, chr = 34 },
                [38] = { acc = 140, eva = 130, agi = 45, int = 27, mnd = 30, chr = 36 },
                [39] = { acc = 144, eva = 134, agi = 47, int = 27, mnd = 30, chr = 37 },
                [40] = { acc = 147, eva = 137, agi = 47, int = 27, mnd = 30, chr = 37 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 10, item = 17292 },  -- long boomerang
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Air Elemental',
            ids    = { 42, 102, 132, 143, 169 },
            levels = {
                [43] = { acc = 154, eva = 139, agi = 44, int = 53, mnd = 42, chr = 42 },
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45 },
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50 },
                [84] = { acc = 367, eva = 336, agi = 82, int = 96, mnd = 77, chr = 80 },
                [85] = { acc = 373, eva = 341, agi = 83, int = 97, mnd = 78, chr = 80 },
                [86] = { acc = 380, eva = 347, agi = 84, int = 98, mnd = 79, chr = 80 },
            },
            spawn_levels = { [42] = { 43, 48 }, [102] = { 48, 51 }, [132] = { 84, 86 }, [143] = { 84, 86 },
                             [169] = { 43, 48 } },
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
            name   = 'Crimson Knight Crab',
            ids    = { 43, 44, 45 },
            levels = {
                [33] = { acc = 118, eva = 106, agi = 24, int = 26, mnd = 38, chr = 38 },
                [34] = { acc = 121, eva = 109, agi = 24, int = 26, mnd = 39, chr = 39 },
                [35] = { acc = 124, eva = 112, agi = 25, int = 26, mnd = 39, chr = 39 },
                [36] = { acc = 128, eva = 116, agi = 26, int = 28, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1888 },  -- sack of silica
            },
        },
        {
            name   = 'Acrophies',
            ids    = { 68, 69, 70, 71 },
            levels = {
                [33] = { acc = 121, eva = 113, agi = 38, int = 31, mnd = 29, chr = 32 },
                [34] = { acc = 124, eva = 116, agi = 39, int = 32, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 32, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 33, mnd = 30, chr = 34 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 6,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 72, 171, 248 },
            levels = {
                [43] = { acc = 154, eva = 139, agi = 44, int = 53, mnd = 42, chr = 42 },
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45 },
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50 },
            },
            spawn_levels = { [72] = { 43, 44 }, [171] = { 43, 48 }, [248] = { 48, 51 } },
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
            name   = 'Gigas Fighter',
            ids    = { 76, 88 },
            levels = {
                [35] = { acc = 130, eva = 119, agi = 38, int = 25, mnd = 29, chr = 36 },
                [36] = { acc = 134, eva = 123, agi = 40, int = 25, mnd = 30, chr = 37 },
                [37] = { acc = 137, eva = 125, agi = 40, int = 27, mnd = 31, chr = 37 },
                [38] = { acc = 140, eva = 128, agi = 41, int = 27, mnd = 31, chr = 39 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gigas Wrestler',
            ids    = { 77, 89, 98 },
            levels = {
                [35] = { acc = 131, eva = 117, agi = 28, int = 22, mnd = 35, chr = 36 },
                [36] = { acc = 134, eva = 120, agi = 28, int = 23, mnd = 37, chr = 37 },
                [37] = { acc = 139, eva = 123, agi = 29, int = 24, mnd = 37, chr = 37 },
                [38] = { acc = 142, eva = 127, agi = 30, int = 24, mnd = 37, chr = 39 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gigas Slinger',
            ids    = { 78, 90, 99, 231 },
            levels = {
                [35] = { acc = 150, eva = 121, agi = 43, int = 28, mnd = 33, chr = 36 },
                [36] = { acc = 154, eva = 125, agi = 44, int = 28, mnd = 35, chr = 37 },
                [37] = { acc = 158, eva = 127, agi = 45, int = 29, mnd = 35, chr = 37 },
                [38] = { acc = 161, eva = 131, agi = 46, int = 30, mnd = 35, chr = 39 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 15 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Vampire Bat',
            ids    = { 106, 107 },
            levels = {
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 8,
        },
        {
            name   = 'Wingrats',
            ids    = { 108, 109 },
            levels = {
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 147, agi = 50, int = 35, mnd = 35, chr = 39 },
                [44] = { acc = 159, eva = 151, agi = 52, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            links  = 8,
        },
        {
            name   = 'Abraxas',
            ids    = { 110, 111, 112, 113, 114, 115, 116, 117, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128,
                       129, 135, 136 },
            levels = {
                [85] = { acc = 377, eva = 356, agi = 92, int = 71, mnd = 71, chr = 79 },
                [86] = { acc = 384, eva = 361, agi = 95, int = 72, mnd = 72, chr = 80 },
            },
            ranks  = { fire = 1, ice = -2, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -2, bind = -2, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            drops  = {
                { rate = 150, item = 842 },  -- giant bird feather
                { rate = 150, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 130, 247 },
            levels = {
                [52] = { acc = 192, eva = 192, agi = 59, int = 50, mnd = 38, chr = 45 },
                [53] = { acc = 198, eva = 198, agi = 61, int = 52, mnd = 39, chr = 46 },
                [54] = { acc = 203, eva = 203, agi = 61, int = 52, mnd = 39, chr = 47 },
                [79] = { acc = 340, eva = 342, agi = 88, int = 75, mnd = 55, chr = 66 },
                [80] = { acc = 345, eva = 347, agi = 88, int = 75, mnd = 55, chr = 66 },
                [81] = { acc = 352, eva = 353, agi = 91, int = 77, mnd = 58, chr = 69 },
            },
            spawn_levels = { [130] = { 79, 81 }, [247] = { 52, 54 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Monk LM',
            ids    = { 131, 159, 246 },
            levels = {
                [52] = { acc = 192, eva = 176, agi = 41, int = 38, mnd = 50, chr = 51 },
                [53] = { acc = 198, eva = 182, agi = 43, int = 39, mnd = 52, chr = 51 },
                [54] = { acc = 203, eva = 187, agi = 43, int = 39, mnd = 52, chr = 52 },
                [79] = { acc = 340, eva = 319, agi = 61, int = 55, mnd = 75, chr = 74 },
                [80] = { acc = 345, eva = 324, agi = 61, int = 55, mnd = 75, chr = 74 },
                [81] = { acc = 352, eva = 330, agi = 64, int = 58, mnd = 77, chr = 76 },
            },
            spawn_levels = { [131] = { 79, 81 }, [159] = { 79, 81 }, [246] = { 52, 54 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1698 },  -- extra-fine file
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Tavnazian Ram',
            ids    = { 133, 134 },
            levels = {
                [82] = { acc = 355, eva = 337, agi = 85, int = 64, mnd = 64, chr = 71 },
                [83] = { acc = 361, eva = 342, agi = 85, int = 64, mnd = 64, chr = 71 },
                [84] = { acc = 368, eva = 348, agi = 87, int = 65, mnd = 65, chr = 72 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            drops  = {
                { rate = 150, item = 859 },  -- ram skin
                { rate = 100, item = 895 },  -- ram horn
                { rate = 50, item = 531 },  -- lanolin cube
                { rate = 150, item = 5208 },  -- slice of tavnazian ram meat
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Fomor Bard LM',
            ids    = { 137, 150 },
            levels = {
                [80] = { acc = 338, eva = 307, agi = 61, int = 75, mnd = 75, chr = 93 },
                [81] = { acc = 345, eva = 313, agi = 64, int = 77, mnd = 77, chr = 96 },
                [82] = { acc = 351, eva = 318, agi = 64, int = 77, mnd = 77, chr = 96 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Fomor Red Mage LM',
            ids    = { 138, 140, 142 },
            levels = {
                [79] = { acc = 333, eva = 306, agi = 69, int = 82, mnd = 82, chr = 80 },
                [80] = { acc = 338, eva = 311, agi = 69, int = 82, mnd = 82, chr = 80 },
                [81] = { acc = 345, eva = 316, agi = 71, int = 85, mnd = 85, chr = 82 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 139, 157, 244 },
            levels = {
                [53] = { acc = 196, eva = 187, agi = 52, int = 48, mnd = 48, chr = 55 },
                [54] = { acc = 202, eva = 192, agi = 52, int = 48, mnd = 48, chr = 56 },
                [55] = { acc = 207, eva = 197, agi = 52, int = 49, mnd = 49, chr = 56 },
                [79] = { acc = 337, eva = 326, agi = 75, int = 69, mnd = 69, chr = 80 },
                [80] = { acc = 342, eva = 331, agi = 75, int = 69, mnd = 69, chr = 80 },
                [81] = { acc = 349, eva = 336, agi = 77, int = 71, mnd = 71, chr = 82 },
            },
            spawn_levels = { [139] = { 79, 81 }, [157] = { 79, 81 }, [244] = { 53, 55 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1698 },  -- extra-fine file
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 141, 212 },
            levels = {
                [42] = { acc = 152, eva = 142, agi = 47, int = 35, mnd = 35, chr = 42 },
                [43] = { acc = 155, eva = 145, agi = 47, int = 35, mnd = 35, chr = 42 },
                [44] = { acc = 159, eva = 149, agi = 49, int = 36, mnd = 36, chr = 43 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 74 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 76 },
                [82] = { acc = 355, eva = 337, agi = 85, int = 64, mnd = 64, chr = 76 },
            },
            spawn_levels = { [141] = { 80, 82 }, [212] = { 42, 44 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1698 },  -- extra-fine file
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Dark Elemental',
            ids    = { 144 },
            levels = {
                [84] = { acc = 368, eva = 345, agi = 80, int = 87, mnd = 59, chr = 59 },
                [85] = { acc = 374, eva = 350, agi = 80, int = 87, mnd = 59, chr = 59 },
                [86] = { acc = 381, eva = 354, agi = 80, int = 89, mnd = 60, chr = 60 },
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
            name   = 'Fomor Paladin LM',
            ids    = { 145 },
            levels = {
                [80] = { acc = 335, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
                [81] = { acc = 342, eva = 319, agi = 58, int = 58, mnd = 85, chr = 90 },
                [82] = { acc = 348, eva = 324, agi = 58, int = 58, mnd = 85, chr = 90 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 50, item = 1698 },  -- extra-fine file
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 11,
        },
        {
            name   = 'Fomor Dragoon LM',
            ids    = { 146 },
            levels = {
                [79] = { acc = 355, eva = 326, agi = 75, int = 61, mnd = 69, chr = 87 },
                [80] = { acc = 360, eva = 331, agi = 75, int = 61, mnd = 69, chr = 87 },
                [81] = { acc = 367, eva = 336, agi = 77, int = 64, mnd = 71, chr = 90 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 12,
        },
        {
            name   = 'Fomors Wyvern',
            ids    = { 147 },
            levels = {
                [34] = { acc = 124, eva = 116, agi = 39, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 29, mnd = 29, chr = 33 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
        {
            name   = 'Fomor Dark Knight LM',
            ids    = { 148, 152, 158 },
            levels = {
                [79] = { acc = 337, eva = 318, agi = 75, int = 82, mnd = 55, chr = 60 },
                [80] = { acc = 342, eva = 323, agi = 75, int = 82, mnd = 55, chr = 60 },
                [81] = { acc = 349, eva = 328, agi = 77, int = 85, mnd = 58, chr = 63 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Fomor Black Mage LM',
            ids    = { 149 },
            levels = {
                [79] = { acc = 337, eva = 297, agi = 82, int = 96, mnd = 69, chr = 80 },
                [80] = { acc = 342, eva = 302, agi = 82, int = 96, mnd = 69, chr = 80 },
                [81] = { acc = 349, eva = 307, agi = 85, int = 98, mnd = 71, chr = 82 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 13,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 151, 185 },
            levels = {
                [41] = { acc = 169, eva = 131, agi = 54, int = 39, mnd = 42, chr = 42 },
                [42] = { acc = 172, eva = 133, agi = 54, int = 39, mnd = 42, chr = 42 },
                [43] = { acc = 175, eva = 137, agi = 56, int = 39, mnd = 42, chr = 42 },
                [79] = { acc = 381, eva = 304, agi = 96, int = 69, mnd = 75, chr = 74 },
                [80] = { acc = 386, eva = 309, agi = 96, int = 69, mnd = 75, chr = 74 },
                [81] = { acc = 393, eva = 314, agi = 98, int = 71, mnd = 77, chr = 76 },
            },
            spawn_levels = { [151] = { 79, 81 }, [185] = { 41, 43 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Summoner',
            ids    = { 153, 213 },
            levels = {
                [41] = { acc = 145, eva = 125, agi = 42, int = 50, mnd = 50, chr = 53 },
                [42] = { acc = 148, eva = 127, agi = 42, int = 50, mnd = 50, chr = 53 },
                [43] = { acc = 151, eva = 130, agi = 42, int = 50, mnd = 50, chr = 53 },
                [79] = { acc = 330, eva = 293, agi = 75, int = 88, mnd = 88, chr = 93 },
                [80] = { acc = 335, eva = 298, agi = 75, int = 88, mnd = 88, chr = 93 },
                [81] = { acc = 342, eva = 303, agi = 77, int = 91, mnd = 91, chr = 96 },
            },
            spawn_levels = { [153] = { 79, 81 }, [213] = { 41, 43 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 154, 214 },
            levels = {
                [34] = { acc = 124, eva = 111, agi = 37, int = 43, mnd = 34, chr = 35 },
                [35] = { acc = 127, eva = 113, agi = 37, int = 44, mnd = 35, chr = 35 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Fomor Beastmaster LM',
            ids    = { 155, 215 },
            levels = {
                [41] = { acc = 149, eva = 134, agi = 35, int = 39, mnd = 39, chr = 57 },
                [42] = { acc = 152, eva = 136, agi = 35, int = 39, mnd = 39, chr = 57 },
                [43] = { acc = 155, eva = 139, agi = 35, int = 39, mnd = 39, chr = 59 },
                [80] = { acc = 342, eva = 316, agi = 61, int = 69, mnd = 69, chr = 101 },
                [81] = { acc = 349, eva = 322, agi = 64, int = 71, mnd = 71, chr = 103 },
                [82] = { acc = 355, eva = 327, agi = 64, int = 71, mnd = 71, chr = 103 },
            },
            spawn_levels = { [155] = { 80, 82 }, [215] = { 41, 43 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Fomors Bat',
            ids    = { 156, 216 },
            levels = {
                [34] = { acc = 124, eva = 118, agi = 42, int = 29, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 121, agi = 42, int = 29, mnd = 29, chr = 33 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 8,
        },
        {
            name   = 'Death Jacket LM MC',
            ids    = { 160, 161, 162, 163, 164, 165 },
            levels = {
                [37] = { acc = 135, eva = 127, agi = 45, int = 31, mnd = 31, chr = 34 },
                [38] = { acc = 138, eva = 130, agi = 45, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 2,
        },
        {
            name   = 'Gigantobugard',
            ids    = { 166, 167, 168, 172, 174, 175, 187, 189, 190, 191, 197, 198, 199, 200, 205, 206, 218, 219,
                       220, 224, 225 },
            levels = {
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 149, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 142, agi = 47, int = 35, mnd = 35, chr = 39 },
                [43] = { acc = 155, eva = 145, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 150, item = 1640 },  -- bugard skin
                { rate = 10, item = 1622 },  -- bugard tusk
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Atomic Cluster',
            ids    = { 173, 217 },
            levels = {
                [44] = { acc = 161, eva = 149, agi = 49, int = 36, mnd = 36, chr = 43 },
                [45] = { acc = 164, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45 },
                [46] = { acc = 168, eva = 156, agi = 51, int = 37, mnd = 37, chr = 46 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 17305 },  -- cluster arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Gigas Braver',
            ids    = { 176, 201, 222, 229 },
            levels = {
                [41] = { acc = 152, eva = 139, agi = 45, int = 30, mnd = 35, chr = 42 },
                [42] = { acc = 155, eva = 141, agi = 45, int = 30, mnd = 35, chr = 42 },
                [43] = { acc = 158, eva = 144, agi = 45, int = 30, mnd = 35, chr = 42 },
                [44] = { acc = 162, eva = 148, agi = 46, int = 30, mnd = 36, chr = 43 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 15 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gigas Martialist',
            ids    = { 177, 202, 226 },
            levels = {
                [41] = { acc = 153, eva = 137, agi = 33, int = 27, mnd = 42, chr = 42 },
                [42] = { acc = 156, eva = 139, agi = 33, int = 27, mnd = 42, chr = 42 },
                [43] = { acc = 159, eva = 142, agi = 33, int = 27, mnd = 42, chr = 42 },
                [44] = { acc = 163, eva = 145, agi = 33, int = 27, mnd = 45, chr = 43 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gigas Catapulter',
            ids    = { 178, 193, 208 },
            levels = {
                [41] = { acc = 172, eva = 142, agi = 50, int = 33, mnd = 40, chr = 42 },
                [42] = { acc = 175, eva = 144, agi = 50, int = 33, mnd = 40, chr = 42 },
                [43] = { acc = 178, eva = 147, agi = 51, int = 33, mnd = 40, chr = 42 },
                [44] = { acc = 182, eva = 150, agi = 51, int = 33, mnd = 42, chr = 43 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Orcish Bowshooter LM',
            ids    = { 179, 204, 223 },
            levels = {
                [41] = { acc = 172, eva = 143, agi = 52, int = 33, mnd = 38, chr = 42 },
                [42] = { acc = 175, eva = 145, agi = 52, int = 33, mnd = 38, chr = 42 },
                [43] = { acc = 178, eva = 148, agi = 53, int = 33, mnd = 38, chr = 42 },
                [44] = { acc = 182, eva = 152, agi = 54, int = 33, mnd = 39, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Footsoldier LM',
            ids    = { 180, 194, 209, 230 },
            levels = {
                [41] = { acc = 152, eva = 140, agi = 47, int = 30, mnd = 33, chr = 42 },
                [42] = { acc = 155, eva = 142, agi = 47, int = 30, mnd = 33, chr = 42 },
                [43] = { acc = 158, eva = 145, agi = 47, int = 30, mnd = 33, chr = 42 },
                [44] = { acc = 162, eva = 149, agi = 49, int = 30, mnd = 33, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Gladiator',
            ids    = { 181, 195, 210 },
            levels = {
                [41] = { acc = 153, eva = 140, agi = 39, int = 28, mnd = 38, chr = 42 },
                [42] = { acc = 156, eva = 142, agi = 39, int = 28, mnd = 38, chr = 42 },
                [43] = { acc = 159, eva = 145, agi = 39, int = 28, mnd = 38, chr = 42 },
                [44] = { acc = 163, eva = 149, agi = 40, int = 28, mnd = 39, chr = 43 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Orcish Trooper',
            ids    = { 182, 203, 227 },
            levels = {
                [41] = { acc = 149, eva = 135, agi = 37, int = 28, mnd = 41, chr = 47 },
                [42] = { acc = 152, eva = 137, agi = 37, int = 28, mnd = 41, chr = 47 },
                [43] = { acc = 155, eva = 140, agi = 37, int = 28, mnd = 41, chr = 47 },
                [44] = { acc = 159, eva = 144, agi = 38, int = 28, mnd = 42, chr = 49 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 15, virus = 15 },
            drops  = {
                { rate = 50, item = 5154 },  -- tavnazian sheep liver
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 184, 245 },
            levels = {
                [42] = { acc = 156, eva = 176, agi = 50, int = 47, mnd = 32, chr = 35 },
                [43] = { acc = 160, eva = 179, agi = 50, int = 47, mnd = 32, chr = 35 },
                [44] = { acc = 163, eva = 183, agi = 52, int = 49, mnd = 33, chr = 36 },
                [52] = { acc = 195, eva = 227, agi = 59, int = 56, mnd = 38, chr = 42 },
                [53] = { acc = 201, eva = 233, agi = 61, int = 57, mnd = 39, chr = 42 },
                [54] = { acc = 206, eva = 238, agi = 61, int = 58, mnd = 39, chr = 43 },
            },
            spawn_levels = { [184] = { 42, 44 }, [245] = { 52, 54 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 186 },
            levels = {
                [41] = { acc = 169, eva = 131, agi = 54, int = 39, mnd = 42, chr = 42 },
                [42] = { acc = 172, eva = 133, agi = 54, int = 39, mnd = 42, chr = 42 },
                [43] = { acc = 175, eva = 137, agi = 56, int = 39, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 14,
        },
        {
            name   = 'Leshachikha',
            ids    = { 188, 233, 249, 250, 251, 252, 253 },
            levels = {
                [49] = { acc = 176, eva = 165, agi = 53, int = 40, mnd = 40, chr = 42 },
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 42 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 45 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 45 },
                [53] = { acc = 196, eva = 184, agi = 57, int = 43, mnd = 43, chr = 45 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 953 },  -- treant bulb
                { rate = 50, item = 574 },  -- bag of fruit seeds
                { rate = 10, item = 575 },  -- bag of grain seeds
            },
            links  = 15,
        },
        {
            name   = 'Gigas Warwolf',
            ids    = { 192, 207 },
            levels = {
                [41] = { acc = 152, eva = 133, agi = 33, int = 34, mnd = 39, chr = 57 },
                [42] = { acc = 155, eva = 135, agi = 33, int = 34, mnd = 39, chr = 57 },
                [43] = { acc = 158, eva = 138, agi = 33, int = 34, mnd = 39, chr = 59 },
                [44] = { acc = 162, eva = 141, agi = 33, int = 34, mnd = 40, chr = 60 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 15 },
            drops  = {
                { rate = 100, item = 1666 },  -- chameleon diamond
                { rate = 10, item = 499 },  -- gigas necklace
                { rate = 50, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Gigass Sheep',
            ids    = { 196, 211 },
            levels = {
                [34] = { acc = 124, eva = 116, agi = 39, int = 27, mnd = 29, chr = 32 },
                [35] = { acc = 127, eva = 119, agi = 39, int = 28, mnd = 29, chr = 33 },
                [36] = { acc = 132, eva = 124, agi = 42, int = 28, mnd = 30, chr = 34 },
            },
            spawn_levels = { [196] = { 34, 34 } },
            ranks  = { fire = -2, wind = -2, earth = -2, thunder = -3, water = -3, light = -2, dark = -2,
                       silence = -2, slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2,
                       stun = -3, gravity = -2 },
            links  = 3,
        },
        {
            name   = 'Megalobugard',
            ids    = { 221 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 100, item = 15324 },  -- caitiffs socks
                { rate = 100, item = 14659 },  -- hercules ring
                { rate = 100, item = 1640 },  -- bugard skin
                { rate = 50, item = 1718 },  -- megalobugard tusk
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Leshy',
            ids    = { 234, 235, 236, 237, 238, 239, 240, 241 },
            levels = {
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 45 },
                [53] = { acc = 196, eva = 184, agi = 57, int = 43, mnd = 43, chr = 45 },
                [54] = { acc = 202, eva = 190, agi = 58, int = 43, mnd = 43, chr = 45 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 923 },  -- dryad root
                { rate = 100, item = 918 },  -- sprig of mistletoe
                { rate = 50, item = 4448 },  -- puffball
                { rate = 10, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3000 },  -- mahogany log
                    { 702, 1500 },  -- ebony log
                    { 703, 1000 },  -- petrified log
                } },
            },
            links  = 15,
        },
        {
            name   = 'Colorful Leshy',
            ids    = { 242 },
            nm     = true,
            levels = {
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 46, chr = 47 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 46, mnd = 46, chr = 50 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 14804 },  -- harvest earring
                { rate = 50, item = 703 },  -- petrified log
                { rate = 150, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3500 },  -- mahogany log
                    { 702, 2000 },  -- ebony log
                } },
                { rate = 150, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3500 },  -- mahogany log
                    { 702, 2000 },  -- ebony log
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 16,
        },
        {
            name   = 'Defoliate Leshy',
            ids    = { 243 },
            nm     = true,
            levels = {
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 46, chr = 47 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 46, mnd = 46, chr = 50 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 14805 },  -- heims earring
                { rate = 50, item = 703 },  -- petrified log
                { rate = 150, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3500 },  -- mahogany log
                    { 702, 2000 },  -- ebony log
                } },
                { rate = 150, group = {  -- one of
                    { 701, 4500 },  -- rosewood log
                    { 700, 3500 },  -- mahogany log
                    { 702, 2000 },  -- ebony log
                } },
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 17,
        },
        {
            name   = 'Splinterspine Grukjuk',
            ids    = { 254 },
            levels = {
                [47] = { acc = 192, eva = 149, agi = 61, int = 37, mnd = 44, chr = 46 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 18,
        },
        {
            name   = 'Blackbone Frazdiz',
            ids    = { 255 },
            nm     = true,
            levels = {
                [40] = { acc = 147, eva = 134, agi = 40, int = 39, mnd = 27, chr = 32 },
                [41] = { acc = 152, eva = 138, agi = 42, int = 42, mnd = 30, chr = 35 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 19,
        },
        {
            name   = 'Rainbringer Yjatvot',
            ids    = { 256 },
            nm     = true,
            levels = {
                [40] = { acc = 147, eva = 123, agi = 44, int = 47, mnd = 35, chr = 43 },
                [41] = { acc = 152, eva = 127, agi = 47, int = 49, mnd = 37, chr = 45 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 20,
        },
        {
            name   = 'Baumesel',
            ids    = { 257 },
            nm     = true,
            levels = {
                [56] = { acc = 215, eva = 198, agi = 44, int = 41, mnd = 55, chr = 50 },
                [57] = { acc = 220, eva = 204, agi = 46, int = 41, mnd = 55, chr = 50 },
                [58] = { acc = 225, eva = 209, agi = 46, int = 41, mnd = 55, chr = 52 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            immune = { 'light_sleep', 'petrify', 'plague' },
        },
        {
            name   = 'Kurrea',
            ids    = { 258 },
            nm     = true,
            levels = {
                [84] = { acc = 367, eva = 336, agi = 82, int = 96, mnd = 77, chr = 80 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            drops  = {
                { rate = 1000, item = 15425 },  -- galliard trousers
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Amaltheia',
            ids    = { 259 },
            nm     = true,
            levels = {
                [83] = { acc = 351, eva = 309, agi = 71, int = 71, mnd = 100, chr = 85 },
                [84] = { acc = 357, eva = 315, agi = 72, int = 72, mnd = 101, chr = 87 },
                [85] = { acc = 364, eva = 320, agi = 74, int = 74, mnd = 102, chr = 87 },
                [86] = { acc = 370, eva = 325, agi = 74, int = 74, mnd = 102, chr = 89 },
                [87] = { acc = 376, eva = 329, agi = 75, int = 75, mnd = 105, chr = 90 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            immune = { 'stun', 'paralyze', 'slow', 'elegy', 'blind' },
            drops  = {
                { rate = 1000, item = 874 },  -- amaltheia hide
                { rate = 1000, item = 531 },  -- lanolin cube
                { rate = 150, item = 895 },  -- ram horn
                { rate = 240, item = 859 },  -- ram skin
                { rate = 150, item = 895 },  -- ram horn
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
                { rate = 150, item = 859 },  -- ram skin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 21,
        },
        {
            name   = 'Abununnu',
            ids    = { 260, 263, 266 },
            nm     = true,
            levels = {
                [105] = { acc = 480, eva = 426, agi = 106, int = 130, mnd = 79, chr = 103 },
                [106] = { acc = 481, eva = 432, agi = 108, int = 131, mnd = 79, chr = 104 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 22,
        },
        {
            name   = 'Gloam Servitor mage',
            ids    = { 261, 264, 267 },
            nm     = true,
            levels = {
                [101] = { acc = 476, eva = 421, agi = 93, int = 115, mnd = 87, chr = 101 },
                [102] = { acc = 476, eva = 426, agi = 93, int = 115, mnd = 87, chr = 101 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 22,
        },
        {
            name   = 'Gloam Servitor melee',
            ids    = { 262, 265, 268 },
            nm     = true,
            levels = {
                [101] = { acc = 479, eva = 438, agi = 104, int = 84, mnd = 67, chr = 93 },
                [102] = { acc = 479, eva = 443, agi = 104, int = 84, mnd = 67, chr = 93 },
            },
            ranks  = { light = -2, light_sleep = -2 },
            magic_dmg = { all = -25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 22,
        },
        {
            name   = 'Immanibugard',
            ids    = { 269, 270, 271 },
            nm     = true,
            levels = {},
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Vermillion Fishfly',
            ids    = { 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289,
                       290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            links  = 23,
        },
    },
    by_name = {},
}
