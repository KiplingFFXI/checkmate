--[[
    Builds the chat lines printed after a /check.

    The printout is a list of parts. The name part, which holds the level, always comes first. The
    rest print in the order you set, stored as one string of part ids so Ashita's settings merge
    can't scramble it. Each part turns on and off, and has its own label and New line box. A label is
    followed by the label divider, like the colon in "Aggro: Aggressive". The evasion and defense
    reading isn't a part you move. It follows the difficulty in parentheses.
    Every piece of text has its own chat color in the colors settings. Each one is a code from a fixed
    palette.
]]

local printout = {};

-- Parts after the name, in their default order.
printout.PARTS = { 'difficulty', 'hit', 'evade', 'crit', 'aggro', 'magic', 'immunities', 'elements', 'drops', 'pet' };
printout.DEFAULT_ORDER = table.concat(printout.PARTS, ' ');

-- The color each part's label and label divider print in.
local LABEL_COLORS = {
    name = 'name', difficulty = 'difficulty', hit = 'hit_label', evade = 'evade_label', crit = 'crit_label',
    aggro = 'aggro_label', magic = 'magic_label', immunities = 'immunities_label', elements = 'elements_label',
    drops = 'drops_label', pet = 'pet_label',
};

-- Parts the /check reply itself answers, and the reading when it prints on its own. Every other part
-- is an extra checkmate works out.
local CHECK_PARTS = { name = true, difficulty = true, reading = true };

-- The same parts in order, with the reading riding on them. They stand in for the game's own /check
-- line when it's hidden and nothing else prints, or the monster can't be gauged.
local PLAIN_LINE = { 'name', 'difficulty' };

