-- Tests the real generated monster data. Every zone file has to load and have the shape the addon
-- reads, with each link list written once, grouped by how each one links, and each placeholder naming
-- an NM in the same file. Rows worked out by hand for the open world, NMs, placeholders, battlefields,
-- Limbus, Dynamis and Assault have to match, magic damage included, and a /check of real monsters has
-- to print through the addon. The pet data has to load too.
local bands    = require('data.bands');
local drops    = require('core.drops');
local monsters = require('core.monsters');
local printout = require('core.printout');
local aggro    = require('core.aggro');

-- Every zone file ------------------------------------------------------------------------------

local IMMUNITY_ORDER = {};
for i, entry in ipairs(printout.IMMUNITIES) do IMMUNITY_ORDER[entry.id] = i; end
local RANKS = {};
for _, name in ipairs({ 'fire', 'ice', 'wind', 'earth', 'thunder', 'water', 'light', 'dark', 'dark_sleep', 'light_sleep',
    'bind', 'gravity', 'silence', 'stun', 'paralyze', 'slow', 'poison', 'blind' }) do RANKS[name] = true; end
local FLAGS = { scripted_stats = true, scripted_drops = true, exp_only = true, scripted_aggro = true, scripted_elements = true };
local ROW_KEYS = { name = true, ids = true, nm = true, levels = true, spawn_levels = true, level_mod = true, ranks = true, meva = true,
    resist = true, magic_dmg = true, absorb = true, nullify = true, undead = true, immune = true, drops = true, flags = true,
    aggro = true, any_level = true, no_aggro = true, detects = true, true_detect = true, ambush = true, aggro_note = true,
    aggro_hours = true, links = true, ph_for = true };
-- magic_dmg is a percent change from -100 to +200. absorb and nullify are chances up to 100. Each has
-- 'all' for every element and the eight elements.
local MAGIC_RANGES = { magic_dmg = { -100, 200 }, absorb = { 0, 100 }, nullify = { 0, 100 } };
local MAGIC_KEYS = { all = true, fire = true, ice = true, wind = true, earth = true, thunder = true, water = true, light = true,
    dark = true };
