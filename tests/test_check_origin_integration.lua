-- A nearby mob checked by another plugin must not take over your own check.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local details = require('core.check_details');
local checkparam = require('core.checkparam');
local target = require('core.target');
local overlay = require('ui.overlay');
local function visible() return MOCK.gui.flags['##checkmate_overlay'] ~= nil; end
local function request(index, injected, kind, blocked)
    local e = MOCK.check_request(index, injected, kind);
    e.blocked = blocked == true;
    MOCK.fire('packet_out', e);
    expect('inspect packet keeps its original blocked flag', e.blocked, blocked == true);
end
local function reply(index, level)
    return MOCK.packet(MOCK.check_reply(index, level, 4, 174));
end

for id, part in pairs(s.printout.parts) do part.on = id == 'name' or id == 'hit'; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'name' or id == 'hit'; end
s.printout.replace_game_line = true;
s.overlay.on, s.overlay.only_checked, s.overlay.icons = true, true, false;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.monster(5, 'Fixture Rabbit');
overlay.changed(s);
MOCK.frame();
local printed = #MOCK.printed;
check('checked-only overlay starts hidden', not visible() and target.current() == nil);

request(1, true);
expect('a matched injected response keeps its game line', reply(1, 40).blocked, false);
expect('an unsolicited response keeps its game line', reply(1, 40).blocked, false);
request(1, nil);
expect('a request with no injected flag is not manual', reply(1, 40).blocked, false);
request(1, false, 0, true);
expect('a blocked request is not manual', reply(1, 40).blocked, false);
request(1, false, 2);
expect('a checkparam request is not a manual mob check', reply(1, 40).blocked, false);
MOCK.wait(2);
expect('unmatched and automatic responses emit no Checkmate chat', #MOCK.printed, printed);
expect('unmatched and automatic responses send no checkparam', #MOCK.commands, 0);
expect('unmatched and automatic responses leave manual details empty', details.current(), nil);
check('unmatched and automatic responses cannot reveal the checked-only overlay', not visible() and target.current() == nil);

-- Two requests for one monster can get replies in the same frame. Only the manual reply is used.
request(1, true);
request(1, false);
expect('the injected reply for the same monster is left alone', reply(1, 40).blocked, false);
expect('a player check reply still replaces the game line', reply(1, 39).blocked, true);
MOCK.frame();
check('the manual result reveals the checked-only overlay on the correct level', visible() and target.current()
    and target.current().low == 39 and target.current().provenance.checked_at ~= nil);
MOCK.wait(1.6);
check('only the manual check asks for player stats', #MOCK.commands == 1
    and MOCK.commands[1].command == '/checkparam <me>' and checkparam.is_active());

request(5, true);
expect('a background check leaves the game line alone while stats are pending', reply(5, 3).blocked, false);
check('the manual stat request is still waiting after a background check', checkparam.is_active());
expect('the manual request still owns the six parameter lines', MOCK.reply(300, 250), 6);
MOCK.frame();
local saved = details.current();
check('manual details retain the goblin and its exact reading', saved ~= nil and saved.name == 'Fixture Goblin'
    and saved.low == 39 and saved.hit and type(saved.hit.low) == 'number');
local chat = table.concat(MOCK.printed_since(printed), '\n');
check('only the manual monster appears in Checkmate chat', chat:find('Fixture Goblin', 1, true)
    and not chat:find('Fixture Rabbit', 1, true));
MOCK.target.slot0 = 5;
MOCK.wait(2);
check('a background-checked target stays hidden when selected', not visible() and target.current() == nil);
expect('selecting that target keeps the saved manual result', details.current(), saved);
expect('no extra player stat request follows the background result', #MOCK.commands, 1);

MOCK.zone_in(900);
MOCK.target.slot0 = 1;
request(1, false);
local injected_reply = MOCK.check_reply(1, 40, 4, 174);
injected_reply.injected = true;
expect('an injected reply cannot use a pending native request', MOCK.packet(injected_reply).blocked, false);
expect('the real server reply still uses that request', reply(1, 39).blocked, true);
MOCK.frame();
check('the injected reply does not change the manual reading', target.current() and target.current().low == 39);

request(5, false);
MOCK.zone_in(900);
MOCK.target.slot0 = 5;
expect('zone-in clears pending player requests for the same identity', reply(5, 3).blocked, false);
MOCK.frame();
check('the late pre-zone reply leaves the new overlay hidden', not visible() and target.current() == nil);
expect('the late pre-zone reply cannot create a new snapshot', details.current(), nil);

-- Nearby mobs can keep HeadsUp's checks coming faster than the stat request's send delay.
MOCK.target.slot0 = 1;
s.printout.extras_own_line = false;
local previous_chat, previous_commands = #MOCK.printed, #MOCK.commands;
request(1, false);
expect('the manual check still replaces its game line', reply(1, 39).blocked, true);
for index = 10, 18 do
    MOCK.wait(0.5);
    MOCK.fire('packet_out', MOCK.check_request(index, true));
    reply(index, 40);
end
check('automatic checks keep the stat request waiting during its send window', checkparam.is_active()
    and #MOCK.commands == previous_commands);
MOCK.wait(0.7);
expect('the request stops waiting five seconds after the manual check', checkparam.is_active(), false);
local timed_out = details.current();
check('manual details finish with unavailable stats while automatic checks are still recent', timed_out ~= nil
    and timed_out.name == 'Fixture Goblin' and timed_out.provenance.parameter_state == 'unavailable');
chat = table.concat(MOCK.printed_since(previous_chat), '\n');
check('the manual line prints even without a stat reply', chat:find('Fixture Goblin', 1, true)
    and chat:find('Hit: unknown', 1, true));
MOCK.wait(2);
expect('a timed-out request is not sent after background checks stop', #MOCK.commands, previous_commands);

-- A stalled frame can see the send delay and deadline both elapsed. A younger request can still go out.
checkparam.reset();
local now, older, younger = os.clock(), {}, {};
checkparam.ask('me', older, MOCK.player.server_id);
MOCK.now = now + 1;
checkparam.ask('pet', younger, MOCK.pet_id(0x700));
expect('an expired player request does not block a younger pet request', checkparam.ready(now + 5), 'pet');
local expired, kind = checkparam.timed_out(now + 5);
check('the expired request finishes through the normal timeout path', expired == older and kind == 'me');
expect('the younger request can still be sent', checkparam.ready(now + 5), 'pet');
expect('a request cannot be sent at its own deadline', checkparam.ready(now + 6), nil);
checkparam.reset();

return MOCK.report();
