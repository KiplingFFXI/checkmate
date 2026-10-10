-- Places with a supported lesson in the bundled source. This does not read live spawns.
local player = require('core.player');
local finder = {};
local loaded_path, data, problem;
local known, read_at, character = {}, -math.huge, nil;
local spell_search, place_search, place_spell;
local spell_words, place_words = {}, {};

local function words(query)
    local out = {};
    for word in tostring(query or ''):lower():gmatch('%S+') do
        out[#out + 1] = word;
    end
    return out;
end

local function matches(text, query)
    for _, word in ipairs(query) do
        if (not text:find(word, 1, true)) then return false; end
    end
    return true;
end

function finder.catalog()
    local path = addon.path .. '/data/blue_finder.lua';
    if (loaded_path ~= path) then
        loaded_path, data, problem = path, nil, nil;
        local chunk = loadfile(path);
        local ok, value;
        if (chunk ~= nil) then ok, value = pcall(chunk); end
        if (not ok or type(value) ~= 'table' or value.version ~= 1 or type(value.spells) ~= 'table') then
            problem = 'The spell finder data could not be read. Update the complete checkmate addon folder.';
        else
            data = value;
        end
        known, read_at = {}, -math.huge;
        spell_search, place_search, place_spell = nil, nil, nil;
        spell_words, place_words = {}, {};
    end
    return data, problem;
end

function finder.changed()
    known, read_at, character = {}, -math.huge, nil;
    spell_search = nil;
end

local function read_spellbook(now)
    local id = player.server_id();
    now = now or os.clock();
    if (character == id and now - read_at < 1) then return; end
    local changed = character ~= id;
    character, read_at = id, now;
    for _, spell in ipairs(data.spells) do
        local value = player.knows_spell(spell.id);
        changed = changed or known[spell.id] ~= value;
        known[spell.id] = value;
    end
    if (changed) then spell_search = nil; end
end

-- Results stay read-only and are reused until the search or spellbook changes.
function finder.spells(query, only_unlearned, now)
    local source, err = finder.catalog();
    if (source == nil) then return {}, err; end
    read_spellbook(now);
    query, only_unlearned = tostring(query or ''):lower(), only_unlearned == true;
    if (spell_search ~= nil and spell_search.query == query and spell_search.unlearned == only_unlearned) then
        return spell_search.result;
    end
    local terms = words(query);
    local out = {};
    for _, spell in ipairs(source.spells) do
        local text = spell_words[spell.id];
        if (text == nil) then text = spell.name:lower(); spell_words[spell.id] = text; end
        if (matches(text, terms) and (not only_unlearned or known[spell.id] ~= true)) then
            out[#out + 1] = { spell = spell, known = known[spell.id] };
        end
    end
    spell_search = { query = query, unlearned = only_unlearned, result = out };
    return out;
end

function finder.state(value)
    return value == nil and 'spellbook unknown' or (value and 'known' or 'not learned');
end

function finder.level_text(place)
    local ranges, out = place.level_ranges or {}, {};
    for _, range in ipairs(ranges) do
        out[#out + 1] = range[1] == range[2] and tostring(range[1]) or (range[1] .. '-' .. range[2]);
    end
    if (#out == 0 and place.low ~= nil and place.high ~= nil) then
        out[1] = place.low == place.high and tostring(place.low) or (place.low .. '-' .. place.high);
    end
    return #out > 0 and ('Lv ' .. table.concat(out, ', ')) or 'Level unknown';
end

function finder.places(spell, query, zone)
    query = tostring(query or ''):lower();
    if (place_spell ~= spell) then
        place_spell, place_words, place_search = spell, {}, nil;
    end
    if (place_search ~= nil and place_search.query == query and place_search.zone == zone) then
        return place_search.result;
    end
    local terms = words(query);
    local out = {};
    for i, place in ipairs(spell.monsters or {}) do
        local text = place_words[i];
        if (text == nil) then
            local pieces = { place.name, place.zone_name, finder.level_text(place) };
            for _, note in ipairs(place.notes or {}) do pieces[#pieces + 1] = note; end
            for _, note in ipairs(place.context or {}) do pieces[#pieces + 1] = note; end
            text = table.concat(pieces, ' '):lower();
            place_words[i] = text;
        end
        if ((zone == nil or place.zone == zone) and matches(text, terms)) then out[#out + 1] = place; end
    end
    place_search = { query = query, zone = zone, result = out };
    return out;
end

function finder.place_text(place)
    local lines = { place.name .. ' - ' .. place.zone_name .. ' - ' .. finder.level_text(place) };
    if (place.incomplete) then lines[#lines + 1] = 'This monster\'s lesson list is incomplete.'; end
    local seen = {};
    for _, list in ipairs({ place.context or {}, place.notes or {} }) do
        for _, note in ipairs(list) do
            if (not seen[note]) then lines[#lines + 1], seen[note] = note, true; end
        end
    end
    return table.concat(lines, '\n');
end

finder.LIMITS = 'These are places supported by the bundled source, not live sightings or a complete list of every possible teacher. '
    .. 'Spawn and fight conditions still apply. The monster must use the move, and the learning conditions still apply.';

function finder.copy(spell, places)
    local source = finder.catalog();
    local lines = { spell.name .. ' - possible Blue Magic lessons',
        'Minimum Blue Magic skill: ' .. tostring(spell.min_skill or 'unknown') .. '.', finder.LIMITS };
    for _, place in ipairs(places) do lines[#lines + 1] = finder.place_text(place); end
    if (source ~= nil) then lines[#lines + 1] = 'Source: ' .. tostring(source.built or 'unknown'); end
    return table.concat(lines, '\n\n');
end

return finder;
