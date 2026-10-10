--[[
    Tracks effects seen landing on nearby monsters. The client gets no complete monster buff list.
    Timers use Phoenix durations and, for your own effects, the gear and merits we can read.
    Other players' gear, resists and hidden powers can change the actual duration.

    Removal messages, damage, death, despawn, distance and zoning clear observations where known.
    Packet handlers queue changes for the next frame. Tracking runs while a display or combat
    calculation needs it and sends no requests.
]]

local packets  = require('core.packets');
local player   = require('core.player');

local effects = {};

-- What a reader calls when it fails. checkmate.lua puts its own here, which stops only effects and says so once.
-- Until then a mistake is raised as it is.
effects.broke = error;

-- Server ids from here up are monsters and pets. Players are under it.
local FIRST_MONSTER_ID = 0x1000000;

-- Action categories (0x028) that can put an effect on a monster or take one off. The others start an action and
-- carry nothing, so the handler stops after reading the category.
local MELEE, RANGED, SKILL, SPELL, ABILITY, MOB_SKILL, PET_SKILL = 1, 2, 3, 4, 6, 11, 13;
local WANTED = { [MELEE] = true, [RANGED] = true, [SKILL] = true, [SPELL] = true, [5] = true, [ABILITY] = true,
    [MOB_SKILL] = true, [PET_SKILL] = true };

-- Which table in data\effects.lua says how long an action's effect lasts, by its category. A SKILL action is a
-- weapon skill, a physical job ability or a pet's move, and its message says which (ABILITY_MESSAGES).
local SOURCES = { [SPELL] = 'spells', [ABILITY] = 'abilities', [MOB_SKILL] = 'skills', [PET_SKILL] = 'pacts' };

--[[
    Result messages that say an effect landed, with the effect's id in the result's number, and what it is. The
    "gains the effect of" ones are 'buff', a monster's own buff, and the rest 'on', a debuff. 266, 267, 277 and 278
    are what the second and later targets of an area action get.
]]
local LANDED = { [127] = 'on', [186] = 'buff', [230] = 'buff', [236] = 'on', [237] = 'on', [242] = 'on',
    [243] = 'on', [266] = 'buff', [267] = 'on', [268] = 'on', [271] = 'on', [277] = 'on', [278] = 'on',
    [319] = 'buff', [320] = 'on' };

-- The landed messages only a job ability gives. A SKILL action whose first result has one is an ability.
local ABILITY_MESSAGES = { [127] = true, [277] = true, [319] = true, [320] = true };

-- "<monster> uses <two-hour>." On itself, its number is the effect, when the move puts one on at all.
local USES = 101;

-- "Additional effect: <status>." from a weapon, ammo or a pet's attack.
local PROC_LANDED = { [160] = true, [164] = true };

-- Messages that say an effect was taken off, with its id in the number: -na spells and the like, Dispel and
-- Finale, a TP move or added effect that dispels, Dark Shot, and an item.
local TAKEN_OFF = { [83] = true, [123] = true, [159] = true, [168] = true, [321] = true, [341] = true,
    [343] = true, [378] = true };

-- Damage from a hit, a spell, an ability, a TP move, a shot or an added effect. Any of it over 0 wakes a monster,
-- most likely breaks its Bind and gets through its Stoneskin.
local DAMAGE = { [1] = true, [2] = true, [67] = true, [110] = true, [163] = true, [185] = true, [229] = true,
    [252] = true, [264] = true, [317] = true, [352] = true, [353] = true, [576] = true, [577] = true };

-- 0x029: your own effect wearing off a monster, and a monster dying.
local WEARS_OFF = { [204] = true, [206] = true };
local DIED      = { [6] = true, [20] = true };

-- Sleep, Sleep II and Lullaby. A wear-off names 2 for all three.
local SLEEPS = { [2] = true, [19] = true, [193] = true };
local SLEEP, BIND, STONESKIN, DIA, BIO = 2, 11, 37, 134, 135;

