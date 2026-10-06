-- Draws the settings window through the recorded imgui. Every tab draws with real functions and balanced
-- calls, and every control edits its setting. It also covers what saves when, every window color, the font
-- and its size, a missing font, fonts that failed to load, fonts only loading on the load event, the window
-- size, and a frame error.
-- The fonts folder is a test folder holding a made-up Segoe UI, Tahoma, Calibri and Consolas, and no Verdana.
-- Tahoma raises an error while it loads, and Calibri loads as nothing.
local window_font = require('ui.window_font');
window_font.FOLDER = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\';
for _, file in ipairs({ 'segoeui.ttf', 'tahoma.ttf', 'calibri.ttf', 'consola.ttf' }) do
    local f = assert(io.open(window_font.FOLDER .. file, 'w'));
    f:write('not really a font');
    f:close();
end
MOCK.broken_fonts = { ['tahoma.ttf'] = 'error', ['calibri.ttf'] = 'nil' };

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local window   = require('ui.settings_window');
local skins    = require('ui.skins');
local profiles = require('ui.profiles');
local printout = require('core.printout');
local function cur() return MOCK.settings.current; end

-- One frame that must not stop checkmate.
local function frame()
    local n = #MOCK.printed;
    MOCK.frame();
    for _, line in ipairs(MOCK.printed_since(n)) do
        if (line:find('Stopped after an error', 1, true)) then error(line); end
    end
end
-- One frame with the mouse over every (?), so each one draws its tip. Returns the tips by path.
local function tips()
    MOCK.hover = true;
    frame();
    MOCK.hover = false;
    return MOCK.gui.tips;
end
local function has(text, want)
    return (text or ''):find(want, 1, true) ~= nil;
