--[[
    The look skins. A skin sets the settings window's colors, corner roundness and spacing, every
    chat color on the Colors tab, and Color by difficulty. It leaves your dividers and the window's
    font alone.

    Each skin holds eleven role colors, like its background and accent. Picking a skin spreads them
    over every window color in WINDOW_COLOR_GROUPS and copies them into look.imgui, so each one
    stays editable. "Reset to skin" copies them in again.

    The Look tab shows Custom once anything a skin set differs from it. Undo takes back the last
    skin pick or Reset to skin, one step only.
]]

local defaults = require('ui.defaults');
local printout = require('core.printout');

-- Ashita's imgui library names the ImGuiCol_ colors below.
require('imgui');

local skins = {};

-- Turns 'c55151' into an ImGui color table.
local function hex(value, alpha)
    return {
        tonumber(value:sub(1, 2), 16) / 255,
        tonumber(value:sub(3, 4), 16) / 255,
        tonumber(value:sub(5, 6), 16) / 255,
        alpha or 1.0,
    };
end
skins.hex = hex;

-- Corner roundness and the space between rows the settings offer, in pixels.
skins.ROUNDING_MAX = 12;
skins.SPACING_MIN  = 2;
skins.SPACING_MAX  = 14;

-- The Minimal skin's chat colors, one code on every key with Color by difficulty off.
local MINIMAL_CHAT = { con_colors = false };
for _, key in ipairs(printout.COLOR_KEYS) do
    MINIMAL_CHAT[key] = 106;
end

