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

-- How strong each one is, printed after its name, by its key in core\wording.lua.
local WORDS = {
    nullify = 'str_nullify',
    absorb  = 'str_absorb',
    never   = 'str_never',
    rarely  = 'str_rarely',
    half    = 'str_half',
    meva    = 'str_meva',
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

-- A chance as text, like "50%", or nil when it always happens.
local function sometimes(chance)
    if (chance >= 100) then
        return nil;
    end
    return percent(chance);
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

--[[
    'weak' or 'resists' for one element, or nil when it's neither. Then its strength word's key or nil, the
    amount that prints with it as text or nil, why it's there, and the nuke share the overlay's tips give for
    never and rarely. Why is 'nullify', 'absorb', 'never', 'rarely', 'half' (rank 4 and up), 'half_less' (rank 4
    and up, with its own damage taken on top), 'halved' (its damage taken alone halves a nuke), 'less' or 'more'
    (the damage share), 'lowest' (at the lowest rank, which another element can share) or 'meva'. The amount is
    the chance for nullify and absorb when it isn't always, like '50%', and the damage share for half_less, less
    and more, like '-75%', which prints with no word. The nuke share is, for never, the share of its damage a
    nuke does when the element's own damage taken changes it from an eighth, like '0.6%', and for rarely the best
    share a nuke does when it isn't half, like '25%'.
]]
local function judge(data, element, lowest)
    local rank = data.ranks[element] or 0;
    local nullify = either(data.nullify[element] or 0, data.nullify.all or 0);
    if (nullify > 0) then
        return 'resists', WORDS.nullify, sometimes(nullify), 'nullify';
    end
    local absorb = either(data.absorb[element] or 0, data.absorb.all or 0);
    if (absorb > 0) then
        return 'resists', WORDS.absorb, sometimes(absorb), 'absorb';
    end
    if (rank >= NEVER_RANK) then
        -- A nuke at rank 11 does a quarter of its damage, and rank 4 and up halves that, so an eighth.
        local own = data.magic_dmg[element] or 0;
        return 'resists', WORDS.never, nil, 'never', own ~= 0 and percent(12.5 * (1 + own / 100)) or nil;
    end

    local share = (1 + (data.magic_dmg[element] or 0) / 100) * (rank >= HALF_RANK and HALF or 1);
    if (share <= 1 - BAND) then
        if (rank == FLOOR_RANK) then
            return 'resists', WORDS.rarely, nil, 'rarely', share ~= HALF and percent(share * 100) or nil;
        elseif (share == HALF) then
            return 'resists', WORDS.half, nil, (rank >= HALF_RANK) and 'half' or 'halved';
        end
        return 'resists', nil, signed((share - 1) * 100), (rank >= HALF_RANK) and 'half_less' or 'less';
    elseif (share >= 1 + BAND) then
        return 'weak', nil, signed((share - 1) * 100), 'more';
    elseif (rank == lowest) then
        return 'weak', nil, nil, 'lowest';
    elseif ((data.meva[element] or 0) > 0) then
        return 'resists', WORDS.meva, nil, 'meva';
    end
    return nil;
end

--[[
    The elements part for a data row. `level` is the monster's level when it's known exactly, or nil.
    Returns nil when there's nothing to say. Otherwise { weak, resists, all, scripted }. `weak` and
    `resists` list { element, strength, amount, why, share } in print order. `element` is the element's
    name in ORDER, like 'ice'. `strength` is a key in core\wording.lua, like 'str_half', or nil when the
    rank or the damage share alone makes it so. `amount` is what prints with it as text, the chance after
    nullifies or absorbs when it isn't always, like '50%', or a damage share on its own, like '+100%', or
    nil. `why` is the reason it's there, which the overlay's tips explain. `share` is only for the tips: for
    never it's the share of a nuke's damage that gets through when that isn't an eighth, like '0.6%', and
    for rarely the best share a nuke does when that isn't half, like '25%'. `all` is the change in magic
    damage taken from every element, like '-25%', or nil under 5% either way. `scripted` is true when a
    script can change any of it.
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
        local kind, strength, amount, why, share = judge(data, element, lowest);
        if (kind ~= nil) then
            local list = out[kind];
            list[#list + 1] = { element = element, strength = strength, amount = amount, why = why, share = share };
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
    out.scripted = flags.scripted_elements == true;
    return out;
end

return elements;
