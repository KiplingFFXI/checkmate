-- Dragons Aery (zone 154).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Bark Tarantula' },
        [2] = { 'Darter' },
    },
    monsters = {
        {
            name   = 'Demonic Pugil',
            ids    = { 1, 2, 3, 4, 5 },
            levels = {
                [70] = { acc = 287, eva = 276, agi = 77, int = 55, mnd = 55, chr = 57 },
                [71] = { acc = 293, eva = 282, agi = 80, int = 55, mnd = 55, chr = 60 },
                [72] = { acc = 298, eva = 287, agi = 80, int = 55, mnd = 55, chr = 60 },
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Bark Tarantula',
            ids    = { 6, 7, 8, 15, 16, 17, 26, 27, 28, 29, 30, 31 },
            levels = {
                [77] = { acc = 330, eva = 311, agi = 80, int = 65, mnd = 65, chr = 58 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 65, mnd = 65, chr = 60 },
                [79] = { acc = 341, eva = 322, agi = 82, int = 66, mnd = 66, chr = 60 },
                [80] = { acc = 346, eva = 327, agi = 82, int = 66, mnd = 66, chr = 60 },
            },
            ranks  = { ice = -3, thunder = -1, water = -1, paralyze = -3, bind = -3, poison = -1, stun = -1 },
            drops  = {
                { rate = 100, item = 838 },  -- spider web
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Darter',
            ids    = { 9, 10, 11, 12, 13, 20, 21, 22, 23, 24, 25 },
            levels = {
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 66 },
                [77] = { acc = 326, eva = 313, agi = 85, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 331, eva = 318, agi = 85, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 337, eva = 324, agi = 87, int = 61, mnd = 61, chr = 69 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 2,
        },
        {
            name   = 'Demonic Rose',
            ids    = { 14 },
            levels = {
                [77] = { acc = 330, eva = 311, agi = 80, int = 60, mnd = 56, chr = 66 },
                [78] = { acc = 335, eva = 316, agi = 80, int = 60, mnd = 57, chr = 68 },
                [79] = { acc = 341, eva = 322, agi = 82, int = 61, mnd = 57, chr = 69 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -2, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 240, item = 920 },  -- malboro vine
                { rate = 50, item = 1446 },  -- lacquer tree log
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Fafnir',
            ids    = { 18 },
            nm     = true,
            levels = {
                [90] = { acc = 414, eva = 385, agi = 102, int = 85, mnd = 60, chr = 87 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, light = -2, paralyze = 11, bind = 11, poison = -2,
                       stun = 10 },
            immune = { 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 903 },  -- dragon talon
                { rate = 150, item = 13914 },  -- aegishjalmr
                { rate = 240, item = 867 },  -- handful of dragon scales
                { rate = 240, item = 867 },  -- handful of dragon scales
                { rate = 150, item = 4486 },  -- dragon heart
                { rate = 100, item = 16942 },  -- balmung
                { rate = 100, item = 17653 },  -- hrotti
                { rate = 100, item = 3340 },  -- cup of sweet tea
                { rate = 1000, group = { { 14075, 9500 }, { 16555, 500 } } },  -- one of andvaranauts, ridill
                { rate = 1000, group = {  -- one of
                    { 1339, 3100 },  -- neptunal abjuration head
                    { 1328, 2300 },  -- aquarian abjuration feet
                    { 1326, 2300 },  -- aquarian abjuration hands
                    { 1321, 2300 },  -- earthen abjuration hands
                } },
                { rate = 100, group = {  -- one of
                    { 1339, 3100 },  -- neptunal abjuration head
                    { 1328, 2300 },  -- aquarian abjuration feet
                    { 1326, 2300 },  -- aquarian abjuration hands
                    { 1321, 2300 },  -- earthen abjuration hands
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Nidhogg',
            ids    = { 19 },
            nm     = true,
            levels = {
                [90] = { acc = 497, eva = 378, agi = 102, int = 85, mnd = 60, chr = 87 },
            },
            ranks  = { fire = 11, ice = 11, water = -2, light = -2, paralyze = 11, bind = 11, poison = -2,
                       stun = 10 },
            immune = { 'petrify', 'terror' },
            drops  = {
                { rate = 1000, item = 4486 },  -- dragon heart
                { rate = 240, item = 1133 },  -- vial of dragon blood
                { rate = 240, item = 1133 },  -- vial of dragon blood
                { rate = 50, item = 4272 },  -- slice of dragon meat
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 100, item = 865 },  -- handful of nidhoggs scales
                { rate = 240, item = 1526 },  -- wyrm beard
                { rate = 1000, group = {  -- one of
                    { 1320, 3100 },  -- earthen abjuration body
                    { 1325, 2300 },  -- aquarian abjuration body
                    { 1330, 2300 },  -- martial abjuration body
                    { 1342, 2300 },  -- neptunal abjuration legs
                } },
                { rate = 100, group = {  -- one of
                    { 1320, 3100 },  -- earthen abjuration body
                    { 1325, 2300 },  -- aquarian abjuration body
                    { 1330, 2300 },  -- martial abjuration body
                    { 1342, 2300 },  -- neptunal abjuration legs
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
    },
    by_name = {},
}
