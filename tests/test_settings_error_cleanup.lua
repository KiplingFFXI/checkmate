-- Failed settings draws must leave ImGui ready for the next addon and the next frame.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.navigation_real = true;
local imgui = require('imgui');
local panel = require('ui.settings_window');
local guard = require('ui.draw_guard');
require('ui.navigation').select('Display');
local names = { 'Begin', 'End', 'BeginChild', 'EndChild', 'BeginTable', 'EndTable', 'BeginCombo', 'EndCombo',
    'BeginDisabled', 'EndDisabled', 'PushFont', 'PopFont', 'PushID', 'PopID', 'PushStyleColor', 'PopStyleColor',
    'PushStyleVar', 'PopStyleVar', 'PushTextWrapPos', 'PopTextWrapPos', 'GetWindowDrawList' };
local function raw_entries()
    local out = {};
    for _, name in ipairs(names) do out[name] = { rawget(imgui, name) }; end
    return out;
end
local function unchanged(before)
    for _, name in ipairs(names) do if (rawget(imgui, name) ~= before[name][1]) then return false; end end
    return true;
end
local function recover(label)
    MOCK.command('/checkmate');
    panel.set_open(true);
    local ok, why = pcall(MOCK.frame, 0);
    check(label .. ' redraws on the next frame', ok, why);
end
local function failure(label, inject, restore)
    panel.set_open(true);
    local before = raw_entries();
    local printed = #MOCK.printed;
    inject();
    local installed = raw_entries();
    local ok, why = pcall(MOCK.frame, 0);
    check(label .. ' leaves every mock stack balanced', ok, why);
    check(label .. ' restores existing GUI hooks', unchanged(installed));
    check(label .. ' reports its controlled error', table.concat(MOCK.printed_since(printed), '\n'):find('controlled draw failure', 1, true) ~= nil);
    restore();
    check(label .. ' leaves native metatable fallbacks intact', unchanged(before));
    recover(label);
end

local push_font = rawget(imgui, 'PushFont');
failure('failure before the font push', function()
    imgui.PushFont = function() error('controlled draw failure before font'); end;
end, function() imgui.PushFont = push_font; end);
local toolbar = panel.draw_toolbar;
failure('failure inside the root window', function()
    panel.draw_toolbar = function() error('controlled draw failure in toolbar'); end;
end, function() panel.draw_toolbar = toolbar; end);

failure('failure inside a child table and clip rectangle', function()
    panel.draw_toolbar = function()
        imgui.BeginChild('##failed_child', { 200, 200 }, 0, 0);
        assert(imgui.BeginTable('##failed_table', 1, 0));
        imgui.PushID('failed_row');
        imgui.BeginDisabled(true);
        imgui.PushTextWrapPos(100);
        imgui.GetWindowDrawList():PushClipRect({ 0, 0 }, { 100, 100 }, true);
        error('controlled draw failure in nested content');
    end;
end, function() panel.draw_toolbar = toolbar; end);

local draw_page = panel.draw_page;
failure('failure after the page was drawn', function()
    panel.draw_page = function(...)
        draw_page(...);
        error('controlled draw failure after page');
    end;
end, function() panel.draw_page = draw_page; end);

-- The direct guard must preserve scopes that belonged to the caller before it began.
local foreign_done = false;
ashita.events.register('d3d_present', 'test_settings_scope_owner', function()
    if (foreign_done) then return; end
    foreign_done = true;
    imgui.PushStyleColor(ImGuiCol_Text, { 1, 1, 1, 1 });
    imgui.PushFont(MOCK.ashita_font, 22);
    imgui.Begin('Other addon', { true }, 0);
    imgui.PushID('foreign');
    local raw = raw_entries();
    local ok = pcall(guard.run, function()
        imgui.BeginChild('##guarded_child', { 100, 100 }, 0, 0);
        imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, { 2, 2 });
        error('controlled draw failure under another window');
    end);
    check('guard rethrows the nested error', not ok);
    check('guard restores all raw function entries', unchanged(raw));
    expect('guard preserves the caller font', imgui.GetFontSize(), 22);
    local width = imgui.GetWindowSize();
    check('guard returns to the caller window', type(width) == 'number' and width > 0);
    imgui.PopID(); imgui.End(); imgui.PopFont(); imgui.PopStyleColor(1);
end);
local ok, why = pcall(MOCK.frame, 0);
check('foreign scopes stay balanced after guarded failure', ok, why);

local child = imgui.BeginChild;
local child_raw = rawget(imgui, 'BeginChild');
imgui.BeginChild = function(...)
    child(...);
    return false;
end;
local child_done = false;
ashita.events.register('d3d_present', 'test_settings_false_child', function()
    if (child_done) then return; end
    child_done = true;
    local success = pcall(guard.run, function()
        imgui.Begin('False child test', { true }, 0);
        imgui.BeginChild('##false_child', { 50, 50 }, 0, 0);
        error('controlled draw failure after a clipped child');
    end);
    check('a false BeginChild still gets EndChild', not success);
end);
ok, why = pcall(MOCK.frame, 0);
imgui.BeginChild = child_raw;
check('clipped child cleanup leaves stacks balanced', ok, why);

