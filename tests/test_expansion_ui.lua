-- Monster facts and visual-only Elements warnings stay optional, and target details retain hidden text.
local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local window = require('ui.settings_window');
local s = defaults.make();
require('ui.skins').fill(s);
local function has(text, value) return (text or ''):find(value, 1, true) ~= nil; end
local r = { name = 'Example', low = 50, high = 50,
    elements = { weak = { { element = 'thunder', why = 'lowest' } }, resists = {}, scripted = true },
    info = { sections = {
        { id = 'family', label = 'Family', value = 'Goblin', notes = { 'From the stored family data.' } },
        { id = 'vitals', label = 'HP and MP', value = 'HP unknown', notes = { 'The exact level is unknown.' } },
        { id = 'blue', label = 'Blue Magic', value = 'Bomb Toss', notes = { 'You must see the eligible move.' } },
    } },
};
local function text() return MOCK.plain(table.concat(printout.lines(s, r), '\n')); end
for _, id in ipairs(require('core.parts').INFO_IDS) do
    check(id .. ' starts off in both displays', not s.printout.parts[id].on and not s.overlay.parts[id]);
end
check('Elements script mark starts on', s.elements.script_mark == true);
for key, part in pairs(s.printout.parts) do part.on = key == 'weaknesses'; end
s.weaknesses.chat.weapons, s.weaknesses.chat.immunities, s.weaknesses.chat.charm = false, false, false;
s.printout.header, s.printout.divider, s.printout.replace_game_line = false, 'pipe', false;
check('Elements shows the script mark by default', text():sub(-1) == '?');
s.elements.script_mark = false;
check('switch only removes the visual mark', has(text(), 'Weak: Thunder') and not has(text(), '?'));
check('hover still explains changing values without referring to a hidden mark',
    has(tips.text(s, r, 'element', 'thunder'), 'stored values can change') and not has(tips.text(s, r, 'element', 'thunder'), 'The ?'));
s.printout.parts.weaknesses.on = false;
for _, id in ipairs({ 'family', 'vitals', 'blue' }) do
    s.printout.parts[id].on, s.printout.parts[id].new_line = true, false;
end
expect('Monster sections keep labels and unknown values', text(), 'Family: Goblin | HP and MP: HP unknown | Blue Magic: Bomb Toss');
s.printout.parts.family.on = false;
check('a disabled section leaves both display and details', not has(text(), 'Family:') and not has(tips.details(s, r), 'Family:'));
s.printout.parts.vitals.label = 'Vitals';
check('each category label is customizable', has(text(), 'Vitals: HP unknown'));
check('hover retains full names and conditions', has(tips.text(s, r, 'info', 'blue'), 'Blue Magic: Bomb Toss')
    and has(tips.text(s, r, 'info', 'blue'), 'eligible move'));
window.set_target_details(r);
window.set_open(true);
MOCK.typing['Find settings'] = 'Show script warning';
window.draw(s, 'test');
check('search highlights the actual matching control', has(table.concat(MOCK.gui.highlights, '\n'), 'Weaknesses/Show script warning'));
check('search jumps to the matching control', has(table.concat(MOCK.gui.scrolled, '\n'), 'Weaknesses/Show script warning'));
local jumped = #MOCK.gui.scrolled;
MOCK.typing['Find settings'] = nil;
window.draw(s, 'test');
expect('a steady query does not pull the scroll every frame', #MOCK.gui.scrolled, jumped);
MOCK.typing['Find settings'] = '';
window.draw(s, 'test');
MOCK.typing['Find settings'] = nil;
MOCK.gui.paths, MOCK.gui.texts = {}, {};
MOCK.clicks['Target details##toolbar'] = true;
MOCK.open['Blue Magic##detail_info_blue'] = false;
window.draw(s, 'test');
check('collapsed details hide their body', not MOCK.drew('You must see the eligible move.'));
MOCK.gui.paths, MOCK.gui.texts = {}, {};
MOCK.typing['Find target details'] = 'exact level';
window.draw(s, 'test');
check('detail search finds notes as well as headings', MOCK.gui.paths['HP and MP##detail_info_vitals'] == 'CollapsingHeader'
    and MOCK.gui.paths['Blue Magic##detail_info_blue'] == nil);
MOCK.clicks['Copy details'] = true;
window.draw(s, 'test');
check('copied details retain filtered or collapsed sections', has(MOCK.clipboard, 'Blue Magic: Bomb Toss')
    and has(MOCK.clipboard, 'eligible move') and has(MOCK.clipboard, 'HP unknown'));
local builds, original = 0, tips.detail_groups;
tips.detail_groups = function (...) builds = builds + 1; return original(...); end;
window.draw(s, 'test'); window.draw(s, 'test');
expect('steady details reuse their formatted text', builds, 0);
s.blue.chat.lessons = false;
MOCK.clicks['Copy details'] = true;
window.draw(s, 'test');
check('a section toggle refreshes cached details and the copied details', builds == 1 and not has(MOCK.clipboard, 'Bomb Toss'));
window.set_target_details(nil);
MOCK.gui.texts = {};
window.draw(s, 'test');
check('clearing the target removes visible details without changing the clipboard', MOCK.drew('No monster selected.')
    and not MOCK.drew('HP unknown') and has(MOCK.clipboard, 'HP unknown'));
MOCK.clicks['Copy details'] = true;
window.draw(s, 'test');
expect('copy after losing the target replaces previous target data', MOCK.clipboard, 'No monster selected.');
tips.detail_groups = original;
-- Long sections wrap by words, with the right tip on every continuation line.
local imgui, overlay = require('imgui'), require('ui.overlay');
s.blue.chat.lessons = true;
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'blue'; end
s.overlay.on, s.overlay.icons, s.overlay.tips, s.overlay.wrap, s.overlay.font_size = true, false, true, 210, 24;
s.printout.short_words = false;
r.info.sections[3].value = 'Bomb Toss (not learned), Frypan (learned), another long move name';
local old_text, widest, bounds = imgui.TextColored, 0, nil;
imgui.TextColored = function (color, value)
    if ((MOCK.gui.window or ''):find('checkmate_overlay', 1, true)) then
        widest = math.max(widest, (imgui.CalcTextSize(value)));
        if (value:find('another', 1, true)) then
            local x, y = imgui.GetCursorScreenPos(); bounds = { x + 5, y + 8 };
        end
    end
    return old_text(color, value);
end;
ashita.events.register('d3d_present', 'expansion_ui', function () overlay.draw(s, true, function () return r; end); end);
MOCK.frame();
check('long Monster descriptions wrap within the requested width', widest <= s.overlay.wrap and bounds ~= nil, widest);
MOCK.mouse = bounds;
MOCK.wait(0.3);
check('a wrapped continuation keeps its own full notes', has(MOCK.gui.overlay_tip and MOCK.gui.overlay_tip.text, 'eligible move'));
s.overlay.tips = false;
overlay.changed(s);
widest = 0;
MOCK.frame();
check('turning tips off keeps long descriptions wrapped', widest <= s.overlay.wrap and MOCK.gui.overlay_tip == nil, widest);
imgui.TextColored = old_text;
expect('all of this sends no game commands', #MOCK.commands, 0);
return MOCK.report();
