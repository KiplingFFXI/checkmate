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
MOCK.player.main_job, MOCK.player.main_level = 6, 24;
MOCK.player.sub_job, MOCK.player.sub_level = 1, 12;
MOCK.player.equipment, MOCK.player.traits = {}, nil;
MOCK.command('/checkmate th 1');
MOCK.open['Display/Treasure Hunter'] = true;
check('Automatic can be selected', click('Display/Treasure Hunter/Automatic'));
MOCK.open['Display/Treasure Hunter'] = nil;
frame();
check('Automatic hides the saved manual slider', s.drops.th_mode == 'auto'
    and s.drops.th == 1 and MOCK.gui.paths['Display/TH level'] == nil);
check('Automatic shows TH 1 for THF 24', MOCK.drew('Using TH 1 (Automatic)')
    and jobs.treasure_hunter(s.drops).level == 1);
jobs.clear();
window.draw(s, addon.version);
check('an unreadable automatic value names the saved manual fallback',
    MOCK.drew('Automatic TH unavailable; using manual TH 1.') and MOCK.gui.paths['Display/TH level'] == nil);
MOCK.open['Display/Treasure Hunter'] = true;
check('Manual can be selected again', click('Display/Treasure Hunter/Manual'));
MOCK.open['Display/Treasure Hunter'] = nil;
frame();
check('Manual restores its saved value and slider', s.drops.th_mode == 'manual' and s.drops.th == 1
    and MOCK.gui.paths['Display/TH level'] == 'Slider' and not MOCK.gui.disabled['Display/TH level']);
MOCK.command('/checkmate th 2');
check('the existing TH command selects Manual', s.drops.th_mode == 'manual' and s.drops.th == 2);

for _, label in ipairs({ 'JOB SETTINGS', 'Hide BLU learning unless my main job is BLU',
    'Hide Steal when I can\'t use it', 'Treasure Hunter', 'Automatic', 'TH level' }) do
    check('job controls are searchable: ' .. label, window.search_tabs(label).Display == true);
end
nav.select('Drops');
frame();
check('Drops exposes the same mode and manual value', MOCK.gui.paths['Drops/Treasure Hunter'] == 'BeginCombo'
    and MOCK.gui.paths['Drops/##th'] == 'Slider');
s.drops.th_mode = 'auto';
frame();
check('Drops shows the automatic result without a manual slider', MOCK.gui.paths['Drops/##th'] == nil
    and MOCK.drew('Using TH 1 (Automatic)') and s.drops.th == 2);
local before = history.capture(s);
check('Display reset clears optional job rules and TH mode', history.reset_section(s, 'Display')
    and not s.job_settings.hide_blue_learning and not s.job_settings.hide_steal and s.drops.th_mode == 'manual');
expect('Display reset preserves the manual TH level', s.drops.th, 2);
check('Undo restores the job rules and TH mode', history.undo(s) and history.equal(s, before));
expect('using job settings sends no game commands', #MOCK.commands, 0);
return MOCK.report();
