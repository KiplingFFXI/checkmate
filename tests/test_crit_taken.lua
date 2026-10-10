-- Tests the Crit taken part and the two crit merits. That covers the math on its own, the worked examples through
-- the readout with real monsters, with and without merits, at and under the level caps, each piece of gear at and
-- under its level, one that swings with nothing but TP moves, one that never swings and one of those that
-- counters. Then a real /check: its place right after Crit, nothing sent for it, its
-- label, New line and arrows, its colors to the bytes, its grades going the other way, ranges and their middle, the
-- ?, unknown and can't be gauged, your gear read once, the merit commands, the merit list filling both in, a hand
-- change holding until you zone or change that merit, the switch, profiles leaving your merits out, reset, help, the
-- window, the overlay and the sample.
local physical = require('core.physical');
local printout = require('core.printout');
local player   = require('core.player');

-- Gear with critical hit evasion, by item id, and the slot each goes in.
local VAN, MANTLE, STONE, CAPE = 15503, 15463, 15871, 15465;
local NECK, WAIST, BACK = 9, 10, 15;

local function color(code) return '\30' .. string.char(code); end
-- Color codes as {n}, so a failed check shows them.
local function codes(text) return (tostring(text):gsub('\30(.)', function (c) return '{' .. c:byte() .. '}'; end)); end
local function has(text, want) return (text or ''):find(want, 1, true) ~= nil; end

-- The math on its own ------------------------------------------------------------------------------

