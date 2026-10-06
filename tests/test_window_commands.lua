-- Each settings window control and its /checkmate command change the same setting the same way. Every pair
-- starts from the defaults, once through the window and once through the command, and both must end with
-- the same setting and the same saved copy. Then a profile keeps everything those commands set.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local profiles = require('ui.profiles');
local defaults = require('ui.defaults');
local json     = require('json');
local function cur() return MOCK.settings.current; end

-- One frame that must not stop checkmate.
local function frame()
    local n = #MOCK.printed;
    MOCK.frame();
    for _, line in ipairs(MOCK.printed_since(n)) do
        if (line:find('Stopped after an error', 1, true)) then error(line); end
    end
end

-- Puts every setting back to its default. The first reset asks and the second does it.
local function reset()
    MOCK.command('/checkmate reset');
    MOCK.command('/checkmate reset');
end

local function copy(value)
    if (type(value) ~= 'table') then return value; end
    local t = {};
    for k, v in pairs(value) do t[k] = copy(v); end
    return t;
end
local function same(a, b)
    if (type(a) ~= 'table' or type(b) ~= 'table') then return a == b; end
    for k, v in pairs(a) do if (not same(v, b[k])) then return false; end end
    for k in pairs(b) do if (a[k] == nil) then return false; end end
    return true;
