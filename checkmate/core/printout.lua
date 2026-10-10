--[[
    Builds chat lines and the overlay's text from the same readout. The name stays first. Other parts
    follow the saved order, with their own labels, colors and line breaks. Evasion and defense follow
    the difficulty or name. Fixed words and their short forms come from core.wording.

    The overlay asks for marks around icons and hoverable text. These never reach chat. Hit, off-hand,
    ranged, evade and pDIF mark which lines need /checkparam; the pet has its own reply and waiting line.
]]

local wording = require('core.wording');
local layout = require('core.parts');

local printout = {};

-- Parts after the name, in their default order.
printout.PARTS = layout.ORDER;
printout.DEFAULT_ORDER = layout.DEFAULT_ORDER;

-- The color each part's label and label divider print in.
local LABEL_COLORS = {
    name = 'name', difficulty = 'difficulty', hit = 'hit_label', offhand = 'offhand_label', ranged = 'ranged_label',
    pdif = 'pdif_label', offhandpdif = 'offhandpdif_label', rangedpdif = 'rangedpdif_label',
    evade = 'evade_label', crit = 'crit_label', crittaken = 'crittaken_label', job = 'job_label', aggro = 'aggro_label',
    block = 'block_label', parry = 'parry_label',
    links = 'links_label', magic = 'magic_label', immunities = 'immunities_label', effects = 'effects_label', elements = 'elements_label',
    weapons = 'weapons_label', info = 'info_label', weaknesses = 'elements_label',
    drops = 'drops_label', steal = 'steal_label', pet = 'pet_label',
};
for _, id in ipairs(layout.INFO_IDS) do LABEL_COLORS[id] = 'info_label'; end

-- Parts the /check reply itself answers, and the reading when it prints on its own. Every other part
-- is an extra checkmate works out.
local CHECK_PARTS = { name = true, difficulty = true, reading = true };

-- The same parts in order, with the reading riding on them. They stand in for the game's own /check
-- line when it's hidden and nothing else prints, or the monster can't be gauged.
local PLAIN_LINE = { 'name', 'difficulty' };

-- Parts whose numbers wait for the /checkparam <me> reply. The pet part waits for its own reply, which
-- never holds up another line.
local WAITING_PARTS = { hit = true, offhand = true, ranged = true, evade = true,
    pdif = true, offhandpdif = true, rangedpdif = true };

-- Immunities in the order they print, with their default labels.
printout.IMMUNITIES = {
    { id = 'dark_sleep',  label = 'Sleep' },
    { id = 'light_sleep', label = 'Lullaby' },
    { id = 'bind',        label = 'Bind' },
    { id = 'gravity',     label = 'Gravity' },
    { id = 'silence',     label = 'Silence' },
    { id = 'stun',        label = 'Stun' },
    { id = 'paralyze',    label = 'Paralyze' },
    { id = 'slow',        label = 'Slow' },
    { id = 'elegy',       label = 'Elegy' },
    { id = 'blind',       label = 'Blind' },
    { id = 'poison',      label = 'Poison' },
    { id = 'requiem',     label = 'Requiem' },
    { id = 'petrify',     label = 'Petrify' },
    { id = 'terror',      label = 'Terror' },
    { id = 'plague',      label = 'Plague' },
    { id = 'curse',       label = 'Curse' },
};

--[[
    Chat colors a part can use (Ashita color table 1, named as in libs\chat.lua). Codes 0, 10 and 13
    are never offered. 0 ends the text and 10 and 13 break lines. chat.lua has no name for 102. It's
    used here for Decent Challenge.
]]
printout.PALETTE = {
    { code = 106, name = 'Cream' },
    { code = 1,   name = 'White' },
    { code = 2,   name = 'Lawn green' },
    { code = 3,   name = 'Slate blue' },
    { code = 5,   name = 'Magenta' },
    { code = 6,   name = 'Cyan' },
    { code = 7,   name = 'Moccasin' },
    { code = 8,   name = 'Coral' },
    { code = 65,  name = 'Dim grey' },
    { code = 67,  name = 'Grey' },
    { code = 68,  name = 'Salmon' },
    { code = 69,  name = 'Yellow' },
    { code = 71,  name = 'Royal blue' },
    { code = 72,  name = 'Dark magenta' },
    { code = 73,  name = 'Violet' },
    { code = 76,  name = 'Tomato' },
    { code = 77,  name = 'Misty rose' },
    { code = 78,  name = 'Pale goldenrod' },
    { code = 79,  name = 'Lime' },
    { code = 80,  name = 'Pale green' },
    { code = 81,  name = 'Dark orchid' },
    { code = 82,  name = 'Aqua' },
    { code = 83,  name = 'Spring green' },
    { code = 85,  name = 'Dark salmon' },
    { code = 88,  name = 'Med. spring green' },
    { code = 89,  name = 'Medium purple' },
    { code = 90,  name = 'Azure' },
    { code = 92,  name = 'Light cyan' },
    { code = 96,  name = 'Light goldenrod' },
    { code = 102, name = 'Light blue' },
    { code = 104, name = 'Warning yellow' },
    { code = 105, name = 'Plum' },
};

local IN_PALETTE = {};
for _, entry in ipairs(printout.PALETTE) do
    IN_PALETTE[entry.code] = true;
end

