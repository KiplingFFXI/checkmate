-- Gear and merit bonuses missing from the client's stat and skill totals.
-- Unknown conditions and effect powers get a note instead of an assumed bonus.
local player  = require('core.player');
local packets = require('core.packets');
local data    = require('data.modifiers');

local modifiers = {};
local ranks, revision = {}, 0;
local NONE = {};
local ELEMENTS = { 'fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark' };

local function append(list, text)
    for _, each in ipairs(list) do if (each == text) then return; end end
    list[#list + 1] = text;
end

function modifiers.on_merits(e)
    if (type(e.data) ~= 'string' or #e.data < 8) then return; end
    for key, merit in pairs(data.merits) do
        local rank = packets.merit_count(e, merit.id);
        if (rank ~= nil) then
            rank = math.max(0, math.min(merit.most, rank));
            if (ranks[key] ~= rank) then ranks[key], revision = rank, revision + 1; end
        end
    end
end

function modifiers.forget()
    ranks, revision = {}, revision + 1;
end

function modifiers.version()
    return revision;
end

-- Read once per readout. player.read already includes stat and skill bonuses from gear.
-- magic.lua adds staff bonuses and seals.
function modifiers.read(me)
    local out = { crit = 0, magic_accuracy = 0, elemental_accuracy = {}, staff_accuracy = {}, magic_merits = {},
        unknown_merits = {}, weather = {}, items = {}, notes = {}, crit_notes = {}, magic_notes = {} };
    for slot = 0, 15 do
        local id = player.equipped(slot);
        local item = id and data.items[id];
        if (item ~= nil and me.level >= item.level) then
            out.crit = out.crit + (item.crit or 0) + ((slot == 0) and (item.weapon_crit or 0) or 0);
            out.magic_accuracy = out.magic_accuracy + (item.magic_accuracy or 0);
            for _, element in ipairs(ELEMENTS) do
                out.elemental_accuracy[element] = (out.elemental_accuracy[element] or 0) + (item[element] or 0);
                out.staff_accuracy[element] = (out.staff_accuracy[element] or 0) + 10 * (item['staff_' .. element] or 0);
                if (item['weather_' .. element]) then out.weather[element] = true; end
            end
            if (item.weather_all) then out.weather.all = true; end
            out.items[#out.items + 1] = { id = id, slot = slot, name = item.name,
                crit = (item.crit or 0) + ((slot == 0) and (item.weapon_crit or 0) or 0),
                magic_accuracy = item.magic_accuracy or 0 };
            if (item.conditional_crit) then
                append(out.crit_notes, 'A conditional critical-rate bonus on your gear is not counted.');
            end
            if (item.conditional_magic) then
                append(out.magic_notes, 'A conditional magic-accuracy bonus on your gear is not counted.');
            end
        end
    end
    local buffs = me.buffs or NONE;
    for id in pairs(buffs) do
        local effect = data.effects[id];
        if (effect ~= nil) then
            if (effect.own_crit and id ~= data.buffs.mighty_strikes) then
                append(out.crit_notes, 'The critical-rate power of ' .. effect.name .. ' is not known.');
            end
            if (effect.own_magic) then
                append(out.magic_notes, 'The magic-accuracy power of ' .. effect.name .. ' is not known.');
            end
        end
    end
    if (buffs[data.buffs.food]) then
        append(out.magic_notes, 'Food may add direct magic accuracy that the client does not report.');
    end
    if (buffs[data.buffs.sneak_attack] or buffs[data.buffs.trick_attack]) then
        append(out.crit_notes, 'Sneak Attack and Trick Attack need their position and job conditions.');
    end
    local job = me.main_job or player.main_job();
    for key, merit in pairs(data.merits) do
        if (job == merit.job and me.level >= merit.level
            and (key ~= 'troubadour' or buffs[data.buffs.troubadour])) then
            local rank, school = ranks[key], merit.school;
            if (rank == nil) then
                out.unknown_merits[school] = true;
            else
                local bonus = rank * merit.per_rank;
                if (key == 'troubadour') then
                    -- This is the server formula with the merged era merit value, not the retail value.
                    bonus = 64 * (bonus / 25 - 1);
                end
                out.magic_merits[school] = (out.magic_merits[school] or 0) + bonus;
            end
        end
    end
    out.crit_uncertain, out.magic_uncertain = #out.crit_notes > 0, #out.magic_notes > 0;
    for _, note in ipairs(out.crit_notes) do append(out.notes, note); end
    for _, note in ipairs(out.magic_notes) do append(out.notes, note); end
    if (next(out.unknown_merits) ~= nil) then append(out.notes, 'Some magic-accuracy merit ranks are not known yet.'); end
    return out;
end

-- Manual mode replaces these bonuses so gear is not counted twice.
function modifiers.magic_accuracy(me, school, element, known_inputs)
    local inputs = me.modifiers;
    if (known_inputs == false or inputs == nil) then return 0; end
    local merits = inputs.magic_merits;
    return inputs.magic_accuracy + (inputs.elemental_accuracy[element] or 0)
        + (merits.all or 0) + (merits[school] or 0) + (merits[element] or 0);
end

function modifiers.magic_bonus(me, school, element, known_inputs)
    local inputs, notes = me.modifiers, {};
    if (known_inputs == false) then
        notes[1] = 'Direct magic accuracy uses your manual total. Automatic gear and merits are off.';
        return 0, notes, false;
    end
    if (inputs == nil) then return 0, notes, false; end
    local unknown = inputs.unknown_merits;
    local bonus = modifiers.magic_accuracy(me, school, element, known_inputs) + (inputs.staff_accuracy[element] or 0);
    for _, note in ipairs(inputs.magic_notes) do append(notes, note); end
    if (inputs.weather.all or inputs.weather[element]) then
        append(notes, 'Your weather gear can change this chance. Current weather is not counted.');
    end
    if (unknown.all or unknown[school] or unknown[element]) then
        append(notes, 'The magic-accuracy merits for this spell are not known yet, so they are left out.');
    end
    return bonus, notes, #notes > 0;
end

-- Seeing an effect does not tell us its power or exact end. Mark the numbers it can change.
function modifiers.enemy(mob)
    local out = { notes = {} };
    for _, entry in ipairs(mob.effects or NONE) do
        local effect = data.effects[entry.effect];
        if (entry.effect == data.buffs.mighty_strikes) then out.mighty_strikes = true; end
        if (effect ~= nil) then
            for _, key in ipairs({ 'hit', 'evade', 'crit', 'crittaken', 'magic' }) do
                if (effect[key]) then
                    out[key] = out[key] or {};
                    local note = effect.name .. ' was seen. It may change this number, but its power and exact end are unknown.';
                    append(out[key], note);
                    append(out.notes, note);
                end
            end
        end
    end
    return out;
end

modifiers.buffs = data.buffs;
return modifiers;
