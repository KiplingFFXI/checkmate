-- Alzadaal Undersea Ruins (zone 72).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sight = { 'Qiqirn Goldsmith', 'Qiqirn Poulterer' }, true_sight = { 'Cheese Hoarder Gigiroon' } },
        [2] = { sight = { 'Qiqirn Goldsmith', 'Qiqirn Poulterer' } },
    },
    monsters = {
        {
            name   = 'Nepionic Soulflayer',
            ids    = { 1 },
            nm     = true,
            levels = {
                [66] = { acc = 269, eva = 229, agi = 63, int = 92, mnd = 70, chr = 59 },
            },
            ranks  = { ice = 2, water = 10, light = -1, dark = 10, paralyze = 2, bind = 2, poison = 10,
                       light_sleep = -1, dark_sleep = 11, blind = 11 },
            magic_dmg = { all = -25 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'blind', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic', 'ability' },
        },
        {
            name   = 'Qiqirn Poulterer',
            ids    = { 2, 6, 7, 18, 19, 23, 30, 37, 38, 39 },
            levels = {
                [76] = { acc = 369, eva = 291, agi = 97, int = 62, mnd = 72, chr = 66 },
                [77] = { acc = 374, eva = 296, agi = 98, int = 62, mnd = 72, chr = 66 },
                [78] = { acc = 379, eva = 301, agi = 98, int = 65, mnd = 72, chr = 68 },
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
            links  = 1,
        },
        {
            name   = 'Qiqirn Goldsmith',
            ids    = { 3, 8, 10, 12, 14, 16, 20, 24, 26, 28, 31, 33, 35, 40 },
            levels = {
                [76] = { acc = 331, eva = 375, agi = 89, int = 76, mnd = 54, chr = 54 },
                [77] = { acc = 337, eva = 381, agi = 91, int = 76, mnd = 54, chr = 54 },
                [78] = { acc = 342, eva = 386, agi = 91, int = 77, mnd = 54, chr = 54 },
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
            links  = 1,
        },
        {
            name   = 'Ob',
            ids    = { 43 },
            nm     = true,
            levels = {
                [78] = { acc = 331, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 337, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = -1, gravity = -1 },
            immune = { 'silence' },
            drops  = {
                { rate = 1000, item = 2628 },  -- obs arm
                { rate = 150, item = 15999 },  -- guignol earring
                { rate = 100, item = 2413 },  -- coiler
                { rate = 100, item = 2414 },  -- steam jacket
                { rate = 50, item = 3310 },  -- barrier module ii
                { rate = 50, item = 3312 },  -- percolator
                { rate = 50, item = 3313 },  -- vivi-valve
                { rate = 50, item = 3314 },  -- disruptor
                { rate = 10, item = 2325 },  -- equalizer
                { rate = 50, item = 2324 },  -- drum magazine
                { rate = 10, item = 2327 },  -- mana channeler
                { rate = 10, item = 2328 },  -- eraser
                { rate = 10, item = 2322 },  -- attuner
                { rate = 10, item = 2326 },  -- target marker
                { rate = 10, item = 2329 },  -- smoke screen
                { rate = 10, item = 2323 },  -- tactical processor
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Cheese Hoarder Gigiroon',
            ids    = { 44 },
            nm     = true,
            levels = {
                [80] = { acc = 353, eva = 397, agi = 93, int = 78, mnd = 55, chr = 55 },
                [81] = { acc = 360, eva = 404, agi = 96, int = 81, mnd = 58, chr = 58 },
                [82] = { acc = 366, eva = 409, agi = 96, int = 81, mnd = 58, chr = 58 },
            },
            ranks  = { fire = -1, ice = -1, wind = -2, earth = 2, water = -1, light = -1, paralyze = -1, bind = -1,
                       silence = -2, slow = 2, poison = -1, light_sleep = -1, gravity = -2 },
            resist = { gravity = 25 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'poison' },
            drops  = {
                { rate = 1000, item = 2618 },  -- gigiroons cape
                { rate = 150, item = 16340 },  -- armadillo cuisses
                { rate = 150, item = 17755 },  -- beast slayer
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Qiqirn Mine',
            ids    = { 45, 46, 47, 48, 49 },
            levels = {
                [75] = { acc = 317, eva = 303, agi = 82, int = 63, mnd = 63, chr = 70 },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Armed Gears',
            ids    = { 50 },
            nm     = true,
            levels = {
                [86] = { acc = 383, eva = 354, agi = 80, int = 80, mnd = 70, chr = 72 },
                [87] = { acc = 389, eva = 359, agi = 80, int = 80, mnd = 70, chr = 72 },
                [88] = { acc = 395, eva = 364, agi = 81, int = 80, mnd = 71, chr = 74 },
            },
            ranks  = { ice = 1, wind = 1, earth = 1, thunder = 4, water = -1, light = 4, dark = 1, paralyze = 1,
                       bind = 1, silence = 1, slow = 1, poison = -1, light_sleep = 4, dark_sleep = 1, blind = 1,
                       stun = 4, gravity = 1 },
            drops  = {
                { rate = 1000, item = 2610 },  -- armed gears fragment
                { rate = 240, item = 19036 },  -- earth grip
                { rate = 240, item = 19035 },  -- thunder grip
                { rate = 1000, group = {  -- one of
                    { 18126, 1 },  -- tomoe
                    { 15022, 1 },  -- oracles gloves
                    { 11376, 1 },  -- aurum sabatons
                } },
                { rate = 100, group = {  -- one of
                    { 18126, 1 },  -- tomoe
                    { 15022, 1 },  -- oracles gloves
                    { 11376, 1 },  -- aurum sabatons
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'magic' },
        },
        {
            name   = 'Wulgaru',
            ids    = { 51 },
            nm     = true,
            levels = {
                [80] = { acc = 344, eva = 324, agi = 77, int = 96, mnd = 51, chr = 62 },
                [81] = { acc = 352, eva = 330, agi = 80, int = 98, mnd = 53, chr = 64 },
                [82] = { acc = 358, eva = 335, agi = 80, int = 98, mnd = 53, chr = 64 },
            },
            ranks  = { ice = 3, wind = 3, earth = 3, thunder = 2, light = 6, dark = 11, paralyze = 3, bind = 3,
                       silence = 3, slow = 3, light_sleep = 6, dark_sleep = 11, blind = 11, stun = 2, gravity = 3 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity', 'silence', 'paralyze', 'slow', 'blind' },
            drops  = {
                { rate = 1000, item = 2633 },  -- wulgarus head
                { rate = 150, item = 16174 },  -- riot shield
                { rate = 150, item = 16152 },  -- hissho hachimaki
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Vidmapire',
            ids    = { 52, 53, 54 },
            nm     = true,
            levels = {
                [99] = { acc = 477, eva = 396, agi = 101, int = 129, mnd = 80, chr = 76 },
            },
            ranks  = { fire = 1, ice = 4, wind = 3, earth = 3, thunder = 1, water = 1, light = -1, dark = 11,
                       paralyze = 4, bind = 4, silence = 3, slow = 3, poison = 1, light_sleep = -1, dark_sleep = 11,
                       blind = 11, stun = 1, gravity = 3 },
            magic_dmg = { all = -25 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'bind', 'gravity' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound', 'low_hp' },
        },
        {
            name   = 'Panaiveriyamman',
            ids    = { 55, 56, 57, 58 },
            nm     = true,
            levels = {
                [139] = { acc = 497, eva = 638, agi = 139, int = 120, mnd = 90, chr = 117 },
            },
            ranks  = { ice = 3, wind = 3, earth = 3, thunder = 2, light = 6, dark = 11, paralyze = 3, bind = 3,
                       silence = 3, slow = 3, light_sleep = 6, dark_sleep = 11, blind = 11, stun = 2, gravity = 3 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
        },
    },
    by_name = {},
}
