-- Tests the real generated monster data. Every zone file has to load and have the shape the addon
-- reads, with each link list written once, grouped by how each one links, and each placeholder naming
-- an NM in the same file. Rows worked out by hand for the open world, NMs, placeholders, battlefields,
-- Limbus, Dynamis and Assault have to match, magic damage, steal items, jobs and what crit taken reads included,
-- and a /check of real monsters has to print through the addon. The pet, steal and crit data have to load too.
local bands    = require('data.bands');
local drops    = require('core.drops');
local monsters = require('core.monsters');
local printout = require('core.printout');
local wording  = require('core.wording');
local aggro    = require('core.aggro');

-- Every zone file ------------------------------------------------------------------------------

local IMMUNITY_ORDER = {};
for i, entry in ipairs(printout.IMMUNITIES) do IMMUNITY_ORDER[entry.id] = i; end
local RANKS = {};
for _, name in ipairs({ 'fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark', 'dark_sleep', 'light_sleep',
    'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow', 'poison', 'blind' }) do RANKS[name] = true; end
local FLAGS = { scripted_stats = true, scripted_drops = true, exp_only = true, scripted_aggro = true,
    scripted_elements = true, scripted_weapons = true, scripted_defense = true, scripted_attack_skill = true };
local ROW_KEYS = { name = true, ids = true, nm = true, levels = true, spawn_levels = true, level_mod = true, ranks = true, meva = true,
    resist = true, magic_dmg = true, absorb = true, nullify = true, undead = true, immune = true, drops = true, flags = true,
    aggro = true, any_level = true, no_aggro = true, detects = true, true_detect = true, ambush = true, aggro_note = true,
    aggro_hours = true, links = true, ph_for = true, ph_rules = true, loot_conditions = true, steal = true, job = true, crit = true, tp_moves = true,
    no_swings = true, counters = true, weapon_dmg = true, weapon_guard = true, info = true, info_by_index = true,
    link_families = true };
-- magic_dmg is a percent change from -100 to +200. absorb and nullify are chances up to 100. Each has
-- 'all' for every element and the eight elements.
local MAGIC_RANGES = { magic_dmg = { -100, 200 }, absorb = { 0, 100 }, nullify = { 0, 100 } };
local MAGIC_KEYS = { all = true, fire = true, ice = true, wind = true, earth = true, thunder = true, water = true, light = true,
    dark = true };
-- Aggro fields that are either true or left out, the order the data lists detection in, and the known notes.
local TRUE_ONLY = { 'aggro', 'any_level', 'no_aggro', 'true_detect', 'ambush' };
local DETECT_ORDER = { sight = 1, sound = 2, magic = 3, low_hp = 4, ability = 5 };
local AGGRO_NOTES = { sleeps = true, night_sight = true, form = true, apkallu = true, fomor_hate = true, underground = true };
local STATS = { 'acc', 'eva', 'agi', 'int', 'mnd', 'chr', 'dex', 'def', 'attack_skill' };

local function whole(v, low, high)
    return type(v) == 'number' and v == math.floor(v) and v >= low and v <= high;
end
local function numbers(t)
    if (type(t) ~= 'table') then return false; end
    for k, v in pairs(t) do
        if (type(k) ~= 'string' or type(v) ~= 'number') then return false; end
    end
    return true;
end
local function ranks_ok(t)
    if (type(t) ~= 'table') then return false; end
    for k, v in pairs(t) do
        if (not RANKS[k] or not whole(v, -3, 99)) then return false; end
    end
    return true;
end

-- The first problem with the magic damage fields of a row or one of its levels, or nil.
local function magic_problem(t)
    for field, range in pairs(MAGIC_RANGES) do
        if (t[field] ~= nil and (type(t[field]) ~= 'table' or next(t[field]) == nil)) then return 'empty ' .. field; end
        for k, v in pairs(t[field] or {}) do
            if (not MAGIC_KEYS[k] or type(v) ~= 'number' or v == 0 or v < range[1] or v > range[2]) then
                return ('bad %s %s'):format(field, tostring(k));
            end
        end
    end
    return nil;
end

local WEAPON_KEYS = { slashing = true, piercing = true, blunt = true, hand_to_hand = true };
local GUARD_KEYS = { physical = true, ranged = true, absorb = true, nullify_physical = true, nullify_ranged = true };
local function weapon_problem(t)
    for field, keys in pairs({ weapon_dmg = WEAPON_KEYS, weapon_guard = GUARD_KEYS }) do
        if (t[field] ~= nil and (type(t[field]) ~= 'table' or next(t[field]) == nil)) then return 'empty ' .. field; end
        for key, value in pairs(t[field] or {}) do
            if (not keys[key] or type(value) ~= 'number' or value == 0 or value ~= value or math.abs(value) == math.huge) then
                return 'bad ' .. field .. ' ' .. tostring(key);
            end
            if (field == 'weapon_guard' and key ~= 'physical' and key ~= 'ranged' and (value < 0 or value > 100)) then
                return 'bad weapon chance ' .. key;
            end
        end
    end
end

-- Monster facts must keep unknown inputs and per-spawn rules separate.
local INFO_IDS = { family = true, charm = true, vitals = true, movement = true, pursuit = true, spawn = true,
    claim = true, dangers = true, blue = true, fight = true, traits = true, crystal = true, rewards = true };
local VITAL_KEYS = { hp = true, mp = true, uncertain = true, hp_uncertain = true, mp_uncertain = true,
    hp_unknown = true, mp_unknown = true };
