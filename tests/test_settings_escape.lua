-- Escape closes focused settings without taking a control's own cancel press.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local panel = require('ui.settings_window');
local imgui = require('imgui');
local history = require('ui.history');
MOCK.navigation_real = true;
require('ui.navigation').select('Display');
local pressed, focused, active, popup = false, true, false, false;
local polls, focus_flags, repeated = 0, nil, nil;
imgui.IsKeyPressed = function(key, repeat_)
    polls, repeated = polls + 1, repeat_;
    assert(key == ImGuiKey_Escape, 'Only Escape should be read.');
    return pressed;
end;
imgui.IsWindowFocused = function(flags) focus_flags = flags; return focused; end;
imgui.IsAnyItemActive = function() return active; end;
imgui.IsPopupOpen = function(id, flags)
    assert(id == '' and flags == ImGuiPopupFlags_AnyPopup, 'Check the popup stack without naming an item.');
    return popup;
end;
local function frame()
    local first = #MOCK.printed;
    MOCK.frame(0);
    for _, text in ipairs(MOCK.printed_since(first)) do
        assert(not text:find('Stopped after an error', 1, true), text);
    end;
end;
local function open()
    pressed, focused, active, popup = false, true, false, false;
    panel.set_open(true);
    frame();
end;
local function escape() pressed = true; frame(); pressed = false; end;

pressed = true;
frame();
check('closed settings do not poll Escape', polls == 0 and not panel.is_open());
open();
local saved = MOCK.saved;
local original = history.copy(MOCK.settings.current);
escape();
check('Escape closes focused settings', not panel.is_open());
check('Escape checks root and child focus', focus_flags == ImGuiFocusedFlags_RootAndChildWindows);
check('Escape does not repeat while held', repeated == false);
check('closing does not save or change settings', MOCK.saved == saved and history.equal(original, MOCK.settings.current));
local stopped = polls;
frame();
check('closed settings stop polling immediately', polls == stopped);

open(); focused = false; escape();
check('Escape leaves unfocused settings open', panel.is_open());
focused = true; frame(); escape();
check('Escape closes after settings gains focus', not panel.is_open());

open(); MOCK.player.status_server = 1; escape();
check('Escape closes while engaged', not panel.is_open());
open(); MOCK.target_monster(1, 'Tunnel Worm'); MOCK.pick(1); escape();
check('target selection does not prevent a focused close', not panel.is_open());

open(); active = true; frame(); escape();
check('an active text field keeps its own cancel press', panel.is_open());
active = false; frame(); escape();
check('another Escape closes after editing ends', not panel.is_open());

open(); popup = true; frame();
popup = false; escape();
check('a popup closed by ImGui before drawing keeps its cancel press', panel.is_open());
frame(); escape();
check('another Escape closes after the popup is gone', not panel.is_open());

open(); popup = true; escape();
check('a popup still open keeps Escape', panel.is_open());
panel.set_open(false); open(); escape();
check('closing and reopening clears the previous popup state', not panel.is_open());

open();
MOCK.open['##reset_actions'] = true;
MOCK.clicks['##reset_actions/Reset all settings'] = true;
frame();
MOCK.open['##reset_actions'] = nil;
check('reset confirmation is open', MOCK.gui.paths['Reset all settings'] ~= nil);
local owner, before = MOCK.settings.current, history.copy(MOCK.settings.current);
escape();
check('Escape cancels reset confirmation but keeps settings open', panel.is_open()
    and MOCK.gui.paths['Reset all settings'] == nil);
check('Escape never confirms or replaces settings', MOCK.settings.current == owner
    and history.equal(before, MOCK.settings.current));
frame(); escape();
check('the next Escape closes after cancelling reset', not panel.is_open());
open();
check('cancelled confirmation does not return when reopening', MOCK.gui.paths['Reset all settings'] == nil);
MOCK.close_x = true; frame();
check('the X still closes settings', not panel.is_open());
open(); MOCK.command('/checkmate');
check('the command still closes settings', not panel.is_open());
return MOCK.report();
