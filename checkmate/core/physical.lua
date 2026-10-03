--[[
    Hit rate, evasion and critical hit rate against the monster you /check.

    The server works out hit rate in scripts/combat/physical_hit_rate.lua. It's
    75 + (accuracy - evasion) / 2 percent, kept between 20 and 95 on Phoenix. The server keeps it as a
    fraction and rounds it down after multiplying by 100, so a few values come out one under that formula.
    A monster above your level costs you 4 accuracy per level and gains 4 accuracy per level on you.
    Phoenix does this in every zone.
    Under Signet, a normal monster that checks as an even match or lower swings at you as if you had
    25% more evasion, while you're fighting it. Signet does nothing in the Aht Urhgan areas or on the
    ferries.

    Critical hit rate comes from battleutils.cpp GetCritHitRate. It starts at 5%, and DEX above the
    monster's AGI adds up to 15% more. Merits and gear with critical hit rate add on top, and the
    client can't see those.

    A monster with a data row has exact numbers at each level. One without a row falls back to the
    typical values for its level (data\bands.lua), which give a range.
]]

local bands = require('data.bands');

local physical = {};

-- The typical values for each level, from the rows in data\bands.lua.
local BANDS = {};
for _, row in ipairs(bands.rows) do
    BANDS[row[1]] = {
        acc_low = row[2], acc_high = row[3], eva_low = row[4], eva_high = row[5], agi_low = row[6], agi_high = row[7],
    };
end

-- Hit rate limits, as the fraction the server keeps and in percent.
local HIT_FLOOR = 0.20;
local HIT_CAP   = 0.95;
local HIT_FLOOR_PERCENT = 20;
local HIT_CAP_PERCENT   = 95;

-- Each level a monster has over you is worth this much accuracy.
local ACCURACY_PER_LEVEL = 4;

-- Signet counts your evasion as this much higher. SIGNET is its buff id.
local SIGNET_EVASION = 1.25;
local SIGNET = 253;

-- Critical hit rate before DEX, merits and gear.
local BASE_CRIT = 5;

-- The /check con for an even match. Anything at or below it gets Signet.
local EVEN_MATCH = 4;

-- Signet does nothing in these zones. They are the Aht Urhgan areas and the Selbina and Mhaura ferries.
local NO_SIGNET_ZONES = { [220] = true, [221] = true, [227] = true, [228] = true };
for zone = 46, 79 do
    NO_SIGNET_ZONES[zone] = true;
end

-- The accuracy minus evasion each /check evasion reading covers (0x0dd_equip_inspect.cpp). High
-- evasion has no bottom and low evasion has no top.
local CHECK_EDGES = {
    [0] = { high = -31 },            -- High evasion.
    [1] = { low = -30, high = 9 },   -- Normal evasion.
    [2] = { low = 10 },              -- Low evasion.
};

-- Hit rate in whole percent, worked out the way the server does it.
function physical.hit_percent(accuracy, evasion)
    local rate = (75 + (accuracy - evasion) / 2) / 100;
    rate = math.max(HIT_FLOOR, math.min(HIT_CAP, rate));
    return math.floor(rate * 100);
end

-- DEX over the monster's AGI adds critical hit rate in steps, up to 15% at 50 DEX over.
function physical.crit_percent(dex, agi)
    local over = math.max(0, math.min(50, dex - agi));
    local bonus = 0;
    if (over > 39) then
        bonus = over - 35;
    elseif (over > 29) then
        bonus = 4;
    elseif (over > 19) then
        bonus = 3;
    elseif (over > 13) then
        bonus = 2;
    elseif (over > 6) then
        bonus = 1;
    end
    return BASE_CRIT + bonus;
end

--[[
    True when Signet raises your evasion against a monster at `level`. A normal monster answers
    /check with its con. For one that can't be gauged, the data says whether it is notorious, and an
    even match or lower means its /check level is at or below yours.
]]
local function signet_applies(me, mob, level)
    if (not me.buffs[SIGNET] or NO_SIGNET_ZONES[me.zone]) then
        return false;
    end
    if (mob.con ~= nil) then
        return mob.con <= EVEN_MATCH;
    end
    if (mob.row == nil or mob.row.nm) then
        return false;
    end
    return level + (mob.row.level_mod or 0) <= me.level;
end

