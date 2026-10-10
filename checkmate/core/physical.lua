--[[
    Works out hit, evade and crit for you and your pet over the monster's possible levels.
    Hit rate follows physical_hit_rate.lua, including its rounding and Phoenix's 20-95% limits.
    Ranged goes down to 5% and shows the sweet-spot and 25-yalm estimates.

    Crit follows battleutils.cpp GetCritHitRate. TP moves can use different rules.
    Known stats come from the monster data. Missing stats use the typical ranges in data/bands.lua.
    Observed effects with unknown power leave a note on the numbers they can change.
]]

local bands     = require('data.bands');
local crit_data = require('data.crit');
local modifiers = require('core.modifiers');

local physical = {};

-- The typical values for each level, from the rows in data\bands.lua.
local BANDS = {};
for _, row in ipairs(bands.rows) do
    BANDS[row[1]] = {
        acc_low = row[2], acc_high = row[3], eva_low = row[4], eva_high = row[5], agi_low = row[6], agi_high = row[7],
        dex_low = row[8], dex_high = row[9],
    };
end

-- Hit rate limits, as the fraction the server keeps, and the cap in percent. Ranged attacks have a lower
-- floor.
local HIT_FLOOR    = 0.20;
local RANGED_FLOOR = 0.05;
local HIT_CAP      = 0.95;
local HIT_CAP_PERCENT = 95;

-- Each level a monster has over you is worth this much accuracy.
local ACCURACY_PER_LEVEL = 4;

-- Signet counts your evasion as this much higher. SIGNET is its buff id.
local SIGNET_EVASION = 1.25;
local SIGNET = 253;

-- Critical hit rate before DEX, merits and gear.
local BASE_CRIT = 5;

-- Crit chances stay between these.
local CRIT_FLOOR, CRIT_CAP = 0, 100;

-- The two crit merits from data\crit.lua, by the same keys as your merit settings, each with its id in the merit
-- list the server sends, what one is worth in percent and the most Phoenix allows.
physical.MERITS = crit_data.merits;

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

-- Hit rate in whole percent, worked out the way the server does it. `floor` is the lowest it goes, 0.20
-- unless it's given.
function physical.hit_percent(accuracy, evasion, floor)
    local rate = (75 + (accuracy - evasion) / 2) / 100;
    rate = math.max(floor or HIT_FLOOR, math.min(HIT_CAP, rate));
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

-- Merits as a whole number from 0 to `most`, so a hand-edited 9 is `most` and -1 or 'x' is 0.
function physical.clamp_merits(count, most)
    return math.max(0, math.min(most, math.floor(tonumber(count) or 0)));
end

-- How many of your `count` merits count at main level `level`. The server caps them by the level (merit.cpp
-- GetMeritValue).
function physical.merits_that_count(count, level)
    local cap = 0;
    for _, step in ipairs(crit_data.level_caps) do
        if (level >= step[1]) then
            cap = step[2];
        end
    end
    return math.min(count or 0, cap);
end

-- What your `count` merits of `name`, like 'crit_hit_rate', are worth at main level `level`, in percent.
function physical.merit_bonus(name, count, level)
    return crit_data.merits[name].per_merit * physical.merits_that_count(count, level);
end

-- The critical hit evasion on `items`, the ids of the gear you have on. A piece counts once your main level
-- reaches its own.
function physical.crit_evasion(items, level)
    local total = 0;
    for _, id in ipairs(items) do
        local item = crit_data.evasion_items[id];
        if (item ~= nil and level >= item.level) then
            total = total + item.crit_evasion;
        end
    end
    return total;
end

-- The lowest main level where `most` merits all count.
function physical.all_merits_level(most)
    for _, step in ipairs(crit_data.level_caps) do
        if (step[2] >= most) then
            return step[1];
        end
    end
    return nil;
end

