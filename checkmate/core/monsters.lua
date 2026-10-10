--[[
    The monster data and the level of the monster you /check.

    Each zone has one data file, data\zones\<zone id>.lua. It loads the first time you /check
    something in that zone and is dropped when you zone. A monster's row is found by its spawn index,
    the low 12 bits of its server id. Monsters a script spawns mid-game have no fixed index. A data file
    can key those by name in by_name, but Phoenix's data has none, so they get no row.
]]

local monsters = {};

-- Spawn indexes of monsters a script spawns mid-game start here. Their server id carries the index
-- plus 0x100, so the low 12 bits run from 0x800 up.
local DYNAMIC_INDEX = 0x800;
local INDEX_SPAN    = 0x1000;

-- The loaded zone, its data file (nil when it has none) and its rows by spawn index.
local loaded = { zone = nil, file = nil, by_index = {} };

-- Widescan levels seen in this zone, by entity index.
local scanned = {};
local scan_times = {};

-- The true levels your own /checks and widescan saw in this zone, by entity index, whichever came last.
-- Only a charmed pet's level reads them, so a /check level never changes the level shown for another
-- monster at the same index. Death or disappearance clears them before that index can be reused.
local checked = {};

local function load_zone(zone)
    loaded.zone, loaded.file, loaded.by_index = zone, nil, {};

    local chunk = loadfile(('%s/data/zones/%d.lua'):format(addon.path, zone));
    if (chunk == nil) then
        return;
    end
    local ok, file = pcall(chunk);
    if (not ok or type(file) ~= 'table' or type(file.monsters) ~= 'table') then
        return;
    end

    monsters.resolve_links(file);
    for _, row in ipairs(file.monsters) do
        for _, index in ipairs(row.ids or {}) do
            loaded.by_index[index] = row;
        end
    end
    loaded.file = file;
end

--[[
    Puts each row's link groups where the file has the number of its list. A zone file writes each
    list once in link_lists, since many rows share one, and those rows share the same table.
]]
function monsters.resolve_links(file)
    local lists = file.link_lists or {};
    for _, row in ipairs(file.monsters) do
        if (row.links ~= nil) then
            row.links = lists[row.links];
            row.link_families = file.link_families;
        end
    end
end

--[[
    The data row for the monster with server id `id` in `zone`, or nil when the data has none.
    `name` is the name the client shows, used only for monsters spawned mid-game.
]]
function monsters.find(zone, id, name)
    if (loaded.zone ~= zone) then
        load_zone(zone);
    end
    local file = loaded.file;
    if (file == nil) then
        return nil;
    end

    local index = id % INDEX_SPAN;
    if (index < DYNAMIC_INDEX) then
        return loaded.by_index[index];
    end
    local number = file.by_name and name and file.by_name[name];
    return number and file.monsters[number] or nil;
end

--[[
    The levels the monster at entity index `index` spawns at, as low, high. The data keeps a spawn's
    own range in spawn_levels when it's narrower than the row's, like one Goblin Tinkerer at 17 to 18
    in a row that runs 17 to 20. Any other spawn takes the row's range. Returns nil when the row has
    no level.
]]
function monsters.spawn_range(row, index)
    local own = row.spawn_levels and row.spawn_levels[index];
    if (own ~= nil) then
        return own[1], own[2];
    end
    local low, high;
    for level in pairs(row.levels or {}) do
        low  = math.min(low or level, level);
        high = math.max(high or level, level);
    end
    return low, high;
end

--[[
    The range to show after a known `level`, as low, high. It's the spawn's range cut down to the
    unbroken run of the row's levels around `level`, so an Assault monster under one level cap shows
    only that cap's levels. Returns nil when `level` isn't in that range.
]]
function monsters.range_around(row, index, level)
    local low, high = monsters.spawn_range(row, index);
    local levels = row.levels or {};
    if (low == nil or level < low or level > high or levels[level] == nil) then
        return nil;
    end
    local first, last = level, level;
    while (first > low and levels[first - 1] ~= nil) do
        first = first - 1;
    end
    while (last < high and levels[last + 1] ~= nil) do
        last = last + 1;
    end
    return first, last;
end

