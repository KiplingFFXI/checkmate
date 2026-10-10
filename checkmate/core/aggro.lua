--[[
    Whether the monster you /check aggroes you at your level and how it finds you, and what links with it,
    for the aggro and links parts.

    The server lets an aggressive monster aggro you only when it checks as more than Too Weak to your
    own main level (zone_entities.cpp tapMobAggro). Your /check con comes from that same test
    (0x0dd_equip_inspect.cpp), so a Too Weak con means it won't aggro you. Resting or sitting lets it
    aggro you anyway, and a monster that aggroes at any level skips the test.
    A monster that's impossible to gauge gives no con. Its level from widescan, or else the range in
    its data, goes against the Too Weak table in data\too_weak.lua instead.

    The link names come from the data. They are every kind of monster that can end up in the fight
    when you pull it, each with how it links.
]]

local too_weak = require('data.too_weak');

local aggro = {};

-- Most link names the settings offer. 0 shows every name.
aggro.MAX_LINKS = 12;

-- The /check con for Too Weak.
local TOO_WEAK = 0;

-- The Too Weak table covers main levels 1 to 99.
local LEVEL_MIN = 1;
local LEVEL_MAX = 99;

-- What the part says for each answer, by its key in core\wording.lua. Color by threat paints a threat in the
-- Threat color and the rest in the Safe color.
local VERDICTS = {
    aggressive = { word = 'aggro_aggressive', threat = true },
    any_level  = { word = 'aggro_any_level',  threat = true },
    from_level = { word = 'aggro_from_level', threat = true },
    unknown    = { word = 'aggro_unknown',    threat = true },
    too_weak   = { word = 'aggro_too_weak',   threat = false },
    passive    = { word = 'aggro_passive',    threat = false },
    never      = { word = 'aggro_never',      threat = false },
};

-- How it finds you, by the names the data uses, each a key in core\wording.lua.
local DETECTION_WORDS = {
    sight = 'sense_sight', sound = 'sense_sound', magic = 'sense_magic', low_hp = 'sense_low_hp',
    ability = 'sense_ability',
};

-- With true detection, Invisible doesn't stop its sight and Sneak doesn't stop its hearing. Players call those
-- True Sight and True Sound. Nothing stops the other senses anyway.
local TRUE_WORDS = {
    sight = 'sense_true_sight', sound = 'sense_true_sound', magic = 'sense_magic', low_hp = 'sense_low_hp',
    ability = 'sense_ability',
};

--[[
    How the monsters it links with join a fight, by the group the data puts each link name in, in the
    order a name in two groups lists them. CanLink (mob_entity.cpp) lets one that shares the caller's
    superlink in from anywhere, and makes one that sees but doesn't hear face the fight. The rest join
    from any side. The senses use the Detection words, so true detection says True Sight and True
    Sound, even though nothing about you stops a link. One that neither sees nor hears gets the words
    for what it notices instead, like Magic. The data calls one that notices none of those neither,
    like a Memory Receptacle that only smells you, and it gets no words. LINK_WAYS in
    tools\export\rows.py lists the same ways.
]]
aggro.LINK_WAYS = {
    'superlink', 'sight', 'true_sight', 'sound', 'true_sound', 'both', 'true_both', 'magic', 'neither',
};
aggro.LINK_WORDS = {
    superlink  = { 'sense_superlink' },
    sight      = { DETECTION_WORDS.sight },
    true_sight = { TRUE_WORDS.sight },
    sound      = { DETECTION_WORDS.sound },
    true_sound = { TRUE_WORDS.sound },
    both       = { DETECTION_WORDS.sight, DETECTION_WORDS.sound },
    true_both  = { TRUE_WORDS.sight, TRUE_WORDS.sound },
    magic      = { DETECTION_WORDS.magic },
    neither    = {},
};

-- Imps hear you all day and also see you from 18:00 to 5:59 (scripts/mixins/families/imp_aggro.lua).
local NIGHT_HOURS = '18:00-5:59';

