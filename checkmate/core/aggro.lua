--[[
    Whether the monster you /check aggroes you at your level, how it finds you, and what links with it.

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

-- What the part says for each answer. Color by threat paints a threat in the Threat color and the
-- rest in the Safe color.
local VERDICTS = {
    aggressive = { text = 'Aggressive',                             threat = true },
    any_level  = { text = 'Aggressive at any level',                threat = true },
    from_level = { text = 'Aggressive if it\'s level %d or higher', threat = true },
    unknown    = { text = 'Aggressive (level unknown)',             threat = true },
    too_weak   = { text = 'Too weak to aggro you unless you rest',  threat = false },
    passive    = { text = 'Not aggressive',                         threat = false },
    never      = { text = 'Never aggressive',                       threat = false },
};

-- How it finds you, by the names the data uses.
local DETECTION_WORDS = { sight = 'Sight', sound = 'Sound', magic = 'Magic', low_hp = 'Low HP', ability = 'Ability' };

-- With true detection, Invisible doesn't stop its sight and Sneak doesn't stop its hearing. Players call those
-- True Sight and True Sound. Nothing stops the other senses anyway.
local TRUE_WORDS = {
    sight = 'True Sight', sound = 'True Sound', magic = 'Magic', low_hp = 'Low HP', ability = 'Ability',
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
    superlink  = { 'Superlink' },
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
local NIGHT_SIGHT = '%s 18:00-5:59';

-- Notes for aggro that a mixin or the engine changes while the monster is up, keyed by aggro_note.
-- Monsters that sleep at night get their awake hours instead.
local NOTES = {
    form        = 'not in its ball form',
    apkallu     = 'changes with the zone\'s apkallu hate',
    fomor_hate  = 'only if you have fomor hate',
    underground = 'only above ground',
};

-- The note for any other script that changes its aggro.
local SCRIPTED = 'can change in the fight';

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

-- How it finds you, like { 'True Sight', 'True Sound', 'Magic' }.
local function detection(row)
    local words = {};
    local names = row.true_detect and TRUE_WORDS or DETECTION_WORDS;
    if (row.aggro_note == 'night_sight') then
        words[1] = NIGHT_SIGHT:format(names.sight);
    end
    for _, id in ipairs(row.detects or {}) do
        words[#words + 1] = names[id];
    end
    if (row.ambush) then
        words[#words + 1] = 'Ambush';
    end
    return words;
end

-- The notes, like { 'awake 6:00-20:59', 'can change in the fight' }.
local function notes(row)
    local out = {};
    local hours = row.aggro_hours;
    if (row.aggro_note == 'sleeps') then
        out[1] = hours and ('awake %d:00-%d:59'):format(hours[1], hours[2]) or 'always asleep';
    elseif (NOTES[row.aggro_note] ~= nil) then
        out[1] = NOTES[row.aggro_note];
    end
    if (row.flags ~= nil and row.flags.scripted_aggro) then
        out[#out + 1] = SCRIPTED;
    end
    return out;
end

--[[
    Every link name once, in alphabetical order, and how each one links, like "Sight" or "True Sight,
    True Sound". A name in two groups gets both, like "Sight or Sound". A group with no words adds
    nothing, so a name only in neither gets an empty tag.
]]
local function link_list(links)
    local names, tags = {}, {};
    for _, way in ipairs(aggro.LINK_WAYS) do
        local tag = table.concat(aggro.LINK_WORDS[way], ', ');
        for _, name in ipairs(links[way] or {}) do
            if (tags[name] == nil) then
                names[#names + 1] = name;
                tags[name] = tag;
            elseif (tag ~= '') then
                tags[name] = (tags[name] == '') and tag or (tags[name] .. ' or ' .. tag);
            end
        end
    end
    table.sort(names);
    return names, tags;
end

-- The link names to show, how each of those links with Show how each one links on, and how many more
-- there are past the most shown.
local function link_names(links, setting)
    local all, tags = link_list(links);
    local names, shown = {}, {};
    local most = setting.max_links or 0;
    for _, name in ipairs(all) do
        if (most == 0 or #names < most) then
            names[#names + 1] = name;
            shown[#shown + 1] = tags[name];
        end
    end
    return names, setting.link_how and shown or nil, #all - #names;
end

-- Every word for how its link names link, each once and in the order of LINK_WAYS, like
-- { 'Sight', 'Sound' }. It stands in for the tags when the names are off.
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
    The aggro part for a data row, with your aggro settings.
    Returns { text, threat, detects, notes, links, names, tags, senses, more }. `text` is the verdict,
    and `threat` is true when the verdict is a threat. `detects` lists how it finds you, but only when
    it can aggro you and Detection is on. `links` is true when it links. `names` holds the link names
    to show, or nil with the names off, and `tags` how each of those links, like 'Sight', or '' for
    one with no words, or nil with Show how each one links off. With the names off and that on,
    `senses` holds every word for how they link, like { 'Sight', 'Sound' }. `more` counts the names
    past the most shown.
]]
function aggro.readout(row, check, my_level, setting)
    local key, from = verdict(row, check, my_level);
    local shown = VERDICTS[key];
    local out = {
        text    = shown.text,
        threat  = shown.threat,
        detects = {},
        notes   = notes(row),
        links   = row.links ~= nil and next(row.links) ~= nil,
        more    = 0,
    };
    if (from ~= nil) then
        out.text = shown.text:format(from);
    end
    if (shown.threat and setting.detection) then
        out.detects = detection(row);
    end
    if (out.links and setting.link_names) then
        out.names, out.tags, out.more = link_names(row.links, setting);
    elseif (out.links and setting.link_how) then
        out.senses = link_senses(row.links);
    end
    return out;
end

return aggro;
