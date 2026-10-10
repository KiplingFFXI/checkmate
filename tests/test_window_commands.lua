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
    MOCK.avail = 1100;
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
    { 'Show the name', click('Display/chat_format/Show the name##name'), '/checkmate hide name',
        function (s) return s.printout.parts.name.on; end },
    { 'the name\'s label', type_in('Display/chat_format/Label##name', 'Mob'), '/checkmate label name Mob',
        function (s) return s.printout.parts.name.label; end, release = true },
    { 'Show level', click('Display/chat_format/Show level'), '/checkmate level off',
        function (s) return s.printout.show_level; end },
    { 'Show its level range too', click('Display/chat_format/Show its level range too'), '/checkmate levelrange on',
        function (s) return s.printout.show_range; end },
    { 'the range word', type_in('Display/chat_format/Range word', 'spawns'), '/checkmate rangeword spawns',
        function (s) return s.printout.range_word; end, release = true,
        setup = function (s) s.printout.show_range = true; end },
    { 'Show its ID', click('Display/chat_format/Show its ID'), '/checkmate id on',
        function (s) return s.printout.show_id; end },
    { 'the ID word', type_in('Display/chat_format/ID word', 'Mob'), '/checkmate idword Mob',
        function (s) return s.printout.id_word; end, release = true,
        setup = function (s) s.printout.show_id = true; end },
    { 'Show if it\'s a PH', click('Display/chat_format/Show if it\'s a PH'), '/checkmate ph on',
        function (s) return s.printout.show_ph; end },
    { 'the PH word', type_in('Display/chat_format/PH word', 'PH:'), '/checkmate phword PH:',
        function (s) return s.printout.ph_word; end, release = true,
        setup = function (s) s.printout.show_ph = true; end },
    { 'a part\'s On box', click('Display/drops/##chat'), '/checkmate show drops',
        function (s) return s.printout.parts.drops.on; end },
    { 'the Pet part\'s On box', click('Display/pet/##chat'), '/checkmate show pet',
        function (s) return s.printout.parts.pet.on; end },
    { 'the Off-hand part\'s On box', click('Display/offhand/##chat'), '/checkmate show offhand',
        function (s) return s.printout.parts.offhand.on; end },
    { 'the Ranged part\'s label', type_in('Display/ranged/##label', 'Bow'), '/checkmate label ranged Bow',
        function (s) return s.printout.parts.ranged.label; end, release = true },
    { 'the Ranged part\'s New line', click('Display/ranged/##new_line'), '/checkmate newline ranged on',
        function (s) return s.printout.parts.ranged.new_line; end },
    { 'the Steal part\'s On box', click('Display/steal/##chat'), '/checkmate show steal',
        function (s) return s.printout.parts.steal.on; end },
    { 'the Steal part\'s label', type_in('Display/steal/##label', 'Pilfer'), '/checkmate label steal Pilfer',
        function (s) return s.printout.parts.steal.label; end, release = true },
    { 'the Steal part\'s New line', click('Display/steal/##new_line'), '/checkmate newline steal off',
        function (s) return s.printout.parts.steal.new_line; end },
    { 'the Steal part\'s up arrow', click('Display/steal/##up'), '/checkmate move steal up',
        function (s) return s.printout.order; end },
    { 'the Job part\'s On box', click('Display/job/##chat'), '/checkmate show job',
        function (s) return s.printout.parts.job.on; end },
    { 'the Job part\'s label', type_in('Display/job/##label', 'Class'), '/checkmate label job Class',
        function (s) return s.printout.parts.job.label; end, release = true },
    { 'the Job part\'s New line', click('Display/job/##new_line'), '/checkmate newline job off',
        function (s) return s.printout.parts.job.new_line; end },
    { 'the Job part\'s up arrow', click('Display/job/##up'), '/checkmate move job up',
        function (s) return s.printout.order; end },
    { 'the Crit taken part\'s On box', click('Display/crittaken/##chat'), '/checkmate show crittaken',
        function (s) return s.printout.parts.crittaken.on; end },
    { 'the Links part\'s On box', click('Display/links/##chat'), '/checkmate hide links',
        function (s) return s.printout.parts.links.on; end },
    { 'the Links part\'s label', type_in('Display/links/##label', 'Pulls'), '/checkmate label links Pulls',
        function (s) return s.printout.parts.links.label; end, release = true },
    { 'the Links part\'s New line', click('Display/links/##new_line'), '/checkmate newline links on',
        function (s) return s.printout.parts.links.new_line; end },
    { 'the Links part\'s up arrow', click('Display/links/##up'), '/checkmate move links up',
        function (s) return s.printout.order; end },
    { 'a part\'s label', type_in('Display/hit/##label', 'Acc'), '/checkmate label hit Acc',
        function (s) return s.printout.parts.hit.label; end, release = true },
    { 'a cleared label', type_in('Display/aggro/##label', ''), '/checkmate label aggro ""',
        function (s) return s.printout.parts.aggro.label; end, release = true },
    -- A middle dot, typed in UTF-8 in the window and in Shift-JIS in the chat line. Its second Shift-JIS byte is E.
    { 'a label cleaned of what chat can\'t show', type_in('Display/crit/##label', 'Crit\227\131\187 %'),
        '/checkmate label crit "Crit\129\69 %"', function (s) return s.printout.parts.crit.label; end,
        release = true },
    { 'New line on', click('Display/hit/##new_line'), '/checkmate newline hit on',
        function (s) return s.printout.parts.hit.new_line; end },
    { 'New line off', click('Display/drops/##new_line'), '/checkmate newline drops off',
        function (s) return s.printout.parts.drops.new_line; end },
    { 'an up arrow', click('Display/evade/##up'), '/checkmate move evade up',
        function (s) return s.printout.order; end },
    { 'a down arrow', click('Display/difficulty/##down'), '/checkmate move difficulty down',
        function (s) return s.printout.order; end },
    { 'the Off-hand part\'s up arrow', click('Display/offhand/##up'), '/checkmate move offhand up',
        function (s) return s.printout.order; end },
    { 'the reading\'s On box', click('Display/reading/##chat'), '/checkmate hide reading',
        function (s) return s.printout.parts.reading.on; end },
    { 'Defense first', click('Display/chat_format/Defense first'), '/checkmate reading defense',
        function (s) return s.printout.defense_first; end },
    { 'Put the extras on their own line', click('Display/chat_format/Put the extras on their own line'), '/checkmate extras same',
        function (s) return s.printout.extras_own_line; end },
    { '[checkmate] at the start of each line', click('Display/chat_format/[checkmate] at the start of each line'),
        '/checkmate tag off', function (s) return s.printout.header; end },
    { 'a divider', pick('Display/chat_format/Divider', 'Arrow'), '/checkmate divider arrow',
        function (s) return s.printout.divider; end },
    { 'the custom divider\'s text', custom_text('Display/chat_format/Divider', 'Display/chat_format/Custom text', ' | '),
        '/checkmate divider custom " | "', function (s) return { s.printout.divider, s.printout.separator }; end,
        release = true },
    { 'a label divider', pick('Display/chat_format/Label divider', 'Space only'), '/checkmate labeldivider space',
        function (s) return s.printout.label_divider; end },
    { 'the custom label divider\'s text', custom_text('Display/chat_format/Label divider', 'Display/chat_format/Custom text##label', '>'),
        '/checkmate labeldivider custom >',
        function (s) return { s.printout.label_divider, s.printout.label_separator }; end, release = true },
    { 'Number ranges', pick('Display/chat_format/Number ranges', 'Middle ~68%'), '/checkmate ranges middle',
        function (s) return s.printout.number_style; end },
    { 'Element icons', click('Display/chat_format/Element icons'), '/checkmate icons on',
        function (s) return s.printout.icons; end },
    { 'the chat\'s Icons only', click('Display/chat_format/Icons only'), '/checkmate iconsonly on',
        function (s) return s.printout.icons_only; end, setup = function (s) s.printout.icons = true; end },
    { 'Replace the game\'s /check line', click('Display/chat_format/Replace the game\'s /check line'), '/checkmate replace off',
        function (s) return s.printout.replace_game_line; end },

    -- Overlay tab.
    { 'Show the overlay', click('Display/overlay_options/Show the overlay'), '/checkmate overlay on',
        function (s) return s.overlay.on; end },
    { 'Lock it in place', click('Display/overlay_options/Lock it in place'), '/checkmate overlaylock on',
        function (s) return s.overlay.locked; end },
    { 'Remember each monster\'s /check', click('Display/overlay_options/Remember each monster\'s /check'), '/checkmate overlayremember off',
        function (s) return s.overlay.remember; end },
    { 'Follow the cursor', click('Display/overlay_options/Follow the cursor while you pick a target'), '/checkmate overlaycursor on',
        function (s) return s.overlay.follow_cursor; end },
    { 'Move it back', click('Display/overlay_options/Move it back'), '/checkmate overlayspot reset',
        function (s) return { s.window.overlay_x, s.window.overlay_y }; end,
        setup = function (s) s.window.overlay_x, s.window.overlay_y = 300, 400; end },
    { 'an overlay part\'s On box', click('Display/drops/##overlay'), '/checkmate overlayshow drops',
        function (s) return s.overlay.parts.drops; end },
    { 'the overlay\'s Crit row', click('Display/crit/##overlay'), '/checkmate overlayshow crit',
        function (s) return s.overlay.parts.crit; end },
    { 'the overlay\'s Crit taken row', click('Display/crittaken/##overlay'), '/checkmate overlayshow crittaken',
        function (s) return s.overlay.parts.crittaken; end },
    { 'the overlay\'s Magic row', click('Display/magic/##overlay'), '/checkmate overlayshow magic',
        function (s) return s.overlay.parts.magic; end },
    { 'the overlay\'s Steal row', click('Display/steal/##overlay'), '/checkmate overlayshow steal',
        function (s) return s.overlay.parts.steal; end },
    { 'the overlay\'s Job row', click('Display/job/##overlay'), '/checkmate overlayshow job',
        function (s) return s.overlay.parts.job; end },
    { 'the overlay\'s Links row', click('Display/links/##overlay'), '/checkmate overlayhide links',
        function (s) return s.overlay.parts.links; end },
    { 'the overlay\'s name row', click('Display/name/##overlay'), '/checkmate overlayhide name',
        function (s) return s.overlay.parts.name; end },
    { 'the overlay\'s reading row', click('Display/reading/##overlay'), '/checkmate overlayhide reading',
        function (s) return s.overlay.parts.reading; end },
    { 'the overlay\'s Show level', click('Display/overlay_options/Show level'), '/checkmate overlaylevel off',
        function (s) return s.overlay.show_level; end },
    { 'the overlay\'s Show its level range too', click('Display/overlay_options/Show its level range too'), '/checkmate overlayrange on',
        function (s) return s.overlay.show_range; end },
    { 'the overlay\'s Show its ID', click('Display/overlay_options/Show its ID'), '/checkmate overlayid on',
        function (s) return s.overlay.show_id; end },
    { 'the overlay\'s Show if it\'s a PH', click('Display/overlay_options/Show if it\'s a PH'), '/checkmate overlayph on',
        function (s) return s.overlay.show_ph; end },
    { 'Put each part on its own line', click('Display/overlay_options/Put each part on its own line'), '/checkmate overlaylines off',
        function (s) return s.overlay.own_lines; end },
    { 'the overlay\'s Abbreviations', click('Display/overlay_options/Abbreviations'), '/checkmate overlayabbreviations on',
        function (s) return s.overlay.short_words; end },
    { 'the overlay\'s divider', pick('Display/overlay_options/Divider', 'Slash /'), '/checkmate overlaydivider slash',
        function (s) return s.overlay.divider; end },
    { 'the overlay\'s custom divider text', custom_text('Display/overlay_options/Divider', 'Display/overlay_options/Custom text', ' ~ '),
        '/checkmate overlaydivider custom " ~ "', function (s) return { s.overlay.divider, s.overlay.separator }; end,
        release = true },
    { 'the overlay\'s font', pick('Appearance/overlay_appearance/Font', 'Arial'), '/checkmate overlayfont arial',
        function (s) return s.overlay.font; end },
    { 'the overlay\'s font size', slide('Appearance/overlay_appearance/Font size', 22), '/checkmate overlayfontsize 22',
        function (s) return s.overlay.font_size; end, release = true },
    { 'the overlay\'s background', slide('Appearance/overlay_appearance/Background', 0), '/checkmate overlayopacity 0',
        function (s) return s.overlay.opacity; end, release = true },
    { 'the overlay\'s border', click('Appearance/overlay_appearance/Border'), '/checkmate overlayborder off',
        function (s) return s.overlay.border; end },
    { 'Wrap lines wider than', slide('Appearance/overlay_appearance/Wrap lines wider than', 0), '/checkmate overlaywrap 0',
        function (s) return s.overlay.wrap; end, release = true },
    { 'Show icons', click('Display/overlay_options/Show icons'), '/checkmate overlayicons off',
        function (s) return s.overlay.icons; end },
    { 'the overlay\'s Icons only', click('Display/overlay_options/Icons only'), '/checkmate overlayiconsonly on',
        function (s) return s.overlay.icons_only; end },
    { 'Element look', pick('Display/overlay_options/Element look', 'Colored badges'), '/checkmate overlayelementlook badges',
        function (s) return s.overlay.element_look; end },
    { 'Tips on hover', click('Display/overlay_options/Tips on hover'), '/checkmate overlaytips off',
        function (s) return s.overlay.tips; end },
    { 'In cutscenes and NPC talk', click('Display/overlay_options/In cutscenes and NPC talk'), '/checkmate overlaycutscenes off',
        function (s) return s.overlay.hide_in_events; end },
    { 'While the game\'s interface is hidden', click('Display/overlay_options/While the game\'s interface is hidden'),
        '/checkmate overlayui off', function (s) return s.overlay.hide_with_ui; end },
    { 'While the map is open', click('Display/overlay_options/While the map is open'), '/checkmate overlaymap off',
        function (s) return s.overlay.hide_on_map; end },

    -- Appearance tab.
    { 'Color by difficulty', click('Appearance/Color by difficulty'), '/checkmate concolors off',
        function (s) return s.printout.con_colors; end },
    { 'Color by threat', click('Appearance/Color by threat'), '/checkmate threatcolors off',
        function (s) return s.aggro.threat_colors; end },
    { 'grade colors', click('Appearance/Color by grade'), '/checkmate grades off',
        function (s) return s.grades.on; end },
    { 'a chat color', pick('Appearance/##hit_label', 'Coral'), '/checkmate color hit_label coral',
        function (s) return s.colors.hit_label; end },
    { 'a pet chat color', pick('Appearance/##pet_name', 'Coral'), '/checkmate color pet_name coral',
        function (s) return s.colors.pet_name; end },
    { 'a ranged chat color', pick('Appearance/##ranged_detail', 'Coral'), '/checkmate color ranged_detail coral',
        function (s) return s.colors.ranged_detail; end },
    { 'a steal chat color', pick('Appearance/##steal_number', 'Coral'), '/checkmate color steal_number coral',
        function (s) return s.colors.steal_number; end },
    { 'a job chat color', pick('Appearance/##job_name', 'Coral'), '/checkmate color job_name coral',
        function (s) return s.colors.job_name; end },
    { 'a links chat color', pick('Appearance/##links_words', 'Coral'), '/checkmate color links_words coral',
        function (s) return s.colors.links_words; end },
    { 'a crit taken chat color', pick('Appearance/##crittaken_number', 'Coral'), '/checkmate color crittaken_number coral',
        function (s) return s.colors.crittaken_number; end },
    { 'a badge color', pick('Appearance/##badge_fire', 'Coral'), '/checkmate color badge_fire coral',
        function (s) return s.colors.badge_fire; end },

    -- Numbers tab.
    { 'shield block in chat', click('Numbers/block/In chat'), '/checkmate show block',
        function (s) return s.printout.parts.block.on; end },
    { 'shield block in the overlay', click('Numbers/block/In overlay'), '/checkmate overlayshow block',
        function (s) return s.overlay.parts.block; end },
    { 'parry in chat', click('Numbers/parry/In chat'), '/checkmate show parry',
        function (s) return s.printout.parts.parry.on; end },
    { 'parry in the overlay', click('Numbers/parry/In overlay'), '/checkmate overlayshow parry',
        function (s) return s.overlay.parts.parry; end },
    { 'main-hand pDIF in chat', click('Numbers/pdif/In chat'), '/checkmate show pdif',
        function (s) return s.printout.parts.pdif.on; end },
    { 'off-hand pDIF in the overlay', click('Numbers/offhandpdif/In overlay'), '/checkmate overlayshow offhandpdif',
        function (s) return s.overlay.parts.offhandpdif; end },
    { 'ranged pDIF in chat', click('Numbers/rangedpdif/In chat'), '/checkmate show rangedpdif',
        function (s) return s.printout.parts.rangedpdif.on; end },
    { 'pDIF ratio mode', pick('Numbers/pDIF display', 'Attack/Defense ratio'), '/checkmate pdifmode ratio',
        function (s) return s.pdif.mode; end },
    { 'pDIF multiplier mode', pick('Numbers/pDIF display', 'Multiplier range'), '/checkmate pdifmode range',
        function (s) return s.pdif.mode; end },
    { 'pDIF both mode', pick('Numbers/pDIF display', 'Both'), '/checkmate pdifmode both',
        function (s) return s.pdif.mode; end, setup = function (s) s.pdif.mode = 'range'; end },
    { 'a Good cutoff', slide('Numbers/##hit_good', 90), '/checkmate cutoff hit good 90',
        function (s) return s.grades.hit_good; end, release = true },
    { 'an OK cutoff', slide('Numbers/##crit_ok', 6), '/checkmate cutoff crit ok 6',
        function (s) return s.grades.crit_ok; end, release = true },
    { 'the Crit taken Good cutoff', slide('Numbers/##crittaken_good', 3), '/checkmate cutoff crittaken good 3',
        function (s) return s.grades.crittaken_good; end, release = true },
    { 'the Crit taken OK cutoff', slide('Numbers/##crittaken_ok', 12), '/checkmate cutoff crittaken ok 12',
        function (s) return s.grades.crittaken_ok; end, release = true },
    { 'Critical Hit Rate', slide('Numbers/##crit_merits', 3), '/checkmate critmerits 3',
        function (s) return s.merits.crit_hit_rate; end, release = true },
    { 'Enemy Critical Hit Rate', slide('Numbers/##enemy_crit_merits', 2), '/checkmate enemycritmerits 2',
        function (s) return s.merits.enemy_crit_rate; end, release = true },
    { 'Fill both in when you zone', click('Numbers/Fill both in when you zone'), '/checkmate meritfill off',
        function (s) return s.merits.fill_in; end },
    { 'Show its name', click('Pets/Show its name'), '/checkmate petname off',
        function (s) return s.pet.show_name; end },
    { 'Show its level', click('Pets/Show its level'), '/checkmate petlevel off',
        function (s) return s.pet.show_level; end },
    { 'the pet\'s Hit word', type_in('Pets/Hit word', 'Acc'), '/checkmate pethitword Acc',
        function (s) return s.pet.hit_word; end, release = true },
    { 'a cleared Evade word', type_in('Pets/Evade word', ''), '/checkmate petevadeword ""',
        function (s) return s.pet.evade_word; end, release = true },
    { 'Show it outside the sweet spot too', click('Numbers/Show it outside the sweet spot too'), '/checkmate rangedfar on',
        function (s) return s.ranged.show_far; end },
    { 'Show current distance', click('Numbers/Show current distance'), '/checkmate rangeddistance on',
        function (s) return s.ranged.show_distance; end },

    -- Aggro tab.
    { 'Show how it finds you', click('Aggro/Show how it finds you'), '/checkmate detection off',
        function (s) return s.aggro.detection; end },
    { 'Show how each one links', click('Aggro/Show how each one links'), '/checkmate linkhow off',
        function (s) return s.links.link_how; end },
    { 'Show the names it links with', click('Aggro/Show the names it links with'), '/checkmate linknames off',
        function (s) return s.links.link_names; end },
    { 'Group names by family', click('Aggro/Group names by family'), '/checkmate linkfamilies off',
        function (s) return s.links.group_families; end },
    { 'Most entries shown', slide('Aggro/Most entries shown', 0), '/checkmate maxlinks 0',
        function (s) return s.links.max_links; end, release = true },

    -- Magic tab.
    { 'Include known gear and merits', click('Magic/Include known gear and merits'), '/checkmate knownmagic off',
        function (s) return s.magic.known_inputs; end },
    { 'a school box', click('Magic/elemental/Elemental'), '/checkmate school elemental on',
        function (s) return s.magic.schools.elemental.on; end },
    { 'a stand-in spell', pick('Magic/enfeebling/##spell', 'Sleep'), '/checkmate spell enfeebling sleep',
        function (s) return s.magic.schools.enfeebling.spell; end },
    { 'a stand-in spell by its name', pick('Magic/singing/##spell', 'Foe Requiem'), '/checkmate spell singing "Foe Requiem"',
        function (s) return s.magic.schools.singing.spell; end },
    { 'extra magic accuracy', slide('Magic/##extra_accuracy', 25), '/checkmate macc 25',
        function (s) return s.magic.extra_accuracy; end, release = true },
    { 'the weak word', type_in('Weaknesses/Weak word', 'Soft'), '/checkmate weakword Soft',
        function (s) return s.elements.weak_word; end, release = true },
    { 'a cleared resists word', type_in('Weaknesses/Resists word', ''), '/checkmate resistword ""',
        function (s) return s.elements.resist_word; end, release = true },
    { 'Show how strong each one is', click('Weaknesses/Show how strong each one is'), '/checkmate strength off',
        function (s) return s.elements.strength; end },

    { 'weapon weak word', type_in('Weaknesses/Weapon weak word', 'Vulnerable'), '/checkmate weaponsweakword Vulnerable',
        function (s) return s.weapons.weak_word; end, release = true },
    { 'weapon resists word', type_in('Weaknesses/Weapon resists word', ''), '/checkmate weaponsresistword ""',
        function (s) return s.weapons.resist_word; end, release = true },

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

    -- Weaknesses tab.
    { 'an immunity\'s box', click('Weaknesses/dark_sleep/##on'), '/checkmate immunity sleep off',
        function (s) return s.immunities.dark_sleep; end },
    { 'an immunity\'s label', type_in('Weaknesses/bind/##label', 'Bnd'), '/checkmate immunitylabel bind Bnd',
        function (s) return s.immunities.bind; end, release = true },
    { 'which effects show', pick('Effects/Show', 'Only debuffs'), '/checkmate effects debuffs',
        function (s) return s.effects.show; end },
    { 'effect time left', click('Effects/Time left'), '/checkmate effecttimes off',
        function (s) return s.effects.times; end },
    { 'estimated effect marks', click('Effects/Mark estimated times with ~'), '/checkmate effectestimates on',
        function (s) return s.effects.estimate_mark; end },
    { 'empty effect wording', click('Effects/Say when none were observed'), '/checkmate effectempty on',
        function (s) return s.effects.show_empty; end },

    -- Abbreviations tab.
    { 'In chat', click('Abbreviations/In chat'), '/checkmate abbreviations on', function (s) return s.printout.short_words; end },
    { 'In the overlay', click('Abbreviations/In the overlay'), '/checkmate overlayabbreviations on',
        function (s) return s.overlay.short_words; end },
    { 'an abbreviation', type_in('Abbreviations/con_tough/##short', 'x'), '/checkmate abbreviation con_tough x',
        function (s) return s.short.con_tough; end, release = true,
        setup = function (s) s.printout.short_words = true; end },
    { 'a cleared abbreviation', type_in('Abbreviations/list_more/##short', ''), '/checkmate abbreviation list_more ""',
        function (s) return s.short.list_more; end, release = true,
        setup = function (s) s.printout.short_words = true; s.short.list_more = 'more'; end },
    { 'Reset every abbreviation', click('Abbreviations/Reset every abbreviation'), '/checkmate abbreviationreset all',
        function (s) return s.short; end,
        setup = function (s) s.printout.short_words = true; s.short.con_tough, s.short.sense_sound = 'x', 'S'; end },

    -- Appearance tab.
    { 'a skin', pick('Appearance/##skin', 'Ember'), '/checkmate skin ember', look_of },
    { 'Reset to skin', click('Appearance/Reset to skin'), '/checkmate skin phoenix', look_of,
        setup = function (s) s.look.imgui.rounding = 5; s.colors.name = 1; end },
    { 'Undo', click('Appearance/Undo'), '/checkmate skin undo', look_of,
        setup = function () MOCK.command('/checkmate skin ember'); end },
    { 'a font', pick('Appearance/Font', 'Arial'), '/checkmate font arial', function (s) return s.look.font; end },
    { 'Font size', slide('Appearance/Font size', 22), '/checkmate fontsize 22', function (s) return s.look.font_size; end,
        release = true },
    { 'Corner roundness', slide('Appearance/Corner roundness', 9), '/checkmate rounding 9',
        function (s) return s.look.imgui.rounding; end, release = true },
    { 'Spacing', slide('Appearance/Spacing', 10), '/checkmate spacing 10', function (s) return s.look.imgui.spacing; end,
        release = true },
    { 'a window color', slide('Appearance/Buttons##buttons', 0x33 / 255), '/checkmate windowcolor buttons 331f1f',
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

local display_rows = {};
for _, section in ipairs(require('core.parts').INFO) do
    if (section.id ~= 'charm') then display_rows[#display_rows + 1] = { section.id, section.tab }; end
end
display_rows[#display_rows + 1] = { 'pet', 'Pets' };
display_rows[#display_rows + 1] = { 'weaknesses', 'Weaknesses' };
for _, row in ipairs(display_rows) do
    local id, tab = row[1], row[2];
    for _, display in ipairs({ 'chat', 'overlay' }) do
        local label = display == 'chat' and 'In chat' or 'In overlay';
        if (tab == 'Monster') then label = '##' .. display; end
        local command = display == 'chat' and 'show' or 'overlayshow';
        PAIRS[#PAIRS + 1] = { id .. ' ' .. display, click(tab .. '/' .. id .. '/' .. label),
            '/checkmate ' .. command .. ' ' .. id,
            function (s) return { s.printout.parts[id].on, s.overlay.parts[id] }; end };
    end
end
for _, group in ipairs({
    { key = 'weaknesses', tab = 'Weaknesses', command = 'weakness', ids = { 'elements', 'weapons', 'immunities', 'charm' } },
    { key = 'blue', tab = 'Blue Magic', command = 'bluepart', ids = { 'lessons', 'chance' } },
}) do
    for _, id in ipairs(group.ids) do
        for _, display in ipairs({ 'chat', 'overlay' }) do
            PAIRS[#PAIRS + 1] = { group.key .. ' ' .. id .. ' ' .. display,
                click(group.tab .. '/components/' .. id .. '/##' .. display),
                '/checkmate ' .. group.command .. ' ' .. id .. ' ' .. display .. (id == 'chance' and ' on' or ' off'),
                function (s) return { s[group.key].chat[id], s[group.key].overlay[id] }; end };
        end
    end
end
PAIRS[#PAIRS + 1] = { 'Immune word', type_in('Weaknesses/Immune word', 'Immune to'), '/checkmate immuneword "Immune to"',
    function (s) return s.weaknesses.immune_word; end, release = true };
PAIRS[#PAIRS + 1] = { 'Show script warning', click('Weaknesses/Show script warning'), '/checkmate elementmark off',
    function (s) return s.elements.script_mark; end };
PAIRS[#PAIRS + 1] = { 'Undo delete', click('Profiles/Undo delete'), '/checkmate profile undo',
    function (s) return { profiles.exists('Undo me'), s.job_links.WAR }; end,
    setup = function (s) profiles.save(s, 'Undo me'); s.job_links.WAR = 'Undo me'; profiles.delete(s, 'Undo me'); end };

PAIRS[#PAIRS + 1] = { 'Only unlearned spells', click('Blue Magic/Only unlearned spells'), '/checkmate blueunlearned on',
    function (s) return s.blue.only_unlearned; end };
PAIRS[#PAIRS + 1] = { 'Show learning requirements', click('Blue Magic/Show learning requirements'), '/checkmate bluerequirements off',
    function (s) return s.blue.requirements; end };
PAIRS[#PAIRS + 1] = { 'Show observed move use', click('Blue Magic/Show observed move use'), '/checkmate blueseen on',
    function (s) return s.blue.seen; end };
for _, category in ipairs(require('core.dangers').CATEGORIES) do
    local id = category;
    local label = require('core.dangers').LABELS[id];
    PAIRS[#PAIRS + 1] = { 'Dangers: ' .. label, click('Monster/' .. label), '/checkmate danger' .. id .. ' off',
        function (s) return s.dangers[id]; end };
end
PAIRS[#PAIRS + 1] = { 'Most danger moves shown', slide('Monster/Most danger moves shown', 4), '/checkmate dangermoves 4',
    function (s) return s.dangers.max_moves; end, release = true };
for _, name in ipairs(require('ui.navigation').TAB_NAMES) do
    if (name ~= 'Appearance') then
        PAIRS[#PAIRS + 1] = { 'tab ' .. name, click('Appearance/tabs/' .. name),
            '/checkmate tab "' .. name .. '" off', function (s) return s.window.tabs[name]; end };
    end
end
PAIRS[#PAIRS + 1] = { 'Restore all tabs', click('Appearance/Restore all tabs'), '/checkmate tabs all',
    function (s) return s.window.tabs; end,
    setup = function (s) s.window.tabs.Pets, s.window.tabs.Monster = false, false; end };

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
check('every pair ran', #PAIRS == 226, #PAIRS);

-- Print a sample on each tab with one prints the same lines as /checkmate sample.
reset();
frame();
local n = #MOCK.printed;
MOCK.command('/checkmate sample');
local by_command = MOCK.printed_since(n);
for _, tab in ipairs({ 'Display/chat_format', 'Appearance', 'Abbreviations' }) do
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
MOCK.command('/checkmate overlaydivider custom ~');
MOCK.command('/checkmate overlayfont consolas');
frame();
check('the window shows what the commands set', MOCK.gui.previews['Display/chat_format/Number ranges'] == 'Middle ~68%'
    and MOCK.gui.previews['Magic/enfeebling/##spell'] == 'Paralyze' and MOCK.gui.previews['Drops/Order'] == 'By name'
    and MOCK.gui.disabled['Display/drops/##down'] == nil and MOCK.gui.disabled['Display/weaknesses/##down'] == nil
    and MOCK.gui.disabled['Display/pet/##down'] == true and MOCK.gui.paths['Display/chat_format/Custom text'] == 'InputText'
    and MOCK.gui.previews['Display/overlay_options/Divider'] == 'Custom' and MOCK.gui.paths['Display/overlay_options/Custom text'] == 'InputText'
    and MOCK.gui.previews['Appearance/overlay_appearance/Font'] == 'Consolas');

-- A profile keeps everything these commands set, and loading it brings it all back.
reset();
local PROFILE_COMMANDS = {
    '/checkmate label name Mob', '/checkmate label hit Acc', '/checkmate newline hit on', '/checkmate move evade up',
    '/checkmate tag off', '/checkmate divider custom " | "', '/checkmate ranges middle', '/checkmate cutoff hit good 90',
    '/checkmate cutoff crit ok 6', '/checkmate spell enfeebling sleep', '/checkmate macc 25', '/checkmate maxitems 0',
    '/checkmate minchance 2.5', '/checkmate sort name', '/checkmate thlabel off', '/checkmate dropnotes off',
    '/checkmate immunity sleep off', '/checkmate immunitylabel bind Bnd', '/checkmate rounding 9', '/checkmate spacing 10',
    '/checkmate petlevel off', '/checkmate pethitword Acc', '/checkmate label offhand OH', '/checkmate rangedfar on',
    '/checkmate overlayshow drops', '/checkmate overlaydivider custom " ~ "', '/checkmate overlayfontsize 20',
    '/checkmate overlaywrap 300', '/checkmate overlayph on', '/checkmate overlaymap off', '/checkmate show steal',
    '/checkmate label steal Pilfer', '/checkmate overlayshow steal', '/checkmate color steal_number white',
    '/checkmate show job', '/checkmate label job Class', '/checkmate newline job off', '/checkmate overlayshow job',
    '/checkmate color job_name white', '/checkmate label links Pulls', '/checkmate newline links on',
    '/checkmate maxlinks 3', '/checkmate linkhow off', '/checkmate overlayhide links', '/checkmate color links_detail white',
    '/checkmate abbreviations on', '/checkmate overlayabbreviations on', '/checkmate abbreviation con_tough x',
    '/checkmate abbreviation list_more more',
    '/checkmate show effects', '/checkmate label effects Affects', '/checkmate effects buffs',
    '/checkmate effecttimes off', '/checkmate overlayshow effects', '/checkmate color effects_time white',
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
        s.pet.show_level, s.pet.hit_word, p.parts.offhand.label, s.ranged.show_far, s.overlay.parts.drops,
        s.overlay.divider, s.overlay.separator, s.overlay.font_size, s.overlay.wrap, s.overlay.show_ph, s.overlay.hide_on_map,
        p.parts.steal.on, p.parts.steal.label, s.overlay.parts.steal, s.colors.steal_number,
        p.parts.job.on, p.parts.job.label, p.parts.job.new_line, s.overlay.parts.job, s.colors.job_name,
        p.parts.links.label, p.parts.links.new_line, s.links.max_links, s.links.link_how, s.overlay.parts.links,
        s.colors.links_detail, p.short_words, s.overlay.short_words, s.short.con_tough, s.short.list_more,
        p.parts.effects.on, p.parts.effects.label, s.effects.show, s.effects.times, s.overlay.parts.effects,
        s.colors.effects_time,
    };
end
local set = profile_values(cur());
check('the commands set every value', same(set, { 'Mob', 'Acc', true, 'difficulty hit pdif offhand offhandpdif ranged evade rangedpdif block parry crit crittaken '
    .. 'job aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet', false, 'custom', ' | ', 'midpoint', 90, 6, 'sleep', 25, 0,
    2.5, 'name', false, false, false, 'Bnd', 9, 10, false, 'Acc', 'OH', true, true, 'custom', ' ~ ', 20, 300, true, false,
    true, 'Pilfer', true, 1, true, 'Class', false, true, 1, 'Pulls', true, 3, false, false, 1, true, true, 'x', 'more',
    true, 'Affects', 'buffs', false, true, 1 }),
    show(set));
-- Where the overlay sits belongs to this screen, so a profile never moves it. Your merits belong to you, so a profile
-- never holds them.
MOCK.command('/checkmate overlayspot 300 400');
MOCK.command('/checkmate critmerits 2');
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
    and everything.printout.parts.offhand.label == 'OH' and everything.ranged.show_far == true
    and everything.overlay.parts.drops == true and everything.overlay.separator == ' ~ '
    and everything.overlay.font_size == 20 and everything.printout.parts.steal.on == true
    and everything.printout.parts.steal.label == 'Pilfer' and everything.overlay.parts.steal == true
    and everything.colors.steal_number == 1 and everything.printout.parts.job.on == true
    and everything.printout.parts.job.label == 'Class' and everything.printout.parts.job.new_line == false
    and everything.overlay.parts.job == true and everything.colors.job_name == 1 and everything.job_links == nil
    and everything.printout.parts.links.label == 'Pulls' and everything.links.max_links == 3
    and everything.links.link_how == false and everything.aggro.max_links == nil and everything.overlay.parts.links == false
    and everything.colors.links_detail == 1 and everything.printout.short_words == true
    and everything.overlay.short_words == true and everything.short.con_tough == 'x'
    and everything.short.list_more == 'more' and everything.printout.parts.effects.on == true
    and everything.printout.parts.effects.label == 'Affects' and everything.effects.show == 'buffs'
    and everything.effects.times == false and everything.overlay.parts.effects == true
    and everything.colors.effects_time == 1);
check('but not where the window or the overlay sits', everything.window == nil);
check('or your merits', everything.merits == nil);
MOCK.command('/checkmate label name Other');
MOCK.command('/checkmate rounding 2');
MOCK.command('/checkmate overlayfontsize 14');
MOCK.command('/checkmate overlayspot 50 60');
MOCK.command('/checkmate profile load Everything');
check('loading it brings every value back and keeps the job link', same(profile_values(cur()), set)
    and same(profile_values(MOCK.last_save), set) and cur().job_links.WAR == 'Everything', show(profile_values(cur())));
check('and leaves the overlay where it is', cur().window.overlay_x == 50 and cur().window.overlay_y == 60
    and MOCK.last_save.window.overlay_x == 50);
reset();
check('a reset puts them back to the defaults', not same(profile_values(cur()), set)
    and cur().printout.parts.name.label == '' and cur().look.imgui.rounding == 0);
MOCK.command('/checkmate profile load Everything');
check('and the profile brings them back again', same(profile_values(cur()), set));

-- A profile keeps the icon settings and badge colors these commands set too.
reset();
for _, command in ipairs({ '/checkmate icons on', '/checkmate iconsonly on', '/checkmate overlayicons off',
    '/checkmate overlayiconsonly on', '/checkmate overlayelementlook badges', '/checkmate overlaytips off',
    '/checkmate color badge_fire coral' }) do
    MOCK.command(command);
end
local function icon_values(s)
    return { s.printout.icons, s.printout.icons_only, s.overlay.icons, s.overlay.icons_only, s.overlay.element_look,
        s.overlay.tips, s.colors.badge_fire };
end
local icon_set = icon_values(cur());
check('the icon commands set every value', same(icon_set, { true, true, false, true, 'badges', false, 8 }),
    show(icon_set));
MOCK.command('/checkmate profile save Icons');
reset();
MOCK.command('/checkmate profile load Icons');
check('and a profile brings them back', same(icon_values(cur()), icon_set) and same(icon_values(MOCK.last_save), icon_set),
    show(icon_values(cur())));
profiles.delete(cur(), 'Icons');

for _, name in ipairs({ 'Everything', 'Fresh', 'Over', 'Three', 'New', 'Linked', 'Undo me' }) do
    profiles.delete(cur(), name);
end
check('every test profile is gone', #profiles.names() == 0, table.concat(profiles.names(), ', '));

return MOCK.report();
