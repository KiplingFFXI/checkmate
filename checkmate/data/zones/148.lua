-- Qulun Dome (zone 148).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Adaman Quadav', 'Ancient Quadav', 'Darksteel Quadav', 'Diamond Quadav', 'HuRhe Marrowgorger',
                'Platinum Quadav', 'Ruby Quadav', 'Sapphire Quadav', 'ZaDha Adamantking' },
        [2] = { 'Ancient Quadav', 'Darksteel Quadav', 'Diamond Quadav', 'HuRhe Marrowgorger', 'Platinum Quadav',
                'Ruby Quadav', 'Sapphire Quadav', 'ZaDha Adamantking' },
        [3] = { 'Adaman Quadav', 'Ancient Quadav', 'Darksteel Quadav', 'Diamond Quadav', 'HuRhe Marrowgorger',
                'Platinum Quadav', 'Ruby Quadav', 'Sapphire Quadav' },
        [4] = { 'Adaman Quadav', 'Ancient Quadav', 'Darksteel Quadav', 'Diamond Quadav', 'Platinum Quadav',
                'Ruby Quadav', 'Sapphire Quadav', 'ZaDha Adamantking' },
    },
    monsters = {
        {
            name   = 'Ancient Quadav',
            ids    = { 1, 5, 14 },
            levels = {
                [69] = { acc = 286, eva = 269, agi = 72, int = 51, mnd = 54, chr = 60, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 274, agi = 73, int = 51, mnd = 55, chr = 61, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 279, agi = 75, int = 52, mnd = 55, chr = 63, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 284, agi = 75, int = 52, mnd = 55, chr = 63, resist = { virus = 25 } },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1426 },  -- warriors testimony
                { rate = 1, item = 12417 },  -- mythril sallet
                { rate = 1, item = 12673 },  -- mythril gauntlets
                { rate = 1, item = 12801 },  -- mythril cuisses
                { rate = 1, item = 12929 },  -- mythril leggings
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Darksteel Quadav',
            ids    = { 2, 6, 10, 12 },
            levels = {
                [69] = { acc = 282, eva = 261, agi = 56, int = 47, mnd = 66, chr = 68,
                         resist = { sleep = 20, virus = 20 } },
                [70] = { acc = 287, eva = 266, agi = 57, int = 47, mnd = 67, chr = 69,
                         resist = { sleep = 20, virus = 25 } },
                [71] = { acc = 293, eva = 271, agi = 59, int = 49, mnd = 68, chr = 71,
                         resist = { sleep = 20, virus = 25 } },
                [72] = { acc = 298, eva = 276, agi = 59, int = 49, mnd = 68, chr = 71,
                         resist = { sleep = 20, virus = 25 } },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1432 },  -- paladins testimony
                { rate = 10, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Platinum Quadav',
            ids    = { 3, 7, 15 },
            levels = {
                [69] = { acc = 290, eva = 320, agi = 75, int = 63, mnd = 50, chr = 52,
                         resist = { virus = 20, gravity = 20 } },
                [70] = { acc = 295, eva = 339, agi = 77, int = 63, mnd = 51, chr = 53,
                         resist = { virus = 25, gravity = 20 } },
                [71] = { acc = 301, eva = 345, agi = 78, int = 65, mnd = 52, chr = 55,
                         resist = { virus = 25, gravity = 20 } },
                [72] = { acc = 306, eva = 350, agi = 78, int = 65, mnd = 52, chr = 55,
                         resist = { virus = 25, gravity = 20 } },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 150, item = 656 },  -- beastcoin
                { rate = 50, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Sapphire Quadav',
            ids    = { 4, 8, 11, 13 },
            levels = {
                [69] = { acc = 286, eva = 269, agi = 72, int = 71, mnd = 58, chr = 63, resist = { virus = 20 } },
                [70] = { acc = 291, eva = 274, agi = 73, int = 71, mnd = 59, chr = 65, resist = { virus = 25 } },
                [71] = { acc = 297, eva = 279, agi = 75, int = 73, mnd = 60, chr = 66, resist = { virus = 25 } },
                [72] = { acc = 302, eva = 284, agi = 75, int = 73, mnd = 60, chr = 66, resist = { virus = 25 } },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1429 },  -- black mages testimony
                { rate = 50, item = 4779 },  -- scroll of water iii
                { rate = 10, item = 4808 },  -- scroll of waterga ii
                { rate = 10, item = 4809 },  -- scroll of waterga iii
                { rate = 10, item = 4780 },  -- scroll of water iv
                { rate = 10, item = 4822 },  -- scroll of flood
                { rate = 1, item = 12739 },  -- black mitts
                { rate = 1, item = 12867 },  -- white slacks
                { rate = 1, item = 12995 },  -- moccasins
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Ruby Quadav',
            ids    = { 9, 17 },
            nm     = true,
            levels = {
                [72] = { acc = 300, eva = 280, agi = 67, int = 65, mnd = 68, chr = 66 },
                [73] = { acc = 306, eva = 286, agi = 68, int = 66, mnd = 70, chr = 68 },
                [74] = { acc = 311, eva = 291, agi = 68, int = 67, mnd = 71, chr = 68 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { virus = 25, petrify = 25 },
            drops  = {
                { rate = 240, item = 1430 },  -- red mages testimony
                { rate = 150, item = 4659 },  -- scroll of shell iv
                { rate = 240, item = 786 },  -- ruby
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Adaman Quadav',
            ids    = { 16 },
            nm     = true,
            levels = {
                [72] = { acc = 302, eva = 282, agi = 70, int = 65, mnd = 52, chr = 55 },
                [73] = { acc = 308, eva = 288, agi = 72, int = 66, mnd = 54, chr = 56 },
                [74] = { acc = 313, eva = 293, agi = 72, int = 67, mnd = 54, chr = 56 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { paralyze = 20, virus = 25 },
            drops  = {
                { rate = 240, item = 1433 },  -- dark knights testimony
                { rate = 50, item = 748 },  -- gold beastcoin
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Diamond Quadav',
            ids    = { 18, 20 },
            nm     = true,
            levels = {
                [75] = { acc = 312, eva = 296, agi = 69, int = 60, mnd = 80, chr = 73 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 1000, item = 787 },  -- diamond
                { rate = 1000, item = 1428 },  -- white mages testimony
                { rate = 100, item = 4741 },  -- scroll of shellra iv
                { rate = 50, item = 4621 },  -- scroll of raise ii
                { rate = 100, item = 4719 },  -- scroll of regen iii
                { rate = 100, item = 13616 },  -- dodge cape
                { rate = 50, item = 4613 },  -- scroll of cure v
                { rate = 10, item = 4618 },  -- scroll of curaga iv
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'ZaDha Adamantking',
            ids    = { 19 },
            nm     = true,
            levels = {
                [85] = { acc = 372, eva = 349, agi = 78, int = 67, mnd = 90, chr = 83 },
            },
            ranks  = { fire = 2, ice = -2, wind = -2, earth = -2, thunder = -1, water = 2, light = -2, dark = -2,
                       paralyze = 8, bind = -2, silence = 11, slow = 8, poison = 2, light_sleep = 11,
                       dark_sleep = 11, blind = -2, stun = -3, gravity = -2 },
            resist = { virus = 25 },
            drops  = {
                { rate = 1000, item = 751 },  -- platinum beastcoin
                { rate = 1000, item = 1428 },  -- white mages testimony
                { rate = 1000, item = 4748 },  -- scroll of raise iii
                { rate = 50, item = 17073 },  -- mistilteinn
                { rate = 10, item = 4172 },  -- reraiser
                { rate = 10, item = 4174 },  -- vile elixir
                { rate = 10, item = 4175 },  -- vile elixir +1
                { rate = 1000, group = {  -- one of
                    { 942, 3000 },  -- philosophers stone
                    { 844, 3000 },  -- phoenix feather
                    { 1132, 1000 },  -- square of raxa
                    { 658, 750 },  -- damascus ingot
                    { 837, 750 },  -- spool of malboro fiber
                    { 836, 750 },  -- square of damascene cloth
                    { 1110, 750 },  -- vial of black beetle blood
                } },
                { rate = 1000, group = {  -- one of
                    { 1132, 1550 },  -- square of raxa
                    { 645, 650 },  -- chunk of darksteel ore
                    { 737, 650 },  -- chunk of gold ore
                    { 644, 650 },  -- chunk of mythril ore
                    { 738, 650 },  -- chunk of platinum ore
                    { 887, 650 },  -- coral fragment
                    { 902, 650 },  -- demon horn
                    { 702, 650 },  -- ebony log
                    { 866, 650 },  -- handful of wyvern scales
                    { 700, 650 },  -- mahogany log
                    { 703, 650 },  -- petrified log
                    { 895, 650 },  -- ram horn
                    { 823, 650 },  -- spool of gold thread
                    { 830, 650 },  -- square of rainbow cloth
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'HuRhe Marrowgorger',
            ids    = { 22 },
            levels = {
                [72] = { acc = 302, eva = 280, agi = 67, int = 72, mnd = 51, chr = 51, resist = { paralyze = 20 } },
                [73] = { acc = 308, eva = 287, agi = 70, int = 72, mnd = 52, chr = 52, resist = { paralyze = 20 } },
                [74] = { acc = 313, eva = 292, agi = 70, int = 73, mnd = 52, chr = 52, resist = { paralyze = 20 } },
                [75] = { acc = 319, eva = 297, agi = 70, int = 74, mnd = 52, chr = 52, resist = { paralyze = 25 } },
            },
            ranks  = { ice = -2, wind = -2, earth = -2, thunder = -3, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -3,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
    },
    by_name = {},
}
