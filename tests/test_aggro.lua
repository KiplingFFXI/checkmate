-- Tests the aggro part. That covers every verdict, from the /check con and from the Too Weak table
-- for a monster that can't be gauged. It also covers Detection, the notes, the link names, how each one
-- links and "+N more", Color by threat, and real monsters from the generated data through a real /check.
local aggro    = require('core.aggro');
local printout = require('core.printout');
local defaults = require('ui.defaults');
local too_weak = require('data.too_weak');
local bands    = require('data.bands');

local function color(code) return '\30' .. string.char(code); end

-- The aggro part for a row, at your level 75 unless a test says otherwise, with the default settings
-- and any changes to them.
local function readout(row, check_result, my_level, changes)
    local setting = defaults.make().aggro;
    for key, value in pairs(changes or {}) do setting[key] = value; end
    return aggro.readout(row, check_result, my_level or 75, setting);
end

-- The Too Weak table ---------------------------------------------------------------------------------

check('the Too Weak table has the data\'s stamp', too_weak.built == bands.built and too_weak.content == bands.content);
local whole = true;
for level = 1, 99 do
    local v = too_weak.highest[level];
    whole = whole and type(v) == 'number' and v == math.floor(v);
end
check('it covers main levels 1 to 99', whole);
check('its worked levels', too_weak.highest[1] == -6 and too_weak.highest[9] == 0 and too_weak.highest[10] == 1
    and too_weak.highest[30] == 19 and too_weak.highest[50] == 35 and too_weak.highest[75] == 55
    and too_weak.highest[99] == 79);

-- Verdicts -------------------------------------------------------------------------------------------

local AGGRESSIVE = { aggro = true, detects = { 'sight' } };
local function verdict(row, check_result, my_level)
    local a = readout(row, check_result, my_level);
    return a.text, a.threat;
end

-- From the /check con, which the server works out with the same test it aggroes by.
local text, threat = verdict(AGGRESSIVE, { con = 0 });
check('con 0 is too weak', text == 'Too weak to aggro you unless you rest' and threat == false, text);
for con = 1, 7 do
    text, threat = verdict(AGGRESSIVE, { con = con, low = 1, high = 1 });
    check(('con %d is aggressive'):format(con), text == 'Aggressive' and threat == true, text);
end
text = verdict(AGGRESSIVE, { con = 4, low = 20, high = 20 }, 1);
check('the con wins over the Too Weak table', text == 'Aggressive', text);

-- A monster that aggroes at any level ignores Too Weak.
local ANY = { aggro = true, any_level = true, detects = { 'sight' } };
text, threat = verdict(ANY, { con = 0 });
check('always aggro at con 0', text == 'Aggressive at any level' and threat == true, text);
text = verdict(ANY, { low = 10, high = 10 });
check('and impossible to gauge far under you', text == 'Aggressive at any level', text);

-- Impossible to gauge. Your level 75 checks up to 55 as Too Weak.
text = verdict(AGGRESSIVE, { low = 56, high = 56 });
check('249 at a known level over the cutoff', text == 'Aggressive', text);
text, threat = verdict(AGGRESSIVE, { low = 55, high = 55 });
check('249 at a known level on the cutoff', text == 'Too weak to aggro you unless you rest' and threat == false, text);
text = verdict(AGGRESSIVE, { low = 40, high = 55 });
check('249 with a range all under the cutoff', text == 'Too weak to aggro you unless you rest', text);
text = verdict(AGGRESSIVE, { low = 56, high = 60 });
check('249 with a range all over it', text == 'Aggressive', text);
text, threat = verdict(AGGRESSIVE, { low = 50, high = 60 });
check('249 with a range across it says where it starts', text == 'Aggressive if it\'s level 56 or higher' and threat == true,
    text);
text = verdict(AGGRESSIVE, { low = 30, high = 40 }, 50);
check('the cutoff follows your level', text == 'Aggressive if it\'s level 36 or higher', text);
text = verdict({ aggro = true, level_mod = -2 }, { low = 50, high = 60 });
check('level_mod moves it, since the table goes by the /check level', text == 'Aggressive if it\'s level 58 or higher', text);
text = verdict(AGGRESSIVE, { low = 1, high = 1 }, 1);
check('your level 1 against a level 1', text == 'Aggressive', text);
text = verdict(AGGRESSIVE, { low = 70, high = 70 }, 120);
check('a level past 99 uses 99', text == 'Too weak to aggro you unless you rest', text);
text, threat = verdict(AGGRESSIVE, {});
check('249 with no level known', text == 'Aggressive (level unknown)' and threat == true, text);

-- Not aggressive, and never.
text, threat = verdict({}, { con = 5 });
check('not aggressive', text == 'Not aggressive' and threat == false, text);
text = verdict({ detects = { 'sight' } }, {});
check('not aggressive when it can\'t be gauged', text == 'Not aggressive', text);
text, threat = verdict({ no_aggro = true }, { con = 5 });
check('NO_AGGRO is never aggressive', text == 'Never aggressive' and threat == false, text);
text = verdict({ no_aggro = true, aggro = true, any_level = true }, { con = 5 });
check('and never wins over any level', text == 'Never aggressive', text);

-- How it finds you ---------------------------------------------------------------------------------