local tooltip, tooltip_end = rawget(imgui, 'BeginTooltip'), rawget(imgui, 'EndTooltip');
local attempted, ended = 0, 0;
imgui.BeginTooltip = function() attempted = attempted + 1; return false; end;
imgui.EndTooltip = function() ended = ended + 1; error('A false tooltip has no scope to end.'); end;
MOCK.hover, MOCK.navigation_real = true, false;
ok, why = pcall(MOCK.frame, 0);
check('every config helper accepts a false tooltip result', ok and attempted > 0, why);
expect('false tooltips never call EndTooltip', ended, 0);
local nav = require('ui.navigation');
local hidden_done = false;
ashita.events.register('d3d_present', 'test_settings_false_hidden_tip', function()
    if (hidden_done) then return; end
    hidden_done = true;
    local settings = MOCK.settings.current;
    settings.window.tabs.Pets = false;
    guard.run(function()
        imgui.Begin('Hidden tab tooltip', { true }, 0);
        nav.draw(settings, { { 'Display', function() end }, { 'Pets', function() end } },
            { Display = true, Pets = true }, false, function() end, { width = 600, searching = true });
        imgui.End();
    end);
end);
ok, why = pcall(MOCK.frame, 0);
check('hidden-tab navigation accepts a false tooltip result', ok, why);
expect('hidden-tab navigation does not end a false tooltip', ended, 0);
imgui.BeginTooltip, imgui.EndTooltip = tooltip, tooltip_end;
MOCK.hover, MOCK.navigation_real = nil, true;

-- Global style scopes can close below nested windows; local IDs must stay with their owner.
panel.set_open(false);
local pop_var, raw_pop_var = imgui.PopStyleVar, rawget(imgui, 'PopStyleVar');
local stress_frames, tuples_ok, fonts_ok = 0, true, true;
imgui.PopStyleVar = function(...)
    tuples_ok = tuples_ok and select('#', ...) == 1 and (...) == 2;
    pop_var(...);
    return false, nil, 73;
end;
ashita.events.register('d3d_present', 'test_settings_interleaved_scopes', function()
    if (stress_frames >= 256) then return; end
    stress_frames = stress_frames + 1;
    guard.run(function()
        imgui.PushStyleColor(ImGuiCol_Text, { 1, 1, 1, 1 });
        imgui.PushStyleColor(ImGuiCol_WindowBg, { 0, 0, 0, 1 });
        imgui.PushStyleVar(ImGuiStyleVar_WindowPadding, { 2, 2 });
        imgui.Begin('Interleaved scope test', { true }, 0);
        imgui.PushFont(MOCK.ashita_font, 22);
        imgui.PopStyleColor(2);
        imgui.BeginChild('##scope_child', { 200, 200 }, 0, 0);
        imgui.PushID('child owner');
        imgui.PushStyleVar(ImGuiStyleVar_FramePadding, { 2, 2 });
        assert(imgui.BeginTable('##scope_table', 1, 0));
        imgui.PushStyleColor(ImGuiCol_Text, { 1, 1, 1, 1 });
        local a, b, c = imgui.PopStyleVar(2);
        tuples_ok = tuples_ok and a == false and b == nil and c == 73;
        imgui.PushTextWrapPos(100);
        local list = imgui.GetWindowDrawList();
        list:PushClipRect({ 0, 0 }, { 100, 100 }, true);
        list:PopClipRect();
        imgui.PopTextWrapPos();
        imgui.PopStyleColor(1);
        imgui.EndTable();
        imgui.PopID();
        imgui.EndChild();
        fonts_ok = fonts_ok and imgui.GetFontSize() == 22;
        imgui.PopFont();
        imgui.End();
    end);
end);
ok, why = pcall(function() for _ = 1, 256 do MOCK.frame(0); end end);
imgui.PopStyleVar = raw_pop_var;
check('repeated nested windows and interleaved counted pops stay balanced', ok and stress_frames == 256, why);
check('interleaved native close arguments and return tuples stay intact', tuples_ok);
check('interleaved style closes preserve the current font', fonts_ok);

local ownership_done = false;
ashita.events.register('d3d_present', 'test_settings_local_scope_boundary', function()
    if (ownership_done) then return; end
    ownership_done = true;
    local success, problem = pcall(guard.run, function()
        imgui.Begin('Local scope ownership', { true }, 0);
        imgui.PushID('parent only');
        imgui.BeginChild('##other_owner', { 100, 100 }, 0, 0);
        imgui.PopID();
    end);
    check('a child cannot consume its parent ID', not success and tostring(problem):find('did not open', 1, true) ~= nil);
end);
ok, why = pcall(MOCK.frame, 0);
check('rejected cross-window closes unwind their original owners', ok, why);
return MOCK.report();
