-- The compact menus keep settings, navigation and row selections separate.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local panel = require('ui.settings_window');
local nav = require('ui.navigation');
local history = require('ui.history');
local imgui = require('imgui');
MOCK.navigation_real = true;
local function current() return MOCK.settings.current; end
local function frame()
    local before = #MOCK.printed;
    local ok, err = pcall(MOCK.frame, 0);
    for _, text in ipairs(MOCK.printed_since(before)) do
        if (text:find('Stopped after an error', 1, true)) then error(text); end
    end
    if (not ok) then error(err); end
end
local function click(path)
    MOCK.clicks[path] = true;
    frame();
    local used = MOCK.clicks[path] == nil;
    MOCK.clicks[path] = nil;
    frame();
    return used;
end
local function pick(mode)
    local path = 'Display/overlay_options/Show overlay';
    MOCK.open[path] = true;
    click(path .. '/' .. mode);
    MOCK.open[path] = nil;
end

MOCK.command('/checkmate');
nav.select('Display');
panel.select_display('Rows');
frame();
local before = history.copy(current());
check('Display starts with rows only', MOCK.gui.paths['Display/Clear all rows'] == 'Button'
    and MOCK.gui.paths['Display/chat_format/Show level'] == nil
    and MOCK.gui.paths['Display/overlay_options/Show overlay'] == nil);
check('Chat format opens directly', click('Display/display_pages/Chat format'));
check('Chat format has no row matrix', MOCK.gui.paths['Display/chat_format/Show level'] == 'Checkbox'
    and MOCK.gui.paths['Display/Clear all rows'] == nil);
check('Overlay options opens directly', click('Display/display_pages/Overlay options'));
check('Overlay options has one visibility choice', MOCK.gui.paths['Display/overlay_options/Show overlay'] == 'BeginCombo'
    and MOCK.gui.paths['Display/overlay_options/Show the overlay'] == nil
    and MOCK.gui.paths['Display/overlay_options/Only show after /check'] == nil);
check('changing pages preserves settings', history.equal(current(), before));
pick('Only after checking');
check('checked mode sets the existing two keys', current().overlay.on and current().overlay.only_checked);
pick('Off');
check('Off keeps the checked-only preference', not current().overlay.on and current().overlay.only_checked);
pick('Any targeted monster');
check('Any target removes the check gate', current().overlay.on and not current().overlay.only_checked);
MOCK.command('/checkmate undo');
check('Undo restores both visibility keys', not current().overlay.on and current().overlay.only_checked);

MOCK.typing['Find settings'] = 'overlay';
frame();
check('search exposes content across Display sections', MOCK.gui.paths['Display/overlay_options/Show overlay'] ~= nil
    and MOCK.gui.paths['Display/chat_format/Show level'] ~= nil and MOCK.gui.paths['Display/Clear all rows'] ~= nil);
MOCK.typing['Find settings'] = '';
frame();
expect('clearing search keeps the selected subsection', panel.display_page, 'Overlay options');
check('clearing search restores one subsection', MOCK.gui.paths['Display/Clear all rows'] == nil);

panel.select_display('Rows');
frame();
panel.folded = panel.folded or {};
panel.folded['Combat/DEFENSE'] = false;
local get_scroll = imgui.GetScrollY;
imgui.GetScrollY = function() return 321; end;
check('Parry Options opens', click('Display/parry/Options'));
imgui.GetScrollY = get_scroll;
expect('Parry Options reaches Combat', nav.current(), 'Combat');
check('Parry Options opens Defense and reaches its row', panel.folded['Combat/DEFENSE']
    and MOCK.gui.paths['Combat/parry/##chat'] == 'Checkbox' and panel.option_target.pending == false);
check('the Options destination has a return button', MOCK.gui.paths['Combat/Back to Display'] == 'Button');
local set_scroll = imgui.SetScrollY;
local restored_count = 0;
imgui.SetScrollY = function(value)
    if (value == 321) then restored_count = restored_count + 1; end
    return set_scroll(value);
