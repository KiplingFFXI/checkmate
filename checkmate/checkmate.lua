addon.name    = 'checkmate';
addon.author  = 'Kipling';
addon.version = '1.0.1';
addon.desc    = 'Hit, evade, crit, aggro, magic, immunities, elements and drops on /check for Phoenix.';
addon.link    = 'https://github.com/KiplingFFXI/checkmate';

--[[
    checkmate reads the /check and widescan replies the server already sends you, your own stats,
    skills, buffs and gear from game memory, and the monster data it ships with. After your own
    /check of a monster it prints what it found in chat. When it loads, it reads the fonts its
    settings window offers from the Windows fonts folder.
    It hides the game's own line for your /check, and its lines take that line's place. You can turn
    that off in the settings window or with /checkmate replace off.
    With hit rate or evade turned on, it sends /checkparam <me> a second and a half after your /check
    of a monster comes back and hides the six reply lines to that one request. The game ignores a
    /checkparam sent right after a /check. The wait also lets advcheck's, sent at 0.99 s, go first when
    it's loaded. It never sends or hides anything else.
]]

require('common');

local settings = require('settings');

local packets    = require('core.packets');
local player     = require('core.player');
local monsters   = require('core.monsters');
local checkparam = require('core.checkparam');
local physical   = require('core.physical');
local aggro      = require('core.aggro');
local magic      = require('core.magic');
local elements   = require('core.elements');
local drops      = require('core.drops');
local printout   = require('core.printout');
local spells     = require('data.spells');
local bands      = require('data.bands');
local defaults   = require('ui.defaults');
local skins      = require('ui.skins');
local profiles   = require('ui.profiles');
local window_font = require('ui.window_font');
local settings_window = require('ui.settings_window');

-- /check reply messages (0x029). 170 to 178 carry the level and con. 249 is "impossible to gauge".
local CHECK_FIRST      = 170;
local CHECK_LAST       = 178;
local CHECK_IMPOSSIBLE = 249;

-- The /check con is its second parameter less this. 64 is "too weak".
local CHECK_CON_BASE = 64;

-- The nine /check messages come in three groups of three. The group gives the evasion reading, and the
-- place inside the group gives the defense reading. Both run high, normal, low.
local READING_SIZE = 3;

-- Mode 1 sends a command as if you typed it.
local COMMAND_TYPED = 1;

-- Seconds you have to type /checkmate reset a second time.
local RESET_SECONDS = 10;

-- Parts that need numbers about the monster. With one of them on, a monster with no data and no level
-- gets the "can't be gauged" line in place of its parts.
local NUMBER_PARTS = { 'hit', 'evade', 'crit', 'magic' };

-- The defaults the settings library keeps and merges into every settings file it loads.
local DEFAULT_SETTINGS = defaults.make();

local checkmate = {
    settings  = settings.load(DEFAULT_SETTINGS),
    my_id     = 0,       -- Your server id, which picks your own replies out of everyone's.
    ready     = {},      -- /checks with lines to print on the next frame, oldest first.
    job_check = true,    -- Set after zoning, until your main job has been read.
    last_job  = nil,     -- Your main job when last read. A change loads that job's linked profile.
    broken    = false,   -- Set when a frame failed, so the error isn't repeated every frame.
    reset_asked = nil,   -- When you first typed /checkmate reset, by os.clock.
};

local function say(text)
    local s = checkmate.settings;
    print(printout.tag(s, addon.name) .. printout.paint(s, 'replies', text));
end

-- Ashita's settings merge fills a section a settings file lacks with the defaults' own table. Each such
-- table gets a copy of its own, so a change to it never reaches the defaults a reset or another
-- character starts from.
local function own_tables(s, d)
    for key, value in pairs(d) do
        local mine = rawget(s, key);
        if (type(value) == 'table' and rawequal(mine, value)) then
            s[key] = value:copy(true);
        elseif (type(value) == 'table' and type(mine) == 'table') then
            own_tables(mine, value);
        end
    end
end

-- Fixes anything a hand-edited settings file could get wrong.
local function tidy(s)
    own_tables(s, DEFAULT_SETTINGS);
    defaults.fix_colors(s);
    s.printout.order = printout.clean_order(s.printout.order);
    s.printout.separator = printout.clean_text(s.printout.separator);
    s.printout.divider = printout.divider_id(s.printout);
    s.printout.label_separator = printout.clean_text(s.printout.label_separator);
    s.printout.label_divider = printout.label_divider_id(s.printout);
    s.drops.th = drops.clamp_th(s.drops.th);
    s.look.font = window_font.clean_id(s.look.font);
    s.look.font_size = window_font.clean_size(s.look.font_size);
    skins.fill(s);
end

local function save_settings()
    tidy(checkmate.settings);
    settings.save();
end

local function part_on(id)
    return checkmate.settings.printout.parts[id].on == true;
end

local function any_on(ids)
    for _, id in ipairs(ids) do
        if (part_on(id)) then
            return true;
        end
    end
    return false;
end

--[[
    The /check readout.
]]

-- Works out everything the printout shows for one /check. Parts that are off aren't worked out.
local function readout(check)
    local s = checkmate.settings;
    local row = check.row;
    local result = { name = check.name, low = check.low, high = check.high, cant_gauge = check.cant_gauge,
        con = check.con, impossible = check.impossible, reading = check.reading, defense = check.defense,
        range_low = check.range_low, range_high = check.range_high };
    if (check.cant_gauge) then
        return result;
    end

    local me = player.read();
    me.accuracy, me.evasion = checkparam.mine();
    me.extra_accuracy = s.magic.extra_accuracy;
    result.scripted = row ~= nil and row.flags ~= nil and row.flags.scripted_stats == true;

    if (part_on('hit') or part_on('evade') or part_on('crit')) then
        local numbers = physical.readout(me, check);
        result.hit, result.evade, result.crit = numbers.hit, numbers.evade, numbers.crit;
        result.signet = numbers.signet;
    end
    -- The rest all need the monster's data row.
    if (row == nil) then
        return result;
    end
    if (part_on('aggro')) then
        result.aggro = aggro.readout(row, check, me.level, s.aggro);
    end
    if (part_on('magic')) then
        result.magic = magic.readout(me, check, s.magic);
    end
    if (part_on('immunities')) then
        result.immune = row.immune;
    end
    if (part_on('elements')) then
        result.elements = elements.readout(row, check.low == check.high and check.low or nil);
    end
    if (part_on('drops')) then
        result.drops = drops.readout(row, s.drops);
    end
    return result;
end

local function print_lines(lines)
    local s = checkmate.settings;
    for _, line in ipairs(lines) do
        if (s.printout.header) then
            line = printout.tag(s, addon.name) .. line;
        end
        print(line);
    end
end

-- A made-up /check that shows the printout with your settings. Its aggro goes through your aggro
-- settings, and its drops through your Treasure Hunter and drop settings.
local SAMPLE_AGGRO = {
    aggro   = true,
    detects = { 'sight' },
    links   = { 'Goblin Butcher', 'Goblin Leecher', 'Goblin Tinkerer' },
};
local SAMPLE_DROPS = {
    drops = {
        { rate = 150, item = 930 },   -- Beastman blood.
        { rate = 50,  item = 508 },   -- Goblin helm.
        { rate = 10,  item = 507 },   -- Goblin mail.
        { rate = 10,  item = 656 },   -- Beastcoin.
    },
};
-- Weak to ice and thunder, its lowest ranks, and half damage from water at rank 4.
local SAMPLE_ELEMENTS = { ranks = { ice = -3, thunder = -3, water = 4 } };
local SAMPLE_MAGIC = {
    elemental = 88, enfeebling = 81, dark = 95, divine = 90, healing = 95, ninjutsu = 72, singing = 85, blue = 78,
};

