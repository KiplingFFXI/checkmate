--[[
    Tracks effects seen landing on nearby monsters, and estimates from supported actions.
    The client gets no complete monster buff list.
    Timers use Phoenix durations and, for your own effects, the gear and merits we can read.
    Other players' gear, resists and hidden powers can change the actual duration.

    Removal messages, damage, death, despawn, distance and zoning clear observations where known.
    Packet handlers queue changes for the next frame. Tracking runs while a display or combat
    calculation needs it and sends no requests.
]]

local packets  = require('core.packets');
local player   = require('core.player');
local merits   = require('core.merits');

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
local SOURCES = { [SPELL] = 'spells', [5] = 'items', [ABILITY] = 'abilities', [MOB_SKILL] = 'skills',
    [PET_SKILL] = 'pacts' };

--[[
    Result messages that say an effect landed, with the effect's id in the result's number, and what it is. The
    "gains the effect of" ones are 'buff', a monster's own buff, and the rest 'on', a debuff. 266, 267, 277 and 278
    are what the second and later targets of an area action get.
]]
local LANDED = { [127] = 'on', [186] = 'buff', [230] = 'buff', [236] = 'on', [237] = 'on', [242] = 'on',
    [243] = 'on', [266] = 'buff', [267] = 'on', [268] = 'on', [271] = 'on', [277] = 'on', [278] = 'on',
    [319] = 'buff', [320] = 'on', [329] = 'on', [330] = 'on', [331] = 'on', [332] = 'on',
    [333] = 'on', [334] = 'on', [335] = 'on', [375] = 'on' };

-- The landed messages only a job ability gives. A SKILL action whose first result has one is an ability.
local ABILITY_MESSAGES = { [110] = true, [127] = true, [277] = true, [317] = true, [319] = true, [320] = true };

-- "<monster> uses <two-hour>." On itself, its number is the effect, when the move puts one on at all.
local USES = 101;

-- "Additional effect: <status>." from a weapon, ammo or a pet's attack.
local PROC_LANDED = { [160] = true, [164] = true };

-- Messages that say an effect was taken off, with its id in the number: -na spells and the like, Dispel and
-- Finale, a TP move or added effect that dispels, Dark Shot, and an item.
local TAKEN_OFF = { [83] = true, [123] = true, [159] = true, [168] = true, [321] = true, [341] = true,
    [343] = true, [378] = true, [453] = true };

-- Damage from a hit, a spell, an ability, a TP move, a shot or an added effect. Any of it over 0 wakes a monster,
-- most likely breaks its Bind and gets through its Stoneskin.
local DAMAGE = { [1] = true, [2] = true, [67] = true, [110] = true, [161] = true, [163] = true, [185] = true,
    [187] = true, [227] = true, [229] = true, [252] = true, [264] = true, [274] = true, [281] = true,
    [317] = true, [352] = true, [353] = true, [379] = true, [576] = true, [577] = true, [747] = true };

-- 0x029 also carries your effect wearing off a monster and a monster dying.
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
local names    = {};           -- The game's own names, by effect id, once read.
local about    = {};           -- The game's own descriptions, by effect id, once read.
local keep_duration;
local pet_owners, owner_count = {}, 0;
local pet_flags, flag_count = {}, 0;
local observed_merits = {};
local armed, armed_count = {}, 0;
local PREREQUISITE_MERITS = {
    penance = { id = 0x0846, job = 2, level = 75, most = 3 },
    tomahawk = { id = 0x0802, job = 1, level = 75, most = 3 },
};

local function load_data()
    data = data or require('data.effects');
    return data;
end

-- Every visible player carries their pet's target index, including players outside your party.
local function pet_owner(actor, index)
    local me = GetPlayerEntity();
    if (me ~= nil and me.PetTargetIndex == index) then return me.ServerId; end
    if (pet_flags[actor] ~= nil) then return pet_flags[actor] and true or nil; end
    local held = pet_owners[actor];
    if (held ~= nil) then
        local owner = GetEntity(held.index);
        if (owner ~= nil and owner.ServerId == held.id and owner.PetTargetIndex == index) then return held.id; end
        pet_owners[actor], owner_count = nil, owner_count - 1;
    end
    for at = 0x400, 0x6FF do
        local owner = GetEntity(at);
        if (owner ~= nil and owner.ServerId > 0 and owner.ServerId < FIRST_MONSTER_ID
            and owner.PetTargetIndex == index) then
            if (owner_count >= MAX_MONSTERS) then pet_owners, owner_count = {}, 0; end
            pet_owners[actor], owner_count = { index = at, id = owner.ServerId }, owner_count + 1;
            return owner.ServerId;
        end
    end
    return nil;
