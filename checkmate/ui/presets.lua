-- Starter layouts change display choices, never saved profiles or your personal inputs.
local parts = require('core.parts');

local presets = {};
local LIST = {
    { id = 'minimal', name = 'Minimal', description = 'Difficulty, aggro and links, with little extra text.',
        chat = { 'difficulty', 'aggro', 'links' }, overlay = { 'difficulty', 'aggro', 'links' } },
    { id = 'melee', name = 'Melee', description = 'Hit chance, normal-hit pDIF and critical chance.',
        chat = { 'difficulty', 'hit', 'pdif', 'crit' },
        overlay = { 'difficulty', 'hit', 'pdif', 'offhand', 'offhandpdif', 'crit', 'weaknesses', 'effects' } },
    { id = 'mage', name = 'Mage', description = 'Elemental and enfeebling spell estimates with weaknesses.',
        chat = { 'difficulty', 'magic', 'weaknesses' },
        overlay = { 'difficulty', 'magic', 'weaknesses', 'effects', 'aggro' } },
    { id = 'ranged', name = 'Ranged', description = 'Ranged hit chance and pDIF, with current distance.',
        chat = { 'difficulty', 'ranged', 'rangedpdif' },
        overlay = { 'difficulty', 'ranged', 'rangedpdif', 'weaknesses', 'aggro' } },
    { id = 'tank', name = 'Tank', description = 'Evade, shield block and parry, with observed effects and dangers.',
        chat = { 'difficulty', 'evade', 'block', 'parry' },
        overlay = { 'difficulty', 'evade', 'block', 'parry', 'crittaken', 'dangers', 'effects' } },
    { id = 'blue_mage', name = 'Blue Mage', description = 'Possible Blue Magic lessons and their source conditions. Spell landing chance stays off.',
        chat = { 'difficulty', 'blue' },
        overlay = { 'difficulty', 'blue', 'weaknesses', 'family', 'spawn' } },
    { id = 'pet_job', name = 'Pet Job', description = 'Supported pet estimates, Charm eligibility and pulling details.',
        chat = { 'difficulty', 'pet', 'weaknesses' },
        overlay = { 'difficulty', 'pet', 'weaknesses', 'family', 'aggro', 'links' } },
    { id = 'thief', name = 'Thief', description = 'Rewards, drops and Steal, with their conditions.',
        chat = { 'difficulty', 'rewards', 'drops', 'steal' },
        overlay = { 'difficulty', 'rewards', 'drops', 'steal', 'aggro', 'links' } },
};

local function copy(value)
    if (type(value) ~= 'table') then return value; end
    local out = T{};
    for key, inner in pairs(value) do out[key] = copy(inner); end
    return out;
end

local function find(id)
    if (type(id) ~= 'string') then return nil; end
    local key = id:lower():gsub('[%s%-]+', '_');
    for _, preset in ipairs(LIST) do if (preset.id == key) then return preset; end end
end

local function metadata(preset)
    local out = copy(preset);
    out.changes = {
        'Enables the overlay and puts each overlay part on its own line.',
        'Replaces chat and overlay row selections and their order. Keeps your labels and abbreviations.',
        'Shows up to 3 Links entries, 3 drop items and 3 danger moves.',
        'Target details keeps full Links and Dangers lists.',
        'Keeps your colors, fonts, positions, visible tabs, merits, Treasure Hunter and manual accuracy inputs.',
    };
    if (preset.id == 'mage') then
        out.changes[#out.changes + 1] = 'Enables Elemental and Enfeebling estimates using your selected spells.';
    elseif (preset.id == 'blue_mage') then
        out.changes[#out.changes + 1] = 'Shows unlearned spells and requirements. Find possible sources in the Blue Magic finder.';
    elseif (preset.id == 'pet_job') then
        out.changes[#out.changes + 1] = 'Adds Charm eligibility to Weaknesses.';
        out.changes[#out.changes + 1] = 'Pet estimates need a supported pet and enough stat information.';
    elseif (preset.id == 'thief') then
        out.changes[#out.changes + 1] = 'Shows drops from any base chance and keeps drop and Steal conditions visible.';
        out.changes[#out.changes + 1] = 'Keeps your Treasure Hunter setting.';
    end
    return out;
end

function presets.list()
    local out = {};
    for _, preset in ipairs(LIST) do out[#out + 1] = metadata(preset); end
    return out;
end

function presets.find(id)
    local preset = find(id);
    return preset and metadata(preset);
end

local INLINE = { difficulty = true, hit = true, offhand = true, ranged = true,
    evade = true, block = true, parry = true, crit = true, crittaken = true, links = true };

local function configure(s, preset)
    local order, seen = {}, {};
    for _, rows in ipairs({ preset.overlay, preset.chat, parts.ORDER }) do
        for _, id in ipairs(rows) do
            if (not seen[id]) then order[#order + 1], seen[id] = id, true; end
        end
    end
    s.printout.order = table.concat(order, ' ');
    for id, value in pairs(s.printout.parts) do
        if (type(value) == 'table') then
            value.on = id == 'name' or id == 'reading';
            if (value.new_line ~= nil) then value.new_line = not INLINE[id] and id ~= 'name'; end
        end
    end
    for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'name' or id == 'reading'; end
    for _, id in ipairs(preset.chat) do s.printout.parts[id].on = true; end
    for _, id in ipairs(preset.overlay) do s.overlay.parts[id] = true; end
    s.overlay.on, s.overlay.own_lines = true, true;
    s.links.max_links, s.drops.max_items, s.dangers.max_moves = 3, 3, 3;
    s.drops.notes = true;
    for _, display in ipairs({ 'chat', 'overlay' }) do
        for _, id in ipairs(parts.COMPONENTS) do
            s.weaknesses[display][id] = id ~= 'charm' or preset.id == 'pet_job';
        end
        s.blue[display].lessons, s.blue[display].chance = true, false;
    end
    for id, school in pairs(s.magic.schools) do
        school.on = preset.id == 'mage' and (id == 'elemental' or id == 'enfeebling');
    end
    if (preset.id == 'blue_mage') then s.blue.only_unlearned, s.blue.requirements = true, true; end
    if (preset.id == 'ranged') then s.ranged.show_distance = true; end
    if (preset.id == 'thief') then s.drops.min_chance = 0; end
end

function presets.preview(settings, id)
    local preset = find(id);
    if (preset == nil) then return nil; end
    local out = copy(settings);
    configure(out, preset);
    return out, metadata(preset);
end

function presets.apply(settings, id)
    local preset = find(id);
    if (preset == nil) then return false; end
    configure(settings, preset);
    return true, metadata(preset);
end

-- Compare only the choices a starter layout owns. Personal styling remains yours.
function presets.matches(settings, id)
    local expected = presets.preview(settings, id);
    if (expected == nil) then return false; end
    local function equal(a, b)
        if (type(a) ~= type(b)) then return false; end
        if (type(a) ~= 'table') then return a == b; end
        for key, value in pairs(a) do if (not equal(value, b[key])) then return false; end end
        for key in pairs(b) do if (a[key] == nil) then return false; end end
        return true;
    end
    return equal(settings, expected);
end

return presets;
