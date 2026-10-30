-- Job rules follow both jobs without touching saved rows or requesting stats.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local player = require('core.player');
local jobs = require('core.job_settings');
local parts = require('core.parts');
local target = require('core.target');
local monsters = require('core.monsters');
local function command(text) MOCK.command('/checkmate ' .. text); end
local function frame(dt)
    local before = #MOCK.printed;
    MOCK.frame(dt or 0.3);
    for _, text in ipairs(MOCK.printed_since(before)) do
        if (text:find('Stopped after an error', 1, true)) then error(text); end
    end
end
local function has_blue(result)
    for _, section in ipairs((result and result.info or {}).sections or {}) do
        if (section.id == 'blue') then return true; end
    end
    return false;
end
local raw, reads = player.job_inputs, 0;
player.job_inputs = function (...) reads = reads + 1; return raw(...); end;
for i = 1, 20 do frame(); end
expect('disabled job settings do not read inputs on idle frames', reads, 0);
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.player.main_job, MOCK.player.sub_job, MOCK.player.sub_level = 1, 0, 0;
MOCK.target_monster(1, 'Fixture Goblin');
frame();
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.steal = { 656 };
row.info = { blue = { spells = { { id = 578, name = 'Helldive', min_skill = 20 } } } };
for _, value in pairs(s.printout.parts) do value.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.job_settings.hide_blue_learning, s.job_settings.hide_steal = true, true;
s.printout.parts.blue.on, s.printout.parts.steal.on = true, true;
s.overlay.parts.blue, s.overlay.parts.steal = true, true;
command('overlay on');
frame();
local first = target.readout(s);
check('off-job learning and Steal disappear together', not has_blue(first) and first.steal == nil);
check('automatic hiding preserves both display selections', s.printout.parts.blue.on and s.printout.parts.steal.on
    and s.overlay.parts.blue and s.overlay.parts.steal);
local e = MOCK.check_packet(1, 40, 3, 174);
MOCK.fire('packet_in', e);
check('only hidden rows leave the native check line alone', not e.blocked);

MOCK.player.main_job = 16;
frame();
check('main BLU brings learning back without zoning', has_blue(target.readout(s)));
MOCK.player.main_job, MOCK.player.sub_job, MOCK.player.sub_level = 1, 6, 4;
frame();
check('THF below Steal level stays hidden', target.readout(s).steal == nil);
MOCK.player.sub_level = 5;
frame();
check('a support-level change makes Steal available', target.readout(s).steal ~= nil);
MOCK.player.sub_job, MOCK.player.sub_level = 16, 37;
s.blue.overlay.chance = true;
frame();
check('support BLU retains spell landing estimates', parts.blue_enabled(s, 'chance', 'overlay')
    and not parts.blue_enabled(s, 'lessons', 'overlay'));

local before = reads;
for i = 1, 20 do frame(0.001); end
expect('quiet frames between polls do not read job inputs', reads, before);
command('overlay off');
before = reads;
for i = 1, 20 do frame(); end
expect('chat-only filters do not poll on idle frames', reads, before);
MOCK.player.sub_job, MOCK.player.sub_level = 6, 5;
MOCK.fire('packet_in', MOCK.check_packet(1, 40, 3, 174));
check('a chat-only check reads the latest support job', jobs.state().can_steal == true);

row.drops = { { item = 656, rate = 100 } };
s.drops.th, s.drops.th_mode = 3, 'auto';
command('overlayshow drops');
command('overlay on');
frame();
expect('automatic overlay starts from current traits', target.readout(s).drops.th, 0);
MOCK.player.main_job, MOCK.player.main_level = 6, 75;
frame();
expect('changing main job refreshes automatic drop chances', target.readout(s).drops.th, 2);
MOCK.player.equipment[0] = 16480;
MOCK.player.equipment_extra = { [0] = string.rep('\0', 24) };
frame();
expect('equipping TH gear refreshes the same target', target.readout(s).drops.th, 3);
expect('automatic updates preserve manual TH', s.drops.th, 3);
MOCK.target.slot0, MOCK.target.slot1 = 0, 0;
frame();
before = reads;
for i = 1, 20 do frame(); end
expect('automatic mode does not scan equipment without a target or menu', reads, before);
MOCK.player.equipment[0] = nil;
MOCK.target_monster(1, 'Fixture Goblin');
frame();
expect('acquiring a target refreshes automatic TH immediately', target.readout(s).drops.th, 2);
expect('job rules send no game commands', #MOCK.commands, 0);
return MOCK.report();
