-- Every /checkmate command, the words it refuses, and that each change is saved. The font commands use a
-- test fonts folder with a missing font and one that won't load.
-- The fonts folder is a test folder with a made-up Segoe UI, Tahoma and Arial in it, and Verdana missing.
-- Tahoma raises an error while it loads.
local window_font = require('ui.window_font');
window_font.FOLDER = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\';
for _, file in ipairs({ 'segoeui.ttf', 'tahoma.ttf', 'arial.ttf' }) do
    local f = assert(io.open(window_font.FOLDER .. file, 'w'));
    f:write('not really a font');
    f:close();
end
MOCK.broken_fonts = { ['tahoma.ttf'] = 'error' };

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local loads = #MOCK.font_calls;
local window   = require('ui.settings_window');
local skins    = require('ui.skins');
local printout = require('core.printout');
local bands    = require('data.bands');
local function cur() return MOCK.settings.current; end

-- Runs a command. Returns the lines it printed, joined, and whether it was blocked.
local function run(text)
    local n = #MOCK.printed;
    local e = MOCK.command(text);
    return table.concat(MOCK.printed_since(n), ' / '), e.blocked;
end
local function has(text, want)
    return text:find(want, 1, true) ~= nil;
end

-- Only /checkmate is ours.
local said, blocked = run('/check');
check('other commands pass through', blocked == false and said == '');
said, blocked = run('/checkmatey show hit');
check('a longer word isn\'t ours', blocked == false and said == '');
said, blocked = run('/CHECKMATE level off');
check('any case is ours and blocked', blocked == true and cur().printout.show_level == false, said);
run('/checkmate level on');

-- /cmate is the short form of every command.
said, blocked = run('/cmate level off');
check('/cmate is ours and blocked', blocked == true and cur().printout.show_level == false
    and said == '[checkmate] The level no longer shows after the monster\'s name.', said);
said, blocked = run('/CMate level on');
check('in any case', blocked == true and cur().printout.show_level == true, said);
said, blocked = run('/cmatey level off');
check('a longer word isn\'t ours either', blocked == false and said == '' and cur().printout.show_level == true);
run('/cmate');
check('/cmate opens the window', window.is_open());
run('/cmate');
check('and closes it', not window.is_open());

-- A word checkmate doesn't know gets one line, in the case it was typed.
said, blocked = run('/checkmate Bogus');
check('an unknown word gets one short line', blocked == true and said == '[checkmate] checkmate didn\'t recognize '
    .. '"Bogus". Type /checkmate help for the commands.', said);
said = run('/cmate frobnicate now');
check('from /cmate too', said == '[checkmate] checkmate didn\'t recognize "frobnicate". Type /checkmate help for the '
    .. 'commands.', said);

-- The window.
run('/checkmate');
check('/checkmate opens the window', window.is_open());
run('/checkmate');
check('and closes it', not window.is_open());

-- Parts.
for _, id in ipairs({ 'name', 'difficulty', 'reading', 'hit', 'evade', 'crit', 'aggro', 'magic', 'immunities', 'elements',
    'drops' }) do
    local saves = MOCK.saved;
    said = run('/checkmate show ' .. id);
    check('show ' .. id, cur().printout.parts[id].on == true and MOCK.saved > saves
        and said == ('[checkmate] checkmate now shows the %s part.'):format(id), said);
    said = run('/checkmate hide ' .. id);
    check('hide ' .. id, cur().printout.parts[id].on == false
        and said == ('[checkmate] checkmate no longer shows the %s part.'):format(id), said);
end
run('/checkmate show name');
run('/checkmate show difficulty');
run('/checkmate show reading');
run('/checkmate show aggro');
said = run('/checkmate show bogus');
check('an unknown part lists the parts', has(said, 'There is no part called "bogus". The parts are name, difficulty, '
    .. 'reading (evasion and defense), hit, evade, crit, aggro, magic, immunities, elements, drops.'), said);
-- Settings tables are Ashita T{} tables, which answer "sort" or "copy" with a table function.
said = run('/checkmate show sort');
check('a table function name is an unknown part', has(said, 'There is no part called "sort"'), said);
said = run('/checkmate hide copy');
check('so is copy', has(said, 'There is no part called "copy"'), said);
said = run('/checkmate show');
check('show with no part prints its usage', said == '[checkmate] Type /checkmate show|hide <part>. The parts are name, '
    .. 'difficulty, reading (evasion and defense), hit, evade, crit, aggro, magic, immunities, elements, drops.', said);

-- Level.
said = run('/checkmate level off');
check('level off', cur().printout.show_level == false
    and said == '[checkmate] The level no longer shows after the monster\'s name.', said);
said = run('/checkmate level on');
check('level on', cur().printout.show_level == true
    and said == '[checkmate] The level now shows after the monster\'s name.', said);
said = run('/checkmate level maybe');
check('level with another word prints its usage', said == '[checkmate] Type /checkmate level on|off.', said);
said = run('/checkmate level');
check('so does level alone', said == '[checkmate] Type /checkmate level on|off.', said);

-- The level range and its word.
check('the level range is off by default, with the word range', cur().printout.show_range == false
    and cur().printout.range_word == 'range');
local saves = MOCK.saved;
said = run('/checkmate levelrange on');
check('levelrange on', cur().printout.show_range == true and MOCK.last_save.printout.show_range == true and MOCK.saved > saves
    and said == '[checkmate] The level range now shows after a monster\'s exact level.', said);
said = run('/checkmate LEVELRANGE OFF');
check('levelrange off, in any case', cur().printout.show_range == false
    and said == '[checkmate] The level range no longer shows after a monster\'s level.', said);
for _, text in ipairs({ '/checkmate levelrange', '/checkmate levelrange maybe', '/checkmate levelrange sort' }) do
    said = run(text);
    check('usage for: ' .. text, said == '[checkmate] Type /checkmate levelrange on|off.' and cur().printout.show_range == false,
        said);
end
saves = MOCK.saved;
said = run('/checkmate rangeword Spawns');
check('rangeword keeps its case', cur().printout.range_word == 'Spawns' and MOCK.last_save.printout.range_word == 'Spawns'
    and MOCK.saved > saves and said == '[checkmate] The level range now prints like (Lv 42, Spawns 40-44).', said);
said = run('/checkmate rangeword "spawns at"');
check('a quoted word keeps its spaces', cur().printout.range_word == 'spawns at'
    and said == '[checkmate] The level range now prints like (Lv 42, spawns at 40-44).', said);
run('/checkmate rangeword lv range');
check('words without quotes', cur().printout.range_word == 'lv range', cur().printout.range_word);
run('/checkmate rangeword "\129\154Lv\9"');
check('the word keeps printable ASCII only', cur().printout.range_word == 'Lv', cur().printout.range_word);
run('/checkmate rangeword "' .. string.rep('x', 40) .. '"');
check('and 32 characters at most', cur().printout.range_word == string.rep('x', 32), cur().printout.range_word);
said = run('/checkmate rangeword ""');
check('empty quotes clear it', cur().printout.range_word == '' and MOCK.last_save.printout.range_word == ''
    and said == '[checkmate] The level range now prints like (Lv 42, 40-44).', said);
said = run('/checkmate rangeword');
check('rangeword alone prints its usage and keeps the word', cur().printout.range_word == ''
    and said == '[checkmate] Type /checkmate rangeword <text>. Put text with spaces in quotes, and "" leaves the word out.', said);
run('/checkmate rangeword range');

-- The elements words.
check('the elements words are Weak and Resists by default, with how strong on', cur().elements.weak_word == 'Weak'
    and cur().elements.resist_word == 'Resists' and cur().elements.strength == true);
saves = MOCK.saved;
said = run('/checkmate weakword Soft');
check('weakword keeps its case', cur().elements.weak_word == 'Soft' and MOCK.last_save.elements.weak_word == 'Soft'
    and MOCK.saved > saves and said == '[checkmate] The elements part now puts "Soft" before the elements a monster is '
    .. 'weak to.', said);
said = run('/checkmate resistword "Holds up to"');
check('a quoted resist word keeps its spaces', cur().elements.resist_word == 'Holds up to'
    and said == '[checkmate] The elements part now puts "Holds up to" before the elements a monster resists.', said);
run('/checkmate weakword "\129\154Weak\9"');
check('the word keeps printable ASCII only', cur().elements.weak_word == 'Weak', cur().elements.weak_word);
run('/checkmate resistword "' .. string.rep('x', 40) .. '"');
check('and 32 characters at most', cur().elements.resist_word == string.rep('x', 32), cur().elements.resist_word);
said = run('/checkmate resistword ""');
check('empty quotes clear it', cur().elements.resist_word == '' and MOCK.last_save.elements.resist_word == ''
    and said == '[checkmate] The elements part now lists the elements a monster resists with no word before them.', said);
for _, sub in ipairs({ 'weakword', 'resistword' }) do
    said = run('/checkmate ' .. sub);
    check(sub .. ' alone prints its usage', said == ('[checkmate] Type /checkmate %s <text>. Put text with spaces in '
        .. 'quotes, and "" leaves the word out.'):format(sub), said);
end
check('and keeps the words', cur().elements.weak_word == 'Weak' and cur().elements.resist_word == '');
run('/checkmate resistword Resists');

-- The extras line.
check('the extras start on their own line by default', cur().printout.extras_own_line == true);
said = run('/checkmate extras same');
check('extras same', cur().printout.extras_own_line == false and MOCK.last_save.printout.extras_own_line == false
    and said == '[checkmate] Hit, evade, crit, aggro, magic, immunities, elements and drops now stay on the /check line. A part '
    .. 'with New line checked still starts a new line.', said);
said = run('/checkmate extras NEW');
check('extras new, in any case', cur().printout.extras_own_line == true
    and said == '[checkmate] Hit, evade, crit, aggro, magic, immunities, elements and drops now start on a new line.', said);
for _, text in ipairs({ '/checkmate extras', '/checkmate extras on', '/checkmate extras sort' }) do
    said = run(text);
    check('usage for: ' .. text, said == '[checkmate] Type /checkmate extras same|new.' and cur().printout.extras_own_line == true,
        said);
end

-- Which reading comes first.
check('evasion comes first by default', cur().printout.defense_first == false);
said = run('/checkmate reading defense');
check('reading defense', cur().printout.defense_first == true and MOCK.last_save.printout.defense_first == true
    and said == '[checkmate] Defense now comes before evasion in the reading.', said);
said = run('/checkmate reading EVASION');
check('reading evasion, in any case', cur().printout.defense_first == false
    and said == '[checkmate] Evasion now comes before defense in the reading.', said);
for _, text in ipairs({ '/checkmate reading', '/checkmate reading on', '/checkmate reading sort' }) do
    said = run(text);
    check('usage for: ' .. text, said == '[checkmate] Type /checkmate reading evasion|defense.'
        and cur().printout.defense_first == false, said);
