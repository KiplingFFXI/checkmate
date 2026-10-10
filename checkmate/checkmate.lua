addon.name    = 'checkmate';
addon.author  = 'Kipling';
addon.version = '1.14.4';
addon.desc    = 'Monster details, combat estimates and your pet on /check for Phoenix.';
addon.link    = 'https://github.com/KiplingFFXI/checkmate';

--[[
    checkmate prints extra information after your own /check. The overlay shows what it knows about
    your target. Both use the bundled monster data and the replies your client already receives.

    Hit, off-hand, ranged, evade and pDIF can request /checkparam <me>. The Pet part can request
    /checkparam <pet>. Each waits 1.5 seconds after the last check request or reply so the game accepts
    it. Only its own six player or five pet reply lines are hidden.
    Replace check line also hides the game's /check line when a replacement is ready.

    The overlay reads local inputs at most four times a second when a calculation needs them.
    Effects tracks actions while a display or combat calculation needs its observations. Neither
    sends requests. Icons use the game's item and status pictures. Hover tips read the mouse position
    and leave clicks free to reach the game.
]]

require('common');

local settings = require('settings');

local packets    = require('core.packets');
local player     = require('core.player');
local monsters   = require('core.monsters');
local checkparam = require('core.checkparam');
local physical   = require('core.physical');
local pdif       = require('core.pdif');
local defenses   = require('core.defenses');
local pet        = require('core.pet');
local aggro      = require('core.aggro');
local magic      = require('core.magic');
local elements   = require('core.elements');
local weapons    = require('core.weapons');
local monster_info = require('core.info');
local display_parts = require('core.parts');
local drops      = require('core.drops');
local steal      = require('core.steal');
local effects    = require('core.effects');
local modifiers  = require('core.modifiers');
local target_info = require('core.target');
local check_details = require('core.check_details');
local dangers = require('core.dangers');
local lessons = require('core.lessons');
local blue_finder = require('core.blue_finder');
local printout   = require('core.printout');
local wording    = require('core.wording');
local spells     = require('data.spells');
local bands      = require('data.bands');
local defaults   = require('ui.defaults');
local skins      = require('ui.skins');
local profiles   = require('ui.profiles');
local window_font = require('ui.window_font');
local settings_window = require('ui.settings_window');
local overlay    = require('ui.overlay');
local icons      = require('ui.icons');
local navigation = require('ui.navigation');
local ui_tools = { history = require('ui.history'), presets = require('ui.presets') };

-- /check reply messages (0x029). 170 to 178 carry the level and con. 249 is "impossible to gauge".
local CHECK_FIRST      = 170;
local CHECK_LAST       = 178;
local CHECK_IMPOSSIBLE = 249;

-- A monster's death messages (0x029), "defeats" and "falls to the ground". It comes back at a new level.
local DEFEATS = 6;
local FALLS   = 20;

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
local NUMBER_PARTS = { 'hit', 'evade', 'block', 'parry', 'crit', 'crittaken', 'magic', 'pdif' };

-- The defaults the settings library keeps and merges into every settings file it loads.
local DEFAULT_SETTINGS = defaults.make();
-- Chat colors stay out of the defaults the settings library merges in, so tidy fills one a settings file
-- lacks from that file's own skin.
DEFAULT_SETTINGS.colors = T{};
DEFAULT_SETTINGS.window.tabs.Display = nil;
-- A saved manual accuracy total must not gain the same equipment bonuses a second time.
DEFAULT_SETTINGS.magic.known_inputs = nil;
-- Leave new rows missing until the old display choices have been migrated.
for _, id in ipairs(display_parts.INFO_IDS) do
    DEFAULT_SETTINGS.printout.parts[id], DEFAULT_SETTINGS.overlay.parts[id] = nil, nil;
end
DEFAULT_SETTINGS.printout.parts.weaknesses, DEFAULT_SETTINGS.overlay.parts.weaknesses = nil, nil;
DEFAULT_SETTINGS.weaknesses, DEFAULT_SETTINGS.blue, DEFAULT_SETTINGS.layout_version = nil, nil, nil;

local checkmate = {
    settings  = settings.load(DEFAULT_SETTINGS),
    my_id     = 0,       -- Your server id, which picks your own replies out of everyone's.
    ready     = {},      -- /checks with lines to print on the next frame, oldest first.
    job_check = true,    -- Set after zoning, until your main job has been read.
    last_job  = nil,     -- Your main job when last read. A change loads that job's linked profile.
    tracking  = false,
    lesson_tracking = false,
    lesson_broken = false,
    effects_broken = false,
    broken    = false,   -- Set when a frame failed, so the error isn't repeated every frame.
    overlay_broken = false,   -- Set when the overlay failed. It stays off until you turn it on again.
    check_token = 0,
    reset_asked = nil,   -- When you first typed /checkmate reset, by os.clock.
};

local function say(text)
    local s = checkmate.settings;
    print(printout.tag(s, addon.name) .. printout.paint(s, 'replies', text));
end

--[[
    The overlay. A mistake in it stops the overlay and never the chat printout.
]]

-- True while the overlay is on and neither it nor checkmate has stopped after an error.
local function overlay_on()
    return checkmate.settings.overlay.on == true and not checkmate.overlay_broken and not checkmate.broken;
end

-- Track effects while a display or combat calculation needs them. Turning tracking off clears them.
local function tracking_changed()
    local s = checkmate.settings;
    local chat, panel = s.printout.parts, s.overlay.parts;
    local combat = chat.hit.on or chat.offhand.on or chat.ranged.on or chat.evade.on or chat.crit.on
        or chat.crittaken.on or chat.magic.on or display_parts.blue_enabled(s, 'chance', 'chat') or chat.pet.on
        or chat.pdif.on or chat.offhandpdif.on or chat.rangedpdif.on;
    local overlay_combat = overlay_on() and (panel.hit or panel.offhand or panel.ranged or panel.evade
        or panel.crit or panel.crittaken or panel.magic
        or display_parts.blue_enabled(s, 'chance', 'overlay') or panel.pet or panel.pdif or panel.offhandpdif or panel.rangedpdif);
    local wanted = not checkmate.effects_broken and not checkmate.broken
        and (combat or overlay_combat or chat.effects.on == true or (overlay_on() and panel.effects == true));
    if (checkmate.tracking and not wanted) then
        effects.forget();
    end
    checkmate.tracking = wanted;
    if (s.blue.seen ~= true) then checkmate.lesson_broken = false; end
    local watch_moves = s.blue.seen == true and not checkmate.broken and not checkmate.lesson_broken
        and (display_parts.blue_enabled(s, 'lessons', 'chat')
            or (overlay_on() and display_parts.blue_enabled(s, 'lessons', 'overlay')));
    if (checkmate.lesson_tracking and not watch_moves) then lessons.forget(); end
    checkmate.lesson_tracking = watch_moves;
end

local function tell_lessons(handler, ...)
    if (not checkmate.lesson_tracking) then return; end
    local ok, err = pcall(handler, ...);
    if (not ok) then
        lessons.forget();
        checkmate.lesson_broken = true;
        tracking_changed();
        say(('Move observations stopped after an error: %s. Turn Show observed move use off and on to restart them.'):format(tostring(err)));
    end
end

local function effect_boxes()
    local s = checkmate.settings;
    return (s.printout.parts.effects.on == true and 1 or 0) + (s.overlay.parts.effects == true and 2 or 0);
end

local function effects_broke(err)
    checkmate.effects_broken = effect_boxes();
    tracking_changed();
    say(('Effects stopped after an error: %s. Turn the Effects part off or on, in chat or the overlay, to restart '
        .. 'them.'):format(tostring(err)));
end

effects.broke = effects_broke;

local function tell_effects(handler, ...)
    if (checkmate.tracking) then
        local ok, err = pcall(handler, ...);
        if (not ok) then
            effects_broke(err);
        end
    end
end

-- Stops the overlay after an error and says so once. The chat printout keeps going.
local function overlay_broke(err)
    checkmate.overlay_broken = true;
    overlay.forget();
    tracking_changed();
    say(('The overlay stopped after an error: %s. Turn it off and on again to restart it.'):format(tostring(err)));
end

-- Hands something that came in to the overlay. Its handlers only note it for the next frame, and this guard means
-- even a mistake in one can't stop the /check that's printing.
local function tell_overlay(handler, ...)
    if (overlay_on()) then
        local ok, err = pcall(handler, ...);
        if (not ok) then
            overlay_broke(err);
        end
    end
end

-- A setting changed. Turning the overlay off also clears its error, so turning it on again restarts it.
local function overlay_changed()
    local s = checkmate.settings;
    if (s.overlay.on ~= true) then
        checkmate.overlay_broken = false;
    end
    if (checkmate.effects_broken and checkmate.effects_broken ~= effect_boxes()) then
        checkmate.effects_broken = false;
    end
    tracking_changed();
    overlay.changed(s);
    if (overlay_on()) then
        icons.prepare(s.overlay);
    end
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

-- A whole number from `low` to `high`, or `default` when it isn't a number.
local function whole(value, low, high, default)
    value = tonumber(value);
    if (value == nil or value ~= value) then
        return default;
    end
    return math.max(low, math.min(high, math.floor(value + 0.5)));
end

-- The link settings a settings file or profile from before the links part kept with aggro, and the aggro color
-- each links color starts from.
local OLD_LINK_SETTINGS = { 'link_names', 'max_links', 'link_how' };
local OLD_LINK_COLORS = { links_label = 'aggro_label', links_words = 'aggro_words', links_detail = 'aggro_detail' };

--[[
    Settings from before Links was a part of its own keep the link settings with aggro. They move to the
    links settings, Links is on when Aggro is, and a links color that's missing starts as the aggro color it
    printed in, so the /check lines stay the same.
]]
local function split_links(s)
    local found = false;
    for _, key in ipairs(OLD_LINK_SETTINGS) do
        local old = rawget(s.aggro, key);
        if (old ~= nil) then
            -- One of the wrong type keeps the default, the way a profile's other settings do.
            if (type(old) == type(DEFAULT_SETTINGS.links[key])) then
                s.links[key] = old;
            end
            s.aggro[key], found = nil, true;
        end
    end
    if (not found) then
        return;
    end
    s.printout.parts.links.on = s.printout.parts.aggro.on;
    if (type(s.colors) == 'table') then
        for key, old in pairs(OLD_LINK_COLORS) do
            if (rawget(s.colors, key) == nil) then
                s.colors[key] = rawget(s.colors, old);
            end
        end
    end
end

local EFFECT_SHOWS = { both = true, debuffs = true, buffs = true };

-- Fixes anything a hand-edited settings file could get wrong.
local function tidy(s)
    own_tables(s, DEFAULT_SETTINGS);
    display_parts.migrate(s);
    if (type(s.dangers) ~= 'table') then s.dangers = T{}; end
    for _, id in ipairs(dangers.CATEGORIES) do
        if (type(s.dangers[id]) ~= 'boolean') then s.dangers[id] = true; end
    end
    s.dangers.max_moves = whole(s.dangers.max_moves, 0, dangers.MAX_MOVES, 0);
    if (s.pdif.mode ~= 'range' and s.pdif.mode ~= 'ratio' and s.pdif.mode ~= 'both') then s.pdif.mode = 'both'; end
    if (type(s.magic.known_inputs) ~= 'boolean') then
        s.magic.known_inputs = (tonumber(s.magic.extra_accuracy) or 0) == 0;
    end
    split_links(s);
    if (type(s.links.group_families) ~= 'boolean') then s.links.group_families = true; end
    local skin = skins.find(s.look.skin);
    defaults.fix_colors(s, skin and skin.chat);
    s.printout.order = printout.clean_order(s.printout.order);
    s.printout.separator = printout.clean_text(s.printout.separator);
    s.printout.divider = printout.divider_id(s.printout);
    s.printout.label_separator = printout.clean_text(s.printout.label_separator);
    s.printout.label_divider = printout.label_divider_id(s.printout);
    s.drops.th = drops.clamp_th(s.drops.th);
    if (not EFFECT_SHOWS[s.effects.show]) then
        s.effects.show = 'both';
    end
    for key, merit in pairs(physical.MERITS) do
        s.merits[key] = physical.clamp_merits(s.merits[key], merit.most);
    end
    s.look.font = window_font.clean_id(s.look.font);
    s.look.font_size = window_font.clean_size(s.look.font_size);
    local o, start = s.overlay, DEFAULT_SETTINGS.overlay;
    o.font = window_font.clean_id(o.font);
    o.font_size = whole(o.font_size, window_font.SIZE_MIN, window_font.SIZE_MAX, start.font_size);
    o.divider = overlay.divider_id(o);
    o.separator = printout.clean_text(o.separator):sub(1, printout.SEPARATOR_MAX);
    o.opacity = whole(o.opacity, 0, overlay.OPACITY_MAX, start.opacity);
    o.wrap = whole(o.wrap, 0, overlay.WRAP_MAX, start.wrap);
    o.element_look = (o.element_look == 'badges') and 'badges' or 'game';
    -- A spot that isn't a number would stop the overlay on every frame.
    local w = s.window;
    w.tabs = navigation.normalize(w.tabs);
    w.overlay_x = whole(w.overlay_x, 0, overlay.SPOT_MAX, DEFAULT_SETTINGS.window.overlay_x);
    w.overlay_y = whole(w.overlay_y, 0, overlay.SPOT_MAX, DEFAULT_SETTINGS.window.overlay_y);
    skins.fill(s);
end

