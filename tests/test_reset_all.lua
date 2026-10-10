-- Reset all is confirmed separately and only replaces the current character's settings.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
local panel = require('ui.settings_window');
local profiles = require('ui.profiles');
local history = require('ui.history');
local target = require('core.target');
local details = require('core.check_details');
local requests = require('core.checkparam');
local function current() return MOCK.settings.current; end
local base = history.copy(current());
local resets, native_reset = 0, MOCK.settings.reset;
MOCK.settings.reset = function(...)
    resets = resets + 1;
    return native_reset(...);
end;
MOCK.navigation_real = true;
require('ui.navigation').select('Display');

local function click(path)
    MOCK.clicks[path] = true;
    MOCK.frame(0);
    local used = MOCK.clicks[path] == nil;
    MOCK.clicks[path] = nil;
    return used;
end
local function arm_reset()
    MOCK.open['##reset_actions'] = true;
    local used = click('##reset_actions/Reset all settings');
    MOCK.open['##reset_actions'] = nil;
    return used;
end
local function confirmation()
    return MOCK.gui.paths['Reset all settings'] ~= nil;
end
local function open()
    panel.set_open(true);
    MOCK.frame(0);
end
local function read_file(path)
    local file = assert(io.open(path, 'rb'));
    local text = file:read('*a'); file:close(); return text;
end

local profile_path = MOCK_INSTALL_PATH .. '/config/addons/checkmate/profiles.json';
check('a shared profile exists before the reset', profiles.save(current(), 'Keep this profile'));
local profile_bytes = read_file(profile_path);
-- A second saved character's input remains separate from the current settings table.
local other = history.copy(base);
other.drops.th, other.magic.extra_accuracy = 4, 71;
other.printout.parts.hit.label, other.window.x = 'Other accuracy', 230;
local other_before = history.copy(other);

local function customize()
    local s = current();
    s.printout.parts.hit.on, s.printout.parts.hit.label = true, 'My accuracy';
    s.printout.order = 'drops hit evade crit';
    s.printout.short_words, s.short.con_tough = true, 'Hard';
    s.colors.name, s.look.font_size, s.look.skin = 73, 21, 'classic';
    s.overlay.font_size, s.overlay.wrap = 24, 240;
    s.window.x, s.window.y, s.window.width, s.window.height = 270, 160, 960, 650;
    s.window.overlay_x, s.window.overlay_y = 620, 340;
    s.window.tabs.Magic = false;
    s.magic.extra_accuracy, s.magic.known_inputs = 83, false;
    s.merits.fill_in, s.merits.crit_hit_rate, s.merits.enemy_crit_rate = false, 4, 3;
    s.job_links.WAR = 'Keep this profile';
    MOCK.command('/checkmate th 3');
    return s;
end

local customized = customize();
open();
local before = history.copy(current());
check('Reset actions are in the settings toolbar', MOCK.gui.paths['##reset_actions'] == 'BeginCombo'
    and MOCK.gui.previews['##reset_actions'] == 'Reset...');
MOCK.open['##reset_actions'] = true;
MOCK.frame(0);
check('opening Reset does not arm or execute a reset', not confirmation() and resets == 0
    and history.equal(current(), before));
check('the menu separates tab reset from all settings', MOCK.gui.paths['##reset_actions/Reset this tab'] == 'Selectable'
    and MOCK.gui.paths['##reset_actions/Reset all settings'] == 'Selectable');
MOCK.open['##reset_actions'] = nil;
check('choosing Reset all settings opens the confirmation', arm_reset() and confirmation());
expect('choosing the menu item never invokes reset', resets, 0);
check('choosing the menu item leaves every setting unchanged', history.equal(current(), before));
check('confirmation states that saved profiles and other characters stay', MOCK.drew("Your saved profiles and other characters' settings stay as they are."));
check('confirmation states that readings and Undo will be cleared', MOCK.drew('Remembered readings and Undo history will be cleared. This cannot be undone.'));
check('confirmation replaces editable settings controls', MOCK.gui.paths['Display/hit/##chat'] == nil);
check('Cancel is a separate action', click('Cancel##reset_all'));
MOCK.frame(0);
expect('Cancel does not reset', resets, 0);
check('Cancel returns to settings with the same values', not confirmation() and history.equal(current(), before));

arm_reset();
panel.set_open(false);
open();
check('closing and reopening discards confirmation', not confirmation() and resets == 0);
arm_reset();
MOCK.close_x = true;
MOCK.frame(0);
check('title-bar close closes the window without resetting', not panel.is_open() and resets == 0);
open();
check('title-bar close cannot leave a confirmation armed', not confirmation());

arm_reset();
MOCK.command('/checkmate th 2');
MOCK.frame(0);
check('another settings edit cancels confirmation', not confirmation() and resets == 0 and current().drops.th == 2);
arm_reset();
panel.place_again();
MOCK.frame(0);
check('replacing the saved window placement cancels confirmation', not confirmation() and resets == 0);

arm_reset();
MOCK.player.server_id = 2002;
MOCK.settings.switch_character(other);
MOCK.frame(0);
check('character replacement cancels the old confirmation', not confirmation() and resets == 0);
check('another character keeps its manual inputs and labels', current().drops.th == 4
    and current().magic.extra_accuracy == 71 and current().printout.parts.hit.label == 'Other accuracy');
