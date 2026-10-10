dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
local details = require('core.check_details');
local requests = require('core.checkparam');
local target = require('core.target');
local s;

local function setup()
    MOCK.player.server_id, MOCK.player.main_level = 1001, 39;
    MOCK.player.stats[1], MOCK.player.stats[3] = 70, 65;
    MOCK.player.buffs, MOCK.player.equipment, MOCK.player.tp = {}, {}, 0;
    MOCK.zone_in(900);
    MOCK.target_monster(1, 'Fixture Goblin');
    s = MOCK.settings.current;
    for _, part in pairs(s.printout.parts) do part.on = false; end
    for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
    s.overlay.on = false;
    s.printout.parts.hit.on, s.printout.parts.evade.on = true, true;
    s.printout.divider, s.printout.extras_own_line = 'spaces', false;
    MOCK.commands, MOCK.printed = {}, {};
end
local function begin()
    MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
    MOCK.wait(1.6);
end
local function finish()
    MOCK.reply(300, 250);
    MOCK.frame();
    return details.current();
end

setup(); begin();
local result = finish();
check('matching chat parameters still produce both rates', result.hit ~= nil and result.evade ~= nil);

setup(); begin(); MOCK.player.stats[3] = 66;
result = finish();
check('chat rejects stats changed during the pending reply', result.hit == nil and result.evade == nil);
check('chat explains an invalidated reply', type(result.provenance.parameter_reason) == 'string');

setup(); begin(); MOCK.reply(300, 250); MOCK.player.buffs = { 56 }; MOCK.frame();
result = details.current();
check('chat revalidates between the last reply and printing', result.hit == nil and result.evade == nil);

setup(); begin(); MOCK.player.tp = 100;
result = finish();
check('changed HP or TP retains qualified chat estimates', result.hit and result.hit.uncertain and result.evade.uncertain);

setup(); begin();
local packets = MOCK.checkparam_packets(300, 250);
for i = 1, 3 do MOCK.packet(packets[i]); end
local partial_at = MOCK.now;
MOCK.wait(3.2);
result = details.current();
check('valid partial chat reply keeps only its available rate', result.hit ~= nil and result.evade == nil);
expect('partial reply keeps its receipt time rather than its timeout', result.provenance.parameter_at, partial_at);

setup(); begin(); MOCK.wait(3.2);
result = details.current();
expect('a missing chat reply has no invented receipt time', result.provenance.parameter_at, nil);

setup(); begin();
for i = 1, 3 do MOCK.packet(packets[i]); end
MOCK.player.stats[1] = 71;
MOCK.wait(3.2);
result = details.current();
check('a partial chat reply also rejects changed inputs', result.hit == nil and result.evade == nil);

setup(); begin();
MOCK.player.buffs = { 56 };
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
result = finish();
check('replacement chat keeps the original request signature', result.hit == nil and result.evade == nil);
expect('replacement still shares one request', #MOCK.commands, 1);

setup();
s.overlay.on, s.overlay.parts.hit = true, true;
MOCK.command('/checkmate overlay on');
begin(); finish();
check('overlay has a reading before settings replacement', target.current() and target.current().hit ~= nil);
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('another request is pending before switching characters', requests.is_active());
MOCK.player.server_id = 2002;
MOCK.settings.switch_character(s:copy(true));
expect('character change cancels the previous request', requests.is_active(), false);
MOCK.commands, MOCK.printed = {}, {};
MOCK.wait(2);
expect('character change never sends the old pending request', #MOCK.commands, 0);
expect('character change drops queued old chat output', #MOCK.printed, 0);
check('character change clears the old overlay snapshot', target.current() == nil or target.current().hit == nil);

setup(); begin();
check('request is in flight before resetting settings', requests.is_active());
MOCK.settings.reset();
expect('reset cancels the in-flight request', requests.is_active(), false);
expect('late pre-reset reply is visible', MOCK.reply(300, 250), 0);

return MOCK.report();
