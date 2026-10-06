-- Gustav Tunnel (zone 212).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Greater Gaylas', 'Hell Bat' }, true_sound = { 'Baronial Bat' } },
        [2] = {
            sight = { 'Goblin Alchemist', 'Goblin Mercenary', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblinsavior Heronox', 'Wyvernhunter Bambrox', 'Wyvernpoacher Drachlox' },
        },
        [3] = { sound = { 'Labyrinth Lizard' } },
        [4] = { sound = { 'Labyrinth Leech' } },
        [5] = { sight = { 'Ungur' } },
        [6] = { sound = { 'Hawker' } },
        [7] = {
            sight = { 'Goblin Alchemist', 'Goblin Mercenary', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Wyvernhunter Bambrox', 'Wyvernpoacher Drachlox' },
        },
        [8] = {
            sight = { 'Goblin Alchemist', 'Goblin Mercenary', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblinsavior Heronox', 'Wyvernhunter Bambrox' },
        },
        [9] = { sight = { 'Bune' } },
        [10] = { sound = { 'Greater Gaylas', 'Hell Bat' } },
        [11] = {
            sight = { 'Goblin Alchemist', 'Goblin Mercenary', 'Goblin Poacher', 'Goblin Reaper', 'Goblin Robber',
                      'Goblin Shepherd', 'Goblinsavior Heronox', 'Wyvernpoacher Drachlox' },
        },
    },
    monsters = {
        {
            name   = 'Greater Gaylas',
            ids    = { 1, 2, 4, 23, 61, 62 },
            levels = {
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42 },
                [49] = { acc = 176, eva = 167, agi = 56, int = 38, mnd = 38, chr = 42 },
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
            links  = 1,
        },
        {
            name   = 'Goblin Poacher',
            ids    = { 3, 11, 26, 27, 47 },
            levels = {
                [46] = { acc = 187, eva = 145, agi = 59, int = 40, mnd = 42, chr = 40 },
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
            links  = 2,
        },
        {
            name   = 'Goblin Robber',
            ids    = { 5, 16, 31, 32, 42 },
            levels = {
                [46] = { acc = 171, eva = 191, agi = 56, int = 48, mnd = 34, chr = 34 },
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
            links  = 2,
        },
        {
            name   = 'Labyrinth Lizard',
            ids    = { 6, 7, 12, 13, 17, 18, 20, 21, 60 },
            levels = {
                [46] = { acc = 167, eva = 155, agi = 48, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 170, eva = 157, agi = 49, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 173, eva = 161, agi = 50, int = 37, mnd = 37, chr = 42 },
                [49] = { acc = 178, eva = 165, agi = 52, int = 38, mnd = 38, chr = 42 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 926 },  -- lizard tail
                { rate = 50, item = 852 },  -- lizard skin
                { rate = 100, item = 4362 },  -- lizard egg
            },
            links  = 3,
        },
        {
            name   = 'Labyrinth Leech',
            ids    = { 8, 9, 14, 15, 19, 30, 35, 40 },
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 39, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 40, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 40, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 161, agi = 50, int = 40, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            drops  = {
                { rate = 100, item = 924 },  -- vial of fiend blood
                { rate = 50, item = 930 },  -- vial of beastman blood
                { rate = 10, item = 1125 },  -- carbuncles ruby
            },
            links  = 4,
        },
        {
            name   = 'Bune',
            ids    = { 10 },
            nm     = true,
            levels = {
                [83] = { acc = 359, eva = 333, agi = 67, int = 69, mnd = 74, chr = 76 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 50, item = 866 },  -- handful of wyvern scales
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 150, item = 1124 },  -- wyvern wing
                { rate = 150, item = 1124 },  -- wyvern wing
                { rate = 150, item = 1124 },  -- wyvern wing
                { rate = 50, item = 16605 },  -- enhancing sword
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Hell Bat',
            ids    = { 22, 49, 50, 51 },
            levels = {
                [44] = { acc = 158, eva = 150, agi = 50, int = 34, mnd = 34, chr = 39 },
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42 },
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
            links  = 1,
        },
        {
            name   = 'Goblin Reaper',
            ids    = { 24, 36, 37, 44 },
            levels = {
                [46] = { acc = 168, eva = 154, agi = 46, int = 48, mnd = 34, chr = 34 },
                [47] = { acc = 171, eva = 157, agi = 48, int = 49, mnd = 35, chr = 35 },
                [48] = { acc = 175, eva = 160, agi = 48, int = 50, mnd = 35, chr = 35 },
                [49] = { acc = 179, eva = 163, agi = 49, int = 52, mnd = 35, chr = 35 },
            },
            ph_for = { [37] = { 41 } },
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
            links  = 2,
        },
        {
            name   = 'Hawker',
            ids    = { 25, 28, 29, 33, 34, 38, 39, 43, 45, 46, 48 },
            levels = {
                [45] = { acc = 161, eva = 153, agi = 50, int = 36, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 6,
        },
        {
            name   = 'Goblinsavior Heronox',
            ids    = { 41 },
            nm     = true,
            levels = {
                [51] = { acc = 189, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 194, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { virus = 15 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 507 },  -- goblin mail
                { rate = 1000, item = 508 },  -- goblin helm
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 16727 },  -- eisentaenzer
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 7,
        },
        {
            name   = 'Makara',
            ids    = { 52, 53, 54, 55, 56, 57, 58, 59 },
            levels = {
                [46] = { acc = 165, eva = 157, agi = 52, int = 36, mnd = 36, chr = 38 },
                [47] = { acc = 168, eva = 159, agi = 52, int = 37, mnd = 37, chr = 38 },
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 40 },
                [49] = { acc = 176, eva = 167, agi = 56, int = 38, mnd = 38, chr = 40 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Robber Crab',
            ids    = { 63, 64, 73, 74, 82, 86, 87, 92, 93, 98, 99, 101, 102, 130, 131 },
            levels = {
                [65] = { acc = 256, eva = 235, agi = 43, int = 46, mnd = 68, chr = 68 },
                [66] = { acc = 261, eva = 240, agi = 44, int = 47, mnd = 70, chr = 70 },
                [67] = { acc = 265, eva = 245, agi = 44, int = 48, mnd = 71, chr = 71 },
                [68] = { acc = 271, eva = 250, agi = 45, int = 48, mnd = 71, chr = 71 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 150, item = 4400 },  -- slice of land crab meat
                { rate = 100, item = 881 },  -- crab shell
                { rate = 10, item = 1193 },  -- high-quality crab shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Mercenary',
            ids    = { 65, 66, 75, 76 },
            levels = {
                [65] = { acc = 264, eva = 250, agi = 72, int = 52, mnd = 52, chr = 58 },
                [66] = { acc = 271, eva = 255, agi = 75, int = 52, mnd = 52, chr = 58 },
                [67] = { acc = 275, eva = 260, agi = 75, int = 53, mnd = 53, chr = 59 },
                [68] = { acc = 280, eva = 265, agi = 75, int = 53, mnd = 53, chr = 60 },
            },
            ph_for = { [65] = { 72 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { virus = 20 },
            drops  = {
                { rate = 50, item = 1426 },  -- warriors testimony
                { rate = 50, item = 508 },  -- goblin helm
                { rate = 10, item = 507 },  -- goblin mail
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Alchemist',
            ids    = { 67, 77, 85 },
            levels = {
                [65] = { acc = 256, eva = 224, agi = 62, int = 58, mnd = 80, chr = 68 },
                [66] = { acc = 262, eva = 229, agi = 63, int = 58, mnd = 80, chr = 70 },
                [67] = { acc = 266, eva = 233, agi = 63, int = 59, mnd = 83, chr = 71 },
                [68] = { acc = 271, eva = 239, agi = 64, int = 60, mnd = 83, chr = 71 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            drops  = {
                { rate = 100, item = 1428 },  -- white mages testimony
                { rate = 50, item = 4719 },  -- scroll of regen iii
                { rate = 10, item = 4613 },  -- scroll of cure v
                { rate = 10, item = 4618 },  -- scroll of curaga iv
                { rate = 50, item = 4741 },  -- scroll of shellra iv
                { rate = 50, item = 4750 },  -- scroll of reraise iii
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblin Shepherd',
            ids    = { 68, 70, 78, 80, 83 },
            levels = {
                [65] = { acc = 264, eva = 242, agi = 56, int = 58, mnd = 58, chr = 80 },
                [66] = { acc = 271, eva = 246, agi = 57, int = 58, mnd = 58, chr = 80 },
                [67] = { acc = 275, eva = 251, agi = 57, int = 59, mnd = 59, chr = 83 },
                [68] = { acc = 280, eva = 256, agi = 57, int = 60, mnd = 60, chr = 83 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            resist = { slow = 20 },
            drops  = {
                { rate = 240, item = 17088 },  -- ash staff
                { rate = 150, item = 859 },  -- ram skin
                { rate = 100, item = 1434 },  -- beastmasters testimony
                { rate = 50, item = 17865 },  -- jug of singing herbal broth
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Goblins Leech',
            ids    = { 69, 71, 79, 81, 84 },
            levels = {
                [53] = { acc = 196, eva = 184, agi = 57, int = 46, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 190, agi = 58, int = 47, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 47, mnd = 43, chr = 49 },
            },
            ranks  = { fire = -2, ice = -2, water = 4, light = -3, dark = 2, paralyze = -2, bind = -2, poison = 4,
                       light_sleep = -3, dark_sleep = 2, blind = 2 },
            links  = 4,
        },
        {
            name   = 'Wyvernpoacher Drachlox',
            ids    = { 72 },
            nm     = true,
            levels = {
                [70] = { acc = 336, eva = 260, agi = 89, int = 61, mnd = 67, chr = 61 },
                [71] = { acc = 341, eva = 266, agi = 92, int = 63, mnd = 67, chr = 63 },
                [72] = { acc = 346, eva = 271, agi = 92, int = 63, mnd = 67, chr = 63 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 10, slow = -2, poison = -2, light_sleep = 9,
                       dark_sleep = 9, stun = -2, gravity = -2 },
            resist = { poison = 20 },
            immune = { 'stun', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 510 },  -- goblin armor
                { rate = 1000, item = 511 },  -- goblin mask
                { rate = 1000, item = 748 },  -- gold beastcoin
                { rate = 150, item = 17244 },  -- othinus bow
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 8,
        },
        {
            name   = 'Doom Soldier',
            ids    = { 88, 89, 94, 95, 100, 103, 104 },
            levels = {
                [65] = { acc = 263, eva = 245, agi = 62, int = 68, mnd = 43, chr = 46 },
                [66] = { acc = 269, eva = 249, agi = 62, int = 70, mnd = 44, chr = 47 },
                [67] = { acc = 273, eva = 255, agi = 65, int = 71, mnd = 44, chr = 48 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 1433 },  -- dark knights testimony
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Doom Mage',
            ids    = { 90, 91, 96, 97 },
            levels = {
                [65] = { acc = 263, eva = 227, agi = 68, int = 80, mnd = 55, chr = 62 },
                [66] = { acc = 269, eva = 233, agi = 70, int = 80, mnd = 55, chr = 62 },
                [67] = { acc = 273, eva = 237, agi = 71, int = 83, mnd = 55, chr = 65 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 4759 },  -- scroll of blizzard iii
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Doom Guard',
            ids    = { 105, 108, 109, 110, 111, 118, 120, 121, 122, 132, 133, 136, 139, 143, 144, 153, 154, 159,
                       164, 165, 167, 175, 179, 183, 188, 194, 202, 209, 217, 218, 221 },
            levels = {
                [75] = { acc = 317, eva = 297, agi = 70, int = 77, mnd = 49, chr = 52 },
                [76] = { acc = 323, eva = 302, agi = 72, int = 80, mnd = 50, chr = 54 },
                [77] = { acc = 328, eva = 307, agi = 72, int = 80, mnd = 50, chr = 54 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 100, item = 1433 },  -- dark knights testimony
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Demonic Pugil',
            ids    = { 106, 107, 116, 117, 146, 156, 160, 161, 162, 168, 172, 177, 178, 182, 184, 189, 191, 192,
                       193, 198, 203, 207, 208, 212, 215, 219, 225 },
            levels = {
                [73] = { acc = 304, eva = 292, agi = 80, int = 58, mnd = 58, chr = 60 },
                [74] = { acc = 309, eva = 298, agi = 82, int = 58, mnd = 58, chr = 60 },
                [75] = { acc = 314, eva = 303, agi = 82, int = 58, mnd = 58, chr = 62 },
                [76] = { acc = 321, eva = 308, agi = 85, int = 59, mnd = 59, chr = 62 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -3, water = 6, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = -2, slow = -2, poison = 4, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 868 },  -- handful of pugil scales
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Doom Warlock',
            ids    = { 112, 113, 114, 115, 124, 125, 134, 135, 137, 138, 141, 142, 147, 152, 157, 158, 163, 166,
                       170, 171, 176, 180, 181, 197, 210, 211, 213, 214, 222 },
            levels = {
                [76] = { acc = 323, eva = 283, agi = 80, int = 92, mnd = 62, chr = 72 },
                [77] = { acc = 328, eva = 287, agi = 80, int = 93, mnd = 62, chr = 72 },
                [78] = { acc = 333, eva = 292, agi = 80, int = 93, mnd = 65, chr = 72 },
            },
            ph_for = { [170] = { 174 } },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 240, item = 880 },  -- bone chip
                { rate = 150, item = 940 },  -- revival tree root
                { rate = 50, group = {  -- one of
                    { 4759, 3500 },  -- scroll of blizzard iii
                    { 4788, 2500 },  -- scroll of blizzaga ii
                    { 4789, 1500 },  -- scroll of blizzaga iii
                    { 4760, 1500 },  -- scroll of blizzard iv
                    { 4814, 1000 },  -- scroll of freeze
                } },
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 119, 129, 201 },
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
                [77] = { acc = 324, eva = 299, agi = 75, int = 89, mnd = 71, chr = 72 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            drops  = {
                { rate = 1000, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
                { rate = 150, item = 4107 },  -- earth cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Erlik',
            ids    = { 123, 149, 150, 173, 185, 220, 223 },
            levels = {
                [75] = { acc = 314, eva = 300, agi = 77, int = 74, mnd = 57, chr = 72 },
                [76] = { acc = 321, eva = 306, agi = 80, int = 75, mnd = 57, chr = 73 },
                [77] = { acc = 326, eva = 311, agi = 80, int = 76, mnd = 58, chr = 73 },
                [78] = { acc = 331, eva = 316, agi = 80, int = 76, mnd = 60, chr = 74 },
            },
            ph_for = { [150] = { 151 } },
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
            name   = 'Typhoon Wyvern',
            ids    = { 126, 127, 145, 148, 155, 186, 190, 196, 216, 224 },
            levels = {
                [78] = { acc = 333, eva = 316, agi = 80, int = 69, mnd = 57, chr = 65 },
                [79] = { acc = 339, eva = 322, agi = 82, int = 70, mnd = 57, chr = 65 },
                [80] = { acc = 344, eva = 327, agi = 82, int = 70, mnd = 57, chr = 65 },
            },
            ph_for = { [186] = { 187 }, [216] = { 187 } },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Fire Elemental',
            ids    = { 140, 205 },
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
                [76] = { acc = 319, eva = 295, agi = 75, int = 88, mnd = 71, chr = 72 },
                [77] = { acc = 324, eva = 299, agi = 75, int = 89, mnd = 71, chr = 72 },
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
            name   = 'Baobhan Sith',
            ids    = { 151 },
            nm     = true,
            levels = {
                [79] = { acc = 337, eva = 322, agi = 82, int = 78, mnd = 60, chr = 76 },
                [80] = { acc = 342, eva = 327, agi = 82, int = 78, mnd = 60, chr = 76 },
                [81] = { acc = 349, eva = 332, agi = 85, int = 80, mnd = 62, chr = 78 },
            },
            ranks  = { fire = -3, ice = 10, wind = -2, thunder = -2, water = -2, light = -3, dark = 10,
                       paralyze = 10, bind = 10, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4,
                       blind = 10, stun = 10, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            drops  = {
                { rate = 1000, item = 1281 },  -- square of cheviot cloth
                { rate = 240, item = 1281 },  -- square of cheviot cloth
                { rate = 150, item = 1281 },  -- square of cheviot cloth
                { rate = 150, item = 1281 },  -- square of cheviot cloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Antares GT',
            ids    = { 169, 195, 199, 200, 204 },
            levels = {
                [77] = { acc = 324, eva = 311, agi = 80, int = 60, mnd = 60, chr = 66 },
                [78] = { acc = 329, eva = 316, agi = 80, int = 60, mnd = 60, chr = 68 },
                [79] = { acc = 335, eva = 322, agi = 82, int = 61, mnd = 61, chr = 69 },
            },
            ph_for = { [200] = { 206 }, [204] = { 206 } },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 897 },  -- scorpion claw
                { rate = 100, item = 896 },  -- scorpion shell
                { rate = 10, item = 1473 },  -- high-quality scorpion shell
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Taxim',
            ids    = { 174 },
            nm     = true,
            levels = {
                [78] = { acc = 333, eva = 292, agi = 80, int = 93, mnd = 65, chr = 72 },
                [79] = { acc = 339, eva = 297, agi = 82, int = 96, mnd = 65, chr = 75 },
                [80] = { acc = 344, eva = 302, agi = 82, int = 96, mnd = 65, chr = 75 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 1000, item = 880 },  -- bone chip
                { rate = 1000, item = 880 },  -- bone chip
                { rate = 150, item = 17564 },  -- cocytus pole
                { rate = 1000, group = {  -- one of
                    { 4788, 2500 },  -- scroll of blizzaga ii
                    { 4789, 2500 },  -- scroll of blizzaga iii
                    { 4759, 2500 },  -- scroll of blizzard iii
                    { 4760, 1250 },  -- scroll of blizzard iv
                    { 4814, 1250 },  -- scroll of freeze
                } },
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Ungur',
            ids    = { 187 },
            nm     = true,
            levels = {
                [81] = { acc = 352, eva = 332, agi = 85, int = 73, mnd = 60, chr = 67 },
                [82] = { acc = 358, eva = 337, agi = 85, int = 73, mnd = 60, chr = 67 },
                [83] = { acc = 364, eva = 342, agi = 85, int = 73, mnd = 60, chr = 67 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'terror' },
            drops  = {
                { rate = 1000, item = 18141 },  -- ungur boomerang
                { rate = 240, item = 1124 },  -- wyvern wing
                { rate = 150, item = 1124 },  -- wyvern wing
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 150, item = 1122 },  -- wyvern skin
                { rate = 100, item = 1122 },  -- wyvern skin
                { rate = 50, item = 1122 },  -- wyvern skin
                { rate = 1000, item = 866 },  -- handful of wyvern scales
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 9,
        },
        {
            name   = 'Amikiri',
            ids    = { 206 },
            nm     = true,
            levels = {
                [80] = { acc = 340, eva = 327, agi = 82, int = 61, mnd = 61, chr = 69 },
                [81] = { acc = 347, eva = 332, agi = 85, int = 64, mnd = 64, chr = 71 },
                [82] = { acc = 353, eva = 337, agi = 85, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            immune = { 'dark_sleep', 'light_sleep', 'poison' },
            drops  = {
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 1000, item = 896 },  -- scorpion shell
                { rate = 1000, item = 16968 },  -- kamewari
                { rate = 10, item = 901 },  -- venomous claw
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Gigaplasm',
            ids    = { 226 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 59, chr = 61 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Macroplasm',
            ids    = { 227, 228 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 59, chr = 61 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Microplasm',
            ids    = { 229, 230, 231, 232 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 59, chr = 61 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Nanoplasm',
            ids    = { 233, 234, 235, 236, 237, 238, 239, 240 },
            nm     = true,
            levels = {
                [70] = { acc = 287, eva = 272, agi = 69, int = 55, mnd = 59, chr = 61 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Baronial Bat',
            ids    = { 241 },
            nm     = true,
            levels = {
                [82] = { acc = 355, eva = 340, agi = 90, int = 64, mnd = 64, chr = 71 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
            links  = 10,
        },
        {
            name   = 'Renfred',
            ids    = { 242, 243, 244, 245 },
            nm     = true,
            levels = {},
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Gorattz',
            ids    = { 246, 247, 248, 249 },
            nm     = true,
            levels = {},
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bompupu',
            ids    = { 250, 251, 252, 253 },
            nm     = true,
            levels = {},
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Wyvernhunter Bambrox',
            ids    = { 263 },
            nm     = true,
            levels = {},
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -2 },
            aggro  = true,
            detects = { 'sight' },
            links  = 11,
        },
        {
            name   = 'Goblin Mine',
            ids    = { 264, 265, 266, 267, 268, 269, 270 },
            levels = {},
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
        {
            name   = 'Goblin Mine',
            ids    = { 271 },
            levels = {},
            aggro  = true,
            true_detect = true,
            detects = { 'sound' },
        },
    },
    by_name = {},
}
