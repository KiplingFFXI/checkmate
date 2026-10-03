--[[
    The elements the monster you /check is weak to, and the ones it resists.

    Each element is worked out on its own, and the first test that fits wins. A damage spell is
    nullified first and absorbed next, before anything else counts (damage_spell.lua
    useDamageSpell). Rank 11 never lands an effect. Then comes the share of a nuke's damage that gets
    through, from the monster's damage taken for that element and the half that rank 4 and up costs.
    95% or less resists, and 105% or more is weak. After that, the element with the monster's lowest
    rank is weak when that rank is below 0 and the elements don't all share it. Rank -2 is the usual,
    so only the lowest counts. Last, extra magic evasion for the element resists, since spells land
    less often.
    Magic damage taken from every element is the same for all eight, so it's a note of its own.
]]

local spells = require('data.spells');

local elements = {};

-- The elements in the order they print.
elements.ORDER = { 'fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark' };

-- Rank 11 never lands an effect, and rank 10 lands 5% of the time (magic_hit_rate.lua). Rank 4 and up
-- halves nuke damage (damage_spell.lua calculateAdditionalResistTier).
local NEVER_RANK = 11;
local FLOOR_RANK = 10;
local HALF_RANK  = 4;
local HALF       = 0.5;

-- A damage share this close to full damage is neither weak nor resists. Tiny script values stay out.
local BAND = 0.05;

-- The note for magic damage taken from every element shows from this many percent either way.
local NOTE_MIN = 5;

-- The row fields the part reads. The data keeps one on a level when it changes with the level.
local FIELDS = { 'ranks', 'meva', 'magic_dmg', 'absorb', 'nullify' };

-- How strong each one is, printed after its name.
local WORDS = {
    nullify = 'nullifies',
    absorb  = 'absorbs',
    never   = 'never lands',
    rarely  = 'rarely lands',
    half    = 'half',
    meva    = 'lands less',
};

-- Stands in for a missing table, so lookups need no nil checks.
local NONE = {};

-- "50%" or "12.5%". A whole number prints without its decimal.
local function percent(value)
    local text = ('%.1f'):format(value):gsub('%.0$', '');
    return text .. '%';
end

-- "+100%" or "-12.5%".
local function signed(value)
    return (value > 0 and '+' or '') .. percent(value);
end

-- The chance in percent that one of two separate rolls goes off, like an element's absorb and the
-- absorb for every element. The server rolls each on its own.
local function either(one, two)
    return 100 - (100 - one) * (100 - two) / 100;
end

-- "absorbs", or "absorbs 50%" when it doesn't always.
local function chance_word(word, chance)
    if (chance >= 100) then
        return word;
    end
    return word .. ' ' .. percent(chance);
end

-- The monster's lowest element rank, when it's below 0 and some element ranks higher. Otherwise nil.
local function lowest_rank(ranks)
    local low, high;
    for _, element in ipairs(elements.ORDER) do
        local rank = ranks[element] or 0;
        low  = math.min(low or rank, rank);
        high = math.max(high or rank, rank);
    end
    if (low < 0 and low < high) then
        return low;
    end
    return nil;
end

-- 'weak' or 'resists' for one element, with its strength word or nil. Nil when it's neither.
local function judge(data, element, lowest)
    local rank = data.ranks[element] or 0;
    local nullify = either(data.nullify[element] or 0, data.nullify.all or 0);
    if (nullify > 0) then
        return 'resists', chance_word(WORDS.nullify, nullify);
    end
    local absorb = either(data.absorb[element] or 0, data.absorb.all or 0);
    if (absorb > 0) then
        return 'resists', chance_word(WORDS.absorb, absorb);
    end
    if (rank >= NEVER_RANK) then
        return 'resists', WORDS.never;
    end

    local share = (1 + (data.magic_dmg[element] or 0) / 100) * (rank >= HALF_RANK and HALF or 1);
    if (share <= 1 - BAND) then
        if (rank == FLOOR_RANK) then
            return 'resists', WORDS.rarely;
        end
        return 'resists', (share == HALF) and WORDS.half or signed((share - 1) * 100);
    elseif (share >= 1 + BAND) then
        return 'weak', signed((share - 1) * 100);
    elseif (rank == lowest) then
        return 'weak', nil;
    elseif ((data.meva[element] or 0) > 0) then
        return 'resists', WORDS.meva;
    end
    return nil;
end

--[[
    The elements part for a data row. `level` is the monster's level when it's known exactly, or nil.
    Returns nil when there's nothing to say. Otherwise { weak, resists, all, scripted }. `weak` and
    `resists` list { name, strength } in print order. `strength` is a word like 'half' or '+100%', or
    nil when only the rank makes it weak. `all` is the change in magic damage taken from every
    element, like '-25%', or nil under 5% either way. `scripted` is true when a script can change any
    of it.
]]
function elements.readout(row, level)
    local stats = level and row.levels and row.levels[level] or NONE;
    local data = {};
    for _, field in ipairs(FIELDS) do
        data[field] = stats[field] or row[field] or NONE;
    end

    local out = { weak = {}, resists = {} };
    local lowest = lowest_rank(data.ranks);
    for _, element in ipairs(elements.ORDER) do
        local kind, strength = judge(data, element, lowest);
        if (kind ~= nil) then
            local list = out[kind];
            list[#list + 1] = { name = spells.ELEMENT_NAMES[element], strength = strength };
        end
    end
    local all = data.magic_dmg.all or 0;
    if (math.abs(all) >= NOTE_MIN) then
        out.all = signed(all);
    end
    if (#out.weak == 0 and #out.resists == 0 and out.all == nil) then
        return nil;
    end
    local flags = row.flags or NONE;
    out.scripted = flags.scripted_elements == true or flags.scripted_stats == true;
    return out;
end

return elements;
