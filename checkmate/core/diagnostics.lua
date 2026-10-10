-- Build information for /checkmate info. Header reads avoid loading unused datasets.
local bands = require('data.bands');
local monsters = require('core.monsters');
local diagnostics = {};
local FILES = { 'bands', 'too_weak', 'pets', 'steal', 'crit', 'effects', 'modifiers', 'pdif', 'defenses', 'blue_finder' };
local cached, cached_key = nil, nil;

local function stamps(header)
    local built, content;
    for line in header:gmatch('[^\r\n]+') do
        built = built or line:match('^%-%- Built by .- from (.+)%.$');
        content = content or line:match('^%-%- It assumes (.+)%.$');
    end
    -- Modifiers keep their stamps near the start of the table instead of in comments.
    return built or header:match("built%s*=%s*'([^']+)'"),
        content or header:match("content%s*=%s*'([^']+)'");
end

function diagnostics.text(version)
    local zone, zone_content = monsters.built(), monsters.content();
    local key = table.concat({ tostring(addon.path), tostring(version), tostring(bands.built),
        tostring(bands.content), tostring(zone), tostring(zone_content) }, '\n');
    if (key == cached_key) then return cached; end
    local out = {
        'checkmate ' .. tostring(version),
        'Monster data: ' .. tostring(bands.built or 'unknown'),
        'Content: ' .. tostring(bands.content or 'unknown'),
        'Current zone: ' .. tostring(zone or 'no dataset loaded'),
    };
    local mismatches = {};
    local function compare(name, built, content)
        if (built ~= bands.built) then
            mismatches[#mismatches + 1] = name .. ': ' .. (built or 'missing build stamp');
        end
        if (content ~= bands.content) then
            mismatches[#mismatches + 1] = name .. ': ' .. (content or 'missing content stamp');
        end
    end
    for _, name in ipairs(FILES) do
        local file = io.open(addon.path .. 'data/' .. name .. '.lua', 'r');
        local header = file and file:read(4096) or '';
        if (file ~= nil) then file:close(); end
        local built, content = stamps(header);
        compare(name, built, content);
    end
    if (zone ~= nil) then compare('current zone', zone, zone_content); end
    out[#out + 1] = #mismatches == 0 and 'Bundled data revisions and content settings match.' or
        ('Mixed or missing data files:\n' .. table.concat(mismatches, '\n'));
    out[#out + 1] = 'These are bundled source revisions. They do not verify the running server.';
    cached, cached_key = table.concat(out, '\n'), key;
    return cached;
end

return diagnostics;