end

-- Dynamic monsters share the pet ID range. Ownership must be checked before choosing a pet handler.
local function action_source(category, actor, action, message)
    if (category == SKILL and actor < FIRST_MONSTER_ID) then
        return ABILITY_MESSAGES[message] and 'abilities' or 'weaponskills';
    end
    if (category == SKILL or category == MOB_SKILL) then
        local index = bit.band(actor, 0xFFF);
        local dynamic = index >= 0x800;
        if (dynamic) then index = index - 0x100; end
        local entity = actor >= FIRST_MONSTER_ID and GetEntity(index) or nil;
        if (entity ~= nil and entity.ServerId == actor and pet_owner(actor, index) ~= nil) then
            local d = load_data();
            if (dynamic and d.automatons and d.automatons[action]) then return 'automatons'; end
            if (dynamic and d.pet_moves and d.pet_moves[action]) then return 'pet_moves'; end
            if (d.charmed_skills and d.charmed_skills[action]) then return 'charmed_skills'; end
            return 'skills';
        end
        if (dynamic) then
            return entity ~= nil and entity.ServerId == actor and bit.band(entity.SpawnFlags or 0, 0x10) ~= 0
                and 'skills' or nil;
        end
        return 'skills';
    end
    return SOURCES[category];
end

local function own_buff(effect)
    if (GetPlayerEntity() == nil) then return nil; end
    local buffs = AshitaCore:GetMemoryManager():GetPlayer():GetBuffs();
    if (buffs == nil) then return nil; end
    for index = 0, 32 do if (buffs[index] == effect) then return true; end end
    return false;
end

local function actual_merit(key)
    local rule = PREREQUISITE_MERITS[key];
    if (rule == nil or GetPlayerEntity() == nil) then return nil; end
    local stats = AshitaCore:GetMemoryManager():GetPlayer();
    local job, level = stats:GetMainJob(), stats:GetMainJobLevel();
    if (type(job) ~= 'number' or job <= 0 or type(level) ~= 'number' or level <= 0) then return nil; end
    if (job ~= rule.job or level < rule.level) then return 0; end
    return observed_merits[key];
end

local function allowed_estimate(info, mine, actor)
    if (mine and info.requires_effect ~= nil and own_buff(info.requires_effect) == false) then return false; end
    if (mine and info.requires_merit ~= nil and actual_merit(info.requires_merit) == 0) then return false; end
    if (info.requires_owner_effect ~= nil and actor >= FIRST_MONSTER_ID) then
        local me = GetPlayerEntity();
        local pet = me ~= nil and me.PetTargetIndex ~= nil and me.PetTargetIndex > 0
            and GetEntity(me.PetTargetIndex) or nil;
        if (pet ~= nil and pet.ServerId == actor and own_buff(info.requires_owner_effect) == false) then return false; end
    end
    return true;
end

local function estimate_result(info, row)
    if (info.infer == 'damage') then return DAMAGE[row.message] and row.param > 0; end
    if (info.infer == 'success') then
        for _, message in ipairs(info.success_messages or NONE) do
            if (row.message == message) then return true; end
        end
    end
    return false;
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
    row.reported = false;
    if (mine) then keep_duration(row); end
    return row;
end

local function arm(actor, effect, seconds, now)
    if (armed[actor] == nil) then
        if (armed_count >= MAX_MONSTERS) then
            local oldest, first = nil, math.huge;
            for id, held in pairs(armed) do
                if (held.ends < first) then oldest, first = id, held.ends; end
            end
            armed[oldest], armed_count = nil, armed_count - 1;
        end
        armed_count = armed_count + 1;
    end
    armed[actor] = { effect = effect, ends = now + seconds, consumed = false };
end