end

-- The on|off commands, each on by default.
local SWITCHES = {
    { 'tag', 'printout', 'header', 'checkmate\'s /check lines now start with [checkmate].',
        'checkmate\'s /check lines no longer start with [checkmate].' },
    { 'replace', 'printout', 'replace_game_line', 'checkmate now replaces the game\'s /check line.',
        'checkmate no longer replaces the game\'s /check line.' },
    { 'concolors', 'printout', 'con_colors', 'Each difficulty now prints in its own color.',
        'Every difficulty now prints in the same color.' },
    { 'threatcolors', 'aggro', 'threat_colors', 'Aggressive now prints in the Threat color, and the other answers in '
        .. 'the Safe color.', 'Every aggro answer now prints in the Words color.' },
    { 'grades', 'grades', 'on', 'The hit rate, evade and crit numbers now print in the Good, OK or Bad color.',
        'The hit rate, evade and crit numbers now print in each part\'s Number color.' },
    { 'detection', 'aggro', 'detection', 'The aggro part now shows how a monster finds you.',
        'The aggro part no longer shows how a monster finds you.' },
    { 'linknames', 'aggro', 'link_names', 'The aggro part now names what a monster links with.',
        'The aggro part now just says whether a monster links, without the names.' },
    { 'strength', 'elements', 'strength', 'The elements part now shows how strong each one is, like (half), and the '
        .. 'magic damage note.', 'The elements part no longer shows how strong each one is or the magic damage note.' },
    { 'thlabel', 'drops', 'th_in_label', 'The drops label now shows your Treasure Hunter, like Drops (TH 2).',
        'The drops label no longer shows your Treasure Hunter.' },
    { 'dropnotes', 'drops', 'notes', 'The drops part now adds (plus scripted drops) and (only drops if you get EXP) when '
        .. 'they apply.', 'The drops part no longer adds (plus scripted drops) or (only drops if you get EXP).' },
};
for _, switch in ipairs(SWITCHES) do
    local sub, section, key, said_on, said_off = unpack(switch);
    check(sub .. ' is on by default', cur()[section][key] == true);
    local saves = MOCK.saved;
    said = run('/checkmate ' .. sub .. ' off');
    check(sub .. ' off', cur()[section][key] == false and MOCK.last_save[section][key] == false and MOCK.saved > saves
        and said == '[checkmate] ' .. said_off, said);
    said = run('/checkmate ' .. sub:upper() .. ' ON');
    check(sub .. ' on, in any case', cur()[section][key] == true and MOCK.last_save[section][key] == true
        and said == '[checkmate] ' .. said_on, said);
    for _, word in ipairs({ '', ' maybe', ' sort' }) do
        said = run('/checkmate ' .. sub .. word);
        check(('usage for: /checkmate %s%s'):format(sub, word), said == ('[checkmate] Type /checkmate %s on|off.'):format(sub)
            and cur()[section][key] == true, said);
    end
end

-- The most link names shown.
check('five link names by default', cur().aggro.max_links == 5);
for _, most in ipairs({ 0, 12, 3 }) do
    local saves = MOCK.saved;
    said = run('/checkmate maxlinks ' .. most);
    local want = (most == 0) and 'The aggro part now shows every name a monster links with.'
        or ('The aggro part now shows at most %d of the names a monster links with.'):format(most);
    check('maxlinks ' .. most, cur().aggro.max_links == most and MOCK.last_save.aggro.max_links == most and MOCK.saved > saves
        and said == '[checkmate] ' .. want, said);
end
for _, word in ipairs({ '13', '-1', '2.5', 'all', '' }) do
    said = run('/checkmate maxlinks ' .. word);
    check('maxlinks "' .. word .. '" refused', said == '[checkmate] Type /checkmate maxlinks <0-12>. 0 shows every name.'
        and cur().aggro.max_links == 3, said);
end
run('/checkmate maxlinks 5');

-- Chat colors. Every color setting by name, and a color by its name, with or without spaces, or number.
for _, key in ipairs(printout.COLOR_KEYS) do
    local saves = MOCK.saved;
    said = run('/checkmate color ' .. key .. ' plum');
    check('color ' .. key, cur().colors[key] == 105 and MOCK.last_save.colors[key] == 105 and MOCK.saved > saves
        and said == ('[checkmate] The %s color is now Plum.'):format(key), said);
end
said = run('/checkmate color HIT_LABEL "Lawn green"');
check('a quoted color name, and the setting in any case', cur().colors.hit_label == 2
    and said == '[checkmate] The hit_label color is now Lawn green.', said);
run('/checkmate color hit_label med spring green');
check('a color name with spaces and no quotes', cur().colors.hit_label == 88);
run('/checkmate color hit_label lightblue');
check('a color name without its spaces', cur().colors.hit_label == 102);
run('/checkmate color hit_label 69');
check('a color by number', cur().colors.hit_label == 69);
local USAGE = '[checkmate] Type /checkmate color <what> <color>. /checkmate help colors lists the choices for each.';
for _, text in ipairs({ '/checkmate color', '/checkmate color hit_label' }) do
    said = run(text);
    check('usage for: ' .. text, said == USAGE and cur().colors.hit_label == 69, said);
end
for _, word in ipairs({ 'bogus', 'sort', 'hit' }) do
    said = run('/checkmate color ' .. word .. ' plum');
    check('an unknown color setting: ' .. word, said == ('[checkmate] There is no color setting called "%s". /checkmate '
        .. 'help colors lists them.'):format(word), said);
end
for _, word in ipairs({ '0', '10', '13', 'rainbow', '999' }) do
    said = run('/checkmate color hit_label ' .. word);
    check('an unknown chat color: ' .. word, said == ('[checkmate] There is no chat color called "%s". /checkmate help '
        .. 'colors lists them.'):format(word) and cur().colors.hit_label == 69, said);
end

