-- Tests the automatic /checkparam behind hit rate and evasion. It covers when it's sent, which reply
-- lines are hidden, a reply that comes first (advcheck), a second /check while waiting, and the timeout.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.entities[1] = { Name = 'Fixture Goblin' };
MOCK.entities[5] = { Name = 'Fixture Rabbit' };
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';

-- The numbers stay on the name's line, so each /check prints one line.
s.printout.extras_own_line = false;

-- The game's /check line shows here. When a newer /check takes the reply, the older one leaves out its
-- only line, since that line holds hit. test_replace.lua has these flows with the game's line hidden.
s.printout.replace_game_line = false;

-- This file is about the /checkparam, so the aggro part stays out of its lines.
s.printout.parts.aggro.on = false;

local function sent()
    return #MOCK.commands;
end

-- With only the name, difficulty and reading on, the /check prints on the next frame and nothing is sent.
local n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
check('nothing prints inside the packet event', #MOCK.printed == n);
MOCK.frame();
check('the name prints on the next frame', MOCK.printed_since(n)[1] == '[checkmate] Fixture Goblin (Lv 39)  Even Match',
    MOCK.printed_since(n)[1]);
MOCK.wait(5);
check('no /checkparam with hit and evade off', sent() == 0);

-- Crit alone needs no /checkparam either.
s.printout.parts.crit.on = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('crit alone prints on the next frame', (MOCK.printed_since(n)[1] or ''):find('Crit: %d+%%') ~= nil);
MOCK.wait(5);
check('and sends nothing', sent() == 0);

-- With hit on, one /checkparam <me> goes a second and a half after the /check, and the readout prints
-- once its last reply line is in.
s.printout.parts.hit.on = true;
s.printout.parts.evade.on = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.4);
check('nothing sent before a second and a half', sent() == 0);
MOCK.wait(0.2);
check('one /checkparam <me> after a second and a half', sent() == 1 and MOCK.commands[1].command == '/checkparam <me>'
    and MOCK.commands[1].mode == 1, MOCK.commands[1] and MOCK.commands[1].command);
check('nothing printed while waiting', #MOCK.printed == n);

local hidden = 0;
for i, e in ipairs(MOCK.checkparam_packets(300, 250)) do
    if (MOCK.packet(e).blocked) then hidden = hidden + 1; end
    if (i < 6) then check('still waiting after reply line ' .. i, #MOCK.printed == n); end
end
check('all six reply lines hidden', hidden == 6, hidden);
MOCK.frame();
local lines = MOCK.printed_since(n);
check('prints on the frame after the last line', #lines == 1 and lines[1]:find('Hit: 95%  Evade: 73%  Crit: 8%', 1, true) ~= nil,
    lines[1]);

-- The same lines with nothing waiting are the player's own /checkparam.
check('a /checkparam you type shows', MOCK.reply(300, 250) == 0);
check('another player\'s reply shows', MOCK.reply(300, 250, 2002) == 0);
MOCK.summon('Azure');
check('a reply about your pet with nothing waiting shows', MOCK.pet_reply(150, 140) == 0);
MOCK.dismiss();

-- A reply about you that comes before checkmate sends its own request is used and still shown. advcheck
-- sends its own 0.99 s after a /check and hides the reply itself.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.0);
check('a reply that comes first shows', MOCK.reply(310, 240) == 0);
MOCK.frame();
lines = MOCK.printed_since(n);
check('and its values are used', #lines == 1 and lines[1]:find('Evade: 68%', 1, true) ~= nil, lines[1]);
MOCK.wait(5);
check('and nothing is sent', sent() == 0, sent());

-- A second /check after the send waits for the same reply. One send, six hidden lines, one printout
-- of the second monster.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.wait(1.6);
check('a second /check while waiting sends nothing more', sent() == 1, sent());
check('the reply is still hidden', MOCK.reply(300, 250) == 6);
MOCK.frame();
lines = MOCK.printed_since(n);
check('only the second /check prints', #lines == 1 and lines[1]:find('^%[checkmate%] Fixture Rabbit %(Lv 5%)') ~= nil,
    table.concat(lines, ' / '));
check('nothing left hidden after it', MOCK.reply(300, 250) == 0);

-- A second /check before the send replaces the first and still sends once.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(0.5);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.wait(1.2);
check('no send a second and a half after the first /check', sent() == 0, sent());
MOCK.wait(0.4);
check('one send a second and a half after the second', sent() == 1, sent());
check('its reply hidden', MOCK.reply(300, 250) == 6);
MOCK.frame();
lines = MOCK.printed_since(n);
check('prints the second monster once', #lines == 1 and lines[1]:find('Fixture Rabbit', 1, true) ~= nil,
    table.concat(lines, ' / '));

-- With no reply within 3 seconds, hit and evade print as unknown, never an old value.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('one /checkparam sent', sent() == 1);
MOCK.wait(2.8);
check('still waiting just under 3 seconds', #MOCK.printed == n);
MOCK.wait(0.3);
lines = MOCK.printed_since(n);
check('prints unknown after the timeout', #lines == 1
    and lines[1] == '[checkmate] Fixture Goblin (Lv 39)  Even Match  Hit: unknown  Evade: unknown  Crit: 8%', lines[1]);
check('a late reply shows and prints nothing more', MOCK.reply(300, 250) == 0 and #MOCK.printed == n + 1);

-- Only part of a reply comes back, the accuracy line and not the evasion line.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
local packets = MOCK.checkparam_packets(300, 250);
for i = 1, 3 do MOCK.packet(packets[i]); end
MOCK.wait(3.1);
lines = MOCK.printed_since(n);
check('a partial reply keeps what came', #lines == 1 and lines[1]:find('Hit: 95%  Evade: unknown', 1, true) ~= nil, lines[1]);

-- Zoning ends the wait. The /check's one line holds hit, so it prints nothing, and the reply to a
-- request from before isn't hidden.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.zone_in(900);
check('zoning drops the wait', MOCK.reply(300, 250) == 0);
MOCK.wait(5);
check('and prints nothing', #MOCK.printed == n);

-- Turning hit and evade off while one waits, a frame or more after its /check, ends the wait. The next
-- /check sends nothing, and the older one prints its line, which no longer holds hit or evade.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
s.printout.parts.hit.on = false;
s.printout.parts.evade.on = false;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(5);
lines = MOCK.printed_since(n);
local crit_only = '[checkmate] Fixture Goblin (Lv 39)  Even Match  Crit: 8%';
check('a /check with both off ends the wait and sends nothing', sent() == 0 and #lines == 2 and lines[1] == crit_only
    and lines[2] == crit_only, table.concat(lines, ' / ') .. ', ' .. sent() .. ' sent');

return MOCK.report();
