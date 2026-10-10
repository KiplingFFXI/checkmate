--[[
    Keeps the pet seen when your /check comes back. Avatars and spirits have no Pet readout.
    Jugs, wyverns and automatons use /checkparam <pet>. Charmed monsters use their own monster data.

    Pet levels are inferred from jobs, summon inputs and observed level changes. A jug's later rolls
    cannot exceed its original rolled level. A pet already out when the addon loads has unknown
    summon inputs, so its level range stays wide. README explains the sync and level-cap cases.
]]

local monsters = require('core.monsters');
local player   = require('core.player');
local pets     = require('data.pets');

local pet = {};

-- Job ids, for your main or support job.
local BST, DRG, SMN, PUP = 9, 14, 15, 18;

-- A jug pet is up to this many levels under its highest, less what gear like Monster Gloves takes off.
local MOST_BELOW = 2;

-- Beast Affinity only counts for BST main at this level or higher (merit.cpp GetMeritValue).
local AFFINITY_LEVEL = 75;

-- Seconds after checkmate sees your main level go up under a level sync or level cap that its buff going
-- still counts as it ending. The sync target leveling up moves you too, but always 30 seconds or more before
-- the buff goes, since a sync takes that long to wear off once it's called off (party.cpp SetSyncTarget).
local SYNC_END = 5;

-- The merit id of Beast Affinity in the merit list the server sends.
pet.AFFINITY_ID = pets.beast_affinity.id;

-- Your Beast Affinity merits from the last merit list, or nil before one came in.
local affinity = nil;

-- Your pet's entity index, with your main level and what your gear took off a jug pet's range when it
-- came out. `wyvern` starts at that level too and moves to your main level when a sync or level cap ending
-- sets a wyvern again. `sync` is your main and support level when checkmate first saw a level sync holding
-- you with this pet out, with the highest ones since in `top`, and nil while those don't count. `held` and
-- `last` are whether a sync or level cap held you and your main level the last time checkmate looked. `rose`
-- is when checkmate last saw your main level go up under one and your level before it, with `ended` set once
-- its buff went within SYNC_END seconds of that. came_out is nil with no pet, or before checkmate has seen one.
local came_out = nil;
local generation = 0;
local lost_index = nil;

-- The merit list counted your Beast Affinity merits.
function pet.on_affinity(count)
    affinity = count;
end

-- Zoning. The next zone's merit list says Beast Affinity again, and its pet update says when your pet
-- comes back.
function pet.forget()
    affinity, came_out, lost_index = nil, nil, nil;
    generation = generation + 1;
end

-- A returning pet at the same index no longer has known summon inputs.
function pet.on_disappear(index)
    if (came_out ~= nil and came_out.index == index) then
        came_out, lost_index = nil, index;
        generation = generation + 1;
    end
end

-- What the gear you have on takes off how far under its highest level a jug pet can be. Gear only counts at
-- its own level or higher, so Monster Gloves don't while a level sync holds you under 75.
local function range_cut(main_level)
    local cut = 0;
    for _, id in ipairs(player.equipped_items()) do
        local item = pets.jug_range_items[id];
        if (item ~= nil and main_level >= item.level) then
            cut = cut + item.cut;
        end
    end
    return math.min(cut, MOST_BELOW);
end

-- Watches for a level sync or level cap with your pet out, at each pet update and /check. A sync or level
-- cap starting or ending sets your pet again only when it moves your main level, and that picks a jug pet's
-- level again with the gear you have on then, so the gear from when it came out stops counting. A sync's
-- level moving under you never sets it again. Under a level sync, your levels when checkmate first sees it
-- stand in for your levels now, and they still count after a sync that ends without moving you.
local function watch(index, main_level, sub_level, observed, main)
    local synced, capped = player.synced();
    -- Your pet at entity index `index` just came out, or checkmate is seeing it for the first time.
    if (came_out == nil or came_out.index ~= index) then
        generation = generation + 1;
        local cut = observed and range_cut(main_level) or 0;
        came_out = { index = index, wyvern = main_level,
            cut = cut, affinity = observed and affinity or nil, unknown = not observed,
            spawn = { level = main_level, main = main, cut = cut, affinity = observed and affinity or nil,
                known = observed == true, held = not observed and (synced or capped) } };
    end
    local held, last, now = synced or capped, came_out.last or main_level, os.clock();
    if (came_out.unknown and held) then came_out.unknown_held = true; end
    -- Your level going up under a sync or level cap, with its buff gone right after, was it ending.
    local rose = came_out.rose;
    if (rose ~= nil and not held) then
        if (rose.ended or now - rose.at < SYNC_END) then
            last = rose.from;
        end
        came_out.rose = nil;
    end
    if (main_level ~= last and (held ~= came_out.held or (not synced and main_level < last))) then
        generation = generation + 1;
        came_out.sync, came_out.cut, came_out.affinity = nil, 0, affinity;
        if (came_out.unknown) then came_out.wyvern = main_level; end
        came_out.unknown, came_out.unknown_held = false, false;
        -- A sync or level cap ending is the only thing here that moves you up, and it sets a wyvern at your
        -- level now.
        if (main_level > last) then
            came_out.wyvern = main_level;
        end
    end
    local sync = came_out.sync;
    if (sync ~= nil) then
        sync.top.main, sync.top.sub = math.max(sync.top.main, main_level), math.max(sync.top.sub, sub_level);
    elseif (synced) then
        came_out.sync = { main = main_level, sub = sub_level, top = { main = main_level, sub = sub_level } };
    end
    if (held and came_out.held and main_level > last) then
        came_out.rose = { at = now, from = last };
    end
    came_out.held, came_out.last = held, main_level;
