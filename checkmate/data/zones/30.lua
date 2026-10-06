-- Riverne-Site A01 (zone 30).
-- Built by tools\export_data.py from phoenix/live 465ac4c076.
-- It assumes RESTRICT_CONTENT on, rotz cop toau on, the rest off.
-- Don't edit this file by hand.
return {
    built   = 'phoenix/live 465ac4c076',
    content = 'RESTRICT_CONTENT on, rotz cop toau on, the rest off',
    -- Each list of link names, written once. A row's links is the number of its list.
    link_lists = {
        [1] = { 'Heliodromos' },
        [2] = { 'Carmine Dobsonfly', 'Hawker' },
        [3] = { 'Ziryu' },
        [4] = { 'Ouryu', 'Ziryu' },
    },
    monsters = {
        {
            name   = 'Hawkertrap',
            ids    = { 1, 2, 18, 19, 26, 27, 33, 36, 47, 48, 49, 50, 51, 59, 60, 61, 62, 63, 80, 81, 82, 83, 92, 93,
                       94, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112 },
            levels = {
                [38] = { acc = 138, eva = 129, agi = 42, int = 31, mnd = 31, chr = 36 },
                [39] = { acc = 142, eva = 133, agi = 44, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 136, agi = 44, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 149, eva = 140, agi = 47, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = -3, ice = -1, wind = 3, water = 3, light = 3, dark = -1, paralyze = -1, bind = -1,
                       silence = 3, poison = 3, light_sleep = 3, dark_sleep = -1, blind = -1, gravity = 3 },
            drops  = {
                { rate = 50, item = 1617 },  -- flytrap leaf
            },
        },
        {
            name   = 'Riverne Vulture',
            ids    = { 3, 4, 5, 6, 8, 9, 20, 21, 22, 28, 29, 30, 31, 34, 35, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46,
                       52, 53, 54, 55, 64, 65, 66, 84, 85, 86, 95, 96, 97 },
            levels = {
                [39] = { acc = 142, eva = 134, agi = 47, int = 32, mnd = 32, chr = 37 },
                [40] = { acc = 145, eva = 137, agi = 47, int = 32, mnd = 32, chr = 37 },
                [41] = { acc = 149, eva = 142, agi = 50, int = 35, mnd = 35, chr = 39 },
                [42] = { acc = 152, eva = 144, agi = 50, int = 35, mnd = 35, chr = 39 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 100, item = 847 },  -- bird feather
                { rate = 100, item = 1665 },  -- copper key
                { rate = 50, item = 4570 },  -- bird egg
            },
        },
        {
            name   = 'Hippogryph',
            ids    = { 7, 10, 11, 12, 13, 23, 24, 32, 56, 57, 58, 70, 71, 78, 90, 91, 101, 102, 114, 115 },
            levels = {
                [40] = { acc = 149, eva = 168, agi = 47, int = 44, mnd = 29, chr = 29 },
                [41] = { acc = 153, eva = 173, agi = 50, int = 47, mnd = 32, chr = 32 },
                [42] = { acc = 156, eva = 176, agi = 50, int = 47, mnd = 32, chr = 32 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Heliodromos',
            ids    = { 14, 15, 16 },
            nm     = true,
            levels = {
                [45] = { acc = 167, eva = 186, agi = 52, int = 49, mnd = 33, chr = 33 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -2, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -2, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 15348 },  -- mountain gaiters
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
            links  = 1,
        },
        {
            name   = 'Air Elemental',
            ids    = { 17, 25, 144, 168 },
            levels = {
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45 },
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
            },
            spawn_levels = { [17] = { 44, 47 }, [25] = { 44, 47 }, [144] = { 47, 50 }, [168] = { 47, 50 } },
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
            name   = 'Firedrake',
            ids    = { 67, 68, 69, 72, 73, 74, 75, 76, 77, 87, 88, 89, 98, 99, 100, 116, 117, 118, 119 },
            levels = {
                [41] = { acc = 151, eva = 140, agi = 47, int = 40, mnd = 33, chr = 37 },
                [42] = { acc = 154, eva = 142, agi = 47, int = 40, mnd = 33, chr = 37 },
                [43] = { acc = 157, eva = 145, agi = 47, int = 40, mnd = 33, chr = 37 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 100, item = 1122 },  -- wyvern skin
                { rate = 50, item = 1124 },  -- wyvern wing
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Thunder Elemental',
            ids    = { 79, 113, 211 },
            levels = {
                [44] = { acc = 159, eva = 143, agi = 46, int = 54, mnd = 43, chr = 45 },
                [45] = { acc = 162, eva = 145, agi = 47, int = 55, mnd = 44, chr = 45 },
                [46] = { acc = 165, eva = 149, agi = 48, int = 56, mnd = 45, chr = 45 },
                [47] = { acc = 169, eva = 152, agi = 49, int = 58, mnd = 46, chr = 47 },
                [48] = { acc = 172, eva = 154, agi = 49, int = 58, mnd = 47, chr = 47 },
                [49] = { acc = 175, eva = 158, agi = 50, int = 59, mnd = 47, chr = 47 },
                [50] = { acc = 179, eva = 161, agi = 51, int = 60, mnd = 48, chr = 50 },
            },
            spawn_levels = { [79] = { 44, 47 }, [113] = { 47, 50 }, [211] = { 47, 50 } },
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
            name   = 'Hawker',
            ids    = { 120, 121, 122, 123, 124, 125, 126, 127, 151, 152, 153, 154, 155, 156, 157, 158, 161, 162,
                       163, 164, 165, 166, 167, 174, 175, 176, 177, 178, 191, 192, 193, 194, 195 },
            levels = {
                [45] = { acc = 162, eva = 154, agi = 52, int = 37, mnd = 37, chr = 42 },
                [46] = { acc = 166, eva = 158, agi = 55, int = 37, mnd = 37, chr = 42 },
                [47] = { acc = 170, eva = 160, agi = 55, int = 38, mnd = 38, chr = 43 },
                [48] = { acc = 173, eva = 163, agi = 55, int = 38, mnd = 38, chr = 44 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            drops  = {
                { rate = 150, item = 846 },  -- insect wing
            },
            links  = 2,
        },
        {
            name   = 'Cloud Hippogryph',
            ids    = { 128, 129, 130, 169, 170, 171, 172, 173, 180, 181, 182, 183, 184, 185, 186, 187, 188 },
            levels = {
                [45] = { acc = 167, eva = 186, agi = 52, int = 49, mnd = 33, chr = 33 },
                [46] = { acc = 170, eva = 190, agi = 54, int = 51, mnd = 34, chr = 34 },
                [47] = { acc = 174, eva = 193, agi = 55, int = 52, mnd = 35, chr = 35 },
            },
            ranks  = { fire = -1, ice = -1, wind = 3, earth = -3, thunder = 3, water = -1, light = -1, dark = -1,
                       paralyze = -1, bind = -1, silence = 3, slow = -3, poison = -1, light_sleep = -1,
                       dark_sleep = -1, blind = -1, stun = 3, gravity = 3 },
            drops  = {
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 150, item = 1690 },  -- hippogryph tailfeather
                { rate = 100, item = 1690 },  -- hippogryph tailfeather
                { rate = 10, item = 1619 },  -- hippogryph feather
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight' },
        },
        {
            name   = 'Atomic Cluster',
            ids    = { 131, 132, 145, 146, 147, 148, 149, 159, 160, 179, 189, 190, 203, 204, 212, 213, 214, 215 },
            levels = {
                [45] = { acc = 164, eva = 152, agi = 49, int = 37, mnd = 37, chr = 45 },
                [46] = { acc = 168, eva = 156, agi = 51, int = 37, mnd = 37, chr = 46 },
                [47] = { acc = 171, eva = 159, agi = 52, int = 38, mnd = 38, chr = 46 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 38, mnd = 38, chr = 47 },
            },
            ranks  = { fire = -2, ice = 3, wind = 3, earth = 3, thunder = 3, water = 3, light = 3, dark = 3,
                       paralyze = 3, bind = 3, silence = 3, slow = 3, poison = 3, light_sleep = 3, dark_sleep = 3,
                       blind = 3, stun = 3, gravity = 3 },
            drops  = {
                { rate = 1000, item = 1667 },  -- cluster core
                { rate = 100, item = 1880 },  -- pot of clustered tar
                { rate = 100, item = 1630 },  -- pinch of cluster ash
                { rate = 50, item = 17305 },  -- cluster arm
            },
            aggro  = true,
            detects = { 'sight', 'magic' },
        },
        {
            name   = 'Flamedrake',
            ids    = { 133, 150, 205, 206, 207, 208, 209 },
            levels = {
                [47] = { acc = 171, eva = 159, agi = 52, int = 43, mnd = 35, chr = 40 },
                [48] = { acc = 174, eva = 162, agi = 52, int = 44, mnd = 36, chr = 42 },
                [49] = { acc = 178, eva = 165, agi = 53, int = 46, mnd = 38, chr = 42 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 50, item = 1124 },  -- wyvern wing
                { rate = 100, item = 1122 },  -- wyvern skin
            },
            aggro  = true,
            detects = { 'sight' },
        },
        {
            name   = 'Carmine Dobsonfly',
            ids    = { 134, 135, 136, 137, 138, 139, 140, 141, 142, 143 },
            nm     = true,
            levels = {
                [44] = { acc = 157, eva = 141, agi = 43, int = 49, mnd = 49, chr = 45 },
                [45] = { acc = 160, eva = 144, agi = 45, int = 49, mnd = 49, chr = 45 },
                [46] = { acc = 163, eva = 148, agi = 46, int = 51, mnd = 51, chr = 45 },
            },
            ranks  = { fire = -2, ice = -3, thunder = -2, water = -2, light = -2, dark = -2, paralyze = -3,
                       bind = -3, poison = -2, light_sleep = -2, dark_sleep = -2, blind = -2, stun = -2 },
            immune = { 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 15183 },  -- dobson bandana
                { rate = 150, item = 14669 },  -- jaeger ring
                { rate = 100, item = 15184 },  -- voyager sallet
            },
            links  = 2,
        },
        {
            name   = 'Aiatar',
            ids    = { 210 },
            nm     = true,
            levels = {
                [51] = { acc = 188, eva = 174, agi = 56, int = 47, mnd = 39, chr = 45 },
                [52] = { acc = 193, eva = 179, agi = 56, int = 47, mnd = 39, chr = 45 },
            },
            ranks  = { fire = 4, ice = 1, thunder = -2, water = -2, light = -2, dark = -3, paralyze = 1, bind = 1,
                       poison = -2, light_sleep = -2, dark_sleep = -3, blind = -3, stun = -2 },
            drops  = {
                { rate = 240, item = 1691 },  -- giant scale
                { rate = 240, item = 1122 },  -- wyvern skin
                { rate = 100, item = 15367 },  -- falconers hose
                { rate = 100, item = 15370 },  -- sable cuisses
            },
            aggro  = true,
            any_level = true,
            detects = { 'sight' },
        },
        {
            name   = 'Water Elemental',
            ids    = { 216 },
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
            },
            ranks  = { fire = 11, thunder = -3, water = 11, poison = 11, stun = -3 },
            immune = { 'poison' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Earth Elemental',
            ids    = { 217 },
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 83, mnd = 67, chr = 67 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 85, mnd = 68, chr = 70 },
            },
            ranks  = { wind = -3, earth = 11, thunder = 11, silence = -3, slow = 11, stun = 11, gravity = -3 },
            immune = { 'stun', 'slow', 'elegy' },
            aggro  = true,
            detects = { 'magic' },
        },
        {
            name   = 'Ouryu',
            ids    = { 218 },
            nm     = true,
            levels = {
                [90] = { acc = 407, eva = 370, agi = 72, int = 77, mnd = 82, chr = 102 },
            },
            ranks  = { wind = -2, earth = 11, thunder = 11, silence = -2, slow = 11, stun = 11, gravity = -2 },
            magic_dmg = { all = -50 },
            immune = { 'stun', 'slow', 'elegy', 'petrify', 'terror', 'plague' },
            drops  = {
                { rate = 1000, item = 1703 },  -- chunk of kunwu ore
                { rate = 1000, item = 1703 },  -- chunk of kunwu ore
                { rate = 1000, item = 2108 },  -- monarchs orb
                { rate = 1000, item = 1703 },  -- chunk of kunwu ore
                { rate = 1000, item = 1816 },  -- wyrm horn
                { rate = 1000, item = 17658 },  -- tutelary
                { rate = 100, item = 17799 },  -- imanotsurugi
                { rate = 240, group = {  -- one of
                    { 1313, 1500 },  -- lock of sirens hair
                    { 836, 1500 },  -- square of damascene cloth
                    { 1110, 1500 },  -- vial of black beetle blood
                    { 655, 1000 },  -- adaman ingot
                    { 658, 1000 },  -- damascus ingot
                    { 722, 1000 },  -- divine log
                    { 837, 1000 },  -- spool of malboro fiber
                    { 860, 750 },  -- behemoth hide
                    { 1311, 750 },  -- piece of oxblood
                } },
                { rate = 240, group = {  -- one of
                    { 4272, 5000 },  -- slice of dragon meat
                    { 903, 3000 },  -- dragon talon
                    { 4486, 1000 },  -- dragon heart
                    { 1133, 1000 },  -- vial of dragon blood
                } },
            },
            aggro  = true,
            true_detect = true,
            detects = { 'sight', 'sound' },
            links  = 3,
        },
        {
            name   = 'Ziryu',
            ids    = { 219, 220, 221, 222 },
            levels = {
                [72] = { acc = 297, eva = 274, agi = 71, int = 88, mnd = 67, chr = 64 },
                [73] = { acc = 303, eva = 280, agi = 72, int = 89, mnd = 68, chr = 66 },
                [74] = { acc = 308, eva = 284, agi = 73, int = 90, mnd = 68, chr = 66 },
            },
            ranks  = { fire = -2, ice = -2, wind = -3, earth = 2, thunder = -2, water = -2, light = -3,
                       paralyze = -2, bind = -2, silence = -3, slow = 2, poison = -2, light_sleep = -3, stun = -2,
                       gravity = -3 },
            drops  = {
                { rate = 150, item = 1830 },  -- sack of lugworm sand
                { rate = 150, item = 1831 },  -- sack of little worm mulch
            },
            aggro  = true,
            detects = { 'sound' },
            aggro_note = 'underground',
            links  = 4,
        },
        {
            name   = 'Arcane Phantasm',
            ids    = { 223 },
            nm     = true,
            levels = {
                [44] = { acc = 157, eva = 138, agi = 36, int = 45, mnd = 45, chr = 55 },
                [45] = { acc = 160, eva = 140, agi = 37, int = 45, mnd = 45, chr = 55 },
            },
            ranks  = { fire = -2, ice = 4, light = -2, dark = 4, paralyze = 4, bind = 4, light_sleep = -2,
                       dark_sleep = 4, blind = 4 },
            undead = true,
            aggro  = true,
            true_detect = true,
            detects = { 'sound', 'low_hp' },
        },
    },
    by_name = {},
}