end;
check('Back to Display works', click('Combat/Back to Display'));
frame();
imgui.SetScrollY = set_scroll;
expect('Back returns to Rows', nav.current() .. '/' .. panel.display_page, 'Display/Rows');
check('Back restored the original scroll once', restored_count == 1
    and panel.return_to_display == nil and panel.restore_display_scroll == nil);

check('Name Options reaches Chat format', click('Display/name/Options') and panel.display_page == 'Chat format');
check('Name Options focuses its controls', panel.option_target and not panel.option_target.pending
    and MOCK.gui.paths['Display/chat_format/Show level'] == 'Checkbox');
check('Back within Display returns to Rows', click('Display/Back to Display') and panel.display_page == 'Rows');

nav.select('Monster');
frame();
check('Monster keeps settings and a details entry point', MOCK.gui.paths['Monster/Open target details'] == 'Button'
    and MOCK.gui.paths['Monster/Copy details'] == nil and MOCK.gui.paths['Monster/Find target details'] == nil);
check('the details entry opens the dedicated view', click('Monster/Open target details') and panel.details_open);
check('Back to settings returns from details', click('Back to settings') and not panel.details_open);

MOCK.command('/checkmate meritfill off');
MOCK.command('/checkmate critmerits 3');
nav.select('Merits');
MOCK.open['##reset_actions'] = true;
frame();
check('Merits names the exact reset scope', MOCK.gui.paths['##reset_actions/Reset autofill option'] == 'Selectable'
    and MOCK.gui.paths['##reset_actions/Reset this tab'] == nil);
check('the Merits reset action is reachable', click('##reset_actions/Reset autofill option'));
MOCK.open['##reset_actions'] = nil;
check('resetting the autofill option leaves chosen ranks intact', current().merits.fill_in == true
    and current().merits.crit_hit_rate == 3);
MOCK.command('/checkmate undo');
check('Undo restores the autofill option without replacing ranks', current().merits.fill_in == false
    and current().merits.crit_hit_rate == 3);

nav.select('Appearance');
panel.folded['Appearance/TABS'] = nil;
panel.folded['Appearance/CHAT COLORS'] = nil;
panel.folded['Appearance/CUSTOM WINDOW COLORS'] = nil;
frame();
check('Appearance keeps font controls visible', MOCK.gui.paths['Appearance/Font size'] == 'Slider');
check('Appearance starts detailed colors and tab visibility folded', not panel.folded['Appearance/TABS']
    and not panel.folded['Appearance/CHAT COLORS'] and not panel.folded['Appearance/CUSTOM WINDOW COLORS']);
check('new visibility and Blue labels remain searchable', panel.search_tabs('Only after checking').Display
    and panel.search_tabs('Show only unlearned spells')['Blue Magic']
    and panel.search_tabs('Find only unlearned spells')['Blue Magic']);
check('previous Numbers wording still finds Combat', panel.search_tabs('numbers').Combat);
local compact_before = history.copy(current());
check('Appearance can enable compact navigation', click('Appearance/Compact tab navigation'));
check('compact navigation keeps the current page visible', current().window.compact_navigation == true
    and nav.current() == 'Appearance' and MOCK.gui.paths['##checkmate_page'] == 'BeginCombo'
    and #MOCK.gui.nav_buttons == 0);
MOCK.command('/checkmate undo');
frame();
check('Undo returns to wrapped navigation without changing feature settings', history.equal(current(), compact_before)
    and nav.current() == 'Appearance' and #MOCK.gui.nav_buttons == #nav.TAB_NAMES);
nav.select('Display');
panel.select_display('Rows');
frame();
local rows_before = history.copy(current());
for id in current().printout.order:gmatch('%S+') do
    local opened = click('Display/' .. id .. '/Options');
    local target = panel.option_target;
    check(id .. ' Options reaches and focuses its controls', opened and target and not target.pending);
    check(id .. ' Options returns to Rows', click(nav.current() .. '/Back to Display')
        and nav.current() == 'Display' and panel.display_page == 'Rows');
end
check('all row Options preserve feature settings', history.equal(current(), rows_before));
expect('UI navigation never sends game commands', #MOCK.commands, 0);
return MOCK.report();
