-- The real category buttons wrap and show only the chosen settings page.
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
expect('Display consolidates the two layout categories', #navigation.TAB_NAMES, 13);
check('names and old aliases resolve to their current category', navigation.canonical('blue-magic') == 'Blue Magic'
    and navigation.canonical('SHORT') == 'Abbreviations' and navigation.canonical('look') == 'Appearance'
    and navigation.canonical('bogus') == nil);
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
    and select(2, draw_rows()) == 13 and draw_rows() > narrow_rows);
settings.window.tabs.Profiles = false;
pages = draw(680);
check('hiding the active category selects another visible page', pages[1] == 'Display'
    and MOCK.gui.tabs.Profiles == nil and navigation.current() == 'Display');
for _, name in ipairs(navigation.TAB_NAMES) do settings.window.tabs[name] = false; end
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
check('clearing search restores all visible category buttons', #MOCK.gui.nav_buttons == 13 and pages[1] == 'Effects');
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
expect('navigation sends no game commands', #MOCK.commands, 0);
MOCK.frame();
return MOCK.report();
