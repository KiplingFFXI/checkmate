-- Clearing the display turns off rows without resetting their other settings.
local defaults = require('ui.defaults');
local display = require('ui.display');
local history = require('ui.history');

local function cleared_copy(settings)
    local copy = history.copy(settings);
    for _, part in pairs(copy.printout.parts) do part.on = false; end
    for id in pairs(copy.overlay.parts) do copy.overlay.parts[id] = false; end
    return copy;
end

local function all_off(settings)
    for _, part in pairs(settings.printout.parts) do if (part.on ~= false) then return false; end end
    for _, on in pairs(settings.overlay.parts) do if (on ~= false) then return false; end end
    return true;
end

-- The helper uses the stored rows, not the current order or visible controls.
local isolated = defaults.make();
for _, part in pairs(isolated.printout.parts) do part.on = true; end
for id in pairs(isolated.overlay.parts) do isolated.overlay.parts[id] = true; end
isolated.printout.order = 'hit';
isolated.printout.parts.future = { on = true, label = 'A later row', new_line = true };
isolated.overlay.parts.future = true;
isolated.overlay.on, isolated.overlay.wrap = true, 275;
isolated.magic.extra_accuracy, isolated.merits.fill_in = 51, false;
local expected = cleared_copy(isolated);
check('helper reports changed row selections', display.clear(isolated));
check('helper clears every stored chat and overlay row', all_off(isolated));
check('helper clears fixed name and reading rows', not isolated.printout.parts.name.on
    and not isolated.printout.parts.reading.on and not isolated.overlay.parts.name and not isolated.overlay.parts.reading);
check('helper also clears omitted and future rows', not isolated.printout.parts.future.on and not isolated.overlay.parts.future);
check('helper preserves every non-selection setting', history.equal(isolated, expected));
expect('clearing an empty selection is a no-op', display.clear(isolated), false);

-- Run the real window, save adapter and Undo history with the Ashita mock.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
local panel = require('ui.settings_window');
local profiles = require('ui.profiles');
local function current() return MOCK.settings.current; end
local function click(path)
    MOCK.clicks[path] = true;
    MOCK.frame(0);
    local used = MOCK.clicks[path] == nil;
    MOCK.clicks[path] = nil;
    return used;
end
local function read_file(path)
    local file = assert(io.open(path, 'rb'));
    local text = file:read('*a'); file:close(); return text;
end

local s = current();
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
for _, id in ipairs({ 'name', 'reading', 'hit', 'blue', 'effects', 'rewards' }) do s.printout.parts[id].on = true; end
for _, id in ipairs({ 'name', 'reading', 'offhand', 'rangedpdif', 'pet', 'dangers' }) do s.overlay.parts[id] = true; end
s.printout.parts.hit.label, s.printout.parts.hit.new_line = 'My hit rate', true;
s.printout.short_words, s.short.con_tough = true, 'Hard';
s.overlay.on, s.overlay.wrap, s.overlay.font_size = true, 275, 21;
s.window.tabs.Monster, s.window.tabs.Effects = false, false;
s.window.x, s.window.width, s.window.overlay_x = 245, 940, 510;
s.magic.extra_accuracy, s.magic.known_inputs = 63, false;
s.merits.fill_in, s.merits.crit_hit_rate = false, 3;
s.job_links.WAR = 'A saved layout';
MOCK.command('/checkmate th 3');
check('a saved profile exists before Clear all', profiles.save(s, 'Keep my rows'));
local profile_path = MOCK_INSTALL_PATH .. '/config/addons/checkmate/profiles.json';
local profile_bytes = read_file(profile_path);
MOCK.command('/checkmate th 3');
local before = history.copy(s);

MOCK.navigation_real = true;
require('ui.navigation').select('Display');
panel.set_open(true);
MOCK.frame(0);
check('Clear all is beside the Display filter', MOCK.gui.paths['Display/Clear all rows'] == 'Button'
    and MOCK.gui.paths['Display/Enabled only'] == 'Checkbox');
check('Enabled only can hide unchecked choices', click('Display/Enabled only')
    and MOCK.gui.paths['Display/block/##chat'] == nil);
