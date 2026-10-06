-- Behemoths Dominion (zone 127).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names by how they link, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { sound = { 'Greater Gayla', 'Lesser Gaylas' } },
        [2] = { sight = { 'Doglix Muttsnout', 'Moxnix Nightgoggle' } },
        [3] = { sight = { 'Doglix Muttsnout', 'Picklix Longindex' } },
        [4] = { sight = { 'Moxnix Nightgoggle', 'Picklix Longindex' } },
    },
    monsters = {
        {
            name   = 'Lesser Gaylas',
            ids    = { 1, 2, 3, 16, 17, 20, 21 },
            levels = {
                [41] = { acc = 148, eva = 140, agi = 47, int = 33, mnd = 33, chr = 37 },
                [42] = { acc = 151, eva = 142, agi = 47, int = 33, mnd = 33, chr = 37 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Greater Gayla',
            ids    = { 4, 5, 18, 19, 22, 23 },
            levels = {
                [43] = { acc = 154, eva = 145, agi = 47, int = 33, mnd = 33, chr = 38 },
                [44] = { acc = 158, eva = 150, agi = 50, int = 34, mnd = 34, chr = 39 },
            },
            ranks  = { fire = -2, ice = -1, wind = -3, earth = -2, thunder = -2, water = -2, light = -3, dark = 6,
                       paralyze = -1, bind = -1, silence = -3, slow = -2, poison = -2, light_sleep = -3,
                       dark_sleep = 6, blind = 6, stun = -2, gravity = -3 },
            drops  = {
                { rate = 150, item = 922 },  -- bat wing
                { rate = 150, item = 891 },  -- bat fang
                { rate = 150, item = 891 },  -- bat fang
                { rate = 10, item = 924 },  -- vial of fiend blood
            },
            aggro  = true,
            detects = { 'sound' },
            links  = 1,
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 6, 26, 30, 34, 35 },
            levels = {
                [48] = { acc = 171, eva = 153, agi = 47, int = 56, mnd = 45, chr = 45 },
                [49] = { acc = 174, eva = 157, agi = 48, int = 58, mnd = 46, chr = 45 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
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
            ids    = { 7, 27, 31, 36, 37 },
            levels = {
                [48] = { acc = 165, eva = 142, agi = 42, int = 42, mnd = 57, chr = 50 },
                [49] = { acc = 169, eva = 145, agi = 42, int = 42, mnd = 58, chr = 52 },
                [50] = { acc = 173, eva = 148, agi = 45, int = 45, mnd = 63, chr = 54 },
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
            name   = 'Demonic Weapon',
            ids    = { 8, 9, 14, 15 },
            levels = {
                [45] = { acc = 163, eva = 151, agi = 47, int = 45, mnd = 36, chr = 45 },
                [46] = { acc = 167, eva = 155, agi = 48, int = 45, mnd = 36, chr = 46 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Lost Soul war',
            ids    = { 10, 11 },
            levels = {
                [45] = { acc = 163, eva = 151, agi = 47, int = 36, mnd = 34, chr = 40 },
                [46] = { acc = 167, eva = 155, agi = 48, int = 36, mnd = 34, chr = 40 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4860 },  -- scroll of stun
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Lost Soul blm',
            ids    = { 12, 13 },
            levels = {
                [45] = { acc = 163, eva = 137, agi = 47, int = 55, mnd = 38, chr = 43 },
                [46] = { acc = 167, eva = 140, agi = 48, int = 55, mnd = 38, chr = 42 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, dark = 4,
                       silence = -2, slow = -2, poison = -2, light_sleep = -3, dark_sleep = 11, blind = 4,
                       stun = -2, gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 880 },  -- bone chip
                { rate = 10, item = 4860 },  -- scroll of stun
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Master Coeurl',
            ids    = { 24, 28 },
            levels = {
                [49] = { acc = 178, eva = 165, agi = 52, int = 42, mnd = 36, chr = 42 },
                [50] = { acc = 181, eva = 169, agi = 54, int = 44, mnd = 38, chr = 45 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -3, water = -2, light = -2, dark = -2, paralyze = -2,
                       bind = -2, silence = -2, slow = -3, poison = -2, light_sleep = -2, dark_sleep = -2,
                       blind = -2, gravity = -2 },
            drops  = {
                { rate = 150, item = 4377 },  -- slice of coeurl meat
                { rate = 100, item = 863 },  -- coeurl hide
                { rate = 240, item = 927 },  -- coeurl whisker
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Bhuta',
            ids    = { 25, 29 },
            levels = {
                [47] = { acc = 168, eva = 157, agi = 49, int = 45, mnd = 35, chr = 45 },
                [48] = { acc = 172, eva = 161, agi = 50, int = 45, mnd = 36, chr = 46 },
            },
            ranks  = { fire = -3, ice = 4, wind = -2, thunder = -2, water = -2, light = -3, dark = 4, paralyze = 5,
                       bind = 5, silence = -2, poison = -2, light_sleep = -3, dark_sleep = 4, blind = 5, stun = -2,
                       gravity = -2 },
            undead = true,
            drops  = {
                { rate = 150, item = 825 },  -- square of cotton cloth
                { rate = 50, item = 940 },  -- revival tree root
                { rate = 10, item = 529 },  -- luminicloth
            },
            aggro  = true,
            detects = { 'sound', 'low_hp' },
        },
        {
            name   = 'Behemoth',
            ids    = { 32 },
            nm     = true,
            levels = {
                [70] = { acc = 293, eva = 341, agi = 81, int = 71, mnd = 55, chr = 57 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 11,
                       blind = 2, stun = 10, gravity = 2 },
            immune = { 'light_sleep' },
            drops  = {
                { rate = 240, item = 860 },  -- behemoth hide
                { rate = 240, item = 860 },  -- behemoth hide
                { rate = 100, item = 3342 },  -- savory shank
                { rate = 1000, group = { { 16869, 9000 }, { 17294, 1000 } } },  -- one of thundercloud, comet tail
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'King Behemoth',
            ids    = { 33 },
            nm     = true,
            levels = {
                [85] = { acc = 382, eva = 418, agi = 96, int = 85, mnd = 66, chr = 69 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            immune = { 'dark_sleep', 'light_sleep', 'silence', 'stun', 'petrify' },
            drops  = {
                { rate = 1000, item = 860 },  -- behemoth hide
                { rate = 150, item = 860 },  -- behemoth hide
                { rate = 1000, item = 883 },  -- behemoth horn
                { rate = 240, item = 831 },  -- square of shining cloth
                { rate = 150, item = 883 },  -- behemoth horn
                { rate = 240, item = 1527 },  -- behemoth tongue
                { rate = 1000, group = {  -- one of
                    { 1334, 3100 },  -- wyrmal abjuration head
                    { 1328, 2300 },  -- aquarian abjuration feet
                    { 1322, 2300 },  -- earthen abjuration legs
                    { 1332, 2300 },  -- martial abjuration legs
                } },
                { rate = 100, group = {  -- one of
                    { 1334, 3100 },  -- wyrmal abjuration head
                    { 1328, 2300 },  -- aquarian abjuration feet
                    { 1322, 2300 },  -- earthen abjuration legs
                    { 1332, 2300 },  -- martial abjuration legs
                } },
                { rate = 1000, group = {  -- one of
                    { 13415, 9500 },  -- pixie earring
                    { 13566, 500 },  -- defending ring
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            flags  = { scripted_stats = true },
        },
        {
            name   = 'Picklix Longindex',
            ids    = { 38 },
            nm     = true,
            levels = {
                [60] = { acc = 243, eva = 274, agi = 72, int = 63, mnd = 42, chr = 42 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 11,
                       dark_sleep = 11, stun = -2, gravity = -2 },
            resist = { gravity = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 2,
        },
        {
            name   = 'Moxnix Nightgoggle',
            ids    = { 39 },
            nm     = true,
            levels = {
                [58] = { acc = 259, eva = 199, agi = 75, int = 52, mnd = 55, chr = 52 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -2, slow = -2, poison = -2, light_sleep = 11,
                       dark_sleep = 11, stun = -2, gravity = -2 },
            resist = { poison = 15 },
            aggro  = true,
            detects = { 'sight' },
            links  = 3,
        },
        {
            name   = 'Doglix Muttsnout',
            ids    = { 40 },
            nm     = true,
            levels = {
                [58] = { acc = 219, eva = 190, agi = 56, int = 52, mnd = 71, chr = 61 },
            },
            ranks  = { fire = -2, ice = -2, wind = -2, earth = -2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = 11, slow = -2, poison = -2, light_sleep = 11,
                       dark_sleep = 11, stun = -2, gravity = -2 },
            immune = { 'stun' },
            aggro  = true,
            detects = { 'sight' },
            links  = 4,
        },
        {
            name   = 'Ancient Weapon',
            ids    = { 41 },
            nm     = true,
            levels = {
                [66] = { acc = 269, eva = 253, agi = 70, int = 64, mnd = 52, chr = 66 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -12.5 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Legendary Weapon',
            ids    = { 42 },
            nm     = true,
            levels = {
                [66] = { acc = 268, eva = 244, agi = 66, int = 89, mnd = 62, chr = 70 },
            },
            ranks  = { fire = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -3, silence = -2,
                       slow = -2, poison = -2, light_sleep = -3, stun = -2, gravity = -2 },
            magic_dmg = { all = -13 },
            immune = { 'dark_sleep', 'light_sleep', 'silence' },
            aggro  = true,
            detects = { 'sound', 'magic' },
        },
        {
            name   = 'Gudanna',
            ids    = { 43 },
            nm     = true,
            levels = {
                [55] = { acc = 209, eva = 197, agi = 62, int = 47, mnd = 47, chr = 53 },
                [56] = { acc = 215, eva = 202, agi = 65, int = 48, mnd = 48, chr = 54 },
                [57] = { acc = 220, eva = 207, agi = 65, int = 50, mnd = 50, chr = 54 },
                [58] = { acc = 225, eva = 212, agi = 65, int = 50, mnd = 50, chr = 56 },
                [59] = { acc = 231, eva = 218, agi = 67, int = 51, mnd = 51, chr = 57 },
                [60] = { acc = 236, eva = 223, agi = 67, int = 51, mnd = 51, chr = 57 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Pil',
            ids    = { 44, 45, 46 },
            nm     = true,
            levels = {
                [94] = { acc = 438, eva = 368, agi = 88, int = 108, mnd = 82, chr = 96 },
                [95] = { acc = 445, eva = 372, agi = 89, int = 110, mnd = 83, chr = 96 },
            },
            ranks  = { fire = 2, ice = 4, wind = 2, earth = 4, thunder = 2, water = 4, dark = 8, paralyze = 4,
                       bind = 4, silence = 2, slow = 4, poison = 4, dark_sleep = 8, blind = 8, stun = 2,
                       gravity = 2 },
            magic_dmg = { all = -12.5 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Sovereign Behemoth',
            ids    = { 47, 48, 49 },
            nm     = true,
            levels = {
                [99] = { acc = 477, eva = 430, agi = 107, int = 110, mnd = 88, chr = 96 },
            },
            ranks  = { fire = 2, ice = 2, wind = 2, earth = 2, thunder = 2, water = 2, light = 2, dark = 2,
                       paralyze = 2, bind = 2, silence = 2, slow = 2, poison = 2, light_sleep = 2, dark_sleep = 2,
                       blind = 2, stun = 2, gravity = 2 },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
    },
    by_name = {},
}
