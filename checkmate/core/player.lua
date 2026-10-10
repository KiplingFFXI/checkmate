--[[
    Everything checkmate reads from game memory about you and the monster you /check, and for the
    overlay, the monster you have targeted and the game flags it hides by.
]]

local player = {};

-- Equipment slots checkmate reads, and the item ids an empty slot can hold.
local SLOT_MAIN   = 0;
local SLOT_SUB    = 1;
local SLOT_RANGED = 2;
local SLOT_AMMO   = 3;
local ITEM_NONE   = { [0] = true, [65535] = true };

-- Skill ids of the one-handed weapons, dagger, sword, axe, katana and club. You only swing an off-hand
-- weapon with one of these in each hand. A grip or a shield has no weapon skill, and hand-to-hand
-- leaves the sub slot empty.
local ONE_HANDED = { [2] = true, [3] = true, [5] = true, [9] = true, [11] = true };

-- Archery and marksmanship, the skills of bows, crossbows and guns, which need their ammo to shoot.
-- Throwing shoots by itself, from the ranged slot or from the ammo slot with the ranged slot empty.
local NEEDS_AMMO = { [25] = true, [26] = true };
local THROWING   = 27;

-- Where each stat sits in the client's stat list.
local STAT_INDEX = { dex = 1, agi = 3, int = 4, mnd = 5, chr = 6 };

-- Magic skills by skill id. Divine, healing, enfeebling, elemental, dark, ninjutsu, singing, wind
-- instrument and blue magic.
local MAGIC_SKILLS = { 32, 33, 35, 36, 37, 39, 40, 42, 43 };

-- The Level Sync and Level Restriction buff ids.
local LEVEL_SYNC, LEVEL_CAP = 269, 143;

-- Monsters have this spawn flag. Players have 0x01 and NPCs 0x02.
local SPAWN_MONSTER = 0x10;

-- The status the server gives you during a cutscene or NPC conversation.
local STATUS_EVENT = 4;

--[[
    The client code that leads to the cutscene, hidden-interface and active-menu flags.
    The event flag's address is the four bytes after the first byte of the code that checks it. The game
    sets it the moment a cutscene or NPC conversation starts and clears it when the event ends. The
    interface object's address sits 10 bytes into its code. Its byte at +0xB4 is 1 while you hide the
    interface (Scroll Lock by default), and its slot at +0x54 holds the menu that has focus. The menu code
    leads to that slot. Each menu's name is "menu    " plus an eight letter short name, and every map
    view's short name starts with "map", like map0, mapv2 and mapframe.
]]
player.PATTERNS = {
    event     = 'A0????????84C0741AA1????????85C0741166A1????????663B05????????0F94C0C3',
    interface = '8B4424046A016A0050B9????????E8????????F6D81BC040C3',
    menu      = '8B480C85C974??8B510885D274??3B05',
};
local HIDDEN_OFFSET = 0xB4;
local FOCUS_OFFSET  = 0x54;
local SHORT_NAME    = 0x46 + 8;
local MAP_NAME      = 0x0070616D;   -- 'map' as the low three bytes of a little-endian word.

local memory    = AshitaCore:GetMemoryManager();
local resources = AshitaCore:GetResourceManager();

-- The game's target list, looked up the first time the overlay needs it.
local targets = nil;

-- Where the event flag, the hidden interface byte and the menu focus slot are, each 0 when its pattern
-- wasn't found. They're looked up the first time the overlay needs one, and never move after that.
local flags = nil;

-- Your max HP before gear and food from the last job info packet, or nil before one came in.
local base_hp = nil;

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

-- The item id in an equipment slot and that item's skill, or nil for an empty slot.
local function equipped_skill(slot)
    local id = equipped_id(slot);
    local info = id and resources:GetItemById(id);
    return id, info and info.Skill or nil;
end

-- Your pet as { index, id, name }, or nil with no pet out or one at 0 HP.
function player.pet()
    local me = GetPlayerEntity();
    local index = me and me.PetTargetIndex or 0;
    local entity = (index ~= 0) and GetEntity(index) or nil;
    if (entity == nil or entity.HPPercent == 0 or entity.Name == nil or entity.Name == '') then
        return nil;
    end
    return { index = index, id = entity.ServerId, name = entity.Name };
end

-- Your main job, main level, support job and support level. The levels follow level sync.
function player.jobs()
    local stats = memory:GetPlayer();
    return stats:GetMainJob(), stats:GetMainJobLevel(), stats:GetSubJob(), stats:GetSubJobLevel();
