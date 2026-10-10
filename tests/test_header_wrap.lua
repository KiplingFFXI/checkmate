local overlay = require('ui.overlay');
local preview = require('ui.preview');
local printout = require('core.printout');
local imgui = require('imgui');
local colors = require('ui.chat_colors');
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'name'; end
s.overlay.on, s.overlay.icons, s.overlay.own_lines = true, false, false;
s.overlay.show_level, s.overlay.show_range, s.overlay.show_id, s.overlay.show_ph = true, true, true, true;
local result = { name = 'Goblin Tinkerer', id = 17199202, low = 42, high = 42,
    range_low = 40, range_high = 44, ph_for = { 'Valkurm Emperor', 'Leaping Lizzy' }, con = 3 };
local function draw(width, changed)
    s.overlay.wrap = width;
    if (changed ~= false) then overlay.changed(s); end
    MOCK.frame(0);
    overlay.draw(s, true, function() return result; end);
    return MOCK.overlay_lines();
end
local function flat(lines) return table.concat(lines):gsub('%s+', ''); end
local function preview_lines(width)
    MOCK.frame(0);
    imgui.Begin('Header preview', { true }, 0);
    preview.draw(s, result, { display = 'overlay', width = width + 16, height = 240 });
    imgui.End();
    local lines = {};
    for _, run in ipairs(MOCK.gui.colored) do
        if (run.joined and #lines > 0) then lines[#lines] = lines[#lines] .. run.text;
        else lines[#lines + 1] = run.text; end
    end
    return lines;
end
local full = draw(0);
expect('Never keeps the full header together', #full, 1);
expect('all header fields remain in order', full[1], 'Goblin Tinkerer (Lv 42, range 40-44) (ID 17199202) '
    .. '(PH for Valkurm Emperor and Leaping Lizzy)');
local primary = 'Goblin Tinkerer (Lv 42, range 40-44)';
local expected;
for _, width in ipairs({ 100, 140, 240, 280, 402, 520, 900 }) do
    for _, tips in ipairs({ false, true }) do
        for _, icons in ipairs({ false, true }) do
            for _, own_lines in ipairs({ false, true }) do
                s.overlay.tips, s.overlay.icons, s.overlay.own_lines = tips, icons, own_lines;
                local lines = draw(width);
                local okay = flat(lines) == flat(full);
                for _, line in ipairs(lines) do okay = okay and #line * 7 <= width and not line:find('%s$'); end
                check(('header fits %d with tips=%s icons=%s own lines=%s'):format(width, tostring(tips), tostring(icons), tostring(own_lines)),
                    okay, table.concat(lines, ' // '));
                if (#primary * 7 <= width) then
                    check('name and level stay together whenever they fit', lines[1]:sub(1, #primary) == primary, lines[1]);
                end
                local shown = table.concat(lines, '\n');
                if (tips == false and icons == false and own_lines == false) then expected = shown;
                else expect('header layout does not depend on tips, icons or own lines', shown, expected); end
            end
        end
    end
    s.overlay.tips, s.overlay.icons, s.overlay.own_lines = true, false, false;
    local real = draw(width);
    expect('embedded overlay preview uses the same header breaks at ' .. width, table.concat(preview_lines(width), '\n'), table.concat(real, '\n'));
end

-- The continuation indent counts toward a field's available width.
result = { name = 'A', low = 1, high = 1, id = 17199202, ph_for = { 'abcdefghijklmnopqrst' } };
s.overlay.show_level, s.overlay.show_id = false, false;
for width = 84, 280, 7 do
    local lines = draw(width);
    local okay = true;
    for _, line in ipairs(lines) do
        -- An unbroken source name is kept whole, even at widths smaller than that word.
        okay = okay and (#line * 7 <= width or line:gsub('^  ', '') == 'abcdefghijklmnopqrst)');
    end
    check('indent boundary keeps whole words at ' .. width, okay, table.concat(lines, ' // '));
    expect('preview agrees at the continuation boundary ' .. width, table.concat(preview_lines(width), '\n'), table.concat(lines, '\n'));
end

-- A following divider must not push a fitting header off its line or remain orphaned.
result = { name = 'Exact Header', con = 3 };
s.overlay.parts.difficulty, s.overlay.show_ph = true, false;
local edge = draw(#result.name * 7);
expect('a fitting header is not widened by its following divider', edge[1], 'Exact Header');
expect('the following nonheader value keeps its usual whole-piece rule', edge[2], '  Decent Challenge');
check('no line is only a divider', table.concat(edge):gsub('%s', ''):find('|', 1, true) == nil);
s.overlay.parts.difficulty = false;
result = { name = 'Monster', ph_for = { 'Ordinary Name' } };
s.overlay.show_ph = true;
local ph = '(PH for Ordinary Name)';
s.overlay.parts.difficulty = true;
result.con = 3;
edge = draw((#ph + 2) * 7);
expect('a fitting PH field includes its continuation indent', edge[2], '  ' .. ph);
expect('its divider moves with neither header line', edge[3], '  Decent Challenge');
s.overlay.parts.difficulty = false;

-- Exact, ranged and unknown levels, custom labels and the can't-gauge answer keep every word.
s.overlay.show_level, s.overlay.show_id, s.overlay.show_range, s.overlay.show_ph = true, true, true, true;
s.printout.parts.name.label = 'Target';
s.printout.level_word, s.printout.range_word, s.printout.id_word = 'Level', 'Spawn range', 'Identifier';
for _, value in ipairs({
    { name = 'Long Source Monster Name', id = 17199202, low = 1, high = 1, range_low = 1, range_high = 3, ph_for = { 'Long Placeholder Name' } },
    { name = 'Long Source Monster Name', id = 17199202, low = 1, high = 3 },
    { name = 'Long Source Monster Name', id = 17199202 },
    { name = 'Long Source Monster Name', id = 17199202, cant_gauge = true },
}) do
    result = value;
    local before = draw(0);
    local after = draw(168);
    expect('header fallback never drops names or source qualifications', flat(after), flat(before));
    for _, line in ipairs(after) do check('custom header line fits', #line * 7 <= 168, line); end
    expect('preview preserves the same custom header grouping', table.concat(preview_lines(168), '\n'), table.concat(after, '\n'));
end

-- Layout work remains cached, and the layout markers never become visible text or mouse work with tips off.
s.printout.parts.name.label = '';
result = { name = 'Goblin Tinkerer', id = 17199202, low = 42, high = 42, ph_for = { 'Valkurm Emperor', 'Leaping Lizzy' } };
s.overlay.tips, s.overlay.icons = false, false;
local measures, formats, mouse_reads = 0, 0, 0;
local measure, format, mouse = imgui.CalcTextSize, printout.lines, imgui.GetMousePos;
imgui.CalcTextSize = function(...) measures = measures + 1; return measure(...); end;
printout.lines = function(...) formats = formats + 1; return format(...); end;
imgui.GetMousePos = function(...) mouse_reads = mouse_reads + 1; return mouse(...); end;
draw(168);
local first_measures, first_formats = measures, formats;
for _ = 1, 60 do draw(168, false); end
expect('quiet header frames do not remeasure', measures, first_measures);
expect('quiet header frames do not reformat', formats, first_formats);
expect('structural header marks do not read the mouse with tips off', mouse_reads, 0);
draw(240, false);
check('changing wrap rebuilds layout', measures > first_measures);
expect('changing wrap needs no reformat', formats, first_formats);
first_measures = measures;
s.overlay.font_size = 24;
draw(240, false);
check('changing font size remeasures header fields', measures > first_measures);
imgui.CalcTextSize, printout.lines, imgui.GetMousePos = measure, format, mouse;

-- Each wrapped colored run retains its own level or PH hover identity.
s.overlay.tips, s.overlay.font_size = true, 16;
local bounds, real_text = {}, imgui.TextColored;
imgui.TextColored = function(color, text)
    local x, y = imgui.GetCursorScreenPos();
    if (text:find('Lizzy', 1, true)) then bounds.ph = { x + 3, y + 3 }; end
    if (text:find('17199202', 1, true)) then bounds.id = { x + 3, y + 3 }; end
    return real_text(color, text);
end;
ashita.events.register('d3d_present', 'header_hover', function() overlay.draw(s, true, function() return result; end); end);
s.overlay.wrap = 168;
overlay.changed(s);
MOCK.frame();
for _, key in ipairs({ 'id', 'ph' }) do
    MOCK.mouse = { 0, 0 }; MOCK.frame();
    MOCK.mouse = assert(bounds[key]); MOCK.wait(0.3);
    local got = MOCK.gui.overlay_tip and MOCK.gui.overlay_tip.text;
    local wanted = require('ui.tips').text(s, result, key == 'ph' and 'ph' or 'level', key);
    expect('wrapped ' .. key .. ' text keeps its own hover help', got, wanted);
end
imgui.TextColored = real_text;
expect('header wrapping sends no commands', #MOCK.commands, 0);
expect('header wrapping saves no settings', MOCK.saved, 0);
return MOCK.report();
