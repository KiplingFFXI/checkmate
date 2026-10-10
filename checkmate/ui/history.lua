-- Settings undo stays in memory. Disk profile changes have their own guarded undo.
local defaults = require('ui.defaults');
local parts = require('core.parts');

local history = { LIMIT = 8 };
local owners = setmetatable({}, { __mode = 'k' });
local last_owner;
local GEOMETRY = { x = true, y = true, width = true, height = true, overlay_x = true, overlay_y = true };

function history.copy(value)
    if (type(value) ~= 'table') then return value; end
    local out = T{};
    for key, inner in pairs(value) do out[key] = history.copy(inner); end
    return out;
end

function history.equal(a, b)
    if (type(a) ~= type(b)) then return false; end
    if (type(a) ~= 'table') then return a == b; end
    for key, value in pairs(a) do if (not history.equal(value, b[key])) then return false; end end
    for key in pairs(b) do if (a[key] == nil) then return false; end end
    return true;
end

function history.capture(settings)
    return history.copy(settings);
end

local function ignored(path, key)
    return (#path == 0 and key == 'profile_source')
        or (#path == 1 and path[1] == 'window' and GEOMETRY[key]);
end

local function differences(before, after, path, out)
    local keys = {};
    for key in pairs(before) do keys[key] = true; end
    for key in pairs(after) do keys[key] = true; end
    for key in pairs(keys) do
        if (not ignored(path, key)) then
            local a, b = before[key], after[key];
            local next_path = history.copy(path);
            next_path[#next_path + 1] = key;
            if (type(a) == 'table' and type(b) == 'table') then
                differences(a, b, next_path, out);
            elseif (not history.equal(a, b)) then
                out[#out + 1] = { path = next_path, before = history.copy(a) };
            end
        end
    end
end

function history.record(settings, before, label)
    if (type(before) ~= 'table') then return false; end
    local changes = {};
    differences(before, settings, {}, changes);
    if (#changes == 0) then return false; end
    local stack = owners[settings] or {};
    owners[settings], last_owner = stack, settings;
    stack[#stack + 1] = { changes = changes, label = label or 'Settings change',
        source = history.copy(before.profile_source) };
    if (#stack > history.LIMIT) then table.remove(stack, 1); end
    return true;
end

function history.status(settings)
    local stack = owners[settings or last_owner];
    return stack and stack[#stack] and stack[#stack].label;
end

function history.undo(settings)
    local stack = owners[settings];
    if (stack == nil or #stack == 0) then return false, 'none'; end
    local entry = table.remove(stack);
    for _, change in ipairs(entry.changes) do
        local parent = settings;
        for i = 1, #change.path - 1 do
            local key = change.path[i];
            if (type(parent[key]) ~= 'table') then parent[key] = T{}; end
            parent = parent[key];
        end
        parent[change.path[#change.path]] = history.copy(change.before);
    end
    settings.profile_source = history.copy(entry.source);
    last_owner = settings;
    return true, entry.label;
end

function history.clear(settings)
    owners[settings] = nil;
    if (last_owner == settings) then last_owner = nil; end
end

-- These leaves belong to the named section. Labels and personal combat inputs stay untouched.
local SECTIONS = {
    printout = { label = 'Printout', paths = { 'printout.order', 'printout.divider', 'printout.separator',
        'printout.label_divider', 'printout.label_separator', 'printout.header', 'printout.show_level',
        'printout.show_range', 'printout.show_id', 'printout.show_ph', 'printout.number_style',
        'printout.defense_first', 'printout.extras_own_line', 'printout.replace_game_line',
        'printout.icons', 'printout.icons_only' }, chat = true },
    overlay = { label = 'Overlay', paths = { 'overlay.on', 'overlay.locked', 'overlay.remember',
        'overlay.follow_cursor', 'overlay.show_level', 'overlay.show_range', 'overlay.show_id',
        'overlay.show_ph', 'overlay.own_lines', 'overlay.divider', 'overlay.separator',
        'overlay.icons', 'overlay.icons_only', 'overlay.element_look', 'overlay.tips',
        'overlay.hide_in_events', 'overlay.hide_with_ui', 'overlay.hide_on_map' }, overlay = true },
    numbers = { label = 'Numbers', paths = { 'grades', 'ranged', 'pdif' },
        rows = { 'hit', 'pdif', 'offhand', 'offhandpdif', 'ranged', 'rangedpdif', 'evade', 'block', 'parry', 'crit', 'crittaken' } },
    aggro = { label = 'Aggro', paths = { 'aggro.detection', 'links' }, rows = { 'aggro', 'links', 'pursuit' } },
    magic = { label = 'Magic', paths = {}, rows = { 'magic' }, schools = true },
    blue = { label = 'Blue Magic', paths = { 'blue' }, rows = { 'blue' } },
    weaknesses = { label = 'Weaknesses', paths = { 'weaknesses.chat', 'weaknesses.overlay',
        'elements.strength', 'elements.script_mark' }, rows = { 'weaknesses' }, immunities = true },
    pets = { label = 'Pets', paths = { 'pet.show_name', 'pet.show_level' }, rows = { 'pet' } },
    monster = { label = 'Monster', paths = { 'dangers' },
        rows = { 'family', 'vitals', 'movement', 'spawn', 'claim', 'dangers', 'fight', 'traits', 'crystal', 'rewards' } },
    drops = { label = 'Drops', paths = { 'drops.max_items', 'drops.min_chance', 'drops.sort',
        'drops.th_in_label', 'drops.notes' }, rows = { 'drops', 'steal' } },
    effects = { label = 'Effects', paths = { 'effects' }, rows = { 'effects' } },
    abbreviations = { label = 'Abbreviations', paths = { 'short', 'printout.short_words', 'overlay.short_words' } },
    appearance = { label = 'Appearance', paths = { 'look', 'colors', 'window.tabs', 'printout.con_colors',
        'aggro.threat_colors', 'grades', 'overlay.font', 'overlay.font_size', 'overlay.opacity',
        'overlay.border', 'overlay.wrap' } },
    profiles = { label = 'Profiles', paths = { 'job_links', 'profile_source' } },
};
local SECTION_ORDER = { 'display', 'printout', 'overlay', 'numbers', 'aggro', 'magic', 'blue', 'weaknesses',
    'pets', 'monster', 'drops', 'effects', 'abbreviations', 'appearance', 'profiles' };

local function section_id(id)
    if (type(id) ~= 'string') then return nil; end
    local key = id:lower():gsub('[%s_-]+', '');
    if (key == 'bluemagic') then key = 'blue'; end
    return (key == 'display' or SECTIONS[key]) and key or nil;
end

function history.sections()
    local out = {};
    for _, id in ipairs(SECTION_ORDER) do
        out[#out + 1] = { id = id, name = id == 'display' and 'Display' or SECTIONS[id].label };
    end
    return out;
end

local function reset_path(settings, base, path)
    local keys = {};
    for key in path:gmatch('[^.]+') do keys[#keys + 1] = key; end
    local current, fallback = settings, base;
    for i = 1, #keys - 1 do
        local key = keys[i];
        if (type(current[key]) ~= 'table') then current[key] = T{}; end
        current, fallback = current[key], fallback[key] or {};
    end
    current[keys[#keys]] = history.copy(fallback[keys[#keys]]);
end

local function reset_rows(settings, base, rows, chat, overlay)
    for _, id in ipairs(rows) do
        if (chat and settings.printout.parts[id] and base.printout.parts[id]) then
            settings.printout.parts[id].on = base.printout.parts[id].on;
            settings.printout.parts[id].new_line = base.printout.parts[id].new_line;
        end
        if (overlay and base.overlay.parts[id] ~= nil) then settings.overlay.parts[id] = base.overlay.parts[id]; end
    end
end

local function reset(settings, base, id)
    if (id == 'display') then reset(settings, base, 'printout'); reset(settings, base, 'overlay'); return; end
    local section = SECTIONS[id];
    for _, path in ipairs(section.paths) do reset_path(settings, base, path); end
    if (section.chat or section.overlay) then
        local rows = { 'name', 'reading' };
        for _, row in ipairs(parts.ORDER) do rows[#rows + 1] = row; end
        reset_rows(settings, base, rows, section.chat, section.overlay);
    elseif (section.rows) then
        reset_rows(settings, base, section.rows, true, true);
    end
    if (section.schools) then
        for name, school in pairs(base.magic.schools) do
            if (name ~= 'blue') then settings.magic.schools[name].on = school.on; end
        end
    end
    if (section.immunities) then
        for name, value in pairs(base.immunities) do settings.immunities[name].on = value.on; end
    end
end

function history.reset_section(settings, id, options)
    id = section_id(id);
    if (id == nil) then return false, 'section'; end
    local before = history.capture(settings);
    reset(settings, defaults.make(), id);
    local changed = not history.equal(before, settings);
    local label = 'Reset ' .. (id == 'display' and 'Display' or SECTIONS[id].label);
    if (changed and not (options and options.record == false)) then history.record(settings, before, label); end
    return changed, label;
end

return history;
