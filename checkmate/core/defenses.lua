-- Conditional shield and parry rolls for ordinary incoming melee attacks.
local defenses = {};
local data;
local function source()
    data = data or require('data.defenses');
    return data;
end

local function clamp(value, low, high)
    return math.max(low, math.min(high, value));
end

local function chance(value)
    return clamp(math.floor(value * 100) / 100, 0, 100);
end

function defenses.block_rate(skill, attacker_skill, size, reprisal, reprisal_bonus, palisade)
    local base = source().shield_rates[size] or 0;
    local multiplier = 1;
    if (reprisal) then
        skill, multiplier = skill * 1.15, (reprisal_bonus or 0) > 0 and 3 or 1.5;
    end
    return chance(clamp((base + (skill - attacker_skill) * 0.2325 + (palisade or 0)) * multiplier, 5, 100));
end

function defenses.parry_rate(skill, attacker_skill, extra_parry, inquartata, issekigan)
    local delta = skill + (extra_parry or 0) - attacker_skill;
    local divisor = delta <= 5 and (36 / 9) or (60 / 9);
    local rate = clamp(math.floor(10 + (delta - 6) / divisor), 5, 25);
    return chance(rate + (inquartata or 0) + (issekigan or 0));
end

local function add(out, note)
    out.notes[#out.notes + 1] = note;
end

local function unknown(out, reason)
    out.low, out.high = nil, nil;
    out.uncertain = true;
    add(out, reason);
    return out;
end

local function unavailable(out, reason, status)
    out.eligible, out.unavailable_reason, out.status = false, reason, status;
    add(out, reason);
    return out;
end

local function interval(low, high)
    return low == high and tostring(low) or (tostring(low) .. '-' .. tostring(high));
end

local function job_rank(data, own, kind)
    local main = data.job_ranks[own.main_job];
    if (main == nil) then return nil; end
    if ((main[kind] or 0) > 0) then return main[kind]; end
    if ((own.sub_job or 0) == 0) then return 0; end
    local sub = data.job_ranks[own.sub_job];
    return sub and sub[kind] or nil;
end

local function gear(data, own, out, kind)
    local total = { parry_low = 0, parry_high = 0, inquartata = 0, palisade = 0, reprisal = 0 };
    local conditional, reduced = false, false;
    for slot = 0, 15 do
        local item = data.gear[(own.equipment or {})[slot]];
        if (item ~= nil) then
            if (own.level < item.level) then
                if ((kind == 'parry' and (item.parry or item.inquartata or item.conditional_parry))
                    or (kind == 'block' and (item.palisade or item.reprisal))) then reduced = true; end
            else
                total.parry_low = total.parry_low + (item.parry or 0);
                total.parry_high = total.parry_high + (item.parry or 0);
                total.inquartata = total.inquartata + (item.inquartata or 0);
                total.palisade = total.palisade + (item.palisade or 0);
                total.reprisal = total.reprisal + (item.reprisal or 0);
                local latent = item.conditional_parry;
                if (kind == 'parry' and latent ~= nil) then
                    total.parry_low = total.parry_low + latent.low;
                    total.parry_high = total.parry_high + latent.high;
                    conditional = true;
                end
            end
        end
    end
    if (conditional) then
        out.uncertain = true;
        add(out, 'Conditional parry bonuses on your gear are included as a range.');
    end
    if (reduced) then
        out.uncertain = true;
        add(out, 'Direct bonuses on gear above your current level are not included.');
    end
    return total;
end

function defenses.readout(own, mob, kind)
    local out = { notes = {}, observed_at = own and own.observed_at };
    if (kind == 'parry') then
        add(out, 'Chance for an eligible ordinary melee parry roll, not total damage avoidance. Face the attacker, be engaged, and be able to act.');
    else
        add(out, 'Chance for an eligible ordinary melee shield roll, not total damage avoidance. Face the attacker and be able to act.');
    end
    if (mob and mob.row and mob.row.no_swings) then
        return unavailable(out, 'This monster does not use ordinary melee attacks. Counters and special attacks have separate rules.', 'no_melee');
    end
    if (mob and mob.row and mob.row.tp_moves) then
        return unavailable(out, 'This monster uses TP moves instead of ordinary melee attacks. Those moves have separate defensive rules.', 'tp_moves');
    end
    if (own == nil or own.reason or own.level == nil or own.main_job == nil) then
        return unknown(out, own and own.reason or 'Your defensive inputs are not known.');
    end
    local data = source();
    local rank = job_rank(data, own, kind);
    if (rank == nil) then return unknown(out, 'Your job eligibility is not known.'); end
    if (rank == 0) then return unavailable(out, 'Your current jobs do not have this defensive skill.', 'job_unavailable'); end
    local shield;
    if (kind == 'block') then
        if (own.sub_id == nil or own.sub_id == 0) then return unavailable(out, 'Equip a shield to block.', 'no_shield'); end
        shield = data.shields[own.sub_id];
        if (shield == nil) then
            if (own.sub_shield_size == 0 or (own.sub_skill and own.sub_skill > 0 and own.sub_skill ~= 30)) then
                return unavailable(out, 'The item in your sub slot is not a shield.', 'no_shield');
            end
            return unknown(out, 'Your shield is not in the source data.');
        end
        if (data.shield_rates[shield.size] == nil) then return unknown(out, 'This shield size is not supported by the source data.'); end
        out.shield_name, out.shield_size = shield.name, shield.size;
        add(out, (shield.name or 'Shield'):gsub('_', ' ') .. ' (size ' .. shield.size .. ').');
    else
        if (own.main_id == nil or own.main_id == 0 or own.main_skill == 1) then
            return unavailable(out, 'Equip a weapon other than hand-to-hand to parry.', 'weapon_cannot_parry');
        end
        if (own.main_skill == nil) then return unknown(out, 'Your main-hand weapon could not be read.'); end
    end
    local skill = own.skills and own.skills[kind == 'block' and 30 or 31];
    if (skill == nil) then return unknown(out, 'Your defensive skill is not known.'); end
    out.eligible, out.skill = true, skill;
    local buffs = own.buffs or {};
    local direct = gear(data, own, out, kind);
    if (kind == 'block' and buffs[data.palisade_effect]) then
        out.uncertain = true;
        add(out, 'Palisade is active. Its hidden block-rate power is not included.');
    end
    if (kind == 'parry') then
        add(out, 'The client skill total and the source formula\'s separate direct parry bonus are counted.');
        if (own.has_augments or own.augments_unknown) then
            out.uncertain = true;
            add(out, own.has_augments and 'Your gear has augments. Their separate direct parry bonus is not known.'
                or 'Gear augment data could not be read. Any separate direct parry bonus is not known.');
        end
        if ((own.main_item_level or 0) > 0) then
            out.uncertain = true;
            add(out, 'Item-level parry bonuses are not included.');
        end
        if (buffs[data.issekigan_effect]) then
            out.uncertain = true;
            add(out, 'Issekigan is active. Its hidden parry-rate power is not included.');
        end
    elseif (buffs[data.reprisal_effect]) then
        add(out, 'Reprisal is included using its source skill and block-rate multipliers.');
    end
    for id, effect in pairs(data.unknown_effects or {}) do
        if (effect[kind] and buffs[id] and id ~= data.palisade_effect and id ~= data.issekigan_effect) then
            out.uncertain = true;
            add(out, effect.name .. ' is active. Its hidden bonus is not included.');
        end
    end
    for id, name in pairs(data.prevent_effects or {}) do
        if (buffs[id]) then
            add(out, name .. ' currently prevents the roll. The number is conditional on being able to act.');
            break;
        end
    end
    local low, high = mob and mob.low, mob and mob.high;
    if (type(low) ~= 'number' or type(high) ~= 'number' or low < 1 or high < low) then
        return unknown(out, 'The monster level is not known.');
    end
    local levels = mob.row and mob.row.levels;
    local found = false;
    for level = low, high do
        local stats = levels and levels[level];
        if (kind == 'parry' or stats ~= nil or levels == nil) then
            local attacker;
            if (kind == 'block') then attacker = stats and stats.attack_skill;
            else attacker = data.parry_caps[level]; end
            if (attacker == nil) then return unknown(out, 'The monster skill needed for this estimate is not known.'); end
            out.attacker_skill_low = out.attacker_skill_low and math.min(out.attacker_skill_low, attacker) or attacker;
            out.attacker_skill_high = out.attacker_skill_high and math.max(out.attacker_skill_high, attacker) or attacker;
            local first, last;
            if (kind == 'block') then
                first = defenses.block_rate(skill, attacker, shield.size, buffs[data.reprisal_effect], direct.reprisal, direct.palisade);
                last = first;
            else
                first = defenses.parry_rate(skill, attacker, direct.parry_low, direct.inquartata);
                last = defenses.parry_rate(skill, attacker, direct.parry_high, direct.inquartata);
            end
            out.low = out.low and math.min(out.low, first) or first;
            out.high = out.high and math.max(out.high, last) or last;
            found = true;
        end
    end
    if (not found) then return unknown(out, 'No source levels are available for this monster.'); end
    if (kind == 'block') then
        add(out, 'Monster weapon skill: ' .. interval(out.attacker_skill_low, out.attacker_skill_high) .. '.');
    else
        out.extra_parry_low, out.extra_parry_high = direct.parry_low, direct.parry_high;
        add(out, 'Monster comparison skill: ' .. interval(out.attacker_skill_low, out.attacker_skill_high)
            .. '. Separate gear bonus: ' .. interval(direct.parry_low, direct.parry_high) .. '.');
    end
    if (kind == 'block' and mob.row and mob.row.flags and mob.row.flags.scripted_attack_skill) then
        out.scripted, out.uncertain = true, true;
        add(out, 'The monster can change the weapon skill used by this estimate.');
    end
    add(out, 'Earlier avoidance and special attacks have separate rules.');
    return out;
end

return defenses;
