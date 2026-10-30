-- Ashita callbacks get userdata. Reading and changing its fields must work without table operations.
local fields = { blocked = false, value = 7 };
local observed;
ashita.events.register('userdata_test', 'capture_event', function (e)
    observed = e;
    expect('the callback receives userdata', type(e), 'userdata');
    expect('userdata fields read through to the supplied table', e.value, 7);
    e.blocked = true;
end);
local event = MOCK.fire('userdata_test', fields);
expect('the dispatcher returns the same event', event, observed);
expect('callback writes reach the supplied table', fields.blocked, true);
expect('wrapping userdata keeps its identity', MOCK.event(event), event);
expect('dispatching userdata keeps its identity', MOCK.fire('userdata_test', event), event);
local empty;
ashita.events.register('userdata_empty', 'capture_empty', function (e) empty = e; end);
expect('events without fields are userdata too', type(MOCK.fire('userdata_empty')), 'userdata');
expect('the empty event reaches its callback', type(empty), 'userdata');

local packets = require('core.packets');
local merit_packet = MOCK.merit_packet({ { 226, 2 }, { 228, 0 } });
expect('packet builders return userdata before dispatch', type(merit_packet), 'userdata');
local parsed = packets.merit_counts(merit_packet);
check('the merit parser reads userdata directly', parsed ~= nil and parsed[226] == 2 and parsed[228] == 0);
local action = MOCK.action_packet(1001, 3, 1, 1002, { { message = 1, param = 10 } });
expect('action builders keep their raw packet bytes', packets.action_category(action), 3);

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.zone_in(900);
MOCK.frame();
local merits = require('core.merits');
local data = require('data.merits');
local settings = MOCK.settings.current;
check('the real merit packet handler is registered', MOCK.events.packet_in.checkmate_packet_in ~= nil);
expect('merit autofill starts enabled', settings.merits.fill_in, true);

local entries, wanted = {}, {};
for key, entry in pairs(data.entries) do
    local rank = key == 'parrying_skill' and 0 or entry.most;
    wanted[key] = rank;
    entries[#entries + 1] = { entry.id, rank };
end
local saves = MOCK.saved;
event = MOCK.merit_packet(entries);
expect('the real handler receives the original userdata', MOCK.packet(event), event);
local read, filled = 0, 0;
for key, rank in pairs(wanted) do
    if (merits.observed(key) == rank) then read = read + 1; end
    if (settings.merits[key] == rank) then filled = filled + 1; end
end
expect('the real handler observes all supported merit ranks', read, #entries);
expect('the real handler autofills all supported merit ranks', filled, #entries);
expect('all categories save together once', MOCK.saved, saves + 1);
expect('a known zero is kept as an observation', merits.observed('parrying_skill'), 0);

saves = MOCK.saved;
local revision = merits.version();
MOCK.packet(event);
expect('duplicate userdata packets do not save again', MOCK.saved, saves);
expect('duplicate userdata packets do not invalidate estimates', merits.version(), revision);
MOCK.packet(MOCK.merit_packet({ { 226, 1 } }));
expect('a partial packet updates its one observed rank', merits.observed('shield_skill'), 1);
expect('a partial packet fills its one saved rank', settings.merits.shield_skill, 1);
expect('a partial packet retains other categories', merits.observed('blue_magic_skill'), wanted.blue_magic_skill);

settings.merits.fill_in, settings.merits.shield_skill = false, 4;
merits.changed();
saves = MOCK.saved;
MOCK.packet(MOCK.merit_packet({ { 226, 2 } }));
expect('manual mode still reads userdata merit ranks', merits.observed('shield_skill'), 2);
expect('manual mode keeps the selected rank', settings.merits.shield_skill, 4);
expect('manual observations do not save settings', MOCK.saved, saves);
expect('manual skill estimates use the observed contribution', merits.adjust_skill(30, 204, 75, 1), 208);

settings.merits.fill_in = true;
merits.changed();
local truncated = MOCK.merit_packet({ { 226, 3 }, { 228, 4 } });
truncated.data = truncated.data:sub(1, -2);
revision, saves = merits.version(), MOCK.saved;
MOCK.packet(truncated);
expect('a truncated userdata packet cannot change an observed rank', merits.observed('shield_skill'), 2);
expect('a truncated userdata packet cannot change a selected rank', settings.merits.shield_skill, 4);
expect('a truncated userdata packet cannot save settings', MOCK.saved, saves);
expect('a truncated userdata packet cannot invalidate estimates', merits.version(), revision);

local command = MOCK.command('/checkmate');
expect('command callbacks receive userdata', type(command), 'userdata');
expect('the command handler can block its userdata event', command.blocked, true);
expect('outgoing callbacks receive userdata', type(MOCK.send_out(packets.CHECK_OUT)), 'userdata');
MOCK.fire('unload');
return MOCK.report();
