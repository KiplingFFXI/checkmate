-- Tests the chat lines a /check prints. That covers part order, new lines, labels, dividers, colors
-- down to the bytes that print, grades and number styles. It also covers the difficulty and the
-- evasion and defense reading, the level range, the lines that wait for hit and evade, the plain
-- /check line with the game's line hidden, and settings files with missing or broken settings.
local printout = require('core.printout');
local defaults = require('ui.defaults');

local function color(code) return '\30' .. string.char(code); end

-- Every part on and on the first line, with two spaces between parts, unless a test says otherwise.
local function settings()
    local s = defaults.make();
    s.printout.divider = 'spaces';
    for _, part in pairs(s.printout.parts) do
        part.on = true;
        part.new_line = false;
    end
    s.printout.extras_own_line = false;
    return s;
end

local function result()
    return {
        name   = 'Goblin Tinkerer',
        low    = 42,
        high   = 42,
        hit    = { low = 64, high = 72 },
        evade  = { low = 31, high = 31 },
        signet = true,
        crit   = { low = 7, high = 7 },
        magic  = {
            { label = 'Elemental', low = 88, high = 88, element = 'Ice' },
            { label = 'Enfeebling', low = 81, high = 81 },
            { label = 'Dark', word = 'immune' },
        },
        immune = { 'gravity', 'bind', 'dark_sleep' },
        drops  = {
            th = 2, more = 2, scripted = false, exp_only = false,
            items = { { name = 'Goblin Mail', chance = 15 }, { name = 'Goblin Helm', chance = 15 },
                { name = 'Beastman Blood', chance = 7 } },
        },
    };
end

local function plain_lines(s, r)
    local lines = {};
    for i, line in ipairs(printout.lines(s, r)) do lines[i] = MOCK.plain(line); end
    return lines;
end

