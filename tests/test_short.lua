-- Tests short words. That covers the words table and its defaults, every key a readout hands over being in it, the
-- sample and the README's examples, every word swapped where it prints, empty boxes and the count, typed text that
-- looks like a format, both switches off leaving every line alone, the Links, Steal and Job parts and the element
-- icons with abbreviations on, the tips staying in full words, clashes and their notes on the Abbreviations tab, the commands
-- and help short, and the overlay with its own switch, its count and a lone bracket.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local printout = require('core.printout');
local wording  = require('core.wording');
local defaults = require('ui.defaults');
local spells   = require('data.spells');
local elements = require('core.elements');
local aggro    = require('core.aggro');
local magic    = require('core.magic');
local icons    = require('ui.icons');
local tips     = require('ui.tips');
local function cur() return MOCK.settings.current; end
local function has(text, want) return (text or ''):find(want, 1, true) ~= nil; end

local STAR = ' \129\154 ';

-- How many times `want` is in `text`.
local function count(text, want)
    local found, at = 0, 1;
    while (true) do
        local first, last = text:find(want, at, true);
        if (first == nil) then return found; end
        found, at = found + 1, last + 1;
    end
end

-- `text` with the first `old` in it swapped for `new`.
local function swap(text, old, new)
    local at = text:find(old, 1, true);
    if (at == nil) then return nil; end
    return text:sub(1, at - 1) .. new .. text:sub(at + #old);
end

-- Chat bytes over 127 as Lua escapes, so a failed check prints.
local function bytes(text) return (tostring(text):gsub('[^\32-\126]', function (c) return '\\' .. c:byte(); end)); end

-- Fresh default settings, the way a reset leaves them.
local function fresh()
    MOCK.settings.reset();
    return cur();
end

-- What one command answers, each line without its tag, joined with ' / ', and how many times it saved.
local function answer(text)
    local n, saves = #MOCK.printed, MOCK.saved;
    MOCK.command(text);
    local lines = MOCK.printed_since(n);
    for i, line in ipairs(lines) do
        lines[i] = line:gsub('^%[checkmate%] ', '');
    end
    return table.concat(lines, ' / '), MOCK.saved - saves;
end
local function says(text, want, saves)
    local got, saved = answer(text);
    check(text .. ' says so', got == want and saved == (saves or 1), ('%s (saved %d)'):format(got, saved));
end

-- The table ------------------------------------------------------------------------------------------

local PREFIXES = {};
for prefix in ('con read num pdif aggro sense note link list school magic eff elem weapon info str drops steal line job'):gmatch('%S+') do
    PREFIXES[prefix] = true;
end
local function printable(text) return not text:find('[^\32-\126]'); end
local function balanced(text)
    local _, opens = text:gsub('%(', '');
    local _, closes = text:gsub('%)', '');
    return opens == closes;
end
local keys_ok, ascii_ok, short_ok, bare_ok, marks_ok, answer_ok = true, true, true, true, true, true;
local spots, with_spot, seen = {}, 0, {};
for _, entry in ipairs(wording.LIST) do
    local prefix = entry.key:match('^(%l+)_[%l_]+$');
    keys_ok = keys_ok and prefix ~= nil and PREFIXES[prefix] and not seen[entry.key] and wording.BY_KEY[entry.key] == entry;
    seen[entry.key] = true;
    ascii_ok = ascii_ok and printable(entry.full) and printable(entry.short);
    short_ok = short_ok and #entry.short <= printout.LABEL_MAX and (entry.short ~= '' or entry.key == 'list_more');
    bare_ok = bare_ok and ((entry.bare == true) == (entry.key == 'list_more'));
    marks_ok = marks_ok and balanced(entry.short) and not entry.short:find('%', 1, true);
    if (entry.spot == 'answer') then
        answer_ok = answer_ok and not entry.short:find('[%(%)]');
    end
    if (entry.spot ~= nil) then
        with_spot = with_spot + 1;
        spots[entry.spot] = spots[entry.spot] or {};
        table.insert(spots[entry.spot], entry);
    end
end
check('158 words in 15 groups', #wording.LIST == 158 and #wording.GROUPS == 15, #wording.LIST .. ' in ' .. #wording.GROUPS);
check('every key is its own and starts with a part', keys_ok);
check('every word and short form is plain ASCII', ascii_ok);
check('every short form fits a box, and only the word after a count comes empty', short_ok);
check('and only that one is bare', bare_ok);
check('no short form checkmate comes with has a lone bracket or a %', marks_ok);
check('and no aggro answer has a bracket at all', answer_ok);
local names = {};
for spot in pairs(spots) do names[#names + 1] = spot; end
table.sort(names);
expect('16 spots, with 139 words in them', table.concat(names, ' ') .. ' ' .. with_spot, 'after_answer answer con drop_note '
    .. 'effect element eva_def high_low info job link school school_word strength swings weapon 139');
local apart = true;
for _, list in pairs(spots) do
    local shorts, fulls = {}, {};
    for _, entry in ipairs(list) do
        apart = apart and not shorts[entry.short:lower()] and not fulls[entry.full:lower()];
        shorts[entry.short:lower()], fulls[entry.full:lower()] = true, true;
    end
end
check('no two words in one spot come with the same short form or have the same full word', apart);

local schools_ok = true;
for _, id in ipairs(spells.SCHOOL_ORDER) do
    schools_ok = schools_ok and wording.BY_KEY['school_' .. id].full == (id == 'blue' and 'Spell chance' or spells.schools[id].label);
end
check('the school words are the Magic tab\'s', schools_ok and #spells.SCHOOL_ORDER == 8);
local letters_ok, element_count = true, 0;
for _, id in ipairs(elements.ORDER) do
    local entry = wording.BY_KEY[wording.ELEMENT_KEYS[id]];
    element_count = element_count + 1;
    letters_ok = letters_ok and entry ~= nil and entry.short == icons.LETTERS[id];
end
check('every element has a word, and its short form is its badge letter, so the two never drift apart',
    letters_ok and element_count == 8);

local user = {};
for _, key in ipairs({ 'sense_sight', 'sense_sound', 'sense_true_sight', 'sense_true_sound', 'aggro_passive',
    'aggro_never', 'link_none' }) do
    user[#user + 1] = wording.BY_KEY[key].short;
end
expect('Sight, Sound, True Sight and True Sound are S, H, TS and TH, and the no answers stay words',
    table.concat(user, ','), 'S,H,TS,TH,Passive,Never,No link');

local JOBS = { 'war', 'mnk', 'whm', 'blm', 'rdm', 'thf', 'pld', 'drk', 'bst', 'brd', 'rng', 'sam', 'nin', 'drg', 'smn',
    'blu', 'cor', 'pup', 'dnc', 'sch', 'geo', 'run' };
local jobs = wording.GROUPS[#wording.GROUPS];
local jobs_ok = jobs.name == 'Jobs' and #jobs.words == 22;
for index, key in ipairs(JOBS) do
    local entry = jobs.words[index];
    jobs_ok = jobs_ok and entry ~= nil and entry.key == 'job_' .. key and entry.full == key:upper()
        and entry.short == entry.full and entry.spot == 'job' and entry.name ~= nil and entry.label == nil;
end
check('Jobs comes last, the 22 jobs in the game\'s order, each already short so it comes as its own letters',
    jobs_ok and wording.BY_KEY.job_drk.name == 'Dark Knight');

local examples = {};
for _, pair in ipairs({ { 'aggro_from_level', 'A if Lv' }, { 'note_awake', 'awake' }, { 'drops_exp', 'EXP only' },
    { 'list_more', '' }, { 'list_more', 'more' }, { 'con_tough', 'T' } }) do
    examples[#examples + 1] = wording.example(wording.BY_KEY[pair[1]], pair[2]);
end
expect('each one reads with what goes around it', table.concat(examples, '|'),
    'A if Lv 30+|awake 6:00-20:59|(EXP only)|+2|+2 more|T');

local made = defaults.make();
local all_there, extra = true, 0;
for _, entry in ipairs(wording.LIST) do
    all_there = all_there and made.short[entry.key] == entry.short;
end
for key in pairs(made.short) do
    if (wording.BY_KEY[key] == nil) then extra = extra + 1; end
end
check('the defaults have every short form and nothing else, with both switches off', all_there and extra == 0
    and made.printout.short_words == false and made.overlay.short_words == false);
local mine = { con_tough = 'x', list_more = 'more' };
local reset_ok = wording.reset(mine) == mine;
for _, entry in ipairs(wording.LIST) do
    reset_ok = reset_ok and mine[entry.key] == entry.short;
end
check('wording.reset puts every short form back in the table it gets and hands that table back', reset_ok);

-- Every key a readout hands over, over every row of these zones, with detection, the link names and how on and
-- off, at a few /checks and every school.
local missing, keys = {}, 0;
local function need(key)
    keys = keys + 1;
    if (wording.BY_KEY[key] == nil) then missing[#missing + 1] = tostring(key); end
end
local me = { level = 75, skills = { [33] = 276, [34] = 276, [35] = 276, [36] = 276, [37] = 276, [39] = 276,
    [40] = 276, [41] = 276, [42] = 276, [43] = 276 }, buffs = {}, extra_accuracy = 0, int = 80, mnd = 80, chr = 80 };
local schools = {};
for _, id in ipairs(spells.SCHOOL_ORDER) do
    schools[id] = { on = true, spell = spells.schools[id].spells[1].id };
end
for _, zone in ipairs({ 103, 79, 2, 51, 54, 61, 126, 159, 205, 37 }) do
    local file = assert(loadfile(('%sdata/zones/%d.lua'):format(ADDON_PATH, zone)))();
    for _, row in ipairs(file.monsters) do
        if (type(row.links) == 'number') then row.links = (file.link_lists or {})[row.links]; end
        for _, detection in ipairs({ true, false }) do
            for _, check_result in ipairs({ { con = 4 }, { con = 0 }, {}, { low = 20, high = 40 } }) do
                local a = aggro.readout(row, check_result, 60, { detection = detection });
                need(a.verdict);
                for _, key in ipairs(a.detects) do need(key); end
                for _, key in ipairs(a.notes) do need(key); end
            end
        end
        for _, setting in ipairs({ { link_names = true, link_how = true, max_links = 0 },
            { link_names = false, link_how = true }, { link_names = true, link_how = false, max_links = 5 } }) do
            local l = aggro.links(row, setting);
            for _, ways in ipairs(l.tags or {}) do
                for _, each in ipairs(ways) do
                    for _, key in ipairs(each) do need(key); end
                end
            end
            for _, key in ipairs(l.senses or {}) do need(key); end
        end
        local e = elements.readout(row, nil);
        for _, list in ipairs(e and { e.weak, e.resists } or {}) do
            for _, entry in ipairs(list) do
                need(wording.ELEMENT_KEYS[entry.element]);
                if (entry.strength ~= nil) then need(entry.strength); end
            end
        end
        local lowest;
        for level in pairs(row.levels or {}) do lowest = math.min(lowest or level, level); end
        if (lowest ~= nil) then
            for _, school in ipairs(magic.readout(me, { row = row, low = lowest, high = lowest }, { schools = schools })) do
                need(school.school);
                if (school.word ~= nil) then need(school.word); end
                if (school.element ~= nil) then need(wording.ELEMENT_KEYS[school.element]); end
            end
        end
        local main, sub = (row.job or ''):match('^(%l+)/(%l+)$');
        if (main ~= nil) then
            need('job_' .. main);
            if (sub ~= 'none') then need('job_' .. sub); end
        end
    end
end
for _, key in pairs(require('core.effects').WORDS) do need(key); end
check('every key the readouts hand over is in the table', #missing == 0 and keys > 10000,
    keys .. ' keys, missing ' .. table.concat(missing, ', '):sub(1, 300));

-- The sample and the README's examples ---------------------------------------------------------------

-- The sample with every part and every school on.
fresh();
MOCK.command('/checkmate linkfamilies off');
for _, part in ipairs({ 'hit', 'offhand', 'ranged', 'evade', 'crit', 'job', 'magic', 'weaknesses', 'drops',
    'steal', 'pet' }) do
    MOCK.command('/checkmate show ' .. part);
end
for _, id in ipairs(spells.SCHOOL_ORDER) do
    MOCK.command('/checkmate school ' .. id .. ' on');
end
local full_sample = answer('/checkmate sample');
MOCK.command('/checkmate short on');
local short_sample = answer('/checkmate sample');
expect('the sample with abbreviations on', bytes(short_sample), bytes(table.concat({
    'Sample Goblin (Lv 42)' .. STAR .. 'DC (Lo Def)',
    'Hit: 64-72%' .. STAR .. 'Off-hand: 58-66%' .. STAR .. 'Ranged: 61-69%' .. STAR .. 'Evade: 31% w/Sig' .. STAR
        .. 'Crit: 7%',
    'Job: DRK/WAR',
    'Aggro: A (S)' .. STAR .. 'L Goblin Butcher (S), Goblin Leecher (S), Goblin Tinkerer (S)',
    'Magic: Ele 88% (I)' .. STAR .. 'Enf 81%' .. STAR .. 'Drk 95%' .. STAR .. 'Div 90%' .. STAR .. 'Heal 95%' .. STAR
        .. 'Nin 72% (I)' .. STAR .. 'Sing 85%',
    'Weaknesses: Weak: I, T' .. STAR .. 'Resists: Wa (1/2)' .. STAR .. 'Weak: Blunt (+25%), H2H (+12.5%)'
        .. STAR .. 'Resists: Slash (-12.5%), Pierce (-50%)' .. STAR .. 'Immune: Sleep, Bind, Gravity' .. STAR .. 'Charm: Cannot charm',
    'Drops (TH 0): Item 930 15%, Item 508 5.0%, Item 507 1.0%, Item 656 1.0%',
    'Steal: Item 656 (54%) (cond)',
    'Pet: Wyvern (Lv 42)' .. STAR .. 'Hit: 88%' .. STAR .. 'Evade: 27%',
}, ' / ')));
MOCK.command('/checkmate linkfamilies on');
local grouped_sample = answer('/checkmate sample');
check('family grouping keeps abbreviated link words and conditions', has(grouped_sample, 'L Goblin family (S)')
    and not has(grouped_sample, 'Goblin Butcher'), bytes(grouped_sample));
MOCK.command('/checkmate linkfamilies off');
MOCK.command('/checkmate short off');
check('and with it off again it\'s the full sample', answer('/checkmate sample') == full_sample
    and has(full_sample, 'Decent Challenge (Low Defense)') and has(full_sample, 'Elemental 88% (Ice)'), bytes(full_sample));

-- The README's first example: a level 20 Red Mage with 18 AGI under Signet checks a Goblin Tinkerer in Valkurm
-- Dunes, with every part and the Elemental and Enfeebling schools on.
local function check_of(zone, index, name, level, con, message, reply)
    if (MOCK.player.zone ~= zone) then
        MOCK.zone_in(zone);
        MOCK.frame();
    end
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    if (con == nil) then
        MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(zone, index), 0, 0, message, index));
    else
        MOCK.packet(MOCK.check_packet(index, level, con, message));
    end
    MOCK.frame();
    if (reply ~= nil) then
        MOCK.wait(1.6);
        MOCK.reply(reply[1], reply[2]);
        MOCK.frame();
    end
    return table.concat(MOCK.printed_since(n), ' / ');
end
local pl = MOCK.player;
local before = { pl.main_job, pl.main_level, pl.sub_job, pl.sub_level, pl.stats[1], pl.stats[3], pl.skills, pl.buffs };
pl.main_job, pl.main_level, pl.sub_job, pl.sub_level = 5, 20, 0, 0;
pl.stats[1], pl.stats[3], pl.skills, pl.buffs = 20, 18, { [36] = 30, [35] = 60, [33] = 40, [34] = 40, [37] = 40 }, { 253 };
MOCK.items[508], MOCK.items[507], MOCK.items[656] = { Name = { 'Goblin Helm' } }, { Name = { 'Goblin Mail' } },
    { Name = { 'Beastcoin' } };
fresh();
MOCK.command('/checkmate linkfamilies off');
for _, part in ipairs({ 'hit', 'evade', 'crit', 'crittaken', 'job', 'magic', 'weaknesses', 'drops', 'steal' }) do
    MOCK.command('/checkmate show ' .. part);
end
MOCK.command('/checkmate school elemental on');
MOCK.command('/checkmate school enfeebling on');
local README_FULL = table.concat({
    '[checkmate] Goblin Tinkerer (Lv 19)' .. STAR .. 'Decent Challenge (Low Evasion)',
    '[checkmate] Hit: 81%' .. STAR .. 'Evade: 34% with Signet' .. STAR .. 'Crit: 5%' .. STAR .. 'Crit taken: 6%',
    '[checkmate] Job: DRK',
    '[checkmate] Aggro: Aggressive (Sight)' .. STAR .. 'Links with Goblin Ambusher (Sight), Goblin Bounty Hunter (Sight), '
        .. 'Goblin Butcher (Sight), Goblin Digger (Sight), Goblin Gambler (Sight)' .. STAR .. '+3 more',
    '[checkmate] Magic: Elemental 82% (Fire)' .. STAR .. 'Enfeebling 99%',
    '[checkmate] Weaknesses: Weak: Light' .. STAR .. 'Charm: Not charm eligible',
    '[checkmate] Drops (TH 0): Goblin Helm 5.0%, Beastcoin 1.0%, Goblin Mail 1.0%',
    '[checkmate] Steal: Beastcoin',
}, ' / ');
expect('the README\'s first example, as it prints', bytes(check_of(103, 32, 'Goblin Tinkerer', 19, 3, 177, { 77, 72 })),
    bytes(README_FULL));
MOCK.command('/checkmate short on');
expect('and with abbreviations on', bytes(check_of(103, 32, 'Goblin Tinkerer', 19, 3, 177, { 77, 72 })), bytes(table.concat({
    '[checkmate] Goblin Tinkerer (Lv 19)' .. STAR .. 'DC (Lo Eva)',
    '[checkmate] Hit: 81%' .. STAR .. 'Evade: 34% w/Sig' .. STAR .. 'Crit: 5%' .. STAR .. 'Crit taken: 6%',
    '[checkmate] Job: DRK',
    '[checkmate] Aggro: A (S)' .. STAR .. 'L Goblin Ambusher (S), Goblin Bounty Hunter (S), Goblin Butcher (S), '
        .. 'Goblin Digger (S), Goblin Gambler (S)' .. STAR .. '+3',
    '[checkmate] Magic: Ele 82% (F)' .. STAR .. 'Enf 99%',
    '[checkmate] Weaknesses: Weak: L' .. STAR .. 'Charm: Not charm eligible',
    '[checkmate] Drops (TH 0): Goblin Helm 5.0%, Beastcoin 1.0%, Goblin Mail 1.0%',
    '[checkmate] Steal: Beastcoin',
}, ' / ')));
MOCK.command('/checkmate weakword Wk');
MOCK.command('/checkmate resistword Res');
MOCK.command('/checkmate label job J');
local labeled = check_of(103, 32, 'Goblin Tinkerer', 19, 3, 177, { 77, 72 });
check('labels and the words you set stay yours with abbreviations on', has(labeled, 'Weaknesses: Wk: L')
    and has(labeled, '[checkmate] J: DRK'), bytes(labeled));
MOCK.command('/checkmate short off');
check('and with it off they print with the full words', has(check_of(103, 32, 'Goblin Tinkerer', 19, 3, 177, { 77, 72 }),
    'Weaknesses: Wk: Light'));

-- Its second example, a level 43 character who checks Valkurm Emperor before a widescan, with the default parts.
fresh();
pl.main_level = 43;
local emperor = check_of(103, 334, 'Valkurm Emperor', 0, nil, 249);
expect('Valkurm Emperor at 43', bytes(emperor), bytes('[checkmate] Valkurm Emperor (Lv 29-30)' .. STAR .. 'Impossible to '
    .. 'Gauge / [checkmate] Aggro: Aggressive if it\'s level 30 or higher (Sound)' .. STAR .. 'Links with Damselfly (Sound)'));
MOCK.command('/checkmate short on');
expect('says where it aggroes with the level and a +, and Sound is H', bytes(check_of(103, 334, 'Valkurm Emperor', 0, nil,
    249)), bytes('[checkmate] Valkurm Emperor (Lv 29-30)' .. STAR .. 'ITG / [checkmate] Aggro: A if Lv 30+ (H)' .. STAR
    .. 'L Damselfly (H)'));

-- An Orderly Imp in Caedarva Mire, with true detection and night sight. True Sound is TH, and the TH in the Drops
-- label stays Treasure Hunter.
pl.main_level = 70;
MOCK.command('/checkmate linkfamilies off');
MOCK.command('/checkmate show elements');
MOCK.command('/checkmate show drops');
local imp = check_of(79, 40, 'Orderly Imp', 63, 4, 174);
check('an Orderly Imp sees you at night, its hours after TS', has(imp, '[checkmate] Aggro: A (TS 18:00-5:59, TH)' .. STAR
    .. 'L Heraldic Imp (TH), Orderly Imp (TH), Zikko (TS, TH)') and has(imp, '[checkmate] Weaknesses: Weak: L' .. STAR
    .. 'Resists: D (1/2)') and has(imp, '[checkmate] Drops (TH 0): '), bytes(imp));
MOCK.command('/checkmate short off');
check('which in full is True Sight and True Sound', has(check_of(79, 40, 'Orderly Imp', 63, 4, 174), 'Aggro: Aggressive '
    .. '(True Sight 18:00-5:59, True Sound)' .. STAR .. 'Links with Heraldic Imp (True Sound), Orderly Imp (True Sound), '
    .. 'Zikko (True Sight, True Sound)'));

-- A Carmine Eruca in Wajaom Woodlands sleeps at night, so its awake hours follow your word for awake.
fresh();
MOCK.command('/checkmate short on');
local eruca = check_of(51, 193, 'Carmine Eruca', 70, 4, 174);
check('a sleeper\'s hours follow awake', has(eruca, '[checkmate] Aggro: A (H) (awake 6:00-20:59)' .. STAR
    .. 'L Carmine Eruca (H)'), bytes(eruca));
MOCK.command('/checkmate shortword note_awake up');
check('and your own word for it', has(check_of(51, 193, 'Carmine Eruca', 70, 4, 174), 'A (H) (up 6:00-20:59)'));
pl.main_job, pl.main_level, pl.sub_job, pl.sub_level, pl.stats[1], pl.stats[3], pl.skills, pl.buffs = unpack(before);
MOCK.items[508], MOCK.items[507], MOCK.items[656] = nil, nil, nil;

-- Every word is wired -----------------------------------------------------------------------------------

-- For each word, a made-up /check that prints it with only the parts it needs, and the piece of text it's in, with
-- short words off and with `marker` typed in its box.
local CON_OF = {};
for index, entry in ipairs(wording.GROUPS[1].words) do
    CON_OF[entry.key] = (entry.key ~= 'con_impossible') and index - 1 or nil;
end
local READING_OF = { read_high = { 0, 1 }, read_low = { 2, 1 }, read_evasion = { 0, 1 }, read_defense = { 1, 0 } };
local function case_of(key, marker)
    local result = { name = 'Mob', low = 30, high = 30 };
    local parts = {};
    local off, on = wording.BY_KEY[key].full, marker;
    local prefix, id = key:match('^(%l+)_(.+)$');
    if (prefix == 'con') then
        result.con, result.impossible = CON_OF[key], CON_OF[key] == nil;
    elseif (prefix == 'read') then
        result.reading, result.defense = READING_OF[key][1], READING_OF[key][2];
    elseif (key == 'num_unknown') then
        parts = { 'hit' };
    elseif (key == 'num_unavailable') then
        parts, result.block = { 'block' }, { eligible = false };
    elseif (key == 'num_no_shield' or key == 'num_cannot_parry' or key == 'num_job_unavailable') then
        local status = { num_no_shield = 'no_shield', num_cannot_parry = 'weapon_cannot_parry', num_job_unavailable = 'job_unavailable' };
        parts, result.block = { 'block' }, { eligible = false, status = status[key] };
    elseif (key == 'num_check_again') then
        parts, result.pdif = { 'pdif' }, { status = 'check_again' };
    elseif (key == 'num_signet') then
        parts, result.evade, result.signet = { 'evade' }, { low = 31, high = 31 }, true;
    elseif (key == 'num_far') then
        parts, result.shoots = { 'ranged' }, true;
        result.ranged, result.ranged_far = { low = 63, high = 63 }, { low = 55, high = 55 };
    elseif (key == 'num_distance') then
        parts, result.shoots, result.ranged = { 'ranged' }, true, { low = 63, high = 63 };
        result.ranged_distance = { distance = 12.5 };
    elseif (key == 'num_tp_moves') then
        parts, result.tp_moves = { 'crittaken' }, true;
    elseif (key == 'num_no_swings') then
        parts, result.no_swings = { 'crittaken' }, true;
    elseif (prefix == 'pdif') then
        parts = { 'pdif' };
        result.pdif = { low = 1, high = 1.5, ratio_low = 1.5, ratio_high = 1.5, attack = 150, defense_low = 100, defense_high = 100 };
    elseif (prefix == 'aggro') then
        result.aggro = { verdict = key, threat = true, detects = {}, notes = {} };
        if (key == 'aggro_from_level') then
            result.aggro.from, off, on = 30, off:format(30), marker .. ' 30+';
        end
    elseif (key == 'sense_superlink') then
        result.links = { links = true, names = { 'Zed' }, tags = { { { key } } }, more = 0 };
    elseif (prefix == 'sense') then
        result.aggro = { verdict = 'aggro_aggressive', threat = true, detects = { key }, notes = {} };
    elseif (prefix == 'note') then
        result.aggro = { verdict = 'aggro_aggressive', threat = true, detects = {}, notes = { key }, hours = '6:00-20:59' };
    elseif (key == 'link_links') then
        result.links, off, on = { links = true, names = { 'Zed' }, tags = { {} }, more = 0 }, 'Links with ', marker .. ' ';
    elseif (key == 'link_none') then
        result.links = { links = false };
    elseif (key == 'list_more') then
        result.links, off, on = { links = true, names = { 'Zed' }, tags = { {} }, more = 2 }, '+2 more', '+2 ' .. marker;
    elseif (prefix == 'school') then
        parts, result.magic = { key == 'school_blue' and 'blue' or 'magic' }, { { school = key, low = 50, high = 50 } };
    elseif (prefix == 'magic') then
        parts, result.magic = { 'magic' }, { { school = 'school_elemental', word = key } };
    elseif (key:find('eff_none', 1, true) == 1) then
        parts = { 'effects' };
        result.empty_filter = key == 'eff_none_buffs' and 'buffs' or (key == 'eff_none_debuffs' and 'debuffs' or 'both');
    elseif (prefix == 'eff') then
        parts, result.effects = { 'effects' }, { { effect = 4, word = key, left = 80, mine = true, debuff = true } };
    elseif (key == 'elem_mdt') then
        parts, result.elements = { 'weaknesses' }, { weak = {}, resists = {}, all = '-25%' };
    elseif (prefix == 'elem') then
        parts, result.elements = { 'weaknesses' }, { weak = { { element = id } }, resists = {} };
    elseif (prefix == 'info') then
        parts, result.info = { id == 'charm' and 'weaknesses' or id }, { sections = { { id = id, label = off, value = 'value', notes = {} } } };
    elseif (prefix == 'weapon') then
        parts, result.weapons = { 'weaknesses' }, { weak = { { kind = id, percent = 12.5 } }, resists = {} };
    elseif (prefix == 'str') then
        local amount = (key == 'str_nullify' or key == 'str_absorb') and '50%' or nil;
        parts, result.elements = { 'weaknesses' }, { weak = {}, resists = { { element = 'fire', strength = key, amount = amount } } };
    elseif (prefix == 'drops') then
        parts = { 'drops' };
        result.drops = { items = {}, more = 0, th = 0, scripted = key == 'drops_scripted', exp_only = key == 'drops_exp' };
        if (key == 'drops_conditional') then result.drops.conditions = { 'Only while eligible.' }; end
    elseif (key == 'steal_nothing') then
        parts, result.steal = { 'steal' }, { items = {}, ids = {} };
    elseif (key == 'line_cant_gauge') then
        result = { name = 'Mob', cant_gauge = true };
    elseif (prefix == 'job') then
        parts, result.job = { 'job' }, id .. '/' .. id;
    end
    return result, parts, off, on;
end
-- The lines for `result` with these parts on, plain and joined with ' / '.
local function lines_of(s, result, parts)
    for _, part in ipairs(parts or {}) do s.printout.parts[part].on = true; end
    s.ranged.show_far = true;
    s.blue.chat.chance = true;
    s.ranged.show_distance = result.ranged_distance ~= nil;
    if (result.empty_filter ~= nil) then s.effects.show_empty, s.effects.show = true, result.empty_filter; end
    local lines = printout.lines(s, result);
    for index, line in ipairs(lines) do lines[index] = MOCK.plain(line); end
    return table.concat(lines, ' / ');
end
local unwired = {};
for index, entry in ipairs(wording.LIST) do
    local marker = ('Q%dQ'):format(index);
    local result, parts, off_piece, on_piece = case_of(entry.key, marker);
    local s = defaults.make();
    s.printout.divider = 'spaces';
    local off = lines_of(s, result, parts);
    for key in pairs(s.short) do s.short[key] = ''; end
    s.short.list_more = 'more';
    s.short[entry.key], s.printout.short_words = marker, true;
    local on = lines_of(s, result, parts);
    if (count(off, off_piece) ~= 1 or count(on, marker) ~= 1 or on ~= swap(off, off_piece, on_piece)) then
        unwired[#unwired + 1] = ('%s: "%s" -> "%s"'):format(entry.key, off, on);
    end
end
check('every word prints its short form where its full word goes, and nothing else changes',
    #unwired == 0, table.concat(unwired, ' | '));

-- One that only sees you at night, and a strength with a chance after it, keep their numbers after your word.
local s = defaults.make();
s.printout.short_words = true;
s.printout.parts.weaknesses.on = true;
local night = aggro.readout({ aggro = true, true_detect = true, aggro_note = 'night_sight', detects = { 'sound' } },
    { con = 4 }, 60, s.aggro);
s.short.sense_true_sight = 'Eyes';
expect('the night hours follow your word for True Sight', MOCK.plain(printout.lines(s, { name = 'Mob', low = 30, high = 30,
    aggro = night })[2]), 'Aggro: A (Eyes 18:00-5:59, TH)');
local soaks = elements.readout({ absorb = { fire = 50 } });
s.short.str_absorb = 'soaks';
expect('and the chance follows your word for absorbs', MOCK.plain(printout.lines(s, { name = 'Mob', low = 30, high = 30,
    elements = soaks })[2]), 'Weaknesses: Resists: F (soaks 50%)');
local shares = elements.readout({ magic_dmg = { fire = 100, ice = -75 }, ranks = { dark = -3 } });
expect('a damage share with no word prints as it is', MOCK.plain(printout.lines(s, { name = 'Mob', low = 30, high = 30,
    elements = shares })[2]), 'Weaknesses: Weak: F (+100%), D' .. STAR .. 'Resists: I (-75%)');

-- A full /check made up to have every part, for the checks after this.
local function full_result()
    return {
        name = 'Mob', low = 29, high = 30, con = 3, reading = 2, defense = 0,
        evade = { low = 31, high = 31 }, signet = true, crit = { low = 7, high = 7 },
        shoots = true, ranged = { low = 63, high = 63 }, ranged_far = { low = 55, high = 55 },
        job = 'drk/war',
        aggro = { verdict = 'aggro_from_level', from = 30, threat = true, detects = { 'sense_sight', 'sense_sound' },
            notes = { 'note_awake', 'note_scripted' }, hours = '6:00-20:59' },
        links = { links = true, names = { 'Amy', 'Zed' }, tags = { { { 'sense_sight' }, { 'sense_sound' } },
            { { 'sense_superlink' } } }, more = 2 },
        magic = { { school = 'school_elemental', low = 50, high = 60, element = 'ice' },
            { school = 'school_dark', word = 'magic_immune' } },
        elements = { weak = { { element = 'ice' }, { element = 'thunder' } }, resists = { { element = 'fire',
            strength = 'str_absorb', amount = '50%' }, { element = 'water', strength = 'str_half' } }, all = '-25%' },
        drops = { items = { { id = 930, name = 'Beastman Blood', chance = 15 } }, more = 2, th = 0, scripted = true,
            exp_only = true },
        steal = { items = { 'Beastcoin' }, ids = { 656 }, unknown = true },
    };
end
local function full_settings()
    local each = defaults.make();
    for _, part in ipairs({ 'hit', 'ranged', 'evade', 'crit', 'job', 'magic', 'weaknesses', 'drops', 'steal' }) do
        each.printout.parts[part].on = true;
    end
    each.ranged.show_far = true;
    return each;
end
local function full_lines(each)
    return table.concat(printout.lines(each, full_result()), '\n');
end
local full_off = MOCK.plain(full_lines(full_settings()));
s = full_settings();
s.printout.short_words = true;
expect('every word short at once', bytes(MOCK.plain(full_lines(s))), bytes(table.concat({
    'Mob (Lv 29-30)' .. STAR .. 'DC (Lo Eva, Hi Def)',
    'Hit: unk' .. STAR .. 'Ranged: 63% (55% @25y)' .. STAR .. 'Evade: 31% w/Sig' .. STAR .. 'Crit: 7%',
    'Job: DRK/WAR',
    'Aggro: A if Lv 30+ (S, H) (awake 6:00-20:59) (can change)' .. STAR .. 'L Amy (S or H), Zed (SL)' .. STAR .. '+2',
    'Magic: Ele 50-60% (I)' .. STAR .. 'Drk imm',
    'Weaknesses: Weak: I, T' .. STAR .. 'Resists: F (abs 50%), Wa (1/2)' .. STAR .. 'MDT -25%',
    'Drops (TH 0): Beastman Blood 15%' .. STAR .. '+2 (scripted) (EXP only)',
    'Steal: Beastcoin (unk)',
}, '\n')));

-- Empty and bare ------------------------------------------------------------------------------------

for key in pairs(s.short) do s.short[key] = ''; end
local empty = MOCK.plain(full_lines(s));
check('with every box empty every word prints in full, but the counts are +2 alone', empty == full_off:gsub('%+2 more',
    '+2') and count(full_off, '+2 more') == 2, bytes(empty));
s.short.list_more = 'more';
check('and typing more for the count gives the lines back exactly', MOCK.plain(full_lines(s)) == full_off);
s.short.list_more = '   ';
check('a box of spaces is empty too', MOCK.plain(full_lines(s)) == empty);

-- Never a format string -----------------------------------------------------------------------------

for key in pairs(s.short) do s.short[key] = '%s %d %%'; end
local ok_format, formatted = pcall(full_lines, s);
formatted = ok_format and MOCK.plain(formatted) or tostring(formatted);
check('every box set to %s %d %% prints without an error, as typed', ok_format and has(formatted, 'Aggro: %s %d %% 30+ '
    .. '(%s %d %%, %s %d %%) (%s %d %% 6:00-20:59) (%s %d %%)') and has(formatted, '+2 %s %d %%'), bytes(formatted));

-- Off stays off -------------------------------------------------------------------------------------

local plain_settings = full_settings();
local default_bytes = full_lines(plain_settings);
for key in pairs(plain_settings.short) do plain_settings.short[key] = 'XX'; end
plain_settings.overlay.short_words = true;
check('with chat short words off every line is the same to the byte, whatever the boxes and the overlay\'s switch say',
    full_lines(plain_settings) == default_bytes);
fresh();
for _, part in ipairs({ 'hit', 'offhand', 'ranged', 'evade', 'crit', 'job', 'magic', 'weaknesses', 'drops',
    'steal', 'pet' }) do
    MOCK.command('/checkmate show ' .. part);
end
for _, id in ipairs(spells.SCHOOL_ORDER) do MOCK.command('/checkmate school ' .. id .. ' on'); end
local sample_bytes = (function ()
    local n = #MOCK.printed;
    MOCK.command('/checkmate sample');
    return table.concat(MOCK.printed, '\n', n + 1);
end)();
for key in pairs(cur().short) do cur().short[key] = 'XX'; end
MOCK.command('/checkmate overlayshort on');
local n_sample = #MOCK.printed;
MOCK.command('/checkmate sample');
check('and so is the sample', table.concat(MOCK.printed, '\n', n_sample + 1) == sample_bytes);

-- Links, Steal and Job ------------------------------------------------------------------------------

s = defaults.make();
s.printout.short_words = true;
s.printout.divider = 'spaces';
local function line_of(result, parts)
    return lines_of(s, result, parts):match('^Mob %(Lv 30%) / (.*)$') or lines_of(s, result, parts);
end
local mob = { name = 'Mob', low = 30, high = 30 };
local function with(fields)
    local result = {};
    for key, value in pairs(mob) do result[key] = value; end
    for key, value in pairs(fields) do result[key] = value; end
    return result;
end
local LINKS = { links = { superlink = { 'Zed' }, sound = { 'Zed', 'Amy' }, true_both = { 'Bob' }, magic = { 'Cat' },
    neither = { 'Dan' } } };
s.links.max_links = 0;
expect('Links with names, each with how it links, and or between two ways', line_of(with({ links = aggro.links(LINKS,
    s.links) })), 'L Amy (H), Bob (TS, TH), Cat (M), Dan, Zed (SL or H)');
s.links.max_links = 1;
expect('and the count after the most names shown', line_of(with({ links = aggro.links(LINKS, s.links) })), 'L Amy (H)  +4');
s.links.link_names = false;
expect('with the names off, how they link all together', line_of(with({ links = aggro.links(LINKS, s.links) })),
    'L (SL, TS, H, TH, M)');
s.links.link_how = false;
expect('and with how off too, just L', line_of(with({ links = aggro.links(LINKS, s.links) })), 'L');
s.links.link_names, s.links.link_how = true, true;
expect('Doesn\'t link is No link', line_of(with({ links = aggro.links({}, s.links) })), 'No link');
s.printout.parts.links.label = 'Pulls';
expect('and the Links part\'s own label stays yours', line_of(with({ links = aggro.links(LINKS, s.links) })),
    'Pulls: L Amy (H)  +4');
s.printout.parts.links.label = '';
s.short.link_links = '';
expect('an empty box for L prints Links with in full', line_of(with({ links = aggro.links(LINKS, s.links) })),
    'Links with Amy (H)  +4');
s.short.link_links = 'L';
local aggro_and_links = lines_of(s, with({ aggro = aggro.readout({ aggro = true, detects = { 'sound' } }, { con = 4 }, 60,
    s.aggro), links = aggro.links(LINKS, s.links) }));
expect('Links stays on Aggro\'s line after its answer', aggro_and_links, 'Mob (Lv 30) / Aggro: A (H)  L Amy (H)  +4');

expect('Steal with nothing to steal is none', line_of(with({ steal = { items = {}, ids = {} } }), { 'steal' }),
    'Steal: none');
expect('a chance that can\'t be worked out is unk', line_of(with({ steal = { items = { 'Beastcoin' }, ids = { 656 },
    unknown = true } }), { 'steal' }), 'Steal: Beastcoin (unk)');
expect('and two items keep their or and the chance', line_of(with({ steal = { items = { 'Pickaxe', 'Beastcoin' },
    ids = { 605, 656 }, low = 51, high = 51 } }), { 'steal' }), 'Steal: Pickaxe or Beastcoin (51%) (cond)');
s.short.steal_nothing = 'zip';
expect('your own word for nothing', line_of(with({ steal = { items = {}, ids = {} } }), { 'steal' }), 'Steal: zip');

expect('the job letters come as they are', line_of(with({ job = 'drk/war' }), { 'job' }), 'Job: DRK/WAR');
s.short.job_drk, s.short.job_war = 'D', 'W';
expect('and your own for each job', line_of(with({ job = 'drk/war' }), { 'job' }), 'Job: D/W');
s.short.job_drk = '';
expect('an empty one prints the letters', line_of(with({ job = 'drk/war' }), { 'job' }), 'Job: DRK/W');
s.short.job_war = 'WAR';

-- The chat's element icons go before whichever word prints.
s.printout.parts.weaknesses.on, s.printout.parts.magic.on = true, true;
local GOBLIN = elements.readout({ ranks = { ice = -3, thunder = -3, water = 4 } });
local function no_codes(text) return (text:gsub('\30.', '')); end
local function element_line()
    return no_codes(table.concat(printout.lines(s, with({ elements = GOBLIN, magic = { { school = 'school_elemental',
        low = 88, high = 88, element = 'ice' } } })), '\n'));
end
s.printout.icons = true;
local with_icons = element_line();
check('with Element icons on, the symbol goes before the short form', has(with_icons, 'Weak: \239\32 I, \239\35 T  '
    .. 'Resists: \239\36 Wa (1/2)') and has(with_icons, 'Ele 88% (\239\32 I)'), bytes(with_icons));
s.printout.icons_only = true;
local only = element_line();
check('and Icons only leaves the word out, short or full', has(only, 'Weak: \239\32, \239\35  Resists: \239\36 (1/2)')
    and has(only, 'Ele 88% (\239\32)'), bytes(only));
s.printout.icons, s.printout.icons_only = false, false;

-- A tip names things in full, whatever the short words. It's what explains a short one.
local tip_result = { elements = GOBLIN, job = 'drk/war', magic = { { school = 'school_elemental', low = 88, high = 88,
    element = 'ice' } } };
local tips_off = {};
local TIP_ASKS = { { 'element', 'ice' }, { 'element', 'water' }, { 'school', 'ice' }, { 'job', 'drk' }, { 'job', 'war' } };
local plain_tips = defaults.make();
for index, ask in ipairs(TIP_ASKS) do
    tips_off[index] = tips.text(plain_tips, tip_result, ask[1], ask[2]);
end
plain_tips.printout.short_words, plain_tips.overlay.short_words = true, true;
plain_tips.short.elem_ice, plain_tips.short.job_drk, plain_tips.short.str_half = 'Frost', 'D', 'h';
local same_tips = true;
for index, ask in ipairs(TIP_ASKS) do
    same_tips = same_tips and tips.text(plain_tips, tip_result, ask[1], ask[2]) == tips_off[index];
end
check('the tips say the same with abbreviations on and your own words typed', same_tips and tips_off[1]:find('^Ice%. ')
    ~= nil and tips_off[4] == 'Dark Knight, its main job.', tostring(tips_off[1]));

-- Clashes ----------------------------------------------------------------------------------------

local function clashes_of(change)
    local each = defaults.make();
    change(each.short);
    local out = {};
    for index, clash in ipairs(printout.clashes(each)) do
        out[index] = ('%s/%s/%s'):format(clash.first, clash.second, clash.text);
    end
    return table.concat(out, ' ');
end
expect('the defaults print apart in every spot', clashes_of(function () end), '');
expect('Sound typed as S prints the same as Sight', clashes_of(function (t) t.sense_sound = 'S'; end),
    'sense_sight/sense_sound/S');
expect('in any case', clashes_of(function (t) t.sense_sound = 's'; end), 'sense_sight/sense_sound/S');
expect('two empty boxes print their full words, so they don\'t', clashes_of(function (t)
    t.sense_sight, t.sense_sound = '', ''; end), '');
expect('a note prints where the senses do', clashes_of(function (t) t.note_scripted = 'S'; end),
    'sense_sight/note_scripted/S');
expect('a short form the same as another\'s full word', clashes_of(function (t)
    t.con_very_tough, t.con_tough = 'Tough', ''; end), 'con_tough/con_very_tough/Tough');
expect('three the same are two', clashes_of(function (t) t.sense_sound, t.note_scripted = 'S', 'S'; end),
    'sense_sight/sense_sound/S sense_sight/note_scripted/S');
expect('words in different spots never clash, like S for Light, Tough and Sight', clashes_of(function (t)
    t.elem_light, t.con_tough = 'S', 'S'; end), '');
expect('two jobs typed the same do', clashes_of(function (t) t.job_war, t.job_whm = 'W', 'W'; end), 'job_war/job_whm/W');
expect('A if Lv typed as A still has its level after it, so it doesn\'t print the same as Aggressive',
    clashes_of(function (t) t.aggro_from_level = 'A'; end), '');
expect('but it does with Aggressive typed the way it prints', clashes_of(function (t)
    t.aggro_from_level, t.aggro_aggressive = 'A', 'A 30+'; end), 'aggro_aggressive/aggro_from_level/A 30+');
expect('awake typed as S still prints the same as Sight, since a sense can have hours after it too',
    clashes_of(function (t) t.note_awake = 'S'; end), 'sense_sight/note_awake/S');
expect('the drop notes are quoted in their brackets', clashes_of(function (t)
    t.drops_scripted, t.drops_exp = 'X', 'x'; end), 'drops_scripted/drops_exp/(X)');

-- Commands ---------------------------------------------------------------------------------------

fresh();
says('/checkmate short on', 'checkmate\'s /check lines now use abbreviations. The Abbreviations tab lists them.');
check('and it sets the chat\'s switch alone', cur().printout.short_words == true and MOCK.last_save.printout.short_words
    == true and cur().overlay.short_words == false);
says('/checkmate short off', 'checkmate\'s /check lines now use the full words.');
says('/checkmate overlayshort on', 'The overlay now uses abbreviations. The Abbreviations tab lists them.');
check('and that sets the overlay\'s alone', cur().overlay.short_words == true and cur().printout.short_words == false);
says('/checkmate overlayshort off', 'The overlay now uses the full words.');
says('/checkmate short', 'Type /checkmate short on|off.', 0);
says('/checkmate shortword aggro_aggressive Agg', '"Aggressive" now prints as "Agg" with abbreviations on.');
check('and keeps it', cur().short.aggro_aggressive == 'Agg' and MOCK.last_save.short.aggro_aggressive == 'Agg');
says('/checkmate shortword aggro_from_level "A Lv"',
    '"Aggressive if it\'s level 30 or higher" now prints as "A Lv 30+" with abbreviations on.');
says('/checkmate shortword note_awake wakes', '"awake 6:00-20:59" now prints as "wakes 6:00-20:59" with abbreviations on.');
says('/checkmate shortword drops_scripted scr', '"(scripted loot conditions)" now prints as "(scr)" with abbreviations on.');
says('/checkmate shortword con_tough ""', '"Tough" now prints in full with abbreviations on.');
says('/checkmate shortreset con_tough', '"Tough" is back to "T".');
says('/checkmate shortword con_tough', '"Tough" prints as "T" with abbreviations on.', 0);
says('/checkmate shortword CON_TOUGH', '"Tough" prints as "T" with abbreviations on.', 0);
says('/checkmate shortword list_more ""', '"+2 more" now prints as "+2" with abbreviations on.');
says('/checkmate shortword list_more more', '"+2 more" now prints as "+2 more" with abbreviations on.');
says('/checkmate shortreset list_more', '"+2 more" is back to "+2".');
says('/checkmate shortword sense_sound S',
    '"Sound" now prints as "S" with abbreviations on. "Sight" prints as "S" too, so they read the same.');
says('/checkmate shortword sense_sight', '"Sight" prints as "S" with abbreviations on. "Sound" prints as "S" too, so they '
    .. 'read the same.', 0);
says('/checkmate shortword note_scripted S', '"can change in the fight" now prints as "S" with abbreviations on. "Sight" '
    .. 'prints as "S" too, so they read the same. "Sound" prints as "S" too, so they read the same.');
says('/checkmate shortword sense_sound', '"Sound" prints as "S" with abbreviations on. "Sight" prints as "S" too, so they '
    .. 'read the same. "can change in the fight" prints as "S" too, so they read the same.', 0);
says('/checkmate shortreset sense_sound', '"Sound" is back to "H".');
says('/checkmate shortword sense_true_sound', '"True Sound" prints as "TH" with abbreviations on.', 0);
says('/checkmate shortword note_scripted S',
    '"can change in the fight" now prints as "S" with abbreviations on. "Sight" prints as "S" too, so they read the same.');
says('/checkmate shortreset note_scripted', '"can change in the fight" is back to "can change".');
says('/checkmate shortword con_very_tough Tough', '"Very Tough" now prints as "Tough" with abbreviations on.');
says('/checkmate shortword con_tough ""', '"Tough" now prints in full with abbreviations on. "Very Tough" prints as '
    .. '"Tough" too, so they read the same.');
says('/checkmate shortword con_very_tough Tough', '"Very Tough" now prints as "Tough" with abbreviations on. "Tough" '
    .. 'prints as "Tough" too, so they read the same.');
says('/checkmate shortword bogus x', 'There is no word called "bogus". /checkmate help abbreviations lists them.', 0);
says('/checkmate shortword bogus', 'There is no word called "bogus". /checkmate help abbreviations lists them.', 0);
says('/checkmate shortword', 'Type /checkmate abbreviation <word> <text>. Put text with spaces in quotes, and "" prints '
    .. 'the full word. /checkmate help abbreviations lists the words.', 0);
says('/checkmate shortreset drops_exp', '"(only drops if you get EXP)" is back to "(EXP only)".');
says('/checkmate shortword job_drk D', '"DRK" now prints as "D" with abbreviations on.');
says('/checkmate shortword job_drk', '"DRK" prints as "D" with abbreviations on.', 0);
says('/checkmate shortreset job_drk', '"DRK" is back to "DRK".');
says('/checkmate shortword job_war W', '"WAR" now prints as "W" with abbreviations on.');
says('/checkmate shortword job_whm W',
    '"WHM" now prints as "W" with abbreviations on. "WAR" prints as "W" too, so they read the same.');
says('/checkmate shortword link_links Pulls', '"Links" now prints as "Pulls" with abbreviations on.');
says('/checkmate shortword steal_nothing zip', '"nothing" now prints as "zip" with abbreviations on.');
says('/checkmate shortreset all', 'Every abbreviation is back to the one checkmate comes with.');
local all_back = true;
for _, entry in ipairs(wording.LIST) do
    all_back = all_back and cur().short[entry.key] == entry.short;
end
check('shortreset all puts every one back', all_back);
says('/checkmate shortword aggro_from_level A', '"Aggressive if it\'s level 30 or higher" now prints as "A 30+" with '
    .. 'abbreviations on.');
says('/checkmate shortword aggro_aggressive "A 30+"', '"Aggressive" now prints as "A 30+" with abbreviations on. '
    .. '"Aggressive if it\'s level 30 or higher" prints as "A 30+" too, so they read the same.');
says('/checkmate shortreset', 'Type /checkmate abbreviationreset <word>|all. /checkmate help abbreviations lists the words.', 0);
says('/checkmate shortreset bogus', 'There is no word called "bogus". /checkmate help abbreviations lists them.', 0);
says('/checkmate shortword con_tough "\129\154M\253ab\253c"', '"Tough" now prints as "Mc" with abbreviations on.');
check('Japanese characters and auto-translate phrases go whole', cur().short.con_tough == 'Mc', cur().short.con_tough);
answer('/checkmate shortword con_tough ' .. ('x'):rep(40));
check('40 letters are cut to 32', cur().short.con_tough == ('x'):rep(32), #cur().short.con_tough);
answer('/checkmate shortword con_tough "Two Words"');
check('quoted text keeps its space and its case', cur().short.con_tough == 'Two Words', cur().short.con_tough);
answer('/checkmate shortword con_tough %s %d %%');
check('a % is kept as typed', cur().short.con_tough == '%s %d %%', cur().short.con_tough);
says('/checkmate shortword con_tough', '"Tough" prints as "%s %d %%" with abbreviations on.', 0);
answer('/checkmate shortreset all');

-- Help.
local help = answer('/checkmate help abbreviations');
local lines = {};
for line in (help .. ' / '):gmatch('(.-) / ') do lines[#lines + 1] = line; end
check('help short is its 4 commands, the words line, a line for each of the 15 headings and the labels line',
    #lines == 21 and lines[1] == '/checkmate abbreviations on|off  uses abbreviations in your /check lines and the sample, like A '
    .. 'for Aggressive, or the full words.' and lines[2] == '/checkmate overlayabbreviations on|off  uses abbreviations in the '
    .. 'overlay, or the full words.' and (lines[3] or ''):find('^/checkmate abbreviation <word> <text>  ') ~= nil
    and (lines[4] or ''):find('^/checkmate abbreviationreset <word>|all  ') ~= nil, help);
expect('then the words line', lines[5], '<word> is one of these, grouped under the headings on the Abbreviations tab.');
check('then Difficulty first', (lines[6] or ''):find('Difficulty  con_too_weak, con_incredibly_easy_prey, ', 1, true) == 1,
    lines[6]);
expect('and Jobs last', lines[20], 'Jobs  job_war, job_mnk, job_whm, job_blm, job_rdm, job_thf, job_pld, job_drk, '
    .. 'job_bst, job_brd, job_rng, job_sam, job_nin, job_drg, job_smn, job_blu, job_cor, job_pup, job_dnc, job_sch, '
    .. 'job_geo, job_run');
expect('and the labels line names their commands', lines[21], 'Part labels and the range, ID, PH, Weak, Resists and pet '
    .. 'words, and the immunity labels, have their own commands: label, rangeword, idword, phword, weakword, '
    .. 'resistword, weaponsweakword, weaponsresistword, pethitword, petevadeword and immunitylabel.');
local listed = 0;
for index = 6, 20 do
    for key in (lines[index] or ''):gmatch('[%l_]+_[%l_]+') do
        if (wording.BY_KEY[key] ~= nil) then listed = listed + 1; end
    end
end
check('every word is in it once', listed == #wording.LIST, listed);
check('help overlay has overlayshort right after overlaylines', has(answer('/checkmate help overlay'), 'Display tab. / '
    .. '/checkmate overlayabbreviations on|off  uses abbreviations in the overlay, or the full words. / /checkmate overlaydivider'));
check('help colors and help windowcolors still list theirs', has(answer('/checkmate help colors'), 'Difficulty  difficulty, '
    .. 'too_weak') and not has(answer('/checkmate help colors'), 'con_too_weak') and has(answer('/checkmate help '
    .. 'windowcolors'), '<what> is one of these, grouped under the headings on the Appearance tab.'));

-- The Short tab ------------------------------------------------------------------------------------

fresh();
local function frame()
    local n = #MOCK.printed;
    MOCK.frame();
    for _, line in ipairs(MOCK.printed_since(n)) do
        if (line:find('Stopped after an error', 1, true)) then error(line); end
    end
end
local function notes()
    local text = table.concat(MOCK.gui.texts, ' | ');
    local _, found = text:gsub('both print as', '');
    return text, found;
end
MOCK.command('/checkmate');
MOCK.command('/checkmate short on');
frame();
check('no note for the words checkmate comes with', select(2, notes()) == 0);
MOCK.typing['Abbreviations/sense_sound/##short'] = 'S';
frame();
check('typing S for Sound changes it at once', cur().short.sense_sound == 'S', cur().short.sense_sound);
frame();
local text, found = notes();
check('and the note shows on the next frame, once, since both are under one heading', found == 1
    and has(text, '"Sight" and "Sound" both print as "S".'), text);
-- The note is in the Problem messages color, which that color's (?) on the Look tab says further down.
local imgui = require('imgui');
local push, draw_text, text_color, note_color = imgui.PushStyleColor, imgui.TextUnformatted, nil, nil;
imgui.PushStyleColor = function (id, color)
    if (id == ImGuiCol_Text) then text_color = color; end
    push(id, color);
end
imgui.TextUnformatted = function (words)
    if (has(words, 'both print as')) then note_color = text_color; end
    draw_text(words);
end
frame();
imgui.PushStyleColor, imgui.TextUnformatted = nil, nil;
check('it\'s in the Problem messages color', note_color ~= nil and note_color == cur().look.imgui.problem_messages);
MOCK.command('/checkmate shortword note_scripted S');
frame();
text, found = notes();
check('a third the same is two notes under HOW IT FINDS YOU and one under AGGRO NOTES', found == 3
    and has(text, '"Sight" and "can change in the fight" both print as "S".'), found);
MOCK.command('/checkmate shortreset sense_sound');
MOCK.command('/checkmate shortreset note_scripted');
frame();
check('shortreset with the window open takes the notes away on the next frame', select(2, notes()) == 0);
MOCK.command('/checkmate shortword sense_sound S');
frame();
local before_switch = select(2, notes());
MOCK.settings.switch_character({ printout = { order = printout.DEFAULT_ORDER } });
frame();
check('and so does another character logging in with the window open', before_switch == 1
    and select(2, notes()) == 0 and MOCK.drew('ABBREVIATIONS'), before_switch);
MOCK.command('/checkmate short on');
MOCK.typing['Abbreviations/job_whm/##short'] = 'WAR';
frame();
frame();
check('two jobs typed the same get a note under JOBS', has(notes(), '"WAR" and "WHM" both print as "WAR".'));
MOCK.command('/checkmate shortword drops_scripted X');
MOCK.command('/checkmate shortword drops_exp x');
frame();
check('the drop notes\' note quotes them in their brackets', has(notes(), '"(scripted loot conditions)" and "(only drops if '
    .. 'you get EXP)" both print as "(X)".'));
MOCK.clicks['Abbreviations/Reset every abbreviation'] = true;
frame();
frame();
check('and Reset every abbreviation takes it away', cur().short.job_whm == 'WHM' and select(2, notes()) == 0);

-- The clashes are only worked out after a change, never on a steady frame. After a command the tab works them out
-- once on its next frame.
MOCK.command('/checkmate shortword con_tough x');
local clash_calls, real_clashes = 0, printout.clashes;
printout.clashes = function (...)
    clash_calls = clash_calls + 1;
    return real_clashes(...);
end
for _ = 1, 30 do frame(); end
check('30 frames after a command work them out once', clash_calls == 1, clash_calls);
clash_calls = 0;
for _ = 1, 30 do frame(); end
check('and 30 steady frames never', clash_calls == 0, clash_calls);
MOCK.typing['Abbreviations/con_tough/##short'] = 'y';
frame();
frame();
check('typing in a box works them out once more', clash_calls == 1, clash_calls);
printout.clashes = real_clashes;
MOCK.command('/checkmate shortreset all');

-- Each row's (?) says what the word stands for, what it comes as and its name in commands.
MOCK.hover = true;
frame();
MOCK.hover = false;
local tip = MOCK.gui.tips;
expect('the Tough row\'s tip', tip['Abbreviations/con_tough/##short'], 'Prints in place of "Tough" while abbreviations are on. It '
    .. 'comes as "T", and an empty box prints the full word. In commands it\'s con_tough.');
expect('Sound\'s says H', tip['Abbreviations/sense_sound/##short'], 'Prints in place of "Sound" while abbreviations are on. It '
    .. 'comes as "H", and an empty box prints the full word. In commands it\'s sense_sound.');
expect('Sight\'s reads like Sound\'s, since an imp\'s night hours only ever go after True Sight',
    tip['Abbreviations/sense_sight/##short'], 'Prints in place of "Sight" while abbreviations are on. It comes as "S", and an '
    .. 'empty box prints the full word. In commands it\'s sense_sight.');
expect('the count\'s says it comes empty', tip['Abbreviations/list_more/##short'], 'The word after a count, when Links or '
    .. 'Drops has more names or items than it shows. Prints in place of "+2 more" while abbreviations are on. It comes '
    .. 'empty, so it prints just "+2", and you can type a word for it. In commands it\'s list_more.');
expect('a job\'s starts with its full name', tip['Abbreviations/job_drk/##short'], 'Dark Knight\'s letters. Prints in place of '
    .. '"DRK" while abbreviations are on. It comes as "DRK", and an empty box prints the full word. In commands it\'s '
    .. 'job_drk.');
expect('and the level after A if Lv', tip['Abbreviations/aggro_from_level/##short'], 'The level and a + go after it, like A if Lv '
    .. '30+. Prints in place of "Aggressive if it\'s level 30 or higher" while abbreviations are on. It comes as "A if Lv '
    .. '30+", and an empty box prints the full word. In commands it\'s aggro_from_level.');
expect('the Problem messages color\'s names the notes about two words that print the same',
    tip['Appearance/Problem messages##problem_messages'], 'What the Profiles tab says when an action didn\'t work, the note '
    .. 'about a font that won\'t load, and the Abbreviations tab\'s notes about two words that print the same.');
local headed = true;
for _, group in ipairs(wording.GROUPS) do
    headed = headed and MOCK.gui.paths['Abbreviations/' .. group.name:upper()] == 'CollapsingHeader'
        and (tip['Abbreviations/' .. group.name:upper()] or '') ~= '';
end
check('every folding group has hover help, including new parts', headed);
MOCK.command('/checkmate');
MOCK.command('/checkmate short off');
frame();

-- The overlay ----------------------------------------------------------------------------------------

local function overlay_frame()
    MOCK.frame();
    return table.concat(MOCK.overlay_lines(), ' // ');
end
local function overlay_at(wrap)
    MOCK.command('/checkmate overlaywrap ' .. wrap);
    return overlay_frame();
end
fresh();
pl.main_level = 20;
MOCK.command('/checkmate linkfamilies off');
MOCK.zone_in(103);
MOCK.command('/checkmate overlay on');
MOCK.command('/checkmate overlayshort on');
overlay_frame();
MOCK.target_monster(98, 'Goblin Tinkerer');
expect('with only the overlay\'s switch on, the overlay is short before a /check', overlay_frame(), 'Goblin Tinkerer '
    .. '(Lv 18-19) // Aggro: A (S) | L Goblin Ambusher (S), Goblin Bounty Hunter (S), //   Goblin Butcher (S), Goblin '
    .. 'Digger (S), Goblin Gambler (S) | +3');
local n_check = #MOCK.printed;
MOCK.packet(MOCK.check_packet(98, 19, 3, 177));
local tinkerer = overlay_frame();
check('and after it', has(tinkerer, 'Goblin Tinkerer (Lv 19) | DC (Lo Eva) // Aggro: A (S)'), tinkerer);
check('while the same /check\'s chat lines are in full', has(table.concat(MOCK.printed_since(n_check), ' / '), 'Decent '
    .. 'Challenge (Low Evasion) / [checkmate] Aggro: Aggressive (Sight)'));
MOCK.command('/checkmate overlayshort off');
MOCK.command('/checkmate short on');
check('with only chat\'s on, the overlay is in full', has(overlay_frame(), 'Goblin Tinkerer (Lv 19) | Decent Challenge '
    .. '(Low Evasion) // Aggro: Aggressive (Sight) | Links with'));
n_check = #MOCK.printed;
MOCK.packet(MOCK.check_packet(98, 19, 3, 177));
overlay_frame();
check('and chat is short', has(table.concat(MOCK.printed_since(n_check), ' / '), 'DC (Lo Eva) / [checkmate] Aggro: A (S)'));
MOCK.command('/checkmate short off');
MOCK.command('/checkmate overlayshort on');

-- The count after the names wraps on its own, with the divider before it left off, short word or not.
local wrapped = overlay_at(168);
check('a count that doesn\'t fit starts the next line, and the divider goes', has(wrapped, '//   Goblin Gambler (S) //   '
    .. '+3') and not has(wrapped, '| +3'), wrapped);
check('and one that fits stays after the divider', has(overlay_at(175), 'Goblin Gambler (S) | +3'));
MOCK.command('/checkmate shortword list_more more');
check('the same with a word after it', has(overlay_at(203), '//   Goblin Gambler (S) //   +3 more')
    and has(overlay_at(210), 'Goblin Gambler (S) | +3 more'), overlay_at(203));
MOCK.command('/checkmate shortreset list_more');

-- A lone bracket typed into a short form only holds up its own part and the divider after it.
MOCK.command('/checkmate overlaylines off');
local plain_wrap = overlay_at(140);
MOCK.command('/checkmate shortword aggro_aggressive "A ("');
local bracket = overlay_at(140);
check('without it the line breaks after the answer', has(plain_wrap, 'Aggro: A (S) //   L Goblin Ambusher (S), //'),
    plain_wrap);
check('with it the divider after the answer can\'t break, but the names and the count still wrap', has(bracket,
    'Aggro: A ( (S) | L Goblin Ambusher (S), //   Goblin Bounty Hunter (S), //   Goblin Butcher (S),')
    and has(bracket, '//   Goblin Gambler (S) //   +3'), bracket);
MOCK.command('/checkmate shortreset aggro_aggressive');
MOCK.command('/checkmate overlaylines on');
overlay_at(520);

-- Valkurm Emperor fits on one line with short words.
MOCK.target_monster(334, 'Valkurm Emperor');
MOCK.level_up(43);
MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(103, 334), 0, 0, 249, 334));
expect('Valkurm Emperor at 43', overlay_frame(), 'Valkurm Emperor (Lv 29-30) | ITG // Aggro: A if Lv 30+ (H) | L Damselfly '
    .. '(H)');
MOCK.command('/checkmate overlayshort off');
expect('which in full wraps the Links onto a line of its own', overlay_frame(), 'Valkurm Emperor (Lv 29-30) | Impossible to '
    .. 'Gauge // Aggro: Aggressive if it\'s level 30 or higher (Sound) //   Links with Damselfly (Sound)');
MOCK.command('/checkmate overlayshort on');
MOCK.level_up(20);

-- The sample goblin, and a box typed in on the Abbreviations tab showing on the next frame.
MOCK.target.slot0 = 0;
MOCK.command('/checkmate');
overlay_frame();
check('the sample goblin is short with the window open', has(overlay_frame(), 'Sample Goblin (Lv 42) | DC (Lo Def) // '
    .. 'Aggro: A (S) | L Goblin Butcher (S)'), overlay_frame());
local lines_calls, real_lines = 0, printout.lines;
printout.lines = function (...)
    lines_calls = lines_calls + 1;
    return real_lines(...);
end
MOCK.typing['Abbreviations/aggro_aggressive/##short'] = 'Agg';
local typed = overlay_frame();
local next_frame = overlay_frame();
check('a word typed on the Abbreviations tab shows on the next frame, worked out once', has(next_frame, 'Aggro: Agg (S)')
    and lines_calls == 1, typed .. ' then ' .. next_frame .. ' ' .. lines_calls);
printout.lines = real_lines;
MOCK.command('/checkmate shortreset all');
MOCK.command('/checkmate');
overlay_frame();

-- Pictures go before whichever word prints. A badge's letter is the same as the element's short word checkmate comes
-- with, so with badges the overlay shows the letter twice. Icons only leaves the word out, short or full.
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
overlay_frame();
MOCK.command('/checkmate overlayshow elements');
MOCK.command('/checkmate overlayshow job');
MOCK.command('/checkmate overlayelementlook badges');
for _, id in ipairs({ 12511, 12514 }) do MOCK.picture('item', id); end
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.packet(MOCK.check_packet(1, 39, 4, 170));
local pictures = overlay_frame();
check('a badge then its letter, and a job\'s head then its letters', has(pictures, 'Weaknesses: Weak: [I] I | Resists: [F] F '
    .. '(never), [Wa] Wa (meva)') and has(pictures, 'Job: [item 12511] WAR/[item 12514] THF'), pictures);
MOCK.command('/checkmate shortword job_war W');
MOCK.command('/checkmate shortword elem_ice ""');
check('your own words and empty boxes too', has(overlay_frame(), 'Weak: [I] Ice | Resists: [F] F')
    and has(overlay_frame(), 'Job: [item 12511] W/[item 12514] THF'), overlay_frame());
MOCK.command('/checkmate overlayiconsonly on');
check('Icons only shows the pictures alone', has(overlay_frame(), 'Weaknesses: Weak: [I] | Resists: [F] (never), [Wa] '
    .. '(meva)') and has(overlay_frame(), 'Job: [item 12511]/[item 12514]'), overlay_frame());
MOCK.command('/checkmate overlayiconsonly off');
MOCK.command('/checkmate overlayicons off');
check('and with Show icons off, the words alone', has(overlay_frame(), 'Weaknesses: Weak: Ice | Resists: F (never), Wa '
    .. '(meva)'), overlay_frame());
MOCK.command('/checkmate shortreset all');
MOCK.command('/checkmate overlay off');
addon.path = ADDON_PATH;
MOCK.zone_in(103);

-- A settings file from before short words gets both switches off and every short form checkmate comes with, so its
-- lines print as they did.
fresh();
local default_sample = answer('/checkmate sample');
MOCK.settings.switch_character({ printout = { order = printout.DEFAULT_ORDER } });
local old = cur();
local every_default = true;
for _, entry in ipairs(wording.LIST) do
    every_default = every_default and old.short[entry.key] == entry.short;
end
check('a settings file from before gets both switches off and every short form', old.printout.short_words == false
    and old.overlay.short_words == false and every_default);
check('and prints its sample as before', answer('/checkmate sample') == default_sample);

return MOCK.report();
