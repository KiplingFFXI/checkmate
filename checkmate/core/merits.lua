-- Observed ranks stay separate from the choices used by Checkmate's estimates.
local packets;
local data = require('data.merits');

local merits = {};
local actual, settings, owner = {}, nil, nil;
local detached = true;
local revision = 0;
local choice_settings, choice_fill, choices = nil, nil, {};
local skills, stats = {}, {};
for key, entry in pairs(data.entries) do
    if (entry.kind == 'skill') then skills[entry.skill] = key; end
    if (entry.kind == 'stat') then stats[entry.stat] = key; end
end

local function rank_for(key, rank)
    local entry = data.entries[key];
    if (entry == nil or type(rank) ~= 'number' or rank ~= rank or rank == math.huge
        or rank < 0 or rank ~= math.floor(rank)) then return nil; end
    return math.min(rank, entry.most);
end

local function remember_choices()
    local fill = settings ~= nil and settings.fill_in ~= false;
    local changed = choice_settings ~= settings or choice_fill ~= fill;
    choice_settings, choice_fill = settings, fill;
    for key in pairs(data.entries) do
        local rank = settings and rank_for(key, settings[key]);
        if (choices[key] ~= rank) then changed = true; end
        choices[key] = rank;
    end
    return changed;
end

function merits.configure(s, character)
    local changed = {};
    local pending = detached and character == owner;
    if (character ~= owner) then
        actual = {};
        owner = character;
        revision = revision + 1;
    end
    if (settings ~= (s and s.merits)) then revision = revision + 1; end
    settings = s and s.merits or nil;
    if (pending and settings ~= nil and settings.fill_in ~= false) then
        for key, rank in pairs(actual) do
            if (settings[key] ~= rank) then settings[key], changed[key] = rank, rank; end
        end
    end
    detached = settings == nil;
    remember_choices();
    return changed;
end

function merits.changed()
    if (remember_choices()) then revision = revision + 1; return true; end
    return false;
end

function merits.version()
    return revision;
end

function merits.observed(key)
    return actual[key];
end

function merits.selected(key)
    local chosen = settings and rank_for(key, settings[key]);
    if (chosen ~= nil) then return chosen; end
    return actual[key];
end

local function observe(key, rank, changed)
    rank = rank_for(key, rank);
    if (rank == nil) then return false; end
    local observed_changed = actual[key] ~= rank;
    actual[key] = rank;
    if (settings ~= nil and settings.fill_in ~= false and settings[key] ~= rank) then
        settings[key], changed[key] = rank, rank;
    end
    return observed_changed;
end

function merits.observe(key, rank)
    local changed = {};
    local observed_changed = observe(key, rank, changed);
    if (observed_changed or next(changed) ~= nil) then
        revision = revision + 1;
        remember_choices();
    end
    return changed, observed_changed;
end

-- A partial packet replaces only the ranks it contains. Zero is a known rank.
function merits.on_packet(e)
    local changed, observed_changed = {}, false;
    packets = packets or require('core.packets');
    if (type(e) ~= 'table' or e.id ~= packets.ID.MERITS) then
        return changed, false;
    end
    local counts = packets.merit_counts(e);
    if (counts == nil) then return changed, false; end
    for key, entry in pairs(data.entries) do
        local rank = counts[entry.id];
        if (rank ~= nil and observe(key, rank, changed)) then observed_changed = true; end
    end
    if (observed_changed or next(changed) ~= nil) then
        revision = revision + 1;
        remember_choices();
    end
    return changed, observed_changed;
end

function merits.on_zone(character)
    if (next(actual) ~= nil or owner ~= character) then revision = revision + 1; end
    if (owner ~= character) then settings, detached = nil, true; end
    actual, owner = {}, character;
    remember_choices();
end

function merits.forget()
    actual, settings, owner = {}, nil, nil;
    detached = true;
    revision = revision + 1;
    remember_choices();
end

-- General merits follow your main level, including skills supplied only by your support job.
function merits.effective(key, rank, level, job)
    local entry = data.entries[key];
    if (entry == nil or type(level) ~= 'number') then return nil; end
    if (entry.job ~= nil and (entry.job ~= job or level < (entry.level or 75))) then return 0; end
    local cap = 0;
    for _, row in ipairs(data.level_caps) do
        if (level >= row[1]) then cap = row[2]; else break; end
    end
    if (cap == 0) then return 0; end
    rank = rank_for(key, rank);
    if (rank == nil) then return nil; end
    return math.min(rank, cap) * entry.per_rank;
end

local function adjust(key, total, level, job, maximum)
    if (key == nil or type(total) ~= 'number') then return total; end
    local chosen = merits.selected(key);
    if (chosen == nil) then return total; end
    local after = merits.effective(key, chosen, level, job);
    local before = merits.effective(key, actual[key], level, job);
    if (after == nil or before == nil) then
        return total, 'Your observed ' .. data.entries[key].name
            .. ' merit rank is not known. The current client total is used.', true;
    end
    local delta = after - before;
    if (delta == 0) then return total; end
    -- A capped total cannot tell us how much bonus lies past the cap.
    if ((total <= 0 and delta > 0) or (maximum ~= nil and total >= maximum and delta < 0)) then
        return total, 'The current ' .. data.entries[key].name
            .. ' total is at its limit. Its merit override cannot be calculated.', true;
    end
    local value = math.max(0, total + delta);
    if (maximum ~= nil) then value = math.min(maximum, value); end
    return value, data.entries[key].name .. ' uses your selected merit rank instead of the observed rank.';
end

function merits.adjust_skill(id, total, level, job)
    return adjust(skills[id], total, level, job);
end

function merits.adjust_stat(name, total, level, job)
    return adjust(stats[name], total, level, job, 999);
end

local function qualify(out, input)
    if (out == nil or input == nil) then return; end
    out.notes = out.notes or {};
    local found = false;
    for _, note in ipairs(out.notes) do found = found or note == input.note; end
    if (not found) then out.notes[#out.notes + 1] = input.note; end
    if (input.unavailable) then out.merit_unavailable, out.uncertain = true, true;
    else out.merit_override = true; end
end

-- Each result names only the stat and skills that its calculation uses.
function merits.qualify(out, own, stat, skill, other_skill)
    local inputs = own and own.merit_inputs;
    if (inputs == nil) then return; end
    if (stat ~= nil) then qualify(out, inputs.stats[stat]); end
    if (skill ~= nil) then qualify(out, inputs.skills[skill]); end
    if (other_skill ~= nil) then qualify(out, inputs.skills[other_skill]); end
end

return merits;
