--[[
    Hover help for overlay text and icons. It uses full names even when the readout uses abbreviations.
    text() builds the explanation when the hovered item changes. more() updates times and ages while
    the tip stays open. details() gathers the same explanations for Monster's Target details.
]]

local printout   = require('core.printout');
local parts      = require('core.parts');
local wording    = require('core.wording');
local steal_data = require('data.steal');

local effects = require('core.effects');
local player = require('core.player');
local dangers = require('core.dangers');

local tips = {};

-- What a tip adds when a script can change the part during a fight, like the ? at the end of the line.
local SCRIPTED = ' The ? means these values can change during the fight. checkmate shows the stored values.';

--[[
    Why an element is in Weak or Resists, by the reason core\elements.lua gives. {E} is the element's name, {e} the
    same in lowercase, and {p} its amount without a sign. Nullify and absorb have a second one for when they don't
    always happen, and never and rarely one each for when the element's own damage taken changes what a nuke does.
]]
local ELEMENT_TIPS = {
    nullify      = '{E} damage spells do no damage to it.',
    nullify_some = '{E} damage spells do no damage to it {p} of the time.',
    absorb       = '{E} damage spells heal it instead.',
    absorb_some  = '{E} damage spells heal it instead {p} of the time.',
    never        = 'Its resistance rank to {e} is 11, so effects that go by {e} never land, and {e} nukes do an '
        .. 'eighth of their damage.',
    never_dmg    = 'Its resistance rank to {e} is 11, so effects that go by {e} never land, and {e} nukes do only {p} '
        .. 'of their damage.',
    rarely       = 'Its resistance rank to {e} is 10, so each roll for a spell that goes by {e} has only a 5% chance '
        .. 'to get through. {E} nukes do half damage at best, and effects that go by {e} rarely land.',
    rarely_dmg   = 'Its resistance rank to {e} is 10, so each roll for a spell that goes by {e} has only a 5% chance '
        .. 'to get through. {E} nukes do {p} of their damage at best, and effects that go by {e} rarely land.',
    half         = 'Its resistance rank to {e} is 4 or higher, so {e} nukes land less often and do half damage, and '
        .. 'effects that go by {e} land less often too.',
    halved       = '{E} nukes do half damage to it.',
    less         = '{E} nukes do {p} less damage to it.',
    more         = '{E} nukes do {p} more damage to it.',
    lowest       = 'Its resistance rank to {e} is its lowest, so {e} nukes and effects that go by {e} land on it more '
        .. 'often than those of an element with a higher rank.',
    meva         = 'It has extra magic evasion against {e}, so {e} spells land less often.',
};

-- Rank 4 and up with its own damage taken on top starts the same as half.
ELEMENT_TIPS.half_less = ELEMENT_TIPS.half .. ' With its own {e} damage taken on top, {e} nukes do {p} less damage '
    .. 'to it.';

-- The element after a Magic school's chance. Neither the line nor the mark names the school's spell, and the line
-- can show a word like never in place of a chance, so it says neither.
local SCHOOL_TIP = 'It resists {e} as little as any element this school\'s spell can be, so the Magic part goes by '
    .. '{e}.';

-- Each immunity's default label, by its id. A tip names it by that, not your own label, since the tip is what
-- explains a short one.
local IMMUNITY_NAMES = {};
for _, entry in ipairs(printout.IMMUNITIES) do
    IMMUNITY_NAMES[entry.id] = entry.label;
end

-- What the two sleep immunities are, since their names alone don't say.
local SLEEP_NOTES = {
    dark_sleep  = ', the dark sleep of spells like Sleep, Sleepga and Soporific',
    light_sleep = ', the light sleep of Foe Lullaby, Horde Lullaby, Sheep Song and Yawn',
};

-- How much of a Steal one item gets, by how many items there are.
local SHARES = { [2] = 'half', [3] = 'a third' };

-- An element's full name, like 'Ice', by its id in core\elements.lua.
local function element_name(id)
    local entry = wording.BY_KEY[wording.ELEMENT_KEYS[id]];
    return entry and entry.full;
end

-- One of the templates above with the element's name and the amount put in.
local function fill(template, name, amount)
    local values = { E = name, e = name:lower(), p = amount and (amount:gsub('^[+-]', '')) or '' };
    return (template:gsub('{(%a)}', values));
end

-- The first entry in `list` whose `field` is `value`, or nil.
local function find(list, field, value)
    for _, entry in ipairs(list or {}) do
        if (entry[field] == value) then
            return entry;
        end
    end
    return nil;
end

-- An element in the Elements part, like "Water. Its resistance rank to water is 4 or higher, ..."
local function element_tip(s, result, id)
    local e = result.elements;
    local entry = e and (find(e.weak, 'element', id) or find(e.resists, 'element', id));
    if (entry == nil) then
        return nil;
    end
    local why, amount = entry.why, entry.amount;
    if ((why == 'nullify' or why == 'absorb') and amount ~= nil) then
        why = why .. '_some';
    elseif ((why == 'never' or why == 'rarely') and entry.share ~= nil) then
        why, amount = why .. '_dmg', entry.share;
    end
    local name, template = element_name(id), ELEMENT_TIPS[why];
    if (name == nil or template == nil) then
        return nil;
    end
    local warning = s.elements.script_mark == false and ' These stored values can change during the fight.' or SCRIPTED;
    return name .. '. ' .. fill(template, name, amount) .. (e.scripted and warning or '');
end

local WEAPON_NOTES = {
    slashing = 'This includes the usual sword, axe, scythe, katana and great katana attacks.',
    piercing = 'This includes the usual dagger and polearm attacks. Physical ranged weapon skills also use piercing.',
    blunt = 'This includes the usual club and staff attacks. Hand-to-hand has its own value.',
    hand_to_hand = 'This is the hand-to-hand damage type. It is separate from the blunt value for clubs and staves.',
};

