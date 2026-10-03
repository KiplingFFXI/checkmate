-- Tests how the addon works out a monster's level, on the made-up zone in fixtures\. It covers the
-- /check level less level_mod, a /check level of -1, widescan, the data's range, dynamic spawns by
-- name, when the zone file loads, the level range after a known level, and each spawn's own range.
-- Counts the zone files monsters.lua loads.
local zone_loads = 0;
local real_loadfile = loadfile;
loadfile = function (path, ...)
    if (tostring(path):find('data/zones/', 1, true)) then zone_loads = zone_loads + 1; end
    return real_loadfile(path, ...);
end

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';

-- This file is about the level, so difficulty and reading stay out of its lines.
s.printout.parts.difficulty.on = false;
s.printout.parts.reading.on = false;

-- The numbers stay on the name's line, the one these tests read.
s.printout.extras_own_line = false;

local names = {
    [1] = 'Fixture Goblin', [5] = 'Fixture Rabbit', [400] = 'Fixture NM', [401] = 'Fixture NM', [10] = 'Fixture Worm',
    [20] = 'Fixture Blank', [77] = 'Mystery Mob', [0x705] = 'Fixture Treant', [40] = 'Fixture Tinkerer',
    [41] = 'Fixture Tinkerer', [42] = 'Fixture Tinkerer',
};
for index, name in pairs(names) do MOCK.entities[index] = { Name = name }; end

-- Your /check, then the first line it prints. With hit or evade on it answers the /checkparam with
-- accuracy 300 and evasion 250.
local function first_line(index, level, con, message)
    local n = #MOCK.printed;
    MOCK.commands = {};
    MOCK.packet(MOCK.check_packet(index, level, con, message or 174));
    MOCK.frame();
    if (#MOCK.printed == n) then
        MOCK.wait(1.6);
        if (#MOCK.commands > 0) then
            MOCK.reply(300, 250);
            MOCK.frame();
        end
    end
    return MOCK.printed_since(n)[1] or '(nothing)';
end

local function expect(name, line, want)
    check(name, line == want, line);
end

check('the zone file waits for the first /check', zone_loads == 0, zone_loads);
expect('a /check level is the level', first_line(1, 39, 4), '[checkmate] Fixture Goblin (Lv 39)');
first_line(1, 38, 4);
check('the zone file loads once', zone_loads == 1, zone_loads);
expect('level_mod comes off the /check level', first_line(5, 3, 2), '[checkmate] Fixture Rabbit (Lv 5)');
expect('a /check level of -1 falls back to the range', first_line(5, -1, 2), '[checkmate] Fixture Rabbit (Lv 5-6)');
MOCK.packet(MOCK.widescan_packet(5, 6));
expect('then to widescan once scanned', first_line(5, -1, 2), '[checkmate] Fixture Rabbit (Lv 6)');
expect('the /check level still wins over widescan', first_line(5, 3, 2), '[checkmate] Fixture Rabbit (Lv 5)');

expect('impossible to gauge shows the range', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 50-51)');
MOCK.packet(MOCK.widescan_packet(401, 50));
expect('widescan of another index changes nothing', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 50-51)');
MOCK.packet(MOCK.widescan_packet(400, 51));
expect('widescan gives the exact level', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 51)');
MOCK.packet(MOCK.widescan_packet(400, 0));
expect('a widescan level of 0 is ignored', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 51)');
MOCK.packet(MOCK.widescan_packet(400, 200));
expect('a widescan level over 127 reads unsigned', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 200)');

MOCK.zone_in(900);
expect('zoning forgets widescan', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 50-51)');
check('and loads the zone file again', zone_loads == 2, zone_loads);

expect('a row with no levels shows Lv ?', first_line(20, 0, nil, 249), '[checkmate] Fixture Blank (Lv ?)');
expect('no row and no level shows Lv ?', first_line(77, 0, nil, 249), '[checkmate] Mystery Mob (Lv ?)');
expect('no row with a /check level', first_line(77, 30, 3), '[checkmate] Mystery Mob (Lv 30)');
expect('a row with levels in two blocks', first_line(10, 0, nil, 249), '[checkmate] Fixture Worm (Lv 51-76)');

-- A monster a script spawned has 0x800 or more in its server id's low 12 bits, and is found by name.
local n = #MOCK.printed;
MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(900, 0x805), 30, 68, 174, 0x705));
MOCK.frame();
expect('a dynamic spawn is found by name', MOCK.printed_since(n)[1], '[checkmate] Fixture Treant (Lv 30)');