local function melee_reactive(d, actor, mine, now)
    local held = armed[actor];
    if (mine) then
        for effect, info in pairs(d.reactive or NONE) do
            local present = own_buff(effect);
            if (present == false and held ~= nil and held.effect == effect
                and not (held.grace and held.ends > now)) then
                armed[actor], armed_count, held = nil, armed_count - 1, nil;
            elseif (present == true and held == nil) then
                arm(actor, effect, info.arm_seconds, now);
                held = armed[actor];
            end
        end
    end
    if (held == nil or held.consumed or held.ends <= now) then return nil; end
    return held, d.reactive and d.reactive[held.effect];
end

-- Action starts carry no results. Completed attacks can also carry a reaction against the attacker.
function effects.on_action(e, me)
    local category = packets.action_category(e);
    if (not WANTED[category]) then
        return;
    end
    local actor, action = packets.action_head(e);
    local n = packets.action_results(e, rows, category == ABILITY and 0 or FIRST_MONSTER_ID, true);
    if (n == 0) then
        return;
    end
    local now, mine = os.clock(), actor == me;
    local source = action_source(category, actor, action, rows[1].message);
    local d = data;
    for i = 1, n do
        local row = rows[i];
        local target, message, param = row.target, row.message, row.param;
        if (category == ABILITY and actor < FIRST_MONSTER_ID and target == actor and LANDED[message]) then
            d = d or load_data();
            local reactive = d.reactive and d.reactive[param];
            if (reactive ~= nil and reactive.arm_seconds ~= nil) then arm(actor, param, reactive.arm_seconds, now); end
        end
        if (category == ABILITY and actor < FIRST_MONSTER_ID and target == actor) then
            d = d or load_data();
            for effect, info in pairs(d.reactive or NONE) do
                if (info.arm_ability == action) then
                    for _, success in ipairs(info.arm_messages or NONE) do
                        if (message == success) then arm(actor, effect, info.arm_seconds, now); break; end
                    end
                end
            end
        end
        if (actor >= FIRST_MONSTER_ID and (row.reaction == 44 or row.reaction == 132)
            and row.reaction_param > 0 and (breaks[actor] or queued > 0)) then
            note('hit', actor, row.reaction_param, target, target == me, nil, nil, now);
        end
        if (target >= FIRST_MONSTER_ID) then
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
    -- Reactions and armed melee effects apply to their own recipients after explicit results.
    for i = 1, n do
        local row = rows[i];
        if (actor >= FIRST_MONSTER_ID and (row.reaction == 44 or row.reaction == 132
            or row.reaction == 383 or row.reaction == 374)) then
            d = d or load_data();
            local info = d.spikes and d.spikes[row.reaction_kind];
            if (info ~= nil and info.infer == 'reaction'
                and (row.reaction ~= 374 or row.reaction_param == info.effect)) then
                note('estimate', actor, info.effect, row.target, row.target == me, 'spikes', row.reaction_kind, now);
            end
        end
    end
    if (category == MELEE and actor < FIRST_MONSTER_ID) then
        d = d or load_data();
        local held, info = melee_reactive(d, actor, mine, now);
        if (info ~= nil and info.infer == 'melee') then
            for i = 1, n do
                local row = rows[i];
                if (row.target >= FIRST_MONSTER_ID and (row.message == 1 or row.message == 67
                    or row.message == 352 or row.message == 353)) then
                    note('estimate', row.target, info.effect, actor, mine, 'reactive', held.effect, now);
                    if (info.consume) then held.consumed = true; break; end
                end
            end
        end
    end
    local list = source and (d or load_data())[source];
    local action_info = list and list[action];
    if (action_info == nil) then return; end
    -- Queue estimates last, so an explicit result from this action always wins.
    for i = 1, n do
        local row = rows[i];
        if (row.target >= FIRST_MONSTER_ID) then
            if (action_info.by_effect ~= nil) then
                for effect, info in pairs(action_info.by_effect) do
                    if (estimate_result(info, row) and allowed_estimate(info, mine, actor)) then
                        note('estimate', row.target, effect, actor, mine, source, action, now);
                    end
                end
            elseif (action_info.effect ~= nil and estimate_result(action_info, row)
                and allowed_estimate(action_info, mine, actor)) then
                note('estimate', row.target, action_info.effect, actor, mine, source, action, now);
            end
        end
    end
