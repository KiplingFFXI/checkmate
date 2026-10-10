-- The target's damage-type multipliers. Other damage reductions stay separate.
local weapons = {};

weapons.ORDER = { 'slashing', 'piercing', 'blunt', 'hand_to_hand' };
weapons.GENERAL = {
    { kind = 'physical', label = 'Melee damage', signed = true },
    { kind = 'ranged', label = 'Ranged damage', signed = true },
    { kind = 'absorb', label = 'Physical absorb' },
    { kind = 'nullify_physical', label = 'Melee nullify' },
    { kind = 'nullify_ranged', label = 'Ranged nullify' },
};
local NONE = {};

local function percent(value)
    return ('%+.2f'):format(value):gsub('0+$', ''):gsub('%.$', '') .. '%';
end

local function field(row, level, name)
    if (level ~= nil) then
        local stats = row.levels and row.levels[level] or NONE;
        return stats[name] or row[name] or NONE, false;
    end
    for _, stats in pairs(row.levels or NONE) do
        if (stats[name] ~= nil) then
            return NONE, true;
        end
    end
    return row[name] or NONE, false;
end

-- Percent is the signed change from neutral, before generic reductions or other damage math.
function weapons.readout(row, level)
    if (row == nil) then return nil; end
    local types, types_unknown = field(row, level, 'weapon_dmg');
    local guard, guard_unknown = field(row, level, 'weapon_guard');
    local out = { weak = {}, resists = {}, general = {}, notes = {}, context_notes = {},
        scripted = (row.flags or NONE).scripted_weapons == true };
    local function context(note)
        out.notes[#out.notes + 1] = note;
        out.context_notes[#out.context_notes + 1] = note;
    end
    for _, kind in ipairs(weapons.ORDER) do
        local value = types[kind] or 0;
        if (value ~= 0) then
            local list = value > 0 and out.weak or out.resists;
            list[#list + 1] = { kind = kind, percent = value };
        end
    end
    for _, entry in ipairs(weapons.GENERAL) do
        local value = guard[entry.kind];
        if (value ~= nil and ((entry.signed and value ~= 0) or (not entry.signed and value > 0))) then
            out.general[#out.general + 1] = { kind = entry.kind, label = entry.label, percent = value,
                signed = entry.signed == true };
        end
    end
    if (types_unknown or guard_unknown) then
        out.uncertain = true;
        context('Damage modifiers vary by level; the exact level is unknown.');
    end
    if (guard.physical ~= nil and guard.physical ~= 0) then
        out.notes[#out.notes + 1] = 'Normal melee damage taken ' .. percent(guard.physical) .. ' before damage type.';
    end
    if (guard.ranged ~= nil and guard.ranged ~= 0) then
        out.notes[#out.notes + 1] = 'Normal ranged damage taken ' .. percent(guard.ranged) .. ' before damage type.';
    end
    if (guard.absorb ~= nil and guard.absorb > 0) then
        out.notes[#out.notes + 1] = ('Physical damage absorption chance: %g%%.'):format(guard.absorb);
    end
    if (guard.nullify_physical ~= nil and guard.nullify_physical > 0) then
        out.notes[#out.notes + 1] = ('Normal melee damage nullification chance when not absorbed: %g%%.'):format(guard.nullify_physical);
    end
    if (guard.nullify_ranged ~= nil and guard.nullify_ranged > 0) then
        out.notes[#out.notes + 1] = ('Normal ranged damage nullification chance when not absorbed: %g%%.'):format(guard.nullify_ranged);
    end
    if (#out.weak == 0 and #out.resists == 0 and #out.notes == 0 and not out.scripted) then return nil; end
    context('Source baseline. Damage-type changes and general modifiers are separate, not final damage predictions.');
    context('Attack, defense, blocking, temporary shields and other effects are not included. Magical, hybrid and formless attacks can use different rules.');
    return out;
end

return weapons;
