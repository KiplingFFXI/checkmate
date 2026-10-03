--[[
    The chance of each item the monster you /check can drop, at the Treasure Hunter you set.

    Every roll in the data is a per-mille rate. The server turns it into basis points, snaps it down
    to one of seven columns and reads the chance from the Treasure Hunter row
    (scripts/combat/basic/treasure_hunter.lua). A rate of 1000 always drops and ignores Treasure
    Hunter. A group rolls its rate the same way, then gives one member by weight. An item that more
    than one roll can give is counted once, as the chance that any of them gives it.
    Phoenix allows Treasure Hunter 0 to 4.
]]

local drops = {};

-- Treasure Hunter rows 0 to 4 in basis points, one number per column.
local TH_TABLE = {
    [0] = { 2400, 1500, 1000, 500, 100,  50, 10 },
    [1] = { 4800, 3000, 1200, 600, 150,  75, 20 },
    [2] = { 5600, 4000, 1500, 700, 200, 100, 30 },
    [3] = { 6000, 4250, 1650, 750, 225, 120, 35 },
    [4] = { 6400, 4500, 1800, 800, 250, 140, 40 },
};

-- Phoenix allows no Treasure Hunter above this.
drops.TH_MAX = 4;

-- Most items the settings offer to show. 0 shows every item.
drops.MAX_ITEMS = 12;

-- Highest chance in percent the settings offer to hide items under.
drops.MIN_CHANCE_MAX = 50;

-- The lowest rate in basis points for each column, from very common down to ultra rare.
local COLUMN_FLOOR = { 2400, 1500, 1000, 500, 100, 50, 0 };

-- The rate that always drops, in per mille.
local ALWAYS = 1000;

-- A per-mille rate is this many basis points, and a whole chance is 10000.
local BASIS_POINTS_PER_MILLE = 10;
local BASIS_POINTS = 10000;

-- Item id 0 in a group is a roll that gives nothing.
local NOTHING = 0;

-- Treasure Hunter as a whole number from 0 to TH_MAX.
function drops.clamp_th(th)
    return math.max(0, math.min(drops.TH_MAX, math.floor(tonumber(th) or 0)));
end

-- The chance, 0 to 1, that one roll of `per_mille` fires at Treasure Hunter `th`.
function drops.roll_chance(per_mille, th)
    if (per_mille >= ALWAYS) then
        return 1;
    end
    if (per_mille <= 0) then
        return 0;
    end
    local points = per_mille * BASIS_POINTS_PER_MILLE;
    local row = TH_TABLE[drops.clamp_th(th)];
    for column, floor in ipairs(COLUMN_FLOOR) do
        if (points >= floor) then
            return row[column] / BASIS_POINTS;
        end
    end
    return 0;
end

--[[
    The chance, 0 to 1, of each item over every roll, as { [item id] = chance }. A roll is
    { rate = per mille, item = id } or { rate = per mille, group = { { id, weight }, ... } }.
]]
function drops.chances(rolls, th)
    local miss = {};
    local function add(id, chance)
        miss[id] = (miss[id] or 1) * (1 - chance);
    end

    for _, roll in ipairs(rolls or {}) do
        local chance = drops.roll_chance(roll.rate or 0, th);
        if (roll.item ~= nil) then
            add(roll.item, chance);
        elseif (roll.group ~= nil) then
            local total, weights = 0, {};
            for _, member in ipairs(roll.group) do
                total = total + member[2];
                weights[member[1]] = (weights[member[1]] or 0) + member[2];
            end
            for id, weight in pairs(weights) do
                if (id ~= NOTHING and total > 0) then
                    add(id, chance * weight / total);
                end
            end
        end
    end

    local out = {};
    for id, chance in pairs(miss) do
        out[id] = 1 - chance;
    end
    return out;
end

local resources = AshitaCore:GetResourceManager();

-- The item's English name, or "Item <id>" when the client doesn't know it.
local function item_name(id)
    local item = resources:GetItemById(id);
    local name = item and item.Name and item.Name[1];
    if (name == nil or name == '') then
        return ('Item %d'):format(id);
    end
    return name;
end

local function by_chance(a, b)
    if (a.chance ~= b.chance) then
        return a.chance > b.chance;
    end
    return a.name < b.name;
end

local function by_name(a, b)
    return a.name < b.name;
end

--[[
    The drop list for a data row with the drop settings, or nil when there's nothing to show.
    Returns { th, items = { { name, chance }, ... }, more, scripted, exp_only } with chance in percent.
    Items under the minimum chance are left out. `more` counts the items past the most shown.
]]
function drops.readout(row, setting)
    local flags = row.flags or {};
    local th = drops.clamp_th(setting.th);
    local items = {};
    for id, chance in pairs(drops.chances(row.drops, th)) do
        local percent = chance * 100;
        if (percent > 0 and percent >= (setting.min_chance or 0)) then
            items[#items + 1] = { name = item_name(id), chance = percent };
        end
    end
    table.sort(items, setting.sort == 'name' and by_name or by_chance);

    local more = 0;
    local most = setting.max_items or 0;
    if (most > 0 and #items > most) then
        more = #items - most;
        for i = #items, most + 1, -1 do
            items[i] = nil;
        end
    end

    local out = {
        th       = th,
        items    = items,
        more     = more,
        scripted = flags.scripted_drops == true,
        exp_only = flags.exp_only == true,
    };
    if (#items == 0 and more == 0 and not out.scripted and not out.exp_only) then
        return nil;
    end
    return out;
end

return drops;
