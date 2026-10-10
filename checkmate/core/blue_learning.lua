-- The roll uses your current equipment, separate from the conditions for a learning attempt.
local player = require('core.player');
local data = require('data.modifiers');
local memory = AshitaCore:GetMemoryManager();

local learning = {};

local function read()
    local source = data.learning_rate;
    local job, level = player.jobs();
    local out = { base = source.base, gear_bonus = 0, items = {}, notes = {}, observed_at = os.clock(),
        main_job_ok = job == source.main_job };
    if (type(job) ~= 'number' or job == 0 or type(level) ~= 'number' or level < 1) then
        out.reason = 'Your current job and gear could not be read.';
        return out;
    end
    if (level > 75) then
        out.reason = 'Learning bonuses above level 75 are not covered.';
        return out;
    end
    local inventory = memory:GetInventory();
    for slot = 0, 15 do
        local equipped = inventory:GetEquippedItem(slot);
        local index = equipped and equipped.Index or 0;
        local item_data = index ~= 0 and inventory:GetContainerItem(bit.rshift(index, 8), bit.band(index, 0xFF)) or nil;
        if (index ~= 0 and item_data == nil) then error('Equipped item is not readable.'); end
        local id = item_data and item_data.Id;
        local item = id and data.items[id];
        if (item and level >= item.level) then
            if (item.blue_learning) then
                out.gear_bonus = out.gear_bonus + item.blue_learning;
                out.items[#out.items + 1] = { id = id, name = item.name, bonus = item.blue_learning };
            end
            if (item.conditional_blue_learning) then
                out.uncertain = true;
                out.notes[#out.notes + 1] = 'A conditional learning bonus on your gear is not included.';
            end
        end
    end
    out.chance = 100 * math.max(0, math.min(source.outcomes, source.base + out.gear_bonus)) / source.outcomes;
    out.notes[#out.notes + 1] = 'Uses your currently equipped gear, not manual merit choices.';
    out.notes[#out.notes + 1] = 'This chance applies only when you meet the learning conditions.';
    out.notes[#out.notes + 1] = 'You still need Blue Mage as your main job, enough skill, the right distance, and credit for the kill.';
    return out;
end

function learning.read()
    local ok, out = pcall(read);
    if (ok) then return out; end
    return { notes = {}, reason = 'Your current job or learning bonuses could not be read.' };
end

return learning;
