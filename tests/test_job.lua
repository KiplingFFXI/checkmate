-- Tests the Job part. That covers the job letters and the support job rule, the 22 jobs and their artifact heads,
-- real monsters through a /check, the rows whose data names no job or whose job is set at spawn, the overlay's
-- pictures with Show icons off and on, Icons only and a picture that won't load, the settings and commands, and every
-- other line staying the same with it off.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local printout = require('core.printout');
local wording  = require('core.wording');
local monsters = require('core.monsters');
local icons    = require('ui.icons');
local skins    = require('ui.skins');
local function cur() return MOCK.settings.current; end

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
cur().printout.divider = 'spaces';

-- Runs a command and returns what it said.
local function run(text)
    local n = #MOCK.printed;
    MOCK.command(text);
    return table.concat(MOCK.printed_since(n), ' / ');
end

-- The tables -------------------------------------------------------------------------------------------

-- Each job's artifact head at phoenix/live, from item_basic.sql and item_equipment.sql, in the game's job order.
local JOBS = { 'war', 'mnk', 'whm', 'blm', 'rdm', 'thf', 'pld', 'drk', 'bst', 'brd', 'rng', 'sam', 'nin', 'drg', 'smn',
    'blu', 'cor', 'pup', 'dnc', 'sch', 'geo', 'run' };
local HEADS = { war = 12511, mnk = 12512, whm = 13855, blm = 13856, rdm = 12513, thf = 12514, pld = 12515,
    drk = 12516, bst = 12517, brd = 13857, rng = 12518, sam = 13868, nin = 13869, drg = 12519, smn = 12520,
    blu = 15265, cor = 15266, pup = 15267, dnc = 16138, sch = 16140, geo = 27786, run = 27787 };