local saves, sent = MOCK.saved, #MOCK.commands;
check('the real Clear all button runs', click('Display/Clear all rows'));
check('the button clears both displays, including hidden categories', all_off(current()));
check('the button leaves every other preference unchanged', history.equal(current(), cleared_copy(before)));
check('the global overlay switch stays on', current().overlay.on);
expect('Clear all makes one save', MOCK.saved, saves + 1);
expect('Clear all records a named Undo entry', history.status(current()), 'Clear all display rows');
check('clearing Enabled only makes unchecked choices visible immediately', MOCK.gui.paths['Display/block/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Display/name/##chat'] == 'Checkbox' and MOCK.gui.paths['Display/reading/##chat'] == 'Checkbox');
expect('Clear all does not queue game commands', #MOCK.commands, sent);
expect('Clear all never rewrites shared profiles', read_file(profile_path), profile_bytes);

saves = MOCK.saved;
click('Display/Enabled only');
check('an empty enabled-only view still offers Clear all', MOCK.gui.paths['Display/Clear all rows'] == 'Button'
    and MOCK.gui.paths['Display/name/##chat'] == nil);
click('Display/Clear all rows');
expect('clearing again does not save', MOCK.saved, saves);
expect('clearing again does not replace the Undo entry', history.status(current()), 'Clear all display rows');
check('a no-op clear also restores the unfiltered choices', MOCK.gui.paths['Display/name/##chat'] == 'Checkbox');
check('the actual Undo toolbar button runs', click('Undo last change'));
check('one Undo restores the exact previous settings', history.equal(current(), before));

-- Search affects what is highlighted, never the scope of Clear all.
MOCK.typing['Find settings'] = 'Clear all';
MOCK.frame(0);
check('Clear all is discoverable through settings search', MOCK.gui.paths['Display/Clear all rows'] == 'Button');
local searched_before = history.copy(current());
click('Display/Clear all rows');
check('Clear all during search still clears unrelated rows', all_off(current())
    and not current().printout.parts.rewards.on and not current().overlay.parts.dangers);
check('search does not broaden the settings mutation', history.equal(current(), cleared_copy(searched_before)));
MOCK.command('/checkmate undo');
check('command Undo restores rows cleared through the UI', history.equal(current(), searched_before));
MOCK.typing['Find settings'] = '';
MOCK.frame(0);

local command_before = history.copy(current());
MOCK.command('/checkmate clearall');
check('the command clears the same complete selection', all_off(current()));
check('the command preserves all other settings', history.equal(current(), cleared_copy(command_before)));
expect('the command shares the same Undo label', history.status(current()), 'Clear all display rows');
saves = MOCK.saved;
MOCK.command('/checkmate clearall');
expect('the repeated command does not save again', MOCK.saved, saves);
MOCK.command('/checkmate undo');
check('command Clear all can be undone in one step', history.equal(current(), command_before));
MOCK.command('/checkmate clearall');
panel.set_open(false);

local printed = #MOCK.printed;
sent = #MOCK.commands;
check('all rows off preserves the ordinary game check message', not MOCK.packet(MOCK.check_packet(1, 39, 4, 174)).blocked);
check('all rows off preserves the cannot-gauge game message', not MOCK.packet(MOCK.check_packet(1, 0, nil, 249)).blocked);
MOCK.wait(2);
expect('an empty layout sends no parameter requests', #MOCK.commands, sent);
expect('an empty layout prints no replacement lines', #MOCK.printed, printed);
check('the saved replacement preference remains unchanged', current().printout.replace_game_line == before.printout.replace_game_line);
expect('the profile file is still untouched', read_file(profile_path), profile_bytes);

-- Clear all also stops requests that have not left the queue yet.
local requests = require('core.checkparam');
local function request_rows(player_row, pet_row)
    MOCK.zone_in(900);
    display.clear(current());
    MOCK.player.main_job, MOCK.player.main_level = 14, 40;
    MOCK.target_monster(1, 'Fixture Goblin');
    if (pet_row) then MOCK.summon('Azure'); else MOCK.dismiss(); end
    if (player_row) then
        current().printout.parts[player_row].on = true;
        current().overlay.parts[player_row] = true;
    end
    current().printout.parts.pet.on, current().overlay.parts.pet = pet_row, pet_row;
    MOCK.command('/checkmate th 3');
    MOCK.frame(0);
end

for _, case in ipairs({ { name = 'player accuracy', row = 'hit' }, { name = 'player pDIF', row = 'pdif' },
    { name = 'pet', pet = true } }) do
    request_rows(case.row, case.pet == true);
    local selected = history.copy(current());
    sent = #MOCK.commands;
    MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
    check(case.name .. ' request is queued before Clear all', requests.is_active() and #MOCK.commands == sent);
    MOCK.command('/checkmate clearall');
    printed = #MOCK.printed;
    MOCK.wait(2);
    expect(case.name .. ' queued request sends nothing after Clear all', #MOCK.commands, sent);
    expect(case.name .. ' queued check prints no rows after Clear all', #MOCK.printed, printed);
    expect(case.name .. ' queued request is cancelled when due', requests.is_active(), false);
    check(case.name .. ' cancellation preserves other preferences', history.equal(current(), cleared_copy(selected)));
    MOCK.command('/checkmate undo');
    check(case.name .. ' queued clear keeps Undo working', history.equal(current(), selected));
    MOCK.wait(2);
    expect(case.name .. ' Undo does not send a cancelled request', #MOCK.commands, sent);
end

-- An already-sent reply stays hidden, without printing rows or sending a queued pet request.
for _, case in ipairs({ { name = 'player', row = 'hit', pet = true, command = '/checkparam <me>', lines = 6 },
    { name = 'pet', pet = true, command = '/checkparam <pet>', lines = 5 } }) do
    request_rows(case.row, case.pet);
    sent = #MOCK.commands;
    MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
    MOCK.wait(1.6);
    check(case.name .. ' request was sent before Clear all', #MOCK.commands == sent + 1
        and MOCK.commands[#MOCK.commands].command == case.command);
    MOCK.command('/checkmate clearall');
    printed = #MOCK.printed;
    local hidden;
    if (case.row) then hidden = MOCK.reply(300, 250); else hidden = MOCK.pet_reply(150, 140); end
    expect(case.name .. ' already-sent reply remains hidden', hidden, case.lines);
    MOCK.wait(4);
    expect(case.name .. ' completed reply prints no cleared rows', #MOCK.printed, printed);
    expect(case.name .. ' completed reply sends no further request', #MOCK.commands, sent + 1);
    expect(case.name .. ' completed request leaves no queue', requests.is_active(), false);
end
return MOCK.report();
