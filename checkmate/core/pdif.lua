-- Ordinary player attacks, using the bundled Phoenix curve and source defense.
local pdif = {};
local data;

local function source()
    data = data or require('data.pdif');
    return data;
end

local function clamp(value, low, high)
    return math.max(low, math.min(high, value));
end

local function round(value)
    return value < 0 and math.ceil(value - 0.5) or math.floor(value + 0.5);
end

-- randomInt includes both rounded endpoints. Reversed bounds return the lower argument.
local function rolls(low, high)
    low, high = round(low * 1000), round(high * 1000);
    return low / 1000, math.max(low, high) / 1000;
end

-- The cap belongs to the working ratio curve, before the melee random factor.
function pdif.bounds(attack, defense, own_level, enemy_level, kind, critical, apply_correction)
    local constants = source();
    local ranged = kind == 'ranged';
    local step = ranged and constants.ranged_level_step or constants.melee_level_step;
    local correction = apply_correction == false and 0
        or clamp(own_level - enemy_level, -constants.max_level_gap, 0) * step;
    local ratio = math.max(1, attack) / math.max(1, defense);
    local cap = (ranged and constants.ranged_cap or constants.melee_cap) + correction;
    local working, low, high, spike;
    if (ranged) then
        working = clamp(ratio + correction, 0, 10);
        if (working < 0.9) then
            low, high = working, working * 10 / 9;
        elseif (working < 1.1) then
            low, high = 1, 1;
        else
            low, high = math.min(working * 20 / 19 - 3 / 19, cap), math.min(working, cap);
        end
        low, high = rolls(low, high);
        low, high = math.max(0, low), math.max(0, high);
        if (critical) then low, high = low * 1.25, high * 1.25; end
    else
        working = ratio + (critical and 1 or 0) + correction;
        cap = constants.melee_cap + (critical and 1 or 0) + correction;
        local upper, lower;
        if (working < 0.5) then upper = working + 0.5;
        elseif (working < 0.7) then upper = 1;
        elseif (working < 1.2) then upper = working + 0.3;
        elseif (working < 1.5) then upper = working + working * 0.25;
        else upper = math.min(working, cap) + 0.375; end
        if (working < 0.38) then lower = 0;
        elseif (working < 1.25) then lower = working * 1176 / 1024 - 448 / 1024;
        elseif (working < 1.51) then lower = 1;
        elseif (working < 2.44) then lower = working * 1176 / 1024 - 775 / 1024;
        else lower = math.min(working, cap) - 0.375; end
        low, high = math.huge, -math.huge;
        for _, floor in ipairs({ 0, 0.5 }) do
            local bound = math.max(upper, floor);
            local first, last = 0, 0;
            if (bound ~= 0) then first, last = rolls(math.max(lower, 0), bound); end
            low, high = math.min(low, first), math.max(high, last * 1.05);
        end
        if (working > 0.5 and working < 1.5) then
            local chance = math.min((0.5 - math.abs(working - 1)) * 1.2, 1 / 3);
            if (chance >= 0.0001) then
                spike = 1 + correction;
                low, high = math.min(low, spike), math.max(high, spike);
            end
        end
    end
    return { low = low, high = high, ratio = ratio, corrected_ratio = working, cap = cap,
        correction = correction, spike = spike };
end

local function note(out, value)
    out.notes[#out.notes + 1] = value;
end

local function widen(out, key, value)
    local low, high = key .. '_low', key .. '_high';
    out[low] = out[low] == nil and value or math.min(out[low], value);
    out[high] = out[high] == nil and value or math.max(out[high], value);
end

function pdif.readout(own, mob, kind, reason)
    local out = { notes = {}, uncertain = true };
    local attack_key = kind == 'offhand' and 'offhand_attack' or kind == 'ranged' and 'ranged_attack' or 'attack';
    local attack = own and own[attack_key];
    out.attack, out.observed_at = attack, own and own.observed_at;
    if (type(attack) ~= 'number' or attack <= 0 or attack >= math.huge) then
        local why = reason or (own and own.reason);
        if (why == nil or (type(why) == 'string' and (why:find('Check again.', 1, true)
            or why:find('fresh attack reading.', 1, true)))) then
            out.status = 'check_again';
        end
        note(out, why or 'Attack is unknown. Check a monster for a fresh attack reading.');
        return out;
    end
    if (own.level == nil or mob.low == nil or mob.high == nil or mob.row == nil) then
        note(out, 'The monster level or source defense is unknown.');
        return out;
    end
    local constants = source();
    local levels, found = mob.row.levels or {}, false;
    for level = mob.low, mob.high do
        local stats = levels[level];
        if (stats ~= nil) then
            if (type(stats.def) ~= 'number' or stats.def <= 0) then
                note(out, 'Source defense is missing for one of the possible monster levels.');
                return out;
            end
            found = true;
        end
    end
    if (not found) then
        note(out, 'Source defense is not available for this monster level.');
        return out;
    end
    local correction = true;
    if (kind == 'ranged') then
        for id in pairs(constants.ignore_ranged_level_effects or {}) do
            if (own.buffs and own.buffs[id]) then correction = false; end
        end
    end
    for level = mob.low, mob.high do
        local stats = levels[level];
        if (stats ~= nil) then
            local unknown_correction = correction and level > own.level
                and not (constants.level_corrected_zones or {})[own.zone];
            if (unknown_correction) then out.correction_unknown = true; end
            for variant = 1, unknown_correction and 2 or 1 do
                local value = pdif.bounds(attack, stats.def, own.level, level, kind, false,
                    correction and variant == 1);
                out.low = out.low == nil and value.low or math.min(out.low, value.low);
                out.high = out.high == nil and value.high or math.max(out.high, value.high);
                widen(out, 'ratio', value.ratio);
                widen(out, 'corrected_ratio', value.corrected_ratio);
                widen(out, 'cap', value.cap);
            end
            widen(out, 'defense', stats.def);
        end
    end
    note(out, 'Normal noncritical attacks only. This is a possible multiplier range, not an average or final damage.');
    note(out, 'Attack comes from the last matching reply. Unseen buff potency changes can make that reading stale.');
    note(out, 'Defense is the bundled spawn baseline. Unseen effects and fight changes can alter it.');
    if (out.correction_unknown) then
        note(out, 'This zone can disable level correction. The server setting is unknown, so both possibilities are included.');
    end
    if (kind ~= 'ranged') then
        note(out, 'The curve cap is applied before the melee random factor.');
    end
    note(out, 'Damage-limit bonuses and special attack modifiers are not included.');
    if (kind == 'ranged') then
        note(out, 'Ranged values are before distance penalties. They do not describe a shot at your current distance.');
    end
    out.scripted = mob.row.flags ~= nil and mob.row.flags.scripted_defense == true;
    if (out.scripted) then note(out, 'The monster script can change its defense during the fight.'); end
    local seen = {};
    for _, effect in ipairs(mob.effects or {}) do
        local name = (constants.defense_effects or {})[effect.effect];
        if (name ~= nil and not seen[name]) then
            seen[name] = true;
            note(out, name .. ' was seen. Its defense change and exact end are unknown.');
        end
    end
    return out;
end

return pdif;