local function save_settings()
    tidy(checkmate.settings);
    if (not ui_tools.undoing) then
        ui_tools.history.record(checkmate.settings, ui_tools.saved, ui_tools.label);
    end
    ui_tools.undoing, ui_tools.label = nil, nil;
    ui_tools.saved = ui_tools.history.capture(checkmate.settings);
    profiles.changed(checkmate.settings);
    settings.save();
    overlay_changed();
    settings_window.changed();
end

local function part_on(id)
    return checkmate.settings.printout.parts[id].on == true;
end

local function part_wanted(id)
    return part_on(id) or (overlay_on() and checkmate.settings.overlay.parts[id] == true);
end

local function parameters_wanted()
    return part_wanted('hit') or part_wanted('offhand') or part_wanted('ranged') or part_wanted('evade');
end

local function pdif_wanted()
    local s = checkmate.settings;
    local chat, panel = s.printout.parts, s.overlay.parts;
    return chat.pdif.on or chat.offhandpdif.on or chat.rangedpdif.on
        or (overlay_on() and (panel.pdif or panel.offhandpdif or panel.rangedpdif));
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
        range_low = check.range_low, range_high = check.range_high, id = check.id, ph_for = check.ph_for,
        ph_details = check.ph_details, provenance = check.provenance, ranged_distance = check.ranged_distance };
    if (part_on('effects') and checkmate.tracking) then
        if (check.display_effects == nil) then
            check.display_effects = effects.readout(check.id, s.effects.show, os.clock(), true) or false;
        end
        result.effects = check.display_effects or nil;
    end
    if (check.cant_gauge) then
        return result;
    end

    local physical_needed = part_on('hit') or part_on('offhand') or part_on('ranged') or part_on('evade')
        or part_on('crit') or part_on('crittaken');
    local magic_needed = part_on('magic') or display_parts.blue_enabled(s, 'chance', 'chat');
    local pdif_needed = part_on('pdif') or part_on('offhandpdif') or part_on('rangedpdif');
    local defenses_needed = part_on('block') or part_on('parry');
    local me, parameter_conditions_changed;
    if (physical_needed or magic_needed) then
        me = player.read();
        result.provenance.inputs_at = os.clock();
        me.modifiers = modifiers.read(me);
        result.inputs = me;
        local parameters = check.parameter_inputs;
        if (parameters ~= nil) then
            local valid, reason;
            valid, reason, parameter_conditions_changed = player.parameters_valid(parameters);
            if (not valid) then
                parameters, check.parameter_inputs = nil, nil;
                result.provenance.parameter_state = 'stale';
                result.provenance.parameter_reason = reason;
            end
        end
        if (parameters ~= nil) then
            me.accuracy, me.evasion = parameters.accuracy, parameters.evasion;
            me.offhand_accuracy, me.ranged_accuracy = parameters.offhand_accuracy, parameters.ranged_accuracy;
        end
        me.extra_accuracy = s.magic.extra_accuracy;
        me.crit_merits, me.enemy_crit_merits = s.merits.crit_hit_rate, s.merits.enemy_crit_rate;
        -- Keep the same gear bonus across both parts of a delayed reply.
        if (part_on('crittaken') and check.crit_evasion == nil) then
            check.crit_evasion = physical.crit_evasion(player.equipped_items(), me.level);
        end
        me.crit_evasion = check.crit_evasion;
    end
    if (physical_needed or magic_needed or pdif_needed or check.pet ~= nil) then
        check.effects = checkmate.tracking and effects.readout(check.id, 'both', os.clock()) or nil;
    end
    result.scripted = row ~= nil and row.flags ~= nil and row.flags.scripted_stats == true;
    -- Off-hand and ranged print when your gear had that weapon at your /check, so the lines stay the same
    -- before and after the reply.
    result.dual_wield = check.dual_wield == true;
    result.shoots = check.shoots == true;

    if (physical_needed) then
        local numbers = physical.readout(me, check);
        result.hit, result.evade, result.crit = numbers.hit, numbers.evade, numbers.crit;
        result.offhand, result.ranged, result.ranged_far = numbers.offhand, numbers.ranged, numbers.ranged_far;
        result.signet = numbers.signet;
        result.crittaken, result.tp_moves = numbers.crittaken, numbers.tp_moves;
        result.no_swings, result.counters = numbers.no_swings, numbers.counters;
        result.notes, result.uncertain = numbers.notes, numbers.uncertain;
        if (parameter_conditions_changed) then physical.qualify_parameters(result); end
    end
    if (pdif_needed) then
        local inputs, reason = check.pdif_inputs, check.pdif_reason;
        if (inputs ~= nil) then
            local valid;
            valid, reason = player.pdif_valid(inputs);
            if (not valid) then inputs = nil; end
        end
        if (inputs ~= nil and result.provenance.inputs_at == nil) then
            result.provenance.inputs_at = inputs.observed_at;
        end
        if (part_on('pdif')) then result.pdif = pdif.readout(inputs, check, 'main', reason); end
        if (part_on('offhandpdif')) then result.offhandpdif = pdif.readout(inputs, check, 'offhand', reason); end
        if (part_on('rangedpdif')) then result.rangedpdif = pdif.readout(inputs, check, 'ranged', reason); end
    end
    if (defenses_needed) then
        local own = player.defense_inputs();
        if (result.provenance.inputs_at == nil) then result.provenance.inputs_at = own.observed_at; end
        if (part_on('block')) then result.block = defenses.readout(own, check, 'block'); end
        if (part_on('parry')) then result.parry = defenses.readout(own, check, 'parry'); end
    end
    if (part_on('pet') and check.pet ~= nil) then
        result.pet = physical.pet_readout(check.pet, check);
        result.pet.scripted = result.scripted or check.pet.scripted;
    end
    -- The rest all need the monster's data row.
    if (row == nil) then
        return result;
    end
    if (part_on('job')) then
        result.job = row.job;
    end
    if (part_on('aggro')) then
        result.aggro = aggro.readout(row, check, me and me.level or player.main_level(), s.aggro);
    end
    if (part_on('links')) then
        result.links = aggro.links(row, s.links);
    end
    if (magic_needed) then
        result.magic = magic.readout(me, check, display_parts.magic_settings(s, 'chat'));
    end
    if (display_parts.component_enabled(s, 'immunities', 'chat')) then
        result.immune = row.immune;
    end
    if (display_parts.component_enabled(s, 'elements', 'chat')) then
        result.elements = elements.readout(row, check.low == check.high and check.low or nil);
    end
    if (display_parts.component_enabled(s, 'weapons', 'chat')) then
        result.weapons = weapons.readout(row, check.low == check.high and check.low or nil);
    end
    if (display_parts.any_info(s, 'chat')) then
        result.info = monster_info.readout(row, check.low, check.high,
            display_parts.info_settings(s, 'chat'), check.index);
    end
    if (part_on('drops')) then
        result.drops = drops.readout(row, s.drops);
    end
    if (part_on('steal')) then
        -- Your jobs and gear only matter for a monster with something to steal. They're read once, the first time
        -- its lines print, so they say the same thing before and after the /checkparam reply. False is "can't use
        -- Steal", so that's never read again either.
        if (check.thief == nil and row.steal ~= nil) then
            check.thief = steal.you(player.jobs()) or false;
        end
        result.steal = steal.readout(row, check.thief or nil, check.low, check.high);
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