end

-- The job info packet came in with your max HP before gear and food.
function player.on_base_hp(hp)
    base_hp = hp;
end

-- Your HP, your max HP before gear and food, and your TP. TP runs 0 to 3000, so 1000 is 100%. Until a job info
-- packet comes in, the max HP is the one the game shows and the fourth return is false.
function player.hp_tp()
    local party = memory:GetParty();
    return party:GetMemberHP(0), base_hp or memory:GetPlayer():GetHPMax(), party:GetMemberTP(0), base_hp ~= nil;
end

-- The item ids of everything you have on, slots 0 to 15.
function player.equipped_items()
    local items = {};
    for slot = 0, 15 do
        items[#items + 1] = equipped_id(slot);
    end
    return items;
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

-- Whether a level sync holds you, and whether a level cap does.
function player.synced()
    local buffs = read_buffs(memory:GetPlayer());
    return buffs[LEVEL_SYNC] == true, buffs[LEVEL_CAP] == true;
end

--[[
    Reads your current inputs for a check or an overlay refresh.
    { level, dex, agi, int, mnd, chr, skills = { [skill id] = value }, buffs = { [id] = true }, zone,
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

    local _, ranged_skill = equipped_skill(SLOT_RANGED);
    me.ranged_skill = ranged_skill;
    return me;
end

-- The client stores squared distance. This is a reading at this moment, not a shot's distance penalty.
function player.distance(index)
    local entity = GetEntity(index);
    local squared = entity and entity.Distance;
    if (type(squared) ~= 'number' or squared < 0 or squared ~= squared or squared == math.huge) then
        return nil;
    end
    return math.sqrt(squared);
end

-- Reuses one snapshot so a quiet overlay does not make new tables while checking for changed inputs.
local input_values = {};
local input_slot, input_changed = 0, false;
local function input(value)
    input_slot = input_slot + 1;
    value = value or 0;
    if (input_values[input_slot] ~= value) then
        input_values[input_slot], input_changed = value, true;
    end
end

function player.inputs_changed()
    input_slot, input_changed = 0, false;
    local stats = memory:GetPlayer();
    input(stats:GetMainJob());
    input(stats:GetMainJobLevel());
    input(stats:GetSubJob());
    input(stats:GetSubJobLevel());
    for _, index in pairs(STAT_INDEX) do
        input(stats:GetStat(index) + stats:GetStatModifier(index));
    end
    for _, id in ipairs(MAGIC_SKILLS) do
        local skill = stats:GetCombatSkill(id);
        input(skill and skill:GetSkill());
    end
    local buffs = stats:GetBuffs();
    for i = 0, 32 do input(buffs and buffs[i]); end
    for slot = 0, 15 do input(equipped_id(slot)); end
    local hp, maximum, tp, known = player.hp_tp();
    input(hp);
    input(maximum);
    input(tp);
    input(known);
    return input_changed;
end

-- Whether you swing an off-hand weapon, and whether your ranged and ammo slots let you shoot.
function player.weapons()
    local _, main = equipped_skill(SLOT_MAIN);
    local _, sub = equipped_skill(SLOT_SUB);
    local ranged_id, ranged = equipped_skill(SLOT_RANGED);
    local ammo_id, ammo = equipped_skill(SLOT_AMMO);
    local dual_wield = ONE_HANDED[main] == true and ONE_HANDED[sub] == true;
    local shoots = (NEEDS_AMMO[ranged] == true and ammo_id ~= nil) or ranged == THROWING
        or (ranged_id == nil and ammo == THROWING);
    return dual_wield, shoots;
end

--[[
    The entity index you have targeted, or 0 for none. While you pick a target for a spell or ability, slot 0 is
    the cursor and slot 1 the target you had, and this is the one you had, unless `cursor` is set. Picking with
    nothing targeted leaves slot 0 at 0 and puts the cursor in slot 1, so then it's 0, or the cursor's with
    `cursor` set.
]]
function player.target_index(cursor)
    targets = targets or memory:GetTarget();
    local index = targets:GetTargetIndex(0);
    if (index == 0) then
        return cursor and targets:GetTargetIndex(1) or 0;
    end
    if (not cursor and targets:GetIsSubTargetActive() == 1) then
        local held = targets:GetTargetIndex(1);
        if (held ~= 0) then
            return held;
        end
    end
    return index;
end

-- The name and server id of the monster at entity index `index`, or nil when it isn't a monster.
function player.monster(index)
    local entity = GetEntity(index);
    if (entity == nil or bit.band(entity.SpawnFlags or 0, SPAWN_MONSTER) == 0) then
        return nil;
    end
    return entity.Name, entity.ServerId;
end

-- Your main level. It follows level sync.
function player.main_level()
    return memory:GetPlayer():GetMainJobLevel();
end

-- Looks up where the flags are. A focus slot that isn't inside the interface object means a game update
-- moved something, so the hidden interface and map checks both stay off.
local function find_flags()
    local find, read = ashita.memory.find, ashita.memory.read_uint32;
    local event_check = find('FFXiMain.dll', 0, player.PATTERNS.event, 0, 0);
    local interface_check = find('FFXiMain.dll', 0, player.PATTERNS.interface, 0, 0);
    local menu_check = find('FFXiMain.dll', 0, player.PATTERNS.menu, 16, 0);
    local interface = (interface_check ~= 0) and read(interface_check + 10) or 0;
    local focus = (menu_check ~= 0) and read(menu_check) or 0;
    if (focus ~= 0 and focus ~= interface + FOCUS_OFFSET) then
        interface, focus = 0, 0;
    end
    flags = {
        event  = (event_check ~= 0) and read(event_check + 1) or 0,
        hidden = (interface ~= 0) and (interface + HIDDEN_OFFSET) or 0,
        focus  = focus,
    };
end

-- True during a cutscene or NPC conversation. `me` is your entity. If a game update breaks the pattern, this
-- goes by your status, which the server sends a moment later.
function player.in_event(me)
    if (flags == nil) then
        find_flags();
    end
    if (flags.event ~= 0) then
        return ashita.memory.read_uint8(flags.event) == 1;
    end
    return me.StatusServer == STATUS_EVENT;
end

-- True while you've hidden the game's interface. False when this game version can't be checked.
function player.interface_hidden()
    if (flags == nil) then
        find_flags();
    end
    return flags.hidden ~= 0 and ashita.memory.read_uint8(flags.hidden) == 1;
end

-- True while a map view has focus. False when this game version can't be checked.
function player.map_open()
    if (flags == nil) then
        find_flags();
    end
    if (flags.focus == 0) then
        return false;
    end
    local menu = ashita.memory.read_uint32(flags.focus);
    if (menu == 0) then
        return false;
    end
    local header = ashita.memory.read_uint32(menu + 4);
    if (header == 0) then
        return false;
    end
    return bit.band(ashita.memory.read_uint32(header + SHORT_NAME), 0xFFFFFF) == MAP_NAME;
end

-- Equipment slots used when one of your effects lands.
player.SLOT_MAIN, player.SLOT_SUB, player.SLOT_AMMO = SLOT_MAIN, SLOT_SUB, SLOT_AMMO;
player.SONG_SLOTS = { SLOT_RANGED };
player.ALL_SLOTS = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
player.equipped = equipped_id;

-- True when your buff list has this effect, like Troubadour.
function player.has_buff(id)
    if (id == nil) then return false; end
    local buffs = memory:GetPlayer():GetBuffs();
    if (buffs == nil) then return false; end
    for i = 0, 32 do
        if (buffs[i] == id) then return true; end
    end
    return false;
end

-- A name for a hover tip: someone in your party/alliance, or a matching monster or pet nearby.
function player.name_of(id)
    if (type(id) ~= 'number') then return nil; end
    if (id < 0x1000000) then
        local party = memory:GetParty();
        for slot = 0, 17 do
            if (party:GetMemberServerId(slot) == id) then
                local name = party:GetMemberName(slot);
                return (name ~= nil and name ~= '') and name or nil;
            end
        end
        return nil;
    end
    local index = bit.band(id, 0xFFF);
    if (index >= 0x800) then index = index - 0x100; end
    local entity = GetEntity(index);
    if (entity ~= nil and entity.ServerId == id and entity.Name ~= '') then return entity.Name; end
    return nil;
end

-- Learned spells are separate from the Blue Magic spells you currently have set.
function player.knows_spell(id)
    local ok, known = pcall(function ()
        local you = memory:GetPlayer();
        if (you == nil or not you:HasSpellData()) then return nil; end
        return you:HasSpell(id);
    end);
    if (not ok or type(known) ~= 'boolean') then return nil; end
    return known;
end

-- Inputs visible to the client when the lesson details are built. Eligibility is checked on defeat.
function player.blue_learning(index)
    local out = {};
    if (not player.in_world()) then return out; end
    local ok, job, skill, hp = pcall(function ()
        local you = memory:GetPlayer();
        local blue = you:GetCombatSkill(43);
        return you:GetMainJob(), blue and blue:GetSkill(), memory:GetParty():GetMemberHP(0);
    end);
    if (ok) then
        out.job = type(job) == 'number' and job > 0 and job or nil;
        out.skill = type(skill) == 'number' and skill >= 0 and skill or nil;
        if (type(hp) == 'number' and hp >= 0) then out.alive = hp > 0; end
    end
    if (type(index) == 'number' and index > 0) then
        local read, distance = pcall(player.distance, index);
        if (read) then out.distance = distance; end
    end
    return out;
end

-- Only the defensive rows read these skills and their equipment inputs.
local function defense_inputs()
    local stats, inventory = memory:GetPlayer(), memory:GetInventory();
    local out = { level = stats:GetMainJobLevel(), main_job = stats:GetMainJob(),
        sub_job = stats:GetSubJob(), sub_level = stats:GetSubJobLevel(), zone = player.zone(),
        skills = {}, equipment = {}, buffs = {}, observed_at = os.clock() };
    for _, name in ipairs({ 'level', 'main_job', 'sub_job', 'sub_level' }) do
        if (type(out[name]) ~= 'number') then error('Defensive job inputs are not readable.'); end
    end
    local keys = { player.server_id() or 0, out.zone or 0, out.level, out.main_job, out.sub_job, out.sub_level };
    for _, id in ipairs({ 30, 31 }) do
        local skill = stats:GetCombatSkill(id);
        local value = skill and skill:GetSkill();
        if (type(value) ~= 'number' or value < 0 or value ~= value or value == math.huge) then
            error('Defensive skill inputs are not readable.');
        end
        out.skills[id], keys[#keys + 1] = value, value;
    end
    local buffs = stats:GetBuffs();
    if (buffs == nil) then error('Defensive status inputs are not readable.'); end
    for i = 0, 32 do
        local id = buffs[i];
        keys[#keys + 1] = id or 0;
        if (id ~= nil and id > 0 and id ~= 255) then out.buffs[id] = true; end
    end
    for slot = 0, 15 do
        local equipped = inventory:GetEquippedItem(slot);
        local index = equipped and equipped.Index or 0;
        local item = index ~= 0 and inventory:GetContainerItem(bit.rshift(index, 8), bit.band(index, 0xFF)) or nil;
        if (index ~= 0 and item == nil) then error('Defensive equipment inputs are not readable.'); end
        local id = item and not ITEM_NONE[item.Id] and item.Id or 0;
        out.equipment[slot] = id;
        keys[#keys + 1], keys[#keys + 2] = index, id;
        local extra = item and type(item.Extra) == 'string' and item.Extra or '';
        keys[#keys + 1] = #extra .. '/' .. extra;
        if (id ~= 0) then
            -- The installed item reader uses these two bytes to identify augment systems.
            if (#extra >= 2) then
                local kind, subkind = extra:byte(1, 2);
                if (id >= 10240 and ((kind == 2 and bit.band(subkind, 0x10) == 0)
                    or (kind == 3 and bit.band(subkind, 0x80) ~= 0))) then out.has_augments = true; end
            else
                out.augments_unknown = true;
            end
        end
    end
    out.main_id, out.sub_id = out.equipment[SLOT_MAIN], out.equipment[SLOT_SUB];
    local main = out.main_id ~= 0 and resources:GetItemById(out.main_id) or nil;
    out.main_skill = main and main.Skill or nil;
    out.main_item_level = main and main.ItemLevel or nil;
    local sub = out.sub_id ~= 0 and resources:GetItemById(out.sub_id) or nil;
    out.sub_skill, out.sub_shield_size = sub and sub.Skill or nil, sub and sub.ShieldSize or nil;
    keys[#keys + 1] = out.main_skill or -1;
    keys[#keys + 1], keys[#keys + 2] = out.sub_skill or -1, out.sub_shield_size or -1;
    for i, value in ipairs(keys) do keys[i] = tostring(value); end
    out.signature = table.concat(keys, ':');
    return out;
end

function player.defense_inputs()
    local ok, out = pcall(defense_inputs);
    if (ok) then return out; end
    return { reason = 'Your current shield and parry inputs could not be read.' };
end

local attack_snapshot, attack_revision = nil, 0;

-- Attack replies belong to the gear, skills and buffs visible when they were requested.
local function pdif_inputs()
    local stats, inventory = memory:GetPlayer(), memory:GetInventory();
    local out = { level = stats:GetMainJobLevel(), main_job = stats:GetMainJob(), zone = player.zone(),
        sub_job = stats:GetSubJob(), sub_level = stats:GetSubJobLevel(), buffs = {} };
    local buffs = stats:GetBuffs();
    if (buffs == nil) then error('Attack buffs are not readable.'); end
    local client_attack = stats:GetAttack();
    if (type(client_attack) ~= 'number' or client_attack ~= client_attack or client_attack == math.huge) then
        error('Attack inputs are not readable.');
    end
    local strength, strength_bonus = stats:GetStat(0), stats:GetStatModifier(0);
    if (type(strength) ~= 'number' or type(strength_bonus) ~= 'number') then
        error('Attack inputs are not readable.');
    end
    local keys = { player.server_id() or 0, out.zone or 0, out.level, out.main_job,
        out.sub_job, out.sub_level, strength + strength_bonus, client_attack };
    local ids = {};
    for slot = 0, 15 do
        local equipped = inventory:GetEquippedItem(slot);
        local index = equipped and equipped.Index or 0;
        local item = index ~= 0 and inventory:GetContainerItem(bit.rshift(index, 8), bit.band(index, 0xFF)) or nil;
        if (index ~= 0 and item == nil) then error('Attack equipment is not readable.'); end
        local id = item and not ITEM_NONE[item.Id] and item.Id or 0;
        ids[slot], keys[#keys + 1] = id, index;
        keys[#keys + 1] = id;
        local extra = item and type(item.Extra) == 'string' and item.Extra or '';
        keys[#keys + 1] = #extra .. '/' .. extra;
    end
    local function weapon(slot)
        local id = ids[slot];
        local item = id ~= 0 and resources:GetItemById(id) or nil;
        local skill = item and item.Skill or nil;
        local value = skill and stats:GetCombatSkill(skill) or nil;
        keys[#keys + 1], keys[#keys + 2] = skill or 0, value and value:GetSkill() or 0;
        return id ~= 0 and id or nil, skill;
    end
    out.main_id, out.main_skill = weapon(SLOT_MAIN);
    out.offhand_id, out.offhand_skill = weapon(SLOT_SUB);
    out.ranged_id, out.ranged_skill = weapon(SLOT_RANGED);
    local ammo_skill;
    out.ammo_id, ammo_skill = weapon(SLOT_AMMO);
    if (out.ranged_id == nil and ammo_skill == THROWING) then out.ranged_skill = ammo_skill; end;
    out.dual_wield = ONE_HANDED[out.main_skill] == true and ONE_HANDED[out.offhand_skill] == true;
    out.shoots = (NEEDS_AMMO[out.ranged_skill] == true and out.ammo_id ~= nil)
        or out.ranged_skill == THROWING;
    local buff_ids = {};
    for i = 0, 32 do
        local id = buffs[i];
        if (id ~= nil and id > 0 and id ~= 255) then
            out.buffs[id] = true;
            buff_ids[#buff_ids + 1] = id;
        end
    end
    table.sort(buff_ids);
    keys[#keys + 1] = table.concat(buff_ids, ',');
    for i, value in ipairs(keys) do keys[i] = tostring(value); end
    out.signature = table.concat(keys, ':');
    return out;
end

function player.forget_attacks()
    if (attack_snapshot ~= nil) then attack_revision = attack_revision + 1; end
    attack_snapshot = nil;
end

local function current_pdif_inputs()
    local ok, out = pcall(pdif_inputs);
    if (not ok) then
        player.forget_attacks();
        return { attack_state = 'unreadable', reason = 'Your current attack inputs could not be read.',
            revision = attack_revision };
    end
    if (attack_snapshot ~= nil and attack_snapshot.signature ~= out.signature) then
        player.forget_attacks();
    end
    out.revision = attack_revision;
    return out;
end

-- The overlay reuses replies but never asks for one. Changed inputs leave attack unknown.
function player.pdif_inputs()
    local out = current_pdif_inputs();
    if (attack_snapshot ~= nil) then
        out.attack, out.offhand_attack, out.ranged_attack = attack_snapshot.attack,
            attack_snapshot.offhand_attack, attack_snapshot.ranged_attack;
        out.observed_at, out.attack_state = attack_snapshot.observed_at, 'checked';
    elseif (out.attack_state == nil) then
        out.attack_state = 'unknown';
        out.reason = 'Attack is unknown. Check a monster to request a fresh attack reading.';
    end
    return out;
end

-- Called at reply completion, before later frames can associate the reply with different equipment.
function player.accept_attacks(expected, main, offhand, ranged, at)
    local current = current_pdif_inputs();
    if (expected == nil or expected.signature == nil or current.signature ~= expected.signature) then
        player.forget_attacks();
        return nil, 'Your inputs changed while the attack reply was pending. Check again.';
    end
    local function positive(value)
        return type(value) == 'number' and value > 0 and value < math.huge and value or nil;
    end
    current.attack, current.offhand_attack, current.ranged_attack = positive(main), positive(offhand), positive(ranged);
    if (current.attack == nil and current.offhand_attack == nil and current.ranged_attack == nil) then
        return nil, 'The attack reply did not include usable attack values.';
    end
    current.observed_at, current.attack_state = at or os.clock(), 'checked';
    attack_revision = attack_revision + 1;
    current.revision, attack_snapshot = attack_revision, current;
    return current;
end

function player.pdif_valid(snapshot)
    local current = current_pdif_inputs();
    if (snapshot == nil or snapshot.signature == nil or current.signature ~= snapshot.signature) then
        return false, 'Your inputs changed after the attack reading. Check again.';
    end
    return true;
end

local function parameter_inputs()
    local out = pdif_inputs();
    local stats, party = memory:GetPlayer(), memory:GetParty();
    local function number(value)
        if (type(value) ~= 'number' or value ~= value or math.abs(value) == math.huge) then
            error('Accuracy and evasion inputs are not readable.');
        end
        return value;
    end
    out.dex = number(stats:GetStat(1)) + number(stats:GetStatModifier(1));
    out.agi = number(stats:GetStat(3)) + number(stats:GetStatModifier(3));
    local evasion = stats:GetCombatSkill(29);
    out.evasion_skill = number(evasion and evasion:GetSkill());
    out.hp, out.hp_max, out.tp = number(party:GetMemberHP(0)), number(stats:GetHPMax()), number(party:GetMemberTP(0));
    out.signature = table.concat({ out.signature, out.dex, out.agi, out.evasion_skill }, ':');
    -- HP and TP can change latents. Keep the reading, but qualify it when these change.
    out.condition_signature = table.concat({ out.hp, out.hp_max, out.tp }, ':');
    return out;
end

function player.parameter_inputs()
    local ok, out = pcall(parameter_inputs);
    if (ok) then return out; end
    return { reason = 'Your current accuracy and evasion inputs could not be read.' };
end

-- Manual stat replies supply these values. Missing fields stay unknown.
function player.accept_parameters(origin, values, at)
    local current = player.parameter_inputs();
    if (current.signature == nil) then return nil, current.reason; end
    if (origin == nil or origin.signature == nil or current.signature ~= origin.signature) then
        return nil, 'Your inputs changed while the stat reply was pending. Check again.';
    end
    local function usable(value, positive)
        return type(value) == 'number' and value >= 0 and value < math.huge
            and (not positive or value > 0) and value or nil;
    end
    values = values or {};
    current.accuracy, current.evasion = usable(values.accuracy), usable(values.evasion);
    current.offhand_accuracy = usable(values.offhand_accuracy, true);
    current.ranged_accuracy = usable(values.ranged_accuracy, true);
    if (current.accuracy == nil and current.evasion == nil and current.offhand_accuracy == nil
        and current.ranged_accuracy == nil) then
        return nil, 'The stat reply did not include usable accuracy or evasion values. Check again.';
    end
    current.observed_at = at or os.clock();
    current.condition_changed = origin.condition_signature ~= current.condition_signature;
    return current;
end

function player.parameters_valid(snapshot)
    local current = player.parameter_inputs();
    if (current.signature == nil) then return false, current.reason; end
    if (snapshot == nil or snapshot.signature == nil or current.signature ~= snapshot.signature) then
        return false, 'Your inputs changed after the stat reading. Check again.';
    end
    return true, nil, snapshot.condition_changed == true
        or snapshot.condition_signature ~= current.condition_signature;
end

return player;
