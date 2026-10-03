-- Tests replacing the game's own /check line. It covers which lines are hidden and which never are,
-- and a line another addon hid first. It covers what prints at once, what waits for the /checkparam
-- reply, the timeout, and zoning, a layout change or a second /check during the wait. It also covers
-- a /check that gives up on the reply, the plain /check line when nothing else prints, a monster
-- that can't be gauged, and a checkmate stopped after an error.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.entities[1] = { Name = 'Fixture Goblin' };
MOCK.entities[5] = { Name = 'Fixture Rabbit' };
MOCK.entities[77] = { Name = 'Mystery Mob' };
MOCK.entities[400] = { Name = 'Fixture NM' };
local ME = MOCK.player.server_id;
local MOB = MOCK.mob_id(900, 1);
local function cur() return MOCK.settings.current; end

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
cur().printout.divider = 'spaces';

-- This file is about the game's /check line, so the aggro part stays out of its lines.
cur().printout.parts.aggro.on = false;

local CHECK_LINE  = '[checkmate] Fixture Goblin (Lv 39)  Even Match';
local HIT_LINE    = '[checkmate] Hit: 95%  Evade: 73%  Crit: 8%';
local RABBIT_LINE = '[checkmate] Fixture Rabbit (Lv 5)  Easy Prey';

check('on by default', cur().printout.replace_game_line == true);

-- Which lines are hidden -------------------------------------------------------------------------

for message = 170, 178 do
    check(('your /check reply %d is hidden'):format(message), MOCK.packet(MOCK.check_packet(1, 39, 4, message)).blocked);
end
check('your /check reply 249 is hidden', MOCK.packet(MOCK.check_packet(400, 0, nil, 249)).blocked);
MOCK.frame();

MOCK.command('/checkmate replace off');
for message = 170, 178 do
    check(('off, %d shows'):format(message), not MOCK.packet(MOCK.check_packet(1, 39, 4, message)).blocked);
end
check('off, 249 shows', not MOCK.packet(MOCK.check_packet(400, 0, nil, 249)).blocked);
MOCK.frame();
MOCK.command('/checkmate replace on');

check('another player\'s /check shows', not MOCK.packet(MOCK.message_packet(2002, MOB, 39, 68, 174, 1)).blocked);
check('another player\'s 249 shows', not MOCK.packet(MOCK.message_packet(2002, MOB, 0, 0, 249, 1)).blocked);
for _, message in ipairs({ 6, 169, 179, 248, 250 }) do
    check(('your message %d shows'):format(message), not MOCK.packet(MOCK.message_packet(ME, MOB, 39, 68, message, 1)).blocked);
end
check('a /checkparam you type shows', MOCK.reply(300, 250) == 0);
check('another player\'s /checkparam shows', MOCK.reply(300, 250, 2002) == 0);

-- A /check line another addon like checker hid first is still read, with the setting on or off.
local function hidden_first()
    local n = #MOCK.printed;
    local e = MOCK.check_packet(1, 39, 4, 174);
    e.blocked = true;
    MOCK.packet(e);
    MOCK.frame();
    return e.blocked, MOCK.printed_since(n);