-- Damage over time: Poison, the six elemental ones, Dia, Bio and Requiem. Each 3 second tick wakes a monster,
-- unless its sleep is an avatar's Nightmare or a Stoneskin soaks the tick.
local TICKS = { [3] = true, [128] = true, [129] = true, [130] = true, [131] = true, [132] = true, [133] = true,
    [134] = true, [135] = true, [192] = true };
local TICK_SECONDS = 3;

-- How many monsters it keeps. A new one past this pushes out the one it heard about longest ago.
local MAX_MONSTERS = 48;
local MAX_EFFECTS = 64;        -- A bad stream cannot grow one monster's list without a limit.

-- How many things wait for the next frame. When frames stop, like while the game is minimized, a full queue is
-- taken in right away instead.
local MAX_QUEUED = 256;

-- How long an effect with no known length stays, in seconds.
local UNTIMED_SECONDS = 180;
local LAST_EFFECT_ID = 1023;   -- A bound above every current Phoenix effect.

-- An empty list to read from, so nothing is made for an effect that takes nothing off.
local NONE = {};

-- checkmate's own word for each debuff players put on a monster, by effect id, as its key in core\wording.lua.
-- Every other effect takes the game's own name. One of these is always a debuff, whatever message it came with.
effects.WORDS = {
    [2] = 'eff_sleep', [19] = 'eff_sleep', [193] = 'eff_sleep', [3] = 'eff_poison', [4] = 'eff_paralysis',
    [5] = 'eff_blindness', [6] = 'eff_silence', [7] = 'eff_petrification', [9] = 'eff_curse', [20] = 'eff_curse',
    [10] = 'eff_stun', [11] = 'eff_bind', [12] = 'eff_weight', [13] = 'eff_slow', [28] = 'eff_terror',
    [31] = 'eff_plague', [128] = 'eff_burn', [129] = 'eff_frost', [130] = 'eff_choke', [131] = 'eff_rasp',
    [132] = 'eff_shock', [133] = 'eff_drown', [134] = 'eff_dia', [135] = 'eff_bio', [146] = 'eff_accuracy_down',
    [147] = 'eff_attack_down', [148] = 'eff_evasion_down', [149] = 'eff_defense_down', [156] = 'eff_flash',
    [167] = 'eff_magic_def_down', [168] = 'eff_inhibit_tp', [174] = 'eff_magic_acc_down',
    [175] = 'eff_magic_atk_down', [192] = 'eff_requiem', [194] = 'eff_elegy', [217] = 'eff_threnody',
};

local data     = nil;          -- data\effects.lua, loaded the first time it's needed.
local mobs     = {};           -- [server id] = { list = { entry, ... }, seen, version }
local count    = 0;            -- How many monsters are in mobs.
local breaks   = {};           -- [server id] = true while it has a sleep, Bind or Stoneskin, so a hit on it matters.
local queue    = {};           -- Reused rows of what came in since the last frame, oldest first.
local queued   = 0;
local rows     = {};           -- Reused rows for one action packet's results.
local next_end = math.huge;    -- The soonest any effect runs out.
local versions = 0;            -- Counts every change, so each one gets a number never used before.
local ranks    = {};           -- Your merit ranks by key, like dia_iii, from the merit list sent when you zone.
local names    = {};           -- The game's own names, by effect id, once read.
local about    = {};           -- The game's own descriptions, by effect id, once read.
local keep_duration;

local function load_data()
    data = data or require('data.effects');
    return data;
end

-- Notes one thing for the next frame, in a reused row. A full queue is taken in first.
local function note(kind, target, effect, actor, mine, source, action, at)
    if (queued >= MAX_QUEUED) then
        effects.take_in(at);
    end
    queued = queued + 1;
    local row = queue[queued] or {};
    queue[queued] = row;
    row.kind, row.target, row.effect, row.actor, row.mine = kind, target, effect, actor, mine;
    row.source, row.action, row.at = source, action, at;
    row.duration_kept = false;
    if (mine) then keep_duration(row); end
end