-- The replies color paints checkmate's answers, and the tag colors their tag.
run('/checkmate color replies violet');
run('/checkmate color tag_word lime');
local n = #MOCK.printed;
run('/checkmate level on');
local raw = MOCK.printed[#MOCK.printed];
check('replies and the tag print in their colors', #MOCK.printed == n + 1 and raw:find('\30\79checkmate', 1, true) ~= nil
    and raw:find('\30\73The level now shows after the monster\'s name.', 1, true) ~= nil, raw);

-- /checkmate help colors lists every color setting under its heading, and every palette color.
said = run('/checkmate help colors');
local listed = true;
for _, key in ipairs(printout.COLOR_KEYS) do
    listed = listed and has(said, key);
end
for _, entry in ipairs(printout.PALETTE) do
    listed = listed and has(said, ('%s %d'):format(entry.name, entry.code));
end
check('help colors lists every setting and color', listed and has(said, '[checkmate] Hit rate  hit_label, hit_number, '
    .. 'hit_detail') and has(said, '[checkmate] Tag and lines  tag_brackets, tag_word, line, replies'), said);
local longest = 0;
for i = n + 1, #MOCK.printed do longest = math.max(longest, #MOCK.plain(MOCK.printed[i])); end
check('and no line of it runs past 200 characters', longest <= 200, longest);
run('/checkmate skin phoenix');

-- Window colors. Every one by key, in six hex digits or eight with how solid it is.
for _, entry in ipairs(skins.WINDOW_COLORS) do
    local saves = MOCK.saved;
    said = run('/checkmate windowcolor ' .. entry.key .. ' 336699');
    local c = cur().look.imgui[entry.key];
    check('windowcolor ' .. entry.key, c[1] == 0x33 / 255 and c[3] == 0x99 / 255 and c[4] == 1 and MOCK.saved > saves
        and MOCK.last_save.look.imgui[entry.key][2] == 0x66 / 255
        and said == ('[checkmate] The %s window color is now 336699.'):format(entry.key), said);
end
said = run('/checkmate windowcolor BUTTONS #C5515180');
local buttons = cur().look.imgui.buttons;
check('a color with a # and how solid it is, and the setting in any case', buttons[1] == 0xc5 / 255
    and buttons[4] == 0x80 / 255 and said == '[checkmate] The buttons window color is now c5515180.', said);
local WINDOW_USAGE = '[checkmate] Type /checkmate windowcolor <what> <rrggbb>. /checkmate help windowcolors lists the '
    .. 'window colors.';
for _, text in ipairs({ '/checkmate windowcolor', '/checkmate windowcolor buttons' }) do
    said = run(text);
    check('usage for: ' .. text, said == WINDOW_USAGE and cur().look.imgui.buttons == buttons, said);
end
for _, word in ipairs({ 'bogus', 'sort', 'accent' }) do
    said = run('/checkmate windowcolor ' .. word .. ' 336699');
    check('an unknown window color: ' .. word, said == ('[checkmate] There is no window color called "%s". /checkmate '
        .. 'help windowcolors lists them.'):format(word), said);
end
for _, word in ipairs({ 'c5515', 'c55151c', 'zzzzzz', '#', 'red', 'c5515180ff' }) do
    said = run('/checkmate windowcolor buttons ' .. word);
    check('not a color: ' .. word, said == ('[checkmate] "%s" isn\'t a color. Type six hex digits like c55151, or eight '
        .. 'like c55151cc to make it see-through.'):format(word) and cur().look.imgui.buttons == buttons, said);
end
local before_help = #MOCK.printed;
said = run('/checkmate help windowcolors');
local every = true;
for _, entry in ipairs(skins.WINDOW_COLORS) do
    every = every and has(said, entry.key);
end
check('help windowcolors lists every window color under its heading', every
    and has(said, '[checkmate] Button colors  buttons, buttons_hovered, buttons_pressed')
    and has(said, '[checkmate] The color is six hex digits like c55151.'), said);
local widest = 0;
for _, line in ipairs(MOCK.printed_since(before_help)) do
    widest = math.max(widest, #line);
end
check('and no line of it runs past 200 characters', widest <= 200, widest);
run('/checkmate skin phoenix');

-- The settings window's font and font size. The load event loaded every font from the test folder set up at
-- the top, and a font command only switches between them.
check('Ashita\'s font at 18 by default', cur().look.font == 'ashita' and cur().look.font_size == 18);
check('the load event tried the three fonts that are there and loaded two', loads == 3 and #MOCK.fonts_loaded == 2
    and MOCK.fonts_loaded[1].path == window_font.FOLDER .. 'segoeui.ttf'
    and MOCK.fonts_loaded[2].path == window_font.FOLDER .. 'arial.ttf', loads);
local font_saves = MOCK.saved;
said = run('/checkmate font segoe ui');
check('font segoe ui switches to it', cur().look.font == 'segoeui' and MOCK.last_save.look.font == 'segoeui'
    and MOCK.saved > font_saves and said == '[checkmate] The settings window now uses the Segoe UI font.', said);
run('/checkmate font "Segoe UI"');
check('a quoted name', cur().look.font == 'segoeui');
said = run('/checkmate font Verdana');
check('a missing font says so', cur().look.font == 'verdana'
    and said == ('[checkmate] You picked the Verdana font, but %sverdana.ttf is missing or won\'t load, so the settings '
    .. 'window uses Ashita\'s font.'):format(window_font.FOLDER), said);
said = run('/checkmate font tahoma');
check('a font that raised an error while loading says so', cur().look.font == 'tahoma' and window_font.failed('tahoma')
    and has(said, 'tahoma.ttf is missing or won\'t load'), said);
said = run('/checkmate font ARIAL');
check('a font in any case', cur().look.font == 'arial'
    and said == '[checkmate] The settings window now uses the Arial font.', said);
said = run('/checkmate font ashita');
check('font ashita', cur().look.font == 'ashita' and said == '[checkmate] The settings window now uses the Ashita font.', said);
check('no font command loaded a font', #MOCK.font_calls == loads, #MOCK.font_calls);
local FONT_LIST = 'ashita, segoeui, arial, tahoma, verdana, calibri, consolas';
said = run('/checkmate font');
check('font alone prints its usage', said == '[checkmate] Type /checkmate font <name>. The fonts are ' .. FONT_LIST .. '.', said);
said = run('/checkmate font Comic Sans');
check('an unknown font lists the fonts', said == '[checkmate] There is no font called "Comic Sans". The fonts are '
    .. FONT_LIST .. '.' and cur().look.font == 'ashita', said);
for _, size in ipairs({ 12, 24, 20 }) do
    font_saves = MOCK.saved;
    said = run('/checkmate fontsize ' .. size);
    check('fontsize ' .. size, cur().look.font_size == size and MOCK.last_save.look.font_size == size
        and MOCK.saved > font_saves and said == ('[checkmate] The settings window\'s font size is now %d pixels.'):format(size),
        said);
end
for _, word in ipairs({ '11', '25', '15.5', 'big', '' }) do
    said = run('/checkmate fontsize ' .. word);
    check('fontsize "' .. word .. '" refused', said == '[checkmate] Type /checkmate fontsize <12-24>.'
        and cur().look.font_size == 20, said);
end

-- Treasure Hunter.
for th = 0, 4 do
    said = run('/checkmate th ' .. th);
    check('th ' .. th, cur().drops.th == th and said == ('[checkmate] Drop chances now use Treasure Hunter %d.'):format(th),
        said);
end
for _, word in ipairs({ '5', '-1', '1.5', 'two', '' }) do
    said = run('/checkmate th ' .. word);
    check('th "' .. word .. '" refused', cur().drops.th == 4 and has(said, 'Type /checkmate th <0-4>.'), said);
end

-- Schools.
for _, id in ipairs({ 'elemental', 'enfeebling', 'dark', 'divine', 'healing', 'ninjutsu', 'singing', 'blue' }) do
    local label = id:sub(1, 1):upper() .. id:sub(2);
    local said_on = run('/checkmate school ' .. id .. ' on');
    local on = cur().magic.schools[id].on;
    said = run('/checkmate school ' .. id .. ' off');
    check('school ' .. id, on == true and cur().magic.schools[id].on == false
        and said_on == ('[checkmate] The magic part now shows the %s school when you have skill in it.'):format(label)
        and said == ('[checkmate] The magic part no longer shows the %s school.'):format(label), said_on .. ' / ' .. said);
end
said = run('/checkmate school Elemental ON');
check('school words in any case', cur().magic.schools.elemental.on == true, said);
for _, text in ipairs({ '/checkmate school bogus on', '/checkmate school dark', '/checkmate school sort on', '/checkmate school' }) do
    said = run(text);
    check('refused: ' .. text, has(said, 'Type /checkmate school <school> on|off. The schools are elemental, enfeebling, '
        .. 'dark, divine, healing, ninjutsu, singing, blue.'), said);
end

-- Skins.
for _, skin in ipairs(skins.LIST) do
    said = run('/checkmate skin ' .. skin.id);
    local same = cur().printout.con_colors == skin.chat.con_colors;
    for _, key in ipairs(printout.COLOR_KEYS) do
        same = same and cur().colors[key] == skin.chat[key];
    end
    check('skin ' .. skin.id, cur().look.skin == skin.id and same
        and said == ('[checkmate] You\'re using the %s skin now.'):format(skin.name), said);
end
said = run('/checkmate skin "High contrast"');
check('a skin by its quoted name', cur().look.skin == 'contrast'
    and said == '[checkmate] You\'re using the High contrast skin now.', said);
said = run('/checkmate skin bogus');
check('an unknown skin lists the skins', has(said, 'There is no skin called "bogus". The skins are phoenix, classic, '
    .. 'minimal, contrast, ember, colorblind.'), said);
said = run('/checkmate skin');
check('skin with no name prints its usage', said == '[checkmate] Type /checkmate skin <name>. The skins are phoenix, classic, '
    .. 'minimal, contrast, ember, colorblind.', said);

-- Dividers.
local DIVIDER_LIST = 'star, whitestar, diamond, whitediamond, circle, dot, note, arrow, pipe, slash, dash, spaces, custom';
local NAMES = {
    star = 'Star', whitestar = 'White star', diamond = 'Diamond', whitediamond = 'White diamond', circle = 'Circle',
    dot = 'Middle dot', note = 'Music note', arrow = 'Arrow', pipe = 'Pipe |', slash = 'Slash /', dash = 'Dash -',
    spaces = 'Two spaces', custom = 'Custom',
};
check('Star is the default divider', cur().printout.divider == 'star');
for id in DIVIDER_LIST:gmatch('%a+') do
    local saves = MOCK.saved;
    said = run('/checkmate divider ' .. id);
    check('divider ' .. id, cur().printout.divider == id and MOCK.last_save.printout.divider == id and MOCK.saved > saves
        and said == ('[checkmate] You\'re using the %s divider between parts now.'):format(NAMES[id]), said);
end
run('/checkmate divider "Middle dot"');
check('a divider by its quoted name', cur().printout.divider == 'dot');
said = run('/checkmate divider ARROW');
check('a divider in any case', cur().printout.divider == 'arrow', said);
for _, word in ipairs({ 'bogus', 'sort', 'Stars' }) do
    said = run('/checkmate divider ' .. word);
    check('an unknown divider lists the dividers: ' .. word, said == ('[checkmate] There is no divider called "%s". The dividers '
        .. 'are %s.'):format(word:lower(), DIVIDER_LIST) and cur().printout.divider == 'arrow', said);
end
said = run('/checkmate divider');
check('divider with no name prints its usage', said == '[checkmate] Type /checkmate divider <name>. The dividers are '
    .. DIVIDER_LIST .. '.' and cur().printout.divider == 'arrow', said);
run('/checkmate divider pipe');
said = run('/checkmate sample');
check('the sample shows the divider you picked', said == '[checkmate] Sample Goblin (Lv 42) | Decent Challenge (Low Defense) / '
    .. '[checkmate] Aggro: Aggressive (Sight) | Links with Goblin Butcher, Goblin Leecher, Goblin Tinkerer', said);
cur().printout.separator = '++';
run('/checkmate divider custom');
said = run('/checkmate sample');
check('and Custom with your text', said == '[checkmate] Sample Goblin (Lv 42)++Decent Challenge (Low Defense) / '
    .. '[checkmate] Aggro: Aggressive (Sight)++Links with Goblin Butcher, Goblin Leecher, Goblin Tinkerer', said);
cur().printout.separator = '  ';
run('/checkmate divider star');

-- Label dividers. Each preset by id, Custom with and without text, and the words it refuses.
local LABEL_LIST = 'colon, star, whitestar, diamond, whitediamond, circle, dot, note, arrow, pipe, slash, dash, space, custom';
local LABEL_NAMES = { colon = 'Colon :', space = 'Space only' };
local LABEL_DIVIDER_USAGE = 'The label dividers are ' .. LABEL_LIST
    .. '. Type /checkmate labeldivider custom <text> for your own text.';
check('Colon is the default label divider', cur().printout.label_divider == 'colon' and cur().printout.label_separator == ':');
for id in LABEL_LIST:gmatch('%a+') do
    if (id ~= 'custom') then
        local saves = MOCK.saved;
        said = run('/checkmate labeldivider ' .. id);
        check('labeldivider ' .. id, cur().printout.label_divider == id and MOCK.last_save.printout.label_divider == id
            and MOCK.saved > saves
            and said == ('[checkmate] You\'re using the %s label divider now.'):format(LABEL_NAMES[id] or NAMES[id]), said);
    end
end
run('/checkmate labeldivider "Space only"');
check('a label divider by its quoted name', cur().printout.label_divider == 'space');
said = run('/checkmate labeldivider ARROW');
check('a label divider in any case', cur().printout.label_divider == 'arrow', said);
said = run('/checkmate labeldivider custom');
check('custom alone keeps the text you had', cur().printout.label_divider == 'custom' and cur().printout.label_separator == ':'
    and MOCK.last_save.printout.label_divider == 'custom'
    and said == '[checkmate] Each label is now followed by ":" and a space.', said);
said = run('/checkmate labeldivider custom " >"');
check('custom text in quotes keeps its spaces', cur().printout.label_separator == ' >' and MOCK.last_save.printout.label_separator
    == ' >' and said == '[checkmate] Each label is now followed by " >" and a space.', said);
run('/checkmate divider pipe');
said = run('/checkmate sample');
check('and the sample prints it with a space after', said == '[checkmate] Sample Goblin (Lv 42) | Decent Challenge (Low Defense) / '
    .. '[checkmate] Aggro > Aggressive (Sight) | Links with Goblin Butcher, Goblin Leecher, Goblin Tinkerer', said);
run('/checkmate labeldivider CUSTOM - >');
check('custom text without quotes, in any case', cur().printout.label_divider == 'custom' and cur().printout.label_separator == '- >',
    cur().printout.label_separator);
run('/checkmate labeldivider custom "\129\154=\9"');
check('custom text keeps printable ASCII only', cur().printout.label_separator == '=', cur().printout.label_separator);
run('/checkmate labeldivider custom "longer than eight"');
check('and eight characters at most', cur().printout.label_separator == 'longer t', cur().printout.label_separator);
said = run('/checkmate labeldivider custom ""');
check('empty custom text leaves just the space', cur().printout.label_separator == ''
    and said == '[checkmate] Each label is now followed by just a space.', said);
said = run('/checkmate sample');
check('so the sample reads "Aggro Aggressive"', has(said, '[checkmate] Aggro Aggressive (Sight) | Links with'), said);
run('/checkmate labeldivider arrow');
check('a preset after custom keeps the custom text for later', cur().printout.label_divider == 'arrow'
    and cur().printout.label_separator == '');
for _, word in ipairs({ 'bogus', 'sort', 'spaces', 'Colons' }) do
    said = run('/checkmate labeldivider ' .. word);
    check('an unknown label divider lists them: ' .. word, said == ('[checkmate] There is no label divider called "%s". ')
        :format(word:lower()) .. LABEL_DIVIDER_USAGE and cur().printout.label_divider == 'arrow', said);
end
said = run('/checkmate labeldivider');
check('labeldivider with no name prints its usage', said == '[checkmate] Type /checkmate labeldivider <name>. ' .. LABEL_DIVIDER_USAGE
    and cur().printout.label_divider == 'arrow', said);
cur().printout.label_separator = ':';
run('/checkmate labeldivider colon');
run('/checkmate divider star');

-- The rest of the window's settings. Each block puts its settings back to the defaults after.
local fresh = require('ui.defaults').make();
local PARTS = 'difficulty, hit, evade, crit, aggro, magic, immunities, elements, drops';
local LABEL_PARTS = 'name, ' .. PARTS;
local IMMUNITY_LIST = 'sleep, lullaby, bind, gravity, silence, stun, paralyze, slow, elegy, blind, poison, requiem, petrify, '
    .. 'terror, plague, curse';
local JOB_LIST = 'WAR, MNK, WHM, BLM, RDM, THF, PLD, DRK, BST, BRD, RNG, SAM, NIN, DRG, SMN, BLU, COR, PUP';

-- Labels. Every part but the reading has one, the name's included.
check('Hit is the hit label and the name has none at first', cur().printout.parts.hit.label == 'Hit'
    and cur().printout.parts.name.label == '');
for id in LABEL_PARTS:gmatch('%a+') do
    local saves = MOCK.saved;
    said = run('/checkmate label ' .. id .. ' Zz');
    check('label ' .. id, cur().printout.parts[id].label == 'Zz' and MOCK.last_save.printout.parts[id].label == 'Zz'
        and MOCK.saved > saves and said == ('[checkmate] The %s part\'s label is now "Zz".'):format(id), said);
end
said = run('/checkmate label HIT "To hit"');
check('a quoted label keeps its spaces and case, with the part in any case', cur().printout.parts.hit.label == 'To hit'
    and said == '[checkmate] The hit part\'s label is now "To hit".', said);
run('/checkmate label hit Acc rate');
check('a label without quotes', cur().printout.parts.hit.label == 'Acc rate', cur().printout.parts.hit.label);
run('/checkmate label hit "\129\154Acc\9"');
check('a label keeps printable ASCII only', cur().printout.parts.hit.label == 'Acc', cur().printout.parts.hit.label);
run('/checkmate label hit "' .. string.rep('x', 40) .. '"');
check('and 32 characters at most', cur().printout.parts.hit.label == string.rep('x', 32), cur().printout.parts.hit.label);
saves = MOCK.saved;
said = run('/checkmate label hit ""');
check('empty quotes clear it', cur().printout.parts.hit.label == '' and MOCK.last_save.printout.parts.hit.label == ''
    and MOCK.saved > saves and said == '[checkmate] The hit part now prints with no label.', said);
local LABEL_USAGE = '[checkmate] Type /checkmate label <part> <text>. Put text with spaces in quotes, and "" leaves the '
    .. 'label out. The parts are ' .. LABEL_PARTS .. '.';
for _, text in ipairs({ '/checkmate label', '/checkmate label hit' }) do
    said = run(text);
    check('usage for: ' .. text, said == LABEL_USAGE and cur().printout.parts.hit.label == '', said);
end
for _, word in ipairs({ 'reading', 'bogus', 'sort' }) do
    said = run('/checkmate label ' .. word .. ' Zz');
    check('no label on: ' .. word, said == ('[checkmate] There is no part called "%s" with a label. The parts are %s.')
        :format(word, LABEL_PARTS), said);
end
run('/checkmate label aggro Agg');
run('/checkmate label name Mob');
said = run('/checkmate sample');
check('the sample prints the labels', has(said, '[checkmate] Mob: Sample Goblin (Lv 42)')
    and has(said, '[checkmate] Agg: Aggressive (Sight)'), said);
for id in LABEL_PARTS:gmatch('%a+') do
    cur().printout.parts[id].label = fresh.printout.parts[id].label;
end

-- New line. Every part after the name has its box, and the reading has none.
for id in PARTS:gmatch('%a+') do
    local saves = MOCK.saved;
    said = run('/checkmate newline ' .. id .. ' on');
    local on_said = said;
    local on = cur().printout.parts[id].new_line;
    said = run('/checkmate newline ' .. id .. ' OFF');
    check('newline ' .. id, on == true and cur().printout.parts[id].new_line == false
        and MOCK.last_save.printout.parts[id].new_line == false and MOCK.saved > saves + 1
        and on_said == ('[checkmate] The %s part now starts a new line.'):format(id)
        and said == ('[checkmate] The %s part no longer starts a new line.'):format(id), on_said .. ' / ' .. said);
end
local NEWLINE_USAGE = '[checkmate] Type /checkmate newline <part> on|off. The parts are ' .. PARTS .. '.';
for _, text in ipairs({ '/checkmate newline', '/checkmate newline hit', '/checkmate newline hit maybe' }) do
    said = run(text);
    check('usage for: ' .. text, said == NEWLINE_USAGE and cur().printout.parts.hit.new_line == false, said);
end
for _, word in ipairs({ 'name', 'reading', 'bogus', 'sort' }) do
    said = run('/checkmate newline ' .. word .. ' on');
    check('no New line box on: ' .. word, said == ('[checkmate] There is no part called "%s" with a New line box. The '
        .. 'parts are %s.'):format(word, PARTS), said);
end
cur().printout.parts.hit.new_line = true;
run('/checkmate extras same');
run('/checkmate show hit');
said = run('/checkmate sample');
check('the sample starts the hit part on a new line', has(said, '[checkmate] Sample Goblin (Lv 42) \129\154 Decent '
    .. 'Challenge (Low Defense) / [checkmate] Hit: 64-72%'), said);
run('/checkmate hide hit');
run('/checkmate extras new');
for id in PARTS:gmatch('%a+') do
    cur().printout.parts[id].new_line = fresh.printout.parts[id].new_line;
end

-- Moving parts, like the arrows.
local ORDER = 'difficulty hit evade crit aggro magic immunities elements drops';
check('the parts start in the default order', cur().printout.order == ORDER, cur().printout.order);
saves = MOCK.saved;
said = run('/checkmate move hit up');
check('move hit up', cur().printout.order == 'hit difficulty evade crit aggro magic immunities elements drops'
    and MOCK.last_save.printout.order == cur().printout.order and MOCK.saved > saves
    and said == '[checkmate] The hit part moved up, so the parts after the name now go hit, difficulty, evade, crit, '
    .. 'aggro, magic, immunities, elements, drops.', said);
saves = MOCK.saved;
said = run('/checkmate move hit up');
check('the first part can\'t go up', said == '[checkmate] The hit part is already first.' and MOCK.saved == saves
    and cur().printout.order:find('^hit') ~= nil, said);
said = run('/checkmate move DROPS DOWN');
check('the last part can\'t go down, in any case', said == '[checkmate] The drops part is already last.', said);
said = run('/checkmate move hit down');
check('move hit down', cur().printout.order == ORDER and said == '[checkmate] The hit part moved down, so the parts '
    .. 'after the name now go difficulty, hit, evade, crit, aggro, magic, immunities, elements, drops.', said);
said = run('/checkmate move name up');
check('the name part doesn\'t move', said == '[checkmate] The name part always comes first, so it doesn\'t move.'
    and cur().printout.order == ORDER, said);
local MOVE_USAGE = '[checkmate] Type /checkmate move <part> up|down. The parts are ' .. PARTS .. '.';
for _, text in ipairs({ '/checkmate move', '/checkmate move hit', '/checkmate move hit left' }) do
    said = run(text);
    check('usage for: ' .. text, said == MOVE_USAGE and cur().printout.order == ORDER, said);
end
for _, word in ipairs({ 'reading', 'bogus', 'sort' }) do
    said = run('/checkmate move ' .. word .. ' up');
    check('no part that moves called: ' .. word, said == ('[checkmate] There is no part called "%s" that moves. The parts '
        .. 'are %s.'):format(word, PARTS), said);
end
run('/checkmate show crit');
run('/checkmate move aggro up');
said = run('/checkmate sample');
check('the sample follows the new order', has(said, '[checkmate] Aggro: Aggressive (Sight) \129\154 Links with Goblin '
    .. 'Butcher, Goblin Leecher, Goblin Tinkerer \129\154 Crit: 7%'), said);
run('/checkmate move aggro down');
run('/checkmate hide crit');
check('and back', cur().printout.order == ORDER, cur().printout.order);

-- The tag.
run('/checkmate tag off');
local n = #MOCK.printed;
run('/checkmate sample');
local lines = MOCK.printed_since(n);
check('with the tag off the sample has no [checkmate], and replies still do', lines[1] == 'Sample Goblin (Lv 42) \129\154 '
    .. 'Decent Challenge (Low Defense)' and run('/checkmate tag on') == '[checkmate] checkmate\'s /check lines now start '
    .. 'with [checkmate].', lines[1]);

-- The custom divider's text.
saves = MOCK.saved;
said = run('/checkmate divider custom ++');
check('divider custom with text', cur().printout.divider == 'custom' and cur().printout.separator == '++'
    and MOCK.last_save.printout.separator == '++' and MOCK.saved > saves
    and said == '[checkmate] The parts now print with "++" between them.', said);
said = run('/checkmate sample');
check('and the sample prints it', has(said, '[checkmate] Sample Goblin (Lv 42)++Decent Challenge'), said);
run('/checkmate divider CUSTOM " | "');
check('quoted text keeps its spaces', cur().printout.separator == ' | ', cur().printout.separator);
run('/checkmate divider custom - -');
check('text without quotes', cur().printout.separator == '- -', cur().printout.separator);
run('/checkmate divider custom "\129\154=\9"');
check('the text keeps printable ASCII only', cur().printout.separator == '=', cur().printout.separator);
run('/checkmate divider custom "longer than eight"');
check('and eight characters at most', cur().printout.separator == 'longer t', cur().printout.separator);
said = run('/checkmate divider custom ""');
check('empty quotes leave nothing between parts', cur().printout.separator == ''
    and said == '[checkmate] The parts now print with nothing between them.', said);
run('/checkmate divider custom >');
said = run('/checkmate divider custom');
check('custom alone keeps the text and says Custom is in use', cur().printout.separator == '>'
    and said == '[checkmate] You\'re using the Custom divider between parts now.', said);
run('/checkmate divider pipe extra words');
check('text after another divider is left alone', cur().printout.divider == 'pipe' and cur().printout.separator == '>');
cur().printout.separator = '  ';
run('/checkmate divider star');

-- Number ranges.
check('ranges print like 64-72% at first', cur().printout.number_style == 'range');
saves = MOCK.saved;
said = run('/checkmate ranges middle');
check('ranges middle', cur().printout.number_style == 'midpoint' and MOCK.last_save.printout.number_style == 'midpoint'
    and MOCK.saved > saves and said == '[checkmate] Ranges now print as their middle, like ~68%.', said);
run('/checkmate show hit');
said = run('/checkmate sample');
check('and the sample prints the middle', has(said, 'Hit: ~68%'), said);
said = run('/checkmate ranges RANGE');
check('ranges range, in any case', cur().printout.number_style == 'range'
    and said == '[checkmate] Ranges now print like 64-72%.', said);
run('/checkmate hide hit');
for _, word in ipairs({ '', ' midpoint', ' sort' }) do
    said = run('/checkmate ranges' .. word);
    check('usage for: /checkmate ranges' .. word, said == '[checkmate] Type /checkmate ranges range|middle.'
        and cur().printout.number_style == 'range', said);
end

-- Cutoffs.
local CUTOFF_NAMES = { hit = 'Hit rate', evade = 'Evade', crit = 'Crit' };
for _, id in ipairs({ 'hit', 'evade', 'crit' }) do
    for _, grade in ipairs({ 'good', 'ok' }) do
        local key = id .. '_' .. grade;
        local saves = MOCK.saved;
        said = run(('/checkmate cutoff %s %s 50'):format(id, grade));
        check('cutoff ' .. id .. ' ' .. grade, cur().grades[key] == 50 and MOCK.last_save.grades[key] == 50
            and MOCK.saved > saves and said == ('[checkmate] %s now counts as %s at 50%% or above.')
            :format(CUTOFF_NAMES[id], (grade == 'ok') and 'OK' or 'Good'), said);
    end
end
for _, value in ipairs({ 0, 100 }) do
    run('/checkmate cutoff hit good ' .. value);
    check('cutoff ' .. value, cur().grades.hit_good == value);
end
said = run('/checkmate cutoff HIT OK 75');
check('cutoff in any case', cur().grades.hit_ok == 75 and said == '[checkmate] Hit rate now counts as OK at 75% or above.',
    said);
run('/checkmate grades off');
run('/checkmate cutoff crit good 20');
check('a cutoff still sets while grade colors are off, like maxlinks with the names off', cur().grades.crit_good == 20);
run('/checkmate grades on');
local CUTOFF_USAGE = '[checkmate] Type /checkmate cutoff <hit|evade|crit> <good|ok> <0-100>.';
for _, text in ipairs({ 'cutoff', 'cutoff hit', 'cutoff hit good', 'cutoff hit good 101', 'cutoff hit good -1',
    'cutoff hit good 2.5', 'cutoff hit good lots', 'cutoff bogus good 5', 'cutoff hit great 5', 'cutoff sort ok 5' }) do
    said = run('/checkmate ' .. text);
    check('usage for: /checkmate ' .. text, said == CUTOFF_USAGE and cur().grades.hit_good == 100
        and cur().grades.hit_ok == 75, said);
end
for _, key in ipairs({ 'hit_good', 'hit_ok', 'evade_good', 'evade_ok', 'crit_good', 'crit_ok' }) do
    cur().grades[key] = fresh.grades[key];
end

-- Stand-in spells. Every spell of every school with more than one, by its id.
local spells = require('data.spells');
for _, id in ipairs(spells.SCHOOL_ORDER) do
    local school = spells.schools[id];
    if (#school.spells > 1) then
        for _, spell in ipairs(school.spells) do
            local saves = MOCK.saved;
            said = run(('/checkmate spell %s %s'):format(id, spell.id));
            check(('spell %s %s'):format(id, spell.id), cur().magic.schools[id].spell == spell.id
                and MOCK.last_save.magic.schools[id].spell == spell.id and MOCK.saved > saves
                and said == ('[checkmate] %s now uses %s as its stand-in spell.'):format(school.label, spell.name), said);
        end
    end
end
run('/checkmate spell singing "Foe Lullaby"');
check('a spell by its quoted name', cur().magic.schools.singing.spell == 'lullaby');
run('/checkmate spell ninjutsu Kurayami: Ichi');
check('a spell name with spaces and no quotes', cur().magic.schools.ninjutsu.spell == 'kurayami');
run('/checkmate spell ELEMENTAL tier iii nuke');
check('a spell name in any case, with the school in any case', cur().magic.schools.elemental.spell == 'tier3');
run('/checkmate spell dark STUN');
check('a spell id in any case', cur().magic.schools.dark.spell == 'stun');
for _, id in ipairs({ 'healing', 'blue' }) do
    local saves = MOCK.saved;
    local school = spells.schools[id];
    said = run('/checkmate spell ' .. id .. ' fire');
    check(id .. ' has one spell to pick', said == ('[checkmate] %s only has one stand-in spell, %s.')
        :format(school.label, school.spells[1].name) and MOCK.saved == saves, said);
end
local ENFEEBLING = 'The Enfeebling spells are slow, paralyze, silence, sleep, bind, gravity, blind, poison.';
said = run('/checkmate spell enfeebling Fire');
check('an unknown spell lists the school\'s spells', said == '[checkmate] There is no Enfeebling spell called "Fire". '
    .. ENFEEBLING and cur().magic.schools.enfeebling.spell == 'poison', said);
said = run('/checkmate spell enfeebling');
check('a school alone lists its spells', said == '[checkmate] Type /checkmate spell enfeebling <spell>. ' .. ENFEEBLING,
    said);
for _, text in ipairs({ '/checkmate spell', '/checkmate spell bogus slow', '/checkmate spell sort slow' }) do
    said = run(text);
    check('usage for: ' .. text, said == '[checkmate] Type /checkmate spell <school> <spell>. The schools are elemental, '
        .. 'enfeebling, dark, divine, healing, ninjutsu, singing, blue.', said);
end
for _, id in ipairs(spells.SCHOOL_ORDER) do
    cur().magic.schools[id].spell = fresh.magic.schools[id].spell;
end

-- Extra magic accuracy, the most items, corner roundness and spacing. Each takes its range, refuses anything
-- else and keeps what it had.
local NUMBER_COMMANDS = {
    { 'macc', 'magic', 'extra_accuracy', { 0, 100, 25 }, '[checkmate] Type /checkmate macc <0-100>.',
        'Extra magic accuracy is now +%d for every school.' },
    { 'maxitems', 'drops', 'max_items', { 0, 12, 3 }, '[checkmate] Type /checkmate maxitems <0-12>. 0 shows every item.',
        'The drops part now shows at most %d items.', 'The drops part now shows every item.' },
    { 'rounding', 'imgui', 'rounding', { 0, 12, 4 }, '[checkmate] Type /checkmate rounding <0-12>.',
        'The settings window\'s corner roundness is now %d pixels.', 'The settings window\'s corners are now square.' },
    { 'spacing', 'imgui', 'spacing', { 2, 14, 9 }, '[checkmate] Type /checkmate spacing <2-14>.',
        'The space between the settings window\'s rows is now %d pixels.' },
};
-- The settings table a section names. The window's look is inside look.
local function section(s, name)
    return (name == 'imgui') and s.look.imgui or s[name];
end
for _, entry in ipairs(NUMBER_COMMANDS) do
    local sub, name, key, values, usage, said_n, said_zero = unpack(entry);
    for _, value in ipairs(values) do
        local saves = MOCK.saved;
        said = run(('/checkmate %s %d'):format(sub, value));
        local want = (value == 0 and said_zero) or said_n:format(value);
        check(('%s %d'):format(sub, value), section(cur(), name)[key] == value
            and section(MOCK.last_save, name)[key] == value and MOCK.saved > saves and said == '[checkmate] ' .. want, said);
    end
    local low, high = usage:match('<(%d+)-(%d+)>');
    for _, word in ipairs({ tostring(low - 1), tostring(high + 1), '2.5', 'lots', '' }) do
        said = run(('/checkmate %s %s'):format(sub, word));
        check(('%s "%s" refused'):format(sub, word), said == usage and section(cur(), name)[key] == values[3], said);
    end
end
said = run('/checkmate maxitems 1');
check('maxitems 1 says item', cur().drops.max_items == 1
    and said == '[checkmate] The drops part now shows at most 1 item.', said);
said = run('/checkmate rounding 1');
check('rounding 1 says pixel', cur().look.imgui.rounding == 1
    and said == '[checkmate] The settings window\'s corner roundness is now 1 pixel.', said);
check('a changed corner roundness or spacing makes the skin Custom', skins.current(cur()) == nil);
run('/checkmate skin phoenix');
check('and the skin puts them back', cur().look.imgui.rounding == 0 and cur().look.imgui.spacing == 7);
run('/checkmate macc 0');
run('/checkmate maxitems 5');

-- Hide items under takes one decimal place, like its slider.
saves = MOCK.saved;
said = run('/checkmate minchance 2.5');
check('minchance 2.5', cur().drops.min_chance == 2.5 and MOCK.last_save.drops.min_chance == 2.5 and MOCK.saved > saves
    and said == '[checkmate] The drops part now leaves out items under 2.5%.', said);
said = run('/checkmate minchance 50');
check('minchance 50', cur().drops.min_chance == 50 and said == '[checkmate] The drops part now leaves out items under 50%.',
    said);
said = run('/checkmate minchance 1.25');
check('a second decimal place rounds', cur().drops.min_chance == 1.3
    and said == '[checkmate] The drops part now leaves out items under 1.3%.', said);
said = run('/checkmate minchance 0.04');
check('so a tiny chance rounds to 0', cur().drops.min_chance == 0
    and said == '[checkmate] The drops part now shows items at any chance.', said);
run('/checkmate minchance 3');
for _, word in ipairs({ '50.1', '-0.5', '51', 'lots', '' }) do
    said = run('/checkmate minchance ' .. word);
    check('minchance "' .. word .. '" refused', said == '[checkmate] Type /checkmate minchance <0-50>. It can have one '
        .. 'decimal place, like 2.5.' and cur().drops.min_chance == 3, said);
end
run('/checkmate minchance 0');

-- The drops order.
saves = MOCK.saved;
said = run('/checkmate sort name');
check('sort name', cur().drops.sort == 'name' and MOCK.last_save.drops.sort == 'name' and MOCK.saved > saves
    and said == '[checkmate] The drops part now lists the items by name.', said);
said = run('/checkmate SORT CHANCE');
check('sort chance, in any case', cur().drops.sort == 'chance'
    and said == '[checkmate] The drops part now lists the items by chance, highest first.', said);
for _, word in ipairs({ '', ' size', ' copy' }) do
    said = run('/checkmate sort' .. word);
    check('usage for: /checkmate sort' .. word, said == '[checkmate] Type /checkmate sort chance|name.'
        and cur().drops.sort == 'chance', said);
end

-- Immunities by their names on the Immunities tab, each on at first.
for _, entry in ipairs(printout.IMMUNITIES) do
    local name = entry.label:lower();
    local saves = MOCK.saved;
    said = run('/checkmate immunity ' .. name .. ' off');
    local off_said = said;
    local off = cur().immunities[entry.id].on == false and MOCK.last_save.immunities[entry.id].on == false;
    said = run('/checkmate immunity ' .. name .. ' on');
    check('immunity ' .. name, off and cur().immunities[entry.id].on == true and MOCK.saved > saves + 1
        and off_said == ('[checkmate] The immunities part no longer lists %s.'):format(entry.label)
        and said == ('[checkmate] The immunities part now lists %s when a monster is immune to it.'):format(entry.label),
        off_said .. ' / ' .. said);
end
run('/checkmate immunity SLEEP OFF');
check('an immunity in any case', cur().immunities.dark_sleep.on == false);
run('/checkmate show immunities');
said = run('/checkmate sample');
check('the sample leaves out the immunity that\'s off', has(said, '[checkmate] Immune: Bind, Gravity'), said);
local IMMUNITY_USAGE = '[checkmate] Type /checkmate immunity <name> on|off. The immunities are ' .. IMMUNITY_LIST .. '.';
for _, text in ipairs({ '/checkmate immunity', '/checkmate immunity sleep', '/checkmate immunity sleep maybe' }) do
    said = run(text);
    check('usage for: ' .. text, said == IMMUNITY_USAGE and cur().immunities.dark_sleep.on == false, said);
end
for _, word in ipairs({ 'dark_sleep', 'bogus', 'sort' }) do
    said = run('/checkmate immunity ' .. word .. ' on');
    check('no immunity called: ' .. word, said == ('[checkmate] There is no immunity called "%s". The immunities are %s.')
        :format(word, IMMUNITY_LIST), said);
end
run('/checkmate immunity sleep on');

-- Immunity labels.
saves = MOCK.saved;
said = run('/checkmate immunitylabel sleep Slp');
check('immunitylabel', cur().immunities.dark_sleep.label == 'Slp' and MOCK.last_save.immunities.dark_sleep.label == 'Slp'
    and MOCK.saved > saves and said == '[checkmate] Sleep now prints as "Slp" in the immunities part.', said);
said = run('/checkmate sample');
check('the sample prints it', has(said, '[checkmate] Immune: Slp, Bind, Gravity'), said);
run('/checkmate immunitylabel LULLABY "Foe Lullaby"');
check('a quoted label keeps its spaces, with the name in any case', cur().immunities.light_sleep.label == 'Foe Lullaby');
run('/checkmate immunitylabel bind Bind me');
check('a label without quotes', cur().immunities.bind.label == 'Bind me', cur().immunities.bind.label);
run('/checkmate immunitylabel bind "\129\154Bnd\9"');
check('a label keeps printable ASCII only', cur().immunities.bind.label == 'Bnd', cur().immunities.bind.label);
run('/checkmate immunitylabel bind "' .. string.rep('x', 40) .. '"');
check('and 32 characters at most', cur().immunities.bind.label == string.rep('x', 32), cur().immunities.bind.label);
said = run('/checkmate immunitylabel bind ""');
check('empty quotes clear it', cur().immunities.bind.label == '' and said == '[checkmate] Bind now prints as a blank in '
    .. 'the immunities part. /checkmate immunity bind off leaves it out instead.', said);
local IMMUNITY_LABEL_USAGE = '[checkmate] Type /checkmate immunitylabel <name> <text>. Put text with spaces in quotes. '
    .. 'The immunities are ' .. IMMUNITY_LIST .. '.';
for _, text in ipairs({ '/checkmate immunitylabel', '/checkmate immunitylabel sleep' }) do
    said = run(text);
    check('usage for: ' .. text, said == IMMUNITY_LABEL_USAGE and cur().immunities.dark_sleep.label == 'Slp', said);
end
said = run('/checkmate immunitylabel bogus Zz');
check('an unknown immunity', said == '[checkmate] There is no immunity called "bogus". The immunities are '
    .. IMMUNITY_LIST .. '.', said);
run('/checkmate hide immunities');
for _, entry in ipairs(printout.IMMUNITIES) do
    cur().immunities[entry.id].label = entry.label;
end

-- Text typed in the chat line comes in Shift-JIS. The second byte of a two-byte character can be a plain
-- letter, so the whole character goes. Byte by byte, these words would leave letters behind.
local profiles = require('ui.profiles');
local clean = printout.clean_command_text;
local GOBLIN = '\131\83\131\117\131\138\131\147';   -- Goblin in katakana. Its bytes hold S and u.
local DAMAGE = '\131\95\131\129\129\91\131\87';     -- Damage in katakana, with _, [ and W.
local KNIGHT = '\131\105\131\67\131\103';           -- Knight in katakana, with i, C and g.
local SOLO = '\131\92\131\141';                     -- Solo in katakana, with a backslash.
local HALF_WIDTH = '\195\189\196';                  -- Test in half-width katakana, one byte a letter.
local PHRASE = '\253\2\2\67\98\253';                -- An auto-translate phrase with C and b inside.
check('the test words hold plain letters byte by byte', printout.clean_text(GOBLIN .. DAMAGE .. KNIGHT .. SOLO)
    == 'Su_[WiCg\\' and printout.clean_text(PHRASE) == 'Cb');
check('a Japanese word goes whole', clean(GOBLIN) == '' and clean(DAMAGE .. KNIGHT .. SOLO) == '',
    clean(GOBLIN .. DAMAGE .. KNIGHT .. SOLO));
check('mixed ASCII and Japanese keeps the ASCII', clean('Acc ' .. GOBLIN .. ' rate' .. KNIGHT .. '2') == 'Acc  rate2',
    clean('Acc ' .. GOBLIN .. ' rate' .. KNIGHT .. '2'));
check('half-width katakana goes a byte at a time, so the letter after it stays', clean(HALF_WIDTH .. 'Hit') == 'Hit'
    and clean('Hit' .. HALF_WIDTH .. DAMAGE .. 'x') == 'Hitx', clean('Hit' .. HALF_WIDTH .. DAMAGE .. 'x'));
check('an auto-translate phrase goes whole', clean('Hi' .. PHRASE .. '!') == 'Hi!', clean('Hi' .. PHRASE .. '!'));
check('a lead byte at the end with nothing after it goes', clean('Acc\130') == 'Acc' and clean(GOBLIN .. '\224') == '');
check('plain ASCII stays as it is', clean(' Acc: 5% (x) ~!') == ' Acc: 5% (x) ~!');

-- Every command that keeps typed text cleans it the same way, and says back what it kept.
local TYPED = 'Acc' .. KNIGHT .. HALF_WIDTH .. PHRASE .. SOLO .. '\130';
local TYPED_COMMANDS = {
    { 'label hit',           function (s) return s.printout.parts.hit.label; end },
    { 'immunitylabel bind',  function (s) return s.immunities.bind.label; end },
    { 'divider custom',      function (s) return s.printout.separator; end },
    { 'labeldivider custom', function (s) return s.printout.label_separator; end },
    { 'rangeword',           function (s) return s.printout.range_word; end },
    { 'weakword',            function (s) return s.elements.weak_word; end },
    { 'resistword',          function (s) return s.elements.resist_word; end },
};
for _, entry in ipairs(TYPED_COMMANDS) do
    local saves = MOCK.saved;
    said = run(('/checkmate %s "%s"'):format(entry[1], TYPED));
    check(entry[1] .. ' keeps only the plain text typed in chat', entry[2](cur()) == 'Acc'
        and entry[2](MOCK.last_save) == 'Acc' and MOCK.saved > saves and has(said, 'Acc')
        and not said:find('[^\32-\126]') and not has(said, 'iCg'), said);
end
cur().printout.parts.hit.label = fresh.printout.parts.hit.label;
cur().immunities.bind.label = 'Bind';
cur().printout.divider, cur().printout.separator = 'star', '  ';
cur().printout.label_divider, cur().printout.label_separator = 'colon', ':';
cur().printout.range_word = 'range';
cur().elements.weak_word, cur().elements.resist_word = 'Weak', 'Resists';
said = run('/checkmate profile save "Solo' .. SOLO .. '"');
check('profile save keeps the plain part of a name and says that name', profiles.exists('Solo')
    and said == '[checkmate] Your settings are saved as the profile "Solo".', said);
said = run('/checkmate profile rename Solo "Duo' .. KNIGHT .. HALF_WIDTH .. '"');
check('so does profile rename', profiles.exists('Duo') and not profiles.exists('Solo')
    and said == '[checkmate] The profile "Solo" is now called "Duo".', said);

-- Text with nothing plain in it. A label can be empty, and a profile name can't.
local NO_NAME = '[checkmate] That profile name has nothing checkmate can use. Use plain English letters, numbers or '
    .. 'symbols.';
said = run('/checkmate label hit ' .. GOBLIN);
check('a label typed all in Japanese leaves the label out', cur().printout.parts.hit.label == ''
    and said == '[checkmate] The hit part now prints with no label.', said);
cur().printout.parts.hit.label = fresh.printout.parts.hit.label;
said = run('/checkmate profile save ' .. GOBLIN .. PHRASE);
check('a profile name typed all in Japanese isn\'t saved', said == NO_NAME and #profiles.names() == 1, said);
said = run('/checkmate profile rename Duo "' .. KNIGHT .. ' ' .. HALF_WIDTH .. '"');
check('and a profile can\'t be renamed to one', said == NO_NAME and profiles.exists('Duo')
    and #profiles.names() == 1, said);

-- A space or quote byte inside a phrase splits it, and profile save only takes the first word.
local SPLIT_PHRASES = {
    '\253\2\2\39\32\253',                           -- A phrase with ' and a space inside.
    '"\253\2\2\39\34\253"',                         -- A quoted phrase with ' and a quote inside.
};
for _, typed in ipairs(SPLIT_PHRASES) do
    said = run('/checkmate profile save ' .. typed);
    check('a profile name of a phrase split in two isn\'t saved', said == NO_NAME and #profiles.names() == 1, said);
end
run('/checkmate profile delete Duo');

-- A name cut to 32 characters loses a space at the cut too, so the reply names the profile it saved.
local LONG = string.rep('a', 31);
said = run('/checkmate profile save "' .. LONG .. ' b"');
check('a name cut at a space says the name it saved', profiles.exists(LONG)
    and said == '[checkmate] Your settings are saved as the profile "' .. LONG .. '".', said);
run('/checkmate profile delete ' .. LONG);

-- Profiles.
cur().drops.th = 2;
cur().look.font = 'segoeui';
said = run('/checkmate profile save "My Profile"');
check('profile save with a quoted name', said == '[checkmate] Your settings are saved as the profile "My Profile".', said);
cur().drops.th = 0;
cur().look.font = 'ashita';
said = run('/checkmate profile load "My Profile"');
check('profile load', cur().drops.th == 2 and said == '[checkmate] Your settings now come from the profile "My Profile".',
    said);
run('/checkmate');
MOCK.frame();
run('/checkmate');
check('and the window draws in the profile\'s font without loading it', cur().look.font == 'segoeui'
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[1] and #MOCK.font_calls == loads, #MOCK.font_calls);
said = run('/checkmate profile delete "My Profile"');
check('profile delete', said == '[checkmate] The profile "My Profile" is deleted.', said);
said = run('/checkmate profile load "My Profile"');
check('loading a missing profile', has(said, 'There is no profile called "My Profile".'), said);
said = run('/checkmate profile delete Nope');
check('deleting a missing profile', has(said, 'There is no profile called "Nope".'), said);
for _, text in ipairs({ '/checkmate profile', '/checkmate profile save', '/checkmate profile copy a b' }) do
    said = run(text);
    check('refused: ' .. text, said == '[checkmate] Type /checkmate profile save|load|delete <name>. Type /checkmate '
        .. 'profile rename <old> <new> to rename one.', said);
end
said = run('/checkmate profile save "   "');
check('a blank name isn\'t saved', said == NO_NAME and #profiles.names() == 0, said);

-- Renaming a profile. This character's job links to it follow.
run('/checkmate profile save "My Profile"');
run('/checkmate profile save Other');
saves = MOCK.saved;
said = run('/checkmate joblink blm "My Profile"');
check('joblink', cur().job_links.BLM == 'My Profile' and MOCK.last_save.job_links.BLM == 'My Profile'
    and MOCK.saved > saves and said == '[checkmate] The profile "My Profile" now loads when you change to BLM and zone.',
    said);
run('/checkmate joblink WAR My Profile');
check('a profile name with spaces and no quotes, and the job in any case', cur().job_links.WAR == 'My Profile');
saves = MOCK.saved;
said = run('/checkmate profile rename "My Profile" Solo');
check('profile rename', profiles.exists('Solo') and not profiles.exists('My Profile') and MOCK.saved > saves
    and said == '[checkmate] The profile "My Profile" is now called "Solo".', said);
check('and the job links follow it', cur().job_links.BLM == 'Solo' and cur().job_links.WAR == 'Solo'
    and MOCK.last_save.job_links.BLM == 'Solo');
said = run('/checkmate PROFILE RENAME Solo "  Duo  "');
check('the new name loses its outside spaces, in any case', profiles.exists('Duo')
    and said == '[checkmate] The profile "Solo" is now called "Duo".', said);
run('/checkmate profile rename Duo "' .. string.rep('n', 40) .. '"');
check('and keeps 32 characters at most', profiles.exists(string.rep('n', 32)));
run('/checkmate profile rename "' .. string.rep('n', 32) .. '" Duo');
said = run('/checkmate profile rename Duo Other');
check('a name in use is refused', said == '[checkmate] There is already a profile called "Other".'
    and profiles.exists('Duo'), said);
said = run('/checkmate profile rename Nope New');
check('a missing profile is refused', said == '[checkmate] There is no profile called "Nope".'
    and not profiles.exists('New'), said);
local RENAME_USAGE = '[checkmate] Type /checkmate profile rename <old> <new>. Put names with spaces in quotes.';
for _, text in ipairs({ '/checkmate profile rename', '/checkmate profile rename Duo' }) do
    said = run(text);
    check('usage for: ' .. text, said == RENAME_USAGE and profiles.exists('Duo'), said);
end
said = run('/checkmate profile rename Duo "   "');
check('a blank new name is refused', said == NO_NAME and profiles.exists('Duo'), said);

-- Job links.
saves = MOCK.saved;
said = run('/checkmate joblink blm none');
check('joblink none', cur().job_links.BLM == nil and MOCK.last_save.job_links.BLM == nil and MOCK.saved > saves
    and said == '[checkmate] Changing to BLM no longer loads a profile.', said);
run('/checkmate joblink war NONE');
check('none in any case', cur().job_links.WAR == nil);
said = run('/checkmate joblink blm Nope');
check('a missing profile can\'t be linked', said == '[checkmate] There is no profile called "Nope".'
    and cur().job_links.BLM == nil, said);
for _, word in ipairs({ 'xyz', 'sch', 'sort' }) do
    said = run('/checkmate joblink ' .. word .. ' Duo');
    check('no job called: ' .. word, said == ('[checkmate] There is no job called "%s". The jobs are %s.')
        :format(word, JOB_LIST), said);
end
local JOB_USAGE = '[checkmate] Type /checkmate joblink <job> <profile>, or /checkmate joblink <job> none to stop it '
    .. 'loading one. Put a name with spaces in quotes.';
for _, text in ipairs({ '/checkmate joblink', '/checkmate joblink blm' }) do
    said = run(text);
    check('usage for: ' .. text, said == JOB_USAGE, said);
end

-- A link set by command loads its profile when you zone in on that job.
run('/checkmate joblink rdm Duo');
cur().drops.th = 0;
MOCK.player.main_job = 5;
MOCK.zone_in(103);
local before_load = #MOCK.printed;
MOCK.frame();
check('a linked job loads its profile', cur().drops.th == 2 and table.concat(MOCK.printed_since(before_load), ' / ')
    == '[checkmate] Your settings now come from the profile "Duo", since it\'s linked to this job.',
    table.concat(MOCK.printed_since(before_load), ' / '));
MOCK.player.main_job = 4;
MOCK.zone_in(103);
MOCK.frame();
run('/checkmate profile delete Duo');
run('/checkmate profile delete Other');
check('deleting the profile takes its link too', cur().job_links.RDM == nil and #profiles.names() == 0);

-- Sample, info, help, reset.
said = run('/checkmate sample');
check('sample prints a made-up monster with the star', said == '[checkmate] Sample Goblin (Lv 42) \129\154 Decent Challenge '
    .. '(Low Defense) / [checkmate] Aggro: Aggressive (Sight) \129\154 Links with Goblin Butcher, Goblin Leecher, '
    .. 'Goblin Tinkerer', said);
run('/checkmate levelrange on');
said = run('/checkmate sample');
check('the sample shows the level range when it\'s on', has(said, '[checkmate] Sample Goblin (Lv 42, range 40-44) \129\154 '
    .. 'Decent Challenge (Low Defense)'), said);
run('/checkmate levelrange off');
said = run('/checkmate info');
check('info prints the version and the data stamp', has(said, 'checkmate ' .. addon.version .. '. The monster data was built from '
    .. bands.built .. '.'), said);
check('info prints the content settings', has(said, 'The data is for a server with ' .. bands.content .. '.'), said);
MOCK.zone_in(103);
MOCK.entities[312] = { Name = 'Fire Elemental' };
MOCK.packet(MOCK.check_packet(312, 39, 4, 174));
MOCK.frame();
said = run('/checkmate info');
check('and the zone\'s stamp after a /check there', has(said, 'This zone\'s data was built from phoenix/live'), said);
-- /checkmate help prints the topics and the commands used most.
said = run('/checkmate help');
check('help prints ten commands', select(2, said:gsub('%[checkmate%] /checkmate', '')) == 10, said);
check('help names the topics', has(said, '[checkmate] /checkmate help <topic>  lists the commands for one tab of the '
    .. 'settings window. The topics are printout, colors, numbers, aggro, magic, drops, immunities, look and profiles.'),
    said);
check('help names /cmate', has(said, '[checkmate] /checkmate  opens or closes the settings window. /cmate is short for '
    .. '/checkmate and works for every command.'), said);
check('help names the commands used most', has(said, '[checkmate] /checkmate show|hide <part>  ')
    and has(said, '[checkmate] /checkmate th <0-4>  ') and has(said, '[checkmate] /checkmate school <school> on|off  ')
    and has(said, '[checkmate] /checkmate skin <name>  ') and has(said, '[checkmate] /checkmate profile save|load|delete '
    .. '<name>  ') and has(said, '[checkmate] /checkmate sample  ') and has(said, '[checkmate] /checkmate info  ')
    and has(said, '[checkmate] /checkmate reset  '), said);
check('/cmate help prints the same', run('/cmate help') == said);
check('and so does help with a word that isn\'t a topic', run('/checkmate help me') == said
    and run('/checkmate help sort') == said);

-- /checkmate help <topic> prints the commands for that tab. Help colors lists the colors after them, so it
-- has one more.
local TOPICS = { 'printout', 'colors', 'numbers', 'aggro', 'magic', 'drops', 'immunities', 'look', 'profiles' };
local TOPIC_LINES = { printout = 17, colors = 4, numbers = 2, aggro = 3, magic = 6, drops = 6, immunities = 2, look = 7,
    profiles = 4 };
local topic_text = {};
for _, topic in ipairs(TOPICS) do
    topic_text[topic] = run('/checkmate help ' .. topic);
    local count = select(2, topic_text[topic]:gsub('%[checkmate%] /checkmate ', ''));
    check(('help %s prints its %d commands'):format(topic, TOPIC_LINES[topic]), count == TOPIC_LINES[topic],
        topic_text[topic]);
end
check('a topic in any case', run('/cmate help DROPS') == topic_text.drops);
check('help colors starts with the Colors tab switches', topic_text.colors:find('^%[checkmate%] /checkmate concolors on|off  ')
    ~= nil and has(topic_text.colors, '[checkmate] /checkmate color <what> <color>  sets one chat color.'), topic_text.colors);
local topics = '';
for _, topic in ipairs(TOPICS) do
    topics = topics .. ' / ' .. topic_text[topic];
end

-- Every command has its line in a topic.
for _, word in ipairs({ 'show|hide', 'label', 'newline', 'move', 'level', 'levelrange', 'rangeword', 'reading', 'extras',
    'tag', 'divider', 'labeldivider', 'ranges', 'replace', 'sample', 'concolors', 'threatcolors', 'grades', 'color', 'cutoff',
    'detection', 'linknames', 'maxlinks', 'school', 'spell', 'macc', 'weakword', 'resistword', 'strength', 'th', 'maxitems',
    'minchance', 'sort', 'thlabel', 'dropnotes', 'immunity', 'immunitylabel', 'skin', 'font', 'fontsize', 'rounding',
    'spacing', 'windowcolor', 'profile', 'joblink' }) do
    check('a topic names /checkmate ' .. word, has(topics, '[checkmate] /checkmate ' .. word .. ' '));
end

check('help printout names the level range and its word', has(topic_text.printout, '/checkmate levelrange on|off  shows '
    .. 'or hides the levels a monster can spawn at, like (Lv 42, range 40-44). It only shows once checkmate knows the exact '
    .. 'level.') and has(topic_text.printout, '/checkmate rangeword <text>  sets the word before that range. Put text with '
    .. 'spaces in quotes, and "" leaves the word out.'), topic_text.printout);
check('help look names the window colors and the font', has(topic_text.look, '/checkmate windowcolor <what> <rrggbb>  sets '
    .. 'one settings window color. /checkmate help windowcolors lists them.')
    and has(topic_text.look, '/checkmate font <name>  sets the settings window\'s font. The fonts are ' .. FONT_LIST .. '.')
    and has(topic_text.look, '/checkmate fontsize <12-24>  sets the settings window\'s font size in pixels.'),
    topic_text.look);
check('help printout names the dividers', has(topic_text.printout, '/checkmate divider <name>  sets what goes between '
    .. 'parts. The dividers are ' .. DIVIDER_LIST .. '.') and has(topic_text.printout, '/checkmate divider custom <text>  '
    .. 'puts your own text between parts. Put text with spaces in quotes.'), topic_text.printout);
check('help printout names the label dividers', has(topic_text.printout, '/checkmate labeldivider <name>  sets what goes '
    .. 'right after each part\'s label. The label dividers are ' .. LABEL_LIST .. '.') and has(topic_text.printout,
    '/checkmate labeldivider custom <text>  puts your own text right after each label, then a space. Put text with spaces '
    .. 'in quotes.'), topic_text.printout);
check('help printout names replace', has(topic_text.printout, '/checkmate replace on|off  hides the game\'s own /check line '
    .. 'so checkmate\'s lines take its place, or shows it again.'), topic_text.printout);
check('help printout names the extras', has(topic_text.printout, '/checkmate extras same|new  same keeps hit, evade, crit, '
    .. 'aggro, magic, immunities, elements and drops on the /check line, and new starts them on a line of their own. A part '
    .. 'with New line checked starts a new line either way.'), topic_text.printout);
check('help printout names the parts', has(topic_text.printout, '/checkmate show|hide <part>  shows or hides a part. The '
    .. 'parts are name, difficulty, reading (evasion and defense), hit, evade, crit, aggro, magic, immunities, elements, '
    .. 'drops.'), topic_text.printout);
check('help printout names the label, new line, move, tag and ranges commands', has(topic_text.printout,
    '/checkmate label <part> <text>  sets a part\'s label, like Acc instead of Hit. Every part but reading has one. Put '
    .. 'text with spaces in quotes, and "" leaves the label out.')
    and has(topic_text.printout, '/checkmate newline <part> on|off  turns a part\'s New line box on or off. On starts '
    .. 'the part on a new line. Every part but name and reading has one.')
    and has(topic_text.printout, '/checkmate move <part> up|down  moves a part up or down. The name always comes first, '
    .. 'and the reading goes with difficulty.')
    and has(topic_text.printout, '/checkmate tag on|off  starts each /check line with [checkmate], or leaves it off.')
    and has(topic_text.printout, '/checkmate ranges range|middle  prints a range of hit rate, evade, crit or magic like '
    .. '64-72%, or as its middle, like ~68%.'), topic_text.printout);
check('help magic names the elements commands', has(topic_text.magic, '/checkmate weakword <text>  sets the word before the '
    .. 'elements a monster is weak to. Put text with spaces in quotes, and "" leaves the word out.')
    and has(topic_text.magic, '/checkmate resistword <text>  sets the word before the elements a monster resists. Put text '
    .. 'with spaces in quotes, and "" leaves the word out.')
    and has(topic_text.magic, '/checkmate strength on|off  shows or hides how strong each weak or resisted element is, '
    .. 'like (half), and the magic damage note.'), topic_text.magic);
check('help magic names the spell and macc commands', has(topic_text.magic, '/checkmate spell <school> <spell>  sets the '
    .. 'stand-in spell a school uses. /checkmate spell <school> lists its spells.') and has(topic_text.magic,
    '/checkmate macc <0-100>  sets your extra magic accuracy from gear, food and merits, which counts for every school.'),
    topic_text.magic);
check('help aggro names the aggro commands', has(topic_text.aggro, '/checkmate detection on|off  shows or hides how an '
    .. 'aggressive monster finds you, like (Sight, Sound).')
    and has(topic_text.aggro, '/checkmate linknames on|off  shows or hides the names a monster links with.')
    and has(topic_text.aggro, '/checkmate maxlinks <0-12>  sets the most link names shown. 0 shows every name.'),
    topic_text.aggro);
check('help colors names the color switches', has(topic_text.colors, '/checkmate concolors on|off  ')
    and has(topic_text.colors, '/checkmate threatcolors on|off  paints Aggressive in the Threat color and the other answers '
    .. 'in the Safe color, or every answer in the Words color.') and has(topic_text.colors, '/checkmate grades on|off  '),
    topic_text.colors);
check('help printout names the reading', has(topic_text.printout, '/checkmate reading evasion|defense  puts evasion or '
    .. 'defense first in the reading after the difficulty.'), topic_text.printout);
check('help numbers names the cutoffs and grade colors', has(topic_text.numbers, '/checkmate cutoff <hit|evade|crit> '
    .. '<good|ok> <0-100>  sets where a number counts as Good or OK. By default hit is Good at 85 and OK at 70, evade at '
    .. '30 and 15, and crit at 15 and 8.') and has(topic_text.numbers, '/checkmate grades on|off  '), topic_text.numbers);
check('help drops names its commands', has(topic_text.drops, '/checkmate th <0-4>  sets the Treasure Hunter for drop '
    .. 'chances.') and has(topic_text.drops, '/checkmate maxitems <0-12>  sets the most items shown. 0 shows every item.')
    and has(topic_text.drops, '/checkmate minchance <0-50>  leaves out items under this chance in percent, like 2.5. 0 '
    .. 'shows every item.') and has(topic_text.drops, '/checkmate sort chance|name  lists the items by chance, highest '
    .. 'first, or by name.') and has(topic_text.drops, '/checkmate thlabel on|off  shows or hides your Treasure Hunter in '
    .. 'the label, like Drops (TH 2).') and has(topic_text.drops, '/checkmate dropnotes on|off  shows or hides the notes '
    .. '(plus scripted drops) and (only drops if you get EXP).'), topic_text.drops);
check('help immunities names the immunities', has(topic_text.immunities, '/checkmate immunity <name> on|off  shows or '
    .. 'leaves out one immunity. The immunities are ' .. IMMUNITY_LIST .. '.') and has(topic_text.immunities,
    '/checkmate immunitylabel <name> <text>  sets the word an immunity prints as. Put text with spaces in quotes.'),
    topic_text.immunities);
check('help look names rounding and spacing', has(topic_text.look, '/checkmate rounding <0-12>  sets how round the '
    .. 'settings window\'s corners are, in pixels. 0 is square.') and has(topic_text.look, '/checkmate spacing <2-14>  sets '
    .. 'the space between the settings window\'s rows, in pixels.'), topic_text.look);
check('help profiles names rename and the job links', has(topic_text.profiles, '/checkmate profile rename <old> <new>  '
    .. 'renames a profile, and this character\'s job links to it follow. Put names with spaces in quotes.')
    and has(topic_text.profiles, '/checkmate joblink <job> <profile>  loads that profile when you change to that main job '
    .. 'and zone. The jobs are ' .. JOB_LIST .. '.') and has(topic_text.profiles, '/checkmate joblink <job> none  stops a '
    .. 'job loading a profile.'), topic_text.profiles);

cur().printout.parts.hit.on = true;
cur().printout.parts.difficulty.on = false;
cur().printout.extras_own_line = false;
cur().printout.replace_game_line = false;
cur().drops.th = 3;
cur().look.skin = 'ember';
cur().look.imgui = {};
cur().printout.divider = 'note';
cur().printout.label_divider = 'custom';
cur().printout.label_separator = '>';
cur().printout.defense_first = true;
cur().colors.name = 73;
cur().look.font = 'arial';
cur().look.font_size = 22;
cur().printout.parts.aggro.on = false;
cur().aggro.detection = false;
cur().aggro.max_links = 0;
cur().printout.show_range = true;
cur().printout.range_word = 'x';
cur().printout.parts.elements.on = true;
cur().elements.weak_word = 'x';
cur().elements.strength = false;
saves = MOCK.saved;
-- The first /checkmate reset only says what it does. The second one does it.
run('/checkmate reset');
said = run('/checkmate reset');
local s = cur();
check('reset puts every setting back', s.printout.parts.hit.on == false and s.printout.parts.difficulty.on == true
    and s.printout.extras_own_line == true and s.printout.replace_game_line == true and s.drops.th == 0 and s.look.skin == 'phoenix'
    and s.printout.divider == 'star' and s.printout.label_divider == 'colon' and s.printout.label_separator == ':'
    and s.printout.defense_first == false and s.colors.name == 8
    and has(said, 'Every setting is back to its default.'), said);
check('and fills the window look', type(s.look.imgui.background) == 'table' and s.look.imgui.rounding == 0);
check('and brings back Ashita\'s font at 18', s.look.font == 'ashita' and s.look.font_size == 18);
check('and the aggro part and its settings', s.printout.parts.aggro.on == true and s.aggro.detection == true
    and s.aggro.max_links == 5);
check('and the level range off with the word range', s.printout.show_range == false and s.printout.range_word == 'range');
check('and the elements part off, with its words and how strong', s.printout.parts.elements.on == false
    and s.elements.weak_word == 'Weak' and s.elements.resist_word == 'Resists' and s.elements.strength == true);
run('/checkmate show hit');
check('commands work on the new settings', cur().printout.parts.hit.on == true and MOCK.last_save.printout.parts.hit.on == true);

-- Another character logs in with Arial for the window. The window switches to the Arial the load event loaded.
MOCK.settings.switch_character({ look = { font = 'arial' } });
run('/checkmate');
MOCK.frame();
run('/checkmate');
check('a character switch draws in its font without loading it', cur().look.font == 'arial'
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[2] and #MOCK.font_calls == loads, #MOCK.font_calls);
check('every font loaded during the load event', #MOCK.stray_font_loads() == 0, table.concat(MOCK.stray_font_loads(), ', '));

return MOCK.report();