-- Parts whose numbers wait for the /checkparam <me> reply. The pet part waits for its own reply, which
-- never holds up another line.
local WAITING_PARTS = { hit = true, evade = true };

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
    the color checker uses for Decent Challenge.
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
    Every chat color, grouped the way the Colors tab lists them. `key` is its name in your colors
    settings and the word /checkmate color takes, and `label` its name on the Colors tab. Details are
    the small extras in a part, like "with Signet", "unknown", the "?", "(Ice)", "+2 more" and the
    commas and dividers inside it.
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
        name   = 'Evade',
        colors = {
            { key = 'evade_label',  label = 'Label' },
            { key = 'evade_number', label = 'Number' },
            { key = 'evade_detail', label = 'Details' },
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
        name   = 'Elements',
        colors = {
            { key = 'elements_label',  label = 'Label' },
            { key = 'elements_weak',   label = 'Weak' },
            { key = 'elements_resist', label = 'Resists' },
            { key = 'elements_detail', label = 'Details' },
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
};

-- Every color key, in the Colors tab's order.
printout.COLOR_KEYS = {};
local IS_COLOR_KEY = {};
for _, group in ipairs(printout.COLOR_GROUPS) do
    for _, color in ipairs(group.colors) do
        printout.COLOR_KEYS[#printout.COLOR_KEYS + 1] = color.key;
        IS_COLOR_KEY[color.key] = true;
    end
end

--[[
    What goes between parts, in the order the Printout tab lists them. `id` is the one word
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
    { id = 'arrow',        name = 'Arrow',         text = ' \129\168 ' },   -- RightArrow in chat.lua, like checker.
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
    What goes right after each part's label, in the order the Printout tab lists them. Colon comes
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

-- Longest custom divider or custom label divider, in characters.
printout.SEPARATOR_MAX = 8;

-- Longest label or word setting, in characters.
printout.LABEL_MAX = 32;

-- Anything outside the palette prints in cream.
local FALLBACK_COLOR = 106;

-- A number that couldn't be worked out, like hit rate when /checkparam never answered.
local UNKNOWN = 'unknown';

--[[
    The /check con from 0 (too weak) to 7 (incredibly tough), worded like the game, and the color
    "Color by difficulty" paints it in.
]]
local CONS = {
    [0] = { text = 'Too Weak',             color = 'too_weak' },
    [1] = { text = 'Incredibly Easy Prey', color = 'incredibly_easy_prey' },
    [2] = { text = 'Easy Prey',            color = 'easy_prey' },
    [3] = { text = 'Decent Challenge',     color = 'decent_challenge' },
    [4] = { text = 'Even Match',           color = 'even_match' },
    [5] = { text = 'Tough',                color = 'tough' },
    [6] = { text = 'Very Tough',           color = 'very_tough' },
    [7] = { text = 'Incredibly Tough',     color = 'incredibly_tough' },
};

-- Notorious monsters and a few others answer /check with "impossible to gauge" and no con.
local IMPOSSIBLE = { text = 'Impossible to Gauge', color = 'impossible_to_gauge' };

-- The /check evasion and defense readings run 0 high, 1 normal and 2 low. Normal says nothing.
local READING_WORDS = { [0] = 'High', [2] = 'Low' };

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
    for id in tostring(order or ''):gmatch('%S+') do
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

-- Grade cutoffs are percents up to this.
printout.CUTOFF_MAX = 100;

-- 'good', 'ok' or 'bad', judged by the middle of the range. Each is also its color's key.
local function grade(range, good_at, ok_at)
    local middle = (range.low + range.high) / 2;
    if (middle >= good_at) then
        return 'good';
    elseif (middle >= ok_at) then
        return 'ok';
    end
    return 'bad';
end

-- "72%", "64-72%" or "~68%".
local function number_text(range, style)
    if (range.low == range.high) then
        return ('%d%%'):format(range.low);
    elseif (style == 'midpoint') then
        return ('~%d%%'):format(math.floor((range.low + range.high) / 2 + 0.5));
    end
    return ('%d-%d%%'):format(range.low, range.high);
end

-- The "?" after a number, when a script changes the monster's numbers.
local function scripted_mark(s, key, scripted)
    return scripted and paint(s, key, '?') or '';
end

-- Drop chances print whole above 10% and with one decimal below, like 0.5%.
local function chance_text(percent)
    if (percent >= 9.95) then
        return ('%d%%'):format(math.floor(percent + 0.5));
    end
    return ('%.1f%%'):format(percent);
end

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

-- Hit, evade, crit or a pet number. The number is in its grade color with grades on, and in the part's
-- number color with them off. `cutoffs` is the part whose grade cutoffs it goes by, `id` when it's nil.
local function number_value(s, id, range, scripted, cutoffs)
    local detail = id .. '_detail';
    if (range == nil) then
        return { text = paint(s, detail, UNKNOWN) };
    end
    local grades = s.grades;
    local color = id .. '_number';
    if (grades.on) then
        cutoffs = cutoffs or id;
        color = grade(range, grades[cutoffs .. '_good'], grades[cutoffs .. '_ok']);
    end
    return { text = paint(s, color, number_text(range, s.printout.number_style))
        .. scripted_mark(s, detail, scripted) };
end

local function magic_value(s, result, sep)
    local schools = {};
    for _, school in ipairs(result.magic or {}) do
        local chance;
        if (school.word ~= nil) then
            chance = paint(s, 'magic_detail', school.word);
        else
            chance = paint(s, 'magic_number', number_text(school, s.printout.number_style))
                .. scripted_mark(s, 'magic_detail', result.scripted);
        end
        local text = paint(s, 'magic_name', school.label) .. ' ' .. chance;
        if (school.element ~= nil) then
            text = text .. paint(s, 'magic_detail', (' (%s)'):format(school.element));
        end
        schools[#schools + 1] = text;
    end
    if (#schools == 0) then
        return nil;
    end
    return { text = table.concat(schools, paint(s, 'magic_detail', sep)) };
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
            names[#names + 1] = paint(s, 'immunities_name', printout.clean_text(shown.label));
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

--[[
    "Weak: Ice, Thunder" with your word and the label divider in the label color, and the names in the
    group's color. With Show how strong on, each name is followed by its strength in parentheses.
    Names in a row with the same strength share it, after the last of them, like "Wind, Earth (half)".
    An empty word leaves the word and its label divider out.
]]
local function element_group(s, group, list, label_sep)
    local names = {};
    for index, entry in ipairs(list) do
        local text = paint(s, group.color, entry.name);
        local after = list[index + 1];
        local shared = after ~= nil and after.strength == entry.strength;
        if (s.elements.strength and entry.strength ~= nil and not shared) then
            text = text .. paint(s, 'elements_detail', (' (%s)'):format(entry.strength));
        end
        names[#names + 1] = text;
    end
    local text = table.concat(names, paint(s, 'elements_detail', ', '));
    local word = printout.clean_text(s.elements[group.word]):match('^%s*(.-)%s*$');
    if (word == '') then
        return text;
    end
    return paint(s, 'elements_label', word .. label_sep) .. text;
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
        groups[#groups + 1] = paint(s, 'elements_detail', 'Magic damage ' .. e.all);
    end
    if (#groups == 0) then
        return nil;
    end
    local text = table.concat(groups, paint(s, 'elements_detail', sep));
    return { text = text .. scripted_mark(s, 'elements_detail', e.scripted) };
end

local function drops_value(s, result, sep)
    local list = result.drops;
    if (list == nil) then
        return nil;
    end
    local items = {};
    for _, item in ipairs(list.items) do
        items[#items + 1] = paint(s, 'drops_name', item.name) .. ' '
            .. paint(s, 'drops_number', chance_text(item.chance));
    end
    local text = table.concat(items, paint(s, 'drops_detail', ', '));
    if (list.more > 0) then
        text = text .. paint(s, 'drops_detail', sep .. ('+%d more'):format(list.more));
    end
    local notes = {};
    if (s.drops.notes and list.scripted) then
        notes[#notes + 1] = '(plus scripted drops)';
    end
    if (s.drops.notes and list.exp_only) then
        notes[#notes + 1] = '(only drops if you get EXP)';
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
    "Links with Goblin Thug (Sight), Goblin Weaver (Sight), Giant Bat (Sound)", just "Links" with the
    names off, or "Doesn't link". Each name is followed by how it links, unless it has no words for
    that. With the names off, how they link all together follows, like "Links (Sight, Sound)".
]]
local function links_text(s, a, sep)
    if (not a.links) then
        return paint(s, 'aggro_words', 'Doesn\'t link');
    elseif (a.names == nil) then
        local text = paint(s, 'aggro_words', 'Links');
        if (a.senses ~= nil and #a.senses > 0) then
            text = text .. paint(s, 'aggro_detail', (' (%s)'):format(table.concat(a.senses, ', ')));
        end
        return text;
    end
    local names = {};
    for index, name in ipairs(a.names) do
        local text = paint(s, 'aggro_words', printout.clean_text(name));
        local tag = a.tags and a.tags[index] or '';
        if (tag ~= '') then
            text = text .. paint(s, 'aggro_detail', (' (%s)'):format(tag));
        end
        names[#names + 1] = text;
    end
    local text = paint(s, 'aggro_words', 'Links with ') .. table.concat(names, paint(s, 'aggro_detail', ', '));
    if (a.more > 0) then
        text = text .. paint(s, 'aggro_detail', sep .. ('+%d more'):format(a.more));
    end
    return text;
end

-- "Aggressive (Sight, Sound)" with its notes, then the links. With Color by threat on, the verdict is
-- in the Threat or Safe color, and with it off in the Words color.
local function aggro_value(s, result, sep)
    local a = result.aggro;
    if (a == nil) then
        return nil;
    end
    local color = 'aggro_words';
    if (s.aggro.threat_colors) then
        color = a.threat and 'aggro_threat' or 'aggro_safe';
    end
    local text = paint(s, color, a.text);
    if (#a.detects > 0) then
        text = text .. paint(s, 'aggro_detail', (' (%s)'):format(table.concat(a.detects, ', ')));
    end
    for _, note in ipairs(a.notes) do
        text = text .. paint(s, 'aggro_detail', (' (%s)'):format(note));
    end
    return { text = text .. paint(s, 'aggro_detail', sep) .. links_text(s, a, sep) };
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
    if (s.printout.show_ph and result.ph_for ~= nil) then
        text = text .. paint(s, 'ph', (' (%s)'):format(printout.ph_text(s.printout, result.ph_for)));
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
    return { text = paint(s, s.printout.con_colors and con.color or 'difficulty', con.text) };
end

-- "(High Evasion, Low Defense)", evasion first like checker unless Defense first is on. Left out
-- when both are normal.
local function reading_value(s, result)
    local readings = { { result.reading, ' Evasion' }, { result.defense, ' Defense' } };
    if (s.printout.defense_first) then
        readings[1], readings[2] = readings[2], readings[1];
    end
    local words = {};
    for _, reading in ipairs(readings) do
        local word = READING_WORDS[reading[1]];
        if (word ~= nil) then
            words[#words + 1] = paint(s, 'reading', word .. reading[2]);
        end
    end
    if (#words == 0) then
        return nil;
    end
    local text = paint(s, 'reading_detail', '(') .. table.concat(words, paint(s, 'reading_detail', ', '))
        .. paint(s, 'reading_detail', ')');
    return { text = text };
end

local function all_values(s, result, sep, label_sep)
    local evade = number_value(s, 'evade', result.evade, result.scripted);
    if (result.evade ~= nil and result.signet) then
        evade.text = evade.text .. paint(s, 'evade_detail', ' with Signet');
    end
    return {
        name       = name_value(s, result, s.printout.show_level),
        difficulty = difficulty_value(s, result),
        reading    = reading_value(s, result),
        hit        = number_value(s, 'hit', result.hit, result.scripted),
        evade      = evade,
        crit       = number_value(s, 'crit', result.crit, result.scripted),
        aggro      = aggro_value(s, result, sep),
        magic      = magic_value(s, result, sep),
        immunities = immunities_value(s, result),
        elements   = elements_value(s, result, sep, label_sep),
        drops      = drops_value(s, result, sep),
        pet        = pet_value(s, result, sep, label_sep),
    };
end

--[[
    One part as chat text. Its label and the label divider are in the part's label color, then comes
    its value. The note after the label, like " (TH 2)", sits before the label divider in the part's
    detail color. A part with no label has no label divider. Its note is followed by a space, and with
    no note it prints its value alone.
]]
local function part_text(s, id, part, value, label_sep)
    local label = (printout.clean_text(part.label):gsub('^%s+', ''));
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
    scripted, hit, evade, signet, crit, aggro, magic, immune, elements, drops, pet }
    id is the monster's server id from the /check reply.
    ph_for is the names of the NMs it can pop as a placeholder, or nil when it isn't one.
    range_low and range_high are the levels the monster spawns at around its known level, or nil.
    con is the /check con 0 to 7, and impossible is true for "impossible to gauge". reading and
    defense are the /check evasion and defense readings. aggro is what aggro.readout returns, and
    elements what elements.readout returns. pet is your pet's { name, low, high, hit, evade, scripted }.
    The reading follows the difficulty, or the name when the difficulty doesn't print, joined by a
    space. With neither it stands where the name goes.
    With the game's own /check line hidden, a /check that would print nothing, or can't be gauged,
    still prints the name with its level, the difficulty and the reading.
    Returns five things. The first is the lines ready to print, without the [checkmate] tag. The
    second is the number of the first line holding hit or evade, or nil when neither prints. The third
    is a table that's true at the number of every line holding them. The fourth is the number of the
    line holding the pet part, or nil, and the fifth is true when nothing else shares that line.
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
        if (part.new_line or kind_changes) then
            end_line();
        end
        local text = (id == 'reading') and value.text or part_text(s, id, part, value, label_sep);
        if (id == host and values.reading ~= nil and (ps.parts.reading.on or always)) then
            text = text .. ' ' .. values.reading.text;
        end
        line[#line + 1] = text;
        last = id;
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
        lines[#lines + 1] = line_color .. ('%s can\'t be gauged. Widescan it first for its numbers.'):format(name);
    end
    return lines, waits_at, holding, pet_at, pet_alone;
end

return printout;