check('switching characters never edits its saved input', history.equal(other, other_before));
expect('character switch leaves shared profiles byte-identical', read_file(profile_path), profile_bytes);
MOCK.player.server_id = 1001;
MOCK.settings.switch_character(customized);
MOCK.frame(0);

-- The owner check also protects callers that replace the table without an update callback.
arm_reset();
local drawn = panel.draw(history.copy(current()), addon.version);
check('a different settings identity cannot inherit the confirmation', not drawn.reset_all);
MOCK.frame(0);
check('identity mismatch disarms the next normal frame too', not confirmation() and resets == 0);

-- No character owner means Ashita would write shared defaults instead.
for _, missing in ipairs({ 'logged_in', 'server_id', 'name' }) do
    arm_reset();
    local previous = MOCK.settings[missing];
    if (missing == 'logged_in') then
        MOCK.settings[missing] = false;
    elseif (missing == 'server_id') then
        MOCK.settings[missing] = 0;
    else
        MOCK.settings[missing] = '';
    end
    MOCK.frame(0);
    MOCK.open['##reset_actions'] = true;
    MOCK.frame(0);
    check('missing ' .. missing .. ' disables the full UI reset',
        MOCK.gui.disabled['##reset_actions/Reset all settings'] and not confirmation());
    MOCK.open['##reset_actions'] = nil;
    arm_reset();
    MOCK.command('/checkmate reset');
    MOCK.command('/checkmate reset');
    expect('missing ' .. missing .. ' never resets shared defaults', resets, 0);
    MOCK.settings[missing] = previous;
    MOCK.frame(0);
    check('restoring ' .. missing .. ' does not restore old confirmation', not confirmation());
end

customize();
open();
check('settings edits created Undo history before reset', history.status(current()) ~= nil);
check('confirmation can open from Target details', click('Target details##toolbar') and arm_reset() and confirmation());
local owner = current();
check('confirmation executes the native reset exactly once', click('Reset all settings') and resets == 1);
check('reset replaces the current settings table', current() ~= owner);
check('every character setting matches a fresh initial load', history.equal(current(), base));
check('manual combat inputs and merits return to defaults', current().magic.extra_accuracy == 0 and current().magic.known_inputs
    and current().drops.th == 0 and current().merits.fill_in and current().merits.crit_hit_rate == 0
    and current().merits.enemy_crit_rate == 0);
check('labels and abbreviations return to defaults', current().printout.parts.hit.label == base.printout.parts.hit.label
    and current().short.con_tough == base.short.con_tough and not current().printout.short_words);
check('window and overlay geometry return to defaults', history.equal(current().window, base.window));
check('hidden tabs and job links return to defaults', current().window.tabs.Magic and next(current().job_links) == nil);
expect('shared profile bytes survive confirmation', read_file(profile_path), profile_bytes);
check('the saved shared profile is still loadable', profiles.load(history.copy(current()), 'Keep this profile'));
check('another character saved settings remain unchanged', history.equal(other, other_before));
expect('reset clears Undo history', history.status(current()), nil);
MOCK.command('/checkmate undo');
check('Undo cannot restore settings from before Reset all', history.equal(current(), base));
MOCK.frame(0);
check('confirmation is gone and the next frame cannot reset again', not confirmation() and resets == 1);

-- The real settings callback clears checked readings and pending requests.
panel.details_open = false;
MOCK.player.main_level = 39;
MOCK.player.stats[1], MOCK.player.stats[3] = 70, 65;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
local s = current();
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.printout.parts.hit.on, s.printout.parts.evade.on = true, true;
s.overlay.parts.hit, s.overlay.parts.evade = true, true;
MOCK.command('/checkmate overlay on');
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
check('a real checked chat snapshot exists before reset', details.current() and details.current().hit ~= nil);
check('a real checked overlay reading exists before reset', target.current() and target.current().hit ~= nil);
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame(0);
check('a further request is pending before reset', requests.is_active());
arm_reset();
click('Reset all settings');
expect('confirmed UI reset cancels pending parameter requests', requests.is_active(), false);
expect('confirmed UI reset clears the saved chat readout', details.current(), nil);
check('confirmed UI reset clears retained overlay readings', target.current() == nil or target.current().hit == nil);
expect('late pre-reset replies are not consumed', MOCK.reply(300, 250), 0);
local sent = #MOCK.commands;
MOCK.wait(2);
expect('a cancelled request never sends later', #MOCK.commands, sent);
expect('late replies never recreate saved chat results', details.current(), nil);
expect('runtime cleanup still leaves saved profiles untouched', read_file(profile_path), profile_bytes);

-- The original command still requires two calls within its ten-second window.
panel.set_open(false);
current().drops.th = 4;
local count = resets;
MOCK.command('/checkmate reset');
check('command first use only asks for confirmation', resets == count and current().drops.th == 4);
MOCK.now = MOCK.now + 10.1;
MOCK.command('/checkmate reset');
check('an expired command confirmation only asks again', resets == count and current().drops.th == 4);
MOCK.command('/checkmate reset');
check('a second command within ten seconds resets', resets == count + 1 and current().drops.th == 0);
expect('command reset also preserves the profile file', read_file(profile_path), profile_bytes);
check('all resets leave the other character input intact', history.equal(other, other_before));
return MOCK.report();
