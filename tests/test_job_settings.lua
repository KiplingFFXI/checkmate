-- Job filters never replace saved rows or the manual TH value.
local jobs = require('core.job_settings');
local parts = require('core.parts');
local drops = require('core.drops');
local defaults = require('ui.defaults');
local player = require('core.player');
local s = defaults.make();
s.job_settings = T{ hide_blue_learning = true, hide_steal = true };
s.printout.parts.blue.on, s.printout.parts.steal.on = true, true;
s.overlay.parts.blue, s.overlay.parts.steal = true, true;
local function set(main, level, sub, sub_level)
    MOCK.player.main_job, MOCK.player.main_level = main, level;
    MOCK.player.sub_job, MOCK.player.sub_level = sub or 0, sub_level or 0;
    MOCK.player.equipment, MOCK.player.traits = {}, nil;
    MOCK.player.equipment_extra = setmetatable({}, { __index = function() return string.rep('\0', 24); end });
    MOCK.player.ability_data = true;
    jobs.refresh(true);
end
set(1, 75, 13, 37);
for _, display in ipairs({ 'chat', 'overlay' }) do
    check('WAR/NIN hides BLU learning in ' .. display, not parts.blue_enabled(s, 'lessons', display));
    check('a hidden learning-only BLU row is not selected in ' .. display, not parts.enabled(s, 'blue', display));
    check('WAR/NIN hides Steal in ' .. display, not parts.enabled(s, 'steal', display));
end
check('filters preserve selected rows', s.printout.parts.blue.on and s.overlay.parts.blue
    and s.printout.parts.steal.on and s.overlay.parts.steal);
s.blue.chat.chance, s.blue.overlay.chance = true, true;
set(1, 75, 16, 37);
for _, display in ipairs({ 'chat', 'overlay' }) do
    check('support BLU retains landing estimates in ' .. display, parts.blue_enabled(s, 'chance', display)
        and parts.enabled(s, 'blue', display) and not parts.blue_enabled(s, 'lessons', display));
end
set(16, 75, 13, 37);
check('main BLU restores learning', parts.blue_enabled(s, 'lessons', 'chat') and parts.blue_enabled(s, 'lessons', 'overlay'));
set(1, 75, 6, 4);
check('THF 4 cannot show Steal', not parts.enabled(s, 'steal', 'chat'));
set(1, 75, 6, 5);
check('support THF 5 restores Steal', parts.enabled(s, 'steal', 'chat') and parts.enabled(s, 'steal', 'overlay'));
set(6, 4, 1, 2);
check('main THF 4 cannot show Steal', not parts.enabled(s, 'steal', 'chat'));
set(6, 5, 1, 2);
check('main THF 5 restores Steal', parts.enabled(s, 'steal', 'chat'));
s.drops.th, s.drops.th_mode = 3, 'manual';
expect('manual TH remains selected', jobs.treasure_hunter(s.drops).level, 3);
s.drops.th_mode = 'auto';
expect('THF 5 has no TH trait yet', jobs.treasure_hunter(s.drops).level, 0);
set(6, 15, 1, 7);
expect('THF 15 has TH 1', jobs.treasure_hunter(s.drops).level, 1);
set(6, 45, 1, 22);
expect('THF 45 has TH 2', jobs.treasure_hunter(s.drops).level, 2);
set(1, 75, 6, 15);
expect('support THF 15 contributes TH 1', jobs.treasure_hunter(s.drops).level, 1);
set(6, 75, 13, 37);
MOCK.player.equipment = { [0] = 16480, [6] = 15107 };
jobs.refresh(true);
expect('knife and armlets raise TH 2 to TH 4', jobs.treasure_hunter(s.drops).level, 4);
expect('automatic mode never overwrites manual TH', s.drops.th, 3);
MOCK.player.main_level = 69;
jobs.refresh(true);
expect('level restriction removes both gear bonuses', jobs.treasure_hunter(s.drops).level, 2);
MOCK.player.main_level = 70;
jobs.refresh(true);
expect('knife returns at its required level', jobs.treasure_hunter(s.drops).level, 3);
MOCK.player.main_level = 75;
MOCK.player.equipment[6] = 14914;
jobs.refresh(true);
expect('upgraded armlets count once', jobs.treasure_hunter(s.drops).level, 4);
check('unchanged inputs do not report another change', not jobs.refresh(true));
MOCK.player.ability_data = false;
check('trait data loss invalidates the snapshot', jobs.refresh(true));
local result = jobs.treasure_hunter(s.drops);
check('unavailable automatic TH uses explicit manual fallback', result.level == 3 and not result.known
    and result.fallback and result.note:find('Automatic TH unavailable; using manual TH 3', 1, true));
check('unavailable TH does not hide readable job filters', parts.enabled(s, 'steal', 'chat'));
MOCK.player.ability_data = true;
MOCK.player.equipment_extra[0] = string.char(2, 0) .. string.rep('\0', 22);
jobs.refresh(true);
check('unsupported augments require manual TH', jobs.treasure_hunter(s.drops).fallback);
MOCK.player.equipment_extra[0] = '';
jobs.refresh(true);
check('missing augment data requires manual TH', jobs.treasure_hunter(s.drops).fallback);
MOCK.player.equipment_extra[0] = nil;
MOCK.player.main_job = 0;
jobs.refresh(true);
check('unreadable jobs keep optional rows visible', parts.enabled(s, 'steal', 'chat')
    and parts.blue_enabled(s, 'lessons', 'chat'));
check('unreadable jobs never claim automatic TH 0', jobs.treasure_hunter(s.drops).fallback);
jobs.clear();
check('character clear removes the previous snapshot', jobs.state() == nil and jobs.treasure_hunter(s.drops).fallback);
set(1, 75, 13, 37);
local read = player.job_inputs;
local reads = 0;
player.job_inputs = function(...) reads = reads + 1; return read(...); end;
for i = 1, 100 do
    parts.enabled(s, 'steal', 'overlay');
    parts.blue_enabled(s, 'lessons', 'chat');
    jobs.treasure_hunter(s.drops);
end
expect('reading rows and cached TH never reads player memory', reads, 0);
jobs.refresh(false, 20);
local before = reads;
for i = 1, 100 do jobs.poll(false, 20.1); end
expect('quiet job polling never reads memory', reads, before);
check('switching to Auto refreshes before the next deadline', jobs.poll(true, 20.1));
expect('switching to Auto reads only once', reads, before + 1);
jobs.poll(true, 20.2);
expect('the shared throttle prevents a duplicate menu and overlay read', reads, before + 1);
for i = 1, 100 do jobs.poll(i % 2 == 0, 20.2); end
expect('a TH snapshot also satisfies alternating job-only polls', reads, before + 1);
jobs.poll(true, 20.36);
expect('the next due poll reads once', reads, before + 2);
player.job_inputs = read;
local table_result = drops.readout({ drops = { { rate = 100, item = 1 } } }, s.drops);
check('drop readout records the effective TH source', table_result.th == 0 and table_result.th_mode == 'auto'
    and table_result.th_known and not table_result.th_fallback);
s.job_settings.hide_blue_learning, s.job_settings.hide_steal = false, false;
check('turning filters off restores ordinary row choices', parts.enabled(s, 'steal', 'chat')
    and parts.blue_enabled(s, 'lessons', 'chat'));
return MOCK.report();
