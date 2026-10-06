-- Arrapago Reef (zone 54).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Arrapago Leech', 'Giant Orobon', 'Lahama' }, true_sound = { 'Llamhigyn Y Dwr' } },
        [2] = { sound = { 'Giant Orobon', 'Lahama', 'Wootzshell' }, true_sound = { 'Llamhigyn Y Dwr' } },
        [3] = { sound = { 'Arrapago Leech', 'Giant Orobon', 'Wootzshell' }, true_sound = { 'Llamhigyn Y Dwr' } },
        [4] = { sound = { 'Arrapago Leech', 'Giant Orobon', 'Lahama', 'Wootzshell' } },
        [5] = { sound = { 'Arrapago Leech', 'Lahama', 'Wootzshell' }, true_sound = { 'Llamhigyn Y Dwr' } },
        [6] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer',
                      'Lamia Graverobber', 'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite',
                      'Lamie Bellydancer', 'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite',
                      'Merrow Bladedancer', 'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer',
                      'Merrow Shadowdancer', 'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer',
                           'Nix Wavedancer' },
        },
        [7] = { sound = { 'Nipper' } },
        [8] = { sound = { 'Ashakku' } },
        [9] = { sound = { 'Purgatory Bat' } },
        [10] = { sight = { 'Qiqirn Trailer' } },
        [11] = { sight = { 'Qiqirn Treasure Hunter' } },
        [12] = {
            sight = { 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer', 'Lamia Graverobber',
                      'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite', 'Lamie Bellydancer',
                      'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite', 'Merrow Bladedancer',
                      'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer', 'Merrow Shadowdancer',
                      'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer',
                           'Nix Wavedancer' },
        },
        [13] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Fatedealer', 'Lamia Graverobber',
                      'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite', 'Lamie Bellydancer',
                      'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite', 'Merrow Bladedancer',
                      'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer', 'Merrow Shadowdancer',
                      'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer',
                           'Nix Wavedancer' },
        },
        [14] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer',
                      'Lamia Graverobber', 'Lamia Palace Guard', 'Lamia Toxophilite', 'Lamie Bellydancer',
                      'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite', 'Merrow Bladedancer',
                      'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer', 'Merrow Shadowdancer',
                      'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer',
                           'Nix Wavedancer' },
        },
        [15] = { both = { 'Bukki' }, true_both = { 'Heraldic Imp', 'Seneschal Imp' } },
        [16] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer',
                      'Lamia Graverobber', 'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite',
                      'Lamie Bellydancer', 'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite',
                      'Merrow Bladedancer', 'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer',
                      'Merrow Shadowdancer', 'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer' },
        },
        [17] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer',
                      'Lamia Graverobber', 'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite',
                      'Lamie Bellydancer', 'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite',
                      'Merrow Bladedancer', 'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer',
                      'Merrow Shadowdancer', 'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Songstress', 'Nix Typhoondancer', 'Nix Wavedancer' },
        },
        [18] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer',
                      'Lamia Graverobber', 'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite',
                      'Lamie Bellydancer', 'Lamie Necromancer', 'Lamie Toxophilite', 'Merrow Bladedancer',
                      'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer', 'Merrow Shadowdancer',
                      'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Lamia No19', 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer',
                           'Nix Wavedancer' },
        },
        [19] = {
            sight = { 'Lamia Bellydancer', 'Lamia Dancer', 'Lamia Dartist', 'Lamia Deathdancer', 'Lamia Fatedealer',
                      'Lamia Graverobber', 'Lamia Necromancer', 'Lamia Palace Guard', 'Lamia Toxophilite',
                      'Lamie Bellydancer', 'Lamie Deathdancer', 'Lamie Necromancer', 'Lamie Toxophilite',
                      'Merrow Bladedancer', 'Merrow Chantress', 'Merrow Icedancer', 'Merrow Kabukidancer',
                      'Merrow Shadowdancer', 'Merrow Songstress', 'Merrow Typhoondancer', 'Merrow Wavedancer' },
            true_sight = { 'Nix Bladedancer', 'Nix Songstress', 'Nix Typhoondancer', 'Nix Wavedancer' },
        },
        [20] = { sound = { 'Lamias Skeleton' } },
        [21] = { sound = { 'Mamool Ja Diver' } },
    },
    monsters = {
        {
            name   = 'Wootzshell fished',
            ids    = { 1 },
            levels = {
                [72] = { acc = 292, eva = 271, agi = 48, int = 51, mnd = 75, chr = 75 },
                [73] = { acc = 298, eva = 276, agi = 48, int = 52, mnd = 76, chr = 76 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Arrapago Leech',
            ids    = { 2 },
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 62, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 63, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Chimera Clot',
            ids    = { 3 },
            levels = {
                [75] = { acc = 314, eva = 299, agi = 74, int = 58, mnd = 63, chr = 65 },
                [76] = { acc = 321, eva = 304, agi = 76, int = 59, mnd = 64, chr = 66 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = -1, thunder = -1, water = -1, light = 1, dark = 1,
                       paralyze = -1, bind = -1, silence = -2, slow = -1, poison = -1, light_sleep = 1,
                       dark_sleep = 1, blind = 1, stun = -1, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Lahama',
            ids    = { 4 },
            levels = {
                [76] = { acc = 319, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 1000, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Llamhigyn Y Dwr',
            ids    = { 5 },
            levels = {
                [76] = { acc = 321, eva = 306, agi = 80, int = 59, mnd = 55, chr = 71 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 57, chr = 73 },
            },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Giant Orobon',
            ids    = { 6 },
            levels = {
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound' },
            links  = 5,
            flags  = { scripted_drops = true },
        },
        {
            name   = 'Reserve Draugar',
            ids    = { 7, 22, 25, 59, 64, 126, 131, 138, 145 },
            levels = {
                [72] = { acc = 307, eva = 350, agi = 79, int = 75, mnd = 48, chr = 51 },
                [73] = { acc = 312, eva = 357, agi = 82, int = 76, mnd = 48, chr = 52 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Reserve Draugar',
            ids    = { 8, 29, 39, 50, 51, 55, 62, 65, 124, 130, 144, 153 },
            levels = {
                [72] = { acc = 301, eva = 262, agi = 75, int = 87, mnd = 60, chr = 67 },
                [73] = { acc = 306, eva = 267, agi = 76, int = 89, mnd = 60, chr = 70 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Merrow Chantress',
            ids    = { 9, 37, 122, 148, 170, 174, 179, 199, 200 },
            levels = {
                [73] = { acc = 305, eva = 273, agi = 58, int = 78, mnd = 78, chr = 90 },
                [74] = { acc = 310, eva = 277, agi = 58, int = 78, mnd = 78, chr = 90 },
                [75] = { acc = 315, eva = 282, agi = 58, int = 79, mnd = 79, chr = 92 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 50, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 10, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Arrapago Apkallu',
            ids    = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 31, 32, 33, 34, 35, 36, 213, 214, 215, 216, 217,
                       218, 219 },
            levels = {
                [70] = { acc = 292, eva = 272, agi = 55, int = 49, mnd = 67, chr = 61 },
                [71] = { acc = 298, eva = 276, agi = 55, int = 51, mnd = 67, chr = 63 },
                [72] = { acc = 303, eva = 281, agi = 55, int = 51, mnd = 67, chr = 63 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 2149 },  -- apkallu feather
                { rate = 150, item = 5568 },  -- apkallu egg
            },
            aggro_note = 'apkallu',
        },
        {
            name   = 'Lamia Graverobber',
            ids    = { 21, 60, 69 },
            levels = {
                [73] = { acc = 308, eva = 267, agi = 76, int = 97, mnd = 72, chr = 78 },
                [74] = { acc = 313, eva = 272, agi = 77, int = 97, mnd = 72, chr = 78 },
                [75] = { acc = 319, eva = 276, agi = 77, int = 100, mnd = 74, chr = 79 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Phasma',
            ids    = { 23, 149, 151, 159, 164, 210, 257, 258, 306, 307 },
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 72, mnd = 56, chr = 70 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 73, mnd = 56, chr = 71 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Reserve Draugar',
            ids    = { 24, 30, 38, 49, 54, 58, 61, 121, 127, 139, 143, 146 },
            levels = {
                [72] = { acc = 301, eva = 280, agi = 67, int = 75, mnd = 48, chr = 51 },
                [73] = { acc = 306, eva = 287, agi = 70, int = 76, mnd = 48, chr = 52 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lamia Dartist',
            ids    = { 26, 75 },
            levels = {
                [73] = { acc = 353, eva = 273, agi = 89, int = 72, mnd = 78, chr = 72 },
                [74] = { acc = 358, eva = 278, agi = 89, int = 72, mnd = 78, chr = 72 },
                [75] = { acc = 363, eva = 283, agi = 91, int = 74, mnd = 79, chr = 74 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 20 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamia Dancer',
            ids    = { 27, 118 },
            levels = {
                [73] = { acc = 302, eva = 264, agi = 70, int = 90, mnd = 90, chr = 90 },
                [74] = { acc = 307, eva = 269, agi = 70, int = 90, mnd = 90, chr = 90 },
                [75] = { acc = 313, eva = 273, agi = 70, int = 92, mnd = 92, chr = 92 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamias Elemental',
            ids    = { 28, 119, 237, 390, 417 },
            levels = {
                [68] = { acc = 276, eva = 260, agi = 65, int = 71, mnd = 48, chr = 48 },
                [69] = { acc = 282, eva = 265, agi = 65, int = 72, mnd = 48, chr = 48 },
                [70] = { acc = 287, eva = 271, agi = 67, int = 73, mnd = 49, chr = 49 },
                [71] = { acc = 293, eva = 275, agi = 67, int = 75, mnd = 51, chr = 51 },
                [72] = { acc = 298, eva = 280, agi = 67, int = 75, mnd = 51, chr = 51 },
                [73] = { acc = 304, eva = 287, agi = 70, int = 76, mnd = 52, chr = 52 },
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 52 },
                [75] = { acc = 314, eva = 297, agi = 70, int = 77, mnd = 52, chr = 52 },
                [76] = { acc = 321, eva = 302, agi = 72, int = 80, mnd = 54, chr = 54 },
                [77] = { acc = 326, eva = 307, agi = 72, int = 80, mnd = 54, chr = 54 },
                [78] = { acc = 331, eva = 312, agi = 72, int = 80, mnd = 54, chr = 54 },
            },
            spawn_levels = { [28] = { 68, 70 }, [119] = { 68, 70 }, [237] = { 76, 78 }, [390] = { 68, 77 },
                             [417] = { 77, 77 } },
            ranks  = { light = -3, dark = 11, light_sleep = -3, dark_sleep = 11, blind = 11 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Reserve Draugar',
            ids    = { 40, 44, 56, 134, 140, 220, 221, 222 },
            levels = {
                [72] = { acc = 319, eva = 287, agi = 67, int = 55, mnd = 60, chr = 75 },
                [73] = { acc = 325, eva = 294, agi = 70, int = 58, mnd = 60, chr = 76 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Draugars Wyvern',
            ids    = { 41, 45, 57, 135, 141, 249, 260, 370, 399, 415 },
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 263, agi = 71, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 269, agi = 72, int = 54, mnd = 54, chr = 60 },
                [70] = { acc = 287, eva = 274, agi = 73, int = 55, mnd = 55, chr = 61 },
                [71] = { acc = 293, eva = 279, agi = 75, int = 55, mnd = 55, chr = 63 },
                [72] = { acc = 298, eva = 284, agi = 75, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 64 },
                [75] = { acc = 314, eva = 300, agi = 77, int = 58, mnd = 58, chr = 65 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
        {
            name   = 'Jnun AR',
            ids    = { 42, 43, 147, 154, 165, 166, 178, 194, 234, 235, 269, 270, 271, 272, 287, 288, 313, 314, 315,
                       316, 422, 423 },
            levels = {
                [77] = { acc = 326, eva = 311, agi = 80, int = 60, mnd = 56, chr = 71 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 57, chr = 73 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 57, chr = 74 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 57, chr = 74 },
            },
            spawn_levels = { [42] = { 77, 78 }, [43] = { 77, 78 }, [147] = { 77, 78 }, [154] = { 77, 78 },
                             [165] = { 77, 78 }, [166] = { 77, 78 }, [178] = { 77, 78 }, [194] = { 77, 78 },
                             [287] = { 79, 80 }, [288] = { 79, 80 }, [313] = { 79, 80 }, [314] = { 79, 80 },
                             [315] = { 79, 80 }, [316] = { 79, 80 }, [422] = { 79, 80 }, [423] = { 79, 80 } },
            ranks  = { fire = -2, ice = 3, water = 2, light = -2, dark = 8, paralyze = 3, bind = 3, poison = 2,
                       light_sleep = -2, dark_sleep = 8, blind = 8 },
            undead = true,
            drops  = {
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 100, item = 849 },  -- undead skin
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Nipper',
            ids    = { 46, 47, 48, 52, 53, 123, 125, 202, 203, 205, 207, 208, 267, 268, 273, 274 },
            levels = {
                [72] = { acc = 292, eva = 271, agi = 48, int = 51, mnd = 75, chr = 75 },
                [73] = { acc = 298, eva = 276, agi = 48, int = 52, mnd = 76, chr = 76 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 50, item = 1889 },  -- sack of white sand
                { rate = 50, item = 881 },  -- crab shell
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            links  = 7,
        },
        {
            name   = 'Lamia Fatedealer',
            ids    = { 63, 97, 98 },
            levels = {
                [73] = { acc = 308, eva = 285, agi = 82, int = 84, mnd = 72, chr = 72 },
                [74] = { acc = 313, eva = 289, agi = 82, int = 85, mnd = 72, chr = 72 },
                [75] = { acc = 319, eva = 294, agi = 83, int = 86, mnd = 74, chr = 74 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 2332 },  -- corsairs testimony
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Qutrub',
            ids    = { 66, 68, 70, 73, 77, 79, 93, 94, 112, 113, 115, 116 },
            levels = {
                [73] = { acc = 306, eva = 285, agi = 66, int = 76, mnd = 48, chr = 44 },
                [74] = { acc = 312, eva = 290, agi = 66, int = 77, mnd = 48, chr = 44 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            drops  = {
                { rate = 100, item = 2220 },  -- lamian bone key
                { rate = 150, item = 2159 },  -- qutrub bandage
                { rate = 10, item = 2165 },  -- qutrub gorget
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Qutrub',
            ids    = { 67, 71, 72, 74, 76, 78, 80, 82, 83, 114, 117 },
            levels = {
                [73] = { acc = 306, eva = 265, agi = 72, int = 89, mnd = 60, chr = 62 },
                [74] = { acc = 312, eva = 270, agi = 73, int = 89, mnd = 60, chr = 62 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            drops  = {
                { rate = 100, item = 2220 },  -- lamian bone key
                { rate = 150, item = 2159 },  -- qutrub bandage
                { rate = 10, item = 2165 },  -- qutrub gorget
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Ashakku',
            ids    = { 84, 85, 87, 88, 89, 106, 107, 108, 109, 110, 111, 155, 156, 157, 158 },
            levels = {
                [73] = { acc = 304, eva = 290, agi = 76, int = 62, mnd = 58, chr = 64 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 63, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 8,
        },
        {
            name   = 'Lahama',
            ids    = { 86, 90, 245, 247, 250, 251, 266 },
            levels = {
                [76] = { acc = 319, eva = 306, agi = 80, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 335, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            spawn_levels = { [86] = { 76, 78 }, [90] = { 76, 78 }, [245] = { 79, 80 }, [247] = { 79, 80 },
                             [250] = { 79, 80 }, [251] = { 79, 80 }, [266] = { 79, 80 } },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 6, light = -1, dark = -1,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 6, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 1000, item = 888 },  -- seashell
                { rate = 10, item = 4484 },  -- shall shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Purgatory Bat',
            ids    = { 91, 92, 95, 96, 223, 224, 225, 226, 227 },
            levels = {
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 63 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 64 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 922 },  -- bat wing
                { rate = 100, item = 891 },  -- bat fang
                { rate = 50, item = 924 },  -- vial of fiend blood
                { rate = 10, item = 930 },  -- vial of beastman blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 9,
        },
        {
            name   = 'Qiqirn Treasure Hunter',
            ids    = { 99 },
            levels = {
                [77] = { acc = 337, eva = 381, agi = 91, int = 76, mnd = 54, chr = 54 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 25 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 10,
        },
        {
            name   = 'Qiqirn Trailer',
            ids    = { 101 },
            levels = {
                [77] = { acc = 374, eva = 296, agi = 98, int = 62, mnd = 72, chr = 66 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { poison = 20 },
            drops  = {
                { rate = 240, item = 2503 },  -- handful of almonds
                { rate = 10, item = 17296 },  -- pebble
                { rate = 10, item = 2153 },  -- qiqirn sandbag
                { rate = 10, item = 1196 },  -- qiqirn cape
                { rate = 5, item = 947 },  -- jar of firesand
                { rate = 5, item = 1155 },  -- handful of iron sand
                { rate = 1, item = 5595 },  -- bowl of nashmau stew
                { rate = 1, item = 1888 },  -- sack of silica
            },
            links  = 11,
        },
        {
            name   = 'Heraldic Imp',
            ids    = { 102, 103, 104, 105, 161, 162, 163, 211, 212 },
            levels = {
                [72] = { acc = 301, eva = 265, agi = 80, int = 92, mnd = 52, chr = 72 },
                [73] = { acc = 306, eva = 269, agi = 80, int = 93, mnd = 52, chr = 74 },
                [74] = { acc = 312, eva = 275, agi = 82, int = 94, mnd = 52, chr = 75 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            drops  = {
                { rate = 240, item = 2163 },  -- imp wing
                { rate = 50, item = 2157 },  -- imp horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Merrow Shadowdancer',
            ids    = { 128, 132, 152, 185, 190 },
            levels = {
                [73] = { acc = 305, eva = 276, agi = 64, int = 84, mnd = 84, chr = 78 },
                [74] = { acc = 310, eva = 280, agi = 64, int = 85, mnd = 85, chr = 78 },
                [75] = { acc = 315, eva = 285, agi = 65, int = 86, mnd = 86, chr = 79 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 100, item = 2332 },  -- corsairs testimony
                { rate = 50, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 10, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Merrow Icedancer',
            ids    = { 129, 137, 142, 195 },
            levels = {
                [73] = { acc = 308, eva = 285, agi = 82, int = 84, mnd = 72, chr = 72 },
                [74] = { acc = 313, eva = 289, agi = 82, int = 85, mnd = 72, chr = 72 },
                [75] = { acc = 319, eva = 294, agi = 83, int = 86, mnd = 74, chr = 74 },
            },
            spawn_levels = { [129] = { 73, 74 } },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 100, item = 2332 },  -- corsairs testimony
                { rate = 50, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 10, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Merrow Kabukidancer',
            ids    = { 133, 136, 182 },
            levels = {
                [73] = { acc = 308, eva = 294, agi = 70, int = 72, mnd = 72, chr = 78 },
                [74] = { acc = 313, eva = 299, agi = 70, int = 72, mnd = 72, chr = 78 },
                [75] = { acc = 319, eva = 304, agi = 70, int = 74, mnd = 74, chr = 79 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 50, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 10, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Bhoot',
            ids    = { 150, 256, 308 },
            levels = {
                [80] = { acc = 342, eva = 302, agi = 82, int = 101, mnd = 65, chr = 80 },
                [81] = { acc = 349, eva = 307, agi = 85, int = 103, mnd = 67, chr = 82 },
                [82] = { acc = 355, eva = 312, agi = 85, int = 103, mnd = 67, chr = 82 },
            },
            ranks  = { fire = -2, ice = 5, wind = -1, thunder = -2, water = -1, light = -2, dark = 5, paralyze = 5,
                       bind = 5, silence = -1, poison = -1, light_sleep = -2, dark_sleep = 5, blind = 5, stun = -2,
                       gravity = -1 },
            resist = { paralyze = 20 },
            magic_dmg = { all = -25 },
            undead = true,
            drops  = {
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 150, item = 2274 },  -- square of mohbwa cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fallen Volunteer',
            ids    = { 167, 172, 177, 180, 188, 196, 201, 229, 230, 233 },
            levels = {
                [72] = { acc = 298, eva = 284, agi = 75, int = 55, mnd = 55, chr = 68 },
                [73] = { acc = 304, eva = 290, agi = 76, int = 58, mnd = 58, chr = 68 },
                [74] = { acc = 309, eva = 295, agi = 77, int = 58, mnd = 58, chr = 69 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
        },
        {
            name   = 'Fallen Imperial Wizard',
            ids    = { 168, 173, 181, 183, 187, 189, 191, 197 },
            levels = {
                [72] = { acc = 298, eva = 262, agi = 75, int = 87, mnd = 63, chr = 72 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 89, mnd = 64, chr = 74 },
                [74] = { acc = 309, eva = 272, agi = 77, int = 89, mnd = 64, chr = 75 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
        },
        {
            name   = 'Fallen Imperial Trooper',
            ids    = { 169, 171, 175, 176, 184, 186, 192, 193, 198 },
            levels = {
                [72] = { acc = 298, eva = 280, agi = 67, int = 75, mnd = 51, chr = 56 },
                [73] = { acc = 304, eva = 287, agi = 70, int = 76, mnd = 52, chr = 56 },
                [74] = { acc = 309, eva = 292, agi = 70, int = 77, mnd = 52, chr = 57 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
        },
        {
            name   = 'Soulflayer',
            ids    = { 204, 206, 209, 239, 240, 241, 242, 243, 244, 275 },
            levels = {
                [82] = { acc = 358, eva = 308, agi = 76, int = 112, mnd = 85, chr = 73 },
                [83] = { acc = 364, eva = 312, agi = 76, int = 115, mnd = 86, chr = 73 },
            },
            ranks  = { ice = 2, water = 9, light = -1, dark = 11, paralyze = 2, bind = 2, poison = 9,
                       light_sleep = -1, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 150, item = 2335 },  -- soulflayer tentacle
                { rate = 100, item = 2336 },  -- soulflayer staff
                { rate = 50, item = 1724 },  -- soulflayer robe
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
        },
        {
            name   = 'Fallen Imperial Wizard',
            ids    = { 228, 231, 232 },
            levels = {
                [72] = { acc = 298, eva = 262, agi = 75, int = 87, mnd = 63, chr = 72 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 89, mnd = 64, chr = 74 },
                [74] = { acc = 309, eva = 272, agi = 77, int = 89, mnd = 64, chr = 75 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp', 'ability' },
        },
        {
            name   = 'Lamia Bellydancer',
            ids    = { 236 },
            levels = {
                [81] = { acc = 347, eva = 303, agi = 77, int = 100, mnd = 100, chr = 100 },
                [82] = { acc = 353, eva = 308, agi = 77, int = 100, mnd = 100, chr = 100 },
                [83] = { acc = 359, eva = 312, agi = 77, int = 100, mnd = 100, chr = 100 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Draugar Servant',
            ids    = { 238, 246, 364 },
            levels = {
                [79] = { acc = 339, eva = 297, agi = 82, int = 96, mnd = 65, chr = 75 },
                [80] = { acc = 344, eva = 302, agi = 82, int = 96, mnd = 65, chr = 75 },
                [81] = { acc = 352, eva = 307, agi = 85, int = 98, mnd = 67, chr = 77 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Draugar Servant',
            ids    = { 248, 259, 369, 398, 414 },
            levels = {
                [79] = { acc = 358, eva = 326, agi = 75, int = 61, mnd = 65, chr = 82 },
                [80] = { acc = 363, eva = 331, agi = 75, int = 61, mnd = 65, chr = 82 },
                [81] = { acc = 370, eva = 336, agi = 77, int = 64, mnd = 67, chr = 85 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lamia Deathdancer',
            ids    = { 252 },
            levels = {
                [81] = { acc = 354, eva = 326, agi = 91, int = 94, mnd = 80, chr = 80 },
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
                [83] = { acc = 366, eva = 336, agi = 91, int = 94, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 13,
        },
        {
            name   = 'Draugar Servant',
            ids    = { 253, 265, 365, 368, 372, 373, 374, 376, 377, 378, 379, 380, 397, 401, 402, 403, 404, 405,
                       406, 407, 409, 410, 411, 413 },
            levels = {
                [79] = { acc = 339, eva = 318, agi = 75, int = 82, mnd = 51, chr = 55 },
                [80] = { acc = 344, eva = 323, agi = 75, int = 82, mnd = 51, chr = 55 },
                [81] = { acc = 352, eva = 328, agi = 77, int = 85, mnd = 54, chr = 58 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Draugar Servant',
            ids    = { 254, 262, 286, 312 },
            levels = {
                [79] = { acc = 346, eva = 390, agi = 88, int = 82, mnd = 51, chr = 55 },
                [80] = { acc = 351, eva = 395, agi = 88, int = 82, mnd = 51, chr = 55 },
                [81] = { acc = 358, eva = 401, agi = 91, int = 85, mnd = 54, chr = 58 },
            },
            ph_for = { [254] = { 255 } },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 2219 },  -- lamian fang key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bloody Bones',
            ids    = { 255 },
            nm     = true,
            levels = {
                [83] = { acc = 364, eva = 338, agi = 77, int = 85, mnd = 54, chr = 58 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15529 },  -- aces locket
                { rate = 100, item = 18066 },  -- blackjack
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Merrow Songstress',
            ids    = { 261, 285, 311 },
            levels = {
                [81] = { acc = 350, eva = 313, agi = 64, int = 86, mnd = 86, chr = 100 },
                [82] = { acc = 356, eva = 318, agi = 64, int = 86, mnd = 86, chr = 100 },
                [83] = { acc = 362, eva = 323, agi = 64, int = 86, mnd = 86, chr = 100 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Merrow Bladedancer',
            ids    = { 263, 336 },
            levels = {
                [81] = { acc = 350, eva = 316, agi = 71, int = 94, mnd = 94, chr = 86 },
                [82] = { acc = 356, eva = 321, agi = 71, int = 94, mnd = 94, chr = 86 },
                [83] = { acc = 362, eva = 326, agi = 71, int = 94, mnd = 94, chr = 86 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Ice Elemental',
            ids    = { 264, 340, 381, 420, 424 },
            levels = {
                [80] = { acc = 341, eva = 316, agi = 78, int = 91, mnd = 73, chr = 75 },
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
            name   = 'Merrow Wavedancer',
            ids    = { 284, 337, 339 },
            levels = {
                [81] = { acc = 354, eva = 326, agi = 91, int = 94, mnd = 80, chr = 80 },
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
                [83] = { acc = 366, eva = 336, agi = 91, int = 94, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamia Idolater',
            ids    = { 289, 290, 293, 294, 299, 300, 309, 383, 384, 386, 387, 388, 391, 392, 394, 395, 396, 418,
                       419 },
            levels = {
                [80] = { acc = 344, eva = 321, agi = 71, int = 82, mnd = 51, chr = 46 },
                [81] = { acc = 352, eva = 326, agi = 73, int = 85, mnd = 54, chr = 49 },
                [82] = { acc = 358, eva = 331, agi = 73, int = 85, mnd = 54, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            drops  = {
                { rate = 150, item = 2159 },  -- qutrub bandage
                { rate = 50, item = 2220 },  -- lamian bone key
                { rate = 50, item = 2218 },  -- lamian claw key
                { rate = 10, item = 2165 },  -- qutrub gorget
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Lamia Necromancer',
            ids    = { 291 },
            levels = {
                [81] = { acc = 354, eva = 307, agi = 85, int = 107, mnd = 80, chr = 86 },
                [82] = { acc = 360, eva = 312, agi = 85, int = 107, mnd = 80, chr = 86 },
                [83] = { acc = 366, eva = 316, agi = 85, int = 109, mnd = 80, chr = 86 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1869 },  -- lamia skin
                { rate = 100, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 14,
        },
        {
            name   = 'Lamia Idolater',
            ids    = { 292, 295, 298, 301, 302 },
            levels = {
                [80] = { acc = 344, eva = 300, agi = 78, int = 96, mnd = 65, chr = 66 },
                [81] = { acc = 352, eva = 305, agi = 81, int = 98, mnd = 67, chr = 68 },
                [82] = { acc = 358, eva = 310, agi = 81, int = 98, mnd = 67, chr = 68 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            drops  = {
                { rate = 150, item = 2159 },  -- qutrub bandage
                { rate = 50, item = 2220 },  -- lamian bone key
                { rate = 50, item = 2218 },  -- lamian claw key
                { rate = 10, item = 2165 },  -- qutrub gorget
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Lamia Toxophilite',
            ids    = { 297, 303 },
            levels = {
                [81] = { acc = 398, eva = 314, agi = 98, int = 80, mnd = 86, chr = 80 },
                [82] = { acc = 404, eva = 319, agi = 98, int = 80, mnd = 86, chr = 80 },
                [83] = { acc = 410, eva = 324, agi = 100, int = 80, mnd = 86, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1869 },  -- lamia skin
                { rate = 150, item = 18688 },  -- lamian kaman -1
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Seneschal Imp',
            ids    = { 304, 305, 317, 318 },
            levels = {
                [77] = { acc = 328, eva = 289, agi = 85, int = 98, mnd = 54, chr = 77 },
                [78] = { acc = 333, eva = 294, agi = 85, int = 98, mnd = 56, chr = 77 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
            drops  = {
                { rate = 150, item = 2163 },  -- imp wing
                { rate = 50, item = 2157 },  -- imp horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 15,
        },
        {
            name   = 'Merrow Typhoondancer',
            ids    = { 310, 335, 338 },
            levels = {
                [81] = { acc = 354, eva = 336, agi = 77, int = 80, mnd = 80, chr = 86 },
                [82] = { acc = 360, eva = 341, agi = 77, int = 80, mnd = 80, chr = 86 },
                [83] = { acc = 366, eva = 346, agi = 77, int = 80, mnd = 80, chr = 86 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Emperor Apkallu',
            ids    = { 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332 },
            levels = {
                [81] = { acc = 355, eva = 330, agi = 64, int = 58, mnd = 77, chr = 71 },
                [82] = { acc = 361, eva = 335, agi = 64, int = 58, mnd = 77, chr = 71 },
                [83] = { acc = 367, eva = 340, agi = 64, int = 58, mnd = 77, chr = 71 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            drops  = {
                { rate = 240, item = 2149 },  -- apkallu feather
                { rate = 100, item = 5568 },  -- apkallu egg
            },
            aggro_note = 'apkallu',
        },
        {
            name   = 'Nix Songstress',
            ids    = { 333, 334 },
            levels = {
                [81] = { acc = 350, eva = 313, agi = 64, int = 86, mnd = 86, chr = 100 },
                [82] = { acc = 356, eva = 318, agi = 64, int = 86, mnd = 86, chr = 100 },
                [83] = { acc = 362, eva = 323, agi = 64, int = 86, mnd = 86, chr = 100 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { silence = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Dark Elemental',
            ids    = { 341, 382, 421, 425 },
            levels = {
                [80] = { acc = 342, eva = 323, agi = 75, int = 82, mnd = 55, chr = 55 },
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
            name   = 'Lamias Avatar',
            ids    = { 343 },
            levels = {
                [72] = { acc = 298, eva = 262, agi = 75, int = 87, mnd = 63, chr = 67 },
                [73] = { acc = 304, eva = 267, agi = 76, int = 89, mnd = 64, chr = 70 },
                [74] = { acc = 309, eva = 272, agi = 77, int = 89, mnd = 64, chr = 70 },
                [75] = { acc = 314, eva = 276, agi = 77, int = 91, mnd = 65, chr = 70 },
                [76] = { acc = 321, eva = 283, agi = 80, int = 92, mnd = 66, chr = 72 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
        },
        {
            name   = 'Nix Wavedancer',
            ids    = { 366 },
            levels = {
                [81] = { acc = 354, eva = 326, agi = 91, int = 94, mnd = 80, chr = 80 },
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
                [83] = { acc = 366, eva = 336, agi = 91, int = 94, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 16,
        },
        {
            name   = 'Nix Bladedancer',
            ids    = { 367 },
            levels = {
                [81] = { acc = 350, eva = 316, agi = 71, int = 94, mnd = 94, chr = 86 },
                [82] = { acc = 356, eva = 321, agi = 71, int = 94, mnd = 94, chr = 86 },
                [83] = { acc = 362, eva = 326, agi = 71, int = 94, mnd = 94, chr = 86 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { petrify = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 17,
        },
        {
            name   = 'Nix Typhoondancer',
            ids    = { 371, 375 },
            levels = {
                [81] = { acc = 354, eva = 336, agi = 77, int = 80, mnd = 80, chr = 86 },
                [82] = { acc = 360, eva = 341, agi = 77, int = 80, mnd = 80, chr = 86 },
                [83] = { acc = 366, eva = 346, agi = 77, int = 80, mnd = 80, chr = 86 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            drops  = {
                { rate = 150, item = 2146 },  -- merrow scale
                { rate = 100, item = 2219 },  -- lamian fang key
                { rate = 50, item = 2229 },  -- vial of chimera blood
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamie Necromancer',
            ids    = { 385, 400 },
            levels = {
                [81] = { acc = 354, eva = 307, agi = 85, int = 107, mnd = 80, chr = 86 },
                [82] = { acc = 360, eva = 312, agi = 85, int = 107, mnd = 80, chr = 86 },
                [83] = { acc = 366, eva = 316, agi = 85, int = 109, mnd = 80, chr = 86 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamie Bellydancer',
            ids    = { 389, 416 },
            levels = {
                [81] = { acc = 347, eva = 303, agi = 77, int = 100, mnd = 100, chr = 100 },
                [82] = { acc = 353, eva = 308, agi = 77, int = 100, mnd = 100, chr = 100 },
                [83] = { acc = 359, eva = 312, agi = 77, int = 100, mnd = 100, chr = 100 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { slow = 20 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamie Deathdancer',
            ids    = { 393 },
            levels = {
                [81] = { acc = 354, eva = 326, agi = 91, int = 94, mnd = 80, chr = 80 },
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
                [83] = { acc = 366, eva = 336, agi = 91, int = 94, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 100, item = 1869 },  -- lamia skin
                { rate = 50, item = 2229 },  -- vial of chimera blood
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 18,
        },
        {
            name   = 'Lamie Toxophilite',
            ids    = { 408, 412 },
            levels = {
                [81] = { acc = 398, eva = 314, agi = 98, int = 80, mnd = 86, chr = 80 },
                [82] = { acc = 404, eva = 319, agi = 98, int = 80, mnd = 86, chr = 80 },
                [83] = { acc = 410, eva = 324, agi = 100, int = 80, mnd = 86, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 150, item = 1869 },  -- lamia skin
                { rate = 150, item = 18688 },  -- lamian kaman -1
                { rate = 10, item = 2167 },  -- lamian armlet
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 426, 430 },
            levels = {
                [68] = { acc = 279, eva = 261, agi = 53, int = 48, mnd = 65, chr = 64 },
                [69] = { acc = 284, eva = 267, agi = 54, int = 48, mnd = 65, chr = 65 },
                [70] = { acc = 290, eva = 272, agi = 55, int = 49, mnd = 67, chr = 65 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 427, 431 },
            levels = {
                [68] = { acc = 273, eva = 250, agi = 60, int = 71, mnd = 71, chr = 69 },
                [69] = { acc = 278, eva = 255, agi = 60, int = 72, mnd = 72, chr = 70 },
                [70] = { acc = 284, eva = 260, agi = 61, int = 73, mnd = 73, chr = 71 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 428, 432 },
            levels = {
                [68] = { acc = 308, eva = 248, agi = 83, int = 60, mnd = 65, chr = 64 },
                [69] = { acc = 313, eva = 253, agi = 84, int = 60, mnd = 65, chr = 65 },
                [70] = { acc = 332, eva = 258, agi = 85, int = 61, mnd = 67, chr = 65 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ephramadian Shade',
            ids    = { 429, 433 },
            levels = {
                [68] = { acc = 276, eva = 258, agi = 77, int = 71, mnd = 60, chr = 64 },
                [69] = { acc = 282, eva = 263, agi = 77, int = 72, mnd = 60, chr = 65 },
                [70] = { acc = 287, eva = 269, agi = 79, int = 73, mnd = 61, chr = 65 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Bukki',
            ids    = { 434 },
            nm     = true,
            levels = {
                [72] = { acc = 301, eva = 265, agi = 80, int = 92, mnd = 52, chr = 72 },
            },
            ranks  = { fire = -1, ice = -1, wind = 2, earth = -1, thunder = -1, water = -1, light = -2, dark = 6,
                       paralyze = -1, bind = -1, silence = 2, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 6, blind = 6, stun = -1, gravity = 2 },
        },
        {
            name   = 'Archaic Mirror',
            ids    = { 438, 439, 440, 441, 442, 443, 444, 445 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70 },
            },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 1000, item = 2174 },  -- archaic mirror
            },
        },
        {
            name   = 'Lamia Palace Guard',
            ids    = { 446, 448, 450, 452, 454, 456, 458, 460 },
            levels = {
                [81] = { acc = 398, eva = 314, agi = 98, int = 80, mnd = 86, chr = 80 },
                [82] = { acc = 404, eva = 319, agi = 98, int = 80, mnd = 86, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { poison = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamia Palace Guard',
            ids    = { 447, 449, 451, 453, 455, 457, 459, 461 },
            levels = {
                [81] = { acc = 354, eva = 326, agi = 91, int = 94, mnd = 80, chr = 80 },
                [82] = { acc = 360, eva = 331, agi = 91, int = 94, mnd = 80, chr = 80 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            resist = { paralyze = 25 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Lamia No19',
            ids    = { 468 },
            nm     = true,
            levels = {
                [78] = { acc = 335, eva = 292, agi = 80, int = 102, mnd = 77, chr = 81 },
            },
            ranks  = { fire = -1, ice = -2, wind = -1, earth = -1, thunder = -2, water = 3, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -1, slow = -1, poison = 3, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            immune = { 'light_sleep', 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 100, item = 15614 },  -- exorcist hose
                { rate = 100, item = 18841 },  -- templar mace
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 19,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Lamias Skeleton',
            ids    = { 469, 470 },
            levels = {
                [75] = { acc = 317, eva = 300, agi = 77, int = 58, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 2, bind = 2, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = -12.5 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'petrify', 'terror', 'plague' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 20,
        },
        {
            name   = 'Lil Apkallu',
            ids    = { 471 },
            nm     = true,
            levels = {
                [82] = { acc = 361, eva = 335, agi = 64, int = 58, mnd = 77, chr = 71 },
                [83] = { acc = 367, eva = 340, agi = 64, int = 58, mnd = 77, chr = 71 },
            },
            ranks  = { fire = 1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 5, light = -1, dark = -1,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 5, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -2, gravity = -1 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            drops  = {
                { rate = 1000, item = 2637 },  -- lil apkallus egg
                { rate = 150, item = 11369 },  -- numerist pumps
                { rate = 150, item = 11368 },  -- hakke habaki
            },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Velionis',
            ids    = { 472 },
            nm     = true,
            levels = {
                [78] = { acc = 329, eva = 301, agi = 68, int = 80, mnd = 77, chr = 72 },
                [79] = { acc = 336, eva = 306, agi = 69, int = 82, mnd = 78, chr = 75 },
                [80] = { acc = 341, eva = 311, agi = 69, int = 82, mnd = 78, chr = 75 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 4, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 2636 },  -- velioniss bone
                { rate = 150, item = 18950 },  -- white joker
                { rate = 150, item = 15916 },  -- corsairs belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Zareehkl the Jubilant',
            ids    = { 473 },
            nm     = true,
            levels = {
                [85] = { acc = 377, eva = 348, agi = 76, int = 87, mnd = 55, chr = 50 },
                [86] = { acc = 384, eva = 352, agi = 76, int = 89, mnd = 56, chr = 51 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            immune = { 'stun' },
            drops  = {
                { rate = 1000, item = 2634 },  -- zareekhls neckpiece
                { rate = 150, item = 18949 },  -- zareehkl scythe
                { rate = 150, item = 19108 },  -- zareehkl jambiya
            },
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Nuhn',
            ids    = { 474 },
            nm     = true,
            levels = {
                [86] = { acc = 381, eva = 358, agi = 89, int = 66, mnd = 66, chr = 74 },
            },
            ranks  = { fire = -1, ice = 1, wind = -1, earth = -1, thunder = -2, water = 6, light = -2, dark = 3,
                       paralyze = 1, bind = 1, silence = -1, slow = -1, poison = 6, light_sleep = -2,
                       dark_sleep = 3, blind = 3, stun = -2, gravity = -1 },
            magic_dmg = { all = -12.5 },
            drops  = {
                { rate = 1000, item = 2632 },  -- nuhns esca
                { rate = 240, item = 19037 },  -- light grip
                { rate = 240, item = 19033 },  -- wind grip
                { rate = 1000, group = {  -- one of
                    { 18430, 1 },  -- oninohocho
                    { 15023, 1 },  -- enkidus mittens
                    { 11377, 1 },  -- oracles pigaches
                } },
                { rate = 100, group = {  -- one of
                    { 18430, 1 },  -- oninohocho
                    { 15023, 1 },  -- enkidus mittens
                    { 11377, 1 },  -- oracles pigaches
                } },
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Dimgruzub',
            ids    = { 475, 478, 481 },
            nm     = true,
            levels = {
                [95] = { acc = 447, eva = 399, agi = 83, int = 96, mnd = 61, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Assassins Apprentice',
            ids    = { 476, 477, 479, 480, 482, 483 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 325, agi = 78, int = 61, mnd = 57, chr = 60 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Qutrub',
            ids    = { 484, 485 },
            levels = {
                [139] = { acc = 497, eva = 629, agi = 120, int = 139, mnd = 87, chr = 79 },
            },
            ranks  = { fire = -2, ice = 4, wind = -1, earth = 1, thunder = -1, water = -1, light = -2, dark = 4,
                       paralyze = 4, bind = 4, silence = -1, slow = 1, poison = -1, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -1, gravity = -1 },
            magic_dmg = { all = 100 },
            undead = true,
            aggro  = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Merrow Kabukidancer',
            ids    = { 486, 487 },
            levels = {
                [139] = { acc = 501, eva = 646, agi = 127, int = 132, mnd = 132, chr = 142 },
            },
            ranks  = { fire = -1, wind = -1, earth = -1, thunder = -2, water = 4, silence = -1, slow = -1,
                       poison = 4, stun = -2, gravity = -1 },
            resist = { blind = 25 },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Mamool Ja Diver',
            ids    = { 488, 489 },
            levels = {
                [139] = { acc = 506, eva = 643, agi = 120, int = 94, mnd = 127, chr = 125 },
            },
            ranks  = { ice = -2, wind = -1, earth = -1, thunder = -3, water = 4, paralyze = -2, bind = -2,
                       silence = -1, slow = -1, poison = 4, stun = -3, gravity = -1 },
            meva   = { water = 128 },
            aggro  = true,
            detects = { 'sound' },
            links  = 21,
        },
        {
            name   = 'Awoken Morbol Emperor',
            ids    = { 490 },
            nm     = true,
            levels = {
                [119] = { acc = 490, eva = 533, agi = 120, int = 90, mnd = 84, chr = 101 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
        },
    },
    by_name = {},
}