--[[
    The names of the NMs the spawn at entity index `index` can pop as a placeholder, or nil when it isn't one.
    The data keeps each placeholder's NMs by their spawn indexes in ph_for, and each NM's name is in its own row.
    A name only shows once, so the Ornery Sheep in South Gustaberg that can pop either Carnero just says Carnero.
]]
function monsters.ph_for(row, index)
    local nms = row and row.ph_for and row.ph_for[index];
    if (nms == nil) then
        return nil;
    end
    local names, seen = {}, {};
    for _, nm in ipairs(nms) do
        local nm_row = loaded.by_index[nm];
        if (nm_row ~= nil and not seen[nm_row.name]) then
            seen[nm_row.name] = true;
            names[#names + 1] = nm_row.name;
        end
    end
    return #names > 0 and names or nil;
end

-- Source rules for this placeholder. They say nothing about whether its NM's window is open now.
function monsters.ph_details(row, index)
    local rules = row and row.ph_rules and row.ph_rules[index];
    if (rules == nil) then return nil; end
    local out = {};
    for nm, rule in pairs(rules) do
        local nm_row = loaded.by_index[nm];
        if (nm_row ~= nil) then
            out[#out + 1] = { name = nm_row.name, chance = rule.chance,
                cooldown_min = rule.cooldown_min, cooldown_max = rule.cooldown_max, conditions = rule.conditions };
        end
    end
    table.sort(out, function (a, b) return a.name < b.name; end);
    return #out > 0 and out or nil;
end

function monsters.level_source(row, check_level, index)
    if (check_level ~= nil and check_level >= 1) then return 'check', os.clock(); end
    if (scanned[index] ~= nil) then return 'widescan', scan_times[index]; end
    return row and 'spawn' or 'unknown', nil;
end

--[[
    The monster's true level as low, high. They match when the level is known exactly.
    The /check level comes first when it is 1 or more, less the row's level_mod. The widescan level
    for its entity index in this zone comes next, then the levels it spawns at. Returns nil when none
    of them is known.
]]
function monsters.level(row, check_level, index)
    if (check_level ~= nil and check_level >= 1) then
        local level = check_level - (row and row.level_mod or 0);
        return level, level;
    end

    local level = scanned[index];
    if (level ~= nil) then
        return level, level;
    end

    if (row ~= nil) then
        return monsters.spawn_range(row, index);
    end
    return nil;
end

-- Widescan reported a monster's true level.
function monsters.on_widescan(index, level)
    if (level >= 1) then
        scanned[index], checked[index] = level, level;
        scan_times[index] = os.clock();
    end
end

-- Your /check gave the true level of the monster at entity index `index`.
function monsters.on_check(index, level)
    checked[index] = level;
end

-- The monster at this index left sight. It may return as a different spawn.
function monsters.on_disappear(index)
    checked[index], scanned[index], scan_times[index] = nil, nil, nil;
end

monsters.on_death = monsters.on_disappear;

-- A charmed pet's level as low, high: your /check or widescan of it in this zone, whichever came last, unless
-- it died or left sight since, else the levels it spawns at.
function monsters.pet_level(row, index)
    local level = checked[index];
    if (level ~= nil) then
        return level, level;
    end
    if (row ~= nil) then
        return monsters.spawn_range(row, index);
    end
    return nil;
end

-- True when server id `id` is a placed monster's, not a pet's or one a script spawned mid-game.
function monsters.placed(id)
    return id % INDEX_SPAN < DYNAMIC_INDEX;
end

-- The build stamp of the loaded zone's data, or nil when none is loaded.
function monsters.built()
    return loaded.file and loaded.file.built or nil;
end

function monsters.content()
    return loaded.file and loaded.file.content or nil;
end

-- Loads a zone's data now, while the zone screen is up, so the overlay doesn't stutter on your first target there.
function monsters.preload(zone)
    if (loaded.zone ~= zone) then
        load_zone(zone);
    end
end

-- Entity indexes are reused in the next zone, and its data is a different file.
function monsters.forget_zone()
    loaded.zone, loaded.file, loaded.by_index = nil, nil, {};
    scanned, checked = {}, {};
    scan_times = {};
end

return monsters;