-- Notes for aggro that a mixin or the engine changes while the monster is up, keyed by aggro_note, each a key in
-- core\wording.lua. Monsters that sleep at night get their awake hours instead.
local NOTES = {
    form        = 'note_form',
    apkallu     = 'note_apkallu',
    fomor_hate  = 'note_fomor_hate',
    underground = 'note_underground',
};

-- The note for any other script that changes its aggro.
local SCRIPTED = 'note_scripted';

--[[
    The VERDICTS key for a data row and a /check, and for from_level the lowest level that aggroes
    you. `check` holds the con, nil when it's impossible to gauge, and the true level low..high.
    `my_level` is your main level.
]]
local function verdict(row, check, my_level)
    if (row.no_aggro) then
        return 'never';
    elseif (not row.aggro) then
        return 'passive';
    elseif (row.any_level) then
        return 'any_level';
    elseif (check.con ~= nil) then
        return (check.con == TOO_WEAK) and 'too_weak' or 'aggressive';
    end

    local highest = too_weak.highest[math.max(LEVEL_MIN, math.min(LEVEL_MAX, my_level or 0))];
    if (check.low == nil or highest == nil) then
        return 'unknown';
    end
    -- The table goes by the level /check shows, which is the true level plus level_mod.
    local cutoff = highest - (row.level_mod or 0);
    if (check.high <= cutoff) then
        return 'too_weak';
    elseif (check.low > cutoff) then
        return 'aggressive';
    end
    return 'from_level', cutoff + 1;
end