--[[
    Every skin, in the order the Look tab lists them. `id` is the one word /checkmate skin takes.
    `tip`, when a skin has one, shows on the Look tab while that skin is picked. Phoenix is the
    default and uses the phoenix-xi.com colors with square corners.
]]
skins.LIST = {
    {
        id   = 'phoenix',
        name = 'Phoenix',
        chat = defaults.PHOENIX_CHAT,
        imgui = {
            background   = hex('180e0e', 0.96),
            card         = hex('291c1c'),
            control      = hex('321f1f'),
            hover        = hex('3a2525'),
            border       = hex('d2abab', 0.20),
            text         = hex('fff8f8'),
            heading      = hex('d2abab'),
            muted        = hex('8a6b6b'),
            accent       = hex('c55151'),
            accent_hover = hex('ff8d79'),
            success      = hex('63ba8a'),
            rounding     = 0,
            spacing      = 7,
        },
    },
    {
        id   = 'classic',
        name = 'Classic FFXI',
        -- Cream text like the game's own chat, moccasin labels, white numbers and grey details.
        -- Threat and resisted elements are tomato. Safe and weak elements are spring green.
        chat = {
            con_colors = true,
            tag_brackets = 81, tag_word = 6, line = 106, replies = 106,
            name = 7, level = 106, level_range = 106, id = 106, ph = 106,
            difficulty = 106, too_weak = 67, incredibly_easy_prey = 106, easy_prey = 2, decent_challenge = 102,
            even_match = 8, tough = 68, very_tough = 76, incredibly_tough = 76, impossible_to_gauge = 5,
            reading = 106, reading_detail = 67,
            hit_label = 7, hit_number = 1, hit_detail = 67,
            evade_label = 7, evade_number = 1, evade_detail = 67,
            crit_label = 7, crit_number = 1, crit_detail = 67,
            aggro_label = 7, aggro_words = 106, aggro_detail = 67, aggro_threat = 76, aggro_safe = 83,
            magic_label = 7, magic_name = 106, magic_number = 1, magic_detail = 67,
            immunities_label = 7, immunities_name = 106, immunities_detail = 67,
            elements_label = 7, elements_weak = 83, elements_resist = 76, elements_detail = 67,
            drops_label = 7, drops_name = 106, drops_number = 1, drops_detail = 67,
            pet_label = 7, pet_name = 106, pet_level = 106, pet_number = 1, pet_detail = 67,
            good = 83, ok = 96, bad = 76,
        },
        imgui = {
            background   = hex('0b1a3d', 0.94),
            card         = hex('13275a'),
            control      = hex('1b3470'),
            hover        = hex('27468c'),
            border       = hex('8ea3d6', 0.55),
            text         = hex('ffffff'),
            heading      = hex('f2e6c4'),
            muted        = hex('9fb0d8'),
            accent       = hex('e8c86a'),
            accent_hover = hex('ffe08a'),
            success      = hex('7ee08a'),
            rounding     = 4,
            spacing      = 7,
        },
    },
    {
        id   = 'minimal',
        name = 'Minimal',
        chat = MINIMAL_CHAT,
        imgui = {
            background   = hex('1e1e1e', 0.96),
            card         = hex('2a2a2a'),
            control      = hex('333333'),
            hover        = hex('404040'),
            border       = hex('ffffff', 0.15),
            text         = hex('f2f2f2'),
            heading      = hex('cfcfcf'),
            muted        = hex('8c8c8c'),
            accent       = hex('d0d0d0'),
            accent_hover = hex('ffffff'),
            success      = hex('9be3b5'),
            rounding     = 3,
            spacing      = 6,
        },
    },
    {
        id   = 'contrast',
        name = 'High contrast',
        -- White text, a yellow name, aqua labels and the brightest con, grade, threat and element colors.
        chat = {
            con_colors = true,
            tag_brackets = 1, tag_word = 69, line = 1, replies = 1,
            name = 69, level = 1, level_range = 1, id = 1, ph = 1,
            difficulty = 1, too_weak = 67, incredibly_easy_prey = 1, easy_prey = 79, decent_challenge = 82,
            even_match = 8, tough = 68, very_tough = 76, incredibly_tough = 76, impossible_to_gauge = 5,
            reading = 1, reading_detail = 92,
            hit_label = 82, hit_number = 1, hit_detail = 92,
            evade_label = 82, evade_number = 1, evade_detail = 92,
            crit_label = 82, crit_number = 1, crit_detail = 92,
            aggro_label = 82, aggro_words = 1, aggro_detail = 92, aggro_threat = 76, aggro_safe = 79,
            magic_label = 82, magic_name = 1, magic_number = 1, magic_detail = 92,
            immunities_label = 82, immunities_name = 1, immunities_detail = 92,
            elements_label = 82, elements_weak = 79, elements_resist = 76, elements_detail = 92,
            drops_label = 82, drops_name = 1, drops_number = 1, drops_detail = 92,
            pet_label = 82, pet_name = 1, pet_level = 1, pet_number = 1, pet_detail = 92,
            good = 79, ok = 69, bad = 76,
        },
        imgui = {
            background   = hex('000000'),
            card         = hex('141414'),
            control      = hex('262626'),
            hover        = hex('3d3d3d'),
            border       = hex('ffffff', 0.70),
            text         = hex('ffffff'),
            heading      = hex('ffe066'),
            muted        = hex('c8c8c8'),
            accent       = hex('ffd000'),
            accent_hover = hex('ffe866'),
            success      = hex('39ff14'),
            rounding     = 0,
            spacing      = 8,
        },
    },
    {
        id   = 'ember',
        name = 'Ember',
        -- Warm tones, a tomato name, pale goldenrod labels and dark salmon details.
        -- Threat and resisted elements are salmon. Safe and weak elements are pale green.
        chat = {
            con_colors = true,
            tag_brackets = 85, tag_word = 8, line = 7, replies = 7,
            name = 76, level = 85, level_range = 85, id = 85, ph = 85,
            difficulty = 78, too_weak = 67, incredibly_easy_prey = 78, easy_prey = 2, decent_challenge = 102,
            even_match = 8, tough = 68, very_tough = 76, incredibly_tough = 76, impossible_to_gauge = 5,
            reading = 78, reading_detail = 85,
            hit_label = 78, hit_number = 7, hit_detail = 85,
            evade_label = 78, evade_number = 7, evade_detail = 85,
            crit_label = 78, crit_number = 7, crit_detail = 85,
            aggro_label = 78, aggro_words = 96, aggro_detail = 85, aggro_threat = 68, aggro_safe = 80,
            magic_label = 78, magic_name = 96, magic_number = 7, magic_detail = 85,
            immunities_label = 78, immunities_name = 96, immunities_detail = 85,
            elements_label = 78, elements_weak = 80, elements_resist = 68, elements_detail = 85,
            drops_label = 78, drops_name = 96, drops_number = 7, drops_detail = 85,
            pet_label = 78, pet_name = 96, pet_level = 85, pet_number = 7, pet_detail = 85,
            good = 80, ok = 69, bad = 68,
        },
        imgui = {
            background   = hex('1a120c', 0.96),
            card         = hex('2a1d12'),
            control      = hex('3a2716'),
            hover        = hex('4a321c'),
            border       = hex('ffb070', 0.25),
            text         = hex('fff4e8'),
            heading      = hex('ffc38a'),
            muted        = hex('a07c5c'),
            accent       = hex('e8742a'),
            accent_hover = hex('ffa04d'),
            success      = hex('8fcf6a'),
            rounding     = 2,
            spacing      = 7,
        },
    },
    {
        id   = 'colorblind',
        name = 'Colorblind safe',
        tip  = 'Colorblind safe never puts red against green. Good numbers, Safe and weak elements are cyan, OK is '
            .. 'yellow, and bad numbers, Threat and resisted elements are coral. The difficulty runs from royal blue '
            .. 'for easy prey, through light cyan and cream, to yellow and coral for tough ones. Impossible to Gauge '
            .. 'is plum. The swatches are close to the game\'s colors, but the shades in game can differ a little. '
            .. 'Print a sample on the Printout or Colors tab to see the real ones.',
        -- Every color that means something stays apart for protanopia and deuteranopia. Cyan is good and
        -- safe, yellow is in between and coral is bad. Weak elements are cyan and resisted ones coral. Very
        -- Tough and Incredibly Tough share coral, and Incredibly Easy Prey and Easy Prey share royal blue.
        chat = {
            con_colors = true,
            tag_brackets = 81, tag_word = 6, line = 106, replies = 106,
            name = 1, level = 1, level_range = 1, id = 1, ph = 1,
            difficulty = 106, too_weak = 67, incredibly_easy_prey = 71, easy_prey = 71, decent_challenge = 92,
            even_match = 106, tough = 69, very_tough = 8, incredibly_tough = 8, impossible_to_gauge = 105,
            reading = 106, reading_detail = 67,
            hit_label = 106, hit_number = 1, hit_detail = 67,
            evade_label = 106, evade_number = 1, evade_detail = 67,
            crit_label = 106, crit_number = 1, crit_detail = 67,
            aggro_label = 106, aggro_words = 106, aggro_detail = 67, aggro_threat = 8, aggro_safe = 6,
            magic_label = 106, magic_name = 106, magic_number = 1, magic_detail = 67,
            immunities_label = 106, immunities_name = 106, immunities_detail = 67,
            elements_label = 106, elements_weak = 6, elements_resist = 8, elements_detail = 67,
            drops_label = 106, drops_name = 106, drops_number = 1, drops_detail = 67,
            pet_label = 106, pet_name = 106, pet_level = 1, pet_number = 1, pet_detail = 67,
            good = 6, ok = 69, bad = 8,
        },
        -- Okabe and Ito's sky blue for done messages and their orange for problems and highlights.
        imgui = {
            background   = hex('101418', 0.96),
            card         = hex('1b2129'),
            control      = hex('252d37'),
            hover        = hex('313b47'),
            border       = hex('56b4e9', 0.30),
            text         = hex('f2f2f2'),
            heading      = hex('9fd3f5'),
            muted        = hex('8f9aa6'),
            accent       = hex('e69f00'),
            accent_hover = hex('f5c04a'),
            success      = hex('56b4e9'),
            rounding     = 2,
            spacing      = 7,
        },
    },
};