local counts = {};
for _, level in ipairs({ 1, 9, 10, 19, 20, 35, 39, 40, 75 }) do
    counts[#counts + 1] = physical.merits_that_count(4, level);
end
expect('4 merits count as 0, 0, 1, 1, 2, 3, 3, 4 and 4 at levels 1, 9, 10, 19, 20, 35, 39, 40 and 75',
    table.concat(counts, ','), '0,0,1,1,2,3,3,4,4');
check('fewer than the cap all count, and none set is none', physical.merits_that_count(2, 75) == 2
    and physical.merits_that_count(nil, 75) == 0);
check('each merit is worth 1%, so 4 at level 35 are worth 3', physical.merit_bonus('crit_hit_rate', 4, 35) == 3
    and physical.merit_bonus('enemy_crit_rate', 4, 75) == 4 and physical.merit_bonus('enemy_crit_rate', 4, 9) == 0);
check('Phoenix allows 4 of each, from the data', physical.MERITS.crit_hit_rate.most == 4
    and physical.MERITS.enemy_crit_rate.most == 4);
check('a hand-edited 9 is kept at 4, and -1, 2.6 and x are 0, 2 and 0', physical.clamp_merits(9, 4) == 4
    and physical.clamp_merits(-1, 4) == 0 and physical.clamp_merits(2.6, 4) == 2 and physical.clamp_merits('x', 4) == 0);
expect('which merits count from which level, for the tips', physical.merit_steps_text(4),
    'none under 10, 1 from 10, 2 from 20, 3 from 30 and all 4 from 40');
expect('and all 4 count from 40', physical.all_merits_level(4), 40);
local GEAR = {
    { 'Van Pendant', VAN, 14, 1 },
    { 'Safety Mantle', MANTLE, 51, 2 },
    { 'Warrior\'s Stone', STONE, 70, 2 },
    { 'Toreador\'s Cape', CAPE, 72, -50 },
};
for _, piece in ipairs(GEAR) do
    local name, id, level, amount = unpack(piece);
    check(('%s counts %d from level %d and nothing under it'):format(name, amount, level),
        physical.crit_evasion({ id }, level) == amount and physical.crit_evasion({ id }, level - 1) == 0);
end
check('two pieces add up, and gear without it adds nothing', physical.crit_evasion({ VAN, MANTLE, 12345 }, 75) == 3
    and physical.crit_evasion({}, 75) == 0);

-- The worked examples, with each monster's own row -------------------------------------------------

local function zone_row(zone, name, level)
    for _, row in ipairs(dofile(('%s/data/zones/%d.lua'):format(ADDON_DIR, zone)).monsters) do
        if (row.name == name and row.levels and row.levels[level]) then return row; end
    end
end
local BOUNDER  = zone_row(65, 'Mamool Ja Bounder', 74);     -- DEX 97, 97 and 100 at 73 to 75, AGI 87 at 74.
local CRAB     = zone_row(104, 'Knight Crab', 35);          -- DEX 30, its own crit rate 15.
local TINKERER = zone_row(102, 'Goblin Tinkerer', 13);      -- DEX 19 and AGI 16 at 13.
local GOOBBUE  = zone_row(153, 'Ancient Goobbue', 80);      -- DEX 82, its own crit rate 25.
local JAZARAAT = zone_row(79, 'Jazaraat', 67);              -- DEX 71, 71, 72 and 73 at 67 to 70, its own crit rate 50.
local CUTTER   = zone_row(159, 'Tonberry Cutter', 55);      -- AGI 70.
local SNIPER   = zone_row(139, 'Sniper Pugil', 21);         -- It swings with nothing but TP moves.
local RECEPTACLE = zone_row(18, 'Memory Receptacle', 30);   -- It never swings.
local NANTINA  = zone_row(39, 'Nantina', 82);               -- DEX 115. It swings with TP moves, and counters as a MNK.

-- A range as text, like 11 or 11-14.
local function text(range)
    if (range == nil) then return 'nil'; end
    return (range.low == range.high) and tostring(range.low) or (range.low .. '-' .. range.high);
end
-- How often a monster at low to high crits you, with your AGI, your main level, your Enemy Critical Hit Rate merits
-- and your gear.
local function taken(row, low, high, agi, level, merits, gear)
    local me = { level = level, agi = agi, dex = 50, buffs = {}, zone = 65, enemy_crit_merits = merits,
        crit_evasion = physical.crit_evasion(gear or {}, level) };
    return text(physical.readout(me, { row = row, low = low, high = high }).crittaken);
end
-- Your crit on a monster at `level`, with your DEX, your main level and your Critical Hit Rate merits.
local function crit(row, level, dex, my_level, merits)
    local me = { level = my_level, dex = dex, agi = 50, buffs = {}, zone = 65, crit_merits = merits };
    return text(physical.readout(me, { row = row, low = level, high = level }).crit);
end

-- Crit taken is 5, plus its DEX over your AGI, plus its own crit rate, less the merits that count and your gear.
local EXAMPLES = {
    { '1. a Bounder at 74 on 56 AGI is 41 over, so 5 + 6', BOUNDER, 74, 74, 56, 75, 0, nil, '11' },
    { '2. with 4 merits', BOUNDER, 74, 74, 56, 75, 4, nil, '7' },
    { '3. and a Safety Mantle', BOUNDER, 74, 74, 56, 75, 4, { MANTLE }, '5' },
    { '4. at 73 to 75, where 75 is 44 over', BOUNDER, 73, 75, 56, 75, 0, nil, '11-14' },
    { '4. and with 4 merits', BOUNDER, 73, 75, 56, 75, 4, nil, '7-10' },
    { '5. on 66 AGI it\'s 31 over', BOUNDER, 74, 74, 66, 75, 0, nil, '9' },
    { '5. and with 4 merits', BOUNDER, 74, 74, 66, 75, 4, nil, '5' },
    { '6. with a Warrior\'s Stone too', BOUNDER, 74, 74, 66, 75, 4, { STONE }, '3' },
    { '6. and a Safety Mantle', BOUNDER, 74, 74, 66, 75, 4, { STONE, MANTLE }, '1' },
    { '7. a Knight Crab adds its own 15', CRAB, 35, 35, 27, 35, 0, nil, '20' },
    { '8. with 4 merits at 35, where 3 count', CRAB, 35, 35, 27, 35, 4, nil, '17' },
    { '9. and a Van Pendant', CRAB, 35, 35, 27, 35, 4, { VAN }, '16' },
    { '10. a Goblin Tinkerer at 13 for a level 14', TINKERER, 13, 13, 16, 14, 0, nil, '5' },
    { '10. with 4 merits, where 1 counts', TINKERER, 13, 13, 16, 14, 4, nil, '4' },
    { '11. and a Van Pendant', TINKERER, 13, 13, 16, 14, 4, { VAN }, '3' },
    { '12. at level 13 the pendant is under its level, and 1 merit still counts', TINKERER, 13, 13, 16, 13, 4, { VAN },
        '4' },
    { '13. an Ancient Goobbue is 26 over and adds its own 25', GOOBBUE, 80, 80, 56, 75, 0, nil, '33' },
    { '13. and with 4 merits', GOOBBUE, 80, 80, 56, 75, 4, nil, '29' },
    { '14. Jazaraat at 67 to 70 is 15 to 17 over and adds its own 50', JAZARAAT, 67, 70, 56, 75, 0, nil, '57' },
    { '15. Toreador\'s Cape adds 50', BOUNDER, 74, 74, 56, 75, 0, { CAPE }, '61' },
    { '16. but not under its level 72', BOUNDER, 74, 74, 56, 71, 0, { CAPE }, '11' },
    { '17. a monster with no row at 74 is 17 to 29 over on the band', nil, 74, 74, 56, 75, 0, nil, '7-8' },
    { '17. and with 4 merits', nil, 74, 74, 56, 75, 4, nil, '3-4' },
    { '18. under level 10 no merit counts and the pendant is under its level', TINKERER, 13, 13, 30, 9, 4, { VAN },
        '5' },
    { '19. it never goes under 0', TINKERER, 13, 13, 30, 75, 4, { MANTLE, VAN }, '0' },
};
for _, case in ipairs(EXAMPLES) do
    local name, row, low, high, agi, level, merits, gear, want = unpack(case, 1, 9);
    expect(name, taken(row, low, high, agi, level, merits, gear), want);
end
local sniper = physical.readout({ level = 75, agi = 56, dex = 50, buffs = {}, zone = 139 },
    { row = SNIPER, low = 21, high = 21 });
check('a Sniper Pugil swings with nothing but TP moves', sniper.tp_moves == true and BOUNDER.tp_moves == nil
    and physical.readout({ level = 75, agi = 56, dex = 50, buffs = {} }, { row = BOUNDER }).tp_moves == false);
local receptacle = physical.readout({ level = 75, agi = 56, dex = 50, buffs = {}, zone = 18 },
    { row = RECEPTACLE, low = 30, high = 30 });
local nantina = physical.readout({ level = 75, agi = 56, dex = 50, buffs = {}, zone = 39 },
    { row = NANTINA, low = 82, high = 82 });
check('a Memory Receptacle never swings, and a Nantina counters', receptacle.no_swings == true
    and receptacle.counters == false and nantina.tp_moves == true and nantina.counters == true
    and sniper.no_swings == false and sniper.counters == false);
expect('its counters crit like a normal swing, 59 over 56 AGI', text(nantina.crittaken), '20');
local nothing = physical.readout({ level = 75, dex = 50, buffs = {} }, { row = BOUNDER, low = 74, high = 74 });
check('without your AGI it\'s unknown', nothing.crittaken == nil and nothing.crit ~= nil);

-- Your crit is 5, plus your DEX over its AGI, plus the Critical Hit Rate merits that count.
local CRIT_EXAMPLES = {
    { '22. a Bounder at 74 has 87 AGI, so 80 DEX is under it', BOUNDER, 74, 80, 75, '5', '9' },
    { '23. a Tonberry Cutter at 55 has 70 AGI', CUTTER, 55, 71, 55, '5', '9' },
    { '24. a Goblin Tinkerer at 13 for a level 14, where 1 merit counts', TINKERER, 13, 22, 14, '5', '6' },
    { '25. a Bounder with 100 DEX is 13 over', BOUNDER, 74, 100, 75, '6', '10' },
};
for _, case in ipairs(CRIT_EXAMPLES) do
    local name, row, level, dex, my_level, none, four = unpack(case);
    expect(name .. ', with no merits and with 4', crit(row, level, dex, my_level, 0) .. ' / '
        .. crit(row, level, dex, my_level, 4), none .. ' / ' .. four);
end

-- Through a /check ---------------------------------------------------------------------------------

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local function cur() return MOCK.settings.current; end
local s = cur();
-- Two spaces between parts keep the lines below easy to read.
s.printout.divider = 'spaces';
local p = MOCK.player;
local function you(level, agi, dex)
    p.main_level, p.stats[3], p.stats[1] = level, agi, dex or 70;
end
local function wear(gear)
    p.equipment = gear or {};
end
local function run(text)
    local n = #MOCK.printed;
    MOCK.command(text);
    return table.concat(MOCK.printed_since(n), ' / ');
end

-- Your /check of the monster at `index` in `zone`, at `level`, or with no level. Returns its lines once they've all
-- printed, joined, and how many /checkparams went out.
local function check_of(zone, index, name, level)
    if (p.zone ~= zone) then MOCK.zone_in(zone); end
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    MOCK.commands = {};
    if (level == nil) then
        MOCK.packet(MOCK.message_packet(p.server_id, MOCK.mob_id(zone, index), 0, 0, 249, index));
    else
        MOCK.packet(MOCK.check_packet(index, level, 4, 174));
    end
    MOCK.wait(1.6);
    local sent = #MOCK.commands;
    if (sent > 0) then
        MOCK.reply(300, 250);
        MOCK.frame();
    end
    return table.concat(MOCK.printed_since(n), ' / '), sent;
end
local function bounder(level) return check_of(65, 18, 'Mamool Ja Bounder', level); end
-- What Crit taken says in those lines, like 11% or (TP moves).
local function said_of(lines)
    return (lines .. ' / '):match('Crit taken: (.-) / ');
end

local part = s.printout.parts.crittaken;
check('it starts off in chat and the overlay, labeled Crit taken, with New line off', part.on == false
    and part.label == 'Crit taken' and part.new_line == false and s.overlay.parts.crittaken == false);
check('right after Crit in the order', printout.DEFAULT_ORDER:find(' crit crittaken ', 1, true) ~= nil);
check('and its cutoffs are 5 and 10', s.grades.crittaken_good == 5 and s.grades.crittaken_ok == 10);
you(75, 56);
local before = bounder(74);
check('with it off a /check has no Crit taken', not has(before, 'Crit taken'), before);
run('/checkmate show crittaken');
local line, sent = bounder(74);
check('a Bounder at 74 on 56 AGI is 11%, on the line under the /check', line:find('^%[checkmate%] Mamool Ja Bounder %(Lv '
    .. '74%)  Even Match / %[checkmate%] Crit taken: 11%% / %[checkmate%] Aggro: ') ~= nil, line);
check('with nothing sent for it', sent == 0, sent);
run('/checkmate show crit');
line, sent = bounder(74);
check('it comes right after Crit, on its line, and still sends nothing', has(line, '[checkmate] Crit: 5%  Crit taken: 11% / ')
    and sent == 0, line);
run('/checkmate show hit');
line, sent = bounder(74);
check('on the hit line it waits for the /checkparam with it', has(line, '[checkmate] Hit: ') and has(line, 'Crit: 5%  Crit '
    .. 'taken: 11% / ') and sent == 1, line);
run('/checkmate hide hit');

-- Its label, New line and arrows.
run('/checkmate label crittaken Taken');
check('its label is yours', has(bounder(74), 'Crit: 5%  Taken: 11%'), bounder(74));
run('/checkmate label crittaken "Crit taken"');
run('/checkmate newline crittaken on');
check('New line starts its own line', has(bounder(74), '[checkmate] Crit: 5% / [checkmate] Crit taken: 11% / '),
    bounder(74));
run('/checkmate newline crittaken off');
run('/checkmate move crittaken up');
check('and it moves up past Crit', has(bounder(74), '[checkmate] Crit taken: 11%  Crit: 5% / ') and cur().printout.order
    == 'difficulty hit pdif offhand offhandpdif ranged rangedpdif evade block parry crittaken crit job aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet',
    cur().printout.order);
run('/checkmate move crittaken down');
check('and back down', cur().printout.order == printout.DEFAULT_ORDER, cur().printout.order);
run('/checkmate hide crit');

-- Its colors to the bytes: the label and its divider in the label color, and the number in its grade's color.
local function raw_of(level)
    bounder(level);
    for i = #MOCK.printed, 1, -1 do
        if (has(MOCK.printed[i], 'Crit taken')) then return MOCK.printed[i]; end
    end
end
local function ends(raw, want) return raw ~= nil and raw:sub(-#want) == want; end
local raw = raw_of(74);
check('Phoenix paints 11% in Bad, the label and divider in cream', ends(raw, color(106) .. 'Crit taken' .. color(106)
    .. ': ' .. color(68) .. '11%'), codes(raw));
run('/checkmate grades off');
raw = raw_of(74);
check('with Color by grade off the number is in its Number color', ends(raw, color(106) .. 'Crit taken' .. color(106)
    .. ': ' .. color(106) .. '11%'), codes(raw));
run('/checkmate grades on');
run('/checkmate skin classic');
raw = raw_of(74);
check('Classic paints its label like Crit\'s and 11% in its Bad', ends(raw, color(7) .. 'Crit taken' .. color(7) .. ': '
    .. color(76) .. '11%'), codes(raw));
you(75, 66);
run('/checkmate enemycritmerits 4');
raw = raw_of(74);
check('and 5% in its Good', ends(raw, color(83) .. '5%'), codes(raw));
run('/checkmate enemycritmerits 0');
you(75, 56);
run('/checkmate grades off');
raw = raw_of(74);
check('and with grades off, in its Number color', ends(raw, color(1) .. '11%'), codes(raw));
run('/checkmate grades on');
run('/checkmate skin phoenix');
s = cur();
s.printout.divider = 'spaces';

-- Grades go the other way: Good at or under 5, OK at or under 10, Bad over it. A range goes by its middle.
local function grade_of(low, high)
    local lines = printout.lines(s, { name = 'Mob', low = 30, high = 30, crittaken = { low = low, high = high or low } });
    return codes(lines[#lines]:match('Crit taken.*$'));
end
expect('5% is Good', grade_of(5), 'Crit taken{106}: {2}5%');
expect('6% is OK', grade_of(6), 'Crit taken{106}: {104}6%');
expect('10% is OK', grade_of(10), 'Crit taken{106}: {104}10%');
expect('11% is Bad', grade_of(11), 'Crit taken{106}: {68}11%');
expect('4-6% goes by its middle, 5, so it\'s Good', grade_of(4, 6), 'Crit taken{106}: {2}4-6%');
expect('and 4-7% is OK', grade_of(4, 7), 'Crit taken{106}: {104}4-7%');
local said = run('/checkmate cutoff crittaken good 6');
expect('its cutoff command says "or below"', said, '[checkmate] Crit taken now counts as Good at 6% or below.');
check('and saves it', s.grades.crittaken_good == 6 and MOCK.last_save.grades.crittaken_good == 6);
expect('so 6% is Good now', grade_of(6), 'Crit taken{106}: {2}6%');
run('/checkmate cutoff crittaken good 5');

-- Before the level is known it's a range over the levels it can be, and Number ranges can print its middle.
expect('with no level, 73 to 75', said_of(bounder(nil)), '11-14%');
run('/checkmate ranges middle');
expect('and ~13% as its middle', said_of(bounder(nil)), '~13%');
run('/checkmate ranges range');

-- A script changes a Knight Crab's numbers, so its number gets the ?.
you(35, 27);
line = check_of(104, 6, 'Knight Crab', 35);
expect('a Knight Crab at 35 adds its own 15 and gets the ?', said_of(line), '20%?');
run('/checkmate enemycritmerits 4');
expect('with 4 merits at level 35, 3 of them count', said_of(check_of(104, 6, 'Knight Crab', 35)), '17%?');
wear({ [NECK] = VAN });
expect('and a Van Pendant takes 1 more off', said_of(check_of(104, 6, 'Knight Crab', 35)), '16%?');
wear();
run('/checkmate enemycritmerits 0');

-- A monster that swings with TP moves.
you(75, 56);
run('/checkmate short on');
line = check_of(139, 34, 'Sniper Pugil', 21);
expect('a Sniper Pugil only swings with TP moves, so it says that in place of the number', said_of(line), '(TP)');
run('/checkmate short off');
line = check_of(139, 34, 'Sniper Pugil', 21);
expect('and in full words', said_of(line), '(TP moves)');
raw = MOCK.printed[#MOCK.printed - 1];
check('in its Details color', has(raw, color(106) .. 'Crit taken' .. color(106) .. ': ' .. color(106) .. '(TP moves)'),
    codes(raw));
expect('even with no level', said_of(check_of(139, 34, 'Sniper Pugil', nil)), '(TP moves)');
-- The line with Crit taken in it, as it printed.
local function taken_raw()
    for i = #MOCK.printed, 1, -1 do
        if (has(MOCK.printed[i], 'Crit taken')) then return MOCK.printed[i]; end
    end
end
line = check_of(18, 28, 'Memory Receptacle', 30);
expect('a Memory Receptacle never swings, so it says that in place of the number', said_of(line), '(no swings)');
raw = taken_raw();
check('in its Details color too', has(raw, color(106) .. ': ' .. color(106) .. '(no swings)'), codes(raw));
expect('and so does a Moblin Clergyman, which only casts', said_of(check_of(13, 18, 'Moblin Clergyman', 40)),
    '(no swings)');
line = check_of(39, 44, 'Nantina', 82);
expect('a Nantina counters, so it keeps the number for its counters and says TP moves after it', said_of(line),
    '20% (TP moves)');
raw = taken_raw();
check('the number in its grade\'s color and the word in the Details color', has(raw, color(68) .. '20%' .. color(106)
    .. ' (TP moves)'), codes(raw));
run('/checkmate short on');
expect('and in short words', said_of(check_of(39, 44, 'Nantina', 82)), '20% (TP)');
expect('the receptacle\'s too', said_of(check_of(18, 28, 'Memory Receptacle', 30)), '(no sw)');
run('/checkmate short off');

-- Unknown without DEX at a level, and can't be gauged with no row and no level.
addon.path = FIXTURES_PATH;
you(75, 31);
expect('a row with no DEX at its level is unknown', said_of(check_of(900, 5, 'Fixture Rabbit', 3)), 'unknown');
expect('Fixture Goblin has its DEX, 45 at 39, so 14 over 31 AGI', said_of(check_of(900, 1, 'Fixture Goblin', 39)), '7%');
addon.path = ADDON_PATH;
local parts_were = {};
for id, each in pairs(s.printout.parts) do parts_were[id], each.on = each.on, id == 'crittaken'; end
line, sent = check_of(103, 1000, 'Mystery Mob', nil);
expect('with only Crit taken on, a monster with no row and no level can\'t be gauged', line, '[checkmate] Mystery Mob '
    .. '(Lv ?)  Impossible to Gauge / [checkmate] Mystery Mob can\'t be gauged. Widescan it first for its numbers.');
check('and nothing is sent', sent == 0, sent);
for id, on in pairs(parts_were) do s.printout.parts[id].on = on; end
you(75, 20);
expect('one with no row at a level goes by the band, 31 to 36 DEX at 30', said_of(check_of(103, 1000, 'Mystery Mob', 30)),
    '6-7%');
expect('and one above the band table is unknown', said_of(check_of(103, 1000, 'Mystery Mob', 99)), 'unknown');

-- Your gear is read once per /check, the first time its lines print, and never with the part off.
local equipped_items, gear_reads = player.equipped_items, 0;
player.equipped_items = function (...)
    gear_reads = gear_reads + 1;
    return equipped_items(...);
end
you(75, 56);
wear({ [NECK] = VAN, [BACK] = MANTLE });
gear_reads = 0;
expect('a Van Pendant and a Safety Mantle take 3 off', said_of(bounder(74)), '8%');
check('read once', gear_reads == 1, gear_reads);
run('/checkmate show hit');
gear_reads = 0;
local first = #MOCK.printed;
MOCK.commands = {};
MOCK.packet(MOCK.check_packet(18, 74, 4, 174));
MOCK.frame();
wear();
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
line = table.concat(MOCK.printed_since(first), ' / ');
check('and once with the line waiting for the reply, which says what your gear was at your /check', gear_reads == 1
    and has(line, 'Crit taken: 8%'), gear_reads .. ' ' .. line);
run('/checkmate hide hit');
expect('the next /check goes by the gear you have on now', said_of(bounder(74)), '11%');
run('/checkmate hide crittaken');
gear_reads = 0;
bounder(74);
check('with it off your gear is never read', gear_reads == 0, gear_reads);
run('/checkmate show crittaken');
wear({ [BACK] = CAPE });
expect('Toreador\'s Cape adds 50', said_of(bounder(74)), '61%');
wear();
player.equipped_items = equipped_items;

-- The merits ---------------------------------------------------------------------------------------

local HOLDS = ' What you set holds until you zone or change that merit. /checkmate meritfill off keeps yours.';
check('both start at 0, filled in from the merit list', s.merits.crit_hit_rate == 0 and s.merits.enemy_crit_rate == 0
    and s.merits.fill_in == true);
local MERIT_ANSWERS = {
    { 'critmerits', 'crit_hit_rate', 'Your Critical Hit Rate merits are now %d. Crit counts as many as your main level '
        .. 'allows.', 'Your Critical Hit Rate merits are now 0.' },
    { 'enemycritmerits', 'enemy_crit_rate', 'Your Enemy Critical Hit Rate merits are now %d. Crit taken counts as many '
        .. 'as your main level allows.', 'Your Enemy Critical Hit Rate merits are now 0.' },
};
for _, entry in ipairs(MERIT_ANSWERS) do
    local sub, key, said_n, said_zero = unpack(entry);
    for _, value in ipairs({ 1, 4, 0 }) do
        local saves = MOCK.saved;
        said = run(('/checkmate %s %d'):format(sub, value));
        local want = (value == 0) and said_zero or said_n:format(value);
        check(('%s %d'):format(sub, value), s.merits[key] == value and MOCK.last_save.merits[key] == value
            and MOCK.saved == saves + 1 and said == '[checkmate] ' .. want .. HOLDS, said);
    end
    run(('/checkmate %s 2'):format(sub));
    for _, word in ipairs({ '5', '-1', '2.5', 'x', '' }) do
        local saves = MOCK.saved;
        said = run(('/checkmate %s %s'):format(sub, word));
        check(('%s "%s" refused'):format(sub, word), said == ('[checkmate] Type /checkmate %s <0-4>.'):format(sub)
            and s.merits[key] == 2 and MOCK.saved == saves, said);
    end
    run(('/checkmate %s 0'):format(sub));
end
said = run('/checkmate meritfill off');
expect('meritfill off', said, '[checkmate] Your crit merits now stay as you set them.');
check('and saves it', s.merits.fill_in == false and MOCK.last_save.merits.fill_in == false);
expect('with it off the answers don\'t say how long yours holds', run('/checkmate critmerits 3'), '[checkmate] Your '
    .. 'Critical Hit Rate merits are now 3. Crit counts as many as your main level allows.');
expect('meritfill on', run('/checkmate meritfill ON'), '[checkmate] Your crit merits now fill in from the merit list the '
    .. 'server sends when you zone, and one of them when you change that merit.');
expect('meritfill with another word', run('/checkmate meritfill maybe'), '[checkmate] Type /checkmate meritfill on|off.');
check('which changes nothing', s.merits.fill_in == true and s.merits.crit_hit_rate == 3);
run('/checkmate critmerits 0');

-- Crit only moves with Critical Hit Rate merits set. A level sync moves how many count.
you(75, 56, 80);
run('/checkmate show crit');
check('Crit on a Bounder at 74 with 80 DEX and no merits', has(bounder(74), 'Crit: 5%  Crit taken: 11%'), bounder(74));
run('/checkmate critmerits 4');
run('/checkmate enemycritmerits 4');
line = bounder(74);
check('with 4 of each, Crit is 9% and Crit taken 7%', has(line, 'Crit: 9%  Crit taken: 7%'), line);
MOCK.level_up(35);
line = bounder(74);
check('synced to 35, 3 of each count', has(line, 'Crit: 8%  Crit taken: 8%'), line);
MOCK.level_up(9);
line = bounder(74);
check('and at 9 none do', has(line, 'Crit: 5%  Crit taken: 11%'), line);
MOCK.level_up(75);
run('/checkmate critmerits 0');
run('/checkmate enemycritmerits 0');
run('/checkmate hide crit');

-- A hand-edited settings file is cleaned up.
MOCK.settings.switch_character({ merits = { crit_hit_rate = 9, enemy_crit_rate = -1 } });
check('a hand-edited 9 and -1 load as 4 and 0', cur().merits.crit_hit_rate == 4 and cur().merits.enemy_crit_rate == 0
    and cur().merits.fill_in == true);
MOCK.settings.switch_character({ merits = { crit_hit_rate = 'x', enemy_crit_rate = 2.6 } });
check('and x and 2.6 as 0 and 2', cur().merits.crit_hit_rate == 0 and cur().merits.enemy_crit_rate == 2);
MOCK.settings.switch_character(nil);
s = cur();
s.printout.divider = 'spaces';
run('/checkmate show crittaken');

-- The merit list. The server sends every merit when you zone, and one when you change a merit.
local function merit_list(entries)
    local saves = MOCK.saved;
    MOCK.packet(MOCK.merit_packet(entries));
    return MOCK.saved - saves;
end
local function merits() return s.merits.crit_hit_rate .. ' and ' .. s.merits.enemy_crit_rate; end
local saved = merit_list({ { 0x0040, 2 }, { 0x0144, 3 }, { 0x0146, 4 }, { 2564, 1 } });
check('the merit list fills both in and saves once', merits() == '3 and 4' and saved == 1
    and MOCK.last_save.merits.enemy_crit_rate == 4, merits() .. ', ' .. saved .. ' saves');
expect('and the next /check goes by them', said_of(bounder(74)), '7%');
check('the same list again saves nothing', merit_list({ { 0x0144, 3 }, { 0x0146, 4 } }) == 0);
check('a list without them leaves them', merit_list({ { 2564, 2 } }) == 0 and merits() == '3 and 4');
check('one merit changed in the Mog House changes only that one', merit_list({ { 0x0146, 2 } }) == 1
    and merits() == '3 and 2', merits());
check('a count over the most is kept at it', merit_list({ { 0x0146, 9 } }) == 1 and merits() == '3 and 4', merits());
-- One you set by hand holds until you zone or change that merit, which puts back what you have.
said = run('/checkmate enemycritmerits 1');
check('setting one by hand says how long it holds', said == '[checkmate] Your Enemy Critical Hit Rate merits are now 1. '
    .. 'Crit taken counts as many as your main level allows.' .. HOLDS, said);
expect('it counts until then', said_of(bounder(74)), '10%');
check('changing another merit leaves it', merit_list({ { 0x0144, 3 } }) == 0 and merit_list({ { 0x0040, 3 } }) == 0
    and merits() == '3 and 1', merits());
MOCK.zone_in(65);
merit_list({ { 0x0144, 3 }, { 0x0146, 4 } });
check('the next zone\'s list puts back what you have', merits() == '3 and 4', merits());
expect('so it\'s 7% again', said_of(bounder(74)), '7%');
-- With the switch off the list leaves yours alone.
run('/checkmate meritfill off');
run('/checkmate enemycritmerits 1');
check('with meritfill off the list changes nothing and saves nothing', merit_list({ { 0x0144, 0 }, { 0x0146, 0 } }) == 0
    and merits() == '3 and 1', merits());
run('/checkmate meritfill on');
check('turning it on fills nothing in until the next list', merits() == '3 and 1', merits());
merit_list({ { 0x0144, 0 }, { 0x0146, 0 } });
check('which does', merits() == '0 and 0', merits());

-- Profiles leave your merits and the switch out, since each character has its own. Reset puts them back.
local profiles = require('ui.profiles');
local json = require('json');
run('/checkmate critmerits 2');
run('/checkmate enemycritmerits 3');
run('/checkmate meritfill off');
run('/checkmate profile save Merits');
local f = assert(io.open(MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json', 'r'));
local file = f:read('*a');
f:close();
local held = json.decode(file).Merits;
check('a saved profile holds no merits and no switch', held ~= nil and held.merits == nil and not has(file, 'crit_hit_rate')
    and not has(file, 'fill_in'));
check('but it holds the part, its cutoffs and colors', held.printout.parts.crittaken.on == true
    and held.grades.crittaken_ok == 10 and held.colors.crittaken_label == 106);
run('/checkmate critmerits 4');
run('/checkmate enemycritmerits 4');
run('/checkmate meritfill on');
run('/checkmate profile load Merits');
s = cur();
check('loading it leaves yours', merits() == '4 and 4' and s.merits.fill_in == true and MOCK.last_save.merits.crit_hit_rate
    == 4, merits());
run('/checkmate joblink war Merits');
p.main_job = 4;
MOCK.zone_in(65);
MOCK.frame();
p.main_job = 1;
MOCK.zone_in(65);
local n = #MOCK.printed;
MOCK.frame();
check('and so does a job link loading it', has(table.concat(MOCK.printed_since(n), ' / '), 'the profile "Merits"')
    and merits() == '4 and 4' and s.merits.fill_in == true, merits());
run('/checkmate joblink war none');
profiles.delete(s, 'Merits');
run('/checkmate meritfill off');
said = run('/checkmate reset');
check('the first reset says it puts your merits back', has(said, 'your merits and the job links') and merits() == '4 and 4',
    said);
run('/checkmate reset');
s = cur();
check('and the second does, with the switch back on', merits() == '0 and 0' and s.merits.fill_in == true, merits());
s.printout.divider = 'spaces';

-- Help. The merit commands are under help numbers, and the main help leaves them out.
said = run('/checkmate help numbers');
check('help numbers has critmerits', has(said, '[checkmate] /checkmate critmerits <0-4>  sets your Critical Hit Rate '
    .. 'merits. Each one adds 1% to Crit, and under level 40 fewer of them count.'), said);
check('and enemycritmerits', has(said, '[checkmate] /checkmate enemycritmerits <0-4>  sets your Enemy Critical Hit Rate '
    .. 'merits. Each one takes 1% off Crit taken, and under level 40 fewer of them count.'), said);
check('and meritfill, which says what one you set does', has(said, '[checkmate] /checkmate meritfill on|off  fills both in '
    .. 'from the merit list the server sends when you zone, and one of them when you change that merit, or keeps the '
    .. 'numbers you set. With it on, one you set by hand holds until you zone or change that merit.'), said);
check('right after the cutoff line', has(said, 'Off-hand and ranged use the hit cutoffs. / [checkmate] /checkmate '
    .. 'critmerits '), said);
said = run('/checkmate help');
check('the main help leaves them out', not has(said, 'critmerits') and not has(said, 'meritfill'), said);

-- The sample ---------------------------------------------------------------------------------------

-- Its crit numbers go through your merits as a made-up you at its level 42, where all 4 count.
local function sample()
    local at = #MOCK.printed;
    MOCK.command('/checkmate sample');
    return table.concat(MOCK.printed_since(at), ' / ');
end
run('/checkmate hide crittaken');
run('/checkmate show crit');
expect('at 0 merits with the part off the sample keeps Crit at 7%', sample(), '[checkmate] Sample Goblin (Lv 42)  Decent '
    .. 'Challenge (Low Defense) / [checkmate] Crit: 7% / [checkmate] Aggro: Aggressive (Sight)  Links with Goblin family (Sight)');
run('/checkmate show crittaken');
check('with it on, 9%', has(sample(), '[checkmate] Crit: 7%  Crit taken: 9% / '), sample());
run('/checkmate critmerits 4');
run('/checkmate enemycritmerits 4');
check('and at 4 and 4, Crit 11% and Crit taken 5%', has(sample(), '[checkmate] Crit: 11%  Crit taken: 5% / '), sample());
local sample_line;
for i = #MOCK.printed, 1, -1 do
    if (has(MOCK.printed[i], 'Crit taken')) then sample_line = MOCK.printed[i]; break; end
end
check('where 5% is Good', ends(sample_line, color(106) .. 'Crit taken' .. color(106) .. ': ' .. color(2) .. '5%'),
    codes(sample_line));
run('/checkmate critmerits 0');
run('/checkmate enemycritmerits 0');

-- The window ---------------------------------------------------------------------------------------

local window = require('ui.settings_window');
window.folded = window.folded or {};
window.folded['Numbers/ADVANCED'] = true;
-- One frame with the mouse over every (?), so each one draws its tip. Returns the tips by path.
local function tips()
    MOCK.hover = true;
    local found = require('capture_row_tips')(function () MOCK.frame(); end);
    MOCK.hover = false;
    return found;
end
run('/checkmate hide crit');
run('/checkmate hide crittaken');
MOCK.target.slot0 = 0;
run('/checkmate');
MOCK.frame();
local N = 'Numbers/';
check('the Numbers tab has both merit sliders and the switch', MOCK.drew('CRITICAL HIT RATE')
    and MOCK.drew('ENEMY CRITICAL HIT RATE') and MOCK.gui.paths[N .. '##crit_merits'] == 'Slider'
    and MOCK.gui.paths[N .. '##enemy_crit_merits'] == 'Slider' and MOCK.gui.paths[N .. 'Fill both in when you zone']
    == 'Checkbox');
check('each slider counts merits', MOCK.gui.formats[N .. '##crit_merits'] == '%d merits'
    and MOCK.gui.formats[N .. '##enemy_crit_merits'] == '%d merits');
check('their row switches stay available while each part is off', not s.printout.parts.crit.on
    and not s.printout.parts.crittaken.on and MOCK.gui.paths[N .. 'crit/In chat'] == 'Checkbox'
    and MOCK.gui.paths[N .. 'crittaken/In chat'] == 'Checkbox');
check('and crit taken\'s cutoffs in a table of their own', MOCK.gui.tables['##cutoffs_lower'] == 3
    and MOCK.gui.paths[N .. '##crittaken_good'] == 'Slider' and MOCK.gui.paths[N .. '##crittaken_ok'] == 'Slider');
local tip = tips();
check('each slider\'s tip says which merits count from which level', has(tip[N .. '##crit_merits'], 'Each one adds 1% to '
    .. 'the Crit part. Phoenix allows 0 to 4. The server only counts as many as your main level allows: none under 10, 1 '
    .. 'from 10, 2 from 20, 3 from 30 and all 4 from 40.') and has(tip[N .. '##enemy_crit_merits'], 'Each one takes 1% '
    .. 'off the Crit taken part.'), tip[N .. '##crit_merits']);
check('the switch\'s tip says what one you drag does', has(tip[N .. 'Fill both in when you zone'], 'Sets both sliders '
    .. 'from the merit list the server sends when you zone, and one of them when you change that merit, so they match '
    .. 'what you have.') and has(tip[N .. 'Fill both in when you zone'], 'what you set holds until you zone or change '
    .. 'that merit. Turn this off to keep your own numbers.')
    and has(tip[N .. 'Fill both in when you zone'], 'Profiles don\'t keep your merits or this switch'),
    tip[N .. 'Fill both in when you zone']);
check('and the Profiles tab\'s tip leaves the switch out of a profile too', has(tip['Profiles/PROFILES'], 'every setting '
    .. 'except the job links, your merits, Fill both in when you zone, visible tabs, where this window'), tip['Profiles/PROFILES']);
check('crit taken\'s cutoffs go the other way', has(tip[N .. '##crittaken_ok'], 'It prints in the Good color at or below '
    .. 'the first cutoff'), tip[N .. '##crittaken_ok']);
check('and the part\'s own tip in the Printout tab', has(tip['Display/crittaken/##row_tip'], 'Lower is better, so its grade '
    .. 'colors go the other way.') and has(tip['Display/crittaken/##row_tip'], 'says "(TP moves)"'));
run('/checkmate show crittaken');
MOCK.frame();
check('the note goes once the part is on', not MOCK.drew('Enable Crit taken in Display'));
-- Dragging a slider tells the overlay it changed before it saves, and it saves once you let go.
local draw_settings, edited = window.draw, nil;
window.draw = function (...)
    local result = draw_settings(...);
    edited = result.edited;
    return result;
end
run('/checkmate overlay on');
run('/checkmate overlayshow crit');
run('/checkmate overlayshow crittaken');
local function overlay_text()
    MOCK.frame();
    return table.concat(MOCK.overlay_lines(), ' // ');
end
check('the overlay\'s sample goblin shows both', has(overlay_text(), 'Crit: 7% // Crit taken: 9%'), overlay_text());
local saves = MOCK.saved;
MOCK.slide[N .. '##enemy_crit_merits'] = 4;
MOCK.frame();
check('dragging Enemy Critical Hit Rate says it edited something, without saving', edited == true
    and s.merits.enemy_crit_rate == 4 and MOCK.saved == saves);
check('and the sample goblin follows it at once', has(overlay_text(), 'Crit taken: 5%'), overlay_text());
MOCK.deactivate = true;
MOCK.frame();
MOCK.deactivate = false;
check('it saves when let go', MOCK.saved == saves + 1 and MOCK.last_save.merits.enemy_crit_rate == 4);
MOCK.frame();
check('and it reads 4 merits', MOCK.gui.formats[N .. '##enemy_crit_merits'] == '%d merits');
MOCK.slide[N .. '##crit_merits'] = 1;
MOCK.frame();
MOCK.deactivate = true;
MOCK.frame();
MOCK.deactivate = false;
MOCK.frame();
check('Critical Hit Rate at 1 merit', s.merits.crit_hit_rate == 1 and MOCK.gui.formats[N .. '##crit_merits'] == '%d merit'
    and has(overlay_text(), 'Crit: 8%'), overlay_text());
saves = MOCK.saved;
MOCK.clicks[N .. 'Fill both in when you zone'] = true;
MOCK.frame();
check('the switch turns off and saves at once', s.merits.fill_in == false and MOCK.saved == saves + 1);
MOCK.clicks[N .. 'Fill both in when you zone'] = true;
MOCK.frame();
window.draw = draw_settings;
run('/checkmate');
run('/checkmate critmerits 0');
run('/checkmate enemycritmerits 0');

-- The overlay --------------------------------------------------------------------------------------

-- The overlay's Crit taken line, or "none".
local function overlay_taken()
    MOCK.frame();
    for _, each in ipairs(MOCK.overlay_lines()) do
        if (each:find('^Crit taken: ')) then return each; end
    end
    return 'none';
end
-- Targets nothing for a frame, then the monster at `index`, so the overlay works it out again.
local function retarget(index)
    MOCK.target.slot0 = 0;
    MOCK.frame();
    MOCK.target.slot0 = index;
    return overlay_taken();
end
run('/checkmate overlayhide crit');
you(75, 56);
wear();
MOCK.zone_in(65);
MOCK.target_monster(18, 'Mamool Ja Bounder');
expect('before a /check it goes over 73 to 75', overlay_taken(), 'Crit taken: 11-14%');
MOCK.packet(MOCK.check_packet(18, 74, 4, 174));
expect('and your /check makes it 11%', overlay_taken(), 'Crit taken: 11%');
-- Like crit and magic, it goes stale while the monster stays targeted.
wear({ [NECK] = VAN });
expect('putting on a Van Pendant leaves it as it was', overlay_taken(), 'Crit taken: 11%');
expect('until you target it again', retarget(18), 'Crit taken: 10%');
wear({ [BACK] = MANTLE });
MOCK.level_up(50);
expect('a level change works it out again, with the pendant off and the mantle under its level', overlay_taken(),
    'Crit taken: 11%');
MOCK.level_up(75);
expect('and back at 75 the mantle counts', overlay_taken(), 'Crit taken: 9%');
wear();
-- With Crit, Crit taken and Magic off it reads none of your stats or gear.
local read, stat_reads = player.read, 0;
player.read = function (...)
    stat_reads = stat_reads + 1;
    return read(...);
end
player.equipped_items = function (...)
    gear_reads = gear_reads + 1;
    return equipped_items(...);
end
run('/checkmate overlayhide crittaken');
stat_reads, gear_reads = 0, 0;
retarget(18);
check('with Crit, Crit taken and Magic off it reads none of your stats or gear', stat_reads == 0 and gear_reads == 0,
    stat_reads .. ' ' .. gear_reads);
run('/checkmate overlayshow crittaken');
stat_reads, gear_reads = 0, 0;
retarget(18);
check('with Crit taken on it reads them once when it works it out', stat_reads == 1 and gear_reads == 1,
    stat_reads .. ' ' .. gear_reads);
stat_reads, gear_reads = 0, 0;
for _ = 1, 60 do MOCK.frame(); end
check('and never on a quiet frame', stat_reads == 0 and gear_reads == 0, stat_reads .. ' ' .. gear_reads);
player.read, player.equipped_items = read, equipped_items;
-- Fixture Goblin's DEX is 44 to 46 at 38 to 40, so 13 to 15 over 31 AGI.
addon.path = FIXTURES_PATH;
you(75, 31);
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
expect('Fixture Goblin before a /check', overlay_taken(), 'Crit taken: 6-7%');
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
expect('and at 39', overlay_taken(), 'Crit taken: 7%');
addon.path = ADDON_PATH;
-- The overlay says the same as chat for a monster that never swings and one that counters.
you(75, 56);
MOCK.zone_in(18);
MOCK.target_monster(28, 'Memory Receptacle');
expect('a Memory Receptacle in the overlay', overlay_taken(), 'Crit taken: (no swings)');
MOCK.zone_in(39);
MOCK.target_monster(44, 'Nantina');
expect('and a Nantina', overlay_taken(), 'Crit taken: 20% (TP moves)');

return MOCK.report();
