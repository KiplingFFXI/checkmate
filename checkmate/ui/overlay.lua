--[[
    The target overlay. It starts off and sends no commands. Its lines use the chat printout's words
    with the overlay's parts, font and dividers. Layout is kept until the readout or settings change.
    Effects count down in fixed spaces so the names stay put.

    Clicks pass through to the game unless Shift lets you move or resize the unlocked panel. Hover
    help works on text and icons without taking the mouse. A steady frame reads the target, active
    hide flags and any needed mouse state. core.target checks changing combat inputs separately.
]]

local ffi         = require('ffi');
local imgui       = require('imgui');
local printout    = require('core.printout');
local packets     = require('core.packets');
local player      = require('core.player');
local target      = require('core.target');
local effects     = require('core.effects');
local defaults    = require('ui.defaults');
local chat_colors = require('ui.chat_colors');
local icons       = require('ui.icons');
local tips        = require('ui.tips');
local window_font = require('ui.window_font');

local overlay = {};

ffi.cdef[[
    short __stdcall GetAsyncKeyState(int vKey);
]];

-- Windows' key code for Shift, either one.
local VK_SHIFT = 0x10;

-- The parts the overlay can show, in the parts table's default order. Its own settings keep which are on.
overlay.PARTS = { 'name', 'difficulty', 'reading', 'hit', 'pdif', 'offhand', 'offhandpdif', 'ranged', 'rangedpdif', 'evade', 'block', 'parry', 'crit', 'crittaken', 'job', 'aggro', 'links', 'magic',
    'effects', 'weaknesses', 'family', 'vitals', 'movement', 'pursuit', 'spawn', 'claim', 'dangers', 'blue',
    'fight', 'traits', 'crystal', 'rewards', 'drops', 'steal', 'pet' };
local IS_PART = {};
for _, id in ipairs(overlay.PARTS) do
    IS_PART[id] = true;
end

function overlay.is_part(id)
    return IS_PART[id] == true;
end

-- The highest the overlay's background opacity, wrap width and spot can go.
overlay.OPACITY_MAX = 100;
overlay.WRAP_MAX    = 1600;
overlay.SPOT_MAX    = 16384;

-- The narrowest you can drag its corner to, in pixels of text. A piece wider than that still stays whole.
overlay.CORNER_MIN  = 100;

-- The chat's dividers the overlay can draw. The symbols are Shift-JIS characters from the game's chat font,
-- which ImGui can't draw.
local function drawable(divider)
    return divider.text == nil or not divider.text:find('[\128-\255]');
end

