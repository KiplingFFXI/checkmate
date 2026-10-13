-- Escape hides the overlay without throwing away the last check.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local overlay = require('ui.overlay');
local panel = require('ui.settings_window');
local target = require('core.target');
local effects = require('core.effects');
local history = require('ui.history');
local imgui = require('imgui');
local s = MOCK.settings.current;
local pressed, active, popup, focused = false, false, false, true;
local polls, busy_reads = 0, 0;
imgui.IsKeyPressed = function(key, repeat_)
    polls = polls + 1;
    assert(key == ImGuiKey_Escape and repeat_ == false, 'Read only a fresh Escape press.');
    return pressed;
end;
imgui.IsAnyItemActive = function() busy_reads = busy_reads + 1; return active; end;
imgui.IsPopupOpen = function(id, flags)
    busy_reads = busy_reads + 1;
    assert(id == '' and flags == ImGuiPopupFlags_AnyPopup);
    return popup;
end;
imgui.IsWindowFocused = function() return focused; end;
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'name' or id == 'effects'; end
s.overlay.icons, s.overlay.tips = false, false;
MOCK.command('/checkmate overlay on');
MOCK.zone_in(900);
MOCK.player.main_level = 40;
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.monster(2, 'Fixture Goblin');
local me, mob = MOCK.player.server_id, MOCK.mob_id(900, 1);
local function select(index)
    MOCK.target.slot0, MOCK.target.slot1, MOCK.target.picking = index, 0, false;
end;
local function frame(dt)
    local before = #MOCK.printed;
    MOCK.frame(dt or 0);
    for _, text in ipairs(MOCK.printed_since(before)) do
        assert(not text:find('Stopped after an error', 1, true)
            and not text:find('stopped after an error', 1, true), text);
    end;
    return MOCK.gui.flags['##checkmate_overlay'] ~= nil;
end;
local function escape()
    pressed = true;
    local shown = frame();
    pressed = false;
    return shown;
end;
local function reply(index)
    MOCK.packet(MOCK.check_packet(index or 1, 39, 4, 174));
end;
local function reopen()
    select(1); reply(); frame();
end;

expect('Escape dismissal starts disabled', s.overlay.escape_closes, false);
check('a target is visible with default settings', frame());
for _ = 1, 20 do escape(); end
expect('disabled dismissal never polls Escape', polls, 0);
expect('disabled dismissal adds no active-item or popup reads', busy_reads, 0);
check('default Escape leaves the overlay visible', frame());
s.overlay.escape_closes = true;
overlay.changed(s);
reply(); frame();
MOCK.packet(MOCK.message_packet(me, mob, 2, 0, 203, 1));
frame();
check('a confirmed effect is present before hiding', effects.has(mob));
local before = history.copy(s);
local saves, commands, prints = MOCK.saved, #MOCK.commands, #MOCK.printed;
select(0);
check('Escape hides even when the game deselects in the same frame', not escape());
select(1);
check('retargeting the checked monster stays hidden', not frame());
select(2);
check('switching to another monster stays hidden', not frame());
select(1);
MOCK.packet(MOCK.widescan_packet(1, 39));
check('widescan does not reopen the overlay', not frame());
MOCK.packet(MOCK.message_packet(me + 1, mob, 39, 68, 174, 1));
check('another player check does not reopen the overlay', not frame());
overlay.changed(s);
check('an ordinary settings refresh keeps it hidden', not frame());
check('hiding leaves the tracked effect intact', effects.has(mob));
check('hiding does not edit or save settings', history.equal(before, s) and MOCK.saved == saves);
check('hiding sends and prints nothing', #MOCK.commands == commands and #MOCK.printed == prints);
s.overlay.escape_closes = false; overlay.changed(s);
check('turning the option off restores the overlay', frame());
check('the exact checked level survives dismissal', target.current() and target.current().low == 39
    and target.current().provenance.checked_at ~= nil);
s.overlay.escape_closes = true; overlay.changed(s); frame(); escape();
reply();
check('the next own accepted manual check reopens the overlay', frame());

active = true; frame();
check('an active text control keeps Escape', escape());
active = false;
check('the frame after editing keeps its cancel press', escape());
frame();
check('a later Escape hides after editing ends', not escape());
reopen(); popup = true; frame();
check('an open popup keeps Escape', escape());
popup = false;
check('a popup closed before drawing keeps its cancel press', escape());
frame();
check('another Escape hides after the popup is gone', not escape());
reopen();
for _, focus in ipairs({ true, false }) do
    focused = focus;
    panel.set_open(true); frame(); escape();
    panel.set_open(false); frame(); frame();
    check('settings protect the overlay when focused=' .. tostring(focus), frame());
end;
focused = true;
escape();
panel.set_open(true);
check('settings can preview a dismissed overlay', frame());
panel.set_open(false);
check('closing settings leaves that overlay dismissed', not frame());
reply(); frame(); frame(); escape();
overlay.forget();
check('forget resets dismissal', frame());

s.overlay.only_checked = true; overlay.changed(s);
select(2);
check('checked-only mode still hides an unchecked target', not frame());
reply(2); frame();
check('checked-only mode also dismisses with Escape', not escape());
select(1); frame(); reply();
check('an own check reopens checked-only mode', frame());
escape();
MOCK.zone_in(900); select(1);
check('a zone change does not reopen a dismissed overlay', not frame());
reply();
check('an own check after zoning reopens the overlay', frame());

s.overlay.parts.hit = true; overlay.changed(s);
reply(); frame(1.6);
local sent = #MOCK.commands;
expect('an enabled numeric row requests its stats only after the manual check', sent, commands + 1);
check('Escape hides while the parameter reply is pending', not escape());
for _, packet in ipairs(MOCK.checkparam_packets(160, 130)) do MOCK.packet(packet); end
check('a completed parameter reply keeps the overlay hidden', not frame());
expect('the parameter reply creates no further request', #MOCK.commands, sent);
s.overlay.escape_closes = false; overlay.changed(s);
check('turning dismissal off shows the completed checked numbers', frame()
    and target.current() and target.current().hit and target.current().hit.low ~= nil);
s.overlay.parts.hit = false;
s.overlay.only_checked = false;
s.overlay.escape_closes = true; overlay.changed(s); frame(); escape();
MOCK.fire('unload');
-- Ashita reloads the overlay module after unloading the addon.
MOCK.settings_file = history.copy(s);
package.loaded['ui.overlay'] = nil;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
s = MOCK.settings.current;
check('unload and load reset dismissal', frame());
return MOCK.report();