--[[
    Every chat color, grouped the way Appearance lists them. `key` is its name in your colors
    settings and the word /checkmate color takes, and `label` its name in Appearance. Details are
    the small extras in a part, like "with Signet", "unknown", the "?", "(Ice)", "+2 more" and the
    commas and dividers inside it. Element badges are the overlay's own and never print in chat.
]]
printout.COLOR_GROUPS = {
    {
        name   = 'Tag and lines',
        colors = {
            { key = 'tag_brackets', label = 'Brackets' },
            { key = 'tag_word',     label = 'Word' },
            { key = 'line',         label = 'Dividers' },
            { key = 'replies',      label = 'Replies' },
        },
    },
    {
        name   = 'Name and level',
        colors = {
            { key = 'name',        label = 'Name' },
            { key = 'level',       label = 'Level' },
            { key = 'level_range', label = 'Range' },
            { key = 'id',          label = 'ID' },
            { key = 'ph',          label = 'PH' },
        },
    },
    {
        name   = 'Difficulty',
        colors = {
            { key = 'difficulty',           label = 'One color' },
            { key = 'too_weak',             label = 'Too Weak' },
            { key = 'incredibly_easy_prey', label = 'Incredibly Easy Prey' },
            { key = 'easy_prey',            label = 'Easy Prey' },
            { key = 'decent_challenge',     label = 'Decent Challenge' },
            { key = 'even_match',           label = 'Even Match' },
            { key = 'tough',                label = 'Tough' },
            { key = 'very_tough',           label = 'Very Tough' },
            { key = 'incredibly_tough',     label = 'Incredibly Tough' },
            { key = 'impossible_to_gauge',  label = 'Impossible to Gauge' },
        },
    },
    {
        name   = 'Evasion and defense',
        colors = {
            { key = 'reading',        label = 'Words' },
            { key = 'reading_detail', label = 'Parentheses and comma' },
        },
    },
    {
        name   = 'Hit rate',
        colors = {
            { key = 'hit_label',  label = 'Label' },
            { key = 'hit_number', label = 'Number' },
            { key = 'hit_detail', label = 'Details' },
        },
    },
    {
        name   = 'Off-hand',
        colors = {
            { key = 'offhand_label',  label = 'Label' },
            { key = 'offhand_number', label = 'Number' },
            { key = 'offhand_detail', label = 'Details' },
        },
    },
    {
        name   = 'Ranged',
        colors = {
            { key = 'ranged_label',  label = 'Label' },
            { key = 'ranged_number', label = 'Number' },
            { key = 'ranged_detail', label = 'Details' },
        },
    },
    {
        name   = 'Evade',
        colors = {
            { key = 'evade_label',  label = 'Label' },
            { key = 'evade_number', label = 'Number' },
            { key = 'evade_detail', label = 'Details' },
        },
    },
    {
        name = 'Shield block',
        colors = {
            { key = 'block_label', label = 'Label' },
            { key = 'block_number', label = 'Number' },
            { key = 'block_detail', label = 'Details' },
        },
    },
    {
        name = 'Parry',
        colors = {
            { key = 'parry_label', label = 'Label' },
            { key = 'parry_number', label = 'Number' },
            { key = 'parry_detail', label = 'Details' },
        },
    },
    {
        name = 'pDIF',
        colors = {
            { key = 'pdif_label', label = 'Label' },
            { key = 'pdif_number', label = 'Number' },
            { key = 'pdif_detail', label = 'Details' },
        },
    },
    {
        name = 'Off-hand pDIF',
        colors = {
            { key = 'offhandpdif_label', label = 'Label' },
            { key = 'offhandpdif_number', label = 'Number' },
            { key = 'offhandpdif_detail', label = 'Details' },
        },
    },
    {
        name = 'Ranged pDIF',
        colors = {
            { key = 'rangedpdif_label', label = 'Label' },
            { key = 'rangedpdif_number', label = 'Number' },
            { key = 'rangedpdif_detail', label = 'Details' },
        },
    },
    {
        name   = 'Crit',
        colors = {
            { key = 'crit_label',  label = 'Label' },
            { key = 'crit_number', label = 'Number' },
            { key = 'crit_detail', label = 'Details' },
        },
    },
    {
        name   = 'Crit taken',
        colors = {
            { key = 'crittaken_label',  label = 'Label' },
            { key = 'crittaken_number', label = 'Number' },
            { key = 'crittaken_detail', label = 'Details' },
        },
    },
    {
        name   = 'Job',
        colors = {
            { key = 'job_label',  label = 'Label' },
            { key = 'job_name',   label = 'Jobs' },
            { key = 'job_detail', label = 'Slash' },
        },
    },
    {
        name   = 'Aggro',
        colors = {
            { key = 'aggro_label',  label = 'Label' },
            { key = 'aggro_words',  label = 'Words' },
            { key = 'aggro_detail', label = 'Details' },
            { key = 'aggro_threat', label = 'Threat' },
            { key = 'aggro_safe',   label = 'Safe' },
        },
    },
    {
        name   = 'Links',
        colors = {
            { key = 'links_label',  label = 'Label' },
            { key = 'links_words',  label = 'Words' },
            { key = 'links_detail', label = 'Details' },
        },
    },
    {
        name   = 'Magic',
        colors = {
            { key = 'magic_label',  label = 'Label' },
            { key = 'magic_name',   label = 'Schools' },
            { key = 'magic_number', label = 'Chances' },
            { key = 'magic_detail', label = 'Details' },
        },
    },
    {
        name   = 'Immunities',
        colors = {
            { key = 'immunities_label',  label = 'Label' },
            { key = 'immunities_name',   label = 'Names' },
            { key = 'immunities_detail', label = 'Details' },
        },
    },
    {
        name   = 'Effects',
        colors = {
            { key = 'effects_label',  label = 'Label' },
            { key = 'effects_name',   label = 'Names' },
            { key = 'effects_buff',   label = 'Buff names' },
            { key = 'effects_time',   label = 'Your times' },
            { key = 'effects_guess',  label = 'Others\' times' },
            { key = 'effects_detail', label = 'Details' },
        },
    },
    {
        name   = 'Elements',
        colors = {
            { key = 'elements_label',  label = 'Label' },
            { key = 'elements_weak',   label = 'Weak' },
            { key = 'elements_resist', label = 'Resists' },
            { key = 'elements_detail', label = 'Details' },
        },
    },
    {
        name   = 'Weapons',
        colors = {
            { key = 'weapons_label',  label = 'Label' },
            { key = 'weapons_weak',   label = 'Weak' },
            { key = 'weapons_resist', label = 'Resists' },
            { key = 'weapons_detail', label = 'Details' },
        },
    },
    {
        name   = 'Monster',
        colors = {
            { key = 'info_label', label = 'Label' },
            { key = 'info_name', label = 'Sections' },
            { key = 'info_value', label = 'Values' },
            { key = 'info_detail', label = 'Details' },
        },
    },
    {
        name   = 'Drops',
        colors = {
            { key = 'drops_label',  label = 'Label' },
            { key = 'drops_name',   label = 'Items' },
            { key = 'drops_number', label = 'Chances' },
            { key = 'drops_detail', label = 'Details' },
        },
    },
    {
        name   = 'Steal',
        colors = {
            { key = 'steal_label',  label = 'Label' },
            { key = 'steal_name',   label = 'Items' },
            { key = 'steal_number', label = 'Chance' },
            { key = 'steal_detail', label = 'Details' },
        },
    },
    {
        name   = 'Pet',
        colors = {
            { key = 'pet_label',  label = 'Label' },
            { key = 'pet_name',   label = 'Name' },
            { key = 'pet_level',  label = 'Level' },
            { key = 'pet_number', label = 'Numbers' },
            { key = 'pet_detail', label = 'Details' },
        },
    },
    {
        name   = 'Grades',
        colors = {
            { key = 'good', label = 'Good' },
            { key = 'ok',   label = 'OK' },
            { key = 'bad',  label = 'Bad' },
        },
    },
    {
        name   = 'Element badges',
        colors = {
            { key = 'badge_fire',    label = 'Fire' },
            { key = 'badge_ice',     label = 'Ice' },
            { key = 'badge_wind',    label = 'Wind' },
            { key = 'badge_earth',   label = 'Earth' },
            { key = 'badge_thunder', label = 'Thunder' },
            { key = 'badge_water',   label = 'Water' },
            { key = 'badge_light',   label = 'Light' },
            { key = 'badge_dark',    label = 'Dark' },
        },
    },
};