end

-- Standalone status reports, your own wear-off messages, and monster deaths.
function effects.on_message(actor, target, param, message, me)
    local held = armed[target];
    if (target < FIRST_MONSTER_ID and WEARS_OFF[message] and param == 343) then
        local d = load_data();
        if (d.reactive and d.reactive[param] and not (held and held.consumed)) then
            -- Feint wears off before the server sends the swing that consumed it.
            arm(target, param, 0.5, os.clock());
            armed[target].grace = true;
        end
    elseif (held ~= nil and (DIED[message] or (WEARS_OFF[message] and param == held.effect))) then
        armed[target], armed_count = nil, armed_count - 1;
    end
    if (message == 203 and target >= FIRST_MONSTER_ID and param > 0 and param <= LAST_EFFECT_ID) then
        local d = load_data();
        local info = d.effects[param];
        local kind = ((info and info.debuff) or effects.WORDS[param]) and 'on' or 'buff';
        local now = os.clock();
        local row = note(kind, target, param, actor, actor == me, nil, nil, now);
        row.seconds, row.random, row.basis = nil, false, 'unknown';
        row.duration_kept, row.reported = true, true;
        return;
    end
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
    respawns starts clean. The same updates identify pets owned by other players.
]]
function effects.on_entity(e)
    local actor, owned = packets.player_pet(e);
    if (actor ~= nil) then
        if (pet_flags[actor] == nil) then
            if (flag_count >= 256) then pet_flags, flag_count = {}, 0; end
            flag_count = flag_count + 1;
        end
        pet_flags[actor] = owned;
    end
    local id = packets.despawned(e);
    if (id ~= nil) then
        if (pet_flags[id] ~= nil) then pet_flags[id], flag_count = nil, flag_count - 1; end
        if (pet_owners[id] ~= nil) then pet_owners[id], owner_count = nil, owner_count - 1; end
    end
    if (count == 0 and queued == 0) then
        return;
    end
    if (id ~= nil and id >= FIRST_MONSTER_ID and (mobs[id] ~= nil or queued > 0)) then
        note('died', id, nil, nil, false, nil, nil, os.clock());
    end
end

-- You zoned. Everything before it goes, in order with whatever came in before it.
function effects.on_zone()
    pet_owners, owner_count, observed_merits, armed, armed_count = {}, 0, {}, {}, 0;
    pet_flags, flag_count = {}, 0;
    if (count > 0 or queued > 0) then note('zone', 0, nil, nil, false, nil, nil, os.clock()); end
end

-- Merit packets do not need the duration data.
function effects.observe_merits(e)
    for key, rule in pairs(PREREQUISITE_MERITS) do
        local rank = packets.merit_count(e, rule.id);
        if (rank ~= nil and rank >= 0 and rank <= rule.most) then observed_merits[key] = rank; end
    end
end

function effects.on_merits(e)
    effects.observe_merits(e);
    return merits.on_packet(e);
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
    if (skin ~= nil and not skin.inferred and skin.ends > at) then return; end
    for _, entry in ipairs(mob.list) do
        if (TICKS[entry.effect] and not entry.inferred and entry.ends > at) then
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

-- The source row must name this effect, including a child of a multi-effect action.
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
        return nil, false, 'unknown';
    end
    local seconds = info.top or info.seconds;
    local rank;
    if (row.mine and info.merit ~= nil) then
        if (PREREQUISITE_MERITS[info.merit] ~= nil) then rank = actual_merit(info.merit);
        else rank = merits.selected(info.merit); end
    end
    if (info.merit ~= nil) then
        local merit = d.merits[info.merit];
        seconds = merit.base + merit.per_rank * (rank or merit.most);
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
    local basis = info.default_tp ~= nil and 'tp_default' or info.top ~= nil and 'random_maximum' or 'source_duration';
    if (info.merit ~= nil and rank == nil) then
        basis = 'merit_unknown';
    elseif (row.mine and (info.song ~= nil or info.gear ~= nil)) then
        basis = 'equipment';
    end
    return math.floor(seconds), info.top ~= nil, basis;
