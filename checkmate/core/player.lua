--[[
    Everything checkmate reads from game memory about you and the monster you /check.
]]

local player = {};

-- Equipment slots checkmate reads, and the item ids an empty slot can hold.
local SLOT_MAIN   = 0;
local SLOT_RANGED = 2;
local ITEM_NONE   = { [0] = true, [65535] = true };

-- Where each stat sits in the client's stat list.
local STAT_INDEX = { dex = 1, int = 4, mnd = 5, chr = 6 };

-- Magic skills by skill id. Divine, healing, enfeebling, elemental, dark, ninjutsu, singing, wind
-- instrument and blue magic.
local MAGIC_SKILLS = { 32, 33, 35, 36, 37, 39, 40, 42, 43 };

local memory    = AshitaCore:GetMemoryManager();
local resources = AshitaCore:GetResourceManager();

function player.server_id()
    return memory:GetParty():GetMemberServerId(0);
end

function player.zone()
    return memory:GetParty():GetMemberZone(0);
end

-- Your main job id, or 0 while the client doesn't know it yet.
function player.main_job()
    return memory:GetPlayer():GetMainJob();
end

-- True once you're in the world, not zoning or at the login screen.
function player.in_world()
    return GetPlayerEntity() ~= nil;
end

-- The name of the entity at `index`, or nil when there isn't one.
function player.entity_name(index)
    local entity = GetEntity(index);
    if (entity == nil or entity.Name == nil or entity.Name == '') then
        return nil;
    end
    return entity.Name;
end

-- The item id in an equipment slot, or nil for an empty slot.
local function equipped_id(slot)
    local inventory = memory:GetInventory();
    local equipped = inventory:GetEquippedItem(slot);
    if (equipped == nil or equipped.Index == 0) then
        return nil;
    end

    local item = inventory:GetContainerItem(bit.rshift(equipped.Index, 8), bit.band(equipped.Index, 0xFF));
    if (item == nil or ITEM_NONE[item.Id]) then
        return nil;
    end
    return item.Id;
end

-- Your buffs as { [buff id] = true }. Slots 0 to 32 cover the list whether it starts at 0 or at 1.
local function read_buffs(stats)
    local out = {};
    local buffs = stats:GetBuffs();
    if (buffs == nil) then
        return out;
    end
    for i = 0, 32 do
        local id = buffs[i];
        if (id ~= nil and id > 0 and id ~= 255) then
            out[id] = true;
        end
    end
    return out;
end

--[[
    Everything the readout needs about you, read once per /check.
    { level, dex, int, mnd, chr, skills = { [skill id] = value }, buffs = { [id] = true }, zone,
      main_id, ranged_skill }
    `main_id` is your main hand item id and `ranged_skill` the skill of your ranged slot item. Either
    is nil when the slot is empty.
]]
function player.read()
    local stats = memory:GetPlayer();
    local me = {
        level  = stats:GetMainJobLevel(),
        skills = {},
        buffs  = read_buffs(stats),
        zone   = player.zone(),
        main_id = equipped_id(SLOT_MAIN),
    };
    for name, index in pairs(STAT_INDEX) do
        me[name] = stats:GetStat(index) + stats:GetStatModifier(index);
    end
    for _, id in ipairs(MAGIC_SKILLS) do
        local skill = stats:GetCombatSkill(id);
        me.skills[id] = skill and skill:GetSkill() or 0;
    end

    local ranged = equipped_id(SLOT_RANGED);
    local info = ranged and resources:GetItemById(ranged);
    me.ranged_skill = info and info.Skill or nil;
    return me;
end

return player;