-- Every color key, in Appearance order.
printout.COLOR_KEYS = {};
local IS_COLOR_KEY = {};
for _, group in ipairs(printout.COLOR_GROUPS) do
    for _, color in ipairs(group.colors) do
        printout.COLOR_KEYS[#printout.COLOR_KEYS + 1] = color.key;
        IS_COLOR_KEY[color.key] = true;
    end
end

--[[
    What goes between parts, in the order Display lists them. `id` is the one word
    /checkmate divider takes. The symbols are Japanese characters the chat font draws, each a
    Shift-JIS pair from the symbol table in Ashita's libs\chat.lua. Custom prints your own text,
    kept in the separator setting.
]]
printout.DIVIDERS = {
    { id = 'star',         name = 'Star',          text = ' \129\154 ' },   -- BlackStar in chat.lua.
    { id = 'whitestar',    name = 'White star',    text = ' \129\153 ' },   -- WhiteStar in chat.lua.
    { id = 'diamond',      name = 'Diamond',       text = ' \129\159 ' },   -- BlackDiamond in chat.lua.
    { id = 'whitediamond', name = 'White diamond', text = ' \129\158 ' },   -- WhiteDiamond in chat.lua.
    { id = 'circle',       name = 'Circle',        text = ' \129\156 ' },   -- BlackCircle in chat.lua.
    { id = 'dot',          name = 'Middle dot',    text = ' \129\69 ' },    -- MiddleDot in chat.lua.
    { id = 'note',         name = 'Music note',    text = ' \129\237 ' },   -- MusicEighthNote in chat.lua.
    { id = 'arrow',        name = 'Arrow',         text = ' \129\168 ' },   -- RightArrow in chat.lua.
    { id = 'pipe',         name = 'Pipe |',        text = ' | ' },
    { id = 'slash',        name = 'Slash /',       text = ' / ' },
    { id = 'dash',         name = 'Dash -',        text = ' - ' },
    { id = 'spaces',       name = 'Two spaces',    text = '  ' },
    { id = 'custom',       name = 'Custom' },
};

local DIVIDER_BY_ID = {};
local divider_ids = {};
for _, divider in ipairs(printout.DIVIDERS) do
    DIVIDER_BY_ID[divider.id] = divider;
    divider_ids[#divider_ids + 1] = divider.id;
end

-- The divider ids, for the help text and error lines.
printout.DIVIDER_IDS = table.concat(divider_ids, ', ');

--[[
    What goes right after each part's label, in the order Display lists them. Colon comes
    first, then the divider symbols, then a lone space. Custom prints your own text, kept in the
    label_separator setting, and then a space.
]]
printout.LABEL_DIVIDERS = { { id = 'colon', name = 'Colon :', text = ': ' } };
for _, divider in ipairs(printout.DIVIDERS) do
    if (divider.text ~= nil and divider.id ~= 'spaces') then
        printout.LABEL_DIVIDERS[#printout.LABEL_DIVIDERS + 1] = divider;
    end
end
printout.LABEL_DIVIDERS[#printout.LABEL_DIVIDERS + 1] = { id = 'space', name = 'Space only', text = ' ' };
printout.LABEL_DIVIDERS[#printout.LABEL_DIVIDERS + 1] = { id = 'custom', name = 'Custom' };

local LABEL_DIVIDER_BY_ID = {};
local label_divider_ids = {};
for _, divider in ipairs(printout.LABEL_DIVIDERS) do
    LABEL_DIVIDER_BY_ID[divider.id] = divider;
    label_divider_ids[#label_divider_ids + 1] = divider.id;
end

-- The label divider ids, for the help text and error lines.
printout.LABEL_DIVIDER_IDS = table.concat(label_divider_ids, ', ');

--[[
    The game's own element symbols, each a Shift-JIS pair from the symbol table in Ashita's libs\chat.lua, by
    the element names in core\elements.lua.
]]
local ELEMENT_ICONS = {
    fire    = '\239\31',   -- FireIcon in chat.lua.
    ice     = '\239\32',   -- IceIcon in chat.lua.
    wind    = '\239\33',   -- WindIcon in chat.lua.
    earth   = '\239\34',   -- EarthIcon in chat.lua.
    thunder = '\239\35',   -- LightningIcon in chat.lua.
    water   = '\239\36',   -- WaterIcon in chat.lua.
    light   = '\239\37',   -- LightIcon in chat.lua.
    dark    = '\239\38',   -- DarknessIcon in chat.lua.
};

-- Overlay marks carry a kind and id for a picture or hover tip. An end mark closes the text span.
-- These control bytes never reach chat.
local MARK = '\29%s:%s\29';
printout.MARK_PATTERN = '\29(%a+):([%w_]+)\29([^\29]*)';

-- Longest custom divider or custom label divider, in characters.
printout.SEPARATOR_MAX = 8;

-- Longest label or word setting, in characters.
printout.LABEL_MAX = 32;

-- Anything outside the palette prints in cream.
local FALLBACK_COLOR = 106;

--[[
    The /check con from 0 (too weak) to 7 (incredibly tough), worded like the game by its key in
    core\wording.lua, and the color "Color by difficulty" paints it in.
]]
local CONS = {
    [0] = { word = 'con_too_weak',             color = 'too_weak' },
    [1] = { word = 'con_incredibly_easy_prey', color = 'incredibly_easy_prey' },
    [2] = { word = 'con_easy_prey',            color = 'easy_prey' },
    [3] = { word = 'con_decent_challenge',     color = 'decent_challenge' },
    [4] = { word = 'con_even_match',           color = 'even_match' },
    [5] = { word = 'con_tough',                color = 'tough' },
    [6] = { word = 'con_very_tough',           color = 'very_tough' },
    [7] = { word = 'con_incredibly_tough',     color = 'incredibly_tough' },
};

-- Notorious monsters and a few others answer /check with "impossible to gauge" and no con.
local IMPOSSIBLE = { word = 'con_impossible', color = 'impossible_to_gauge' };

-- The /check evasion and defense readings run 0 high, 1 normal and 2 low. Normal says nothing.
local READING_WORDS = { [0] = 'read_high', [2] = 'read_low' };

function printout.safe_color(color)
    return IN_PALETTE[color] and color or FALLBACK_COLOR;
end

function printout.in_palette(color)
    return IN_PALETTE[color] == true;
end

-- Lowercase letters and digits only, so "Lawn green", "lawngreen" and "LAWN-GREEN" match.
function printout.squash(text)
    return (tostring(text or ''):lower():gsub('[^%w]', ''));
end

-- The palette entry with this name or code, in any case and with or without spaces, or nil.
function printout.find_color(word)
    local wanted = printout.squash(word);
    for _, entry in ipairs(printout.PALETTE) do
        if (wanted == tostring(entry.code) or wanted == printout.squash(entry.name)) then
            return entry;
        end
    end
    return nil;
end

-- The color key a word names, in any case, or nil.
function printout.color_key(word)
    local key = tostring(word or ''):lower();
    return IS_COLOR_KEY[key] and key or nil;
end

-- Keeps printable ASCII only. The chat log is Shift-JIS and the settings window types UTF-8.
function printout.clean_text(text)
    return (tostring(text or ''):gsub('[^\32-\126]', ''));
end

-- A Shift-JIS two-byte character. Its lead byte is 0x81-0x9F or 0xE0-0xFC, and its second byte can be a
-- plain letter.
local SJIS_PAIR = '[\129-\159\224-\252].';

-- An auto-translate phrase. 0xFD bytes wrap it. A space or quote byte inside one splits it across two words,
-- so a word can end with the front of a phrase and no closing 0xFD.
local AUTO_TRANSLATE = '\253[^\253]*\253?';

-- Keeps printable ASCII from text typed after a command. The chat line sends it in Shift-JIS. Each
-- auto-translate phrase and two-byte character goes whole, so none of its bytes stay behind as letters.
-- clean_text then drops half-width katakana and anything else outside printable ASCII.
function printout.clean_command_text(text)
    local typed = tostring(text or ''):gsub(AUTO_TRANSLATE, ''):gsub(SJIS_PAIR, '');
    return printout.clean_text(typed);
end

-- The divider with this id or name, in any case, or nil. It looks in printout.DIVIDERS, or in `list`
-- when there is one, like printout.LABEL_DIVIDERS.
function printout.find_divider(name, list)
    local wanted = tostring(name or ''):lower();
    for _, divider in ipairs(list or printout.DIVIDERS) do
        if (divider.id == wanted or divider.name:lower() == wanted) then
            return divider;
        end
    end
    return nil;
end

-- The id of your divider. One that's missing or unknown is Star.
function printout.divider_id(ps)
    return DIVIDER_BY_ID[ps.divider] ~= nil and ps.divider or 'star';
end

-- What goes between parts. Custom prints your separator in printable ASCII.
local function divider_text(ps)
    return DIVIDER_BY_ID[printout.divider_id(ps)].text or printout.clean_text(ps.separator);
end

-- The id of your label divider. One that's missing or unknown is Colon.
function printout.label_divider_id(ps)
    return LABEL_DIVIDER_BY_ID[ps.label_divider] ~= nil and ps.label_divider or 'colon';
end

-- What goes right after a label. Custom prints your text in printable ASCII, then a space.
local function label_divider_text(ps)
    return LABEL_DIVIDER_BY_ID[printout.label_divider_id(ps)].text or (printout.clean_text(ps.label_separator) .. ' ');
end

-- Keeps known part ids once each, in your order. A part added in a newer version goes right after the
-- part before it in the default order, or first when there isn't one. One added at the end of the default
-- order goes last.
function printout.clean_order(order)
    local known, seen, ids = {}, {}, {};
    for _, id in ipairs(printout.PARTS) do
        known[id] = true;
    end
    for id in layout.expand_order(order):gmatch('%S+') do
        if (known[id] and not seen[id]) then
            seen[id] = true;
            ids[#ids + 1] = id;
        end
    end
    for index, id in ipairs(printout.PARTS) do
        if (not seen[id]) then
            local at = 1;
            for place, each in ipairs(ids) do
                if (each == printout.PARTS[index - 1]) then
                    at = place + 1;
                end
            end
            if (index == #printout.PARTS) then
                at = #ids + 1;
            end
            table.insert(ids, at, id);
        end
    end
    return table.concat(ids, ' ');
end

-- Moves one part up (-1) or down (+1) in the order string. The settings window arrows use it.
function printout.move(order, id, step)
    local ids = {};
    for each in order:gmatch('%S+') do
        ids[#ids + 1] = each;
    end
    for i, each in ipairs(ids) do
        local j = i + step;
        if (each == id and ids[j] ~= nil) then
            ids[i], ids[j] = ids[j], ids[i];
            break;
        end
    end
    return table.concat(ids, ' ');
end

local function color_code(color)
    return '\30' .. string.char(printout.safe_color(color));
end

-- Text in one of your chat colors, by its key.
function printout.paint(s, key, text)
    return color_code(s.colors[key]) .. text;
end
local paint = printout.paint;

-- "[checkmate] " in your tag colors, for the start of a line. `word` is the addon's name.
function printout.tag(s, word)
    local brackets = color_code(s.colors.tag_brackets);
    return brackets .. '[' .. color_code(s.colors.tag_word) .. word .. brackets .. '] ';
end

--[[
    What your short form for `key` prints as while short words are on: what you typed, in printable ASCII with no
    spaces at either end, or the full word when that's empty. The one word after a count prints nothing when it's
    empty. The second answer is true when it's the full word.
]]
function printout.short_word(s, key)
    local entry = wording.BY_KEY[key];
    local typed = printout.clean_text(s.short[key]):match('^%s*(.-)%s*$');
    if (typed == '' and not entry.bare) then
        return entry.full, true;
    end
    return typed, false;
end

-- What tells the word for `key` apart from the rest of its spot while short words are on: what it prints as, with
-- the level after a short aggro_from_level, since that always follows it.
function printout.spot_text(s, key)
    local entry = wording.BY_KEY[key];
    local text, full = printout.short_word(s, key);
    return (entry.apart and not full) and wording.example(entry, text) or text;
end

--[[
    Every two words that print the same in one spot while short words are on, ignoring case, like Sight and Sound
    both as "S". Each is { first, second, text }, with the keys in the Abbreviations tab's order and the first one's text,
    in its brackets when both print in the same ones, like "(X)" for the two drop notes.
]]
function printout.clashes(s)
    local out, seen = {}, {};
    for _, entry in ipairs(wording.LIST) do
        if (entry.spot ~= nil) then
            local text = printout.spot_text(s, entry.key);
            local id = entry.spot .. ' ' .. text:lower();
            local first = seen[id];
            if (first == nil) then
                seen[id] = { entry = entry, text = text };
            else
                local around = first.entry.before == entry.before and first.entry.after == entry.after;
                out[#out + 1] = { first = first.entry.key, second = entry.key,
                    text = around and wording.example(first.entry, first.text) or first.text };
            end
        end
    end
    return out;
end

-- The word to print for `key`, short or full by the printout's Abbreviations switch. The second answer is true when
-- it's the full word, the only time it's formatted.
local function word(s, key)
    if (s.printout.short_words) then
        return printout.short_word(s, key);
    end
    return wording.BY_KEY[key].full, true;
end

-- What goes in front of a name: nothing, the game's element symbol with Element icons on, or in the overlay's view
-- a mark the overlay swaps for a picture. `id` is nil when the readout didn't say.
local function icon(s, kind, id)
    local ps = s.printout;
    if (id == nil) then
        return '';
    elseif (ps.marks == true) then
        return MARK:format(kind, id);
    elseif ((kind == 'element' or kind == 'school') and ps.icons == true) then
        return ELEMENT_ICONS[id] or '';
    end
    return '';
end

--[[
    An element's name with its icon in front. A space always goes between them, since Ashita's logs addon strips
    color codes byte by byte and the Fire symbol's second byte looks like one, so the space is what goes instead
    of the F. With Icons only on it's the icon alone. Ice's symbol ends in a space, so nothing may trim the
    spaces off the end of a line. `kind` is 'school' for the element after a Magic school, so the overlay knows
    which part it's in.
]]
local function text_tip(s, kind, id, text)
    if (s.printout.text_tips ~= true) then return text; end
    return MARK:format(kind, id) .. text .. MARK:format('end', 'text');
end

local function element_text(s, key, name, kind)
    local mark = icon(s, kind or 'element', key);
    if (mark == '') then
        return text_tip(s, kind or 'element', key, name);
    end
    local ending = s.printout.marks == true and MARK:format('end', 'text') or '';
    if (s.printout.icons_only == true) then return mark .. ending; end
    return mark .. ' ' .. name .. ending;
end

-- An item, Steal item, immunity or job name with its mark in front, in the overlay's view. Chat has no pictures for
-- them.
local function marked(s, kind, id, name)
    local mark = icon(s, kind, id);
    if (mark == '') then return id ~= nil and text_tip(s, kind, id, name) or name; end
    return mark .. ' ' .. name .. MARK:format('end', 'text');
end

-- Grade cutoffs are percents up to this.
printout.CUTOFF_MAX = 100;

-- Numbers that are better the lower they are. Their cutoffs are the most a Good or OK number can be.
printout.LOWER_IS_BETTER = { crittaken = true };

-- 'good', 'ok' or 'bad', judged by the middle of the range. Each is also its color's key. `lower` is true for a
-- number that's better the lower it is.
local function grade(range, good_at, ok_at, lower)
    local middle = (range.low + range.high) / 2;
    if (lower) then
        if (middle <= good_at) then
            return 'good';
        elseif (middle <= ok_at) then
            return 'ok';
        end
        return 'bad';
    end
    if (middle >= good_at) then
        return 'good';
    elseif (middle >= ok_at) then
        return 'ok';
    end
    return 'bad';
end

-- "72%", "64-72%" or "~68%".
function printout.number_text(range, style)
    local estimate = range.uncertain and '~' or '';
    if (range.low == range.high) then
        return estimate .. ('%d%%'):format(range.low);
    elseif (style == 'midpoint') then
        return ('~%d%%'):format(math.floor((range.low + range.high) / 2 + 0.5));
    end
    return estimate .. ('%d-%d%%'):format(range.low, range.high);
end
local number_text = printout.number_text;

-- Decimal values keep pDIF multipliers separate from percentage chances.
function printout.pdif_span(low, high, places, outward)
    if (type(low) ~= 'number' or type(high) ~= 'number') then return nil; end
    if (outward) then
        local scale = 10 ^ (places or 2);
        low = math.floor(low * scale + 1e-9) / scale;
        high = math.ceil(high * scale - 1e-9) / scale;
    end
    local format = '%.' .. tostring(places or 2) .. 'f';
    local first, last = format:format(low), format:format(high);
    return first == last and first or (first .. '-' .. last);
end

-- Whole seconds as m:ss, like 1:20, each made once and kept, so a countdown never makes a string twice.
local CLOCKS = {};
function printout.clock_text(seconds)
    local text = CLOCKS[seconds];
    if (text == nil) then
        text = ('%d:%02d'):format(math.floor(seconds / 60), seconds % 60);
        CLOCKS[seconds] = text;
    end
    return text;
end

-- The "?" after a number, when a script changes the monster's numbers.
local function scripted_mark(s, key, scripted)
    return scripted and paint(s, key, '?') or '';
end

-- Drop chances print whole above 10% and with one decimal below, like 0.5%.
function printout.chance_text(percent)
    if (percent >= 9.95) then
        return ('%d%%'):format(math.floor(percent + 0.5));
    end
    return ('%.1f%%'):format(percent);
end
local chance_text = printout.chance_text;

local function level_text(result)
    if (result.low == nil) then
        return '?';
    elseif (result.low == result.high) then
        return tostring(result.low);
    end
    return ('%d-%d'):format(result.low, result.high);
end

-- Your `word` in printable ASCII, a space and `text`, or `text` alone when the word is empty.
local function after_word(word, text)
    word = printout.clean_text(word):match('^%s*(.-)%s*$');
    return (word == '') and text or (word .. ' ' .. text);
end

-- "range 40-44" with your range word, or "40-44" when the word is empty.
function printout.range_text(ps, low, high)
    return after_word(ps.range_word, ('%d-%d'):format(low, high));
end

-- "ID 17199202" with your ID word, or "17199202" when the word is empty.
function printout.id_text(ps, id)
    return after_word(ps.id_word, ('%d'):format(id));
end

-- "PH for Valkurm Emperor" with your PH word, or the NM's name alone when the word is empty.
-- Two NMs read "Rhoitos and Polybotes", and three "Rhoitos, Polybotes and Eurytos".
function printout.ph_text(ps, names)
    local list = names[#names];
    if (#names > 1) then
        list = table.concat(names, ', ', 1, #names - 1) .. ' and ' .. list;
    end
    return after_word(ps.ph_word, printout.clean_text(list));
end

--[[
    " (Lv 42)" in the level color. With Show level and Show its level range too on, a known level is
    followed by the levels the monster spawns at, in the range color, like " (Lv 42, range 40-44)".
    A monster that spawns at only one level, has no data, or is at a level outside its range shows
    its level alone.
]]
local function level_value(s, result)
    local ps = s.printout;
    local exact = result.low ~= nil and result.low == result.high;
    local spread = result.range_low ~= nil and result.range_low ~= result.range_high;
    if (not (ps.show_level and ps.show_range and exact and spread)) then
        return paint(s, 'level', (' (Lv %s)'):format(level_text(result)));
    end
    local range = printout.range_text(ps, result.range_low, result.range_high);
    return paint(s, 'level', (' (Lv %d, '):format(result.low)) .. paint(s, 'level_range', range)
        .. paint(s, 'level', ')');
end

--[[
    Each part's value is { text, label_after } or nil when the part has nothing to say. The text is
    already painted in its colors. `label_after` follows the label in the part's detail color, like
    the " (TH 2)" in "Drops (TH 2)".
]]

-- Hit, off-hand, ranged, evade, crit, crit taken or a pet number. The number is in its grade color with grades
-- on, and in the part's number color with them off. `cutoffs` is the part whose grade cutoffs it goes by, `id`
-- when it's nil.
local function retained_mark(s, detail, value)
    if (value.retained and type(value.low) == 'number' and type(value.high) == 'number') then
        return paint(s, detail, ' (' .. word(s, 'num_check_again') .. ')');
    end
    return '';
end

local function number_value(s, id, range, scripted, cutoffs)
    local detail = id .. '_detail';
    if (range == nil) then
        return { text = paint(s, detail, (word(s, 'num_unknown'))) };
    end
    local grades = s.grades;
    local color = id .. '_number';
    if (grades.on) then
        cutoffs = cutoffs or id;
        color = grade(range, grades[cutoffs .. '_good'], grades[cutoffs .. '_ok'],
            printout.LOWER_IS_BETTER[cutoffs] == true);
    end
    return { text = paint(s, color, number_text(range, s.printout.number_style))
        .. scripted_mark(s, detail, scripted) .. retained_mark(s, detail, range) };
end

local STATUS_WORDS = { no_shield = 'num_no_shield', weapon_cannot_parry = 'num_cannot_parry',
    job_unavailable = 'num_job_unavailable', check_again = 'num_check_again',
    no_melee = 'num_no_swings', tp_moves = 'num_tp_moves' };

function printout.status_text(s, value)
    local key = value and STATUS_WORDS[value.status];
    return key and word(s, key) or nil;
end

local function pdif_value(s, id, value)
    local detail, color = id .. '_detail', id .. '_number';
    if (value == nil) then return { text = paint(s, detail, word(s, 'num_unknown')) }; end
    local status = printout.status_text(s, value);
    if (status ~= nil and value.low == nil) then return { text = paint(s, detail, status) }; end
    local unknown, pieces = word(s, 'num_unknown'), {};
    local mode = (s.pdif or {}).mode or 'both';
    local mark = value.uncertain and '~' or '';
    if (mode ~= 'ratio') then
        local range = printout.pdif_span(value.low, value.high, 2, true);
        pieces[#pieces + 1] = paint(s, range and color or detail, range and (mark .. range .. 'x') or unknown);
    end
    if (mode ~= 'range') then
        local ratio = printout.pdif_span(value.ratio_low, value.ratio_high);
        local attack = printout.pdif_span(value.attack, value.attack, 0) or unknown;
        local defense = printout.pdif_span(value.defense_low, value.defense_high, 0) or unknown;
        pieces[#pieces + 1] = paint(s, detail, word(s, 'pdif_ratio') .. ' ')
            .. paint(s, ratio and color or detail, ratio and (mark .. ratio) or unknown)
            .. paint(s, detail, (' (%s %s / %s %s)'):format(word(s, 'pdif_attack'), attack, word(s, 'pdif_defense'), defense));
    end
    return { text = table.concat(pieces, paint(s, detail, '; ')) .. scripted_mark(s, detail, value.scripted)
        .. retained_mark(s, detail, value) };
end

-- Defensive checks keep fractional percentages and use their own colors.
function printout.defense_text(value, style)
    local function number(n) return ('%.2f'):format(n):gsub('0+$', ''):gsub('%.$', ''); end
    local low, high = value.low, value.high;
    local mark = value.uncertain and '~' or '';
    if (low == high) then return mark .. number(low) .. '%'; end
    if (style == 'midpoint') then return '~' .. number((low + high) / 2) .. '%'; end
    low = math.floor(low * 100 + 1e-9) / 100;
    high = math.ceil(high * 100 - 1e-9) / 100;
    return mark .. number(low) .. '-' .. number(high) .. '%';
end

local function defense_value(s, id, value)
    local detail = id .. '_detail';
    if (value ~= nil and value.eligible == false) then
        return { text = paint(s, detail, printout.status_text(s, value) or (word(s, 'num_unavailable'))) };
    end
    if (value == nil or type(value.low) ~= 'number' or type(value.high) ~= 'number') then
        return { text = paint(s, detail, (word(s, 'num_unknown'))) };
    end
    return { text = paint(s, id .. '_number', printout.defense_text(value, s.printout.number_style))
        .. scripted_mark(s, detail, value.scripted) };
end

--[[
    Your ranged hit rate in the sweet spot, graded by the hit rate cutoffs. With Show it outside the sweet
    spot too on, your hit rate at 25 yalms follows in the detail color, like "63% (55% at 25 yalms)". It's
    left out when it prints the same, like when both are 5%.
]]
local function ranged_value(s, result)
    local value = number_value(s, 'ranged', result.ranged, result.scripted, 'hit');
    local near, far = result.ranged, result.ranged_far;
    if (s.ranged.show_far and near ~= nil and far ~= nil) then
        local style = s.printout.number_style;
        local far_text = number_text(far, style);
        if (far_text ~= number_text(near, style)) then
            value.text = value.text .. paint(s, 'ranged_detail', (' (%s %s)'):format(far_text, (word(s, 'num_far'))));
        end
    end
    local distance = result.ranged_distance and result.ranged_distance.distance;
    if (s.ranged.show_distance and type(distance) == 'number' and distance >= 0) then
        value.text = value.text .. paint(s, 'ranged_detail', (' (%.1f %s)'):format(distance, word(s, 'num_distance')));
    end
    return value;
end

--[[
    How often the monster's hits on you crit, graded the other way round. A monster that swings with
    nothing but TP moves says "(TP moves)" in place of the number, since it isn't theirs, and one that never swings
    says "(no swings)". One of them that can counter keeps the number for its counters, with its word after it.
]]
local function crit_taken_value(s, result)
    local swings = (result.no_swings and 'num_no_swings') or (result.tp_moves and 'num_tp_moves') or nil;
    if (swings ~= nil and not result.counters) then
        return { text = paint(s, 'crittaken_detail', '(' .. word(s, swings) .. ')') };
    end
    local value = number_value(s, 'crittaken', result.crittaken, result.scripted);
    if (swings ~= nil) then
        value.text = value.text .. paint(s, 'crittaken_detail', ' (' .. word(s, swings) .. ')');
    end
    return value;
end

local function magic_value(s, result, sep, blue_only)
    local schools = {};
    for _, school in ipairs(result.magic or {}) do
        if ((school.school == 'school_blue') == (blue_only == true)) then
        local chance;
        if (school.word ~= nil) then
            chance = paint(s, 'magic_detail', (word(s, school.word)));
        else
            chance = paint(s, 'magic_number', number_text(school, s.printout.number_style))
                .. scripted_mark(s, 'magic_detail', result.scripted);
        end
        local name = word(s, school.school);
        local text = text_tip(s, 'magic', school.school, paint(s, 'magic_name', name) .. ' ' .. chance);
        if (school.element ~= nil) then
            local name = word(s, wording.ELEMENT_KEYS[school.element]);
            text = text .. paint(s, 'magic_detail', (' (%s)'):format(element_text(s, school.element, name, 'school')));
        end
        schools[#schools + 1] = text;
        end
    end
    if (#schools == 0) then
        return nil;
    end
    return { text = table.concat(schools, paint(s, 'magic_detail', sep)) };
end

-- An effect's name: checkmate's word for it, full or short, or the game's own name for one it has no word for.
local function effect_name(s, each)
    if (each.word ~= nil) then
        return (word(s, each.word));
    end
    return printout.clean_text(each.name);
end

--[[
    "Paralyze 1:20, Slow 2:45 * Protect 27:10": the debuffs, the divider, then the buffs, each with its time left
    while Time left is on. Debuff names print in the Names color and the monster's own buffs in Buff names. Your
    times print in the Your times color and everyone else's in the Others' times color, since nothing tells
    checkmate when theirs end. One with no known length prints its name alone. In the overlay's view each name has
    a mark in front for its picture, and each time is a mark the overlay counts down on its own, so its lines
    aren't made again every second.
]]
local function effects_value(s, result, sep)
    local list = result.effects;
    if (list == nil or #list == 0) then
        if (s.effects.show_empty == true) then
            local key = s.effects.show == 'debuffs' and 'eff_none_debuffs'
                or (s.effects.show == 'buffs' and 'eff_none_buffs' or 'eff_none');
            return { text = text_tip(s, 'effect', 'none', paint(s, 'effects_detail', word(s, key))) };
        end
        return nil;
    end
    local ps, times = s.printout, s.effects.times == true;
    local groups, names, debuff = {}, {}, list[1].debuff;
    for index, each in ipairs(list) do
        if (each.debuff ~= debuff) then
            groups[#groups + 1] = table.concat(names, paint(s, 'effects_detail', ', '));
            names, debuff = {}, each.debuff;
        end
        local text = paint(s, each.debuff and 'effects_name' or 'effects_buff',
            marked(s, 'effect', each.effect, effect_name(s, each)));
        local color = each.mine and 'effects_time' or 'effects_guess';
        local estimate = s.effects.estimate_mark == true and '~' or '';
        if (times and ps.clocks == true and (each.ends ~= nil or each.left ~= nil)) then
            text = text .. paint(s, color, ' ' .. estimate .. MARK:format('clock', index) .. MARK:format('end', 'text'));
        elseif (times and each.left ~= nil) then
            text = text .. paint(s, color, ' ' .. estimate .. printout.clock_text(math.max(0, each.left)));
        end
        names[#names + 1] = text;
    end
    groups[#groups + 1] = table.concat(names, paint(s, 'effects_detail', ', '));
    return { text = table.concat(groups, paint(s, 'effects_detail', sep)) };
end

local function immunities_value(s, result)
    local names = {};
    local immune = {};
    for _, id in ipairs(result.immune or {}) do
        immune[id] = true;
    end
    for _, entry in ipairs(printout.IMMUNITIES) do
        local shown = s.immunities[entry.id];
        if (immune[entry.id] and shown ~= nil and shown.on) then
            names[#names + 1] = paint(s, 'immunities_name',
                marked(s, 'immunity', entry.id, printout.clean_text(shown.label)));
        end
    end
    if (#names == 0) then
        return nil;
    end
    return { text = table.concat(names, paint(s, 'immunities_detail', ', ')) };
end

-- The two lists in the elements part, each with its word's setting and its names' color.
local ELEMENT_GROUPS = {
    { list = 'weak',    word = 'weak_word',   color = 'elements_weak' },
    { list = 'resists', word = 'resist_word', color = 'elements_resist' },
};

-- How strong one element is, like "half", "absorbs 50%" or "+100%", or nil when nothing makes it so.
local function strength_text(s, entry)
    if (entry.strength == nil) then
        return entry.amount;
    end
    local text = word(s, entry.strength);
    return entry.amount and (text .. ' ' .. entry.amount) or text;
end

--[[
    "Weak: Ice, Thunder" with your word and the label divider in the label color, and the names in the
    group's color. With Show how strong on, each name is followed by its strength in parentheses.
    Names in a row with the same strength share it, after the last of them, like "Wind, Earth (half)".
    An empty word leaves the word and its label divider out.
]]
local function element_group(s, group, list, label_sep)
    local names = {};
    for index, entry in ipairs(list) do
        local name = word(s, wording.ELEMENT_KEYS[entry.element]);
        local text = paint(s, group.color, element_text(s, entry.element, name));
        local after = list[index + 1];
        local shared = after ~= nil and after.strength == entry.strength and after.amount == entry.amount;
        local strength = strength_text(s, entry);
        if (s.elements.strength and strength ~= nil and not shared) then
            text = text .. paint(s, 'elements_detail', (' (%s)'):format(strength));
        end
        names[#names + 1] = text;
    end
    local text = table.concat(names, paint(s, 'elements_detail', ', '));
    local label = printout.clean_text(s.elements[group.word]):match('^%s*(.-)%s*$');
    if (label == '') then
        return text;
    end
    return paint(s, 'elements_label', label .. label_sep) .. text;
end

-- "Weak: Ice, Thunder * Resists: Water (half)", then the magic damage note with Show how strong on.
local function elements_value(s, result, sep, label_sep)
    local e = result.elements;
    if (e == nil) then
        return nil;
    end
    local groups = {};
    for _, group in ipairs(ELEMENT_GROUPS) do
        if (#e[group.list] > 0) then
            groups[#groups + 1] = element_group(s, group, e[group.list], label_sep);
        end
    end
    if (s.elements.strength and e.all ~= nil) then
        groups[#groups + 1] = paint(s, 'elements_detail', word(s, 'elem_mdt') .. ' ' .. e.all);
    end
    if (#groups == 0) then
        return nil;
    end
    local text = table.concat(groups, paint(s, 'elements_detail', sep));
    return { text = text .. scripted_mark(s, 'elements_detail', e.scripted and s.elements.script_mark ~= false) };
end

-- Damage-type changes keep their sign and decimal places, even with short words on.
function printout.damage_text(percent)
    return ('%+g%%'):format(percent);
end

local function weapons_value(s, result, sep, label_sep)
    local w = result.weapons;
    if (w == nil) then return nil; end
    local groups = {};
    for _, group in ipairs({ { 'weak', 'weak_word', 'weapons_weak' }, { 'resists', 'resist_word', 'weapons_resist' } }) do
        local names = {};
        for _, entry in ipairs(w[group[1]] or {}) do
            local key = 'weapon_' .. entry.kind;
            if (wording.BY_KEY[key] ~= nil and entry.percent ~= 0) then
                local text = word(s, key) .. ' (' .. printout.damage_text(entry.percent) .. ')';
                names[#names + 1] = paint(s, group[3], marked(s, 'weapon', entry.kind, text));
            end
        end
        if (#names > 0) then
            local label = printout.clean_text(s.weapons[group[2]]):match('^%s*(.-)%s*$');
            groups[#groups + 1] = (label ~= '' and paint(s, 'weapons_label', label .. label_sep) or '')
                .. table.concat(names, paint(s, 'weapons_detail', ', '));
        end
    end
    for _, entry in ipairs(w.general or {}) do
        local amount = entry.signed and printout.damage_text(entry.percent) or ('%g%%'):format(entry.percent);
        local color = entry.signed and entry.percent > 0 and 'weapons_weak' or 'weapons_resist';
        local text = paint(s, 'weapons_label', printout.clean_text(entry.label) .. label_sep)
            .. paint(s, color, amount);
        groups[#groups + 1] = text_tip(s, 'weapon', entry.kind, text);
    end
    if (#groups == 0) then
        if (w.uncertain) then
            return { text = paint(s, 'weapons_detail', text_tip(s, 'weapon', 'unknown', word(s, 'num_unknown'))) };
        end
        if (w.scripted) then
            return { text = paint(s, 'weapons_detail', text_tip(s, 'weapon', 'scripted', word(s, 'note_scripted'))) };
        end
        return nil;
    end
    if (w.uncertain) then
        groups[#groups + 1] = paint(s, 'weapons_detail', text_tip(s, 'weapon', 'unknown', word(s, 'num_unknown')));
    end
    return { text = table.concat(groups, paint(s, 'weapons_detail', sep))
        .. scripted_mark(s, 'weapons_detail', w.scripted) };
end

local function info_value(s, result, id, label_sep, inner_label)
    for _, section in ipairs((result.info or {}).sections or {}) do
        if (section.id == id) then
            local text = paint(s, 'info_value', printout.clean_text(section.value));
            if (inner_label) then
                local key = 'info_' .. id;
                local label = s.printout.short_words and wording.BY_KEY[key] and word(s, key) or layout.LABELS[id];
                text = paint(s, 'info_name', label .. label_sep) .. text;
            end
            -- These marks also allow long facts to wrap while hover tips are off.
            if (s.printout.text_tips ~= nil) then text = MARK:format('info', id) .. text .. MARK:format('end', 'text'); end
            return { text = text };
        end
    end
    return nil;
end

local function weaknesses_value(s, result, sep, label_sep)
    local display, values = s.printout.display or 'chat', {};
    for _, id in ipairs(layout.COMPONENTS) do
        if (layout.component_enabled(s, id, display)) then
            local value;
            if (id == 'elements') then value = elements_value(s, result, sep, label_sep);
            elseif (id == 'weapons') then value = weapons_value(s, result, sep, label_sep);
            elseif (id == 'charm') then value = info_value(s, result, id, label_sep, true);
            elseif (id == 'immunities') then
                value = immunities_value(s, result);
                if (value ~= nil) then
                    local label = printout.clean_text((s.weaknesses or {}).immune_word or 'Immune'):match('^%s*(.-)%s*$');
                    if (label ~= '') then value.text = paint(s, 'immunities_label', label .. label_sep) .. value.text; end
                end
            end
            if (value ~= nil) then values[#values + 1] = value.text; end
        end
    end
    if (#values == 0) then return nil; end
    return { text = table.concat(values, paint(s, 'elements_detail', sep)) };
end

local function blue_value(s, result, sep, label_sep)
    local display, values = s.printout.display or 'chat', {};
    if (layout.blue_enabled(s, 'lessons', display)) then
        local lesson = info_value(s, result, 'blue', label_sep);
        if (lesson ~= nil) then values[#values + 1] = lesson.text; end
    end
    if (layout.blue_enabled(s, 'chance', display)) then
        local chance = magic_value(s, result, sep, true);
        if (chance ~= nil) then values[#values + 1] = chance.text; end
    end
    if (#values == 0) then return nil; end
    return { text = table.concat(values, paint(s, 'info_detail', sep)) };
end

-- "+2 more", or with short words on "+2" and your word for more, or just "+2" when that's empty.
local function more_text(s, count)
    local more = word(s, 'list_more');
    return ('+%d'):format(count) .. ((more ~= '') and (' ' .. more) or '');
end

local function drops_value(s, result, sep)
    local list = result.drops;
    if (list == nil) then
        return nil;
    end
    local items = {};
    for _, item in ipairs(list.items) do
        items[#items + 1] = paint(s, 'drops_name', marked(s, 'item', item.id, item.name)) .. ' '
            .. paint(s, 'drops_number', chance_text(item.chance));
    end
    local text = table.concat(items, paint(s, 'drops_detail', ', '));
    if (list.more > 0) then
        text = text .. paint(s, 'drops_detail', sep .. more_text(s, list.more));
    end
    local notes = {};
    if (s.drops.notes and list.scripted) then
        notes[#notes + 1] = '(' .. word(s, 'drops_scripted') .. ')';
    end
    if (s.drops.notes and list.exp_only) then
        notes[#notes + 1] = '(' .. word(s, 'drops_exp') .. ')';
    end
    if (s.drops.notes and #(list.conditions or {}) > 0) then
        notes[#notes + 1] = '(' .. word(s, 'drops_conditional') .. ')';
    end
    if (#notes > 0) then
        text = text .. paint(s, 'drops_detail', (text == '' and '' or ' ') .. table.concat(notes, ' '));
    end
    if (text == '') then
        return nil;
    end
    local th = s.drops.th_in_label and (' (TH %d)'):format(list.th) or nil;
    return { text = text, label_after = th };
end

--[[
    "Fish Scales (77%)", "Pickaxe or Beastcoin (50-51%)", the item alone when you can't use Steal, or "nothing".
    The chance follows Number ranges, and one that can't be worked out says "(unknown)".
]]
local function steal_value(s, result)
    local st = result.steal;
    if (st == nil) then
        return nil;
    end
    if (#st.items == 0) then
        return { text = paint(s, 'steal_detail', (word(s, 'steal_nothing'))) };
    end
    local names = {};
    for index, name in ipairs(st.items) do
        names[#names + 1] = paint(s, 'steal_name', marked(s, 'steal', st.ids and st.ids[index], name));
    end
    local text = names[#names];
    if (#names > 1) then
        text = table.concat(names, paint(s, 'steal_detail', ', '), 1, #names - 1) .. paint(s, 'steal_detail', ' or ')
            .. text;
    end
    if (st.unknown) then
        text = text .. paint(s, 'steal_detail', ' (' .. word(s, 'num_unknown') .. ')');
    elseif (st.low ~= nil) then
        local chance = paint(s, 'steal_number', number_text(st, s.printout.number_style));
        text = text .. paint(s, 'steal_detail', ' (') .. chance .. paint(s, 'steal_detail', ')');
    end
    if (st.low ~= nil and s.drops.notes) then
        text = text .. paint(s, 'steal_detail', ' (' .. word(s, 'drops_conditional') .. ')');
    end
    return { text = text };
end

-- One job key from the data, like 'drk', as its letters, or your short form of them with short words on. In the
-- overlay's view it has a mark in front, so the overlay can put the job's picture there.
local function job_text(s, key)
    return marked(s, 'job', key, (word(s, 'job_' .. key)));
end

-- True for a job key with letters in core\wording.lua. 'none' has none.
local function known_job(key)
    return key ~= nil and wording.BY_KEY['job_' .. key] ~= nil;
end

--[[
    "DRK/WAR", the monster's main job and its support job, or "DRK" when the support job is the same or none. The
    slash is a color run of its own, so with Icons only on the overlay keeps it between the two pictures. A main job
    checkmate has no letters for leaves the part out, and a support job like that is left off.
]]
local function job_value(s, result)
    local main, sub = (result.job or ''):match('^(%l+)/(%l+)$');
    if (not known_job(main)) then
        return nil;
    end
    local text = paint(s, 'job_name', job_text(s, main));
    if (sub ~= main and known_job(sub)) then
        text = text .. paint(s, 'job_detail', '/') .. paint(s, 'job_name', job_text(s, sub));
    end
    return { text = text };
end

-- Keys as words, joined like "Sight, Sound".
local function word_list(s, keys)
    local out = {};
    for index, key in ipairs(keys) do
        out[index] = word(s, key);
    end
    return table.concat(out, ', ');
end

-- The aggro answer. Only aggro_from_level has a number, which sits inside the full word, "Aggressive if it's level
-- 30 or higher", and goes after a short one with a +, "A if Lv 30+".
local function verdict_text(s, a)
    local text, full = word(s, a.verdict);
    if (a.from == nil) then
        return text;
    end
    return full and text:format(a.from) or (text .. ' ' .. a.from .. '+');
end

-- "Aggressive (Sight, Sound)" with its notes. With Color by threat on, the verdict is in the Threat or Safe
-- color, and with it off in the Words color.
local function aggro_value(s, result)
    local a = result.aggro;
    if (a == nil) then
        return nil;
    end
    local color = 'aggro_words';
    if (s.aggro.threat_colors) then
        color = a.threat and 'aggro_threat' or 'aggro_safe';
    end
    local text = paint(s, color, verdict_text(s, a));
    if (#a.detects > 0) then
        local found = {};
        for index, key in ipairs(a.detects) do
            found[index] = word(s, key);
        end
        -- One that only sees you at night has its hours after it, like "True Sight 18:00-5:59".
        if (a.night ~= nil) then
            found[1] = found[1] .. ' ' .. a.night;
        end
        text = text .. paint(s, 'aggro_detail', (' (%s)'):format(table.concat(found, ', ')));
    end
    for _, key in ipairs(a.notes) do
        local note = word(s, key);
        if (key == 'note_awake') then
            note = note .. ' ' .. a.hours;
        end
        text = text .. paint(s, 'aggro_detail', (' (%s)'):format(note));
    end
    return { text = text };
end

--[[
    "Links with Goblin Thug (Sight), Goblin Weaver (Sight), Giant Bat (Sound)", just "Links" with the
    names off, or "Doesn't link". Each name is followed by how it links, unless it has no words for
    that. With the names off, how they link all together follows, like "Links (Sight, Sound)". With
    short words on, the word for Links goes right in front of the names, like "L Goblin Thug (S)".
]]
local function links_value(s, result, sep)
    local link = result.links;
    if (link == nil) then
        return nil;
    elseif (not link.links) then
        return { text = paint(s, 'links_words', (word(s, 'link_none'))) };
    end
    local links, full = word(s, 'link_links');
    if (link.names == nil) then
        local text = paint(s, 'links_words', links);
        if (link.senses ~= nil and #link.senses > 0) then
            text = text .. paint(s, 'links_detail', (' (%s)'):format(word_list(s, link.senses)));
        end
        return { text = text };
    end
    local names = {};
    for index, name in ipairs(link.names) do
        local text = paint(s, 'links_words', printout.clean_text(name));
        local ways = link.tags and link.tags[index];
        if (ways ~= nil and #ways > 0) then
            local each = {};
            for at, keys in ipairs(ways) do
                each[at] = word_list(s, keys);
            end
            text = text .. paint(s, 'links_detail', (' (%s)'):format(table.concat(each, ' or ')));
        end
        names[#names + 1] = text;
    end
    -- The full word reads "Links with" before the names. A short one just goes in front of them.
    local lead = links .. (full and ' with ' or ' ');
    local text = paint(s, 'links_words', lead) .. table.concat(names, paint(s, 'links_detail', ', '));
    if (link.more > 0) then
        text = text .. paint(s, 'links_detail', sep .. more_text(s, link.more));
    end
    return { text = text };
end

-- The pet part's two numbers, each with its word's setting. Each one grades by the cutoffs of the same name.
local PET_NUMBERS = {
    { id = 'hit',   word = 'hit_word' },
    { id = 'evade', word = 'evade_word' },
};

--[[
    "Wyvern (Lv 75) * Hit: 88% * Evade: 31%". The name is in the pet name color and the level in the pet level
    color. Each number follows its word and the label divider in the pet label color, and grades by the hit rate
    or evade cutoffs. An empty word leaves the word and its label divider out. With Show its name off, the name
    and level are left out.
]]
local function pet_value(s, result, sep, label_sep)
    local p = result.pet;
    if (p == nil) then
        return nil;
    end
    local pieces = {};
    if (s.pet.show_name) then
        local text = paint(s, 'pet_name', printout.clean_text(p.name));
        if (s.pet.show_level) then
            text = text .. paint(s, 'pet_level', (' (Lv %s)'):format(level_text(p)));
        end
        pieces[#pieces + 1] = text;
    end
    for _, entry in ipairs(PET_NUMBERS) do
        local text = number_value(s, 'pet', p[entry.id], p.scripted, entry.id).text;
        local word = printout.clean_text(s.pet[entry.word]):match('^%s*(.-)%s*$');
        if (word ~= '') then
            text = paint(s, 'pet_label', word .. label_sep) .. text;
        end
        pieces[#pieces + 1] = text;
    end
    return { text = table.concat(pieces, paint(s, 'pet_detail', sep)) };
end

-- The name, then its level, then " (ID 17199202)" in the ID color with Show its ID on, then the PH note, like
-- " (PH for Valkurm Emperor)", in the PH color with Show if it's a PH on and the monster a placeholder.
local function name_value(s, result, show_level)
    local text = paint(s, 'name', printout.clean_text(result.name));
    if (show_level) then
        text = text .. level_value(s, result);
    end
    if (s.printout.show_id) then
        text = text .. paint(s, 'id', (' (%s)'):format(printout.id_text(s.printout, result.id)));
    end
    text = text_tip(s, 'level', 'name', text);
    if (s.printout.show_ph and result.ph_for ~= nil) then
        text = text .. text_tip(s, 'ph', 'ph', paint(s, 'ph', (' (%s)'):format(printout.ph_text(s.printout, result.ph_for))));
    end
    return { text = text };
end

-- "Decent Challenge" in its con color, or "Impossible to Gauge". With Color by difficulty off, every
-- con is in the difficulty color.
local function difficulty_value(s, result)
    local con = result.impossible and IMPOSSIBLE or CONS[result.con];
    if (con == nil) then
        return nil;
    end
    return { text = paint(s, s.printout.con_colors and con.color or 'difficulty', (word(s, con.word))) };
end

-- "(High Evasion, Low Defense)", evasion first unless Defense first is on. Left out
-- when both are normal.
local function reading_value(s, result)
    local readings = { { result.reading, 'read_evasion' }, { result.defense, 'read_defense' } };
    if (s.printout.defense_first) then
        readings[1], readings[2] = readings[2], readings[1];
    end
    local pieces = {};
    for _, reading in ipairs(readings) do
        local key = READING_WORDS[reading[1]];
        if (key ~= nil) then
            pieces[#pieces + 1] = paint(s, 'reading', word(s, key) .. ' ' .. word(s, reading[2]));
        end
    end
    if (#pieces == 0) then
        return nil;
    end
    local text = paint(s, 'reading_detail', '(') .. table.concat(pieces, paint(s, 'reading_detail', ', '))
        .. paint(s, 'reading_detail', ')');
    return { text = text };
end

local function all_values(s, result, sep, label_sep)
    local evade = number_value(s, 'evade', result.evade, result.scripted);
    if (result.evade ~= nil and result.signet) then
        evade.text = evade.text .. paint(s, 'evade_detail', ' ' .. word(s, 'num_signet'));
    end
    local values = {
        name       = name_value(s, result, s.printout.show_level),
        difficulty = difficulty_value(s, result),
        reading    = reading_value(s, result),
        hit        = number_value(s, 'hit', result.hit, result.scripted),
        offhand    = result.dual_wield and number_value(s, 'offhand', result.offhand, result.scripted, 'hit') or nil,
        ranged     = result.shoots and ranged_value(s, result) or nil,
        pdif       = pdif_value(s, 'pdif', result.pdif),
        offhandpdif = result.dual_wield and pdif_value(s, 'offhandpdif', result.offhandpdif) or nil,
        rangedpdif = result.shoots and pdif_value(s, 'rangedpdif', result.rangedpdif) or nil,
        evade      = evade,
        block      = defense_value(s, 'block', result.block),
        parry      = defense_value(s, 'parry', result.parry),
        crit       = number_value(s, 'crit', result.crit, result.scripted),
        crittaken  = crit_taken_value(s, result),
        job        = job_value(s, result),
        aggro      = aggro_value(s, result),
        links      = links_value(s, result, sep),
        magic      = magic_value(s, result, sep),
        effects = effects_value(s, result, sep),
        weaknesses = weaknesses_value(s, result, sep, label_sep),
        blue       = blue_value(s, result, sep, label_sep),
        drops      = drops_value(s, result, sep),
        steal      = steal_value(s, result),
        pet        = pet_value(s, result, sep, label_sep),
    };
    for _, id in ipairs(layout.INFO_IDS) do
        if (id ~= 'blue') then values[id] = info_value(s, result, id, label_sep); end
    end
    for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'pdif', 'offhandpdif', 'rangedpdif', 'evade', 'block', 'parry', 'crit', 'crittaken', 'pet', 'reading' }) do
        if (values[id] ~= nil) then
            local pdif = id == 'pdif' or id == 'offhandpdif' or id == 'rangedpdif';
            if (pdif and s.printout.text_tips ~= nil) then
                values[id].text = MARK:format('number', id) .. values[id].text .. MARK:format('end', 'text');
            else
                values[id].text = text_tip(s, 'number', id, values[id].text);
            end
        end
    end
    for _, id in ipairs({ 'aggro', 'links' }) do
        if (values[id] ~= nil) then values[id].text = text_tip(s, id, id, values[id].text); end
    end
    return values;
end

--[[
    One part as chat text. Its label and the label divider are in the part's label color, then comes
    its value. The note after the label, like " (TH 2)", sits before the label divider in the part's
    detail color. A part with no label has no label divider. Its note is followed by a space, and with
    no note it prints its value alone.
]]
local function part_text(s, id, part, value, label_sep)
    local label = (printout.clean_text(part.label):gsub('^%s+', ''));
    if (layout.INFO_SET[id] and label == layout.LABELS[id] and s.printout.short_words
            and wording.BY_KEY['info_' .. id]) then
        label = word(s, 'info_' .. id);
    end
    local after = value.label_after or '';
    if (label == '') then
        after = (after:gsub('^%s+', ''));
        if (after == '') then
            return value.text;
        end
        return paint(s, id .. '_detail', after) .. ' ' .. value.text;
    end
    local text = paint(s, LABEL_COLORS[id], label);
    if (after ~= '') then
        text = text .. paint(s, id .. '_detail', after);
    end
    return text .. paint(s, LABEL_COLORS[id], label_sep) .. value.text;
end

--[[
    Builds the chat lines for one /check. `s` is the settings table and `result` the readout.
    { name, id, ph_for, low, high, range_low, range_high, cant_gauge, con, impossible, reading, defense,
    scripted, hit, dual_wield, offhand, shoots, ranged, ranged_far, evade, signet, crit, crittaken, tp_moves,
    no_swings, counters, job, aggro, links, magic, immune, elements, drops, steal, pet }
    id is the monster's server id from the /check reply.
    crittaken is how often the monster's hits on you crit, tp_moves true when the monster swings with nothing but TP moves, no_swings true when it never swings,
    and counters true when one of those can counter, as physical.readout returns them.
    job is the monster's main and support job as its data row writes them, like 'drk/war', or nil.
    ph_for is the names of the NMs it can pop as a placeholder, or nil when it isn't one.
    range_low and range_high are the levels the monster spawns at around its known level, or nil.
    con is the /check con 0 to 7, and impossible is true for "impossible to gauge". reading and
    defense are the /check evasion and defense readings. aggro is what aggro.readout returns, links what
    aggro.links returns, magic what magic.readout returns, and elements what elements.readout returns,
    with every word in them a key in core\wording.lua. steal is what steal.readout returns, what Steal
    can take and your chance. pet is your pet's { name, low, high, hit, evade, scripted }. Elements
    entries and magic schools carry the element's name in core\elements.lua in `element`, like 'ice', drops
    items their item `id` and steal the item `ids`, so each can have its icon.
    dual_wield is true when you swing an off-hand weapon, and shoots when you can shoot. Without them the
    off-hand and ranged parts are left out. ranged is your ranged hit rate in the sweet spot and ranged_far
    the one at 25 yalms.
    The reading follows the difficulty, or the name when the difficulty doesn't print, joined by a
    space. With neither it stands where the name goes.
    With the game's own /check line hidden, a /check that would print nothing, or can't be gauged,
    still prints the name with its level, the difficulty and the reading.
    Returns five things. The first is the lines ready to print, without the [checkmate] tag. The
    second is the number of the first line holding hit, off-hand, ranged, evade or pDIF, or nil when none of
    them prints. The third is a table that's true at the number of every line holding them. The fourth
    is the number of the line holding the pet part, or nil, and the fifth is true when nothing else
    shares that line.
]]
function printout.lines(s, result)
    local ps = s.printout;
    local sep = divider_text(ps);
    local label_sep = label_divider_text(ps);
    local line_color = color_code(s.colors.line);
    local values = all_values(s, result, sep, label_sep);
    local lines, line, last, waits_at, host = {}, {}, nil, nil, nil;
    local holding = {};
    local pet_at, pet_alone;
    -- True from Aggro's place in the order until another part prints, so Links counts as right after Aggro when
    -- nothing prints between them.
    local at_aggro = false;

    local function end_line()
        if (#line > 0) then
            if (#lines + 1 == pet_at) then
                pet_alone = #line == 1;
            end
            lines[#lines + 1] = line_color .. table.concat(line, line_color .. sep);
            line = {};
        end
    end

    -- The part the reading rides on, or nil when neither the difficulty nor the name prints.
    local function reading_host(always)
        for _, id in ipairs({ 'difficulty', 'name' }) do
            if ((always or ps.parts[id].on) and values[id] ~= nil) then
                return id;
            end
        end
        return nil;
    end

    -- `always` adds the part, and the reading riding on it, even when they're off.
    local function add(id, always)
        local part, value = ps.parts[id], values[id];
        if (part == nil or not (part.on or always) or value == nil) then
            return;
        end
        -- With the extras on their own line, check parts and extras never share a line.
        local kind_changes = ps.extras_own_line and last ~= nil
            and (CHECK_PARTS[last] or false) ~= (CHECK_PARTS[id] or false);
        -- Links right after Aggro takes Aggro's place when Aggro doesn't print, so it starts Aggro's line.
        local takes_aggro = id == 'links' and at_aggro and last ~= 'aggro' and ps.parts.aggro.new_line;
        -- Links printing right after Aggro stays on its line unless it has New line on. The overlay's own lines set
        -- links_by_aggro to keep it there anyway.
        local joins = id == 'links' and last == 'aggro' and (not part.new_line or ps.links_by_aggro == true);
        if (not joins and (part.new_line or takes_aggro or kind_changes)) then
            end_line();
        end
        local text = (id == 'reading') and value.text or part_text(s, id, part, value, label_sep);
        if (id == host and values.reading ~= nil and (ps.parts.reading.on or always)) then
            text = text .. ' ' .. values.reading.text;
        end
        -- Links right after Aggro on the same line carries on from it, with the divider between them in the Links
        -- detail color, like the commas inside a part.
        if (joins) then
            line[#line] = line[#line] .. paint(s, 'links_detail', sep) .. text;
        else
            line[#line + 1] = text;
        end
        last = id;
        at_aggro = id == 'aggro';
        if (WAITING_PARTS[id]) then
            holding[#lines + 1] = true;
            waits_at = waits_at or #lines + 1;
        end
        if (id == 'pet') then
            pet_at = #lines + 1;
        end
    end

    if (not result.cant_gauge) then
        host = reading_host(false);
        add('name');
        if (host == nil) then
            add('reading');
        end
        for id in printout.clean_order(ps.order):gmatch('%S+') do
            at_aggro = at_aggro or id == 'aggro';
            add(id);
        end
    end
    if (ps.replace_game_line and #lines == 0 and #line == 0) then
        values.name = name_value(s, result, true);
        host = reading_host(true);
        for _, id in ipairs(PLAIN_LINE) do
            add(id, true);
        end
    end
    end_line();

    if (result.cant_gauge) then
        local name = printout.clean_text(result.name);
        lines[#lines + 1] = line_color .. name .. ' ' .. word(s, 'line_cant_gauge');
        add('effects');
        end_line();
    end
    return lines, waits_at, holding, pet_at, pet_alone;
end

-- The overlay and its embedded preview share these display choices.
local function overlay_divider(o)
    local divider = printout.find_divider(o.divider, printout.DIVIDERS);
    return divider and (divider.text == nil or not divider.text:find('[\128-\255]')) and divider.id or 'pipe';
end

function printout.overlay_view(s)
    local o, ps = s.overlay, s.printout;
    local own_lines = o.own_lines == true;
    local order = own_lines and ('difficulty ' .. ps.order) or ps.order;
    local parts = {};
    for _, id in ipairs(printout.PARTS) do
        local chat = ps.parts[id];
        local new_line = chat.new_line;
        if (own_lines) then
            new_line = id ~= 'difficulty';
        end
        parts[id] = { on = o.parts[id] == true, label = chat.label, new_line = new_line };
    end
    parts.name = { on = o.parts.name == true, label = ps.parts.name.label, new_line = false };
    parts.reading = { on = o.parts.reading == true };
    local label_divider = printout.find_divider(printout.label_divider_id(ps), printout.LABEL_DIVIDERS);
    local view = setmetatable({
        display = 'overlay',
        parts = parts, replace_game_line = false, extras_own_line = own_lines or ps.extras_own_line,
        links_by_aggro = own_lines,
        order = order,
        divider = overlay_divider(o), separator = o.separator,
        label_divider = (label_divider.text == nil or not label_divider.text:find('[\128-\255]')) and label_divider.id or 'colon',
        show_level = o.show_level == true, show_range = o.show_range == true,
        show_id = o.show_id == true, show_ph = o.show_ph == true, short_words = o.short_words == true,
        icons = false, marks = o.icons == true, icons_only = o.icons_only == true,
        text_tips = o.tips == true,
        clocks = s.effects.times == true,
    }, { __index = ps });
    return setmetatable({ printout = view }, { __index = s });
end


return printout;