end

-- Gear and buffs may change before the next frame. Keep only the duration, not another gear table.
keep_duration = function (row)
    local kind = row.kind;
    if (kind ~= 'on' and kind ~= 'buff' and kind ~= 'uses' and kind ~= 'estimate'
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
    local about_it = d.effects[effect];
    local mob = mobs[id];
    local inferred = row.kind == 'estimate';
    if (inferred and mob == nil and count >= MAX_MONSTERS) then
        -- Reuse an empty slot without displacing any active observation.
        for other, held in pairs(mobs) do
            if (#held.list == 0) then
                mobs[other], breaks[other], count = nil, nil, count - 1;
                break;
            end
        end
        if (count >= MAX_MONSTERS) then return; end
    end
    if (inferred and mob ~= nil) then
        -- A possible application cannot refresh or displace an existing observation.
        if (find(mob, effect) ~= nil) then return; end
        if (#mob.list >= MAX_EFFECTS) then return; end
        for _, other in ipairs(about_it and about_it.drops or NONE) do
            if (find(mob, SLEEPS[other] and SLEEP or other) ~= nil) then return; end
        end
    end
    mob = monster(id, row.at);
    for _, other in ipairs(about_it and about_it.drops or NONE) do
        if (not (SLEEPS[effect] and SLEEPS[other])) then remove(id, mob, other, row.at); end
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
    -- A following status message keeps the confirmed action's Sleep or Dia/Bio rules.
    local same_action = row.reported and not entry.inferred and entry.from == row.actor and entry.action_at ~= nil
        and row.at - entry.action_at <= 0.5;
    local deep = same_action and entry.deep or (info ~= nil and info.deep == true);
    tier = tier or (same_action and entry.tier or nil);
    entry.mine, entry.from, entry.tier, entry.landed = row.mine, row.actor, tier, row.at;
    entry.debuff = row.kind == 'on' or inferred or (about_it ~= nil and about_it.debuff == true);
    entry.deep, entry.inferred = deep, inferred;
    entry.default_tp = info and info.default_tp or nil;
    entry.condition = inferred and info and info.condition or nil;
    entry.action_at = same_action and entry.action_at or (not row.reported and row.source ~= nil and row.at or nil);
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
    if (held ~= nil and not held.inferred and (held.tier or 0) >= spell.tier) then
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
    elseif (kind == 'on' or kind == 'buff' or kind == 'estimate') then
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
            if (row.kind == 'on' or row.kind == 'buff' or row.kind == 'uses' or row.kind == 'estimate'
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
        local info = load_data().effects[id];
        if (info ~= nil and info.name ~= nil) then names[id] = info.name; return info.name; end
        local ok, text = pcall(function () return AshitaCore:GetResourceManager():GetString('buffs.names', id); end);
        local name = require('core.printout').clean_text(ok and text or ''):match('^%s*(.-)%s*$');
        name = name:gsub('^%l', string.upper):gsub(' %l', string.upper);
        names[id] = (name ~= '') and name or ('Effect %d'):format(id);
    end
    return names[id];
end

function effects.has_icon(id)
    local info = load_data().effects[id];
    return info == nil or info.icon ~= false;
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
                inferred = entry.inferred, default_tp = entry.default_tp, condition = entry.condition,
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
        local info = load_data().effects[id];
        if (info ~= nil and info.description ~= nil) then about[id] = info.description; return info.description; end
        local ok, text = pcall(function ()
            local entry = AshitaCore:GetResourceManager():GetStatusIconByIndex(id);
            return entry and entry.Description and entry.Description[1];
        end);
        about[id] = require('core.printout').clean_text(ok and text or ''):match('^%s*(.-)%s*$');
    end
    return (about[id] ~= '') and about[id] or nil;
end

-- Turning a display off keeps actual merits; a new character or zone clears them.
function effects.forget(clear_merits)
    data = nil;
    if (clear_merits) then observed_merits = {}; end
    pet_owners, owner_count, pet_flags, flag_count, armed, armed_count = {}, 0, {}, 0, {}, 0;
    mobs, breaks, queue, queued, count, next_end = {}, {}, {}, 0, 0, math.huge;
end

return effects;
