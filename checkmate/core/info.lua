-- Source facts for the selected monster. Hidden fight state stays unknown.
local player = require('core.player');
local dangers = require('core.dangers');
local lessons = require('core.lessons');
local info = {};
info.ORDER = { 'family', 'charm', 'vitals', 'movement', 'pursuit', 'spawn', 'claim', 'dangers', 'blue', 'fight',
    'traits', 'crystal', 'rewards' };
info.LABELS = { family = 'Family', charm = 'Charm', vitals = 'HP and MP', movement = 'Movement', pursuit = 'Pursuit',
    spawn = 'Spawn', claim = 'Claim shield', dangers = 'Dangers', blue = 'Blue Magic', fight = 'Fight rules',
    traits = 'Traits', crystal = 'Crystal', rewards = 'Rewards' };
local NONE = {};
local OBSERVATION_NOTE = 'Move seen means checkmate observed this monster finish using it. Not observed can include moves used out of view. '
    .. 'Move use unknown means the monster or move mapping could not be read. None of these establishes learning eligibility.';

local function lesson_value(spells, index, seen, fallback)
    local values, moves = {}, {};
    for _, spell in ipairs(spells) do
        local state = spell.state;
        if (seen) then
            local used = lessons.spell_seen(index, spell.skill_ids);
            local observed = used == true and 'move seen' or (used == false and 'not observed' or 'move use unknown');
            moves[#values + 1] = observed;
            state = state .. ', ' .. observed;
        end
        values[#values + 1] = spell.name .. ' (' .. state .. ')';
    end
    return #values > 0 and table.concat(values, ', ') or fallback, moves;
end

local function finite(value)
    return type(value) == 'number' and value == value and math.abs(value) < math.huge;
end

local function amount(value)
    local text = ('%.0f'):format(value);
    local sign, digits = text:match('^(%-?)(%d+)$');
    return sign .. digits:reverse():gsub('(%d%d%d)', '%1,'):reverse():gsub('^,', '');
end

-- The caller already narrowed the range to this spawn and any observed level.
local function value_range(values, low, high)
    if (type(values) ~= 'table') then return nil; end
    if (low ~= nil and low == high) then
        local value = values[low];
        if (finite(value) and value >= 0) then return value, value; end
        return nil;
    end
    if (low ~= nil and high ~= nil) then
        for level = low, high do
            if (not finite(values[level]) or values[level] < 0) then return nil; end
        end
    end
    local first, last;
    for level, value in pairs(values) do
        if (type(level) == 'number' and (low == nil or level >= low) and (high == nil or level <= high)
            and finite(value) and value >= 0) then
            first = first == nil and value or math.min(first, value);
            last = last == nil and value or math.max(last, value);
        end
    end
    return first, last;
end

local function range_text(low, high)
    return low == high and amount(low) or (amount(low) .. '-' .. amount(high));
end

local function vitals(entry, low, high, notes)
    local values = {};
    local hp_low, hp_high = value_range(entry.hp, low, high);
    local mp_low, mp_high = value_range(entry.mp, low, high);
    if (hp_low ~= nil) then
        values[#values + 1] = 'HP ~' .. range_text(hp_low, hp_high);
    elseif (entry.hp ~= nil or entry.hp_unknown) then
        values[#values + 1] = 'HP unknown';
    end
    if (mp_low ~= nil) then
        values[#values + 1] = mp_high == 0 and 'No MP in source' or ('MP ~' .. range_text(mp_low, mp_high));
    elseif (entry.mp ~= nil or entry.mp_unknown) then
        values[#values + 1] = 'MP unknown';
    end
    if (#values == 0) then return entry.value; end
    notes[#notes + 1] = 'These are source maximums, not current HP or MP. Fight scaling and scripts can change them.';
    if (mp_high ~= nil and mp_high > 0) then
        notes[#notes + 1] = 'Having MP in the source does not mean any remains or that Aspir will land.';
    end
    return table.concat(values, ', ');
end

local function blue_requirements(spell, inputs, notes)
    if (type(spell.min_skill) == 'number') then
        local skill = inputs.skill;
        notes[#notes + 1] = ('%s needs Blue Magic skill %d. %s'):format(spell.name, spell.min_skill,
            skill == nil and 'Your skill is unknown.'
                or ('Your skill at this reading: %d (%s).'):format(skill, skill >= spell.min_skill and 'enough' or 'too low'));
    else
        notes[#notes + 1] = spell.name .. ': the required Blue Magic skill is unknown.';
    end
end

local function blue(entry, notes, options, index)
    if (type(entry.spells) ~= 'table' or #entry.spells == 0) then return entry.value; end
    options = options or NONE;
    if (options.requirements == true) then
        for _, line in ipairs(entry.requirements or NONE) do notes[#notes + 1] = line; end
    end
    local values, unknown = {}, false;
    local inputs;
    for _, spell in ipairs(entry.spells) do
        if (type(spell.name) == 'string' and type(spell.id) == 'number') then
            local known = player.knows_spell(spell.id);
            local state = known == nil and 'spellbook unknown' or (known and 'known' or 'not learned');
            if (options.only_unlearned ~= true or known ~= true) then
                values[#values + 1] = { name = spell.name, state = state, skill_ids = spell.skill_ids };
                if (options.requirements == true) then
                    inputs = inputs or player.blue_learning(index);
                    blue_requirements(spell, inputs, notes);
                end
            end
            unknown = unknown or known == nil;
        end
    end
    if (unknown) then notes[#notes + 1] = 'The client has not supplied a readable spellbook yet.'; end
    if (options.seen == true) then
        notes[#notes + 1] = OBSERVATION_NOTE;
    end
    if (inputs ~= nil) then
        local job = inputs.job == nil and 'main job unknown' or (inputs.job == 16 and 'main-job BLU' or 'main job is not BLU');
        local alive = inputs.alive == nil and 'HP unknown' or (inputs.alive and 'alive' or 'KO');
        local distance = inputs.distance == nil and 'distance unknown'
            or ('%.1f yalms away (%s)'):format(inputs.distance, inputs.distance <= 100 and 'within 100' or 'too far');
        notes[#notes + 1] = 'At this reading: ' .. job .. ', ' .. alive .. ', ' .. distance .. '.';
        if (#(entry.requirements or NONE) == 0) then
            notes[#notes + 1] = 'On defeat, you need main-job BLU, enough current skill, and to be alive within 100 yalms in the same zone.';
            notes[#notes + 1] = 'Your party or alliance must get the eligible kill. Call for Help prevents learning.';
        end
        notes[#notes + 1] = 'These inputs can change before defeat. They do not establish every learning condition.';
    end
    notes[#notes + 1] = 'These are possible lessons. The monster must use the move, and the learning conditions still apply.';
    local fallback = entry.value;
    if (#values == 0 and options.only_unlearned == true) then
        fallback = entry.incomplete and 'All listed spells learned; other lessons unknown' or 'All listed spells learned';
    end
    local seen = options.seen == true;
    local value, moves = lesson_value(values, index, seen, fallback);
    return value, { spells = values, move_states = moves, fallback = fallback, seen = seen,
        version = seen and lessons.version(index) or 0 };
end

-- Saved checks only refresh observed moves. Their spellbook and stat readings stay as they were.
function info.refresh_observation(section, seen)
    local previous = section.observation;
    if (previous == nil) then return section; end
    local version = seen and lessons.version(section.index) or 0;
    if (previous.seen == seen and previous.version == version) then return section; end
    local out = {};
    for key, value in pairs(section) do out[key] = value; end
    local value, moves = lesson_value(previous.spells, section.index, seen, previous.fallback);
    out.observation = { spells = previous.spells, move_states = moves, fallback = previous.fallback, seen = seen, version = version };
    out.value = value;
    out.notes = {};
    for _, line in ipairs(section.notes) do
        if (line ~= OBSERVATION_NOTE) then out.notes[#out.notes + 1] = line; end
    end
    if (seen) then out.notes[#out.notes + 1] = OBSERVATION_NOTE; end
    return out;
end

function info.readout(row, low, high, settings, index)
    if (row == nil) then return nil; end
    local base = row.info or NONE;
    local overrides = (row.info_by_index or NONE)[index] or NONE;
    local out = { sections = {} };
    for _, id in ipairs(info.ORDER) do
        if (settings == nil or settings[id] ~= false) then
            local entry = overrides[id];
            if (entry == nil) then entry = base[id]; end
            if (type(entry) == 'table') then
                local notes = {};
                for _, line in ipairs(entry.notes or NONE) do
                    if (type(line) == 'string' and line ~= '') then notes[#notes + 1] = line; end
                end
                local value = entry.value;
                local danger, observation;
                if (id == 'vitals') then value = vitals(entry, low, high, notes); end
                if (id == 'blue') then value, observation = blue(entry, notes, settings and settings.blue_options, index); end
                if (id == 'dangers') then
                    danger = dangers.readout(entry, low, high, settings and settings.danger_options);
                    value, notes = danger.value, danger.notes;
                end
                if (type(value) == 'string' and value ~= '') then
                    out.sections[#out.sections + 1] = { id = id, label = info.LABELS[id], value = value, notes = notes,
                        danger = danger, danger_source = id == 'dangers' and entry or nil, low = low, high = high,
                        observation = observation, index = index };
                end
            end
        end
    end
    return #out.sections > 0 and out or nil;
end

return info;
