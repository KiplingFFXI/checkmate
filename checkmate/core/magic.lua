--[[
    The chance each magic school's stand-in spell has against the monster you /check.

    Every spell a player casts on a monster goes through the server's calculateResistRate
    (scripts/combat/basic/magic_hit_rate.lua), and no Phoenix module changes it.
        x = magic accuracy - magic evasion + 25, halved (rounded down) when below 0
        x = x - 4 for each level the monster has over you
        hit chance = 50 + x percent, kept between 5 and 95
    The spell then re-rolls up to three times at that same chance, and each miss halves it. A nuke
    does full damage on the first roll. An effect lands when it misses no more than its resist state
    allows (status_effect_tables.lua). A resist trait can stop it before any of that.

    Magic accuracy is your skill, the stat bonus, the spell's bonus, your elemental staff, Elemental
    Seal or Dark Seal, half your wind instrument skill when singing, and the extra magic accuracy you
    set for gear and merits the client can't see. Soul Voice doubles it for Lullaby. Troubadour's bonus
    comes from merits the client can't see, so it's left out.
    Magic evasion is the monster's rank C skill cap at its level plus any extra it has, times the
    multiplier for its resistance rank. Rank 10 always gives 5%. Rank 11 never lands.
]]

local spells = require('data.spells');

local magic = {};

-- Most extra magic accuracy the settings offer.
magic.EXTRA_ACCURACY_MAX = 100;

-- Magic evasion multiplier by resistance rank (magic_hit_rate.lua resistRankMultiplier).
local RANK_MULTIPLIER = {
    [-3] = 0.95, [-2] = 0.96019, [-1] = 0.98, [0] = 1, [1] = 1.023, [2] = 1.049, [3] = 1.0905,
    [4] = 1.126, [5] = 1.2075, [6] = 1.3475, [7] = 1.70065, [8] = 2.141, [9] = 2.2,
};
local LOWEST_RANK  = -3;
local FLOOR_RANK   = 10;   -- The chance is 5% from here up.
local NEVER_RANK   = 11;   -- Nothing lands from here up.
local WASTED_RANK  = 100;  -- Added to an absorbed or nullified element's rank, so it comes last.

-- Hit chance limits in percent.
local HIT_FLOOR = 5;
local HIT_CAP   = 95;

-- Each level the monster has over you costs this much hit chance.
local LEVEL_PENALTY = 4;

-- An effect with this resist state or more lands on any roll.
local ALWAYS_LANDS_STATE = 3;

-- A resist trait's chance is its value plus this many percent.
local TRAIT_BASE = 5;

-- Elemental Seal and Dark Seal each add this much magic accuracy. The rest are buff ids.
local SEAL_BONUS = 256;
local ELEMENTAL_SEAL = 79;
local DARK_SEAL      = 345;
local SOUL_VOICE     = 52;

-- Skill ids the math treats on their own.
local SKILL_DIVINE  = 32;
local SKILL_DARK    = 37;
local SKILL_SINGING = 40;
local SKILL_WIND    = 42;

-- The magic evasion table stops at level 99.
local MAX_LEVEL = 99;

-- Stands in for a missing table, so lookups need no nil checks.
local NONE = {};

-- Magic accuracy from the stat difference, capped at 30 either way (magic_hit_rate.lua).
function magic.stat_bonus(diff)
    local bonus;
    if (diff <= -31) then
        bonus = -20 + (diff + 30) / 4;
    elseif (diff <= -11) then
        bonus = -10 + (diff + 10) / 2;
    elseif (diff < 11) then
        bonus = diff;
    elseif (diff >= 31) then
        bonus = 20 + (diff - 30) / 4;
    else
        bonus = 10 + (diff - 10) / 2;
    end
    return math.max(-30, math.min(30, bonus));
end

-- Hit chance in whole percent from magic accuracy, magic evasion and the level gap.
function magic.hit_percent(accuracy, evasion, level_gap)
    local x = accuracy - evasion + 25;
    if (x < 0) then
        x = math.floor(x / 2);
    end
    x = x - LEVEL_PENALTY * math.max(0, level_gap);
    return math.max(HIT_FLOOR, math.min(HIT_CAP, 50 + x));
end

--[[
    The chance an effect lands at all, in whole percent, from its hit chance `hit` in percent. With
    resist state 1 or 2 it lands unless it misses state + 1 times in a row. A resist trait of value
    `trait` stops it first with trait + 5 percent. Worked in whole numbers so no rounding creeps in.
]]
function magic.land_percent(hit, state, trait)
    local land, scale = 100, 1;
    if (state < ALWAYS_LANDS_STATE) then
        scale = 100 ^ state;
        land  = 100 ^ (state + 1) - (100 - hit) ^ (state + 1);
    end
    if (trait > 0) then
        land  = land * math.max(0, 100 - trait - TRAIT_BASE);
        scale = scale * 100;
    end
    return math.floor(land / scale);
end

local function has(list, name)
    for _, each in ipairs(list or NONE) do
        if (each == name) then
            return true;
        end
    end
    return false;
end

-- The monster's ranks, extra magic evasion or resist traits at one level. The data keeps them on the
-- level when they change with it, and on the row otherwise.
local function at_level(row, stats, name)
    return stats[name] or row[name] or NONE;
end

-- The rank the spell rolls against. An effect with its own rank uses it, anything else its element's.
local function rank_of(ranks, spell, element)
    local rank = ranks[spell.rank or element] or 0;
    return math.max(LOWEST_RANK, math.min(NEVER_RANK, rank));
end

