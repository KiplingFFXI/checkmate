local imgui = require('imgui');
local defaults = require('ui.defaults');
local printout = require('core.printout');
local display = require('ui.display');
local settings = defaults.make();
local saved, destination = 0, nil;
local ui = { names = { hit = 'Hit rate', block = 'Shield block' }, tips = {}, overlay_tips = {}, label_max = 24 };
function ui.help() end
function ui.note(text) imgui.TextUnformatted(text); end
function ui.checkbox(label, owner, key, tip, disabled)
    imgui.BeginDisabled(disabled == true);
    local value = { owner[key] == true };
    if (imgui.Checkbox(label, value)) then owner[key], saved = value[1], saved + 1; end
    imgui.EndDisabled();
end
function ui.text_box(label, owner, key, width, max, tip, disabled)
    imgui.BeginDisabled(disabled == true);
    imgui.SetNextItemWidth(width);
    local value = { owner[key] or '' };
    if (imgui.InputText(label, value, max + 1)) then owner[key], saved = value[1], saved + 1; end
    imgui.EndDisabled();
end
function ui.move(ps, id, index, count)
    imgui.BeginDisabled(index == 1);
    if (imgui.ArrowButton('##up', ImGuiDir_Up)) then ps.order = printout.move(ps.order, id, -1); end
    imgui.EndDisabled();
    imgui.SameLine();
    imgui.BeginDisabled(index == count);
    if (imgui.ArrowButton('##down', ImGuiDir_Down)) then ps.order = printout.move(ps.order, id, 1); end
    imgui.EndDisabled();
end
function ui.options(id) destination = id; end
local function draw(width, size)
    MOCK.frame();
    MOCK.avail = width;
    imgui.Begin('Display test', { true }, 0);
    imgui.PushFont(MOCK.ashita_font, size or 18);
    display.draw(settings, ui);
    imgui.PopFont();
    imgui.End();
end
draw(1040);
expect('wide display uses the full seven-column matrix', MOCK.gui.tables['##display_parts'], 7);
check('name and its fixed layout choices are represented', MOCK.gui.paths['name/##chat'] == 'Checkbox'
    and MOCK.gui.disabled['name/##new_line']);
check('checked-stat rows have editable overlay switches', not MOCK.gui.disabled['hit/##overlay']
    and not MOCK.gui.disabled['offhand/##overlay'] and not MOCK.gui.disabled['ranged/##overlay']
    and not MOCK.gui.disabled['evade/##overlay']);
check('available overlay rows stay editable', not MOCK.gui.disabled['block/##overlay']);
check('check reading has no editable label or movable order', MOCK.gui.disabled['reading/##label']
    and MOCK.gui.paths['reading/##up'] == nil);
MOCK.clicks['hit/##overlay'] = true;
MOCK.clicks['block/##chat'], MOCK.clicks['block/##overlay'] = true, true;
MOCK.typing['block/##label'] = 'Guard';
MOCK.clicks['block/Options'] = true;
draw(1040);
check('overlay can be enabled without its chat row', settings.overlay.parts.hit and not settings.printout.parts.hit.on);
check('chat and overlay switches retain independent state', settings.printout.parts.block.on and settings.overlay.parts.block);
expect('labels edit the saved row', settings.printout.parts.block.label, 'Guard');
expect('Options passes the actual row ID to the adapter', destination, 'block');
draw(532);
expect('narrow display uses four readable columns', MOCK.gui.tables['##display_parts'], 4);
check('narrow rows offer a layout expander instead of cramped inputs', MOCK.gui.paths['block/+##layout'] == 'Button'
    and MOCK.gui.paths['block/##label'] == nil);
MOCK.clicks['block/+##layout'] = true;
draw(532);
check('expanded narrow row exposes its label and line controls', MOCK.gui.paths['block/Label'] == 'InputText'
    and MOCK.gui.paths['block/New line'] == 'Checkbox' and MOCK.gui.paths['block/##up'] == 'ArrowButton');
draw(532, 24);
expect('larger fonts retain the narrow layout', MOCK.gui.tables['##display_parts'], 4);
for id, part in pairs(settings.printout.parts) do part.on = false; settings.overlay.parts[id] = false; end
settings.printout.parts.block.on = true;
MOCK.clicks['Enabled only'] = true;
draw(532);
check('enabled-only filter hides rows selected in neither display', MOCK.gui.paths['block/##chat'] == 'Checkbox'
    and MOCK.gui.paths['parry/##chat'] == nil and MOCK.gui.paths['name/##chat'] == nil);
local before = settings.printout.order;
MOCK.clicks['block/##up'] = true;
draw(532);
expect('moving a filtered row still moves through the full order', settings.printout.order, printout.move(before, 'block', -1));
check('hidden rows remain in the saved order', settings.printout.order:find('evade', 1, true)
    and settings.printout.order:find('parry', 1, true));
settings.overlay.parts.parry = true;
draw(532);
check('overlay-only rows qualify as enabled', MOCK.gui.paths['parry/##overlay'] == 'Checkbox');
require('ui.search').query('Label');
draw(532);
check('search exposes filtered rows and their narrow layout controls', MOCK.gui.paths['hit/##chat'] == 'Checkbox'
    and MOCK.gui.paths['hit/Label'] == 'InputText');
require('ui.search').query('');
draw(532);
check('clearing search restores Enabled only', MOCK.gui.paths['hit/##chat'] == nil);
expect('display editing sends no game commands', #MOCK.commands, 0);
MOCK.frame();
return MOCK.report();
