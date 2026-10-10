-- A marked icon name never lends its tooltip to the next unmarked part on the same line.
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
local overlay = require('ui.overlay');
local imgui = require('imgui');
s.overlay.on, s.overlay.icons, s.overlay.tips, s.overlay.own_lines, s.overlay.wrap = true, true, true, false, 0;
s.printout.extras_own_line = false;
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'drops' or key == 'steal'; end
s.printout.parts.drops.new_line, s.printout.parts.steal.new_line = false, false;
MOCK.picture('item', 1);
local result = { name = 'Example', low = 20, high = 20,
    drops = { items = { { id = 1, name = 'Example loot', chance = 100 } }, th = 0, more = 0 },
    steal = { ids = {}, items = {} } };
local bounds = {};
local real_text = imgui.TextColored;
imgui.TextColored = function (color, text)
    local x, y = imgui.GetCursorScreenPos();
    for _, label in ipairs({ 'Example loot', 'Steal:', 'nothing' }) do
        if (text:find(label, 1, true)) then bounds[label] = { x + #text * 7 / 2, y + s.overlay.font_size / 2 }; end
    end
    return real_text(color, text);
end;
ashita.events.register('d3d_present', 'test_hover_bounds', function () overlay.draw(s, true, function () return result; end); end);
local function tip(label)
    MOCK.mouse = { 0, 0 };
    MOCK.frame();
    MOCK.mouse = assert(bounds[label], label);
    MOCK.wait(0.3);
    return MOCK.gui.overlay_tip and MOCK.gui.overlay_tip.text;
end
MOCK.frame();
check('the marked item still has its own text tooltip', (tip('Example loot') or ''):find('Example loot.', 1, true) ~= nil);
expect('the following part label does not inherit the item tooltip', tip('Steal:'), nil);
expect('an unmarked answer does not inherit the item tooltip', tip('nothing'), nil);
return MOCK.report();
