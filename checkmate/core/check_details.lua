-- Only the latest manual check may replace the saved details.
local details = {};
local info = require('core.info');
local latest, saved;

function details.begin(check)
    latest, saved = check, nil;
end

function details.save(check, result)
    if (check ~= latest) then return; end
    saved = result;
    local provenance = {};
    for key, value in pairs(result.provenance or {}) do provenance[key] = value; end
    provenance.chat_snapshot = true;
    saved.provenance = provenance;
end

function details.current()
    return saved;
end

function details.refresh(seen)
    if (saved == nil or saved.info == nil) then return; end
    local sections;
    for index, section in ipairs(saved.info.sections) do
        local current = info.refresh_observation(section, seen == true);
        if (sections == nil and current ~= section) then
            sections = {};
            for before = 1, index - 1 do sections[before] = saved.info.sections[before]; end
        end
        if (sections ~= nil) then sections[index] = current; end
    end
    if (sections ~= nil) then
        local current = {};
        for key, value in pairs(saved) do current[key] = value; end
        current.info = { sections = sections };
        saved = current;
    end
end

function details.forget(index)
    if (index == nil or (latest ~= nil and latest.index == index)) then latest, saved = nil, nil; end
end

return details;