-- A made-up /check that shows the printout with your settings. Its aggro and links go through your aggro
-- and links settings, its drops through your Treasure Hunter and drop settings, and its crit numbers through
-- your merits.
local SAMPLE_AGGRO = {
    aggro   = true,
    detects = { 'sight' },
    links   = { sight = { 'Goblin Butcher', 'Goblin Leecher', 'Goblin Tinkerer' } },
    link_families = {
        ['Goblin Butcher'] = { id = 58, name = 'Goblin' },
        ['Goblin Leecher'] = { id = 58, name = 'Goblin' },
        ['Goblin Tinkerer'] = { id = 58, name = 'Goblin' },
    },
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
-- Steal can take a Beastcoin from it. A made-up thief at its level with +2 Steal on stands in for you, so the
-- sample always shows a chance.
local SAMPLE_STEAL = { steal = { 656 } };
local SAMPLE_THIEF = { level = 42, bonus = 2 };
-- Its jobs, a DRK with a WAR support job, so the Job part shows both and the overlay both pictures.
local SAMPLE_JOB = 'drk/war';
-- Its ID. The idword answer shows it too.
local SAMPLE_ID = 17199202;
-- Its crit and crit taken before your merits. Your merits count the way they would for a made-up you at its
-- level, where all of them count.
local SAMPLE_CRIT, SAMPLE_CRIT_TAKEN, SAMPLE_LEVEL = 7, 9, 42;

local SAMPLE_EFFECTS = {
    { effect = 4, word = 'eff_paralysis', left = 80, mine = true, debuff = true },
    { effect = 13, word = 'eff_slow', left = 165, mine = false, debuff = true },
    { effect = 40, name = 'Protect', left = 1630, mine = false, debuff = false, own = true },
};

-- The sample's readout. The overlay shows it too, while the settings window is open and you have no monster
-- targeted.
local function sample_result(settings_override)
    local s = settings_override or checkmate.settings;
    local crit = SAMPLE_CRIT + physical.merit_bonus('crit_hit_rate', s.merits.crit_hit_rate, SAMPLE_LEVEL);
    local taken = math.max(0,
        SAMPLE_CRIT_TAKEN - physical.merit_bonus('enemy_crit_rate', s.merits.enemy_crit_rate, SAMPLE_LEVEL));
    local result = {
        name    = 'Sample Goblin',
        id      = SAMPLE_ID,
        low     = 42,
        high    = 42,
        con     = 3,   -- Decent challenge.
        reading = 1,   -- Normal evasion, the only reading that fits a 64-72% hit rate.
        defense = 2,   -- Low defense.
        hit     = { low = 64, high = 72 },
        -- You swing a weapon in each hand and have something to shoot, for the off-hand and ranged parts. With
        -- Show it outside the sweet spot too on, the ranged part adds ranged_far, your hit rate at 25 yalms.
        dual_wield = true,
        offhand    = { low = 58, high = 66 },
        shoots     = true,
        ranged     = { low = 61, high = 69 },
        ranged_far = { low = 50, high = 58 },
        pdif = pdif.readout({ level = 42, zone = 100, attack = 558 },
            { low = 42, high = 42, row = { levels = { [42] = { def = 365 } } } }, 'main'),
        offhandpdif = pdif.readout({ level = 42, zone = 100, offhand_attack = 490, dual_wield = true },
            { low = 42, high = 42, row = { levels = { [42] = { def = 365 } } } }, 'offhand'),
        rangedpdif = pdif.readout({ level = 42, zone = 100, ranged_attack = 610, shoots = true },
            { low = 42, high = 42, row = { levels = { [42] = { def = 365 } } } }, 'ranged'),
        evade   = { low = 31, high = 31 },
        block   = { low = 45.12, high = 49.25, eligible = true,
            notes = { 'This sample uses a shield and Shield skill. Blocking requires you to face the attacker and be able to act.' } },
        parry   = { low = 10, high = 13, eligible = true,
            notes = { 'This sample uses a weapon and Parrying skill. Parrying requires you to be engaged, face the attacker and be able to act.' } },
        signet  = true,
        crit    = { low = crit, high = crit },
        crittaken = { low = taken, high = taken },
        job     = SAMPLE_JOB,
        aggro   = aggro.readout(SAMPLE_AGGRO, { con = 3 }, 42, s.aggro),
        links   = aggro.links(SAMPLE_AGGRO, s.links),
        magic   = {},
        immune  = { 'dark_sleep', 'bind', 'gravity' },
        elements = elements.readout(SAMPLE_ELEMENTS, nil),
        info = monster_info.readout({ info = {
            family = { value = 'Goblin / Beastmen', notes = { 'The family and ecosystem come from the source.' } },
            charm = { value = 'Cannot charm', notes = { 'This monster is excluded from Charm.' } },
            vitals = { value = 'HP 2400 / MP 180' },
            movement = { value = 'Normal speed' },
            pursuit = { value = 'Sight pursuit' },
            spawn = { value = 'Ordinary respawn' },
            claim = { value = 'No listed claim shield' },
            dangers = { value = 'Bomb Toss' },
            blue = { value = 'No learnable Blue spells' },
            fight = { value = 'No listed special fight rules' },
            traits = { value = 'Double Attack 10%' },
            crystal = { value = 'Fire', notes = { 'Requires eligible EXP and Signet or Sanction. This is a separate roll from normal loot.' } },
            rewards = { value = 'Gil eligible' },
        } }, 42, 42),
        weapons = { weak = { { kind = 'blunt', percent = 25 }, { kind = 'hand_to_hand', percent = 12.5 } },
            resists = { { kind = 'slashing', percent = -12.5 }, { kind = 'piercing', percent = -50 } } },
        drops   = drops.readout(SAMPLE_DROPS, s.drops),
        steal   = steal.readout(SAMPLE_STEAL, SAMPLE_THIEF, 42, 42),
    };
    result.effects = {};
    for _, each in ipairs(SAMPLE_EFFECTS) do
        if (s.effects.show == 'both' or (each.debuff and s.effects.show == 'debuffs')
            or (not each.debuff and s.effects.show == 'buffs')) then
            result.effects[#result.effects + 1] = each;
        end
    end
    -- It spawns at 40 to 44. With the level range on, that prints after its level.
    result.range_low, result.range_high = 40, 44;
    -- It's a placeholder. With Show if it's a PH on, the NM it can pop prints after its level and ID.
    result.ph_for = { 'Valkurm Emperor' };
    -- Your wyvern at your level, for the pet part.
    result.pet = {
        name = 'Wyvern', low = 42, high = 42, hit = { low = 88, high = 88 }, evade = { low = 27, high = 27 },
    };
    for _, id in ipairs(spells.SCHOOL_ORDER) do
        local school = s.magic.schools[id];
        if (school ~= nil and (id == 'blue' or school.on)) then
            local chance = SAMPLE_MAGIC[id];
            local picks_element = spells.find(id, school.spell).elements ~= nil;
            result.magic[#result.magic + 1] = {
                school  = 'school_' .. id,
                low     = chance,
                high    = chance,
                element = picks_element and 'ice' or nil,
            };
        end
    end
    return result;
end

local function print_sample()
    print_lines(printout.lines(checkmate.settings, sample_result()));
end

--[[
    Prints the lines of a /check that haven't printed yet, top to bottom. Until the /checkparam <me> reply
    is in, it stops before the first line holding hit, off-hand, ranged or evade, and once that wait is over
    it goes on from that line. The pet's line is passed over while the /checkparam <pet> reply is out and
    prints by itself once it's in, so it never holds up another line. The lines are found again each time,
    since a layout change during a wait can move them.
    A /check that gave up on a reply skips the lines holding what it gave up on. One whose pet was gone or
    changed when its /checkparam was due only skips the pet's line when nothing else is on it. The exception
    is its first line while it hasn't printed, when the game's line is hidden and the extras share the /check
    line. That line stands in for the game's, so it always prints.
]]
local function print_check(check)
    if (check.done and check.pet_done) then
        return;
    end
    local s = checkmate.settings;
    local result = readout(check);
    check_details.save(check, result);
    local lines, waits_at, holding, pet_at, pet_alone = printout.lines(s, result);
    local keep_first = (check.from == 1 or pet_at == 1) and s.printout.replace_game_line
        and not s.printout.extras_own_line;
    local shown = {};

    local function show(at)
        local skip = (check.gave_up and holding[at])
            or (at == pet_at and (check.pet_gave_up or (check.pet_gone and pet_alone)));
        if (not skip or (at == 1 and keep_first)) then
            shown[#shown + 1] = lines[at];
        end
        if (at == pet_at) then
            check.pet_done = true;
        end
    end

    if (not check.done) then
        local first, last = check.from, #lines;
        if (check.waits and waits_at ~= nil) then
            last = waits_at - 1;
        elseif (first > 1 and waits_at ~= nil) then
            first = waits_at;
        end
        for at = first, last do
            if (at ~= pet_at or not check.pet_waits) then
                show(at);
            end
        end
        check.from = last + 1;
        check.done = last == #lines;
    end
    -- The pet's line, passed over while its reply was out. Once the rest are done, it prints wherever a layout
    -- change put it.
    if (pet_at ~= nil and not check.pet_done and not check.pet_waits and (pet_at < check.from or check.done)) then
        show(pet_at);
    end
    print_lines(shown);
end

-- Prints what `check` still has to print on the next frame.
local function print_soon(check)
    checkmate.ready[#checkmate.ready + 1] = check;
end

-- A /checkparam reply for `check` is in or overdue, so its waiting lines print on the next frame. The accuracy
-- and evasion it gave are kept on the /check, since a newer /check's request clears the ones checkparam holds.
local function stop_waiting(check, kind, complete)
    if (kind == 'pet') then
        check.pet_waits = false;
        check.pet.accuracy, check.pet.evasion = checkparam.values('pet');
        if (complete) then
            tell_overlay(overlay.on_pet_parameters, check.index, check.id, check.pet, check.token);
        end
    else
        check.waits = false;
        local attack, offhand_attack, ranged_attack, expected, parameter_expected, received_at;
        check.accuracy, check.evasion, check.offhand_accuracy, check.ranged_accuracy,
            attack, offhand_attack, ranged_attack, expected, parameter_expected, received_at = checkparam.values('me');
        if (check.parameter_waits) then
            local snapshot, reason = player.accept_parameters(parameter_expected, {
                accuracy = check.accuracy, evasion = check.evasion,
                offhand_accuracy = check.offhand_accuracy, ranged_accuracy = check.ranged_accuracy,
            }, received_at);
            check.parameter_inputs = snapshot;
            check.provenance.parameter_reason = reason;
            -- Chat can keep a partial reply. The overlay waits for the last line.
            local overlay_reason = reason;
            if (not complete) then overlay_reason = 'The stat reply did not finish. Check the monster again.'; end
            tell_overlay(overlay.on_parameters, check.index, check.id, check.token, complete and snapshot or nil, overlay_reason);
            check.parameter_expected, check.parameter_waits = nil, false;
        end
        if (check.pdif_expected ~= nil) then
            check.pdif_inputs, check.pdif_reason = player.accept_attacks(expected,
                attack, offhand_attack, ranged_attack, os.clock());
            check.pdif_expected = nil;
            overlay_changed();
        end
        check.provenance.parameter_at = received_at;
        check.provenance.parameter_state = (check.parameter_inputs ~= nil or check.pdif_inputs ~= nil)
            and 'received' or 'unavailable';
    end
    print_soon(check);
end

-- A /check that stops waiting without a reply prints the rest of its lines on the next frame, all but the
-- ones holding what it still waited for: hit, off-hand, ranged, evade and pDIF, or its pet.
local function give_up(check)
    if (check == nil) then
        return;
    end
    if (check.parameter_waits) then
        tell_overlay(overlay.on_parameters, check.index, check.id, check.token, nil,
            'This stat request ended before its reply. Check this monster again.');
        check.parameter_expected, check.parameter_waits = nil, false;
    end
    check.gave_up = check.gave_up or check.waits;
    check.pet_gave_up = check.pet_gave_up or check.pet_waits;
    check.waits, check.pet_waits = false, false;
    print_soon(check);
end

-- Your pet was gone when its /checkparam was due, so `check` stops waiting for it. Its pet line prints with
-- unknown numbers when other parts share it, and is left out when it's alone.
local function pet_gone(check)
    if (check ~= nil) then
        check.pet_gone, check.pet_waits = true, false;
        print_soon(check);
    end
end

-- The con and the evasion and defense reading of a /check reply, or nil for "impossible to gauge".
local function check_numbers(param2, message)
    if (message == CHECK_IMPOSSIBLE) then
        return nil;
    end
    local place = message - CHECK_FIRST;
    return param2 - CHECK_CON_BASE, math.floor(place / READING_SIZE), place % READING_SIZE;
end

-- Your /check of a monster came back.
local function on_check(target, index, level, param2, message, token)
    local replacing = checkmate.settings.printout.replace_game_line;
    if (not (replacing or part_on('name') or part_on('reading') or any_on(printout.PARTS)
        or pdif_wanted() or parameters_wanted() or part_wanted('pet'))) then
        return;
    end

    local name = player.entity_name(index);
    local row = monsters.find(player.zone(), target, name);
    local low, high = monsters.level(row, level, index);
    -- Kept for when you charm this monster later.
    if (level >= 1) then
        monsters.on_check(index, low);
    end
    local gauged = message ~= CHECK_IMPOSSIBLE;
    local con, reading, defense = check_numbers(param2, message);
    local check = {
        name    = name or (row and row.name) or 'The monster',
        id      = target,
        row     = row,
        index   = index,
        token   = token,
        low     = low,
        high    = high,
        con     = con,
        reading = reading,
        defense = defense,
        from    = 1,   -- The first of its lines not printed yet.
        done    = false,   -- Set once its last line printed.
        gave_up = false,   -- Set when a newer /check or zoning ends its wait for the /checkparam <me> reply.
        pet_gave_up = false,   -- The same for the /checkparam <pet> reply. Its pet line is skipped.
        pet_gone = false,   -- Set when your pet was gone or changed when its /checkparam was due.
    };
    if (row ~= nil and low ~= nil and low == high) then
        check.range_low, check.range_high = monsters.range_around(row, index, low);
    end
    check.ph_for = monsters.ph_for(row, index);
    check.ph_details = monsters.ph_details(row, index);
    local level_source, observed_at = monsters.level_source(row, level, index);
    check.provenance = { level_source = level_source, observed_at = observed_at, checked_at = os.clock(),
        stats_source = row and 'source' or 'band' };
    check_details.begin(check);
    if (part_on('ranged') and checkmate.settings.ranged.show_distance) then
        check.ranged_distance = { distance = player.distance(index) };
    end
    check.impossible = not gauged;
    -- Whether you swing an off-hand weapon and whether you can shoot, read from your gear once. The off-hand
    -- and ranged parts only print, wait and count for the "can't be gauged" line with that weapon on.
    if (part_wanted('offhand') or part_wanted('ranged') or pdif_wanted()) then
        check.dual_wield, check.shoots = player.weapons();
    end
    local weapon_parts = ((part_on('offhand') or part_on('offhandpdif')) and check.dual_wield == true)
        or ((part_on('ranged') or part_on('rangedpdif')) and check.shoots == true);
    check.cant_gauge = row == nil and low == nil and (any_on(NUMBER_PARTS) or weapon_parts
        or display_parts.blue_enabled(checkmate.settings, 'chance', 'chat'));
    local panel = checkmate.settings.overlay.parts;
    local needs_pdif = part_on('pdif') or (part_on('offhandpdif') and check.dual_wield)
        or (part_on('rangedpdif') and check.shoots)
        or (overlay_on() and (panel.pdif or (panel.offhandpdif and check.dual_wield) or (panel.rangedpdif and check.shoots)));
    local needs_parameters = part_wanted('hit') or part_wanted('evade')
        or (part_wanted('offhand') and check.dual_wield) or (part_wanted('ranged') and check.shoots);
    check.waits = (needs_parameters or weapon_parts or needs_pdif) and not check.cant_gauge
        and (row ~= nil or low ~= nil);
    if (needs_pdif and check.waits) then check.pdif_expected = player.pdif_inputs(); end
    check.parameter_waits = needs_parameters and check.waits;
    if (check.parameter_waits) then check.parameter_expected = player.parameter_inputs(); end
    check.provenance.parameter_state = check.waits and 'waiting' or 'not_requested';
    -- Your pet, whether its line waits for the /checkparam <pet> reply, and whether that line is done.
    if (part_wanted('pet') and not check.cant_gauge) then
        check.pet = pet.find(target);
    end
    -- With no level for the monster, the pet's numbers can only be unknown, so nothing is asked.
    check.pet_waits = check.pet ~= nil and check.pet.asks and low ~= nil;
    check.pet_done  = check.pet == nil;

    -- Lines needing player parameters wait for that reply. The pet waits for its own reply.
    -- A manual check also refreshes enabled overlay rows that need these values.
    checkparam.wait_from(os.clock());
    local older_me, older_pet, taken;
    if (check.waits) then
        older_me = checkparam.ask('me', check, checkmate.my_id);
    else
        older_me = checkparam.cancel('me');
    end
    if (check.pet_waits) then
        older_pet, taken = checkparam.ask('pet', check, check.pet.id);
        if (not taken) then
            check.pet_gone, check.pet_waits = true, false;
        end
    else
        older_pet = checkparam.cancel('pet');
    end
    -- Older /checks still waiting give up on their replies.
    give_up(older_me);
    give_up(older_pet);
    print_soon(check);
    return check;
end

--[[
    Settings actions behind the commands.
]]

-- The parts show and hide take. The window calls the reading "Evasion and defense".
local PART_LIST = 'name, difficulty, reading (evasion and defense), ' .. table.concat(printout.PARTS, ', ', 2);

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
local CUTOFF_PARTS = { hit = 'Hit rate', evade = 'Evade', crit = 'Crit', crittaken = 'Crit taken' };
local CUTOFF_GRADES = { good = 'Good', ok = 'OK' };

-- Each immunity by its name on the Weaknesses tab in lowercase, like sleep for dark_sleep.
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
local function legacy_part(id, on, display)
    local s = checkmate.settings;
    if (id == 'info') then
        for _, key in ipairs(display_parts.INFO_IDS) do
            if (display == 'overlay') then s.overlay.parts[key] = on; else s.printout.parts[key].on = on; end
        end
        s.weaknesses[display].charm = on;
    elseif (id == 'elements' or id == 'weapons' or id == 'immunities' or id == 'charm') then
        s.weaknesses[display][id] = on;
    else
        return false;
    end
    if (on) then
        if (display == 'overlay') then s.overlay.parts.weaknesses = true; else s.printout.parts.weaknesses.on = true; end
    end
    save_settings();
    say(('%s is now %s in %s.'):format(id, on and 'shown' or 'hidden', display == 'overlay' and 'the overlay' or 'chat'));
    return true;
end

local function set_part(id, on)
    if (id == nil) then
        say(('Type /checkmate show|hide <part>. The parts are %s.'):format(PART_LIST));
        return;
    end
    if (legacy_part(id, on, 'chat')) then return; end
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
    if (id == 'blue') then
        checkmate.settings.blue.chat.chance, checkmate.settings.blue.overlay.chance = on, on;
        save_settings();
        say(('The Blue Magic row now has spell chance %s.'):format(on and 'on' or 'off'));
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
        say(('Type /checkmate cutoff <hit|evade|crit|crittaken> <good|ok> <0-%d>.'):format(printout.CUTOFF_MAX));
        return;
    end
    checkmate.settings.grades[id .. '_' .. grade] = value;
    save_settings();
    local said = printout.LOWER_IS_BETTER[id] and '%s now counts as %s at %d%% or below.'
        or '%s now counts as %s at %d%% or above.';
    say(said:format(CUTOFF_PARTS[id], CUTOFF_GRADES[grade], value));
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
        say(('Weaknesses now lists %s when a monster is immune to it.'):format(entry.label));
        return;
    end
    say(('Weaknesses no longer lists %s.'):format(entry.label));
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
        say(('%s now prints as a blank in Weaknesses. /checkmate immunity %s off leaves it out instead.')
            :format(entry.label, name));
        return;
    end
    say(('%s now prints as "%s" in Weaknesses.'):format(entry.label, label));
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

-- `text` is everything after idword, or nil when nothing follows it. Empty quotes clear the word.
local function set_id_word(text)
    if (text == nil) then
        say('Type /checkmate idword <text>. Put text with spaces in quotes, and "" leaves the word out.');
        return;
    end
    local ps = checkmate.settings.printout;
    ps.id_word = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    save_settings();
    say(('The monster\'s ID now prints like (%s).'):format(printout.id_text(ps, SAMPLE_ID)));
end

-- `text` is everything after phword, or nil when nothing follows it. Empty quotes clear the word.
local function set_ph_word(text)
    if (text == nil) then
        say('Type /checkmate phword <text>. Put text with spaces in quotes, and "" leaves the word out.');
        return;
    end
    local ps = checkmate.settings.printout;
    ps.ph_word = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    save_settings();
    say(('The PH note now prints like (%s).'):format(printout.ph_text(ps, { 'Valkurm Emperor' })));
end

-- The words /checkmate weakword, resistword, pethitword and petevadeword set, each with the settings
-- section and key it sets and what it says with a word and with none.
local WORDS = {
    immuneword = {
        section = 'weaknesses', key = 'immune_word',
        said = 'Weaknesses now puts "%s" before immunities.',
        empty = 'Weaknesses now lists immunities with no word before them.',
    },
    weakword = {
        section = 'elements', key = 'weak_word',
        said  = 'Weaknesses now puts "%s" before the elements a monster is weak to.',
        empty = 'Weaknesses now lists the elements a monster is weak to with no word before them.',
    },
    resistword = {
        section = 'elements', key = 'resist_word',
        said  = 'Weaknesses now puts "%s" before the elements a monster resists.',
        empty = 'Weaknesses now lists the elements a monster resists with no word before them.',
    },
    weaponsweakword = {
        section = 'weapons', key = 'weak_word',
        said  = 'Weaknesses now puts "%s" before favored damage types.',
        empty = 'Weaknesses now lists favored damage types with no word before them.',
    },
    weaponsresistword = {
        section = 'weapons', key = 'resist_word',
        said  = 'Weaknesses now puts "%s" before resisted damage types.',
        empty = 'Weaknesses now lists resisted damage types with no word before them.',
    },
    pethitword = {
        section = 'pet', key = 'hit_word',
        said  = 'The pet part now puts "%s" before your pet\'s hit rate.',
        empty = 'The pet part now shows your pet\'s hit rate with no word before it.',
    },
    petevadeword = {
        section = 'pet', key = 'evade_word',
        said  = 'The pet part now puts "%s" before how often the monster misses your pet.',
        empty = 'The pet part now shows how often the monster misses your pet with no word before it.',
    },
};

-- `text` is everything after the command, or nil when nothing follows it. Empty quotes clear the word.
local function set_word(sub, text)
    if (text == nil) then
        say(('Type /checkmate %s <text>. Put text with spaces in quotes, and "" leaves the word out.'):format(sub));
        return;
    end
    local entry = WORDS[sub];
    local word = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
    checkmate.settings[entry.section][entry.key] = word;
    save_settings();
    if (word:match('^%s*$')) then
        say(entry.empty);
        return;
    end
    say(entry.said:format(word));
end

local ABBREVIATION_USAGE = 'Type /checkmate abbreviation <word> <text>. Put text with spaces in quotes, and "" prints the full '
    .. 'word. /checkmate help abbreviations lists the words.';

-- What a word prints as with abbreviations on, then each word in its spot that prints the same. `set` is true right
-- after you change it.
local function abbreviation_answer(s, entry, set)
    local name = entry.label or entry.full;
    local verb = set and 'now prints' or 'prints';
    local shown, full = printout.short_word(s, entry.key);
    local said = full and ('"%s" %s in full with abbreviations on.'):format(name, verb)
        or ('"%s" %s as "%s" with abbreviations on.'):format(name, verb, wording.example(entry, shown));
    local same = printout.spot_text(s, entry.key):lower();
    for _, other in ipairs(wording.LIST) do
        if (other ~= entry and entry.spot ~= nil and other.spot == entry.spot
            and printout.spot_text(s, other.key):lower() == same) then
            said = said .. (' "%s" prints as "%s" too, so they read the same.'):format(other.label or other.full,
                wording.example(other, (printout.short_word(s, other.key))));
        end
    end
    return said;
end

-- `text` is everything after the word, or nil when nothing follows it, which just says what the word prints as.
-- Empty quotes print the full word.
local function set_abbreviation(key, text)
    if (key == nil) then
        say(ABBREVIATION_USAGE);
        return;
    end
    local entry = wording.BY_KEY[key];
    if (entry == nil) then
        say(('There is no word called "%s". /checkmate help abbreviations lists them.'):format(key));
        return;
    end
    local s = checkmate.settings;
    if (text ~= nil) then
        s.short[key] = printout.clean_command_text(text):sub(1, printout.LABEL_MAX);
        save_settings();
    end
    say(abbreviation_answer(s, entry, text ~= nil));
end

local function reset_abbreviation(key)
    if (key == nil) then
        say('Type /checkmate abbreviationreset <word>|all. /checkmate help abbreviations lists the words.');
        return;
    end
    local s = checkmate.settings;
    if (key == 'all') then
        wording.reset(s.short);
        save_settings();
        say('Every abbreviation is back to the one checkmate comes with.');
        return;
    end
    local entry = wording.BY_KEY[key];
    if (entry == nil) then
        say(('There is no word called "%s". /checkmate help abbreviations lists them.'):format(key));
        return;
    end
    s.short[key] = entry.short;
    save_settings();
    say(('"%s" is back to "%s".'):format(entry.label or entry.full, wording.example(entry, entry.short)));
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

-- The parts overlayshow and overlayhide take. The chat's others only show in the chat printout.
local OVERLAY_PART_LIST = table.concat(overlay.PARTS, ', ');

local function set_overlay_part(id, on)
    if (id == nil) then
        say(('Type /checkmate overlayshow|overlayhide <part>. The overlay parts are %s.'):format(OVERLAY_PART_LIST));
        return;
    end
    if (legacy_part(id, on, 'overlay')) then return; end
    if (not overlay.is_part(id)) then
        local said = rawget(checkmate.settings.printout.parts, id) ~= nil
            and 'The %s part only shows in the chat printout. The overlay parts are %s.'
            or 'There is no overlay part called "%s". The overlay parts are %s.';
        say(said:format(id, OVERLAY_PART_LIST));
        return;
    end
    checkmate.settings.overlay.parts[id] = on;
    save_settings();
    say((on and 'The overlay now shows the %s part.' or 'The overlay no longer shows the %s part.'):format(id));
end

-- `text` is what follows custom, or nil when nothing does. Custom with no text keeps the text you had.
local function set_overlay_divider(word, text)
    local list = ('The overlay dividers are %s.'):format(overlay.DIVIDER_IDS);
    if (word == nil) then
        say('Type /checkmate overlaydivider <name>. ' .. list);
        return;
    end
    local divider = printout.find_divider(word, overlay.DIVIDERS);
    local symbol = printout.find_divider(word);
    if (divider == nil and symbol ~= nil) then
        say(('The overlay can\'t draw the %s, since it\'s a symbol from the game\'s chat font. '):format(
            symbol.name:lower()) .. list);
        return;
    elseif (divider == nil) then
        say(('There is no overlay divider called "%s". '):format(word) .. list);
        return;
    end
    local o = checkmate.settings.overlay;
    o.divider = divider.id;
    local custom_text = divider.id == 'custom' and text ~= nil;
    if (custom_text) then
        o.separator = printout.clean_command_text(text):sub(1, printout.SEPARATOR_MAX);
    end
    save_settings();
    if (custom_text and o.separator == '') then
        say('The overlay now puts nothing between parts.');
        return;
    end
    if (custom_text) then
        say(('The overlay now puts "%s" between parts.'):format(o.separator));
        return;
    end
    say(('The overlay now uses the %s divider between parts.'):format(divider.name));
end

-- `words` names a font, with or without its spaces.
local function set_overlay_font(words)
    if (words == '') then
        say(('Type /checkmate overlayfont <name>. The fonts are %s.'):format(window_font.IDS));
        return;
    end
    local entry = window_font.find(words);
    if (entry == nil) then
        say(('There is no font called "%s". The fonts are %s.'):format(words, window_font.IDS));
        return;
    end
    checkmate.settings.overlay.font = entry.id;
    save_settings();
    if (window_font.failed(entry.id)) then
        say(('You picked the %s font, but %s is missing or won\'t load, so the overlay uses Ashita\'s font.')
            :format(entry.name, window_font.path(entry.id)));
        return;
    end
    say(('The overlay now uses the %s font.'):format(entry.name));
end

-- Puts the overlay's top left corner at a spot in whole pixels from the top left of your screen, or back where it
-- starts with reset.
local function set_overlay_spot(x_word, y_word)
    local window = checkmate.settings.window;
    if (x_word == 'reset') then
        overlay.move_back(checkmate.settings);
        save_settings();
        say(('The overlay is back where it starts, at %d, %d.'):format(window.overlay_x, window.overlay_y));
        return;
    end
    local x = read_number(x_word, 0, overlay.SPOT_MAX);
    local y = read_number(y_word, 0, overlay.SPOT_MAX);
    if (x == nil or y == nil) then
        say('Type /checkmate overlayspot <x> <y> with the spot in pixels from the top left of your screen, or '
            .. '/checkmate overlayspot reset.');
        return;
    end
    window.overlay_x, window.overlay_y = x, y;
    save_settings();
    say(('The overlay\'s top left corner now sits at %d, %d. If that\'s off your screen, it\'s pulled in until it '
        .. 'fits.'):format(x, y));
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
    if (action == 'undo') then
        local ok, restored = profiles.undo_delete(checkmate.settings);
        if (ok) then
            save_settings();
            say(('The profile "%s" was restored.'):format(restored));
        elseif (restored == 'none') then
            say('There is no deleted profile to restore in this session.');
        elseif (restored == 'exists') then
            say('A profile already has that name. Rename it before restoring the deleted one.');
        else
            say('Couldn\'t restore the deleted profile. Your saved profiles were kept.');
        end
        return;
    end
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

local function set_info_section(id, on)
    if (monster_info.LABELS[id] == nil or on == nil) then
        say('Type /checkmate infosection <section> on|off. Sections: ' .. table.concat(monster_info.ORDER, ', ') .. '.');
        return;
    end
    local s = checkmate.settings;
    if (id == 'charm') then
        s.weaknesses.chat.charm, s.weaknesses.overlay.charm = on, on;
    elseif (id == 'blue') then
        s.blue.chat.lessons, s.blue.overlay.lessons = on, on;
    else
        s.printout.parts[id].on, s.overlay.parts[id] = on, on;
    end
    save_settings();
    say(('%s is now %s in both displays.'):format(monster_info.LABELS[id], on and 'on' or 'off'));
end

-- Choose which details appear in each display.
local function set_component(group, id, display, on)
    local s = checkmate.settings;
    local valid = group == 'blue' and (id == 'lessons' or id == 'chance')
        or group == 'weaknesses' and (id == 'elements' or id == 'weapons' or id == 'immunities' or id == 'charm');
    if (not valid or (display ~= 'chat' and display ~= 'overlay') or on == nil) then
        say(group == 'blue' and 'Type /checkmate bluepart <lessons|chance> <chat|overlay> on|off.'
            or 'Type /checkmate weakness <elements|weapons|immunities|charm> <chat|overlay> on|off.');
        return;
    end
    s[group][display][id] = on;
    save_settings();
    local labels = { elements = 'elements', weapons = 'weapon damage types', immunities = 'immunities',
        charm = 'Charm', lessons = 'possible lessons', chance = 'spell chance' };
    say(('The %s %s line now %s %s.'):format(group == 'blue' and 'Blue Magic' or 'Weaknesses',
        display, on and 'shows' or 'leaves out', labels[id]));
end

local function set_tab(args)
    local s = checkmate.settings;
    if (lower(args[2]) == 'tabs') then
        if (#args ~= 3 or lower(args[3]) ~= 'all') then
            say('Type /checkmate tabs all to show every settings tab.');
            return;
        end
        s.window.tabs = navigation.normalize(nil);
        save_settings();
        say('Every settings tab is visible again.');
        return;
    end
    local on = on_word(lower(args[#args]));
    local name = #args >= 4 and navigation.canonical(table.concat(args, ' ', 3, #args - 1)) or nil;
    if (name == nil or on == nil) then
        say('Type /checkmate tab <tab> on|off. Put a name with spaces in quotes. Tabs: '
            .. table.concat(navigation.TAB_NAMES, ', ') .. '.');
        return;
    end
    if (name == 'Appearance' and not on) then
        say('Appearance stays visible so you can restore hidden tabs.');
        return;
    end
    s.window.tabs[name] = on;
    save_settings();
    say(('%s is now %s in the settings window. Its features are unchanged.'):format(name, on and 'visible' or 'hidden'));
end

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
    local text = require('core.diagnostics').text(addon.version);
    for line in text:gmatch('[^\n]+') do say(line); end
end

-- Opening or closing the window also starts checkmate again after an error. The overlay forgets what it kept
-- then, since it missed whatever came in meanwhile.
local function toggle_window()
    if (checkmate.broken) then
        overlay.forget();
    end
    checkmate.broken = false;
    tracking_changed();
    settings_window.set_open(not settings_window.is_open());
end

-- What /checkmate reset puts back, for its help line and its first answer.
local RESET_WHAT = 'every one of this character\'s settings back to its default, including the skin and every color, '
    .. 'the window\'s font, size and position, where the overlay sits, your merits and the job links. Your saved '
    .. 'profiles stay.';

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
    blueseen = {
        section = 'blue', key = 'seen',
        on = 'Blue Magic now shows whether checkmate has seen this monster use each move.',
        off = 'Blue Magic no longer shows observed move use.',
    },
    dangerdebuff = {
        section = 'dangers', key = 'debuff', on = 'Dangers now includes debuff moves.', off = 'The debuff category is off.',
    },
    dangercrit = {
        section = 'dangers', key = 'crit', on = 'Dangers now includes critical-hit moves.', off = 'The critical-hit category is off.',
    },
    dangerdispel = {
        section = 'dangers', key = 'dispel', on = 'Dangers now includes buff removal.', off = 'The buff-removal category is off.',
    },
    dangerdrain = {
        section = 'dangers', key = 'drain', on = 'Dangers now includes drains.', off = 'The drain category is off.',
    },
    dangerother = {
        section = 'dangers', key = 'other', on = 'Dangers now includes other listed threats.', off = 'The other-threats category is off.',
    },
    blueunlearned = {
        section = 'blue', key = 'only_unlearned',
        on = 'Blue Magic now hides spells your client says you already know. Unknown spellbook entries stay visible.',
        off = 'Blue Magic now shows all possible lessons, including spells you already know.',
    },
    bluerequirements = {
        section = 'blue', key = 'requirements',
        on = 'Blue Magic hover help and Target details now include learning requirements.',
        off = 'Blue Magic hover help and Target details no longer include learning requirements.',
    },
    knownmagic = {
        section = 'magic', key = 'known_inputs',
        on = 'Magic now includes known gear and merits. Extra accuracy is only the remaining bonus.',
        off = 'Magic now uses your extra accuracy as the full direct-bonus total.',
    },
    effectestimates = {
        section = 'effects', key = 'estimate_mark',
        on = 'Estimated effect times now have a ~ before them.',
        off = 'Estimated effect times no longer have a ~ before them.',
    },
    effectempty = {
        section = 'effects', key = 'show_empty',
        on = 'Effects now says when no effects have been observed.',
        off = 'An empty Effects list stays hidden.',
    },
    rangeddistance = {
        section = 'ranged', key = 'show_distance',
        on = 'Ranged now includes your distance when the check reply arrived.',
        off = 'Ranged no longer includes that distance.',
    },
    effecttimes = {
        section = 'effects', key = 'times',
        on  = 'The Effects part now shows how long each effect has left. The times are estimates.',
        off = 'The Effects part now shows only the names.',
    },

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
    id = {
        section = 'printout', key = 'show_id',
        on  = 'The monster\'s ID now shows after its name and level.',
        off = 'The monster\'s ID no longer shows after its name and level.',
    },
    ph = {
        section = 'printout', key = 'show_ph',
        on  = 'The PH note now shows after a placeholder\'s name and level.',
        off = 'The PH note no longer shows after a placeholder\'s name and level.',
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
    icons = {
        section = 'printout', key = 'icons',
        on  = 'Chat now puts the game\'s element symbol before each element name.',
        off = 'Chat no longer puts a symbol before element names.',
    },
    iconsonly = {
        section = 'printout', key = 'icons_only',
        on  = 'With element icons on, chat now shows each element\'s symbol without its name.',
        off = 'With element icons on, chat now shows each element\'s symbol and its name.',
    },
    short = {
        section = 'printout', key = 'short_words',
        on  = 'checkmate\'s /check lines now use abbreviations. The Abbreviations tab lists them.',
        off = 'checkmate\'s /check lines now use the full words.',
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
        on  = 'The hit rate, off-hand, ranged, evade, crit, crit taken and pet numbers now print in the Good, OK or '
            .. 'Bad color.',
        off = 'The hit rate, off-hand, ranged, evade, crit, crit taken and pet numbers now print in each part\'s '
            .. 'Number color.',
    },
    rangedfar = {
        section = 'ranged', key = 'show_far',
        on  = 'The ranged part now adds your hit rate outside the sweet spot, like (55% at 25 yalms).',
        off = 'The ranged part now only shows your hit rate in the sweet spot.',
    },
    meritfill = {
        section = 'merits', key = 'fill_in',
        on  = 'Your crit merits now fill in from the merit list the server sends when you zone, and one of them when '
            .. 'you change that merit.',
        off = 'Your crit merits now stay as you set them.',
    },
    petname = {
        section = 'pet', key = 'show_name',
        on  = 'The pet part now shows your pet\'s name.',
        off = 'The pet part no longer shows your pet\'s name and level.',
    },
    petlevel = {
        section = 'pet', key = 'show_level',
        on  = 'The pet part now shows your pet\'s level after its name.',
        off = 'The pet part no longer shows your pet\'s level.',
    },
    detection = {
        section = 'aggro', key = 'detection',
        on  = 'The aggro part now shows how a monster finds you.',
        off = 'The aggro part no longer shows how a monster finds you.',
    },
    linkhow = {
        section = 'links', key = 'link_how',
        on  = 'The links part now shows how each monster it links with joins, like Goblin Thug (Sight).',
        off = 'The links part no longer shows how the monsters it links with join.',
    },
    linknames = {
        section = 'links', key = 'link_names',
        on  = 'The links part now names what a monster links with.',
        off = 'The links part no longer names what a monster links with.',
    },
    linkfamilies = {
        section = 'links', key = 'group_families',
        on  = 'The links part now groups matching names by family.',
        off = 'The links part now shows each name separately.',
    },
    elementmark = {
        section = 'elements', key = 'script_mark',
        on  = 'Elements now shows a ? when scripts can change its values.',
        off = 'Elements now hides the ?. Hover details still explain when its values can change.',
    },
    strength = {
        section = 'elements', key = 'strength',
        on  = 'Weaknesses now shows how strong each one is, like (half), and the magic damage note.',
        off = 'Weaknesses no longer shows how strong each one is or the magic damage note.',
    },
    thlabel = {
        section = 'drops', key = 'th_in_label',
        on  = 'The drops label now shows your Treasure Hunter, like Drops (TH 2).',
        off = 'The drops label no longer shows your Treasure Hunter.',
    },
    dropnotes = {
        section = 'drops', key = 'notes',
        on  = 'The drops part now shows loot conditions and EXP requirements.',
        off = 'The drops part no longer shows loot conditions or EXP requirements.',
    },
    overlay = {
        section = 'overlay', key = 'on',
        on  = 'The overlay now shows what checkmate knows about the monster you have targeted.',
        off = 'The overlay is off now, and checkmate no longer reads your target.',
    },
    overlaylock = {
        section = 'overlay', key = 'locked',
        on  = 'The overlay is locked in place now.',
        off = 'Hold Shift and drag the overlay to move it, or drag its corner to change its width.',
    },
    overlayremember = {
        section = 'overlay', key = 'remember',
        on  = 'The overlay now keeps your last /check of each monster until it dies, leaves sight or you zone, and the '
            .. 'difficulty and reading go when your level changes.',
        off = 'The overlay now only shows a /check until your target changes.',
    },
    overlaycursor = {
        section = 'overlay', key = 'follow_cursor',
        on  = 'While you pick a target, the overlay now shows the monster under the cursor.',
        off = 'While you pick a target, the overlay now keeps showing the one you had.',
    },
    overlaylevel = {
        section = 'overlay', key = 'show_level',
        on  = 'The overlay now shows the level after the monster\'s name.',
        off = 'The overlay no longer shows the level after the monster\'s name.',
    },
    overlayrange = {
        section = 'overlay', key = 'show_range',
        on  = 'The overlay now shows the level range after a monster\'s exact level.',
        off = 'The overlay no longer shows the level range.',
    },
    overlayid = {
        section = 'overlay', key = 'show_id',
        on  = 'The overlay now shows the monster\'s ID after its name and level.',
        off = 'The overlay no longer shows the monster\'s ID.',
    },
    overlayph = {
        section = 'overlay', key = 'show_ph',
        on  = 'The overlay now shows the PH note after a placeholder\'s name and level.',
        off = 'The overlay no longer shows the PH note.',
    },
    overlaylines = {
        section = 'overlay', key = 'own_lines',
        on  = 'Each part now starts its own line in the overlay, with the difficulty next to the name and Links next '
            .. 'to Aggro when it comes right after it.',
        off = 'The overlay now follows the order and New line boxes on the Display tab.',
    },
    overlayshort = {
        section = 'overlay', key = 'short_words',
        on  = 'The overlay now uses abbreviations. The Abbreviations tab lists them.',
        off = 'The overlay now uses the full words.',
    },
    overlayborder = {
        section = 'overlay', key = 'border',
        on  = 'The overlay now has a border.',
        off = 'The overlay no longer has a border.',
    },
    overlayicons = {
        section = 'overlay', key = 'icons',
        on  = 'The overlay now puts a picture before elements, weapon types, items, immunities and jobs.',
        off = 'The overlay no longer shows pictures.',
    },
    overlayiconsonly = {
        section = 'overlay', key = 'icons_only',
        on  = 'With Show icons on, the overlay now shows the pictures without their names. A name stays when its '
            .. 'picture won\'t load. Weapon types keep their names and percentages.',
        off = 'With Show icons on, the overlay now shows each picture with its name.',
    },
    overlaytips = {
        section = 'overlay', key = 'tips',
        on  = 'Resting the mouse on text or an icon in the overlay now shows its details.',
        off = 'The overlay no longer shows hover tips.',
    },
    overlaycutscenes = {
        section = 'overlay', key = 'hide_in_events',
        on  = 'The overlay now hides in cutscenes and NPC talk.',
        off = 'The overlay now stays up in cutscenes and NPC talk.',
    },
    overlayui = {
        section = 'overlay', key = 'hide_with_ui',
        on  = 'The overlay now hides while the game\'s interface is hidden.',
        off = 'The overlay now stays up while the game\'s interface is hidden.',
    },
    overlaymap = {
        section = 'overlay', key = 'hide_on_map',
        on  = 'The overlay now hides while the map is open.',
        off = 'The overlay now stays up while the map is open.',
    },
};

-- The commands that take one of a few words, each with the settings section and key it sets, the words
-- for its usage line, and the value and answer for each word.
local CHOICES = {
    pdifmode = {
        section = 'pdif', key = 'mode', usage = 'range|ratio|both',
        words = {
            range = { 'range', 'pDIF rows now show the damage-multiplier range.' },
            ratio = { 'ratio', 'pDIF rows now show the Attack/Defense ratio and its inputs.' },
            both = { 'both', 'pDIF rows now show the multiplier range and the Attack/Defense ratio.' },
        },
    },
    effects = {
        section = 'effects', key = 'show', usage = 'both|debuffs|buffs',
        words = {
            both    = { 'both',    'The Effects part now lists the debuffs, then the monster\'s own buffs.' },
            debuffs = { 'debuffs', 'The Effects part now lists only debuffs.' },
            buffs   = { 'buffs',   'The Effects part now lists only the buffs the monster gave itself.' },
        },
    },
    extras = {
        section = 'printout', key = 'extras_own_line', usage = 'same|new',
        words = {
            same = { false, 'Enabled parts now follow the name and difficulty on the /check line. '
                .. 'A part with New line checked still starts a new line.' },
            new  = { true, 'Enabled parts now start on a new line after the name and difficulty.' },
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
    overlayelementlook = {
        section = 'overlay', key = 'element_look', usage = 'game|badges',
        words = {
            game   = { 'game',   'With Show icons on, the overlay now uses the game\'s own element pictures, or '
                .. 'a badge when one won\'t load.' },
            badges = { 'badges', 'With Show icons on, the overlay now draws a colored badge for each element.' },
        },
    },
};

--[[
    The commands that take a number, each with the settings section and key it sets, the lowest and
    highest it takes, its usage line and its answer. `zero` is the answer at 0 when 0 means something
    of its own, and `one` the answer at 1 when the usual answer counts items or pixels. A `decimal` one
    keeps one decimal place. A `merit` one is filled in from the server's merit list while meritfill is
    on, so then its answer says how long yours holds.
]]
local NUMBERS = {
    dangermoves = {
        section = 'dangers', key = 'max_moves', low = 0, high = dangers.MAX_MOVES,
        usage = 'Type /checkmate dangermoves <%d-%d>. Zero shows all matching moves.',
        said = 'Dangers now shows up to %s matching moves in chat and the overlay.',
        zero = 'Dangers now shows every matching move in chat and the overlay.',
        one = 'Dangers now shows one matching move in chat and the overlay.',
    },
    th = {
        section = 'drops', key = 'th', low = 0, high = drops.TH_MAX,
        usage = 'Type /checkmate th <%d-%d>.',
        said  = 'Drop chances now use Treasure Hunter %s.',
    },
    critmerits = {
        section = 'merits', key = 'crit_hit_rate', low = 0, high = physical.MERITS.crit_hit_rate.most, merit = true,
        usage = 'Type /checkmate critmerits <%d-%d>.',
        said  = 'Your Critical Hit Rate merits are now %s. Crit counts as many as your main level allows.',
        zero  = 'Your Critical Hit Rate merits are now 0.',
    },
    enemycritmerits = {
        section = 'merits', key = 'enemy_crit_rate', low = 0, high = physical.MERITS.enemy_crit_rate.most, merit = true,
        usage = 'Type /checkmate enemycritmerits <%d-%d>.',
        said  = 'Your Enemy Critical Hit Rate merits are now %s. Crit taken counts as many as your main level allows.',
        zero  = 'Your Enemy Critical Hit Rate merits are now 0.',
    },
    maxlinks = {
        section = 'links', key = 'max_links', low = 0, high = aggro.MAX_LINKS,
        usage = 'Type /checkmate maxlinks <%d-%d>. 0 shows every entry.',
        said  = 'The links part now shows at most %s entries after grouping.',
        zero  = 'The links part now shows every entry after grouping.',
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
    overlayfontsize = {
        section = 'overlay', key = 'font_size', low = window_font.SIZE_MIN, high = window_font.SIZE_MAX,
        usage = 'Type /checkmate overlayfontsize <%d-%d>.',
        said  = 'The overlay\'s font size is now %s pixels.',
    },
    overlayopacity = {
        section = 'overlay', key = 'opacity', low = 0, high = overlay.OPACITY_MAX,
        usage = 'Type /checkmate overlayopacity <%d-%d>.',
        said  = 'The overlay\'s background is now %s%% solid.',
        zero  = 'The overlay now has no background. Turn Border off too if you only want its text.',
    },
    overlaywrap = {
        section = 'overlay', key = 'wrap', low = 0, high = overlay.WRAP_MAX,
        usage = 'Type /checkmate overlaywrap <%d-%d>. 0 never wraps.',
        said  = 'Overlay lines now wrap once they\'re wider than %s pixels.',
        zero  = 'Overlay lines never wrap now.',
        one   = 'Overlay lines now wrap once they\'re wider than 1 pixel.',
    },
};

-- What a merit you set by hand does while meritfill is on.
local MERIT_HOLDS = 'What you set holds until you zone or change that merit. /checkmate meritfill off keeps yours.';

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
    -- Typing overlay on also starts an overlay that stopped after an error.
    if (sub == 'overlay' and on) then
        checkmate.overlay_broken = false;
    end
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
    local said = entry.said:format(entry.decimal and ('%g'):format(value) or ('%d'):format(value));
    if (value == 0 and entry.zero ~= nil) then
        said = entry.zero;
    elseif (value == 1 and entry.one ~= nil) then
        said = entry.one;
    end
    if (entry.merit and checkmate.settings.merits.fill_in == true) then
        said = said .. ' ' .. MERIT_HOLDS;
    end
    say(said);
end

--[[
    Help. /checkmate help prints the topics and the commands used most. /checkmate help <topic> prints
    the commands for one tab of the settings window. /checkmate help windowcolors lists the window
    colors. Any other word after help prints the topics again.
]]

local TOPIC_LIST = 'display, appearance, numbers, aggro, magic, blue, weaknesses, pets, monster, drops, '
    .. 'effects, abbreviations, profiles and presets';

-- Lines that print in more than one place.
local HELP_SHOW = ('/checkmate show|hide <part>  shows or hides a part. The parts are %s.'):format(PART_LIST);
local HELP_TH = ('/checkmate th <0-%d>  sets the Treasure Hunter for drop chances.'):format(drops.TH_MAX);
local HELP_SCHOOL = '/checkmate school <school> on|off  turns a magic school on or off.';
local HELP_GRADES = '/checkmate grades on|off  colors the hit rate, off-hand, ranged, evade, crit, crit taken and pet '
    .. 'numbers in the Good, OK or Bad color, or in each part\'s Number color.';
local HELP_SKIN = ('/checkmate skin <name>  picks a skin. Pick it again to restore its colors and layout. '
    .. 'Skins: %s.'):format(skins.IDS);
local HELP_PROFILE = '/checkmate profile save|load|delete <name>  saves, loads or deletes a profile. Put a name with '
    .. 'spaces in quotes.';
local HELP_SAMPLE = '/checkmate sample  prints a made-up /check with your settings.';
local HELP_OVERLAY_ABBREVIATIONS = '/checkmate overlayabbreviations on|off  uses abbreviations in the overlay, or the full words.';

local HELP_MAIN = {
    '/checkmate  opens or closes the settings window. /cmate is short for /checkmate and works for every command.',
    ('/checkmate help <topic>  lists the commands for one tab of the settings window. The topics are %s.')
        :format(TOPIC_LIST),
    HELP_SHOW,
    '/checkmate overlay on|off  turns the overlay on or off. It shows what checkmate knows about the monster you have '
        .. 'targeted.',
    HELP_TH,
    HELP_SCHOOL,
    HELP_SKIN,
    HELP_PROFILE,
    HELP_SAMPLE,
    '/checkmate info  prints the version and what the monster data was built from.',
    ('/checkmate reset  puts %s Type it twice within %d seconds.'):format(RESET_WHAT, RESET_SECONDS),
};

-- The two crit merits, for their help lines.
local CRIT_MERIT, ENEMY_CRIT_MERIT = physical.MERITS.crit_hit_rate, physical.MERITS.enemy_crit_rate;

-- Each tab's commands. /checkmate help colors also lists the color settings and chat colors after them, and
-- /checkmate help abbreviations the words.
local HELP_TOPICS = {
    monster = {
        '/checkmate dangerdebuff|dangercrit|dangerdispel|dangerdrain|dangerother on|off  selects Dangers categories.',
        '/checkmate dangermoves <0-50>  limits chat and overlay moves. Zero shows all; Target details keeps the full list.',
        '/checkmate show|hide <part>  shows or hides a separate row in chat. Monster rows: '
            .. table.concat(display_parts.INFO_IDS, ', ') .. '.',
        '/checkmate overlayshow|overlayhide <part>  shows or hides the same row in the overlay.',
        '/checkmate infosection <section> on|off  changes that row in both displays, or a Charm/Blue component. Sections: '
            .. table.concat(monster_info.ORDER, ', ') .. '.',
    },
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
        '/checkmate id on|off  shows or hides the monster\'s ID after its name and level, like (ID 17199202).',
        '/checkmate idword <text>  sets the word before the ID. Put text with spaces in quotes, and "" leaves the word '
            .. 'out.',
        '/checkmate ph on|off  shows or hides the PH note after a placeholder\'s name and level, like (PH for Valkurm '
            .. 'Emperor).',
        '/checkmate phword <text>  sets the word before the NM in the PH note. Put text with spaces in quotes, and "" '
            .. 'leaves the word out.',
        '/checkmate reading evasion|defense  puts evasion or defense first in the reading after the difficulty.',
        '/checkmate extras same|new  same keeps enabled parts after the name and difficulty; new starts them on the next line. '
            .. 'A part with New line checked starts a new line either way.',
        '/checkmate tag on|off  starts each /check line with [checkmate], or leaves it off.',
        ('/checkmate divider <name>  sets what goes between parts. The dividers are %s.'):format(printout.DIVIDER_IDS),
        '/checkmate divider custom <text>  puts your own text between parts. Put text with spaces in quotes.',
        ('/checkmate labeldivider <name>  sets what goes right after each part\'s label. The label dividers are %s.')
            :format(printout.LABEL_DIVIDER_IDS),
        '/checkmate labeldivider custom <text>  puts your own text right after each label, then a space. Put text '
            .. 'with spaces in quotes.',
        '/checkmate ranges range|middle  prints percentage estimates as a range like 64-72%, or as their middle, like ~68%. '
            .. 'Shield block and Parry keep decimal places where needed. pDIF uses pdifmode.',
        '/checkmate icons on|off  puts the game\'s element symbol before each element name in chat, or leaves it out.',
        '/checkmate iconsonly on|off  shows only the element symbol without its name, or both. It needs icons on.',
        '/checkmate replace on|off  hides the game\'s own /check line so checkmate\'s lines take its place, or '
            .. 'shows it again.',
        HELP_SAMPLE,
    },
    overlay = {
        '/checkmate overlay on|off  turns the overlay on or off. It shows what checkmate knows about the monster you '
            .. 'have targeted, and your /check fills in its exact level, difficulty and evasion and defense.',
        ('/checkmate overlayshow|overlayhide <part>  shows or hides a part in the overlay. The parts are %s.')
            :format(OVERLAY_PART_LIST),
        '/checkmate overlaylevel on|off  shows or hides the level after the name.',
        '/checkmate overlayrange on|off  shows or hides the levels a monster spawns at after its exact level.',
        '/checkmate overlayid on|off  shows or hides the monster\'s ID.',
        '/checkmate overlayph on|off  shows or hides the PH note.',
        '/checkmate overlaylines on|off  starts each part on its own line, or follows the order and New line boxes on '
            .. 'the Display tab.',
        HELP_OVERLAY_ABBREVIATIONS,
        ('/checkmate overlaydivider <name>  sets what goes between parts in the overlay. The dividers are %s.')
            :format(overlay.DIVIDER_IDS),
        '/checkmate overlaydivider custom <text>  puts your own text between parts in the overlay. Put text with '
            .. 'spaces in quotes.',
        '/checkmate overlayremember on|off  keeps your last /check of each monster, or only shows it until your target '
            .. 'changes. Death, leaving sight and zoning always clear it.',
        '/checkmate overlaycursor on|off  shows the monster under the cursor while you pick a target, or keeps showing '
            .. 'the one you had.',
        '/checkmate overlaylock on|off  stops you moving the overlay or changing its width with Shift and drag, or '
            .. 'lets you.',
        '/checkmate overlayspot <x> <y>|reset  puts the overlay\'s top left corner at that spot on your screen, in '
            .. 'pixels, or back where it starts. You can also hold Shift and drag it.',
        ('/checkmate overlayfont <name>  sets the overlay\'s font. The fonts are %s.'):format(window_font.IDS),
        ('/checkmate overlayfontsize <%d-%d>  sets the overlay\'s font size in pixels.')
            :format(window_font.SIZE_MIN, window_font.SIZE_MAX),
        ('/checkmate overlayopacity <0-%d>  sets how solid the overlay\'s background is, in percent. At 0 the border '
            .. 'still shows unless you turn it off.'):format(overlay.OPACITY_MAX),
        '/checkmate overlayborder on|off  draws a line around the overlay, or leaves it off.',
        ('/checkmate overlaywrap <0-%d>  wraps lines wider than this many pixels. 0 never wraps. Holding Shift and '
            .. 'dragging the overlay\'s bottom right corner sets it too.'):format(overlay.WRAP_MAX),
        '/checkmate overlayicons on|off  puts a picture before elements, weapon types, items, immunities and jobs in the overlay, '
            .. 'or leaves them out.',
        '/checkmate overlayiconsonly on|off  shows only the pictures without their names, or both. It needs '
            .. 'overlayicons on. Weapon types keep their names and percentages.',
        '/checkmate overlayelementlook game|badges  uses the game\'s own element pictures or colored badges. It '
            .. 'needs overlayicons on.',
        '/checkmate overlaytips on|off  shows details when you rest the mouse on overlay text or icons.',
        '/checkmate overlaycutscenes on|off  hides the overlay in cutscenes and NPC talk, or keeps it up.',
        '/checkmate overlayui on|off  hides the overlay while the game\'s interface is hidden, or keeps it up.',
        '/checkmate overlaymap on|off  hides the overlay while the map is open, or keeps it up.',
    },
    colors = {
        '/checkmate concolors on|off  paints each difficulty in its own color, or all of them in One color.',
        '/checkmate threatcolors on|off  paints Aggressive in the Threat color and the other answers in the Safe '
            .. 'color, or every answer in the Words color.',
        HELP_GRADES,
    },
    numbers = {
        '/checkmate show|hide block|parry  changes the Shield block and Parry chat rows. Use overlayshow|overlayhide for the overlay.',
        'Block and Parry show conditional chances for eligible normal attacks. They read your current gear and skills without requesting parameters.',
        '/checkmate pdifmode range|ratio|both  chooses the multiplier range, Attack/Defense ratio or both.',
        '/checkmate show|hide pdif|offhandpdif|rangedpdif  changes each pDIF chat row. Use overlayshow|overlayhide for the overlay.',
        'A manual /check refreshes enabled pDIF rows. Changed inputs keep the last estimate with a Check again note.',
        ('/checkmate cutoff <hit|evade|crit|crittaken> <good|ok> <0-%d>  sets where a number counts as Good or OK. '
            .. 'By default hit is Good at 85 and OK at 70, evade at 30 and 15, and crit at 15 and 8. Crit taken goes '
            .. 'the other way, Good at 5 or below and OK at 10 or below. Off-hand and ranged use the hit cutoffs.')
            :format(printout.CUTOFF_MAX),
        ('/checkmate critmerits <0-%d>  sets your Critical Hit Rate merits. Each one adds %d%% to Crit, and under '
            .. 'level %d fewer of them count.'):format(CRIT_MERIT.most, CRIT_MERIT.per_merit,
            physical.all_merits_level(CRIT_MERIT.most)),
        ('/checkmate enemycritmerits <0-%d>  sets your Enemy Critical Hit Rate merits. Each one takes %d%% off Crit '
            .. 'taken, and under level %d fewer of them count.'):format(ENEMY_CRIT_MERIT.most,
            ENEMY_CRIT_MERIT.per_merit, physical.all_merits_level(ENEMY_CRIT_MERIT.most)),
        '/checkmate meritfill on|off  fills both in from the merit list the server sends when you zone, and one of '
            .. 'them when you change that merit, or keeps the numbers you set. With it on, one you set by hand holds '
            .. 'until you zone or change that merit.',
        HELP_GRADES,
        '/checkmate rangedfar on|off  adds or leaves out your ranged hit rate outside the sweet spot, like (55% at 25 '
            .. 'yalms). The main number is always the one in the sweet spot.',
        '/checkmate rangeddistance on|off  shows or hides the client distance when your /check reply arrived.',
    },
    pets = {
        '/checkmate show|hide pet  shows or hides your pet\'s combat estimates in chat.',
        '/checkmate overlayshow|overlayhide pet  shows or hides your pet in the overlay. The passive overlay sends no requests.',
        'Overlay pet parameters come from the stat reply after your manual check of this target; otherwise they are unknown.',
        '/checkmate petname on|off  shows or hides your pet\'s name and level in the pet part.',
        '/checkmate petlevel on|off  shows or hides your pet\'s level after its name, like (Lv 75).',
        '/checkmate pethitword <text>  sets the word before your pet\'s hit rate. Put text with spaces in quotes, and '
            .. '"" leaves the word out.',
        '/checkmate petevadeword <text>  sets the word before how often the monster misses your pet. Put text with '
            .. 'spaces in quotes, and "" leaves the word out.',
    },
    aggro = {
        '/checkmate show|hide pursuit  shows or hides the Pursuit row in chat. Use overlayshow|overlayhide for the overlay.',
        '/checkmate detection on|off  shows or hides how an aggressive monster finds you, like (Sight, Sound).',
        '/checkmate linkhow on|off  shows or hides how each monster it links with joins, like Goblin Thug (Sight).',
        '/checkmate linknames on|off  shows or hides the names a monster links with.',
        '/checkmate linkfamilies on|off  groups matching names by family or shows each name.',
        ('/checkmate maxlinks <0-%d>  limits entries after grouping. 0 shows every entry.'):format(aggro.MAX_LINKS),
    },
    magic = {
        '/checkmate knownmagic on|off  includes known gear and merits, or uses your whole manual bonus total.',
        HELP_SCHOOL,
        '/checkmate spell <school> <spell>  sets the stand-in spell a school uses. /checkmate spell <school> lists '
            .. 'its spells.',
        ('/checkmate macc <0-%d>  sets extra magic accuracy for every school. With knownmagic on, enter only bonuses '
            .. 'not already counted; with it off, enter your whole direct-bonus total.'):format(magic.EXTRA_ACCURACY_MAX),
    },
    blue = {
        '/checkmate blueseen on|off  shows observed move use. Not observed does not mean the monster has not used it.',
        '/checkmate blueunlearned on|off  hides spells your client says you already know. Unknown spellbook entries stay visible.',
        '/checkmate bluerequirements on|off  shows learning requirements in hover help and Target details.',
        '/checkmate bluepart <lessons|chance> <chat|overlay> on|off  selects what appears in Blue Magic.',
        '/checkmate show|hide blue  shows or hides the Blue Magic row in chat. Use overlayshow|overlayhide for the overlay.',
        '/checkmate infosection blue on|off  turns possible lessons on or off inside the Blue Magic row.',
        '/checkmate school blue on|off  turns spell chance on or off inside the Blue Magic row.',
        '/checkmate spell blue <spell>  chooses the stand-in Blue spell. Leave the spell out to list the choices.',
        'The knownmagic and macc settings apply to Blue Magic too. See /checkmate help magic.',
    },
    weaknesses = {
        '/checkmate weakness <elements|weapons|immunities|charm> <chat|overlay> on|off  selects one component.',
        '/checkmate immuneword <text>  sets the word before immunities. Put text with spaces in quotes.',
        '/checkmate show|hide weaknesses  shows or hides the combined Weaknesses row in chat.',
        'show elements, weapons, immunities or charm also turns on the Weaknesses line.',
        '/checkmate overlayshow|overlayhide weaknesses  shows or hides that row in the overlay.',
        '/checkmate elementmark on|off  shows or hides the Elements ?. Hover details keep its explanation.',
        '/checkmate weaponsweakword <text>  sets the word before favored weapon damage types.',
        '/checkmate weaponsresistword <text>  sets the word before resisted weapon damage types.',
        '/checkmate weakword <text>  sets the word before the elements a monster is weak to. Put text with spaces in '
            .. 'quotes, and "" leaves the word out.',
        '/checkmate resistword <text>  sets the word before the elements a monster resists. Put text with spaces in '
            .. 'quotes, and "" leaves the word out.',
        '/checkmate strength on|off  shows or hides how strong each weak or resisted element is, like (half), and '
            .. 'the magic damage note.',
        ('/checkmate immunity <name> on|off  shows or leaves out one immunity. The immunities are %s.')
            :format(IMMUNITY_LIST),
        '/checkmate immunitylabel <name> <text>  sets the word an immunity prints as. Put text with spaces in quotes.',
        '/checkmate infosection charm on|off  turns Charm rules on or off inside Weaknesses.',
    },
    drops = {
        HELP_TH,
        ('/checkmate maxitems <0-%d>  sets the most items shown. 0 shows every item.'):format(drops.MAX_ITEMS),
        ('/checkmate minchance <0-%d>  leaves out items under this chance in percent, like 2.5. 0 shows every item.')
            :format(drops.MIN_CHANCE_MAX),
        '/checkmate sort chance|name  lists the items by chance, highest first, or by name.',
        '/checkmate thlabel on|off  shows or hides your Treasure Hunter in the label, like Drops (TH 2).',
        '/checkmate dropnotes on|off  shows or hides scripted loot conditions and drop or Steal eligibility notes.',
    },
    effects = {
        '/checkmate effects both|debuffs|buffs  sets what the Effects part lists: debuffs and buffs, only debuffs '
            .. 'or only buffs.',
        '/checkmate effecttimes on|off  shows or hides how long each effect has left. The times are estimates.',
        '/checkmate effectestimates on|off  puts ~ before estimated effect times, or leaves it out.',
        '/checkmate effectempty on|off  says when no matching effects have been observed, or hides the empty list.',
    },
    short = {
        '/checkmate abbreviations on|off  uses abbreviations in your /check lines and the sample, like A for Aggressive, or '
            .. 'the full words.',
        HELP_OVERLAY_ABBREVIATIONS,
        '/checkmate abbreviation <word> <text>  sets one word\'s abbreviation, like abbreviation aggro_aggressive Agg. Put '
            .. 'text with spaces in quotes, and "" prints the full word. With no text it says what the word prints as.',
        '/checkmate abbreviationreset <word>|all  puts one word\'s abbreviation back to the one checkmate comes with, or all '
            .. 'of them.',
    },
    look = {
        HELP_SKIN,
        '/checkmate skin undo  takes back your last skin pick or Reset to skin. It only goes back one step.',
        ('/checkmate font <name>  sets the settings window\'s font. The fonts are %s.'):format(window_font.IDS),
        ('/checkmate fontsize <%d-%d>  sets the settings window\'s font size in pixels.')
            :format(window_font.SIZE_MIN, window_font.SIZE_MAX),
        ('/checkmate rounding <0-%d>  sets how round the corners of the settings window, the overlay and its badges '
            .. 'are, in pixels. 0 is square.'):format(skins.ROUNDING_MAX),
        ('/checkmate spacing <%d-%d>  sets the space between the settings window\'s rows, in pixels.')
            :format(skins.SPACING_MIN, skins.SPACING_MAX),
        '/checkmate windowcolor <what> <rrggbb>  sets one settings window color. /checkmate help windowcolors lists '
            .. 'them.',
    },
    profiles = {
        HELP_PROFILE,
        '/checkmate profile undo  restores the last profile deleted in this session, if its name is still free.',
        '/checkmate profile rename <old> <new>  renames a profile, and this character\'s job links to it follow. Put '
            .. 'names with spaces in quotes.',
        ('/checkmate joblink <job> <profile>  loads that profile when you change to that main job and zone. The jobs '
            .. 'are %s.'):format(JOB_LIST),
        '/checkmate joblink <job> none  stops a job loading a profile.',
    },
};

HELP_TOPICS.appearance = {};
for _, id in ipairs({ 'colors', 'look' }) do
    for _, line in ipairs(HELP_TOPICS[id]) do HELP_TOPICS.appearance[#HELP_TOPICS.appearance + 1] = line; end
end
HELP_TOPICS.appearance[#HELP_TOPICS.appearance + 1] =
    '/checkmate tab <tab> on|off  shows or hides a settings tab for this character. Its features stay unchanged.';
HELP_TOPICS.appearance[#HELP_TOPICS.appearance + 1] =
    '/checkmate tabs all  shows every settings tab again. Appearance always stays available.';
HELP_TOPICS.abbreviations = HELP_TOPICS.short;
HELP_TOPICS.display = {};
for _, id in ipairs({ 'printout', 'overlay' }) do
    for _, line in ipairs(HELP_TOPICS[id] or {}) do HELP_TOPICS.display[#HELP_TOPICS.display + 1] = line; end
end
HELP_TOPICS.presets = {
    '/checkmate preset <name>  applies Minimal, Melee, Mage, Ranged, Tank, Blue Mage, Pet Job or Thief.',
    'Presets enable the overlay and change rows and feature choices. Preview them in Profiles first.',
    'Colors, fonts, labels, hidden tabs, merits, Treasure Hunter and manual accuracy inputs stay as you set them.',
    '/checkmate undo  undoes your last settings change in this session.',
    '/checkmate resetsection <tab>  resets one settings section. Saved profiles stay as they are.',
    '/checkmate preview  opens the read-only preview. /checkmate details opens Target details.',
};
for _, line in ipairs(HELP_TOPICS.presets) do HELP_TOPICS.profiles[#HELP_TOPICS.profiles + 1] = line; end
for _, id in ipairs(display_parts.INFO_IDS) do
    if (HELP_TOPICS[id] == nil) then HELP_TOPICS[id] = {
        ('/checkmate show|hide %s  shows or hides this row in chat.'):format(id),
        ('/checkmate overlayshow|overlayhide %s  shows or hides this row in the overlay.'):format(id),
    }; end
end

-- One line per heading, with the keys in its `field` list after the name.
local function say_groups(groups, field)
    for _, group in ipairs(groups) do
        local keys = {};
        for _, entry in ipairs(group[field]) do
            keys[#keys + 1] = entry.key;
        end
        say(('%s  %s'):format(group.name, table.concat(keys, ', ')));
    end
end

-- Palette colors per line in /checkmate help colors, so no line runs too long.
local COLORS_PER_LINE = 8;

local function print_color_help()
    say('/checkmate color <what> <color>  sets one color on the Appearance tab. <what> is one of these, grouped under the '
        .. 'tab\'s headings.');
    say_groups(printout.COLOR_GROUPS, 'colors');
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
        .. 'under the headings on the Appearance tab.');
    say_groups(skins.WINDOW_COLOR_GROUPS, 'colors');
    say('The color is six hex digits like c55151. Two more, from 00 to ff, set how solid it is, like c55151cc.');
end

local function print_abbreviation_help()
    say('<word> is one of these, grouped under the headings on the Abbreviations tab.');
    say_groups(wording.GROUPS, 'words');
    say('Part labels and the range, ID, PH, Weak, Resists and pet words, and the immunity labels, have their own '
        .. 'commands: label, rangeword, idword, phword, weakword, resistword, weaponsweakword, weaponsresistword, '
        .. 'pethitword, petevadeword and '
        .. 'immunitylabel.');
end

local function print_help(word)
    if (word == 'short') then word = 'abbreviations'; end
    if (word == 'look' or word == 'colors') then word = 'appearance'; end
    if (word == 'windowcolors') then
        print_window_color_help();
        return;
    end
    for _, line in ipairs(HELP_TOPICS[word] or HELP_MAIN) do
        say(line);
    end
    if (word == 'appearance') then
        print_color_help();
    elseif (word == 'abbreviations') then
        print_abbreviation_help();
    end
end

--[[
    Commands.
]]

-- The commands with words of their own, by tab. Each gets the command's words and the first word after
-- the command in lowercase. The rest are in SWITCHES, CHOICES and NUMBERS.
local COMMANDS = {
    preset = function (args)
        local id = rest(args, 3);
        local ok, preset = ui_tools.presets.apply(checkmate.settings, id);
        if (not ok) then print_help('presets'); return; end
        profiles.mark_preset(checkmate.settings, preset.id);
        ui_tools.label = 'Apply ' .. preset.name;
        save_settings();
        say('Applied ' .. preset.name .. '. Type /checkmate undo to restore your previous settings.');
    end,
    undo = function ()
        local ok, label = ui_tools.history.undo(checkmate.settings);
        if (not ok) then say('No settings change to undo in this session.'); return; end
        ui_tools.undoing = true;
        save_settings();
        say('Undid: ' .. label .. '.');
    end,
    resetsection = function (args)
        local changed, label = ui_tools.history.reset_section(checkmate.settings, rest(args, 3), { record = false });
        if (not changed) then say('No settings changed. Use /checkmate resetsection <tab>.'); return; end
        ui_tools.label = label;
        save_settings();
        say(label .. '. Type /checkmate undo to restore it.');
    end,
    preview = function ()
        settings_window.set_open(true);
        settings_window.preview_open, settings_window.details_open = true, false;
        settings_window.preview_preset = nil;
    end,
    details = function ()
        settings_window.set_open(true);
        settings_window.details_open = true;
    end,
    tab           = set_tab,
    tabs          = set_tab,
    weakness      = function (args, word) set_component('weaknesses', word, lower(args[4]), on_word(lower(args[5]))); end,
    bluepart      = function (args, word) set_component('blue', word, lower(args[4]), on_word(lower(args[5]))); end,
    immuneword    = function (args) set_word('immuneword', rest(args, 3)); end,
    show          = function (_, word) set_part(word, true); end,
    hide          = function (_, word) set_part(word, false); end,
    label         = function (args, word) set_label(word, rest(args, 4)); end,
    newline       = function (args, word) set_new_line(word, lower(args[4])); end,
    move          = function (args, word) move_part(word, lower(args[4])); end,
    rangeword     = function (args) set_range_word(rest(args, 3)); end,
    idword        = function (args) set_id_word(rest(args, 3)); end,
    phword        = function (args) set_ph_word(rest(args, 3)); end,
    divider       = function (args, word) set_divider(word, rest(args, 4)); end,
    labeldivider  = function (args, word) set_label_divider(word, rest(args, 4)); end,
    sample        = function () print_sample(); end,
    overlayshow   = function (_, word) set_overlay_part(word, true); end,
    overlayhide   = function (_, word) set_overlay_part(word, false); end,
    overlaydivider = function (args, word) set_overlay_divider(word, rest(args, 4)); end,
    overlayfont   = function (args) set_overlay_font(table.concat(args, ' ', 3)); end,
    overlayspot   = function (args, word) set_overlay_spot(word, args[4]); end,
    color         = function (args, word) set_color(word, table.concat(args, ' ', 4)); end,
    cutoff        = function (args, word) set_cutoff(word, lower(args[4]), args[5]); end,
    pethitword    = function (args) set_word('pethitword', rest(args, 3)); end,
    petevadeword  = function (args) set_word('petevadeword', rest(args, 3)); end,
    school        = function (args, word) set_school(word, on_word(lower(args[4]))); end,
    spell         = function (args, word) set_spell(word, table.concat(args, ' ', 4)); end,
    weakword      = function (args) set_word('weakword', rest(args, 3)); end,
    resistword    = function (args) set_word('resistword', rest(args, 3)); end,
    weaponsweakword = function (args) set_word('weaponsweakword', rest(args, 3)); end,
    weaponsresistword = function (args) set_word('weaponsresistword', rest(args, 3)); end,
    infosection = function (args, word) set_info_section(word, on_word(lower(args[4]))); end,
    immunity      = function (args, word) set_immunity(word, lower(args[4])); end,
    immunitylabel = function (args, word) set_immunity_label(word, rest(args, 4)); end,
    shortword     = function (args, word) set_abbreviation(word, rest(args, 4)); end,
    shortreset    = function (_, word) reset_abbreviation(word); end,
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

COMMANDS.abbreviation = COMMANDS.shortword;
COMMANDS.abbreviationreset = COMMANDS.shortreset;
SWITCHES.abbreviations = SWITCHES.short;
SWITCHES.overlayabbreviations = SWITCHES.overlayshort;

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
    -- Anyone's kill counts.
    if (message == DEFEATS or message == FALLS) then
        check_details.forget(index);
        monsters.on_death(index);
        tell_overlay(overlay.on_death, index);
    end
    tell_effects(effects.on_message, actor, target, param1, message, checkmate.my_id);
    tell_lessons(lessons.on_message, actor, target, param1, message, index);
    if (actor ~= checkmate.my_id) then
        return;
    end

    if (message == CHECK_IMPOSSIBLE or (message >= CHECK_FIRST and message <= CHECK_LAST)) then
        -- A checkmate stopped after an error skips the /check, so the game's line stays.
        if (checkmate.broken) then
            return;
        end
        checkmate.check_token = checkmate.check_token + 1;
        local check = on_check(target, index, param1, param2, message, checkmate.check_token);
        if (checkmate.settings.printout.replace_game_line) then
            e.blocked = true;
        end
        -- The overlay keeps it too, even when the chat printout had nothing to print.
        if (overlay_on()) then
            local con, reading, defense = check_numbers(param2, message);
            tell_overlay(overlay.on_check, index, target, param1, con, reading, defense,
                message == CHECK_IMPOSSIBLE, checkmate.check_token,
                check and check.parameter_waits and 'waiting' or 'not_requested');
        end
    elseif (checkparam.is_reply(message)) then
        local hide, finished, kind = checkparam.on_reply(os.clock(), message, param1, target, param2);
        if (hide) then
            e.blocked = true;
        end
        if (finished ~= nil) then
            stop_waiting(finished, kind, true);
        end
    end
end

--[[
    The merit list came in. While meritfill is on, each crit merit it has sets yours, which saves your settings
    when that changes it. The server sends every merit when you zone and one when you change a merit, so one you
    set by hand holds until you zone or change that merit. data\crit.lua names each merit by its settings key.
]]
local function fill_merits(e)
    local m = checkmate.settings.merits;
    if (m.fill_in ~= true) then
        return;
    end
    local changed = false;
    for key, merit in pairs(physical.MERITS) do
        local count = packets.merit_count(e, merit.id);
        if (count ~= nil) then
            count = physical.clamp_merits(count, merit.most);
            changed = changed or count ~= m[key];
            m[key] = count;
            -- A server refresh is not a user edit and must not replace the last settings undo.
            if (ui_tools.saved and ui_tools.saved.merits) then ui_tools.saved.merits[key] = count; end
        end
    end
    if (changed) then
        save_settings();
    end
end

-- Another addon can block the /check line, and checkmate still reads it.
ashita.events.register('packet_in', 'checkmate_packet_in', function (e)
    if (not packets.valid(e)) then return; end
    local id = e.id;
    if (id == packets.ID.ACTION) then
        tell_effects(effects.on_action, e, checkmate.my_id);
        tell_lessons(lessons.on_action, e);
    elseif (id == packets.ID.ENTITY) then
        tell_effects(effects.on_entity, e);
        tell_lessons(lessons.on_entity, e);
        local vanished, index = packets.despawned(e);
        if (vanished ~= nil and index ~= nil and index > 0) then
            check_details.forget(index);
            monsters.on_disappear(index);
            pet.on_disappear(index);
            tell_overlay(overlay.on_disappear, vanished, index);
        end
    elseif (id == packets.ID.MESSAGE) then
        on_message(e);
    elseif (id == packets.ID.WIDESCAN) then
        local index, level = packets.widescan(e);
        monsters.on_widescan(index, level);
        tell_overlay(overlay.on_widescan, index, level);
    elseif (id == packets.ID.STATS) then
        tell_overlay(overlay.on_stats, e);
    elseif (id == packets.ID.JOB_INFO) then
        player.on_base_hp(packets.base_hp(e));
    elseif (id == packets.ID.PET_SYNC) then
        local index = packets.pet_index(e);
        pet.on_sync(index);
        tell_overlay(overlay.on_pet_sync, index);
    elseif (id == packets.ID.MERITS) then
        local count = packets.merit_count(e, pet.AFFINITY_ID);
        if (count ~= nil) then
            pet.on_affinity(count);
        end
        fill_merits(e);
        modifiers.on_merits(e);
        if (overlay_on()) then overlay.changed(checkmate.settings); end
        tell_effects(effects.on_merits, e);
    elseif (id == packets.ID.SPELLS) then
        blue_finder.changed();
        local s = checkmate.settings;
        if (display_parts.blue_enabled(s, 'lessons', 'overlay')) then tell_overlay(overlay.changed, s); end
    elseif (id == packets.ID.ZONE_IN) then
        blue_finder.changed();
        check_details.forget();
        lessons.on_zone();
        effects.forget(true);
        modifiers.forget();
        player.on_base_hp(nil);
        player.forget_attacks();
        checkmate.my_id = packets.zone_in(e);
        monsters.forget_zone();
        checkmate.ready = {};
        pet.forget();
        for _, check in ipairs(checkparam.reset()) do
            give_up(check);
        end
        checkmate.job_check = true;
        tell_overlay(overlay.on_zone, e);
    end
end);

-- Any /check or /checkparam going out, yours, checkmate's or another addon's. The game ignores a /checkparam
-- sent too soon after one of these, so checkmate's next /checkparam waits for it. Nothing going out is changed
-- or blocked.
ashita.events.register('packet_out', 'checkmate_packet_out', function (e)
    if (e.id == packets.CHECK_OUT) then
        checkparam.wait_from(os.clock());
    end
end);

--[[
    Frame.
]]

-- Sends a /checkparam when it's due, and lets the /check print without it when the reply is late. A pet
-- that's gone by the time its request is due gets nothing sent. Its pet line prints with unknown numbers when
-- it shares a line, and is left out when it's alone.
local function update_checkparam(now)
    local kind, about = checkparam.ready(now);
    if (kind == 'pet' and not pet.out(about)) then
        pet_gone(checkparam.cancel('pet'));
    elseif (kind ~= nil) then
        checkparam.sent(now, kind);
        AshitaCore:GetChatManager():QueueCommand(COMMAND_TYPED, checkparam.COMMANDS[kind]);
        return;
    end
    local late, late_kind = checkparam.timed_out(now);
    if (late ~= nil) then
        stop_waiting(late, late_kind);
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

-- Draws the overlay. A mistake in it stops the overlay and says so once, and the chat printout keeps going. It
-- saves your settings when you let go of the overlay after moving it or dragging its corner.
local function draw_overlay()
    local ok, result = pcall(overlay.draw, checkmate.settings, settings_window.is_open(), sample_result);
    if (not ok) then
        overlay_broke(result);
    elseif (result) then
        save_settings();
    end
end

--[[
    The settings window hands back what to do after it draws. `save` writes your settings and
    `sample` prints the sample printout. `edited` means a slider or text box changed a setting it
    hasn't saved yet, so the overlay shows that change on the next frame.
]]
local function draw_window()
    if (not settings_window.is_open()) then
        return;
    end
    local details;
    if (overlay_on()) then details = target_info.current(); else details = check_details.current(); end
    settings_window.set_target_details(details);
    local result = settings_window.draw(checkmate.settings, addon.version, sample_result);
    if (result.sample) then
        print_sample();
    end
    if (result.undo) then
        ui_tools.history.record(checkmate.settings, ui_tools.saved, result.label);
        ui_tools.undoing = ui_tools.history.undo(checkmate.settings);
        if (ui_tools.undoing) then save_settings(); end
    elseif (result.reset_section) then
        local changed, label = ui_tools.history.reset_section(checkmate.settings, result.reset_section, { record = false });
        if (changed) then ui_tools.label = label; save_settings(); end
    elseif (result.save) then
        ui_tools.label = result.label;
        save_settings();
    elseif (result.edited and overlay_on()) then
        overlay.changed(checkmate.settings);
    end
end

local function frame()
    local now = os.clock();
    tell_effects(effects.take_in, now);
    tell_lessons(lessons.take_in, now);
    check_details.refresh(checkmate.settings.blue.seen);
    if (checkparam.is_active()) then
        update_checkparam(now);
    end
    pet.on_frame(now);
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
    if (overlay_on()) then
        draw_overlay();
    end
    draw_window();
end

-- A frame that fails stops checkmate and says so once, instead of every frame.
ashita.events.register('d3d_present', 'checkmate_present', function ()
    if (checkmate.broken) then
        return;
    end
    local ok, err = pcall(frame);
    if (not ok) then
        checkmate.broken = true;
        tracking_changed();
        say(('Stopped after an error: %s. Type /checkmate to try again.'):format(tostring(err)));
    end
end);

ashita.events.register('load', 'checkmate_load', function ()
    checkmate.my_id = player.server_id() or 0;
    pet.on_load();
    tidy(checkmate.settings);
    tracking_changed();
    ui_tools.saved = ui_tools.history.capture(checkmate.settings);
    profiles.changed(checkmate.settings);
    -- Fonts only ever load here. Adding one in the middle of a frame can crash the game.
    window_font.load_all();
    icons.prepare(checkmate.settings.overlay);
end);

ashita.events.register('unload', 'checkmate_unload', function ()
    player.forget_attacks();
    blue_finder.changed();
    check_details.forget();
    lessons.forget();
    effects.forget(true);
    modifiers.forget();
    settings.save();
    icons.clear();
end);

-- Another character logged in, or the settings were reset. The new settings replace the current ones.
settings.register('settings', 'checkmate_settings_update', function (s)
    if (s ~= nil) then
        checkparam.reset();
        checkmate.ready = {};
        overlay.forget();
        blue_finder.changed();
        check_details.forget();
        lessons.forget();
        effects.forget(true);
        modifiers.forget();
        player.on_base_hp(nil);
        player.forget_attacks();
        pet.on_load();
        checkmate.settings = s;
    end
    tidy(checkmate.settings);
    ui_tools.history.clear(checkmate.settings);
    ui_tools.saved = ui_tools.history.capture(checkmate.settings);
    profiles.changed(checkmate.settings);
    skins.forget_undo();
    settings_window.place_again();
    settings_window.changed();
    checkmate.reset_asked = nil;
    checkmate.my_id = player.server_id() or 0;
    checkmate.last_job = nil;
    checkmate.job_check = true;
    overlay_changed();
end);