local BLUE_KEYS = { spells = true, incomplete = true, requirements = true };
local SPELL_KEYS = { id = true, name = true, level = true, min_skill = true, skill_ids = true };
local DANGER_KEYS = { entries = true, coverage = true, incomplete = true, reasons = true, general_notes = true };
local function text_list(list)
    if (type(list) ~= 'table') then return false; end
    local count = 0;
    for index, value in pairs(list) do
        count = count + 1;
        if (not whole(index, 1, #list) or type(value) ~= 'string' or value == '') then return false; end
    end
    return count == #list;
end
local danger_problem;
do
    local ENTRY_KEYS = { kind = true, id = true, name = true, summary = true, notes = true, categories = true,
        effects = true, details = true, level_ranges = true, forced = true };
    local DETAIL_KEYS = { shape = true, activation_range = true, effect_radius = true, cone_length = true,
        shadows = true, removals = true, notes = true, unknown = true };
    local SHADOW_KEYS = { mode = true, count = true, count_min = true, count_max = true, per_hit = true, legacy = true };
    local SHAPES = { ['single target'] = true, ['area around the monster'] = true, ['area around the target'] = true,
        ['front cone'] = true, ['rear cone'] = true };
    local CATEGORIES = { debuff = true, crit = true, dispel = true, drain = true, other = true };
    local function dense(list)
        if (type(list) ~= 'table') then return false; end
        local count = 0;
        for index in pairs(list) do
            count = count + 1;
            if (not whole(index, 1, #list)) then return false; end
        end
        return count == #list;
    end
    local function details_problem(details)
        if (type(details) ~= 'table') then return 'missing danger details'; end
        for key in pairs(details) do if (not DETAIL_KEYS[key]) then return 'unknown danger detail'; end end
        if (next(details) == nil) then return nil; end
        if (not text_list(details.notes) or not text_list(details.unknown)) then return 'bad danger detail notes'; end
        if (details.shape ~= nil and not SHAPES[details.shape]) then return 'bad danger shape'; end
        for _, key in ipairs({ 'activation_range', 'effect_radius', 'cone_length' }) do
            local value = details[key];
            if (value ~= nil and (type(value) ~= 'number' or value ~= value or value == math.huge or value < 0)) then
                return 'bad danger distance';
            end
        end
        if (details.shadows ~= nil) then
            if (not dense(details.shadows)) then return 'bad danger shadow list'; end
            for _, rule in ipairs(details.shadows) do
                if (type(rule) ~= 'table') then return 'bad danger shadow rule'; end
                for key in pairs(rule) do if (not SHADOW_KEYS[key]) then return 'unknown danger shadow field'; end end
                if (rule.mode ~= 'absorb' and rule.mode ~= 'wipe' and rule.mode ~= 'ignore') then return 'bad danger shadow mode'; end
                if (rule.per_hit ~= nil and type(rule.per_hit) ~= 'boolean') then return 'bad danger shadow hit flag'; end
                if (rule.legacy ~= nil and rule.legacy ~= true) then return 'bad danger shadow legacy flag'; end
                if (rule.mode == 'absorb') then
                    if (rule.count ~= nil) then
                        if (not whole(rule.count, 1, 998) or rule.count_min ~= nil or rule.count_max ~= nil) then
                            return 'bad danger shadow count';
                        end
                    elseif (not whole(rule.count_min, 1, 998) or not whole(rule.count_max, rule.count_min, 998)) then
                        return 'bad danger shadow range';
                    end
                elseif (rule.count ~= nil or rule.count_min ~= nil or rule.count_max ~= nil) then
                    return 'shadow count without absorption';
                end
            end
        end
        if (details.removals ~= nil) then
            if (not dense(details.removals) or #details.removals == 0) then return 'bad danger removal list'; end
            local seen = {};
            for _, removal in ipairs(details.removals) do
                if (type(removal) ~= 'table' or type(removal.effect) ~= 'string' or removal.effect == ''
                    or seen[removal.effect] or not text_list(removal.options) or #removal.options == 0) then
                    return 'bad danger removal';
                end
                for key in pairs(removal) do if (key ~= 'effect' and key ~= 'options') then return 'unknown danger removal field'; end end
                seen[removal.effect] = true;
            end
        end
    end
    danger_problem = function(section)
        if (not dense(section.entries) or not text_list(section.reasons) or not text_list(section.general_notes)) then
            return 'bad danger coverage lists';
        end
        local unresolved = #section.reasons > 0;
        local expected = unresolved and (#section.entries > 0 and 'partial' or 'unresolved') or 'resolved';
        if (section.coverage ~= expected or section.incomplete ~= unresolved) then return 'bad danger coverage'; end
        if (#section.entries == 0 and section.value ~= (unresolved and 'Move list unresolved' or 'No listed threats')) then
            return 'bad empty danger value';
        end
        local seen = {};
        for _, entry in ipairs(section.entries) do
            if (type(entry) ~= 'table') then return 'bad danger entry'; end
            for key in pairs(entry) do if (not ENTRY_KEYS[key]) then return 'unknown danger entry field'; end end
            if (entry.kind ~= 'skill' and entry.kind ~= 'spell' and entry.kind ~= 'fight' and entry.kind ~= 'attack') then return 'bad danger kind'; end
            if (((entry.kind == 'fight' or entry.kind == 'attack') and entry.id ~= 0)
                or (entry.kind ~= 'fight' and entry.kind ~= 'attack' and not whole(entry.id, 1, 65535))) then
                return 'bad danger ID';
            end
            local identity = entry.kind .. ':' .. entry.id;
            if (seen[identity]) then return 'duplicate danger ID'; end
            seen[identity] = true;
            if (type(entry.name) ~= 'string' or entry.name == '' or type(entry.summary) ~= 'string' or entry.summary == '') then
                return 'bad danger name or summary';
            end
            if (not text_list(entry.notes) or not text_list(entry.effects) or not text_list(entry.categories)
                or #entry.categories == 0) then return 'bad danger text lists'; end
            local categories = {};
            for _, category in ipairs(entry.categories) do
                if (not CATEGORIES[category] or categories[category]) then return 'bad danger category'; end
                categories[category] = true;
            end
            if (entry.forced ~= nil and (entry.forced ~= true or entry.kind == 'fight' or entry.kind == 'attack')) then return 'bad forced danger'; end
            if (entry.level_ranges ~= nil) then
                if (entry.kind ~= 'spell' or not dense(entry.level_ranges) or #entry.level_ranges == 0) then
                    return 'bad danger level ranges';
                end
                local last = -2;
                for _, range in ipairs(entry.level_ranges) do
                    if (not dense(range) or #range ~= 2 or not whole(range[1], 0, 255)
                        or not whole(range[2], range[1], 255) or range[1] <= last + 1) then return 'bad danger level range'; end
                    last = range[2];
                end
            end
            local problem = details_problem(entry.details);
            if (problem) then return problem; end
        end
    end;
end
local function info_sections_problem(sections, row, override)
    if (type(sections) ~= 'table' or next(sections) == nil) then return 'empty Monster sections'; end
    for id, entry in pairs(sections) do
        if (not INFO_IDS[id]) then return 'unknown Monster section ' .. tostring(id); end
        if (entry ~= false or not override) then
            if (type(entry) ~= 'table' or type(entry.value) ~= 'string' or entry.value == '') then
                return 'bad Monster value for ' .. id;
            end
            if (not text_list(entry.notes)) then return 'bad Monster notes for ' .. id; end
            for key in pairs(entry) do
                if (key ~= 'value' and key ~= 'notes' and not (id == 'vitals' and VITAL_KEYS[key])
                    and not (id == 'blue' and BLUE_KEYS[key]) and not (id == 'dangers' and DANGER_KEYS[key])) then return 'unknown Monster field ' .. id .. '.' .. tostring(key); end
            end
            if (id == 'vitals') then
                for _, key in ipairs({ 'hp', 'mp' }) do
                    if (type(entry[key]) ~= 'table') then return 'missing Monster ' .. key .. ' map'; end
                    for level, value in pairs(entry[key]) do
                        if (not whole(level, 1, 255) or row.levels[level] == nil or type(value) ~= 'number'
                            or value ~= value or value == math.huge or value < 0 or value ~= math.floor(value)) then
                            return 'bad Monster ' .. key .. ' at ' .. tostring(level);
                        end
                    end
                end
                for key in pairs(VITAL_KEYS) do
                    if (key ~= 'hp' and key ~= 'mp' and type(entry[key]) ~= 'boolean') then
                        return 'bad Monster uncertainty field ' .. key;
                    end
                end
            elseif (id == 'dangers') then
                local problem = danger_problem(entry);
                if (problem) then return problem; end
            elseif (id == 'blue') then
                if (entry.incomplete ~= nil and type(entry.incomplete) ~= 'boolean') then return 'bad Monster lesson completeness'; end
                if (entry.requirements ~= nil and not text_list(entry.requirements)) then return 'bad Monster learning requirements'; end
                if (entry.spells ~= nil) then
                    if (type(entry.spells) ~= 'table' or #entry.spells == 0) then return 'empty Monster spell list'; end
                    local count, seen = 0, {};
                    for index, spell in pairs(entry.spells) do
                        count = count + 1;
                        if (not whole(index, 1, #entry.spells) or type(spell) ~= 'table' or not whole(spell.id, 1, 1023)
                            or seen[spell.id] or type(spell.name) ~= 'string' or spell.name == '') then return 'bad Monster spell'; end
                        -- Job levels are bytes; minimum skill is the uint16 skill cap minus 31, floored at zero.
                        if (not whole(spell.level, 1, 255) or not whole(spell.min_skill, 0, 65504)) then
                            return 'bad Monster learning numbers';
                        end
                        for key in pairs(spell) do if (not SPELL_KEYS[key]) then return 'unknown Monster spell field'; end end
                        if (type(spell.skill_ids) ~= 'table' or #spell.skill_ids == 0) then return 'missing Monster move IDs'; end
                        local move_count, previous = 0, 0;
                        for index, number in pairs(spell.skill_ids) do
                            move_count = move_count + 1;
                            if (not whole(index, 1, #spell.skill_ids) or not whole(number, 1, 65535)) then return 'bad Monster move ID'; end
                        end
                        if (move_count ~= #spell.skill_ids) then return 'sparse Monster move IDs'; end
                        for _, number in ipairs(spell.skill_ids) do
                            if (number <= previous) then return 'unsorted or duplicate Monster move IDs'; end
                            previous = number;
                        end
                        seen[spell.id] = true;
                    end
                    if (count ~= #entry.spells) then return 'sparse Monster spell list'; end
                end
            end
        end
    end
end
local function info_problem(row)
    if (row.info ~= nil) then
        local problem = info_sections_problem(row.info, row, false);
        if (problem) then return problem; end
    end
    if (row.info_by_index ~= nil) then
        if (type(row.info_by_index) ~= 'table' or next(row.info_by_index) == nil) then return 'empty Monster overrides'; end
        local ids = {};
        for _, index in ipairs(row.ids) do ids[index] = true; end
        for index, sections in pairs(row.info_by_index) do
            if (not ids[index]) then return 'Monster override for another spawn'; end
            local problem = info_sections_problem(sections, row, true);
            if (problem) then return problem .. ' at spawn ' .. index; end
        end
    end
end

-- Check rejection paths as well as the generated file corpus.
do
    local row = { ids = { 1 }, levels = { [19] = {} }, info = { family = { value = 'Goblin', notes = {} } } };
    expect('Monster validator accepts a source section', info_problem(row), nil);
    row.info.other = { value = 'unknown', notes = {} };
    check('Monster validator rejects unknown section IDs', info_problem(row) ~= nil);
    row.info.other = nil;
    row.info.family.notes = { false };
    check('Monster validator rejects nontext notes', info_problem(row) ~= nil);
    row.info.family.notes = {};
    row.info.vitals = { value = 'Maximum estimate', notes = {}, hp = { [19] = math.huge }, mp = {},
        uncertain = true, hp_uncertain = true, mp_uncertain = true, hp_unknown = false, mp_unknown = true };
    check('Monster validator rejects nonfinite maximums', info_problem(row) ~= nil);
    row.info.vitals.hp[19] = 367;
    expect('Monster validator accepts a finite source level map', info_problem(row), nil);
    row.info.vitals.hp[20] = 400;
    check('Monster validator rejects maximums outside the row levels', info_problem(row) ~= nil);
    row.info.vitals = nil;
    row.info.blue = { value = 'Bomb Toss', notes = {}, spells = { { id = 1024, name = 'Bomb Toss', level = 28, min_skill = 56, skill_ids = { 590 } } } };
    check('Monster validator rejects invalid client spell IDs', info_problem(row) ~= nil);
    local blue = row.info.blue;
    local spell = blue.spells[1];
    spell.id = 605;
    blue.incomplete, blue.requirements = false, { 'The monster must use the move.' };
    expect('Monster validator accepts complete lesson metadata', info_problem(row), nil);
    for _, ids in ipairs({ {}, { 0 }, { 65536 }, { 1.5 }, { '590' }, { 590, 590 }, { 591, 590 }, { [2] = 590 }, { extra = 590 } }) do
        spell.skill_ids = ids;
        check('Monster validator rejects malformed move IDs', info_problem(row) ~= nil);
    end
    spell.skill_ids = nil;
    check('Monster validator requires move IDs for a Blue lesson', info_problem(row) ~= nil);
    spell.skill_ids = { 1, 590, 65535 };
    expect('Monster validator accepts sorted native move IDs', info_problem(row), nil);
    blue.incomplete = true;
    expect('Monster validator accepts incomplete lesson metadata', info_problem(row), nil);
    blue.incomplete = 'true';
    check('Monster validator rejects nonboolean lesson completeness', info_problem(row) ~= nil);
    blue.incomplete = false;
    for _, value in ipairs({ 'text', { false }, { '' }, { [2] = 'Sparse' }, { extra = 'Named key' } }) do
        blue.requirements = value;
        check('Monster validator rejects malformed learning requirements', info_problem(row) ~= nil);
    end
    blue.requirements = {};
    expect('Monster validator accepts an empty requirements list', info_problem(row), nil);
    for _, key in ipairs({ 'level', 'min_skill' }) do
        local saved = spell[key];
        for _, value in ipairs({ false, '10', -1, 1.5, math.huge, 0 / 0, key == 'level' and 256 or 65505 }) do
            spell[key] = value;
            check('Monster validator rejects invalid lesson ' .. key, info_problem(row) ~= nil);
        end
        spell[key] = nil;
        check('Monster validator requires lesson ' .. key, info_problem(row) ~= nil);
        spell[key] = saved;
    end
    spell.level, spell.min_skill = 1, 0;
    expect('Monster validator accepts the lowest lesson bounds', info_problem(row), nil);
    spell.level, spell.min_skill = 255, 65504;
    expect('Monster validator accepts the highest native lesson bounds', info_problem(row), nil);
    spell.level = 0;
    check('Monster validator rejects a zero spell level', info_problem(row) ~= nil);
    spell.level, spell.extra = 1, true;
    check('Monster validator still rejects unknown spell fields', info_problem(row) ~= nil);
    spell.extra, blue.extra = nil, true;
    check('Monster validator still rejects unknown Blue fields', info_problem(row) ~= nil);
    blue.extra, blue.spells = nil, nil;
    blue.incomplete, blue.value = true, 'Unknown';
    expect('Monster validator accepts unresolved lessons without a fake list', info_problem(row), nil);
    blue.incomplete, blue.requirements, blue.value = nil, nil, 'No learnable Blue spells';
    expect('Monster validator accepts resolved no-lesson metadata', info_problem(row), nil);
    row.info.family.incomplete = true;
    check('Monster validator rejects Blue-only fields on another section', info_problem(row) ~= nil);
    row.info.family.incomplete = nil;
    row.info.blue = nil;
    row.info_by_index = { [2] = { family = false } };
    check('Monster validator rejects an override for another spawn', info_problem(row) ~= nil);
    row.info_by_index = { [1] = { family = false } };
    expect('Monster validator accepts explicit per-spawn suppression', info_problem(row), nil);
end

-- Dangers keep their filtering fields, coverage and source details explicit.
do
    local entry = { kind = 'spell', id = 220, name = 'Poison', summary = 'Poison: Poison', notes = {},
        categories = { 'debuff' }, effects = { 'Poison' }, level_ranges = { { 1, 20 }, { 30, 40 } },
        details = { shape = 'single target', activation_range = 20, notes = {}, unknown = {},
            shadows = { { mode = 'absorb', count = 1, per_hit = false } },
            removals = { { effect = 'Poison', options = { 'Poisona' } } } } };
    local section = { value = entry.summary, notes = {}, entries = { entry }, reasons = {}, general_notes = {},
        coverage = 'resolved', incomplete = false };
    local row = { ids = { 1 }, levels = { [19] = {} }, info = { dangers = section } };
    expect('Dangers validator accepts structured source metadata', info_problem(row), nil);
    for _, field in ipairs({ 'entries', 'reasons', 'general_notes' }) do
        local saved = section[field];
        section[field] = { [2] = saved[1] or 'Sparse' };
        check('Dangers validator rejects sparse ' .. field, info_problem(row) ~= nil);
        section[field] = saved;
    end
    section.coverage = 'partial';
    check('Dangers validator rejects false partial coverage', info_problem(row) ~= nil);
    section.reasons, section.incomplete = { 'A move list changes.' }, true;
    expect('Dangers validator accepts known threats with unresolved moves', info_problem(row), nil);
    section.entries, section.coverage, section.value = {}, 'unresolved', 'Move list unresolved';
    expect('Dangers validator accepts unresolved empty coverage', info_problem(row), nil);
    section.reasons, section.incomplete, section.coverage, section.value = {}, false, 'resolved', 'No listed threats';
    expect('Dangers validator accepts resolved empty coverage', info_problem(row), nil);
    section.entries, section.value = { entry }, entry.summary;
    section.entries[2] = entry;
    check('Dangers validator rejects duplicate move identities', info_problem(row) ~= nil);
    section.entries[2] = nil;
    for _, key in ipairs({ 'extra', 'skill_ids' }) do
        entry[key] = true;
        check('Dangers validator rejects unknown entry fields', info_problem(row) ~= nil);
        entry[key] = nil;
    end
    for _, categories in ipairs({ {}, { 'safe' }, { 'debuff', 'debuff' }, { [2] = 'debuff' } }) do
        entry.categories = categories;
        check('Dangers validator rejects malformed categories', info_problem(row) ~= nil);
    end
    entry.categories = { 'debuff', 'crit' };
    for _, ranges in ipairs({ {}, { { 20, 1 } }, { { 1, 256 } }, { { 1, 20 }, { 20, 30 } }, { { 1, 20 }, { 21, 30 } } }) do
        entry.level_ranges = ranges;
        check('Dangers validator rejects malformed level ranges', info_problem(row) ~= nil);
    end
    entry.level_ranges, entry.forced = nil, true;
    expect('Dangers validator accepts an explicit cast outside ordinary spell ranges', info_problem(row), nil);
    entry.forced = false;
    check('Dangers validator rejects false forced flags', info_problem(row) ~= nil);
    entry.forced = nil;
    for _, key in ipairs({ 'activation_range', 'effect_radius', 'cone_length' }) do
        local saved = entry.details[key];
        for _, value in ipairs({ -1, math.huge, 0 / 0, '20' }) do
            entry.details[key] = value;
            check('Dangers validator rejects invalid ' .. key, info_problem(row) ~= nil);
        end
        entry.details[key] = saved;
    end
    entry.details.extra = true;
    check('Dangers validator rejects unknown detail fields', info_problem(row) ~= nil);
    entry.details.extra = nil;
    entry.details.shadows[1].count = 0;
    check('Dangers validator rejects an empty absorption count', info_problem(row) ~= nil);
    entry.details.shadows[1] = { mode = 'absorb', count_min = 1, count_max = 3, legacy = true };
    expect('Dangers validator accepts a bounded random shadow check', info_problem(row), nil);
    entry.details.shadows[1].count = 1;
    check('Dangers validator rejects simultaneous fixed and random shadow counts', info_problem(row) ~= nil);
    entry.details.shadows[1] = { mode = 'wipe', count = 1 };
    check('Dangers validator rejects absorption counts on a wipe', info_problem(row) ~= nil);
    entry.details.shadows = {};
    entry.details.removals[1].options = {};
    check('Dangers validator rejects an empty removal list', info_problem(row) ~= nil);
    entry.details.removals[1].options = { 'Poisona' };
    entry.details.removals[1].extra = true;
    check('Dangers validator rejects unknown removal fields', info_problem(row) ~= nil);
    entry.details.removals = nil;
    entry.kind, entry.id, entry.details = 'fight', 0, {};
    expect('Dangers validator accepts a reviewed fight summary', info_problem(row), nil);
    entry.kind = 'attack';
    expect('Dangers validator accepts ordinary attack effects with their own identity', info_problem(row), nil);
    entry.id = 1;
    check('Dangers validator rejects fabricated ordinary attack IDs', info_problem(row) ~= nil);
end

local LINK_WAY = {};
for _, way in ipairs(aggro.LINK_WAYS) do LINK_WAY[way] = true; end

-- The first problem with a list of link groups, or nil. It's keyed by how they link, and each group is
-- names sorted and each once.
local function groups_problem(list)
    if (type(list) ~= 'table' or next(list) == nil) then return 'no groups'; end
    for way, names in pairs(list) do
        if (not LINK_WAY[way]) then return 'a group called ' .. tostring(way); end
        if (type(names) ~= 'table' or #names == 0) then return 'an empty ' .. way .. ' group'; end
        local before = '';
        for _, name in ipairs(names) do
            if (type(name) ~= 'string' or name <= before) then return way .. ' names not sorted, distinct names'; end
            before = name;
        end
    end
    return nil;
end

-- The first problem with a file's link lists, or nil. Each list is written once, numbered from 1,
-- and is some row's.
local function link_lists_problem(file)
    local lists, used, seen, names = file.link_lists, {}, {}, {};
    if (type(lists) ~= 'table') then return 'no link_lists'; end
    for _, row in ipairs(file.monsters) do
        if (row.links ~= nil) then
            if (type(row.links) ~= 'number' or lists[row.links] == nil) then return 'a row names no list'; end
            used[row.links] = true;
        end
    end
    local count = 0;
    for number, list in pairs(lists) do
        count = count + 1;
        if (type(list) ~= 'table' or not used[number]) then return 'list ' .. tostring(number) .. ' is no row\'s'; end
        local problem = groups_problem(list);
        if (problem) then return 'list ' .. number .. ': ' .. problem; end
        for _, group in pairs(list) do for _, name in ipairs(group) do names[name] = true; end end
        local key = {};
        for _, way in ipairs(aggro.LINK_WAYS) do
            if (list[way] ~= nil) then key[#key + 1] = way .. ':' .. table.concat(list[way], '|'); end
        end
        key = table.concat(key, ' ');
        if (seen[key]) then return 'list ' .. number .. ' is written twice'; end
        seen[key] = true;
    end
    if (count ~= #lists) then return 'lists not numbered from 1'; end
    if (file.link_families ~= nil) then
        if (type(file.link_families) ~= 'table') then return 'bad link family map'; end
        for name, family in pairs(file.link_families) do
            if (not names[name] or type(family) ~= 'table' or not whole(family.id, 1, 65535)
                or type(family.name) ~= 'string' or family.name == '') then
                return 'bad link family for ' .. tostring(name);
            end
            for key in pairs(family) do
                if (key ~= 'id' and key ~= 'name') then return 'unknown link family field'; end
            end
        end
    end
    return nil;
end

-- The first problem with a row's aggro and links, or nil.
local function aggro_problem(row)
    for _, key in ipairs(TRUE_ONLY) do
        if (row[key] ~= nil and row[key] ~= true) then return key .. ' not true'; end
    end
    if (row.aggro and row.no_aggro) then return 'aggro and no_aggro'; end
    if (not row.aggro and (row.any_level or row.detects or row.true_detect or row.ambush)) then
        return 'how it aggroes on a monster that isn\'t aggressive';
    end
    local last = 0;
    for _, id in ipairs(row.detects or {}) do
        local at = DETECT_ORDER[id];
        if (at == nil or at <= last) then return 'detects unknown or out of order'; end
        last = at;
    end
    if (row.detects ~= nil and #row.detects == 0) then return 'empty detects'; end
    if (row.aggro_note ~= nil and not AGGRO_NOTES[row.aggro_note]) then return 'unknown aggro_note'; end
    local hours = row.aggro_hours;
    if (hours ~= nil and (row.aggro_note ~= 'sleeps' or #hours ~= 2 or not whole(hours[1], 0, 23)
        or not whole(hours[2], 0, 23))) then
        return 'bad aggro_hours';
    end
    if (row.links ~= nil and (type(row.links) ~= 'table' or next(row.links) == nil)) then return 'empty links'; end
    if (row.links ~= nil and groups_problem(row.links)) then return 'links: ' .. groups_problem(row.links); end
    return nil;
end

-- The first problem with a row's spawn_levels, or nil. Each entry is one of its spawns, narrower than
-- the row's range, and starts and ends on levels the row has.
local function spawn_levels_problem(row)
    if (row.spawn_levels == nil) then return nil; end
    local ids, low, high = {}, nil, nil;
    for _, id in ipairs(row.ids) do ids[id] = true; end
    for level in pairs(row.levels) do low, high = math.min(low or level, level), math.max(high or level, level); end
    local count = 0;
    for index, range in pairs(row.spawn_levels) do
        count = count + 1;
        if (not ids[index]) then return 'a spawn range for an index not in ids'; end
        if (type(range) ~= 'table' or #range ~= 2 or not whole(range[1], 1, 255) or not whole(range[2], range[1], 255)) then
            return 'bad spawn range at ' .. tostring(index);
        end
        if (row.levels[range[1]] == nil or row.levels[range[2]] == nil) then return 'a spawn range ends off the row\'s levels'; end
        if (range[1] == low and range[2] == high) then return 'a spawn range that is the row\'s whole range'; end
    end
    if (count == 0) then return 'empty spawn_levels'; end
    return nil;
end

-- The first problem with a row's ph_for, or nil. Each entry is one of its spawns, and each NM it names is the
-- spawn index of another monster in the same file. by_index is the file's rows by spawn index.
local function ph_for_problem(row, by_index)
    if (row.ph_for == nil) then return nil; end
    local ids, count = {}, 0;
    for _, id in ipairs(row.ids) do ids[id] = true; end
    for index, nms in pairs(row.ph_for) do
        count = count + 1;
        if (not ids[index]) then return 'a PH index not in ids'; end
        if (type(nms) ~= 'table' or #nms == 0) then return 'no NM for PH ' .. tostring(index); end
        for _, nm in ipairs(nms) do
            if (nm == index or by_index[nm] == nil) then return ('PH %d names %s, which is no row\'s'):format(index, tostring(nm)); end
        end
    end
    for index, rules in pairs(row.ph_rules or {}) do
        if (row.ph_for[index] == nil) then return 'PH rules without PH identity'; end
        for nm, rule in pairs(rules) do
            local found = false;
            for _, target in ipairs(row.ph_for[index]) do if (target == nm) then found = true; end end
            if (not found) then return 'PH rules name another NM'; end
            if (rule.chance ~= nil and (type(rule.chance) ~= 'number' or rule.chance < 0 or rule.chance > 100)) then
                return 'bad lottery chance';
            end
            if (rule.cooldown_min ~= nil and (not whole(rule.cooldown_min, 0, 604800)
                or not whole(rule.cooldown_max, rule.cooldown_min, 604800))) then return 'bad lottery cooldown'; end
            for _, note in ipairs(rule.conditions or {}) do if (type(note) ~= 'string') then return 'bad PH condition'; end end
        end
    end
    if (count == 0) then return 'empty ph_for'; end
    return nil;
end

-- The first problem with a row, or nil.
local function row_problem(row)
    for key in pairs(row) do
        if (not ROW_KEYS[key]) then return 'unknown key ' .. tostring(key); end
    end
    if (row.ph_rules ~= nil and row.ph_for == nil) then return 'PH rules without PHs'; end
    for _, note in ipairs(row.loot_conditions or {}) do
        if (type(note) ~= 'string' or note == '') then return 'bad loot condition'; end
    end
    if (type(row.name) ~= 'string' or row.name == '') then return 'no name'; end
    if (type(row.ids) ~= 'table') then return 'no ids'; end
    for _, id in ipairs(row.ids) do
        if (not whole(id, 1, 0x7FF)) then return 'bad id ' .. tostring(id); end
    end
    if (type(row.levels) ~= 'table') then return 'no levels'; end
    for level, stats in pairs(row.levels) do
        if (not whole(level, 1, 255)) then return 'bad level ' .. tostring(level); end
        for _, key in ipairs(STATS) do
            if (not whole(stats[key], 0, 9999)) then return ('level %d has no %s'):format(level, key); end
        end
        if (stats.ranks ~= nil and not ranks_ok(stats.ranks)) then return 'bad ranks at ' .. level; end
        if ((stats.meva ~= nil and not numbers(stats.meva)) or (stats.resist ~= nil and not numbers(stats.resist))) then
            return 'bad meva or resist at ' .. level;
        end
        if (magic_problem(stats)) then return magic_problem(stats) .. ' at ' .. level; end
        if (weapon_problem(stats)) then return weapon_problem(stats) .. ' at ' .. level; end
    end
    if ((row.nm ~= nil and row.nm ~= true) or (row.undead ~= nil and row.undead ~= true)) then
        return 'nm or undead not true';
    end
    if (row.level_mod ~= nil and not whole(row.level_mod, -10, 10)) then return 'bad level_mod'; end
    if (row.crit ~= nil and not whole(row.crit, 1, 100)) then return 'bad crit'; end
    if ((row.tp_moves ~= nil and row.tp_moves ~= true) or (row.no_swings ~= nil and row.no_swings ~= true)) then
        return 'tp_moves or no_swings not true';
    end
    if (row.counters ~= nil and (row.counters ~= true or not (row.tp_moves or row.no_swings))) then
        return 'counters not true, or not on a tp_moves or no_swings row';
    end
    if (row.ranks ~= nil and not ranks_ok(row.ranks)) then return 'bad ranks'; end
    if ((row.meva ~= nil and not numbers(row.meva)) or (row.resist ~= nil and not numbers(row.resist))) then
        return 'bad meva or resist';
    end
    if (magic_problem(row)) then return magic_problem(row); end
    if (weapon_problem(row)) then return weapon_problem(row); end
    local last = 0;
    for _, id in ipairs(row.immune or {}) do
        local at = IMMUNITY_ORDER[id];
        if (at == nil) then return 'unknown immunity ' .. tostring(id); end
        if (at <= last) then return 'immunities out of display order'; end
        last = at;
    end
    for _, roll in ipairs(row.drops or {}) do
        if (not whole(roll.rate, 1, 1000)) then return 'bad drop rate'; end
        if (roll.item ~= nil) then
            if (not whole(roll.item, 0, 65535)) then return 'bad item'; end
        elseif (type(roll.group) == 'table' and #roll.group > 0) then
            for _, member in ipairs(roll.group) do
                if (not whole(member[1], 0, 65535) or not whole(member[2], 1, 1000000)) then return 'bad group member'; end
            end
        else
            return 'a drop with no item or group';
        end
    end
    if (row.steal ~= nil) then
        if (type(row.steal) ~= 'table' or #row.steal == 0) then return 'empty steal'; end
        local seen = {};
        for _, id in ipairs(row.steal) do
            if (not whole(id, 1, 65534) or seen[id]) then return 'bad or repeated steal item'; end
            seen[id] = true;
        end
    end
    for key, value in pairs(row.flags or {}) do
        if (not FLAGS[key] or value ~= true) then return 'bad flag ' .. tostring(key); end
    end
    return spawn_levels_problem(row) or aggro_problem(row) or info_problem(row);
end

local files, rows, problems, taken = 0, 0, {}, {};
local ranged_rows, spawn_ranges, lists, linked_rows = 0, 0, 0, 0;
local ph_rows, ph_spawns, ph_zones = 0, 0, {};
local zones, ways_used = {}, {};
for _, path in ipairs(ADDON_FILES) do
    local zone = tonumber(path:match('^data/zones/(%d+)%.lua$'));
    if (zone ~= nil) then
        files = files + 1;
        local chunk, err = loadfile(ADDON_DIR .. '/' .. path);
        local ok, file = pcall(chunk or error, err);
        if (not ok or type(file) ~= 'table' or type(file.monsters) ~= 'table') then
            problems[#problems + 1] = ('%s does not load: %s'):format(path, tostring(file));
        else
            zones[zone] = file;
            if (file.built ~= bands.built or file.content ~= bands.content) then
                problems[#problems + 1] = path .. ' has another build stamp';
            end
            if (type(file.by_name) ~= 'table') then problems[#problems + 1] = path .. ' has no by_name'; end
            local problem = link_lists_problem(file);
            if (problem) then problems[#problems + 1] = path .. ': ' .. problem; end
            lists = lists + #(file.link_lists or {});
            for _, list in ipairs(file.link_lists or {}) do
                for way in pairs(list) do ways_used[way] = true; end
            end
            for _, row in ipairs(file.monsters) do linked_rows = linked_rows + (row.links and 1 or 0); end
            monsters.resolve_links(file);
            local seen, by_index = {}, {};
            for _, row in ipairs(file.monsters) do
                for _, id in ipairs(row.ids or {}) do by_index[id] = row; end
            end
            for number, row in ipairs(file.monsters) do
                rows = rows + 1;
                local problem = row_problem(row) or ph_for_problem(row, by_index);
                if (problem) then
                    problems[#problems + 1] = ('%s row %d (%s): %s'):format(path, number, tostring(row.name), problem);
                end
                for _, id in ipairs(row.ids or {}) do
                    if (seen[id]) then taken[#taken + 1] = ('%d:%d %s / %s'):format(zone, id, seen[id], row.name); end
                    seen[id] = row.name;
                end
                if (type(row.spawn_levels) == 'table') then
                    ranged_rows = ranged_rows + 1;
                    for _ in pairs(row.spawn_levels) do spawn_ranges = spawn_ranges + 1; end
                end
                if (type(row.ph_for) == 'table') then
                    ph_rows, ph_zones[zone] = ph_rows + 1, true;
                    for _ in pairs(row.ph_for) do ph_spawns = ph_spawns + 1; end
                end
            end
        end
    end
end
check('164 zone files', files == 164, files);
check('every row has the shape the addon reads', #problems == 0, table.concat(problems, '\n     ', 1, math.min(#problems, 10)));
check('about 6,000 rows', rows >= 6000, rows);
check('about 700 rows keep about 11,000 spawns\' own ranges', ranged_rows >= 650 and spawn_ranges >= 10000,
    ranged_rows .. ' rows, ' .. spawn_ranges .. ' spawns');
check('no spawn index is in two rows of one zone', #taken == 0, table.concat(taken, ', ', 1, math.min(#taken, 10)));
-- 283 placeholder spawns in 182 rows at 465ac4c076. Too many means the reader took list entries Phoenix never rolls.
check('about 180 rows hold about 280 placeholders', ph_rows >= 170 and ph_rows <= 200 and ph_spawns >= 270
    and ph_spawns <= 300, ph_rows .. ' rows, ' .. ph_spawns .. ' spawns');
local dynamis_ph = {};
for _, zone in ipairs({ 39, 40, 41, 42, 134, 135, 185, 186, 187, 188 }) do
    if (ph_zones[zone]) then dynamis_ph[#dynamis_ph + 1] = zone; end
end
check('no Dynamis monster is a placeholder, since Phoenix\'s Dynamis replaces its despawn', #dynamis_ph == 0,
    table.concat(dynamis_ph, ', '));
check('about 3,500 rows link, through about 1,850 link lists', linked_rows >= 3400 and lists <= 1950,
    linked_rows .. ' rows, ' .. lists .. ' lists');
local unused = {};
for _, way in ipairs(aggro.LINK_WAYS) do
    if (not ways_used[way]) then unused[#unused + 1] = way; end
end
check('every way of linking shows up somewhere in the data', #unused == 0, table.concat(unused, ', '));

local not_ascii = {};
local PNG_FILES = { ['assets/weapons/Blunt.png'] = true, ['assets/weapons/H2H.png'] = true,
    ['assets/weapons/Piercingv2.png'] = true, ['assets/weapons/Slashing.png'] = true };
local png_count, invalid_png = 0, {};
for _, path in ipairs(ADDON_FILES) do
    local f = io.open(ADDON_DIR .. '/' .. path, 'rb');
    local text = f:read('*a');
    f:close();
    if (PNG_FILES[path]) then
        png_count = png_count + 1;
        if (text:sub(1, 8) ~= '\137PNG\13\10\26\10') then invalid_png[#invalid_png + 1] = path; end
    elseif (text:find('[^\9\10\13\32-\126]')) then
        table.insert(not_ascii, path);
    end
end
check('every addon source and data file is plain ASCII', #not_ascii == 0, table.concat(not_ascii, ', '));
check('the four bundled weapon icons are PNG files', png_count == 4 and #invalid_png == 0, table.concat(invalid_png, ', '));

-- The level band file.
check('bands has 86 levels', #bands.rows == 86, #bands.rows);
local b75;
for _, row in ipairs(bands.rows) do if (row[1] == 75) then b75 = row; end end
check('the level 75 band', b75 and table.concat(b75, ',') == '75,313,321,279,304,66,82,74,86');
local dex_ok = true;
for _, each in ipairs(bands.rows) do
    dex_ok = dex_ok and #each == 9 and whole(each[8], 0, 999) and whole(each[9], each[8], 999);
end
check('every level has its DEX low and high last', dex_ok);

-- The pet file.
local pets = require('data.pets');
check('pets has the data\'s stamp', pets.built == bands.built and pets.content == bands.content);
local jug_count, jug_levels = 0, true;
for _, level in pairs(pets.jugs) do
    jug_count = jug_count + 1;
    jug_levels = jug_levels and whole(level, 1, 255);
end
check('98 jug pets, each with a whole level', jug_count == 98 and jug_levels, jug_count);
check('CourierCarrie tops out at 75 and FunguarFamiliar at 65', pets.jugs['CourierCarrie'] == 75
    and pets.jugs['FunguarFamiliar'] == 65);
local avatar_count, both = 0, {};
for name in pairs(pets.avatars) do
    avatar_count = avatar_count + 1;
    if (pets.jugs[name] ~= nil) then both[#both + 1] = name; end
end
check('22 avatars and spirits, none named like a jug pet', avatar_count == 22 and #both == 0,
    avatar_count .. ' ' .. table.concat(both, ', '));
check('Carbuncle, Ifrit, FireSpirit, Cait Sith and Siren among them', pets.avatars['Carbuncle'] and pets.avatars['Ifrit']
    and pets.avatars['FireSpirit'] and pets.avatars['Cait Sith'] and pets.avatars['Siren']);
local gloves, gloves_plus = pets.jug_range_items[15110], pets.jug_range_items[14917];
check('Monster Gloves and Monster Gloves +1 each narrow a jug pet\'s level by one, from level 75', gloves.cut == 1
    and gloves.level == 75 and gloves_plus.cut == 1 and gloves_plus.level == 75);
check('Beast Affinity is merit 2564, 2 levels a merit, up to 3 merits', pets.beast_affinity.id == 2564
    and pets.beast_affinity.per_merit == 2 and pets.beast_affinity.most == 3);

-- The steal file.
local steal_data = require('data.steal');
check('steal has the data\'s stamp', steal_data.built == bands.built and steal_data.content == bands.content);
check('Steal is THF\'s from level 5', steal_data.ability.job == 6 and steal_data.ability.level == 5);
local era_gear, late_gear, gear_ok = 0, 0, true;
for _, item in pairs(steal_data.items) do
    gear_ok = gear_ok and whole(item.steal, 1, 99) and whole(item.level, 1, 99);
    if (item.level <= 75) then era_gear = era_gear + 1; else late_gear = late_gear + 1; end
end
check('13 pieces of gear add Steal by level 75, and 12 more at level 99', gear_ok and era_gear == 13 and late_gear == 12,
    era_gear .. ' and ' .. late_gear);
local function gear_is(id, add, level)
    local item = steal_data.items[id];
    return item ~= nil and item.steal == add and item.level == level;
end
check('Rabbit Charm adds 1 from 7, Btm. Knife 2 from 71 and Asn. Culottes +1 5 from 75', gear_is(13112, 1, 7)
    and gear_is(17623, 2, 71) and gear_is(15585, 5, 75));
local ring, latent_count = steal_data.latents[13291], 0;
for _ in pairs(steal_data.latents) do latent_count = latent_count + 1; end
check('Rogue\'s Ring is the one latent, 3 from 50 while your HP is 75% or less', latent_count == 1 and ring ~= nil
    and ring.steal == 3 and ring.level == 50 and ring.hp_percent == 75 and steal_data.items[13291] == nil);

-- The crit file.
local crit_data = require('data.crit');
check('crit has the data\'s stamp', crit_data.built == bands.built and crit_data.content == bands.content);
local hit_rate, enemy_rate = crit_data.merits.crit_hit_rate, crit_data.merits.enemy_crit_rate;
check('Critical Hit Rate is merit 324 and Enemy Critical Hit Rate 326, each 1% a merit, up to 4', hit_rate.id == 324
    and hit_rate.per_merit == 1 and hit_rate.most == 4 and enemy_rate.id == 326 and enemy_rate.per_merit == 1
    and enemy_rate.most == 4);
local caps = {};
for _, step in ipairs(crit_data.level_caps) do caps[#caps + 1] = step[1] .. ':' .. step[2]; end
expect('the merits that count from each main level', table.concat(caps, ' '),
    '0:0 10:1 20:2 30:3 40:4 50:5 55:6 60:7 65:8 70:9 75:10 80:15');
local era_pieces, late_pieces, pieces_ok = 0, 0, true;
for _, item in pairs(crit_data.evasion_items) do
    pieces_ok = pieces_ok and whole(item.crit_evasion, -100, 100) and item.crit_evasion ~= 0 and whole(item.level, 1, 99);
    if (item.level <= 75) then era_pieces = era_pieces + 1; else late_pieces = late_pieces + 1; end
end
check('4 pieces of gear change the crits you take by level 75, and 11 more above it', pieces_ok and era_pieces == 4
    and late_pieces == 11, era_pieces .. ' and ' .. late_pieces);
local function evasion_is(id, amount, level)
    local item = crit_data.evasion_items[id];
    return item ~= nil and item.crit_evasion == amount and item.level == level;
end
check('Van Pendant takes 1 off from 14, Safety Mantle 2 from 51, Warrior\'s Stone 2 from 70, and Toreador\'s Cape adds '
    .. '50 from 72', evasion_is(15503, 1, 14) and evasion_is(15463, 2, 51) and evasion_is(15871, 2, 70)
    and evasion_is(15465, -50, 72));

-- Rows worked out by hand ------------------------------------------------------------------------

local function find(zone, name, index)
    for _, row in ipairs((zones[zone] or {}).monsters or {}) do
        local match = row.name == name;
        if (match and index ~= nil) then
            match = false;
            for _, id in ipairs(row.ids) do match = match or id == index; end
        end
        if (match) then return row; end
    end
    return nil;
end
local function stats_are(row, level, acc, eva, agi, int, mnd, chr)
    local st = row and row.levels[level];
    if (st == nil) then return false; end
    return st.acc == acc and st.eva == eva and (agi == nil or (st.agi == agi and st.int == int and st.mnd == mnd and st.chr == chr));
end
local function levels_of(row)
    local list = {};
    for level in pairs(row and row.levels or {}) do list[#list + 1] = level; end
    table.sort(list);
    return table.concat(list, ',');
end
local function immune_of(row)
    return table.concat(row and row.immune or {}, ',');
end
-- Each item's chance in whole percent at Treasure Hunter `th`, rounded.
local function chance(row, item, th)
    return math.floor((drops.chances(row.drops, th)[item] or 0) * 1000 + 0.5) / 10;
end

-- Open world.
local row = find(101, 'Goblin Thug', 146);
check('Goblin Thug, East Ronfaure, level 3', stats_are(row, 3, 18, 17, 10, 9, 6, 6));
row = find(103, 'Fire Elemental');
check('Fire Elemental, Valkurm Dunes, level 38', stats_are(row, 38, 135, 121, 37, 43, 34, 34));
check('and its immunities and ranks', immune_of(row) == 'bind,paralyze' and row.ranks.fire == 11 and row.ranks.water == -3);
row = find(107, 'Leaping Lizzy');
check('Leaping Lizzy, level 10', row and row.nm and stats_are(row, 10, 41, 37, 15, 11, 11, 12));
check('Leaping Lizzy at TH 0 is 24, 15 and 10%', chance(row, 926, 0) == 24 and chance(row, 15351, 0) == 15 and chance(row, 852, 0) == 10);
check('and 64, 45 and 18% at TH 4', chance(row, 926, 4) == 64 and chance(row, 15351, 4) == 45 and chance(row, 852, 4) == 18);
row = find(100, 'Wild Rabbit');
check('Wild Rabbit, West Ronfaure, at TH 0, 2 and 4', chance(row, 4358, 0) == 15 and chance(row, 856, 0) == 10
    and chance(row, 4358, 2) == 40 and chance(row, 856, 2) == 15 and chance(row, 4358, 4) == 45 and chance(row, 856, 4) == 18);
row = find(101, 'Wild Rabbit', 6);
check('Wild Rabbit, East Ronfaure, has level_mod -2', row and row.level_mod == -2 and levels_of(row) == '1');
check('and rabbit hide on two rolls, 23.5% at TH 0', chance(row, 856, 0) == 23.5, chance(row, 856, 0));
-- Phoenix archived its launch module, so the starter zones have no extra monsters from index 824.
local exp_only = false;
for _, file in pairs(zones) do
    for _, each in ipairs(file.monsters) do exp_only = exp_only or (each.flags ~= nil and each.flags.exp_only == true); end
end
check('no launch extras, so no row only drops with EXP', not exp_only and find(100, 'Field Rabbit', 824) == nil);
row = find(100, 'Wild Sheep', 179);
check('Wild Sheep\'s despoil roll makes Sheep Tooth 9.75%', row and math.abs(drops.chances(row.drops, 0)[882] - 0.0975) < 1e-9);
row = find(33, 'Aweuvhi');
check('each Aweuvhi cluster is 0.625%', row and math.abs(drops.chances(row.drops, 0)[4106] - 0.00625) < 1e-9);
row = find(33, 'Qnxzomit', 456);
check('Qnxzomit before the Jailer of Love is immune to six', immune_of(row) == 'dark_sleep,light_sleep,bind,stun,blind,petrify');
row = find(33, 'Qnxzomit', 474);
check('the Jailer of Love\'s are not', row and row.immune == nil);
row = find(127, 'Behemoth');
check('Behemoth is marked scripted', row and row.flags.scripted_stats and row.nm and row.ranks.stun == 10);
row = find(68, 'Pandemonium Warden', 423);
check('Pandemonium Warden\'s magic evasion changes by level', row and row.levels[86].meva.all == 94 and row.levels[88].meva.all == 82);

-- Each spawn's own range, from its level in the zone YAML. A spawn at the row's whole range has none.
local function spawn_levels_of(row)
    local list = {};
    for index, range in pairs(row and row.spawn_levels or {}) do list[#list + 1] = { index, range[1], range[2] }; end
    table.sort(list, function (a, b) return a[1] < b[1]; end);
    for i, entry in ipairs(list) do list[i] = ('%d=%d-%d'):format(entry[1], entry[2], entry[3]); end
    return table.concat(list, ' ');
end
row = find(103, 'Goblin Tinkerer', 32);
check('each Valkurm Dunes Goblin Tinkerer spawns at 17-18, 18-19 or 19-20', levels_of(row) == '17,18,19,20'
    and spawn_levels_of(row) == '32=17-18 98=18-19 143=17-18 163=17-18 164=17-18 173=17-18 202=19-20 263=19-20', spawn_levels_of(row));
check('Lufaise Meadows Fomor Warriors 141 and 212 are in different parties, so each has its own row and levels',
    levels_of(find(24, 'Fomor Warrior', 141)) == '80,81,82' and levels_of(find(24, 'Fomor Warrior', 212)) == '42,43,44'
    and find(24, 'Fomor Warrior', 141) ~= find(24, 'Fomor Warrior', 212));
row = find(4, 'Goblins Rarab', 147);
check('one Bibiki Bay Goblins Rarab spawns at 29-31 and three at 66-69', spawn_levels_of(row)
    == '147=29-31 152=66-69 178=66-69 198=66-69', spawn_levels_of(row));
row = find(16, 'Stray', 30);
check('Promyvion-Holla Strays spawn at 20-21, 23-24 or 26-27', row and table.concat(row.spawn_levels[30], '-') == '20-21'
    and table.concat(row.spawn_levels[90], '-') == '23-24' and table.concat(row.spawn_levels[137], '-') == '26-27');
row = find(107, 'Leaping Lizzy', 380);
check('both Leaping Lizzy spawns are 10-11, the row\'s range', levels_of(row) == '10,11' and row.spawn_levels == nil);

-- Placeholders, from each PH's own onMobDespawn and the phList in the NM's script. Each entry shows as
-- "PH index=NM indexes".
local function phs_of(row)
    local list = {};
    for index, nms in pairs(row and row.ph_for or {}) do list[#list + 1] = { index, table.concat(nms, ',') }; end
    table.sort(list, function (a, b) return a[1] < b[1]; end);
    for i, entry in ipairs(list) do list[i] = entry[1] .. '=' .. entry[2]; end
    return table.concat(list, ' ');
end
local function rows_with_ph(zone)
    local count = 0;
    for _, each in ipairs((zones[zone] or {}).monsters or {}) do count = count + (each.ph_for and 1 or 0); end
    return count;
end
row = find(103, 'Damselfly', 330);
check('one Valkurm Dunes Damselfly is the PH for Valkurm Emperor', phs_of(row) == '330=334'
    and find(103, 'Valkurm Emperor', 334) ~= nil, phs_of(row));
check('and one Giant Bat for Golden Bat', phs_of(find(103, 'Giant Bat', 458)) == '458=460'
    and find(103, 'Golden Bat', 460) ~= nil, phs_of(find(103, 'Giant Bat', 458)));
row = find(107, 'Ornery Sheep', 124);
check('a South Gustaberg Ornery Sheep can pop either Carnero', phs_of(row) == '124=125,138'
    and find(107, 'Carnero', 125) == find(107, 'Carnero', 138), phs_of(row));
row = find(157, 'Giant Gatekeeper', 37);
check('two Middle Delkfutt\'s Tower Giant Gatekeepers are PHs for two different NMs', phs_of(row) == '37=36 95=94'
    and find(157, 'Eurytos', 36) ~= nil and find(157, 'Polybotes', 94) ~= nil, phs_of(row));
check('Tremor Rams pop Rampaging Ram, an NM that is the PH for Steelfleece Baldarich', phs_of(find(108, 'Tremor Ram', 301))
    == '301=302 403=302' and phs_of(find(108, 'Rampaging Ram', 302)) == '302=303', phs_of(find(108, 'Tremor Ram', 301)));
check('Lumbering Lambert is the PH for Bloodtear Baldurf, and Bloodtear\'s list entry that only keeps him down while '
    .. 'Lambert is up makes him no PH', phs_of(find(102, 'Lumbering Lambert', 309)) == '309=310'
    and find(102, 'Bloodtear Baldurf', 310).ph_for == nil);
check('Quicksand Caves Helm Beetles only roll in a sandstorm and are still PHs', phs_of(find(208, 'Helm Beetle', 249))
    == '249=246 252=246 255=246 258=246 262=246', phs_of(find(208, 'Helm Beetle', 249)));
check('Fei\'Yin Specters keep their Shadows through the era module\'s own despawn', phs_of(find(204, 'Specter war', 298))
    == '298=302' and find(204, 'Northern Shadow', 302) ~= nil, phs_of(find(204, 'Specter war', 298)));
check('Ru\'Aun Gardens has 16 Groundskeepers for Despot', select(2, phs_of(find(130, 'Groundskeeper', 242)):gsub('=258', ''))
    == 16, phs_of(find(130, 'Groundskeeper', 242)));
check('no Oldton Movalpolos monster is a PH, since Bugbear Strongman\'s PH spawns run a script that isn\'t there',
    rows_with_ph(11) == 0);
check('a Batallia Downs Evil Weapon isn\'t one, since Prankster Maverix is WotG content', find(105, 'Evil Weapon', 339).ph_for
    == nil and phs_of(find(105, 'Stalking Sapling', 153)) == '153=180');

-- Battlefields and Limbus.
row = find(144, 'Queen Jelly');
check('Queen Jelly has its +100 accuracy', stats_are(row, 41, 247, 132));
row = find(67, 'Phantom Puk', 7);
check('Phantom Puk\'s accuracy is set at spawn', stats_are(row, 76, 380, 310));
row = find(38, 'Air Elemental', 46);
check('Apollyon Air Elemental', stats_are(row, 70, 287, 252) and immune_of(row) == 'light_sleep,gravity,silence,slow,elegy,petrify,terror');
row = find(38, 'Bialozar', 200);
check('Apollyon Bialozar', stats_are(row, 80, 342, 322) and immune_of(row) == 'dark_sleep,light_sleep,terror,plague');

-- Dynamis.
row = find(186, 'Vanguard Constable', 3);
check('Vanguard Constable at 75 and 77', stats_are(row, 75, 317, 282, 89, 89, 115, 101) and stats_are(row, 77, 328, 292, 90, 90, 117, 104));
check('and every Vanguard Constable spawns at 75-77, the row\'s range', levels_of(row) == '75,76,77' and row.spawn_levels == nil);
row = find(186, 'Adamantking Effigy', 1);
check('Adamantking Effigy at 65', stats_are(row, 65, 272, 259, 90, 74, 74, 80)
    and immune_of(row) == 'dark_sleep,light_sleep,bind,silence,slow,elegy');
row = find(135, 'Dynamis Lord');
check('Dynamis Lord at 90', stats_are(row, 90, 419, 356, 110, 117, 87, 87) and row.resist.paralyze == 25 and #row.immune == 10);

-- Links. Each Dynamis-Beaucedine list is written once, and its rows share them. Each group shows as
-- "way: names", in the order the data writes them.
local function links_of(row)
    local groups = {};
    for _, way in ipairs(aggro.LINK_WAYS) do
        local names = row and row.links and row.links[way];
        if (names ~= nil) then groups[#groups + 1] = way .. ': ' .. table.concat(names, ', '); end
    end
    return table.concat(groups, ' / ');
end
-- How many of a zone's link lists name a monster.
local function lists_naming(zone, name)
    local count = 0;
    for _, list in ipairs(zones[zone].link_lists or {}) do
        local found = false;
        for _, names in pairs(list) do
            for _, each in ipairs(names) do found = found or each == name; end
        end
        count = count + (found and 1 or 0);
    end
    return count;
end
local beaucedine = loadfile(ADDON_DIR .. '/data/zones/134.lua')();
local beaucedine_rows = 0;
for _, each in ipairs(beaucedine.monsters) do beaucedine_rows = beaucedine_rows + (each.links and 1 or 0); end
check('Dynamis-Beaucedine writes 77 link lists for its 164 linked rows', #beaucedine.link_lists == 77 and beaucedine_rows == 164,
    #beaucedine.link_lists .. ' lists, ' .. beaucedine_rows .. ' rows');
-- Dagourmarche takes its avatar as a pet when the zone loads (xi.dynamis.onBossInitialize), and nothing ever calls it.
check('no Dynamis-Beaucedine list names Dagourmarche\'s avatar', lists_naming(134, 'Dagourmarches Avatar') == 0,
    lists_naming(134, 'Dagourmarches Avatar'));
row = find(134, 'Vanguard Liberator', 2);
local liberator = row and row.links.true_both;
check('and a row there gets its names back', liberator ~= nil and #liberator > 100 and liberator[1] < liberator[2],
    liberator and #liberator);
-- Dynamis has no battlefield, so its battlefield-typed statues and the NMs they call fight at battle ID 0 and link like
-- everyone else there.
row = find(134, 'Deathcaller Bidfbid', 291);
check('a Dynamis-Beaucedine statue is in every list but its own', lists_naming(134, 'Dynamis Icon') == 76
    and links_of(row):find('Dynamis Icon', 1, true) ~= nil, lists_naming(134, 'Dynamis Icon'));
row = find(186, 'Vanguard Constable', 3);
check('and Dynamis-Bastok\'s AaNyu Dismantler, the NM a statue calls, gets a list of its own and is in the other seven',
    #zones[186].link_lists == 8 and lists_naming(186, 'AaNyu Dismantler') == 7
    and links_of(row):find('AaNyu Dismantler', 1, true) ~= nil,
    #zones[186].link_lists .. ' lists, ' .. lists_naming(186, 'AaNyu Dismantler'));
row = find(8, 'Shikaree Y', 101);
check('Shikaree Y links with its partners from both Boneyard Gully fights', links_of(row)
    == 'superlink: Shikaree X, Shikaree Xs Rabbit, Shikaree Z, Shikaree Zs Wyvern', links_of(row));
row = find(29, 'Tiamat');
check('Tiamat links with the battlefield-typed wyrms in its superlink group', links_of(row)
    == 'superlink: Airi, Bahamut, Iruci, Jormungand, Ouryu, Pey, Vrtra', links_of(row));
row = find(25, 'Tavnazian Sheep');
check('the Gigas Warwolves\' sheep are pets, so no other sheep links', links_of(row) == 'sight: Tavnazian Sheep', links_of(row));
row = find(66, 'Mamool Ja\'s Lizard');
check('every Mamool Ja\'s Lizard is a Warder\'s pet', row ~= nil and row.links == nil);
row = find(79, 'Orderly Imp');
check('a link name drops the template\'s zone suffix', links_of(row) == 'true_sound: Heraldic Imp, Orderly Imp / '
    .. 'true_both: Zikko', links_of(row));

-- How each one links, worked out by hand from CanLink and each helper's senses.
row = find(33, 'Jailer of Love', 464);
check('Jailer of Love shares a superlink with its pets', links_of(row) == 'superlink: Qnhpemde, Qnxzomit, Ruphuabo',
    links_of(row));
row = find(118, 'Zu', 14);
check('Buburimu Peninsula Zu: the bird sees and the Zu hear', links_of(row) == 'sight: Helldiver / sound: Zu',
    links_of(row));
row = find(30, 'Carmine Dobsonfly', 134);
check('Riverne Carmine Dobsonflies share a superlink and the Hawker hears', links_of(row)
    == 'superlink: Carmine Dobsonfly / sound: Hawker', links_of(row));
row = find(30, 'Hawker', 120);
check('a Hawker hears a Dobsonfly in, and it superlinks the rest from anywhere', links_of(row)
    == 'superlink: Carmine Dobsonfly / sound: Carmine Dobsonfly, Hawker', links_of(row));
row = find(7, 'Tracer Antlion', 1);
check('Attohwa Chasm antlions hiding underground never link', links_of(row):find('Ambusher Antlion') == nil
    and links_of(row):find('Pit Antlion') == nil and links_of(row):find('Hunter Antlion') ~= nil, links_of(row));
row = find(8, 'Tuchulcha', 17);
check('so Tuchulcha\'s hunters don\'t either', row ~= nil and row.links == nil, links_of(row));
row = find(23, 'Memory Receptacle', 23);
check('Spire of Vahzl Memory Receptacles hear or only smell', links_of(row) == 'sound: Memory Receptacle / true_sound: '
    .. 'Contemplator, Ingurgitator, Neoingurgitator, Repiner / neither: Memory Receptacle', links_of(row));
row = find(16, 'Memory Receptacle', 29);
check('the Promyvion-Holla ones only smell', links_of(row) == 'neither: Memory Receptacle', links_of(row));
row = find(37, 'Fire Elemental', 265);
check('Temenos elementals notice magic', links_of(row) == 'true_sight: Mystic Avatar / magic: Air Elemental, Earth Elemental, '
    .. 'Ice Elemental, Thunder Elemental, Water Elemental', links_of(row));
-- The fomor patrols and guards in fomor_party.lua superlink, and each one gets its own row. Sacrarium Fomor
-- Warrior 130 leads a patrol with a Fomor Dragoon, 124 follows a Fomor Monk, and 63 is in neither.
check('Sacrarium Fomor Warriors superlink only with their own patrols', links_of(find(28, 'Fomor Warrior', 130))
    == 'superlink: Fomor Dragoon' and links_of(find(28, 'Fomor Warrior', 124)) == 'superlink: Fomor Monk',
    links_of(find(28, 'Fomor Warrior', 130)) .. ' and ' .. links_of(find(28, 'Fomor Warrior', 124)));
row = find(28, 'Fomor Warrior', 63);
check('and one with no patrol gets the fomors that join by sound', links_of(row) == 'sound: Fomor Ranger, Fomor Thief, '
    .. 'Fomor Warrior', links_of(row));
row = find(24, 'Fomor Dark Knight LM', 148);
check('the Fomor Dark Knight at Bluefell Falls superlinks only with its guard', links_of(row) == 'superlink: Fomor Black Mage, '
    .. 'Fomor Dragoon, Fomor Paladin', links_of(row));
check('Spire of Vahzl and Riverne-Site A01 split a list where names match but how they link doesn\'t',
    #zones[23].link_lists == 7 and #zones[30].link_lists == 5, #zones[23].link_lists .. ' and ' .. #zones[30].link_lists);

-- Only monsters that come up on Phoenix link. One that never does keeps its row, but links with no one and no one
-- lists it.
row = find(118, 'Abyssdiver');
check('Buburimu Peninsula\'s Abyssdiver never comes up, so it links with no one', row ~= nil and row.links == nil,
    links_of(row));
-- A mission fight whose expansion is off never runs, and Phoenix has ACP and AMK off.
row = find(206, 'Seed Orc', 298);
check('Qu\'Bia Arena\'s Seed monsters only fight in an ACP mission, so they link with no one', row ~= nil
    and row.links == nil and lists_naming(206, 'Seed Goblin') == 0, links_of(row));
row = find(168, 'Nanaa Mihgo', 70);
check('and neither do the AMK fights\' monsters in the Chamber of Oracles and the Throne Room', row ~= nil
    and row.links == nil and lists_naming(168, 'Bopa Greso') == 0 and find(165, 'Riko Kupenreich', 46).links == nil,
    links_of(row));
-- An instance's monsters only link when players can get in. Phoenix only lets players take each area's first Assault
-- (assault_limits.lua), and some Assaults have no way in at all, like Orichalcum Survey and Extermination.
row = find(69, 'Mineral Eater', 24);
check('Orichalcum Survey\'s Mineral Eaters link with no one, but Leujaoam Cleansing\'s Worms still do', row ~= nil
    and row.links == nil and links_of(find(69, 'Leujaoam Worm', 1)) == 'sound: Leujaoam Worm', links_of(row));
row = find(56, 'Darkling Draugar', 24);
check('Requiem is past the rank Phoenix allows, so its Draugar don\'t link, and Ilrusi Atoll writes no lists at all',
    row ~= nil and row.links == nil and #zones[55].link_lists == 0, links_of(row) .. ' and ' .. #zones[55].link_lists);
-- Absolute Virtue's Astral Flow calls the Aern's Wynav 2 ids after it (astral_flow.lua), so that one comes up too.
row = find(33, 'Aerns Wynav', 494);
check('Absolute Virtue\'s Aern\'s Wynav comes up, and the other Wynavs list it', links_of(row) == 'sight: Aerns Wynav',
    links_of(row));
-- Expeditionary Force and Garrison monsters only link inside their events. The server tells events apart by the
-- confrontation's power, and both give it the zone's level cap, 30 in Buburimu Peninsula, so they link with each other.
row = find(118, 'Goblin Tinkerer', 18);
check('a Buburimu Peninsula Goblin Tinkerer lists no Expeditionary Force or Garrison monster', links_of(row)
    == 'sight: Goblin Ambusher, Goblin Bounty Hunter, Goblin Butcher, Goblin Digger, Goblin Gambler, Goblin Leecher, '
    .. 'Goblin Mugger, Goblin Tinkerer', links_of(row));
row = find(118, 'Hobgoblin Thief', 468);
check('an Expeditionary Force Hobgoblin lists the other Hobgoblins and the Garrison goblins', links_of(row)
    == 'sight: Goblin Furrier, Goblin Guide, Goblin Shaman, Goblin Swordmaker, Goblin Thespian, Hobgoblin Beastmaster, '
    .. 'Hobgoblin Black Mage, Hobgoblin Dark Knight, Hobgoblin Ranger, Hobgoblin Red Mage, Hobgoblin Warrior, '
    .. 'Hobgoblin White Mage', links_of(row));
row = find(118, 'Goblin Swordmaker', 482);
check('and a Garrison Goblin Swordmaker the Garrison goblins and the Hobgoblins', links_of(row) == 'sight: Goblin Furrier, '
    .. 'Goblin Guide, Goblin Shaman, Goblin Swordmaker, Goblin Thespian, Hobgoblin Beastmaster, Hobgoblin Black Mage, '
    .. 'Hobgoblin Dark Knight, Hobgoblin Ranger, Hobgoblin Red Mage, Hobgoblin Thief, Hobgoblin Warrior, '
    .. 'Hobgoblin White Mage', links_of(row));
local leech, ef_leech = find(126, 'Gigass Leech', 32), find(126, 'Gigass Leech', 318);
check('the Expeditionary Force\'s Gigas\'s Leech in Qufim Island gets a row of its own, at its own levels',
    leech ~= ef_leech and levels_of(leech) == '24,25' and levels_of(ef_leech) == '28,29,30',
    levels_of(leech) .. ' and ' .. levels_of(ef_leech));
-- A leader's followers come up with it (xi.follow.spawnFollowers), so they link like the rest of their kind.
local follower, others = find(11, 'Bugbear Servingman', 41), find(11, 'Bugbear Servingman', 24);
check('Oldton Movalpolos\'s Bugbear Servingman 41 follows a Goblin Hammerman, so it links like the others',
    follower ~= others and links_of(follower) ~= '' and links_of(follower) == links_of(others), links_of(follower));
follower, others = find(12, 'Moblin Topsman', 181), find(12, 'Moblin Topsman', 119);
check('and Newton Movalpolos\'s Moblin Topsman 181 follows a Goblin Swordsman', follower ~= others
    and links_of(follower) ~= '' and links_of(follower) == links_of(others), links_of(follower));
-- Each Limbus floor links only with itself.
row = find(37, 'Goblin Slaughterman', 4);
check('a Temenos Goblin Slaughterman links only with its own floor', links_of(row)
    == 'true_sound: Goblin Slaughterman, Moblin Dustman', links_of(row));
-- In SE Apollyon the last two Metalloid Amoebas, Adamantshells and Inhumers stand at 0, 0, 0. They take the floor the
-- rest of their kind is on, so the floors still split.
row = find(38, 'Ghost Clot', 128);
check('SE Apollyon\'s first floor boss links only with its own floor', links_of(row) == 'true_sound: Metalloid Amoeba',
    links_of(row));
row = find(38, 'Evil Armory', 168);
check('and the fourth floor\'s too', links_of(row) == 'true_sound: Flying Spear', links_of(row));
-- Central Temenos' second and fourth floors both have Mystic Avatars, and its third and fourth a Yagudo's Avatar. Each
-- floor finds its monsters by name in the whole zone, so it leaves out the copies another floor brings up.
row = find(37, 'Mystic Avatar', 271);
check('a second floor Mystic Avatar links only with its own floor', links_of(row) == 'true_sight: Mystic Avatar / magic: '
    .. 'Air Elemental, Earth Elemental, Fire Elemental, Ice Elemental, Thunder Elemental, Water Elemental', links_of(row));
row = find(37, 'Mystic Avatar', 223);
check('and a fourth floor one keeps its floor but not the second floor\'s elementals', row ~= nil and row.links.magic == nil
    and links_of(row):find('Proto-Ultima', 1, true) ~= nil, links_of(row));
row = find(37, 'Yagudos Avatar', 222);
check('and the third and fourth floors\' Yagudo\'s Avatars don\'t list each other', row ~= nil and row.links.sight == nil
    and links_of(row):find('Koo Buzu the Theomanic', 1, true) ~= nil, links_of(row));
-- The Temenos crates' group gives them battle ID 1, so they never fight, and SW Apollyon's mimics keep NO_LINK.
row = find(37, 'Armoury Crate', 68);
check('no Temenos list names an Armoury Crate, and the crates link with no one', lists_naming(37, 'Armoury Crate') == 0
    and row ~= nil and row.links == nil, lists_naming(37, 'Armoury Crate'));
row = find(38, 'Armoury Crate', 35);
check('and SW Apollyon\'s mimics never link with each other', lists_naming(38, 'Armoury Crate') == 0 and row ~= nil
    and row.links == nil, links_of(row));
-- NE Apollyon's floor 2 adds the third floor's groups once it's running (battlefield:addGroups).
row = find(38, 'Apollyon Sweeper', 217);
check('NE Apollyon\'s third floor Sweepers and Cleaners link with each other', links_of(row)
    == 'magic: Apollyon Cleaner, Apollyon Sweeper', links_of(row));
-- Monsters that are never up together don't link, and one that's only up while its owner fights is like a pet.
row = find(190, 'Cherry Sapling', 292);
check('Cemetery Cherry and its Saplings are never up together', find(190, 'Cemetery Cherry').links == nil
    and links_of(row) == 'sound: Cherry Sapling', links_of(row));
row = find(178, 'Aura Gear', 73);
check('a Defender\'s Aura Gear is only up while the Defender fights, so it links with no one', row ~= nil
    and row.links == nil, links_of(row));
-- Zoraal Ja's Pkuucha spawns Percipient Zoraal Ja mid-fight and despawns it when it stops fighting.
row = find(51, 'Mamool Ja Zenist', 272);
check('Percipient Zoraal Ja is only up while Pkuucha fights, so no Mamool Ja lists it', lists_naming(51,
    'Percipient Zoraal Ja') == 0 and links_of(row) == 'sight: Mamool Ja Bounder, Mamool Ja Mimicker, Mamool Ja Savant, '
    .. 'Mamool Ja Sophist' and find(51, 'Percipient Zoraal Ja', 86).links ~= nil, links_of(row));
-- Vrtra despawns its undead when it stops fighting, and callPets kills one that goes idle once Vrtra is dead.
row = find(190, 'Airi', 312);
check('Vrtra\'s undead are only up while Vrtra fights, so Spook never lists Airi', find(190, 'Spook', 142).links == nil
    and links_of(row) == 'sound: Spook' and find(190, 'Pey', 308).links == nil, links_of(row));
-- Osschaart copies one two-hour a fight. Its Bat, Wyvern and Automaton are its pets, and only one helper is ever up.
row = find(144, 'Osschaarts Wyvern', 211);
check('Osschaart only lists its avatar, and each helper only Osschaart', links_of(find(144, 'Osschaart', 208))
    == 'sight: Osschaarts Avatar' and links_of(row) == 'both: Osschaart', links_of(row));
-- Fantoccini takes one pet for the initiator's job. The other forms cannot join the fight.
for _, name in ipairs({ 'Fantoccini Monster', 'Fantoccini Wyvern', 'Fantoccini Avatar', 'Fantoccini Automaton' }) do
    row = find(13, name);
    check(name .. ' is a pet, so no list names it', lists_naming(13, name) == 0 and links_of(row)
        == 'superlink: Fantoccini, Moblin Fantocciniman', links_of(row));
end
check('Fantoccini and its Moblin only list each other', links_of(find(13, 'Fantoccini', 45))
    == 'superlink: Moblin Fantocciniman' and links_of(find(13, 'Moblin Fantocciniman', 43))
    == 'superlink: Fantoccini');
-- The Dynamis BOSS handlers bind this avatar but never summon it. Keep its row without links.
row = find(134, 'Dagourmarches Avatar', 508);
check('Dagourmarche\'s unsummoned avatar links with no one', row ~= nil and row.links == nil
    and lists_naming(134, 'Dagourmarches Avatar') == 0, links_of(row));
-- Ark Angel MR calls its tiger or its mandragora when it engages and makes it its pet.
row = find(180, 'Ark Angels Wyvern', 22);
check('Ark Angel MR\'s tiger and mandragora are its pets, so no list names them', lists_naming(180, 'Ark Angels Tiger') == 0
    and lists_naming(180, 'Ark Angels Mandragora') == 0 and links_of(find(180, 'Ark Angel MR', 4))
    == 'superlink: Ark Angel EV, Ark Angel GK, Ark Angel HM, Ark Angel TT' and links_of(row) == 'true_sight: Ark Angel GK',
    links_of(row));
-- A mission fight only brings up its boss's next form once the last one is gone, so the forms never link.
check('Shadow Lord\'s two forms and Promathia\'s two forms link with no one', find(165, 'Shadow Lord', 1).links == nil
    and find(165, 'Shadow Lord', 4).links == nil and find(36, 'Promathia', 1).links == nil
    and find(36, 'Promathia', 2).links == nil);
row = find(165, 'Zeid', 8);
check('the first Zeid links with no one, and the second only with its Shadows of Rage', find(165, 'Zeid', 7).links == nil
    and links_of(row) == 'true_sight: Shadow of Rage', links_of(row));
row = find(32, 'Mammet-22 Zeta', 1);
check('the Mammets only list each other, and Omega and Ultima link with no one', links_of(row)
    == 'true_sound: Mammet-22 Zeta' and find(32, 'Omega', 6).links == nil and find(32, 'Ultima', 7).links == nil,
    links_of(row));
row = find(181, 'Ealdnarche', 4);
check('Eald\'narche\'s first form lists its Orbitals and Exoplates, and its second form links with no one', links_of(row)
    == 'sound: Orbital / true_sound: Exoplates' and find(181, 'Ealdnarche 2', 6).links == nil
    and lists_naming(181, 'Ealdnarche 2') == 0, links_of(row));
row = find(206, 'Son of Anansi', 207);
check('Ghul-I-Beaban\'s two forms and Anansi link with no one, and the Sons of Anansi only with each other',
    find(206, 'Ghul-I-Beaban', 121).links == nil and find(206, 'Ghul-I-Beaban', 122).links == nil
    and find(206, 'Anansi', 205).links == nil and links_of(row) == 'true_sound: Son of Anansi', links_of(row));
-- Link names are the names the game shows.
row = find(33, 'Omaern bst', 89);
check('a job tag comes off a link name', links_of(row) == 'both: Absolute Virtue, Omaern, Ulaern / true_both: Ruaern',
    links_of(row));
row = find(68, 'Pandemonium Warden', 423);
check('Pandemonium Warden\'s avatar forms link as Pandemonium Lamp, the name the game shows', links_of(row)
    == 'sight: Pandemonium Lamp, Pandemonium Warden', links_of(row));
row = find(147, 'BiGho Headtaker', 23);
check('Beadeaux\'s Magnes and Nickel Quadav NMs link as Magnes Quadav and Nickel Quadav', lists_naming(147,
    'Magnes Quadav NM') == 0 and lists_naming(147, 'Nickel Quadav NM') == 0 and links_of(row):find('Iron Quadav, '
    .. 'Magnes Quadav, Mythril Quadav, Nickel Quadav, Old Quadav', 1, true) ~= nil, links_of(row));
row = find(35, 'Ixaern drg', 446);
check('and Ix\'aern (DRG)\'s wynavs as Aerns Wynav', links_of(row) == 'superlink: Aerns Wynav', links_of(row));

-- Magic damage, absorb and nullify.
local function pairs_of(t)
    local list = {};
    for key, value in pairs(t or {}) do list[#list + 1] = key .. '=' .. value; end
    table.sort(list);
    return table.concat(list, ' ');
end
row = find(103, 'Fire Elemental');
check('Fire Elemental, Valkurm Dunes, takes normal magic damage', row and row.magic_dmg == nil and row.absorb == nil);
row = find(207, 'Fire Elemental');
check('the Cloister of Flames Fire Elemental absorbs fire', pairs_of(row and row.absorb) == 'fire=100' and row.ranks.fire == -3);
row = find(37, 'Mystic Avatar', 223);
check('the Ifrit Mystic Avatar on the second floor takes 95% less from all but fire and water', pairs_of(row and row.magic_dmg)
    == 'dark=-95 earth=-95 fire=100 ice=-95 light=-95 thunder=-95 wind=-95' and pairs_of(row.absorb) == 'fire=100',
    pairs_of(row and row.magic_dmg));
row = find(37, 'Fire Elemental', 265);
check('the second floor elementals take half magic damage', pairs_of(row and row.magic_dmg) == 'all=-50');
row = find(38, 'Evil Armory');
check('Evil Armory nullifies magic until its spears die', pairs_of(row and row.nullify) == 'all=100' and row.flags.scripted_elements);
row = find(52, 'Sea Puk BT');
check('a Bhaflau Thickets puk absorbs wind', pairs_of(row and row.absorb) == 'wind=100' and row.ranks.wind == 11);
row = find(7, 'Muut');
check('Muut, a corse, takes 25% less magic damage', pairs_of(row and row.magic_dmg) == 'all=-25');
row = find(186, 'Adamantking Effigy', 1);
check('a Dynamis statue takes half magic damage', pairs_of(row and row.magic_dmg) == 'all=-50');
row = find(3, 'Uragnite');
check('an Uragnite\'s shell changes its magic damage', row and row.magic_dmg == nil and row.flags.scripted_elements
    and not row.flags.scripted_stats);
row = find(8, 'Shikaree Z', 1);
check('Shikaree Z\'s MAGIC_DELAY lands on earth damage, as the server sets it', pairs_of(row and row.magic_dmg) == 'earth=0.35');

-- Assault. Every Assault zone has its monsters, at every level the four level caps give, with no drops.
for _, zone in ipairs({ 55, 56, 63, 66, 69 }) do
    local file = zones[zone];
    local count, dropless = 0, true;
    for _, each in ipairs(file and file.monsters or {}) do
        count = count + 1;
        dropless = dropless and each.drops == nil;
    end
    check(('Assault zone %d has monsters and no drops'):format(zone), count >= 3 and dropless, count);
end
row = find(69, 'Leujaoam Worm', 1);
check('Leujaoam Worm under every cap', levels_of(row) == '51,52,53,61,62,63,71,72,73,76,77,78', levels_of(row));
check('Leujaoam Worm at 76', stats_are(row, 76, 321, 283));
check('every Leujaoam Worm spawns at 76-78 before the cap, so each has the row\'s range', row and row.spawn_levels == nil);
row = find(66, 'Mamool Ja Warder', 1);
check('Mamool Ja Warder at 75', row and row.levels[75].eva == 273);
row = find(63, 'Brittle Rock', 19);
check('Brittle Rock\'s eight immunities and curse evasion', row and #row.immune == 8 and row.meva.curse == 9999
    and row.levels[75].eva == 41);
row = find(55, 'Cursed Chest', 9);
check('Cursed Chest at 73', stats_are(row, 73, 306, 294) and immune_of(row) == 'dark_sleep,light_sleep');
check('Periqia has its monsters', find(56, 'Batteilant Bhoot', 22) ~= nil and find(56, 'Draconic Draugar') ~= nil);

-- The Ashu Talif fights (The Black Coffin, Against All Odds) come from the same instance tables.
row = find(60, 'Ashu Talif Captain', 9);
check('The Ashu Talif has Gowam, Yazquhl and the Captain at 68', find(60, 'Gowam') ~= nil and find(60, 'Yazquhl') ~= nil
    and levels_of(row) == '68', levels_of(row));

-- The Nyzul Isle fights (Path of Darkness, Nashmeira's Plea, Waking the Colossus) come from the same tables.
-- Nyzul Isle Investigation (indexes 21 to 496) stays out.
row = find(77, 'Amnaf', 524);
check('Amnaf at 77 to 79', levels_of(row) == '77,78,79' and stats_are(row, 77, 319, 304, 66, 66, 66, 66), levels_of(row));
row = find(77, 'Alexander', 540);
check('Waking the Colossus Alexander at 80 with six immunities', levels_of(row) == '80' and stats_are(row, 80, 335, 313, 55, 55, 82, 82)
    and #row.immune == 6, levels_of(row));
local fights_only = #zones[77].monsters == 8;
for _, each in ipairs(zones[77].monsters) do
    for _, id in ipairs(each.ids) do fights_only = fights_only and id >= 524 and id <= 543; end
end
check('Nyzul Isle has only the eight fight rows', fights_only);

-- Steal. A row's steal holds what Steal can take, in the YAML's order. A row without one has nothing to steal.
local function steal_of(row)
    return table.concat(row and row.steal or {}, ',');
end
local steal_rows, steal_lists = 0, 0;
for _, file in pairs(zones) do
    for _, each in ipairs(file.monsters) do
        if (each.steal ~= nil) then
            steal_rows = steal_rows + 1;
            steal_lists = steal_lists + (#each.steal > 1 and 1 or 0);
        end
    end
end
check('about 2,000 rows have something to steal, about 250 of them a list', steal_rows >= 1950 and steal_rows <= 2100
    and steal_lists >= 230 and steal_lists <= 270, steal_rows .. ' rows, ' .. steal_lists .. ' lists');
check('Valkurm Dunes Beach Pugils have fish scales', steal_of(find(103, 'Beach Pugil', 453)) == '864'
    and steal_of(find(103, 'Beach Pugil', 4)) == '864' and steal_of(find(103, 'Beach Pugil', 242)) == '864',
    steal_of(find(103, 'Beach Pugil', 453)));
check('a Goblin Digger has a pickaxe or a beastcoin', steal_of(find(103, 'Goblin Digger', 461)) == '605,656',
    steal_of(find(103, 'Goblin Digger', 461)));
check('Valkurm Emperor has nothing', find(103, 'Valkurm Emperor', 334).steal == nil);
check('a Dynamis-Valkurm Vanguard Welldigger has the three currencies', steal_of(find(39, 'Vanguard Welldigger', 23))
    == '1449,1452,1455', steal_of(find(39, 'Vanguard Welldigger', 23)));
check('a Yagudo Abbot has a mythril beastcoin', steal_of(find(151, 'Yagudo Abbot', 231)) == '749');
check('a Razorjaw Pugil has fish scales', steal_of(find(176, 'Razorjaw Pugil', 289)) == '864');
check('Brigandish Blade has the Buccaneer\'s Knife, the same item its onSteal returns',
    steal_of(find(177, 'Brigandish Blade', 360)) == '17622', steal_of(find(177, 'Brigandish Blade', 360)));
local instance_steal = {};
for _, zone in ipairs({ 55, 56, 60, 63, 66, 69, 77 }) do
    for _, each in ipairs(zones[zone].monsters) do
        if (each.steal ~= nil) then instance_steal[#instance_steal + 1] = zone .. ' ' .. each.name; end
    end
end
check('no Assault, Ashu Talif or Nyzul Isle fight monster has anything to steal', #instance_steal == 0,
    table.concat(instance_steal, ', '));

-- Jobs, as the server sets them, like 'drk/war'. A row whose data names no job has none, though the server runs it as
-- WAR/WAR. A row whose job a script picks when it spawns has none either.
local bad_jobs, with_job, without_job = {}, 0, 0;
for zone, file in pairs(zones) do
    for _, each in ipairs(file.monsters) do
        if (each.job == nil) then
            without_job = without_job + 1;
        else
            with_job = with_job + 1;
            local main, sub = tostring(each.job):match('^(%l+)/(%l+)$');
            if (wording.BY_KEY['job_' .. tostring(main)] == nil
                or (sub ~= 'none' and wording.BY_KEY['job_' .. tostring(sub)] == nil)) then
                bad_jobs[#bad_jobs + 1] = ('%d %s %s'):format(zone, each.name, tostring(each.job));
            end
        end
    end
end
check('every job is a main job with letters, then a support job with letters or none', #bad_jobs == 0,
    table.concat(bad_jobs, ', ', 1, math.min(#bad_jobs, 10)));
-- 3,944 rows with a job and 2,149 without at 465ac4c076: the 2,030 whose data names none, the 96 whose template a
-- Phoenix module adds as WAR/WAR, the 20 instance monsters whose pool is 1/1 and the Trolls' automatons.
check('about 4,000 rows have a job and about 2,000 don\'t', with_job >= 3900 and with_job <= 4200
    and without_job >= 1900 and without_job <= 2200, with_job .. ' with, ' .. without_job .. ' without');
local function job_of(zone, name, index)
    local each = find(zone, name, index);
    return (each == nil) and 'no row' or tostring(each.job);
end
expect('Goblin Tinkerer is a DRK with a DRK support job', job_of(103, 'Goblin Tinkerer', 98), 'drk/drk');
expect('Fire Elemental is BLM/RDM', job_of(103, 'Fire Elemental', 82), 'blm/rdm');
expect('the Ghoul at 34 names no job', job_of(103, 'Ghoul war', 34), 'nil');
expect('the one at 76 is a BLM', job_of(103, 'Ghoul blm', 76), 'blm/blm');
expect('Valkurm Emperor names no job', job_of(103, 'Valkurm Emperor', 334), 'nil');
expect('Orcish Grappler is MNK/WAR', job_of(100, 'Orcish Grappler', 71), 'mnk/war');
expect('Maat in Horlais Peak has no support job', job_of(139, 'Maat', 25), 'war/none');
expect('Pil is BLM/SCH', job_of(127, 'Pil', 44), 'blm/sch');
expect('an Assault monster has its jobs from mob_pools', job_of(69, 'Leujaoam Worm', 1), 'blm/blm');
expect('a Lebros Cavern Volcanic Bomb from a 1/1 pool names no job', job_of(63, 'Volcanic Bomb', 1), 'nil');
-- Phoenix's modules write WAR/WAR on every template they add from a 1/1 pool, so those name no job either.
local aitvaras = {};
for _, index in ipairs({ 194, 195, 197, 199, 200, 201, 202 }) do
    aitvaras[#aitvaras + 1] = job_of(40, 'Aitvaras', index);
end
expect('all seven Aitvaras in Dynamis-Buburimu name no job, whichever template they come from',
    table.concat(aitvaras, ' '), 'nil nil nil nil nil nil nil');
expect('nor does Goblin Butcher in Inner Horutoto Ruins', job_of(192, 'Goblin Butcher', 95), 'nil');
expect('while an Effigy Shield a module adds as WHM keeps its job', job_of(186, 'Effigy Shield', 379), 'whm/war');
expect('and Jabkix Pigeonpecs keeps the jobs a module gives the zone YAML\'s template', job_of(188, 'Jabkix Pigeonpecs',
    64), 'mnk/war');
expect('Fantoccini, whose job is set at spawn, has none', job_of(13, 'Fantoccini', 45), 'nil');
for _, zone in ipairs({ 52, 61, 62 }) do
    expect('the Trolls\' automatons in zone ' .. zone .. ' have none, since they pick a frame at spawn',
        job_of(zone, 'Trolls Automaton'), 'nil');
end

-- What crit taken reads. Every level has the monster's DEX. Three rows have a crit rate of their own, the same at every
-- level. A monster that swings with nothing but TP moves has tp_moves, one that never swings has no_swings, and one of
-- those that can counter has counters.
row = find(104, 'Knight Crab');
check('Knight Crab has a crit rate of 15, and 30 DEX at 35', row and row.crit == 15 and row.levels[35].dex == 30);
check('Jazaraat has 50 and Ancient Goobbue 25', (find(79, 'Jazaraat') or {}).crit == 50
    and (find(153, 'Ancient Goobbue') or {}).crit == 25);
row = find(65, 'Mamool Ja Bounder');
check('a Mamool Ja Bounder has 97, 97 and 100 DEX at 73 to 75', row and row.levels[73].dex == 97
    and row.levels[74].dex == 97 and row.levels[75].dex == 100);
local crit_rows, tp_rows, swingless, receptacles, counter_rows = 0, {}, {}, {}, {};
for zone, file in pairs(zones) do
    for _, each in ipairs(file.monsters) do
        crit_rows = crit_rows + (each.crit and 1 or 0);
        if (each.tp_moves) then tp_rows[#tp_rows + 1] = each.name; end
        if (each.no_swings and each.name == 'Memory Receptacle') then
            receptacles[#receptacles + 1] = zone;
        elseif (each.no_swings) then
            swingless[#swingless + 1] = each.name;
        end
        if (each.counters) then counter_rows[#counter_rows + 1] = each.name; end
    end
end
table.sort(tp_rows);
table.sort(swingless);
table.sort(receptacles);
table.sort(counter_rows);
check('three rows have a crit rate', crit_rows == 3, crit_rows);
expect('these eight swing with nothing but TP moves', table.concat(tp_rows, ', '), 'Archer Pugil, Cirrate Christelle, '
    .. 'Fairy Ring, Fighting Sheep, Geush Urvan, Nantina, Sniper Pugil, Stcemqestcint');
row = find(7, 'Tiamat');
check('Tiamat only swings with TP moves while it flies, so it isn\'t marked', row and row.tp_moves == nil);
-- The four Promyvions' receptacles stop their swings in xi.promyvion.receptacleOnMobInitialize, and the Spire's two
-- in their own scripts.
expect('the Memory Receptacles never swing, in every Promyvion and twice in the Spire of Vahzl',
    table.concat(receptacles, ', '), '16, 18, 20, 22, 23, 23');
expect('and these 13 never swing either', table.concat(swingless, ', '), 'Bluestreak Gyugyuroon, Brittle Rock, Claret, '
    .. 'Doll Factory, Ealdnarche, Exoplates, Golden-Tongued Culberry, Moblin Clergyman, Moblin Wisewoman, Nenaunir, '
    .. 'Shadow Lord, Time Bomb, Velionis');
check('Old Sabertooth\'s listener gives its swings back, and Razfahd\'s call is a comment, so neither is marked',
    (find(120, 'Old Sabertooth') or { no_swings = 'no row' }).no_swings == nil
    and (find(77, 'Razfahd') or { no_swings = 'no row' }).no_swings == nil);
expect('the two monks that swing with TP moves still counter', table.concat(counter_rows, ', '),
    'Geush Urvan, Nantina');

-- Through the addon ------------------------------------------------------------------------------

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';
-- Source rows have their own real-row check below.
for _, id in ipairs(printout.PARTS) do
    s.printout.parts[id].on = id ~= 'steal' and id ~= 'job' and id ~= 'crittaken'
        and id ~= 'pdif' and id ~= 'offhandpdif' and id ~= 'rangedpdif' and id ~= 'block' and id ~= 'parry'
        and not require('core.parts').INFO_SET[id];
end
s.weaknesses.chat.charm = false;
s.magic.schools.elemental.on = true;
s.magic.schools.enfeebling.on = true;
MOCK.player.main_job, MOCK.player.main_level = 4, 75;
MOCK.player.skills[36] = 250;
MOCK.player.skills[35] = 220;
MOCK.items[4104] = { Name = { 'Fire Crystal' } };

local function readout(zone, index, name, level, con, message)
    MOCK.zone_in(zone);
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    MOCK.packet(MOCK.check_packet(index, level, con, message or 174));
    MOCK.wait(1.6);
    MOCK.reply(300, 250);
    MOCK.frame();
    return MOCK.printed_since(n);
end

local lines = readout(103, 82, 'Fire Elemental', 39, 0);
check('Fire Elemental in Valkurm Dunes', #lines == 6 and lines[1] == '[checkmate] Fire Elemental (Lv 39)  Too Weak',
    table.concat(lines, ' / '));
check('its hit, evade and crit on their own line', lines[2] == '[checkmate] Hit: 95%  Evade: 80%  Crit: 9%', lines[2]);
check('its aggro, too weak for a 75', lines[3] == '[checkmate] Aggro: Too weak to aggro you unless you rest  Doesn\'t link',
    lines[3]);
check('its magic', lines[4] and lines[4]:find('^%[checkmate%] Magic: Elemental %d+%% %(%a+%)  Enfeebling %d+%%$') ~= nil, lines[4]);
check('elements, weapon types and immunities share one Weaknesses line', lines[5] == '[checkmate] Weaknesses: Weak: Water  '
    .. 'Resists: Fire, Ice (never lands)  Resists: Slashing (-75%), Piercing (-75%), Blunt (-75%), Hand-to-hand (-75%)  '
    .. 'Immune: Bind, Paralyze', lines[5]);
check('its drops', lines[6] == '[checkmate] Drops (TH 0): Fire Crystal 100%', lines[6]);
lines = readout(103, 82, 'Fire Elemental', 39, 5);
check('and aggressive by magic when it checks Tough', lines[3] == '[checkmate] Aggro: Aggressive (Magic)  Doesn\'t link', lines[3]);

-- The rest keep hit, evade and crit on the /check line.
MOCK.command('/checkmate extras same');
lines = readout(103, 82, 'Fire Elemental', 39, 0);
check('Fire Elemental with the extras on the same line', #lines == 5 and lines[1] == '[checkmate] Fire Elemental (Lv 39)  '
    .. 'Too Weak  Hit: 95%  Evade: 80%  Crit: 9%' and lines[5] == '[checkmate] Drops (TH 0): Fire Crystal 100%',
    table.concat(lines, ' / '));

lines = readout(69, 1, 'Leujaoam Worm', 51, 0);
check('Leujaoam Worm under the level 50 cap', lines[1] == '[checkmate] Leujaoam Worm (Lv 51)  Too Weak  Hit: 95%  Evade: 57%  '
    .. 'Crit: 7%', lines[1]);
check('an Assault monster has no drops part', #lines == 4 and not table.concat(lines, ' / '):find('Drops', 1, true),
    table.concat(lines, ' / '));
check('and its elements', lines[4] == '[checkmate] Weaknesses: Weak: Wind, Light', lines[4]);
check('and its aggro from the instance tables', lines[2] == '[checkmate] Aggro: Not aggressive  Links with Leujaoam Worm '
    .. '(Sound)', lines[2]);
lines = readout(63, 19, 'Brittle Rock', 0, nil, 249);
check('Brittle Rock can\'t be gauged but has its levels', lines[1]:find('^%[checkmate%] Brittle Rock %(Lv 50%-75%)  '
    .. 'Impossible to Gauge  Hit: 95%%') ~= nil, lines[1]);
lines = readout(186, 3, 'Vanguard Constable', 0, nil, 249);
check('a Dynamis monster', lines[1] == '[checkmate] Vanguard Constable (Lv 75-77)  Impossible to Gauge  Hit: 75-84%  Evade: 5%  '
    .. 'Crit: 5%', lines[1]);

-- The level range through a real /check. In Valkurm Dunes the Goblin Tinkerer at index 98 spawns at 18
-- to 19 and the one at 32 at 17 to 18, and Valkurm Emperor at 29 to 30. In Lufaise Meadows the Fomor
-- Warrior at 212 spawns at 42 to 44 and the one at 141 at 80 to 82. Leujaoam Worms spawn at 76 to 78,
-- less 25 under the level 50 cap, Brittle Rocks at 75, and Waking the Colossus Alexander only at 80.
MOCK.command('/checkmate levelrange on');
lines = readout(103, 98, 'Goblin Tinkerer', 19, 3);
check('Goblin Tinkerer with its spawn\'s level range', lines[1]:find('^%[checkmate%] Goblin Tinkerer %(Lv 19, range 18%-19%)  '
    .. 'Decent Challenge  Hit: %d+%%') ~= nil, lines[1]);
MOCK.command('/checkmate id on');
lines = readout(103, 98, 'Goblin Tinkerer', 19, 3);
check('and its ID after that', lines[1]:find('^%[checkmate%] Goblin Tinkerer %(Lv 19, range 18%-19%) %(ID 17199202%)  '
    .. 'Decent Challenge  Hit: %d+%%') ~= nil, lines[1]);
MOCK.command('/checkmate id off');
lines = readout(103, 32, 'Goblin Tinkerer', 19, 3);
check('a level 19 at the spawn of 17 to 18 shows its level alone', lines[1]:find('^%[checkmate%] Goblin Tinkerer %(Lv 19%)  '
    .. 'Decent Challenge') ~= nil, lines[1]);
lines = readout(24, 212, 'Fomor Warrior', 43, 1);
check('the low Fomor Warrior', lines[1]:find('^%[checkmate%] Fomor Warrior %(Lv 43, range 42%-44%)  ') ~= nil, lines[1]);
lines = readout(24, 141, 'Fomor Warrior', 81, 6);
check('the high Fomor Warrior', lines[1]:find('^%[checkmate%] Fomor Warrior %(Lv 81, range 80%-82%)  ') ~= nil, lines[1]);
lines = readout(24, 141, 'Fomor Warrior', -1, 6);
check('and its own range with no level', lines[1]:find('^%[checkmate%] Fomor Warrior %(Lv 80%-82%)  ') ~= nil, lines[1]);
lines = readout(69, 1, 'Leujaoam Worm', 51, 0);
check('Leujaoam Worm under the level 50 cap shows that cap\'s levels', lines[1]:find('^%[checkmate%] Leujaoam Worm '
    .. '%(Lv 51, range 51%-53%)  Too Weak') ~= nil, lines[1]);
MOCK.zone_in(63);
MOCK.entities[19] = { Name = 'Brittle Rock' };
MOCK.packet(MOCK.widescan_packet(19, 50));
local n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(19, 0, nil, 249));
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
check('a widescanned Brittle Rock under the level 50 cap is only 50', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] '
    .. 'Brittle Rock %(Lv 50%)  Impossible to Gauge') ~= nil, MOCK.printed_since(n)[1]);
lines = readout(103, 82, 'Fire Elemental', 40, 0);
check('Fire Elemental at the top of its range', lines[1]:find('^%[checkmate%] Fire Elemental %(Lv 40, range 38%-40%)  Too Weak')
    ~= nil, lines[1]);
lines = readout(103, 334, 'Valkurm Emperor', 0, nil, 249);
check('Valkurm Emperor before a widescan shows the range alone', lines[1]:find('^%[checkmate%] Valkurm Emperor %(Lv 29%-30%)  '
    .. 'Impossible to Gauge') ~= nil, lines[1]);
MOCK.packet(MOCK.widescan_packet(334, 30));
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(334, 0, nil, 249));
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
check('and its level and range once widescanned', (MOCK.printed_since(n)[1] or ''):find('^%[checkmate%] Valkurm Emperor '
    .. '%(Lv 30, range 29%-30%)  Impossible to Gauge') ~= nil, MOCK.printed_since(n)[1]);
lines = readout(77, 540, 'Alexander', 0, nil, 249);
check('Alexander spawns only at 80, so no range', lines[1]:find('^%[checkmate%] Alexander %(Lv 80%)  Impossible to Gauge') ~= nil,
    lines[1]);

-- The PH note through a real /check. In Valkurm Dunes the Damselfly at index 330 is Valkurm Emperor's only PH and
-- spawns at 21 to 22, and the one at 331 isn't a PH. The Ornery Sheep at 124 in South Gustaberg can pop either
-- Carnero, and Rampaging Ram in Konschtat Highlands is an NM and the PH for Steelfleece Baldarich.
MOCK.command('/checkmate ph on');
lines = readout(103, 330, 'Damselfly', 21, 0);
check('the Damselfly at 330 is the PH for Valkurm Emperor', lines[1]:find('^%[checkmate%] Damselfly %(Lv 21, range 21%-22%) '
    .. '%(PH for Valkurm Emperor%)  Too Weak') ~= nil, lines[1]);
local emperor_rules = monsters.ph_details(monsters.find(103, 330), 330);
check('Valkurm Emperor uses the loaded era cooldown, not its PH helper argument', emperor_rules ~= nil
    and emperor_rules[1].chance == 10 and emperor_rules[1].cooldown_min == 3600 and emperor_rules[1].cooldown_max == 3600);
MOCK.command('/checkmate id on');
lines = readout(103, 330, 'Damselfly', 21, 0);
check('after its ID', lines[1]:find('^%[checkmate%] Damselfly %(Lv 21, range 21%-22%) %(ID 17199434%) %(PH for Valkurm '
    .. 'Emperor%)  Too Weak') ~= nil, lines[1]);
MOCK.command('/checkmate id off');
lines = readout(103, 331, 'Damselfly', 21, 0);
check('the one at 331 isn\'t a PH', lines[1]:find('^%[checkmate%] Damselfly %(Lv 21, range 21%-22%)  Too Weak') ~= nil,
    lines[1]);
-- A Damselfly a script spawns mid-game has an index of 0x800 or more and no row, so it gets nothing.
lines = readout(103, 0x805, 'Damselfly', 21, 0);
check('nor is one a script spawned', lines[1]:find('^%[checkmate%] Damselfly %(Lv 21%)  Too Weak') ~= nil, lines[1]);
check('and nothing with no row, or an NM with no row', monsters.ph_for(nil, 330) == nil
    and monsters.ph_for({ ph_for = { [330] = { 4095 } } }, 330) == nil);
lines = readout(107, 124, 'Ornery Sheep', 7, 0);
check('a PH for both Carnero names it once', lines[1]:find('^%[checkmate%] Ornery Sheep %(Lv 7, range 7%-8%) %(PH for '
    .. 'Carnero%)  Too Weak') ~= nil, lines[1]);
lines = readout(108, 302, 'Rampaging Ram', 0, nil, 249);
check('an NM can be a PH too', lines[1]:find('^%[checkmate%] Rampaging Ram %(Lv 27%-28%) %(PH for Steelfleece Baldarich%)  '
    .. 'Impossible to Gauge') ~= nil, lines[1]);
MOCK.command('/checkmate ph off');
lines = readout(103, 330, 'Damselfly', 21, 0);
check('with it off the Damselfly at 330 prints as before', lines[1]:find('^%[checkmate%] Damselfly %(Lv 21, range 21%-22%)  '
    .. 'Too Weak') ~= nil, lines[1]);

-- The new part must read a regenerated row through the real addon too.
for _, part in pairs(s.printout.parts) do part.on = false; end
for _, key in ipairs({ 'family', 'vitals', 'blue' }) do s.printout.parts[key].on = true; end
MOCK.player.spell_data = false;
MOCK.zone_in(103);
MOCK.entities[98] = { Name = 'Goblin Tinkerer' };
local before, requests = #MOCK.printed, #MOCK.commands;
MOCK.packet(MOCK.check_packet(98, 19, 3, 174));
MOCK.frame();
local facts = table.concat(MOCK.printed_since(before), ' / ');
check('regenerated source facts reach chat with source maximums and unknown spellbook state',
    facts:find('Family: Goblin / Beastmen', 1, true) ~= nil
    and facts:find('HP and MP: HP ~367, MP ~484', 1, true) ~= nil
    and facts:find('Blue Magic: Bomb Toss (spellbook unknown)', 1, true) ~= nil, facts);
expect('Independent source facts do not send a parameter request', #MOCK.commands, requests);

return MOCK.report();
