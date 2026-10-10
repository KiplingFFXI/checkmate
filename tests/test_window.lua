-- Draws the settings window through the recorded imgui. Every tab draws with real functions and balanced
-- calls, and every control edits its setting, the Overlay tab's included. It also covers what saves when, what
-- tells the overlay a setting changed before it saves, every window color, the font and its size, a missing
-- font, fonts that failed to load, fonts only loading on the load event, the window size, and a frame error.
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
local wide_matrix = true;
local function frame()
    if wide_matrix then MOCK.avail = 1100; end
    local panel = require('ui.settings_window');
    panel.folded = panel.folded or {};
    panel.folded['Display/CHAT FORMAT'], panel.folded['Display/OVERLAY OPTIONS'] = true, true;
    panel.folded['Numbers/ADVANCED'], panel.folded['Appearance/OVERLAY APPEARANCE'] = true, true;
    local n = #MOCK.printed;
    MOCK.frame();
    for _, line in ipairs(MOCK.printed_since(n)) do
        if (line:find('Stopped after an error', 1, true)) then error(line); end
    end
end
-- One frame with the mouse over every (?), so each one draws its tip. Returns the tips by path.
local function tips()
    MOCK.hover = true;
    local found = require('capture_row_tips')(frame);
    MOCK.hover = false;
    return found;
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
check('and it first opens at the saved 840 width without forcing one tab row', MOCK.gui.next_size[1] == 840 and MOCK.gui.next_size[2] == 560,
    MOCK.gui.next_size[1]);
local all = true;
for _, tab in ipairs({ 'Display', 'Numbers', 'Aggro', 'Magic', 'Blue Magic', 'Weaknesses', 'Pets',
    'Monster', 'Drops', 'Effects', 'Abbreviations', 'Appearance', 'Profiles' }) do
    all = all and MOCK.gui.tabs[tab] == true;
    check(tab .. ' tab has controls', widgets(tab .. '/') > 0, widgets(tab .. '/'));
end
check('all thirteen tabs draw', all);
check('old tabs are gone', not MOCK.gui.tabs.Diagnostics and not MOCK.gui.tabs.Immunities);
check('the version is in the subtitle', MOCK.drew('v' .. addon.version));

-- Tips ------------------------------------------------------------------------------------------

-- Every control has a (?) right after it, or at the end of its row. A row of the parts, schools,
-- immunities or cutoffs tables shares one. The profile list and the job links share their heading's. A row
-- of the overlay's parts has its (?) after the part's name.
local OVERLAY_ROWS = { name = 'Name and level', difficulty = 'Difficulty', reading = 'Evasion and defense', crit = 'Crit',
    block = 'Shield block', parry = 'Parry',
    pdif = 'pDIF', offhandpdif = 'Off-hand pDIF', rangedpdif = 'Ranged pDIF',
    crittaken = 'Crit taken', job = 'Job', aggro = 'Aggro', links = 'Links', magic = 'Magic',
    effects = 'Effects', weaknesses = 'Weaknesses', drops = 'Drops', steal = 'Steal', pet = 'Pet' };
for _, section in ipairs(require('core.parts').INFO) do
    if (section.id ~= 'charm') then OVERLAY_ROWS[section.id] = section.label; end
end

