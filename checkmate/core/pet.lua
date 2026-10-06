--[[
    Your pet, for the pet part. checkmate looks for it when your own /check comes back, so a pet you call
    or charm after that doesn't count. Only your own pet ever does, and never a summoner's avatar or spirit.

    A jug pet, a wyvern and an automaton get their accuracy and evasion from /checkparam <pet>. A charmed
    monster keeps its own, so checkmate takes them from its monster data. No packet carries a pet's level,
    so checkmate works it out the way the server does (petutils.cpp):
    - a wyvern is at your main level when it came out. Leveling up doesn't change it, but a level sync or
      level cap starting or ending that moves your main level sets it again at the new one,
    - an automaton is at your main level with PUP main, or your support level with PUP support, and it
      follows you when you level up,
    - a jug pet is its highest level less 0 to 2, picked at random when you call it, or less 0 to 1 with
      Monster Gloves on then and you at their level. Its highest level is the jug's own top level plus 2 for
      each Beast Affinity merit, but never above your main level when you called it, or now if a sync holds
      you lower. A level sync or level cap starting or ending that moves your main level picks it again with
      the gear you have on then,
    - a charmed monster is at its own level, from your /check or widescan of it in this zone, unless it died
      near you after that, or else the levels it spawns at.
    So once you've leveled up with a wyvern out, it could be anywhere from your level when it came out to
    your level now. DRG main with PUP support can have either pet, and nothing checkmate reads tells them
    apart, so that pet is anywhere from your support level to your main level.

    A level sync's level moves when the sync target levels up or down. That moves your level but not your
    pet's, so while a sync holds you, checkmate goes by your levels when it first saw the sync with your pet
    out, at a pet update or a /check. A sync that ends with you already back at your own level doesn't move
    you, so your pet stays where the sync put it, and checkmate keeps going by those levels until a sync or
    level cap moves your main level. Only an automaton still follows a level-up of your own, so it's
    anywhere from its level then to the highest level you've been at since. A sync or level cap ending can
    send your new level a moment before it takes its buff off, so the buff going within a few seconds of
    checkmate seeing your level go up under it counts as it ending too.
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

-- The merit list counted your Beast Affinity merits.
function pet.on_affinity(count)
    affinity = count;
end

-- Zoning. The next zone's merit list says Beast Affinity again, and its pet update says when your pet
-- comes back.
function pet.forget()
    affinity, came_out = nil, nil;
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
local function watch(index, main_level, sub_level)
    -- Your pet at entity index `index` just came out, or checkmate is seeing it for the first time.
    if (came_out == nil or came_out.index ~= index) then
        came_out = { index = index, level = main_level, wyvern = main_level, cut = range_cut(main_level) };
    end
    local synced, capped = player.synced();
    local held, last, now = synced or capped, came_out.last or main_level, os.clock();
    -- Your level going up under a sync or level cap, with its buff gone right after, was it ending.
    local rose = came_out.rose;
    if (rose ~= nil and not held) then
        if (rose.ended or now - rose.at < SYNC_END) then
            last = rose.from;
        end
        came_out.rose = nil;
    end
    if (main_level ~= last and (held ~= came_out.held or (not synced and main_level < last))) then
        came_out.sync, came_out.cut = nil, 0;
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
        came_out = nil;
        return;
    end
    local _, main_level, _, sub_level = player.jobs();
    watch(index, main_level, sub_level);
end

-- A jug pet's levels as low, high. `level` is the lower of your main level when it came out and now, with
-- the level checkmate first saw a level sync at standing in for now while it counts, and `cut` what your
-- gear took off its range.
local function jug_levels(top, main, level, cut)
    local fewest, most = affinity or 0, affinity or pets.beast_affinity.most;
    if (main ~= BST or level < AFFINITY_LEVEL) then
        fewest, most = 0, 0;
    end
    local per = pets.beast_affinity.per_merit;
    local low_top  = math.min(top + per * fewest, level);
    local high_top = math.min(top + per * most, level);
    return math.max(1, low_top - (MOST_BELOW - cut)), high_top;
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
    watch(found.index, main_level, sub_level);
    -- Your levels, or the ones checkmate first saw a level sync at while those still count.
    local levels = came_out.sync or { main = main_level, sub = sub_level };
    -- A jug pet keeps its level from when it came out, unless a level sync moved it since.
    local lowest = math.min(came_out.level, levels.main);
    local beast = main == BST or sub == BST;
    local row = beast and monsters.find(player.zone(), found.id, found.name) or nil;
    local top = pets.jugs[found.name];
    if (beast and top ~= nil) then
        found.kind = 'jug';
        found.low, found.high = jug_levels(top, main, lowest, came_out.cut);
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
    found.asks = found.kind ~= 'charmed';
    return found;
end

-- True when your pet is still out with server id `id`.
function pet.out(id)
    local found = player.pet();
    return found ~= nil and found.id == id;
end

return pet;