overlay.DIVIDERS = {};
local DIVIDER_BY_ID = {};
local divider_ids = {};
for _, divider in ipairs(printout.DIVIDERS) do
    if (drawable(divider)) then
        overlay.DIVIDERS[#overlay.DIVIDERS + 1] = divider;
        DIVIDER_BY_ID[divider.id] = divider;
        divider_ids[#divider_ids + 1] = divider.id;
    end
end

-- The overlay's divider ids, for the help text and error lines.
overlay.DIVIDER_IDS = table.concat(divider_ids, ', ');

-- The id of the overlay's divider. One that's missing, unknown or a chat font symbol is the pipe.
function overlay.divider_id(o)
    return DIVIDER_BY_ID[o.divider] ~= nil and o.divider or 'pipe';
end

-- What goes between parts in the overlay, the same text printout.lines puts there.
local function divider_text(o)
    return DIVIDER_BY_ID[overlay.divider_id(o)].text or printout.clean_text(o.separator);
end

--[[
    A view of your settings for printout.lines. It has the overlay's parts with the chat's labels, the
    overlay's name switches, abbreviations switch and divider, and everything else from your settings. With
    each part on its own line, the difficulty always goes right after the name, so the top line is the name,
    difficulty and reading, and Links stays on Aggro's line when nothing shows between them. A
    chat label divider that's a symbol becomes a colon. The chat's element symbols never show here. With Show
    icons on it asks printout for marks instead.
]]
local function view_of(s)
    return printout.overlay_view(s);
end

-- Text in one color, cleaned to printable ASCII, unless nothing's left.
local function add_text(runs, code, text, kind, id)
    text = printout.clean_text(text);
    if (text ~= '') then
        runs[#runs + 1] = { code = code, text = text, tip_kind = kind, tip_id = id };
    end
end

--[[
    One printout line as runs of one color each. Item names come from the game's resources as they are, and ImGui
    can't draw the chat font's bytes, so all text is cleaned to printable ASCII here. Each mark printout put in for
    an icon becomes a run of its own, { code, kind, id, word }, with its text through the closing end mark.
]]
local function runs_of(line)
    local runs = {};
    local active_kind, active_id;
    for code, text in line:gmatch('\30(.)([^\30]*)') do
        local byte = code:byte();
        add_text(runs, byte, text:match('^[^\29]*'), active_kind, active_id);
        for kind, id, word in text:gmatch(printout.MARK_PATTERN) do
            if (kind == 'end') then
                local previous = runs[#runs];
                local spaces = word:match('^%s+');
                if (spaces ~= nil and previous ~= nil and previous.word ~= nil and previous.kind ~= 'clock') then
                    previous.word = previous.word .. spaces;
                    word = word:sub(#spaces + 1);
                end
                active_kind, active_id = nil, nil;
                add_text(runs, byte, word);
            else
                active_kind, active_id = kind, id;
                runs[#runs + 1] = { code = byte, kind = kind, id = id, word = word };
            end
        end
    end
    return runs;
end

--[[
    Marks where a line can break: after the divider, after a comma between names, and after the divider in
    front of a count like "| +14 more" or "| +14", which is split off first. A break only goes where no
    bracket is open, so "(High Evasion, Low Defense)" and "(Lv 42, range 40-44)" never split. The divider
    runs don't count brackets, so a custom divider with one in it can't throw the count off. A part's
    brackets never run past a divider, so once the break at a divider is worked out the count starts again,
    and a lone bracket in a word you typed only holds up its own part and the divider after it. An icon never
    breaks a line and holds no brackets. Nor do the spaces Icons only leaves after a picture.
]]
local function mark_breaks(runs, divider)
    local out, open = {}, 0;
    for _, run in ipairs(runs) do
        local text = run.text;
        local count = text ~= nil and divider ~= '' and #text > #divider and text:sub(1, #divider) == divider
            and text:find('^%+%d+ ?[^%(%)]*$', #divider + 1) ~= nil;
        if (text == nil or run.glued) then
            out[#out + 1] = run;
        elseif (run.tip_kind == 'info' or (run.tip_kind == 'number'
            and (run.tip_id == 'pdif' or run.tip_id == 'offhandpdif' or run.tip_id == 'rangedpdif'))) then
            local leading = text:match('^%s+');
            if (leading ~= nil) then
                out[#out + 1] = { code = run.code, text = leading, tip_kind = run.tip_kind, tip_id = run.tip_id,
                    breaks = true };
            end
            for piece in text:gmatch('%S+%s*') do
                out[#out + 1] = { code = run.code, text = piece, tip_kind = run.tip_kind, tip_id = run.tip_id,
                    breaks = piece:find(run.tip_kind == 'info' and '%s$' or ';%s$') ~= nil };
            end
        elseif (count) then
            out[#out + 1] = { code = run.code, text = divider, breaks = open == 0, divider = true };
            out[#out + 1] = { code = run.code, text = text:sub(#divider + 1), tip_kind = run.tip_kind, tip_id = run.tip_id };
            open = 0;
        elseif (text == divider or text == ', ') then
            out[#out + 1] = { code = run.code, text = text, breaks = open == 0, divider = text == divider };
            if (text == divider) then
                open = 0;
            end
        else
            local _, opens = text:gsub('%(', '');
            local _, closes = text:gsub('%)', '');
            open = math.max(0, open + opens - closes);
            out[#out + 1] = run;
        end
    end
    return out;
end

-- How wide `text` is in the font pushed now.
local function width_of(text)
    return (imgui.CalcTextSize(text));
end

-- A line that wraps carries on after this.
local INDENT = '  ';

-- How big each icon is, the overlay's font size, and how round a badge's corners are, set before laying out.
local icon_size      = 0;
local badge_rounding = 0;

-- How wide a digit and the colon are in the overlay's font, worked out when the lines are laid out, and the time
-- they were laid out at.
local digit_width = 0;
local colon_width = 0;
local laid_at     = 0;

-- An effect's time slot: as many digits as its time had when the line was laid out, each as wide as the widest
-- digit, and the colon. It counts down inside it, so nothing after it moves.
local function clock_width(entry)
    local left = entry.left or math.max(0, math.ceil(entry.ends - laid_at));
    return (#printout.clock_text(left) - 1) * digit_width + colon_width;
end

-- A badge's letter is this much of the badge's size.
local LETTER_SCALE = 0.6;

-- How long the mouse rests on text or an icon before its tip shows, in seconds. It's ImGui's own wait for an item's tip.
local TIP_DELAY = 0.15;

-- A tip wraps at this many times the overlay's font size.
local TIP_WRAP = 20;

local has_clocks = false;
local has_icons = false;   -- The lines on show have an icon, so a frame looks for the mouse.
local made_from = nil;     -- The readout the lines were made from, the sample goblin's too, for the tips.
local tip_kind  = nil;     -- The icon the mouse rests on, by its kind and id, and since when.
local tip_id    = nil;
local tip_since = 0;
local tip_text  = nil;     -- The tip to show this frame, or nil.
local tip_more  = nil;     -- A second line under it that can change while it shows, or nil.

-- The nearest whole number.
local function round(value)
    return math.floor(value + 0.5);
end

-- How wide a run is. An icon is as wide as it's tall, and an effect's time is its slot.
local function run_width(run)
    if (run.text ~= nil) then
        return width_of(run.text);
    elseif (run.clock ~= nil) then
        return clock_width(run.clock);
    end
    return icon_size;
end

-- An icon as it's drawn at this size. A badge's letter is a little smaller than the text, in its middle.
local function icon_of(run)
    local icon = { size = { icon_size, icon_size }, texture = run.texture, kind = run.kind, id = run.id };
    if (run.texture == nil) then
        local letter_size = round(icon_size * LETTER_SCALE);
        local width = width_of(run.letter) * letter_size / icon_size;
        icon.fill, icon.ink, icon.letter, icon.letter_size = run.fill, run.ink, run.letter, letter_size;
        icon.rounding = badge_rounding;
        icon.letter_x = round((icon_size - width) / 2);
        icon.letter_y = round((icon_size - letter_size) / 2);
    end
    return icon;
end

-- An effect's time as it's drawn at this size: its slot and its color.
local function clock_of(run)
    return { clock = run.clock, size = { clock_width(run.clock), icon_size },
        color = imgui.GetColorU32(chat_colors.SWATCHES[run.code]) };
end

-- Ends a drawn line at a wrap. Its trailing spaces go, and so does a divider at its end when `droppable`.
local function close_at_wrap(line, droppable)
    if (line[#line].divider and droppable and #line > 1) then
        table.remove(line);
    end
    local last = line[#line];
    if (last.text ~= nil) then
        line[#line] = { code = last.code, text = (last.text:gsub('%s+$', '')), tip_kind = last.tip_kind, tip_id = last.tip_id };
    end
end

-- Joins runs of the same color that sit next to each other and gives each its swatch, so a drawn line is as
-- few TextColored calls as it can be. An icon stays on its own, ready to draw at this size.
local function finish(line)
    local merged = {};
    for _, run in ipairs(line) do
        local last = merged[#merged];
        if (run.clock ~= nil) then
            merged[#merged + 1] = clock_of(run);
        elseif (run.text == nil) then
            merged[#merged + 1] = icon_of(run);
        elseif (last ~= nil and last.text ~= nil and last.code == run.code
            and last.tip_kind == run.tip_kind and last.tip_id == run.tip_id) then
            last.text = last.text .. run.text;
        else
            merged[#merged + 1] = { code = run.code, text = run.text, color = chat_colors.SWATCHES[run.code],
                kind = run.tip_kind, id = run.tip_id, tip_kind = run.tip_kind, tip_id = run.tip_id };
        end
    end
    for _, run in ipairs(merged) do
        if (run.text ~= nil and run.kind ~= nil) then run.width = width_of(run.text); end
    end
    return merged;
end

--[[
    Lays one printout line out as drawn lines, added to `out`. It wraps before a piece that would go past
    `wrap` pixels, and never when `wrap` is 0. A piece wider than that on its own doesn't break, so the
    panel just gets wider. A divider at the end of a line it wraps is left off, unless the divider is only
    spaces, brackets or colons, since text like that can be part of the line itself.
]]
local function lay_out(runs, divider, wrap, out)
    local chunks, chunk = {}, { runs = {}, width = 0 };
    for _, run in ipairs(mark_breaks(runs, divider)) do
        chunk.runs[#chunk.runs + 1] = run;
        chunk.width = chunk.width + run_width(run);
        if (run.breaks) then
            chunks[#chunks + 1] = chunk;
            chunk = { runs = {}, width = 0 };
        end
    end
    if (#chunk.runs > 0) then
        chunks[#chunks + 1] = chunk;
    end

    local droppable = divider:find('[^%s%(%):]') ~= nil;
    local line, x, filled = {}, 0, false;
    for _, each in ipairs(chunks) do
        -- A chunk fits when everything but its trailing spaces fits. It can end with an icon.
        local last = each.runs[#each.runs];
        local fit = each.width;
        if (last.text ~= nil) then
            fit = fit - width_of(last.text) + width_of((last.text:gsub('%s+$', '')));
        end
        if (filled and wrap > 0 and x + fit > wrap) then
            close_at_wrap(line, droppable);
            out[#out + 1] = finish(line);
            line, x = { { code = each.runs[1].code, text = INDENT } }, width_of(INDENT);
        end
        for _, run in ipairs(each.runs) do
            line[#line + 1] = run;
        end
        x, filled = x + each.width, true;
    end
    out[#out + 1] = finish(line);
end

--[[
    The window.
]]

local NAME = '##checkmate_overlay';
local FLAGS = bit.bor(ImGuiWindowFlags_NoDecoration, ImGuiWindowFlags_AlwaysAutoResize,
    ImGuiWindowFlags_NoSavedSettings, ImGuiWindowFlags_NoFocusOnAppearing, ImGuiWindowFlags_NoBringToFrontOnFocus,
    ImGuiWindowFlags_NoNav, ImGuiWindowFlags_NoDocking);
local CLICK_THROUGH = bit.bor(FLAGS, ImGuiWindowFlags_NoInputs, ImGuiWindowFlags_NoMove);
-- It takes the mouse but ImGui doesn't move it, for a click on its corner.
local STILL = bit.bor(FLAGS, ImGuiWindowFlags_NoMove);
-- Another window under the mouse, for the tips. ImGui says no window is hovered while a dropdown is open, or while
-- the mouse is on a text box with the caret, unless it's told to allow those, so both ask with the same two.
local THIS_WINDOW = bit.bor(ImGuiHoveredFlags_AllowWhenBlockedByPopup, ImGuiHoveredFlags_AllowWhenBlockedByActiveItem);
local ANY_WINDOW = bit.bor(ImGuiHoveredFlags_AnyWindow, THIS_WINDOW);
local OPEN = { true };   -- Begin's open flag. There's no close button, so it never changes.

-- Stands for the sample goblin in `showing`.
local SAMPLE = {};

local showing      = nil;    -- The readout the lines were made from, or SAMPLE.
local lines        = {};     -- Each printout line on show, as runs.
local line_divider = '';     -- The divider those lines were made with.
local redo         = true;   -- A setting changed, so the lines are made again.
local laid_out     = nil;    -- The lines as drawn, or nil when they need laying out again.
local laid         = { face = nil, size = 0, wrap = 0 };   -- The font, size and wrap they were laid out with.
local ashita_font  = nil;    -- Ashita's own font, kept the first time the overlay draws.

-- True while you can move it or drag its corner this frame.
local held = false;

-- True while a frame looks for the text or icon under the mouse, for its tip.
local looking = false;

-- Holding Shift and clicking it grabs it until you let go of the mouse. A grab on its corner sets its width
-- instead, and keeps where the mouse was then and how wide the text was then, or the wrap when that's narrower.
-- The wrap it had then says whether a width needs saving.
local grabbed    = false;
local resizing   = false;
local grab_x     = 0;
local grab_width = 0;
local grab_wrap  = 0;

local was_hovered = false;   -- It was under the mouse last frame, so Ashita kept a click on it from the game.
local passing     = false;   -- A click the game got, with any button. It never grabs it, and lasts until you let go.
local forced      = false;   -- It told ImGui to let the game have the mouse last frame.
local pin         = false;   -- It put a button under the mouse last frame, which can be in its padding.

-- Reused sizes and spots.
local padding = { 0, 0 };   -- Inside the panel's edges, for the font size in `padded`.
local spacing = { 0, 0 };   -- Between its lines.
local grip    = 0;          -- How big its corner is.
local inset   = 0;          -- How far in from the edges the corner's triangle is drawn.
local padded  = 0;
local spot    = { 0, 0 };   -- Where it's drawn, the saved spot pulled in so all of it shows.
local saved   = { -1, -1 }; -- The saved spot `spot` was worked out from.
local size    = { 0, 0 };   -- Its size last frame.
local last    = { 0, 0 };   -- Where ImGui had it last frame.
local moved   = { 0, 0 };   -- Where you dragged it.
local drawn   = false;      -- It was drawn last frame.
local resized = false;      -- Its size changed last frame.
local dragged = false;      -- You moved it since you grabbed it.
local corner  = { { 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 } };   -- The corner's triangle, then its bottom right.

-- Reused corners of the icon being drawn and the spot for a badge's letter.
local box_min   = { 0, 0 };
local box_max   = { 0, 0 };
local letter_at = { 0, 0 };
local clock_at = { 0, 0 };

-- True while you hold Shift. It asks Windows each time, so Shift never sticks after you alt-tab. While you
-- type in the game's chat line or another of its text boxes, Shift is just typing, so it doesn't count. A text
-- box in an ImGui window isn't asked about, since ImGui says it wants typing the whole time it has the caret,
-- even once you've stopped.
local function shift_held()
    return bit.band(ffi.C.GetAsyncKeyState(VK_SHIFT), 0x8000) ~= 0
        and bit.band(AshitaCore:GetChatManager():IsInputOpen(), 1) == 0;
end

-- How light one channel of a screen color looks, from 0 to 1.
local function channel(value)
    return (value <= 0.04045) and value / 12.92 or ((value + 0.055) / 1.055) ^ 2.4;
end

-- How light a color looks, from 0 for black to 1 for white, the way WCAG works it out.
local function luminance(color)
    return 0.2126 * channel(color[1]) + 0.7152 * channel(color[2]) + 0.0722 * channel(color[3]);
end

-- How much two colors stand out from each other, from 1 for the same to 21 for black on white.
local function contrast(a, b)
    local x, y = luminance(a), luminance(b);
    return (math.max(x, y) + 0.05) / (math.min(x, y) + 0.05);
end

-- A badge for an element, in its Element badges color, with its letter in your skin's text color or its
-- background color, whichever stands out more on that badge.
local function badge(s, code, key)
    local fill = chat_colors.SWATCHES[printout.safe_color(s.colors['badge_' .. key])];
    local look = s.look.imgui;
    local ink = look.text;
    if (contrast(look.background, fill) > contrast(look.text, fill)) then
        ink = { look.background[1], look.background[2], look.background[3], 1 };
    end
    return { code = code, fill = imgui.GetColorU32(fill), ink = imgui.GetColorU32(ink), letter = icons.LETTERS[key] };
end

--[[
    Swaps each mark for its icon. An element always gets one, a Magic school's element too, its game picture with
    Game pictures picked, or its badge. An item, Steal item, immunity or job gets its game picture, a job's being its
    artifact head. With none, it loses the mark and the space after it, so its name shows alone. With Icons only on,
    one with a picture loses its name and keeps the space after it, unless it's an immunity with the same picture as
    another one in your game client. printout already left the element names out. Each icon keeps its mark's kind
    and id, for its tip.
]]
local function with_pictures(s, runs, result)
    local o, out = s.overlay, {};
    for _, run in ipairs(runs) do
        if (run.kind == nil) then
            out[#out + 1] = run;
        elseif (run.kind == 'clock') then
            has_clocks = true;
            out[#out + 1] = { code = run.code, clock = result.effects[tonumber(run.id)] };
            add_text(out, run.code, run.word);
        elseif (o.icons ~= true or (run.kind ~= 'element' and run.kind ~= 'school' and run.kind ~= 'item'
            and run.kind ~= 'steal' and run.kind ~= 'job' and run.kind ~= 'effect' and run.kind ~= 'immunity'
            and run.kind ~= 'weapon')) then
            add_text(out, run.code, run.word, run.kind, run.id);
        else
            local word, texture, glued = run.word, nil, false;
            if (run.kind == 'element' or run.kind == 'school') then
                if (o.element_look ~= 'badges') then
                    texture = icons.status(icons.ELEMENT_STATUS[run.id]);
                end
                local icon = texture and { code = run.code, texture = texture } or badge(s, run.code, run.id);
                icon.kind, icon.id = run.kind, run.id;
                out[#out + 1] = icon;
                has_icons = true;
            else
                if (run.kind == 'item' or run.kind == 'steal') then
                    texture = icons.item(tonumber(run.id));
                elseif (run.kind == 'job') then
                    local item = icons.JOB_ITEMS[run.id];
                    texture = item and icons.item(item) or nil;
                elseif (run.kind == 'effect') then
                    texture = icons.status(icons.effect_picture(tonumber(run.id)));
                elseif (run.kind == 'weapon') then
                    texture = icons.weapon(run.id);
                else
                    texture = icons.status(icons.IMMUNITY_STATUS[run.id]);
                end
                if (texture == nil) then
                    word = word:gsub('^ ', '');
                else
                    out[#out + 1] = { code = run.code, texture = texture, kind = run.kind, id = run.id };
                    has_icons = true;
                    if (o.icons_only == true and run.kind ~= 'weapon' and not (run.kind == 'immunity' and icons.shared(run.id))
                        and not (run.kind == 'effect' and icons.effect_shared(tonumber(run.id), effects.ids))) then
                        word = word:match('%s*$');
                        glued = word ~= '';
                    end
                end
            end
            add_text(out, run.code, word, run.kind, run.id);
            -- The spaces left after the picture never count as a divider, even when yours is a single space.
            if (glued) then
                out[#out].glued = true;
            end
        end
    end
    return out;
end

-- Makes the lines for `result` with your settings, and keeps `result` for the tips.
local function make_lines(s, result)
    lines, has_icons, has_clocks, made_from = {}, false, false, result;
    for _, line in ipairs((printout.lines(view_of(s), result))) do
        local runs = with_pictures(s, runs_of(line), result);
        for _, run in ipairs(runs) do
            if (run.tip_kind ~= nil) then has_icons = true; end
        end
        if (#runs > 0) then
            lines[#lines + 1] = runs;
        end
    end
    line_divider = divider_text(s.overlay);
    laid_out = nil;
end

-- True when a Hide it option that's on says to hide it. `me` is your entity. An option that's off is never read.
local function hidden_by_game(o, me)
    return (o.hide_in_events == true and player.in_event(me))
        or (o.hide_with_ui == true and player.interface_hidden())
        or (o.hide_on_map == true and player.map_open());
end

--[[
    Works out where it goes: the saved spot, pulled in with last frame's size so the whole panel shows. The
    saved spot doesn't change, so a bigger screen shows it there again. It's only worked out again when the
    panel wasn't drawn last frame, its size or the saved spot changed, or the settings window is open, so in
    play the screen size is read about once a target.
]]
local function place(window, window_open, was_drawn)
    local x, y = window.overlay_x, window.overlay_y;
    if (window_open or not was_drawn or resized or x ~= saved[1] or y ~= saved[2]) then
        local screen = imgui.GetIO().DisplaySize;
        spot[1] = math.floor(math.max(0, math.min(x, screen.x - size[1])));
        spot[2] = math.floor(math.max(0, math.min(y, screen.y - size[2])));
        saved[1], saved[2], resized = x, y, false;
    end
end

--[[
    Keeps a drag when ImGui moves the overlay since last frame while it was already
    grabbed and drawn, which `following` says. On the frame you grab it, or one it shows up again, place() put it
    there, so those never count. A size change near the edge of the screen moves the pulled-in spot, but ImGui
    leaves it where it was while it's grabbed, so that never counts either.
]]
local function note_drag(following)
    local x, y = imgui.GetWindowPos();
    x, y = math.floor(x), math.floor(y);
    if (following and (x ~= last[1] or y ~= last[2])) then
        moved[1], moved[2], dragged = x, y, true;
    end
    last[1], last[2] = x, y;
    local width, height = imgui.GetWindowSize();
    if (width ~= size[1] or height ~= size[2]) then
        size[1], size[2], resized = width, height, true;
    end
end

-- True when the mouse is over its corner, where it was drawn last frame.
local function on_corner(mouse_x, mouse_y)
    local right, bottom = last[1] + size[1], last[2] + size[2];
    return mouse_x >= right - grip and mouse_x < right and mouse_y >= bottom - grip and mouse_y < bottom;
end

--[[
    A click on it grabs it, and a click on its corner grabs the corner. ImGui moves it while you drag it.
    Dragging its corner sideways sets the wrap, so the text wraps to the width you drag it to and the panel
    fits it. That goes from how wide the text was when you grabbed it, so the corner stays with the mouse, or
    from the wrap when that's narrower. The wrap only goes the way you drag it, and a click that doesn't move
    changes nothing.
    Ashita gives a click to the game unless ImGui wanted the mouse the frame before. So a click right as you
    press Shift, or right as the mouse gets to it, already went to the game, whichever button it was, and it
    doesn't grab it. It tells ImGui to let the game have the mouse from the next frame on, and overlay.draw
    keeps telling it every frame until you let go of every button, even while it isn't drawn, so the game gets
    the release too, unless it was a very quick click that let go before the next frame. A click right as you
    let go of Shift was already kept from the game, so draw_window keeps it held for that click and it still
    grabs it. Ashita keeps a click a frame after that from the game too, but it lets clicks through by then, so
    that one goes nowhere.
    True while the mouse is on the corner or holds it.
]]
local function grab(o, mouse_x, mouse_y)
    local hovered = imgui.IsWindowHovered();
    local over_corner = resizing or (on_corner(mouse_x, mouse_y) and hovered);
    if (not grabbed and imgui.IsMouseClicked(ImGuiMouseButton_Left) and hovered) then
        if (was_hovered) then
            grabbed, resizing, grab_wrap = true, over_corner, o.wrap;
            grab_x, grab_width = mouse_x, size[1] - 2 * padding[1];
            -- A piece wider than the wrap keeps the panel wider than it, so the corner goes from the wrap then.
            if (o.wrap > 0 and o.wrap < grab_width) then
                grab_width = o.wrap;
            end
        else
            passing, pin = true, true;
            imgui.SetNextFrameWantCaptureMouse(false);
            -- A click on its empty space would make it ImGui's active item, and Ashita keeps every key from the game
            -- while there's one. So a button only the right mouse button presses goes under the mouse for this click.
            -- It's clipped to the whole panel, since the click can be in its padding.
            local x, y = imgui.GetCursorScreenPos();
            local left, top = imgui.GetWindowPos();
            local wide, high = imgui.GetWindowSize();
            imgui.PushClipRect({ left, top }, { left + wide, top + high }, false);
            imgui.SetCursorScreenPos({ mouse_x, mouse_y });
            imgui.InvisibleButton('##pass', { 1, 1 }, ImGuiButtonFlags_MouseButtonRight);
            imgui.PopClipRect();
            imgui.SetCursorScreenPos({ x, y });
        end
    end
    -- A right or middle click the game already got goes the same way, but without the button under the mouse, since
    -- ImGui only makes a left click on its empty space its active item.
    if (not grabbed and hovered and not was_hovered
        and (imgui.IsMouseClicked(ImGuiMouseButton_Right) or imgui.IsMouseClicked(ImGuiMouseButton_Middle))) then
        passing = true;
        imgui.SetNextFrameWantCaptureMouse(false);
    end
    -- It can only be hovered after a frame it took the mouse, and this ran then. The one exception is the frame after
    -- one it told ImGui to let the game have the mouse, since Ashita gives that frame's clicks to the game.
    was_hovered = hovered and not forced;
    if (resizing) then
        local width = math.max(overlay.CORNER_MIN, math.min(overlay.WRAP_MAX, round(grab_width + mouse_x - grab_x)));
        local wrap = grab_wrap;
        -- Dragging right never wraps sooner, and 0 never wraps at all, so text that already fits keeps its wrap.
        -- Dragging left only takes a width narrower than the text, so a short readout keeps its wrap, and so does
        -- a wrap you typed under CORNER_MIN.
        if (mouse_x > grab_x and grab_wrap ~= 0 and width > grab_wrap) then
            wrap = width;
        elseif (mouse_x < grab_x and width < grab_width) then
            wrap = width;
        end
        o.wrap = wrap;
    end
    return over_corner;
end

-- Its corner, a small triangle in the skin's Resize corner colors, like the settings window's own. It's set in
-- from the border and a rounded corner, so it stays inside the panel.
local function draw_corner(look, over_corner)
    local color = look.resize_corner;
    if (resizing) then
        color = look.resize_corner_held;
    elseif (over_corner) then
        color = look.resize_corner_hovered;
    end
    local right, bottom = last[1] + size[1], last[2] + size[2];
    local leg = grip - inset;
    corner[1][1], corner[1][2] = right - inset, bottom - inset - leg;
    corner[2][1], corner[2][2] = right - inset, bottom - inset;
    corner[3][1], corner[3][2] = right - inset - leg, bottom - inset;
    corner[4][1], corner[4][2] = right, bottom;
    -- ImGui clips what's drawn inside the padding, and the corner sits in it.
    local list = imgui.GetWindowDrawList();
    list:PushClipRect(last, corner[4], false);
    list:AddTriangleFilled(corner[1], corner[2], corner[3], imgui.GetColorU32(color));
    list:PopClipRect();
    if (over_corner or resizing) then
        imgui.SetMouseCursor(ImGuiMouseCursor_ResizeEW);
    end
end

-- Draws an icon where the next item goes. A Dummy holds its place in the line, the window's draw list draws it,
-- and it sits on whole pixels so a picture stays sharp. It hands back the icon's top left corner for hovering.
local function draw_icon(list, face, icon)
    local x, y = imgui.GetCursorScreenPos();
    x, y = math.floor(x + 0.5), math.floor(y + 0.5);
    imgui.Dummy(icon.size);
    box_min[1], box_min[2] = x, y;
    box_max[1], box_max[2] = x + icon.size[1], y + icon.size[2];
    if (icon.texture ~= nil) then
        if (icon.kind == 'weapon') then
            local size = math.min(16, icon.size[1]);
            local inset = math.floor((icon.size[1] - size) / 2);
            box_min[1], box_min[2] = x + inset, y + inset;
            box_max[1], box_max[2] = box_min[1] + size, box_min[2] + size;
        end
        list:AddImage(icon.texture, box_min, box_max);
        return x, y;
    end
    list:AddRectFilled(box_min, box_max, icon.fill, icon.rounding);
    letter_at[1], letter_at[2] = x + icon.letter_x, y + icon.letter_y;
    list:AddText(face, icon.letter_size, letter_at, icon.ink, icon.letter);
    return x, y;
end

--[[
    The tip for the text or icon under the mouse, once the mouse has stayed on it a moment, and a second line under it, or
    nil. There's none while a mouse button is down, like while you drag the panel or turn the camera, or while
    another window that takes the mouse is under it, like the settings window over the panel, even with one of its
    dropdowns open. The panel itself only counts as hovered while Shift lets it take the mouse, and a tip still
    shows then. The icon is kept by its kind and id, so laying the lines out again under the mouse doesn't start
    the wait over. Its words are worked out the first time it shows, and an icon with nothing to say is only asked
    once. The second line is asked each frame the tip shows, since it can change.
]]
local function tip_for(s, icon)
    if (icon == nil or imgui.IsAnyMouseDown()
        or (imgui.IsWindowHovered(ANY_WINDOW) and not imgui.IsWindowHovered(THIS_WINDOW))) then
        tip_kind = nil;
        return nil, nil;
    end
    local now = os.clock();
    if (icon.kind ~= tip_kind or icon.id ~= tip_id) then
        tip_kind, tip_id, tip_since = icon.kind, icon.id, now;
    end
    if (now - tip_since < TIP_DELAY) then
        return nil, nil;
    end
    if (icon.tip == nil) then
        icon.tip = tips.text(s, made_from, icon.kind, icon.id) or false;
    end
    if (icon.tip == false) then
        return nil, nil;
    end
    return icon.tip, tips.more(s, made_from, icon.kind, icon.id);
end

-- The tip's words. draw_tip runs it between BeginTooltip and EndTooltip.
local function tip_words()
    imgui.TextUnformatted(tip_text);
    if (tip_more ~= nil) then
        imgui.TextUnformatted(tip_more);
    end
end

--[[
    The tip, in the overlay's font, size, padding, corners and border, which are still pushed, and in the colors of
    the settings window's (?) tips. It wraps at `wrap` pixels. ImGui's tooltip never takes the mouse, so clicks
    still reach the game. Like the panel, everything the pushes take is worked out first, and EndTooltip and every
    pop run whatever happens inside. Hands back false and the error when something inside went wrong.
]]
local function draw_tip(look, border, wrap)
    imgui.PushStyleColor(ImGuiCol_PopupBg, look.dropdowns);
    imgui.PushStyleColor(ImGuiCol_Text, look.text);
    imgui.PushStyleVar(ImGuiStyleVar_PopupBorderSize, border);
    local ok, err = true, nil;
    if (imgui.BeginTooltip()) then
        imgui.PushTextWrapPos(wrap);
        ok, err = pcall(tip_words);
        imgui.PopTextWrapPos();
        imgui.EndTooltip();
    end
    imgui.PopStyleVar(1);
    imgui.PopStyleColor(2);
    return ok, err;
end

--[[
    Lays the lines out when they or the look changed, draws them and notes a drag. While you can move it, the
    mouse comes first, so a drag on its corner wraps the text this frame, and the corner is drawn on top. It
    runs inside the window with the overlay's font pushed, since laying out needs CalcTextSize. The draw list
    is only fetched when the frame needs icons. While tips are on, it finds marked text or an icon under
    the mouse and works out its tip.
]]
-- Draws an effect's time where the next item goes, in the slot its line was laid out with. Only the text changes
-- as it counts down, once a second, and each one is made once and kept.
local function draw_clock(list, face, run, now)
    local x, y = imgui.GetCursorScreenPos();
    imgui.Dummy(run.size);
    local entry = run.clock;
    local left = entry.left or math.max(0, math.ceil(entry.ends - now));
    clock_at[1], clock_at[2] = x, y;
    list:AddText(face, icon_size, clock_at, run.color, printout.clock_text(left));
end

local function draw_inside(face, s, look, mouse_x, mouse_y, following, now)
    local o = s.overlay;
    local over_corner = false;
    if (held) then
        over_corner = grab(o, mouse_x, mouse_y);
    end
    local font_size, wrap = o.font_size, o.wrap;
    if (laid_out == nil or laid.face ~= face or laid.size ~= font_size or laid.wrap ~= wrap) then
        icon_size = font_size;
        if (has_clocks) then
            laid_at, colon_width, digit_width = now, width_of(':'), 0;
            for digit = 0, 9 do
                digit_width = math.max(digit_width, width_of(tostring(digit)));
            end
        end
        badge_rounding = math.min(tonumber(look.rounding) or 0, math.floor(font_size / 4));
        laid_out = {};
        for _, runs in ipairs(lines) do
            lay_out(runs, line_divider, wrap, laid_out);
        end
        laid.face, laid.size, laid.wrap = face, font_size, wrap;
    end
    local list, under = nil, nil;
    for _, line in ipairs(laid_out) do
        for index, run in ipairs(line) do
            if (index > 1) then
                imgui.SameLine(0, 0);
            end
            if (run.text ~= nil) then
                local x, y;
                if (looking and run.kind ~= nil) then x, y = imgui.GetCursorScreenPos(); end
                imgui.TextColored(run.color, run.text);
                if (x ~= nil and mouse_x >= x and mouse_x < x + run.width
                    and mouse_y >= y and mouse_y < y + icon_size) then
                    under = run;
                end
            elseif (run.clock ~= nil) then
                list = list or imgui.GetWindowDrawList();
                draw_clock(list, face, run, now);
            else
                list = list or imgui.GetWindowDrawList();
                local x, y = draw_icon(list, face, run);
                if (looking and mouse_x >= x and mouse_x < x + icon_size
                    and mouse_y >= y and mouse_y < y + icon_size) then
                    under = run;
                end
            end
        end
    end
    if (looking) then
        tip_text, tip_more = tip_for(s, under);
    end
    note_drag(following);
    if (held) then
        draw_corner(look, over_corner);
    end
end

-- Draws the panel and its tip. Everything the pushes take is worked out first, and End and every pop, the tip's
-- too, run whatever happens inside, so a mistake there never leaves ImGui's stacks open.
local function draw_window(s, window_open, was_drawn)
    local o, look = s.overlay, s.look.imgui;
    ashita_font = ashita_font or imgui.GetFont();
    local face = window_font.face(o.font) or ashita_font;
    if (o.font_size ~= padded) then
        padded = o.font_size;
        padding[1], padding[2] = round(padded * 0.5), round(padded * 0.35);
        spacing[2] = round(padded / 8);
        grip = round(padded * 0.75);
    end
    local border = (o.border == true) and 1 or 0;
    local rounding = tonumber(look.rounding) or 0;
    -- Shift isn't read at all while it's locked. A grab lasts until you let go of the mouse, even if you let go of
    -- Shift first, and so does a click that went to the game. Right after a frame it was held, Ashita keeps a click
    -- on it from the game, so it's still held for that click even if you just let go of Shift. Ashita keeps a click
    -- from the game one frame later too, and nothing grabs that one.
    held = o.locked ~= true and (grabbed or passing or shift_held()
        or (held and was_drawn and imgui.IsMouseClicked(ImGuiMouseButton_Left)));
    looking = o.tips == true and has_icons;
    -- A tip waits again once the panel was gone for a frame.
    if (not looking or not was_drawn) then
        tip_kind = nil;
    end
    local flags, mouse_x, mouse_y = CLICK_THROUGH, 0, 0;
    if (held or looking) then
        mouse_x, mouse_y = imgui.GetMousePos();
    end
    if (held) then
        -- A click on its corner mustn't move it, so it stays still while the mouse is there.
        flags = (resizing or (was_drawn and on_corner(mouse_x, mouse_y))) and STILL or FLAGS;
        inset = border + math.ceil(rounding * 0.3);
        -- The button grab() put under a click the game got counts toward the size it fits to, so one in its padding
        -- would make it a frame bigger. It keeps last frame's size instead.
        if (pin and was_drawn) then
            imgui.SetNextWindowSize(size, ImGuiCond_Always);
        end
        pin = false;
    end
    place(s.window, window_open, was_drawn);
    -- While it's grabbed, it stays where ImGui has it. Once it was grabbed and drawn before this frame, ImGui moving
    -- it is you dragging it.
    local condition = grabbed and ImGuiCond_Appearing or ImGuiCond_Always;
    local following = grabbed and was_drawn;

    imgui.PushFont(face, o.font_size);
    imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, padding);
    imgui.PushStyleVar(ImGuiStyleVar_ItemSpacing, spacing);
    imgui.PushStyleVar(ImGuiStyleVar_WindowBorderSize, border);
    imgui.PushStyleVar(ImGuiStyleVar_WindowRounding, rounding);
    imgui.PushStyleColor(ImGuiCol_WindowBg, look.background);
    imgui.PushStyleColor(ImGuiCol_Border, look.border);
    imgui.SetNextWindowPos(spot, condition);
    imgui.SetNextWindowBgAlpha(o.opacity / 100);
    local ok, err = true, nil;
    tip_text, tip_more = nil, nil;
    if (imgui.Begin(NAME, OPEN, flags)) then
        ok, err = pcall(draw_inside, face, s, look, mouse_x, mouse_y, following, has_clocks and os.clock() or 0);
    end
    -- Always, even when Begin says it's hidden, like the settings window.
    imgui.End();
    -- The tip goes before the pops, so it takes the overlay's font and look, and like End it never stops them.
    if (ok and tip_text ~= nil) then
        ok, err = draw_tip(look, border, o.font_size * TIP_WRAP);
    end
    imgui.PopStyleColor(2);
    imgui.PopStyleVar(4);
    imgui.PopFont();
    drawn = true;
    if (not ok) then
        error(err, 0);
    end
end

-- Once you let go of the mouse after dragging it, the spot you dragged it to is saved, and so is a width you
-- dragged its corner to. One that's pulled in from its saved spot keeps the spot it's drawn at when you change
-- its width, so it stays where you let go. True when one of them changed.
local function let_go(s)
    if (not grabbed or imgui.IsMouseDown(ImGuiMouseButton_Left)) then
        return false;
    end
    local save = dragged or s.overlay.wrap ~= grab_wrap;
    if (dragged) then
        s.window.overlay_x, s.window.overlay_y = moved[1], moved[2];
    elseif (s.overlay.wrap ~= grab_wrap) then
        s.window.overlay_x, s.window.overlay_y = last[1], last[2];
    end
    grabbed, resizing, dragged = false, false, false;
    return save;
end

--[[
    Draws the overlay for one frame while it's on. `window_open` is true while the settings window is open,
    and `sample` a function that returns the sample goblin's readout, shown then when you have no monster
    targeted. Returns true when you let go of it after moving it or dragging its corner, so its new spot or
    width gets saved.
    Letting go of the mouse is noted first, even on a frame it isn't drawn, and until then a click that went to
    the game keeps the mouse with the game. After that the cheapest thing comes first, so a frame with nothing
    targeted stops after reading your target, and Shift is only read on a frame it's drawn.
]]
function overlay.draw(s, window_open, sample)
    local o = s.overlay;
    local was_drawn = drawn;
    drawn = false;
    local save = let_go(s);
    forced = passing;
    if (passing) then
        passing = imgui.IsAnyMouseDown();
        if (passing) then
            imgui.SetNextFrameWantCaptureMouse(false);
        end
    end
    target.take_in();
    local index = target.read(o);
    if (index == 0 and not window_open) then
        return save;
    end
    -- Not in the world while zoning or at the login screen.
    local me = GetPlayerEntity();
    if (me == nil) then
        target.clear_current();
        return save;
    end
    -- Your own pet never shows, and that includes a monster you charmed.
    local result, effects_changed = nil, false;
    if (index ~= me.PetTargetIndex) then
        result, effects_changed = target.readout(s);
    else
        target.clear_current();
    end
    if (result == nil and not window_open) then
        return save;
    end
    local wanted = result or SAMPLE;
    if (redo or wanted ~= showing or effects_changed) then
        make_lines(s, result or sample());
        showing, redo = wanted, false;
    end
    if (#lines > 0 and not hidden_by_game(o, me)) then
        draw_window(s, window_open, was_drawn);
    end
    return save;
end

-- What came in from the server, passed on to core\target.lua, which notes it for the next frame.
overlay.on_check    = target.on_check;
overlay.on_widescan = target.on_widescan;
overlay.on_death    = target.on_death;
overlay.on_disappear = target.on_disappear;
overlay.on_pet_parameters = target.on_pet_parameters;
overlay.on_parameters = target.on_parameters;
overlay.on_pet_sync = target.on_pet_sync;

-- Your stats packet. Notes your main level and support job.
function overlay.on_stats(e)
    target.on_level(packets.main_level(e), packets.sub_job(e));
end

-- The zone in packet. Notes the zone you're coming into.
function overlay.on_zone(e)
    target.on_zone(packets.zone_id(e));
end

-- Forgets everything, for turning the overlay off, or after an error, since it missed what came in meanwhile.
function overlay.forget()
    target.forget();
    showing, lines, laid_out, redo, drawn = nil, {}, nil, true, false;
    grabbed, resizing, dragged, passing = false, false, false, false;
    has_icons, has_clocks, made_from, tip_kind, tip_text, tip_more = false, false, nil, nil, nil, nil;
end

-- A setting changed, the settings were reset or replaced, or a profile loaded. Turning the overlay off forgets
-- everything.
function overlay.changed(s)
    if (s.overlay.on ~= true) then
        overlay.forget();
        return;
    end
    target.mark_stale();
    redo = true;
end

-- Puts the overlay back where it starts. The Move it back button and /checkmate overlayspot reset use it.
function overlay.move_back(s)
    s.window.overlay_x, s.window.overlay_y = defaults.OVERLAY_SPOT[1], defaults.OVERLAY_SPOT[2];
end

return overlay;