--[[
    Every window color, grouped the way the Look tab lists them. `key` is its name in look.imgui and
    the word /checkmate windowcolor takes. `label` is its name on the Look tab. `role` is the skin
    color it starts from, and `paints` is the ImGui color it sets. Headings, notes and done and
    problem messages paint no ImGui color, since checkmate draws them itself. `alpha` replaces the
    role's own see-through amount.
]]
skins.WINDOW_COLOR_GROUPS = {
    {
        name   = 'Text colors',
        colors = {
            { key = 'text',             label = 'Text',             role = 'text',    paints = ImGuiCol_Text },
            { key = 'faded_text',       label = 'Faded text',       role = 'muted',   paints = ImGuiCol_TextDisabled },
            { key = 'headings',         label = 'Headings',         role = 'heading' },
            { key = 'notes',            label = 'Notes',            role = 'heading' },
            { key = 'done_messages',    label = 'Done messages',    role = 'success' },
            { key = 'problem_messages', label = 'Problem messages', role = 'accent' },
            { key = 'selected_text',    label = 'Text highlight',   role = 'accent',  paints = ImGuiCol_TextSelectedBg,
                alpha = 0.35 },
            { key = 'text_cursor',      label = 'Text cursor',      role = 'text',
                paints = ImGuiCol_InputTextCursor },
        },
    },
    {
        name   = 'Window colors',
        colors = {
            { key = 'background',            label = 'Background',             role = 'background',
                paints = ImGuiCol_WindowBg },
            { key = 'border',                label = 'Border',                 role = 'border',
                paints = ImGuiCol_Border },
            { key = 'title_bar',             label = 'Title bar',              role = 'card',
                paints = ImGuiCol_TitleBgActive },
            { key = 'title_bar_unfocused',   label = 'Title bar, unfocused',   role = 'card',
                paints = ImGuiCol_TitleBg },
            { key = 'dropdowns',             label = 'Open dropdowns',         role = 'card',
                paints = ImGuiCol_PopupBg },
            { key = 'table_headers',         label = 'Table headers',          role = 'card',
                paints = ImGuiCol_TableHeaderBg },
            { key = 'heading_lines',         label = 'Heading lines',          role = 'border',
                paints = ImGuiCol_Separator },
            { key = 'resize_corner',         label = 'Resize corner',          role = 'hover',
                paints = ImGuiCol_ResizeGrip },
            { key = 'resize_corner_hovered', label = 'Resize corner, hovered', role = 'accent_hover',
                paints = ImGuiCol_ResizeGripHovered },
            { key = 'resize_corner_held',    label = 'Resize corner, held',    role = 'accent',
                paints = ImGuiCol_ResizeGripActive },
        },
    },
    {
        name   = 'Scrollbar colors',
        colors = {
            { key = 'scrollbar_track',   label = 'Track',        role = 'background',
                paints = ImGuiCol_ScrollbarBg },
            { key = 'scrollbar',         label = 'Bar',          role = 'control',
                paints = ImGuiCol_ScrollbarGrab },
            { key = 'scrollbar_hovered', label = 'Bar, hovered', role = 'hover',
                paints = ImGuiCol_ScrollbarGrabHovered },
            { key = 'scrollbar_held',    label = 'Bar, held',    role = 'accent',
                paints = ImGuiCol_ScrollbarGrabActive },
        },
    },
    {
        name   = 'Box and slider colors',
        colors = {
            { key = 'boxes',               label = 'Boxes',                role = 'control',
                paints = ImGuiCol_FrameBg },
            { key = 'boxes_hovered',       label = 'Boxes, hovered',       role = 'hover',
                paints = ImGuiCol_FrameBgHovered },
            { key = 'boxes_clicked',       label = 'Boxes, clicked',       role = 'hover',
                paints = ImGuiCol_FrameBgActive },
            { key = 'check_marks',         label = 'Check marks',          role = 'accent',
                paints = ImGuiCol_CheckMark },
            { key = 'slider_handles',      label = 'Slider handles',       role = 'accent',
                paints = ImGuiCol_SliderGrab },
            { key = 'slider_handles_held', label = 'Slider handles, held', role = 'accent_hover',
                paints = ImGuiCol_SliderGrabActive },
        },
    },
    {
        name   = 'Button colors',
        colors = {
            { key = 'buttons',         label = 'Buttons',          role = 'control', paints = ImGuiCol_Button },
            { key = 'buttons_hovered', label = 'Buttons, hovered', role = 'hover',   paints = ImGuiCol_ButtonHovered },
            { key = 'buttons_pressed', label = 'Buttons, pressed', role = 'accent',  paints = ImGuiCol_ButtonActive },
        },
    },
    {
        name   = 'List row colors',
        colors = {
            { key = 'row_picked',  label = 'Picked row',   role = 'control', paints = ImGuiCol_Header },
            { key = 'row_hovered', label = 'Row, hovered', role = 'hover',   paints = ImGuiCol_HeaderHovered },
            { key = 'row_clicked', label = 'Row, clicked', role = 'hover',   paints = ImGuiCol_HeaderActive },
        },
    },
    {
        name   = 'Tab colors',
        colors = {
            { key = 'tabs',                    label = 'Tabs',                     role = 'card',
                paints = ImGuiCol_Tab },
            { key = 'tabs_hovered',            label = 'Tabs, hovered',            role = 'hover',
                paints = ImGuiCol_TabHovered },
            { key = 'open_tab',                label = 'Open tab',                 role = 'control',
                paints = ImGuiCol_TabSelected },
            { key = 'open_tab_line',           label = 'Open tab line',            role = 'accent',
                paints = ImGuiCol_TabSelectedOverline },
            { key = 'tabs_unfocused',          label = 'Tabs, unfocused',          role = 'card',
                paints = ImGuiCol_TabDimmed },
            { key = 'open_tab_unfocused',      label = 'Open tab, unfocused',      role = 'control',
                paints = ImGuiCol_TabDimmedSelected },
            { key = 'open_tab_line_unfocused', label = 'Open tab line, unfocused', role = 'accent',
                paints = ImGuiCol_TabDimmedSelectedOverline },
        },
    },
};

