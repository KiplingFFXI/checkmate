-- Lower Delkfutts Tower (zone 184).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Eurymedon', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Butcher',
                'Gigas Hallwatcher', 'Gigas Punisher', 'Gigas Sculptor', 'Hippolytos' },
        [2] = { 'Epialtes', 'Eurymedon', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry',
                'Gigas Butcher', 'Gigas Hallwatcher', 'Gigas Punisher', 'Gigas Sculptor', 'Hippolytos' },
        [3] = { 'Ancient Bat', 'Seeker Bats' },
        [4] = { 'Goblin Gambler', 'Goblin Leecher', 'Goblin Mugger' },
        [5] = { 'Epialtes', 'Eurymedon', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry',
                'Gigas Butcher', 'Gigas Hallwatcher', 'Gigas Punisher', 'Gigas Sculptor' },
        [6] = { 'Epialtes', 'Giant Gatekeeper', 'Giant Guard', 'Giant Lobber', 'Giant Sentry', 'Gigas Butcher',
                'Gigas Hallwatcher', 'Gigas Punisher', 'Gigas Sculptor', 'Hippolytos' },
        [7] = { 'Fomorian Spear' },
        [8] = { 'Fomorian Spear', 'Orna' },
        [9] = { 'Akvan' },
    },
    monsters = {
        {
            name   = 'Epialtes',
            ids    = { 1 },
            nm     = true,
            levels = {
                [32] = { acc = 117, eva = 107, agi = 32, int = 20, mnd = 24, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Giant Gatekeeper',
            ids    = { 2, 7, 16, 21, 53, 58, 70, 75, 107, 112, 120, 125, 140, 164, 180, 185, 200, 205, 219, 236 },
            levels = {
                [28] = { acc = 103, eva = 94, agi = 28, int = 17, mnd = 21, chr = 27 },
                [29] = { acc = 107, eva = 97, agi = 29, int = 19, mnd = 22, chr = 28 },
                [30] = { acc = 110, eva = 100, agi = 29, int = 19, mnd = 23, chr = 28 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Giant Guard',
            ids    = { 3, 8, 17, 22, 54, 59, 71, 76, 108, 113, 121, 126, 141, 165, 181, 186, 201, 206, 220, 237 },
            levels = {
                [28] = { acc = 105, eva = 93, agi = 20, int = 16, mnd = 26, chr = 27 },
                [29] = { acc = 108, eva = 96, agi = 21, int = 17, mnd = 26, chr = 28 },
                [30] = { acc = 112, eva = 99, agi = 21, int = 17, mnd = 28, chr = 28 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Giant Sentry',
            ids    = { 4, 9, 18, 23, 55, 60, 72, 77, 109, 114, 122, 127, 142, 166, 182, 187, 202, 207, 221, 238 },
            levels = {
                [28] = { acc = 103, eva = 91, agi = 22, int = 20, mnd = 24, chr = 34 },
                [29] = { acc = 107, eva = 94, agi = 23, int = 21, mnd = 24, chr = 36 },
                [30] = { acc = 110, eva = 97, agi = 23, int = 21, mnd = 25, chr = 36 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { virus = 10, slow = 10 },
            drops  = {
                { rate = 10, item = 1538 },  -- ram leather missive
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Gigass Bat',
            ids    = { 5, 10, 19, 24, 56, 61, 73, 78, 110, 115, 123, 128, 143, 167, 183, 188, 203, 208, 222, 235,
                       239 },
            levels = {
                [21] = { acc = 78, eva = 74, agi = 26, int = 18, mnd = 18, chr = 20 },
                [22] = { acc = 81, eva = 76, agi = 26, int = 18, mnd = 18, chr = 20 },
                [23] = { acc = 84, eva = 79, agi = 26, int = 18, mnd = 18, chr = 20 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 3,
        },
        {
            name   = 'Giant Lobber',
            ids    = { 6, 11, 20, 25, 57, 62, 74, 79, 111, 116, 124, 129, 144, 168, 184, 189, 204, 209, 223, 240 },
            levels = {
                [28] = { acc = 112, eva = 96, agi = 32, int = 20, mnd = 25, chr = 27 },
                [29] = { acc = 115, eva = 99, agi = 33, int = 21, mnd = 25, chr = 28 },
                [30] = { acc = 131, eva = 102, agi = 33, int = 21, mnd = 27, chr = 28 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { poison = 10, virus = 10 },
            drops  = {
                { rate = 50, item = 1199 },  -- northern fur
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Seeker Bats LDT',
            ids    = { 12, 13, 26, 27, 29, 30, 45, 46, 63, 64, 66, 67, 80, 81, 117, 136, 137, 151, 153, 154, 157,
                       158, 169, 170, 196, 197, 216 },
            levels = {
                [25] = { acc = 91, eva = 86, agi = 28, int = 20, mnd = 20, chr = 23 },
                [26] = { acc = 95, eva = 90, agi = 31, int = 20, mnd = 20, chr = 23 },
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Ancient Bat LDT MoS',
            ids    = { 14, 15, 28, 31, 47, 48, 65, 68, 69, 82, 118, 138, 139, 152, 155, 156, 159, 172, 173, 198,
                       199, 217, 218, 230 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Bogy LDT',
            ids    = { 32, 95, 96, 97, 101, 102, 174, 175, 176, 232, 233 },
            levels = {
                [30] = { acc = 108, eva = 91, agi = 31, int = 38, mnd = 24, chr = 30 },
                [31] = { acc = 112, eva = 95, agi = 33, int = 42, mnd = 27, chr = 33 },
                [32] = { acc = 115, eva = 97, agi = 33, int = 42, mnd = 27, chr = 33 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 540 },  -- bloody robe
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Goblin Mugger',
            ids    = { 33, 36, 39, 42, 130, 133, 145, 148, 190, 193, 210, 213, 224, 227 },
            levels = {
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
            links  = 4,
        },
        {
            name   = 'Goblin Leecher',
            ids    = { 34, 37, 40, 43, 131, 134, 146, 149, 191, 194, 211, 214, 225, 228 },
            levels = {
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
            links  = 4,
        },
        {
            name   = 'Goblin Gambler',
            ids    = { 35, 38, 41, 44, 132, 135, 147, 150, 192, 195, 212, 215, 226, 229 },
            levels = {
                [27] = { acc = 100, eva = 84, agi = 31, int = 33, mnd = 24, chr = 26 },
                [28] = { acc = 103, eva = 86, agi = 31, int = 34, mnd = 25, chr = 26 },
                [29] = { acc = 107, eva = 90, agi = 33, int = 35, mnd = 25, chr = 26 },
                [30] = { acc = 110, eva = 92, agi = 33, int = 36, mnd = 26, chr = 28 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Chaos Idol',
            ids    = { 49, 50, 51, 160, 161, 162, 163, 177, 178, 179 },
            levels = {
                [28] = { acc = 102, eva = 94, agi = 28, int = 21, mnd = 21, chr = 27 },
                [29] = { acc = 106, eva = 97, agi = 29, int = 22, mnd = 22, chr = 28 },
                [30] = { acc = 109, eva = 100, agi = 29, int = 23, mnd = 23, chr = 28 },
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
            name   = 'Gigas Hallwatcher',
            ids    = { 83, 88 },
            levels = {
                [34] = { acc = 125, eva = 114, agi = 34, int = 22, mnd = 26, chr = 32, resist = { virus = 10 } },
                [35] = { acc = 128, eva = 117, agi = 35, int = 23, mnd = 27, chr = 33, resist = { virus = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Gigas Punisher',
            ids    = { 84, 89 },
            levels = {
                [34] = { acc = 126, eva = 112, agi = 24, int = 20, mnd = 32, chr = 32 },
                [35] = { acc = 130, eva = 116, agi = 26, int = 20, mnd = 32, chr = 33 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Gigas Butcher',
            ids    = { 85, 90 },
            levels = {
                [34] = { acc = 125, eva = 109, agi = 24, int = 25, mnd = 29, chr = 45, resist = { slow = 10 } },
                [35] = { acc = 128, eva = 113, agi = 26, int = 26, mnd = 30, chr = 46, resist = { slow = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Gigass Bats',
            ids    = { 86, 91 },
            levels = {
                [27] = { acc = 98, eva = 92, agi = 31, int = 21, mnd = 21, chr = 24 },
                [28] = { acc = 101, eva = 95, agi = 31, int = 21, mnd = 21, chr = 25 },
                [29] = { acc = 105, eva = 99, agi = 33, int = 22, mnd = 22, chr = 25 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 3,
        },
        {
            name   = 'Gigas Sculptor',
            ids    = { 87, 92 },
            levels = {
                [34] = { acc = 145, eva = 116, agi = 38, int = 24, mnd = 30, chr = 32,
                         resist = { poison = 10, virus = 10 } },
                [35] = { acc = 149, eva = 120, agi = 40, int = 26, mnd = 31, chr = 33,
                         resist = { poison = 10, virus = 15 } },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            drops  = {
                { rate = 50, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 93, 105 },
            levels = {
                [35] = { acc = 125, eva = 112, agi = 34, int = 41, mnd = 32, chr = 32 },
                [36] = { acc = 129, eva = 116, agi = 37, int = 42, mnd = 33, chr = 34 },
            },
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
            name   = 'Light Elemental',
            ids    = { 94, 106 },
            levels = {
                [35] = { acc = 121, eva = 104, agi = 30, int = 30, mnd = 43, chr = 36 },
                [36] = { acc = 125, eva = 107, agi = 32, int = 32, mnd = 44, chr = 38 },
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
            name   = 'Magic Urn',
            ids    = { 98, 99, 100, 103, 104 },
            levels = {
                [34] = { acc = 123, eva = 111, agi = 29, int = 37, mnd = 36, chr = 34 },
                [35] = { acc = 126, eva = 115, agi = 31, int = 39, mnd = 37, chr = 34 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
                { rate = 10, item = 1036 },  -- delkfutt chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Hippolytos',
            ids    = { 119 },
            nm     = true,
            levels = {
                [32] = { acc = 118, eva = 105, agi = 23, int = 19, mnd = 30, chr = 31 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Magic Pot',
            ids    = { 171, 231 },
            levels = {
                [28] = { acc = 101, eva = 92, agi = 25, int = 31, mnd = 29, chr = 28 },
                [29] = { acc = 105, eva = 95, agi = 25, int = 32, mnd = 31, chr = 29 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            drops  = {
                { rate = 150, item = 954 },  -- magic pot shard
                { rate = 100, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
        },
        {
            name   = 'Eurymedon',
            ids    = { 234 },
            nm     = true,
            levels = {
                [32] = { acc = 117, eva = 102, agi = 23, int = 24, mnd = 28, chr = 42 },
            },
            ranks  = { earth = -2, thunder = 4, slow = -2, stun = 4 },
            resist = { slow = 10 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 497 },  -- gigas socks
                { rate = 150, item = 499 },  -- gigas necklace
                { rate = 100, item = 14018 },  -- gigas bracelets
                { rate = 240, item = 12290 },  -- maple shield
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 6,
        },
        {
            name   = 'Disaster Idol',
            ids    = { 241 },
            nm     = true,
            levels = {
                [55] = { acc = 208, eva = 185, agi = 53, int = 65, mnd = 52, chr = 56 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = -3, water = 2, light = 2, dark = 11,
                       paralyze = 2, bind = 11, silence = 2, slow = 2, poison = 11, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = -3, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'paralyze', 'slow', 'elegy', 'blind' },
            aggro  = true,
            true_detect = true,
            detects = { 'magic' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Orna',
            ids    = { 242 },
            nm     = true,
            levels = {
                [40] = { acc = 143, eva = 126, agi = 35, int = 52, mnd = 40, chr = 42 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 7,
        },
        {
            name   = 'Fomorian Spear',
            ids    = { 243, 244 },
            nm     = true,
            levels = {
                [32] = { acc = 117, eva = 107, agi = 33, int = 31, mnd = 24, chr = 32 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
            links  = 8,
        },
        {
            name   = 'Illusory Pot',
            ids    = { 245 },
            levels = {
                [45] = { acc = 161, eva = 148, agi = 40, int = 49, mnd = 47, chr = 45 },
                [46] = { acc = 165, eva = 151, agi = 40, int = 51, mnd = 49, chr = 46 },
                [47] = { acc = 168, eva = 153, agi = 40, int = 51, mnd = 49, chr = 47 },
                [48] = { acc = 172, eva = 157, agi = 43, int = 52, mnd = 49, chr = 47 },
                [49] = { acc = 176, eva = 161, agi = 44, int = 53, mnd = 51, chr = 48 },
                [50] = { acc = 180, eva = 164, agi = 45, int = 56, mnd = 53, chr = 51 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            magic_dmg = { all = -50 },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Akvan',
            ids    = { 246, 247, 248 },
            nm     = true,
            levels = {
                [94] = { acc = 440, eva = 372, agi = 96, int = 117, mnd = 75, chr = 87 },
                [95] = { acc = 447, eva = 376, agi = 96, int = 119, mnd = 77, chr = 87 },
            },
            ranks  = { light = -2, dark = 6, silence = 11, light_sleep = -2, dark_sleep = 6, blind = 6 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 9,
        },
    },
    by_name = {},
}