local ALL = { aggro = true, detects = { 'sight', 'sound', 'magic', 'low_hp', 'ability' }, true_detect = true, ambush = true };
local a = readout(ALL, { con = 4 });
expect('every way it finds you, in order', table.concat(a.detects, ', '),
    'True Sight, True Sound, Magic, Low HP, Ability, Ambush');
a = readout({ aggro = true, detects = { 'sound' }, true_detect = true, aggro_note = 'night_sight' }, { con = 4 });
expect('an imp sees you at night', table.concat(a.detects, ', '), 'True Sight 18:00-5:59, True Sound');
check('and that isn\'t a note', #a.notes == 0);
a = readout({ aggro = true, detects = { 'sight', 'scent' } }, { con = 4 });
check('a sense the addon doesn\'t know is left out', table.concat(a.detects, ', ') == 'Sight');
check('nothing with Detection off', #readout(ALL, { con = 4 }, 75, { detection = false }).detects == 0);
check('nothing when it\'s too weak', #readout(ALL, { con = 0 }).detects == 0);
check('nothing when it isn\'t aggressive', #readout({ detects = { 'sight' } }, { con = 4 }).detects == 0);
check('nothing for NO_AGGRO', #readout({ no_aggro = true, detects = { 'sight' } }, { con = 4 }).detects == 0);
check('but for any level, a range and an unknown level', #readout(ANY, { con = 0 }).detects == 1
    and #readout(AGGRESSIVE, { low = 50, high = 60 }).detects == 1 and #readout(AGGRESSIVE, {}).detects == 1);

-- Notes --------------------------------------------------------------------------------------------

local function notes_of(row, check_result)
    return table.concat(readout(row, check_result or { con = 4 }).notes, ' / ');
end
check('awake hours', notes_of({ aggro = true, aggro_note = 'sleeps', aggro_hours = { 6, 20 } }) == 'awake 6:00-20:59');
check('never awake', notes_of({ aggro_note = 'sleeps' }) == 'always asleep');
check('ghrah', notes_of({ aggro = true, aggro_note = 'form' }) == 'not in its ball form');
check('apkallu', notes_of({ aggro_note = 'apkallu' }) == 'changes with the zone\'s apkallu hate');
check('fomor hate', notes_of({ aggro = true, aggro_note = 'fomor_hate' }) == 'only if you have fomor hate');
check('worms underground', notes_of({ aggro = true, aggro_note = 'underground' }) == 'only above ground');
check('a script that changes it', notes_of({ aggro = true, flags = { scripted_aggro = true } }) == 'can change in the fight');
check('a note and a script', notes_of({ aggro = true, aggro_note = 'underground', flags = { scripted_aggro = true } })
    == 'only above ground / can change in the fight');
check('notes stay when it\'s too weak', notes_of({ aggro = true, aggro_note = 'fomor_hate' }, { con = 0 })
    == 'only if you have fomor hate');
check('and for NO_AGGRO', notes_of({ no_aggro = true, flags = { scripted_aggro = true } }) == 'can change in the fight');
check('an aggro_note the addon doesn\'t know says nothing', notes_of({ aggro = true, aggro_note = 'bogus' }) == '');
check('no note', notes_of(AGGRESSIVE) == '' and notes_of({ flags = { scripted_stats = true } }) == '');

-- Links --------------------------------------------------------------------------------------------

-- The data puts each link name in a group for how it links.
local SEVEN = { aggro = true, links = { sight = { 'A', 'B', 'C', 'D', 'E', 'F', 'G' } } };
a = readout(SEVEN, { con = 4 });
check('five names by default and two more', a.links and #a.names == 5 and a.names[5] == 'E' and a.more == 2);
expect('each shown name says how it links', table.concat(a.tags, '|'), 'Sight|Sight|Sight|Sight|Sight');
a = readout(SEVEN, { con = 4 }, 75, { max_links = 0 });
check('0 shows every name', #a.names == 7 and a.more == 0);
a = readout(SEVEN, { con = 4 }, 75, { max_links = 7 });
check('exactly the most shown is no more', #a.names == 7 and a.more == 0);
a = readout(SEVEN, { con = 4 }, 75, { max_links = 1 });
check('one name', #a.names == 1 and a.names[1] == 'A' and a.more == 6);
check('and one tag', #a.tags == 1 and a.tags[1] == 'Sight');
a = readout(SEVEN, { con = 4 }, 75, { link_how = false });
check('Show how each one links off gives no tags', #a.names == 5 and a.tags == nil and a.senses == nil);
a = readout(SEVEN, { con = 4 }, 75, { link_names = false });
check('names off', a.links == true and a.names == nil and a.more == 0);
check('names off says how they link all together', a.tags == nil and table.concat(a.senses, ', ') == 'Sight');
a = readout(SEVEN, { con = 4 }, 75, { link_names = false, link_how = false });
check('and nothing with both off', a.links == true and a.names == nil and a.more == 0 and a.senses == nil);
check('no links', readout(AGGRESSIVE, { con = 4 }).links == false and readout({ links = {} }, { con = 4 }).links == false);
check('links don\'t depend on your level', readout(SEVEN, { con = 0 }).links and #readout(SEVEN, { con = 0 }).names == 5);
check('max_links is 12', aggro.MAX_LINKS == 12);

-- How each one links. Nine groups, each with its words. One that neither sees nor hears says what it
-- notices, like Magic, and one that notices none of those has no words.
expect('the nine ways in order', table.concat(aggro.LINK_WAYS, ' '),
    'superlink sight true_sight sound true_sound both true_both magic neither');
local words_ok = true;
for _, way in ipairs(aggro.LINK_WAYS) do
    words_ok = words_ok and type(aggro.LINK_WORDS[way]) == 'table';
end
check('each has a list of words', words_ok);
local function words(way) return table.concat(aggro.LINK_WORDS[way], ', '); end
check('their words', words('superlink') == 'Superlink' and words('sight') == 'Sight' and words('true_sight') == 'True Sight'
    and words('sound') == 'Sound' and words('true_sound') == 'True Sound' and words('both') == 'Sight, Sound'
    and words('true_both') == 'True Sight, True Sound' and words('magic') == 'Magic' and #aggro.LINK_WORDS.neither == 0);

-- A made-up mix. Every name shows once, in order, and C counts once.
local MIX = { aggro = true, links = { superlink = { 'S' }, sight = { 'B', 'D' }, true_sound = { 'A', 'C' },
    neither = { 'C' } } };
a = readout(MIX, { con = 4 }, 75, { max_links = 0 });
expect('the mix names each once, in order', table.concat(a.names, ' '), 'A B C D S');
expect('each with how it links', table.concat(a.tags, '|'), 'True Sound|Sight|True Sound|Sight|Superlink');
a = readout(MIX, { con = 4 }, 75, { max_links = 3 });
check('the most shown counts names, each once', table.concat(a.names, ' ') == 'A B C' and a.more == 2
    and table.concat(a.tags, '|') == 'True Sound|Sight|True Sound');
a = readout(MIX, { con = 4 }, 75, { link_names = false });
expect('names off lists each word once, in a fixed order', table.concat(a.senses, ', '), 'Superlink, Sight, True Sound');

-- A name in two groups shows both, unless one has no words.
local function tags_of(links)
    return table.concat(readout({ links = links }, { con = 4 }, 75, { max_links = 0 }).tags, '|');
end
expect('a name that sees in one spot and hears in another', tags_of({ sight = { 'B' }, sound = { 'B' } }), 'Sight or Sound');
expect('one that hears and one that notices magic', tags_of({ sound = { 'M' }, magic = { 'M' } }), 'Sound or Magic');
expect('one that hears and one that notices none of those', tags_of({ sound = { 'R' }, neither = { 'R' } }), 'Sound');
expect('one that notices magic', tags_of({ magic = { 'Fire Elemental' } }), 'Magic');
expect('one that notices none of those has an empty tag', tags_of({ neither = { 'N' } }), '');
expect('both senses', tags_of({ both = { 'X' } }), 'Sight, Sound');
expect('both with true detection', tags_of({ true_both = { 'X' } }), 'True Sight, True Sound');
local function senses_of(links)
    return table.concat(readout({ links = links }, { con = 4 }, 75, { link_names = false }).senses, ', ');
end
expect('names off goes by the fixed order, not the groups', senses_of({ true_sound = { 'Y' }, true_both = { 'X' } }),
    'True Sight, True Sound');
expect('names off with magic', senses_of({ magic = { 'X' }, superlink = { 'Y' } }), 'Superlink, Magic');
expect('names off with only none of those has no words', senses_of({ neither = { 'N' } }), '');

-- The printout -------------------------------------------------------------------------------------

-- Only the aggro part, with two spaces between parts and the game's line shown.
local function settings()
    local s = defaults.make();
    s.printout.divider = 'spaces';
    for id, part in pairs(s.printout.parts) do part.on = (id == 'aggro'); end
    s.printout.replace_game_line = false;
    return s;
end
local function line(s, row, check_result, my_level)
    local r = { name = 'x', aggro = aggro.readout(row, check_result or { con = 4 }, my_level or 75, s.aggro) };
    return printout.lines(s, r)[1];
end
local function plain(s, row, check_result, my_level)
    local got = line(s, row, check_result, my_level);
    return got and MOCK.plain(got);
end

local s = settings();
local THUG = { aggro = true, detects = { 'sight' },
    links = { sight = { 'Goblin Digger', 'Goblin Fisher', 'Goblin Thug', 'Goblin Weaver' } } };
expect('aggressive with its links', plain(s, THUG), 'Aggro: Aggressive (Sight)  Links with Goblin Digger (Sight), '
    .. 'Goblin Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
expect('too weak', plain(s, THUG, { con = 0 }), 'Aggro: Too weak to aggro you unless you rest  Links with Goblin Digger '
    .. '(Sight), Goblin Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
expect('not aggressive and doesn\'t link', plain(s, {}), 'Aggro: Not aggressive  Doesn\'t link');
check('never aggressive', plain(s, { no_aggro = true }) == 'Aggro: Never aggressive  Doesn\'t link');
expect('a range across the cutoff', plain(s, AGGRESSIVE, { low = 50, high = 60 }),
    'Aggro: Aggressive if it\'s level 56 or higher (Sight)  Doesn\'t link');
check('an unknown level', plain(s, AGGRESSIVE, {}) == 'Aggro: Aggressive (level unknown) (Sight)  Doesn\'t link');
check('any level', plain(s, ANY, { con = 0 }) == 'Aggro: Aggressive at any level (Sight)  Doesn\'t link');
local ERUCA = { aggro = true, detects = { 'sound' }, aggro_note = 'sleeps', aggro_hours = { 6, 20 },
    flags = { scripted_aggro = true }, links = { sound = { 'Carmine Eruca' }, true_sound = { 'Flame Eruca' } } };
expect('notes after how it finds you', plain(s, ERUCA), 'Aggro: Aggressive (Sound) (awake 6:00-20:59) (can change in the '
    .. 'fight)  Links with Carmine Eruca (Sound), Flame Eruca (True Sound)');
s.aggro.detection = false;
check('Detection off', plain(s, THUG):find('^Aggro: Aggressive  Links with') ~= nil, plain(s, THUG));
expect('and the link tags stay', plain(s, THUG), 'Aggro: Aggressive  Links with Goblin Digger (Sight), Goblin Fisher (Sight), '
    .. 'Goblin Thug (Sight), Goblin Weaver (Sight)');
check('and the notes stay', plain(s, ERUCA):find('^Aggro: Aggressive %(awake') ~= nil, plain(s, ERUCA));
s.aggro.detection = true;
s.aggro.max_links = 2;
expect('the most names and "+N more" like drops', plain(s, THUG), 'Aggro: Aggressive (Sight)  Links with Goblin Digger '
    .. '(Sight), Goblin Fisher (Sight)  +2 more');
s.aggro.link_names = false;
expect('names off says Links and how they link', plain(s, THUG), 'Aggro: Aggressive (Sight)  Links (Sight)');
check('and Doesn\'t link stays', plain(s, AGGRESSIVE) == 'Aggro: Aggressive (Sight)  Doesn\'t link');
s.aggro.link_how = false;
expect('names off and Show how each one links off says just Links', plain(s, THUG), 'Aggro: Aggressive (Sight)  Links');
s.aggro.link_how = true;
s.aggro.max_links = 0;
local MIXED = { links = { superlink = { 'S' }, sight = { 'B', 'D' }, sound = { 'B' }, true_sound = { 'A', 'C' },
    magic = { 'M' }, neither = { 'C', 'N' } } };
expect('names off with every kind of group', plain(s, MIXED), 'Aggro: Not aggressive  Links (Superlink, Sight, Sound, '
    .. 'True Sound, Magic)');
expect('names off with only a group with no words is just Links', plain(s, { links = { neither = { 'N' } } }),
    'Aggro: Not aggressive  Links');
s.aggro.link_names = true;
expect('every name has its own tag, and one with no words has none', plain(s, MIXED), 'Aggro: Not aggressive  Links with '
    .. 'A (True Sound), B (Sight or Sound), C (True Sound), D (Sight), M (Magic), N, S (Superlink)');
s = settings();
s.printout.parts.aggro.label = '';
expect('an empty label leaves the value', plain(s, {}), 'Not aggressive  Doesn\'t link');
s.printout.parts.aggro.label = 'Aggro\226\128\148!';
expect('a label keeps printable ASCII', plain(s, {}), 'Aggro!: Not aggressive  Doesn\'t link');
s = settings();
s.printout.divider = 'pipe';
check('the divider goes inside the part too', plain(s, THUG):find('^Aggro: Aggressive %(Sight%) | Links with ') ~= nil,
    plain(s, THUG));
local names = { aggro = true, links = { sight = { 'Goblin\226\128\153s Pet' } } };
expect('link names are cleaned', plain(s, names), 'Aggro: Aggressive | Links with Goblins Pet (Sight)');
check('no row, no part', #printout.lines(s, { name = 'x' }) == 0);

-- Colors. Color by threat paints the verdict red or green. The rest take the label, words and detail colors.
s = settings();
s.printout.divider = 'pipe';
s.colors.aggro_label, s.colors.aggro_words, s.colors.aggro_detail = 3, 7, 67;
local raw = line(s, THUG);
check('Color by threat is on by default, aggressive in tomato', defaults.make().aggro.threat_colors == true
    and raw:find(color(3) .. 'Aggro' .. color(3) .. ': ' .. color(76) .. 'Aggressive' .. color(67) .. ' (Sight)'
    .. color(67) .. ' | ' .. color(7) .. 'Links with ' .. color(7) .. 'Goblin Digger' .. color(67) .. ' (Sight)'
    .. color(67) .. ', ' .. color(7) .. 'Goblin Fisher', 1, true) ~= nil, MOCK.plain(raw));
check('how each one links is in the detail color', raw:find(color(7) .. 'Goblin Weaver' .. color(67) .. ' (Sight)', 1, true)
    ~= nil, MOCK.plain(raw));
-- Show how each one links off gives back the same bytes as before it existed.
s.aggro.link_how = false;
raw = line(s, THUG);
local before = color(3) .. 'Aggro' .. color(3) .. ': ' .. color(76) .. 'Aggressive' .. color(67) .. ' (Sight)' .. color(67)
    .. ' | ' .. color(7) .. 'Links with ' .. color(7) .. 'Goblin Digger' .. color(67) .. ', ' .. color(7) .. 'Goblin Fisher'
    .. color(67) .. ', ' .. color(7) .. 'Goblin Thug' .. color(67) .. ', ' .. color(7) .. 'Goblin Weaver';
check('Show how each one links off is the old line to the byte', raw == color(s.colors.line) .. before, MOCK.plain(raw));
s.aggro.link_how = true;
check('too weak in green', line(s, THUG, { con = 0 }):find(color(2) .. 'Too weak', 1, true) ~= nil);
check('not aggressive in green', line(s, {}):find(color(2) .. 'Not aggressive' .. color(67) .. ' | ' .. color(7)
    .. 'Doesn\'t link', 1, true) ~= nil);
check('never aggressive in green', line(s, { no_aggro = true }):find(color(2) .. 'Never aggressive', 1, true) ~= nil);
check('a range in red', line(s, AGGRESSIVE, { low = 50, high = 60 }):find(color(76) .. 'Aggressive if', 1, true) ~= nil);
s.colors.aggro_threat, s.colors.aggro_safe = 5, 83;
check('the Threat and Safe colors are yours', line(s, THUG):find(color(5) .. 'Aggressive', 1, true) ~= nil
    and line(s, {}):find(color(83) .. 'Not aggressive', 1, true) ~= nil);
check('Color by threat on leaves the link tags in Details', line(s, THUG):find(color(7) .. 'Goblin Weaver' .. color(67)
    .. ' (Sight)', 1, true) ~= nil);
s.aggro.threat_colors = false;
check('Color by threat off paints the verdict in Words', line(s, THUG):find(color(7) .. 'Aggressive' .. color(67), 1, true)
    ~= nil and line(s, {}):find(color(7) .. 'Not aggressive', 1, true) ~= nil and not line(s, THUG):find(color(5), 1, true)
    and not line(s, {}):find(color(83), 1, true));
check('and off leaves them there too', line(s, THUG):find(color(7) .. 'Goblin Weaver' .. color(67) .. ' (Sight)', 1, true)
    ~= nil);
s.aggro.threat_colors = true;
s.aggro.max_links = 1;
check('"+N more" in the detail color', line(s, THUG):find('Goblin Digger' .. color(67) .. ' (Sight)' .. color(67)
    .. ' | +3 more', 1, true) ~= nil, MOCK.plain(line(s, THUG)));
local aggro_keys = {};
for _, group in ipairs(printout.COLOR_GROUPS) do
    if (group.name == 'Aggro') then
        for _, entry in ipairs(group.colors) do aggro_keys[#aggro_keys + 1] = entry.key; end
    end
end
aggro_keys = table.concat(aggro_keys, ',');
check('the Colors tab heading holds five aggro colors',
    aggro_keys == 'aggro_label,aggro_words,aggro_detail,aggro_threat,aggro_safe', aggro_keys);
local skins = require('ui.skins');
local red_green = true;
for _, skin in ipairs(skins.LIST) do
    if (skin.id ~= 'minimal' and skin.id ~= 'colorblind') then
        red_green = red_green and (skin.chat.aggro_threat == 76 or skin.chat.aggro_threat == 68)
            and (skin.chat.aggro_safe == 2 or skin.chat.aggro_safe == 79 or skin.chat.aggro_safe == 80
            or skin.chat.aggro_safe == 83);
    end
end
check('every skin but Minimal and Colorblind safe has a red Threat and a green Safe', red_green);

-- Its place in the printout. After crit, on its own line by default.
check('aggro comes after crit in the default order', printout.DEFAULT_ORDER == 'difficulty hit evade crit aggro magic immunities '
    .. 'elements drops pet', printout.DEFAULT_ORDER);
local d = defaults.make();
check('on by default, labeled Aggro, on its own line', d.printout.parts.aggro.on == true and d.printout.parts.aggro.label == 'Aggro'
    and d.printout.parts.aggro.new_line == true);
check('its settings default to on, on, on, 5 and on', d.aggro.threat_colors == true and d.aggro.detection == true
    and d.aggro.link_names == true and d.aggro.max_links == 5 and d.aggro.link_how == true);
s = defaults.make();
s.printout.divider = 'spaces';
for _, part in pairs(s.printout.parts) do part.on = true; end
local r = { name = 'Goblin Thug', low = 8, high = 8, con = 4, hit = { low = 90, high = 90 }, evade = { low = 30, high = 30 },
    crit = { low = 7, high = 7 }, aggro = aggro.readout(THUG, { con = 4 }, 75, s.aggro), immune = { 'bind' } };
local lines = {};
for i, each in ipairs(printout.lines(s, r)) do lines[i] = MOCK.plain(each); end
check('its own line after hit, evade and crit', #lines == 4 and lines[1] == 'Goblin Thug (Lv 8)  Even Match'
    and lines[2] == 'Hit: 90%  Evade: 30%  Crit: 7%' and lines[3]:find('^Aggro: Aggressive') ~= nil
    and lines[4] == 'Immune: Bind', table.concat(lines, ' / '));
s.printout.parts.aggro.new_line = false;
lines = {};
for i, each in ipairs(printout.lines(s, r)) do lines[i] = MOCK.plain(each); end
check('New line off puts it after crit', lines[2]:find('^Hit: 90%%  Evade: 30%%  Crit: 7%%  Aggro: Aggressive') ~= nil, lines[2]);
s.printout.extras_own_line = false;
s.printout.parts.aggro.new_line = true;
lines = {};
for i, each in ipairs(printout.lines(s, r)) do lines[i] = MOCK.plain(each); end
check('with the extras on the /check line it still starts its own', #lines == 3 and lines[2]:find('^Aggro') ~= nil,
    table.concat(lines, ' / '));

-- Through the addon, with the real data ------------------------------------------------------------

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local cur = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read.
cur.printout.divider = 'spaces';
MOCK.player.main_level = 75;

-- Your /check of a real monster with only the default parts on. Returns the aggro line, or the lines
-- joined when there's no second line. Zoning forgets widescan, so it only zones when the zone changes.
local function real(zone, index, name, level, con, message)
    if (MOCK.player.zone ~= zone) then
        MOCK.zone_in(zone);
    end
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    MOCK.packet(MOCK.check_packet(index, level, con, message or 174));
    MOCK.frame();
    local got = MOCK.printed_since(n);
    return got[2] or table.concat(got, ' / '), got[1];
end

local first;
text, first = real(101, 146, 'Goblin Thug', 8, 4);
check('East Ronfaure Goblin Thug prints the aggro line under the /check', first == '[checkmate] Goblin Thug (Lv 8)  Even Match',
    first);
expect('East Ronfaure Goblin Thug', text, '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Digger (Sight), Goblin '
    .. 'Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
expect('and too weak at con 0', real(101, 146, 'Goblin Thug', 3, 0), '[checkmate] Aggro: Too weak to aggro you unless you rest  '
    .. 'Links with Goblin Digger (Sight), Goblin Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
expect('Goblin Digger, one spawn, doesn\'t list its own name', real(101, 404, 'Goblin Digger', 8, 4),
    '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
expect('Wild Rabbit', real(101, 6, 'Wild Rabbit', 1, 0), '[checkmate] Aggro: Not aggressive  Doesn\'t link');
expect('Orcish Fodder sees you', real(101, 75, 'Orcish Fodder', 8, 4), '[checkmate] Aggro: Aggressive (Sight)  Links with '
    .. 'Orcish Fodder (Sight), Orcish Grappler (Sight), Orcish Mesmerizer (Sight)');
expect('Zeruhn Mouse Bat links through the Ding Bats', real(172, 17, 'Mouse Bat', 3, 2),
    '[checkmate] Aggro: Not aggressive  Links with Ding Bats (Sound), Mouse Bat (Sound)');
expect('Beady Beetle', real(192, 74, 'Beady Beetle', 14, 4), '[checkmate] Aggro: Aggressive (Sight)  Links with Beady Beetle '
    .. '(Sight)');
expect('Carmine Eruca sleeps at night', real(51, 193, 'Carmine Eruca', 70, 4),
    '[checkmate] Aggro: Aggressive (Sound) (awake 6:00-20:59)  Links with Carmine Eruca (Sound), Flame Eruca (True Sound)');
expect('Jnun never wakes', real(79, 80, 'Jnun', 72, 5), '[checkmate] Aggro: Not aggressive (always asleep)  Doesn\'t link');
expect('Wild Karakul', real(79, 70, 'Wild Karakul', 68, 4), '[checkmate] Aggro: Not aggressive (awake 6:00-19:59)  Doesn\'t link');
expect('Orderly Imp sees you at night', real(79, 40, 'Orderly Imp', 65, 4), '[checkmate] Aggro: Aggressive (True Sight 18:00-5:59, '
    .. 'True Sound)  Links with Dark Bugler (True Sight, True Sound), Heraldic Imp (True Sound), Orderly Imp (True Sound), '
    .. 'Verdelet (True Sight, True Sound), Zikko (True Sight, True Sound)');
-- Fomor Ninja 130 leads a patrol with a Fomor Monk and superlinks with it, and other Fomor Monks join by sound.
-- Fomor Ninja 247 guards a campfire with its own party, so it has a row of its own.
expect('Fomor Ninja needs fomor hate, and its party superlinks', real(24, 130, 'Fomor Ninja', 60, 4),
    '[checkmate] Aggro: Aggressive (Sound, Low HP) (only if you have fomor hate)  Links with Fomor Bard (Sound), '
    .. 'Fomor Monk (Superlink or Sound), Fomor Red Mage (Sound), Fomor Warrior (Sound)');
expect('and Fomor Ninja 247 only with its campfire party', real(24, 247, 'Fomor Ninja', 60, 4),
    '[checkmate] Aggro: Aggressive (Sound, Low HP) (only if you have fomor hate)  Links with Fomor Monk (Superlink), '
    .. 'Fomor Samurai (Superlink), Fomor Thief (Superlink)');
expect('a Fomor Paladin at Bluefell Falls links only with its guard', real(24, 145, 'Fomor Paladin', 80, 4),
    '[checkmate] Aggro: Aggressive (Sound, Low HP) (only if you have fomor hate)  Links with Fomor Black Mage (Superlink), '
    .. 'Fomor Dark Knight (Superlink), Fomor Dragoon (Superlink)');
expect('Eoghrah', real(34, 1, 'Eoghrah', 76, 4),
    '[checkmate] Aggro: Aggressive (True Sound) (not in its ball form)  Doesn\'t link');
expect('Eoeuvhi keeps its mouth shut', real(34, 10, 'Eoeuvhi', 75, 4), '[checkmate] Aggro: Not aggressive  Links with Eoeuvhi '
    .. '(Sound)');
expect('Zhayolm Apkallu', real(61, 148, 'Zhayolm Apkallu', 72, 4),
    '[checkmate] Aggro: Not aggressive (changes with the zone\'s apkallu hate)  Doesn\'t link');
expect('Pond Sahagin gets no help', real(176, 17, 'Pond Sahagin', 37, 3), '[checkmate] Aggro: Aggressive (Sound)  Doesn\'t link');
expect('Cactrot Rapido calls no one', real(114, 379, 'Cactrot Rapido', 0, nil, 249), '[checkmate] Aggro: Not aggressive  '
    .. 'Doesn\'t link');

-- Impossible to gauge, against the Too Weak table at your level 75.
expect('Faust aggroes at any level', real(178, 66, 'Faust', 0, nil, 249),
    '[checkmate] Aggro: Aggressive at any level (Sight, Magic)  Doesn\'t link');
expect('Morbolger too', real(193, 383, 'Morbolger', 0, nil, 249), '[checkmate] Aggro: Aggressive at any level (Sound)  '
    .. 'Doesn\'t link');
expect('Morion Worm at 28 is too weak for you', real(173, 366, 'Morion Worm', 0, nil, 249),
    '[checkmate] Aggro: Too weak to aggro you unless you rest (only above ground)  Links with Land Worm (Sound)');
MOCK.player.main_level = 30;
expect('and aggroes a level 30', real(173, 366, 'Morion Worm', 0, nil, 249),
    '[checkmate] Aggro: Aggressive (Sound) (only above ground)  Links with Land Worm (Sound)');
MOCK.player.main_level = 75;
expect('Cactuar Cantautor at 55 to 59', real(125, 344, 'Cactuar Cantautor', 0, nil, 249),
    '[checkmate] Aggro: Aggressive if it\'s level 56 or higher (Sound)  Doesn\'t link');
MOCK.packet(MOCK.widescan_packet(344, 55));
expect('widescan at 55 makes it too weak', real(125, 344, 'Cactuar Cantautor', 0, nil, 249),
    '[checkmate] Aggro: Too weak to aggro you unless you rest  Doesn\'t link');
MOCK.packet(MOCK.widescan_packet(344, 58));
expect('and at 58 aggressive', real(125, 344, 'Cactuar Cantautor', 0, nil, 249),
    '[checkmate] Aggro: Aggressive (Sound)  Doesn\'t link');
expect('Al\'Taieu Aweuvhi never aggroes', real(33, 427, 'Aweuvhi', 0, nil, 249), '[checkmate] Aggro: Never aggressive  '
    .. 'Doesn\'t link');
expect('Jailer of Justice links its Qn\'xzomit', real(33, 455, 'Jailer of Justice', 0, nil, 249),
    '[checkmate] Aggro: Aggressive (True Sight)  Links with Qnxzomit (Superlink)');
expect('Vanguard Liberator in Dynamis links the whole zone', real(134, 2, 'Vanguard Liberator', 0, nil, 249),
    '[checkmate] Aggro: Aggressive (True Sight, True Sound)  Links with Adamantking Effigy (True Sight, True Sound), Angra '
    .. 'Mainyu (True Sight, True Sound), Ascetox Ratgums (True Sight, True Sound), Avatar Icon (True Sight, True Sound), '
    .. 'BeZhe Keeprazer (True Sight, True Sound)  +147 more');
-- The level cap of a battlefield lowers your main level, and the server goes by that.
MOCK.player.main_level = 40;
expect('Horlais Peak Huntfly under its level 40 cap', real(139, 55, 'Huntfly', 0, nil, 249),
    '[checkmate] Aggro: Aggressive (Sound)  Links with Houndfly (Superlink)');
MOCK.player.main_level = 75;
expect('and too weak for a 75', real(139, 55, 'Huntfly', 0, nil, 249),
    '[checkmate] Aggro: Too weak to aggro you unless you rest  Links with Houndfly (Superlink)');
text = real(37, 4, 'Goblin Slaughterman', 0, nil, 249);
check('Temenos Goblin Slaughterman hears you and links its fight', text:find('^%[checkmate%] Aggro: Aggressive %(True '
    .. 'Sound%)  Links with Beli %(True Sound%), Cryptonberry Abductor %(True Sound%), Cryptonberry Charmer %(True Sound%), '
    .. 'Cryptonberry Designator %(True Sound%), Cryptonberry Skulker %(True Sound%)  %+22 more$') ~= nil, text);
expect('Mineral Eater in Leujaoam', real(69, 24, 'Mineral Eater', 77, 4),
    '[checkmate] Aggro: Aggressive (True Sound) (only above ground)  Links with Mineral Eater (True Sound)');
expect('K23H1-LAMIA aggroes at any level', real(56, 162, 'K23H1-LAMIA', 71, 0),
    '[checkmate] Aggro: Aggressive at any level (True Sight)  Links with K23H1-LAMIA (True Sight)');

-- How each one links, from the real data.
expect('Buburimu Peninsula Zu', real(118, 14, 'Zu', 20, 4),
    '[checkmate] Aggro: Not aggressive  Links with Abyssdiver (Sight), Helldiver (Sight), Zu (Sound)');
expect('Jailer of Love links through its superlink', real(33, 464, 'Jailer of Love', 0, nil, 249), '[checkmate] Aggro: Aggressive '
    .. '(True Sound)  Links with Qnhpemde (Superlink), Qnxzomit (Superlink), Ruphuabo (Superlink)');
expect('Carmine Dobsonfly superlinks its own and the Hawker hears', real(30, 134, 'Carmine Dobsonfly', 0, nil, 249),
    '[checkmate] Aggro: Not aggressive  Links with Carmine Dobsonfly (Superlink), Hawker (Sound)');
expect('a Hawker hears a Dobsonfly in, and that one superlinks the rest', real(30, 120, 'Hawker', 0, nil, 249),
    '[checkmate] Aggro: Not aggressive  Links with Carmine Dobsonfly (Superlink or Sound), Hawker (Sound)');
expect('a Memory Receptacle that hears and one that doesn\'t show once as Sound', real(23, 23, 'Memory Receptacle', 0, nil, 249),
    '[checkmate] Aggro: Not aggressive  Links with Contemplator (True Sound), Ingurgitator (True Sound), Memory Receptacle '
    .. '(Sound), Neoingurgitator (True Sound), Repiner (True Sound)');
expect('one that only notices scent gets nothing after its name', real(16, 29, 'Memory Receptacle', 30, 4),
    '[checkmate] Aggro: Not aggressive  Links with Memory Receptacle');
expect('Tonberry\'s Elemental notices magic', real(159, 12, 'Tonberrys Elemental', 50, 4),
    '[checkmate] Aggro: Aggressive (Magic)  Links with Clawberrys Elemental (Magic), Tonberrys Elemental (Magic)');

-- A monster with no data has no aggro part.
local plain_only = real(101, 2000, 'Nobody', 8, 4);
expect('no data, no aggro line', plain_only, '[checkmate] Nobody (Lv 8)  Even Match');

-- The settings through the commands.
MOCK.command('/checkmate detection off');
expect('/checkmate detection off', real(101, 146, 'Goblin Thug', 8, 4), '[checkmate] Aggro: Aggressive  Links with Goblin Digger '
    .. '(Sight), Goblin Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
MOCK.command('/checkmate detection on');
MOCK.command('/checkmate maxlinks 2');
expect('/checkmate maxlinks 2', real(101, 146, 'Goblin Thug', 8, 4), '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin '
    .. 'Digger (Sight), Goblin Fisher (Sight)  +2 more');
MOCK.command('/checkmate linknames off');
expect('/checkmate linknames off', real(101, 146, 'Goblin Thug', 8, 4), '[checkmate] Aggro: Aggressive (Sight)  Links (Sight)');
MOCK.command('/checkmate linkhow off');
expect('and /checkmate linkhow off too says just Links', real(101, 146, 'Goblin Thug', 8, 4),
    '[checkmate] Aggro: Aggressive (Sight)  Links');
MOCK.command('/checkmate linknames on');
MOCK.command('/checkmate maxlinks 5');
expect('/checkmate linkhow off gives the names without how they link', real(101, 146, 'Goblin Thug', 8, 4),
    '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Digger, Goblin Fisher, Goblin Thug, Goblin Weaver');
MOCK.command('/checkmate linkhow on');
expect('and on again', real(101, 146, 'Goblin Thug', 8, 4), '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Digger '
    .. '(Sight), Goblin Fisher (Sight), Goblin Thug (Sight), Goblin Weaver (Sight)');
MOCK.command('/checkmate maxlinks 5');
real(101, 146, 'Goblin Thug', 8, 4);
check('Color by threat reaches the chat bytes', MOCK.printed[#MOCK.printed]:find(color(76) .. 'Aggressive', 1, true) ~= nil);
MOCK.command('/checkmate threatcolors off');
real(101, 146, 'Goblin Thug', 8, 4);
check('and off', MOCK.printed[#MOCK.printed]:find(color(106) .. 'Aggressive', 1, true) ~= nil
    and not MOCK.printed[#MOCK.printed]:find(color(76), 1, true));
MOCK.command('/checkmate threatcolors on');
MOCK.command('/checkmate hide aggro');
local n = #MOCK.printed;
real(101, 146, 'Goblin Thug', 8, 4);
check('hide aggro leaves the /check line', #MOCK.printed == n + 1);

-- The sample has an aggro line.
MOCK.command('/checkmate show aggro');
n = #MOCK.printed;
MOCK.command('/checkmate sample');
lines = MOCK.printed_since(n);
check('the sample has an aggro line', #lines == 2 and lines[2] == '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin '
    .. 'Butcher (Sight), Goblin Leecher (Sight), Goblin Tinkerer (Sight)', table.concat(lines, ' / '));

return MOCK.report();