local count, wrong, ids = 0, {}, {};
for key, id in pairs(icons.JOB_ITEMS) do
    count = count + 1;
    if (HEADS[key] ~= id) then wrong[#wrong + 1] = key; end
    ids[id] = true;
end
local distinct = 0;
for _ in pairs(ids) do distinct = distinct + 1; end
check('icons.JOB_ITEMS has the 22 artifact heads, each its own item', count == 22 and #wrong == 0 and distinct == 22,
    count .. ' ' .. table.concat(wrong, ','));
count, wrong = 0, {};
for _, entry in ipairs(wording.LIST) do
    local key = entry.key:match('^job_(%l+)$');
    if (key ~= nil) then
        count = count + 1;
        if (entry.full ~= key:upper() or icons.JOB_ITEMS[key] == nil) then wrong[#wrong + 1] = key; end
    end
end
check('every job has its letters and a head, and none is "none"', count == 22 and #wrong == 0
    and wording.BY_KEY.job_none == nil, count .. ' ' .. table.concat(wrong, ','));

local part = cur().printout.parts.job;
check('it starts off, labeled Job, on its own line', part.on == false and part.label == 'Job' and part.new_line == true);
check('right after crit taken in the default order',
    printout.DEFAULT_ORDER:find('crit crittaken job aggro', 1, true) ~= nil, printout.DEFAULT_ORDER);
check('and off in the overlay', cur().overlay.parts.job == false);
check('its three colors are cream', cur().colors.job_label == 106 and cur().colors.job_name == 106
    and cur().colors.job_detail == 106);

-- The value --------------------------------------------------------------------------------------------

-- The lines for a made-up monster with `job`, without color codes, joined with ' / '.
local function lines_for(job, more)
    local result = { name = 'Mob', low = 10, high = 10, con = 3, job = job };
    for key, value in pairs(more or {}) do result[key] = value; end
    local lines = printout.lines(cur(), result);
    for i, each in ipairs(lines) do lines[i] = MOCK.plain(each); end
    return table.concat(lines, ' / ');
end

local off_lines = lines_for('drk/war');
expect('with it off there is no Job line', off_lines, 'Mob (Lv 10)  Decent Challenge');
cur().printout.parts.job.on = true;
expect('a different support job shows both', lines_for('drk/war'), 'Mob (Lv 10)  Decent Challenge / Job: DRK/WAR');
expect('the same support job shows once', lines_for('drk/drk'), 'Mob (Lv 10)  Decent Challenge / Job: DRK');
expect('no support job shows the main job', lines_for('war/none'), 'Mob (Lv 10)  Decent Challenge / Job: WAR');
for _, job in ipairs({ '', 'drk', 'bogus/war', 'DRK/WAR', 'drk/war/thf' }) do
    expect('no Job line for "' .. job .. '"', lines_for(job), off_lines);
end
expect('no Job line with no job', lines_for(nil), off_lines);
expect('a support job it has no letters for is left off', lines_for('war/bogus'),
    'Mob (Lv 10)  Decent Challenge / Job: WAR');
for _, key in ipairs(JOBS) do
    expect('the letters for ' .. key, lines_for(key .. '/' .. key), 'Mob (Lv 10)  Decent Challenge / Job: '
        .. key:upper());
end

-- Its three colors, each its own run, so the slash stays apart from the letters.
local c = cur();
c.colors.job_label, c.colors.job_name, c.colors.job_detail = 7, 6, 67;
local raw = printout.lines(c, { name = 'Mob', low = 10, high = 10, con = 3, job = 'drk/war' })[2];
local function code(color) return '\30' .. string.char(color); end
expect('the label in job_label, the letters in job_name and the slash in job_detail', raw,
    code(106) .. code(7) .. 'Job' .. code(7) .. ': ' .. code(6) .. 'DRK' .. code(67) .. '/' .. code(6) .. 'WAR');
c.colors.job_label, c.colors.job_name, c.colors.job_detail = 106, 106, 106;

c.printout.parts.job.label = '';
expect('a cleared label prints the jobs alone', lines_for('drk/war'), 'Mob (Lv 10)  Decent Challenge / DRK/WAR');
c.printout.parts.job.label = 'Job';
c.printout.parts.crit.on, c.printout.parts.job.new_line = true, false;
expect('New line off puts it on the line with crit', lines_for('drk/war', { crit = { low = 7, high = 7 } }),
    'Mob (Lv 10)  Decent Challenge / Crit: 7%  Job: DRK/WAR');
c.printout.parts.crit.on, c.printout.parts.job.new_line = false, true;

-- Never a mark in chat, whatever the overlay's icons are set to.
c.overlay.icons, c.overlay.icons_only = true, true;
c.printout.icons, c.printout.icons_only = true, true;
local all = table.concat(printout.lines(c, { name = 'Mob', low = 10, high = 10, con = 3, job = 'drk/war' }), '');
check('no mark in a chat line with every icon setting on', not all:find('\29', 1, true), all);
c.printout.icons, c.printout.icons_only = false, false;
c.overlay.icons_only = false;
c.printout.parts.job.on = false;

-- Through a /check of the real data ----------------------------------------------------------------------

-- Your /check of the monster at `index` in `zone`. Returns its lines once they've all printed. An NM's has no
-- level and message 249.
local function readout(zone, index, name, level, con)
    MOCK.zone_in(zone);
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    if (level == nil) then
        MOCK.packet(MOCK.check_packet(index, 0, nil, 249));
    else
        MOCK.packet(MOCK.check_packet(index, level, con, 174));
    end
    MOCK.wait(1.6);
    MOCK.reply(300, 250);
    MOCK.frame();
    return MOCK.printed_since(n);
end
-- That /check's Job line, or "none".
local function job_line(zone, index, name, level, con)
    for _, line in ipairs(readout(zone, index, name, level, con)) do
        if (line:find('^%[checkmate%] Job')) then return line; end
    end
    return 'none';
end

-- Every /check below, for the check that the lines are the same with the part off as with no jobs in the data.
local CHECKS = {
    { 103, 98, 'Goblin Tinkerer', 19, 3, '[checkmate] Job: DRK' },
    { 103, 82, 'Fire Elemental', 39, 0, '[checkmate] Job: BLM/RDM' },
    { 103, 34, 'Ghoul', 30, 0, 'none' },
    { 103, 76, 'Ghoul', 30, 0, '[checkmate] Job: BLM' },
    { 103, 334, 'Valkurm Emperor', nil, nil, 'none' },
    { 100, 71, 'Orcish Grappler', 10, 3, '[checkmate] Job: MNK/WAR' },
    { 139, 25, 'Maat', 50, 3, '[checkmate] Job: WAR' },
    { 127, 44, 'Pil', nil, nil, '[checkmate] Job: BLM/SCH' },
    { 13, 45, 'Fantoccini', 50, 3, 'none' },
    { 52, 112, 'Trolls Automaton', 70, 3, 'none' },
    { 103, 4000, 'Nobody', 20, 3, 'none' },
};
local why = {
    [34] = 'a Ghoul whose data names no job has none', [76] = 'and the one at 76 is a BLM',
    [334] = 'Valkurm Emperor, whose data names no job, has none', [45] = 'Fantoccini, whose job is set at spawn, has none',
    [112] = 'nor the Trolls\' automatons', [4000] = 'nor a monster with no data',
};

check('a /check with the part off has no Job line', job_line(103, 98, 'Goblin Tinkerer', 19, 3) == 'none');
run('/checkmate show job');
local lines = readout(103, 98, 'Goblin Tinkerer', 19, 3);
check('Goblin Tinkerer is a DRK on a line of its own, before its aggro', lines[1]
    == '[checkmate] Goblin Tinkerer (Lv 19)  Decent Challenge' and lines[2] == '[checkmate] Job: DRK'
    and (lines[3] or ''):find('^%[checkmate%] Aggro:') ~= nil, table.concat(lines, ' / '));
for _, each in ipairs(CHECKS) do
    expect(why[each[2]] or (each[3] .. ' in zone ' .. each[1]), job_line(each[1], each[2], each[3], each[4], each[5]),
        each[6]);
end

-- With Hit rate on too, the Job line waits for the /checkparam reply with the lines under it. Moved above Hit
-- rate, with Hit rate on a new line, it prints right away with the name.
run('/checkmate show hit');
run('/checkmate newline hit on');
local function before_reply(index, name, level)
    MOCK.zone_in(103);
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    MOCK.packet(MOCK.check_packet(index, level, 3, 174));
    MOCK.frame();
    local first = table.concat(MOCK.printed_since(n), ' / ');
    MOCK.wait(1.6);
    MOCK.reply(300, 250);
    MOCK.frame();
    return first, table.concat(MOCK.printed_since(n), ' / ');
end
local first, after = before_reply(98, 'Goblin Tinkerer', 19);
check('under Hit rate it waits for the reply', not first:find('Job', 1, true)
    and after:find('Hit: [^/]+ / %[checkmate%] Job: DRK / %[checkmate%] Aggro') ~= nil, first .. ' // ' .. after);
for _ = 1, 11 do run('/checkmate move job up'); end
first = before_reply(98, 'Goblin Tinkerer', 19);
check('above Hit rate it prints with the name', first == '[checkmate] Goblin Tinkerer (Lv 19)  Decent Challenge / '
    .. '[checkmate] Job: DRK', first);
for _ = 1, 11 do run('/checkmate move job down'); end
run('/checkmate newline hit off');
run('/checkmate hide hit');
check('and moves back', cur().printout.order == printout.DEFAULT_ORDER, cur().printout.order);

-- The sample is a DRK with a WAR support job.
expect('the sample shows both jobs', run('/checkmate sample'):match('%[checkmate%] Job: [%u/]+'), '[checkmate] Job: DRK/WAR');

-- Each row as if the data had no jobs. A zone in loads the file again, so the job goes as the row is found.
local real_find = monsters.find;
local function without_jobs(zone, id, name)
    local row = real_find(zone, id, name);
    if (row ~= nil) then
        row.job = nil;
    end
    return row;
end
-- Every line of every /check above, with their color codes.
local function every_check()
    local out = {};
    for _, each in ipairs(CHECKS) do
        local n = #MOCK.printed;
        readout(each[1], each[2], each[3], each[4], each[5]);
        for i = n + 1, #MOCK.printed do out[#out + 1] = MOCK.printed[i]; end
    end
    return table.concat(out, '\n');
end
local with_jobs = every_check();
check('with the part on the real data prints Job lines', with_jobs:find('Job', 1, true) ~= nil);
monsters.find = without_jobs;
check('and the swap takes them out', not every_check():find('Job', 1, true));
run('/checkmate hide job');
local off_without = every_check();
monsters.find = real_find;
local off_with = every_check();
check('with the part off every line is the same as with no jobs in the data', off_with == off_without
    and off_with ~= '' and not off_with:find('Job', 1, true));

-- The overlay ------------------------------------------------------------------------------------------

-- One frame. Returns the overlay's lines joined with ' // '.
local function frame()
    MOCK.frame();
    return table.concat(MOCK.overlay_lines(), ' // ');
end
-- The overlay's Job line on the next frame, or "none".
local function job_shown()
    frame();
    for _, line in ipairs(MOCK.overlay_lines()) do
        if (line:find('^Job')) then return line; end
    end
    return 'none';
end
-- The overlay's Job line for the monster at `index` in `zone`, targeted fresh. Zone 900 is the fixture.
local function overlay_job(zone, index, name)
    addon.path = (zone == 900) and FIXTURES_PATH or ADDON_PATH;
    if (MOCK.player.zone ~= zone) then MOCK.zone_in(zone); end
    MOCK.target.slot0 = 0;
    frame();
    MOCK.target_monster(index, name);
    return job_shown();
end

-- Show icons off first, so no head is ever looked up.
for _, id in pairs(HEADS) do MOCK.picture('item', id); end
run('/checkmate overlayicons off');
run('/checkmate overlay on');
run('/checkmate overlayshow job');
expect('with Show icons off the overlay shows the letters', overlay_job(103, 82, 'Fire Elemental'), 'Job: BLM/RDM');
check('and looks no head up', MOCK.item_lookups_of[13856] == nil and MOCK.item_lookups_of[12513] == nil);
run('/checkmate overlayicons on');
expect('with it on each job has its head', overlay_job(103, 82, 'Fire Elemental'),
    'Job: [item 13856] BLM/[item 12513] RDM');
check('each looked up once', MOCK.item_lookups_of[13856] == 1 and MOCK.item_lookups_of[12513] == 1);
expect('Goblin Tinkerer shows its head before any /check', overlay_job(103, 98, 'Goblin Tinkerer'),
    'Job: [item 12516] DRK');
expect('Maat has no second head for his missing support job', overlay_job(139, 25, 'Maat'), 'Job: [item 12511] WAR');
expect('a monster whose data names no job shows none', overlay_job(103, 334, 'Valkurm Emperor'), 'none');

-- All 22 through the fixture goblin. No zoning in here, since that would load its own job back.
overlay_job(900, 1, 'Fixture Goblin');
local forced = nil;
monsters.find = function (zone, id, name)
    local row = real_find(zone, id, name);
    if (row ~= nil and forced ~= nil) then row.job = forced; end
    return row;
end
local loads, bad = MOCK.texture_loads, MOCK.bad_texture_calls;
-- The Fire Elemental, the Tinkerer, Maat and the Fixture Goblin already loaded these.
local loaded = { [13856] = true, [12513] = true, [12516] = true, [12511] = true, [12514] = true };
local new_heads = 0;
for _, key in ipairs(JOBS) do
    forced = key .. '/' .. key;
    run('/checkmate overlayshow job');
    expect('the ' .. key .. ' head', job_shown(), ('Job: [item %d] %s'):format(HEADS[key], key:upper()));
    if (not loaded[HEADS[key]]) then new_heads, loaded[HEADS[key]] = new_heads + 1, true; end
end
check('each new head loads once', MOCK.texture_loads - loads == new_heads and new_heads == 17,
    (MOCK.texture_loads - loads) .. ' for ' .. new_heads);
check('with every load the real call would take', MOCK.bad_texture_calls == bad);
forced = nil;
monsters.find = real_find;

-- Icons only keeps the slash between the pictures. MNK's and PLD's look alike, and still lose their letters.
run('/checkmate overlayiconsonly on');
expect('Icons only shows the two heads with the slash', overlay_job(103, 82, 'Fire Elemental'),
    'Job: [item 13856]/[item 12513]');
expect('the Fixture Tinkerer\'s MNK and PLD too', overlay_job(900, 40, 'Fixture Tinkerer'),
    'Job: [item 12512]/[item 12515]');
expect('the Fixture Goblin\'s WAR and THF', overlay_job(900, 1, 'Fixture Goblin'), 'Job: [item 12511]/[item 12514]');
expect('the Fixture NM\'s BLM once', overlay_job(900, 400, 'Fixture NM'), 'Job: [item 13856]');
expect('the Fixture Knight\'s PLD with no support job', overlay_job(900, 30, 'Fixture Knight'), 'Job: [item 12515]');
expect('and nothing for the Fixture Worm', overlay_job(900, 10, 'Fixture Worm'), 'none');
run('/checkmate overlayiconsonly off');

-- A head that won't load shows its letters alone. icons.clear forgets the heads, the way an unload does.
icons.clear();
MOCK.picture('item', 13856, 'broken');
expect('a head that won\'t load leaves its letters', overlay_job(103, 82, 'Fire Elemental'),
    'Job: BLM/[item 12513] RDM');
run('/checkmate overlayiconsonly on');
expect('and keeps them with Icons only', overlay_job(103, 82, 'Fire Elemental'), 'Job: BLM/[item 12513]');
run('/checkmate overlayiconsonly off');
icons.clear();
MOCK.texture_error = true;
local n = #MOCK.printed;
expect('a load that raises keeps the letters', overlay_job(103, 98, 'Goblin Tinkerer'), 'Job: DRK');
check('and the overlay keeps going', not table.concat(MOCK.printed_since(n), ' / '):find('stopped', 1, true)
    and cur().overlay.on == true);
MOCK.texture_error = false;
icons.clear();
MOCK.picture('item', 13856);

-- Each head loads once, and a steady frame looks nothing up.
expect('back to both heads', overlay_job(103, 82, 'Fire Elemental'), 'Job: [item 13856] BLM/[item 12513] RDM');
expect('and the Tinkerer\'s', overlay_job(103, 98, 'Goblin Tinkerer'), 'Job: [item 12516] DRK');
loads = MOCK.texture_loads;
overlay_job(103, 82, 'Fire Elemental');
overlay_job(103, 98, 'Goblin Tinkerer');
MOCK.zone_in(103);
overlay_job(103, 82, 'Fire Elemental');
check('targeting back and forth and zoning loads none again', MOCK.texture_loads == loads,
    'loads ' .. (MOCK.texture_loads - loads));
local lookups;
loads, lookups = MOCK.texture_loads, MOCK.item_lookups;
for _ = 1, 30 do frame(); end
check('30 steady frames look nothing up and load nothing', MOCK.texture_loads == loads and MOCK.item_lookups == lookups);

run('/checkmate overlayhide job');
check('with its part off the overlay has no Job line', not frame():find('Job', 1, true));

-- The chat stays the same with the overlay's Job part and pictures on or off.
local function chat_bytes()
    local n = #MOCK.printed;
    readout(103, 82, 'Fire Elemental', 39, 0);
    return table.concat(MOCK.printed, '\n', n + 1);
end
run('/checkmate overlayicons off');
local plain_chat = chat_bytes();
run('/checkmate overlayshow job');
run('/checkmate overlayicons on');
check('the chat is the same with the overlay\'s Job part and pictures on', chat_bytes() == plain_chat);

-- The sample goblin, while the settings window is open and nothing is targeted.
MOCK.target.slot0 = 0;
MOCK.command('/checkmate');
local sample = frame();
check('the sample goblin shows both heads', sample:find('Job: [item 12516] DRK/[item 12511] WAR', 1, true) ~= nil,
    sample);
MOCK.command('/checkmate');
run('/checkmate overlay off');

-- Settings and commands ----------------------------------------------------------------------------------

-- Reset asks first, then goes ahead on the second one.
run('/checkmate reset');
run('/checkmate reset');
local ANSWERS = {
    { '/checkmate show job', '[checkmate] checkmate now shows the job part.' },
    { '/checkmate hide job', '[checkmate] checkmate no longer shows the job part.' },
    { '/checkmate label job Class', '[checkmate] The job part\'s label is now "Class".' },
    { '/checkmate newline job off', '[checkmate] The job part no longer starts a new line.' },
    { '/checkmate move job up', '[checkmate] The job part moved up, so the parts after the name now go difficulty, hit, '
        .. 'pdif, offhand, offhandpdif, ranged, rangedpdif, evade, block, parry, crit, job, crittaken, aggro, links, magic, weaknesses, effects, family, vitals, movement, '
        .. 'pursuit, spawn, claim, dangers, blue, fight, traits, crystal, rewards, drops, steal, pet.' },
    { '/checkmate overlayshow job', '[checkmate] The overlay now shows the job part.' },
    { '/checkmate color job_name coral', '[checkmate] The job_name color is now Coral.' },
};
for _, each in ipairs(ANSWERS) do
    local saved = MOCK.saved;
    expect(each[1], run(each[1]), each[2]);
    check(each[1] .. ' saves once', MOCK.saved == saved + 1, MOCK.saved - saved);
end
check('and they all took', cur().printout.parts.job.label == 'Class' and cur().printout.parts.job.new_line == false
    and cur().overlay.parts.job == true and cur().colors.job_name == 8);

-- A Classic settings file from before the Job part gets it off, right after crit taken, with Classic's job colors.
local classic = skins.find('classic');
local old_colors = {};
for _, key in ipairs(printout.COLOR_KEYS) do
    if (not key:find('^job_')) then old_colors[key] = classic.chat[key]; end
end
MOCK.settings.switch_character({ look = { skin = 'classic' }, colors = old_colors,
    printout = { con_colors = classic.chat.con_colors,
        order = 'difficulty hit offhand ranged evade crit aggro magic immunities effects elements drops steal pet' } });
local old = cur();
check('a file from before gets the part off, labeled Job, on its own line', old.printout.parts.job.on == false
    and old.printout.parts.job.label == 'Job' and old.printout.parts.job.new_line == true
    and old.overlay.parts.job == false);
check('right after crit taken in its order', old.printout.order
    == 'difficulty hit pdif offhand offhandpdif ranged rangedpdif evade block parry crit crittaken job aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet',
    old.printout.order);
check('with Classic\'s job colors', old.colors.job_label == 7 and old.colors.job_name == 106
    and old.colors.job_detail == 67, ('%s,%s,%s'):format(old.colors.job_label, old.colors.job_name,
    old.colors.job_detail));
check('and it\'s still Classic', old.look.skin == 'classic' and skins.current(old) == classic);

return MOCK.report();