-- How many of `most` merits count from which level, like "none under 10, 1 from 10, 2 from 20, 3 from 30 and all
-- 4 from 40", for the tips.
function physical.merit_steps_text(most)
    local steps, counted = {}, 0;
    for _, step in ipairs(crit_data.level_caps) do
        local level, cap = step[1], math.min(step[2], most);
        if (cap > counted) then
            if (counted == 0 and level > 0) then
                steps[#steps + 1] = ('none under %d'):format(level);
            end
            steps[#steps + 1] = ((cap == most) and 'all %d from %d' or '%d from %d'):format(cap, level);
            counted = cap;
        end
    end
    if (#steps < 2) then
        return steps[1] or '';
    end
    return table.concat(steps, ', ', 1, #steps - 1) .. ' and ' .. steps[#steps];
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

--[[
    The /check range for your hit rate after the accuracy you lose to each level the monster has over you.
    The reading is about your main hand's accuracy, so for another accuracy it moves by `offset`, that
    accuracy less your main hand's. `floor` is the lowest the hit rate goes.
]]
local function check_range(reading, gap, offset, floor)
    local edges = CHECK_EDGES[reading];
    if (edges == nil) then
        return nil;
    end
    local shift = ACCURACY_PER_LEVEL * gap - offset;
    local low, high = math.floor(floor * 100), HIT_CAP_PERCENT;
    if (edges.low ~= nil) then
        low = physical.hit_percent(edges.low - shift, 0, floor);
    end
    if (edges.high ~= nil) then
        high = physical.hit_percent(edges.high - shift, 0, floor);
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

-- Your hit rate with `accuracy`, which goes as low as `floor`. Without your accuracy it's unknown. Without
-- monster numbers the /check range is all there is.
local function hit_at(me, accuracy, floor, mob, gap, stats, band)
    if (accuracy == nil or me.accuracy == nil) then
        return nil;
    end
    local check_low, check_high = check_range(mob.reading, gap, accuracy - me.accuracy, floor);
    if (stats == nil and band == nil) then
        return check_low, check_high;
    end
    accuracy = accuracy - ACCURACY_PER_LEVEL * gap;
    if (stats ~= nil) then
        local hit = physical.hit_percent(accuracy, stats.eva, floor);
        return hit, hit;
    end
    return within_check(physical.hit_percent(accuracy, band.eva_high, floor),
        physical.hit_percent(accuracy, band.eva_low, floor), check_low, check_high);
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

-- Your crit at one level. `bonus` is what your merits add.
local function crit_at(me, stats, band, bonus)
    if (me.buffs[modifiers.buffs.mighty_strikes]) then return 100, 100; end
    if (stats ~= nil) then
        local crit = physical.crit_percent(me.dex, stats.agi) + bonus;
        return crit, crit;
    end
    if (band ~= nil) then
        return physical.crit_percent(me.dex, band.agi_high) + bonus,
            physical.crit_percent(me.dex, band.agi_low) + bonus;
    end
    return nil;
end

-- How often its hits on you crit at one level, before the clamp. `cut` is what your merits and gear
-- take off.
local function crit_taken_at(me, row, stats, band, cut)
    if (me.agi == nil) then
        return nil;
    end
    local own = (row and row.crit or 0) - cut;
    if (stats ~= nil) then
        if (stats.dex == nil) then
            return nil;
        end
        local taken = physical.crit_percent(stats.dex, me.agi) + own;
        return taken, taken;
    end
    if (band ~= nil and band.dex_low ~= nil) then
        return physical.crit_percent(band.dex_low, me.agi) + own, physical.crit_percent(band.dex_high, me.agi) + own;
    end
    return nil;
end

local function clamp_crit(value)
    return math.max(CRIT_FLOOR, math.min(CRIT_CAP, value));
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

-- True when `levels` has numbers for any level from low to high.
local function any_known(levels, low, high)
    local known = false;
    for level = low, high do
        known = known or levels[level] ~= nil;
    end
    return known;
end

-- Keep the estimate and explain which effect can change it.
local function uncertain(range, notes)
    if (range == nil or notes == nil or #notes == 0) then return; end
    range.uncertain, range.notes = true, range.notes or {};
    for _, note in ipairs(notes) do range.notes[#range.notes + 1] = note; end
end

local PARAMETER_CONDITION_NOTE = 'HP or TP changed since the request. Conditional equipment bonuses may differ from this stat reading.';
local PARAMETER_PARTS = { 'hit', 'offhand', 'ranged', 'ranged_far', 'evade' };

function physical.qualify_parameters(out)
    for _, key in ipairs(PARAMETER_PARTS) do
        local value = out[key];
        if (value ~= nil) then
            value.uncertain, value.notes = true, value.notes or {};
            local found = false;
            for _, note in ipairs(value.notes) do found = found or note == PARAMETER_CONDITION_NOTE; end
            if (not found) then value.notes[#value.notes + 1] = PARAMETER_CONDITION_NOTE; end
        end
    end
end

local function confidence(out, me, mob, enemy)
    local own_mighty = me.buffs[modifiers.buffs.mighty_strikes];
    if (own_mighty) then out.crit = { low = 100, high = 100 }; end
    if (enemy.mighty_strikes) then
        out.crittaken = { low = 100, high = 100, uncertain = true,
            notes = { 'Mighty Strikes was seen. Every hit is critical while it lasts. Its end is estimated.' } };
    end
    for _, key in ipairs({ 'hit', 'offhand', 'ranged', 'ranged_far' }) do uncertain(out[key], enemy.hit); end
    uncertain(out.evade, enemy.evade);
    if (not own_mighty) then
        uncertain(out.crit, enemy.crit);
        uncertain(out.crit, me.modifiers and me.modifiers.crit_notes);
    end
    if (not enemy.mighty_strikes) then uncertain(out.crittaken, enemy.crittaken); end
    if (me.buffs[modifiers.buffs.flash]) then
        local notes = { 'Flash lowers accuracy outside /checkparam. Its remaining power is unknown, so this is a range.' };
        for _, key in ipairs({ 'hit', 'offhand', 'ranged', 'ranged_far' }) do
            local range = out[key];
            if (range ~= nil) then
                range.low = (key == 'ranged' or key == 'ranged_far') and 5 or 20;
                uncertain(range, notes);
            end
        end
    end
    if (enemy.evade ~= nil) then
        for _, effect in ipairs(mob.effects or {}) do
            if (effect.effect == modifiers.buffs.flash and out.evade ~= nil) then out.evade.high = 80; end
        end
    end
end

--[[
    Works out the readout over every level the monster can be.
    `me` is player.read() plus accuracy, evasion, offhand_accuracy and ranged_accuracy from /checkparam
    (nil when unknown), crit_merits and enemy_crit_merits, your merit settings, and crit_evasion, the
    critical hit evasion on your gear. A missing merit or crit_evasion counts as 0.
    `mob` is { row, low, high, con, reading } where low..high is its true level, con the /check con
    and reading the /check evasion reading (both nil when it can't be gauged).
    Returns { hit, offhand, ranged, ranged_far, evade, crit, crittaken, signet, tp_moves, no_swings, counters },
    each number as { low, high } or nil when unknown. ranged is your ranged hit rate in the sweet spot and
    ranged_far the one at 25 yalms. crittaken is how often its hits on you crit. tp_moves is true for a monster that swings with nothing but TP moves, and no_swings for one that never swings, so
    crittaken isn't their number. counters is true when such a monster can counter, since its counters crit
    like a normal swing.
]]
function physical.readout(me, mob)
    local out = { signet = false, tp_moves = mob.row ~= nil and mob.row.tp_moves == true,
        no_swings = mob.row ~= nil and mob.row.no_swings == true,
        counters = mob.row ~= nil and mob.row.counters == true };
    local enemy = modifiers.enemy(mob);
    if (mob.low == nil) then
        confidence(out, me, mob, enemy);
        return out;
    end

    -- At 25 yalms you lose half your level in ranged accuracy.
    local far_accuracy = me.ranged_accuracy and me.ranged_accuracy - math.floor(me.level / 2);

    -- A monster with numbers for some of these levels is only ever one of them, like an Assault
    -- monster under its four level caps. The typical values stand in only when it has none.
    local levels = mob.row and mob.row.levels or {};
    local known = any_known(levels, mob.low, mob.high);
    local crit_bonus = physical.merit_bonus('crit_hit_rate', me.crit_merits, me.level)
        + (me.modifiers and me.modifiers.crit or 0);
    local taken_cut = physical.merit_bonus('enemy_crit_rate', me.enemy_crit_merits, me.level) + (me.crit_evasion or 0);

    for level = mob.low, mob.high do
        local stats = levels[level];
        if (stats ~= nil or not known) then
            local gap = math.max(0, level - me.level);
            local band = (stats == nil) and BANDS[level] or nil;
            local signet = signet_applies(me, mob, level);

            out.hit   = widen(out.hit, hit_at(me, me.accuracy, HIT_FLOOR, mob, gap, stats, band));
            out.offhand = widen(out.offhand, hit_at(me, me.offhand_accuracy, HIT_FLOOR, mob, gap, stats, band));
            out.ranged  = widen(out.ranged, hit_at(me, me.ranged_accuracy, RANGED_FLOOR, mob, gap, stats, band));
            out.ranged_far = widen(out.ranged_far, hit_at(me, far_accuracy, RANGED_FLOOR, mob, gap, stats, band));
            out.evade = widen(out.evade, evade_at(me, gap, stats, band, signet));
            out.crit  = widen(out.crit, crit_at(me, stats, band, crit_bonus));
            out.crittaken = widen(out.crittaken, crit_taken_at(me, mob.row, stats, band, taken_cut));
            out.signet = out.signet or (signet and out.evade ~= nil);
        end
    end

    -- It's kept from 0 to 100.
    local taken = out.crittaken;
    if (taken ~= nil) then
        taken.low, taken.high = clamp_crit(taken.low), clamp_crit(taken.high);
    end
    if (out.crit ~= nil) then
        out.crit.low, out.crit.high = clamp_crit(out.crit.low), clamp_crit(out.crit.high);
    end
    confidence(out, me, mob, enemy);
    return out;
end

--[[
    Your pet's accuracy and evasion at `level`, as { acc_low, acc_high, eva_low, eva_high }. A jug pet,
    wyvern or automaton has the ones from its /checkparam reply, nil when they didn't come back. A
    charmed monster has its own row's at that level, or the typical values when the row has none there.
]]
local function pet_numbers(pet, level)
    if (pet.kind ~= 'charmed') then
        return { acc_low = pet.accuracy, acc_high = pet.accuracy, eva_low = pet.evasion, eva_high = pet.evasion };
    end
    local stats = pet.row and pet.row.levels and pet.row.levels[level];
    if (stats ~= nil) then
        return { acc_low = stats.acc, acc_high = stats.acc, eva_low = stats.eva, eva_high = stats.eva };
    end
    return BANDS[level] or {};
end

-- How often your pet hits the monster. `over` is how many levels your pet has over it.
local function pet_hit_at(own, over, stats, band)
    if (own.acc_low == nil or (stats == nil and band == nil)) then
        return nil;
    end
    local bonus = ACCURACY_PER_LEVEL * math.max(0, over);
    local eva_low  = stats and stats.eva or band.eva_low;
    local eva_high = stats and stats.eva or band.eva_high;
    return physical.hit_percent(own.acc_low + bonus, eva_high), physical.hit_percent(own.acc_high + bonus, eva_low);
end

-- How often the monster misses your pet. `over` is how many levels the monster has over it.
local function pet_evade_at(own, over, stats, band)
    if (own.eva_low == nil or (stats == nil and band == nil)) then
        return nil;
    end
    local bonus = ACCURACY_PER_LEVEL * math.max(0, over);
    local acc_low  = stats and stats.acc or band.acc_low;
    local acc_high = stats and stats.acc or band.acc_high;
    return 100 - physical.hit_percent(acc_high + bonus, own.eva_low),
        100 - physical.hit_percent(acc_low + bonus, own.eva_high);
end

--[[
    Works out the pet part over every level the monster can be and every level your pet can be.
    `pet` is what pet.find returns, with pet.accuracy and pet.evasion from its /checkparam reply (nil
    when unknown, or for a charmed monster), and `mob` the same as for physical.readout.
    Returns { name, low, high, hit, evade }, with low..high your pet's level and each number as
    { low, high } or nil when unknown.
]]
function physical.pet_readout(pet, mob)
    local out = { name = pet.name, low = pet.low, high = pet.high };
    if (mob.low == nil or pet.low == nil) then
        return out;
    end

    local levels = mob.row and mob.row.levels or {};
    local known = any_known(levels, mob.low, mob.high);

    for level = mob.low, mob.high do
        local stats = levels[level];
        if (stats ~= nil or not known) then
            local band = (stats == nil) and BANDS[level] or nil;
            for own_level = pet.low, pet.high do
                local own = pet_numbers(pet, own_level);
                out.hit   = widen(out.hit, pet_hit_at(own, own_level - level, stats, band));
                out.evade = widen(out.evade, pet_evade_at(own, level - own_level, stats, band));
            end
        end
    end
    local enemy = modifiers.enemy(mob);
    uncertain(out.hit, enemy.hit);
    uncertain(out.evade, enemy.evade);
    for _, effect in ipairs(mob.effects or {}) do
        if (effect.effect == modifiers.buffs.flash and out.evade ~= nil) then out.evade.high = 80; end
    end
    return out;
end

return physical;
