--[[
    Works out the selected spell's chance for each magic school.
    Phoenix uses magic_hit_rate.lua for the accuracy roll and status_effect_tables.lua for retries.
    Damage spells show the full-damage chance. Effect spells show the chance to land at all.

    Client stats and skills already include their gear bonuses. Direct accuracy, staff bonuses,
    known merits and supported buffs are added separately. Manual mode keeps the older total.
    Monster levels and resistance ranks come from the data. Unknown inputs are named in the tips.
]]

local spells = require('data.spells');
local modifiers = require('core.modifiers');

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
local SCHOOL_BY_SKILL = { [32] = 'divine', [33] = 'healing', [35] = 'enfeebling', [36] = 'elemental',
    [37] = 'dark', [39] = 'ninjutsu', [40] = 'singing', [43] = 'blue' };

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

local function accuracy(me, school, spell, element, mob_stat, known_inputs)
    local staff = known_inputs ~= false and me.modifiers and me.modifiers.staff_accuracy;
    local total = me.skills[school.skill] + spell.bonus + (me.extra_accuracy or 0)
        + modifiers.magic_accuracy(me, SCHOOL_BY_SKILL[school.skill], element, known_inputs)
        + magic.stat_bonus(me[spell.stat] - mob_stat)
        + (staff and (staff[element] or 0) or 10 * ((spells.STAFF[me.main_id] or NONE)[element] or 0));

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
local function chance_at(me, mob, school, spell, element, level, stats, known_inputs)
    local rank = rank_of(at_level(mob.row, stats, 'ranks'), spell, element);
    local hit = HIT_FLOOR;
    if (rank < FLOOR_RANK) then
        hit = magic.hit_percent(accuracy(me, school, spell, element, stats[spell.stat], known_inputs),
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
local function weakest_element(me, mob, school, spell, level, stats, known_inputs)
    local best, best_rank, best_chance;
    for _, element in ipairs(spell.elements) do
        local rank = rank_of(at_level(mob.row, stats, 'ranks'), spell, element);
        if (wasted(mob.row, stats, element)) then
            rank = rank + WASTED_RANK;
        end
        local chance = chance_at(me, mob, school, spell, element, level, stats, known_inputs);
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
    Returns { school, low, high, element } for a number, or { school, word } with 'magic_immune' or
    'magic_never'. `school` and `word` are keys in core\wording.lua, and `element` is the element's name in
    core\elements.lua, like 'ice', for a school that picks one.
]]
local function school_readout(me, mob, id, spell_id, known_inputs)
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

    local element = spell.element or weakest_element(me, mob, school, spell, first_level, first_stats, known_inputs);
    local out = { school = 'school_' .. id, element = spell.elements and element or nil,
        spell = spell.name, semantics = spell.state ~= nil and 'land' or 'full' };
    if ((spell.immune and has(mob.row.immune, spell.immune)) or (spell.no_undead and mob.row.undead)) then
        out.word = 'magic_immune';
        return out;
    end
    if (rank_of(at_level(mob.row, first_stats, 'ranks'), spell, element) >= NEVER_RANK) then
        out.word = 'magic_never';
        return out;
    end

    for level = first_level, mob.high do
        local stats = mob.row.levels[level];
        if (stats ~= nil) then
            local chance = chance_at(me, mob, school, spell, element, level, stats, known_inputs);
            out.low  = math.min(out.low or chance, chance);
            out.high = math.max(out.high or chance, chance);
        end
    end
    local bonus, notes, uncertain = modifiers.magic_bonus(me, id, element, known_inputs);
    out.notes, out.uncertain = notes, uncertain;
    if (known_inputs ~= false) then
        notes[#notes + 1] = ('Known gear and merits add %+d magic accuracy. Your extra %+d is added too.')
            :format(bonus, me.extra_accuracy or 0);
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
    local enemy;
    for _, id in ipairs(spells.SCHOOL_ORDER) do
        local school = setting.schools[id];
        if (school ~= nil and school.on) then
            local result = school_readout(me, mob, id, school.spell, setting.known_inputs);
            if (result ~= nil and result.notes ~= nil) then
                enemy = enemy or modifiers.enemy(mob);
                for _, note in ipairs(enemy.magic or NONE) do
                    result.notes[#result.notes + 1], result.uncertain = note, true;
                end
                result.notes[#result.notes + 1] = 'This is a normal cast. Weather, magic bursts and other hidden bonuses are left out.';
            end
            out[#out + 1] = result;
        end
    end
    return out;
end

return magic;
