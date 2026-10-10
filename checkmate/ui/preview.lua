-- Read-only text examples inside settings. No live inputs or overlay state are read here.
local imgui = require('imgui');
local printout = require('core.printout');
local colors = require('ui.chat_colors');
local fonts = require('ui.window_font');
local header_layout = require('ui.header_layout');

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
    local out, code, at, kind, id = {}, 1, 1;
    local function add(text)
        text = text:gsub('[\129-\159\224-\252].', ' '):gsub('[\128-\255]', '')
            :gsub('[^\32-\126]', '');
        if (text ~= '') then out[#out + 1] = { text = text, code = printout.safe_color(code), tip_kind = kind, tip_id = id }; end
    end
    while (at <= #line) do
        local marker = line:find('[\29\30]', at);
        if (marker == nil) then add(line:sub(at)); break; end
        add(line:sub(at, marker - 1));
        if (line:byte(marker) == 29) then
            local first, last, next_kind, next_id = line:find('\29(%a+):([%w_]+)\29', marker);
            if (first == marker) then
                kind, id = next_kind ~= 'end' and next_kind or nil, next_kind ~= 'end' and next_id or nil;
                at = last + 1;
            else at = marker + 1; end
        else
            local next_code = line:byte(marker + 1);
            if (next_code == nil) then break; end
            code, at = printout.safe_color(next_code), marker + 2;
        end
    end
    return out;
end

local function lay_out_line(line, width, out)
    local chunks, chunk = {}, {};
    local function flush()
        if (#chunk > 0) then chunks[#chunks + 1], chunk = chunk, {}; end
    end
    for _, run in ipairs(header_layout.prepare(preview.runs(line), width, imgui.CalcTextSize, '  ')) do
        if (run.header) then
            if (run.break_before) then flush(); end
            chunk[#chunk + 1] = run;
            if (run.breaks) then flush(); end
        else
            flush();
            if (run.text:find('%S') == nil) then chunks[#chunks + 1] = { run };
            else
                for part in run.text:gmatch('%s*%S+%s*') do chunks[#chunks + 1] = { { code = run.code, text = part } }; end
            end
        end
    end
    flush();
    local used, started = 0, false;
    for _, each in ipairs(chunks) do
        local size = 0;
        for _, run in ipairs(each) do size = size + imgui.CalcTextSize(run.text); end
        local tail = each[#each].text:match('%s*$');
        local fit = size - imgui.CalcTextSize(tail);
        local wrapped = started and used + fit > width;
        if (wrapped) then
            local previous = out[#out];
            if (previous and previous.text) then previous.text = previous.text:gsub('%s+$', ''); end
            used, started = 0, false;
            if (each[1].header) then
                out[#out + 1] = { code = each[1].code, text = '  ', same_line = false };
                used, started = imgui.CalcTextSize('  '), true;
            end
        end
        for index, run in ipairs(each) do
            local text = run.text;
            if (wrapped and index == 1) then text = text:gsub('^%s+', ''); end
            if (not started) then text = text:gsub('^%s+', ''); end
            local part_size = imgui.CalcTextSize(text);
            -- Split an unbroken custom label rather than widening its child panel.
            while (not run.header and part_size > width and #text > 1) do
                local count = math.max(1, math.floor(#text * width / part_size));
                while (count > 1 and imgui.CalcTextSize(text:sub(1, count)) > width) do count = count - 1; end
                out[#out + 1] = { code = run.code, text = text:sub(1, count), same_line = started };
                text, used, started = text:sub(count + 1), 0, false;
                part_size = imgui.CalcTextSize(text);
            end
            if (text ~= '') then
                out[#out + 1] = { code = run.code, text = text, same_line = started };
                used, started = used + part_size, true;
            end
        end
    end
    if (not started) then out[#out + 1] = { text = ' ' }; end
end

-- The caller replaces revision after an edit. Each readout keeps the effect times it was made with.
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