local function weapon_tip(_, result, id)
    local w = result.weapons;
    if (w ~= nil and id == 'unknown' and w.uncertain) then
        local out = { 'Weapon damage is unknown.' };
        for _, note in ipairs(w.notes or {}) do out[#out + 1] = printout.clean_text(note); end
        return table.concat(out, ' ');
    end
    if (w ~= nil and id == 'scripted' and w.scripted) then
        local out = { 'The stored weapon damage types are neutral, but scripts can change them during the fight.' };
        for _, note in ipairs(w.notes or {}) do out[#out + 1] = printout.clean_text(note); end
        return table.concat(out, ' ');
    end
    local general = w and find(w.general, 'kind', id);
    if (general ~= nil) then
        local out = {};
        if (general.signed) then
            out[#out + 1] = ('Normal %s damage taken is %g%% %s than neutral before damage type. This is separate from the four weapon-type changes.'):format(
                id == 'physical' and 'melee' or 'ranged', math.abs(general.percent), general.percent > 0 and 'more' or 'less');
        elseif (id == 'absorb') then
            out[#out + 1] = ('Physical damage has a %g%% absorption chance. Absorbed damage heals the monster.'):format(general.percent);
        else
            out[#out + 1] = ('Normal %s damage has a %g%% nullification chance when it is not absorbed. Nullified damage does not hurt or heal the monster.'):format(
                id == 'nullify_physical' and 'melee' or 'ranged', general.percent);
        end
        for _, note in ipairs(w.context_notes or w.notes or {}) do out[#out + 1] = printout.clean_text(note); end
        if (w.scripted) then out[#out + 1] = 'The ? marks stored values that can change during the fight.'; end
        return table.concat(out, ' ');
    end
    local entry = w and (find(w.weak, 'kind', id) or find(w.resists, 'kind', id));
    local word = wording.BY_KEY['weapon_' .. tostring(id)];
    if (entry == nil or word == nil) then return nil; end
    local text = ('%s does %g%% %s damage than neutral. %s'):format(word.full,
        math.abs(entry.percent), entry.percent > 0 and 'more' or 'less', WEAPON_NOTES[id] or '');
    for _, note in ipairs(w.notes or {}) do text = text .. ' ' .. printout.clean_text(note); end
    return text .. (w.scripted and ' The ? marks stored values that can change during the fight.' or '');
end

local function info_tip(_, result, id, full)
    local section = find((result.info or {}).sections, 'id', id);
    if (section == nil) then return nil; end
    local out = { printout.clean_text(section.label) .. ': ' .. printout.clean_text(section.value) .. '.' };
    if (id == 'blue' and full and section.observation ~= nil and #(section.observation.spells or {}) > 0) then
        out = {};
        for i, spell in ipairs(section.observation.spells) do
            local lines = { 'Spell: ' .. printout.clean_text(spell.name),
                'Spellbook: ' .. printout.clean_text(spell.state) };
            if (section.observation.seen) then
                lines[#lines + 1] = 'Move use: ' .. printout.clean_text((section.observation.move_states or {})[i] or 'move use unknown');
            end
            out[#out + 1] = table.concat(lines, '\n');
        end
    end
    if (id == 'dangers' and section.danger ~= nil) then
        for _, entry in ipairs(section.danger.selected or {}) do
            out[#out + 1] = printout.clean_text(dangers.entry_text(entry));
        end
    end
    if (id == 'blue' and full and #(section.notes or {}) > 0) then out[#out + 1] = 'Learning conditions and notes:'; end
    for _, note in ipairs(section.notes or {}) do out[#out + 1] = printout.clean_text(note); end
    if ((id == 'dangers' or id == 'blue') and full) then return table.concat(out, '\n\n'); end
    local text = table.concat(out, ' ');
    if (id == 'dangers' and not full and #text > 900) then
        local summary = printout.clean_text(section.value);
        if (#summary > 480) then
            summary = summary:sub(1, 480);
            summary = summary:match('^(.*);') or summary:gsub('%s+%S*$', '');
            summary = summary .. '; ...';
        end
        return printout.clean_text(section.label) .. ': ' .. summary
            .. '. Open Monster > Target details for every listed move and its conditions.';
    end
    return text;
end

-- The element after a Magic school's chance or word, like "Ice. It resists ice as little as any element ..."
local function school_tip(_, _, id)
    local name = element_name(id);
    if (name == nil) then
        return nil;
    end
    return name .. '. ' .. fill(SCHOOL_TIP, name);
end

-- A drop, like "Beastman Blood. It drops 15% of the time at Treasure Hunter 0."
local function drop_tip(_, result, id)
    local list = result.drops;
    local item = list and find(list.items, 'id', tonumber(id));
    if (item == nil) then
        return nil;
    end
    local name = printout.clean_text(item.name);
    local conditions = {};
    if (list.exp_only) then conditions[#conditions + 1] = 'You must receive EXP.'; end
    for _, condition in ipairs(list.conditions or {}) do conditions[#conditions + 1] = printout.clean_text(condition); end
    if (list.scripted and #(list.conditions or {}) == 0) then
        conditions[#conditions + 1] = 'A script can change which drops are available.';
    end
    local suffix = #conditions > 0 and (' These rates apply only when the drop conditions are met. ' .. table.concat(conditions, ' ')) or '';
    if (item.chance >= 100) then
        return name .. (#conditions > 0 and '. Its listed drop rate is 100%.' or '. It always drops.') .. suffix;
    end
    return ('%s. It drops %s of the time at Treasure Hunter %d.'):format(name, printout.chance_text(item.chance),
        list.th) .. suffix;
end

--[[
    A Steal item, like "Beastcoin. Your Steal takes it 54% of the time." With more than one, each Steal takes one
    of them at random, so each gets that share of your chance. With no chance it says why.
]]
local function steal_tip(s, result, id)
    local st = result.steal;
    local index = nil;
    for at, each in ipairs((st and st.ids) or {}) do
        if (each == tonumber(id)) then
            index = at;
        end
    end
    if (index == nil) then
        return nil;
    end
    local name, count = printout.clean_text(st.items[index]), #st.items;
    local notes = {};
    for _, note in ipairs(st.notes or {}) do notes[#notes + 1] = printout.clean_text(note); end
    local detail = #notes > 0 and (' ' .. table.concat(notes, ' ')) or '';
    if (st.low ~= nil) then
        local chance = printout.number_text(st, s.printout.number_style);
        if (count == 1) then
            return ('%s. Your Steal takes it %s of the time, if the item is still available and you can receive it.'):format(name, chance) .. detail;
        end
        local share = SHARES[count] or ('one in %d'):format(count);
        return ('%s. Your Steal works %s of the time, and each time it takes one of its %d items at random, so you '
            .. 'get this one %s of those times, if the item is still available and you can receive it.'):format(name, chance, count, share) .. detail;
    end
    local text = name .. '. Steal can take it if the item is still available and you can receive it.';
    if (count > 1) then
        text = ('%s. Each successful Steal takes one of its %d items at random, if still available and you can receive it.'):format(name, count);
    end
    if (st.unknown) then
        return text .. ' Your chance isn\'t known until the monster\'s level is.' .. detail;
    end
    return text .. (' You need THF at level %d or higher, as your main or support job, to use Steal.')
        :format(steal_data.ability.level);
end

-- An immunity, like "Immune to Bind. The server stops it outright, no matter your magic accuracy."
local function immunity_tip(_, _, id)
    local name = IMMUNITY_NAMES[id];
    if (name == nil) then
        return nil;
    end
    return ('Immune to %s%s. The server stops it outright, no matter your magic accuracy.'):format(name,
        SLEEP_NOTES[id] or '');
end

-- A job in the Job part, like "Dark Knight, its main job." The support job only gets a mark when it's a different
-- job from the main one, so a job that matches the main one is the main one.
local function job_tip(_, result, id)
    local entry = wording.BY_KEY['job_' .. id];
    if (entry == nil) then
        return nil;
    end
    local main = (result.job or ''):match('^(%l+)/');
    return ('%s, its %s job.'):format(entry.name, (id == main) and 'main' or 'support');
end

-- Effects the tips say more about: every sleep, Bind and Threnody.
local SLEEPS = { [2] = true, [19] = true, [193] = true };
local BIND, THRENODY = 11, 217;

-- An empty list to read from, since effect_more runs every frame a tip is up.
local NONE = {};

-- The entry for effect `n` in the readout the lines were made from, or nil.
local function effect_entry(result, n)
    for _, each in ipairs(result.effects or NONE) do
        if (each.effect == n) then
            return each;
        end
    end
    return nil;
end

-- Who put an effect on, for its tip.
local function source_text(each)
    if (each.mine) then
        return 'from you';
    elseif (each.own) then
        return 'from the monster itself';
    end
    local pet = player.pet();
    if (pet ~= nil and pet.id == each.from) then
        return 'from your pet';
    end
    local name = each.from and player.name_of(each.from);
    return name and ('from ' .. printout.clean_text(name)) or 'from someone else';
end

--[[
    An effect's tip, like "Paralyze, from you." then the game's own description of it, what can end it early, and
    how its time works. It's made once, the first time the mouse rests on it.
]]
local function effect_text(_, result, id)
    if (id == 'none') then
        return 'No matching effects were seen. Effects that landed before tracking started, outside message '
            .. 'range, or without a visible status message may still be on the monster.';
    end
    local n = tonumber(id);
    local each = n and effect_entry(result, n);
    if (each == nil) then
        return nil;
    end
    local name = each.word and wording.BY_KEY[each.word].full or printout.clean_text(each.name);
    local text = ('%s, %s.'):format(name, source_text(each));
    local said = effects.description(n);
    if (said ~= nil) then
        text = text .. ' ' .. said .. (said:find('[%.!?]$') and '' or '.');
    end
    if (SLEEPS[n]) then
        text = text .. ' A hit wakes it. So does a tick of Dia, Bio, Poison or the like, unless it\'s an avatar\'s '
            .. 'Nightmare or a Stoneskin soaks the tick.';
    elseif (n == BIND) then
        text = text .. ' A hit will most likely break it.';
    elseif (n == THRENODY) then
        text = text .. ' The game never says when Threnody wears off, even to the bard who sang it.';
    end
    if (each.own) then
        text = text .. ' Nothing tells checkmate when it ends, so the time is how long it usually lasts.';
    elseif (not each.mine) then
        text = text .. ' Nothing tells checkmate when someone else\'s effect ends, so the time is how long it '
            .. 'usually lasts.';
    elseif (each.random) then
        text = text .. ' Its length is random on Phoenix, so the time is the most it can last.';
    end
    local basis = {
        equipment = ' Your gear and known merits are included in this estimate.',
        merit_unknown = ' Your merit rank is unknown. This estimate uses the highest rank Phoenix allows.',
        usual = ' Its exact duration is unknown, so this uses its usual length.',
        source_duration = ' This starts from the duration in Phoenix\'s code. A resist can make it shorter.',
        random_maximum = ' This uses the longest random duration. It may end sooner.',
    };
    text = text .. (basis[each.basis] or '');
    return text;
end

-- The time line under an effect's tip, made once for each whole second and kept.
local MINE_LEFT, GUESS_LEFT = {}, {};

--[[
    The line under an effect's tip: how long it has left, counting down while the tip is up. It's asked every frame
    the tip shows, and makes a string only the first time each whole second comes up.
]]
local function effect_more(_, result, id)
    local n = tonumber(id);
    local each = n and effect_entry(result, n);
    if (each == nil) then
        return nil;
    elseif (each.ends == nil and each.left == nil) then
        return 'No time known. checkmate drops it after 3 minutes, or sooner when it sees it end.';
    end
    local left = each.left or math.max(0, math.ceil(each.ends - os.clock()));
    if (left == 0) then
        return 'It should wear off any moment.';
    end
    local cache = each.mine and MINE_LEFT or GUESS_LEFT;
    if (cache[left] == nil) then
        cache[left] = (each.mine and 'About %s left.' or 'About %s left, a guess.'):format(printout.clock_text(left));
    end
    return cache[left];
end

-- Detail tips also work on text when pictures are off.
local function notes_text(notes)
    local out = {};
    for _, note in ipairs(notes or {}) do out[#out + 1] = printout.clean_text(note); end
    return #out > 0 and (' ' .. table.concat(out, ' ')) or '';
end

local function level_tip(_, result)
    local p = result.provenance or {};
    local sources = {
        check = 'The level came from your /check reply.',
        widescan = 'The level came from your widescan.',
        spawn = 'The level or range comes from the bundled spawn data, not a fresh observation.',
        unknown = 'The monster\'s level is not known.',
    };
    local text = printout.clean_text(result.name or 'The monster') .. '. '
        .. (sources[p.level_source] or 'No level source was recorded.');
    if (p.level_source == 'check' or p.level_source == 'widescan') then
        text = text .. ' A monster can respawn outside your sight with the same ID. A fresh /check or widescan '
            .. 'confirms its current level.';
    end
    if (p.stats_source == 'band') then
        text = text .. ' Combat estimates use typical monster stats because this monster has no stats in the bundled data.';
    end
    return text;
end

local PDIF_PARTS = { pdif = 'Main-hand', offhandpdif = 'Off-hand', rangedpdif = 'Ranged' };
local PARAMETER_PARTS = { hit = true, offhand = true, ranged = true, evade = true };
local RETAINED = 'This is the last calculated estimate, kept from your earlier reading.';

local function pdif_tip(result, id)
    local value = result[id] or {};
    local function span(low, high, places) return printout.pdif_span(low, high, places) or 'unknown'; end
    local rolled = printout.pdif_span(value.low, value.high, 2, true);
    local out = {
        PDIF_PARTS[id] .. ' pDIF.' .. (rolled == nil and ' Normal noncritical attacks only.' or ''),
        'Multiplier range: ' .. (rolled and (rolled .. 'x') or 'unknown') .. '.',
        ('A/D ratio: %s (Attack %s / Defense %s).'):format(span(value.ratio_low, value.ratio_high),
            span(value.attack, value.attack, 0), span(value.defense_low, value.defense_high, 0)),
    };
    if (value.retained) then out[#out + 1] = RETAINED; end
    if (value.corrected_ratio_low ~= nil and value.corrected_ratio_high ~= nil) then
        out[#out + 1] = 'Working ratio after level correction: ' .. span(value.corrected_ratio_low, value.corrected_ratio_high) .. '.';
    end
    if (value.cap_low ~= nil and value.cap_high ~= nil) then
        out[#out + 1] = 'Curve cap: ' .. span(value.cap_low, value.cap_high) .. '. This is not the maximum multiplier.';
    end
    out[#out + 1] = 'Hit chance, critical hits, weapon skills and damage-taken rules are separate.';
    if (type(value.attack) ~= 'number') then out[#out + 1] = 'No usable Attack stat reply is available.'; end
    out[#out + 1] = 'A manual /check refreshes enabled pDIF rows, including overlay-only rows. The passive overlay does not request stats.';
    if (value.uncertain) then out[#out + 1] = 'The ~ marks an estimate with unresolved inputs or conditions.'; end
    for _, note in ipairs(value.notes or {}) do out[#out + 1] = printout.clean_text(note); end
    if (value.scripted) then out[#out + 1] = 'The ? means the stored monster defense can change during the fight.'; end
    return table.concat(out, ' ');
end

local function number_details(_, result, id)
    if (PDIF_PARTS[id] ~= nil) then return pdif_tip(result, id); end
    if (id == 'block' or id == 'parry') then
        local value = result[id] or {};
        local label = id == 'block' and 'Shield block' or 'Parry';
        local out = { label .. ' chance when that defensive check is allowed, not the share of all incoming attacks.' };
        if (value.eligible == false) then
            out[#out + 1] = 'This ordinary melee estimate is not available.';
        elseif (type(value.low) == 'number' and type(value.high) == 'number') then
            out[#out + 1] = 'Conditional rate: ' .. printout.defense_text(value, 'range') .. '.';
        else
            out[#out + 1] = 'The rate is unknown.';
        end
        if (type(value.skill) == 'number') then out[#out + 1] = 'Your defensive skill: ' .. value.skill .. '.'; end
        local seen = {};
        if (value.unavailable_reason ~= nil) then
            local reason = printout.clean_text(value.unavailable_reason);
            out[#out + 1], seen[reason] = reason, true;
        end
        if (value.uncertain) then out[#out + 1] = 'The ~ marks an estimate with unresolved inputs or conditions.'; end
        for _, note in ipairs(value.notes or {}) do
            local clean = printout.clean_text(note);
            if (not seen[clean]) then out[#out + 1], seen[clean] = clean, true; end
        end
        return table.concat(out, ' ');
    end
    local explanations = {
        hit = 'Main-hand hit chance from your last /checkparam and the monster\'s source stats.',
        offhand = 'Off-hand hit chance from your last /checkparam and the monster\'s source stats.',
        ranged = 'Ranged hit chance in the weapon\'s sweet spot. A shown distance does not change this estimate.',
        evade = 'The chance the monster\'s normal swings miss you. Other avoidance rolls are separate.',
        crit = 'Critical-hit chance for your melee swings, using the available attributes, gear and merits.',
        crittaken = 'Critical-hit chance among the monster\'s normal hits that land. TP moves use separate rules.',
        pet = 'Your pet\'s estimated level and combat numbers. A pet /checkparam is a snapshot of its stats.',
        reading = 'The evasion and defense reading at your last /check. Gear or buffs changed since then can make it stale.',
    };
    local text = explanations[id];
    if (text == nil) then return nil; end
    local value = result[id];
    if (type(value) == 'table') then
        if (value.retained) then text = text .. ' ' .. RETAINED; end
        if (value.uncertain) then text = text .. ' The ~ means a condition affecting this number is uncertain.'; end
        text = text .. notes_text(value.notes);
        if (id == 'pet') then
            text = text .. notes_text(value.hit and value.hit.notes) .. notes_text(value.evade and value.evade.notes);
            if (value.parameter_state == 'checked') then
                text = text .. ' The retained stats belong to this pet and target. Later gear, buffs or levels can make them stale.';
            elseif (value.parameter_state == 'unknown') then
                text = text .. ' There is no matching pet stat reply for this target. Unknown numbers stay unknown.';
            elseif (value.parameter_state == 'source') then
                text = text .. ' This charmed pet uses stored monster stats at its estimated level.';
            end
            text = text .. ' A manual /check can refresh these stats. The passive overlay never requests pet stats.';

        end
    end
    local p = result.provenance or {};
    if (PARAMETER_PARTS[id] and p.parameter_state ~= nil) then
        if (p.parameter_state == 'received') then
            text = text .. ' These are retained stats. Check again after changing gear or buffs.';
        elseif (p.parameter_state == 'waiting') then
            text = text .. ' Waiting for the stat reply after your manual /check.';
        elseif (p.parameter_state == 'stale') then
            if (value == nil or not value.retained) then
                text = text .. ' The retained stats are stale. Check again to refresh this estimate.';
            end
        else
            text = text .. ' No usable stat reply is available. Check this monster to request fresh stats.';
        end
        if (type(p.parameter_reason) == 'string' and p.parameter_reason ~= '') then
            local reason = printout.clean_text(p.parameter_reason);
            if (not text:find(reason, 1, true)) then
                text = text .. ' ' .. reason .. (reason:match('[.!?]$') and '' or '.');
            end
        end
        text = text .. ' The passive overlay never requests stats.';
    end
    if (p.stats_source == 'band') then text = text .. ' Monster stats are estimates for its level.'; end
    if (result.scripted) then text = text .. SCRIPTED; end
    local me, inputs = result.inputs or {}, {};
    if (PARAMETER_PARTS[id]) then
        if (result.parameter_inputs ~= nil) then me = result.parameter_inputs;
        elseif (value ~= nil and value.retained) then me = {}; end
    end
    local fields = {
        hit = { { 'accuracy', 'Accuracy' } }, offhand = { { 'offhand_accuracy', 'Off-hand accuracy' } },
        ranged = { { 'ranged_accuracy', 'Ranged accuracy' } }, evade = { { 'evasion', 'Evasion' } },
        crit = { { 'dex', 'DEX' }, { 'crit_merits', 'Critical Hit Rate merit ranks' } },
        crittaken = { { 'agi', 'AGI' }, { 'enemy_crit_merits', 'Enemy Critical Hit Rate merit ranks' },
            { 'crit_evasion', 'Gear crit reduction' } },
    };
    for _, field in ipairs(fields[id] or {}) do
        if (type(me[field[1]]) == 'number') then inputs[#inputs + 1] = field[2] .. ' ' .. me[field[1]]; end
    end
    if (type(me.level) == 'number' and #inputs > 0) then table.insert(inputs, 1, 'Level ' .. me.level); end
    if (#inputs > 0) then text = text .. ' Inputs: ' .. table.concat(inputs, ', ') .. '.'; end
    return text;
end

-- Keep the full explanations in Target details; hover groups the decision and its limits.
local function number_tip(s, result, id)
    local value = result[id] or {};
    local defensive = id == 'block' or id == 'parry';
    if (not defensive and PDIF_PARTS[id] == nil) then
        local text = number_details(s, result, id);
        return text and text:gsub(' Inputs: ', '\nInputs: '):gsub(' The ~ means ', '\nUncertainty: The ~ means ');
    end
    local out, inputs, limits, seen = {}, {}, {}, {};
    local function limit(text)
        text = printout.clean_text(text);
        if (text ~= '' and not seen[text]) then limits[#limits + 1], seen[text] = text, true; end
    end
    local function span(low, high, places) return printout.pdif_span(low, high, places) or 'unknown'; end
    if (defensive) then
        local label = id == 'block' and 'Shield block' or 'Parry';
        local rate = type(value.low) == 'number' and type(value.high) == 'number'
            and printout.defense_text(value, 'range');
        local status = printout.status_text(s, value);
        out[#out + 1] = label .. '\nResult: ' .. (rate or status or (value.eligible == false and 'not available' or 'unknown'));
        if (value.skill ~= nil) then inputs[#inputs + 1] = 'your skill ' .. value.skill; end
        if (value.shield_name ~= nil) then
            inputs[#inputs + 1] = printout.clean_text(value.shield_name:gsub('_', ' ')) .. ' (size ' .. tostring(value.shield_size or '?') .. ')';
        end
        if (value.attacker_skill_low ~= nil) then
            inputs[#inputs + 1] = 'monster comparison skill ' .. span(value.attacker_skill_low, value.attacker_skill_high, 0);
        end
        if (value.extra_parry_low ~= nil) then
            inputs[#inputs + 1] = 'separate gear bonus ' .. span(value.extra_parry_low, value.extra_parry_high, 0);
        end
        if (#inputs > 0) then out[#out + 1] = 'Inputs: ' .. table.concat(inputs, '; '); end
        out[#out + 1] = 'Requirements: face the attacker, ' .. (id == 'parry' and 'be engaged, ' or '') .. 'be able to act.';
        out[#out + 1] = 'Scope: eligible ordinary melee rolls, not the share of all incoming attacks.';
        if (value.unavailable_reason ~= nil) then limit(value.unavailable_reason); end
        for _, note in ipairs(value.notes or {}) do
            if (not note:find('Chance for an eligible ordinary melee', 1, true)
                and note ~= 'Earlier avoidance and special attacks have separate rules.'
                and not note:find('The client skill total and the source formula', 1, true)
                and not (value.shield_name and note:find('(size ', 1, true))
                and not (value.attacker_skill_low and note:find('Monster ', 1, true) == 1)) then limit(note); end
        end
    else
        local rolled = printout.pdif_span(value.low, value.high, 2, true);
        out[#out + 1] = PDIF_PARTS[id] .. ' pDIF\nResult: ' .. (rolled and (rolled .. 'x') or printout.status_text(s, value) or 'unknown');
        if (value.retained) then out[#out + 1] = RETAINED; end
        if (value.attack ~= nil) then
            out[#out + 1] = ('Inputs: Attack %s / Defense %s; A/D ratio %s.'):format(span(value.attack, value.attack, 0),
                span(value.defense_low, value.defense_high, 0), span(value.ratio_low, value.ratio_high));
        else
            out[#out + 1] = 'Inputs: No usable Attack stat reply is available.';
        end
        if (value.corrected_ratio_low ~= nil) then
            out[#out + 1] = 'Working ratio: ' .. span(value.corrected_ratio_low, value.corrected_ratio_high)
                .. '; curve cap ' .. span(value.cap_low, value.cap_high) .. ' (not the maximum multiplier).';
        end
        out[#out + 1] = 'Scope: normal noncritical attacks only; possible multipliers, not average or final damage.';
        out[#out + 1] = 'Refresh: /check. The passive overlay does not request stats.';
        local shorter = {
            ['Normal noncritical attacks only. This is a possible multiplier range, not an average or final damage.'] = false,
            ['Attack comes from the last matching reply. Unseen buff potency changes can make that reading stale.'] = 'Unseen buff potency changes can make Attack stale.',
            ['Defense is the bundled spawn baseline. Unseen effects and fight changes can alter it.'] = 'Defense is the spawn baseline; unseen effects or fight changes can alter it.',
            ['The curve cap is applied before the melee random factor.'] = false,
            ['The monster script can change its defense during the fight.'] = 'The ? marks stored monster defense that can change during the fight.',
        };
        for _, note in ipairs(value.notes or {}) do
            if (shorter[note] ~= false) then limit(shorter[note] or note); end
        end
        if (value.scripted and not seen['The ? marks stored monster defense that can change during the fight.']) then
            limit('The ? marks stored monster defense that can change during the fight.');
        end
    end
    if (#limits > 0) then
        out[#out + 1] = (value.uncertain and 'Uncertainty: ' or 'Notes: ') .. table.concat(limits, '\n');
    elseif (value.uncertain) then
        out[#out + 1] = 'Uncertainty: unresolved inputs or conditions (~).';
    end
    return table.concat(out, '\n');
end

local function magic_tip(s, result, id)
    local row = find(result.magic, 'school', id);
    if (row == nil) then return nil; end
    local spell = printout.clean_text(row.spell or 'the selected stand-in spell');
    local text = spell .. '. ';
    if (row.semantics == 'full') then
        text = text .. 'The percentage is its chance of full, unresisted damage, not simply doing any damage.';
    else
        text = text .. 'The percentage is its chance to land. A landed effect can still have reduced duration.';
    end
    text = text .. ' This is for that spell, not every spell in the school.';
    if (row.element ~= nil) then text = text .. ' The calculation uses ' .. (element_name(row.element) or row.element) .. '.'; end
    if (row.uncertain) then text = text .. ' The ~ means a known condition could change this chance by an amount checkmate cannot read.'; end
    local me, inputs = result.inputs or {}, {};
    local school = require('data.spells').schools[id:gsub('^school_', '')];
    if (school ~= nil) then
        local skill = me.skills and me.skills[school.skill];
        if (type(skill) == 'number') then inputs[#inputs + 1] = school.label .. ' skill ' .. skill; end
        for _, spell_data in ipairs(school.spells) do
            local stat = spell_data.name == row.spell and spell_data.stat;
            if (stat and type(me[stat]) == 'number') then inputs[#inputs + 1] = stat:upper() .. ' ' .. me[stat]; break; end
        end
    end
    if (type(me.extra_accuracy) == 'number') then
        inputs[#inputs + 1] = (s.magic.known_inputs ~= false and 'Remaining direct accuracy ' or 'Manual direct accuracy total ')
            .. me.extra_accuracy;
    end
    if (s.magic.known_inputs ~= false and me.modifiers and type(me.modifiers.magic_accuracy) == 'number') then
        inputs[#inputs + 1] = 'Flat gear magic accuracy ' .. me.modifiers.magic_accuracy;
    end
    if (#inputs > 0) then text = text .. ' Inputs: ' .. table.concat(inputs, ', ') .. '.'; end
    return text .. notes_text(row.notes) .. (result.scripted and SCRIPTED or '');
end

local function aggro_tip(_, result)
    local a = result.aggro;
    if (a == nil) then return nil; end
    local entry = wording.BY_KEY[a.verdict];
    local text = entry and entry.full or 'Aggro';
    if (a.from ~= nil) then text = text:format(a.from); end
    text = text .. '. This compares its level and aggro rules with your level. It does not say it has noticed you. '
        .. 'Detection still depends on distance, facing, obstacles and the listed conditions.';
    if (a.hours ~= nil) then text = text .. ' Listed hours are Vana\'diel time: ' .. a.hours .. '.'; end
    if (a.night ~= nil) then text = text .. ' Its extra sight detection applies at ' .. a.night .. ' Vana\'diel time.'; end
    if (#(a.notes or {}) > 0) then text = text .. ' Its form, script or zone state may change this answer.'; end
    return text;
end

local function links_tip(_, result, id, complete)
    local list = result.links;
    if (list == nil) then return nil; end
    if (not list.links) then return 'No links are listed in the bundled data for this monster. Scripts may still call helpers.'; end
    local out = { 'Possible links from the source data, not a list of nearby living monsters.' };
    if (list.grouped) then
        out[#out + 1] = 'Family labels group only the names listed here, not every monster in that family.';
    end
    local names = list.all_names or list.names or {};
    for index, name in ipairs(names) do
        if (not complete and index > 20) then
            out[#out + 1] = ('%d more. Full list: Monster > Target details.'):format(#names - 20);
            break;
        end
        local tags = list.all_tags and list.all_tags[name] or (list.tags and list.tags[index]);
        local ways = {};
        for _, group in ipairs(tags or {}) do
            local words = {};
            for _, key in ipairs(group) do words[#words + 1] = wording.BY_KEY[key] and wording.BY_KEY[key].full or key; end
            ways[#ways + 1] = table.concat(words, ', ');
        end
        out[#out + 1] = printout.clean_text(name) .. (#ways > 0 and (' (' .. table.concat(ways, ' or ') .. ')') or '');
    end
    out[#out + 1] = 'Normal links need to be nearby with nothing in the way. Superlinks can join from anywhere in the zone.';
    return table.concat(out, '\n');
end

local function ph_tip(_, result)
    local out = { 'This spawn is a placeholder for ' .. table.concat(result.ph_for or {}, ', ') .. '.' };
    for _, rule in ipairs(result.ph_details or {}) do
        local text = printout.clean_text(rule.name or 'NM') .. ':';
        if (type(rule.chance) == 'number') then text = text .. ' base lottery chance ' .. printout.chance_text(rule.chance) .. '.'; end
        if (type(rule.cooldown_min) == 'number') then
            local low, high = rule.cooldown_min, rule.cooldown_max or rule.cooldown_min;
            local unit = 'seconds';
            if (low % 60 == 0 and high % 60 == 0) then low, high, unit = low / 60, high / 60, 'minutes'; end
            if (low == high and low == 1) then unit = unit:sub(1, -2); end
            text = text .. (low == high and (' Source cooldown %g %s after NM despawn.'):format(low, unit)
                or (' Source cooldown %g-%g %s after NM despawn.'):format(low, high, unit));
        end
        out[#out + 1] = text .. notes_text(rule.conditions);
    end
    out[#out + 1] = 'These rules come from Phoenix\'s code. They do not show whether the NM is up or its window is open. Server settings can change the chance and cooldown.';
    return table.concat(out, '\n');
end

local age_result, age_second, age_text, age_id;
local function age_more(_, result, id)
    local now = math.floor(os.clock());
    if (age_result == result and age_second == now and age_id == id) then return age_text; end
    age_result, age_second, age_id = result, now, id;
    if (PARAMETER_PARTS[id]) then
        local p = result.provenance or {};
        age_text = type(p.parameter_at) == 'number' and ('Stat reply: '
            .. printout.clock_text(math.max(0, now - math.floor(p.parameter_at))) .. ' ago.') or nil;
        return age_text;
    end
    if (id == 'pet') then
        local pet = result.pet or {};
        age_text = type(pet.observed_at) == 'number' and ('Pet stat reply: '
            .. printout.clock_text(math.max(0, now - math.floor(pet.observed_at))) .. ' ago.') or nil;
        return age_text;
    end
    if (PDIF_PARTS[id] ~= nil) then
        local value = result[id] or {};
        age_text = type(value.observed_at) == 'number' and ('Attack stat reply: '
            .. printout.clock_text(math.max(0, now - math.floor(value.observed_at))) .. ' ago.') or 'Attack stat reply age unknown.';
        return age_text;
    end
    if (id == 'block' or id == 'parry') then
        local value = result[id] or {};
        age_text = type(value.observed_at) == 'number' and ('Defensive inputs: '
            .. printout.clock_text(math.max(0, now - math.floor(value.observed_at))) .. ' ago.') or nil;
        return age_text;
    end
    local p, out = result.provenance or {}, {};
    for _, entry in ipairs({ { 'observed_at', 'Level observation' }, { 'checked_at', '/check reading' }, { 'inputs_at', 'Local inputs' },
        { 'parameter_at', '/checkparam' } }) do
        local at = p[entry[1]];
        if (type(at) == 'number') then out[#out + 1] = entry[2] .. ': ' .. printout.clock_text(math.max(0, now - math.floor(at))) .. ' ago.'; end
    end
    if (p.parameter_state ~= nil) then out[#out + 1] = '/checkparam state: ' .. printout.clean_text(p.parameter_state) .. '.'; end
    age_text = #out > 0 and table.concat(out, ' ') or nil;
    return age_text;
end

-- The tip for each kind of mark printout puts in front of a name.
local BY_KIND = {
    element  = element_tip,
    weapon   = weapon_tip,
    info     = info_tip,
    school   = school_tip,
    item     = drop_tip,
    steal    = steal_tip,
    immunity = immunity_tip,
    job      = job_tip,
    effect   = effect_text,
    level = level_tip, number = number_tip, magic = magic_tip, aggro = aggro_tip, links = links_tip, ph = ph_tip,
};

-- The line under a tip, for a kind whose tip changes while it shows.
local MORE_BY_KIND = { effect = effect_more, level = age_more, number = age_more, magic = age_more };

--[[
    The tip for overlay text or an icon, by the kind and id of the mark it came from, or nil when there's nothing to say.
    `result` is the readout the overlay's lines were made from, and `s` your settings. The id is text, the way the
    mark carries it, so a kind with a number id turns it back with tonumber.
]]
function tips.text(s, result, kind, id)
    local tip = BY_KIND[kind];
    if (tip == nil) then
        return nil;
    end
    return tip(s, result, id);
end

--[[
    The line under a tip, or nil. It's asked every frame the tip shows, so it has to be cheap and make no
    new string on a frame where nothing changed.
]]
function tips.more(s, result, kind, id)
    local more = MORE_BY_KIND[kind];
    if (more == nil) then
        return nil;
    end
    return more(s, result, id);
end

-- Named groups let Target details collapse or search without changing what gets copied.
function tips.detail_header(result)
    if (result == nil) then return 'No monster selected.', nil; end
    local level = '?';
    if (type(result.low) == 'number') then
        level = tostring(result.low);
        if (type(result.high) == 'number' and result.high ~= result.low) then level = level .. '-' .. tostring(result.high); end
    end
    local p = result.provenance or {};
    local age = 'Input age unknown';
    if (type(p.inputs_at) == 'number') then
        age = 'Inputs ' .. printout.clock_text(math.max(0, math.floor(os.clock() - p.inputs_at))) .. ' ago';
    end
    return printout.clean_text(result.name or 'Unknown monster') .. ' (Lv ' .. level .. ')',
        (p.chat_snapshot and 'Saved /check' or 'Selected target') .. ' | ' .. age;
end

local function danger_details(entry)
    local out, seen = {}, {};
    local function add(value)
        if (type(value) ~= 'string' or value == '' or seen[value]) then return; end
        seen[value] = true;
        out[#out + 1] = printout.clean_text(value);
    end
    local function group(label, values)
        local lines = {};
        for _, value in ipairs(values) do
            if (not seen[value]) then
                seen[value] = true;
                lines[#lines + 1] = printout.clean_text(value);
            end
        end
        if (#lines > 0) then out[#out + 1] = label .. ':\n' .. table.concat(lines, '\n\n'); end
    end
    local name = entry.name or 'Unknown move';
    local kind = entry.kind == 'spell' and 'Spell: ' or entry.kind == 'attack' and 'Attack: ' or 'Move: ';
    add(kind .. name);
    local summary = entry.summary;
    if (type(summary) == 'string') then
        if (summary:sub(1, #name + 2) == name .. ': ') then summary = summary:sub(#name + 3); end
        add((#(entry.effects or {}) > 0 and 'Effects: ' or 'Threats: ') .. summary .. '.');
    end
    for _, value in ipairs(entry.notes or {}) do add(value); end
    local details = entry.details or {};
    local shadows, removals, unknown = {}, {}, {};
    for _, value in ipairs(details.unknown or {}) do unknown[value] = true; end
    for _, value in ipairs(details.notes or {}) do
        local lower = value:lower();
        if (unknown[value]) then
            -- Unresolved source notes stay separate from the known handling rules.
        elseif (lower:find('shadow', 1, true) or value:find('Utsusemi', 1, true) or value:find('Blink', 1, true)) then
            shadows[#shadows + 1] = value;
        elseif (value:find('Reviewed removal options:', 1, true) == 1
            or value:find('These are selected options,', 1, true) == 1
            or value:find('Paralysis can interrupt Remedy', 1, true) == 1
            or value:find('Doom removal is a chance,', 1, true) == 1
            or value:find('Viruna removes Disease first', 1, true) == 1
            or value:find('Cursna and Holy Water handle', 1, true) == 1) then
            removals[#removals + 1] = value;
        else
            add(value);
        end
    end
    group('Shadow rules', shadows);
    group('Removal options', removals);
    for _, value in ipairs(details.unknown or {}) do add('Unknown: ' .. value); end
    return table.concat(out, '\n\n');
end

function tips.detail_groups(s, result)
    if (result == nil) then return {}; end
    local out = {};
    local function add(id, label, text)
        if (text ~= nil and text ~= '') then out[#out + 1] = { id = id, label = label, text = text }; end
    end
    local age = age_more(s, result);
    add('source', 'Level and source', level_tip(s, result) .. (age and ('\n' .. age) or ''));
    for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'pdif', 'offhandpdif', 'rangedpdif', 'evade', 'block', 'parry', 'crit', 'crittaken', 'pet' }) do
        local optional = PDIF_PARTS[id] ~= nil or id == 'block' or id == 'parry';
        if (result[id] ~= nil and (not optional or parts.enabled(s, id, 'chat') or parts.enabled(s, id, 'overlay'))) then
            local text = number_details(s, result, id);
            local age = (PARAMETER_PARTS[id] or PDIF_PARTS[id] ~= nil) and age_more(s, result, id);
            add(id, s.printout.parts[id].label, text and (text .. (age and ('\n' .. age) or '')));
        end
    end
    if (result.reading ~= nil or result.defense ~= nil) then add('reading', 'Check reading', number_details(s, result, 'reading')); end
    for _, row in ipairs(result.magic or {}) do
        if (row.school ~= 'school_blue' or parts.blue_enabled(s, 'chance', 'chat') or parts.blue_enabled(s, 'chance', 'overlay')) then
            add(row.school, row.spell or row.school, magic_tip(s, result, row.school));
        end
    end
    if (result.weapons ~= nil and (parts.component_enabled(s, 'weapons', 'chat')
        or parts.component_enabled(s, 'weapons', 'overlay'))) then
        for _, list in ipairs({ result.weapons.weak or {}, result.weapons.resists or {} }) do
            for _, entry in ipairs(list) do
                local word = wording.BY_KEY['weapon_' .. entry.kind];
                add('weapon_' .. entry.kind, 'Weapons: ' .. (word and word.full or entry.kind), weapon_tip(s, result, entry.kind));
            end
        end
        for _, entry in ipairs(result.weapons.general or {}) do
            add('weapon_' .. entry.kind, 'Weapons: ' .. entry.label, weapon_tip(s, result, entry.kind));
        end
        if (#(result.weapons.weak or {}) == 0 and #(result.weapons.resists or {}) == 0
            and #(result.weapons.general or {}) == 0) then
            local kind = result.weapons.uncertain and 'unknown' or (result.weapons.scripted and 'scripted');
            add('weapons', 'Weapons', kind and weapon_tip(s, result, kind) or table.concat(result.weapons.notes or {}, ' '));
        end
    end
    if (result.info ~= nil) then
        for _, section in ipairs(result.info.sections or {}) do
            if (parts.info_enabled(s, section.id, 'chat') or parts.info_enabled(s, section.id, 'overlay')) then
                if (section.id == 'dangers' and section.danger_source ~= nil
                    and type(section.danger_source.entries) == 'table') then
                    local detail = dangers.readout(section.danger_source, section.low, section.high, s.dangers);
                    add('info_dangers', section.label, table.concat(detail.notes, '\n\n'));
                    for i, entry in ipairs(detail.entries) do
                        add('danger_' .. (entry.kind or 'move') .. '_' .. tostring(entry.id or i),
                            'Dangers: ' .. (entry.name or 'Unknown move'), danger_details(entry));
                        out[#out].danger_entry = entry;
                    end
                else
                    add('info_' .. section.id, section.label, info_tip(s, result, section.id, true));
                end
            end
        end
    end
    if (result.aggro ~= nil) then add('aggro', 'Aggro', aggro_tip(s, result)); end
    if (result.links ~= nil) then add('links', 'Links', links_tip(s, result, 'links', true)); end
    if (result.ph_for ~= nil) then add('ph', 'Placeholder rules', ph_tip(s, result)); end
    return out;
end

function tips.details(s, result)
    if (result == nil) then return nil; end
    local out = {};
    for _, group in ipairs(tips.detail_groups(s, result)) do out[#out + 1] = group.text; end
    return table.concat(out, '\n\n');
end

return tips;