local SHARED_TIPS = {
    { '^Display/([%w_]+)/[^/]+$', function(id) return 'Display/' .. id .. '/##row_tip'; end },
    { '^Overlay/([%w_]+)/##on$',    function (id) return 'Display/overlay_options/' .. id .. '/' .. (OVERLAY_ROWS[id] or '?'); end },
    { '^Printout/reading/.*$',      'Display/chat_format/Defense first' },
    { '^Printout/([%w_]+)/.*$',     'Display/chat_format/%1/##down' },
    { '^Magic/([%w_]+)/.*$',        'Magic/%1/##spell' },
    { '^Weaknesses/([%w_]+)/##on$',   'Weaknesses/%1/##label' },
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
check('Blue Magic help separates possible lessons, learned spells and unresolved lists',
    has(all_tips['Blue Magic/components/lessons/##chat'], 'Possible learnable moves')
    and has(all_tips['Blue Magic/components/lessons/##chat'], 'known or not learned')
    and has(all_tips['Blue Magic/components/lessons/##chat'], 'resolved move list has none')
    and has(all_tips['Blue Magic/components/lessons/##chat'], 'Hover for the reason'));
check('Dangers help describes a source overview without promising safety',
    has(all_tips['Monster/dangers/Dangers'], 'Moves that can inflict debuffs or crit')
    and has(all_tips['Monster/dangers/Dangers'], 'does not predict the next move')
    and has(all_tips['Monster/dangers/Dangers'], 'Missing or unresolved moves can leave gaps')
    and has(all_tips['Monster/dangers/Dangers'], 'does not mean the monster is safe'));
local untipped, controls = {}, 0;
for path, widget in pairs(MOCK.gui.paths) do
    if (CONTROLS[widget]) then
        controls = controls + 1;
        if (not all_tips[tip_owner(path)]) then untipped[#untipped + 1] = path; end
    end
end
table.sort(untipped);
check('every control has help or a shared row hover', controls > 250 and #untipped == 0, controls .. ' controls, no help: '
    .. table.concat(untipped, ', '));
local bad_tips = {};
for owner in pairs(MOCK.gui.helps) do
    local each = all_tips[owner] or '';
    if (each == '' or each:find('[^\32-\126]') or each:sub(-1) ~= '.') then bad_tips[#bad_tips + 1] = owner; end
end
check('and every (?) shows a tip in plain text that ends a sentence', #bad_tips == 0, table.concat(bad_tips, ', '));

-- How many (?) marks each tab has with the default settings.
local TIP_COUNTS = { Display = 41, Appearance = 184, Numbers = 43, Aggro = 8, Magic = 10,
    ['Blue Magic'] = 12, Weaknesses = 36, Pets = 7, Monster = 37, Drops = 6, Effects = 5, Abbreviations = 162, Profiles = 14 };

for tab, want in pairs(TIP_COUNTS) do
    local count = 0;
    for owner in pairs(MOCK.gui.helps) do
        if (owner:sub(1, #tab + 1) == tab .. '/') then count = count + 1; end
    end
    check(('the %s tab has %d tips'):format(tab, want), count == want, count);
end
check('a chat color\'s tip says what it paints', has(all_tips['Appearance/##aggro_safe'], 'Too weak, Not aggressive and Never '
    .. 'aggressive') and has(all_tips['Appearance/##too_weak'], 'Too Weak while Color by difficulty is on.'));
check('a window color\'s tip says what it paints', has(all_tips['Appearance/Open dropdowns##dropdowns'], 'these tips'));
check('and Open dropdowns says it paints the overlay\'s tips too', has(all_tips['Appearance/Open dropdowns##dropdowns'],
    'these tips and the overlay\'s tips.'), all_tips['Appearance/Open dropdowns##dropdowns']);
check('and Text says it paints their words', has(all_tips['Appearance/Text##text'], 'the words in the overlay\'s tips.'),
    all_tips['Appearance/Text##text']);
check('and the ones the overlay takes say so', has(all_tips['Appearance/Background##background'], 'and the overlay\'s.')
    and has(all_tips['Appearance/Border##border'], 'around the window and the overlay.')
    and has(all_tips['Appearance/Corner roundness'], 'the window, its boxes, the overlay and its badges'));
check('a part\'s tip says what it prints', has(all_tips['Display/crit/##row_tip'], 'your DEX against the monster\'s AGI')
    and has(all_tips['Display/chat_format/Defense first'], 'Defense first puts defense before evasion.'));
check('an immunity\'s tip says what it covers', has(all_tips['Weaknesses/light_sleep/##label'], 'Foe Lullaby, Horde '
    .. 'Lullaby, Sheep Song and Yawn') and has(all_tips['Weaknesses/bind/##label'], 'Untick On to leave it out.'));
check('a school\'s tip says what its chance means', has(all_tips['Magic/elemental/##spell'], 'resists least'));

-- No text in the window runs past 100 characters. A tab whose part is off says so in one sentence.
local long = {};
frame();
for _, each in ipairs(MOCK.gui.texts) do
    if (#each > 100 and not each:find('v' .. addon.version, 1, true) and not each:find('^- Keeps your colors')) then long[#long + 1] = each; end
end
check('no text in the window runs past 100 characters, apart from the subtitle', #long == 0, table.concat(long, ' / '));
check('a part that\'s off says so on its tab', MOCK.drew('Enable Drops in Display to show it.')
    and MOCK.drew('Enable Magic in Display') and MOCK.drew('One line combines the components you choose for each display.')
    and not MOCK.drew('The Immunities part is off') and not MOCK.drew('Enable Aggro in Display')
    and not MOCK.drew('Enable Links in Display'));
cur().printout.parts.links.on = false;
frame();
check('the Aggro tab says when Links is off, under LINKS', MOCK.drew('Links is selected for the overlay. Turn on the overlay to see it.')
    and not MOCK.drew('Aggro is selected for the overlay.'));
cur().printout.parts.links.on, cur().printout.parts.aggro.on = true, false;
frame();
check('and when Aggro is off but not Links', MOCK.drew('Aggro is selected for the overlay. Turn on the overlay to see it.')
    and not MOCK.drew('Links is selected for the overlay.'));
cur().printout.parts.aggro.on = true;
cur().printout.parts.drops.on = true;
frame();
check('and stops once it\'s on', not MOCK.drew('Enable Drops in Display'));
cur().printout.parts.drops.on = false;
cur().overlay.parts.drops = true;
frame();
check('a selected overlay row explains that the whole overlay is off',
    MOCK.drew('Drops is selected for the overlay. Turn on the overlay to see it.'));
cur().overlay.on = true;
frame();
check('but it does once the overlay is on', not MOCK.drew('Enable Drops in Display')
    and MOCK.drew('Enable Magic in Display') and not MOCK.drew('The Elements part is off'));
cur().overlay.on, cur().overlay.parts.drops = false, false;
cur().grades.on = false;
frame();
check('the Numbers tab says when grade colors are off', MOCK.drew('Grade colors are off, so turn them on in the Appearance '
    .. 'tab to use these.') and MOCK.gui.disabled['Numbers/##hit_ok'] == true);
cur().grades.on = true;
frame();
check('and stops once they\'re on', not MOCK.drew('Grade colors are off') and not MOCK.gui.disabled['Numbers/##hit_ok']);

-- Printout tab ----------------------------------------------------------------------------------

local s = cur();
check('the name part has Show level and no arrows', MOCK.gui.paths['Display/chat_format/Show level'] == 'Checkbox'
    and MOCK.gui.paths['Display/name/##up'] == nil);
check('the first part can\'t go up, the last can\'t go down', MOCK.gui.disabled['Display/difficulty/##up']
    and MOCK.gui.disabled['Display/pet/##down'] and not MOCK.gui.disabled['Display/difficulty/##down']
    and not MOCK.gui.disabled['Display/drops/##down']);
local drawn = {};
for _, text in ipairs(MOCK.gui.texts) do drawn[text] = true; end
check('the parts table names the parts and the reading', drawn['Difficulty'] and drawn['Evasion and defense']);
check('Aggro has its row after Crit, on', drawn['Aggro'] and MOCK.gui.paths['Display/aggro/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Display/aggro/##label'] == 'InputText' and MOCK.gui.paths['Display/aggro/##new_line'] == 'Checkbox'
    and cur().printout.parts.aggro.on == true);
check('Links has its row right after Aggro, on, with no label and no New line', drawn['Links']
    and MOCK.gui.paths['Display/links/##chat'] == 'Checkbox' and MOCK.gui.paths['Display/links/##label'] == 'InputText'
    and MOCK.gui.paths['Display/links/##new_line'] == 'Checkbox' and MOCK.gui.paths['Display/links/##up'] == 'ArrowButton'
    and cur().printout.parts.links.on == true and cur().printout.parts.links.label == ''
    and cur().printout.parts.links.new_line == false and cur().printout.order:find(' aggro links ', 1, true) ~= nil,
    cur().printout.order);
check('and its tip says what it shows and where it starts', has(all_tips['Display/links/##row_tip'], 'like "Links with '
    .. 'Goblin Thug (Sight)", or "Doesn\'t link".') and has(all_tips['Display/links/##row_tip'], 'By default it comes right '
    .. 'after Aggro, on Aggro\'s line.') and has(all_tips['Display/links/##row_tip'], 'While it comes right after Aggro and '
    .. 'Aggro is off') and not has(all_tips['Display/aggro/##row_tip'], 'links'), all_tips['Display/links/##row_tip']);
check('Pet has the last row, off, on its own line', drawn['Pet'] and MOCK.gui.paths['Display/pet/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Display/pet/##label'] == 'InputText' and MOCK.gui.paths['Display/pet/##new_line'] == 'Checkbox'
    and cur().printout.parts.pet.on == false and cur().printout.parts.pet.new_line == true
    and cur().printout.parts.pet.label == 'Pet' and cur().printout.order:find(' pet$') ~= nil);
check('Off-hand and Ranged have their rows right after Hit rate, off', drawn['Off-hand'] and drawn['Ranged']
    and MOCK.gui.paths['Display/offhand/##chat'] == 'Checkbox' and MOCK.gui.paths['Display/offhand/##label'] == 'InputText'
    and MOCK.gui.paths['Display/ranged/##new_line'] == 'Checkbox' and cur().printout.parts.offhand.on == false
    and cur().printout.parts.ranged.on == false and cur().printout.order:find('^difficulty hit pdif offhand offhandpdif ranged rangedpdif evade ') ~= nil);
check('with their tips', has(all_tips['Display/offhand/##row_tip'], 'only shows while you have a weapon in each hand')
    and has(all_tips['Display/ranged/##row_tip'], 'The number is your hit rate in your weapon\'s sweet spot')
    and has(all_tips['Display/ranged/##row_tip'], 'past 25 yalms you\'re too far away to shoot')
    and has(all_tips['Display/hit/##row_tip'], 'move Hit rate, Off-hand, Ranged, Evade and Crit to the bottom')
    and has(all_tips['Display/pet/##row_tip'], 'with Hit rate or Evade on, or Off-hand or Ranged while you have that weapon on.'));
check('Steal has its row right after Drops, off, on its own line', drawn['Steal']
    and MOCK.gui.paths['Display/steal/##chat'] == 'Checkbox' and MOCK.gui.paths['Display/steal/##label'] == 'InputText'
    and MOCK.gui.paths['Display/steal/##new_line'] == 'Checkbox' and MOCK.gui.paths['Display/steal/##up'] == 'ArrowButton'
    and MOCK.gui.paths['Display/steal/##down'] == 'ArrowButton' and cur().printout.parts.steal.on == false
    and cur().printout.parts.steal.new_line == true and cur().printout.parts.steal.label == 'Steal'
    and cur().printout.order:find(' drops steal pet$') ~= nil, cur().printout.order);
check('and its tip gives the roll, says when it only names the item, what it can\'t know and what the 75% is of',
    has(all_tips['Display/steal/##row_tip'], 'plus 2% for each point of Steal on your gear, plus 1% for each of your THF '
    .. 'levels, minus 1% for each of the monster\'s levels.')
    and has(all_tips['Display/steal/##row_tip'], 'On a job without THF, or before THF 5, you can\'t use Steal, so it only '
    .. 'names the item.') and has(all_tips['Display/steal/##row_tip'], 'or when the item is Rare and you already have one.')
    and has(all_tips['Display/steal/##row_tip'], 'That 75% is of your max HP before gear and food.')
    and has(all_tips['Display/steal/##row_tip'], 'the chance covers both Ring outcomes and gets a ~.'),
    all_tips['Display/steal/##row_tip']);
check('Job has its row right after Crit taken, off, on its own line', drawn['Job']
    and MOCK.gui.paths['Display/job/##chat'] == 'Checkbox' and MOCK.gui.paths['Display/job/##label'] == 'InputText'
    and MOCK.gui.paths['Display/job/##new_line'] == 'Checkbox' and MOCK.gui.paths['Display/job/##up'] == 'ArrowButton'
    and MOCK.gui.paths['Display/job/##down'] == 'ArrowButton' and cur().printout.parts.job.on == false
    and cur().printout.parts.job.new_line == true and cur().printout.parts.job.label == 'Job'
    and cur().printout.order:find(' crit crittaken job aggro ', 1, true) ~= nil, cur().printout.order);
check('and its tip gives the support job rule and says when it\'s left out', has(all_tips['Display/job/##row_tip'],
    'The support job only shows when it\'s a different job, so a DRK with a DRK support job says DRK.')
    and has(all_tips['Display/job/##row_tip'], 'It\'s left out for a monster Phoenix\'s data gives no job, though the '
    .. 'server runs it as a WAR.') and has(all_tips['Display/job/##row_tip'], 'It\'s also left out for a monster '
    .. 'checkmate has no data for'), all_tips['Display/job/##row_tip']);
check('Crit explains melee hits and separate ranged stats',
    has(all_tips['Display/crit/##row_tip'], 'melee hits are critical hits, out of the ones that land')
    and has(all_tips['Display/crit/##row_tip'], 'Ranged attacks use different stats.'));
local saves = MOCK.saved;
MOCK.clicks['Display/evade/##up'] = true;
frame();
check('Up moves a part', s.printout.order == 'difficulty hit pdif offhand offhandpdif ranged evade rangedpdif block parry crit crittaken job aggro links magic '
    .. 'weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet', s.printout.order);
check('and saves at once', MOCK.saved == saves + 1);
for _ = 1, 6 do
    MOCK.clicks['Display/evade/##up'] = true;
    frame();
end
frame();
check('the rows follow the order', MOCK.gui.disabled['Display/evade/##up'] and not MOCK.gui.disabled['Display/difficulty/##up']);
MOCK.clicks['Display/difficulty/##up'] = true;
frame();

-- The reading's row sits under Difficulty with its On box and Defense first, and no arrows or label.
check('the reading has an On box and Defense first', MOCK.gui.paths['Display/reading/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Display/chat_format/Defense first'] == 'Checkbox' and MOCK.gui.paths['Display/reading/##up'] == nil
    and MOCK.gui.disabled['Display/reading/##label'] == true);
saves = MOCK.saved;
MOCK.clicks['Display/reading/##chat'] = true;
MOCK.clicks['Display/chat_format/Defense first'] = true;
frame();
check('they turn the reading off and defense first on, and save', s.printout.parts.reading.on == false
    and s.printout.defense_first == true and MOCK.saved == saves + 1);
MOCK.clicks['Display/reading/##chat'] = true;
MOCK.clicks['Display/chat_format/Defense first'] = true;
frame();
check('and back', s.printout.parts.reading.on == true and s.printout.defense_first == false);

MOCK.clicks['Display/drops/##chat'] = true;
frame();
check('a part\'s On box', s.printout.parts.drops.on == true);

saves = MOCK.saved;
MOCK.typing['Display/hit/##label'] = 'H\195\169t\226\128\148!';
frame();
check('a label keeps printable ASCII only', s.printout.parts.hit.label == 'Ht!', s.printout.parts.hit.label);
check('typing doesn\'t save', MOCK.saved == saves);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the box saves', MOCK.saved == saves + 1);

check('the Divider list shows Star and no custom box', MOCK.gui.previews['Display/chat_format/Divider'] == 'Star'
    and MOCK.gui.paths['Display/chat_format/Custom text'] == nil, MOCK.gui.previews['Display/chat_format/Divider']);
MOCK.open['Display/chat_format/Divider'] = true;
frame();
local names = {};
for _, divider in ipairs(printout.DIVIDERS) do
    if (MOCK.gui.paths['Display/chat_format/Divider/' .. divider.name] == 'Selectable') then names[#names + 1] = divider.name; end
end
check('it offers every divider by name', #names == #printout.DIVIDERS, table.concat(names, ', '));
saves = MOCK.saved;
MOCK.clicks['Display/chat_format/Divider/Custom'] = true;
frame();
check('picking Custom saves at once', s.printout.divider == 'custom' and MOCK.saved == saves + 1);
frame();
check('and shows the custom box', MOCK.gui.paths['Display/chat_format/Custom text'] == 'InputText');
MOCK.typing['Display/chat_format/Custom text'] = ' \226\128\162 | ';
frame();
check('the custom text keeps printable ASCII only', s.printout.separator == '  | ', s.printout.separator);
MOCK.clicks['Display/chat_format/Divider/Two spaces'] = true;
frame();
frame();
check('Two spaces hides the box again', s.printout.divider == 'spaces' and MOCK.gui.paths['Display/chat_format/Custom text'] == nil);
MOCK.open['Display/chat_format/Divider'] = nil;

-- The label divider's list and its own custom box, next to the divider's.
check('the Label divider list shows Colon and no custom box', MOCK.gui.previews['Display/chat_format/Label divider'] == 'Colon :'
    and MOCK.gui.paths['Display/chat_format/Custom text##label'] == nil, MOCK.gui.previews['Display/chat_format/Label divider']);
MOCK.open['Display/chat_format/Label divider'] = true;
frame();
names = {};
for _, divider in ipairs(printout.LABEL_DIVIDERS) do
    if (MOCK.gui.paths['Display/chat_format/Label divider/' .. divider.name] == 'Selectable') then names[#names + 1] = divider.name; end
end
check('it offers every label divider by name', #names == #printout.LABEL_DIVIDERS and #names == 14, table.concat(names, ', '));
saves = MOCK.saved;
MOCK.clicks['Display/chat_format/Label divider/Custom'] = true;
frame();
check('picking Custom saves at once', s.printout.label_divider == 'custom' and MOCK.saved == saves + 1);
frame();
check('and shows its own custom box', MOCK.gui.paths['Display/chat_format/Custom text##label'] == 'InputText'
    and MOCK.gui.paths['Display/chat_format/Custom text'] == nil);
MOCK.typing['Display/chat_format/Custom text##label'] = ' \226\128\162>';
frame();
check('its text keeps printable ASCII only', s.printout.label_separator == ' >', s.printout.label_separator);
local n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('and the sample prints it with a space after', table.concat(MOCK.printed_since(n), ' / '):find('[checkmate] Aggro > '
    .. 'Aggressive (Sight)  Links with', 1, true) ~= nil, table.concat(MOCK.printed_since(n), ' / '));
MOCK.clicks['Display/chat_format/Label divider/Space only'] = true;
frame();
frame();
check('Space only hides the box again', s.printout.label_divider == 'space'
    and MOCK.gui.paths['Display/chat_format/Custom text##label'] == nil);
MOCK.clicks['Display/chat_format/Label divider/Colon :'] = true;
frame();
check('and Colon', s.printout.label_divider == 'colon');
MOCK.open['Display/chat_format/Label divider'] = nil;
local tip = tips();
check('the tips say a label can be your own word and what the label divider is', has(tip['Display/DISPLAY'], 'same row order and labels') and has(tip['Display/chat_format/Label divider'], 'like the colon in "Aggro: '
    .. 'Aggressive"') and not MOCK.drew('Type your own word'));

MOCK.clicks['Display/chat_format/Show level'] = true;
MOCK.clicks['Display/drops/##new_line'] = true;
MOCK.clicks['Display/chat_format/[checkmate] at the start of each line'] = true;
frame();
check('Show level, New line and the header boxes', s.printout.show_level == false and s.printout.parts.drops.new_line == false
    and s.printout.header == false);
MOCK.clicks['Display/chat_format/Show level'] = true;
MOCK.clicks['Display/drops/##new_line'] = true;
MOCK.clicks['Display/chat_format/[checkmate] at the start of each line'] = true;
frame();

-- The level range box sits next to Show level, and its word box next to the name's label.
local RANGE, WORD = 'Display/chat_format/Show its level range too', 'Display/chat_format/Range word';
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
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('the sample shows the range with the word trimmed', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample Goblin '
    .. '%(Lv 42, spawns 40%-44%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.typing[WORD] = '';
frame();
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('and with the word cleared', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample Goblin %(Lv 42, 40%-44%)') ~= nil,
    MOCK.printed_since(n)[1]);
MOCK.clicks['Display/chat_format/Show level'] = true;
frame();
frame();
check('Show level off greys out both', s.printout.show_level == false and MOCK.gui.disabled[RANGE] == true
    and MOCK.gui.disabled[WORD] == true);
MOCK.clicks['Display/chat_format/Show level'] = true;
MOCK.clicks[RANGE] = true;
MOCK.typing[WORD] = 'range';
frame();
check('and back', s.printout.show_level == true and s.printout.show_range == false and s.printout.range_word == 'range');

-- Show its ID sits under the range word, with its own word box beside it.
local SHOW_ID, ID_WORD = 'Display/chat_format/Show its ID', 'Display/chat_format/ID word';
frame();
check('Show its ID is a box, off, with a greyed word box', MOCK.gui.paths[SHOW_ID] == 'Checkbox'
    and s.printout.show_id == false and not MOCK.gui.disabled[SHOW_ID] and MOCK.gui.paths[ID_WORD] == 'InputText'
    and MOCK.gui.disabled[ID_WORD] == true);
tip = tips();
check('with their tips', has(tip[SHOW_ID], 'like (ID 17199202).') and has(tip[ID_WORD], 'Clear it to get (17199202).'));
check('and Show the name\'s tip says the ID and PH note go with it', has(tip['Display/chat_format/Show the name##name'],
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
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('the sample shows the ID with the word trimmed', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample Goblin '
    .. '%(Lv 42%) %(Mob ID 17199202%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.clicks['Display/chat_format/Show level'] = true;
frame();
frame();
check('Show level off leaves both live', s.printout.show_level == false and not MOCK.gui.disabled[SHOW_ID]
    and not MOCK.gui.disabled[ID_WORD]);
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('and the sample shows the ID right after the name', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample '
    .. 'Goblin %(Mob ID 17199202%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.clicks['Display/chat_format/Show level'] = true;
MOCK.clicks[SHOW_ID] = true;
MOCK.typing[ID_WORD] = 'ID';
frame();
check('and back', s.printout.show_level == true and s.printout.show_id == false and s.printout.id_word == 'ID');

-- Show if it's a PH sits under Show its ID, with its own word box beside it.
local SHOW_PH, PH_WORD = 'Display/chat_format/Show if it\'s a PH', 'Display/chat_format/PH word';
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
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('the sample shows the PH note with the word trimmed', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Sample '
    .. 'Goblin %(Lv 42%) %(PH: Valkurm Emperor%)') ~= nil, MOCK.printed_since(n)[1]);
MOCK.clicks[SHOW_PH] = true;
MOCK.typing[PH_WORD] = 'PH for';
frame();
check('and back', s.printout.show_ph == false and s.printout.ph_word == 'PH for');

-- The overlay uses the same three words, so their boxes are live while it's on and shows them, even with the
-- chat's switches off.
s.overlay.on, s.overlay.show_range, s.overlay.show_id, s.overlay.show_ph = true, true, true, true;
frame();
check('the overlay showing the range, ID and PH note keeps their word boxes live', not MOCK.gui.disabled[WORD]
    and not MOCK.gui.disabled[ID_WORD] and not MOCK.gui.disabled[PH_WORD]);
s.overlay.show_level = false;
frame();
check('the overlay\'s Show level off greys the range word only', MOCK.gui.disabled[WORD] == true
    and not MOCK.gui.disabled[ID_WORD] and not MOCK.gui.disabled[PH_WORD]);
s.overlay.on, s.overlay.show_level = false, true;
frame();
check('and with the overlay off they\'re greyed again', MOCK.gui.disabled[WORD] == true and MOCK.gui.disabled[ID_WORD] == true
    and MOCK.gui.disabled[PH_WORD] == true);
s.overlay.show_range, s.overlay.show_id, s.overlay.show_ph = false, false, false;

MOCK.open['Display/chat_format/Number ranges'] = true;
MOCK.clicks['Display/chat_format/Number ranges/Middle ~68%'] = true;
frame();
check('the Number ranges list', s.printout.number_style == 'midpoint');
MOCK.open['Display/chat_format/Number ranges'] = nil;

MOCK.typing['Display/chat_format/Label##name'] = 'Mob:';
frame();
check('the name label box', s.printout.parts.name.label == 'Mob:');
MOCK.typing['Display/chat_format/Label##name'] = '';
frame();

s.printout.parts.hit.on = true;
s.printout.parts.evade.on = true;
MOCK.command('/checkmate linkfamilies off');
local n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
local lines = MOCK.printed_since(n);
check('Print a sample prints in the new order and labels', #lines == 4 and lines[1] == '[checkmate] Sample Goblin (Lv 42)  '
    .. 'Decent Challenge (Low Defense)' and lines[2] == '[checkmate] Evade: 31% with Signet  Ht!: ~68%'
    and lines[3] == '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Butcher (Sight), Goblin Leecher (Sight), '
    .. 'Goblin Tinkerer (Sight)'
    and lines[4]:find('^%[checkmate%] Drops') ~= nil, table.concat(lines, ' / '));

check('Put the extras on their own line is a box under the parts', MOCK.gui.paths['Display/chat_format/Put the extras on their own line']
    == 'Checkbox' and has(tips()['Display/chat_format/Put the extras on their own line'], 'With this on, combat numbers, Job, Aggro, Links, Magic, Weaknesses, Effects, monster detail rows, '
    .. 'Drops, Steal and Pet never share a line with the name and difficulty.'));
saves = MOCK.saved;
MOCK.clicks['Display/chat_format/Put the extras on their own line'] = true;
frame();
check('it turns off and saves', s.printout.extras_own_line == false and MOCK.saved == saves + 1);
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
lines = MOCK.printed_since(n);
check('and the sample shows it', #lines == 3 and lines[1] == '[checkmate] Sample Goblin (Lv 42)  '
    .. 'Decent Challenge (Low Defense)  Evade: 31% with Signet  Ht!: ~68%' and lines[2]:find('^%[checkmate%] Aggro') ~= nil
    and lines[3]:find('^%[checkmate%] Drops') ~= nil, table.concat(lines, ' / '));
MOCK.clicks['Display/chat_format/Put the extras on their own line'] = true;
frame();
check('and back on', s.printout.extras_own_line == true);

check('Replace the game\'s /check line is a box, on', MOCK.gui.paths['Display/chat_format/Replace the game\'s /check line'] == 'Checkbox'
    and s.printout.replace_game_line == true and has(tips()['Display/chat_format/Replace the game\'s /check line'], 'checkmate\'s lines '
    .. 'take its place'));
saves = MOCK.saved;
MOCK.clicks['Display/chat_format/Replace the game\'s /check line'] = true;
frame();
check('it turns off and saves', s.printout.replace_game_line == false and MOCK.saved == saves + 1);
MOCK.clicks['Display/chat_format/Replace the game\'s /check line'] = true;
frame();
check('and back on', s.printout.replace_game_line == true);

-- Overlay tab -----------------------------------------------------------------------------------

local o = s.overlay;
local function overlay_path(label)
    if label:match('^Font') or label:match('^Background') or label:match('^Border') or label:match('^Wrap lines wider than') then
        return 'Appearance/overlay_appearance/' .. label;
    end
    return 'Display/overlay_options/' .. label;
end
-- The tabs and the overlay's part rows in the order they draw.
local imgui = require('imgui');
local draw_page, push_id = window.draw_page, imgui.PushID;
local tab_order, part_rows, in_tab = {}, {}, nil;
window.draw_page = function (tab, settings)
    tab_order[#tab_order + 1], in_tab = tab[1], tab[1];
    draw_page(tab, settings);
    in_tab = nil;
end;
imgui.PushID = function (id)
    if (in_tab == 'Display' and s.printout.parts[id] ~= nil) then part_rows[#part_rows + 1] = id; end
    return push_id(id);
end
frame();
window.draw_page, imgui.PushID = draw_page, nil;
check('settings tabs draw in their requested order', table.concat(tab_order, ',')
    == 'Display,Numbers,Aggro,Magic,Blue Magic,Weaknesses,Pets,Monster,Drops,Effects,Abbreviations,Appearance,Profiles',
    table.concat(tab_order, ','));
local rows_want = { 'name', 'difficulty', 'reading' };
for id in s.printout.order:gmatch('%S+') do
    if (id ~= 'difficulty') then rows_want[#rows_want + 1] = id; end
end
check('its parts table has Name, Difficulty and the reading first, then the rest in the chat\'s order',
    table.concat(part_rows, ',') == table.concat(rows_want, ',') and #part_rows == #require('core.parts').ORDER + 2, table.concat(part_rows, ','));
check('the overlay is off, with its controls there to set up first', o.on == false
    and MOCK.gui.paths[overlay_path('Show the overlay')] == 'Checkbox' and not MOCK.gui.disabled[overlay_path('Lock it in place')]
    and MOCK.gui.paths[overlay_path('Move it back')] == 'Button' and MOCK.gui.paths[overlay_path('Divider')] == 'BeginCombo'
    and MOCK.gui.paths[overlay_path('Font')] == 'BeginCombo' and MOCK.gui.paths[overlay_path('Font size')] == 'Slider'
    and MOCK.gui.paths[overlay_path('Background')] == 'Slider' and MOCK.gui.paths[overlay_path('Wrap lines wider than')] == 'Slider');
check('its sliders show their units', MOCK.gui.formats[overlay_path('Font size')] == '%d px'
    and MOCK.gui.formats[overlay_path('Background')] == '%d%%' and MOCK.gui.formats[overlay_path('Wrap lines wider than')] == '%d px');
check('and it says what else hides it, the sample and how Shift moves it', MOCK.drew('The overlay also hides while you '
    .. 'zone, when your target isn\'t a monster, and when it dies near you.') and MOCK.drew('With this window open, it shows '
    .. 'a sample goblin when no monster is targeted.') and MOCK.drew('Unless it\'s locked, hold Shift and drag it to move '
    .. 'it, or drag its corner to change its width.'));
tip = tips();
check('its tips say what it reads and never sends', has(tip[overlay_path('OVERLAY')], 'It never sends anything on its own. You /check '
    .. 'yourself, and it reads the reply.') and has(tip[overlay_path('Show the overlay')], 'while it\'s off checkmate doesn\'t read '
    .. 'your target at all.') and has(tip[overlay_path('Lock it in place')], 'This stops both, so neither happens by accident. '
    .. 'Without Shift, or with this on, clicks go through the overlay to the game.'));
check('checked-stat rows explain their manual refresh', has(tip['Display/hit/##overlay_tip'], 'manual /check') and has(tip['Display/aggro/##overlay_tip'], 'Before you /check it, it goes by the monster\'s level '
    .. 'against yours') and has(tip['Display/links/##overlay_tip'], 'like the chat\'s Links part. It comes from the data, so it shows '
    .. 'as soon as you target the monster.'));
check('and Put each part on its own line says Links stays on Aggro\'s line', has(tip[overlay_path('Put each part on its own line')],
    'Links stays on Aggro\'s line when it comes right after it.'), tip[overlay_path('Put each part on its own line')]);
check('crit and magic explain automatic refresh',
    has(tip['Display/crit/##overlay_tip'], 'It refreshes when your stats, gear or buffs change.')
    and has(tip['Display/magic/##overlay_tip'], 'It refreshes when your skills, stats, gear, buffs or observed monster effects change.')
    and has(tip['Display/magic/##overlay_tip'], 'Hover a school to see the spell'));
check('steal explains automatic refresh and the ring HP limit',
    has(tip['Display/steal/##overlay_tip'], 'It refreshes when your jobs, gear, HP or TP change.')
    and has(tip['Display/steal/##overlay_tip'], 'HP before gear and food')
    and has(tip['Display/steal/##overlay_tip'], 'base HP is unknown or Level Sync can leave it out of date')
    and has(tip['Display/steal/##overlay_tip'], 'item being available'), tip['Display/steal/##overlay_tip']);
check('the Job row says it shows before a /check, with each job\'s artifact head', has(tip['Display/job/##overlay_tip'], 'It comes '
    .. 'from the data, so it shows as soon as you target the monster.') and has(tip['Display/job/##overlay_tip'], 'each job has its '
    .. 'artifact head in front, the game\'s own picture, like the Fighter\'s Mask for WAR.'), tip['Display/job/##overlay_tip']);
check('Move it back\'s tip says the lock stops the drag', has(tip[overlay_path('Move it back')], 'or hold Shift and drag it unless '
    .. 'it\'s locked.'));
check('and the wrap\'s tip says the corner sets it', has(tip[overlay_path('Wrap lines wider than')], 'You can also hold Shift and '
    .. 'drag the overlay\'s bottom right corner to set this, down to 100 px.'));
check('and the map\'s tip says the widescan list isn\'t the map', has(tip[overlay_path('While the map is open')], 'The widescan list '
    .. 'doesn\'t count as the map.') and has(tip[overlay_path('Remember each monster\'s /check')], 'A widescan level clears when '
    .. 'the monster dies near you, leaves sight or you zone.'));

-- Every box edits its setting and saves at once.
local OVERLAY_BOXES = {
    { 'Show the overlay', 'on', false }, { 'Lock it in place', 'locked', false },
    { 'Remember each monster\'s /check', 'remember', true }, { 'Follow the cursor while you pick a target', 'follow_cursor', false },
    { 'Show level', 'show_level', true }, { 'Show its level range too', 'show_range', false },
    { 'Show its ID', 'show_id', false }, { 'Show if it\'s a PH', 'show_ph', false },
    { 'Put each part on its own line', 'own_lines', true }, { 'Abbreviations', 'short_words', false },
    { 'Border', 'border', true },
    { 'Tips on hover', 'tips', true },
    { 'In cutscenes and NPC talk', 'hide_in_events', true }, { 'While the game\'s interface is hidden', 'hide_with_ui', true },
    { 'While the map is open', 'hide_on_map', true },
};
for _, box in ipairs(OVERLAY_BOXES) do
    local label, key, default = unpack(box);
    saves = MOCK.saved;
    MOCK.clicks[overlay_path(label)] = true;
    frame();
    check(('%s turns %s and saves at once'):format(label, default and 'off' or 'on'), o[key] == not default
        and MOCK.saved == saves + 1 and MOCK.last_save.overlay[key] == not default and o == cur().overlay);
    MOCK.clicks[overlay_path(label)] = true;
    frame();
    check('and back', o[key] == default);
end
for id in pairs(OVERLAY_ROWS) do
    local before, chat = o.parts[id], s.printout.parts[id].on;
    saves = MOCK.saved;
    MOCK.clicks['Display/' .. id .. '/##overlay'] = true;
    frame();
    check(('the overlay\'s %s row turns it %s and saves, and leaves the chat\'s alone'):format(id, before and 'off' or 'on'),
        o.parts[id] == not before and MOCK.saved == saves + 1 and MOCK.last_save.overlay.parts[id] == not before
        and s.printout.parts[id].on == chat);
    MOCK.clicks['Display/' .. id .. '/##overlay'] = true;
    frame();
end
check('every row is back as it was', o.parts.name and o.parts.aggro and o.parts.links and not o.parts.crit
    and not o.parts.drops and not o.parts.steal);
MOCK.clicks[overlay_path('Show level')] = true;
frame();
frame();
check('Show level off greys out Show its level range too', MOCK.gui.disabled[overlay_path('Show its level range too')] == true
    and not MOCK.gui.disabled[overlay_path('Show its ID')]);
MOCK.clicks[overlay_path('Show level')] = true;
frame();
frame();
check('and on again it\'s live', not MOCK.gui.disabled[overlay_path('Show its level range too')]);

-- Its divider list only has the dividers it can draw, and Custom has its own text box.
check('the Divider list shows Pipe and no custom box', MOCK.gui.previews[overlay_path('Divider')] == 'Pipe |'
    and MOCK.gui.paths[overlay_path('Custom text')] == nil, MOCK.gui.previews[overlay_path('Divider')]);
MOCK.open[overlay_path('Divider')] = true;
frame();
names = {};
for _, divider in ipairs(printout.DIVIDERS) do
    if (MOCK.gui.paths[overlay_path('Divider/') .. divider.name] == 'Selectable') then names[#names + 1] = divider.name; end
end
check('it offers the plain dividers and no symbols', table.concat(names, ', ') == 'Pipe |, Slash /, Dash -, Two spaces, '
    .. 'Custom', table.concat(names, ', '));
saves = MOCK.saved;
MOCK.clicks[overlay_path('Divider/Custom')] = true;
frame();
check('picking Custom saves at once', o.divider == 'custom' and MOCK.saved == saves + 1 and s.printout.divider == 'spaces');
frame();
check('and shows its custom box', MOCK.gui.paths[overlay_path('Custom text')] == 'InputText'
    and MOCK.gui.paths['Display/chat_format/Custom text'] == nil);
MOCK.typing[overlay_path('Custom text')] = ' \226\128\162~ ';
frame();
check('its text keeps printable ASCII only', o.separator == ' ~ ' and s.printout.separator ~= ' ~ ', o.separator);
MOCK.clicks[overlay_path('Divider/Pipe |')] = true;
frame();
frame();
check('Pipe hides the box again', o.divider == 'pipe' and MOCK.gui.paths[overlay_path('Custom text')] == nil);
MOCK.open[overlay_path('Divider')] = nil;
o.separator = '  ';

-- The Move it back button puts the overlay where it starts and saves at once.
s.window.overlay_x, s.window.overlay_y = 300, 400;
saves = MOCK.saved;
MOCK.clicks[overlay_path('Move it back')] = true;
frame();
check('Move it back puts it at 20, 200 and saves', s.window.overlay_x == 20 and s.window.overlay_y == 200
    and MOCK.saved == saves + 1 and MOCK.last_save.window.overlay_x == 20);

-- Sliders and the custom text box tell checkmate they changed something before it saves, so the overlay shows
-- it right away. A box saves at once, so it doesn't.
local draw_settings, edited = window.draw, nil;
window.draw = function (...)
    local result = draw_settings(...);
    edited = result.edited;
    return result;
end
saves = MOCK.saved;
MOCK.slide[overlay_path('Wrap lines wider than')] = 0;
frame();
check('a slider says it edited something, without saving', edited == true and o.wrap == 0 and MOCK.saved == saves);
frame();
check('only on the frame it changed', edited == false and MOCK.gui.formats[overlay_path('Wrap lines wider than')] == 'Never');
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('it saves when let go', MOCK.saved == saves + 1 and MOCK.last_save.overlay.wrap == 0);
MOCK.slide[overlay_path('Font size')] = 22;
MOCK.slide[overlay_path('Background')] = 35;
frame();
check('the font size and background sliders', edited == true and o.font_size == 22 and o.opacity == 35);
MOCK.clicks[overlay_path('Border')] = true;
frame();
check('a box doesn\'t say it edited something', edited == false and o.border == false);
MOCK.clicks[overlay_path('Border')] = true;
MOCK.open[overlay_path('Divider')] = true;
MOCK.clicks[overlay_path('Divider/Custom')] = true;
frame();
MOCK.open[overlay_path('Divider')] = nil;
frame();
MOCK.typing[overlay_path('Custom text')] = '++';
frame();
check('typing in the custom box does', edited == true and o.separator == '++');
MOCK.typing['Display/chat_format/Label##name'] = 'Mob';
frame();
check('and so does any other text box', edited == true and s.printout.parts.name.label == 'Mob');
MOCK.typing['Display/chat_format/Label##name'] = '';
frame();
window.draw = draw_settings;
o.divider, o.separator, o.wrap, o.font_size, o.opacity = 'pipe', '  ', 520, 16, 80;

-- Its font is its own, picked from the same list as the window's, and a missing one says so.
check('the Font list shows Ashita', MOCK.gui.previews[overlay_path('Font')] == 'Ashita');
MOCK.open[overlay_path('Font')] = true;
MOCK.clicks[overlay_path('Font/Segoe UI')] = true;
frame();
check('picking Segoe UI sets the overlay\'s font, not the window\'s', o.font == 'segoeui' and s.look.font == 'ashita');
MOCK.clicks[overlay_path('Font/Verdana')] = true;
frame();
frame();
check('a missing font says the overlay uses Ashita\'s', o.font == 'verdana' and MOCK.drew(('Verdana isn\'t in %s or won\'t '
    .. 'load, so the overlay uses Ashita\'s font.'):format(window_font.FOLDER)) and not MOCK.drew('so this window uses'));
MOCK.clicks[overlay_path('Font/Ashita')] = true;
frame();
MOCK.open[overlay_path('Font')] = nil;
check('and back to Ashita', o.font == 'ashita');

-- Appearance tab ------------------------------------------------------------------------------------

-- Every color setting has a list on the Appearance tab, and nothing else paints chat.
local lists = 0;
for _, key in ipairs(printout.COLOR_KEYS) do
    if (MOCK.gui.paths['Appearance/##' .. key] == 'BeginCombo') then lists = lists + 1; end
end
check('a list for every color setting', lists == #printout.COLOR_KEYS and lists == 114, lists);
local elsewhere = {};
for path, widget in pairs(MOCK.gui.paths) do
    if (widget == 'BeginCombo' and not path:find('^Appearance/') and MOCK.gui.previews[path] == 'Cream') then
        elsewhere[#elsewhere + 1] = path;
    end
end
check('no chat color list on any other tab', #elsewhere == 0, table.concat(elsewhere, ', '));
check('each list shows its color\'s name', MOCK.gui.previews['Appearance/##name'] == 'Coral'
    and MOCK.gui.previews['Appearance/##level_range'] == 'Coral' and MOCK.gui.previews['Appearance/##id'] == 'Coral'
    and MOCK.gui.previews['Appearance/##ph'] == 'Coral'
    and MOCK.gui.previews['Appearance/##decent_challenge'] == 'Light blue' and MOCK.gui.previews['Appearance/##tag_word'] == 'Cyan');
for _, heading in ipairs({ 'TAG AND LINES', 'NAME AND LEVEL', 'DIFFICULTY', 'EVASION AND DEFENSE', 'HIT RATE', 'OFF-HAND',
    'RANGED', 'EVADE', 'CRIT', 'JOB', 'AGGRO', 'LINKS', 'MAGIC', 'IMMUNITIES', 'ELEMENTS', 'DROPS', 'STEAL', 'PET',
    'GRADES' }) do
    check('the ' .. heading .. ' heading', MOCK.drew(heading));
end
check('the Steal colors say what they paint', has(tips()['Appearance/##steal_number'], 'Your chance to steal, like 77%.')
    and has(tips()['Appearance/##steal_detail'], 'the parentheses around the chance, the commas and "or" between items, '
    .. '"nothing" and "unknown".'));
check('and the Job colors', has(tips()['Appearance/##job_label'], 'The label and the label divider after it.')
    and has(tips()['Appearance/##job_name'], 'The job letters, like DRK.')
    and has(tips()['Appearance/##job_detail'], 'The slash between the main job and the support job.'));
check('and the Links colors, with the aggro ones no longer naming the links', has(tips()['Appearance/##links_label'],
    'The label and the label divider after it.') and has(tips()['Appearance/##links_words'], '"Links with", "Links", '
    .. '"Doesn\'t link" and the names.') and has(tips()['Appearance/##links_detail'], 'the divider before Links when it '
    .. 'comes right after Aggro on the same line.') and not has(tips()['Appearance/##aggro_words'], 'Links')
    and not has(tips()['Appearance/##aggro_detail'], 'link'));

MOCK.open['Appearance/##hit_label'] = true;
frame();
local offered = 0;
for path, widget in pairs(MOCK.gui.paths) do
    if (widget == 'Selectable' and path:find('^Appearance/##hit_label/')) then offered = offered + 1; end
end
check('a color list offers the whole palette', offered == #printout.PALETTE, offered);
saves = MOCK.saved;
MOCK.clicks['Appearance/##hit_label/Coral'] = true;
frame();
check('picking Coral sets 8 and saves at once', s.colors.hit_label == 8 and MOCK.saved == saves + 1);
MOCK.open['Appearance/##hit_label'] = nil;
MOCK.open['Appearance/##line'] = true;
MOCK.clicks['Appearance/##line/White'] = true;
frame();
check('the divider and line color', s.colors.line == 1);
MOCK.open['Appearance/##line'] = nil;

check('Color by difficulty is a box over the con colors', MOCK.gui.paths['Appearance/Color by difficulty'] == 'Checkbox');
saves = MOCK.saved;
MOCK.clicks['Appearance/Color by difficulty'] = true;
frame();
check('Color by difficulty turns off and saves', s.printout.con_colors == false and MOCK.saved == saves + 1);
MOCK.clicks['Appearance/Color by difficulty'] = true;
frame();
check('and back on', s.printout.con_colors == true);

check('Color by threat is a box over the aggro colors, on', MOCK.gui.paths['Appearance/Color by threat'] == 'Checkbox'
    and s.aggro.threat_colors == true and MOCK.gui.previews['Appearance/##aggro_threat'] == 'Tomato'
    and MOCK.gui.previews['Appearance/##aggro_safe'] == 'Lawn green');
check('with its tip', has(tips()['Appearance/Color by threat'], 'With this on, Aggressive answers print in Threat'));
saves = MOCK.saved;
MOCK.clicks['Appearance/Color by threat'] = true;
frame();
check('Color by threat turns off and saves', s.aggro.threat_colors == false and MOCK.saved == saves + 1);
MOCK.clicks['Appearance/Color by threat'] = true;
MOCK.open['Appearance/##aggro_safe'] = true;
MOCK.clicks['Appearance/##aggro_safe/Spring green'] = true;
frame();
check('and back on, and the Safe color', s.aggro.threat_colors == true and s.colors.aggro_safe == 83);
MOCK.open['Appearance/##aggro_safe'] = nil;

MOCK.clicks['Appearance/Color by grade'] = true;
frame();
check('grade colors off', s.grades.on == false);
frame();
check('the cutoffs grey out', MOCK.gui.disabled['Numbers/##hit_good'] == true);
MOCK.clicks['Appearance/Color by grade'] = true;
MOCK.open['Appearance/##good'] = true;
MOCK.clicks['Appearance/##good/Lime'] = true;
frame();
check('grades back on, and the Good color', s.grades.on and s.colors.good == 79);
MOCK.open['Appearance/##good'] = nil;

n = #MOCK.printed;
MOCK.clicks['Appearance/Print a sample'] = true;
frame();
check('the Appearance tab prints a sample too', #MOCK.printed > n
    and MOCK.printed_since(n)[1]:find('^%[checkmate%] Sample Goblin') ~= nil, MOCK.printed_since(n)[1]);

-- Icons ------------------------------------------------------------------------------------------

-- The chat's Element icons and Icons only on the Printout tab. Icons only is greyed until Element icons is on.
tip = tips();
check('Element icons and Icons only are boxes on the Printout tab, with tips', MOCK.gui.paths['Display/chat_format/Element icons']
    == 'Checkbox' and MOCK.gui.paths['Display/chat_format/Icons only'] == 'Checkbox'
    and has(tip['Display/chat_format/Element icons'], 'Enable Weaknesses and its Elements component, then print a sample.')
    and has(tip['Display/chat_format/Icons only'], 'It needs Element icons on.'));
check('Icons only is greyed while Element icons is off', MOCK.gui.disabled['Display/chat_format/Icons only'] == true
    and not MOCK.gui.disabled['Display/chat_format/Element icons']);
saves = MOCK.saved;
MOCK.clicks['Display/chat_format/Element icons'] = true;
frame();
frame();
check('Element icons turns on and saves at once, and Icons only is live', s.printout.icons == true and MOCK.saved == saves + 1
    and MOCK.last_save.printout.icons == true and not MOCK.gui.disabled['Display/chat_format/Icons only']);
MOCK.clicks['Display/chat_format/Icons only'] = true;
frame();
check('Icons only turns on and saves at once', s.printout.icons_only == true and MOCK.saved == saves + 2);
MOCK.clicks['Display/chat_format/Icons only'] = true;
MOCK.clicks['Display/chat_format/Element icons'] = true;
frame();
check('and both back off', s.printout.icons == false and s.printout.icons_only == false);
-- Doing what the tip says, with Element icons on. The bytes are read as they print, since MOCK.plain would take
-- Fire's second byte for a color code.
local function symbols_since(n)
    local count = 0;
    for i = n + 1, #MOCK.printed do
        count = count + select(2, MOCK.printed[i]:gsub('\239[\31-\38]', ''));
    end
    return count;
end
MOCK.clicks['Display/chat_format/Element icons'] = true;
frame();
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('with the Elements and Magic parts off, the sample has no element, so no symbol', s.printout.parts.weaknesses.on
    == false and s.printout.parts.magic.on == false and #MOCK.printed > n and symbols_since(n) == 0, symbols_since(n));
MOCK.clicks['Display/weaknesses/##chat'] = true;
frame();
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('with the Elements part on, as the tip says, the sample shows them', symbols_since(n) > 0, symbols_since(n));
MOCK.clicks['Display/weaknesses/##chat'] = true;
MOCK.clicks['Display/chat_format/Element icons'] = true;
frame();
check('and the Elements part and Element icons go back off', s.printout.parts.weaknesses.on == false
    and s.printout.icons == false);

-- The overlay's Show icons, Icons only and Element look, in an ICONS section between LOOK and HIDE IT.
local function text_at(text)
    for index, each in ipairs(MOCK.gui.texts) do
        if (each == text) then return index; end
    end
    return 0;
end
frame();
check('the ICONS section sits between OVERLAY and HIDE IT', text_at('OVERLAY') > 0 and text_at('OVERLAY') < text_at('ICONS')
    and text_at('ICONS') < text_at('HIDE IT'));
tip = tips();
check('Show icons, Icons only and Element look are there with tips', MOCK.gui.paths[overlay_path('Show icons')] == 'Checkbox'
    and MOCK.gui.paths[overlay_path('Icons only')] == 'Checkbox' and MOCK.gui.paths[overlay_path('Element look')] == 'BeginCombo'
    and has(tip[overlay_path('Show icons')], 'Weapons uses the bundled BG Wiki damage-type icons') and has(tip[overlay_path('Icons only')], 'A name stays when its '
    .. 'picture won\'t load.') and has(tip[overlay_path('Element look')], 'Their corners follow Corner roundness on the Appearance tab.'));
check('Show icons\' tip names the jobs\' heads, and Icons only the heads that look alike', has(tip[overlay_path('Show icons')],
    'and each job in the Job part, which gets that job\'s artifact head.') and has(tip[overlay_path('Icons only')], 'in the '
    .. 'game\'s own pictures. Every job\'s head is different there, but Monk\'s and Paladin\'s look alike when '
    .. 'they\'re small, and so do Thief\'s and Ranger\'s.'), tip[overlay_path('Icons only')]);
check('and Icons only says a tip tells them apart', has(tip[overlay_path('Icons only')], 'and so do Thief\'s and Ranger\'s. With '
    .. 'Tips on hover on, rest the mouse on one to see which it is. Weapon names and percentages always stay. It needs Show icons on.'), tip[overlay_path('Icons only')]);
-- Tips on hover, last in ICONS, right after Element look.
local drawn_order, real_checkbox, real_combo = {}, imgui.Checkbox, imgui.BeginCombo;
imgui.Checkbox = function (label, ...)
    drawn_order[#drawn_order + 1] = label;
    return real_checkbox(label, ...);
end
imgui.BeginCombo = function (label, ...)
    drawn_order[#drawn_order + 1] = label;
    return real_combo(label, ...);
end
frame();
imgui.Checkbox, imgui.BeginCombo = nil, nil;
local look_at = 0;
for index, label in ipairs(drawn_order) do
    if (label == 'Element look') then look_at = index; end
end
check('Tips on hover is a box with its tip, right after Element look and before HIDE IT', MOCK.gui.paths[overlay_path('Tips on ')
    .. 'hover'] == 'Checkbox' and look_at > 0 and drawn_order[look_at + 1] == 'Tips on hover'
    and drawn_order[look_at + 2] == 'In cutscenes and NPC talk', table.concat(drawn_order, ', '));
check('hover help explains names, text without icons, full links and passing clicks to the game',
    has(tip[overlay_path('Tips on hover')], 'its full name and details')
    and has(tip[overlay_path('Tips on hover')], 'Text tips work with Show icons off.')
    and has(tip[overlay_path('Tips on hover')], 'Monster > Target details has the full list.')
    and has(tip[overlay_path('Tips on hover')], 'let clicks through to the game.'), tip[overlay_path('Tips on hover')]);
check('Element look shows Game pictures', MOCK.gui.previews[overlay_path('Element look')] == 'Game pictures');
MOCK.open[overlay_path('Element look')] = true;
MOCK.clicks[overlay_path('Element look/Colored badges')] = true;
saves = MOCK.saved;
frame();
check('picking Colored badges saves at once', o.element_look == 'badges' and MOCK.saved == saves + 1
    and MOCK.last_save.overlay.element_look == 'badges');
MOCK.clicks[overlay_path('Element look/Game pictures')] = true;
frame();
MOCK.open[overlay_path('Element look')] = nil;
check('and Game pictures again', o.element_look == 'game');
MOCK.clicks[overlay_path('Show icons')] = true;
frame();
frame();
check('Show icons off greys out icon controls but leaves Tips on hover usable', o.icons == false
    and MOCK.gui.disabled[overlay_path('Icons only')] and MOCK.gui.disabled[overlay_path('Element look')]
    and not MOCK.gui.disabled[overlay_path('Tips on hover')] and not MOCK.gui.disabled[overlay_path('Show icons')]);
check('and their tips say they need it', has(tip[overlay_path('Icons only')], 'It needs Show icons on.')
    and has(tip[overlay_path('Element look')], 'It needs Show icons on.'));
MOCK.clicks[overlay_path('Show icons')] = true;
frame();
frame();
check('and on again they\'re live', o.icons == true and not MOCK.gui.disabled[overlay_path('Icons only')]
    and not MOCK.gui.disabled[overlay_path('Element look')] and not MOCK.gui.disabled[overlay_path('Tips on hover')]);
saves = MOCK.saved;
MOCK.clicks[overlay_path('Icons only')] = true;
frame();
check('the overlay\'s Icons only saves at once, apart from the chat\'s', o.icons_only == true and MOCK.saved == saves + 1
    and s.printout.icons_only == false);
MOCK.clicks[overlay_path('Icons only')] = true;
frame();

-- The Element badges colors, last on the Appearance tab, two to a row like the grades, with a note under the heading.
tip = tips();
local badge_tips, badge_lists = true, true;
for _, key in ipairs({ 'badge_fire', 'badge_ice', 'badge_wind', 'badge_earth', 'badge_thunder', 'badge_water',
    'badge_light', 'badge_dark' }) do
    badge_lists = badge_lists and MOCK.gui.paths['Appearance/##' .. key] == 'BeginCombo';
    badge_tips = badge_tips and has(tip['Appearance/##' .. key], 'badge in the overlay. It shows with Element look set to '
        .. 'Colored badges on the Display tab, or when that element\'s game picture won\'t load.');
end
check('the ELEMENT BADGES heading with its note', MOCK.drew('ELEMENT BADGES') and MOCK.drew('Only the overlay draws these, '
    .. 'as its colored badges. They never print in chat.'));
check('its eight colors, two to a row like the grades', badge_lists
    and MOCK.gui.tables['##Element badges'] == MOCK.gui.tables['##Grades'], MOCK.gui.tables['##Element badges']);
check('each with a tip that says it\'s the overlay\'s', badge_tips, tip['Appearance/##badge_fire']);
check('and the ice badge starts cyan', MOCK.gui.previews['Appearance/##badge_ice'] == 'Cyan');
check('the skin\'s tip says it sets the colors on the Appearance tab, the badges included', has(tip['Appearance/##skin'],
    'the colors on the Appearance tab and Color by difficulty.'), tip['Appearance/##skin']);

-- Numbers tab -----------------------------------------------------------------------------------

MOCK.slide['Numbers/##hit_good'] = 90;
MOCK.slide['Numbers/##crit_ok'] = 6;
frame();
check('the cutoff sliders', s.grades.hit_good == 90 and s.grades.crit_ok == 6);
check('and no grade colors there', MOCK.gui.paths['Numbers/Good'] == nil
    and MOCK.gui.paths['Numbers/Color by grade'] == nil);

-- The Pets tab edits the pet part's settings.
local PET_NAME, PET_LEVEL = 'Pets/Show its name', 'Pets/Show its level';
check('the Pets tab has a PET section with its four controls', MOCK.drew('PET') and MOCK.gui.paths[PET_NAME] == 'Checkbox'
    and MOCK.gui.paths[PET_LEVEL] == 'Checkbox' and MOCK.gui.paths['Pets/Hit word'] == 'InputText'
    and MOCK.gui.paths['Pets/Evade word'] == 'InputText' and not MOCK.gui.disabled[PET_LEVEL]);
check('the Pets tab can enable either display directly', MOCK.gui.paths['Pets/pet/In chat'] == 'Checkbox'
    and MOCK.gui.paths['Pets/pet/In overlay'] == 'Checkbox');
tip = tips();
check('and its tips', has(tip['Pets/PET'], 'It works for a jug pet, a charmed monster, a wyvern and an automaton')
    and has(tip[PET_LEVEL], 'like (Lv 73-75)') and has(tip['Pets/Evade word'], 'Clear it to leave the word out.'));
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
MOCK.typing['Pets/Hit word'] = 'Acc\226\128\148';
frame();
check('the Hit word keeps printable ASCII only and doesn\'t save while typed', s.pet.hit_word == 'Acc'
    and s.pet.show_level == true and MOCK.saved == saves, s.pet.hit_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the box saves it', MOCK.saved == saves + 1 and MOCK.last_save.pet.hit_word == 'Acc');
MOCK.typing['Pets/Evade word'] = '';
frame();
check('the Evade word clears', s.pet.evade_word == '');
MOCK.clicks['Display/pet/##chat'] = true;
frame();
check('the note goes once the Pet part is on', s.printout.parts.pet.on == true and not MOCK.drew('The Pet part is off'));
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
lines = MOCK.printed_since(n);
check('the sample ends with the pet part in your words', lines[#lines] == '[checkmate] Pet: Wyvern (Lv 42)  Acc: 88%  27%',
    table.concat(lines, ' / '));
MOCK.typing['Pets/Hit word'] = 'Hit';
MOCK.typing['Pets/Evade word'] = 'Evade';
MOCK.clicks['Display/pet/##chat'] = true;
frame();
check('and back', s.pet.hit_word == 'Hit' and s.pet.evade_word == 'Evade' and s.printout.parts.pet.on == false);

-- The RANGED section under PET adds the ranged hit rate outside the sweet spot.
local FAR = 'Numbers/Show it outside the sweet spot too';
check('the Numbers tab has a RANGED section with Show it outside the sweet spot too, off', MOCK.drew('RANGED')
    and MOCK.gui.paths[FAR] == 'Checkbox' and s.ranged.show_far == false and not MOCK.gui.disabled[FAR]);
check('and a note while the Ranged part is off', MOCK.drew('Enable Ranged in Display to show it.'));
tip = tips();
check('its tip says the number is the sweet spot one and what the sweet spot is', has(tip[FAR], 'The Ranged part shows '
    .. 'your hit rate in your weapon\'s sweet spot. You shoot with your full accuracy from right up close out to the far '
    .. 'edge of the sweet spot. Past that edge you hit less the farther you stand, and past 25 yalms you\'re too far away '
    .. 'to shoot.')
    and has(tip[FAR], 'like "Ranged: 63% (55% at 25 yalms)".'), tip[FAR]);
check('the other tips name off-hand and ranged', has(tip['Numbers/##hit_ok'], 'Off-hand and Ranged go by the Hit rate row')
    and has(tip['Appearance/Color by grade'], 'the hit rate, off-hand, ranged, evade, crit, crit taken and pet '
    .. 'numbers') and has(tip['Display/chat_format/Number ranges'], 'hit rate, off-hand, ranged, evade, shield block, parry, crit, crit taken, '
    .. 'magic, steal and pet numbers')
    and has(tip['Appearance/##good'], 'Hit rate, off-hand, ranged, evade, crit and pet numbers')
    and has(tip['Appearance/##ranged_detail'], 'your hit rate at 25 yalms') and has(tip['Appearance/##offhand_number'], 'The number '
    .. 'while grade colors are off.'));
saves = MOCK.saved;
MOCK.clicks[FAR] = true;
MOCK.clicks['Display/offhand/##chat'] = true;
MOCK.clicks['Display/ranged/##chat'] = true;
frame();
check('it turns on and saves', s.ranged.show_far == true and MOCK.saved == saves + 1 and MOCK.last_save.ranged.show_far == true
    and s.printout.parts.offhand.on == true and s.printout.parts.ranged.on == true);
check('the note goes once the Ranged part is on', not MOCK.drew('Enable Ranged in Display'));
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
lines = MOCK.printed_since(n);
check('the sample shows off-hand and ranged, with the ranged one at 25 yalms', lines[2] == '[checkmate] Evade: 31% with '
    .. 'Signet  Ht!: ~68%  Off-hand: ~62%  Ranged: ~65% (~54% at 25 yalms)', table.concat(lines, ' / '));
MOCK.clicks[FAR] = true;
MOCK.clicks['Display/offhand/##chat'] = true;
MOCK.clicks['Display/ranged/##chat'] = true;
frame();
check('and back', s.ranged.show_far == false and s.printout.parts.offhand.on == false
    and s.printout.parts.ranged.on == false);

-- Aggro tab -------------------------------------------------------------------------------------

local DETECTION = 'Aggro/Show how it finds you';
local HOW = 'Aggro/Show how each one links';
local NAMES = 'Aggro/Show the names it links with';
check('the Aggro tab has its boxes and slider', MOCK.gui.paths[DETECTION] == 'Checkbox' and MOCK.gui.paths[NAMES] == 'Checkbox'
    and MOCK.gui.paths['Aggro/Most entries shown'] == 'Slider' and MOCK.gui.formats['Aggro/Most entries shown'] == '%d'
    and not MOCK.gui.disabled['Aggro/Most entries shown']);
check('Show how each one links is a box, on', MOCK.gui.paths[HOW] == 'Checkbox' and s.links.link_how == true
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
check('the names turn off and grey out the slider', s.links.link_names == false
    and MOCK.gui.disabled['Aggro/Most entries shown'] == true);
check('but not Show how each one links', not MOCK.gui.disabled[HOW]);
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('so the sample says how they link without the names', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive  '
    .. 'Links (Sight)', MOCK.printed_since(n)[3]);
saves = MOCK.saved;
MOCK.clicks[HOW] = true;
frame();
check('Show how each one links turns off and saves', s.links.link_how == false and MOCK.saved == saves + 1
    and MOCK.last_save.links.link_how == false);
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('and the sample just says Links', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive  Links',
    MOCK.printed_since(n)[3]);
MOCK.clicks[DETECTION] = true;
MOCK.clicks[NAMES] = true;
frame();
check('and back on', s.aggro.detection == true and s.links.link_names == true);
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('with the names back and Show how each one links still off, the sample has no tags', MOCK.printed_since(n)[3]
    == '[checkmate] Aggro: Aggressive (Sight)  Links with Goblin Butcher, Goblin Leecher, Goblin Tinkerer',
    MOCK.printed_since(n)[3]);
MOCK.clicks[HOW] = true;
frame();
check('Show how each one links back on', s.links.link_how == true);
saves = MOCK.saved;
MOCK.slide['Aggro/Most entries shown'] = 0;
frame();
check('the slider doesn\'t save while dragged', s.links.max_links == 0 and MOCK.saved == saves);
frame();
check('0 names reads All', MOCK.gui.formats['Aggro/Most entries shown'] == 'All');
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('and saves when let go', MOCK.saved == saves + 1 and MOCK.last_save.links.max_links == 0);
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('the sample follows the aggro settings', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive (Sight)  Links with '
    .. 'Goblin Butcher (Sight), Goblin Leecher (Sight), Goblin Tinkerer (Sight)', MOCK.printed_since(n)[3]);
MOCK.slide['Aggro/Most entries shown'] = 1;
frame();
n = #MOCK.printed;
MOCK.clicks['Appearance/Print a sample'] = true;
frame();
check('with the most names shown', MOCK.printed_since(n)[3] == '[checkmate] Aggro: Aggressive (Sight)  Links with '
    .. 'Goblin Butcher (Sight)  +2 more', MOCK.printed_since(n)[3]);
MOCK.slide['Aggro/Most entries shown'] = 5;
frame();
-- Aggro and Links each turn on and off on their own in the parts table.
MOCK.clicks['Display/aggro/##chat'] = true;
frame();
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('with Aggro off, Links takes its place on a line of its own', s.printout.parts.aggro.on == false
    and MOCK.printed_since(n)[2] == '[checkmate] Evade: 31% with Signet  Ht!: ~68%' and MOCK.printed_since(n)[3]
    == '[checkmate] Links with Goblin Butcher (Sight), Goblin Leecher (Sight), Goblin Tinkerer (Sight)',
    table.concat(MOCK.printed_since(n), ' / '));
MOCK.clicks['Display/aggro/##chat'] = true;
MOCK.clicks['Display/links/##chat'] = true;
frame();
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('and with Links off, Aggro alone', s.printout.parts.links.on == false and MOCK.printed_since(n)[3]
    == '[checkmate] Aggro: Aggressive (Sight)', table.concat(MOCK.printed_since(n), ' / '));
MOCK.clicks['Display/links/##chat'] = true;
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
    and MOCK.gui.disabled['Blue Magic/Spell'] and not MOCK.gui.disabled['Magic/dark/##spell']);
MOCK.open['Magic/enfeebling/##spell'] = nil;

-- The elements part's words and Show how strong sit under their own heading on the Weaknesses tab.
local STRENGTH = 'Weaknesses/Show how strong each one is';
check('the Weaknesses tab has the elements words and Show how strong, on', MOCK.drew('ELEMENTS')
    and MOCK.gui.paths['Weaknesses/Weak word'] == 'InputText' and MOCK.gui.paths['Weaknesses/Resists word'] == 'InputText'
    and MOCK.gui.paths[STRENGTH] == 'Checkbox' and s.elements.strength == true);
tip = tips();
check('with its tip, and a note while the part is off', has(tip['Weaknesses/ELEMENTS'], 'The Elements component of Weaknesses lists the elements a '
    .. 'monster is weak to and the ones it resists') and has(tip[STRENGTH], 'like (half) for half damage')
    and MOCK.drew('One line combines the components you choose for each display.'));
check('the parts table has an Elements row after Immunities, off, on its own line', drawn['Weaknesses']
    and MOCK.gui.paths['Display/weaknesses/##chat'] == 'Checkbox' and MOCK.gui.paths['Display/weaknesses/##label'] == 'InputText'
    and s.printout.parts.weaknesses.on == false and s.printout.parts.weaknesses.new_line == true
    and s.printout.parts.weaknesses.label == 'Weaknesses');
saves = MOCK.saved;
MOCK.typing['Weaknesses/Weak word'] = 'W\195\169ak ';
frame();
check('a word keeps printable ASCII only and doesn\'t save while typed', s.elements.weak_word == 'Wak ' and MOCK.saved == saves,
    s.elements.weak_word);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('letting go of the box saves it', MOCK.saved == saves + 1 and MOCK.last_save.elements.weak_word == 'Wak ');
MOCK.typing['Weaknesses/Resists word'] = '';
MOCK.clicks[STRENGTH] = true;
frame();
check('the resists word clears and Show how strong turns off and saves', s.elements.resist_word == ''
    and s.elements.strength == false and MOCK.last_save.elements.strength == false);
MOCK.clicks['Display/weaknesses/##chat'] = true;
frame();
n = #MOCK.printed;
MOCK.clicks['Display/chat_format/Print a sample'] = true;
frame();
check('the sample shows the elements part with your words', table.concat(MOCK.printed_since(n), ' / '):find('[checkmate] '
    .. 'Weaknesses: Wak: Ice, Thunder  Water ', 1, true) ~= nil, table.concat(MOCK.printed_since(n), ' / '));
MOCK.typing['Weaknesses/Weak word'] = 'Weak';
MOCK.typing['Weaknesses/Resists word'] = 'Resists';
MOCK.clicks[STRENGTH] = true;
MOCK.clicks['Display/weaknesses/##chat'] = true;
frame();
check('and back', s.elements.weak_word == 'Weak' and s.elements.resist_word == 'Resists' and s.elements.strength == true
    and s.printout.parts.weaknesses.on == false);

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

-- Weaknesses tab --------------------------------------------------------------------------------

MOCK.clicks['Weaknesses/dark_sleep/##on'] = true;
MOCK.typing['Weaknesses/bind/##label'] = 'Bnd';
frame();
check('an immunity\'s box and label', s.immunities.dark_sleep.on == false and s.immunities.bind.label == 'Bnd');
local rows = 0;
for _, entry in ipairs(printout.IMMUNITIES) do
    if (MOCK.gui.paths['Weaknesses/' .. entry.id .. '/##on'] == 'Checkbox') then rows = rows + 1; end
end
check('all sixteen immunities', rows == 16, rows);

-- Effects has its own tab, with each change saved at once.
do
    local count = MOCK.saved;
    check('Effects options have their own tab', MOCK.drew('EFFECTS')
        and MOCK.gui.paths['Effects/Show'] == 'BeginCombo'
        and MOCK.gui.paths['Effects/Time left'] == 'Checkbox');
    MOCK.open['Effects/Show'] = true;
    MOCK.clicks['Effects/Show/Only debuffs'] = true;
    frame();
    check('Effects Show saves its filter', s.effects.show == 'debuffs'
        and MOCK.last_save.effects.show == 'debuffs' and MOCK.saved == count + 1);
    MOCK.open['Effects/Show'] = nil;
    count = MOCK.saved;
    MOCK.clicks['Effects/Time left'] = true;
    frame();
    check('Effects Time left saves its switch', s.effects.times == false
        and MOCK.last_save.effects.times == false and MOCK.saved == count + 1);
    s.effects.show, s.effects.times = 'both', true;
end

-- Abbreviations tab -------------------------------------------------------------------------------------

local wording = require('core.wording');
local SH = 'Abbreviations/';
frame();
local boxes, headed = 0, true;
for _, entry in ipairs(wording.LIST) do
    if (MOCK.gui.paths[SH .. entry.key .. '/##short'] == 'InputText') then boxes = boxes + 1; end
end
for _, group in ipairs(wording.GROUPS) do
    headed = headed and MOCK.drew(group.name:upper());
end
check('the Abbreviations tab has both switches, Reset every abbreviation and a box for each word, under a heading for '
    .. 'each part', MOCK.gui.paths[SH .. 'In chat'] == 'Checkbox' and MOCK.gui.paths[SH .. 'In the overlay'] == 'Checkbox'
    and MOCK.gui.paths[SH .. 'Reset every abbreviation'] == 'Button' and MOCK.drew('ABBREVIATIONS') and headed
    and boxes == #wording.LIST, boxes);
check('with both switches off the boxes and Reset are greyed, but not the switches',
    s.printout.short_words == false and s.overlay.short_words == false and MOCK.gui.disabled[SH .. 'con_tough/##short']
    and MOCK.gui.disabled[SH .. 'Reset every abbreviation'] and not MOCK.gui.disabled[SH .. 'In chat']
    and not MOCK.gui.disabled[SH .. 'In the overlay']);
check('and it says which words stay yours, and why the boxes are greyed', MOCK.drew('Part and immunity labels and the '
    .. 'range, ID, PH, Weak, Resists and pet words stay as you set them.') and MOCK.drew('Change them on the Display, '
    .. 'Weaknesses and Pets tabs.') and MOCK.drew('Abbreviations are off, so turn them on above to change '
    .. 'the boxes below.') and MOCK.drew('The overlay\'s switch only counts while the overlay is on.'));
check('two words to a row at the first width', MOCK.gui.tables['##short Difficulty'] == 4
    and MOCK.gui.tables['##short Jobs'] == 4, MOCK.gui.tables['##short Difficulty']);
-- How wide each table makes its columns, and each abbreviation's box, as they draw.
local begin_table, setup_column, short_push = imgui.BeginTable, imgui.TableSetupColumn, imgui.PushID;
local item_width, input_text = imgui.SetNextItemWidth, imgui.InputText;
local column_widths, box_widths, table_id, row_key, next_width = {}, {}, nil, nil, nil;
imgui.BeginTable = function (id, ...)
    table_id, column_widths[id] = id, {};
    return begin_table(id, ...);
end
imgui.TableSetupColumn = function (label, ...)
    table.insert(column_widths[table_id], select(2, ...) or 0);
    return setup_column(label, ...);
end
imgui.PushID = function (id)
    row_key = id;
    return short_push(id);
end
imgui.SetNextItemWidth = function (width)
    next_width = width;
    return item_width(width);
end
imgui.InputText = function (label, ...)
    if (label == '##short') then box_widths[row_key] = next_width; end
    return input_text(label, ...);
end
frame();
imgui.BeginTable, imgui.TableSetupColumn, imgui.PushID, imgui.SetNextItemWidth, imgui.InputText = nil, nil, nil, nil, nil;
local fits = true;
for _, entry in ipairs(wording.LIST) do
    -- A box pads its text 8 on each side.
    fits = fits and (box_widths[entry.key] or 0) >= imgui.CalcTextSize(entry.short) + 16;
end
check('every box is wide enough for the abbreviation it comes with', fits);
check('so the can\'t be gauged line, which needs a wider one, is one word to a row, and the rest stay two',
    MOCK.gui.tables['##short Can\'t be gauged'] == 2 and MOCK.gui.tables['##short Aggro'] == 4,
    MOCK.gui.tables['##short Can\'t be gauged']);
local widths = column_widths['##short Difficulty'];
check('the first word\'s column ends in the 12 between table columns, so the next name stands apart from its (?)',
    #widths == 4 and widths[2] == widths[4] + 12, table.concat(widths, ', '));
for _, box in ipairs({ { 'In chat', 'printout' }, { 'In the overlay', 'overlay' } }) do
    saves = MOCK.saved;
    MOCK.clicks[SH .. box[1]] = true;
    frame();
    check(box[1] .. ' turns on its own switch and saves at once', s[box[2]].short_words == true
        and MOCK.last_save[box[2]].short_words == true and MOCK.saved == saves + 1);
    MOCK.clicks[SH .. box[1]] = true;
    frame();
end
check('and back off', s.printout.short_words == false and s.overlay.short_words == false);
saves = MOCK.saved;
MOCK.clicks[overlay_path('Abbreviations')] = true;
frame();
check('the Overlay tab\'s Abbreviations is the same switch as In the overlay', s.overlay.short_words == true
    and MOCK.saved == saves + 1);
frame();
check('but it only counts while the overlay is on, so the boxes stay greyed', MOCK.gui.disabled[SH .. 'con_tough/##short']);
s.overlay.on = true;
frame();
check('and with the overlay on they aren\'t', not MOCK.gui.disabled[SH .. 'con_tough/##short']
    and not MOCK.drew('The overlay\'s switch only counts while the overlay is on.'));
s.overlay.on, s.overlay.short_words = false, false;
MOCK.clicks[SH .. 'In chat'] = true;
frame();
frame();
check('chat\'s switch alone makes them live too', not MOCK.gui.disabled[SH .. 'con_tough/##short']
    and not MOCK.gui.disabled[SH .. 'Reset every abbreviation']);
MOCK.typing[SH .. 'sense_sound/##short'] = 'S';
frame();
frame();
check('a box edits its word, and two words that print the same get a note', s.short.sense_sound == 'S'
    and MOCK.drew('"Sight" and "Sound" both print as "S".'));
s.short.con_tough = 'xx';
saves = MOCK.saved;
MOCK.clicks[SH .. 'Reset every abbreviation'] = true;
frame();
frame();
check('Reset every abbreviation puts them all back and saves at once, and the note goes', s.short.sense_sound == 'H'
    and s.short.con_tough == 'T' and MOCK.saved == saves + 1 and not MOCK.drew('both print as')
    and s.printout.short_words == true);
MOCK.clicks[SH .. 'In chat'] = true;
frame();
check('and leaves the switches alone', s.printout.short_words == false);

-- Appearance tab --------------------------------------------------------------------------------------

MOCK.open['Appearance/##skin'] = true;
MOCK.clicks['Appearance/##skin/Ember'] = true;
frame();
local ember = skins.find('ember');
check('picking Ember copies its colors', s.look.skin == 'ember' and s.colors.line == 7
    and s.colors.hit_label == 78 and s.look.imgui.check_marks[1] == ember.imgui.accent[1]);
MOCK.open['Appearance/##skin'] = nil;
MOCK.slide['Appearance/Background##background'] = 0.5;
MOCK.slide['Appearance/Open tab line, unfocused##open_tab_line_unfocused'] = 0.25;
MOCK.slide['Appearance/Corner roundness'] = 9;
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
MOCK.clicks['Appearance/Reset to skin'] = true;
frame();
check('Reset to skin', s.look.imgui.background[1] == ember.imgui.background[1] and s.look.imgui.rounding == 2
    and s.look.imgui.open_tab_line_unfocused[1] == ember.imgui.accent[1]);

-- Every window color has its own picker under its heading, and the window paints each ImGui color from it.
local pickers, missing, painted = 0, {}, true;
frame();
for _, entry in ipairs(skins.WINDOW_COLORS) do
    if (MOCK.gui.paths['Appearance/' .. entry.label .. '##' .. entry.key] == 'ColorEdit4') then
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
    if (widget == 'ColorEdit4' and path:find('^Appearance/')) then colors = colors + 1; end
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
    and text_colors[s.look.imgui.headings] == true);
for _, group in ipairs(skins.WINDOW_COLOR_GROUPS) do
    check('the ' .. group.name:upper() .. ' heading', MOCK.drew(group.name:upper()));
end
for _, skin in ipairs(skins.LIST) do
    MOCK.open['Appearance/##skin'] = true;
    MOCK.clicks['Appearance/##skin/' .. skin.name] = true;
    frame();
    frame();
    check('the window draws in ' .. skin.name, s.look.skin == skin.id and MOCK.gui.window == 'checkmate##settings');
end
MOCK.open['Appearance/##skin'] = nil;

-- The font. The load event loaded every font from the test folder set up at the top.
local loads = #MOCK.font_calls;
frame();
check('the load event tried the four fonts that are there and loaded two', loads == 4 and #MOCK.fonts_loaded == 2
    and MOCK.fonts_loaded[1].path == window_font.FOLDER .. 'segoeui.ttf'
    and MOCK.fonts_loaded[2].path == window_font.FOLDER .. 'consola.ttf', loads);
check('the Font list shows Ashita, and the window draws in Ashita\'s font at 18', MOCK.gui.previews['Appearance/Font'] == 'Ashita'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and MOCK.gui.fonts[1].size == 18);
check('with the chat font sentence in its tip', has(tips()['Appearance/Font'], 'The chat log\'s font belongs to the game, and no '
    .. 'addon can change it.'));
MOCK.open['Appearance/Font'] = true;
frame();
local offered = 0;
for _, entry in ipairs(window_font.LIST) do
    if (MOCK.gui.paths['Appearance/Font/' .. entry.name] == 'Selectable') then offered = offered + 1; end
end
check('it offers every font', offered == #window_font.LIST, offered);
saves = MOCK.saved;
MOCK.clicks['Appearance/Font/Segoe UI'] = true;
frame();
check('picking Segoe UI saves at once', s.look.font == 'segoeui' and MOCK.saved == saves + 1);
frame();
check('and the window draws in the Segoe UI the load event loaded', MOCK.gui.fonts[1].font == MOCK.fonts_loaded[1]
    and MOCK.gui.fonts[1].size == 18);
check('without loading a font', #MOCK.font_calls == loads, #MOCK.font_calls);

MOCK.clicks['Appearance/Font/Verdana'] = true;
frame();
local n = #MOCK.printed;
frame();
frame();
check('a missing font draws in Ashita\'s font without an error', s.look.font == 'verdana'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and #MOCK.printed == n);
check('and says so', MOCK.drew(('Verdana isn\'t in %s or won\'t load, so this window uses Ashita\'s font.')
    :format(window_font.FOLDER)));
MOCK.clicks['Appearance/Font/Tahoma'] = true;
frame();
frame();
check('a font that raised an error while loading draws in Ashita\'s font too', s.look.font == 'tahoma'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and #MOCK.printed == n and MOCK.drew('Tahoma isn\'t in'));
MOCK.clicks['Appearance/Font/Calibri'] = true;
frame();
frame();
check('and so does one that loaded as nothing', s.look.font == 'calibri'
    and MOCK.gui.fonts[1].font == MOCK.ashita_font and #MOCK.printed == n and MOCK.drew('Calibri isn\'t in'));
MOCK.clicks['Appearance/Font/Consolas'] = true;
frame();
frame();
check('Consolas draws in the font the load event loaded', s.look.font == 'consolas'
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[2] and not MOCK.drew('isn\'t in'));
MOCK.clicks['Appearance/Font/Segoe UI'] = true;
frame();
check('none of those picks loaded a font', #MOCK.font_calls == loads, #MOCK.font_calls);
MOCK.open['Appearance/Font'] = nil;

check('the Font size slider', MOCK.gui.paths['Appearance/Font size'] == 'Slider' and MOCK.gui.formats['Appearance/Font size'] == '%d px');
MOCK.slide['Appearance/Font size'] = 22;
frame();
frame();
check('the size draws at once', s.look.font_size == 22 and MOCK.gui.fonts[1].size == 22
    and MOCK.gui.fonts[1].font == MOCK.fonts_loaded[1]);
check('and the smallest window grows with it', MOCK.gui.next_size[1] == math.max(840, math.floor(560 * 22 / 18 + 0.5)),
    MOCK.gui.next_size[1]);
MOCK.clicks['Appearance/Reset to skin'] = true;
frame();
check('Reset to skin leaves the font alone', s.look.font == 'segoeui' and s.look.font_size == 22);
MOCK.slide['Appearance/Font size'] = 18;
MOCK.open['Appearance/Font'] = true;
MOCK.clicks['Appearance/Font/Ashita'] = true;
frame();
MOCK.open['Appearance/Font'] = nil;
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
check('on a smaller screen it moves in to fit', pos[1] == 1280 - MOCK.gui.next_size[1] and pos[2] == 720 - 560, pos[1] .. ', ' .. pos[2]);
MOCK.screen = { 800, 600 };
s.look.font_size = 24;
pos = reopen();
check('at 24 px the minimum scales to 747 and stays within an 800 wide screen',
    MOCK.gui.next_size[1] == 747 and pos[1] == 53 and pos[2] == 600 - 560, MOCK.gui.next_size[1] .. ' at ' .. pos[1]);
MOCK.screen = { 1600, 1200 };
-- The minimum scales with the font, independently of the number of visible tabs.
s.look.font_size = 12;
s.window.width = 100;
reopen();
check('at 12 px the minimum is 373 and tab buttons can wrap', MOCK.gui.next_size[1] == 373,
    MOCK.gui.next_size[1]);
-- 7 px a character is what Consolas measures at 12 px, so A if resting and the other 12 letter abbreviations take the
-- whole usual box there.
local one_to_a_row = {};
for _, group in ipairs(wording.GROUPS) do
    if (MOCK.gui.tables['##short ' .. group.name] ~= 4) then one_to_a_row[#one_to_a_row + 1] = group.name; end
end
check('and the narrow Abbreviations tab puts every word on its own row',
    #one_to_a_row == #wording.GROUPS, table.concat(one_to_a_row, ', '));
s.look.font_size = 18;
s.window.width = 400;
reopen();
check('at 18 px the minimum is 560', MOCK.gui.next_size[1] == 560, MOCK.gui.next_size[1]);
s.window.x, s.window.y = 300, 200;
profiles.save(s, 'Spot');
s.window.x = 400;
profiles.load(s, 'Spot');
check('a profile leaves where the window sits alone', s.window.x == 400);
profiles.delete(s, 'Spot');
reopen();

-- Two columns ----------------------------------------------------------------------------------

-- Tabs with several groups can lay their sections out in two columns.
wide_matrix, MOCK.avail = false, nil;
local SECTIONS = { '##color_sections', '##aggro_sections',
    '##drops_sections', '##weaknesses_sections', '##short_sections', '##look_sections', '##profile_sections' };
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
check('at 720 wide every section table is one column', columns() == 1, columns());
MOCK.window_size = { TWO_AT - 1, 560 };
frame();
check('one pixel short of two columns, still one', columns() == 1, columns());
MOCK.window_size = { TWO_AT, 560 };
frame();
check(('at %d wide every section table has two'):format(TWO_AT), columns() == 2, columns());
check('and the Abbreviations tab\'s words go one to a row there', MOCK.gui.tables['##short Difficulty'] == 2,
    MOCK.gui.tables['##short Difficulty']);
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
-- Side by side, the Appearance chat colors' two sections come out about as long as each other. The texts in each are counted
-- where the sections table moves to its next column and where it ends, since a heading or a color name is a line.
-- Each color is two texts, its name and its list, so 12 texts is six rows.
local imgui = require('imgui');
local real_begin, real_end, real_next = imgui.BeginTable, imgui.EndTable, imgui.TableNextColumn;
local depth, marks = nil, {};
imgui.BeginTable = function (id, ...)
    depth = (id == '##color_sections') and 1 or (depth and depth + 1);
    return real_begin(id, ...);
end
imgui.EndTable = function ()
    if (depth == 1) then marks[#marks + 1] = #MOCK.gui.texts; end
    depth = (depth ~= nil and depth > 1) and depth - 1 or nil;
    real_end();
end
imgui.TableNextColumn = function ()
    if (depth == 1) then marks[#marks + 1] = #MOCK.gui.texts; end
    real_next();
end
frame();
imgui.BeginTable, imgui.EndTable, imgui.TableNextColumn = nil, nil, nil;
local first, second = (marks[2] or 0) - (marks[1] or 0), (marks[3] or 0) - (marks[2] or 0);
check('and the Appearance tab\'s two sections are about as long as each other', #marks == 3
    and math.abs(first - second) <= 12, ('%d texts and %d'):format(first, second));
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

-- Narrow layouts wrap paired controls, while wide layouts use the space again.
do
    local gui = require('imgui');
    local same_line, joined = gui.SameLine, 0;
    gui.SameLine = function (...) joined = joined + 1; return same_line(...); end;
    MOCK.window_size = { 560, 560 };
    frame();
    check('the smallest panel keeps the compact Monster matrix and two job-link columns',
        MOCK.gui.tables['##job_links'] == 2 and MOCK.gui.tables['##monster_sections'] == 3);
    check('tab visibility uses two columns at the minimum width', MOCK.gui.tables['##tab_visibility'] == 2);
    joined = 0;
    window.pending_row = { left = 20, edge = 230 };
    window.place_control('', 300, true);
    check('a paired control wraps when its field and help cannot fit', joined == 0 and not window.joined);
    MOCK.window_size = { 1000, 560 };
    frame();
    check('a wider panel keeps the Monster matrix and packs tab choices into four columns',
        MOCK.gui.tables['##monster_sections'] == 3 and MOCK.gui.tables['##tab_visibility'] == 4);
    joined = 0;
    window.pending_row = { left = 20, edge = 230 };
    window.place_control('', 300, true);
    check('the same pair joins when enough width is available', joined == 1 and window.joined);
    gui.SameLine = nil;
    MOCK.window_size = nil;
end

-- Hiding a page keeps its settings and can always be undone from Appearance.
do
    local pet_on, pet_overlay = s.printout.parts.pet.on, s.overlay.parts.pet;
    MOCK.clicks['Appearance/tabs/Pets'] = true;
    frame(); frame();
    check('Appearance hides a tab and saves its visibility', s.window.tabs.Pets == false
        and MOCK.last_save.window.tabs.Pets == false and MOCK.gui.tabs.Pets == nil);
    check('hiding a tab leaves the feature alone', s.printout.parts.pet.on == pet_on and s.overlay.parts.pet == pet_overlay);
    check('Appearance has no hide switch for itself', MOCK.gui.paths['Appearance/tabs/Appearance'] == nil
        and MOCK.gui.tabs.Appearance == true);
    MOCK.clicks['Appearance/Restore all tabs'] = true;
    frame(); frame();
    check('Restore all tabs restores the hidden page and saves', s.window.tabs.Pets == true
        and MOCK.last_save.window.tabs.Pets == true and MOCK.gui.tabs.Pets == true);
end

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
    and cur().window.width == 840 and cur().window.height == 560);
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
    and cur().window.width == 840 and cur().window.height == 560 and MOCK.gui.next_pos_cond == ImGuiCond_Appearing,
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