-- Everything on one line, in the default order.
local s = settings();
local lines = plain_lines(s, result());
check('one line with every part', #lines == 1, #lines);
check('name and level first, then the default order', lines[1] == 'Goblin Tinkerer (Lv 42)  Hit: 64-72%  Evade: 31% with Signet'
    .. '  Crit: 7%  Magic: Elemental 88% (Ice)  Enfeebling 81%  Dark immune  Immune: Sleep, Bind, Gravity'
    .. '  Drops (TH 2): Goblin Mail 15%, Goblin Helm 15%, Beastman Blood 7.0%  +2 more', lines[1]);

-- The default new lines put magic, immunities and drops on their own lines, and the extras start
-- below the /check parts.
s = defaults.make();
s.printout.divider = 'spaces';
for _, part in pairs(s.printout.parts) do part.on = true; end
local r = result();
r.con, r.reading, r.defense = 3, 0, 2;
lines = plain_lines(s, r);
check('the extras go on their own line by default', s.printout.extras_own_line == true);
check('default new lines give five lines', #lines == 5, #lines);
check('line 1 is the /check', lines[1] == 'Goblin Tinkerer (Lv 42)  Decent Challenge (High Evasion, Low Defense)', lines[1]);
check('line 2 is hit, evade and crit', lines[2] == 'Hit: 64-72%  Evade: 31% with Signet  Crit: 7%', lines[2]);
check('line 3 is magic', lines[3] == 'Magic: Elemental 88% (Ice)  Enfeebling 81%  Dark immune', lines[3]);
check('line 4 lists immunities in the display order', lines[4] == 'Immune: Sleep, Bind, Gravity', lines[4]);
check('line 5 is drops', lines[5] == 'Drops (TH 2): Goblin Mail 15%, Goblin Helm 15%, Beastman Blood 7.0%  +2 more', lines[5]);
s.printout.extras_own_line = false;
lines = plain_lines(s, r);
check('with the extras on the same line, four lines', #lines == 4, #lines);
check('hit, evade and crit carry on along the /check line', lines[1] == 'Goblin Tinkerer (Lv 42)  Decent Challenge '
    .. '(High Evasion, Low Defense)  Hit: 64-72%  Evade: 31% with Signet  Crit: 7%', lines[1]);
check('and magic still starts its own line', lines[2] == 'Magic: Elemental 88% (Ice)  Enfeebling 81%  Dark immune', lines[2]);

-- Order, and the name staying first.
s = settings();
s.printout.order = 'drops crit hit';
lines = plain_lines(s, result());
check('order is followed, missing parts go in after the part before them', lines[1]:find('^Goblin Tinkerer %(Lv 42%)  Drops %(TH 2%).-'
    .. '  Crit: 7%%  Magic.-  Hit: 64%-72%%  Evade: 31%% with Signet$') ~= nil, lines[1]);
s.printout.order = 'name hit';
lines = plain_lines(s, result());
check('name in the order string changes nothing', lines[1]:find('^Goblin Tinkerer %(Lv 42%)  Hit') ~= nil
    and select(2, lines[1]:gsub('Goblin Tinkerer', '')) == 1, lines[1]);

-- New lines, and a part that is off.
s = settings();
s.printout.parts.crit.new_line = true;
s.printout.parts.evade.on = false;
lines = plain_lines(s, result());
check('new line before crit', #lines == 2 and lines[1] == 'Goblin Tinkerer (Lv 42)  Hit: 64-72%'
    and lines[2]:find('^Crit: 7%%  Magic') ~= nil, table.concat(lines, ' / '));
s.printout.parts.name.on = false;
s.printout.parts.hit.new_line = true;
lines = plain_lines(s, result());
check('a new line on the first part shown makes no empty line', lines[1] == 'Hit: 64-72%', lines[1]);

-- Level text.
s = settings();
r = result();
r.low, r.high = 38, 40;
check('a level range', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv 38%-40%)') ~= nil);
r.low, r.high = nil, nil;
check('no level', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv %?%)') ~= nil);
s.printout.show_level = false;
check('show level off', plain_lines(s, result())[1]:find('^Goblin Tinkerer  Hit') ~= nil);

-- The level range after a known level. The spawn's range around the level rides in range_low and
-- range_high, and it's nil for a level outside that range (test_levels.lua).
local function level_line(show_range, low, high, range_low, range_high, word)
    local c = settings();
    c.printout.show_range = show_range;
    c.printout.range_word = word or 'range';
    local l = result();
    l.low, l.high, l.range_low, l.range_high = low, high, range_low, range_high;
    return (plain_lines(c, l)[1]:match('^Goblin Tinkerer ?(.-)  Hit'));
end
check('the level range is off by default, with the word range', defaults.make().printout.show_range == false
    and defaults.make().printout.range_word == 'range' and level_line(false, 42, 42, 40, 44) == '(Lv 42)');
expect('on, the exact level and its range', level_line(true, 42, 42, 40, 44), '(Lv 42, range 40-44)');
expect('a monster that spawns at one level shows just its level', level_line(true, 42, 42, 42, 42), '(Lv 42)');
expect('no data row shows just the level', level_line(true, 42, 42, nil, nil), '(Lv 42)');
expect('an unknown exact level shows the range alone', level_line(true, 40, 44, 40, 44), '(Lv 40-44)');
expect('and nothing known is still Lv ?', level_line(true, nil, nil, nil, nil), '(Lv ?)');
expect('a level outside its range gets no range, so it shows alone', level_line(true, 60, 60, nil, nil), '(Lv 60)');
expect('your own word', level_line(true, 42, 42, 40, 44, 'spawns'), '(Lv 42, spawns 40-44)');
expect('the word keeps printable ASCII only, trimmed', level_line(true, 42, 42, 40, 44, '  Lv\226\128\148s\9 '),
    '(Lv 42, Lvs 40-44)');
check('a cleared word prints the numbers alone', level_line(true, 42, 42, 40, 44, '') == '(Lv 42, 40-44)'
    and level_line(true, 42, 42, 40, 44, '   ') == '(Lv 42, 40-44)', level_line(true, 42, 42, 40, 44, ''));
s = settings();
s.printout.show_range = true;
s.printout.show_level = false;
r = result();
r.range_low, r.range_high = 40, 44;
check('Show level off hides the range too', plain_lines(s, r)[1]:find('^Goblin Tinkerer  Hit') ~= nil, plain_lines(s, r)[1]);
s.printout.show_level = true;
s.colors.level, s.colors.level_range = 7, 73;
check('the range and its word in the range color, the rest in the level color', printout.lines(s, r)[1]:find(color(8)
    .. 'Goblin Tinkerer' .. color(7) .. ' (Lv 42, ' .. color(73) .. 'range 40-44' .. color(7) .. ')', 1, true) ~= nil,
    MOCK.plain(printout.lines(s, r)[1]));
s = settings();
s.printout.show_range = true;
check('the range color is the level color by default', s.colors.level_range == s.colors.level
    and printout.lines(s, r)[1]:find(color(8) .. ' (Lv 42, ' .. color(8) .. 'range 40-44' .. color(8) .. ')', 1, true) ~= nil,
    MOCK.plain(printout.lines(s, r)[1]));

-- Number styles, unknown numbers and the scripted mark.
s = settings();
s.printout.number_style = 'midpoint';
check('midpoint style', plain_lines(s, result())[1]:find('Hit: ~68%', 1, true) ~= nil);
r = result();
r.hit = nil;
r.scripted = true;
lines = plain_lines(s, r);
check('unknown hit', lines[1]:find('Hit: unknown  Evade: 31%? with Signet  Crit: 7%?', 1, true) ~= nil, lines[1]);
check('scripted marks magic too', lines[1]:find('Elemental 88%? (Ice)', 1, true) ~= nil, lines[1]);
r.signet = false;
check('no Signet', plain_lines(s, r)[1]:find('Evade: 31%?  Crit', 1, true) ~= nil);

-- Labels that are empty, renamed or need cleaning.
s = settings();
s.printout.parts.hit.label = '';
s.printout.parts.evade.label = 'Ev\195\169\226\128\148!';
s.drops.th_in_label = false;
lines = plain_lines(s, result());
check('an empty label leaves the number', lines[1]:find('(Lv 42)  64-72%  Ev!: 31%', 1, true) ~= nil, lines[1]);
check('TH left out of the label', lines[1]:find('  Drops: Goblin Mail', 1, true) ~= nil, lines[1]);
s.printout.divider = 'custom';
s.printout.separator = ' |\226\128\162 ';
lines = plain_lines(s, result());
check('a custom divider keeps printable ASCII only', lines[1]:find('(Lv 42) | 64-72% | Ev!: 31%', 1, true) ~= nil, lines[1]);
r = result();
r.name = 'Goblin\226\128\153s Pet';
check('the name is cleaned too', plain_lines(settings(), r)[1]:find('^Goblins Pet') ~= nil);
local raw = table.concat(printout.lines(s, result()), '');
check('every byte is a color code or printable ASCII', not raw:gsub('\30.', ''):find('[^\32-\126]'));

-- Colors. Each line starts in the line color, labels are in the part's color and numbers in grade colors.
s = settings();
local line = printout.lines(s, result())[1];
check('a line starts in the line color', line:sub(1, 2) == color(106));
check('the name is in its color', line:find(color(8) .. 'Goblin Tinkerer', 1, true) ~= nil);
check('hit 64-72 grades bad by its middle', line:find(color(106) .. 'Hit' .. color(106) .. ': ' .. color(68) .. '64-72%'
    .. color(106), 1, true) ~= nil);
check('evade 31 grades good', line:find('Evade' .. color(106) .. ': ' .. color(2) .. '31%' .. color(106) .. ' with Signet', 1, true)
    ~= nil);
check('crit 7 grades bad', line:find('Crit' .. color(106) .. ': ' .. color(68) .. '7%', 1, true) ~= nil);
s.grades.hit_ok = 68;
check('the ok cutoff is at or above', printout.lines(s, result())[1]:find(color(104) .. '64-72%', 1, true) ~= nil);
s.grades.on = false;
check('grades off paints no numbers', not printout.lines(s, result())[1]:find(color(68), 1, true));
s = settings();
s.colors.hit_label = 10;
s.colors.line = 13;
s.colors.name = 0;
line = printout.lines(s, result())[1];
check('colors 0, 10 and 13 never print', not line:find('\30[%z\10\13]'));
check('they fall back to cream', line:sub(1, 2) == color(106) and line:find(color(106) .. 'Goblin', 1, true) ~= nil);
local offered = {};
for _, entry in ipairs(printout.PALETTE) do offered[entry.code] = true; end
check('the palette has no 0, 10 or 13', not offered[0] and not offered[10] and not offered[13]);

-- Immunities.
s = settings();
s.immunities.bind.on = false;
s.immunities.gravity.label = 'Grav';
check('immunities off and renamed', plain_lines(s, result())[1]:find('Immune: Sleep, Grav  Drops', 1, true) ~= nil);
r = result();
r.immune = {};
check('no immunities leaves the part out', not plain_lines(s, r)[1]:find('Immune', 1, true));
r.immune = { 'bind' };
check('only turned-off immunities leaves it out', not plain_lines(s, r)[1]:find('Immune', 1, true));

-- Drops. The name is off to test one part alone, and the game's line shows, so an empty printout
-- stays empty. The plain /check line tests below cover it hidden.
s = defaults.make();
s.printout.divider = 'spaces';
s.printout.parts.drops.on = true;
s.printout.parts.name.on = false;
s.printout.replace_game_line = false;
local function drop_line(items, more, scripted, exp_only)
    local d = { name = 'x', drops = { th = 0, items = items, more = more or 0, scripted = scripted, exp_only = exp_only } };
    return plain_lines(s, d)[1];
end
expect('chances under 10% keep one decimal', drop_line({ { name = 'A', chance = 0.5 }, { name = 'B', chance = 9.94 } }),
    'Drops (TH 0): A 0.5%, B 9.9%');
expect('10% and up are whole', drop_line({ { name = 'A', chance = 9.96 }, { name = 'B', chance = 23.5 } }),
    'Drops (TH 0): A 10%, B 24%');
check('notes', drop_line({ { name = 'A', chance = 50 } }, 0, true, true)
    == 'Drops (TH 0): A 50% (plus scripted drops) (only drops if you get EXP)');
expect('notes on their own', drop_line({}, 0, false, true), 'Drops (TH 0): (only drops if you get EXP)');
s.drops.notes = false;
check('notes off', drop_line({ { name = 'A', chance = 50 } }, 0, true, true) == 'Drops (TH 0): A 50%');
check('notes off with nothing else leaves the part out', drop_line({}, 0, false, true) == nil);

-- Can't be gauged. With the game's line hidden, the name and Impossible to Gauge come first.
local CANT_GAUGE = 'Mystery Mob can\'t be gauged. Widescan it first for its numbers.';
lines = plain_lines(settings(), { name = 'Mystery Mob', cant_gauge = true, impossible = true });
check('can\'t be gauged with the game\'s line hidden', #lines == 2 and lines[1] == 'Mystery Mob (Lv ?)  Impossible to Gauge'
    and lines[2] == CANT_GAUGE, table.concat(lines, ' / '));
s = settings();
s.printout.replace_game_line = false;
lines = plain_lines(s, { name = 'Mystery Mob', cant_gauge = true, impossible = true });
check('with the game\'s line shown, can\'t be gauged is one line', #lines == 1 and lines[1] == CANT_GAUGE, lines[1]);

-- The plain /check line. With the game's line hidden, a printout with nothing to say still prints
-- the name with its level, the difficulty and the reading, in their colors and labels.
s = defaults.make();
s.printout.divider = 'spaces';
for _, part in pairs(s.printout.parts) do part.on = false; end
r = { name = 'Goblin Tinkerer', low = 42, high = 42, con = 3, reading = 0, defense = 1 };
lines = plain_lines(s, r);
check('every part off prints the plain /check line', #lines == 1
    and lines[1] == 'Goblin Tinkerer (Lv 42)  Decent Challenge (High Evasion)', lines[1]);
s.printout.show_level = false;
expect('with its level even when Show level is off', plain_lines(s, r)[1], lines[1]);
check('in the name, level and con colors', printout.lines(s, r)[1]:find(color(8) .. 'Goblin Tinkerer' .. color(8) .. ' (Lv 42)',
    1, true) ~= nil and printout.lines(s, r)[1]:find(color(102) .. 'Decent Challenge', 1, true) ~= nil);
s.printout.parts.reading.on = true;
r.reading = 1;
expect('a part that is on with nothing to say still gets the plain line', plain_lines(s, r)[1],
    'Goblin Tinkerer (Lv 42)  Decent Challenge');
s.printout.parts.difficulty.on = true;
expect('a part with something to say prints only that', plain_lines(s, r)[1], 'Decent Challenge');
s.printout.parts.difficulty.on = false;
s.printout.parts.reading.on = false;
local no_con = { name = 'Goblin Tinkerer', low = 42, high = 42, reading = 0, defense = 1 };
expect('with no con the plain line puts the reading after the name', plain_lines(s, no_con)[1],
    'Goblin Tinkerer (Lv 42) (High Evasion)');
s.printout.parts.reading.on = true;
s.printout.replace_game_line = false;
check('with the game\'s line shown, nothing prints', #plain_lines(s, r) == 0);

-- The plain /check line and can't be gauged with the level range on.
s = defaults.make();
s.printout.divider = 'spaces';
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.show_range = true;
r = { name = 'Goblin Tinkerer', low = 42, high = 42, range_low = 40, range_high = 44, con = 3, reading = 0, defense = 1 };
expect('the plain /check line shows the range', plain_lines(s, r)[1],
    'Goblin Tinkerer (Lv 42, range 40-44)  Decent Challenge (High Evasion)');
s.printout.show_level = false;
expect('and its level alone with Show level off', plain_lines(s, r)[1],
    'Goblin Tinkerer (Lv 42)  Decent Challenge (High Evasion)');
s = settings();
s.printout.show_range = true;
lines = plain_lines(s, { name = 'Mystery Mob', cant_gauge = true, impossible = true });
check('can\'t be gauged is the same with the range on', #lines == 2 and lines[1] == 'Mystery Mob (Lv ?)  Impossible to Gauge'
    and lines[2] == CANT_GAUGE, table.concat(lines, ' / '));

-- The second number printout.lines returns is the first line holding hit or evade. The table after it
-- is true at every line holding them, listed here as their numbers in order.
local function holding_lines()
    local _, _, holding = printout.lines(s, result());
    local numbers = {};
    for at in pairs(holding) do numbers[#numbers + 1] = at; end
    table.sort(numbers);
    return table.concat(numbers, ' ');
end
s = defaults.make();
for _, part in pairs(s.printout.parts) do part.on = true; end
local _, waits_at = printout.lines(s, result());
check('the default layout waits from line 2', waits_at == 2, waits_at);
expect('and only line 2 holds hit or evade', holding_lines(), '2');
s.printout.extras_own_line = false;
_, waits_at = printout.lines(s, result());
check('the extras on the /check line wait from line 1', waits_at == 1, waits_at);
expect('and only line 1 holds them', holding_lines(), '1');
s.printout.extras_own_line = true;
s.printout.order = 'difficulty drops magic immunities hit evade crit';
s.printout.parts.hit.new_line = true;
_, waits_at = printout.lines(s, result());
check('drops, magic and immunities moved above hit print first', waits_at == 5, waits_at);
s.printout.order = 'difficulty hit crit magic evade immunities drops';
s.printout.parts.hit.new_line = false;
s.printout.parts.evade.new_line = true;
expect('evade on its own line under magic holds them too', holding_lines(), '2 4');
s.printout.order = 'difficulty drops magic immunities hit evade crit';
s.printout.parts.hit.new_line = true;
s.printout.parts.evade.new_line = false;
s.printout.parts.hit.on = false;
_, waits_at = printout.lines(s, result());
check('evade alone waits too, from the Immune line it joins', waits_at == 4, waits_at);
s.printout.parts.evade.on = false;
_, waits_at = printout.lines(s, result());
check('nothing waits with both off', waits_at == nil, waits_at);
expect('and no line holds them', holding_lines(), '');

-- Difficulty and the evasion and defense reading ---------------------------------------------------

-- Every con with its word and default color. They're checker's colors, with cream for Incredibly Easy Prey.
local CONS = {
    [0] = { 'Too Weak', 67 }, { 'Incredibly Easy Prey', 106 }, { 'Easy Prey', 2 }, { 'Decent Challenge', 102 },
    { 'Even Match', 8 }, { 'Tough', 68 }, { 'Very Tough', 76 }, { 'Incredibly Tough', 76 },
};
s = defaults.make();
s.printout.parts.name.on = false;
s.printout.replace_game_line = false;
check('difficulty and reading are on by default, the difficulty right after the name', s.printout.parts.difficulty.on
    and s.printout.parts.reading.on and s.printout.con_colors and printout.DEFAULT_ORDER:find('^difficulty hit ') ~= nil);
check('the reading isn\'t a part you move', not printout.DEFAULT_ORDER:find('reading', 1, true));
for con = 0, 7 do
    local word, code = CONS[con][1], CONS[con][2];
    local got = printout.lines(s, { name = 'x', con = con })[1];
    check(('con %d is %s in color %d'):format(con, word, code), got == color(106) .. color(code) .. word, got and MOCK.plain(got));
end
local got = printout.lines(s, { name = 'x', impossible = true })[1];
check('impossible to gauge in magenta', got == color(106) .. color(5) .. 'Impossible to Gauge', got and MOCK.plain(got));
s.printout.con_colors = false;
s.colors.difficulty = 69;
local plain_colors = true;
for con = 0, 7 do
    plain_colors = plain_colors and printout.lines(s, { name = 'x', con = con })[1] == color(106) .. color(69) .. CONS[con][1];
end
check('Color by difficulty off uses the one difficulty color for every con', plain_colors);
check('and for impossible to gauge', printout.lines(s, { name = 'x', impossible = true })[1]
    == color(106) .. color(69) .. 'Impossible to Gauge');
check('no con and not impossible leaves difficulty out', #printout.lines(s, { name = 'x' }) == 0);

-- The nine readings, evasion first, by evasion row and defense column. Normal says nothing.
local READINGS = {
    [0] = { [0] = 'High Evasion, High Defense', 'High Evasion', 'High Evasion, Low Defense' },
    [1] = { [0] = 'High Defense', false, 'Low Defense' },
    [2] = { [0] = 'Low Evasion, High Defense', 'Low Evasion', 'Low Evasion, Low Defense' },
};
s = defaults.make();
s.printout.parts.name.on = false;
s.printout.parts.difficulty.on = false;
s.printout.replace_game_line = false;
for evasion = 0, 2 do
    for defense = 0, 2 do
        local want = READINGS[evasion][defense];
        lines = plain_lines(s, { name = 'x', reading = evasion, defense = defense });
        check(('reading %d %d is %s'):format(evasion, defense, want or 'left out'), lines[1] == (want and ('(' .. want .. ')') or nil),
            lines[1]);
    end
end
check('no reading when it can\'t be gauged', #plain_lines(s, { name = 'x', impossible = true }) == 0);

-- Defense first swaps the two words and leaves one word alone.
s.printout.defense_first = true;
check('defense first', plain_lines(s, { name = 'x', reading = 0, defense = 0 })[1] == '(High Defense, High Evasion)'
    and plain_lines(s, { name = 'x', reading = 2, defense = 0 })[1] == '(High Defense, Low Evasion)'
    and plain_lines(s, { name = 'x', reading = 0, defense = 1 })[1] == '(High Evasion)'
    and plain_lines(s, { name = 'x', reading = 1, defense = 2 })[1] == '(Low Defense)');

-- The reading in parentheses ----------------------------------------------------------------------

-- It follows the difficulty with one space, never a divider, even between other parts and with a label.
s = settings();
s.printout.divider = 'pipe';
r = result();
r.con, r.reading, r.defense = 6, 0, 0;
lines = plain_lines(s, r);
check('after the difficulty in parentheses', lines[1]:find('^Goblin Tinkerer %(Lv 42%) | Very Tough %(High Evasion, High '
    .. 'Defense%) | Hit: 64%-72%%') ~= nil, lines[1]);
s.printout.defense_first = true;
check('defense first puts defense before evasion', plain_lines(s, r)[1]:find('| Very Tough (High Defense, High Evasion) |', 1, true)
    ~= nil, plain_lines(s, r)[1]);
s.printout.defense_first = false;
s.printout.parts.difficulty.label = 'Con';
check('with a difficulty label', plain_lines(s, r)[1]:find('| Con: Very Tough (High Evasion, High Defense) |', 1, true) ~= nil,
    plain_lines(s, r)[1]);
s.printout.parts.difficulty.label = '';
s.printout.order = 'hit crit difficulty evade magic immunities drops';
check('it moves with the difficulty', plain_lines(s, r)[1]:find('| Crit: 7% | Very Tough (High Evasion, High Defense) | Evade',
    1, true) ~= nil, plain_lines(s, r)[1]);
s.printout.order = printout.DEFAULT_ORDER;

-- With the difficulty off or empty it follows the name, level and all.
s.printout.parts.difficulty.on = false;
check('after the name with the difficulty off', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv 42%) %(High Evasion, High '
    .. 'Defense%) | Hit') ~= nil, plain_lines(s, r)[1]);
s.printout.parts.difficulty.on = true;
r.con = nil;
check('after the name when the difficulty has nothing to say', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv 42%) '
    .. '%(High Evasion, High Defense%) | Hit') ~= nil, plain_lines(s, r)[1]);
s.printout.show_level = false;
check('and straight after the name with Show level off', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(High Evasion, High '
    .. 'Defense%) | Hit') ~= nil, plain_lines(s, r)[1]);
s.printout.show_level = true;
r.con = 6;

-- With neither it stands where the name goes. Off, it's left out.
s.printout.parts.name.on = false;
s.printout.parts.difficulty.on = false;
check('alone when the name and difficulty are off', plain_lines(s, r)[1]:find('^%(High Evasion, High Defense%) | Hit') ~= nil,
    plain_lines(s, r)[1]);
s.printout.parts.name.on = true;
s.printout.parts.difficulty.on = true;
s.printout.parts.reading.on = false;
check('the reading off leaves it out', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv 42%) | Very Tough | Hit') ~= nil,
    plain_lines(s, r)[1]);
s.printout.parts.reading.on = true;
r.reading, r.defense = 1, 1;
check('both normal leaves it out', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv 42%) | Very Tough | Hit') ~= nil,
    plain_lines(s, r)[1]);
r.reading, r.defense, r.con, r.impossible = nil, nil, nil, true;
check('impossible to gauge has no reading', plain_lines(s, r)[1]:find('^Goblin Tinkerer %(Lv 42%) | Impossible to Gauge | Hit')
    ~= nil, plain_lines(s, r)[1]);

-- A new line on the difficulty takes the reading along.
r = result();
r.con, r.reading, r.defense = 3, 0, 2;
s = settings();
s.printout.parts.difficulty.label = 'Con';
s.printout.parts.difficulty.new_line = true;
lines = plain_lines(s, r);
check('a difficulty label and a new line before it', lines[1] == 'Goblin Tinkerer (Lv 42)'
    and lines[2]:find('^Con: Decent Challenge %(High Evasion, Low Defense%)  Hit') ~= nil, table.concat(lines, ' / '));

-- The extras on their own line --------------------------------------------------------------------

-- A /check with a con and a reading, so every check part has something to say.
local function checked()
    local c = result();
    c.con, c.reading, c.defense = 3, 0, 2;
    return c;
end
local CHECK_LINE = 'Goblin Tinkerer (Lv 42)  Decent Challenge (High Evasion, Low Defense)';

s = settings();
s.printout.extras_own_line = true;
lines = plain_lines(s, checked());
check('on, the extras start one line below the /check', #lines == 2 and lines[1] == CHECK_LINE
    and lines[2]:find('^Hit: 64%-72%%  Evade: 31%% with Signet  Crit: 7%%  Magic: .-  Drops %(TH 2%)') ~= nil,
    table.concat(lines, ' / '));

-- An extra moved between the check parts gets a line of its own, so no line mixes the two kinds. The
-- reading rides on the difficulty.
s.printout.order = 'hit difficulty evade crit magic immunities drops';
lines = plain_lines(s, checked());
check('an extra between the check parts', #lines == 4 and lines[1] == 'Goblin Tinkerer (Lv 42)'
    and lines[2] == 'Hit: 64-72%' and lines[3] == 'Decent Challenge (High Evasion, Low Defense)'
    and lines[4]:find('^Evade: 31%% with Signet  Crit: 7%%') ~= nil, table.concat(lines, ' / '));
s.printout.extras_own_line = false;
lines = plain_lines(s, checked());
check('off, the same order is one line', #lines == 1 and lines[1]:find('^Goblin Tinkerer %(Lv 42%)  Hit: 64%-72%%  '
    .. 'Decent Challenge %(High Evasion, Low Defense%)  Evade: 31%%') ~= nil, lines[1]);

-- With the difficulty off the reading stays on the name's line, and alone it's a check part too.
s = settings();
s.printout.extras_own_line = true;
s.printout.parts.difficulty.on = false;
lines = plain_lines(s, checked());
check('the reading after the name keeps the /check line', #lines == 2
    and lines[1] == 'Goblin Tinkerer (Lv 42) (High Evasion, Low Defense)' and lines[2]:find('^Hit: 64%-72%%') ~= nil,
    table.concat(lines, ' / '));
s.printout.parts.name.on = false;
lines = plain_lines(s, checked());
check('the reading alone is a line of its own', #lines == 2 and lines[1] == '(High Evasion, Low Defense)'
    and lines[2]:find('^Hit: 64%-72%%') ~= nil, table.concat(lines, ' / '));

-- Each part's New line box works the same with the extras on the same line or their own.
s = settings();
s.printout.parts.crit.new_line = true;
lines = plain_lines(s, checked());
check('off, New line on crit makes two lines', #lines == 2 and lines[1] == CHECK_LINE .. '  Hit: 64-72%  Evade: 31% with Signet'
    and lines[2]:find('^Crit: 7%%  Magic') ~= nil, table.concat(lines, ' / '));
s.printout.extras_own_line = true;
lines = plain_lines(s, checked());
check('on, New line on crit makes three lines', #lines == 3 and lines[1] == CHECK_LINE
    and lines[2] == 'Hit: 64-72%  Evade: 31% with Signet' and lines[3]:find('^Crit: 7%%  Magic') ~= nil, table.concat(lines, ' / '));
s.printout.parts.crit.new_line = false;
s.printout.parts.hit.new_line = true;
lines = plain_lines(s, checked());
check('New line on the first extra with the switch on breaks once', #lines == 2 and lines[1] == CHECK_LINE
    and lines[2]:find('^Hit: 64%-72%%  Evade') ~= nil, table.concat(lines, ' / '));

-- Only one side printing never makes an empty line.
s = settings();
s.printout.extras_own_line = true;
for _, id in ipairs({ 'hit', 'evade', 'crit', 'magic', 'immunities', 'drops' }) do s.printout.parts[id].on = false; end
lines = plain_lines(s, checked());
check('only the check parts make one line', #lines == 1 and lines[1] == CHECK_LINE, table.concat(lines, ' / '));
s = settings();
s.printout.extras_own_line = true;
for _, id in ipairs({ 'name', 'difficulty', 'reading' }) do s.printout.parts[id].on = false; end
lines = plain_lines(s, checked());
check('only the extras, with the name hidden, start on the first line', #lines == 1
    and lines[1]:find('^Hit: 64%-72%%  Evade') ~= nil, table.concat(lines, ' / '));
s = settings();
s.printout.extras_own_line = true;
s.printout.parts.name.on = false;
lines = plain_lines(s, result());
check('check parts with nothing to say make no line either', #lines == 1 and lines[1]:find('^Hit: 64%-72%%') ~= nil,
    table.concat(lines, ' / '));

-- The order string.
expect('clean_order keeps known parts once, in order, and puts each missing one after the part before it',
    printout.clean_order('drops crit bogus crit'), 'difficulty hit evade drops crit aggro magic immunities elements');
check('clean_order of nothing is the default', printout.clean_order(nil) == printout.DEFAULT_ORDER
    and printout.clean_order('') == printout.DEFAULT_ORDER);
check('clean_order drops name', printout.clean_order('name hit') == printout.DEFAULT_ORDER);
check('an order missing difficulty gets it first', printout.clean_order('hit evade crit magic immunities drops')
    == printout.DEFAULT_ORDER and printout.clean_order('drops magic hit evade crit immunities')
    == 'difficulty drops magic hit evade crit aggro immunities elements',
    printout.clean_order('drops magic hit evade crit immunities'));
check('an order missing aggro gets it after crit', printout.clean_order('difficulty hit evade crit magic immunities drops')
    == printout.DEFAULT_ORDER and printout.DEFAULT_ORDER == 'difficulty hit evade crit aggro magic immunities elements drops'
    and printout.clean_order('difficulty drops hit evade crit magic immunities')
    == 'difficulty drops hit evade crit aggro magic immunities elements',
    printout.clean_order('difficulty drops hit evade crit magic immunities'));
check('an order missing elements gets it after immunities', printout.clean_order('difficulty hit evade crit aggro magic '
    .. 'immunities drops') == printout.DEFAULT_ORDER and printout.clean_order('drops immunities hit')
    == 'difficulty drops immunities elements hit evade crit aggro magic', printout.clean_order('drops immunities hit'));
check('move up', printout.move(printout.DEFAULT_ORDER, 'evade', -1)
    == 'difficulty evade hit crit aggro magic immunities elements drops');
check('move down', printout.move(printout.DEFAULT_ORDER, 'evade', 1)
    == 'difficulty hit crit evade aggro magic immunities elements drops');
check('the first can\'t go up', printout.move(printout.DEFAULT_ORDER, 'difficulty', -1) == printout.DEFAULT_ORDER);
check('the last can\'t go down', printout.move(printout.DEFAULT_ORDER, 'drops', 1) == printout.DEFAULT_ORDER);

-- Dividers ----------------------------------------------------------------------------------------

-- Every divider but Custom has a space on both sides. The symbols are the Shift-JIS pairs in Ashita's
-- chat.lua, and the arrow is the one checker prints. No divider holds 0, which ends the text, or 10
-- and 13, which break lines.
local STAR = ' \129\154 ';
local u = require('chat').symbols.unicode;
local SYMBOLS = {
    star = u.BlackStar, whitestar = u.WhiteStar, diamond = u.BlackDiamond, whitediamond = u.WhiteDiamond,
    circle = u.BlackCircle, dot = u.MiddleDot, note = u.MusicEighthNote, arrow = u.RightArrow,
    pipe = '|', slash = '/', dash = '-',
};
check('thirteen dividers, Star first and Custom last', #printout.DIVIDERS == 13 and printout.DIVIDER_IDS
    == 'star, whitestar, diamond, whitediamond, circle, dot, note, arrow, pipe, slash, dash, spaces, custom', printout.DIVIDER_IDS);
check('the arrow is the one checker prints', SYMBOLS.arrow == string.char(0x81, 0xA8));
for _, divider in ipairs(printout.DIVIDERS) do
    if (divider.id ~= 'custom') then
        local want = SYMBOLS[divider.id] and (' ' .. SYMBOLS[divider.id] .. ' ') or '  ';
        s = settings();
        s.printout.divider = divider.id;
        lines = plain_lines(s, result());
        check(divider.name .. ' goes between parts', divider.text == want
            and lines[1]:find('(Lv 42)' .. want .. 'Hit: 64-72%' .. want .. 'Evade', 1, true) ~= nil, lines[1]);
        raw = table.concat(printout.lines(s, result()), '');
        check(divider.name .. ' prints no byte 0, 10 or 13', not raw:find('[%z\10\13]'));
    end
end

-- Custom prints the separator as it is, cleaned to printable ASCII. A star typed in the window is UTF-8
-- and is dropped.
s = settings();
s.printout.divider = 'custom';
s.printout.separator = '\0\10\13\226\152\133+';
lines = plain_lines(s, result());
check('Custom prints its cleaned text with nothing added', lines[1]:find('(Lv 42)+Hit: 64-72%+Evade', 1, true) ~= nil, lines[1]);

-- Between parts the divider is in the line color. Inside a list part it's in the part's detail color, and
-- the label divider after its label is in the label color.
s = settings();
s.printout.divider = 'star';
s.colors.line = 69;
s.colors.magic_label, s.colors.magic_name, s.colors.magic_number, s.colors.magic_detail = 2, 3, 5, 7;
raw = printout.lines(s, result())[1];
check('the star between parts is in the line color', raw:find(color(69) .. STAR .. color(106) .. 'Evade', 1, true) ~= nil,
    MOCK.plain(raw));
check('and inside Magic in its detail color', raw:find(color(2) .. 'Magic' .. color(2) .. ': ' .. color(3) .. 'Elemental '
    .. color(5) .. '88%' .. color(7) .. ' (Ice)' .. color(7) .. STAR .. color(3) .. 'Enfeebling', 1, true) ~= nil, MOCK.plain(raw));

-- A new settings table prints Star between parts and Colon after labels on every line of the default layout.
s = defaults.make();
for _, part in pairs(s.printout.parts) do part.on = true; end
r = result();
r.con, r.reading, r.defense = 3, 0, 2;
lines = plain_lines(s, r);
check('Star and Colon are the defaults on every line', #lines == 5
    and lines[1] == 'Goblin Tinkerer (Lv 42)' .. STAR .. 'Decent Challenge (High Evasion, Low Defense)'
    and lines[2] == 'Hit: 64-72%' .. STAR .. 'Evade: 31% with Signet' .. STAR .. 'Crit: 7%'
    and lines[3] == 'Magic: Elemental 88% (Ice)' .. STAR .. 'Enfeebling 81%' .. STAR .. 'Dark immune'
    and lines[4] == 'Immune: Sleep, Bind, Gravity'
    and lines[5] == 'Drops (TH 2): Goblin Mail 15%, Goblin Helm 15%, Beastman Blood 7.0%' .. STAR .. '+2 more',
    table.concat(lines, ' / '));

-- The plain /check line uses the divider too.
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.divider = 'arrow';
lines = plain_lines(s, { name = 'Goblin Tinkerer', low = 42, high = 42, con = 3, reading = 0, defense = 1 });
check('the plain /check line uses the divider, and parentheses for the reading', lines[1]
    == 'Goblin Tinkerer (Lv 42) \129\168 Decent Challenge (High Evasion)', lines[1]);

-- A known divider stays, and one that's missing or unknown is Star.
local function id_for(divider)
    return printout.divider_id({ divider = divider });
end
check('a known divider stays', id_for('arrow') == 'arrow' and id_for('custom') == 'custom');
check('a missing or unknown divider is Star', id_for(nil) == 'star' and id_for('bogus') == 'star');

-- Label dividers -----------------------------------------------------------------------------------

-- Colon first, then the divider symbols from the same table, a lone space and Custom.
check('fourteen label dividers, Colon first, Space only and Custom last', #printout.LABEL_DIVIDERS == 14
    and printout.LABEL_DIVIDER_IDS == 'colon, star, whitestar, diamond, whitediamond, circle, dot, note, arrow, pipe, slash, '
    .. 'dash, space, custom', printout.LABEL_DIVIDER_IDS);
local shared = true;
for index = 2, 12 do
    shared = shared and rawequal(printout.LABEL_DIVIDERS[index], printout.DIVIDERS[index - 1]);
end
check('the symbols are the divider list\'s own entries', shared);
check('Colon is the default', defaults.make().printout.label_divider == 'colon' and defaults.make().printout.label_separator == ':');

-- Each label divider after every label, and nowhere else. The divider between parts stays two spaces.
local LABEL_TEXTS = { colon = ': ', space = ' ' };
for _, divider in ipairs(printout.LABEL_DIVIDERS) do
    if (divider.id ~= 'custom') then
        local want = LABEL_TEXTS[divider.id] or (' ' .. SYMBOLS[divider.id] .. ' ');
        s = settings();
        s.printout.label_divider = divider.id;
        lines = plain_lines(s, result());
        check(divider.name .. ' goes after every label', divider.text == want and lines[1] == 'Goblin Tinkerer (Lv 42)  Hit' .. want
            .. '64-72%  Evade' .. want .. '31% with Signet  Crit' .. want .. '7%  Magic' .. want .. 'Elemental 88% (Ice)  '
            .. 'Enfeebling 81%  Dark immune  Immune' .. want .. 'Sleep, Bind, Gravity  Drops (TH 2)' .. want .. 'Goblin Mail 15%, '
            .. 'Goblin Helm 15%, Beastman Blood 7.0%  +2 more', lines[1]);
        raw = table.concat(printout.lines(s, result()), '');
        check(divider.name .. ' after labels prints no byte 0, 10 or 13', not raw:find('[%z\10\13]'));
    end
end

-- Custom prints your text right after the label, then one space.
local CUSTOM_LABELS = {
    { ':', 'Hit: 64-72%' }, { ' >', 'Hit > 64-72%' }, { '->', 'Hit-> 64-72%' }, { ' = ', 'Hit =  64-72%' }, { '', 'Hit 64-72%' },
    { '\226\152\133=\9', 'Hit= 64-72%' },
};
for _, case in ipairs(CUSTOM_LABELS) do
    s = settings();
    s.printout.label_divider = 'custom';
    s.printout.label_separator = case[1];
    lines = plain_lines(s, result());
    check(('Custom text prints "%s"'):format(case[2]), lines[1]:find('  ' .. case[2] .. '  ', 1, true) ~= nil,
        lines[1]);
end

-- A label divider that's missing or unknown is Colon.
check('no label divider is Colon', printout.label_divider_id({}) == 'colon');
check('an unknown one is Colon and a known one stays', printout.label_divider_id({ label_divider = 'bogus' }) == 'colon'
    and printout.label_divider_id({ label_divider = 'spaces' }) == 'colon'
    and printout.label_divider_id({ label_divider = 'arrow' }) == 'arrow');
s = settings();
s.printout.label_divider = nil;
check('and prints as Colon before the settings are tidied', plain_lines(s, result())[1]:find('  Hit: 64-72%', 1, true) ~= nil,
    plain_lines(s, result())[1]);

-- A part with no label gets no label divider.
s = settings();
for _, part in pairs(s.printout.parts) do part.label = ''; end
s.drops.th_in_label = false;
lines = plain_lines(s, result());
check('empty labels print no label divider', lines[1] == 'Goblin Tinkerer (Lv 42)  64-72%  31% with Signet  7%  Elemental 88% '
    .. '(Ice)  Enfeebling 81%  Dark immune  Sleep, Bind, Gravity  Goblin Mail 15%, Goblin Helm 15%, Beastman Blood 7.0%  +2 more',
    lines[1]);
s.printout.parts.drops.label = '   ';
check('a label of spaces is empty too', plain_lines(s, result())[1]:find('Gravity  Goblin Mail', 1, true) ~= nil,
    plain_lines(s, result())[1]);

-- Every part with a label, the name and difficulty included. The reading still follows the difficulty
-- with a space, and the TH note stays with the label, before the label divider.
s = settings();
s.printout.parts.name.label = 'Mob';
s.printout.parts.difficulty.label = 'Con';
s.printout.parts.hit.label = 'Acc';
r = result();
r.con, r.reading, r.defense = 3, 0, 2;
r.aggro = { text = 'Aggressive', threat = true, detects = { 'Sight' }, notes = {}, links = true, names = { 'Goblin Thug' },
    more = 0 };
lines = plain_lines(s, r);
check('every part with a label gets the label divider', lines[1] == 'Mob: Goblin Tinkerer (Lv 42)  Con: Decent Challenge (High '
    .. 'Evasion, Low Defense)  Acc: 64-72%  Evade: 31% with Signet  Crit: 7%  Aggro: Aggressive (Sight)  Links with Goblin Thug  '
    .. 'Magic: Elemental 88% (Ice)  Enfeebling 81%  Dark immune  Immune: Sleep, Bind, Gravity  Drops (TH 2): Goblin Mail 15%, '
    .. 'Goblin Helm 15%, Beastman Blood 7.0%  +2 more', lines[1]);
s.printout.parts.drops.label = '';
check('with the label empty the TH note gets a space, not the label divider', plain_lines(s, r)[1]:find('Gravity  (TH 2) Goblin '
    .. 'Mail', 1, true) ~= nil, plain_lines(s, r)[1]);

-- The label divider is in the part's label color. The TH note before it is in the detail color.
local LABEL_KEYS = {
    { 'name', 'name', 'Mob' }, { 'difficulty', 'difficulty', 'Con' }, { 'hit', 'hit_label', 'Hit' },
    { 'evade', 'evade_label', 'Evade' }, { 'crit', 'crit_label', 'Crit' }, { 'aggro', 'aggro_label', 'Aggro' },
    { 'magic', 'magic_label', 'Magic' }, { 'immunities', 'immunities_label', 'Immune' },
};
s = settings();
s.printout.parts.name.label, s.printout.parts.difficulty.label = 'Mob', 'Con';
s.printout.con_colors = false;
for index, entry in ipairs(LABEL_KEYS) do s.colors[entry[2]] = printout.PALETTE[index + 1].code; end
s.colors.drops_label, s.colors.drops_detail, s.colors.drops_name = 76, 67, 69;
raw = printout.lines(s, r)[1];
for index, entry in ipairs(LABEL_KEYS) do
    local code = color(printout.PALETTE[index + 1].code);
    check('the ' .. entry[1] .. ' label divider is in the label color', raw:find(code .. entry[3] .. code .. ': ', 1, true) ~= nil,
        MOCK.plain(raw));
end
check('the drops label divider is in the label color, after the TH note in the detail color', raw:find(color(76) .. 'Drops'
    .. color(67) .. ' (TH 2)' .. color(76) .. ': ' .. color(69) .. 'Goblin Mail', 1, true) ~= nil, MOCK.plain(raw));

-- Every chat color --------------------------------------------------------------------------------

-- Each color setting alone in violet, with every other color cream, lands right before the text it
-- paints. Everything prints on one line with the pipe divider and grades off.
local VIOLET = 73;
local function all_cream()
    local c = settings();
    c.printout.divider = 'pipe';
    c.grades.on = false;
    for _, key in ipairs(printout.COLOR_KEYS) do c.colors[key] = 106; end
    return c;
end
local function full_result()
    local c = result();
    c.con, c.reading, c.defense, c.scripted = 3, 0, 2, true;
    c.drops.scripted, c.drops.exp_only = true, true;
    c.aggro = { text = 'Aggressive', threat = true, detects = { 'Sight' }, notes = {}, links = true, names = { 'Goblin Thug' },
        more = 0 };
    c.elements = { weak = { { name = 'Ice' }, { name = 'Thunder' } }, resists = { { name = 'Water', strength = 'half' } },
        all = '-25%', scripted = true };
    return c;
end

-- Each key with text it paints, and a change to the settings or the /check that makes that text print.
local PAINTS = {
    { 'line', ' | ' },
    { 'name', 'Goblin Tinkerer' },
    { 'level', ' (Lv 42)' },
    { 'level_range', 'range 40-44', function (c, r) c.printout.show_range = true; r.range_low, r.range_high = 40, 44; end },
    { 'difficulty', 'Decent Challenge', function (c) c.printout.con_colors = false; end },
    { 'too_weak', 'Too Weak', function (_, r) r.con = 0; end },
    { 'incredibly_easy_prey', 'Incredibly Easy Prey', function (_, r) r.con = 1; end },
    { 'easy_prey', 'Easy Prey', function (_, r) r.con = 2; end },
    { 'decent_challenge', 'Decent Challenge' },
    { 'even_match', 'Even Match', function (_, r) r.con = 4; end },
    { 'tough', 'Tough', function (_, r) r.con = 5; end },
    { 'very_tough', 'Very Tough', function (_, r) r.con = 6; end },
    { 'incredibly_tough', 'Incredibly Tough', function (_, r) r.con = 7; end },
    { 'impossible_to_gauge', 'Impossible to Gauge', function (_, r) r.con, r.impossible = nil, true; end },
    { 'reading', 'High Evasion' },
    { 'reading_detail', '(' },
    { 'hit_label', 'Hit' .. color(VIOLET) .. ': ' },
    { 'hit_number', '64-72%' },
    { 'hit_detail', '?' },
    { 'hit_detail', 'unknown', function (_, r) r.hit = nil; end },
    { 'evade_label', 'Evade' .. color(VIOLET) .. ': ' },
    { 'evade_number', '31%' },
    { 'evade_detail', ' with Signet' },
    { 'crit_label', 'Crit' .. color(VIOLET) .. ': ' },
    { 'crit_number', '7%' },
    { 'crit_detail', '?' },
    { 'aggro_label', 'Aggro' .. color(VIOLET) .. ': ' },
    { 'aggro_words', 'Links with ' },
    { 'aggro_words', 'Aggressive', function (c) c.aggro.threat_colors = false; end },
    { 'aggro_detail', ' (Sight)' },
    { 'aggro_threat', 'Aggressive' },
    { 'aggro_safe', 'Not aggressive', function (_, r) r.aggro.text, r.aggro.threat = 'Not aggressive', false; end },
    { 'magic_label', 'Magic' .. color(VIOLET) .. ': ' },
    { 'magic_name', 'Elemental' },
    { 'magic_number', '88%' },
    { 'magic_detail', ' (Ice)' },
    { 'magic_detail', 'immune' },
    { 'immunities_label', 'Immune' .. color(VIOLET) .. ': ' },
    { 'immunities_name', 'Sleep' },
    { 'immunities_detail', ', ' },
    { 'elements_label', 'Elements' .. color(VIOLET) .. ': ' },
    { 'elements_label', 'Weak: ' },
    { 'elements_label', 'Resists: ' },
    { 'elements_weak', 'Thunder' },
    { 'elements_resist', 'Water' },
    { 'elements_detail', ' (half)' },
    { 'elements_detail', ', ' },
    { 'elements_detail', ' | ' },
    { 'elements_detail', 'Magic damage -25%' },
    { 'elements_detail', '?' },
    { 'drops_label', 'Drops' },
    { 'drops_label', ': ' },
    { 'drops_name', 'Goblin Mail' },
    { 'drops_number', '15%' },
    { 'drops_detail', ' (TH 2)' },
    { 'drops_detail', ' | +2 more' },
    { 'drops_detail', ' (plus scripted drops) (only drops if you get EXP)' },
    { 'good', '31%', function (c) c.grades.on = true; end },
    { 'ok', '10%', function (c, r) c.grades.on = true; r.crit = { low = 10, high = 10 }; end },
    { 'bad', '64-72%', function (c) c.grades.on = true; end },
};

-- test_commands.lua covers the replies color.
local covered = { replies = true };
for _, paints in ipairs(PAINTS) do
    local key, text, change = paints[1], paints[2], paints[3];
    local c, r = all_cream(), full_result();
    if (change ~= nil) then change(c, r); end
    c.colors[key] = VIOLET;
    raw = table.concat(printout.lines(c, r), '\n');
    check(('%s paints "%s"'):format(key, MOCK.plain(text)), raw:find(color(VIOLET) .. text, 1, true) ~= nil, MOCK.plain(raw));
    covered[key] = true;
end

-- The tag, and the default tag is Ashita's usual one.
local c = all_cream();
c.colors.tag_brackets, c.colors.tag_word = 81, 6;
check('the tag is [checkmate] in its two colors', printout.tag(c, 'checkmate')
    == color(81) .. '[' .. color(6) .. 'checkmate' .. color(81) .. '] ');
check('the default tag looks like Ashita\'s chat.header', printout.tag(defaults.make(), 'checkmate')
    == require('chat').header('checkmate'):gsub('\30\1 $', ' '));
covered.tag_brackets, covered.tag_word = true, true;
local missing = {};
for _, key in ipairs(printout.COLOR_KEYS) do
    if (not covered[key]) then missing[#missing + 1] = key; end
end
check('every color setting is tested', #missing == 0 and #printout.COLOR_KEYS == 51, table.concat(missing, ', '));
local keys_ok = true;
for _, key in ipairs(printout.COLOR_KEYS) do
    keys_ok = keys_ok and printout.color_key(key) == key and printout.color_key(key:upper()) == key;
end
check('every color key is found in any case, and nothing else is', keys_ok and printout.color_key('sort') == nil
    and printout.color_key('bogus') == nil and printout.color_key(nil) == nil);

-- Colors outside the palette never print. 0, 10 and 13 would end or break the line.
c = all_cream();
c.colors.drops_detail, c.colors.reading_detail, c.colors.tag_word = 0, 10, 13;
raw = table.concat(printout.lines(c, full_result()), '') .. printout.tag(c, 'checkmate');
check('broken detail colors fall back to cream', not raw:find('\30[%z\10\13]'));

-- Palette names and numbers for /checkmate color.
check('find a color by name, number, any case, with or without spaces', printout.find_color('Lawn green').code == 2
    and printout.find_color('lawngreen').code == 2 and printout.find_color('LAWN-GREEN').code == 2
    and printout.find_color('102').name == 'Light blue' and printout.find_color('med spring green').code == 88);
check('no color for other numbers or names', printout.find_color('0') == nil and printout.find_color('10') == nil
    and printout.find_color('13') == nil and printout.find_color('rainbow') == nil and printout.find_color('') == nil);

-- Through the addon ------------------------------------------------------------------------------

-- A settings file with only a few settings, its parts in another order and a part checkmate doesn't know.
-- Ashita merges tables key by key, so the order has to be one string or a merge would mix it up.
MOCK.settings_file = { printout = { order = 'drops hit evade crit magic immunities bogus', header = false,
    parts = { hit = { on = true } } } };
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local cur = MOCK.settings.current;
check('an order missing parts is cleaned on load, with difficulty first, aggro right after crit and elements after immunities',
    cur.printout.order == 'difficulty drops hit evade crit aggro magic immunities elements', cur.printout.order);
check('the merge brings difficulty and reading in, on', cur.printout.parts.difficulty.on == true
    and cur.printout.parts.reading.on == true and cur.printout.con_colors == true);
check('and the aggro part, on, on its own line, with its settings', cur.printout.parts.aggro.on == true
    and cur.printout.parts.aggro.label == 'Aggro' and cur.printout.parts.aggro.new_line == true
    and cur.aggro.threat_colors == true and cur.aggro.detection == true and cur.aggro.link_names == true
    and cur.aggro.max_links == 5 and cur.colors.aggro_threat == 76 and cur.colors.aggro_safe == 2);
-- Ashita's merge gives the file the defaults' own tables for anything it lacks. Changing those
-- tables must not touch the defaults that a reset or another character starts from.
MOCK.command('/checkmate maxlinks 1');
MOCK.command('/checkmate hide aggro');
check('the merged aggro tables are the file\'s own', MOCK.settings.defaults.aggro.max_links == 5
    and MOCK.settings.defaults.printout.parts.aggro.on == true and next(MOCK.settings.defaults.look.imgui) == nil);
MOCK.command('/checkmate maxlinks 5');
MOCK.command('/checkmate show aggro');
check('saved values survive the merge', cur.printout.header == false and cur.printout.parts.hit.on == true
    and cur.printout.parts.hit.label == 'Hit');
check('a file without the setting gets the extras on their own line', cur.printout.extras_own_line == true);
check('and the level range off, with the word range and the Phoenix range color', cur.printout.show_range == false
    and cur.printout.range_word == 'range' and cur.colors.level_range == 8);
check('and the game\'s /check line replaced', cur.printout.replace_game_line == true);
check('and Star between parts', cur.printout.divider == 'star' and cur.printout.separator == '  ');

-- Two spaces between parts keep the lines below easy to read.
cur.printout.divider = 'spaces';

addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.entities[1] = { Name = 'Fixture Goblin' };
cur.printout.parts.hit.on = false;
cur.printout.parts.immunities.on = true;
cur.printout.parts.drops.on = true;
MOCK.items[4104] = { Name = { 'Fire Crystal' } };
local n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
lines = MOCK.printed_since(n);
check('header off prints no [checkmate]', #lines == 4 and lines[1] == 'Fixture Goblin (Lv 39)  Even Match',
    table.concat(lines, ' / '));
check('one print per line', lines[2] == 'Drops (TH 0): Item 4105 100%, Fire Crystal 16%'
    and lines[3] == 'Aggro: Not aggressive  Doesn\'t link' and lines[4] == 'Immune: Bind, Paralyze', table.concat(lines, ' / '));
cur.printout.header = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('header on starts every line with [checkmate]', #MOCK.printed_since(n) == 4
    and MOCK.printed_since(n)[4]:find('^%[checkmate%] Immune') ~= nil);

-- Every con and every evasion and defense reading from a real /check reply.
cur.printout.parts.immunities.on = false;
cur.printout.parts.drops.on = false;
MOCK.entities[400] = { Name = 'Fixture NM' };
local function check_line(index, level, con, message)
    n = #MOCK.printed;
    MOCK.packet(MOCK.check_packet(index, level, con, message));
    MOCK.frame();
    local raw = MOCK.printed[n + 1];
    return MOCK.printed_since(n)[1], raw;
end
for con = 0, 7 do
    local line = check_line(1, 39, con, 174);
    check(('a /check with con %d reads %s'):format(con, CONS[con][1]), line == '[checkmate] Fixture Goblin (Lv 39)  '
        .. CONS[con][1], line);
end
for message = 170, 178 do
    local row, column = math.floor((message - 170) / 3), (message - 170) % 3;
    local want = READINGS[row][column];
    local line = check_line(1, 39, 6, message);
    check(('message %d reads %s'):format(message, want or 'nothing'), line == '[checkmate] Fixture Goblin (Lv 39)  Very Tough'
        .. (want and (' (' .. want .. ')') or ''), line);
end
local line, raw = check_line(400, 0, nil, 249);
check('249 is impossible to gauge, with no reading', line == '[checkmate] Fixture NM (Lv 50-51)  Impossible to Gauge', line);
check('in magenta', raw:find(color(5) .. 'Impossible to Gauge', 1, true) ~= nil);
line, raw = check_line(1, 39, 3, 176);
check('decent challenge in its color', raw:find(color(102) .. 'Decent Challenge ' .. color(106) .. '(', 1, true) ~= nil, line);
cur.printout.con_colors = false;
line, raw = check_line(1, 39, 3, 176);
check('and in the one difficulty color with Color by difficulty off', raw:find(color(106) .. 'Decent Challenge ' .. color(106),
    1, true) ~= nil and not raw:find(color(102), 1, true), line);
check('the game\'s own /check line is hidden by default', MOCK.packet(MOCK.check_packet(1, 39, 3, 176)).blocked
    and MOCK.packet(MOCK.check_packet(400, 0, nil, 249)).blocked);
cur.printout.replace_game_line = false;
check('and shown with Replace the game\'s /check line off', not MOCK.packet(MOCK.check_packet(1, 39, 3, 176)).blocked
    and not MOCK.packet(MOCK.check_packet(400, 0, nil, 249)).blocked);
MOCK.frame();

-- A settings file with a divider keeps it, loaded as another character logs in.
MOCK.settings.switch_character({ printout = { divider = 'note', separator = ' | ' } });
check('a file with a divider keeps it', MOCK.settings.current.printout.divider == 'note'
    and MOCK.settings.current.printout.separator == ' | ');

-- A settings file with no label divider gets Colon. A broken one is cleaned.
check('a file with no label divider gets Colon', MOCK.settings.current.printout.label_divider == 'colon'
    and MOCK.settings.current.printout.label_separator == ':');
MOCK.settings.current.printout.parts.aggro.on = true;
MOCK.settings.current.printout.divider = 'spaces';
check_line(1, 39, 4, 174);
lines = MOCK.printed_since(#MOCK.printed - 1);
check('and prints it', lines[1] == '[checkmate] Aggro: Not aggressive  Doesn\'t link', lines[1]);
MOCK.settings.switch_character({ printout = { label_divider = 'bogus', label_separator = '\226\152\133>' } });
check('an unknown label divider becomes Colon and its custom text is cleaned',
    MOCK.settings.current.printout.label_divider == 'colon' and MOCK.settings.current.printout.label_separator == '>');
MOCK.settings.switch_character({ printout = { label_divider = 'custom', label_separator = ' >' } });
check_line(1, 39, 4, 174);
lines = MOCK.printed_since(#MOCK.printed - 1);
check('a file with a custom label divider keeps it', MOCK.settings.current.printout.label_divider == 'custom'
    and lines[1] == '[checkmate] Aggro > Not aggressive' .. STAR .. 'Doesn\'t link', lines[1]);

-- A broken color takes the default, and a good one stays.
MOCK.settings.switch_character({ colors = { level = 69, level_range = 0 } });
check('a broken range color takes the default', MOCK.settings.current.colors.level_range == 8
    and MOCK.settings.current.colors.level == 69, MOCK.settings.current.colors.level_range);

-- A settings file with the reading off and no colors. Its colors come from the defaults.
MOCK.settings.switch_character({ printout = { parts = { reading = { on = false } } } });
cur = MOCK.settings.current;
local cc = cur.colors;
check('the reading stays off', cur.printout.parts.reading.on == false);
check('a file with no colors gets the default colors', cc.tag_word == 6 and cc.decent_challenge == 102 and cc.magic_name == 106
    and cc.very_tough == 76);
check('its colors are its own table, not the defaults Ashita keeps', cc ~= MOCK.settings.defaults.colors
    and MOCK.settings.defaults.colors.line == 106 and MOCK.settings.defaults.colors.name == 8);
line = check_line(1, 39, 6, 171);
check('and it prints', line == '[checkmate] Fixture Goblin (Lv 39)' .. STAR .. 'Very Tough', line);
cur.printout.parts.reading.on = true;
line = check_line(1, 39, 6, 171);
check('the reading back on prints in parentheses', line == '[checkmate] Fixture Goblin (Lv 39)' .. STAR .. 'Very Tough (High Evasion)',
    line);
-- The first /checkmate reset only says what it does. The second one does it.
MOCK.command('/checkmate reset');
MOCK.command('/checkmate reset');
check('reset brings back the default colors', MOCK.settings.current.colors.line == 106 and MOCK.settings.current.colors.name == 8
    and MOCK.settings.current.colors.level_range == 8);

return MOCK.report();