local function print_sample()
    local s = checkmate.settings;
    local result = {
        name    = 'Sample Goblin',
        low     = 42,
        high    = 42,
        con     = 3,   -- Decent challenge.
        reading = 1,   -- Normal evasion, the only reading that fits a 64-72% hit rate.
        defense = 2,   -- Low defense.
        hit     = { low = 64, high = 72 },
        evade   = { low = 31, high = 31 },
        signet  = true,
        crit    = { low = 7, high = 7 },
        aggro   = aggro.readout(SAMPLE_AGGRO, { con = 3 }, 42, s.aggro),
        magic   = {},
        immune  = { 'dark_sleep', 'bind', 'gravity' },
        elements = elements.readout(SAMPLE_ELEMENTS, nil),
        drops   = drops.readout(SAMPLE_DROPS, s.drops),
    };
    -- It spawns at 40 to 44. With the level range on, that prints after its level.
    result.range_low, result.range_high = 40, 44;
    for _, id in ipairs(spells.SCHOOL_ORDER) do
        local school = s.magic.schools[id];
        if (school ~= nil and school.on) then
            local chance = SAMPLE_MAGIC[id];
            local picks_element = spells.find(id, school.spell).elements ~= nil;
            result.magic[#result.magic + 1] = {
                label   = spells.schools[id].label,
                low     = chance,
                high    = chance,
                element = picks_element and 'Ice' or nil,
            };
        end
    end
    print_lines(printout.lines(s, result));
end