end

-- Each frame, but only for a few seconds after checkmate saw your main level go up under a level sync or
-- level cap. It notes the buff going in that time, since the next pet update or /check could be a long way off.
function pet.on_frame(now)
    local rose = (came_out ~= nil) and came_out.rose or nil;
    if (rose == nil or rose.ended) then
        return;
    end
    if (now - rose.at >= SYNC_END) then
        came_out.rose = nil;
    else
        local synced, capped = player.synced();
        rose.ended = not (synced or capped);
    end
end

-- The pet update packet. The server sends it the moment your pet comes out or goes, and again while it
-- changes, so the first one with a new pet is when it came out. Every one looks for a level sync too.
function pet.on_sync(index)
    if (index == 0) then
        came_out, lost_index = nil, nil;
        generation = generation + 1;
        return;
    end
    if (index ~= lost_index) then lost_index = nil; end
    local main, main_level, _, sub_level = player.jobs();
    watch(index, main_level, sub_level, lost_index == nil, main);
end

-- A pet already out when the addon loads has no observed summon gear or merit rank.
function pet.on_load()
    pet.forget();
    local found = player.pet();
    if (found ~= nil) then
        local main, main_level, _, sub_level = player.jobs();
        watch(found.index, main_level, sub_level, false, main);
    end
end

-- One jug roll at `level`, with the gear reduction and merit rank observed for that roll.
local function jug_roll(top, main, level, cut, rank)
    local fewest, most = rank or 0, rank or pets.beast_affinity.most;
    if (main ~= BST or level < AFFINITY_LEVEL) then
        fewest, most = 0, 0;
    end
    local per = pets.beast_affinity.per_merit;
    local low_top  = math.min(top + per * fewest, level);
    local high_top = math.min(top + per * most, level);
    return math.max(1, low_top - (MOST_BELOW - cut)), high_top;
end

-- Recalculating a jug rolls again, but petutils.cpp caps it at its original rolled spawn level.
local function jug_levels(top, main, level)
    local spawn = came_out.spawn;
    if (spawn.low == nil) then
        spawn.low, spawn.high = jug_roll(top, spawn.main, spawn.held and 75 or spawn.level,
            spawn.cut, spawn.affinity);
        if (not spawn.known) then spawn.low = 1; end
    end
    if (came_out.unknown_held) then return spawn.low, spawn.high; end
    local low, high = jug_roll(top, main, level, came_out.cut, came_out.affinity);
    return math.min(spawn.low, low), math.min(spawn.high, high);
end

--[[
    Your pet when your /check of server id `target` came back, or nil when it gets no pet part.
    Returns { kind, name, index, id, low, high, row, scripted, asks }. kind is 'jug', 'charmed', 'wyvern'
    or 'automaton', low..high its level, row and scripted a charmed monster's data row and its scripted
    flag, and asks is true when its numbers come from /checkparam <pet>.
]]
function pet.find(target)
    local found = player.pet();
    if (found == nil or found.id == target) then
        return nil;
    end
    local main, main_level, sub, sub_level = player.jobs();
    -- A summoner's avatar or spirit never gets the pet part. A wyvern or automaton named after one, like
    -- Titan, loses it too while SMN is your main or support job.
    if ((main == SMN or sub == SMN) and pets.avatars[found.name]) then
        return nil;
    end
    watch(found.index, main_level, sub_level, false, main);
    -- Your levels, or the ones checkmate first saw a level sync at while those still count.
    local levels = came_out.sync or { main = main_level, sub = sub_level };
    local beast = main == BST or sub == BST;
    local row = beast and monsters.find(player.zone(), found.id, found.name) or nil;
    local top = pets.jugs[found.name];
    if (beast and top ~= nil) then
        found.kind = 'jug';
        found.low, found.high = jug_levels(top, main, levels.main);
    elseif (beast and (monsters.placed(found.id) or row ~= nil)) then
        found.kind, found.row = 'charmed', row;
        found.low, found.high = monsters.pet_level(row, found.index);
        found.scripted = row ~= nil and row.flags ~= nil and row.flags.scripted_stats == true;
    elseif (main == DRG) then
        -- It keeps its level the same way, until a sync or level cap ending sets it again. With PUP support
        -- it could be your automaton too.
        found.kind = 'wyvern';
        local floor = math.min(came_out.wyvern, levels.main);
        found.low, found.high = (sub == PUP) and math.min(levels.sub, floor) or floor, levels.main;
    elseif (main == PUP or sub == PUP) then
        -- Under a level sync it never goes down, but it still follows a level-up of your own, which checkmate
        -- can't tell from the sync's level moving. So it's anywhere from its level when checkmate saw the sync
        -- to the highest level you've been at since.
        found.kind = 'automaton';
        local highest = levels.top or levels;
        local job = (main == PUP) and 'main' or 'sub';
        found.low, found.high = levels[job], highest[job];
    else
        return nil;
    end
    if (found.kind == 'jug') then
        found.summon_known = came_out.spawn.known;
    elseif (came_out.unknown and found.kind ~= 'charmed') then
        found.summon_known = false;
        if (found.kind ~= 'automaton' or came_out.unknown_held) then found.low = 1; end
        if (came_out.unknown_held) then
            local highest = (found.kind == 'automaton' and main ~= PUP) and 37 or 75;
            found.high = math.max(found.high or 1, highest);
        end
    else
        found.summon_known = true;
    end
    found.asks = found.kind ~= 'charmed';
    found.generation = generation;
    return found;
end

-- True when your pet is still out with server id `id`.
function pet.out(id)
    local found = player.pet();
    return found ~= nil and found.id == id;
end

return pet;
