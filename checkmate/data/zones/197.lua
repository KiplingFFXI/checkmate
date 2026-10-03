-- Crawlers Nest (zone 197).
-- Built by tools\export_data.py from phoenix/live f125de32dc.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live f125de32dc',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Awd Goggie', 'Drone Crawler', 'Guardian Crawler', 'Knight Crawler', 'Matron Crawler',
                'Queen Crawler', 'Rumble Crawler', 'Soldier Crawler', 'Worker Crawler', 'Worker Crawler CN' },
        [2] = { 'Awd Goggie', 'Drone Crawler', 'Guardian Crawler', 'Knight Crawler', 'Matron Crawler',
                'Rumble Crawler', 'Soldier Crawler', 'Worker Crawler', 'Worker Crawler CN' },
        [3] = { 'Awd Goggie', 'Drone Crawler', 'Guardian Crawler', 'Knight Crawler', 'Queen Crawler',
                'Rumble Crawler', 'Soldier Crawler', 'Worker Crawler', 'Worker Crawler CN' },
        [4] = { 'Drone Crawler', 'Guardian Crawler', 'Knight Crawler', 'Matron Crawler', 'Queen Crawler',
                'Rumble Crawler', 'Soldier Crawler', 'Worker Crawler', 'Worker Crawler CN' },
        [5] = { 'Death Jacket', 'Demonic Tiphia', 'Soul Stinger', 'Wespe' },
        [6] = { 'Labyrinth Lizard', 'Maze Lizard' },
        [7] = { 'Exoray', 'Killer Mushroom' },
        [8] = { 'Crawler Hunter', 'Doom Scorpion', 'Mushussu' },
        [9] = { 'Caveberry', 'Witch Hazel' },
        [10] = { 'Blazer Beetle', 'Helm Beetle', 'Nest Beetle' },
        [11] = { 'Dragonfly', 'Hornfly' },
        [12] = { 'Death Jacket', 'Soul Stinger', 'Wespe' },
    },
    monsters = {
        {
            name   = 'Guardian Crawler',
            ids    = { 1, 2 },
            nm     = true,
            levels = {
                [45] = { acc = 161, eva = 150, agi = 45, int = 36, mnd = 36, chr = 40 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4529 },  -- rolanberry 881 c.e.
                { rate = 150, item = 816 },  -- spool of silk thread
                { rate = 100, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Drone Crawler',
            ids    = { 3, 4 },
            nm     = true,
            levels = {
                [50] = { acc = 180, eva = 167, agi = 51, int = 41, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4530 },  -- rolanberry 874 c.e.
                { rate = 150, item = 816 },  -- spool of silk thread
                { rate = 100, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Queen Crawler',
            ids    = { 5 },
            nm     = true,
            levels = {
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4531 },  -- rolanberry 864 c.e.
                { rate = 150, item = 816 },  -- spool of silk thread
                { rate = 100, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 2,
        },
        {
            name   = 'Matron Crawler',
            ids    = { 6 },
            nm     = true,
            levels = {
                [64] = { acc = 256, eva = 241, agi = 64, int = 50, mnd = 50, chr = 56 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4531 },  -- rolanberry 864 c.e.
                { rate = 150, item = 816 },  -- spool of silk thread
                { rate = 100, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 3,
        },
        {
            name   = 'Awd Goggie',
            ids    = { 7 },
            nm     = true,
            levels = {
                [68] = { acc = 276, eva = 262, agi = 68, int = 53, mnd = 53, chr = 60 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4508 },  -- serving of royal jelly
                { rate = 240, item = 816 },  -- spool of silk thread
                { rate = 100, item = 4357 },  -- crawler egg
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 4,
        },
        {
            name   = 'Worker Crawler CN',
            ids    = { 8, 9, 10, 23, 24, 25, 32, 33, 40, 41, 46, 47, 48, 49, 86, 87, 88, 89, 196, 197, 198, 199,
                       200, 201, 202 },
            levels = {
                [40] = { acc = 143, eva = 133, agi = 38, int = 31, mnd = 31, chr = 35 },
                [41] = { acc = 148, eva = 138, agi = 42, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 140, agi = 42, int = 33, mnd = 33, chr = 37 },
                [43] = { acc = 154, eva = 143, agi = 42, int = 33, mnd = 33, chr = 38 },
                [44] = { acc = 158, eva = 147, agi = 44, int = 34, mnd = 34, chr = 39 },
            },
            spawn_levels = { [8] = { 40, 42 }, [9] = { 40, 42 }, [10] = { 40, 42 }, [23] = { 40, 42 },
                             [24] = { 40, 42 }, [25] = { 40, 42 }, [32] = { 42, 44 }, [33] = { 42, 44 },
                             [40] = { 42, 44 }, [41] = { 42, 44 }, [46] = { 42, 44 }, [47] = { 42, 44 },
                             [48] = { 42, 44 }, [49] = { 42, 44 }, [86] = { 41, 43 }, [87] = { 41, 43 },
                             [88] = { 41, 43 }, [89] = { 41, 43 }, [196] = { 42, 44 }, [197] = { 42, 44 },
                             [198] = { 42, 44 }, [199] = { 42, 44 }, [200] = { 42, 44 }, [201] = { 42, 44 },
                             [202] = { 42, 44 } },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            links  = 1,
        },
        {
            name   = 'Death Jacket CN RFS',
            ids    = { 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22 },
            levels = {
                [40] = { acc = 143, eva = 135, agi = 43, int = 31, mnd = 31, chr = 35 },
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 846 },  -- insect wing
                { rate = 50, item = 4508 },  -- serving of royal jelly
                { rate = 10, item = 925 },  -- giant stinger
            },
            links  = 5,
        },
        {
            name   = 'Maze Lizard',
            ids    = { 26, 27, 28, 29, 30, 31 },
            levels = {
                [41] = { acc = 149, eva = 139, agi = 44, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 152, eva = 141, agi = 44, int = 33, mnd = 33, chr = 37 },
                [43] = { acc = 155, eva = 144, agi = 44, int = 33, mnd = 33, chr = 38 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 240, item = 4362 },  -- lizard egg
                { rate = 1000, item = 926 },  -- lizard tail
                { rate = 240, item = 4362 },  -- lizard egg
                { rate = 150, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 100, item = 852 },  -- lizard skin
            },
            links  = 6,
        },
        {
            name   = 'Killer Mushroom',
            ids    = { 34, 35, 36, 37, 38, 39 },
            levels = {
                [45] = { acc = 161, eva = 151, agi = 47, int = 34, mnd = 36, chr = 40 },
                [46] = { acc = 165, eva = 155, agi = 48, int = 34, mnd = 36, chr = 40 },
                [47] = { acc = 168, eva = 157, agi = 49, int = 34, mnd = 37, chr = 41 },
            },
            spawn_levels = { [35] = { 46, 47 } },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4373 },  -- woozyshroom
                { rate = 100, item = 4375 },  -- danceshroom
                { rate = 50, item = 4386 },  -- king truffle
            },
            links  = 7,
        },
        {
            name   = 'Doom Scorpion',
            ids    = { 42, 43, 44, 45, 67, 205 },
            levels = {
                [45] = { acc = 160, eva = 151, agi = 47, int = 36, mnd = 36, chr = 40 },
                [46] = { acc = 164, eva = 155, agi = 48, int = 36, mnd = 36, chr = 40 },
                [47] = { acc = 167, eva = 157, agi = 49, int = 37, mnd = 37, chr = 41 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 150, item = 896 },  -- scorpion shell
                { rate = 100, item = 533 },  -- chunk of derfland humus
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Caveberry',
            ids    = { 50, 51, 52, 53, 54, 55, 56, 57, 58, 59 },
            levels = {
                [42] = { acc = 151, eva = 141, agi = 44, int = 33, mnd = 33, chr = 35 },
                [43] = { acc = 154, eva = 144, agi = 44, int = 33, mnd = 33, chr = 36 },
                [44] = { acc = 158, eva = 148, agi = 47, int = 34, mnd = 34, chr = 36 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 2016 },  -- lump of loam
                { rate = 240, item = 2016 },  -- lump of loam
                { rate = 50, item = 574 },  -- bag of fruit seeds
            },
            links  = 9,
        },
        {
            name   = 'Nest Beetle',
            ids    = { 60, 61, 62, 63, 64, 65, 66 },
            levels = {
                [45] = { acc = 159, eva = 143, agi = 30, int = 30, mnd = 45, chr = 45 },
                [46] = { acc = 163, eva = 147, agi = 32, int = 32, mnd = 46, chr = 46 },
                [47] = { acc = 166, eva = 149, agi = 32, int = 32, mnd = 46, chr = 46 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 1000, item = 846 },  -- insect wing
                { rate = 150, item = 889 },  -- beetle shell
                { rate = 150, item = 894 },  -- beetle jaw
                { rate = 150, item = 889 },  -- beetle shell
            },
            links  = 10,
        },
        {
            name   = 'Soldier Crawler',
            ids    = { 68, 69, 70, 90, 91, 92, 94, 95, 96, 98, 99, 100, 122, 123, 124, 132, 133, 134, 135, 206, 207,
                       208, 209, 210, 211, 212 },
            levels = {
                [47] = { acc = 168, eva = 156, agi = 46, int = 37, mnd = 37, chr = 41 },
                [48] = { acc = 172, eva = 160, agi = 48, int = 37, mnd = 37, chr = 42 },
                [49] = { acc = 176, eva = 164, agi = 50, int = 38, mnd = 38, chr = 42 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Hornfly',
            ids    = { 71, 72, 73, 74, 75, 77, 78, 80, 97, 101, 102, 103, 106, 107, 108, 112, 113, 114, 117, 118,
                       119, 125, 126, 127 },
            levels = {
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 181, agi = 60, int = 41, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 186, agi = 60, int = 43, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 50, item = 1040 },  -- nest chest key
            },
            links  = 11,
        },
        {
            name   = 'Exoray',
            ids    = { 76, 79, 81, 82, 83, 84, 85, 93, 104, 109, 115, 120, 128, 225, 226, 227, 228, 229, 246, 247,
                       248 },
            levels = {
                [51] = { acc = 186, eva = 174, agi = 56, int = 39, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 39, mnd = 41, chr = 47 },
                [53] = { acc = 196, eva = 184, agi = 57, int = 40, mnd = 43, chr = 48 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = 4, light = -3, dark = 4,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = 4, light_sleep = -3,
                       dark_sleep = 4, blind = 6, stun = -2, gravity = -2 },
            drops  = {
                { rate = 1000, item = 4374 },  -- sleepshroom
                { rate = 150, item = 4373 },  -- woozyshroom
                { rate = 50, item = 1040 },  -- nest chest key
                { rate = 50, item = 4375 },  -- danceshroom
                { rate = 150, item = 1089 },  -- clump of exoray mold
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 7,
        },
        {
            name   = 'Mushussu CN',
            ids    = { 105, 111, 116, 249, 250, 251, 252 },
            levels = {
                [53] = { acc = 195, eva = 184, agi = 57, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 200, eva = 190, agi = 58, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 206, eva = 195, agi = 58, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 212, eva = 200, agi = 61, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 217, eva = 205, agi = 61, int = 46, mnd = 46, chr = 50 },
            },
            spawn_levels = { [105] = { 56, 57 }, [111] = { 56, 57 }, [116] = { 56, 57 }, [249] = { 53, 55 },
                             [250] = { 56, 57 }, [251] = { 53, 55 }, [252] = { 53, 55 } },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 896 },  -- scorpion shell
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 50, item = 1040 },  -- nest chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Blazer Beetle',
            ids    = { 110, 121, 170, 171, 172, 175, 176, 179, 180, 181, 182, 183 },
            levels = {
                [52] = { acc = 188, eva = 169, agi = 36, int = 36, mnd = 54, chr = 54 },
                [53] = { acc = 193, eva = 174, agi = 36, int = 36, mnd = 54, chr = 54 },
                [54] = { acc = 199, eva = 179, agi = 36, int = 36, mnd = 55, chr = 55 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 1000, item = 846 },  -- insect wing
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 240, item = 894 },  -- beetle jaw
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 50, item = 1040 },  -- nest chest key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Helm Beetle',
            ids    = { 129, 187, 188, 189, 190, 191, 192 },
            levels = {
                [59] = { acc = 226, eva = 204, agi = 39, int = 39, mnd = 60, chr = 60 },
                [60] = { acc = 231, eva = 209, agi = 39, int = 39, mnd = 60, chr = 60 },
                [61] = { acc = 236, eva = 215, agi = 42, int = 42, mnd = 63, chr = 63 },
                [62] = { acc = 241, eva = 220, agi = 42, int = 42, mnd = 63, chr = 63 },
            },
            ranks  = { ice = -3, light = -3, paralyze = -3, bind = -3, light_sleep = -3 },
            drops  = {
                { rate = 1000, item = 846 },  -- insect wing
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 240, item = 894 },  -- beetle jaw
                { rate = 240, item = 889 },  -- beetle shell
                { rate = 50, item = 1045 },  -- nest coffer key
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 10,
        },
        {
            name   = 'Crawler Hunter',
            ids    = { 130, 131, 279, 280, 281, 289, 290 },
            levels = {
                [60] = { acc = 233, eva = 221, agi = 63, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 238, eva = 227, agi = 66, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 243, eva = 232, agi = 66, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { ice = -3, thunder = -2, water = -2, light = -3, paralyze = -3, bind = -3, poison = -2,
                       light_sleep = -3, stun = -2 },
            drops  = {
                { rate = 1000, item = 896 },  -- scorpion shell
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 1000, item = 897 },  -- scorpion claw
                { rate = 50, item = 1045 },  -- nest coffer key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 8,
        },
        {
            name   = 'Worker Crawler CN',
            ids    = { 136, 137, 138 },
            levels = {
                [41] = { acc = 148, eva = 138, agi = 42, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 140, agi = 42, int = 33, mnd = 33, chr = 37 },
                [43] = { acc = 154, eva = 143, agi = 42, int = 33, mnd = 33, chr = 38 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            links  = 1,
        },
        {
            name   = 'Fire Elemental',
            ids    = { 166, 168, 173, 177, 185, 277, 286, 295 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
            },
            ranks  = { fire = 11, ice = 11, water = -3, paralyze = 11, bind = 11, poison = -3 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 50, item = 1040 },  -- nest chest key
                { rate = 1000, item = 4104 },  -- fire cluster
                { rate = 240, item = 1105 },  -- bag of seeds
                { rate = 150, item = 4104 },  -- fire cluster
                { rate = 150, item = 4104 },  -- fire cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 167, 169, 174, 178, 186, 278, 287, 296 },
            levels = {
                [52] = { acc = 190, eva = 171, agi = 53, int = 62, mnd = 50, chr = 50 },
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
                [54] = { acc = 201, eva = 181, agi = 55, int = 64, mnd = 51, chr = 52 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            drops  = {
                { rate = 240, item = 1105 },  -- bag of seeds
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 50, item = 1040 },  -- nest chest key
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Knight Crawler CN',
            ids    = { 193, 194, 195, 282, 283, 284, 285, 291, 292, 293, 294 },
            levels = {
                [60] = { acc = 234, eva = 220, agi = 60, int = 47, mnd = 47, chr = 53 },
                [61] = { acc = 240, eva = 225, agi = 63, int = 49, mnd = 49, chr = 55 },
                [62] = { acc = 245, eva = 230, agi = 63, int = 49, mnd = 49, chr = 55 },
                [63] = { acc = 250, eva = 235, agi = 63, int = 49, mnd = 49, chr = 55 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1045 },  -- nest coffer key
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Puroboros',
            ids    = { 203, 204 },
            levels = {
                [45] = { acc = 163, eva = 151, agi = 47, int = 34, mnd = 36, chr = 43 },
            },
            ranks  = { fire = -3, ice = 4, wind = 4, earth = 4, thunder = 4, water = 4, light = 4, dark = 4,
                       paralyze = 4, bind = 4, silence = 4, slow = 4, poison = 4, light_sleep = 4, dark_sleep = 4,
                       blind = 4, stun = 4, gravity = 4 },
            drops  = {
                { rate = 1000, item = 928 },  -- pinch of bomb ash
                { rate = 150, item = 17316 },  -- bomb arm
                { rate = 50, item = 13229 },  -- oracles belt
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Labyrinth Lizard',
            ids    = { 213, 214, 215, 216, 217, 218, 232, 233, 234, 235, 236, 237 },
            levels = {
                [49] = { acc = 178, eva = 165, agi = 52, int = 38, mnd = 38, chr = 42 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 188, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { ice = -3, wind = -3, water = -2, light = -2, dark = -2, paralyze = -3, bind = -3,
                       silence = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, gravity = -3 },
            drops  = {
                { rate = 50, item = 1040 },  -- nest chest key
                { rate = 240, item = 4362 },  -- lizard egg
                { rate = 150, item = 852 },  -- lizard skin
                { rate = 240, item = 4362 },  -- lizard egg
                { rate = 1000, item = 926 },  -- lizard tail
                { rate = 240, item = 4362 },  -- lizard egg
                { rate = 150, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 150, item = 4362 },  -- lizard egg
                { rate = 100, item = 852 },  -- lizard skin
                { rate = 100, item = 852 },  -- lizard skin
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 6,
        },
        {
            name   = 'Witch Hazel',
            ids    = { 219, 220, 221, 222, 223, 224, 230, 231, 253, 254, 255, 256 },
            levels = {
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 42 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 45 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -3, ice = -2, wind = -2, thunder = -2, dark = -3, paralyze = -2, bind = -2,
                       silence = -2, dark_sleep = -3, blind = -3, stun = -2, gravity = -2 },
            drops  = {
                { rate = 240, item = 2016 },  -- lump of loam
                { rate = 50, item = 1040 },  -- nest chest key
            },
            links  = 9,
        },
        {
            name   = 'Soul Stinger',
            ids    = { 238, 239, 240, 241, 242, 243, 244, 245 },
            levels = {
                [48] = { acc = 172, eva = 162, agi = 53, int = 37, mnd = 37, chr = 42 },
                [49] = { acc = 176, eva = 167, agi = 56, int = 38, mnd = 38, chr = 42 },
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 1040 },  -- nest chest key
                { rate = 10, item = 925 },  -- giant stinger
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Rumble Crawler',
            ids    = { 257, 258, 259, 260, 261, 262 },
            levels = {
                [53] = { acc = 196, eva = 183, agi = 54, int = 43, mnd = 43, chr = 48 },
                [54] = { acc = 202, eva = 188, agi = 55, int = 43, mnd = 43, chr = 48 },
                [55] = { acc = 207, eva = 194, agi = 56, int = 43, mnd = 43, chr = 49 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 50, item = 1040 },  -- nest chest key
                { rate = 100, item = 816 },  -- spool of silk thread
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Wespe CN',
            ids    = { 263, 264, 265, 266, 267, 268, 269 },
            levels = {
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 10, item = 1040 },  -- nest chest key
                { rate = 240, item = 912 },  -- beehive chip
                { rate = 100, item = 4370 },  -- pot of honey
                { rate = 50, item = 846 },  -- insect wing
                { rate = 10, item = 925 },  -- giant stinger
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 5,
        },
        {
            name   = 'Demonic Tiphia',
            ids    = { 270 },
            nm     = true,
            levels = {
                [60] = { acc = 229, eva = 201, agi = 60, int = 60, mnd = 67, chr = 61 },
            },
            ranks  = { fire = -2, ice = -3, wind = 2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -3, bind = -3, silence = 2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = 2 },
            drops  = {
                { rate = 150, item = 18254 },  -- tiphia sting
                { rate = 240, item = 4508 },  -- serving of royal jelly
                { rate = 240, item = 4508 },  -- serving of royal jelly
                { rate = 240, item = 4508 },  -- serving of royal jelly
            },
            aggro  = true,
            detects = { 'sight' },
            links  = 12,
        },
        {
            name   = 'Dragonfly CN',
            ids    = { 271, 272, 273, 274, 275, 276 },
            levels = {
                [55] = { acc = 207, eva = 197, agi = 62, int = 43, mnd = 43, chr = 49 },
                [56] = { acc = 213, eva = 202, agi = 65, int = 44, mnd = 44, chr = 50 },
                [57] = { acc = 218, eva = 207, agi = 65, int = 46, mnd = 46, chr = 50 },
                [58] = { acc = 223, eva = 212, agi = 65, int = 46, mnd = 46, chr = 52 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 846 },  -- insect wing
                { rate = 10, item = 1040 },  -- nest chest key
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 11,
        },
        {
            name   = 'Dreadbug',
            ids    = { 297 },
            nm     = true,
            levels = {
                [52] = { acc = 191, eva = 178, agi = 54, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -3, wind = -2, thunder = -3, water = -2, dark = -3, paralyze = -3,
                       bind = -3, silence = -2, poison = -2, dark_sleep = -3, blind = -3, stun = -3, gravity = -2 },
            drops  = {
                { rate = 1000, item = 17001 },  -- giant shell bug
                { rate = 240, item = 17001 },  -- giant shell bug
                { rate = 240, item = 17001 },  -- giant shell bug
                { rate = 240, item = 17001 },  -- giant shell bug
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Mimic',
            ids    = { 298 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 198, agi = 65, int = 50, mnd = 50, chr = 43 },
            },
            drops  = {
                { rate = 1000, item = 1045 },  -- nest coffer key
            },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 299 },
            nm     = true,
            levels = {
                [75] = { acc = 313, eva = 289, agi = 73, int = 86, mnd = 69, chr = 70 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            drops  = {
                { rate = 1000, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
                { rate = 150, item = 4109 },  -- water cluster
            },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Mellonia',
            ids    = { 300 },
            nm     = true,
            levels = {
                [94] = { acc = 447, eva = 477, agi = 112, int = 96, mnd = 65, chr = 60 },
                [95] = { acc = 455, eva = 483, agi = 115, int = 96, mnd = 65, chr = 61 },
            },
            ranks  = { fire = -1, wind = 3, light = -2, dark = 4, silence = 3, light_sleep = -2, dark_sleep = 4,
                       blind = 4, gravity = 3 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
