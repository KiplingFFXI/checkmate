--[[
    Keeps the overlay's target, checks and widescan levels for this zone.
    Packets queue changes for the next frame. The readout is rebuilt when a relevant input changes.
    Local stats, gear and buffs are polled at most four times a second while a visible part needs them.

    A kept check records your level too. Its difficulty and defense/evasion reading only apply at
    that level. The overlay handles errors here without interrupting the chat printout.
]]

local player   = require('core.player');
local monsters = require('core.monsters');
local physical = require('core.physical');
local pdif     = require('core.pdif');
local defenses = require('core.defenses');
local aggro    = require('core.aggro');
local magic    = require('core.magic');
local elements = require('core.elements');
local weapons  = require('core.weapons');
local monster_info = require('core.info');
local display_parts = require('core.parts');
local pet = require('core.pet');
local drops    = require('core.drops');
local steal    = require('core.steal');
local effects  = require('core.effects');
local modifiers = require('core.modifiers');
local lessons = require('core.lessons');

local target = {};

local kept     = {};     -- Your last /check of each monster in this zone, by entity index.
local scans    = {};     -- Widescan levels, cleared when that monster dies or leaves sight.
local pending  = {};     -- What the packet handlers noted since the last frame, oldest first.
local my_level = nil;    -- Your main level, or nil until it's read in this zone.
local my_sub   = nil;    -- Your support job from the stats packet, 0 while it's restricted, or nil until one comes in.
local shown_id = nil;
local effects_seen = 0;
local lessons_seen = 0;
local shown    = 0;      -- The entity index on show.
local dead     = nil;    -- The index on show when its death message came. It stays hidden until your target changes.
local stale    = true;   -- The readout needs working out again.
local ready    = false;  -- This zone's data has been loaded.
local readout  = nil;    -- The readout of the monster on show, or nil when there's nothing to show.
local next_inputs = 0;
local scan_times = {};
local pet_checks = {};
local pet_signature = nil;
local attack_signature, attack_revision = nil, nil;
local defense_signature = nil;
local parameter_signature, condition_signature = nil, nil;
local ranged_distance = nil;
local PARAMETER_CHANGED = 'Your inputs changed after the stat reading. Check again.';
local PARAMETER_UNKNOWN = 'Check this monster for fresh accuracy and evasion.';
local RETAINED_NOTE = 'Your inputs changed after this reading. Check again to refresh it.';
local PARAMETER_PARTS = { 'hit', 'offhand', 'ranged', 'ranged_far', 'evade' };
local PDIF_PARTS = { 'pdif', 'offhandpdif', 'rangedpdif' };