end
-- A value as short text for a failed check, with table keys in order.
local function show(value)
    if (type(value) ~= 'table') then return tostring(value); end
    local parts = {};
    for k, v in pairs(value) do parts[#parts + 1] = tostring(k) .. '=' .. show(v); end
    table.sort(parts);
    return '{' .. table.concat(parts, ',') .. '}';
end

-- Window input, by the path of the control.
local function click(path) return function () MOCK.clicks[path] = true; end; end
local function type_in(path, text) return function () MOCK.typing[path] = text; end; end
local function slide(path, value) return function () MOCK.slide[path] = value; end; end
local function pick(combo, item)
    return function ()
        MOCK.open[combo] = true;
        MOCK.clicks[combo .. '/' .. item] = true;
    end;
end
-- Picks a profile in the Profiles tab's list, then clicks a button on the next frame.
local function picked_then(name, button, typed)
    return function ()
        MOCK.clicks['Profiles/##profiles/' .. name] = true;
        frame();
        if (typed ~= nil) then MOCK.typing['Profiles/Name'] = typed; end
        MOCK.clicks['Profiles/' .. button] = true;
    end;
end
-- Picks Custom in a divider list, then types its text once its box shows.
local function custom_text(combo, box, text)
    return function ()
        pick(combo, 'Custom')();
        frame();
        MOCK.open = {};
        MOCK.typing[box] = text;
    end;
end

-- What a skin sets.
local function look_of(s)
    return { skin = s.look.skin, colors = s.colors, imgui = s.look.imgui, con = s.printout.con_colors };
end
-- The Treasure Hunter a saved profile holds, or 'none' when there is no such profile.
local function profile_th(name)
    local t = defaults.make();
    return profiles.load(t, name) and t.drops.th or 'none';
end

--[[
    Each pair is its name, the window input, the command, and what it reads from the settings. `release`
    lets go of sliders, text boxes and color pickers, which save when let go. `setup` runs on the fresh
    defaults before both.
]]
local PAIRS = {
    -- Printout tab.
    { 'Show the name', click('Printout/Show the name##name'), '/checkmate hide name',
        function (s) return s.printout.parts.name.on; end },
    { 'the name\'s label', type_in('Printout/Label##name', 'Mob'), '/checkmate label name Mob',
        function (s) return s.printout.parts.name.label; end, release = true },
    { 'Show level', click('Printout/Show level'), '/checkmate level off',
        function (s) return s.printout.show_level; end },
    { 'Show its level range too', click('Printout/Show its level range too'), '/checkmate levelrange on',
        function (s) return s.printout.show_range; end },
    { 'the range word', type_in('Printout/Range word', 'spawns'), '/checkmate rangeword spawns',
        function (s) return s.printout.range_word; end, release = true,
        setup = function (s) s.printout.show_range = true; end },
    { 'Show its ID', click('Printout/Show its ID'), '/checkmate id on',
        function (s) return s.printout.show_id; end },
    { 'the ID word', type_in('Printout/ID word', 'Mob'), '/checkmate idword Mob',
        function (s) return s.printout.id_word; end, release = true,
        setup = function (s) s.printout.show_id = true; end },
    { 'Show if it\'s a PH', click('Printout/Show if it\'s a PH'), '/checkmate ph on',
        function (s) return s.printout.show_ph; end },
    { 'the PH word', type_in('Printout/PH word', 'PH:'), '/checkmate phword PH:',
        function (s) return s.printout.ph_word; end, release = true,
        setup = function (s) s.printout.show_ph = true; end },
    { 'a part\'s On box', click('Printout/drops/##on'), '/checkmate show drops',
        function (s) return s.printout.parts.drops.on; end },
    { 'the Pet part\'s On box', click('Printout/pet/##on'), '/checkmate show pet',
        function (s) return s.printout.parts.pet.on; end },
    { 'a part\'s label', type_in('Printout/hit/##label', 'Acc'), '/checkmate label hit Acc',
        function (s) return s.printout.parts.hit.label; end, release = true },
    { 'a cleared label', type_in('Printout/aggro/##label', ''), '/checkmate label aggro ""',
        function (s) return s.printout.parts.aggro.label; end, release = true },
    -- A middle dot, typed in UTF-8 in the window and in Shift-JIS in the chat line. Its second Shift-JIS byte is E.
    { 'a label cleaned of what chat can\'t show', type_in('Printout/crit/##label', 'Crit\227\131\187 %'),
        '/checkmate label crit "Crit\129\69 %"', function (s) return s.printout.parts.crit.label; end,
        release = true },
    { 'New line on', click('Printout/hit/##new_line'), '/checkmate newline hit on',
        function (s) return s.printout.parts.hit.new_line; end },
    { 'New line off', click('Printout/drops/##new_line'), '/checkmate newline drops off',
        function (s) return s.printout.parts.drops.new_line; end },
    { 'an up arrow', click('Printout/evade/##up'), '/checkmate move evade up',
        function (s) return s.printout.order; end },
    { 'a down arrow', click('Printout/difficulty/##down'), '/checkmate move difficulty down',
        function (s) return s.printout.order; end },
    { 'the reading\'s On box', click('Printout/reading/##on'), '/checkmate hide reading',
        function (s) return s.printout.parts.reading.on; end },
    { 'Defense first', click('Printout/reading/Defense first'), '/checkmate reading defense',
        function (s) return s.printout.defense_first; end },
    { 'Put the extras on their own line', click('Printout/Put the extras on their own line'), '/checkmate extras same',
        function (s) return s.printout.extras_own_line; end },
    { '[checkmate] at the start of each line', click('Printout/[checkmate] at the start of each line'),
        '/checkmate tag off', function (s) return s.printout.header; end },
    { 'a divider', pick('Printout/Divider', 'Arrow'), '/checkmate divider arrow',
        function (s) return s.printout.divider; end },
    { 'the custom divider\'s text', custom_text('Printout/Divider', 'Printout/Custom text', ' | '),
        '/checkmate divider custom " | "', function (s) return { s.printout.divider, s.printout.separator }; end,
        release = true },
    { 'a label divider', pick('Printout/Label divider', 'Space only'), '/checkmate labeldivider space',
        function (s) return s.printout.label_divider; end },
    { 'the custom label divider\'s text', custom_text('Printout/Label divider', 'Printout/Custom text##label', '>'),
        '/checkmate labeldivider custom >',
        function (s) return { s.printout.label_divider, s.printout.label_separator }; end, release = true },
    { 'Number ranges', pick('Printout/Number ranges', 'Middle ~68%'), '/checkmate ranges middle',
        function (s) return s.printout.number_style; end },
    { 'Replace the game\'s /check line', click('Printout/Replace the game\'s /check line'), '/checkmate replace off',
        function (s) return s.printout.replace_game_line; end },

    -- Colors tab.
    { 'Color by difficulty', click('Colors/Color by difficulty'), '/checkmate concolors off',
        function (s) return s.printout.con_colors; end },
    { 'Color by threat', click('Colors/Color by threat'), '/checkmate threatcolors off',
        function (s) return s.aggro.threat_colors; end },
    { 'grade colors', click('Colors/Color the hit, evade, crit and pet numbers'), '/checkmate grades off',
        function (s) return s.grades.on; end },
    { 'a chat color', pick('Colors/##hit_label', 'Coral'), '/checkmate color hit_label coral',
        function (s) return s.colors.hit_label; end },
    { 'a pet chat color', pick('Colors/##pet_name', 'Coral'), '/checkmate color pet_name coral',
        function (s) return s.colors.pet_name; end },

    -- Numbers tab.
    { 'a Good cutoff', slide('Numbers/##hit_good', 90), '/checkmate cutoff hit good 90',
        function (s) return s.grades.hit_good; end, release = true },
    { 'an OK cutoff', slide('Numbers/##crit_ok', 6), '/checkmate cutoff crit ok 6',
        function (s) return s.grades.crit_ok; end, release = true },
    { 'Show its name', click('Numbers/Show its name'), '/checkmate petname off',
        function (s) return s.pet.show_name; end },
    { 'Show its level', click('Numbers/Show its level'), '/checkmate petlevel off',
        function (s) return s.pet.show_level; end },
    { 'the pet\'s Hit word', type_in('Numbers/Hit word', 'Acc'), '/checkmate pethitword Acc',
        function (s) return s.pet.hit_word; end, release = true },
    { 'a cleared Evade word', type_in('Numbers/Evade word', ''), '/checkmate petevadeword ""',
        function (s) return s.pet.evade_word; end, release = true },

    -- Aggro tab.
    { 'Show how it finds you', click('Aggro/Show how it finds you'), '/checkmate detection off',
        function (s) return s.aggro.detection; end },
    { 'Show how each one links', click('Aggro/Show how each one links'), '/checkmate linkhow off',
        function (s) return s.aggro.link_how; end },
    { 'Show the names it links with', click('Aggro/Show the names it links with'), '/checkmate linknames off',
        function (s) return s.aggro.link_names; end },
    { 'Most names shown', slide('Aggro/Most names shown', 0), '/checkmate maxlinks 0',
        function (s) return s.aggro.max_links; end, release = true },

    -- Magic tab.
    { 'a school box', click('Magic/elemental/Elemental'), '/checkmate school elemental on',
        function (s) return s.magic.schools.elemental.on; end },
    { 'a stand-in spell', pick('Magic/enfeebling/##spell', 'Sleep'), '/checkmate spell enfeebling sleep',
        function (s) return s.magic.schools.enfeebling.spell; end },
    { 'a stand-in spell by its name', pick('Magic/singing/##spell', 'Foe Requiem'), '/checkmate spell singing "Foe Requiem"',
        function (s) return s.magic.schools.singing.spell; end },
    { 'extra magic accuracy', slide('Magic/##extra_accuracy', 25), '/checkmate macc 25',
        function (s) return s.magic.extra_accuracy; end, release = true },
    { 'the weak word', type_in('Magic/Weak word', 'Soft'), '/checkmate weakword Soft',
        function (s) return s.elements.weak_word; end, release = true },
    { 'a cleared resists word', type_in('Magic/Resists word', ''), '/checkmate resistword ""',
        function (s) return s.elements.resist_word; end, release = true },
    { 'Show how strong each one is', click('Magic/Show how strong each one is'), '/checkmate strength off',
        function (s) return s.elements.strength; end },

    -- Drops tab.
    { 'Treasure Hunter', slide('Drops/##th', 3), '/checkmate th 3', function (s) return s.drops.th; end, release = true },
    { 'Most items shown', slide('Drops/Most items shown', 0), '/checkmate maxitems 0',
        function (s) return s.drops.max_items; end, release = true },
    { 'Hide items under', slide('Drops/Hide items under', 2.5), '/checkmate minchance 2.5',
        function (s) return s.drops.min_chance; end, release = true },
    { 'Order', pick('Drops/Order', 'By name'), '/checkmate sort name', function (s) return s.drops.sort; end },
    { 'Treasure Hunter in the label', click('Drops/Treasure Hunter in the label'), '/checkmate thlabel off',
        function (s) return s.drops.th_in_label; end },
    { 'Drop notes', click('Drops/Drop notes'), '/checkmate dropnotes off', function (s) return s.drops.notes; end },

    -- Immunities tab.
    { 'an immunity\'s box', click('Immunities/dark_sleep/##on'), '/checkmate immunity sleep off',
        function (s) return s.immunities.dark_sleep; end },
    { 'an immunity\'s label', type_in('Immunities/bind/##label', 'Bnd'), '/checkmate immunitylabel bind Bnd',
        function (s) return s.immunities.bind; end, release = true },

    -- Look tab.
    { 'a skin', pick('Look/##skin', 'Ember'), '/checkmate skin ember', look_of },
    { 'Reset to skin', click('Look/Reset to skin'), '/checkmate skin phoenix', look_of,
        setup = function (s) s.look.imgui.rounding = 5; s.colors.name = 1; end },
    { 'Undo', click('Look/Undo'), '/checkmate skin undo', look_of,
        setup = function () MOCK.command('/checkmate skin ember'); end },
    { 'a font', pick('Look/Font', 'Arial'), '/checkmate font arial', function (s) return s.look.font; end },
    { 'Font size', slide('Look/Font size', 22), '/checkmate fontsize 22', function (s) return s.look.font_size; end,
        release = true },
    { 'Corner roundness', slide('Look/Corner roundness', 9), '/checkmate rounding 9',
        function (s) return s.look.imgui.rounding; end, release = true },
    { 'Spacing', slide('Look/Spacing', 10), '/checkmate spacing 10', function (s) return s.look.imgui.spacing; end,
        release = true },
    { 'a window color', slide('Look/Buttons##buttons', 0x33 / 255), '/checkmate windowcolor buttons 331f1f',
        function (s) return s.look.imgui.buttons; end, release = true },

    -- Profiles tab.
    { 'Save as new', function () MOCK.typing['Profiles/Name'] = 'Fresh'; MOCK.clicks['Profiles/Save as new'] = true; end,
        '/checkmate profile save Fresh', function () return profile_th('Fresh'); end,
        setup = function (s) profiles.delete(s, 'Fresh'); s.drops.th = 2; end },
    { 'Overwrite', picked_then('Over', 'Overwrite'), '/checkmate profile save Over',
        function () return profile_th('Over'); end,
        setup = function (s) profiles.save(s, 'Over'); s.drops.th = 4; end },
    { 'Load', picked_then('Three', 'Load'), '/checkmate profile load Three', function (s) return s.drops.th; end,
        setup = function (s) s.drops.th = 3; profiles.save(s, 'Three'); s.drops.th = 0; end },
    { 'Rename', picked_then('Old', 'Rename', 'New'), '/checkmate profile rename Old New',
        function (s) return { profiles.exists('Old'), profiles.exists('New'), s.job_links.BLM }; end,
        setup = function (s) profiles.delete(s, 'New'); profiles.save(s, 'Old'); s.job_links.BLM = 'Old'; end },
    { 'Delete', picked_then('Gone', 'Delete'), '/checkmate profile delete Gone',
        function (s) return { profiles.exists('Gone'), s.job_links.WAR }; end,
        setup = function (s) profiles.save(s, 'Gone'); s.job_links.WAR = 'Gone'; end },
    { 'a job link', pick('Profiles/##BLM', 'Linked'), '/checkmate joblink blm Linked',
        function (s) return s.job_links.BLM; end, setup = function (s) profiles.save(s, 'Linked'); end },
};

MOCK.command('/checkmate');
frame();

-- Runs one way of making a change from the defaults. Returns the setting, the saved copy's setting, what it
-- read before and whether every input found its control.
local function from_defaults(pair, change)
    local by_window, command, read = pair[2], pair[3], pair[4];
    reset();
    if (pair.setup ~= nil) then pair.setup(cur()); end
    frame();
    local before = copy(read(cur()));
    if (change == 'window') then
        by_window();
        MOCK.deactivate = pair.release == true;
        frame();
        MOCK.deactivate = false;
    else
        MOCK.command(command);
    end
    MOCK.open = {};
    local used = next(MOCK.clicks) == nil and next(MOCK.typing) == nil and next(MOCK.slide) == nil;
    MOCK.clicks, MOCK.typing, MOCK.slide = {}, {}, {};
    return copy(read(cur())), copy(read(MOCK.last_save)), before, used;
end

for _, pair in ipairs(PAIRS) do
    local window_value, window_saved, before, used = from_defaults(pair, 'window');
    local command_value, command_saved = from_defaults(pair, 'command');
    check(pair[1] .. ' and ' .. pair[3], used and not same(before, window_value) and same(window_value, command_value)
        and same(window_saved, command_saved) and same(window_value, window_saved),
        ('before %s, window %s saved %s, command %s saved %s%s'):format(show(before), show(window_value),
        show(window_saved), show(command_value), show(command_saved), used and '' or ', an input found no control'));
end
check('every pair ran', #PAIRS == 72, #PAIRS);

-- Print a sample on both tabs prints the same lines as /checkmate sample.
reset();
frame();
local n = #MOCK.printed;
MOCK.command('/checkmate sample');
local by_command = MOCK.printed_since(n);
for _, tab in ipairs({ 'Printout', 'Colors' }) do
    n = #MOCK.printed;
    MOCK.clicks[tab .. '/Print a sample'] = true;
    frame();
    local by_window = MOCK.printed_since(n);
    check(tab .. ' Print a sample and /checkmate sample', #by_window == 2 and same(by_window, by_command),
        table.concat(by_window, ' / ') .. ' vs ' .. table.concat(by_command, ' / '));
end

-- The window shows what a command set.
MOCK.command('/checkmate ranges middle');
MOCK.command('/checkmate spell enfeebling paralyze');
MOCK.command('/checkmate sort name');
MOCK.command('/checkmate move drops up');
MOCK.command('/checkmate divider custom ++');
frame();
check('the window shows what the commands set', MOCK.gui.previews['Printout/Number ranges'] == 'Middle ~68%'
    and MOCK.gui.previews['Magic/enfeebling/##spell'] == 'Paralyze' and MOCK.gui.previews['Drops/Order'] == 'By name'
    and MOCK.gui.disabled['Printout/drops/##down'] == nil and MOCK.gui.disabled['Printout/elements/##down'] == nil
    and MOCK.gui.disabled['Printout/pet/##down'] == true and MOCK.gui.paths['Printout/Custom text'] == 'InputText');

-- A profile keeps everything these commands set, and loading it brings it all back.
reset();
local PROFILE_COMMANDS = {
    '/checkmate label name Mob', '/checkmate label hit Acc', '/checkmate newline hit on', '/checkmate move evade up',
    '/checkmate tag off', '/checkmate divider custom " | "', '/checkmate ranges middle', '/checkmate cutoff hit good 90',
    '/checkmate cutoff crit ok 6', '/checkmate spell enfeebling sleep', '/checkmate macc 25', '/checkmate maxitems 0',
    '/checkmate minchance 2.5', '/checkmate sort name', '/checkmate thlabel off', '/checkmate dropnotes off',
    '/checkmate immunity sleep off', '/checkmate immunitylabel bind Bnd', '/checkmate rounding 9', '/checkmate spacing 10',
    '/checkmate petlevel off', '/checkmate pethitword Acc',
};
for _, command in ipairs(PROFILE_COMMANDS) do
    MOCK.command(command);
end
local function profile_values(s)
    local p = s.printout;
    return {
        p.parts.name.label, p.parts.hit.label, p.parts.hit.new_line, p.order, p.header, p.divider, p.separator,
        p.number_style, s.grades.hit_good, s.grades.crit_ok, s.magic.schools.enfeebling.spell, s.magic.extra_accuracy,
        s.drops.max_items, s.drops.min_chance, s.drops.sort, s.drops.th_in_label, s.drops.notes,
        s.immunities.dark_sleep.on, s.immunities.bind.label, s.look.imgui.rounding, s.look.imgui.spacing,
        s.pet.show_level, s.pet.hit_word,
    };
end
local set = profile_values(cur());
check('the commands set every value', same(set, { 'Mob', 'Acc', true, 'difficulty evade hit crit aggro magic immunities '
    .. 'elements drops pet', false, 'custom', ' | ', 'midpoint', 90, 6, 'sleep', 25, 0, 2.5, 'name', false, false, false,
    'Bnd', 9, 10, false, 'Acc' }), show(set));
MOCK.command('/checkmate profile save Everything');
MOCK.command('/checkmate joblink war Everything');
local f = assert(io.open(MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json', 'r'));
local saved = json.decode(f:read('*a'));
f:close();
local everything = saved.Everything;
check('profiles.json holds them', everything.printout.parts.name.label == 'Mob' and everything.printout.header == false
    and everything.printout.separator == ' | ' and everything.grades.hit_good == 90 and everything.drops.min_chance == 2.5
    and everything.magic.schools.enfeebling.spell == 'sleep' and everything.immunities.bind.label == 'Bnd'
    and everything.look.imgui.rounding == 9 and everything.pet.show_level == false and everything.pet.hit_word == 'Acc'
    and everything.job_links == nil);
MOCK.command('/checkmate label name Other');
MOCK.command('/checkmate rounding 2');
MOCK.command('/checkmate profile load Everything');
check('loading it brings every value back and keeps the job link', same(profile_values(cur()), set)
    and same(profile_values(MOCK.last_save), set) and cur().job_links.WAR == 'Everything', show(profile_values(cur())));
reset();
check('a reset puts them back to the defaults', not same(profile_values(cur()), set)
    and cur().printout.parts.name.label == '' and cur().look.imgui.rounding == 0);
MOCK.command('/checkmate profile load Everything');
check('and the profile brings them back again', same(profile_values(cur()), set));

for _, name in ipairs({ 'Everything', 'Fresh', 'Over', 'Three', 'New', 'Linked' }) do
    profiles.delete(cur(), name);
end
check('every test profile is gone', #profiles.names() == 0, table.concat(profiles.names(), ', '));

return MOCK.report();