--[[
    An action packet. A monster's round on a player, the most common one in a fight, stops after two reads, and so
    does every start. Results on players are stepped over without reading them. `me` is your server id.
]]
function effects.on_action(e, me)
    local category = packets.action_category(e);
    if (not WANTED[category]) then
        return;
    end
    if ((category == MELEE or category == RANGED) and packets.action_target(e) < FIRST_MONSTER_ID) then
        return;
    end
    local actor, action = packets.action_head(e);
    local n = packets.action_results(e, rows, FIRST_MONSTER_ID);
    if (n == 0) then
        return;
    end
    local now, mine = os.clock(), actor == me;
    local source = SOURCES[category];
    if (category == SKILL) then
        source = ABILITY_MESSAGES[rows[1].message] and 'abilities' or 'skills';
    end
    for i = 1, n do
        local row = rows[i];
        local target, message, param = row.target, row.message, row.param;
        local landed = LANDED[message];
        if (landed ~= nil and param > 0 and param <= LAST_EFFECT_ID) then
            -- An avatar's Nightmare puts Sleep on with a "gains" message, so a debuff word wins.
            if (landed == 'buff' and effects.WORDS[param] ~= nil) then
                landed = 'on';
            end
            note(landed, target, param, actor, mine, source, action, now);
        elseif (message == USES and category == MOB_SKILL and target == actor and param > 0 and param <= LAST_EFFECT_ID) then
            note('uses', target, param, actor, mine, source, action, now);
        elseif (TAKEN_OFF[message]) then
            note('off', target, param, actor, mine, nil, nil, now);
        elseif (DAMAGE[message] and (category == SPELL or (param > 0 and (breaks[target] or queued > 0)))) then
            note('hit', target, param, actor, mine, source, action, now);
        end
        local added, value = row.added, row.added_param;
        if (PROC_LANDED[added] and value > 0 and value <= LAST_EFFECT_ID) then
            note('on', target, value, actor, mine, 'procs', category, now);
        elseif (TAKEN_OFF[added]) then
            note('off', target, value, actor, mine, nil, nil, now);
        elseif (DAMAGE[added] and value > 0 and (breaks[target] or queued > 0)) then
            note('hit', target, value, actor, mine, nil, nil, now);
        end
    end
end

-- A battle message checkmate already read. Your own effect wore off a monster, or a monster died.
function effects.on_message(actor, target, param, message, me)
    if (target < FIRST_MONSTER_ID or (mobs[target] == nil and queued == 0)) then
        return;
    end
    if (WEARS_OFF[message] and actor == me) then
        note('off', target, param, actor, true, nil, nil, os.clock());
    elseif (DIED[message]) then
        note('died', target, nil, nil, false, nil, nil, os.clock());
    end
end

--[[
    An entity update. A monster or pet with something on it that left your sight, by dying and fading, going more
    than 50 yalms from you or despawning, forgets it all, so one that comes back with the same server id after it
    respawns starts clean. With nothing on any monster it reads nothing.
]]
function effects.on_entity(e)
    if (count == 0 and queued == 0) then
        return;
    end
    local id = packets.despawned(e);
    if (id ~= nil and id >= FIRST_MONSTER_ID and (mobs[id] ~= nil or queued > 0)) then
        note('died', id, nil, nil, false, nil, nil, os.clock());
    end
end

-- You zoned. Everything before it goes, in order with whatever came in before it.
function effects.on_zone()
    ranks = {};
    if (count > 0 or queued > 0) then note('zone', 0, nil, nil, false, nil, nil, os.clock()); end
end

