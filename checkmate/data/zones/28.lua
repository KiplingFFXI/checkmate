-- Sacrarium (zone 28).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Greater Gaylas' } },
        [2] = { true_sight = { 'Stegotaur', 'Teratotaur' } },
        [3] = { sound = { 'Fomor Ranger', 'Fomor Thief', 'Fomor Warrior' } },
        [4] = { true_sound = { 'Mariselles Pupil' } },
        [5] = { superlink = { 'Fomor Ninja', 'Fomor Samurai' } },
        [6] = { superlink = { 'Fomor Monk', 'Fomor Ninja' } },
        [7] = { superlink = { 'Fomor Monk', 'Fomor Samurai' } },
        [8] = { superlink = { 'Fomor Ranger', 'Fomor Red Mage' } },
        [9] = { superlink = { 'Fomor Black Mage', 'Fomor Red Mage' } },
        [10] = { superlink = { 'Fomor Black Mage', 'Fomor Ranger' } },
        [11] = { superlink = { 'Fomor Samurai' } },
        [12] = { superlink = { 'Fomor Thief' } },
        [13] = { superlink = { 'Fomor Warrior' } },
        [14] = { superlink = { 'Fomor Monk' } },
        [15] = { superlink = { 'Fomor Dragoon' } },
        [16] = { superlink = { 'Fomor Black Mage', 'Fomor Dark Knight' } },
        [17] = { superlink = { 'Fomor Bard', 'Fomor Black Mage' } },
        [18] = { superlink = { 'Fomor Bard', 'Fomor Dark Knight' } },
        [19] = { sound = { 'Azren Kuba', 'Azren Kuguza' } },
    },
    monsters = {
        {
            name   = 'Gazer',
            ids    = { 1, 2, 5 },
            levels = {
                [48] = { acc = 173, eva = 157, agi = 52, int = 64, mnd = 44, chr = 47 },
                [49] = { acc = 176, eva = 160, agi = 53, int = 66, mnd = 44, chr = 47 },
                [50] = { acc = 180, eva = 163, agi = 54, int = 66, mnd = 45, chr = 50 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 914 },  -- vial of mercury
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Greater Gaylas',
            ids    = { 3, 8, 77, 84, 93, 100, 109, 117, 141, 142, 143, 144 },
            levels = {
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 173, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44 },
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
            name   = 'Stegotaur S',
            ids    = { 4, 6, 7, 45, 46 },
            levels = {
                [47] = { acc = 173, eva = 155, agi = 35, int = 32, mnd = 50, chr = 46 },
                [48] = { acc = 176, eva = 159, agi = 36, int = 33, mnd = 50, chr = 47 },
                [49] = { acc = 180, eva = 163, agi = 38, int = 33, mnd = 51, chr = 48 },
            },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1877 },  -- fomor codex
                { rate = 50, item = 1620 },  -- taurus horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Mummy',
            ids    = { 9, 10, 12, 14, 16, 19, 22, 24, 27, 30, 32, 33, 36 },
            levels = {
                [54] = { acc = 204, eva = 190, agi = 58, int = 43, mnd = 40, chr = 48 },
                [55] = { acc = 209, eva = 195, agi = 58, int = 43, mnd = 41, chr = 49 },
                [56] = { acc = 215, eva = 200, agi = 61, int = 44, mnd = 41, chr = 50 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lich',
            ids    = { 11, 13, 15, 17, 18, 20, 25, 28, 31, 34, 35, 37 },
            levels = {
                [54] = { acc = 204, eva = 173, agi = 58, int = 67, mnd = 45, chr = 52 },
                [55] = { acc = 209, eva = 177, agi = 58, int = 69, mnd = 47, chr = 52 },
                [56] = { acc = 215, eva = 183, agi = 61, int = 70, mnd = 47, chr = 55 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 50, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Blubber Eyes PX',
            ids    = { 21, 23, 26, 29, 120, 136, 137, 173, 174, 175, 176 },
            levels = {
                [57] = { acc = 218, eva = 197, agi = 61, int = 75, mnd = 50, chr = 55 },
                [58] = { acc = 223, eva = 202, agi = 61, int = 75, mnd = 52, chr = 55 },
                [59] = { acc = 229, eva = 207, agi = 63, int = 78, mnd = 53, chr = 57 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = 2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -2, gravity = -2 },
            drops  = {
                { rate = 50, item = 939 },  -- hecteyes eye
                { rate = 150, item = 914 },  -- vial of mercury
            },
            aggro  = true,
            detects = { 'sound' },
        },
        {
            name   = 'Utukku S',
            ids    = { 38, 39, 40, 41, 42, 43 },
            levels = {
                [55] = { acc = 207, eva = 195, agi = 58, int = 56, mnd = 43, chr = 54 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 100, item = 940 },  -- revival tree root
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Elel',
            ids    = { 44 },
            nm     = true,
            levels = {
                [60] = { acc = 234, eva = 204, agi = 67, int = 74, mnd = 53, chr = 50 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 10,
                       paralyze = 2, bind = 10, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 1614 },  -- corse bracelet
                { rate = 100, item = 14867 },  -- magical mitts
                { rate = 100, item = 1639 },  -- corse robe
                { rate = 100, item = 15174 },  -- frenzy sallet
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 47, 80, 83 },
            levels = {
                [54] = { acc = 234, eva = 177, agi = 67, int = 48, mnd = 52, chr = 52 },
                [55] = { acc = 239, eva = 182, agi = 69, int = 49, mnd = 52, chr = 53 },
                [56] = { acc = 245, eva = 188, agi = 70, int = 50, mnd = 55, chr = 54 },
            },
            spawn_levels = { [80] = { 55, 56 }, [83] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15380 },  -- virgo subligar
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 48, 96, 99 },
            levels = {
                [54] = { acc = 203, eva = 203, agi = 61, int = 52, mnd = 39, chr = 47 },
                [55] = { acc = 209, eva = 209, agi = 63, int = 52, mnd = 39, chr = 47 },
                [56] = { acc = 215, eva = 215, agi = 64, int = 55, mnd = 41, chr = 48 },
            },
            spawn_levels = { [96] = { 55, 56 }, [99] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15376 },  -- taurus subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Bard',
            ids    = { 49, 54, 104, 108 },
            levels = {
                [54] = { acc = 199, eva = 175, agi = 43, int = 52, mnd = 52, chr = 65 },
                [55] = { acc = 204, eva = 180, agi = 43, int = 52, mnd = 52, chr = 67 },
                [56] = { acc = 210, eva = 186, agi = 44, int = 55, mnd = 55, chr = 68 },
            },
            spawn_levels = { [104] = { 55, 56 }, [108] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15381 },  -- libra subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 50, 71, 75 },
            levels = {
                [54] = { acc = 209, eva = 192, agi = 52, int = 43, mnd = 48, chr = 62 },
                [55] = { acc = 214, eva = 197, agi = 52, int = 43, mnd = 49, chr = 62 },
                [56] = { acc = 220, eva = 203, agi = 55, int = 44, mnd = 50, chr = 65 },
            },
            spawn_levels = { [71] = { 55, 56 }, [75] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15379 },  -- leo subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Wyvern',
            ids    = { 51, 72, 76, 132 },
            levels = {
                [49] = { acc = 176, eva = 165, agi = 53, int = 40, mnd = 40, chr = 44 },
                [50] = { acc = 180, eva = 169, agi = 54, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 186, eva = 174, agi = 56, int = 41, mnd = 41, chr = 47 },
                [52] = { acc = 191, eva = 179, agi = 56, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -2, dark = -2,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = -2,
                       dark_sleep = -2, blind = -2, stun = -2, gravity = -2 },
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 52, 69, 73, 171 },
            levels = {
                [54] = { acc = 234, eva = 177, agi = 67, int = 48, mnd = 52, chr = 52 },
                [55] = { acc = 239, eva = 182, agi = 69, int = 49, mnd = 52, chr = 53 },
                [56] = { acc = 245, eva = 188, agi = 70, int = 50, mnd = 55, chr = 54 },
            },
            spawn_levels = { [69] = { 55, 56 }, [73] = { 55, 56 }, [171] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15380 },  -- virgo subligar
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 53, 86, 90 },
            levels = {
                [54] = { acc = 202, eva = 173, agi = 58, int = 67, mnd = 48, chr = 56 },
                [55] = { acc = 207, eva = 177, agi = 58, int = 69, mnd = 49, chr = 56 },
                [56] = { acc = 213, eva = 183, agi = 61, int = 70, mnd = 50, chr = 59 },
            },
            spawn_levels = { [86] = { 55, 56 }, [90] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15375 },  -- aries subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Beastmaster',
            ids    = { 55, 102, 106 },
            levels = {
                [54] = { acc = 202, eva = 182, agi = 43, int = 48, mnd = 48, chr = 71 },
                [55] = { acc = 207, eva = 187, agi = 43, int = 49, mnd = 49, chr = 73 },
                [56] = { acc = 213, eva = 192, agi = 44, int = 50, mnd = 50, chr = 74 },
            },
            spawn_levels = { [102] = { 55, 56 }, [106] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15388 },  -- ophiuchus subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Bats',
            ids    = { 56, 103, 107 },
            levels = {
                [49] = { acc = 176, eva = 167, agi = 57, int = 40, mnd = 40, chr = 44 },
                [50] = { acc = 180, eva = 170, agi = 57, int = 41, mnd = 41, chr = 45 },
                [51] = { acc = 186, eva = 176, agi = 60, int = 41, mnd = 41, chr = 47 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            links  = 1,
        },
        {
            name   = 'Fomor Monk',
            ids    = { 57, 85, 89 },
            levels = {
                [54] = { acc = 203, eva = 187, agi = 43, int = 39, mnd = 52, chr = 52 },
                [55] = { acc = 209, eva = 192, agi = 43, int = 39, mnd = 52, chr = 53 },
                [56] = { acc = 215, eva = 198, agi = 44, int = 41, mnd = 55, chr = 54 },
            },
            spawn_levels = { [85] = { 55, 56 }, [89] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 58, 94, 97, 177 },
            levels = {
                [54] = { acc = 199, eva = 178, agi = 48, int = 58, mnd = 58, chr = 56 },
                [55] = { acc = 204, eva = 183, agi = 49, int = 58, mnd = 58, chr = 56 },
                [56] = { acc = 210, eva = 189, agi = 50, int = 61, mnd = 61, chr = 59 },
            },
            spawn_levels = { [94] = { 55, 56 }, [97] = { 55, 56 }, [177] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 59, 70, 74, 172 },
            levels = {
                [54] = { acc = 202, eva = 192, agi = 52, int = 48, mnd = 48, chr = 56 },
                [55] = { acc = 207, eva = 197, agi = 52, int = 49, mnd = 49, chr = 56 },
                [56] = { acc = 213, eva = 203, agi = 55, int = 50, mnd = 50, chr = 59 },
            },
            spawn_levels = { [70] = { 55, 56 }, [74] = { 55, 56 }, [172] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15378 },  -- cancer subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 60, 95, 98, 178 },
            levels = {
                [54] = { acc = 202, eva = 187, agi = 52, int = 58, mnd = 39, chr = 43 },
                [55] = { acc = 207, eva = 192, agi = 52, int = 58, mnd = 39, chr = 43 },
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 45 },
            },
            spawn_levels = { [95] = { 55, 56 }, [98] = { 55, 56 }, [178] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Summoner',
            ids    = { 61, 87, 91, 121 },
            levels = {
                [54] = { acc = 197, eva = 170, agi = 52, int = 61, mnd = 61, chr = 65 },
                [55] = { acc = 202, eva = 174, agi = 52, int = 63, mnd = 63, chr = 67 },
                [56] = { acc = 208, eva = 180, agi = 55, int = 64, mnd = 64, chr = 68 },
            },
            spawn_levels = { [87] = { 55, 56 }, [91] = { 55, 56 }, [121] = { 54, 55 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15384 },  -- capricornus subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 62, 88, 92, 122 },
            levels = {
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
                [51] = { acc = 185, eva = 166, agi = 53, int = 62, mnd = 50, chr = 50 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 63, 78, 81 },
            levels = {
                [54] = { acc = 202, eva = 190, agi = 58, int = 43, mnd = 43, chr = 52 },
                [55] = { acc = 207, eva = 195, agi = 58, int = 43, mnd = 43, chr = 53 },
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 44, chr = 54 },
            },
            spawn_levels = { [78] = { 55, 56 }, [81] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 64, 79, 82 },
            levels = {
                [54] = { acc = 206, eva = 238, agi = 61, int = 58, mnd = 39, chr = 43 },
                [55] = { acc = 212, eva = 244, agi = 63, int = 58, mnd = 39, chr = 43 },
                [56] = { acc = 218, eva = 250, agi = 64, int = 61, mnd = 41, chr = 45 },
            },
            spawn_levels = { [79] = { 55, 56 }, [82] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15377 },  -- gemini subligar
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 3,
        },
        {
            name   = 'Fomor Paladin',
            ids    = { 65, 101, 105 },
            levels = {
                [54] = { acc = 197, eva = 180, agi = 39, int = 39, mnd = 58, chr = 62 },
                [55] = { acc = 202, eva = 185, agi = 39, int = 39, mnd = 58, chr = 62 },
                [56] = { acc = 208, eva = 190, agi = 41, int = 41, mnd = 61, chr = 65 },
            },
            spawn_levels = { [101] = { 55, 56 }, [105] = { 55, 56 } },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15386 },  -- pisces subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Old Professor Mariselle',
            ids    = { 66 },
            nm     = true,
            levels = {
                [55] = { acc = 207, eva = 194, agi = 56, int = 69, mnd = 44, chr = 52 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Mariselles Pupil',
            ids    = { 67, 68 },
            nm     = true,
            levels = {
                [47] = { acc = 168, eva = 151, agi = 46, int = 58, mnd = 46, chr = 50 },
                [48] = { acc = 171, eva = 153, agi = 47, int = 58, mnd = 47, chr = 50 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'silence' },
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
            links  = 4,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 110 },
            levels = {
                [55] = { acc = 204, eva = 180, agi = 43, int = 52, mnd = 52, chr = 67 },
                [56] = { acc = 210, eva = 186, agi = 44, int = 55, mnd = 55, chr = 68 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15381 },  -- libra subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
        },
        {
            name   = 'Fomor Monk',
            ids    = { 111 },
            levels = {
                [56] = { acc = 215, eva = 198, agi = 44, int = 41, mnd = 55, chr = 54 },
                [57] = { acc = 220, eva = 204, agi = 46, int = 41, mnd = 55, chr = 54 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 5,
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 112 },
            levels = {
                [55] = { acc = 207, eva = 197, agi = 52, int = 49, mnd = 49, chr = 56 },
                [56] = { acc = 213, eva = 203, agi = 55, int = 50, mnd = 50, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15378 },  -- cancer subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 6,
        },
        {
            name   = 'Fomor Ninja',
            ids    = { 113 },
            levels = {
                [55] = { acc = 209, eva = 209, agi = 63, int = 52, mnd = 39, chr = 47 },
                [56] = { acc = 215, eva = 215, agi = 64, int = 55, mnd = 41, chr = 48 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15376 },  -- taurus subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 7,
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 114 },
            levels = {
                [56] = { acc = 213, eva = 183, agi = 61, int = 70, mnd = 50, chr = 59 },
                [57] = { acc = 218, eva = 187, agi = 61, int = 71, mnd = 50, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15375 },  -- aries subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 8,
        },
        {
            name   = 'Fomor Ranger',
            ids    = { 115 },
            levels = {
                [55] = { acc = 239, eva = 182, agi = 69, int = 49, mnd = 52, chr = 53 },
                [56] = { acc = 245, eva = 188, agi = 70, int = 50, mnd = 55, chr = 54 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15380 },  -- virgo subligar
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 100, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 9,
        },
        {
            name   = 'Fomor Red Mage',
            ids    = { 116 },
            levels = {
                [55] = { acc = 204, eva = 183, agi = 49, int = 58, mnd = 58, chr = 56 },
                [56] = { acc = 210, eva = 189, agi = 50, int = 61, mnd = 61, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15382 },  -- scorpius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 10,
        },
        {
            name   = 'Fomor Thief',
            ids    = { 118 },
            levels = {
                [57] = { acc = 223, eva = 255, agi = 65, int = 61, mnd = 41, chr = 45 },
                [58] = { acc = 228, eva = 260, agi = 65, int = 61, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15377 },  -- gemini subligar
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 150, item = 1739 },  -- square of balloon cloth
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 11,
        },
        {
            name   = 'Fomor Samurai',
            ids    = { 119 },
            levels = {
                [56] = { acc = 213, eva = 203, agi = 55, int = 50, mnd = 50, chr = 59 },
                [57] = { acc = 218, eva = 208, agi = 55, int = 50, mnd = 50, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15378 },  -- cancer subligar
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 150, item = 1738 },  -- shakudo ingot
                { rate = 50, item = 1061 },  -- sacrarium chest key
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 12,
        },
        {
            name   = 'Fomor Monk',
            ids    = { 123 },
            levels = {
                [57] = { acc = 220, eva = 204, agi = 46, int = 41, mnd = 55, chr = 54 },
                [58] = { acc = 225, eva = 209, agi = 46, int = 41, mnd = 55, chr = 56 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15385 },  -- aquarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 13,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 124 },
            levels = {
                [56] = { acc = 213, eva = 200, agi = 61, int = 44, mnd = 44, chr = 54 },
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 46, chr = 54 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 14,
        },
        {
            name   = 'Teratotaur',
            ids    = { 125, 126, 127, 128, 129, 138, 139, 140 },
            levels = {
                [57] = { acc = 222, eva = 202, agi = 43, int = 38, mnd = 59, chr = 54 },
                [58] = { acc = 227, eva = 208, agi = 44, int = 39, mnd = 59, chr = 56 },
                [59] = { acc = 234, eva = 213, agi = 44, int = 39, mnd = 61, chr = 57 },
            },
            spawn_levels = { [125] = { 57, 58 }, [126] = { 57, 58 }, [127] = { 57, 58 }, [128] = { 57, 58 },
                             [129] = { 57, 58 }, [138] = { 57, 58 }, [139] = { 58, 59 }, [140] = { 58, 59 } },
            ranks  = { fire = -1, ice = -1, wind = -1, earth = -1, thunder = -1, water = -1, light = -2, dark = 2,
                       paralyze = -1, bind = -1, silence = -1, slow = -1, poison = -1, light_sleep = -2,
                       dark_sleep = 2, blind = 2, stun = -1, gravity = -1 },
            drops  = {
                { rate = 50, item = 1877 },  -- fomor codex
                { rate = 50, item = 1620 },  -- taurus horn
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Fomor Warrior',
            ids    = { 130 },
            levels = {
                [57] = { acc = 218, eva = 205, agi = 61, int = 46, mnd = 46, chr = 54 },
                [58] = { acc = 223, eva = 210, agi = 61, int = 46, mnd = 46, chr = 56 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 15,
        },
        {
            name   = 'Fomor Dragoon',
            ids    = { 131 },
            levels = {
                [56] = { acc = 220, eva = 203, agi = 55, int = 44, mnd = 50, chr = 65 },
                [57] = { acc = 225, eva = 208, agi = 55, int = 46, mnd = 50, chr = 65 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15379 },  -- leo subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 13,
        },
        {
            name   = 'Fomor Bard',
            ids    = { 133 },
            levels = {
                [56] = { acc = 210, eva = 186, agi = 44, int = 55, mnd = 55, chr = 68 },
                [57] = { acc = 215, eva = 191, agi = 46, int = 55, mnd = 55, chr = 69 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15381 },  -- libra subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 16,
        },
        {
            name   = 'Fomor Dark Knight',
            ids    = { 134 },
            levels = {
                [56] = { acc = 213, eva = 197, agi = 55, int = 61, mnd = 41, chr = 45 },
                [57] = { acc = 218, eva = 202, agi = 55, int = 61, mnd = 41, chr = 45 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15383 },  -- sagittarius subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 17,
        },
        {
            name   = 'Fomor Black Mage',
            ids    = { 135 },
            levels = {
                [56] = { acc = 213, eva = 183, agi = 61, int = 70, mnd = 50, chr = 59 },
                [57] = { acc = 218, eva = 187, agi = 61, int = 71, mnd = 50, chr = 59 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            drops  = {
                { rate = 100, item = 1659 },  -- coral crest key
                { rate = 50, item = 15375 },  -- aries subligar
                { rate = 50, item = 1061 },  -- sacrarium chest key
                { rate = 10, item = 940 },  -- revival tree root
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            aggro_note = 'fomor_hate',
            links  = 18,
        },
        {
            name   = 'Keremet',
            ids    = { 145 },
            nm     = true,
            levels = {
                [56] = { acc = 213, eva = 185, agi = 65, int = 70, mnd = 50, chr = 48 },
                [57] = { acc = 218, eva = 189, agi = 65, int = 71, mnd = 50, chr = 49 },
            },
            ranks  = { fire = -2, ice = 2, wind = -1, earth = 2, thunder = -1, water = -1, light = -3, dark = 3,
                       paralyze = 2, bind = 2, silence = -1, slow = 2, poison = -1, light_sleep = -3,
                       dark_sleep = 3, blind = 3, stun = -1, gravity = -1 },
            magic_dmg = { all = -25 },
            undead = true,
            immune = { 'dark_sleep' },
            drops  = {
                { rate = 1000, item = 1658 },  -- sealion crest key
            },
            aggro  = true,
            any_level = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Azren Kuguza',
            ids    = { 146, 148, 150, 152, 154, 156 },
            levels = {
                [42] = { acc = 154, eva = 142, agi = 47, int = 35, mnd = 33, chr = 39 },
                [43] = { acc = 157, eva = 145, agi = 47, int = 35, mnd = 33, chr = 39 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep', 'light_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 19,
        },
        {
            name   = 'Azren Kuba',
            ids    = { 147, 149, 151, 153, 155, 157 },
            levels = {
                [42] = { acc = 154, eva = 129, agi = 47, int = 54, mnd = 37, chr = 42 },
                [43] = { acc = 157, eva = 132, agi = 47, int = 56, mnd = 37, chr = 42 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            immune = { 'dark_sleep' },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
            links  = 19,
        },
        {
            name   = 'Air Elemental',
            ids    = { 158, 161 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
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
            name   = 'Thunder Elemental',
            ids    = { 159, 162 },
            levels = {
                [60] = { acc = 233, eva = 213, agi = 60, int = 70, mnd = 56, chr = 57 },
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
            name   = 'Dark Elemental',
            ids    = { 160, 163 },
            levels = {
                [60] = { acc = 234, eva = 218, agi = 57, int = 63, mnd = 42, chr = 42 },
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
            name   = 'Balor',
            ids    = { 164 },
            nm     = true,
            levels = {
                [57] = { acc = 250, eva = 192, agi = 71, int = 50, mnd = 55, chr = 54 },
                [58] = { acc = 255, eva = 197, agi = 71, int = 52, mnd = 55, chr = 56 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Luaith',
            ids    = { 165 },
            nm     = true,
            levels = {
                [57] = { acc = 222, eva = 255, agi = 64, int = 56, mnd = 43, chr = 48 },
                [58] = { acc = 227, eva = 260, agi = 64, int = 56, mnd = 43, chr = 49 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lobais',
            ids    = { 166 },
            nm     = true,
            levels = {
                [57] = { acc = 215, eva = 185, agi = 57, int = 67, mnd = 60, chr = 66 },
                [58] = { acc = 220, eva = 190, agi = 57, int = 67, mnd = 61, chr = 66 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Fomors Elemental',
            ids    = { 167 },
            levels = {
                [53] = { acc = 195, eva = 177, agi = 54, int = 64, mnd = 51, chr = 52 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'dark_sleep' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Fomors Avatar',
            ids    = { 168 },
            levels = {
                [49] = { acc = 176, eva = 150, agi = 53, int = 62, mnd = 44, chr = 47 },
                [50] = { acc = 180, eva = 153, agi = 54, int = 63, mnd = 45, chr = 50 },
                [51] = { acc = 186, eva = 158, agi = 56, int = 65, mnd = 47, chr = 50 },
            },
            ranks  = { fire = 6, ice = 6, wind = 6, earth = 6, thunder = 6, water = 6, light = 11, paralyze = 6,
                       bind = 6, silence = 6, slow = 6, poison = 6, light_sleep = 11, stun = 6, gravity = 6 },
            magic_dmg = { all = -30 },
        },
        {
            name   = 'Caithleann',
            ids    = { 169 },
            nm     = true,
            levels = {
                [57] = { acc = 217, eva = 215, agi = 55, int = 59, mnd = 54, chr = 56 },
                [58] = { acc = 222, eva = 221, agi = 56, int = 59, mnd = 54, chr = 56 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Indich',
            ids    = { 170 },
            nm     = true,
            levels = {
                [57] = { acc = 214, eva = 197, agi = 44, int = 50, mnd = 57, chr = 68 },
                [58] = { acc = 220, eva = 202, agi = 44, int = 50, mnd = 57, chr = 68 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 11, blind = 4 },
            undead = true,
            immune = { 'silence', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 240, item = 15457 },  -- swift belt
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
