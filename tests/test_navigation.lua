-- Wrapped tabs and the compact selector show only the chosen settings page.
MOCK.navigation_real = true;
local navigation = require('ui.navigation');
local defaults = require('ui.defaults');
local imgui = require('imgui');
local settings = defaults.make();
require('ui.skins').fill(settings);
local tabs, all = {}, {};
for _, name in ipairs(navigation.TAB_NAMES) do
    tabs[#tabs + 1] = { name, function () end };
    all[name] = true;
end
local function draw(width, matches, changed, font)
    MOCK.frame();
    imgui.Begin('checkmate##settings', { true }, 0);
    imgui.PushFont(MOCK.ashita_font, font or 18);
    local pages = {};
    local revealed = navigation.draw(settings, tabs, matches or all, changed == true, function (tab, received)
        check('page callback receives the original settings', received == settings);
        pages[#pages + 1] = tab[1];
        imgui.Button('Page control');
    end, { width = width, searching = matches ~= nil and matches ~= all });
    imgui.PopFont();
    imgui.End();
    return pages, revealed;
end
local function button_names()
    local names = {};
    for _, entry in ipairs(MOCK.gui.nav_buttons) do names[#names + 1] = entry.name; end
    return table.concat(names, ',');
end
local function draw_rows()
    local rows, count = 0, 0;
    for _, entry in ipairs(MOCK.gui.nav_buttons) do
        if (not entry.joined) then rows = rows + 1; end
        count = count + 1;
    end
    return rows, count;
end
local function fits(rows, available, gap)
    local names = {};
    for _, row in ipairs(rows) do
        local width = 0;
        for i, entry in ipairs(row) do
            width = width + entry.width + (i > 1 and gap or 0);
            names[#names + 1] = entry.name;
        end
        if (width > available) then return false; end
    end
    return table.concat(names, ',') == table.concat(navigation.TAB_NAMES, ',');
end
expect('Display stays consolidated and Merits has its own category', #navigation.TAB_NAMES, 14);
check('names and old aliases resolve to their current category', navigation.canonical('blue-magic') == 'Blue Magic'
    and navigation.canonical('SHORT') == 'Abbreviations' and navigation.canonical('look') == 'Appearance'
    and navigation.canonical('bogus') == nil);
check('Combat is the current label and Numbers remains an alias', navigation.canonical('combat') == 'Combat'
    and navigation.canonical('NUMBERS') == 'Combat' and navigation.key('Combat') == 'Numbers'
    and navigation.key('numbers') == 'Numbers');
local legacy_combat = navigation.normalize({ Numbers = false });
check('old hidden Numbers settings keep Combat hidden with one stable key', legacy_combat.Numbers == false
    and legacy_combat.Combat == nil and not navigation.visible(legacy_combat, 'Combat'));
local renamed_combat = navigation.normalize({ Combat = false });
check('a Combat-only visibility map normalizes to the saved Numbers key', renamed_combat.Numbers == false
    and renamed_combat.Combat == nil);
check('an explicit saved Numbers value wins over an alias value', navigation.visible({ Numbers = true, Combat = false }, 'Combat'));
local old = { Printout = false, Overlay = false, Appearance = false, bogus = false };
local normalized = navigation.normalize(old);
check('normalization keeps disabled categories and protects Appearance', normalized.Display == false and normalized.Printout == nil and normalized.Overlay == nil
    and normalized.Appearance == true and normalized.Profiles == true and normalized.bogus == nil
    and old.Appearance == false and not rawequal(old, normalized));
check('legacy Printout and Overlay commands both select Display', navigation.canonical('Printout') == 'Display'
    and navigation.canonical('OVERLAY') == 'Display');
check('either visible legacy page keeps Display visible', navigation.normalize({ Printout = false }).Display
    and navigation.normalize({ Printout = false, Overlay = true }).Display
    and navigation.normalize({ Printout = true, Overlay = false }).Display);
check('explicit Display wins over both old visibility values', navigation.normalize({ Display = true,
    Printout = false, Overlay = false }).Display and not navigation.normalize({ Display = false,
    Printout = true, Overlay = true }).Display);
for _, width in ipairs({ 160, 320, 680, 1024, 1920 }) do
    for _, glyph in ipairs({ 7, 10, 14 }) do
        local rows = navigation.rows(navigation.TAB_NAMES, width, function (text) return #text * glyph; end, 14, 8);
        check(('packed buttons fit width %d with %d-pixel text'):format(width, glyph), fits(rows, width, 8));
    end
end
local tight = navigation.rows({ 'Abbreviations' }, 1, function () return 200; end, 14, 8);
check('a category wider than the window is bounded without an empty row', #tight == 1 and #tight[1] == 1
    and tight[1][1].width == 1);
expect('no matching labels produce no empty rows', #navigation.rows({}, 400, function () return 10; end), 0);
navigation.select('Printout');
local pages = draw(680);
check('only the active page draws with the stable control path', #pages == 1 and pages[1] == 'Display'
    and MOCK.gui.paths['Display/Page control'] == 'Button' and MOCK.gui.paths['Profiles/Page control'] == nil);
expect('available categories are recorded separately from the selected page', #MOCK.gui.tab_open, 1);
expect('the default selection has one underline', #MOCK.gui.draw_lines, 1);
expect('all categories remain available while the buttons wrap', button_names(), table.concat(navigation.TAB_NAMES, ','));
local narrow_rows = draw_rows();
check('680 pixels use multiple category rows', narrow_rows > 1);
MOCK.clicks['Profiles##checkmate_tab'] = true;
pages = draw(680);
check('clicking a wrapped category changes the page immediately', navigation.current() == 'Profiles'
    and #pages == 1 and pages[1] == 'Profiles' and MOCK.gui.paths['Profiles/Page control'] == 'Button');
pages = draw(1920);
check('making the window wider collapses buttons to one row and keeps selection', draw_rows() == 1
    and pages[1] == 'Profiles');
pages = draw(320, nil, false, 24);
check('narrowing at a larger font keeps selection and all categories', pages[1] == 'Profiles'
    and select(2, draw_rows()) == #navigation.TAB_NAMES and draw_rows() > narrow_rows);
settings.window.tabs.Profiles = false;
pages = draw(680);
check('hiding the active category selects another visible page', pages[1] == 'Display'
    and MOCK.gui.tabs.Profiles == nil and navigation.current() == 'Display');
for _, name in ipairs(navigation.TAB_NAMES) do settings.window.tabs[navigation.key(name)] = false; end
pages = draw(320);
check('Appearance remains available when every saved category flag is false', #pages == 1
    and pages[1] == 'Appearance' and button_names() == 'Appearance');
settings.window.tabs = navigation.normalize({});
navigation.select('Profiles');
pages = draw(320, { Effects = true }, true);
check('search moves to a matching visible category', pages[1] == 'Effects' and button_names() == 'Effects');
pages = draw(320, {}, true);
check('no matching category draws no stale page', #pages == 0 and #MOCK.gui.tab_open == 0
    and #MOCK.gui.nav_buttons == 0);
pages = draw(680, all, true);
check('clearing search restores all visible category buttons', #MOCK.gui.nav_buttons == #navigation.TAB_NAMES and pages[1] == 'Effects');
settings.window.tabs.Effects = false;
pages = draw(680, { Effects = true }, true);
check('search does not silently unhide a category', #pages == 0 and MOCK.gui.tabs.Effects == nil);
settings.window.tabs.Effects = true;
pages = draw(680, { Effects = true }, true);
check('restoring a category makes its search result reachable again', pages[1] == 'Effects');
settings.window.tabs.Effects, settings.window.tabs['Blue Magic'], settings.window.tabs.Pets = false, false, false;
MOCK.clicks['Show hidden matches (2)##reveal_tabs'] = true;
local revealed;
pages, revealed = draw(680, { Effects = true, ['Blue Magic'] = true }, true);
check('reveal makes only hidden matching tabs visible and reports a save', revealed == true
    and settings.window.tabs.Effects == true and settings.window.tabs['Blue Magic'] == true
    and settings.window.tabs.Pets == false and pages[1] == 'Blue Magic');
settings.window.tabs.Numbers = false;
MOCK.clicks['Show hidden matches (1)##reveal_tabs'] = true;
pages, revealed = draw(680, { Combat = true }, true);
check('revealing a Combat search match changes the stable visibility key', revealed == true
    and settings.window.tabs.Numbers == true and settings.window.tabs.Combat == nil and pages[1] == 'Combat');
navigation.select('Numbers');
pages = draw(680);
check('selecting the old tab name draws Combat controls', pages[1] == 'Combat'
    and MOCK.gui.paths['Combat/Page control'] == 'Button' and MOCK.gui.paths['Numbers/Page control'] == nil);

settings.window.tabs = navigation.normalize({});
settings.window.compact_navigation = true;
navigation.select('Blue Magic');
pages, revealed = draw(320);
check('compact mode replaces the wrapped buttons with one named selector', #MOCK.gui.nav_buttons == 0
    and #MOCK.gui.draw_lines == 0 and MOCK.gui.paths['##checkmate_page'] == 'BeginCombo'
    and MOCK.gui.previews['##checkmate_page'] == 'Page: Blue Magic');
check('switching navigation mode preserves the active page and control path', #pages == 1
    and pages[1] == 'Blue Magic' and MOCK.gui.paths['Blue Magic/Page control'] == 'Button' and not revealed);

MOCK.open['##checkmate_page'] = true;
pages = draw(320);
local available = 0;
for _, name in ipairs(navigation.TAB_NAMES) do
    if (MOCK.gui.paths['##checkmate_page/' .. name] == 'Selectable') then available = available + 1; end
end
expect('the compact list includes every visible page', available, #navigation.TAB_NAMES);
expect('the current entry receives native keyboard focus when the list opens', MOCK.gui.default_focus,
    '##checkmate_page/Blue Magic');
MOCK.clicks['##checkmate_page/Profiles'] = true;
pages, revealed = draw(320);
check('choosing a compact entry changes the page immediately without saving visibility', #pages == 1
    and pages[1] == 'Profiles' and navigation.current() == 'Profiles' and not revealed);
MOCK.open['##checkmate_page'] = false;

local old_width, widths = imgui.SetNextItemWidth, {};
imgui.SetNextItemWidth = function (value) widths[#widths + 1] = value; old_width(value); end;
for _, width in ipairs({ 1, 160, 320, 1024 }) do draw(width, nil, false, 28); end
imgui.SetNextItemWidth = old_width;
check('the compact selector uses only its available width at large fonts', #widths == 4
    and widths[1] == 1 and widths[2] == 160 and widths[3] == 320 and widths[4] == 1024);

settings.window.tabs.Profiles = false;
MOCK.open['##checkmate_page'] = true;
pages = draw(320);
check('compact mode omits hidden pages and replaces a hidden active page', pages[1] == 'Display'
    and MOCK.gui.paths['##checkmate_page/Profiles'] == nil);
pages = draw(320, { Effects = true }, true);
check('compact search only offers matching visible pages', pages[1] == 'Effects'
    and MOCK.gui.paths['##checkmate_page/Effects'] == 'Selectable'
    and MOCK.gui.paths['##checkmate_page/Display'] == nil);
pages = draw(320, all, true);
check('clearing compact search keeps its selected page', pages[1] == 'Effects'
    and MOCK.gui.paths['##checkmate_page/Display'] == 'Selectable');
pages = draw(320, {}, true);
check('an empty compact search draws no selector or stale page', #pages == 0
    and MOCK.gui.paths['##checkmate_page'] == nil);

settings.window.tabs['Blue Magic'], settings.window.tabs.Pets = false, false;
pages, revealed = draw(320, { ['Blue Magic'] = true }, true);
check('compact search does not silently reveal a hidden match', #pages == 0 and not revealed
    and settings.window.tabs['Blue Magic'] == false);
MOCK.clicks['Show hidden matches (1)##reveal_tabs'] = true;
pages, revealed = draw(320, { ['Blue Magic'] = true }, true);
check('compact reveal opens only hidden matches and reports the visibility edit', pages[1] == 'Blue Magic'
    and revealed and settings.window.tabs['Blue Magic'] == true and settings.window.tabs.Pets == false);
for _, name in ipairs(navigation.TAB_NAMES) do settings.window.tabs[navigation.key(name)] = false; end
pages = draw(320);
check('compact mode always keeps Appearance reachable', #pages == 1 and pages[1] == 'Appearance'
    and MOCK.gui.paths['##checkmate_page/Appearance'] == 'Selectable'
    and MOCK.gui.paths['##checkmate_page/Display'] == nil);

settings.window.tabs = navigation.normalize({});
navigation.select('Numbers');
pages = draw(320);
expect('legacy aliases also select pages in compact mode', pages[1], 'Combat');
settings.window.compact_navigation = false;
MOCK.open['##checkmate_page'] = false;
pages = draw(320);
check('switching back restores wrapped tabs and the same active page', pages[1] == 'Combat'
    and #MOCK.gui.nav_buttons == #navigation.TAB_NAMES and MOCK.gui.paths['##checkmate_page'] == nil);
expect('navigation sends no game commands', #MOCK.commands, 0);
MOCK.frame();
return MOCK.report();