-- The merit list. Notes your ranks of the merits that make your own effects last longer.
function effects.on_merits(e)
    if (type(e.data) ~= 'string' or #e.data < 8) then return; end
    local d = load_data();
    for key, merit in pairs(d.merits) do
        local rank = packets.merit_count(e, merit.id);
        if (rank ~= nil) then ranks[key] = math.min(rank, merit.most); end
    end
end

-- The monster with this server id, made the first time something lands on it. Past MAX_MONSTERS, the one heard
-- about longest ago goes.
local function monster(id, at)
    local mob = mobs[id];
    if (mob == nil) then
        if (count >= MAX_MONSTERS) then
            local oldest, when = nil, math.huge;
            for other, each in pairs(mobs) do
                if (each.seen < when) then
                    oldest, when = other, each.seen;
                end
            end
            mobs[oldest], breaks[oldest], count = nil, nil, count - 1;
        end
        mob = { list = {}, seen = versions, version = 0 };
        mobs[id], count = mob, count + 1;
    end
    mob.seen = versions;
    return mob;
end

-- The entry for `effect` on `mob`, and its place in the list, or nil.
local function find(mob, effect)
    for index, entry in ipairs(mob.list) do
        if (entry.effect == effect) then
            return entry, index;
        end
    end
    return nil;
end

-- Something on `mob` changed. It gets a new version, and whether a hit on it matters is worked out again.
local function changed(id, mob)
    versions = versions + 1;
    mob.version = versions;
    local fragile = nil;
    for _, entry in ipairs(mob.list) do
        if (SLEEPS[entry.effect] or entry.effect == BIND or entry.effect == STONESKIN) then
            fragile = true;
        end
    end
    breaks[id] = fragile;
end

-- Without Stoneskin, the next damage-over-time tick wakes ordinary Sleep within three seconds.
local function wake_on_tick(mob, at)
    local sleep = find(mob, SLEEP);
    if (sleep == nil or sleep.deep or sleep.ends <= at) then return; end
    local skin = find(mob, STONESKIN);
    if (skin ~= nil and skin.ends > at) then return; end
    for _, entry in ipairs(mob.list) do
        if (TICKS[entry.effect] and entry.ends > at) then
            sleep.ends = math.min(sleep.ends, at + TICK_SECONDS);
            next_end = math.min(next_end, sleep.ends);
            return;
        end
    end
end

-- Takes `effect` off the monster with this id. A sleep takes every sleep with it. True when it had it.
local function remove(id, mob, effect, at)
    local gone = false;
    for index = #mob.list, 1, -1 do
        local each = mob.list[index].effect;
        if (each == effect or (SLEEPS[effect] and SLEEPS[each])) then
            table.remove(mob.list, index);
            gone = true;
        end
    end
    if (gone) then
        if (effect == STONESKIN) then wake_on_tick(mob, at); end
        changed(id, mob);
    end
    return gone;
end

-- Your added effect's item: your ammo for a shot, your main weapon for a swing, or your off-hand when the main has
-- no added effect of its own.
local function proc_item(d, category, effect)
    if (category == RANGED) then
        return player.equipped(player.SLOT_AMMO);
    end
    local main = player.equipped(player.SLOT_MAIN);
    if (main ~= nil and d.procs[main] ~= nil and (d.proc_effects == nil or d.proc_effects[main] == effect)) then
        return main;
    end
    return player.equipped(player.SLOT_SUB);
end

-- What the gear you have on adds, from one of data\effects.lua's gear lists.
local function gear_bonus(list, slots)
    local total = 0;
    for _, slot in ipairs(slots) do
        local item = player.equipped(slot);
        total = total + ((item and list[item]) or 0);
    end
    return total;
end

-- How long an effect usually lasts on Phoenix, or nil when no row says.
local function usual(d, effect)
    local info = d.effects[effect];
    return info and info.usual;
end

--[[
    The row in data\effects.lua for the action that put this effect on, or nil when there's none naming that
    effect. A pet's move can come in under a pet skill id rather than a TP move id, so a TP move row that doesn't
    fit is tried as a pet's.
]]
local function matching(info, effect)
    if (info == nil) then return nil; end
    local row = info.by_effect and info.by_effect[effect];
    if (row ~= nil) then return row; end
    if (info.effect == effect or (SLEEPS[info.effect] and SLEEPS[effect])) then return info; end
    return nil;
end

local function source_row(d, row)
    local list = row.source and d[row.source];
    local info = matching(list and list[row.action], row.effect);
    if (info == nil and row.source == 'skills') then
        info = matching(d.pacts[row.action], row.effect);
    end
    return info;
end

--[[
    How long an effect that just landed lasts, in seconds, or nil when checkmate doesn't know, and true when its
    length is random. Yours count your merits, your song instrument and Troubadour, your Shadowbind gear and your
    added effect's item. Everyone else's are the usual length, and a merit spell counts at its most ranks. An added
    effect from someone else lasts as long as that added effect does on most items. A random length is at its top
    either way.
]]
local function seconds_for(d, row, info)
    if (row.source == 'procs') then
        local item = row.mine and proc_item(d, row.action, row.effect) or nil;
        if (item ~= nil and d.proc_effects ~= nil and d.proc_effects[item] ~= row.effect) then item = nil; end
        return (item and d.procs[item]) or d.proc_usual[row.effect] or usual(d, row.effect), false,
            item and 'equipment' or 'usual';
    end
    if (info == nil or (info.seconds == nil and info.top == nil and info.merit == nil)) then
        return usual(d, row.effect), false, 'usual';
    end
    local seconds = info.top or info.seconds;
    if (info.merit ~= nil) then
        local merit = d.merits[info.merit];
        seconds = merit.base + merit.per_rank * ((row.mine and ranks[info.merit]) or merit.most);
    end
    if (row.mine and info.song ~= nil) then
        local bonus = gear_bonus(d.gear[info.song], player.SONG_SLOTS) + gear_bonus(d.gear.songs, player.SONG_SLOTS);
        seconds = seconds * (1 + bonus / 10);
        if (player.has_buff(d.troubadour)) then
            seconds = seconds * 2;
        end
    end
    if (row.mine and info.gear ~= nil) then
        seconds = seconds + gear_bonus(d.gear[info.gear], player.ALL_SLOTS);
    end
    local basis = info.top ~= nil and 'random_maximum' or 'source_duration';
    if (info.merit ~= nil and (not row.mine or ranks[info.merit] == nil)) then
        basis = 'merit_unknown';
    elseif (row.mine and (info.song ~= nil or info.gear ~= nil)) then
        basis = 'equipment';
    end
    return math.floor(seconds), info.top ~= nil, basis;
end

-- Gear and buffs may change before the next frame. Keep only the duration, not another gear table.
keep_duration = function (row)
    local kind = row.kind;
    if (kind ~= 'on' and kind ~= 'buff' and kind ~= 'uses'
        and not (kind == 'hit' and row.source == 'spells')) then return; end
    local d = load_data();
    local info;
    if (kind == 'hit') then
        info = d.spells[row.action];
        if (info == nil or info.tier == nil) then return; end
    else
        info = source_row(d, row);
    end
    row.seconds, row.random, row.basis = seconds_for(d, row, info);
    row.duration_kept = true;
end;

--[[
    Puts an effect that just landed on its monster, or starts its time again, after taking off what it replaces.
    `info` is its row in data\effects.lua, or nil. A row's kind says whether it's a debuff ('on') or one of the
    monster's own buffs ('buff' or 'uses').
]]
local function land(d, row, info, tier)
    local id, effect = row.target, SLEEPS[row.effect] and SLEEP or row.effect;
    local mob = monster(id, row.at);
    local about_it = d.effects[effect];
    for _, other in ipairs(about_it and about_it.drops or NONE) do
        remove(id, mob, other, row.at);
    end
    local entry = find(mob, effect);
    if (entry == nil) then
        if (#mob.list >= MAX_EFFECTS) then
            local oldest = 1;
            for i = 2, #mob.list do
                if (mob.list[i].landed < mob.list[oldest].landed) then oldest = i; end
            end
            table.remove(mob.list, oldest);
        end
        entry = { effect = effect };
        mob.list[#mob.list + 1] = entry;
    end
    local seconds, random, basis;
    if (row.duration_kept) then
        seconds, random, basis = row.seconds, row.random, row.basis;
    else
        seconds, random, basis = seconds_for(d, row, info);
    end
    entry.mine, entry.from, entry.tier, entry.landed = row.mine, row.actor, tier, row.at;
    entry.debuff, entry.deep = row.kind == 'on', info ~= nil and info.deep == true;
    entry.timed, entry.random = seconds ~= nil, random;
    entry.basis = seconds ~= nil and basis or 'unknown';
    entry.ends = row.at + (seconds or UNTIMED_SECONDS);
    next_end = math.min(next_end, entry.ends);
    wake_on_tick(mob, row.at);
    changed(id, mob);
end

-- Dia or Bio landed, as damage. It only goes on over a weaker one, and then takes the other off. One the same
-- tier or weaker changes nothing, not even the time.
local function dia_bio(d, row)
    local spell = d.spells[row.action];
    if (spell == nil or spell.tier == nil) then
        return;
    end
    local mob = mobs[row.target];
    local held = mob and (find(mob, DIA) or find(mob, BIO));
    if (held ~= nil and (held.tier or 0) >= spell.tier) then
        return;
    end
    if (mob ~= nil) then
        remove(row.target, mob, (spell.effect == DIA) and BIO or DIA, row.at);
    end
    row.kind, row.effect = 'on', spell.effect;
    land(d, row, spell, spell.tier);
end

-- Works out one thing that came in.
local function take(d, row)
    local kind, id = row.kind, row.target;
    local mob = mobs[id];
    if (kind == 'zone') then
        mobs, breaks, count, next_end = {}, {}, 0, math.huge;
    elseif (kind == 'died') then
        if (mob ~= nil) then
            mobs[id], breaks[id], count = nil, nil, count - 1;
        end
    elseif (kind == 'on' or kind == 'buff') then
        land(d, row, source_row(d, row));
    elseif (kind == 'uses') then
        -- A two-hour on itself only lands when its move is known to put that effect on.
        local info = source_row(d, row);
        if (info ~= nil) then
            land(d, row, info);
        end
    elseif (kind == 'off') then
        if (mob ~= nil) then
            remove(id, mob, row.effect, row.at);
        end
    elseif (kind == 'hit') then
        -- A hit's row holds its damage where an effect would go. Dia and Bio write their effect over it.
        local damage = row.effect;
        if (row.source == 'spells') then
            dia_bio(d, row);
        end
        mob = mobs[id];
        if (mob ~= nil and damage > 0) then
            remove(id, mob, SLEEP, row.at);
            remove(id, mob, BIND, row.at);
            remove(id, mob, STONESKIN, row.at);
        end
    end
end

-- Takes out every effect whose time ran out, and finds the next one to run out.
local function sweep(now)
    local soonest = math.huge;
    for id, mob in pairs(mobs) do
        local skin = find(mob, STONESKIN);
        if (skin ~= nil and skin.ends <= now) then wake_on_tick(mob, skin.ends); end
        local gone = false;
        for index = #mob.list, 1, -1 do
            local entry = mob.list[index];
            if (entry.ends <= now) then
                table.remove(mob.list, index);
                gone = true;
            else
                soonest = math.min(soonest, entry.ends);
            end
        end
        if (gone) then
            changed(id, mob);
        end
    end
    next_end = soonest;
end

-- Takes in everything noted since the last frame, oldest first, then takes out what ran out. A quiet frame stops
-- after two comparisons.
function effects.take_in(now)
    if (queued > 0) then
        local d = data;
        local n = queued;
        queued = 0;
        for i = 1, n do
            local row = queue[i];
            if (row.at >= next_end) then sweep(row.at); end
            if (row.kind == 'on' or row.kind == 'buff' or row.kind == 'uses'
                or (row.kind == 'hit' and row.source == 'spells')) then
                d = d or load_data();
            end
            take(d, row);
        end
    end
    if (now >= next_end) then
        sweep(now);
    end
end

-- Effects in the order they print: debuffs first, then buffs, each soonest to run out first.
local function in_order(a, b)
    if (a.debuff ~= b.debuff) then
        return a.debuff;
    end
    if (a.sort_end ~= b.sort_end) then
        return a.sort_end < b.sort_end;
    end
    return a.effect < b.effect;
end

-- The game's own name for an effect checkmate has no word for, with each word capitalized, or "Effect 999".
function effects.game_name(id)
    if (names[id] == nil) then
        local ok, text = pcall(function () return AshitaCore:GetResourceManager():GetString('buffs.names', id); end);
        local name = require('core.printout').clean_text(ok and text or ''):match('^%s*(.-)%s*$');
        name = name:gsub('^%l', string.upper):gsub(' %l', string.upper);
        names[id] = (name ~= '') and name or ('Effect %d'):format(id);
    end
    return names[id];
end

-- What's on one monster, for effects.readout below, which runs it inside its guard.
local function read_out(id, show, now, still)
    local mob = mobs[id];
    if (mob == nil) then
        return nil;
    end
    local out = {};
    for _, entry in ipairs(mob.list) do
        local wanted = show == 'both' or ((show == 'debuffs') == entry.debuff);
        if (wanted and entry.ends > now) then
            local word = effects.WORDS[entry.effect];
            local each = { effect = entry.effect, word = word, name = (word == nil) and effects.game_name(entry.effect)
                or nil, ends = entry.timed and entry.ends or nil, mine = entry.mine, from = entry.from,
                debuff = entry.debuff, random = entry.random, own = entry.from == id, basis = entry.basis,
                sort_end = entry.timed and entry.ends or math.huge };
            if (still and each.ends ~= nil) then
                each.left = math.ceil(each.ends - now);
            end
            out[#out + 1] = each;
        end
    end
    if (#out == 0) then
        return nil;
    end
    table.sort(out, in_order);
    for _, entry in ipairs(out) do entry.sort_end = nil; end
    return out;
end

--[[
    What's on the monster with this server id that `show` lets through ('both', 'debuffs' or 'buffs'), in order,
    as new tables, or nil for nothing. Each is { effect, word, name, ends, mine, from, debuff, random, own }, where
    `word` is checkmate's word key, or `name` the game's own name when there's none, and `ends` is nil when its
    length isn't known. With `still` set, each also gets `left`, its whole seconds left now, for a chat line that
    has to say the same thing each time it prints. This only runs when something changed, never on a steady frame.
    A mistake in it stops effects through effects.broke and gives nil, so it never stops a /check or the overlay.
]]
function effects.readout(id, show, now, still)
    local ok, out = pcall(read_out, id, show, now, still);
    if (not ok) then
        effects.broke(out);
        return nil;
    end
    return out;
end

-- True when checkmate has an effect on the monster with this server id.
function effects.has(id)
    local mob = mobs[id];
    return mob ~= nil and #mob.list > 0;
end

-- A number that changes every time what's on that monster changes, 0 when there's nothing.
function effects.version(id)
    local mob = mobs[id];
    return mob and mob.version or 0;
end

-- Every effect some row in data\effects.lua can put on a monster, but Sleep II and Lullaby, which are drawn with
-- Sleep's picture, for the icons module's look-alike check. It's a list the data file already holds.
local function pictured_ids()
    return load_data().pictured;
end
function effects.ids()
    local ok, ids = pcall(pictured_ids);
    if (not ok) then effects.broke(ids); return NONE; end
    return ids;
end

-- The game's own description of an effect, once read, or nil. Only a tip asks.
function effects.description(id)
    if (about[id] == nil) then
        local ok, text = pcall(function ()
            local entry = AshitaCore:GetResourceManager():GetStatusIconByIndex(id);
            return entry and entry.Description and entry.Description[1];
        end);
        about[id] = require('core.printout').clean_text(ok and text or ''):match('^%s*(.-)%s*$');
    end
    return (about[id] ~= '') and about[id] or nil;
end

-- Forgets everything, for turning the part off or after an error. The merit ranks stay, since they only come
-- when you zone.
function effects.forget(reset_merits)
    if (reset_merits) then ranks = {}; end
    data = nil;
    mobs, breaks, queue, queued, count, next_end = {}, {}, {}, 0, 0, math.huge;
end

return effects;
