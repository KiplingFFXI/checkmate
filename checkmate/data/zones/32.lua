-- Sealions Den (zone 32).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Mammet-22 Zeta', 'Omega', 'Ultima' },
        [2] = { 'Mammet-22 Zeta', 'Ultima' },
        [3] = { 'Mammet-22 Zeta', 'Omega' },
    },
    monsters = {
        {
            name   = 'Mammet-22 Zeta',
            ids    = { 1, 2, 3, 4, 5, 8, 9, 10, 11, 12, 15, 16, 17, 18, 19 },
            nm     = true,
            levels = {
                [55] = { acc = 204, eva = 185, agi = 53, int = 58, mnd = 58, chr = 52 },
                [56] = { acc = 210, eva = 191, agi = 54, int = 61, mnd = 61, chr = 55 },
            },
            ranks  = { thunder = -1, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'gravity' },
            drops  = {
                { rate = 240, item = 5264 },  -- bottle of yellow liquid
                { rate = 150, item = 5264 },  -- bottle of yellow liquid
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'magic' },
            links  = 1,
        },
        {
            name   = 'Omega',
            ids    = { 6, 13, 20 },
            nm     = true,
            levels = {
                [63] = { acc = 252, eva = 242, agi = 64, int = 52, mnd = 57, chr = 59 },
                [64] = { acc = 259, eva = 248, agi = 66, int = 53, mnd = 58, chr = 60 },
            },
            ranks  = { thunder = -1, dark = 11, dark_sleep = 11, blind = 11, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 2,
        },
        {
            name   = 'Ultima',
            ids    = { 7, 14, 21 },
            nm     = true,
            levels = {
                [63] = { acc = 252, eva = 239, agi = 70, int = 53, mnd = 53, chr = 59 },
                [64] = { acc = 258, eva = 245, agi = 72, int = 54, mnd = 54, chr = 60 },
            },
            ranks  = { thunder = -1, stun = -1 },
            magic_dmg = { all = -30 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
        },
        {
            name   = 'Tenzen',
            ids    = { 22, 26, 30 },
            nm     = true,
            levels = {
                [70] = { acc = 334, eva = 281, agi = 73, int = 61, mnd = 63, chr = 65 },
            },
            immune = { 'dark_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Makki-Chebukki',
            ids    = { 23, 27, 31 },
            nm     = true,
            levels = {
                [67] = { acc = 304, eva = 262, agi = 79, int = 57, mnd = 61, chr = 59 },
            },
            magic_dmg = { all = -100 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror' },
            no_aggro = true,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Kukki-Chebukki',
            ids    = { 24, 28, 32 },
            nm     = true,
            levels = {
                [67] = { acc = 271, eva = 258, agi = 71, int = 73, mnd = 57, chr = 63 },
            },
            ranks  = { silence = 9 },
            magic_dmg = { all = -100 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror' },
            no_aggro = true,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Cherukiki',
            ids    = { 25, 29, 33 },
            nm     = true,
            levels = {
                [67] = { acc = 265, eva = 254, agi = 63, int = 57, mnd = 73, chr = 67 },
            },
            ranks  = { silence = 9 },
            magic_dmg = { all = -100 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror' },
            no_aggro = true,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Tenzen',
            ids    = { 34, 38, 42, 46, 50, 54, 58, 62, 66, 70, 74, 78, 82, 86, 90 },
            nm     = true,
            levels = {
                [99] = { acc = 521, eva = 437, agi = 101, int = 85, mnd = 87, chr = 90 },
            },
            immune = { 'dark_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Makki-Chebukki',
            ids    = { 35, 39, 43, 47, 51, 55, 59, 63, 67, 71, 75, 79, 83, 87, 91 },
            nm     = true,
            levels = {
                [99] = { acc = 519, eva = 433, agi = 112, int = 82, mnd = 87, chr = 85 },
            },
            magic_dmg = { all = -100 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror' },
            no_aggro = true,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Kukki-Chebukki',
            ids    = { 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92 },
            nm     = true,
            levels = {
                [99] = { acc = 474, eva = 427, agi = 101, int = 104, mnd = 82, chr = 90 },
            },
            ranks  = { silence = 9 },
            magic_dmg = { all = -100 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror' },
            no_aggro = true,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Cherukiki',
            ids    = { 37, 41, 45, 49, 53, 57, 61, 65, 69, 73, 77, 81, 85, 89, 93 },
            nm     = true,
            levels = {
                [99] = { acc = 466, eva = 422, agi = 90, int = 82, mnd = 104, chr = 96 },
            },
            ranks  = { silence = 9 },
            magic_dmg = { all = -100 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'terror' },
            no_aggro = true,
            flags  = { scripted_aggro = true },
        },
        {
            name   = 'Omega',
            ids    = { 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122 },
            nm     = true,
            levels = {
                [99] = { acc = 479, eva = 436, agi = 99, int = 79, mnd = 87, chr = 91 },
            },
            ranks  = { thunder = -1, dark = 11, dark_sleep = 11, blind = 11, stun = -1 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
        {
            name   = 'Ultima',
            ids    = { 95, 97, 99, 101, 103, 105, 107, 109, 111, 113, 115, 117, 119, 121, 123 },
            nm     = true,
            levels = {
                [99] = { acc = 477, eva = 430, agi = 107, int = 82, mnd = 82, chr = 91 },
            },
            ranks  = { thunder = -1, stun = -1 },
            magic_dmg = { all = -30 },
            immune = { 'dark_sleep', 'light_sleep', 'terror' },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
        },
    },
    by_name = {},
}