-- Someone else's /check isn't yours.
n = #MOCK.printed;
MOCK.packet(MOCK.message_packet(2002, MOCK.mob_id(900, 1), 39, 68, 174, 1));
MOCK.wait(1);
check('another player\'s /check prints nothing', #MOCK.printed == n);

-- Numbers over the range ------------------------------------------------------------------------

s.printout.parts.hit.on = true;
s.printout.parts.evade.on = true;
s.printout.parts.crit.on = true;
local physical = require('core.physical');

-- A range as the printout writes it, like "56-60%" or "95%".
local function range_text(low, high)
    if (low == high) then return ('%d%%'):format(low); end
    return ('%d-%d%%'):format(low, high);
end

-- Fixture NM at 50 to 51 has evasion 170 and 173 against your accuracy 300.
MOCK.zone_in(900);
local line = first_line(400, 0, nil, 249);
local hit = range_text(physical.hit_percent(300, 173), physical.hit_percent(300, 170));
check('hit over the range, with ? for a scripted monster', line:find('Hit: ' .. hit .. '?', 1, true) ~= nil, line);

-- The worm's numbers come from levels 51, 52 and 76 only, never the typical values between them. At
-- 76 it is one level over you, which moves 4 accuracy its way. Your DEX is 70.
local worm = { { 186, 158, 56, 0 }, { 191, 163, 56, 0 }, { 321, 283, 80, 1 } };
local range = { hit = { 100, 0 }, evade = { 100, 0 }, crit = { 100, 0 } };
local function widen(name, value)
    range[name][1], range[name][2] = math.min(range[name][1], value), math.max(range[name][2], value);
end
for _, level in ipairs(worm) do
    local acc, eva, agi, gap = level[1], level[2], level[3], level[4];
    widen('hit', physical.hit_percent(300 - 4 * gap, eva));
    widen('evade', 100 - physical.hit_percent(acc + 4 * gap, 250));
    widen('crit', physical.crit_percent(70, agi));
end
local want = ('[checkmate] Fixture Worm (Lv 51-76)  Hit: %s  Evade: %s  Crit: %s'):format(range_text(range.hit[1], range.hit[2]),
    range_text(range.evade[1], range.evade[2]), range_text(range.crit[1], range.crit[2]));
line = first_line(10, 0, nil, 249);
check('a gapped range only uses the levels it has', line == want, line .. '  wanted ' .. want);

-- A /check level the row doesn't have uses the typical values for that level.
line = first_line(10, 60, 4);
check('a level the row lacks uses the typical values', line:find('Evade: %d+%-%d+%%') ~= nil, line);

-- No row with a /check level uses the typical values too, as ranges. Your accuracy 300 is far over a
-- level 30's evasion, so the /check's own "normal evasion" bracket of 60-79% wins.
line = first_line(77, 30, 3);
check('no row uses the typical values', line:find('Hit: 60-79%', 1, true) ~= nil and line:find('Crit: %d+%-%d+%%') ~= nil,
    line);

-- No row and no level can't be gauged, prints on the next frame and sends no /checkparam. The game's
-- line is hidden, so its name and Impossible to Gauge come first.
n = #MOCK.printed;
MOCK.commands = {};
MOCK.packet(MOCK.check_packet(77, 0, nil, 249));
MOCK.frame();
expect('no row and no level shows the /check first', MOCK.printed_since(n)[1],
    '[checkmate] Mystery Mob (Lv ?)  Impossible to Gauge');
expect('then says it can\'t be gauged', MOCK.printed_since(n)[2],
    '[checkmate] Mystery Mob can\'t be gauged. Widescan it first for its numbers.');
MOCK.wait(5);
check('and sends nothing', #MOCK.commands == 0 and #MOCK.printed == n + 2);
MOCK.packet(MOCK.widescan_packet(77, 40));
line = first_line(77, 0, nil, 249);
check('widescan makes it gaugeable', line:find('^%[checkmate%] Mystery Mob %(Lv 40%)  Hit') ~= nil, line);

-- The level range after the exact level ------------------------------------------------------------

-- The range is the true levels that spawn can be. With no range of its own in the data, it's the
-- lowest to highest level in the row.
s.printout.parts.hit.on = false;
s.printout.parts.evade.on = false;
s.printout.parts.crit.on = false;
MOCK.command('/checkmate levelrange on');
MOCK.zone_in(900);
expect('a /check level and the row\'s range', first_line(1, 39, 4), '[checkmate] Fixture Goblin (Lv 39, range 38-40)');
expect('level_mod comes off the level, and the range is true levels', first_line(5, 3, 2),
    '[checkmate] Fixture Rabbit (Lv 5, range 5-6)');
expect('a /check level of -1 shows the range alone', first_line(5, -1, 2), '[checkmate] Fixture Rabbit (Lv 5-6)');
expect('impossible to gauge with no widescan shows the range alone', first_line(400, 0, nil, 249),
    '[checkmate] Fixture NM (Lv 50-51)');
MOCK.packet(MOCK.widescan_packet(400, 51));
expect('a widescanned NM shows its level and range', first_line(400, 0, nil, 249), '[checkmate] Fixture NM (Lv 51, range 50-51)');
expect('levels in two blocks show only the block around the level', first_line(10, 52, 4),
    '[checkmate] Fixture Worm (Lv 52, range 51-52)');
expect('a block of one level shows just that', first_line(10, 76, 4), '[checkmate] Fixture Worm (Lv 76)');
expect('a level outside the range shows the level alone', first_line(10, 60, 4), '[checkmate] Fixture Worm (Lv 60)');
expect('with no known level the range keeps both blocks', first_line(10, 0, nil, 249), '[checkmate] Fixture Worm (Lv 51-76)');
n = #MOCK.printed;
MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(900, 0x805), 30, 68, 174, 0x705));
MOCK.frame();
expect('a monster that spawns at one level shows just that', MOCK.printed_since(n)[1], '[checkmate] Fixture Treant (Lv 30)');
expect('no row shows just the /check level', first_line(77, 30, 3), '[checkmate] Mystery Mob (Lv 30)');
expect('a row with no levels is still Lv ?', first_line(20, 0, nil, 249), '[checkmate] Fixture Blank (Lv ?)');
MOCK.command('/checkmate rangeword "spawns at"');
expect('your own word', first_line(1, 39, 4), '[checkmate] Fixture Goblin (Lv 39, spawns at 38-40)');
MOCK.command('/checkmate rangeword ""');
expect('no word', first_line(1, 39, 4), '[checkmate] Fixture Goblin (Lv 39, 38-40)');
MOCK.command('/checkmate level off');
expect('Show level off hides it all', first_line(1, 39, 4), '[checkmate] Fixture Goblin');
MOCK.command('/checkmate level on');
MOCK.command('/checkmate levelrange off');
expect('off again', first_line(1, 39, 4), '[checkmate] Fixture Goblin (Lv 39)');