-- Keep the last calculated number without changing a result already shown in Target details.
local function retained_number(value, at)
    if (value == nil or value.retained) then return value; end
    local out = {};
    for key, field in pairs(value) do out[key] = field; end
    out.notes = {};
    for _, note in ipairs(value.notes or {}) do out.notes[#out.notes + 1] = note; end
    out.notes[#out.notes + 1] = RETAINED_NOTE;
    out.retained, out.uncertain = true, true;
    out.observed_at = out.observed_at or at;
    return out;
end

--[[
    What came in from the server. Each one is only noted here, so nothing in these can fail or read game
    memory. The next frame works them out in order.
]]

-- Your /check of the monster at `index` came back. `check_level` is the level it gave, and con, reading and
-- defense are nil when it's impossible to gauge.
function target.on_check(index, id, check_level, con, reading, defense, impossible, token, parameter_state)
    pending[#pending + 1] = { kind = 'check', index = index, id = id, check_level = check_level, con = con,
        reading = reading, defense = defense, impossible = impossible, token = type(token) == 'number' and token or nil,
        parameter_state = parameter_state or 'not_requested' };
end

function target.on_parameters(index, id, token, snapshot, reason)
    pending[#pending + 1] = { kind = 'parameters', index = index, id = id, token = token,
        snapshot = snapshot, reason = reason };
end

function target.on_widescan(index, level)
    pending[#pending + 1] = { kind = 'scan', index = index, level = level };
end

function target.on_death(index)
    pending[#pending + 1] = { kind = 'death', index = index };
end

function target.on_level(level, sub_job)
    pending[#pending + 1] = { kind = 'level', level = level, sub_job = sub_job };
end

function target.on_zone(zone)
    pending[#pending + 1] = { kind = 'zone', zone = zone };
end

function target.on_disappear(id, index)
    pending[#pending + 1] = { kind = 'disappear', id = id, index = index };
end

-- Only a manual check supplies these numbers. The overlay never requests them.
function target.on_pet_parameters(index, id, own, token)
    if (own.accuracy == nil or own.evasion == nil) then return; end
    pending[#pending + 1] = { kind = 'pet', index = index, id = id, token = token, pet = {
        id = own.id, index = own.index, low = own.low, high = own.high,
        generation = own.generation,
        accuracy = own.accuracy, evasion = own.evasion, at = os.clock() } };
end

function target.on_pet_sync(index)
    pending[#pending + 1] = { kind = 'pet_sync', pet_index = index };
end

-- Your main level, read the first time it's needed in a zone. The stats packet keeps it up to date after that.
function target.my_level()
    my_level = my_level or player.main_level();
    return my_level;
end

-- Works out one thing that came in.
local function take(event)
    local index = event.index;
    if (event.kind == 'check') then
        pet_checks[index] = nil;
        local row = monsters.find(player.zone(), event.id, player.entity_name(index));
        local level = nil;
        if (event.check_level >= 1) then
            level = event.check_level - (row and row.level_mod or 0);
        end
        kept[index] = { id = event.id, level = level, con = event.con, reading = event.reading,
            defense = event.defense, impossible = event.impossible, my_level = target.my_level(), at = os.clock(),
            token = event.token, parameter_state = event.parameter_state,
            parameter_reason = event.parameter_state == 'waiting' and 'Waiting for the stat reply.' or PARAMETER_UNKNOWN };
    elseif (event.kind == 'parameters') then
        local check = kept[index];
        if (check ~= nil and check.id == event.id and type(event.token) == 'number' and check.token == event.token) then
            check.parameters = event.snapshot;
            check.parameter_last = nil;
            check.parameter_state = event.snapshot and 'received' or 'unavailable';
            check.parameter_reason = not event.snapshot and (event.reason or PARAMETER_UNKNOWN) or nil;
            check.condition_changed = event.snapshot and event.snapshot.condition_changed == true;
        end
    elseif (event.kind == 'scan') then
        if (event.level < 1) then
            return;
        end
        -- A different level means a different monster is there now. A /check with no level, like an NM's, stays.
        local check = kept[index];
        if (check ~= nil and check.level ~= nil and check.level ~= event.level) then
            kept[index] = nil;
        end
        scans[index] = event.level;
        scan_times[index] = os.clock();
    elseif (event.kind == 'death' or event.kind == 'disappear') then
        kept[index], scans[index] = nil, nil;
        pet_checks[index] = nil;
        scan_times[index] = nil;
        if (event.kind == 'death' and index == shown) then
            dead = index;
        end
        if (event.kind == 'disappear') then
            for key, saved in pairs(pet_checks) do
                if (saved.pet.id == event.id) then pet_checks[key] = nil; stale = true; end
            end
        end
    elseif (event.kind == 'level') then
        -- A support job can come back at the same level, like in Dynamis, and that changes your Steal and stats.
        if (event.level ~= my_level or event.sub_job ~= my_sub) then
            my_level, my_sub, stale = event.level, event.sub_job, true;
            pet_checks, pet_signature = {}, nil;
        end
        return;
    elseif (event.kind == 'pet') then
        local check = kept[index];
        if (check ~= nil and check.id == event.id and (event.token == nil or check.token == event.token)) then
            pet_checks[index] = { id = event.id, pet = event.pet };
        end
    elseif (event.kind == 'pet_sync') then
        for key, saved in pairs(pet_checks) do
            if (event.pet_index == 0 or saved.pet.index ~= event.pet_index) then pet_checks[key] = nil; end
        end
        stale = true;
        return;
    elseif (event.kind == 'zone') then
        kept, scans, my_level, my_sub, dead, stale = {}, {}, nil, nil, nil, true;
        scan_times, next_inputs = {}, 0;
        pet_checks, pet_signature = {}, nil;
        parameter_signature, condition_signature, ranged_distance = nil, nil, nil;
        monsters.preload(event.zone);
        ready = true;
        return;
    end
    if (index == shown) then
        stale = true;
    end
end

-- Takes in everything the packet handlers noted, oldest first. The first time it runs in a zone, like when you
-- just turned the overlay on, it loads this zone's data.
function target.take_in()
    if (#pending > 0) then
        local events = pending;
        pending = {};
        for _, event in ipairs(events) do
            take(event);
        end
    end
    if (not ready) then
        monsters.preload(player.zone());
        ready = true;
    end
end

-- Reads your target and returns its entity index, 0 for none. `o` is the overlay settings. A new target
-- shows again even if the last one died, and with Remember off it forgets every /check.
function target.read(o)
    local index = player.target_index(o.follow_cursor == true);
    if (index ~= shown) then
        shown, dead, stale, shown_id, readout = index, nil, true, nil, nil;
        if (o.remember ~= true) then
            kept = {};
            pet_checks = {};
        end
    end
    return index;
end

--[[
    The readout for the monster at `index`, or nil when there's nothing to show. Pets, trusts and monsters
    a script spawns mid-game have no data, so they only show once you /check them, and a pet never answers
    a /check. Crit, crit taken, magic and steal go by your stats and gear right now, and work out over the
    levels the monster can be when its level isn't known yet.
]]
local function build(index, s, parameter_inputs, attack_inputs, defensive_inputs)
    if (index == 0 or index == dead) then
        return nil;
    end
    local parts = s.overlay.parts;
    local magic_on = parts.magic == true or display_parts.blue_enabled(s, 'chance', 'overlay');
    local pdif_on = parts.pdif == true or parts.offhandpdif == true or parts.rangedpdif == true;
    local defenses_on = parts.block == true or parts.parry == true;
    local parameters_on = parts.hit == true or parts.offhand == true or parts.ranged == true or parts.evade == true;
    local name, id = player.monster(index);
    shown_id = id;
    effects_seen = id and effects.version(id) or 0;
    lessons_seen = s.blue.seen and display_parts.blue_enabled(s, 'lessons', 'overlay') and lessons.version(index) or 0;
    if (name == nil) then
        return nil;
    end
    local check = kept[index];
    if (check ~= nil and check.id ~= id) then
        kept[index], check = nil, nil;
    end
    if (check == nil and not monsters.placed(id) and not (parts.effects == true and effects.has(id))) then
        return nil;
    end

    local row = monsters.find(player.zone(), id, name);
    local your_level = target.my_level();
    local low, high, level_source, observed_at;
    if (check ~= nil and check.level ~= nil) then
        low, high = check.level, check.level;
        level_source, observed_at = 'check', check.at;
    elseif (scans[index] ~= nil) then
        low, high = scans[index], scans[index];
        level_source, observed_at = 'widescan', scan_times[index];
    elseif (row ~= nil) then
        low, high = monsters.spawn_range(row, index);
        level_source = 'spawn';
    end

    local result = { name = (name ~= '' and name) or (row and row.name) or 'The monster', id = id, low = low,
        high = high, ph_for = monsters.ph_for(row, index), ph_details = monsters.ph_details(row, index),
        scripted = row ~= nil and row.flags ~= nil and row.flags.scripted_stats == true,
        provenance = { level_source = level_source or 'unknown', observed_at = observed_at,
            checked_at = check and check.at, inputs_at = os.clock(), stats_source = row and 'source' or 'band' } };
    if (check ~= nil) then
        result.impossible = check.impossible;
        -- The con and the reading only hold at the level you checked it at.
        if (check.my_level == your_level) then
            result.con, result.reading, result.defense = check.con, check.reading, check.defense;
        end
    end
    local exact = low ~= nil and low == high;
    if (row ~= nil and exact) then
        result.range_low, result.range_high = monsters.range_around(row, index, low);
    end

    if (parts.effects == true) then
        result.effects = effects.readout(id, s.effects.show, os.clock());
    end
    local parameters = parameters_on and check and check.parameters or nil;
    local previous = parameters_on and check and check.parameter_last or nil;
    if (parameters_on) then
        result.provenance.parameter_at = parameters and parameters.observed_at or previous and previous.at;
        result.provenance.parameter_state = check and check.parameter_state or 'not_requested';
        if (check ~= nil) then result.provenance.parameter_reason = check.parameter_reason;
        else result.provenance.parameter_reason = PARAMETER_UNKNOWN; end
        result.parameter_reason = result.provenance.parameter_reason;
        result.dual_wield, result.shoots = parameter_inputs.dual_wield, parameter_inputs.shoots;
        if (parts.ranged and s.ranged.show_distance and ranged_distance ~= nil) then
            result.ranged_distance = { distance = ranged_distance };
        end
    end
    local me, mob;
    if (parts.crit == true or parts.crittaken == true or magic_on or parameters ~= nil) then
        me = player.read();
        me.modifiers = modifiers.read(me);
        result.inputs = me;
        me.extra_accuracy = s.magic.extra_accuracy;
        me.crit_merits, me.enemy_crit_merits = s.merits.crit_hit_rate, s.merits.enemy_crit_rate;
        mob = { row = row, low = low, high = high, effects = effects.readout(id, 'both', os.clock()) };
        if (parameters ~= nil) then
            me.accuracy, me.evasion = parameters.accuracy, parameters.evasion;
            me.offhand_accuracy, me.ranged_accuracy = parameters.offhand_accuracy, parameters.ranged_accuracy;
            mob.con, mob.reading = result.con, result.reading;
        end
    end
    if (parts.crittaken == true) then
        me.crit_evasion = physical.crit_evasion(player.equipped_items(), me.level);
    end
    if (parts.crit == true or parts.crittaken == true or parameters ~= nil) then
        local numbers = physical.readout(me, mob);
        if (parts.crit or parts.crittaken) then result.crit, result.crittaken = numbers.crit, numbers.crittaken; end
        result.tp_moves = numbers.tp_moves;
        result.no_swings, result.counters = numbers.no_swings, numbers.counters;
        result.notes, result.uncertain = numbers.notes, numbers.uncertain;
        if (parameters ~= nil) then
            local saved = { at = parameters.observed_at, values = {}, signet = numbers.signet,
                no_swings = numbers.no_swings, counters = numbers.counters, tp_moves = numbers.tp_moves,
                inputs = { level = me.level, accuracy = me.accuracy, evasion = me.evasion,
                    offhand_accuracy = me.offhand_accuracy, ranged_accuracy = me.ranged_accuracy } };
            for _, key in ipairs(PARAMETER_PARTS) do saved.values[key] = numbers[key]; end
            check.parameter_last = saved;
            result.parameter_inputs = saved.inputs;
            if (parts.hit) then result.hit = numbers.hit; end
            if (parts.offhand and result.dual_wield) then result.offhand = numbers.offhand; end
            if (parts.ranged and result.shoots) then result.ranged, result.ranged_far = numbers.ranged, numbers.ranged_far; end
            if (parts.evade) then result.evade, result.signet = numbers.evade, numbers.signet; end
            if (check.condition_changed) then physical.qualify_parameters(result); end
        end
    end
    if (parts.pet == true) then
        local own = pet.find(id);
        if (own ~= nil) then
            local saved = pet_checks[index];
            local observed = saved and saved.id == id and saved.pet or nil;
            if (observed ~= nil and (observed.id ~= own.id or observed.index ~= own.index
                or observed.low ~= own.low or observed.high ~= own.high or observed.generation ~= own.generation)) then
                pet_checks[index], observed = nil, nil;
            end
            if (observed ~= nil) then own.accuracy, own.evasion = observed.accuracy, observed.evasion; end
            result.pet = physical.pet_readout(own, { row = row, low = low, high = high,
                effects = effects.readout(id, 'both', os.clock()) });
            result.pet.scripted = own.scripted or (row and row.flags and row.flags.scripted_stats == true);
            result.pet.observed_at = observed and observed.at;
            result.pet.parameter_state = own.asks and (observed and 'checked' or 'unknown') or 'source';
        end
    end
    if (pdif_on) then
        local own = attack_inputs or player.pdif_inputs();
        attack_signature, attack_revision = own.signature, own.revision;
        local enemy = mob or { row = row, low = low, high = high, effects = effects.readout(id, 'both', os.clock()) };
        result.dual_wield, result.shoots = own.dual_wield, own.shoots;
        if (parts.pdif == true) then result.pdif = pdif.readout(own, enemy, 'main'); end
        if (parts.offhandpdif == true and own.dual_wield) then result.offhandpdif = pdif.readout(own, enemy, 'offhand'); end
        if (parts.rangedpdif == true and own.shoots) then result.rangedpdif = pdif.readout(own, enemy, 'ranged'); end
        if (check ~= nil) then
            if (own.attack_state == 'checked' and check.pdif_revision ~= own.revision) then
                check.pdif_last, check.pdif_revision = nil, own.revision;
            end
            local saved = check.pdif_last or {};
            for _, key in ipairs(PDIF_PARTS) do
                if (parts[key]) then
                    local value = result[key];
                    if (value ~= nil and value.low ~= nil and value.high ~= nil) then
                        saved[key] = value;
                    elseif (own.attack_state ~= 'checked' and saved[key] ~= nil) then
                        saved[key] = retained_number(saved[key]);
                        result[key] = saved[key];
                    end
                end
            end
            check.pdif_last = saved;
        end
    end
    if (parameters == nil and previous ~= nil) then
        for _, key in ipairs(PARAMETER_PARTS) do
            if (parts[key] or (key == 'ranged_far' and parts.ranged)) then
                previous.values[key] = retained_number(previous.values[key], previous.at);
                result[key] = previous.values[key];
            end
        end
        result.parameter_inputs, result.signet = previous.inputs, previous.signet;
        result.no_swings, result.counters, result.tp_moves = previous.no_swings, previous.counters, previous.tp_moves;
    end
    -- Old off-hand and ranged readings still belong to the weapons used for that check.
    result.dual_wield = result.dual_wield or result.offhand ~= nil or result.offhandpdif ~= nil;
    result.shoots = result.shoots or result.ranged ~= nil or result.rangedpdif ~= nil;
    if (defenses_on) then
        local own = defensive_inputs or player.defense_inputs();
        defense_signature = own.signature;
        local enemy = { row = row, low = low, high = high };
        if (parts.block == true) then result.block = defenses.readout(own, enemy, 'block'); end
        if (parts.parry == true) then result.parry = defenses.readout(own, enemy, 'parry'); end
        if (me == nil) then result.provenance.inputs_at = own.observed_at; end
    end
    -- The rest all need the monster's data row.
    if (row == nil) then
        return result;
    end
    if (parts.job == true) then
        result.job = row.job;
    end
    if (parts.aggro == true) then
        result.aggro = aggro.readout(row, result, your_level, s.aggro);
    end
    if (parts.links == true) then
        result.links = aggro.links(row, s.links);
    end
    if (magic_on) then
        result.magic = magic.readout(me, mob, display_parts.magic_settings(s, 'overlay'));
    end
    if (display_parts.component_enabled(s, 'immunities', 'overlay')) then
        result.immune = row.immune;
    end
    if (display_parts.component_enabled(s, 'elements', 'overlay')) then
        result.elements = elements.readout(row, exact and low or nil);
    end
    if (display_parts.component_enabled(s, 'weapons', 'overlay')) then
        result.weapons = weapons.readout(row, exact and low or nil);
    end
    if (display_parts.any_info(s, 'overlay')) then
        result.info = monster_info.readout(row, low, high, display_parts.info_settings(s, 'overlay'), index);
    end
    if (parts.drops == true) then
        result.drops = drops.readout(row, s.drops);
    end
    if (parts.steal == true) then
        -- Your jobs and gear only matter for a monster with something to steal.
        local you = (row.steal ~= nil) and steal.you(player.jobs()) or nil;
        result.steal = steal.readout(row, you, low, high);
    end
    return result;
end

-- The readout for your target, worked out again when something changed, or nil when there's nothing to show.
-- `s` is your settings.
function target.readout(s)
    local parts, now = s.overlay.parts, os.clock();
    local magic_on = parts.magic == true or display_parts.blue_enabled(s, 'chance', 'overlay');
    local pdif_on = parts.pdif == true or parts.offhandpdif == true or parts.rangedpdif == true;
    local defenses_on = parts.block == true or parts.parry == true;
    local parameters_on = parts.hit == true or parts.offhand == true or parts.ranged == true or parts.evade == true;
    local parameter_inputs, attack_inputs, defensive_inputs;
    if (shown_id ~= nil and effects_seen ~= effects.version(shown_id)
        and (parts.effects or parts.crit or parts.crittaken or magic_on or parts.pet or pdif_on or parameters_on)) then
        stale = true;
    end
    if (s.blue.seen and display_parts.blue_enabled(s, 'lessons', 'overlay')
        and lessons_seen ~= lessons.version(shown)) then stale = true; end
    if (parameters_on and shown ~= 0 and (stale or now >= next_inputs)) then
        parameter_inputs = player.parameter_inputs();
        if (parameter_inputs.level ~= nil and parameter_inputs.level ~= my_level) then
            my_level, stale = parameter_inputs.level, true;
        end
        local condition_changed = parameter_inputs.condition_signature ~= condition_signature;
        if (parameter_inputs.signature ~= parameter_signature) then stale = true; end
        parameter_signature, condition_signature = parameter_inputs.signature, parameter_inputs.condition_signature;
        if (stale or condition_changed) then
            for index, check in pairs(kept) do
                local saved = check.parameters;
                if (saved ~= nil) then
                    if (parameter_inputs.signature == nil or saved.signature ~= parameter_inputs.signature) then
                        check.parameters, check.parameter_state = nil, 'stale';
                        check.parameter_reason = parameter_inputs.reason or (check.parameter_last and RETAINED_NOTE or PARAMETER_CHANGED);
                    elseif (not check.condition_changed and saved.condition_signature ~= parameter_inputs.condition_signature) then
                        check.condition_changed = true;
                        if (index == shown) then stale = true; end
                    end
                end
            end
        end
        if (parts.ranged and s.ranged.show_distance) then
            local distance = player.distance(shown);
            if (distance ~= ranged_distance) then ranged_distance, stale = distance, true; end
        end
    end
    if (shown ~= 0 and now >= next_inputs and (parts.crit or parts.crittaken or magic_on
        or parts.steal or parts.pet or pdif_on or defenses_on or parameters_on)) then
        next_inputs = now + 0.25;
        if ((parts.crit or parts.crittaken or magic_on or parts.steal) and player.inputs_changed()) then
            my_level, stale = player.main_level(), true;
        end
        if (parts.pet) then
            local own = pet.find(shown_id);
            local signature = own and table.concat({ own.id, own.index, own.low or 0, own.high or 0,
                own.generation or 0 }, ':') or '';
            if (signature ~= pet_signature) then
                if (pet_signature ~= nil) then pet_checks = {}; end
                pet_signature, stale = signature, true;
            end
        end
        if (pdif_on) then
            attack_inputs = player.pdif_inputs();
            if (attack_inputs.signature ~= attack_signature or attack_inputs.revision ~= attack_revision) then stale = true; end
        end
        if (defenses_on) then
            defensive_inputs = player.defense_inputs();
            if (defensive_inputs.signature ~= defense_signature) then stale = true; end
        end
    end
    if (stale) then
        readout = build(shown, s, parameter_inputs, attack_inputs, defensive_inputs);
        stale = false;
        return readout, true;
    end
    return readout, false;
end

-- A setting changed, so the readout is worked out again.
function target.mark_stale()
    stale = true;
end

-- A target the overlay skips must not leave the previous details on show.
function target.clear_current()
    if (readout ~= nil) then readout, stale = nil, true; end
end

-- The settings window can show these details without taking another target or stat reading.
function target.current()
    return readout;
end

-- Forgets everything, for turning the overlay off or starting it again after an error. Deaths and zoning
-- aren't tracked meanwhile. The next frame loads this zone's data again.
function target.forget()
    kept, scans, pending, my_level, my_sub, shown, dead = {}, {}, {}, nil, nil, 0, nil;
    stale, ready, readout, shown_id, effects_seen = true, false, nil, nil, 0;
    scan_times, next_inputs = {}, 0;
    pet_checks, pet_signature = {}, nil;
    attack_signature, attack_revision = nil, nil;
    defense_signature = nil;
    parameter_signature, condition_signature, ranged_distance = nil, nil, nil;
end

return target;