end
local function widgets(prefix)
    local count = 0;
    for path in pairs(MOCK.gui.paths) do
        if (path:sub(1, #prefix) == prefix) then count = count + 1; end
    end
    return count;
end

check('loading checkmate prints nothing', #MOCK.printed_since(0) == 0, table.concat(MOCK.printed_since(0), ' / '));

-- Closed, the window costs nothing.
frame();
check('a closed window makes no imgui calls', #MOCK.gui.calls == 0);

-- Open, it draws every tab.
MOCK.command('/checkmate');
frame();
check('the window is checkmate##settings', MOCK.gui.window == 'checkmate##settings');
local all = true;
for _, tab in ipairs({ 'Printout', 'Colors', 'Numbers', 'Aggro', 'Magic', 'Drops', 'Immunities', 'Look', 'Profiles' }) do
    all = all and MOCK.gui.tabs[tab] == true;
    check(tab .. ' tab has controls', widgets(tab .. '/') > 0, widgets(tab .. '/'));
end
check('all nine tabs draw', all);
check('the version is in the subtitle', MOCK.drew('v' .. addon.version));

-- Tips ------------------------------------------------------------------------------------------

-- Every control has a (?) right after it, or at the end of its row. A row of the parts, schools,
-- immunities or cutoffs tables shares one. The profile list and the job links share their heading's.
local SHARED_TIPS = {
    { '^Printout/reading/.*$',      'Printout/reading/Defense first' },
    { '^Printout/([%w_]+)/.*$',     'Printout/%1/##down' },
    { '^Magic/([%w_]+)/.*$',        'Magic/%1/##spell' },
    { '^Immunities/([%w_]+)/.*$',   'Immunities/%1/##label' },
    { '^Numbers/##(%a+)_good$',     'Numbers/##%1_ok' },
    { '^Profiles/##profiles$',      'Profiles/PROFILES' },
    { '^Profiles/##%u%u%u$',        'Profiles/JOB LINKS' },
};
local function tip_owner(path)
    for _, rule in ipairs(SHARED_TIPS) do
        if (path:find(rule[1])) then
            return (path:gsub(rule[1], rule[2]));
        end
    end
    return path;
end
local CONTROLS = { Checkbox = true, Slider = true, InputText = true, BeginCombo = true, ColorEdit4 = true, Button = true,
    ArrowButton = true, BeginListBox = true };
local all_tips = tips();
local untipped, controls = {}, 0;
for path, widget in pairs(MOCK.gui.paths) do
    if (CONTROLS[widget]) then
        controls = controls + 1;
        if (not MOCK.gui.helps[tip_owner(path)]) then untipped[#untipped + 1] = path; end
    end
end
table.sort(untipped);
check('every control has a (?)', controls > 250 and #untipped == 0, controls .. ' controls, no (?): '
    .. table.concat(untipped, ', '));
local bad_tips = {};
for owner in pairs(MOCK.gui.helps) do
    local each = all_tips[owner] or '';
    if (each == '' or each:find('[^\32-\126]') or each:sub(-1) ~= '.') then bad_tips[#bad_tips + 1] = owner; end
end
check('and every (?) shows a tip in plain text that ends a sentence', #bad_tips == 0, table.concat(bad_tips, ', '));

-- How many (?) marks each tab has with the default settings.
local TIP_COUNTS = { Printout = 28, Colors = 62, Numbers = 8, Aggro = 5, Magic = 14, Drops = 6, Immunities = 17, Look = 48,
    Profiles = 8 };
for tab, want in pairs(TIP_COUNTS) do
    local count = 0;
    for owner in pairs(MOCK.gui.helps) do
        if (owner:sub(1, #tab + 1) == tab .. '/') then count = count + 1; end
    end
    check(('the %s tab has %d tips'):format(tab, want), count == want, count);
end
check('a chat color\'s tip says what it paints', has(all_tips['Colors/##aggro_safe'], 'Too weak, Not aggressive and Never '
    .. 'aggressive') and has(all_tips['Colors/##too_weak'], 'Too Weak while Color by difficulty is on.'));
check('a window color\'s tip says what it paints', has(all_tips['Look/Open dropdowns##dropdowns'], 'these tips'));
check('a part\'s tip says what it prints', has(all_tips['Printout/crit/##down'], 'from your DEX against its AGI')
    and has(all_tips['Printout/reading/Defense first'], 'Defense first puts defense before evasion.'));
check('an immunity\'s tip says what it covers', has(all_tips['Immunities/light_sleep/##label'], 'Foe Lullaby, Horde '
    .. 'Lullaby, Sheep Song and Yawn') and has(all_tips['Immunities/bind/##label'], 'Untick On to leave it out.'));
check('a school\'s tip says what its chance means', has(all_tips['Magic/elemental/##spell'], 'resists least'));

-- No text in the window runs past 100 characters. A tab whose part is off says so in one sentence.
local long = {};
frame();
for _, each in ipairs(MOCK.gui.texts) do
    if (#each > 100 and not each:find('v' .. addon.version, 1, true)) then long[#long + 1] = each; end
end
check('no text in the window runs past 100 characters, apart from the subtitle', #long == 0, table.concat(long, ' / '));
check('a part that\'s off says so on its tab', MOCK.drew('The Drops part is off, so turn it on in the Printout tab.')
    and MOCK.drew('The Magic part is off') and MOCK.drew('The Elements part is off')
    and MOCK.drew('The Immunities part is off') and not MOCK.drew('The Aggro part is off'));
cur().printout.parts.drops.on = true;
frame();
check('and stops once it\'s on', not MOCK.drew('The Drops part is off'));
cur().printout.parts.drops.on = false;
cur().grades.on = false;
frame();
check('the Numbers tab says when grade colors are off', MOCK.drew('Grade colors are off, so turn them on in the Colors '
    .. 'tab to use these.') and MOCK.gui.disabled['Numbers/##hit_ok'] == true);
cur().grades.on = true;
frame();
check('and stops once they\'re on', not MOCK.drew('Grade colors are off') and not MOCK.gui.disabled['Numbers/##hit_ok']);

-- Printout tab ----------------------------------------------------------------------------------

local s = cur();
check('the name part has Show level and no arrows', MOCK.gui.paths['Printout/Show level'] == 'Checkbox'
    and MOCK.gui.paths['Printout/name/##up'] == nil);
check('the first part can\'t go up, the last can\'t go down', MOCK.gui.disabled['Printout/difficulty/##up']
    and MOCK.gui.disabled['Printout/pet/##down'] and not MOCK.gui.disabled['Printout/difficulty/##down']
    and not MOCK.gui.disabled['Printout/drops/##down']);
local drawn = {};
for _, text in ipairs(MOCK.gui.texts) do drawn[text] = true; end
check('the parts table names the parts and the reading', drawn['Difficulty'] and drawn['Evasion and defense']);
check('Aggro has its row after Crit, on', drawn['Aggro'] and MOCK.gui.paths['Printout/aggro/##on'] == 'Checkbox'
    and MOCK.gui.paths['Printout/aggro/##label'] == 'InputText' and MOCK.gui.paths['Printout/aggro/##new_line'] == 'Checkbox'
    and cur().printout.parts.aggro.on == true);
check('Pet has the last row, off, on its own line', drawn['Pet'] and MOCK.gui.paths['Printout/pet/##on'] == 'Checkbox'
    and MOCK.gui.paths['Printout/pet/##label'] == 'InputText' and MOCK.gui.paths['Printout/pet/##new_line'] == 'Checkbox'
    and cur().printout.parts.pet.on == false and cur().printout.parts.pet.new_line == true
    and cur().printout.parts.pet.label == 'Pet' and cur().printout.order:find(' pet$') ~= nil);
local saves = MOCK.saved;
MOCK.clicks['Printout/evade/##up'] = true;
frame();
check('Up moves a part', s.printout.order == 'difficulty evade hit crit aggro magic immunities elements drops pet',
    s.printout.order);
check('and saves at once', MOCK.saved == saves + 1);
MOCK.clicks['Printout/evade/##up'] = true;
frame();
frame();
check('the rows follow the order', MOCK.gui.disabled['Printout/evade/##up'] and not MOCK.gui.disabled['Printout/difficulty/##up']);
MOCK.clicks['Printout/difficulty/##up'] = true;
frame();

-- The reading's row sits under Difficulty with its On box and Defense first, and no arrows or label.
check('the reading has an On box and Defense first', MOCK.gui.paths['Printout/reading/##on'] == 'Checkbox'
    and MOCK.gui.paths['Printout/reading/Defense first'] == 'Checkbox' and MOCK.gui.paths['Printout/reading/##up'] == nil
    and MOCK.gui.paths['Printout/reading/##label'] == nil);
saves = MOCK.saved;
MOCK.clicks['Printout/reading/##on'] = true;
MOCK.clicks['Printout/reading/Defense first'] = true;
frame();
check('they turn the reading off and defense first on, and save', s.printout.parts.reading.on == false
    and s.printout.defense_first == true and MOCK.saved == saves + 1);
MOCK.clicks['Printout/reading/##on'] = true;
MOCK.clicks['Printout/reading/Defense first'] = true;
frame();
check('and back', s.printout.parts.reading.on == true and s.printout.defense_first == false);

MOCK.clicks['Printout/drops/##on'] = true;
frame();
check('a part\'s On box', s.printout.parts.drops.on == true);

saves = MOCK.saved;
MOCK.typing['Printout/hit/##label'] = 'H\195\169t\226\128\148!';
frame();
check('a label keeps printable ASCII only', s.printout.parts.hit.label == 'Ht!', s.printout.parts.hit.label);
check('typing doesn\'t save', MOCK.saved == saves);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the box saves', MOCK.saved == saves + 1);

check('the Divider list shows Star and no custom box', MOCK.gui.previews['Printout/Divider'] == 'Star'
    and MOCK.gui.paths['Printout/Custom text'] == nil, MOCK.gui.previews['Printout/Divider']);
MOCK.open['Printout/Divider'] = true;
frame();
local names = {};
for _, divider in ipairs(printout.DIVIDERS) do
    if (MOCK.gui.paths['Printout/Divider/' .. divider.name] == 'Selectable') then names[#names + 1] = divider.name; end
end
check('it offers every divider by name', #names == #printout.DIVIDERS, table.concat(names, ', '));
saves = MOCK.saved;
MOCK.clicks['Printout/Divider/Custom'] = true;
frame();
check('picking Custom saves at once', s.printout.divider == 'custom' and MOCK.saved == saves + 1);
frame();
check('and shows the custom box', MOCK.gui.paths['Printout/Custom text'] == 'InputText');
MOCK.typing['Printout/Custom text'] = ' \226\128\162 | ';
frame();
check('the custom text keeps printable ASCII only', s.printout.separator == '  | ', s.printout.separator);
MOCK.clicks['Printout/Divider/Two spaces'] = true;
frame();
frame();
check('Two spaces hides the box again', s.printout.divider == 'spaces' and MOCK.gui.paths['Printout/Custom text'] == nil);
MOCK.open['Printout/Divider'] = nil;

-- The label divider's list and its own custom box, next to the divider's.
check('the Label divider list shows Colon and no custom box', MOCK.gui.previews['Printout/Label divider'] == 'Colon :'
    and MOCK.gui.paths['Printout/Custom text##label'] == nil, MOCK.gui.previews['Printout/Label divider']);
MOCK.open['Printout/Label divider'] = true;
frame();
names = {};
for _, divider in ipairs(printout.LABEL_DIVIDERS) do
    if (MOCK.gui.paths['Printout/Label divider/' .. divider.name] == 'Selectable') then names[#names + 1] = divider.name; end
end
check('it offers every label divider by name', #names == #printout.LABEL_DIVIDERS and #names == 14, table.concat(names, ', '));
saves = MOCK.saved;
MOCK.clicks['Printout/Label divider/Custom'] = true;
frame();
check('picking Custom saves at once', s.printout.label_divider == 'custom' and MOCK.saved == saves + 1);
frame();
check('and shows its own custom box', MOCK.gui.paths['Printout/Custom text##label'] == 'InputText'
    and MOCK.gui.paths['Printout/Custom text'] == nil);
MOCK.typing['Printout/Custom text##label'] = ' \226\128\162>';
frame();
check('its text keeps printable ASCII only', s.printout.label_separator == ' >', s.printout.label_separator);
local n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('and the sample prints it with a space after', table.concat(MOCK.printed_since(n), ' / '):find('[checkmate] Aggro > '
    .. 'Aggressive (Sight)  Links with', 1, true) ~= nil, table.concat(MOCK.printed_since(n), ' / '));
MOCK.clicks['Printout/Label divider/Space only'] = true;
frame();
frame();
check('Space only hides the box again', s.printout.label_divider == 'space'
    and MOCK.gui.paths['Printout/Custom text##label'] == nil);
MOCK.clicks['Printout/Label divider/Colon :'] = true;
frame();
check('and Colon', s.printout.label_divider == 'colon');
MOCK.open['Printout/Label divider'] = nil;
local tip = tips();
check('the tips say a label can be your own word and what the label divider is', has(tip['Printout/PARTS'], 'Type your own '
    .. 'word in a part\'s Label box, like Acc instead of Hit') and has(tip['Printout/Label divider'], 'like the colon in "Aggro: '
    .. 'Aggressive"') and not MOCK.drew('Type your own word'));

MOCK.clicks['Printout/Show level'] = true;
MOCK.clicks['Printout/drops/##new_line'] = true;
MOCK.clicks['Printout/[checkmate] at the start of each line'] = true;
frame();
check('Show level, New line and the header boxes', s.printout.show_level == false and s.printout.parts.drops.new_line == false
    and s.printout.header == false);
MOCK.clicks['Printout/Show level'] = true;
MOCK.clicks['Printout/drops/##new_line'] = true;
MOCK.clicks['Printout/[checkmate] at the start of each line'] = true;
frame();

-- The level range box sits next to Show level, and its word box next to the name's label.
local RANGE, WORD = 'Printout/Show its level range too', 'Printout/Range word';
frame();
check('Show its level range too is a box, off, with a greyed word box', MOCK.gui.paths[RANGE] == 'Checkbox'
    and s.printout.show_range == false and not MOCK.gui.disabled[RANGE] and MOCK.gui.paths[WORD] == 'InputText'
    and MOCK.gui.disabled[WORD] == true);
tip = tips();
check('with their tips', has(tip[RANGE], 'like (Lv 42, range 40-44).') and has(tip[WORD], 'Clear it to get (Lv 42, 40-44).'));
saves = MOCK.saved;
MOCK.clicks[RANGE] = true;
frame();
check('it turns on and saves at once', s.printout.show_range == true and MOCK.saved == saves + 1
    and MOCK.last_save.printout.show_range == true);
frame();
check('and the word box is live', not MOCK.gui.disabled[WORD]);
saves = MOCK.saved;
MOCK.typing[WORD] = ' sp\195\169awns ';
frame();
check('the word keeps printable ASCII only and doesn\'t save while typed', s.printout.range_word == ' spawns '
    and MOCK.saved == saves, s.printout.range_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the word box saves it', MOCK.saved == saves + 1 and MOCK.last_save.printout.range_word == ' spawns ');
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('the sample shows the range with the word trimmed', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample Goblin '
    .. '%(Lv 42, spawns 40%-44%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.typing[WORD] = '';
frame();
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('and with the word cleared', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample Goblin %(Lv 42, 40%-44%)') ~= nil,
    MOCK.printed_since(n)[1]);
MOCK.clicks['Printout/Show level'] = true;
frame();
frame();
check('Show level off greys out both', s.printout.show_level == false and MOCK.gui.disabled[RANGE] == true
    and MOCK.gui.disabled[WORD] == true);
MOCK.clicks['Printout/Show level'] = true;
MOCK.clicks[RANGE] = true;
MOCK.typing[WORD] = 'range';
frame();
check('and back', s.printout.show_level == true and s.printout.show_range == false and s.printout.range_word == 'range');

-- Show its ID sits under the range word, with its own word box beside it.
local SHOW_ID, ID_WORD = 'Printout/Show its ID', 'Printout/ID word';
frame();
check('Show its ID is a box, off, with a greyed word box', MOCK.gui.paths[SHOW_ID] == 'Checkbox'
    and s.printout.show_id == false and not MOCK.gui.disabled[SHOW_ID] and MOCK.gui.paths[ID_WORD] == 'InputText'
    and MOCK.gui.disabled[ID_WORD] == true);
tip = tips();
check('with their tips', has(tip[SHOW_ID], 'like (ID 17199202).') and has(tip[ID_WORD], 'Clear it to get (17199202).'));
check('and Show the name\'s tip says the ID and PH note go with it', has(tip['Printout/Show the name##name'],
    'the name, level, ID and PH note'));
saves = MOCK.saved;
MOCK.clicks[SHOW_ID] = true;
frame();
check('it turns on and saves at once', s.printout.show_id == true and MOCK.saved == saves + 1
    and MOCK.last_save.printout.show_id == true);
frame();
check('and the word box is live', not MOCK.gui.disabled[ID_WORD]);
saves = MOCK.saved;
MOCK.typing[ID_WORD] = ' M\195\169ob ID ';
frame();
check('the word keeps printable ASCII only and doesn\'t save while typed', s.printout.id_word == ' Mob ID '
    and MOCK.saved == saves, s.printout.id_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the word box saves it', MOCK.saved == saves + 1 and MOCK.last_save.printout.id_word == ' Mob ID ');
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('the sample shows the ID with the word trimmed', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample Goblin '
    .. '%(Lv 42%) %(Mob ID 17199202%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.clicks['Printout/Show level'] = true;
frame();
frame();
check('Show level off leaves both live', s.printout.show_level == false and not MOCK.gui.disabled[SHOW_ID]
    and not MOCK.gui.disabled[ID_WORD]);
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('and the sample shows the ID right after the name', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample '
    .. 'Goblin %(Mob ID 17199202%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.clicks['Printout/Show level'] = true;
MOCK.clicks[SHOW_ID] = true;
MOCK.typing[ID_WORD] = 'ID';
frame();
check('and back', s.printout.show_level == true and s.printout.show_id == false and s.printout.id_word == 'ID');

-- Show if it's a PH sits under Show its ID, with its own word box beside it.
local SHOW_PH, PH_WORD = 'Printout/Show if it\'s a PH', 'Printout/PH word';
frame();
check('Show if it\'s a PH is a box, off, with a greyed word box', MOCK.gui.paths[SHOW_PH] == 'Checkbox'
    and s.printout.show_ph == false and not MOCK.gui.disabled[SHOW_PH] and MOCK.gui.paths[PH_WORD] == 'InputText'
    and MOCK.gui.disabled[PH_WORD] == true);
tip = tips();
check('with their tips', has(tip[SHOW_PH], 'like (PH for Valkurm Emperor).')
    and has(tip[PH_WORD], 'Clear it to get (Valkurm Emperor).'));
saves = MOCK.saved;
MOCK.clicks[SHOW_PH] = true;
frame();
check('it turns on and saves at once', s.printout.show_ph == true and MOCK.saved == saves + 1
    and MOCK.last_save.printout.show_ph == true);
frame();
check('and the word box is live', not MOCK.gui.disabled[PH_WORD]);
saves = MOCK.saved;
MOCK.typing[PH_WORD] = ' P\195\169H: ';
frame();
check('the word keeps printable ASCII only and doesn\'t save while typed', s.printout.ph_word == ' PH: '
    and MOCK.saved == saves, s.printout.ph_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the word box saves it', MOCK.saved == saves + 1 and MOCK.last_save.printout.ph_word == ' PH: ');
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('the sample shows the PH note with the word trimmed', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample '
    .. 'Goblin %(Lv 42%) %(PH: Valkurm Emperor%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.clicks[SHOW_PH] = true;
MOCK.typing[PH_WORD] = 'PH for';
frame();
check('and back', s.printout.show_ph == false and s.printout.ph_word == 'PH for');

MOCK.open['Printout/Number ranges'] = true;
MOCK.clicks['Printout/Number ranges/Middle ~68%'] = true;
frame();
check('the Number ranges list', s.printout.number_style == 'midpoint');
MOCK.open['Printout/Number ranges'] = nil;

MOCK.typing['Printout/Label##name'] = 'Mob:';
frame();
check('the name label box', s.printout.parts.name.label == 'Mob:');
MOCK.typing['Printout/Label##name'] = '';
frame();

s.printout.parts.hit.on = true;
s.printout.parts.evade.on = true;
local n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
local lines = MOCK.printed_since(n);
check('Print a sample prints in the new order and labels', #lines == 4 and lines[1] == '[checkmate] Sample Goblin (Lv 42)  '
    .. 'Decent Challenge (Low Defense)' and lines[2] == '[checkmate] Evade: 31% with Signet  Ht!: ~68%'
    and lines[3] == '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Butcher (Sight), Goblin Leecher (Sight), '
    .. 'Goblin Tinkerer (Sight)'
    and lines[4]:find('^%[checkmate%] Drops') ~= nil, table.concat(lines, ' / '));

check('Put the extras on their own line is a box under the parts', MOCK.gui.paths['Printout/Put the extras on their own line']
    == 'Checkbox' and has(tips()['Printout/Put the extras on their own line'], 'With this on, hit, evade, crit, aggro, magic, '
    .. 'immunities, elements, drops and pet never share a line with the name and difficulty.'));
saves = MOCK.saved;
MOCK.clicks['Printout/Put the extras on their own line'] = true;
frame();
check('it turns off and saves', s.printout.extras_own_line == false and MOCK.saved == saves + 1);
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
lines = MOCK.printed_since(n);
check('and the sample shows it', #lines == 3 and lines[1] == '[checkmate] Sample Goblin (Lv 42)  '
    .. 'Decent Challenge (Low Defense)  Evade: 31% with Signet  Ht!: ~68%' and lines[2]:find('^%[checkmate%] Aggro') ~= nil
    and lines[3]:find('^%[checkmate%] Drops') ~= nil, table.concat(lines, ' / '));
MOCK.clicks['Printout/Put the extras on their own line'] = true;
frame();
check('and back on', s.printout.extras_own_line == true);

check('Replace the game\'s /check line is a box, on', MOCK.gui.paths['Printout/Replace the game\'s /check line'] == 'Checkbox'
    and s.printout.replace_game_line == true and has(tips()['Printout/Replace the game\'s /check line'], 'checkmate\'s lines '
    .. 'take its place'));
saves = MOCK.saved;
MOCK.clicks['Printout/Replace the game\'s /check line'] = true;
frame();
check('it turns off and saves', s.printout.replace_game_line == false and MOCK.saved == saves + 1);
MOCK.clicks['Printout/Replace the game\'s /check line'] = true;
frame();
check('and back on', s.printout.replace_game_line == true);

-- Colors tab ------------------------------------------------------------------------------------

-- Every color setting has a list on the Colors tab, and nothing else paints chat.
local lists = 0;
for _, key in ipairs(printout.COLOR_KEYS) do
    if (MOCK.gui.paths['Colors/##' .. key] == 'BeginCombo') then lists = lists + 1; end
end
check('a list for every color setting', lists == #printout.COLOR_KEYS and lists == 58, lists);
local elsewhere = {};
for path, widget in pairs(MOCK.gui.paths) do
    if (widget == 'BeginCombo' and not path:find('^Colors/') and MOCK.gui.previews[path] == 'Cream') then
        elsewhere[#elsewhere + 1] = path;
    end
end
check('no chat color list on any other tab', #elsewhere == 0, table.concat(elsewhere, ', '));
check('each list shows its color\'s name', MOCK.gui.previews['Colors/##name'] == 'Coral'
    and MOCK.gui.previews['Colors/##level_range'] == 'Coral' and MOCK.gui.previews['Colors/##id'] == 'Coral'
    and MOCK.gui.previews['Colors/##ph'] == 'Coral'
    and MOCK.gui.previews['Colors/##decent_challenge'] == 'Light blue' and MOCK.gui.previews['Colors/##tag_word'] == 'Cyan');
for _, heading in ipairs({ 'TAG AND LINES', 'NAME AND LEVEL', 'DIFFICULTY', 'EVASION AND DEFENSE', 'HIT RATE', 'EVADE', 'CRIT',
    'AGGRO', 'MAGIC', 'IMMUNITIES', 'ELEMENTS', 'DROPS', 'PET', 'GRADES' }) do
    check('the ' .. heading .. ' heading', MOCK.drew(heading));
end

MOCK.open['Colors/##hit_label'] = true;
frame();
local offered = 0;
for path, widget in pairs(MOCK.gui.paths) do
    if (widget == 'Selectable' and path:find('^Colors/##hit_label/')) then offered = offered + 1; end
end
check('a color list offers the whole palette', offered == #printout.PALETTE, offered);
saves = MOCK.saved;
MOCK.clicks['Colors/##hit_label/Coral'] = true;
frame();
check('picking Coral sets 8 and saves at once', s.colors.hit_label == 8 and MOCK.saved == saves + 1);
MOCK.open['Colors/##hit_label'] = nil;
MOCK.open['Colors/##line'] = true;
MOCK.clicks['Colors/##line/White'] = true;
frame();
check('the divider and line color', s.colors.line == 1);
MOCK.open['Colors/##line'] = nil;

check('Color by difficulty is a box over the con colors', MOCK.gui.paths['Colors/Color by difficulty'] == 'Checkbox');
saves = MOCK.saved;
MOCK.clicks['Colors/Color by difficulty'] = true;
frame();
check('Color by difficulty turns off and saves', s.printout.con_colors == false and MOCK.saved == saves + 1);
MOCK.clicks['Colors/Color by difficulty'] = true;
frame();
check('and back on', s.printout.con_colors == true);

check('Color by threat is a box over the aggro colors, on', MOCK.gui.paths['Colors/Color by threat'] == 'Checkbox'
    and s.aggro.threat_colors == true and MOCK.gui.previews['Colors/##aggro_threat'] == 'Tomato'
    and MOCK.gui.previews['Colors/##aggro_safe'] == 'Lawn green');
check('with its tip', has(tips()['Colors/Color by threat'], 'With this on, Aggressive answers print in Threat'));
saves = MOCK.saved;
MOCK.clicks['Colors/Color by threat'] = true;
frame();
check('Color by threat turns off and saves', s.aggro.threat_colors == false and MOCK.saved == saves + 1);
MOCK.clicks['Colors/Color by threat'] = true;
MOCK.open['Colors/##aggro_safe'] = true;
MOCK.clicks['Colors/##aggro_safe/Spring green'] = true;
frame();
check('and back on, and the Safe color', s.aggro.threat_colors == true and s.colors.aggro_safe == 83);
MOCK.open['Colors/##aggro_safe'] = nil;

MOCK.clicks['Colors/Color the hit, evade, crit and pet numbers'] = true;
frame();
check('grade colors off', s.grades.on == false);
frame();
check('the cutoffs grey out', MOCK.gui.disabled['Numbers/##hit_good'] == true);
MOCK.clicks['Colors/Color the hit, evade, crit and pet numbers'] = true;
MOCK.open['Colors/##good'] = true;
MOCK.clicks['Colors/##good/Lime'] = true;
frame();
check('grades back on, and the Good color', s.grades.on and s.colors.good == 79);
MOCK.open['Colors/##good'] = nil;

n = #MOCK.printed;
MOCK.clicks['Colors/Print a sample'] = true;
frame();
check('the Colors tab prints a sample too', #MOCK.printed > n
    and MOCK.printed_since(n)[1]:find('^%[checkmate%] Sample Goblin') ~= nil, MOCK.printed_since(n)[1]);

-- Numbers tab -----------------------------------------------------------------------------------

MOCK.slide['Numbers/##hit_good'] = 90;
MOCK.slide['Numbers/##crit_ok'] = 6;
frame();
check('the cutoff sliders', s.grades.hit_good == 90 and s.grades.crit_ok == 6);
check('and no grade colors there', MOCK.gui.paths['Numbers/Good'] == nil
    and MOCK.gui.paths['Numbers/Color the hit, evade, crit and pet numbers'] == nil);

-- The PET section beside the cutoffs edits the pet part's settings.
local PET_NAME, PET_LEVEL = 'Numbers/Show its name', 'Numbers/Show its level';
check('the Numbers tab has a PET section with its four controls', MOCK.drew('PET') and MOCK.gui.paths[PET_NAME] == 'Checkbox'
    and MOCK.gui.paths[PET_LEVEL] == 'Checkbox' and MOCK.gui.paths['Numbers/Hit word'] == 'InputText'
    and MOCK.gui.paths['Numbers/Evade word'] == 'InputText' and not MOCK.gui.disabled[PET_LEVEL]);
check('and a note while the Pet part is off', MOCK.drew('The Pet part is off, so turn it on in the Printout tab.'));
tip = tips();
check('and its tips', has(tip['Numbers/PET'], 'It works for a jug pet, a charmed monster, a wyvern and an automaton')
    and has(tip[PET_LEVEL], 'like (Lv 73-75)') and has(tip['Numbers/Evade word'], 'Clear it to leave the word out.'));
saves = MOCK.saved;
MOCK.clicks[PET_NAME] = true;
frame();
check('Show its name turns off and saves', s.pet.show_name == false and MOCK.saved == saves + 1);
frame();
check('and greys out Show its level', MOCK.gui.disabled[PET_LEVEL] == true);
MOCK.clicks[PET_NAME] = true;
frame();
MOCK.clicks[PET_LEVEL] = true;
frame();
check('Show its level turns off by itself', s.pet.show_name == true and s.pet.show_level == false);
MOCK.clicks[PET_LEVEL] = true;
frame();
saves = MOCK.saved;
MOCK.typing['Numbers/Hit word'] = 'Acc\226\128\148';
frame();
check('the Hit word keeps printable ASCII only and doesn\'t save while typed', s.pet.hit_word == 'Acc'
    and s.pet.show_level == true and MOCK.saved == saves, s.pet.hit_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the box saves it', MOCK.saved == saves + 1 and MOCK.last_save.pet.hit_word == 'Acc');
MOCK.typing['Numbers/Evade word'] = '';
frame();
check('the Evade word clears', s.pet.evade_word == '');
MOCK.clicks['Printout/pet/##on'] = true;
frame();
check('the note goes once the Pet part is on', s.printout.parts.pet.on == true and not MOCK.drew('The Pet part is off'));
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
lines = MOCK.printed_since(n);
check('the sample ends with the pet part in your words', lines[#lines] == '[checkmate] Pet: Wyvern (Lv 42)  Acc: 88%  27%',
    table.concat(lines, ' / '));
MOCK.typing['Numbers/Hit word'] = 'Hit';
MOCK.typing['Numbers/Evade word'] = 'Evade';
MOCK.clicks['Printout/pet/##on'] = true;
frame();
check('and back', s.pet.hit_word == 'Hit' and s.pet.evade_word == 'Evade' and s.printout.parts.pet.on == false);

-- Aggro tab -------------------------------------------------------------------------------------

local DETECTION = 'Aggro/Show how it finds you';
local HOW = 'Aggro/Show how each one links';
local NAMES = 'Aggro/Show the names it links with';
check('the Aggro tab has its boxes and slider', MOCK.gui.paths[DETECTION] == 'Checkbox' and MOCK.gui.paths[NAMES] == 'Checkbox'
    and MOCK.gui.paths['Aggro/Most names shown'] == 'Slider' and MOCK.gui.formats['Aggro/Most names shown'] == '%d'
    and not MOCK.gui.disabled['Aggro/Most names shown']);
check('Show how each one links is a box, on', MOCK.gui.paths[HOW] == 'Checkbox' and s.aggro.link_how == true
    and not MOCK.gui.disabled[HOW]);
tip = tips();
check('and its tips', has(tip['Aggro/AGGRESSIVE'], 'One that checks Too Weak won\'t aggro you unless you rest or sit.')
    and has(tip[DETECTION], 'True Sight sees through Invisible and True Sound hears through Sneak.')
    and has(tip[NAMES], 'With this off, it just says "Links"') and has(tip[HOW], 'a link never cares about those.')
    and has(tip[HOW], 'A name can show two when some of its monsters join one way and some the other, like Fomor Monk '
    .. '(Superlink or Sound).'));
saves = MOCK.saved;
MOCK.clicks[DETECTION] = true;
frame();
check('Detection turns off and saves', s.aggro.detection == false and MOCK.saved == saves + 1);
MOCK.clicks[NAMES] = true;
frame();
frame();
check('the names turn off and grey out the slider', s.aggro.link_names == false
    and MOCK.gui.disabled['Aggro/Most names shown'] == true);
check('but not Show how each one links', not MOCK.gui.disabled[HOW]);
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('so the sample says how they link without the names', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive  '
    .. 'Links (Sight)', MOCK.printed_since(n)[3]);
saves = MOCK.saved;
MOCK.clicks[HOW] = true;
frame();
check('Show how each one links turns off and saves', s.aggro.link_how == false and MOCK.saved == saves + 1
    and MOCK.last_save.aggro.link_how == false);
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('and the sample just says Links', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive  Links',
    MOCK.printed_since(n)[3]);
MOCK.clicks[DETECTION] = true;
MOCK.clicks[NAMES] = true;
frame();
check('and back on', s.aggro.detection == true and s.aggro.link_names == true);
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('with the names back and Show how each one links still off, the sample has no tags', MOCK.printed_since(n)[3]
    == '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Butcher, Goblin Leecher, Goblin Tinkerer',
    MOCK.printed_since(n)[3]);
MOCK.clicks[HOW] = true;
frame();
check('Show how each one links back on', s.aggro.link_how == true);
saves = MOCK.saved;
MOCK.slide['Aggro/Most names shown'] = 0;
frame();
check('the slider doesn\'t save while dragged', s.aggro.max_links == 0 and MOCK.saved == saves);
frame();
check('0 names reads All', MOCK.gui.formats['Aggro/Most names shown'] == 'All');
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('and saves when let go', MOCK.saved == saves + 1 and MOCK.last_save.aggro.max_links == 0);
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('the sample follows the aggro settings', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive (Sight)  Links with '
    .. 'Goblin Butcher (Sight), Goblin Leecher (Sight), Goblin Tinkerer (Sight)', MOCK.printed_since(n)[3]);
MOCK.slide['Aggro/Most names shown'] = 1;
frame();
n = #MOCK.printed;
MOCK.clicks['Colors/Print a sample'] = true;
frame();
check('with the most names shown', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive (Sight)  Links with '
    .. 'Goblin Butcher (Sight)  +2 more', MOCK.printed_since(n)[3]);
MOCK.slide['Aggro/Most names shown'] = 5;
frame();

-- Magic tab -------------------------------------------------------------------------------------

MOCK.clicks['Magic/elemental/Elemental'] = true;
MOCK.open['Magic/enfeebling/##spell'] = true;
MOCK.clicks['Magic/enfeebling/##spell/Sleep'] = true;
MOCK.slide['Magic/##extra_accuracy'] = 25;
frame();
check('a school box, its stand-in and extra magic accuracy', s.magic.schools.elemental.on == true
    and s.magic.schools.enfeebling.spell == 'sleep' and s.magic.extra_accuracy == 25);
check('one-spell schools have a greyed list', MOCK.gui.disabled['Magic/healing/##spell']
    and MOCK.gui.disabled['Magic/blue/##spell'] and not MOCK.gui.disabled['Magic/dark/##spell']);
MOCK.open['Magic/enfeebling/##spell'] = nil;

-- The elements part's words and Show how strong sit under their own heading on the Magic tab.
local STRENGTH = 'Magic/Show how strong each one is';
check('the Magic tab has the elements words and Show how strong, on', MOCK.drew('ELEMENTS')
    and MOCK.gui.paths['Magic/Weak word'] == 'InputText' and MOCK.gui.paths['Magic/Resists word'] == 'InputText'
    and MOCK.gui.paths[STRENGTH] == 'Checkbox' and s.elements.strength == true);
tip = tips();
check('with its tip, and a note while the part is off', has(tip['Magic/ELEMENTS'], 'The Elements part lists the elements a '
    .. 'monster is weak to and the ones it resists') and has(tip[STRENGTH], 'like (half) for half damage')
    and MOCK.drew('The Elements part is off, so turn it on in the Printout tab.'));
check('the parts table has an Elements row after Immunities, off, on its own line', drawn['Elements']
    and MOCK.gui.paths['Printout/elements/##on'] == 'Checkbox' and MOCK.gui.paths['Printout/elements/##label'] == 'InputText'
    and s.printout.parts.elements.on == false and s.printout.parts.elements.new_line == true
    and s.printout.parts.elements.label == 'Elements');
saves = MOCK.saved;
MOCK.typing['Magic/Weak word'] = 'W\195\169ak ';
frame();
check('a word keeps printable ASCII only and doesn\'t save while typed', s.elements.weak_word == 'Wak ' and MOCK.saved == saves,
    s.elements.weak_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the box saves it', MOCK.saved == saves + 1 and MOCK.last_save.elements.weak_word == 'Wak ');
MOCK.typing['Magic/Resists word'] = '';
MOCK.clicks[STRENGTH] = true;
frame();
check('the resists word clears and Show how strong turns off and saves', s.elements.resist_word == ''
    and s.elements.strength == false and MOCK.last_save.elements.strength == false);
MOCK.clicks['Printout/elements/##on'] = true;
frame();
n = #MOCK.printed;
MOCK.clicks['Printout/Print a sample'] = true;
frame();
check('the sample shows the elements part with your words', table.concat(MOCK.printed_since(n), ' / '):find('[checkmate] '
    .. 'Elements: Wak: Ice, Thunder  Water / ', 1, true) ~= nil, table.concat(MOCK.printed_since(n), ' / '));
MOCK.typing['Magic/Weak word'] = 'Weak';
MOCK.typing['Magic/Resists word'] = 'Resists';
MOCK.clicks[STRENGTH] = true;
MOCK.clicks['Printout/elements/##on'] = true;
frame();
check('and back', s.elements.weak_word == 'Weak' and s.elements.resist_word == 'Resists' and s.elements.strength == true
    and s.printout.parts.elements.on == false);

-- Drops tab -------------------------------------------------------------------------------------

MOCK.slide['Drops/##th'] = 3;
MOCK.slide['Drops/Most items shown'] = 0;
MOCK.slide['Drops/Hide items under'] = 1.5;
MOCK.open['Drops/Order'] = true;
MOCK.clicks['Drops/Order/By name'] = true;
MOCK.clicks['Drops/Treasure Hunter in the label'] = true;
MOCK.clicks['Drops/Drop notes'] = true;
frame();
check('every drops control', s.drops.th == 3 and s.drops.max_items == 0 and s.drops.min_chance == 1.5
    and s.drops.sort == 'name' and s.drops.th_in_label == false and s.drops.notes == false);
frame();
check('0 items reads All', MOCK.gui.formats['Drops/Most items shown'] == 'All');
MOCK.open['Drops/Order'] = nil;

-- Immunities tab --------------------------------------------------------------------------------

MOCK.clicks['Immunities/dark_sleep/##on'] = true;
MOCK.typing['Immunities/bind/##label'] = 'Bnd';
frame();
check('an immunity\'s box and label', s.immunities.dark_sleep.on == false and s.immunities.bind.label == 'Bnd');
local rows = 0;
for _, entry in ipairs(printout.IMMUNITIES) do
    if (MOCK.gui.paths['Immunities/' .. entry.id .. '/##on'] == 'Checkbox') then rows = rows + 1; end
end
check('all sixteen immunities', rows == 16, rows);

-- Look tab --------------------------------------------------------------------------------------

MOCK.open['Look/##skin'] = true;
MOCK.clicks['Look/##skin/Ember'] = true;
frame();
local ember = skins.find('ember');
check('picking Ember copies its colors', s.look.skin == 'ember' and s.colors.line == 7
    and s.colors.hit_label == 78 and s.look.imgui.check_marks[1] == ember.imgui.accent[1]);
MOCK.open['Look/##skin'] = nil;
MOCK.slide['Look/Background##background'] = 0.5;
MOCK.slide['Look/Open tab line, unfocused##open_tab_line_unfocused'] = 0.25;
MOCK.slide['Look/Corner roundness'] = 9;
frame();
check('a window color edits the setting, not the skin', s.look.imgui.background[1] == 0.5 and ember.imgui.background[1] ~= 0.5
    and s.look.imgui.open_tab_line_unfocused[1] == 0.25 and s.look.imgui.open_tab_line[1] ~= 0.25);
check('corner roundness', s.look.imgui.rounding == 9);
frame();
check('and the window paints with it', MOCK.gui.colors[ImGuiCol_WindowBg][1] == 0.5
    and MOCK.gui.colors[ImGuiCol_TabDimmedSelectedOverline][1] == 0.25);
local saves_before = MOCK.saved;
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of a color saves it', MOCK.saved > saves_before and MOCK.last_save.look.imgui.background[1] == 0.5);
MOCK.clicks['Look/Reset to skin'] = true;
frame();
check('Reset to skin', s.look.imgui.background[1] == ember.imgui.background[1] and s.look.imgui.rounding == 2
    and s.look.imgui.open_tab_line_unfocused[1] == ember.imgui.accent[1]);

-- Every window color has its own picker under its heading, and the window paints each ImGui color from it.
local pickers, missing, painted = 0, {}, true;
frame();
for _, entry in ipairs(skins.WINDOW_COLORS) do
    if (MOCK.gui.paths['Look/' .. entry.label .. '##' .. entry.key] == 'ColorEdit4') then
        pickers = pickers + 1;
    else
        missing[#missing + 1] = entry.key;
    end
    if (entry.paints ~= nil) then
        painted = painted and MOCK.gui.colors[entry.paints] == s.look.imgui[entry.key];
    end
end
local colors = 0;
for path, widget in pairs(MOCK.gui.paths) do
    if (widget == 'ColorEdit4' and path:find('^Look/')) then colors = colors + 1; end
end
check('41 window colors, each with its own picker', pickers == 41 and colors == 41, colors .. ' ' .. table.concat(missing, ', '));
check('the window paints every ImGui color from its setting', painted);
-- The notes checkmate draws itself take their own color, apart from the headings.
local imgui = require('imgui');
local push, text_colors = imgui.PushStyleColor, {};
imgui.PushStyleColor = function (id, color)
    if (id == ImGuiCol_Text) then text_colors[color] = true; end
    push(id, color);
end
frame();
imgui.PushStyleColor = nil;
check('notes draw in their own color', text_colors[s.look.imgui.notes] == true
    and not text_colors[s.look.imgui.headings]);
for _, group in ipairs(skins.WINDOW_COLOR_GROUPS) do
    check('the ' .. group.name:upper() .. ' heading', MOCK.drew(group.name:upper()));
end
for _, skin in ipairs(skins.LIST) do
    MOCK.open['Look/##skin'] = true;
    MOCK.clicks['Look/##skin/' .. skin.name] = true;
    frame();
    frame();
    check('the window draws in ' .. skin.name, s.look.skin == skin.id and MOCK.gui.window == 'checkmate##settings');
end
MOCK.open['Look/##skin'] = nil;

-- The font. The load event loaded every font from the test folder set up at the top.
local loads = #MOCK.font_calls;
frame();
check('the load event tried the four fonts that are there and loaded two', loads == 4 and #MOCK.fonts_loaded == 2
    and MOCK.fonts_loaded[1].path == window_font.FOLDER .. 'segoeui.ttf'
    and MOCK.fonts_loaded[2].path == window_font.FOLDER .. 'consola.ttf', loads);
check('the Font list shows Ashita, and the window draws in Ashita\'s font at 18', MOCK.gui.previews['Look/Font'] == 'Ashita'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and MOCK.gui.fonts[1].size == 18);
check('with the chat font sentence in its tip', has(tips()['Look/Font'], 'The chat log\'s font belongs to the game, and no '
    .. 'addon can change it.'));
MOCK.open['Look/Font'] = true;
frame();
local offered = 0;
for _, entry in ipairs(window_font.LIST) do
    if (MOCK.gui.paths['Look/Font/' .. entry.name] == 'Selectable') then offered = offered + 1; end
end
check('it offers every font', offered == #window_font.LIST, offered);
saves = MOCK.saved;
MOCK.clicks['Look/Font/Segoe UI'] = true;
frame();
check('picking Segoe UI saves at once', s.look.font == 'segoeui' and MOCK.saved == saves + 1);
frame();
check('and the window draws in the Segoe UI the load event loaded', MOCK.gui.fonts[1].font == MOCK.fonts_loaded[1]
    and MOCK.gui.fonts[1].size == 18);
check('without loading a font', #MOCK.font_calls == loads, #MOCK.font_calls);

MOCK.clicks['Look/Font/Verdana'] = true;
frame();
local n = #MOCK.printed;
frame();
frame();
check('a missing font draws in Ashita\'s font without an error', s.look.font == 'verdana'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and #MOCK.printed == n);
check('and says so', MOCK.drew(('Verdana isn\'t in %s or won\'t load, so this window uses Ashita\'s font.')
    :format(window_font.FOLDER)));
MOCK.clicks['Look/Font/Tahoma'] = true;
frame();
frame();
check('a font that raised an error while loading draws in Ashita\'s font too', s.look.font == 'tahoma'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and #MOCK.printed == n and MOCK.drew('Tahoma isn\'t in'));
MOCK.clicks['Look/Font/Calibri'] = true;
frame();
frame();
check('and so does one that loaded as nothing', s.look.font == 'calibri'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and #MOCK.printed == n and MOCK.drew('Calibri isn\'t in'));
MOCK.clicks['Look/Font/Consolas'] = true;
frame();
frame();
check('Consolas draws in the font the load event loaded', s.look.font == 'consolas'
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[2] and not MOCK.drew('isn\'t in'));
MOCK.clicks['Look/Font/Segoe UI'] = true;
frame();
check('none of those picks loaded a font', #MOCK.font_calls == loads, #MOCK.font_calls);
MOCK.open['Look/Font'] = nil;

check('the Font size slider', MOCK.gui.paths['Look/Font size'] == 'Slider' and MOCK.gui.formats['Look/Font size'] == '%d px');
MOCK.slide['Look/Font size'] = 22;
frame();
frame();
check('the size draws at once', s.look.font_size == 22 and MOCK.gui.fonts[1].size == 22
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[1]);
check('and the smallest window grows with it', MOCK.gui.next_size[1] == math.floor(700 * 22 / 18 + 0.5),
    MOCK.gui.next_size[1]);
MOCK.clicks['Look/Reset to skin'] = true;
frame();
check('Reset to skin leaves the font alone', s.look.font == 'segoeui' and s.look.font_size == 22);
MOCK.slide['Look/Font size'] = 18;
MOCK.open['Look/Font'] = true;
MOCK.clicks['Look/Font/Ashita'] = true;
frame();
MOCK.open['Look/Font'] = nil;
frame();
check('and back to Ashita\'s font at 18', s.look.font == 'ashita' and MOCK.gui.fonts[1].font == MOCK.ashita_font
    and MOCK.gui.fonts[1].size == 18);

-- Profiles tab ----------------------------------------------------------------------------------

check('the buttons wait for a pick', MOCK.gui.disabled['Profiles/Load'] == true and MOCK.drew('No profiles yet.'));
s.drops.th = 3;
s.look.font = 'consolas';
s.job_links.WAR = 'Keep me';
MOCK.typing['Profiles/Name'] = 'Solo BLM';
MOCK.clicks['Profiles/Save as new'] = true;
frame();
check('Save as new', profiles.exists('Solo BLM'));
MOCK.clicks['Profiles/Save as new'] = true;
frame();
frame();
check('Save as new refuses a name in use', MOCK.drew('There is already a profile called "Solo BLM"'));
MOCK.clicks['Profiles/##profiles/Solo BLM'] = true;
frame();
frame();
check('picking a profile turns its buttons on', MOCK.gui.disabled['Profiles/Load'] == nil);
s.drops.th = 0;
s.look.font = 'ashita';
saves = MOCK.saved;
MOCK.clicks['Profiles/Load'] = true;
frame();
s = cur();
check('Load', s.drops.th == 3 and MOCK.saved > saves and s.job_links.WAR == 'Keep me');
frame();
check('and the profile\'s font draws from what the load event loaded, without loading a font', s.look.font == 'consolas'
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[2] and #MOCK.font_calls == loads, #MOCK.font_calls);
MOCK.open['Profiles/##BLM'] = true;
MOCK.clicks['Profiles/##BLM/Solo BLM'] = true;
frame();
check('a job link list', s.job_links.BLM == 'Solo BLM');
MOCK.open['Profiles/##BLM'] = nil;
local jobs = 0;
for _, job in ipairs(profiles.JOBS) do
    if (MOCK.gui.paths['Profiles/##' .. job] == 'BeginCombo') then jobs = jobs + 1; end
end
check('eighteen job links', jobs == 18, jobs);
s.job_links.WHM = 'Old one';
frame();
check('a link to a deleted profile says so first', MOCK.gui.previews['Profiles/##WHM'] == '(gone) Old one'
    and MOCK.gui.previews['Profiles/##BLM'] == 'Solo BLM' and MOCK.gui.previews['Profiles/##THF'] == '(none)');
s.job_links.WHM = nil;
MOCK.typing['Profiles/Name'] = 'Nuker';
MOCK.clicks['Profiles/Rename'] = true;
frame();
check('Rename moves the job link', profiles.exists('Nuker') and not profiles.exists('Solo BLM') and s.job_links.BLM == 'Nuker');
s.drops.th = 1;
MOCK.clicks['Profiles/Overwrite'] = true;
frame();
s.drops.th = 4;
check('Overwrite', profiles.load(s, 'Nuker') and s.drops.th == 1);
MOCK.clicks['Profiles/Delete'] = true;
frame();
frame();
check('Delete removes it and its link', not profiles.exists('Nuker') and s.job_links.BLM == nil);
check('and the buttons grey out again', MOCK.gui.disabled['Profiles/Load'] == true);

-- The window size ------------------------------------------------------------------------------

saves = MOCK.saved;
MOCK.window_size = { 800, 610 };
MOCK.mouse_down = true;
frame();
frame();
check('nothing saves while the edge is held', MOCK.saved == saves);
MOCK.mouse_down = false;
frame();
check('the size saves once let go', s.window.width == 800 and s.window.height == 610 and MOCK.saved == saves + 1);
frame();
check('only once', MOCK.saved == saves + 1);
MOCK.window_size = nil;

-- Where the window sits ------------------------------------------------------------------------

-- Closes the window for a frame and opens it, so it's placed again. Returns where it was told to open.
local function reopen()
    MOCK.command('/checkmate');
    frame();
    MOCK.command('/checkmate');
    frame();
    return MOCK.gui.next_pos;
end
local pos = reopen();
check('it opens at 120, 20 at first, each time it opens', pos[1] == 120 and pos[2] == 20
    and MOCK.gui.next_pos_cond == ImGuiCond_Appearing and s.window.x == 120 and s.window.y == 20);
saves = MOCK.saved;
MOCK.window_pos = { 300, 200 };
MOCK.mouse_down = true;
frame();
frame();
check('nothing saves while it\'s dragged', MOCK.saved == saves and s.window.x == 120);
MOCK.mouse_down = false;
frame();
check('where it was moved saves once let go', s.window.x == 300 and s.window.y == 200 and MOCK.saved == saves + 1
    and MOCK.last_save.window.x == 300 and MOCK.last_save.window.y == 200);
frame();
check('only once', MOCK.saved == saves + 1);
MOCK.window_pos = nil;
pos = reopen();
check('it opens where it was left', pos[1] == 300 and pos[2] == 200);
s.window.x, s.window.y = 5000, -40;
pos = reopen();
check('a window off the screen is pulled back so all of it shows', pos[1] == 1600 - 800 and pos[2] == 0, pos[1] .. ', ' .. pos[2]);
check('and that spot saves', s.window.x == 800 and s.window.y == 0);
s.window.width, s.window.height = 3000, 2000;
pos = reopen();
check('a window bigger than the screen is cut down to fit it, at the top left', MOCK.gui.next_size[1] == 1600
    and MOCK.gui.next_size[2] == 1200 and pos[1] == 0 and pos[2] == 0);
MOCK.screen = { 1280, 720 };
s.window.x, s.window.y, s.window.width, s.window.height = 900, 500, 720, 560;
pos = reopen();
check('on a smaller screen it moves in to fit', pos[1] == 1280 - 720 and pos[2] == 720 - 560, pos[1] .. ', ' .. pos[2]);
MOCK.screen = { 800, 600 };
s.look.font_size = 24;
pos = reopen();
check('at 24 px the smallest window is wider than an 800 wide screen, so it fits the screen instead',
    MOCK.gui.next_size[1] == 800 and pos[1] == 0 and pos[2] == 600 - 560, MOCK.gui.next_size[1] .. ' at ' .. pos[1]);
s.look.font_size = 18;
MOCK.screen = { 1600, 1200 };
s.window.x, s.window.y = 300, 200;
profiles.save(s, 'Spot');
s.window.x = 400;
profiles.load(s, 'Spot');
check('a profile leaves where the window sits alone', s.window.x == 400);
profiles.delete(s, 'Spot');
reopen();

-- Two columns ----------------------------------------------------------------------------------

-- The tables that hold each tab's sections. Immunities has one section.
local SECTIONS = { '##printout_sections', '##color_sections', '##numbers_sections', '##aggro_sections', '##magic_sections',
    '##drops_sections', '##look_sections', '##profile_sections' };
local function columns()
    local counts = {};
    for _, id in ipairs(SECTIONS) do
        counts[MOCK.gui.tables[id] or 0] = true;
    end
    return (counts[1] and 1 or 0) + (counts[2] and 2 or 0) + (counts[0] and 10 or 0);
end
local TWO_AT = 2 * 480 + 24 + 44;
MOCK.window_size = { 720, 560 };
frame();
check('at 720 wide every tab is one column', columns() == 1, columns());
MOCK.window_size = { TWO_AT - 1, 560 };
frame();
check('one pixel short of two columns, still one', columns() == 1, columns());
MOCK.window_size = { TWO_AT, 560 };
frame();
check(('at %d wide every tab has two'):format(TWO_AT), columns() == 2, columns());
MOCK.avail = 300;
frame();
check('a scrollbar taking room inside doesn\'t change it', columns() == 2, columns());
MOCK.avail = nil;
check('the job links take two columns beside the profiles', MOCK.gui.tables['##job_links'] == 2);
MOCK.window_size = { 1600, 560 };
frame();
check('a wide section puts its colors two to a row, but not the long names', MOCK.gui.tables['##Hit rate'] == 4
    and MOCK.gui.tables['##Difficulty'] == 2);
MOCK.window_size = { TWO_AT, 560 };
frame();
check('a narrow one puts them one to a row', MOCK.gui.tables['##Hit rate'] == 2);
s.look.font_size = 24;
frame();
check('at 24 px the window needs more room for two', columns() == 1, columns());
local two_at_24 = 2 * math.floor(480 * 24 / 18 + 0.5) + 24 + 44;
MOCK.window_size = { two_at_24, 560 };
frame();
check(('and gets two at %d'):format(two_at_24), columns() == 2, columns());
s.look.font_size = 12;
MOCK.window_size = { TWO_AT - 1, 560 };
frame();
check('a smaller font doesn\'t make two columns come sooner', columns() == 1, columns());
MOCK.window_size = { TWO_AT, 560 };
frame();
check('they come at the same width as at 18 px', columns() == 2, columns());
s.look.font_size = 18;
MOCK.window_size = { 700, 560 };
frame();
check('at the smallest width the colors are one to a row and the job links three', MOCK.gui.tables['##Hit rate'] == 2
    and MOCK.gui.tables['##job_links'] == 3);
check('and the name section keeps two to a line', MOCK.gui.names['Indent'] == true);
MOCK.window_size = nil;
reopen();

-- The X closes it.
MOCK.close_x = true;
frame();
check('the X closes the window', not window.is_open());
frame();
check('and it makes no calls', #MOCK.gui.calls == 0);

-- A frame that fails stops checkmate and says so once. /checkmate starts it again.
MOCK.command('/checkmate');
cur().look.imgui = nil;
n = #MOCK.printed;
MOCK.frame();
MOCK.frame();
lines = MOCK.printed_since(n);
check('a failed frame says so once', #lines == 1 and lines[1]:find('^%[checkmate%] Stopped after an error: ') ~= nil,
    table.concat(lines, ' / '));
-- The first /checkmate reset only says what it does. The second one does it.
MOCK.command('/checkmate reset');
MOCK.command('/checkmate reset');
check('reset puts the window back where it started, at its first size', cur().window.x == 120 and cur().window.y == 20
    and cur().window.width == 720 and cur().window.height == 560);
MOCK.command('/checkmate');
check('/checkmate closes the window and starts checkmate again', not window.is_open());
MOCK.command('/checkmate');
n = #MOCK.printed;
frame();
check('so it draws again', window.is_open() and #MOCK.gui.calls > 100 and #MOCK.printed == n);

-- A reset or another character logging in moves the open window to the new settings' spot and size.
-- ImGui leaves an open window where it is otherwise, and its old spot would save over the new one.
MOCK.window_pos, MOCK.window_size = { 600, 300 }, { 900, 700 };
frame();
MOCK.window_pos, MOCK.window_size = nil, nil;
check('the window was moved and resized', cur().window.x == 600 and cur().window.width == 900);
MOCK.command('/checkmate reset');
MOCK.command('/checkmate reset');
frame();
check('a reset with it open puts it back at once', MOCK.gui.next_pos_cond == ImGuiCond_Always
    and MOCK.gui.next_pos[1] == 120 and MOCK.gui.next_pos[2] == 20);
frame();
check('and the old spot and size don\'t save over the reset', cur().window.x == 120 and cur().window.y == 20
    and cur().window.width == 720 and cur().window.height == 560 and MOCK.gui.next_pos_cond == ImGuiCond_Appearing,
    ('%d, %d, %d x %d'):format(cur().window.x, cur().window.y, cur().window.width, cur().window.height));
MOCK.settings.switch_character({ window = { x = 10, y = 10, width = 800, height = 600 } });
frame();
frame();
check('another character logging in moves it to that character\'s spot and size', cur().window.x == 10
    and cur().window.y == 10 and cur().window.width == 800 and cur().window.height == 600,
    ('%d, %d, %d x %d'):format(cur().window.x, cur().window.y, cur().window.width, cur().window.height));

-- Nothing after the load event loaded a font, not a frame, a click or a command.
check('every font loaded during the load event', #MOCK.font_calls == loads and #MOCK.stray_font_loads() == 0,
    table.concat(MOCK.stray_font_loads(), ', '));

return MOCK.report();
