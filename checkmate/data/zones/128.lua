-- Valley of Sorrows (zone 128).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    link_lists = {},
    monsters = {
        {
            name   = 'Velociraptor',
            ids    = { 1, 2, 4, 5, 7, 8, 11, 13, 15, 16, 19, 23, 24, 25, 26, 31 },
            levels = {
                [66] = { acc = 267, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 271, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 276, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
                [69] = { acc = 282, eva = 271, agi = 77, int = 54, mnd = 54, chr = 60 },
            },
            ranks  = { wind = -2, earth = -2, thunder = -2, water = -3, light = -2, dark = -2, silence = -2,
                       slow = -2, poison = -3, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 853 },  -- raptor skin
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Peryton',
            ids    = { 3, 6, 9, 12, 14, 17, 20, 27, 32 },
            levels = {
                [69] = { acc = 284, eva = 271, agi = 77, int = 59, mnd = 59, chr = 65 },
                [70] = { acc = 289, eva = 276, agi = 77, int = 59, mnd = 59, chr = 65 },
                [71] = { acc = 296, eva = 282, agi = 80, int = 60, mnd = 60, chr = 68 },
                [72] = { acc = 301, eva = 287, agi = 80, int = 60, mnd = 60, chr = 68 },
            },
            ranks  = { fire = 1, ice = -3, wind = 4, earth = 1, thunder = 1, water = 1, light = 1, dark = 1,
                       paralyze = -3, bind = -3, silence = 4, slow = 1, poison = 1, light_sleep = 1, dark_sleep = 1,
                       blind = 1, stun = 1, gravity = 4 },
            drops  = {
                { rate = 150, item = 842 },  -- giant bird feather
                { rate = 50, item = 843 },  -- giant bird plume
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 10, 21 },
            levels = {
                [66] = { acc = 265, eva = 244, agi = 66, int = 77, mnd = 62, chr = 62 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 1000, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Air Elemental',
            ids    = { 18, 22 },
            levels = {
                [66] = { acc = 265, eva = 244, agi = 66, int = 77, mnd = 62, chr = 62 },
                [67] = { acc = 270, eva = 248, agi = 67, int = 79, mnd = 63, chr = 65 },
                [68] = { acc = 275, eva = 253, agi = 67, int = 79, mnd = 64, chr = 65 },
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
            name   = 'Valley Manticore',
            ids    = { 28, 29, 30 },
            levels = {
                [71] = { acc = 292, eva = 278, agi = 72, int = 55, mnd = 55, chr = 55 },
                [72] = { acc = 297, eva = 283, agi = 72, int = 55, mnd = 55, chr = 55 },
                [73] = { acc = 302, eva = 288, agi = 72, int = 58, mnd = 58, chr = 56 },
                [74] = { acc = 307, eva = 293, agi = 73, int = 58, mnd = 58, chr = 56 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = -2, thunder = -2, water = -3, paralyze = -2, bind = -2,
                       silence = 4, slow = -2, poison = -3, stun = -2, gravity = 4 },
            drops  = {
                { rate = 150, item = 1163 },  -- lock of manticore hair
                { rate = 100, item = 1116 },  -- manticore hide
                { rate = 50, item = 1123 },  -- manticore fang
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Adamantoise',
            ids    = { 33 },
            nm     = true,
            levels = {
                [70] = { acc = 281, eva = 262, agi = 49, int = 61, mnd = 85, chr = 85 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            magic_dmg = { all = -35 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'slow', 'elegy', 'poison', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 646 },  -- chunk of adaman ore
                { rate = 240, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 100, item = 12361 },  -- sipar
                { rate = 50, item = 13794 },  -- heavy cuirass
                { rate = 100, item = 3344 },  -- clump of red pondweed
            },
            aggro  = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Aspidochelone',
            ids    = { 34 },
            nm     = true,
            levels = {
                [85] = { acc = 368, eva = 339, agi = 59, int = 74, mnd = 102, chr = 102 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
            resist = { curse = 100 },
            magic_dmg = { all = -30 },
            immune = { 'dark_sleep', 'light_sleep', 'stun', 'slow', 'elegy', 'poison', 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 646 },  -- chunk of adaman ore
                { rate = 240, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 646 },  -- chunk of adaman ore
                { rate = 150, item = 908 },  -- adamantoise shell
                { rate = 240, item = 1525 },  -- adamantoise egg
                { rate = 100, item = 12361 },  -- sipar
                { rate = 50, item = 13794 },  -- heavy cuirass
                { rate = 1000, group = {  -- one of
                    { 1325, 3100 },  -- aquarian abjuration body
                    { 1318, 2300 },  -- dryadic abjuration feet
                    { 1333, 2300 },  -- martial abjuration feet
                    { 1335, 2300 },  -- wyrmal abjuration body
                } },
                { rate = 100, group = {  -- one of
                    { 1325, 3100 },  -- aquarian abjuration body
                    { 1318, 2300 },  -- dryadic abjuration feet
                    { 1333, 2300 },  -- martial abjuration feet
                    { 1335, 2300 },  -- wyrmal abjuration body
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Skahnowa',
            ids    = { 35 },
            levels = {
                [1] = { acc = 10, eva = 9, agi = 9, int = 8, mnd = 8, chr = 9 },
            },
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
        },
        {
            name   = 'Tolba',
            ids    = { 37 },
            nm     = true,
            levels = {},
            ranks  = { fire = 4, ice = -2, wind = 4, earth = 11, thunder = 11, water = 11, light = 4, dark = 4,
                       paralyze = -2, bind = -2, silence = 4, slow = 11, poison = 11, light_sleep = 4,
                       dark_sleep = 4, blind = 4, stun = 11, gravity = 4 },
        },
    },
    by_name = {},
}
