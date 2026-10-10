-- Keep the full source list while narrowing what each display shows.
local dangers = {};
dangers.CATEGORIES = { 'debuff', 'crit', 'dispel', 'drain', 'other' };
dangers.LABELS = { debuff = 'Debuffs', crit = 'Critical hits', dispel = 'Buff removal', drain = 'Drains', other = 'Other threats' };
dangers.MAX_MOVES = 50;

local function append(out, seen, text)
    if (type(text) == 'string' and text ~= '' and not seen[text]) then
        out[#out + 1], seen[text] = text, true;
    end
end

function dangers.matches(entry, options)
    if (type(options) ~= 'table') then return true; end
    local categories = entry.categories or { 'other' };
    for _, id in ipairs(categories) do
        if (options[id] ~= false) then return true; end
    end
    return false;
end

function dangers.at_level(entry, low, high)
    if (entry.forced or type(entry.level_ranges) ~= 'table' or #entry.level_ranges == 0
        or type(low) ~= 'number' or type(high) ~= 'number') then return true; end
    for _, range in ipairs(entry.level_ranges) do
        if (type(range[1]) ~= 'number' or type(range[2]) ~= 'number') then return true; end
        if (low <= range[2] and high >= range[1]) then return true; end
    end
    return false;
end

function dangers.entry_text(entry)
    local out, seen = {}, {};
    append(out, seen, (entry.summary or entry.name or 'Unknown move') .. '.');
    for _, note in ipairs(entry.notes or {}) do append(out, seen, note); end
    for _, note in ipairs((entry.details or {}).notes or {}) do append(out, seen, note); end
    return table.concat(out, ' ');
end

function dangers.readout(source, low, high, options)
    if (type(source.entries) ~= 'table') then
        return { value = source.value, notes = source.notes or {} };
    end
    options = options or {};
    local entries, selected, values, notes, seen = {}, {}, {}, {}, {};
    for _, entry in ipairs(source.entries) do
        if (dangers.at_level(entry, low, high)) then
            entries[#entries + 1] = entry;
            if (dangers.matches(entry, options)) then selected[#selected + 1] = entry; end
        end
    end
    local incomplete = source.incomplete == true or source.coverage == 'partial' or source.coverage == 'unresolved';
    local coverage = source.coverage or (incomplete and 'partial' or 'resolved');
    if (coverage == 'unresolved') then
        append(notes, seen, 'The move list is unresolved. Missing entries do not mean this monster is safe.');
    elseif (incomplete) then
        append(notes, seen, 'This move list is incomplete. Other threats may be missing.');
    elseif (#entries == 0) then
        append(notes, seen, 'No qualifying threats were found in the resolved move list for this level range. This is not a safety rating.');
    end
    for _, reason in ipairs(source.reasons or {}) do append(notes, seen, reason); end
    for _, note in ipairs(source.general_notes or {}) do append(notes, seen, note); end
    append(notes, seen, 'Effects can miss, be resisted or be blocked by immunity. Range, targets, TP, recasts and skill checks still apply.');
    append(notes, seen, 'These are possible moves from the source. They do not predict the next move.');
    local limit = tonumber(options.max_moves) or 0;
    limit = math.max(0, math.min(dangers.MAX_MOVES, math.floor(limit)));
    for i, entry in ipairs(selected) do
        if (limit == 0 or i <= limit) then values[#values + 1] = entry.summary or entry.name; end
    end
    local more = limit > 0 and math.max(0, #selected - limit) or 0;
    if (more > 0) then values[#values + 1] = ('+%d more'):format(more); end
    local value = table.concat(values, '; ');
    if (value == '') then
        value = #entries > 0 and 'No matching threats' or (incomplete and 'Move list unresolved' or 'No listed threats');
    elseif (incomplete) then
        value = value .. ' (list incomplete)';
    end
    if (more > 0 or #selected < #entries) then
        append(notes, seen, 'Display settings hide some moves. Target details has no length limit; Copy details also includes filtered moves.');
    end
    return { value = value, notes = notes, entries = entries, selected = selected, coverage = coverage,
        incomplete = incomplete, more = more, hidden = #entries - #selected };
end

return dangers;
