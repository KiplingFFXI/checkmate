-- Job options keep row choices and manual TH intact.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local window = require('ui.settings_window');
local nav = require('ui.navigation');
local history = require('ui.history');
local jobs = require('core.job_settings');
local s = MOCK.settings.current;
MOCK.navigation_real = true;
local function frame()
    local before = #MOCK.printed;
    MOCK.frame(0.3);
    for _, text in ipairs(MOCK.printed_since(before)) do
        if (text:find('Stopped after an error', 1, true)) then error(text); end
    end
end
local function click(path)
    MOCK.clicks[path] = true;
    frame();
    local used = MOCK.clicks[path] == nil;
    MOCK.clicks[path] = nil;
    return used;
end

check('job filters start off and TH stays manual', not s.job_settings.hide_blue_learning
    and not s.job_settings.hide_steal and s.drops.th_mode == 'manual');
MOCK.command('/checkmate');
nav.select('Display');
window.select_display('Rows');
frame();
check('job settings start folded', MOCK.gui.paths['Display/JOB SETTINGS'] == 'CollapsingHeader'
    and MOCK.gui.paths['Display/Hide Steal when I can\'t use it'] == nil);
check('job settings open', click('Display/JOB SETTINGS'));
frame();
check('both job rules are available', MOCK.gui.paths['Display/Hide BLU learning unless my main job is BLU'] == 'Checkbox'
    and MOCK.gui.paths['Display/Hide Steal when I can\'t use it'] == 'Checkbox');
check('the BLU job rule saves', click('Display/Hide BLU learning unless my main job is BLU')
    and MOCK.last_save.job_settings.hide_blue_learning);
check('the Steal job rule saves', click('Display/Hide Steal when I can\'t use it')
    and MOCK.last_save.job_settings.hide_steal);
MOCK.command('/checkmate th 3');
MOCK.open['Display/Treasure Hunter'] = true;
check('Automatic can be selected', click('Display/Treasure Hunter/Automatic'));
MOCK.open['Display/Treasure Hunter'] = nil;
frame();
check('Automatic disables the manual slider without erasing it', s.drops.th_mode == 'auto'
    and s.drops.th == 3 and MOCK.gui.disabled['Display/TH level']);
jobs.clear();
window.draw(s, addon.version);
check('an unreadable automatic value explains the manual fallback', MOCK.drew('Automatic TH unavailable; using manual TH 3.'));
MOCK.command('/checkmate th 2');
check('the existing TH command selects Manual', s.drops.th_mode == 'manual' and s.drops.th == 2);
frame();
check('Manual enables the slider again', not MOCK.gui.disabled['Display/TH level']);

for _, label in ipairs({ 'JOB SETTINGS', 'Hide BLU learning unless my main job is BLU',
    'Hide Steal when I can\'t use it', 'Treasure Hunter', 'Automatic', 'TH level' }) do
    check('job controls are searchable: ' .. label, window.search_tabs(label).Display == true);
end
nav.select('Drops');
frame();
check('Drops exposes the same mode and manual value', MOCK.gui.paths['Drops/Treasure Hunter'] == 'BeginCombo'
    and MOCK.gui.paths['Drops/##th'] == 'Slider');
s.drops.th_mode = 'auto';
local before = history.capture(s);
check('Display reset clears optional job rules and TH mode', history.reset_section(s, 'Display')
    and not s.job_settings.hide_blue_learning and not s.job_settings.hide_steal and s.drops.th_mode == 'manual');
expect('Display reset preserves the manual TH level', s.drops.th, 2);
check('Undo restores the job rules and TH mode', history.undo(s) and history.equal(s, before));
expect('using job settings sends no game commands', #MOCK.commands, 0);
return MOCK.report();