-- Each spawn's own range ---------------------------------------------------------------------------

-- Fixture Tinkerer's row runs 54 to 57. Index 40 spawns at 54 to 55, index 41 at 56 to 57, and index
-- 42 has no range of its own, so it takes the row's.
MOCK.command('/checkmate levelrange on');
MOCK.command('/checkmate rangeword range');
MOCK.zone_in(900);
expect('a spawn\'s own range', first_line(40, 55, 4), '[checkmate] Fixture Tinkerer (Lv 55, range 54-55)');
expect('another spawn of the same row', first_line(41, 56, 4), '[checkmate] Fixture Tinkerer (Lv 56, range 56-57)');
expect('a spawn with no range of its own takes the row\'s', first_line(42, 56, 4),
    '[checkmate] Fixture Tinkerer (Lv 56, range 54-57)');
expect('a level outside the spawn\'s range shows the level alone', first_line(40, 57, 4), '[checkmate] Fixture Tinkerer (Lv 57)');
expect('no known level falls back to the spawn\'s range', first_line(40, 0, nil, 249), '[checkmate] Fixture Tinkerer (Lv 54-55)');
expect('and to the other spawn\'s', first_line(41, 0, nil, 249), '[checkmate] Fixture Tinkerer (Lv 56-57)');
expect('and to the row\'s for the spawn with none', first_line(42, 0, nil, 249), '[checkmate] Fixture Tinkerer (Lv 54-57)');
MOCK.packet(MOCK.widescan_packet(40, 54));
expect('a widescan level with the spawn\'s range', first_line(40, 0, nil, 249), '[checkmate] Fixture Tinkerer (Lv 54, range 54-55)');
MOCK.command('/checkmate levelrange off');