-- Every window color in the Look tab's order, and each one by key.
skins.WINDOW_COLORS = {};
local WINDOW_COLOR_BY_KEY = {};
for _, group in ipairs(skins.WINDOW_COLOR_GROUPS) do
    for _, entry in ipairs(group.colors) do
        skins.WINDOW_COLORS[#skins.WINDOW_COLORS + 1] = entry;
        WINDOW_COLOR_BY_KEY[entry.key] = entry;
    end
end

-- The skin ids, for the help text and error lines.
local ids = {};
for _, skin in ipairs(skins.LIST) do
    ids[#ids + 1] = skin.id;
end
skins.IDS = table.concat(ids, ', ');

-- A fresh copy, so a color picker never edits the skin itself.
local function copy(value)
    if (type(value) ~= 'table') then
        return value;
    end
    local out = {};
    for key, inner in pairs(value) do
        out[key] = copy(inner);
    end
    return out;
end

-- The skin with this id or name, in any case, or nil.
function skins.find(name)
    local wanted = tostring(name or ''):lower();
    for _, skin in ipairs(skins.LIST) do
        if (skin.id == wanted or skin.name:lower() == wanted) then
            return skin;
        end
    end
    return nil;
end

-- The window color a word names, in any case, or nil.
function skins.window_color(word)
    return WINDOW_COLOR_BY_KEY[tostring(word or ''):lower()];
end

-- A window color is four numbers.
local function is_color(value)
    if (type(value) ~= 'table') then
        return false;
    end
    for i = 1, 4 do
        if (type(value[i]) ~= 'number') then
            return false;
        end
    end
    return true;
end

-- One window color from a role color, as a fresh table.
local function from_role(color, entry)
    return { color[1], color[2], color[3], entry.alpha or color[4] };
end

-- Every window color the skin spreads its roles over, with its corner roundness and spacing.
local function window_look(skin)
    local look = { rounding = skin.imgui.rounding, spacing = skin.imgui.spacing };
    for _, entry in ipairs(skins.WINDOW_COLORS) do
        look[entry.key] = from_role(skin.imgui[entry.role], entry);
    end
    return look;
end

--[[
    What the last skin pick or Reset to skin replaced, for Undo. It's one step, so a second Undo does
    nothing. It's dropped when the settings are reset, a profile loads or another character logs in.
]]
local undo = nil;

-- Keeps a copy of everything a skin sets.
local function remember(settings)
    local colors = {};
    for _, key in ipairs(printout.COLOR_KEYS) do
        colors[key] = settings.colors[key];
    end
    undo = {
        colors     = colors,
        con_colors = settings.printout.con_colors,
        skin       = settings.look.skin,
        imgui      = copy(settings.look.imgui),
    };
end

-- Copies the skin's chat colors, Color by difficulty and window look into `settings`, and keeps what
-- they replace for Undo. False when there's no such skin.
function skins.apply(settings, name)
    local skin = skins.find(name);
    if (skin == nil) then
        return false;
    end

    remember(settings);
    for _, key in ipairs(printout.COLOR_KEYS) do
        settings.colors[key] = skin.chat[key];
    end
    settings.printout.con_colors = skin.chat.con_colors;

    settings.look.skin = skin.id;
    settings.look.imgui = window_look(skin);
    return true;
end

-- Puts back what the last skin pick or Reset to skin replaced. False when there's nothing to undo.
function skins.undo(settings)
    if (undo == nil) then
        return false;
    end
    for key, code in pairs(undo.colors) do
        settings.colors[key] = code;
    end
    settings.printout.con_colors = undo.con_colors;
    settings.look.skin = undo.skin;
    settings.look.imgui = undo.imgui;
    undo = nil;
    return true;
end

function skins.can_undo()
    return undo ~= nil;
end

-- The settings were reset, a profile loaded or another character logged in, so the kept look is old.
function skins.forget_undo()
    undo = nil;
end

-- Saved colors can come back a hair off after a trip through the settings file.
local COLOR_SLACK = 0.002;

-- True when a window color is still its skin's role color, with its own see-through amount.
local function same_color(mine, entry, skin)
    if (not is_color(mine)) then
        return false;
    end
    local want = skin.imgui[entry.role];
    for i = 1, 3 do
        if (math.abs(mine[i] - want[i]) > COLOR_SLACK) then
            return false;
        end
    end
    return math.abs(mine[4] - (entry.alpha or want[4])) <= COLOR_SLACK;
end

-- The skin you picked, or nil once a chat color, Color by difficulty, a window color, the corner
-- roundness or the spacing differs from it. The Look tab shows nil as Custom.
function skins.current(settings)
    local skin = skins.find(settings.look.skin);
    if (skin == nil or settings.printout.con_colors ~= skin.chat.con_colors) then
        return nil;
    end
    for _, key in ipairs(printout.COLOR_KEYS) do
        if (settings.colors[key] ~= skin.chat[key]) then
            return nil;
        end
    end
    local look = settings.look.imgui;
    if (look.rounding ~= skin.imgui.rounding or look.spacing ~= skin.imgui.spacing) then
        return nil;
    end
    for _, entry in ipairs(skins.WINDOW_COLORS) do
        if (not same_color(look[entry.key], entry, skin)) then
            return nil;
        end
    end
    return skin;
end

--[[
    Puts your window look in a new table, with anything missing or broken from your skin, or from
    Phoenix when the skin is unknown. A first install and /checkmate reset start with no window look
    at all.
]]
function skins.fill(settings)
    local look = settings.look;
    local skin = skins.find(look.skin) or skins.LIST[1];
    local saved = type(look.imgui) == 'table' and look.imgui or {};
    local fixed = window_look(skin);
    for _, entry in ipairs(skins.WINDOW_COLORS) do
        local mine = rawget(saved, entry.key);
        if (is_color(mine)) then
            fixed[entry.key] = copy(mine);
        end
    end
    for _, key in ipairs({ 'rounding', 'spacing' }) do
        if (type(rawget(saved, key)) == 'number') then
            fixed[key] = saved[key];
        end
    end
    look.imgui = fixed;
end

return skins;
