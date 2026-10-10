-- Read-only text examples inside settings. No live inputs or overlay state are read here.
local imgui = require('imgui');
local printout = require('core.printout');
local colors = require('ui.chat_colors');
local fonts = require('ui.window_font');

local preview = {};
local cached;

local function copy(value)
    local out = {};
    for key, item in pairs(value or {}) do out[key] = item; end
    return out;
end

function preview.lines(s, result, opts)
    opts = opts or {};
    if (result == nil) then return {}, 'No current target readout. Select a monster or use the sample.'; end
    local base = opts.display == 'overlay' and printout.overlay_view(s) or s;
    local ps = copy(s.printout);
    for key, value in pairs(base.printout) do ps[key] = value; end
    local view = setmetatable({ printout = ps }, { __index = base });
    ps.icons, ps.marks, ps.icons_only, ps.text_tips, ps.clocks = false, false, false, nil, false;
    ps.replace_game_line = false;
    local lines = printout.lines(view, result);
    return lines, #lines == 0 and 'No enabled rows have a value in this example.' or nil;
end

-- Chat bytes never become ImGui control text. Unsupported glyphs use a plain separator.
function preview.runs(line)
    local out, code, at = {}, 1, 1;
    local function add(text)
        text = text:gsub('[\129-\159\224-\252].', ' '):gsub('[\128-\255]', '')
            :gsub('[^\32-\126]', '');
        if (text ~= '') then out[#out + 1] = { text = text, code = printout.safe_color(code) }; end
    end
    while (at <= #line) do
        local marker = line:find('\30', at, true);
        if (marker == nil) then add(line:sub(at)); break; end
        add(line:sub(at, marker - 1));
        local next_code = line:byte(marker + 1);
        if (next_code == nil) then break; end
        code, at = printout.safe_color(next_code), marker + 2;
    end
    return out;
end

local function lay_out_line(line, width, out)
    local used, started = 0, false;
    for _, run in ipairs(preview.runs(line)) do
        local pieces = {};
        if (run.text:find('%S') == nil) then pieces[1] = run.text;
        else for part in run.text:gmatch('%s*%S+%s*') do pieces[#pieces + 1] = part; end end
        for _, part in ipairs(pieces) do
            local text = part;
            if (not started) then text = text:gsub('^%s+', ''); end
            local size = imgui.CalcTextSize(text);
            if (started and used + size > width) then
                text, used, started = text:gsub('^%s+', ''), 0, false;
                size = imgui.CalcTextSize(text);
            end
            -- Split an unbroken custom label rather than widening its child panel.
            while (size > width and #text > 1) do
                local count = math.max(1, math.floor(#text * width / size));
                while (count > 1 and imgui.CalcTextSize(text:sub(1, count)) > width) do count = count - 1; end
                out[#out + 1] = { code = run.code, text = text:sub(1, count), same_line = started };
                text, used, started = text:sub(count + 1), 0, false;
                size = imgui.CalcTextSize(text);
            end
            if (text ~= '') then
                out[#out + 1] = { code = run.code, text = text, same_line = started };
                used, started = used + size, true;
            end
        end
    end
    if (not started) then out[#out + 1] = { text = ' ' }; end
end

-- The caller replaces revision after an edit. Readouts and their effect times are snapshots.
local function layout(s, result, opts, face, size, width)
    if (opts.revision ~= nil and cached ~= nil and cached.revision == opts.revision
        and cached.settings == s and cached.result == result and cached.display == opts.display
        and cached.face == face and cached.size == size and cached.width == width) then
        return cached;
    end
    local lines, empty = preview.lines(s, result, opts);
    local value = { revision = opts.revision, settings = s, result = result, display = opts.display,
        face = face, size = size, width = width, empty = empty, runs = {} };
    if (empty == nil) then
        for _, line in ipairs(lines) do lay_out_line(line, width, value.runs); end
    end
    cached = opts.revision ~= nil and value or nil;
    return value;
end

local function draw_runs(runs)
    for _, run in ipairs(runs) do
        if (run.same_line) then imgui.SameLine(0, 0); end
        if (run.code ~= nil) then imgui.TextColored(colors.SWATCHES[run.code], run.text);
        else imgui.TextUnformatted(run.text); end
    end
end

function preview.draw(s, result, opts)
    opts = opts or {};
    local overlay = opts.display == 'overlay';
    local label = overlay and 'Overlay' or 'Chat';
    local available_width = imgui.GetContentRegionAvail();
    local width = math.max(40, math.min(tonumber(opts.width) or available_width, available_width));
    imgui.PushTextWrapPos(width);
    imgui.TextUnformatted(label .. ' preview - ' .. (opts.source == 'current' and 'current target readout' or 'sample data'));
    imgui.PopTextWrapPos();
    local height = math.max(72, math.min(240, tonumber(opts.height) or 160));
    if (imgui.BeginChild('##checkmate_preview_' .. tostring(opts.id or label), { width, height }, 0, 0)) then
        local look = overlay and s.overlay or s.look;
        local size = fonts.clean_size(look.font_size);
        local face = fonts.face(look.font) or opts.default_font or imgui.GetFont();
        imgui.PushFont(face, size);
        local available = math.max(24, width - 16);
        local wrap = overlay and tonumber(s.overlay.wrap) or nil;
        if (wrap and wrap > 0) then available = math.min(available, wrap); end
        local value = layout(s, result, opts, face, size, available);
        if (value.empty ~= nil) then
            imgui.PushTextWrapPos(available);
            imgui.TextUnformatted(value.empty);
            imgui.PopTextWrapPos();
        else
            draw_runs(value.runs);
        end
        imgui.PopFont();
    end
    imgui.EndChild();
    imgui.PushTextWrapPos(math.max(40, width));
    imgui.TextUnformatted('Text preview. Print a sample shows the exact chat font, colors and symbols.');
    imgui.PopTextWrapPos();
end

return preview;