-- Hit, evade and crit with no known level only use the spawn's levels. The Tinkerer's accuracy,
-- evasion and AGI at 54 to 57 are below. Your accuracy is 300, your evasion 250 and your DEX 70.
local TINKERER = { [54] = { 200, 290, 60 }, [55] = { 210, 280, 50 }, [56] = { 220, 270, 40 }, [57] = { 230, 260, 30 } };
local function numbers_over(low, high)
    local hit, evade, crit = {}, {}, {};
    for level = low, high do
        local acc, eva, agi = unpack(TINKERER[level]);
        hit[#hit + 1] = physical.hit_percent(300, eva);
        evade[#evade + 1] = 100 - physical.hit_percent(acc, 250);
        crit[#crit + 1] = physical.crit_percent(70, agi);
    end
    local function text(list) return range_text(math.min(unpack(list)), math.max(unpack(list))); end
    return ('Hit: %s  Evade: %s  Crit: %s'):format(text(hit), text(evade), text(crit));
end
check('the spawn\'s range gives other numbers than the row\'s', numbers_over(54, 55) ~= numbers_over(54, 57));
s.printout.parts.hit.on = true;
s.printout.parts.evade.on = true;
s.printout.parts.crit.on = true;
MOCK.zone_in(900);
expect('hit, evade and crit over the spawn\'s range', first_line(40, 0, nil, 249),
    '[checkmate] Fixture Tinkerer (Lv 54-55)  ' .. numbers_over(54, 55));
expect('and over the other spawn\'s', first_line(41, 0, nil, 249), '[checkmate] Fixture Tinkerer (Lv 56-57)  ' .. numbers_over(56, 57));
expect('and over the row\'s for the spawn with none', first_line(42, 0, nil, 249),
    '[checkmate] Fixture Tinkerer (Lv 54-57)  ' .. numbers_over(54, 57));
s.printout.parts.hit.on = false;
s.printout.parts.evade.on = false;
s.printout.parts.crit.on = false;

-- The aggro test for a monster that can't be gauged goes by the spawn's range too. At your level 75,
-- level 55 and below checks Too Weak.
local function aggro_line(index)
    local n = #MOCK.printed;
    first_line(index, 0, nil, 249);
    return MOCK.printed_since(n)[2] or '(nothing)';
end
expect('a spawn at 54 to 55 is too weak to aggro you', aggro_line(40),
    '[checkmate] Aggro: Too weak to aggro you unless you rest  Doesn\'t link');
expect('a spawn at 56 to 57 aggroes you', aggro_line(41), '[checkmate] Aggro: Aggressive  Doesn\'t link');
expect('the row\'s range says where it starts', aggro_line(42), '[checkmate] Aggro: Aggressive if it\'s level 56 or higher  Doesn\'t link');

return MOCK.report();
