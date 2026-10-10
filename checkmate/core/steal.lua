--[[
    Lists what Steal can take and the chance of its roll. Eligibility is checked separately by the
    server, so a successful roll does not guarantee an item.

    thief.lua uses 50 + 2 * gear bonus + THF level - monster level, clamped to 0-100%.
    Rogue's Ring checks HP against base max HP before gear and food. Missing base HP or an active
    Level Sync leaves its bonus uncertain, so the chance covers the roll with and without it.
]]

local drops  = require('core.drops');
local player = require('core.player');
local data   = require('data.steal');

local steal = {};

-- The roll's base and what each point of Steal adds.
local BASE, PER_POINT = 50, 2;

-- A latent's "TP under 100%". TP runs 0 to 3000.
local TP_UNDER = 1000;

-- Your THF level, or nil when you can't use Steal: neither job is THF, or THF is under the level Steal comes at.
local function thf_level(main, main_level, sub, sub_level)
    local level = 0;
    if (main == data.ability.job) then
        level = main_level;
    elseif (sub == data.ability.job) then
        level = sub_level;
    end
    if (level < data.ability.level) then
        return nil;
    end
    return level;
end

--[[
    What you bring to a Steal, from your jobs and the gear you have on now, or nil when you can't use it.
    bonus is what your gear adds for sure. bonus_high includes a Ring bonus whose HP condition is unknown.
    Your gear is only read when you can use Steal, and HP and TP only with Rogue's Ring on at its level.
]]
function steal.you(main, main_level, sub, sub_level)
    local level = thf_level(main, main_level, sub, sub_level);
    if (level == nil) then
        return nil;
    end
    local bonus, possible = 0, 0;
    local hp, hp_max, tp, known, synced, reason;
    for _, id in ipairs(player.equipped_items()) do
        local item, latent = data.items[id], data.latents[id];
        if (item ~= nil and main_level >= item.level) then
            bonus = bonus + item.steal;
        end
        if (latent ~= nil and main_level >= latent.level) then
            if (hp == nil) then
                hp, hp_max, tp, known = player.hp_tp();
                if (known and tp < TP_UNDER) then synced = player.synced(); end
            end
            if (tp < TP_UNDER) then
                if (not known or synced) then
                    possible = possible + latent.steal;
                    reason = not known and "Rogue's Ring needs your base max HP before gear and food. It has not been received yet."
                        or "Level Sync can leave your base max HP out of date, so Rogue's Ring's HP condition is uncertain.";
                -- The server compares HP against base max HP in whole numbers.
                elseif (hp * 100 <= latent.hp_percent * hp_max) then
                    bonus = bonus + latent.steal;
                end
            end
        end
    end
    return { level = level, bonus = bonus, bonus_high = possible > 0 and (bonus + possible) or nil,
        notes = reason and { reason .. ' Its bonus may or may not apply.' } or nil };
end

-- Your chance in percent against a monster at `level`, 0 to 100.
function steal.chance(you, level, bonus)
    return math.max(0, math.min(100, BASE + PER_POINT * (bonus or you.bonus) + you.level - level));
end

--[[
    The Steal part for a data row, { items, ids, low, high, unknown }. items is the names of what Steal can take,
    and it's empty when there's nothing to steal. ids is the item id of each of them. `you` is what steal.you
    gave, and `low` and `high` are the levels the monster can be, nil when they aren't known. The low and high
    it returns are your chance at the monster's highest and lowest level, and unknown is true when you can use
    Steal but its level isn't known.
    With nothing to steal, or with `you` nil, there's no chance at all.
]]
function steal.readout(row, you, low, high)
    local items, ids = {}, {};
    for _, id in ipairs(row.steal or {}) do
        items[#items + 1] = drops.item_name(id);
        ids[#ids + 1] = id;
    end
    local out = { items = items, ids = ids };
    if (you == nil or #items == 0) then
        return out;
    end
    out.notes = you.notes;
    if (low == nil) then
        out.unknown = true;
    else
        out.low, out.high = steal.chance(you, high), steal.chance(you, low, you.bonus_high);
        out.uncertain = you.bonus_high ~= nil and out.low ~= out.high or nil;
        if (out.low == out.high) then out.notes = nil; end
    end
    return out;
end

return steal;