--[[
    Prints the lines of a /check that haven't printed yet. Until the /checkparam reply is in, it stops
    before the first line holding hit or evade. Once the wait is over, it goes on from that line. The
    line is found again, since a layout change during the wait can move it.
    A /check that gave up on the reply skips every line holding hit or evade. The exception is its
    first line, when nothing has printed yet, the game's line is hidden and the extras share the
    /check line. That line stands in for the game's, so it always prints.
]]
local function print_check(check)
    if (check.done) then
        return;
    end
    local lines, waits_at, holding = printout.lines(checkmate.settings, readout(check));
    local first, last = check.from, #lines;
    if (check.waits and waits_at ~= nil) then
        last = waits_at - 1;
    elseif (first > 1 and waits_at ~= nil) then
        first = waits_at;
    end
    local keep_first = check.from == 1 and checkmate.settings.printout.replace_game_line
        and not checkmate.settings.printout.extras_own_line;
    local shown = {};
    for at = first, last do
        if (not (check.gave_up and holding[at]) or (at == 1 and keep_first)) then
            shown[#shown + 1] = lines[at];
        end
    end
    print_lines(shown);
    check.from = last + 1;
    check.done = last == #lines;
end

-- Prints what `check` still has to print on the next frame.
local function print_soon(check)
    checkmate.ready[#checkmate.ready + 1] = check;
end

-- The /checkparam reply for `check` is in or overdue. Its waiting lines print on the next frame.
local function stop_waiting(check)
    check.waits = false;
    print_soon(check);
end

-- A /check that stops waiting without the reply prints the rest of its lines on the next frame, all but
-- the ones holding hit or evade.
local function give_up(check)
    if (check ~= nil) then
        check.gave_up = true;
        stop_waiting(check);
    end
end

-- Your /check of a monster came back.
local function on_check(target, index, level, param2, message)
    local replacing = checkmate.settings.printout.replace_game_line;
    if (not (replacing or part_on('name') or part_on('reading') or any_on(printout.PARTS))) then
        return;
    end

    local name = player.entity_name(index);
    local row = monsters.find(player.zone(), target, name);
    local low, high = monsters.level(row, level, index);
    local gauged = message ~= CHECK_IMPOSSIBLE;
    local check = {
        name    = name or (row and row.name) or 'The monster',
        row     = row,
        low     = low,
        high    = high,
        con     = gauged and (param2 - CHECK_CON_BASE) or nil,
        reading = gauged and math.floor((message - CHECK_FIRST) / READING_SIZE) or nil,
        defense = gauged and (message - CHECK_FIRST) % READING_SIZE or nil,
        from    = 1,   -- The first of its lines not printed yet.
        done    = false,   -- Set once its last line printed.
        gave_up = false,   -- Set when a newer /check or zoning ends its wait for the reply.
    };
    if (row ~= nil and low ~= nil and low == high) then
        check.range_low, check.range_high = monsters.range_around(row, index, low);
    end
    check.impossible = not gauged;
    check.cant_gauge = row == nil and low == nil and any_on(NUMBER_PARTS);
    check.waits = (part_on('hit') or part_on('evade')) and not check.cant_gauge;

    -- Only hit rate and evade need a fresh /checkparam. The lines before the first one holding them
    -- print on the next frame, and the rest once the reply is in.
    local older;
    if (check.waits) then
        older = checkparam.on_check(os.clock(), check);
    else
        older = checkparam.cancel();
    end
    -- An older /check still waiting gives up on the reply.
    give_up(older);
    print_soon(check);
end

--[[
    Settings actions behind the commands.
]]

-- The parts show and hide take. The window calls the reading "Evasion and defense".
local PART_LIST = 'name, difficulty, reading (evasion and defense), hit, evade, crit, aggro, magic, immunities, '
    .. 'elements, drops';

-- The parts with a label, then the ones with New line and arrows. The name part always comes first, so
-- it has no New line and doesn't move. The reading rides on the difficulty and has none of them.
local LABEL_PARTS = { 'name' };
for _, id in ipairs(printout.PARTS) do
    LABEL_PARTS[#LABEL_PARTS + 1] = id;
end
local LABEL_PART_LIST = table.concat(LABEL_PARTS, ', ');
local LINE_PART_LIST = table.concat(printout.PARTS, ', ');

-- Up moves a part one place toward the name, and down one place away from it.
local MOVE_STEPS = { up = -1, down = 1 };

-- The words /checkmate cutoff takes, each with its name on the Numbers tab.
local CUTOFF_PARTS = { hit = 'Hit rate', evade = 'Evade', crit = 'Crit' };
local CUTOFF_GRADES = { good = 'Good', ok = 'OK' };

-- Each immunity by its name on the Immunities tab in lowercase, like sleep for dark_sleep.
local IMMUNITY_BY_NAME = {};
local immunity_names = {};
for _, entry in ipairs(printout.IMMUNITIES) do
    IMMUNITY_BY_NAME[entry.label:lower()] = entry;
    immunity_names[#immunity_names + 1] = entry.label:lower();
end
local IMMUNITY_LIST = table.concat(immunity_names, ', ');

-- The main jobs, for the job link lines.
local JOB_LIST = table.concat(profiles.JOBS, ', ');

local function on_word(word)
    if (word == 'on') then
        return true;
    elseif (word == 'off') then
        return false;
    end
    return nil;
end

-- Lowercase, or nil for nothing.
local function lower(word)
    return word and word:lower() or nil;
end

-- Everything from args[from] on, joined by spaces, or nil when nothing is there. Empty quotes give ''.
local function rest(args, from)
    return args[from] and table.concat(args, ' ', from) or nil;
end

-- `word` as a number from `low` to `high`, or nil. It has to be whole unless `decimal` is set. A
-- decimal keeps one place, like the settings window's slider.
local function read_number(word, low, high, decimal)
    local value = tonumber(word);
    if (value == nil or not (value >= low and value <= high)) then
        return nil;
    end
    if (decimal) then
        return math.floor(value * 10 + 0.5) / 10;
    end
    return (value == math.floor(value)) and value or nil;
end

-- Settings tables are Ashita T{} tables, which answer a missing key like "sort" with a table function.
-- rawget reads only what is really there.
local function set_part(id, on)
    if (id == nil) then
        say(('Type /checkmate show|hide <part>. The parts are %s.'):format(PART_LIST));
        return;
    end
    local part = rawget(checkmate.settings.printout.parts, id);
    if (part == nil) then
        say(('There is no part called "%s". The parts are %s.'):format(id, PART_LIST));
        return;
    end
    part.on = on;
    save_settings();
    say((on and 'checkmate now shows the %s part.' or 'checkmate no longer shows the %s part.'):format(id));
end

-- True when `ids` holds `id`. Otherwise it says the usage when `id` is missing, or that there is no such part.
local function known_part(id, ids, usage, what)
    if (id == nil) then
        say(usage);
        return false;
    end
    for _, each in ipairs(ids) do
        if (each == id) then
            return true;
        end
    end
    say(('There is no part called "%s" %s. The parts are %s.'):format(id, what, table.concat(ids, ', ')));
    return false;
end

-- `text` is everything after the part, or nil when nothing follows it. Empty quotes clear the label.
local function set_label(id, text)
    local usage = ('Type /checkmate label <part> <text>. Put text with spaces in quotes, and "" leaves the label '
        .. 'out. The parts are %s.'):format(LABEL_PART_LIST);
    if (not known_part(id, LABEL_PARTS, usage, 'with a label')) then
        return;
    end
    if (text == nil) then
        say(usage);
        return;
    end
    local label = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    checkmate.settings.printout.parts[id].label = label;
    save_settings();
    if (label:match('^%s*$')) then
        say(('The %s part now prints with no label.'):format(id));
        return;
    end
    say(('The %s part\'s label is now "%s".'):format(id, label));
end

local function set_new_line(id, word)
    local usage = ('Type /checkmate newline <part> on|off. The parts are %s.'):format(LINE_PART_LIST);
    if (not known_part(id, printout.PARTS, usage, 'with a New line box')) then
        return;
    end
    local on = on_word(word);
    if (on == nil) then
        say(usage);
        return;
    end
    checkmate.settings.printout.parts[id].new_line = on;
    save_settings();
    say((on and 'The %s part now starts a new line.' or 'The %s part no longer starts a new line.'):format(id));
end

-- Moves a part one place, like the arrows. The first part can't go up and the last can't go down.
local function move_part(id, word)
    local usage = ('Type /checkmate move <part> up|down. The parts are %s.'):format(LINE_PART_LIST);
    if (id == 'name') then
        say('The name part always comes first, so it doesn\'t move.');
        return;
    end
    if (not known_part(id, printout.PARTS, usage, 'that moves')) then
        return;
    end
    local step = MOVE_STEPS[word];
    if (step == nil) then
        say(usage);
        return;
    end
    local ps = checkmate.settings.printout;
    local order = printout.clean_order(ps.order);
    local moved = printout.move(order, id, step);
    if (moved == order) then
        say(('The %s part is already %s.'):format(id, (step < 0) and 'first' or 'last'));
        return;
    end
    ps.order = moved;
    save_settings();
    say(('The %s part moved %s, so the parts after the name now go %s.'):format(id, word,
        (moved:gsub(' ', ', '))));
end

local function set_school(id, on)
    local school = rawget(checkmate.settings.magic.schools, id);
    if (school == nil or on == nil) then
        local schools = table.concat(spells.SCHOOL_ORDER, ', ');
        say(('Type /checkmate school <school> on|off. The schools are %s.'):format(schools));
        return;
    end
    school.on = on;
    save_settings();
    local said = on and 'The magic part now shows the %s school when you have skill in it.'
        or 'The magic part no longer shows the %s school.';
    say(said:format(spells.schools[id].label));
end

-- The school's stand-in spell with this id or name, in any case and with or without spaces, or nil.
local function find_spell(school, word)
    local wanted = printout.squash(word);
    for _, spell in ipairs(school.spells) do
        if (wanted == spell.id or wanted == printout.squash(spell.name)) then
            return spell;
        end
    end
    return nil;
end

-- `words` is everything after the school. A school with one spell has nothing to pick, like its
-- greyed-out list in the window.
local function set_spell(id, words)
    local school = id and spells.schools[id];
    if (school == nil) then
        say(('Type /checkmate spell <school> <spell>. The schools are %s.')
            :format(table.concat(spells.SCHOOL_ORDER, ', ')));
        return;
    end
    if (#school.spells == 1) then
        say(('%s only has one stand-in spell, %s.'):format(school.label, school.spells[1].name));
        return;
    end
    local ids = {};
    for _, spell in ipairs(school.spells) do
        ids[#ids + 1] = spell.id;
    end
    local list = ('The %s spells are %s.'):format(school.label, table.concat(ids, ', '));
    local spell = find_spell(school, words);
    if (spell == nil and words == '') then
        say(('Type /checkmate spell %s <spell>. '):format(id) .. list);
        return;
    elseif (spell == nil) then
        say(('There is no %s spell called "%s". '):format(school.label, words) .. list);
        return;
    end
    checkmate.settings.magic.schools[id].spell = spell.id;
    save_settings();
    say(('%s now uses %s as its stand-in spell.'):format(school.label, spell.name));
end

local function set_cutoff(id, grade, word)
    local value = read_number(word, 0, printout.CUTOFF_MAX);
    if (CUTOFF_PARTS[id] == nil or CUTOFF_GRADES[grade] == nil or value == nil) then
        say(('Type /checkmate cutoff <hit|evade|crit> <good|ok> <0-%d>.'):format(printout.CUTOFF_MAX));
        return;
    end
    checkmate.settings.grades[id .. '_' .. grade] = value;
    save_settings();
    say(('%s now counts as %s at %d%% or above.'):format(CUTOFF_PARTS[id], CUTOFF_GRADES[grade], value));
end

-- The immunity `name` names, or nil after it says the usage or that there's no such immunity.
local function known_immunity(name, usage)
    if (name == nil) then
        say(usage);
        return nil;
    end
    local entry = IMMUNITY_BY_NAME[name];
    if (entry == nil) then
        say(('There is no immunity called "%s". The immunities are %s.'):format(name, IMMUNITY_LIST));
    end
    return entry;
end

local function set_immunity(name, word)
    local usage = ('Type /checkmate immunity <name> on|off. The immunities are %s.'):format(IMMUNITY_LIST);
    local entry = known_immunity(name, usage);
    if (entry == nil) then
        return;
    end
    local on = on_word(word);
    if (on == nil) then
        say(usage);
        return;
    end
    checkmate.settings.immunities[entry.id].on = on;
    save_settings();
    if (on) then
        say(('The immunities part now lists %s when a monster is immune to it.'):format(entry.label));
        return;
    end
    say(('The immunities part no longer lists %s.'):format(entry.label));
end

-- `text` is everything after the immunity, or nil when nothing follows it.
local function set_immunity_label(name, text)
    local usage = ('Type /checkmate immunitylabel <name> <text>. Put text with spaces in quotes. The immunities are '
        .. '%s.'):format(IMMUNITY_LIST);
    local entry = known_immunity(name, usage);
    if (entry == nil) then
        return;
    end
    if (text == nil) then
        say(usage);
        return;
    end
    local label = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    checkmate.settings.immunities[entry.id].label = label;
    save_settings();
    if (label:match('^%s*$')) then
        say(('%s now prints as a blank in the immunities part. /checkmate immunity %s off leaves it out instead.')
            :format(entry.label, name));
        return;
    end
    say(('%s now prints as "%s" in the immunities part.'):format(entry.label, label));
end

-- `text` is what follows custom, or nil when nothing does. Custom with no text keeps the text you had.
local function set_divider(word, text)
    if (word == nil) then
        say(('Type /checkmate divider <name>. The dividers are %s.'):format(printout.DIVIDER_IDS));
        return;
    end
    local divider = printout.find_divider(word);
    if (divider == nil) then
        say(('There is no divider called "%s". The dividers are %s.'):format(word, printout.DIVIDER_IDS));
        return;
    end
    local ps = checkmate.settings.printout;
    ps.divider = divider.id;
    local custom_text = divider.id == 'custom' and text ~= nil;
    if (custom_text) then
        ps.separator = printout.clean_command_text(text):sub(1, printout.SEPARATOR_MAX);
    end
    save_settings();
    if (custom_text and ps.separator == '') then
        say('The parts now print with nothing between them.');
        return;
    end
    if (custom_text) then
        say(('The parts now print with "%s" between them.'):format(ps.separator));
        return;
    end
    say(('You\'re using the %s divider between parts now.'):format(divider.name));
end

-- `text` is what follows custom, or nil when nothing does. Custom with no text keeps the text you had.
local function set_label_divider(word, text)
    local usage = ('The label dividers are %s. Type /checkmate labeldivider custom <text> for your own text.')
        :format(printout.LABEL_DIVIDER_IDS);
    if (word == nil) then
        say('Type /checkmate labeldivider <name>. ' .. usage);
        return;
    end
    local divider = printout.find_divider(word, printout.LABEL_DIVIDERS);
    if (divider == nil) then
        say(('There is no label divider called "%s". '):format(word) .. usage);
        return;
    end
    local ps = checkmate.settings.printout;
    ps.label_divider = divider.id;
    if (divider.id == 'custom' and text ~= nil) then
        ps.label_separator = printout.clean_command_text(text):sub(1, printout.SEPARATOR_MAX);
    end
    save_settings();
    if (divider.id == 'custom' and ps.label_separator == '') then
        say('Each label is now followed by just a space.');
        return;
    end
    if (divider.id == 'custom') then
        say(('Each label is now followed by "%s" and a space.'):format(ps.label_separator));
        return;
    end
    say(('You\'re using the %s label divider now.'):format(divider.name));
end

-- `text` is everything after rangeword, or nil when nothing follows it. Empty quotes clear the word.
local function set_range_word(text)
    if (text == nil) then
        say('Type /checkmate rangeword <text>. Put text with spaces in quotes, and "" leaves the word out.');
        return;
    end
    local ps = checkmate.settings.printout;
    ps.range_word = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    save_settings();
    say(('The level range now prints like (Lv 42, %s).'):format(printout.range_text(ps, 40, 44)));
end

-- The words /checkmate weakword and resistword set, each with its key in the elements settings and the
-- elements it goes before.
local ELEMENT_WORDS = {
    weakword   = { key = 'weak_word',   what = 'the elements a monster is weak to' },
    resistword = { key = 'resist_word', what = 'the elements a monster resists' },
};

-- `text` is everything after the command, or nil when nothing follows it. Empty quotes clear the word.
local function set_element_word(sub, text)
    if (text == nil) then
        say(('Type /checkmate %s <text>. Put text with spaces in quotes, and "" leaves the word out.'):format(sub));
        return;
    end
    local entry = ELEMENT_WORDS[sub];
    local word = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    checkmate.settings.elements[entry.key] = word;
    save_settings();
    if (word:match('^%s*$')) then
        say(('The elements part now lists %s with no word before them.'):format(entry.what));
        return;
    end
    say(('The elements part now puts "%s" before %s.'):format(word, entry.what));
end

-- `what` names one of the color settings, and `word` a palette color by name or number.
local function set_color(what, word)
    if (what == nil or word == '') then
        say('Type /checkmate color <what> <color>. /checkmate help colors lists the choices for each.');
        return;
    end
    local key = printout.color_key(what);
    if (key == nil) then
        say(('There is no color setting called "%s". /checkmate help colors lists them.'):format(what));
        return;
    end
    local color = printout.find_color(word);
    if (color == nil) then
        say(('There is no chat color called "%s". /checkmate help colors lists them.'):format(word));
        return;
    end
    checkmate.settings.colors[key] = color.code;
    save_settings();
    say(('The %s color is now %s.'):format(key, color.name));
end

-- `what` names one of the settings window's colors, and `word` a color as six hex digits, or eight
-- with how solid it is last.
local function set_window_color(what, word)
    if (what == nil or word == nil) then
        say('Type /checkmate windowcolor <what> <rrggbb>. /checkmate help windowcolors lists the window colors.');
        return;
    end
    local entry = skins.window_color(what);
    if (entry == nil) then
        say(('There is no window color called "%s". /checkmate help windowcolors lists them.'):format(what));
        return;
    end
    local digits = word:match('^#?(%x+)$');
    if (digits == nil or (#digits ~= 6 and #digits ~= 8)) then
        say(('"%s" isn\'t a color. Type six hex digits like c55151, or eight like c55151cc to make it see-through.')
            :format(word));
        return;
    end
    local alpha = (#digits == 8) and tonumber(digits:sub(7, 8), 16) / 255 or 1.0;
    checkmate.settings.look.imgui[entry.key] = skins.hex(digits, alpha);
    save_settings();
    say(('The %s window color is now %s.'):format(entry.key, digits:lower()));
end

-- `words` names a font, with or without its spaces.
local function set_font(words)
    if (words == '') then
        say(('Type /checkmate font <name>. The fonts are %s.'):format(window_font.IDS));
        return;
    end
    local entry = window_font.find(words);
    if (entry == nil) then
        say(('There is no font called "%s". The fonts are %s.'):format(words, window_font.IDS));
        return;
    end
    checkmate.settings.look.font = entry.id;
    save_settings();
    if (window_font.failed(entry.id)) then
        say(('You picked the %s font, but %s is missing or won\'t load, so the settings window uses Ashita\'s font.')
            :format(entry.name, window_font.path(entry.id)));
        return;
    end
    say(('The settings window now uses the %s font.'):format(entry.name));
end

local function undo_skin()
    if (not skins.undo(checkmate.settings)) then
        say('There\'s nothing to undo. Undo only takes back your last skin pick or Reset to skin.');
        return;
    end
    save_settings();
    say('Your colors and window look are back to how they were before your last skin pick or Reset to skin.');
end

local function set_skin(name)
    if (name == nil) then
        say(('Type /checkmate skin <name>. The skins are %s.'):format(skins.IDS));
        return;
    end
    if (name:lower() == 'undo') then
        undo_skin();
        return;
    end
    if (not skins.apply(checkmate.settings, name)) then
        say(('There is no skin called "%s". The skins are %s.'):format(name, skins.IDS));
        return;
    end
    save_settings();
    say(('You\'re using the %s skin now.'):format(skins.find(checkmate.settings.look.skin).name));
end

-- Profile commands. ui\profiles.lua keeps the profiles and returns true when the action worked.
local PROFILE_DONE = {
    save   = 'Your settings are saved as the profile "%s".',
    load   = 'Your settings now come from the profile "%s".',
    delete = 'The profile "%s" is deleted.',
};
local NO_PROFILE = 'There is no profile called "%s".';
local PROFILE_FAILED = {
    save   = 'Couldn\'t save the profile "%s".',
    load   = NO_PROFILE,
    delete = NO_PROFILE,
};

-- A profile name typed after a command, cleaned. Nil after it says there's nothing in it to use.
local function typed_profile_name(name)
    local clean = profiles.clean_name(printout.clean_command_text(name));
    if (clean == '') then
        say('That profile name has nothing checkmate can use. Use plain English letters, numbers or symbols.');
        return nil;
    end
    return clean;
end

-- Reads profiles.json again first, since another character can change it.
local function rename_profile(old, new)
    if (old == nil or new == nil) then
        say('Type /checkmate profile rename <old> <new>. Put names with spaces in quotes.');
        return;
    end
    new = typed_profile_name(new);
    if (new == nil) then
        return;
    end
    profiles.refresh();
    if (not profiles.exists(old)) then
        say(NO_PROFILE:format(old));
        return;
    end
    if (profiles.exists(new)) then
        say(('There is already a profile called "%s".'):format(new));
        return;
    end
    if (not profiles.rename(checkmate.settings, old, new)) then
        say(('Couldn\'t rename the profile "%s".'):format(old));
        return;
    end
    save_settings();
    say(('The profile "%s" is now called "%s".'):format(old, new));
end

local function run_profile(action, name, new)
    if (action == 'rename') then
        rename_profile(name, new);
        return;
    end
    if (PROFILE_DONE[action] == nil or name == nil) then
        say('Type /checkmate profile save|load|delete <name>. Type /checkmate profile rename <old> <new> to rename '
            .. 'one.');
        return;
    end
    if (action == 'save') then
        name = typed_profile_name(name);
        if (name == nil) then
            return;
        end
    end

    if (not profiles[action](checkmate.settings, name)) then
        say(PROFILE_FAILED[action]:format(name));
        return;
    end
    save_settings();
    say(PROFILE_DONE[action]:format(name));
end

-- The job with this abbreviation, in any case, or nil.
local function find_job(word)
    local wanted = word:upper();
    for _, job in ipairs(profiles.JOBS) do
        if (job == wanted) then
            return job;
        end
    end
    return nil;
end

-- `name` is everything after the job. None stops the job loading a profile. Only a profile that's
-- there can be linked, like the window's list.
local function set_job_link(word, name)
    if (word == nil or name == nil) then
        say('Type /checkmate joblink <job> <profile>, or /checkmate joblink <job> none to stop it loading one. Put a '
            .. 'name with spaces in quotes.');
        return;
    end
    local job = find_job(word);
    if (job == nil) then
        say(('There is no job called "%s". The jobs are %s.'):format(word, JOB_LIST));
        return;
    end
    if (name:lower() == 'none') then
        checkmate.settings.job_links[job] = nil;
        save_settings();
        say(('Changing to %s no longer loads a profile.'):format(job));
        return;
    end
    profiles.refresh();
    if (not profiles.exists(name)) then
        say(NO_PROFILE:format(name));
        return;
    end
    checkmate.settings.job_links[job] = name;
    save_settings();
    say(('The profile "%s" now loads when you change to %s and zone.'):format(name, job));
end

local function print_info()
    say(('checkmate %s. The monster data was built from %s.'):format(addon.version,
        bands.built or 'unknown'));
    say(('The data is for a server with %s.'):format(bands.content or 'unknown'));
    local zone_built = monsters.built();
    if (zone_built ~= nil) then
        say(('This zone\'s data was built from %s.'):format(zone_built));
    end
end

local function toggle_window()
    checkmate.broken = false;
    settings_window.set_open(not settings_window.is_open());
end

-- What /checkmate reset puts back, for its help line and its first answer.
local RESET_WHAT = 'every one of this character\'s settings back to its default, including the skin and every color, '
    .. 'the window\'s font, size and position, and the job links. Your saved profiles stay.';

-- The first /checkmate reset says what it puts back. A second one within RESET_SECONDS does it.
local function reset_settings()
    local now = os.clock();
    local asked = checkmate.reset_asked;
    if (asked == nil or now - asked > RESET_SECONDS) then
        checkmate.reset_asked = now;
        say(('This puts %s Type /checkmate reset again within %d seconds to go ahead.')
            :format(RESET_WHAT, RESET_SECONDS));
        return;
    end
    checkmate.reset_asked = nil;
    settings.reset();
    say('Every setting is back to its default. Your saved profiles are still there.');
end

-- The on|off commands, each with the settings section and key it sets and what it says on and off.
local SWITCHES = {
    level = {
        section = 'printout', key = 'show_level',
        on  = 'The level now shows after the monster\'s name.',
        off = 'The level no longer shows after the monster\'s name.',
    },
    levelrange = {
        section = 'printout', key = 'show_range',
        on  = 'The level range now shows after a monster\'s exact level.',
        off = 'The level range no longer shows after a monster\'s level.',
    },
    tag = {
        section = 'printout', key = 'header',
        on  = 'checkmate\'s /check lines now start with [checkmate].',
        off = 'checkmate\'s /check lines no longer start with [checkmate].',
    },
    replace = {
        section = 'printout', key = 'replace_game_line',
        on  = 'checkmate now replaces the game\'s /check line.',
        off = 'checkmate no longer replaces the game\'s /check line.',
    },
    concolors = {
        section = 'printout', key = 'con_colors',
        on  = 'Each difficulty now prints in its own color.',
        off = 'Every difficulty now prints in the same color.',
    },
    threatcolors = {
        section = 'aggro', key = 'threat_colors',
        on  = 'Aggressive now prints in the Threat color, and the other answers in the Safe color.',
        off = 'Every aggro answer now prints in the Words color.',
    },
    grades = {
        section = 'grades', key = 'on',
        on  = 'The hit rate, evade and crit numbers now print in the Good, OK or Bad color.',
        off = 'The hit rate, evade and crit numbers now print in each part\'s Number color.',
    },
    detection = {
        section = 'aggro', key = 'detection',
        on  = 'The aggro part now shows how a monster finds you.',
        off = 'The aggro part no longer shows how a monster finds you.',
    },
    linknames = {
        section = 'aggro', key = 'link_names',
        on  = 'The aggro part now names what a monster links with.',
        off = 'The aggro part now just says whether a monster links, without the names.',
    },
    strength = {
        section = 'elements', key = 'strength',
        on  = 'The elements part now shows how strong each one is, like (half), and the magic damage note.',
        off = 'The elements part no longer shows how strong each one is or the magic damage note.',
    },
    thlabel = {
        section = 'drops', key = 'th_in_label',
        on  = 'The drops label now shows your Treasure Hunter, like Drops (TH 2).',
        off = 'The drops label no longer shows your Treasure Hunter.',
    },
    dropnotes = {
        section = 'drops', key = 'notes',
        on  = 'The drops part now adds (plus scripted drops) and (only drops if you get EXP) when they apply.',
        off = 'The drops part no longer adds (plus scripted drops) or (only drops if you get EXP).',
    },
};

-- The commands that take one of a few words, each with the settings section and key it sets, the words
-- for its usage line, and the value and answer for each word.
local CHOICES = {
    extras = {
        section = 'printout', key = 'extras_own_line', usage = 'same|new',
        words = {
            same = { false, 'Hit, evade, crit, aggro, magic, immunities, elements and drops now stay on the /check '
                .. 'line. A part with New line checked still starts a new line.' },
            new  = { true, 'Hit, evade, crit, aggro, magic, immunities, elements and drops now start on a new line.' },
        },
    },
    reading = {
        section = 'printout', key = 'defense_first', usage = 'evasion|defense',
        words = {
            evasion = { false, 'Evasion now comes before defense in the reading.' },
            defense = { true,  'Defense now comes before evasion in the reading.' },
        },
    },
    ranges = {
        section = 'printout', key = 'number_style', usage = 'range|middle',
        words = {
            range  = { 'range',    'Ranges now print like 64-72%.' },
            middle = { 'midpoint', 'Ranges now print as their middle, like ~68%.' },
        },
    },
    sort = {
        section = 'drops', key = 'sort', usage = 'chance|name',
        words = {
            chance = { 'chance', 'The drops part now lists the items by chance, highest first.' },
            name   = { 'name',   'The drops part now lists the items by name.' },
        },
    },
};

--[[
    The commands that take a number, each with the settings section and key it sets, the lowest and
    highest it takes, its usage line and its answer. `zero` is the answer at 0 when 0 means something
    of its own, and `one` the answer at 1 when the usual answer counts items or pixels. A `decimal` one
    keeps one decimal place.
]]
local NUMBERS = {
    th = {
        section = 'drops', key = 'th', low = 0, high = drops.TH_MAX,
        usage = 'Type /checkmate th <%d-%d>.',
        said  = 'Drop chances now use Treasure Hunter %s.',
    },
    maxlinks = {
        section = 'aggro', key = 'max_links', low = 0, high = aggro.MAX_LINKS,
        usage = 'Type /checkmate maxlinks <%d-%d>. 0 shows every name.',
        said  = 'The aggro part now shows at most %s of the names a monster links with.',
        zero  = 'The aggro part now shows every name a monster links with.',
    },
    macc = {
        section = 'magic', key = 'extra_accuracy', low = 0, high = magic.EXTRA_ACCURACY_MAX,
        usage = 'Type /checkmate macc <%d-%d>.',
        said  = 'Extra magic accuracy is now +%s for every school.',
    },
    maxitems = {
        section = 'drops', key = 'max_items', low = 0, high = drops.MAX_ITEMS,
        usage = 'Type /checkmate maxitems <%d-%d>. 0 shows every item.',
        said  = 'The drops part now shows at most %s items.',
        zero  = 'The drops part now shows every item.',
        one   = 'The drops part now shows at most 1 item.',
    },
    minchance = {
        section = 'drops', key = 'min_chance', low = 0, high = drops.MIN_CHANCE_MAX, decimal = true,
        usage = 'Type /checkmate minchance <%d-%d>. It can have one decimal place, like 2.5.',
        said  = 'The drops part now leaves out items under %s%%.',
        zero  = 'The drops part now shows items at any chance.',
    },
    fontsize = {
        section = 'look', key = 'font_size', low = window_font.SIZE_MIN, high = window_font.SIZE_MAX,
        usage = 'Type /checkmate fontsize <%d-%d>.',
        said  = 'The settings window\'s font size is now %s pixels.',
    },
    rounding = {
        section = 'look.imgui', key = 'rounding', low = 0, high = skins.ROUNDING_MAX,
        usage = 'Type /checkmate rounding <%d-%d>.',
        said  = 'The settings window\'s corner roundness is now %s pixels.',
        zero  = 'The settings window\'s corners are now square.',
        one   = 'The settings window\'s corner roundness is now 1 pixel.',
    },
    spacing = {
        section = 'look.imgui', key = 'spacing', low = skins.SPACING_MIN, high = skins.SPACING_MAX,
        usage = 'Type /checkmate spacing <%d-%d>.',
        said  = 'The space between the settings window\'s rows is now %s pixels.',
    },
};

-- The settings table a section like 'drops' names. 'look.imgui' is the imgui table inside look.
local function section(path)
    local found = checkmate.settings;
    for name in path:gmatch('[^.]+') do
        found = found[name];
    end
    return found;
end

local function set_switch(sub, word)
    local switch = SWITCHES[sub];
    local on = on_word(word);
    if (on == nil) then
        say(('Type /checkmate %s on|off.'):format(sub));
        return;
    end
    section(switch.section)[switch.key] = on;
    save_settings();
    say(switch[word]);
end

local function set_choice(sub, word)
    local choice = CHOICES[sub];
    local picked = choice.words[word];
    if (picked == nil) then
        say(('Type /checkmate %s %s.'):format(sub, choice.usage));
        return;
    end
    section(choice.section)[choice.key] = picked[1];
    save_settings();
    say(picked[2]);
end

local function set_number(sub, word)
    local entry = NUMBERS[sub];
    local value = read_number(word, entry.low, entry.high, entry.decimal);
    if (value == nil) then
        say(entry.usage:format(entry.low, entry.high));
        return;
    end
    section(entry.section)[entry.key] = value;
    save_settings();
    if (value == 0 and entry.zero ~= nil) then
        say(entry.zero);
        return;
    end
    if (value == 1 and entry.one ~= nil) then
        say(entry.one);
        return;
    end
    say(entry.said:format(entry.decimal and ('%g'):format(value) or ('%d'):format(value)));
end

--[[
    Help. /checkmate help prints the topics and the commands used most. /checkmate help <topic> prints
    the commands for one tab of the settings window. /checkmate help windowcolors lists the window
    colors. Any other word after help prints the topics again.
]]

local TOPIC_LIST = 'printout, colors, numbers, aggro, magic, drops, immunities, look and profiles';

-- Lines that print in more than one place.
local HELP_SHOW = ('/checkmate show|hide <part>  shows or hides a part. The parts are %s.'):format(PART_LIST);
local HELP_TH = ('/checkmate th <0-%d>  sets the Treasure Hunter for drop chances.'):format(drops.TH_MAX);
local HELP_SCHOOL = '/checkmate school <school> on|off  turns a magic school on or off.';
local HELP_GRADES = '/checkmate grades on|off  colors the hit rate, evade and crit numbers in the Good, OK or Bad '
    .. 'color, or in each part\'s Number color.';
local HELP_SKIN = ('/checkmate skin <name>  switches the look. Naming the skin you already have puts back everything '
    .. 'it sets, like Reset to skin. The skins are %s.'):format(skins.IDS);
local HELP_PROFILE = '/checkmate profile save|load|delete <name>  saves, loads or deletes a profile. Put a name with '
    .. 'spaces in quotes.';
local HELP_SAMPLE = '/checkmate sample  prints a made-up /check with your settings.';

local HELP_MAIN = {
    '/checkmate  opens or closes the settings window. /cmate is short for /checkmate and works for every command.',
    ('/checkmate help <topic>  lists the commands for one tab of the settings window. The topics are %s.')
        :format(TOPIC_LIST),
    HELP_SHOW,
    HELP_TH,
    HELP_SCHOOL,
    HELP_SKIN,
    HELP_PROFILE,
    HELP_SAMPLE,
    '/checkmate info  prints the version and what the monster data was built from.',
    ('/checkmate reset  puts %s Type it twice within %d seconds.'):format(RESET_WHAT, RESET_SECONDS),
};

-- Each tab's commands. /checkmate help colors also lists the color settings and chat colors after them.
local HELP_TOPICS = {
    printout = {
        HELP_SHOW,
        '/checkmate label <part> <text>  sets a part\'s label, like Acc instead of Hit. Every part but reading has '
            .. 'one. Put text with spaces in quotes, and "" leaves the label out.',
        '/checkmate newline <part> on|off  turns a part\'s New line box on or off. On starts the part on a new line. '
            .. 'Every part but name and reading has one.',
        '/checkmate move <part> up|down  moves a part up or down. The name always comes first, and the reading goes '
            .. 'with difficulty.',
        '/checkmate level on|off  shows or hides the level after the name.',
        '/checkmate levelrange on|off  shows or hides the levels a monster can spawn at, like (Lv 42, range 40-44). '
            .. 'It only shows once checkmate knows the exact level.',
        '/checkmate rangeword <text>  sets the word before that range. Put text with spaces in quotes, and "" leaves '
            .. 'the word out.',
        '/checkmate reading evasion|defense  puts evasion or defense first in the reading after the difficulty.',
        '/checkmate extras same|new  same keeps hit, evade, crit, aggro, magic, immunities, elements and drops on the '
            .. '/check line, and new starts them on a line of their own. A part with New line checked starts a new '
            .. 'line either way.',
        '/checkmate tag on|off  starts each /check line with [checkmate], or leaves it off.',
        ('/checkmate divider <name>  sets what goes between parts. The dividers are %s.'):format(printout.DIVIDER_IDS),
        '/checkmate divider custom <text>  puts your own text between parts. Put text with spaces in quotes.',
        ('/checkmate labeldivider <name>  sets what goes right after each part\'s label. The label dividers are %s.')
            :format(printout.LABEL_DIVIDER_IDS),
        '/checkmate labeldivider custom <text>  puts your own text right after each label, then a space. Put text '
            .. 'with spaces in quotes.',
        '/checkmate ranges range|middle  prints a range of hit rate, evade, crit or magic like 64-72%, or as its '
            .. 'middle, like ~68%.',
        '/checkmate replace on|off  hides the game\'s own /check line so checkmate\'s lines take its place, or '
            .. 'shows it again.',
        HELP_SAMPLE,
    },
    colors = {
        '/checkmate concolors on|off  paints each difficulty in its own color, or all of them in One color.',
        '/checkmate threatcolors on|off  paints Aggressive in the Threat color and the other answers in the Safe '
            .. 'color, or every answer in the Words color.',
        HELP_GRADES,
    },
    numbers = {
        ('/checkmate cutoff <hit|evade|crit> <good|ok> <0-%d>  sets where a number counts as Good or OK. By '
            .. 'default hit is Good at 85 and OK at 70, evade at 30 and 15, and crit at 15 and 8.')
            :format(printout.CUTOFF_MAX),
        HELP_GRADES,
    },
    aggro = {
        '/checkmate detection on|off  shows or hides how an aggressive monster finds you, like (Sight, Sound).',
        '/checkmate linknames on|off  shows or hides the names a monster links with.',
        ('/checkmate maxlinks <0-%d>  sets the most link names shown. 0 shows every name.'):format(aggro.MAX_LINKS),
    },
    magic = {
        HELP_SCHOOL,
        '/checkmate spell <school> <spell>  sets the stand-in spell a school uses. /checkmate spell <school> lists '
            .. 'its spells.',
        ('/checkmate macc <0-%d>  sets your extra magic accuracy from gear, food and merits, which counts for every '
            .. 'school.'):format(magic.EXTRA_ACCURACY_MAX),
        '/checkmate weakword <text>  sets the word before the elements a monster is weak to. Put text with spaces in '
            .. 'quotes, and "" leaves the word out.',
        '/checkmate resistword <text>  sets the word before the elements a monster resists. Put text with spaces in '
            .. 'quotes, and "" leaves the word out.',
        '/checkmate strength on|off  shows or hides how strong each weak or resisted element is, like (half), and '
            .. 'the magic damage note.',
    },
    drops = {
        HELP_TH,
        ('/checkmate maxitems <0-%d>  sets the most items shown. 0 shows every item.'):format(drops.MAX_ITEMS),
        ('/checkmate minchance <0-%d>  leaves out items under this chance in percent, like 2.5. 0 shows every item.')
            :format(drops.MIN_CHANCE_MAX),
        '/checkmate sort chance|name  lists the items by chance, highest first, or by name.',
        '/checkmate thlabel on|off  shows or hides your Treasure Hunter in the label, like Drops (TH 2).',
        '/checkmate dropnotes on|off  shows or hides the notes (plus scripted drops) and (only drops if you get EXP).',
    },
    immunities = {
        ('/checkmate immunity <name> on|off  shows or leaves out one immunity. The immunities are %s.')
            :format(IMMUNITY_LIST),
        '/checkmate immunitylabel <name> <text>  sets the word an immunity prints as. Put text with spaces in quotes.',
    },
    look = {
        HELP_SKIN,
        '/checkmate skin undo  takes back your last skin pick or Reset to skin. It only goes back one step.',
        ('/checkmate font <name>  sets the settings window\'s font. The fonts are %s.'):format(window_font.IDS),
        ('/checkmate fontsize <%d-%d>  sets the settings window\'s font size in pixels.')
            :format(window_font.SIZE_MIN, window_font.SIZE_MAX),
        ('/checkmate rounding <0-%d>  sets how round the settings window\'s corners are, in pixels. 0 is square.')
            :format(skins.ROUNDING_MAX),
        ('/checkmate spacing <%d-%d>  sets the space between the settings window\'s rows, in pixels.')
            :format(skins.SPACING_MIN, skins.SPACING_MAX),
        '/checkmate windowcolor <what> <rrggbb>  sets one settings window color. /checkmate help windowcolors lists '
            .. 'them.',
    },
    profiles = {
        HELP_PROFILE,
        '/checkmate profile rename <old> <new>  renames a profile, and this character\'s job links to it follow. Put '
            .. 'names with spaces in quotes.',
        ('/checkmate joblink <job> <profile>  loads that profile when you change to that main job and zone. The jobs '
            .. 'are %s.'):format(JOB_LIST),
        '/checkmate joblink <job> none  stops a job loading a profile.',
    },
};

-- One line per heading, with its color keys after the name.
local function say_groups(groups)
    for _, group in ipairs(groups) do
        local keys = {};
        for _, entry in ipairs(group.colors) do
            keys[#keys + 1] = entry.key;
        end
        say(('%s  %s'):format(group.name, table.concat(keys, ', ')));
    end
end

-- Palette colors per line in /checkmate help colors, so no line runs too long.
local COLORS_PER_LINE = 8;

local function print_color_help()
    say('/checkmate color <what> <color>  sets one chat color. <what> is one of these, grouped under the headings '
        .. 'on the Colors tab.');
    say_groups(printout.COLOR_GROUPS);
    say('<color> is one of these names or its number. A name works with or without its spaces, like lawngreen.');
    local names = {};
    for index, entry in ipairs(printout.PALETTE) do
        names[#names + 1] = ('%s %d'):format(entry.name, entry.code);
        if (#names == COLORS_PER_LINE or index == #printout.PALETTE) then
            say(table.concat(names, ', '));
            names = {};
        end
    end
end

local function print_window_color_help()
    say('/checkmate windowcolor <what> <rrggbb>  sets one settings window color. <what> is one of these, grouped '
        .. 'under the headings on the Look tab.');
    say_groups(skins.WINDOW_COLOR_GROUPS);
    say('The color is six hex digits like c55151. Two more, from 00 to ff, set how solid it is, like c55151cc.');
end

local function print_help(word)
    if (word == 'windowcolors') then
        print_window_color_help();
        return;
    end
    for _, line in ipairs(HELP_TOPICS[word] or HELP_MAIN) do
        say(line);
    end
    if (word == 'colors') then
        print_color_help();
    end
end

--[[
    Commands.
]]

-- The commands with words of their own, by tab. Each gets the command's words and the first word after
-- the command in lowercase. The rest are in SWITCHES, CHOICES and NUMBERS.
local COMMANDS = {
    show          = function (_, word) set_part(word, true); end,
    hide          = function (_, word) set_part(word, false); end,
    label         = function (args, word) set_label(word, rest(args, 4)); end,
    newline       = function (args, word) set_new_line(word, lower(args[4])); end,
    move          = function (args, word) move_part(word, lower(args[4])); end,
    rangeword     = function (args) set_range_word(rest(args, 3)); end,
    divider       = function (args, word) set_divider(word, rest(args, 4)); end,
    labeldivider  = function (args, word) set_label_divider(word, rest(args, 4)); end,
    sample        = function () print_sample(); end,
    color         = function (args, word) set_color(word, table.concat(args, ' ', 4)); end,
    cutoff        = function (args, word) set_cutoff(word, lower(args[4]), args[5]); end,
    school        = function (args, word) set_school(word, on_word(lower(args[4]))); end,
    spell         = function (args, word) set_spell(word, table.concat(args, ' ', 4)); end,
    weakword      = function (args) set_element_word('weakword', rest(args, 3)); end,
    resistword    = function (args) set_element_word('resistword', rest(args, 3)); end,
    immunity      = function (args, word) set_immunity(word, lower(args[4])); end,
    immunitylabel = function (args, word) set_immunity_label(word, rest(args, 4)); end,
    skin          = function (args) set_skin(args[3]); end,
    font          = function (args) set_font(table.concat(args, ' ', 3)); end,
    windowcolor   = function (args, word) set_window_color(word, args[4]); end,
    profile       = function (args, word) run_profile(word, args[4], args[5]); end,
    joblink       = function (args, word) set_job_link(word, rest(args, 4)); end,
    info          = function () print_info(); end,
    reset         = function () reset_settings(); end,
    help          = function (_, word) print_help(word); end,
};

local function run_command(args)
    local sub  = args[2]:lower();
    local word = lower(args[3]);
    if (COMMANDS[sub] ~= nil) then
        COMMANDS[sub](args, word);
    elseif (SWITCHES[sub] ~= nil) then
        set_switch(sub, word);
    elseif (CHOICES[sub] ~= nil) then
        set_choice(sub, word);
    elseif (NUMBERS[sub] ~= nil) then
        set_number(sub, word);
    else
        say(('checkmate didn\'t recognize "%s". Type /checkmate help for the commands.'):format(args[2]));
    end
end

-- The command and its short form.
local COMMAND_NAMES = { ['/checkmate'] = true, ['/cmate'] = true };

ashita.events.register('command', 'checkmate_command', function (e)
    local args = e.command:args();
    if (#args == 0 or not COMMAND_NAMES[args[1]:lower()]) then
        return;
    end
    e.blocked = true;
    if (args[2] == nil) then
        toggle_window();
        return;
    end
    run_command(args);
end);

--[[
    Packets. checkmate only ever blocks the game's line for your own /check while replacing it is on,
    and the reply lines to its own /checkparam.
]]

local function on_message(e)
    local actor, target, param1, param2, message, index = packets.message(e);
    if (actor ~= checkmate.my_id) then
        return;
    end

    if (message == CHECK_IMPOSSIBLE or (message >= CHECK_FIRST and message <= CHECK_LAST)) then
        -- A checkmate stopped after an error skips the /check, so the game's line stays.
        if (checkmate.broken) then
            return;
        end
        on_check(target, index, param1, param2, message);
        if (checkmate.settings.printout.replace_game_line) then
            e.blocked = true;
        end
    elseif (target == checkmate.my_id and checkparam.is_reply(message)) then
        local hide, finished = checkparam.on_reply(message, param1);
        if (hide) then
            e.blocked = true;
        end
        if (finished ~= nil) then
            stop_waiting(finished);
        end
    end
end

-- Another addon can block the /check line, and checkmate still reads it.
ashita.events.register('packet_in', 'checkmate_packet_in', function (e)
    local id = e.id;
    if (id == packets.ID.MESSAGE) then
        on_message(e);
    elseif (id == packets.ID.WIDESCAN) then
        monsters.on_widescan(packets.widescan(e));
    elseif (id == packets.ID.ZONE_IN) then
        checkmate.my_id = packets.zone_in(e);
        monsters.forget_zone();
        checkmate.ready = {};
        give_up(checkparam.reset());
        checkmate.job_check = true;
    end
end);

--[[
    Frame.
]]

-- Sends the /checkparam when it's due, and lets the /check print without it when the reply is late.
local function update_checkparam(now)
    if (checkparam.due(now)) then
        AshitaCore:GetChatManager():QueueCommand(COMMAND_TYPED, '/checkparam <me>');
        return;
    end
    local late = checkparam.timed_out(now);
    if (late ~= nil) then
        stop_waiting(late);
    end
end

--[[
    Reads your main job once you're back in the world after zoning. Jobs change in your Mog House, so
    this sees every change. A change loads the profile linked to the new job.
]]
local function check_job()
    local job = player.in_world() and player.main_job() or 0;
    if (job == 0) then
        return;
    end
    checkmate.job_check = false;

    local changed = checkmate.last_job ~= nil and job ~= checkmate.last_job;
    checkmate.last_job = job;
    if (not changed) then
        return;
    end
    local name = profiles.on_job(checkmate.settings, job);
    if (name ~= nil) then
        save_settings();
        say(('Your settings now come from the profile "%s", since it\'s linked to this job.'):format(name));
    end
end

--[[
    The settings window hands back what to do after it draws. `save` writes your settings and
    `sample` prints the sample printout.
]]
local function draw_window()
    if (not settings_window.is_open()) then
        return;
    end
    local result = settings_window.draw(checkmate.settings, addon.version);
    if (result.sample) then
        print_sample();
    end
    if (result.save) then
        save_settings();
    end
end

local function frame()
    if (checkparam.is_active()) then
        update_checkparam(os.clock());
    end
    if (#checkmate.ready > 0) then
        local ready = checkmate.ready;
        checkmate.ready = {};
        for _, check in ipairs(ready) do
            print_check(check);
        end
    end
    if (checkmate.job_check) then
        check_job();
    end
    draw_window();
end

-- A frame that fails stops checkmate and says so once, rather than every frame.
ashita.events.register('d3d_present', 'checkmate_present', function ()
    if (checkmate.broken) then
        return;
    end
    local ok, err = pcall(frame);
    if (not ok) then
        checkmate.broken = true;
        say(('Stopped after an error: %s. Type /checkmate to try again.'):format(tostring(err)));
    end
end);

ashita.events.register('load', 'checkmate_load', function ()
    checkmate.my_id = player.server_id() or 0;
    tidy(checkmate.settings);
    -- Fonts only ever load here. Adding one in the middle of a frame can crash the game.
    window_font.load_all();
end);

ashita.events.register('unload', 'checkmate_unload', function ()
    settings.save();
end);

-- Another character logged in, or the settings were reset. The new settings replace the current ones.
settings.register('settings', 'checkmate_settings_update', function (s)
    if (s ~= nil) then
        checkmate.settings = s;
    end
    tidy(checkmate.settings);
    skins.forget_undo();
    settings_window.place_again();
    checkmate.reset_asked = nil;
    checkmate.my_id = player.server_id() or 0;
    checkmate.last_job = nil;
    checkmate.job_check = true;
end);