-- The /check range for your hit rate after the accuracy you lose to each level the monster has over you.
local function check_range(reading, gap)
    local edges = CHECK_EDGES[reading];
    if (edges == nil) then
        return nil;
    end
    local shift = ACCURACY_PER_LEVEL * gap;
    local low, high = HIT_FLOOR_PERCENT, HIT_CAP_PERCENT;
    if (edges.low ~= nil) then
        low = physical.hit_percent(edges.low - shift, 0);
    end
    if (edges.high ~= nil) then
        high = physical.hit_percent(edges.high - shift, 0);
    end
    return low, high;
end

-- Narrows low..high to the /check range. The /check range is exact, so a band outside it gives way.
local function within_check(low, high, check_low, check_high)
    if (check_low == nil) then
        return low, high;
    end
    local narrowed_low  = math.max(low, check_low);
    local narrowed_high = math.min(high, check_high);
    if (narrowed_low > narrowed_high) then
        return check_low, check_high;
    end
    return narrowed_low, narrowed_high;
end

-- Your hit rate. Without your accuracy it's unknown. Without monster numbers the /check range is all there is.
local function hit_at(me, mob, gap, stats, band)
    if (me.accuracy == nil) then
        return nil;
    end
    local check_low, check_high = check_range(mob.reading, gap);
    if (stats == nil and band == nil) then
        return check_low, check_high;
    end
    local accuracy = me.accuracy - ACCURACY_PER_LEVEL * gap;
    if (stats ~= nil) then
        local hit = physical.hit_percent(accuracy, stats.eva);
        return hit, hit;
    end
    return within_check(physical.hit_percent(accuracy, band.eva_high), physical.hit_percent(accuracy, band.eva_low),
        check_low, check_high);
end

-- How often its swings miss you.
local function evade_at(me, gap, stats, band, signet)
    if (me.evasion == nil or (stats == nil and band == nil)) then
        return nil;
    end
    local evasion = me.evasion;
    if (signet) then
        evasion = math.floor(evasion * SIGNET_EVASION);
    end
    local bonus = ACCURACY_PER_LEVEL * gap;
    if (stats ~= nil) then
        local evade = 100 - physical.hit_percent(stats.acc + bonus, evasion);
        return evade, evade;
    end
    local low  = 100 - physical.hit_percent(band.acc_high + bonus, evasion);
    local high = 100 - physical.hit_percent(band.acc_low + bonus, evasion);
    return low, high;
end

local function crit_at(me, stats, band)
    if (stats ~= nil) then
        local crit = physical.crit_percent(me.dex, stats.agi);
        return crit, crit;
    end
    if (band ~= nil) then
        return physical.crit_percent(me.dex, band.agi_high), physical.crit_percent(me.dex, band.agi_low);
    end
    return nil;
end

-- Widens `range` to take in low..high. A nil low leaves it as it is.
local function widen(range, low, high)
    if (low == nil) then
        return range;
    end
    if (range == nil) then
        return { low = low, high = high };
    end
    range.low, range.high = math.min(range.low, low), math.max(range.high, high);
    return range;
end

--[[
    Works out the readout over every level the monster can be.
    `me` is player.read() plus accuracy and evasion from /checkparam (nil when unknown).
    `mob` is { row, low, high, con, reading } where low..high is its true level, con the /check con
    and reading the /check evasion reading (both nil when it can't be gauged).
    Returns { hit, evade, crit, signet }, each number as { low, high } or nil when unknown.
]]
function physical.readout(me, mob)
    local out = { signet = false };
    if (mob.low == nil) then
        return out;
    end

    -- A monster with numbers for some of these levels is only ever one of them, like an Assault
    -- monster under its four level caps. The typical values stand in only when it has none.
    local levels = mob.row and mob.row.levels or {};
    local known = false;
    for level = mob.low, mob.high do
        known = known or levels[level] ~= nil;
    end

    for level = mob.low, mob.high do
        local stats = levels[level];
        if (stats ~= nil or not known) then
            local gap = math.max(0, level - me.level);
            local band = (stats == nil) and BANDS[level] or nil;
            local signet = signet_applies(me, mob, level);

            out.hit   = widen(out.hit, hit_at(me, mob, gap, stats, band));
            out.evade = widen(out.evade, evade_at(me, gap, stats, band, signet));
            out.crit  = widen(out.crit, crit_at(me, stats, band));
            out.signet = out.signet or (signet and out.evade ~= nil);
        end
    end
    return out;
end

return physical;