end
local blocked, lines = hidden_first();
check('a line checker hid first is still read', blocked and #lines == 1 and lines[1] == CHECK_LINE, lines[1]);
MOCK.command('/checkmate replace off');
blocked, lines = hidden_first();
check('and with the setting off it stays hidden and still prints', blocked and #lines == 1 and lines[1] == CHECK_LINE, lines[1]);
MOCK.command('/checkmate replace on');

-- What prints when -------------------------------------------------------------------------------

local s = cur();
s.printout.parts.hit.on = true;
s.printout.parts.evade.on = true;
s.printout.parts.crit.on = true;

-- The default layout. The /check line prints on the next frame. The request goes a second and a half
-- after the /check, and the Hit line prints on the frame after its reply.
MOCK.commands = {};
local n = #MOCK.printed;
check('hidden with the numbers on', MOCK.packet(MOCK.check_packet(1, 39, 4, 174)).blocked);
check('nothing prints inside the packet event', #MOCK.printed == n);
MOCK.frame();
lines = MOCK.printed_since(n);
check('the /check line prints on the next frame', #lines == 1 and lines[1] == CHECK_LINE, table.concat(lines, ' / '));
MOCK.wait(1.4);
check('nothing is sent before a second and a half', #MOCK.commands == 0, #MOCK.commands);
MOCK.wait(0.2);
check('the Hit line waits for the reply', #MOCK.printed == n + 1 and #MOCK.commands == 1);
check('another player\'s /check shows while it waits', not MOCK.packet(MOCK.message_packet(2002, MOB, 39, 68, 174, 1)).blocked);
check('another player\'s /checkparam shows while it waits', MOCK.reply(300, 250, 2002) == 0);
check('the reply is hidden', MOCK.reply(300, 250) == 6);
check('nothing prints inside its packet events', #MOCK.printed == n + 1);
MOCK.frame();
lines = MOCK.printed_since(n);
check('the Hit line prints on the frame after the reply', #lines == 2 and lines[2] == HIT_LINE, table.concat(lines, ' / '));
MOCK.wait(5);
check('and nothing more', #MOCK.printed == n + 2);

-- Drops moved above hit, on a line of their own, print at once with the /check line.
MOCK.items[4104] = { Name = { 'Fire Crystal' } };
MOCK.items[4105] = { Name = { 'Ice Crystal' } };
s.printout.parts.drops.on = true;
s.printout.order = 'difficulty drops hit evade crit magic immunities';
s.printout.parts.hit.new_line = true;
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
lines = MOCK.printed_since(n);
check('every line above the first one holding hit prints at once', #lines == 2 and lines[1] == CHECK_LINE
    and lines[2] == '[checkmate] Drops (TH 0): Ice Crystal 100%, Fire Crystal 16%', table.concat(lines, ' / '));
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
lines = MOCK.printed_since(n);
check('the rest after the reply', #lines == 3 and lines[3] == HIT_LINE, table.concat(lines, ' / '));
s.printout.parts.drops.on = false;
s.printout.order = 'difficulty hit evade crit magic immunities drops';
s.printout.parts.hit.new_line = false;

-- With the extras on the /check line, that line holds hit, so the whole block waits.
MOCK.command('/checkmate extras same');
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('the /check line holding hit waits', #MOCK.printed == n);
MOCK.wait(1.6);
check('still waiting after the send', #MOCK.printed == n and #MOCK.commands == 1);
MOCK.reply(300, 250);
MOCK.frame();
lines = MOCK.printed_since(n);
check('it prints whole after the reply', #lines == 1 and lines[1] == CHECK_LINE .. '  Hit: 95%  Evade: 73%  Crit: 8%', lines[1]);
MOCK.command('/checkmate extras new');

-- With no reply within 3 seconds, the Hit line prints with hit and evade unknown.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('the /check line still prints at once', MOCK.printed_since(n)[1] == CHECK_LINE, MOCK.printed_since(n)[1]);
MOCK.wait(1.6);
MOCK.wait(2.8);
check('the Hit line waits until 3 seconds after the send', #MOCK.printed == n + 1 and #MOCK.commands == 1);
MOCK.wait(0.3);
lines = MOCK.printed_since(n);
check('then prints with hit and evade unknown', #lines == 2 and lines[2] == '[checkmate] Hit: unknown  Evade: unknown  Crit: 8%',
    lines[2]);
check('a late reply shows and prints nothing', MOCK.reply(300, 250) == 0 and #MOCK.printed == n + 2);

-- Zoning while it waits --------------------------------------------------------------------------

-- Zoning before the send drops the wait. The /check line printed already, so only the Hit line is
-- dropped.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1);
MOCK.zone_in(900);
MOCK.wait(5);
lines = MOCK.printed_since(n);
check('zoning drops the Hit line', #lines == 1 and lines[1] == CHECK_LINE and #MOCK.commands == 0, table.concat(lines, ' / '));

-- With the extras on the /check line nothing printed yet, so it prints on the next frame with hit
-- and evade unknown.
MOCK.command('/checkmate extras same');
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('it waits and sends', #MOCK.printed == n and #MOCK.commands == 1);
MOCK.zone_in(900);
check('nothing prints inside the zone event', #MOCK.printed == n);
MOCK.frame();
lines = MOCK.printed_since(n);
check('zoning prints a /check that printed nothing yet', #lines == 1
    and lines[1] == CHECK_LINE .. '  Hit: unknown  Evade: unknown  Crit: 8%', lines[1]);
check('the reply to the request from before shows', MOCK.reply(300, 250) == 0);
MOCK.wait(5);
check('and nothing more', #MOCK.printed == n + 1);
MOCK.command('/checkmate extras new');

-- A layout change while it waits ------------------------------------------------------------------

-- The rest starts from where the Hit line is after the reply. Difficulty, moved to its own line during
-- the wait, doesn't print a second time.
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
s.printout.parts.difficulty.new_line = true;
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
lines = MOCK.printed_since(n);
check('a line added while it waits prints nothing twice', #lines == 2 and lines[1] == CHECK_LINE and lines[2] == HIT_LINE,
    table.concat(lines, ' / '));
s.printout.parts.difficulty.new_line = false;

-- The extras moved onto the /check line meanwhile still print, on that line.
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
MOCK.command('/checkmate extras same');
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
lines = MOCK.printed_since(n);
check('the extras moved onto the /check line while it waits still print', #lines == 3 and lines[1] == CHECK_LINE
    and lines[3] == CHECK_LINE .. '  Hit: 95%  Evade: 73%  Crit: 8%', table.concat(lines, ' / '));
MOCK.command('/checkmate extras new');

-- A second /check while waiting ------------------------------------------------------------------

-- The newest /check takes the reply. Both /check lines print at once, and only the newest gets its
-- Hit line.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
lines = MOCK.printed_since(n);
check('both /check lines print at once', #lines == 2 and lines[1] == CHECK_LINE and lines[2] == RABBIT_LINE,
    table.concat(lines, ' / '));
MOCK.wait(1);
check('one request for both', #MOCK.commands == 1, #MOCK.commands);
check('its reply hidden', MOCK.reply(300, 250) == 6);
MOCK.frame();
lines = MOCK.printed_since(n);
check('only the newest gets its Hit line', #lines == 3 and lines[3] == '[checkmate] Hit: 95%  Evade: 80%  Crit: 20%',
    table.concat(lines, ' / '));
MOCK.wait(5);
check('nothing more, and nothing left hidden', #MOCK.printed == n + 3 and MOCK.reply(300, 250) == 0);

-- With the extras on the /check line the older /check has printed nothing. It prints when the newer
-- one comes, with hit and evade unknown, so no /check goes unanswered.
MOCK.command('/checkmate extras same');
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('the first /check waits', #MOCK.printed == n and #MOCK.commands == 1);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
lines = MOCK.printed_since(n);
check('the second /check prints the first at once', #lines == 1
    and lines[1] == CHECK_LINE .. '  Hit: unknown  Evade: unknown  Crit: 8%', lines[1]);
MOCK.wait(1);
check('the reply is still hidden', MOCK.reply(300, 250) == 6);
MOCK.frame();
lines = MOCK.printed_since(n);
check('and the second prints after it', #lines == 2 and lines[2] == RABBIT_LINE .. '  Hit: 95%  Evade: 80%  Crit: 20%', lines[2]);

-- The same before the send. Still one request, a second and a half after the second /check.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(0.5);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('before the send, the first prints when the second comes', MOCK.printed_since(n)[1]
    == CHECK_LINE .. '  Hit: unknown  Evade: unknown  Crit: 8%', MOCK.printed_since(n)[1]);
MOCK.wait(1.6);
check('one request', #MOCK.commands == 1, #MOCK.commands);
MOCK.reply(300, 250);
MOCK.frame();
lines = MOCK.printed_since(n);
check('the second after the reply', #lines == 2 and lines[2] == RABBIT_LINE .. '  Hit: 95%  Evade: 80%  Crit: 20%', lines[2]);

-- The same in one frame. The first prints once.
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
lines = MOCK.printed_since(n);
check('two /checks in one frame print the first once', #lines == 2
    and lines[1] == CHECK_LINE .. '  Hit: unknown  Evade: unknown  Crit: 8%'
    and lines[2] == RABBIT_LINE .. '  Hit: 95%  Evade: 80%  Crit: 20%', table.concat(lines, ' / '));

-- A /check with hit and evade off drops the wait. The older /check prints at once without them.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
s.printout.parts.hit.on = false;
s.printout.parts.evade.on = false;
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.wait(5);
lines = MOCK.printed_since(n);
check('a /check with hit and evade off prints both and sends nothing', #lines == 2 and lines[1] == CHECK_LINE .. '  Crit: 8%'
    and lines[2] == RABBIT_LINE .. '  Crit: 20%' and #MOCK.commands == 0, table.concat(lines, ' / '));
MOCK.command('/checkmate extras new');

-- A /check that gives up on the reply --------------------------------------------------------------

-- A newer /check or zoning ends an older /check's wait. It prints every line it hasn't yet except the
-- ones holding hit or evade, so its aggro, magic, immunities and drops still show.
MOCK.items[4358] = { Name = { 'Hare Meat' } };
MOCK.entities[30] = { Name = 'Fixture Knight' };
MOCK.player.skills[36] = 200;
s.magic.schools.elemental.on = true;
for _, id in ipairs({ 'hit', 'evade', 'aggro', 'magic', 'immunities', 'drops' }) do s.printout.parts[id].on = true; end

local AGGRO_LINE    = '[checkmate] Aggro: Not aggressive  Doesn\'t link';
local GOBLIN_MAGIC  = '[checkmate] Magic: Elemental 95% (Ice)';
local GOBLIN_IMMUNE = '[checkmate] Immune: Bind, Paralyze';
local GOBLIN_DROPS  = '[checkmate] Drops (TH 0): Ice Crystal 100%, Fire Crystal 16%';
local RABBIT_HIT    = '[checkmate] Hit: 95%  Evade: 80%  Crit: 20%';
local RABBIT_DROPS  = '[checkmate] Drops (TH 0): Hare Meat 15% (only drops if you get EXP)';
local FIRE_MAGIC    = '[checkmate] Magic: Elemental 95% (Fire)';
local KNIGHT_LINE   = '[checkmate] Fixture Knight (Lv 44)  Even Match';

-- The lines printed since `n`, joined, to compare with every expected line in order. A line
-- printed twice or not at all never matches.
local function since(n)
    return table.concat(MOCK.printed_since(n), ' / ');
end
local function joined(want)
    return table.concat(want, ' / ');
end

-- The default layout, a second /check after the send. The older /check line printed at once, and the
-- second /check brings the rest of the older one but its Hit line.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('the older /check line prints at once', since(n) == CHECK_LINE, since(n));
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('a second /check prints the older one\'s aggro, magic, immunities and drops but not its Hit line',
    since(n) == joined({ CHECK_LINE, AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_LINE }), since(n));
MOCK.wait(1);
check('one request for both', #MOCK.commands == 1, #MOCK.commands);
check('its reply hidden', MOCK.reply(300, 250) == 6);
MOCK.frame();
MOCK.wait(5);
check('the newer gets the reply and nothing prints twice', since(n) == joined({ CHECK_LINE, AGGRO_LINE, GOBLIN_MAGIC,
    GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_LINE, RABBIT_HIT, AGGRO_LINE, FIRE_MAGIC, RABBIT_DROPS }), since(n));

-- The same in one frame, before the older /check printed anything. Its /check line doesn't hold hit,
-- so only its Hit line is left out.
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('two /checks in one frame print the older one but its Hit line', since(n) == joined({ CHECK_LINE, AGGRO_LINE,
    GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_LINE }), since(n));
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
MOCK.wait(5);
check('and the newer after the reply, each line once', since(n) == joined({ CHECK_LINE, AGGRO_LINE, GOBLIN_MAGIC,
    GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_LINE, RABBIT_HIT, AGGRO_LINE, FIRE_MAGIC, RABBIT_DROPS }), since(n));

-- Drops moved above hit prints at once. The rest of the older /check starts at its Hit line, so Drops
-- doesn't print twice.
local saved_order = s.printout.order;
s.printout.order = 'difficulty drops hit evade crit aggro magic immunities';
s.printout.parts.hit.new_line = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('the lines above the older Hit line print at once', since(n) == joined({ CHECK_LINE, GOBLIN_DROPS }), since(n));
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('the second /check prints the older lines under its Hit line', since(n) == joined({ CHECK_LINE, GOBLIN_DROPS,
    AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE, RABBIT_LINE, RABBIT_DROPS }), since(n));
MOCK.wait(1);
MOCK.reply(300, 250);
MOCK.frame();
MOCK.wait(5);
check('and the newer after the reply, each line once', since(n) == joined({ CHECK_LINE, GOBLIN_DROPS, AGGRO_LINE,
    GOBLIN_MAGIC, GOBLIN_IMMUNE, RABBIT_LINE, RABBIT_DROPS, RABBIT_HIT, AGGRO_LINE, FIRE_MAGIC }), since(n));

-- Evade on its own line under Magic. Both lines holding hit or evade are left out, and the Magic line
-- between them prints.
s.printout.order = 'difficulty hit crit aggro magic evade immunities drops';
s.printout.parts.hit.new_line = false;
s.printout.parts.evade.new_line = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('the lines between and after the Hit and Evade lines print', since(n) == joined({ CHECK_LINE, AGGRO_LINE,
    GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_LINE }), since(n));
MOCK.wait(1);
MOCK.reply(300, 250);
MOCK.frame();
MOCK.wait(5);
check('and the newer gets both', since(n) == joined({ CHECK_LINE, AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS,
    RABBIT_LINE, '[checkmate] Hit: 95%  Crit: 20%', AGGRO_LINE, FIRE_MAGIC, '[checkmate] Evade: 80%', RABBIT_DROPS }), since(n));
s.printout.order = saved_order;
s.printout.parts.evade.new_line = false;

-- With the name, difficulty and reading off, the Hit line comes first. The extras are on their own
-- line, so it's left out like any other line holding hit.
for _, id in ipairs({ 'name', 'difficulty', 'reading' }) do s.printout.parts[id].on = false; end
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('with the Hit line first, the second /check prints the older one but that line', since(n) == joined({ AGGRO_LINE,
    GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS }), since(n));
MOCK.wait(1);
MOCK.reply(300, 250);
MOCK.frame();
MOCK.wait(5);
check('and the newer after the reply, each line once', since(n) == joined({ AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE,
    GOBLIN_DROPS, RABBIT_HIT, AGGRO_LINE, FIRE_MAGIC, RABBIT_DROPS }), since(n));
for _, id in ipairs({ 'name', 'difficulty', 'reading' }) do s.printout.parts[id].on = true; end

-- With the extras on the /check line, that line holds hit. The game's line is hidden, so the older
-- /check line still prints, with hit and evade unknown, and the rest follows.
MOCK.command('/checkmate extras same');
local GOBLIN_UNKNOWN = CHECK_LINE .. '  Hit: unknown  Evade: unknown  Crit: 8%';
local RABBIT_WHOLE = RABBIT_LINE .. '  Hit: 95%  Evade: 80%  Crit: 20%';
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('the older /check waits whole', #MOCK.printed == n);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('the second /check prints the older /check line with hit and evade unknown, then the rest',
    since(n) == joined({ GOBLIN_UNKNOWN, AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS }), since(n));
MOCK.wait(1);
MOCK.reply(300, 250);
MOCK.frame();
MOCK.wait(5);
check('and the newer whole after the reply, each line once', since(n) == joined({ GOBLIN_UNKNOWN, AGGRO_LINE,
    GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_WHOLE, AGGRO_LINE, FIRE_MAGIC, RABBIT_DROPS }), since(n));

-- The same with the game's line shown. That line answers the older /check, so its line holding hit is
-- left out, and the rest still prints.
MOCK.command('/checkmate replace off');
n = #MOCK.printed;
check('the older /check\'s game line shows', not MOCK.packet(MOCK.check_packet(1, 39, 4, 174)).blocked);
MOCK.wait(1.6);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
check('the second /check prints the older one but its /check line', since(n) == joined({ AGGRO_LINE, GOBLIN_MAGIC,
    GOBLIN_IMMUNE, GOBLIN_DROPS }), since(n));
MOCK.wait(1);
MOCK.reply(300, 250);
MOCK.frame();
MOCK.wait(5);
check('and the newer whole after the reply, each line once', since(n) == joined({ AGGRO_LINE, GOBLIN_MAGIC,
    GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_WHOLE, AGGRO_LINE, FIRE_MAGIC, RABBIT_DROPS }), since(n));
MOCK.command('/checkmate replace on');
MOCK.command('/checkmate extras new');

-- Zoning while it waits prints the rest of the /check the same way.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.zone_in(900);
check('nothing prints inside the zone event', #MOCK.printed == n + 1);
MOCK.frame();
local zoned = joined({ CHECK_LINE, AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS });
check('zoning prints the rest but the Hit line', since(n) == zoned, since(n));
check('the reply to the request from before shows', MOCK.reply(300, 250) == 0);
MOCK.wait(5);
check('and nothing more', since(n) == zoned, since(n));

-- Three /checks in a row. Each older one prints its rest when the next comes, and only the newest gets
-- the reply, from one request.
MOCK.commands = {};
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(0.5);
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.wait(0.5);
MOCK.packet(MOCK.check_packet(30, 44, 4, 174));
MOCK.frame();
local three = { CHECK_LINE, AGGRO_LINE, GOBLIN_MAGIC, GOBLIN_IMMUNE, GOBLIN_DROPS, RABBIT_LINE, AGGRO_LINE, FIRE_MAGIC,
    RABBIT_DROPS, KNIGHT_LINE };
check('three /checks print the two older ones but their Hit lines', since(n) == joined(three), since(n));
MOCK.wait(1.6);
check('one request for all three', #MOCK.commands == 1, #MOCK.commands);
check('its reply hidden', MOCK.reply(300, 250) == 6);
MOCK.frame();
MOCK.wait(5);
three[#three + 1] = '[checkmate] Hit: 95%  Evade: 65%  Crit: 8%';
three[#three + 1] = AGGRO_LINE;
three[#three + 1] = FIRE_MAGIC;
check('only the newest gets its Hit line, and nothing prints twice', since(n) == joined(three), since(n));
check('nothing left hidden', MOCK.reply(300, 250) == 0);

-- The plain /check line --------------------------------------------------------------------------

-- With every part off, the name, level, difficulty and reading print in the game line's place.
for _, part in pairs(s.printout.parts) do part.on = false; end
n = #MOCK.printed;
check('every part off still hides the game\'s line', MOCK.packet(MOCK.check_packet(1, 39, 4, 171)).blocked);
MOCK.frame();
lines = MOCK.printed_since(n);
check('and prints the plain /check line in its place', #lines == 1 and lines[1] == CHECK_LINE .. ' (High Evasion)', lines[1]);

-- The same when the parts that are on have nothing to say. Fixture Rabbit has no immunities.
s.printout.parts.immunities.on = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(5, 3, 2, 174));
MOCK.frame();
lines = MOCK.printed_since(n);
check('parts with nothing to say get the plain line too', #lines == 1 and lines[1] == RABBIT_LINE, lines[1]);
s.printout.parts.immunities.on = false;

MOCK.command('/checkmate replace off');
n = #MOCK.printed;
check('off, every part off shows the game\'s line', not MOCK.packet(MOCK.check_packet(1, 39, 4, 171)).blocked);
MOCK.wait(1);
check('and prints nothing', #MOCK.printed == n);
MOCK.command('/checkmate replace on');

-- Can't be gauged ---------------------------------------------------------------------------------

-- A monster with no data and no level, with hit on. The name and Impossible to Gauge come first.
s.printout.parts.hit.on = true;
MOCK.commands = {};
n = #MOCK.printed;
check('can\'t be gauged hides the game\'s line', MOCK.packet(MOCK.check_packet(77, 0, nil, 249)).blocked);
MOCK.frame();
lines = MOCK.printed_since(n);
check('it prints the name and Impossible to Gauge, then the widescan line', #lines == 2
    and lines[1] == '[checkmate] Mystery Mob (Lv ?)  Impossible to Gauge'
    and lines[2] == '[checkmate] Mystery Mob can\'t be gauged. Widescan it first for its numbers.', table.concat(lines, ' / '));
MOCK.wait(5);
check('and sends nothing', #MOCK.commands == 0 and #MOCK.printed == n + 2);
MOCK.command('/checkmate replace off');
n = #MOCK.printed;
check('off, the game\'s line shows', not MOCK.packet(MOCK.check_packet(77, 0, nil, 249)).blocked);
MOCK.frame();
lines = MOCK.printed_since(n);
check('and only the widescan line prints', #lines == 1
    and lines[1] == '[checkmate] Mystery Mob can\'t be gauged. Widescan it first for its numbers.', table.concat(lines, ' / '));
MOCK.command('/checkmate replace on');

-- A stopped checkmate ------------------------------------------------------------------------------

-- A checkmate stopped after an error prints nothing, so the game's line shows until it starts again.
MOCK.command('/checkmate');
cur().look.imgui = nil;
n = #MOCK.printed;
MOCK.frame();
check('a frame error stops checkmate', (MOCK.printed_since(n)[1] or ''):find('Stopped after an error', 1, true) ~= nil);
MOCK.commands = {};
check('then the game\'s line shows', not MOCK.packet(MOCK.check_packet(1, 39, 4, 174)).blocked);
-- The first /checkmate reset only says what it does. The second one does it.
MOCK.command('/checkmate reset');
MOCK.command('/checkmate reset');
cur().printout.divider = 'spaces';
cur().printout.parts.aggro.on = false;
MOCK.command('/checkmate');
n = #MOCK.printed;
MOCK.wait(2);
check('started again, it answers nothing from while it was stopped', #MOCK.printed == n and #MOCK.commands == 0,
    MOCK.printed_since(n)[1]);
check('started again, it hides it again', MOCK.packet(MOCK.check_packet(1, 39, 4, 174)).blocked);
MOCK.frame();
check('and prints the new /check', #MOCK.printed == n + 1 and MOCK.printed_since(n)[1] == CHECK_LINE,
    MOCK.printed_since(n)[1]);

return MOCK.report();