-- Aggro fields that are either true or left out, the order the data lists detection in, and the known notes.
local TRUE_ONLY = { 'aggro', 'any_level', 'no_aggro', 'true_detect', 'ambush' };
local DETECT_ORDER = { sight = 1, sound = 2, magic = 3, low_hp = 4, ability = 5 };
local AGGRO_NOTES = { sleeps = true, night_sight = true, form = true, apkallu = true, fomor_hate = true, underground = true };
local STATS = { 'acc', 'eva', 'agi', 'int', 'mnd', 'chr' };

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
    local lists, used, seen = file.link_lists, {}, {};
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
        local key = {};
        for _, way in ipairs(aggro.LINK_WAYS) do
            if (list[way] ~= nil) then key[#key + 1] = way .. ':' .. table.concat(list[way], '|'); end
        end
        key = table.concat(key, ' ');
        if (seen[key]) then return 'list ' .. number .. ' is written twice'; end
        seen[key] = true;
    end
    if (count ~= #lists) then return 'lists not numbered from 1'; end
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
    if (count == 0) then return 'empty ph_for'; end
    return nil;
end

-- The first problem with a row, or nil.
local function row_problem(row)
    for key in pairs(row) do
        if (not ROW_KEYS[key]) then return 'unknown key ' .. tostring(key); end
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
    end
    if ((row.nm ~= nil and row.nm ~= true) or (row.undead ~= nil and row.undead ~= true)) then
        return 'nm or undead not true';
    end
    if (row.level_mod ~= nil and not whole(row.level_mod, -10, 10)) then return 'bad level_mod'; end
    if (row.ranks ~= nil and not ranks_ok(row.ranks)) then return 'bad ranks'; end
    if ((row.meva ~= nil and not numbers(row.meva)) or (row.resist ~= nil and not numbers(row.resist))) then
        return 'bad meva or resist';
    end
    if (magic_problem(row)) then return magic_problem(row); end
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
    for key, value in pairs(row.flags or {}) do
        if (not FLAGS[key] or value ~= true) then return 'bad flag ' .. tostring(key); end
    end
    return spawn_levels_problem(row) or aggro_problem(row);
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
check('about 3,800 rows link, through about 2,000 link lists', linked_rows >= 3700 and lists <= 2100,
    linked_rows .. ' rows, ' .. lists .. ' lists');
local unused = {};
for _, way in ipairs(aggro.LINK_WAYS) do
    if (not ways_used[way]) then unused[#unused + 1] = way; end
end
check('every way of linking shows up somewhere in the data', #unused == 0, table.concat(unused, ', '));

local not_ascii = {};
for _, path in ipairs(ADDON_FILES) do
    local f = io.open(ADDON_DIR .. '/' .. path, 'rb');
    local text = f:read('*a');
    f:close();
    if (text:find('[^\9\10\13\32-\126]')) then
        table.insert(not_ascii, path);
    end
end
check('every addon file is plain ASCII', #not_ascii == 0, table.concat(not_ascii, ', '));

-- The level band file.
check('bands has 86 levels', #bands.rows == 86, #bands.rows);
local b75;
for _, row in ipairs(bands.rows) do if (row[1] == 75) then b75 = row; end end
check('the level 75 band', b75 and table.concat(b75, ',') == '75,313,321,279,304,66,82');

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
local beaucedine = loadfile(ADDON_DIR .. '/data/zones/134.lua')();
local beaucedine_rows = 0;
for _, each in ipairs(beaucedine.monsters) do beaucedine_rows = beaucedine_rows + (each.links and 1 or 0); end
check('Dynamis-Beaucedine writes 78 link lists for its 165 linked rows', #beaucedine.link_lists == 78 and beaucedine_rows == 165,
    #beaucedine.link_lists .. ' lists, ' .. beaucedine_rows .. ' rows');
row = find(134, 'Vanguard Liberator', 2);
local liberator = row and row.links.true_both;
check('and a row there gets its names back', liberator ~= nil and #liberator > 100 and liberator[1] < liberator[2],
    liberator and #liberator);
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
    .. 'true_both: Dark Bugler, Verdelet, Zikko', links_of(row));

-- How each one links, worked out by hand from CanLink and each helper's senses.
row = find(33, 'Jailer of Love', 464);
check('Jailer of Love shares a superlink with its pets', links_of(row) == 'superlink: Qnhpemde, Qnxzomit, Ruphuabo',
    links_of(row));
row = find(118, 'Zu', 14);
check('Buburimu Peninsula Zu: the birds see and the Zu hear', links_of(row) == 'sight: Abyssdiver, Helldiver / sound: Zu',
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
row = find(159, 'Tonberrys Elemental', 12);
check('Temple of Uggalepih elementals notice magic', links_of(row) == 'magic: Clawberrys Elemental, Tonberrys Elemental',
    links_of(row));
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

-- Through the addon ------------------------------------------------------------------------------

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';
for _, id in ipairs(printout.PARTS) do s.printout.parts[id].on = true; end
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
check('Fire Elemental in Valkurm Dunes', #lines == 7 and lines[1] == '[checkmate] Fire Elemental (Lv 39)  Too Weak',
    table.concat(lines, ' / '));
check('its hit, evade and crit on their own line', lines[2] == '[checkmate] Hit: 95%  Evade: 80%  Crit: 9%', lines[2]);
check('its aggro, too weak for a 75', lines[3] == '[checkmate] Aggro: Too weak to aggro you unless you rest  Doesn\'t link',
    lines[3]);
check('its magic', lines[4] and lines[4]:find('^%[checkmate%] Magic: Elemental %d+%% %(%a+%)  Enfeebling %d+%%$') ~= nil, lines[4]);
check('its immunities', lines[5] == '[checkmate] Immune: Bind, Paralyze', lines[5]);
check('its elements', lines[6] == '[checkmate] Elements: Weak: Water  Resists: Fire, Ice (never lands)', lines[6]);
check('its drops', lines[7] == '[checkmate] Drops (TH 0): Fire Crystal 100%', lines[7]);
lines = readout(103, 82, 'Fire Elemental', 39, 5);
check('and aggressive by magic when it checks Tough', lines[3] == '[checkmate] Aggro: Aggressive (Magic)  Doesn\'t link', lines[3]);

-- The rest keep hit, evade and crit on the /check line.
MOCK.command('/checkmate extras same');
lines = readout(103, 82, 'Fire Elemental', 39, 0);
check('Fire Elemental with the extras on the same line', #lines == 6 and lines[1] == '[checkmate] Fire Elemental (Lv 39)  '
    .. 'Too Weak  Hit: 95%  Evade: 80%  Crit: 9%' and lines[6] == '[checkmate] Drops (TH 0): Fire Crystal 100%',
    table.concat(lines, ' / '));

lines = readout(69, 1, 'Leujaoam Worm', 51, 0);
check('Leujaoam Worm under the level 50 cap', lines[1] == '[checkmate] Leujaoam Worm (Lv 51)  Too Weak  Hit: 95%  Evade: 57%  '
    .. 'Crit: 7%', lines[1]);
check('an Assault monster has no drops part', #lines == 4 and not table.concat(lines, ' / '):find('Drops', 1, true),
    table.concat(lines, ' / '));
check('and its elements', lines[4] == '[checkmate] Elements: Weak: Wind, Light', lines[4]);
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

return MOCK.report();