local function accuracy(me, school, spell, element, mob_stat)
    local total = me.skills[school.skill] + spell.bonus + (me.extra_accuracy or 0)
        + magic.stat_bonus(me[spell.stat] - mob_stat)
        + 10 * ((spells.STAFF[me.main_id] or NONE)[element] or 0);

    if (me.buffs[ELEMENTAL_SEAL] and school.skill ~= SKILL_DARK and school.skill ~= SKILL_DIVINE) then
        total = total + SEAL_BONUS;
    end
    if (me.buffs[DARK_SEAL] and school.skill == SKILL_DARK) then
        total = total + SEAL_BONUS;
    end
    if (school.skill == SKILL_SINGING and me.ranged_skill == SKILL_WIND) then
        total = total + math.floor(me.skills[SKILL_WIND] / 2);
    end
    if (spell.soul_voice and me.buffs[SOUL_VOICE]) then
        total = total * 2;
    end
    return math.floor(total);
end

-- The monster's magic evasion against this spell. Effect spells also add the all-status magic evasion
-- and the one for that effect.
local function evasion(level, meva, spell, element, rank)
    local extra = (meva.all or 0) + (meva[element] or 0);
    if (spell.state ~= nil) then
        extra = extra + (meva.status or 0) + (spell.effect and meva[spell.effect] or 0);
    end
    return math.floor((spells.MEVA_BY_LEVEL[math.min(level, MAX_LEVEL)] + extra) * RANK_MULTIPLIER[rank]);
end

-- The spell's chance at one monster level in whole percent. It's the full damage chance for a
-- damage spell and the land chance for an effect.
local function chance_at(me, mob, school, spell, element, level, stats)
    local rank = rank_of(at_level(mob.row, stats, 'ranks'), spell, element);
    local hit = HIT_FLOOR;
    if (rank < FLOOR_RANK) then
        hit = magic.hit_percent(accuracy(me, school, spell, element, stats[spell.stat]),
            evasion(level, at_level(mob.row, stats, 'meva'), spell, element, rank), level - me.level);
    end
    if (spell.state == nil) then
        return hit;
    end
    local resist = at_level(mob.row, stats, 'resist');
    local trait = spell.trait and ((resist[spell.trait] or 0) + (resist.status or 0)) or 0;
    return magic.land_percent(hit, spell.state, trait);
end

-- True when the monster absorbs or nullifies the element, even some of the time.
local function wasted(row, stats, element)
    local absorb, nullify = at_level(row, stats, 'absorb'), at_level(row, stats, 'nullify');
    return (absorb[element] or 0) + (absorb.all or 0) + (nullify[element] or 0) + (nullify.all or 0) > 0;
end

--[[
    The monster's weakest element for the spell. The lowest rank wins, then the best chance. An element
    it absorbs or nullifies only wins when every one of the spell's elements is like that.
]]
local function weakest_element(me, mob, school, spell, level, stats)
    local best, best_rank, best_chance;
    for _, element in ipairs(spell.elements) do
        local rank = rank_of(at_level(mob.row, stats, 'ranks'), spell, element);
        if (wasted(mob.row, stats, element)) then
            rank = rank + WASTED_RANK;
        end
        local chance = chance_at(me, mob, school, spell, element, level, stats);
        if (best == nil or rank < best_rank or (rank == best_rank and chance > best_chance)) then
            best, best_rank, best_chance = element, rank, chance;
        end
    end
    return best;
end

--[[
    One school's result, or nil when it doesn't show. A school doesn't show when you have no skill in
    it, when it's Healing and the monster isn't undead, or when the data has no stats for the
    monster's level.
    Returns { label, low, high, element } for a number, or { label, word } with 'immune' or 'never'.
]]
local function school_readout(me, mob, id, spell_id)
    local school = spells.schools[id];
    if ((me.skills[school.skill] or 0) <= 0 or (school.undead_only and not mob.row.undead)) then
        return nil;
    end

    local spell = spells.find(id, spell_id);
    local first_level, first_stats;
    for level = mob.low, mob.high do
        local stats = mob.row.levels and mob.row.levels[level];
        if (stats ~= nil) then
            first_level, first_stats = level, stats;
            break;
        end
    end
    if (first_stats == nil) then
        return nil;
    end

    local element = spell.element or weakest_element(me, mob, school, spell, first_level, first_stats);
    local out = { label = school.label, element = spell.elements and spells.ELEMENT_NAMES[element] or nil };
    if ((spell.immune and has(mob.row.immune, spell.immune)) or (spell.no_undead and mob.row.undead)) then
        out.word = 'immune';
        return out;
    end
    if (rank_of(at_level(mob.row, first_stats, 'ranks'), spell, element) >= NEVER_RANK) then
        out.word = 'never';
        return out;
    end

    for level = first_level, mob.high do
        local stats = mob.row.levels[level];
        if (stats ~= nil) then
            local chance = chance_at(me, mob, school, spell, element, level, stats);
            out.low  = math.min(out.low or chance, chance);
            out.high = math.max(out.high or chance, chance);
        end
    end
    return out;
end

--[[
    Every school that's turned on and shows for this monster, in print order.
    `me` is player.read() plus extra_accuracy. `mob` is { row, low, high } with a data row and a
    known level range. `setting` is the magic settings block.
]]
function magic.readout(me, mob, setting)
    local out = {};
    if (mob.row == nil or mob.low == nil) then
        return out;
    end
    for _, id in ipairs(spells.SCHOOL_ORDER) do
        local school = setting.schools[id];
        if (school ~= nil and school.on) then
            out[#out + 1] = school_readout(me, mob, id, school.spell);
        end
    end
    return out;
end

return magic;
