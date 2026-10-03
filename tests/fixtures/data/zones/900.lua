-- A made-up zone 900 for the tests, in the same format as checkmate\data\zones\<zone id>.lua.
-- Tests point addon.path at tests\fixtures\ to load it. Each row has one thing to test.
return {
    built   = 'fixture 900',
    content = 'made up',
    link_lists = {},
    monsters = {
        -- Exact numbers at 38 to 40, ranks, meva, a resist trait, immunities and drops.
        {
            name   = 'Fixture Goblin',
            ids    = { 1, 2 },
            levels = {
                [38] = { acc = 150, eva = 140, agi = 40, int = 45, mnd = 40, chr = 38 },
                [39] = { acc = 154, eva = 143, agi = 41, int = 46, mnd = 41, chr = 39 },
                [40] = { acc = 158, eva = 146, agi = 42, int = 47, mnd = 42, chr = 40 },
            },
            ranks  = { fire = 11, ice = -2, water = -1, dark_sleep = 11, light_sleep = 11 },
            meva   = { all = 25, water = 128 },
            resist = { sleep = 25 },
            immune = { 'bind', 'paralyze' },
            drops  = {
                { rate = 150, item = 4104 },                                       -- fire crystal
                { rate = 50, group = { { 4104, 1 }, { 4105, 1 }, { 0, 2 } } },    -- one of, or nothing
                { rate = 1000, item = 4105 },                                      -- ice crystal
            },
        },
        -- The /check level is 2 under its true level, and it only drops with EXP.
        {
            name      = 'Fixture Rabbit',
            ids       = { 5 },
            levels    = {
                [5] = { acc = 22, eva = 20, agi = 9, int = 8, mnd = 8, chr = 8 },
                [6] = { acc = 25, eva = 23, agi = 10, int = 8, mnd = 8, chr = 8 },
            },
            level_mod = -2,
            flags     = { exp_only = true },
            drops     = { { rate = 150, item = 4358 } },                              -- hare meat
        },
        -- Notorious, undead and changed by its scripts.
        {
            name   = 'Fixture NM',
            ids    = { 400 },
            nm     = true,
            undead = true,
            levels = {
                [50] = { acc = 180, eva = 170, agi = 50, int = 50, mnd = 50, chr = 50 },
                [51] = { acc = 184, eva = 173, agi = 51, int = 51, mnd = 51, chr = 51 },
            },
            flags  = { scripted_stats = true, scripted_drops = true },
        },
        -- Levels in two blocks, like an Assault monster under two level caps.
        {
            name   = 'Fixture Worm',
            ids    = { 10 },
            levels = {
                [51] = { acc = 186, eva = 158, agi = 56, int = 69, mnd = 47, chr = 48 },
                [52] = { acc = 191, eva = 163, agi = 56, int = 69, mnd = 47, chr = 48 },
                [76] = { acc = 321, eva = 283, agi = 80, int = 97, mnd = 66, chr = 68 },
            },
        },
        -- Known to the data, but with no level in it.
        {
            name   = 'Fixture Blank',
            ids    = { 20 },
            levels = {},
            immune = { 'terror' },
        },
        -- A resist trait that starts at 45.
        {
            name   = 'Fixture Knight',
            ids    = { 30 },
            levels = {
                [44] = { acc = 170, eva = 150, agi = 44, int = 40, mnd = 40, chr = 40 },
                [45] = { acc = 174, eva = 153, agi = 45, int = 41, mnd = 41, chr = 41, resist = { sleep = 10 } },
            },
        },
        -- Spawned by a script, so it has no fixed index.
        {
            name   = 'Fixture Treant',
            ids    = {},
            levels = { [30] = { acc = 110, eva = 100, agi = 30, int = 30, mnd = 30, chr = 30 } },
        },
        -- Aggressive, with spawns at their own narrower ranges. Index 42 has none, so it takes the row's.
        {
            name   = 'Fixture Tinkerer',
            ids    = { 40, 41, 42 },
            levels = {
                [54] = { acc = 200, eva = 290, agi = 60, int = 50, mnd = 50, chr = 50 },
                [55] = { acc = 210, eva = 280, agi = 50, int = 50, mnd = 50, chr = 50 },
                [56] = { acc = 220, eva = 270, agi = 40, int = 50, mnd = 50, chr = 50 },
                [57] = { acc = 230, eva = 260, agi = 30, int = 50, mnd = 50, chr = 50 },
            },
            spawn_levels = { [40] = { 54, 55 }, [41] = { 56, 57 } },
            aggro  = true,
        },
    },
    by_name = { ['Fixture Treant'] = 7 },
}
