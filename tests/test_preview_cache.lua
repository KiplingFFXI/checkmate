local preview = require('ui.preview');
local imgui = require('imgui');
local s = require('ui.defaults').make();
for _, row in pairs(s.printout.parts) do row.on = false; end
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = false; end
s.printout.parts.name.on, s.printout.parts.block.on = true, true;
s.overlay.parts.name, s.overlay.parts.crit, s.overlay.parts.effects = true, true, true;
s.overlay.own_lines, s.overlay.wrap = true, 130;
s.effects.times = true;
local result = { name = 'Example monster', low = 75, high = 78,
    block = { low = 25.5, high = 29 }, crit = { low = 10, high = 15 },
    effects = { { effect = 4, name = 'Paralyze', debuff = true, mine = true, left = 123, ends = 123.4 } } };
local formatted, measured = 0, 0;
local lines, measure = preview.lines, imgui.CalcTextSize;
preview.lines = function(...) formatted = formatted + 1; return lines(...); end;
imgui.CalcTextSize = function(...) measured = measured + 1; return measure(...); end;
local events;
local colored, plain, same = imgui.TextColored, imgui.TextUnformatted, imgui.SameLine;
imgui.TextColored = function(color, text)
    events[#events + 1] = 'color:' .. table.concat(color, ',') .. ':' .. text;
    return colored(color, text);
end;
imgui.TextUnformatted = function(text)
    events[#events + 1] = 'text:' .. text;
    return plain(text);
end;
imgui.SameLine = function(...)
    events[#events + 1] = 'same';
    return same(...);
end;
local function draw(options, value)
    MOCK.frame(0);
    imgui.Begin('Preview cache', { true }, 0);
    events = {};
    preview.draw(s, value, options);
    imgui.End();
    return table.concat(events, '\n');
end
local options = { display = 'overlay', source = 'current', width = 180, revision = {} };
local first = draw(options, result);
local f, m = formatted, measured;
expect('stable preview draws the same colors, text and line breaks', draw(options, result), first);
expect('stable preview does not format again', formatted, f);
expect('stable preview does not measure again', measured, m);
MOCK.now = MOCK.now + 40.8;
expect('preview keeps snapshot effect times as before', draw(options, result), first);
expect('time alone does not reformat a snapshot', formatted, f);
for _, display in ipairs({ 'chat', 'overlay' }) do
    for _, width in ipairs({ 40, 90, 560 }) do
        options.display, options.width, options.revision = display, width, {};
        local cached = draw(options, result);
        expect(display .. ' cache keeps narrow and wide layout at ' .. width, draw(options, result), cached);
        expect(display .. ' cached layout equals uncached layout at ' .. width,
            draw({ display = display, width = width, source = 'current' }, result), cached);
    end
end
options.display, options.width, options.revision = 'chat', 300, {};
draw(options, result);
s.printout.parts.block.label = string.rep('Custom', 20);
options.revision = {};
local changed = draw(options, result);
expect('custom label wrapping matches uncached drawing',
    draw({ display = 'chat', width = 300, source = 'current' }, result), changed);
s.printout.parts.block.label = 'Guard';
options.revision = {};
changed = draw(options, result);
check('a new revision refreshes an in-place label edit', changed:find('Guard', 1, true) ~= nil);
local fresh = { name = result.name, low = 75, high = 78, block = { low = 30, high = 30 } };
changed = draw(options, fresh);
check('a replacement result refreshes values', changed:find('30%', 1, true) ~= nil);
local uncached = { display = 'chat', source = 'current', width = 300 };
draw(uncached, fresh);
fresh.block.low, fresh.block.high = 40, 40;
check('callers without a revision retain mutable result support', draw(uncached, fresh):find('40%', 1, true) ~= nil);
s.printout.parts.block.label = 'Changed directly';
check('callers without a revision retain mutable settings support',
    draw(uncached, fresh):find('Changed', 1, true) ~= nil);
options.display, options.revision = 'overlay', {};
draw(options, result);
f = formatted;
options.width = 130;
draw(options, result);
expect('width changes rebuild the layout', formatted, f + 1);
f = formatted;
s.overlay.wrap = 60;
draw(options, result);
expect('overlay wrap changes rebuild the layout', formatted, f + 1);
f = formatted;
s.overlay.font_size = 24;
draw(options, result);
expect('font size changes rebuild the layout', formatted, f + 1);
f = formatted;
options.default_font = {};
draw(options, result);
expect('font face changes rebuild the layout', formatted, f + 1);
f = formatted;
options.source = 'sample';
check('source headings are current without reformatting rows',
    draw(options, result):find('sample data', 1, true) ~= nil);
expect('source text alone keeps the same row layout', formatted, f);
check('missing current data replaces old values', draw(options, nil):find('No current target readout', 1, true) ~= nil);
local no_rows = { name = 'No rows' };
s.overlay.parts.name, s.overlay.parts.effects, s.overlay.parts.crit = false, false, false;
options.revision = {};
check('empty enabled values replace old values',
    draw(options, no_rows):find('No enabled rows', 1, true) ~= nil);
options.display, options.revision = 'overlay', {};
s.overlay.parts.effects, s.overlay.wrap = true, 500;
local effects = { effects = { { effect = 4, name = 'Paralyze', debuff = true, mine = true, left = 5 } } };
check('new effect snapshots retain their displayed seconds', draw(options, effects):find('0:05', 1, true) ~= nil);
effects = { effects = { { effect = 4, name = 'Paralyze', debuff = true, mine = true, left = 4 } } };
check('replacement effect snapshots refresh immediately', draw(options, effects):find('0:04', 1, true) ~= nil);
effects = { effects = { { effect = 4, name = 'Paralyze', debuff = true, mine = true, ends = MOCK.now + 4.2 } } };
check('a live endpoint does not invent a snapshot countdown', not draw(options, effects):find('0:04', 1, true));
imgui.TextColored, imgui.TextUnformatted, imgui.SameLine = colored, plain, same;
imgui.CalcTextSize, preview.lines = measure, lines;

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local window = require('ui.settings_window');
local seen_revision, seen_result, calls;
local draw_preview = preview.draw;
preview.draw = function(settings, value, opts)
    seen_revision, seen_result = opts.revision, value;
    calls = (calls or 0) + 1;
    return draw_preview(settings, value, opts);
end;
MOCK.navigation_real = true;
require('ui.navigation').select('Aggro');
window.set_open(true);
window.preview_open, window.preview_options = true, { display = 'overlay', source = 'sample' };
MOCK.frame(0);
check('settings window provides its current cache revision', seen_revision ~= nil and seen_revision == window.preview_cache);
local revision, sample = seen_revision, seen_result;
MOCK.frame(0);
check('settings window reuses unchanged sample and revision', seen_revision == revision and seen_result == sample);
MOCK.clicks['Aggro/Group names by family'] = true;
MOCK.frame(0);
MOCK.frame(0);
check('editing a source-dependent setting replaces the revision and sample', seen_revision ~= revision
    and seen_result ~= sample and not seen_result.links.grouped);
revision = seen_revision;
MOCK.command('/checkmate linkfamilies on');
MOCK.frame(0);
check('command edits invalidate the preview', seen_revision ~= revision and seen_result.links.grouped);
window.preview_options.source = 'current';
MOCK.frame(0);
check('current readout never reuses the sample by source choice', seen_result ~= sample and seen_result ~= window.preview_cache.sample);
window.preview_open = false;
local previous_calls = calls;
MOCK.frame(0);
expect('closed preview does no draw work', calls, previous_calls);
expect('preview and local settings changes send no commands', #MOCK.commands, 0);
return MOCK.report();
