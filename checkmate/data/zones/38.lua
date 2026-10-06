-- Apollyon (zone 38).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Beetle', 'Arboricole Opo-opo', 'Arboricole Raven' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Crawler', 'Arboricole Spider', 'Armoury Crate',
                           'Fir Bholg', 'Jidra' },
        },
        [2] = {
            true_sight = { 'Arboricole Beetle', 'Arboricole Opo-opo', 'Arboricole Raven' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Crawler', 'Arboricole Spider', 'Armoury Crate',
                           'Fir Bholg', 'Jidra' },
        },
        [3] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Beetle', 'Arboricole Opo-opo' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Crawler', 'Arboricole Spider', 'Armoury Crate',
                           'Fir Bholg', 'Jidra' },
        },
        [4] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Beetle', 'Arboricole Raven' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Crawler', 'Arboricole Spider', 'Armoury Crate',
                           'Fir Bholg', 'Jidra' },
        },
        [5] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Beetle', 'Arboricole Opo-opo', 'Arboricole Raven' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Crawler', 'Armoury Crate', 'Fir Bholg', 'Jidra' },
        },
        [6] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Opo-opo', 'Arboricole Raven' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Crawler', 'Arboricole Spider', 'Armoury Crate',
                           'Fir Bholg', 'Jidra' },
        },
        [7] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Beetle', 'Arboricole Opo-opo', 'Arboricole Raven' },
            true_sound = { 'Apollyon Sapling', 'Arboricole Spider', 'Armoury Crate', 'Fir Bholg', 'Jidra' },
        },
        [8] = {
            sight = { 'Arboricole Hornet' },
            true_sight = { 'Arboricole Beetle', 'Arboricole Opo-opo', 'Arboricole Raven' },
            true_sound = { 'Arboricole Crawler', 'Arboricole Spider', 'Armoury Crate', 'Fir Bholg', 'Jidra' },
        },
        [9] = { superlink = { 'Air Elemental' } },
        [10] = { superlink = { 'Dark Elemental' } },
        [11] = { superlink = { 'Earth Elemental' } },
        [12] = { superlink = { 'Fire Elemental' } },
        [13] = { superlink = { 'Ice Elemental' } },
        [14] = { superlink = { 'Light Elemental' } },
        [15] = { superlink = { 'Water Elemental' } },
        [16] = { superlink = { 'Thunder Elemental' } },
        [17] = {
            true_sight = { 'Cynoprosopi', 'Gorynich', 'Kaiser Behemoth', 'Kronprinz Behemoth', 'Mountain Buffalo',
                           'Zlatorog' },
            true_sound = { 'Apollyon Scavenger', 'Bardha', 'Millenary Mossback' },
        },
        [18] = {
            true_sight = { 'Cynoprosopi', 'Gorynich', 'Kaiser Behemoth', 'Kronprinz Behemoth', 'Mountain Buffalo',
                           'Zlatorog' },
            true_sound = { 'Apollyon Scavenger', 'Bardha', 'Millenary Mossback', 'Pluto' },
        },
        [19] = {
            true_sight = { 'Cynoprosopi', 'Gorynich', 'Kaiser Behemoth', 'Kronprinz Behemoth', 'Mountain Buffalo' },
            true_sound = { 'Apollyon Scavenger', 'Bardha', 'Millenary Mossback', 'Pluto' },
        },
        [20] = {
            true_sight = { 'Cynoprosopi', 'Gorynich', 'Kaiser Behemoth', 'Kronprinz Behemoth', 'Mountain Buffalo',
                           'Zlatorog' },
            true_sound = { 'Apollyon Scavenger', 'Bardha', 'Pluto' },
        },
        [21] = {
            true_sight = { 'Gorynich', 'Kaiser Behemoth', 'Kronprinz Behemoth', 'Mountain Buffalo', 'Zlatorog' },
            true_sound = { 'Apollyon Scavenger', 'Bardha', 'Millenary Mossback', 'Pluto' },
        },
        [22] = {
            true_sight = { 'Cynoprosopi', 'Gorynich', 'Kronprinz Behemoth', 'Mountain Buffalo', 'Zlatorog' },
            true_sound = { 'Apollyon Scavenger', 'Bardha', 'Millenary Mossback', 'Pluto' },
        },
        [23] = {
            true_sound = { 'Adamantshell', 'Flying Spear', 'Grave Digger', 'Inhumer', 'Metalloid Amoeba',
                           'Tieholtsodi' },
        },
        [24] = {
            true_sound = { 'Adamantshell', 'Flying Spear', 'Ghost Clot', 'Grave Digger', 'Inhumer',
                           'Metalloid Amoeba', 'Tieholtsodi' },
        },
        [25] = {
            true_sound = { 'Adamantshell', 'Flying Spear', 'Ghost Clot', 'Grave Digger', 'Inhumer',
                           'Metalloid Amoeba' },
        },
        [26] = {
            true_sound = { 'Adamantshell', 'Flying Spear', 'Ghost Clot', 'Inhumer', 'Metalloid Amoeba',
                           'Tieholtsodi' },
        },
        [27] = {
            sight = { 'Hieracosphinx' },
            true_sight = { 'Cornu', 'Criosphinx', 'Cronos', 'Hyperion', 'Kerkopes', 'Okeanos', 'Sirin',
                           'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Thiazi' },
        },
        [28] = {
            sight = { 'Hieracosphinx' },
            true_sight = { 'Cornu', 'Criosphinx', 'Cronos', 'Hyperion', 'Kerkopes', 'Okeanos', 'Sirin',
                           'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Goobbue Harvester', 'Thiazi' },
        },
        [29] = {
            sight = { 'Hieracosphinx' },
            true_sight = { 'Cornu', 'Criosphinx', 'Cronos', 'Kerkopes', 'Okeanos', 'Sirin', 'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Goobbue Harvester', 'Thiazi' },
        },
        [30] = {
            sight = { 'Hieracosphinx' },
            true_sight = { 'Cornu', 'Criosphinx', 'Cronos', 'Hyperion', 'Kerkopes', 'Sirin', 'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Goobbue Harvester', 'Thiazi' },
        },
        [31] = {
            sight = { 'Hieracosphinx' },
            true_sight = { 'Cornu', 'Criosphinx', 'Hyperion', 'Kerkopes', 'Okeanos', 'Sirin',
                           'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Goobbue Harvester', 'Thiazi' },
        },
        [32] = {
            sight = { 'Hieracosphinx' },
            true_sight = { 'Cornu', 'Cronos', 'Hyperion', 'Kerkopes', 'Okeanos', 'Sirin', 'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Goobbue Harvester', 'Thiazi' },
        },
        [33] = {
            true_sight = { 'Cornu', 'Criosphinx', 'Cronos', 'Hyperion', 'Kerkopes', 'Okeanos', 'Sirin',
                           'Troglodyte Dhalmel' },
            true_sound = { 'Barometz', 'Bialozar', 'Borametz', 'Goobbue Harvester', 'Thiazi' },
        },
        [34] = { sound = { 'Gunpod' } },
        [35] = { true_both = { 'Proto-Omega' } },
        [36] = {
            superlink = { 'Grognard Footsoldier', 'Grognard Grappler', 'Grognard Impaler', 'Grognard Mesmerizer',
                          'Grognard Neckchopper', 'Grognard Predator' },
        },
        [37] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Footsoldier', 'Grognard Grappler',
                          'Grognard Impaler', 'Grognard Neckchopper', 'Grognard Predator' },
        },
        [38] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Footsoldier', 'Grognard Grappler',
                          'Grognard Impaler', 'Grognard Mesmerizer', 'Grognard Predator' },
        },
        [39] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Grappler', 'Grognard Impaler', 'Grognard Mesmerizer',
                          'Grognard Neckchopper', 'Grognard Predator' },
        },
        [40] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Footsoldier', 'Grognard Impaler',
                          'Grognard Mesmerizer', 'Grognard Neckchopper', 'Grognard Predator' },
        },
        [41] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Footsoldier', 'Grognard Grappler',
                          'Grognard Impaler', 'Grognard Mesmerizer', 'Grognard Neckchopper' },
        },
        [42] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Footsoldier', 'Grognard Grappler',
                          'Grognard Mesmerizer', 'Grognard Neckchopper', 'Grognard Predator' },
        },
        [43] = {
            superlink = { 'Carnagechief Jackbodokk', 'Grognard Footsoldier', 'Grognard Grappler',
                          'Grognard Impaler', 'Grognard Mesmerizer', 'Grognard Neckchopper', 'Grognard Predator' },
        },
        [44] = {
            superlink = { 'Fossil Quadav', 'Lightsteel Quadav', 'Star Ruby Quadav', 'Star Sapphire Quadav',
                          'Whitegold Quadav', 'Wootz Quadav' },
        },
        [45] = {
            superlink = { 'Fossil Quadav', 'Lightsteel Quadav', 'NaQba Chirurgeon', 'Star Sapphire Quadav',
                          'Whitegold Quadav', 'Wootz Quadav' },
        },
        [46] = {
            superlink = { 'Fossil Quadav', 'Lightsteel Quadav', 'NaQba Chirurgeon', 'Star Ruby Quadav',
                          'Star Sapphire Quadav', 'Whitegold Quadav' },
        },
        [47] = {
            superlink = { 'Lightsteel Quadav', 'NaQba Chirurgeon', 'Star Ruby Quadav', 'Star Sapphire Quadav',
                          'Whitegold Quadav', 'Wootz Quadav' },
        },
        [48] = {
            superlink = { 'Fossil Quadav', 'Lightsteel Quadav', 'NaQba Chirurgeon', 'Star Ruby Quadav',
                          'Whitegold Quadav', 'Wootz Quadav' },
        },
        [49] = {
            superlink = { 'Fossil Quadav', 'Lightsteel Quadav', 'NaQba Chirurgeon', 'Star Ruby Quadav',
                          'Star Sapphire Quadav', 'Wootz Quadav' },
        },
        [50] = {
            superlink = { 'Fossil Quadav', 'NaQba Chirurgeon', 'Star Ruby Quadav', 'Star Sapphire Quadav',
                          'Whitegold Quadav', 'Wootz Quadav' },
        },
        [51] = {
            superlink = { 'Yagudo Archpriest', 'Yagudo Disciplinant', 'Yagudo Eradicator', 'Yagudo Kapellmeister',
                          'Yagudo Knight Templar', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
        [52] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Disciplinant', 'Yagudo Eradicator',
                          'Yagudo Kapellmeister', 'Yagudo Knight Templar', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
        [53] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Disciplinant', 'Yagudo Eradicator',
                          'Yagudo Kapellmeister', 'Yagudo Knight Templar', 'Yagudo Prelatess' },
        },
        [54] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Disciplinant', 'Yagudo Eradicator',
                          'Yagudo Kapellmeister', 'Yagudo Knight Templar', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
        [55] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Disciplinant', 'Yagudo Eradicator',
                          'Yagudo Kapellmeister', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
        [56] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Eradicator',
                          'Yagudo Kapellmeister', 'Yagudo Knight Templar', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
        [57] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Disciplinant', 'Yagudo Eradicator',
                          'Yagudo Kapellmeister', 'Yagudo Knight Templar', 'Yagudos Avatar' },
        },
        [58] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Disciplinant', 'Yagudo Eradicator',
                          'Yagudo Knight Templar', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
        [59] = {
            superlink = { 'Dee Wapa the Desolator', 'Yagudo Archpriest', 'Yagudo Disciplinant',
                          'Yagudo Kapellmeister', 'Yagudo Knight Templar', 'Yagudo Prelatess', 'Yagudos Avatar' },
        },
    },
    monsters = {
        {
            name   = 'Armoury Crate',
            ids    = { 3, 16, 34, 72, 85, 98, 119, 126, 140, 154, 189, 197, 214, 234 },
            levels = {
                [1] = { acc = 11, eva = 10, agi = 10, int = 7, mnd = 7, chr = 6 },
            },
        },
        {
            name   = 'Fir Bholg',
            ids    = { 4, 9 },
            nm     = true,
            levels = {
                [75] = { acc = 321, eva = 367, agi = 83, int = 77, mnd = 52, chr = 57 },
                [76] = { acc = 327, eva = 373, agi = 84, int = 80, mnd = 54, chr = 59 },
                [77] = { acc = 332, eva = 379, agi = 86, int = 80, mnd = 54, chr = 59 },
                [78] = { acc = 337, eva = 384, agi = 86, int = 80, mnd = 54, chr = 59 },
                [79] = { acc = 344, eva = 390, agi = 88, int = 82, mnd = 55, chr = 60 },
                [80] = { acc = 349, eva = 395, agi = 88, int = 82, mnd = 55, chr = 60 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Fir Bholg',
            ids    = { 5, 10 },
            nm     = true,
            levels = {
                [75] = { acc = 308, eva = 288, agi = 52, int = 52, mnd = 77, chr = 82 },
                [76] = { acc = 314, eva = 293, agi = 54, int = 54, mnd = 80, chr = 85 },
                [77] = { acc = 319, eva = 298, agi = 54, int = 54, mnd = 80, chr = 85 },
                [78] = { acc = 325, eva = 303, agi = 54, int = 54, mnd = 80, chr = 85 },
                [79] = { acc = 330, eva = 308, agi = 55, int = 55, mnd = 82, chr = 87 },
                [80] = { acc = 335, eva = 313, agi = 55, int = 55, mnd = 82, chr = 87 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Fir Bholg',
            ids    = { 6, 11 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 304, agi = 70, int = 65, mnd = 65, chr = 75 },
                [76] = { acc = 321, eva = 310, agi = 72, int = 66, mnd = 66, chr = 77 },
                [77] = { acc = 326, eva = 315, agi = 72, int = 66, mnd = 66, chr = 77 },
                [78] = { acc = 331, eva = 320, agi = 72, int = 68, mnd = 68, chr = 77 },
                [79] = { acc = 337, eva = 326, agi = 75, int = 69, mnd = 69, chr = 80 },
                [80] = { acc = 342, eva = 331, agi = 75, int = 69, mnd = 69, chr = 80 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Fir Bholg',
            ids    = { 7, 12 },
            nm     = true,
            levels = {
                [75] = { acc = 311, eva = 285, agi = 65, int = 77, mnd = 77, chr = 75 },
                [76] = { acc = 317, eva = 291, agi = 66, int = 80, mnd = 80, chr = 77 },
                [77] = { acc = 322, eva = 295, agi = 66, int = 80, mnd = 80, chr = 77 },
                [78] = { acc = 327, eva = 301, agi = 68, int = 80, mnd = 80, chr = 77 },
                [79] = { acc = 333, eva = 306, agi = 69, int = 82, mnd = 82, chr = 80 },
                [80] = { acc = 338, eva = 311, agi = 69, int = 82, mnd = 82, chr = 80 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Fir Bholg',
            ids    = { 8, 13 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 80, mnd = 63, chr = 73 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 81, mnd = 64, chr = 75 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 82, mnd = 64, chr = 75 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 82, mnd = 65, chr = 76 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 84, mnd = 66, chr = 78 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 84, mnd = 66, chr = 78 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 1,
        },
        {
            name   = 'Jidra',
            ids    = { 17 },
            nm     = true,
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 65 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 67 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'bind', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Jidra',
            ids    = { 18, 19, 20, 21, 22, 23, 24 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 65 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Arboricole Hornet',
            ids    = { 25 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Arboricole Raven',
            ids    = { 26 },
            nm     = true,
            levels = {
                [75] = { acc = 321, eva = 370, agi = 88, int = 77, mnd = 52, chr = 52 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Arboricole Opo-opo',
            ids    = { 27 },
            nm     = true,
            levels = {
                [75] = { acc = 319, eva = 305, agi = 86, int = 50, mnd = 50, chr = 74 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Arboricole Spider',
            ids    = { 28 },
            nm     = true,
            levels = {
                [75] = { acc = 319, eva = 297, agi = 70, int = 82, mnd = 57, chr = 44 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 5,
        },
        {
            name   = 'Arboricole Beetle',
            ids    = { 29 },
            nm     = true,
            levels = {
                [75] = { acc = 311, eva = 286, agi = 49, int = 49, mnd = 74, chr = 74 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Arboricole Crawler',
            ids    = { 30 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Apollyon Sapling',
            ids    = { 31 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 62 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Armoury Crate',
            ids    = { 35, 36, 37, 38, 39, 40, 41, 42, 43, 44 },
            nm     = true,
            levels = {
                [75] = { acc = 321, eva = 371, agi = 90, int = 80, mnd = 63, chr = 48 },
            },
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            no_aggro = true,
            links  = 1,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Air Elemental',
            ids    = { 46, 54, 62 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            immune = { 'light_sleep', 'gravity', 'silence', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 9,
        },
        {
            name   = 'Dark Elemental',
            ids    = { 47, 55, 63 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'blind', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 10,
        },
        {
            name   = 'Earth Elemental',
            ids    = { 48, 56, 64 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'silence', 'stun', 'slow', 'elegy', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 11,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 49, 57, 65 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'light_sleep', 'bind', 'silence', 'paralyze', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 12,
        },
        {
            name   = 'Ice Elemental',
            ids    = { 50, 58, 66 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { fire = -3, ice = 11, wind = 11, paralyze = 11, bind = 11, silence = 11, gravity = 11 },
            immune = { 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 13,
        },
        {
            name   = 'Light Elemental',
            ids    = { 51, 59, 67 },
            nm     = true,
            levels = {
                [70] = { acc = 278, eva = 246, agi = 61, int = 61, mnd = 85, chr = 73 },
            },
            ranks  = { light = 11, dark = -3, light_sleep = 11, dark_sleep = -3, blind = -3 },
            immune = { 'light_sleep', 'silence', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 14,
        },
        {
            name   = 'Water Elemental',
            ids    = { 52, 60, 68 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'light_sleep', 'silence', 'poison', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 15,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 53, 61, 69 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 252, agi = 73, int = 85, mnd = 61, chr = 67 },
            },
            ranks  = { earth = -3, thunder = 11, water = 11, slow = -3, poison = 11, stun = 11 },
            immune = { 'light_sleep', 'silence', 'stun', 'poison', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'magic' },
            links  = 16,
        },
        {
            name   = 'Pluto',
            ids    = { 73 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 57, chr = 74 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            immune = { 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 17,
        },
        {
            name   = 'Bardha',
            ids    = { 74, 75, 76, 77, 78, 79, 80 },
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 85, mnd = 60, chr = 73 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 86, mnd = 60, chr = 75 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 87, mnd = 60, chr = 75 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'paralyze', 'petrify' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 18,
        },
        {
            name   = 'Zlatorog',
            ids    = { 86 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = -2, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            immune = { 'light_sleep', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 19,
        },
        {
            name   = 'Mountain Buffalo',
            ids    = { 87, 88, 89, 90, 91, 92, 93 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { fire = -1, ice = 2, wind = -1, earth = -1, thunder = -1, water = -2, light = -1, dark = -1,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -2, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'light_sleep', 'petrify' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 18,
        },
        {
            name   = 'Millenary Mossback',
            ids    = { 99 },
            levels = {
                [80] = { acc = 335, eva = 313, agi = 55, int = 69, mnd = 96, chr = 96 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            magic_dmg = { all = -50 },
            immune = { 'dark_sleep', 'light_sleep', 'slow', 'poison', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 20,
        },
        {
            name   = 'Apollyon Scavenger',
            ids    = { 100, 101, 102, 103, 104, 105, 106 },
            nm     = true,
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
            },
            ranks  = { fire = 2, ice = -2, wind = -1, earth = -1, thunder = -1, water = -1, light = 2, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = -1, light_sleep = 2,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'light_sleep', 'petrify' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 18,
        },
        {
            name   = 'Cynoprosopi',
            ids    = { 112 },
            levels = {
                [85] = { acc = 382, eva = 358, agi = 96, int = 81, mnd = 57, chr = 83 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, paralyze = 11, bind = 11, poison = -2 },
            immune = { 'light_sleep', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 21,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Gorynich',
            ids    = { 113, 114, 115, 116, 117 },
            levels = {
                [79] = { acc = 339, eva = 322, agi = 82, int = 70, mnd = 57, chr = 65 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'light_sleep', 'petrify' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 18,
        },
        {
            name   = 'Kaiser Behemoth',
            ids    = { 121 },
            nm     = true,
            levels = {
                [85] = { acc = 382, eva = 424, agi = 96, int = 85, mnd = 66, chr = 69 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -30 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'stun', 'slow', 'petrify' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 22,
        },
        {
            name   = 'Kronprinz Behemoth',
            ids    = { 122, 123, 124 },
            nm     = true,
            levels = {
                [78] = { acc = 338, eva = 385, agi = 89, int = 78, mnd = 61, chr = 64 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'light_sleep', 'petrify' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 18,
        },
        {
            name   = 'Ghost Clot',
            ids    = { 128 },
            nm     = true,
            levels = {
                [82] = { acc = 355, eva = 335, agi = 81, int = 64, mnd = 69, chr = 71 },
                [83] = { acc = 361, eva = 340, agi = 81, int = 64, mnd = 69, chr = 71 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 23,
        },
        {
            name   = 'Metalloid Amoeba',
            ids    = { 129, 130, 131, 132, 133, 134, 135, 136, 137, 138 },
            levels = {
                [80] = { acc = 342, eva = 325, agi = 78, int = 61, mnd = 66, chr = 69 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 24,
        },
        {
            name   = 'Tieholtsodi',
            ids    = { 142 },
            levels = {
                [80] = { acc = 343, eva = 324, agi = 61, int = 55, mnd = 75, chr = 69 },
                [81] = { acc = 350, eva = 330, agi = 64, int = 58, mnd = 77, chr = 71 },
                [82] = { acc = 356, eva = 335, agi = 64, int = 58, mnd = 77, chr = 71 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 25,
        },
        {
            name   = 'Adamantshell',
            ids    = { 143, 144, 145, 146, 147, 148, 149, 150, 151, 152 },
            levels = {
                [78] = { acc = 325, eva = 301, agi = 51, int = 54, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 24,
        },
        {
            name   = 'Grave Digger',
            ids    = { 156 },
            nm     = true,
            levels = {
                [85] = { acc = 374, eva = 329, agi = 92, int = 102, mnd = 74, chr = 71 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            immune = { 'dark_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 26,
        },
        {
            name   = 'Inhumer',
            ids    = { 157, 158, 159, 160, 161, 162, 163, 164, 165, 166 },
            levels = {
                [80] = { acc = 344, eva = 302, agi = 82, int = 96, mnd = 65, chr = 75 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 24,
        },
        {
            name   = 'Evil Armory',
            ids    = { 168 },
            nm     = true,
            levels = {
                [81] = { acc = 349, eva = 328, agi = 76, int = 92, mnd = 78, chr = 84 },
                [82] = { acc = 355, eva = 333, agi = 76, int = 92, mnd = 78, chr = 84 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            nullify = { all = 100 },
            immune = { 'light_sleep', 'terror', 'plague' },
            no_aggro = true,
            links  = 24,
            flags  = { scripted_aggro = true, scripted_elements = true },
        },
        {
            name   = 'Flying Spear',
            ids    = { 169, 170, 171, 172, 173, 174, 175, 176 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 312, agi = 72, int = 87, mnd = 73, chr = 80 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            nullify = { all = 100 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 24,
        },
        {
            name   = 'Goobbue Harvester',
            ids    = { 180 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -2, dark = -2, dark_sleep = -2, blind = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 27,
        },
        {
            name   = 'Barometz',
            ids    = { 181, 183, 185, 187, 193 },
            levels = {
                [70] = { acc = 292, eva = 272, agi = 55, int = 49, mnd = 67, chr = 61 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Borametz',
            ids    = { 182, 184, 186, 188, 194 },
            levels = {
                [70] = { acc = 292, eva = 272, agi = 55, int = 49, mnd = 67, chr = 61 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Barometz',
            ids    = { 191 },
            levels = {
                [70] = { acc = 292, eva = 272, agi = 55, int = 49, mnd = 67, chr = 61 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Borametz',
            ids    = { 192 },
            levels = {
                [70] = { acc = 292, eva = 272, agi = 55, int = 49, mnd = 67, chr = 61 },
            },
            ranks  = { fire = -3, ice = -3, wind = -3, thunder = -3, dark = -3, paralyze = -3, bind = -3,
                       silence = -3, dark_sleep = -3, blind = -3, stun = -3, gravity = -3 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 150, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Thiazi',
            ids    = { 198, 199 },
            levels = {
                [78] = { acc = 331, eva = 312, agi = 72, int = 73, mnd = 73, chr = 85 },
                [79] = { acc = 337, eva = 317, agi = 73, int = 75, mnd = 75, chr = 87 },
                [80] = { acc = 342, eva = 322, agi = 73, int = 75, mnd = 75, chr = 87 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Bialozar',
            ids    = { 200 },
            levels = {
                [78] = { acc = 331, eva = 312, agi = 72, int = 73, mnd = 73, chr = 85 },
                [79] = { acc = 337, eva = 317, agi = 73, int = 75, mnd = 75, chr = 87 },
                [80] = { acc = 342, eva = 322, agi = 73, int = 75, mnd = 75, chr = 87 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Bialozar',
            ids    = { 201 },
            levels = {
                [78] = { acc = 331, eva = 312, agi = 72, int = 73, mnd = 73, chr = 85 },
                [79] = { acc = 337, eva = 317, agi = 73, int = 75, mnd = 75, chr = 87 },
                [80] = { acc = 342, eva = 322, agi = 73, int = 75, mnd = 75, chr = 87 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 28,
        },
        {
            name   = 'Cornu',
            ids    = { 202, 203, 204, 205 },
            levels = {
                [78] = { acc = 337, eva = 386, agi = 91, int = 80, mnd = 54, chr = 54 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 28,
        },
        {
            name   = 'Sirin',
            ids    = { 206, 207, 208, 209 },
            levels = {
                [78] = { acc = 337, eva = 386, agi = 91, int = 80, mnd = 54, chr = 54 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 28,
        },
        {
            name   = 'Apollyon Sweeper',
            ids    = { 217, 222, 227 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 325, agi = 78, int = 61, mnd = 61, chr = 74 },
                [81] = { acc = 352, eva = 330, agi = 81, int = 64, mnd = 64, chr = 76 },
                [82] = { acc = 358, eva = 335, agi = 81, int = 64, mnd = 64, chr = 76 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            immune = { 'light_sleep', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Apollyon Cleaner',
            ids    = { 218, 219, 220, 221, 223, 224, 225, 226, 228, 229, 230, 231 },
            levels = {
                [78] = { acc = 331, eva = 310, agi = 69, int = 82, mnd = 78, chr = 76 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Hyperion',
            ids    = { 235 },
            levels = {
                [80] = { acc = 346, eva = 325, agi = 78, int = 52, mnd = 61, chr = 74 },
                [81] = { acc = 354, eva = 330, agi = 81, int = 55, mnd = 64, chr = 76 },
                [82] = { acc = 360, eva = 335, agi = 81, int = 55, mnd = 64, chr = 76 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 25 },
            nullify = { all = 100 },
            immune = { 'light_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 29,
        },
        {
            name   = 'Okeanos',
            ids    = { 236 },
            levels = {
                [80] = { acc = 346, eva = 325, agi = 78, int = 52, mnd = 61, chr = 74 },
                [81] = { acc = 354, eva = 330, agi = 81, int = 55, mnd = 64, chr = 76 },
                [82] = { acc = 360, eva = 335, agi = 81, int = 55, mnd = 64, chr = 76 },
            },
            ranks  = { ice = 4, earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 25 },
            immune = { 'light_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 30,
        },
        {
            name   = 'Cronos',
            ids    = { 237 },
            levels = {
                [80] = { acc = 346, eva = 325, agi = 78, int = 52, mnd = 61, chr = 74 },
                [81] = { acc = 354, eva = 330, agi = 81, int = 55, mnd = 64, chr = 76 },
                [82] = { acc = 360, eva = 335, agi = 81, int = 55, mnd = 64, chr = 76 },
            },
            ranks  = { ice = 4, earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 25 },
            immune = { 'light_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 31,
        },
        {
            name   = 'Kerkopes',
            ids    = { 238 },
            levels = {
                [80] = { acc = 346, eva = 331, agi = 91, int = 52, mnd = 52, chr = 78 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 28,
        },
        {
            name   = 'Kerkopes',
            ids    = { 239, 240, 241, 242, 243, 244, 245 },
            levels = {
                [80] = { acc = 346, eva = 331, agi = 91, int = 52, mnd = 52, chr = 78 },
            },
            ranks  = { fire = -2, ice = -3, wind = -1, water = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -1, poison = -2, dark_sleep = -2, blind = -2, gravity = -1 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 28,
        },
        {
            name   = 'Criosphinx',
            ids    = { 249 },
            levels = {
                [79] = { acc = 335, eva = 320, agi = 78, int = 61, mnd = 61, chr = 60 },
                [80] = { acc = 340, eva = 325, agi = 78, int = 61, mnd = 61, chr = 60 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'slow', 'elegy', 'petrify', 'terror',
                       'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 32,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Hieracosphinx',
            ids    = { 250 },
            levels = {
                [79] = { acc = 335, eva = 320, agi = 78, int = 61, mnd = 61, chr = 60 },
                [80] = { acc = 340, eva = 325, agi = 78, int = 61, mnd = 61, chr = 60 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'slow', 'elegy', 'petrify', 'terror',
                       'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 33,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Troglodyte Dhalmel',
            ids    = { 251, 252, 253, 254, 255, 256, 257, 258 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 314, agi = 77, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -2, wind = -3, thunder = -3, water = -2, light = -2, dark = -2, silence = -3,
                       poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3, gravity = -3 },
            immune = { 'light_sleep', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 28,
        },
        {
            name   = 'Proto-Omega',
            ids    = { 260 },
            nm     = true,
            levels = {
                [85] = { acc = 379, eva = 357, agi = 78, int = 66, mnd = 80, chr = 79 },
            },
            ranks  = { thunder = -1, dark = 11, dark_sleep = 11, blind = 11, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'blind', 'terror', 'plague' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 34,
            flags  = { scripted_elements = true },
        },
        {
            name   = 'Gunpod',
            ids    = { 261 },
            levels = {
                [85] = { acc = 377, eva = 361, agi = 102, int = 75, mnd = 62, chr = 79 },
            },
            ranks  = { thunder = -3, stun = -3 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity', 'silence', 'blind', 'terror', 'plague' },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'magic' },
            links  = 35,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Carnagechief Jackbodokk',
            ids    = { 265 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 313, agi = 55, int = 46, mnd = 78, chr = 87 },
                [81] = { acc = 347, eva = 319, agi = 58, int = 49, mnd = 81, chr = 90 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { sleep = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 36,
        },
        {
            name   = 'Grognard Mesmerizer',
            ids    = { 266 },
            levels = {
                [77] = { acc = 330, eva = 287, agi = 80, int = 85, mnd = 62, chr = 77 },
                [78] = { acc = 335, eva = 292, agi = 80, int = 85, mnd = 65, chr = 77 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 37,
        },
        {
            name   = 'Grognard Neckchopper',
            ids    = { 267 },
            levels = {
                [77] = { acc = 330, eva = 307, agi = 72, int = 72, mnd = 50, chr = 59 },
                [78] = { acc = 335, eva = 312, agi = 72, int = 72, mnd = 51, chr = 59 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { paralyze = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 38,
        },
        {
            name   = 'Grognard Footsoldier',
            ids    = { 268 },
            levels = {
                [77] = { acc = 330, eva = 311, agi = 80, int = 52, mnd = 56, chr = 71 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 52, mnd = 57, chr = 73 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { virus = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 39,
        },
        {
            name   = 'Grognard Grappler',
            ids    = { 269 },
            levels = {
                [77] = { acc = 333, eva = 309, agi = 60, int = 46, mnd = 68, chr = 71 },
                [78] = { acc = 338, eva = 314, agi = 60, int = 46, mnd = 69, chr = 73 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 40,
        },
        {
            name   = 'Grognard Predator',
            ids    = { 270 },
            levels = {
                [77] = { acc = 374, eva = 293, agi = 93, int = 58, mnd = 68, chr = 71 },
                [78] = { acc = 379, eva = 298, agi = 93, int = 60, mnd = 69, chr = 73 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            resist = { poison = 20 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 41,
        },
        {
            name   = 'Grognard Impaler',
            ids    = { 271 },
            levels = {
                [77] = { acc = 348, eva = 315, agi = 72, int = 52, mnd = 62, chr = 85 },
                [78] = { acc = 353, eva = 320, agi = 72, int = 52, mnd = 65, chr = 85 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 42,
        },
        {
            name   = 'Orcs Wyvern A',
            ids    = { 272 },
            levels = {
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            links  = 43,
        },
        {
            name   = 'NaQba Chirurgeon',
            ids    = { 273 },
            nm     = true,
            levels = {
                [80] = { acc = 336, eva = 295, agi = 69, int = 65, mnd = 96, chr = 82 },
                [81] = { acc = 343, eva = 300, agi = 71, int = 67, mnd = 98, chr = 85 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 44,
        },
        {
            name   = 'Star Ruby Quadav',
            ids    = { 274 },
            levels = {
                [77] = { acc = 326, eva = 295, agi = 66, int = 76, mnd = 80, chr = 72 },
                [78] = { acc = 331, eva = 301, agi = 68, int = 77, mnd = 80, chr = 72 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { petrify = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 45,
        },
        {
            name   = 'Wootz Quadav',
            ids    = { 275 },
            levels = {
                [77] = { acc = 330, eva = 307, agi = 72, int = 76, mnd = 54, chr = 54 },
                [78] = { acc = 335, eva = 312, agi = 72, int = 77, mnd = 54, chr = 54 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { paralyze = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 46,
        },
        {
            name   = 'Fossil Quadav',
            ids    = { 276 },
            levels = {
                [77] = { acc = 330, eva = 311, agi = 80, int = 56, mnd = 60, chr = 66 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 57, mnd = 60, chr = 68 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { virus = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 47,
        },
        {
            name   = 'Star Sapphire Quadav',
            ids    = { 277 },
            levels = {
                [77] = { acc = 330, eva = 287, agi = 80, int = 89, mnd = 66, chr = 72 },
                [78] = { acc = 335, eva = 292, agi = 80, int = 90, mnd = 68, chr = 72 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 48,
        },
        {
            name   = 'Whitegold Quadav',
            ids    = { 278 },
            levels = {
                [77] = { acc = 337, eva = 379, agi = 86, int = 76, mnd = 54, chr = 54 },
                [78] = { acc = 342, eva = 384, agi = 86, int = 77, mnd = 54, chr = 54 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { gravity = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 49,
        },
        {
            name   = 'Lightsteel Quadav',
            ids    = { 279 },
            levels = {
                [77] = { acc = 323, eva = 298, agi = 54, int = 50, mnd = 80, chr = 80 },
                [78] = { acc = 329, eva = 303, agi = 54, int = 51, mnd = 80, chr = 80 },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            resist = { sleep = 25 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 50,
        },
        {
            name   = 'Dee Wapa the Desolator',
            ids    = { 280 },
            nm     = true,
            levels = {
                [80] = { acc = 338, eva = 301, agi = 80, int = 88, mnd = 84, chr = 93 },
                [81] = { acc = 345, eva = 306, agi = 82, int = 91, mnd = 87, chr = 96 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { slow = 20 },
            magic_dmg = { all = -95 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 51,
        },
        {
            name   = 'Yagudos Elemental',
            ids    = { 281 },
            levels = {
                [77] = { acc = 326, eva = 287, agi = 80, int = 93, mnd = 66, chr = 72 },
                [78] = { acc = 331, eva = 292, agi = 80, int = 93, mnd = 68, chr = 72 },
            },
            ranks  = { ice = -3, wind = 11, earth = 11, paralyze = -3, bind = -3, silence = 11, slow = 11,
                       gravity = 11 },
            magic_dmg = { all = -95 },
            immune = { 'light_sleep', 'bind', 'gravity', 'silence', 'slow', 'elegy', 'petrify', 'terror',
                       'plague' },
            links  = 52,
        },
        {
            name   = 'Yagudos Avatar',
            ids    = { 282 },
            levels = {
                [77] = { acc = 326, eva = 287, agi = 80, int = 93, mnd = 66, chr = 72 },
                [78] = { acc = 331, eva = 292, agi = 80, int = 93, mnd = 68, chr = 72 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -95 },
            links  = 53,
        },
        {
            name   = 'Yagudo Archpriest',
            ids    = { 283 },
            levels = {
                [77] = { acc = 318, eva = 282, agi = 71, int = 66, mnd = 89, chr = 85 },
                [78] = { acc = 323, eva = 288, agi = 73, int = 68, mnd = 90, chr = 85 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            magic_dmg = { all = -95 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 54,
        },
        {
            name   = 'Yagudo Knight Templar',
            ids    = { 284 },
            levels = {
                [77] = { acc = 328, eva = 317, agi = 77, int = 66, mnd = 62, chr = 77 },
                [78] = { acc = 333, eva = 322, agi = 77, int = 68, mnd = 65, chr = 77 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { blind = 25 },
            magic_dmg = { all = -95 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 55,
        },
        {
            name   = 'Yagudo Disciplinant',
            ids    = { 285 },
            levels = {
                [77] = { acc = 331, eva = 311, agi = 65, int = 54, mnd = 68, chr = 71 },
                [78] = { acc = 336, eva = 316, agi = 65, int = 54, mnd = 69, chr = 73 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            magic_dmg = { all = -95 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 56,
        },
        {
            name   = 'Yagudo Prelatess',
            ids    = { 286 },
            levels = {
                [77] = { acc = 328, eva = 289, agi = 85, int = 93, mnd = 62, chr = 77 },
                [78] = { acc = 333, eva = 294, agi = 85, int = 93, mnd = 65, chr = 77 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            magic_dmg = { all = -95 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 57,
        },
        {
            name   = 'Yagudo Kapellmeister',
            ids    = { 287 },
            levels = {
                [77] = { acc = 324, eva = 294, agi = 65, int = 72, mnd = 68, chr = 91 },
                [78] = { acc = 329, eva = 299, agi = 65, int = 72, mnd = 69, chr = 91 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { silence = 25 },
            magic_dmg = { all = -95 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 58,
        },
        {
            name   = 'Yagudo Eradicator',
            ids    = { 288 },
            levels = {
                [77] = { acc = 331, eva = 333, agi = 91, int = 72, mnd = 50, chr = 65 },
                [78] = { acc = 336, eva = 338, agi = 91, int = 72, mnd = 51, chr = 65 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            resist = { bind = 25 },
            magic_dmg = { all = -95 },
            immune = { 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 1000, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
                { rate = 100, item = 1875 },  -- ancient beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 59,
        },
    },
    by_name = {},
}
