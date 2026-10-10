-- Completed monster moves observed nearby. This does not establish learning eligibility.
local packets = require('core.packets');
local player = require('core.player');
local lessons = {};

local FIRST_ID, MONSTER_FLAG = 0x1000000, 0x10;
local MAX_MOBS, MAX_SKILLS, MAX_EVENTS = 128, 128, 256;
local mobs, revisions, pending, results = {}, {}, {}, {};
local count, serial, baseline, zone, next_sweep = 0, 0, 0, nil, 0;

local function integer(value)
    return type(value) == 'number' and value == math.floor(value) and value >= 0 and value < math.huge;
end

local function index_of(id)
    if (not integer(id) or id < FIRST_ID) then return nil; end
    local index = bit.band(id, 0xFFF);
    if (index >= 0x800) then index = index - 0x100; end
    return index;
end

local function changed(index)
    serial = serial + 1;
    revisions[index] = serial;
end

local function remove(index, id)
    local mob = mobs[index];
    if (mob ~= nil and (id == nil or mob.id == id)) then
        mobs[index], count = nil, count - 1;
        changed(index);
    end
end

function lessons.forget()
    mobs, revisions, pending = {}, {}, {};
    count, zone, next_sweep = 0, nil, 0;
    serial = serial + 1;
    baseline = serial;
end

local function current_zone()
    local current = player.zone();
    if (zone ~= nil and current ~= zone) then lessons.forget(); end
    zone = current;
    return current;
end

local function identity(index, id)
    if (not integer(index) or index > 0xEFF) then return nil; end
    local entity = GetEntity(index);
    local me = GetPlayerEntity();
    if (me == nil or me.PetTargetIndex == index or entity == nil or entity.Name == nil or entity.Name == ''
        or not integer(entity.ServerId) or entity.ServerId < FIRST_ID
        or (id ~= nil and entity.ServerId ~= id) or index_of(entity.ServerId) ~= index
        or math.floor((entity.ServerId - FIRST_ID) / 0x1000) ~= zone
        or bit.band(entity.SpawnFlags or 0, MONSTER_FLAG) == 0 or entity.HPPercent == 0) then
        remove(index);
        return nil;
    end
    local distance = entity.Distance;
    if (distance ~= nil and (type(distance) ~= 'number' or distance ~= distance or distance < 0 or distance > 2500)) then
        remove(index);
        return nil;
    end
    local saved = mobs[index];
    if (saved ~= nil and (saved.id ~= entity.ServerId or saved.name ~= entity.Name or saved.flags ~= entity.SpawnFlags)) then
        remove(index);
    end
    return entity;
end

local function queue(event)
    if (#pending >= MAX_EVENTS) then lessons.forget(); end
    pending[#pending + 1] = event;
end

-- Starts, interrupts, spells, player actions and avatar abilities never count as monster move completion.
function lessons.on_action(e)
    local category = packets.action_category(e);
    if (category ~= 3 and category ~= 11) then return; end
    local actor, skill = packets.action_head(e);
    local index = index_of(actor);
    if (index == nil or not integer(skill) or skill < 1 or skill > 65535) then return; end
    if ((category == 3 and skill >= 256) or (category == 11 and skill < 256)) then return; end
    if (packets.action_results(e, results, 0) == 0) then return; end
    queue({ kind = 'move', zone = current_zone(), index = index, id = actor, skill = skill });
end

function lessons.on_message(_, target, _, message, index)
    if (message ~= 6 and message ~= 20) then return; end
    index = index or index_of(target);
    if (index ~= nil) then queue({ kind = 'gone', index = index, id = target }); end
end

function lessons.on_entity(e)
    local id, index = packets.despawned(e);
    if (id ~= nil) then queue({ kind = 'gone', index = index or index_of(id), id = id }); end
end

function lessons.on_zone()
    lessons.forget();
end

local function make_room()
    if (count < MAX_MOBS) then return; end
    local oldest, at;
    for index, mob in pairs(mobs) do
        if (at == nil or mob.at < at) then oldest, at = index, mob.at; end
    end
    if (oldest ~= nil) then remove(oldest); end
end

-- Only tracked monsters are checked for disappearance. There is no entity-list scan.
function lessons.take_in(now)
    now = now or os.clock();
    current_zone();
    local events = pending;
    if (#events > 0) then pending = {}; end
    for _, event in ipairs(events) do
        if (event.kind == 'gone') then
            remove(event.index, event.id);
        elseif (event.zone == zone) then
            local entity = identity(event.index, event.id);
            if (entity ~= nil) then
                local mob = mobs[event.index];
                if (mob ~= nil and mob.skills[event.skill] == nil and mob.count >= MAX_SKILLS) then
                    remove(event.index);
                    mob = nil;
                end
                if (mob == nil) then
                    make_room();
                    mob = { id = event.id, name = entity.Name, flags = entity.SpawnFlags, skills = {}, count = 0 };
                    mobs[event.index], count = mob, count + 1;
                end
                mob.at = now;
                if (mob.skills[event.skill] ~= true) then
                    mob.skills[event.skill], mob.count = true, mob.count + 1;
                    changed(event.index);
                end
            end
        end
    end
    if (now >= next_sweep) then
        next_sweep = now + 1;
        for index in pairs(mobs) do identity(index); end
    end
end

function lessons.version(index)
    current_zone();
    identity(index);
    return revisions[index] or baseline;
end

-- False means not observed for this identity. Nil means the identity or mapping cannot be read.
function lessons.seen(index, skill)
    current_zone();
    if (not integer(skill) or skill < 1 or skill > 65535 or identity(index) == nil) then return nil; end
    local mob = mobs[index];
    return mob ~= nil and mob.skills[skill] == true;
end

function lessons.spell_seen(index, skills)
    current_zone();
    if (type(skills) ~= 'table' or #skills == 0 or identity(index) == nil) then return nil; end
    local valid, unknown, mob = false, false, mobs[index];
    for _, skill in ipairs(skills) do
        if (integer(skill) and skill >= 1 and skill <= 65535) then
            valid = true;
            if (mob ~= nil and mob.skills[skill] == true) then return true; end
        else
            unknown = true;
        end
    end
    if (valid and not unknown) then return false; end
    return nil;
end

return lessons;