-- How it finds you, like { 'sense_true_sight', 'sense_true_sound' }, and the hours the first one sees you in when
-- it only sees you at night.
local function detection(row)
    local keys, night = {}, nil;
    local names = row.true_detect and TRUE_WORDS or DETECTION_WORDS;
    if (row.aggro_note == 'night_sight') then
        keys[1], night = names.sight, NIGHT_HOURS;
    end
    for _, id in ipairs(row.detects or {}) do
        keys[#keys + 1] = names[id];
    end
    if (row.ambush) then
        keys[#keys + 1] = 'sense_ambush';
    end
    return keys, night;
end

-- The notes, like { 'note_awake', 'note_scripted' }, and the awake hours that go with note_awake, like '6:00-20:59'.
local function notes(row)
    local out, awake = {}, nil;
    local hours = row.aggro_hours;
    if (row.aggro_note == 'sleeps' and hours ~= nil) then
        out[1], awake = 'note_awake', ('%d:00-%d:59'):format(hours[1], hours[2]);
    elseif (row.aggro_note == 'sleeps') then
        out[1] = 'note_asleep';
    elseif (NOTES[row.aggro_note] ~= nil) then
        out[1] = NOTES[row.aggro_note];
    end
    if (row.flags ~= nil and row.flags.scripted_aggro) then
        out[#out + 1] = SCRIPTED;
    end
    return out, awake;
end

--[[
    Every link name once, in alphabetical order, and how each one links: the ways it links, each a list of keys
    like { 'sense_sight', 'sense_sound' }. A name in two groups gets both, which print like "Sight or Sound". A
    group with no words adds nothing, so a name only in neither gets an empty list.
]]
local function link_list(links)
    local names, tags, signatures = {}, {}, {};
    for index, way in ipairs(aggro.LINK_WAYS) do
        local keys = aggro.LINK_WORDS[way];
        for _, name in ipairs(links[way] or {}) do
            if (tags[name] == nil) then
                names[#names + 1] = name;
                tags[name] = {};
                signatures[name] = '';
            end
            signatures[name] = signatures[name] .. index .. ':';
            if (#keys > 0) then
                table.insert(tags[name], keys);
            end
        end
    end
    table.sort(names);
    return names, tags, signatures;
end

-- Only combine names with the same family and the same ways of joining the fight.
local function family_names(all, tags, signatures, families)
    local entries, groups, grouped = {}, {}, false;
    for _, name in ipairs(all) do
        local family = families[name];
        if (family ~= nil) then
            local key = family.id .. ':' .. signatures[name];
            local group = groups[key];
            if (group == nil) then
                group = { name = name, first = name, family = family.name, tags = tags[name] };
                groups[key] = group;
                entries[#entries + 1] = group;
            else
                group.name, grouped = group.family .. ' family', true;
            end
        else
            entries[#entries + 1] = { name = name, first = name, tags = tags[name] };
        end
    end
    table.sort(entries, function (a, b)
        if (a.name == b.name) then return a.first < b.first; end
        return a.name < b.name;
    end);
    return entries, grouped;
end

-- The limit counts the entries after grouping. The full names stay in the details.
local function link_names(all, tags, signatures, families, setting)
    local entries, grouped;
    if (setting.group_families ~= false and families ~= nil) then
        entries, grouped = family_names(all, tags, signatures, families);
    else
        entries = {};
        for _, name in ipairs(all) do entries[#entries + 1] = { name = name, tags = tags[name] }; end
    end
    local names, shown = {}, {};
    local most = setting.max_links or 0;
    for _, entry in ipairs(entries) do
        if (most == 0 or #names < most) then
            names[#names + 1] = entry.name;
            shown[#shown + 1] = entry.tags;
        end
    end
    return names, setting.link_how and shown or nil, #entries - #names, grouped;
end

-- Every word for how its link names link, each once and in the order of LINK_WAYS, like
-- { 'sense_sight', 'sense_sound' }. It stands in for the tags when the names are off.
local function link_senses(links)
    local has = {};
    for _, way in ipairs(aggro.LINK_WAYS) do
        if (links[way] ~= nil) then
            for _, word in ipairs(aggro.LINK_WORDS[way]) do
                has[word] = true;
            end
        end
    end
    local words = {};
    for _, way in ipairs(aggro.LINK_WAYS) do
        for _, word in ipairs(aggro.LINK_WORDS[way]) do
            if (has[word]) then
                words[#words + 1] = word;
                has[word] = nil;
            end
        end
    end
    return words;
end

--[[
    The aggro part for a data row, with your aggro settings. Every word in it is a key in core\wording.lua.
    Returns { verdict, from, threat, detects, night, notes, hours }. `verdict` is the answer, `from` the lowest
    level that aggroes you for aggro_from_level, or nil, and `threat` is true when the answer is a threat.
    `detects` lists how it finds you, but only when it can aggro you and Detection is on, and `night` is the hours
    the first of them sees you in when it only sees you at night. `hours` is the awake hours for note_awake.
]]
function aggro.readout(row, check, my_level, setting)
    local key, from = verdict(row, check, my_level);
    local shown = VERDICTS[key];
    local out = { verdict = shown.word, from = from, threat = shown.threat, detects = {} };
    out.notes, out.hours = notes(row);
    if (shown.threat and setting.detection) then
        out.detects, out.night = detection(row);
    end
    return out;
end

--[[
    The links part for a data row, with your links settings.
    Returns { links, names, tags, senses, more }, with wording keys in the tags and senses. `links` is true
    when it links. `names` holds the link names to show, or nil with the names off, and `tags` how each of those
    links, or nil with Show how each one links off. Each tag lists the ways that name links, each a list of keys
    like { 'sense_sight' }, and it's empty for one with no words. With the names off and Show how each one links
    on, `senses` holds every word for how they link, like { 'sense_sight', 'sense_sound' }. `more` counts the
    entries past the most shown. Family entries combine only matching link conditions; all_names and all_tags
    keep the original names for the details.
]]
function aggro.links(row, setting)
    local out = { links = row.links ~= nil and next(row.links) ~= nil, more = 0 };
    local signatures;
    if (out.links) then
        out.all_names, out.all_tags, signatures = link_list(row.links);
    end
    if (out.links and setting.link_names) then
        out.names, out.tags, out.more, out.grouped = link_names(out.all_names, out.all_tags,
            signatures, row.link_families, setting);
    elseif (out.links and setting.link_how) then
        out.senses = link_senses(row.links);
    end
    return out;
end

return aggro;
