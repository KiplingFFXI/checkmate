-- Settings navigation stays above a separately scrolling page. Search temporarily opens folded groups.
MOCK.navigation_real = true;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.command('/checkmate');
local window = require('ui.settings_window');
local nav = require('ui.navigation');
local s = MOCK.settings.current;
local function frame()
    local before = #MOCK.printed;
    MOCK.frame();
    for _, line in ipairs(MOCK.printed_since(before)) do
        if (line:find('Stopped after an error', 1, true)) then error(line); end
    end
end
nav.select('Appearance');
frame();
check('the settings parent does not scroll', bit.band(MOCK.gui.flags['checkmate##settings'], ImGuiWindowFlags_NoScrollbar) ~= 0
    and bit.band(MOCK.gui.flags['checkmate##settings'], ImGuiWindowFlags_NoScrollWithMouse) ~= 0);
check('the selected page has its own stable child', #MOCK.gui.children == 1
    and MOCK.gui.children[1].name == 'checkmate##settings/Appearance/##page');
check('search and all navigation stay outside the page path', MOCK.gui.paths['Find settings'] == 'InputText'
    and #MOCK.gui.nav_buttons == 13 and MOCK.gui.paths['Appearance/##hit_label'] == 'BeginCombo');
MOCK.clicks['Appearance/CHAT COLORS'] = true;
frame();
check('folding chat colors hides those controls while keeping style and navigation',
    MOCK.gui.paths['Appearance/##hit_label'] == nil and MOCK.gui.paths['Appearance/Font'] == 'BeginCombo'
    and #MOCK.gui.nav_buttons == 13);
MOCK.typing['Find settings'] = 'crit taken';
frame();
check('search opens the folded color section and keeps the matching active tab', nav.current() == 'Appearance'
    and MOCK.gui.paths['Appearance/##crittaken_number'] == 'BeginCombo');
local local_scroll = #MOCK.gui.scrolled > 0;
for _, name in ipairs(MOCK.gui.scrolled_windows or {}) do
    local_scroll = local_scroll and name == 'checkmate##settings/Appearance/##page';
end
check('search scrolls the page rather than moving the fixed header', local_scroll);
MOCK.clicks['Clear##search'] = true;
frame();
check('clearing search keeps Appearance and restores the folded group', nav.current() == 'Appearance'
    and MOCK.gui.paths['Appearance/##hit_label'] == nil);
nav.select('Abbreviations');
frame();
MOCK.clicks['Abbreviations/DIFFICULTY'] = true;
frame();
check('an abbreviation group folds independently', MOCK.gui.paths['Abbreviations/con_tough/##short'] == nil
    and MOCK.gui.paths['Abbreviations/aggro_aggressive/##short'] == 'InputText');
MOCK.typing['Find settings'] = 'Tough';
frame();
check('search opens a matching abbreviation group', MOCK.gui.paths['Abbreviations/con_tough/##short'] == 'InputText');
MOCK.clicks['Clear##search'] = true;
frame();
check('clearing restores the abbreviation fold and its tab', nav.current() == 'Abbreviations'
    and MOCK.gui.paths['Abbreviations/con_tough/##short'] == nil);
s.window.tabs.Effects = false;
local feature = s.effects.show;
MOCK.typing['Find settings'] = 'usual duration';
frame();
check('hidden matching tabs offer an explicit reveal', s.window.tabs.Effects == false
    and MOCK.gui.paths['Show hidden matches (1)##reveal_tabs'] == 'Button');
local saved = MOCK.saved;
MOCK.clicks['Show hidden matches (1)##reveal_tabs'] = true;
frame();
check('reveal persists the matching tab without changing its feature', s.window.tabs.Effects == true
    and s.effects.show == feature and MOCK.saved == saved + 1 and MOCK.last_save.window.tabs.Effects == true
    and nav.current() == 'Effects');
MOCK.clicks['Clear##search'] = true;
frame();
MOCK.child_clipped = true;
frame();
MOCK.child_clipped = false;
check('a clipped child still ends cleanly and leaves navigation available', #MOCK.gui.nav_buttons == 13);
nav.select('Monster');
MOCK.window_size = { 560, 760 };
frame();
expect('danger filters stack in a narrow window', MOCK.gui.tables['##danger_filters'], 1);
MOCK.window_size = { 1100, 850 };
frame();
expect('danger filters share two columns in a wide window', MOCK.gui.tables['##danger_filters'], 2);
MOCK.window_size = nil;
nav.select('Display');
MOCK.clicks['Display/name/Options'] = true;
frame();
check('name options opens Chat format and scrolls it into view', MOCK.gui.paths['Display/chat_format/Show level'] == 'Checkbox'
    and #MOCK.gui.scrolled > 0 and window.jump_chat_format == nil);
frame();
expect('the options jump is not repeated on following frames', #MOCK.gui.scrolled, 0);
expect('window actions send no game commands', #MOCK.commands, 0);
return MOCK.report();
