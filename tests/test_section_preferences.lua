-- Manual section choices belong to one character; search and Options remain temporary.
MOCK.navigation_real = true;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local panel = require('ui.settings_window');
local navigation = require('ui.navigation');
local defaults = require('ui.defaults');
local history = require('ui.history');
local profiles = require('ui.profiles');
local s = MOCK.settings.current;
local drawn, original_draw = {}, panel.draw;
panel.draw = function(...)
    local result = original_draw(...);
    drawn = { preferences = result.preferences, save = result.save, edited = result.edited };
    return result;
end;
local function frame()
    local printed = #MOCK.printed;
    local ok, failure = pcall(MOCK.frame, 0);
    for _, line in ipairs(MOCK.printed_since(printed)) do
        if (line:find('Stopped after an error', 1, true)) then error(line); end
    end
    if (not ok) then error(failure); end
end
local function click(path)
    MOCK.clicks[path] = true;
    frame();
    check('the requested control was drawn: ' .. path, MOCK.clicks[path] == nil);
end
local fresh = defaults.make();
check('defaults use a separate empty section map for each character', next(s.window.sections) == nil
    and next(fresh.window.sections) == nil and fresh.window.sections ~= s.window.sections);
expect('compact navigation is optional', fresh.window.compact_navigation, false);
panel.set_open(true);
navigation.select('Appearance');
frame();
check('default folds stay transient', next(s.window.sections) == nil
    and panel.folded['Appearance/CHAT COLORS'] == false and not drawn.preferences);
local saved = MOCK.saved;
local player, overlay = require('core.player'), require('ui.overlay');
local read, equipped, changed = player.read, player.equipped_items, overlay.changed;
local reads, gear_reads, invalidations = 0, 0, 0;
player.read = function(...) reads = reads + 1; return read(...); end;
player.equipped_items = function(...) gear_reads = gear_reads + 1; return equipped(...); end;
overlay.changed = function(...) invalidations = invalidations + 1; return changed(...); end;
click('Appearance/CHAT COLORS');
check('opening a section stores its explicit choice and only requests a preference save',
    s.window.sections['Appearance/CHAT COLORS'] == true and drawn.preferences
    and not drawn.save and not drawn.edited);
check('the main loop saves a manual section choice once', MOCK.saved == saved + 1
    and MOCK.last_save.window.sections['Appearance/CHAT COLORS'] == true);
expect('opening a section does not use an Undo slot', history.status(s), nil);
saved = MOCK.saved;
frame(); frame();
check('quiet frames do not save sections again', MOCK.saved == saved and not drawn.preferences);
check('fold changes and quiet frames do not reread inputs or invalidate estimates',
    reads == 0 and gear_reads == 0 and invalidations == 0);
player.read, player.equipped_items, overlay.changed = read, equipped, changed;
click('Appearance/CHAT COLORS');
expect('closing is saved explicitly', s.window.sections['Appearance/CHAT COLORS'], false);
saved = MOCK.saved;
MOCK.typing['Find settings'] = 'crit taken';
frame();
check('search opens controls without changing the stored fold', MOCK.gui.paths['Appearance/##crittaken_number'] == 'BeginCombo'
    and s.window.sections['Appearance/CHAT COLORS'] == false and not drawn.preferences);
click('Appearance/CHAT COLORS');
check('a temporary search fold does not become a saved preference', s.window.sections['Appearance/CHAT COLORS'] == false
    and not drawn.preferences and MOCK.saved == saved);
click('Clear##search');
check('clearing search restores the manual choice', MOCK.gui.paths['Appearance/##hit_label'] == nil
    and panel.folded['Appearance/CHAT COLORS'] == false);
click('Appearance/CHAT COLORS');
panel.set_open(false);
frame();
panel.set_open(true);
frame();
check('reopening the panel retains the manual fold', MOCK.gui.paths['Appearance/##hit_label'] == 'BeginCombo');
MOCK.command('/checkmate th 2');
MOCK.command('/checkmate undo');
check('Undo of a later input edit does not undo a section choice', s.drops.th == 0
    and s.window.sections['Appearance/CHAT COLORS'] == true);

local reloaded = history.copy(s);
panel.bind_sections(reloaded);
check('a reloaded settings table restores its saved choice', panel.folded['Appearance/CHAT COLORS'] == true);
panel.bind_sections(fresh);
check('another character does not inherit the previous folds', panel.folded['Appearance/CHAT COLORS'] == nil
    and next(fresh.window.sections) == nil);
panel.bind_sections(s);
expect('switching back restores the original character', panel.folded['Appearance/CHAT COLORS'], true);
local invalid = defaults.make();
invalid.window.sections['Combat/ADVANCED'] = 'open';
panel.bind_sections(invalid);
expect('nonboolean saved entries are ignored', panel.folded['Combat/ADVANCED'], nil);
panel.bind_sections(s);

s.window.sections['Combat/DEFENSE'] = false;
panel.changed();
frame();
panel.folded['Combat/DEFENSE'] = true;
navigation.select('Combat');
frame();
check('an Options-style temporary opening does not overwrite the saved fold', panel.folded['Combat/DEFENSE'] == true
    and s.window.sections['Combat/DEFENSE'] == false and not drawn.preferences);
panel.changed(); frame();
expect('an unrelated settings change preserves a temporary Options opening', panel.folded['Combat/DEFENSE'], true);
s.window.sections['Combat/DEFENSE'] = nil;
panel.changed(); frame();
check('removing a saved preference restores the section default', panel.folded['Combat/DEFENSE'] == true
    and s.window.sections['Combat/DEFENSE'] == nil and not drawn.preferences);

s.window.compact_navigation = true;
check('a profile can be saved with personal window preferences', profiles.save(s, 'Section choices'));
local file = assert(io.open(MOCK_INSTALL_PATH .. '/config/addons/checkmate/profiles.json', 'r'));
local profile_text = file:read('*a'); file:close();
check('shared profiles contain neither section choices nor compact navigation',
    not profile_text:find('"window"', 1, true) and not profile_text:find('"compact_navigation"', 1, true));
s.window.sections['Appearance/CHAT COLORS'] = false;
local personal = history.copy(s.window);
check('loading a profile leaves personal section choices and navigation intact', profiles.load(s, 'Section choices')
    and history.equal(s.window, personal));
panel.changed(); navigation.select('Appearance'); frame();
check('external preference changes are reflected on the next draw', panel.folded['Appearance/CHAT COLORS'] == false);
local before = history.capture(s);
check('Appearance reset clears section choices and compact navigation', history.reset_section(s, 'Appearance')
    and next(s.window.sections) == nil and not s.window.compact_navigation);
require('ui.skins').fill(s);
panel.changed(); frame();
check('Appearance reset returns sections to their defaults without saving a new choice',
    panel.folded['Appearance/CHAT COLORS'] == false and next(s.window.sections) == nil and not drawn.preferences);
check('Undo restores Appearance preferences with the other Appearance settings', history.undo(s)
    and history.equal(s, before));
panel.changed(); frame();
check('restored explicit choices remain bound after Undo', panel.folded['Appearance/CHAT COLORS'] == false
    and s.window.compact_navigation);
local reset = defaults.make();
panel.bind_sections(reset);
check('a full reset starts with default sections and navigation', next(reset.window.sections) == nil
    and not reset.window.compact_navigation and next(panel.folded) == nil);
expect('section navigation sends no game commands', #MOCK.commands, 0);
return MOCK.report();
