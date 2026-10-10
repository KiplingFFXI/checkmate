-- Shared display rows and migration from the old grouped layout.
local parts = {};

parts.VERSION = 2;
parts.INFO = {
    { id = 'family', label = 'Family', tab = 'Monster' },
    { id = 'charm', label = 'Charm', tab = 'Weaknesses' },
    { id = 'vitals', label = 'HP and MP', tab = 'Monster' },
    { id = 'movement', label = 'Movement', tab = 'Monster' },
    { id = 'pursuit', label = 'Pursuit', tab = 'Aggro' },
    { id = 'spawn', label = 'Spawn', tab = 'Monster' },
    { id = 'claim', label = 'Claim shield', tab = 'Monster' },
    { id = 'dangers', label = 'Dangers', tab = 'Monster' },
    { id = 'blue', label = 'Blue Magic', tab = 'Blue Magic' },
    { id = 'fight', label = 'Fight rules', tab = 'Monster' },
    { id = 'traits', label = 'Traits', tab = 'Monster' },
    { id = 'crystal', label = 'Crystal', tab = 'Monster' },
    { id = 'rewards', label = 'Rewards', tab = 'Monster' },
};
parts.INFO_IDS, parts.INFO_SET, parts.LABELS = {}, {}, { weaknesses = 'Weaknesses' };
for _, section in ipairs(parts.INFO) do
    parts.LABELS[section.id] = section.label;
    if (section.id ~= 'charm') then
        parts.INFO_IDS[#parts.INFO_IDS + 1] = section.id;
        parts.INFO_SET[section.id] = true;
    end
end
parts.COMPONENTS = { 'elements', 'weapons', 'immunities', 'charm' };
parts.ORDER = { 'difficulty', 'hit', 'pdif', 'offhand', 'offhandpdif', 'ranged', 'rangedpdif', 'evade', 'block', 'parry', 'crit', 'crittaken', 'job', 'aggro', 'links',
    'magic', 'weaknesses', 'effects', 'family', 'vitals', 'movement', 'pursuit', 'spawn', 'claim', 'dangers',
    'blue', 'fight', 'traits', 'crystal', 'rewards', 'drops', 'steal', 'pet' };
parts.DEFAULT_ORDER = table.concat(parts.ORDER, ' ');

function parts.enabled(s, id, display)
    if (display == 'overlay') then
        return (((s.overlay or {}).parts or {})[id]) == true;
    end
    local value = (((s.printout or {}).parts or {})[id]);
    return type(value) == 'table' and value.on == true;
end

function parts.component_enabled(s, id, display)
    if (id == 'blue_chance') then return parts.blue_enabled(s, 'chance', display); end
    if (id == 'blue_lessons') then return parts.blue_enabled(s, 'lessons', display); end
    display = display or 'chat';
    local options = ((s.weaknesses or {})[display] or {});
    return parts.enabled(s, 'weaknesses', display) and options[id] ~= false;
end

function parts.blue_enabled(s, component, display)
    local options = ((s.blue or {})[display or 'chat'] or {});
    local on = component == 'lessons' and options.lessons ~= false or component == 'chance' and options.chance == true;
    return parts.enabled(s, 'blue', display) and on;
end

function parts.info_enabled(s, id, display)
    if (id == 'charm') then return parts.component_enabled(s, id, display); end
    if (id == 'blue') then return parts.blue_enabled(s, 'lessons', display); end
    return parts.INFO_SET[id] == true and parts.enabled(s, id, display);
end

function parts.any_info(s, display)
    if (display == nil) then return parts.any_info(s, 'chat') or parts.any_info(s, 'overlay'); end
    for _, section in ipairs(parts.INFO) do
        if (parts.info_enabled(s, section.id, display)) then return true; end
    end
    return false;
end

function parts.info_settings(s, display)
    local out = { blue_options = s.blue, danger_options = s.dangers };
    for _, section in ipairs(parts.INFO) do out[section.id] = parts.info_enabled(s, section.id, display); end
    return out;
end

function parts.magic_settings(s, display)
    local out, schools = {}, {};
    for key, value in pairs(s.magic or {}) do out[key] = value; end
    for id, value in pairs((s.magic or {}).schools or {}) do
        local copy = {};
        for key, inner in pairs(value) do copy[key] = inner; end
        if (id == 'blue') then
            copy.on = parts.blue_enabled(s, 'chance', display);
        else
            copy.on = parts.enabled(s, 'magic', display) and value.on == true;
        end
        schools[id] = copy;
    end
    out.schools = schools;
    return out;
end

-- Old groups expand once, where they occurred. The caller fills genuinely missing rows afterward.
function parts.expand_order(value)
    local out, seen = {}, {};
    local function add(id)
        if (not seen[id]) then out[#out + 1], seen[id] = id, true; end
    end
    for id in tostring(value or ''):gmatch('%S+') do
        if (id == 'info') then
            for _, section in ipairs(parts.INFO) do add(section.id == 'charm' and 'weaknesses' or section.id); end
        elseif (id == 'elements' or id == 'weapons' or id == 'immunities') then
            add('weaknesses');
        else
            add(id);
        end
    end
    return table.concat(out, ' ');
end

local function table_at(value, key)
    if (type(value[key]) ~= 'table') then value[key] = T{}; end
    return value[key];
end

local function row_at(rows, id, on)
    local row = table_at(rows, id);
    if (type(row.on) ~= 'boolean') then row.on = on == true; end
    if (type(row.label) ~= 'string') then row.label = parts.LABELS[id]; end
    if (type(row.new_line) ~= 'boolean') then row.new_line = true; end
end

-- Call before default tables are merged, so missing new rows cannot hide old enabled rows.
function parts.migrate(s)
    local chat = table_at(table_at(s, 'printout'), 'parts');
    local panel = table_at(table_at(s, 'overlay'), 'parts');
    local info, weakness, blue = table_at(s, 'info'), table_at(s, 'weaknesses'), table_at(s, 'blue');
    if (type(blue.only_unlearned) ~= 'boolean') then blue.only_unlearned = false; end
    if (type(blue.requirements) ~= 'boolean') then blue.requirements = true; end
    if (type(blue.seen) ~= 'boolean') then blue.seen = false; end
    local old = s.layout_version ~= parts.VERSION;
    local magic = type(s.magic) == 'table' and s.magic or {};
    local schools = type(magic.schools) == 'table' and magic.schools or {};
    local school = type(schools.blue) == 'table' and schools.blue or {};
    local function legacy(id, display)
        if (display == 'overlay') then return panel[id] == true; end
        return type(chat[id]) == 'table' and chat[id].on == true;
    end
    if (type(weakness.immune_word) ~= 'string') then
        weakness.immune_word = (type(chat.immunities) == 'table' and chat.immunities.label) or 'Immune';
    end
    for _, display in ipairs({ 'chat', 'overlay' }) do
        local options = table_at(weakness, display);
        local blue_options = table_at(blue, display);
        local had_info = old and (chat.info ~= nil or panel.info ~= nil);
        local had_magic = old and (chat.magic ~= nil or panel.magic ~= nil);
        if (type(blue_options.lessons) ~= 'boolean') then
            blue_options.lessons = not had_info or (legacy('info', display) and info.blue ~= false);
        end
        if (type(blue_options.chance) ~= 'boolean') then
            blue_options.chance = had_magic and legacy('magic', display) and school.on == true;
        end
        local any = false;
        local has_legacy = old and (chat.info ~= nil or chat.elements ~= nil or chat.weapons ~= nil or chat.immunities ~= nil
            or panel.info ~= nil or panel.elements ~= nil or panel.weapons ~= nil or panel.immunities ~= nil);
        for _, id in ipairs(parts.COMPONENTS) do
            if (type(options[id]) ~= 'boolean') then
                if (has_legacy) then
                    options[id] = id == 'charm' and (legacy('info', display) and info.charm ~= false)
                        or (id ~= 'charm' and legacy(id, display));
                else
                    options[id] = true;
                end
            end
            any = any or options[id];
        end
        if (display == 'chat') then
            row_at(chat, 'weaknesses', has_legacy and any or false);
        elseif (type(panel.weaknesses) ~= 'boolean') then
            panel.weaknesses = has_legacy and any or false;
        end
    end
    for _, id in ipairs(parts.INFO_IDS) do
        local on = old and legacy('info', 'chat') and info[id] ~= false;
        local overlay_on = old and legacy('info', 'overlay') and info[id] ~= false;
        if (id == 'blue') then
            on = on or (old and legacy('magic', 'chat') and school.on == true);
            overlay_on = overlay_on or (old and legacy('magic', 'overlay') and school.on == true);
        end
        row_at(chat, id, on);
        if (type(panel[id]) ~= 'boolean') then panel[id] = overlay_on == true; end
    end
    if (old and type(s.printout.order) == 'string') then s.printout.order = parts.expand_order(s.printout.order); end
    for _, id in ipairs({ 'info', 'elements', 'weapons', 'immunities' }) do chat[id], panel[id] = nil, nil; end
    for _, section in ipairs(parts.INFO) do
        if (section.id ~= 'blue') then info[section.id] = true; end
    end
    info.blue = true;
    s.layout_version = parts.VERSION;
    return s;
end

return parts;
