-- Exercise the real save boundary and toolbar instead of calling only the backend helpers.
local defaults = require('ui.defaults');
local history = require('ui.history');
local start = defaults.make();
start.look.font_size, start.window.x, start.window.overlay_x = 22, 301, 411;
start.printout.parts.hit.label, start.short.hit = 'My hit', 'Land';
start.drops.th, start.magic.extra_accuracy, start.magic.known_inputs = 3, 37, false;
start.window.tabs.Magic = false;
MOCK.settings_file = start;
MOCK.navigation_real = true;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local profiles = require('ui.profiles');
local window = require('ui.settings_window');
local navigation = require('ui.navigation');
local physical = require('core.physical');
local function s() return MOCK.settings.current; end
local initial = history.capture(s());
check('load starts without an undo entry', history.status(s()) == nil);
MOCK.command('/checkmate preset Melee');
check('preset command applies and records the layout', s().printout.parts.hit.on and s().overlay.parts.pdif
    and history.status(s()) == 'Apply Melee' and profiles.status(s()).kind == 'preset' and not profiles.status(s()).modified);
check('the command preserves personal inputs and formatting', s().drops.th == 3 and s().magic.extra_accuracy == 37
    and not s().magic.known_inputs and s().look.font_size == 22 and s().printout.parts.hit.label == 'My hit'
    and s().short.hit == 'Land' and not s().window.tabs.Magic);
MOCK.command('/checkmate undo');
check('command undo restores the exact prior settings', history.equal(s(), initial) and history.status(s()) == nil);
MOCK.command('/checkmate preset Blue Mage');
check('a multiword preset command keeps learning separate', s().blue.only_unlearned and s().blue.requirements
    and s().blue.overlay.lessons and not s().blue.overlay.chance and profiles.status(s()).name == 'blue_mage');
local undo_name = history.status(s());
MOCK.command('/checkmate preset Made Up');
check('an unknown preset does not displace undo', history.status(s()) == undo_name and profiles.status(s()).name == 'blue_mage');
MOCK.command('/checkmate profile save Lessons');
check('saving the same settings names their baseline without replacing undo', profiles.status(s()).kind == 'profile'
    and profiles.status(s()).name == 'Lessons' and not profiles.status(s()).modified and history.status(s()) == undo_name);
MOCK.command('/checkmate hide blue');
check('a later command marks a saved profile modified', profiles.status(s()).modified and not s().printout.parts.blue.on);
MOCK.command('/checkmate profile load Lessons');
check('profile load restores its baseline', s().printout.parts.blue.on and not profiles.status(s()).modified);
MOCK.command('/checkmate undo');
check('profile load itself is undoable', not s().printout.parts.blue.on and profiles.status(s()).modified);
MOCK.command('/checkmate preset Tank');
undo_name = history.status(s());
MOCK.fire('packet_in', MOCK.merit_packet({ { physical.MERITS.crit_hit_rate.id, 4 } }));
check('automatic merit fill updates the value without displacing the user edit', s().merits.crit_hit_rate == 4
    and history.status(s()) == undo_name);
MOCK.command('/checkmate undo');
check('undoing an unrelated preset keeps freshly received merits', s().merits.crit_hit_rate == 4
    and profiles.status(s()).name == 'Lessons');
MOCK.command('/checkmate preset Thief');
MOCK.command('/checkmate resetsection Drops');
check('section reset is scoped and recorded', not s().printout.parts.drops.on and s().printout.parts.rewards.on
    and s().drops.th == 3 and history.status(s()) == 'Reset Drops');
MOCK.command('/checkmate undo');
check('section reset undo restores the display choices', s().printout.parts.drops.on and s().printout.parts.steal.on);
MOCK.command('/checkmate preview');
check('preview command opens a preview without applying a preset', window.is_open() and window.preview_open
    and window.preview_preset == nil and profiles.status(s()).name == 'thief');
MOCK.command('/checkmate details');
check('details opens independently of a settings tab', window.is_open() and window.details_open);
window.details_open, window.preview_open = false, false;
navigation.select('Profiles');
MOCK.frame();
undo_name = history.status(s());
local before = history.capture(s());
window.preset.id = 'minimal';
MOCK.clicks['Profiles/Preview preset'] = true;
MOCK.frame();
check('preview button does not change selections or their baseline', window.preview_open and window.preview_preset == 'minimal'
    and history.equal(s(), before) and history.status(s()) == undo_name);
MOCK.clicks['Profiles/Apply preset'] = true;
MOCK.frame();
check('Apply preset uses the real save boundary', profiles.status(s()).name == 'minimal' and not profiles.status(s()).modified
    and history.status(s()) == 'Apply Minimal');
MOCK.clicks['Undo last change'] = true;
MOCK.frame();
check('toolbar undo restores the prior named selection', profiles.status(s()).name == 'thief' and s().printout.parts.drops.on);
undo_name = history.status(s());
MOCK.window_pos = { 543, 127 };
MOCK.frame();
check('moving the settings panel does not replace undo', s().window.x == 543 and history.status(s()) == undo_name);
MOCK.command('/checkmate undo');
check('undo preserves a later window position', s().window.x == 543);
MOCK.window_pos = nil;
local captures = 0; local capture = history.capture;
history.capture = function (...) captures = captures + 1; return capture(...); end;
window.set_open(false);
MOCK.wait(1);
history.capture = capture;
expect('quiet frames make no settings snapshots', captures, 0);
expect('the customization workflow sends no game requests', #MOCK.commands, 0);
MOCK.settings.switch_character(nil);
check('another character starts with no history or source marker', history.status(s()) == nil
    and profiles.status(s()).kind == '');
MOCK.command('/checkmate profile save WorkflowBaseline');
MOCK.command('/checkmate show hit');
MOCK.command('/checkmate details');
MOCK.frame();
check('the toolbar visibly identifies a modified named profile', profiles.status(s()).modified
    and MOCK.drew('Modified from WorkflowBaseline'));
local details = require('core.check_details');
local checked = { index = 901 };
local saved_result = { name = 'Saved chat monster' };
details.begin(checked);
details.save(checked, saved_result);
MOCK.command('/checkmate overlay on');
require('core.target').forget();
MOCK.target.slot0, MOCK.target.slot1 = 0, 0;
MOCK.frame();
check('a cleared overlay target does not borrow the saved chat result for details', details.current() == saved_result
    and window.current_preview == nil and not MOCK.drew('Your latest /check: Saved chat monster.')
    and MOCK.drew('No monster selected'));
MOCK.command('/checkmate preview');
window.preview_options = { display = 'chat', source = 'current' };
MOCK.frame();
check('current preview also stays empty when the overlay target is cleared', window.current_preview == nil
    and MOCK.drew('No current target readout.') and not MOCK.drew('Saved'));
MOCK.command('/checkmate overlay off');
MOCK.command('/checkmate details');
MOCK.frame();
check('overlay-off details use the latest saved manual check', window.current_preview == saved_result
    and MOCK.drew('Your latest /check: Saved chat monster.'));
MOCK.command('/checkmate preview');
MOCK.frame();
check('overlay-off current preview uses the same saved check', window.current_preview == saved_result
    and MOCK.drew('Saved') and MOCK.drew('monster') and not MOCK.drew('No current target readout.'));
expect('source selection and profile status send no game requests', #MOCK.commands, 0);
return MOCK.report();
