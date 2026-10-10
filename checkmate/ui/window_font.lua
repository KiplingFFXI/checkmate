--[[
    The settings window's font. Ashita's own font is always there. Every other one is a file in the
    Windows fonts folder. The overlay picks its own font from the same list.

    Adding a font in the middle of a frame can crash the game. So every font in the list loads once,
    on the load event, and stays loaded until the game closes. Picking a font only switches between
    the ones that loaded. A font whose file is missing or won't load leaves the window in Ashita's font.

    The chat log's font belongs to the game, and no addon can change it.
]]

local imgui = require('imgui');

local window_font = {};

-- The fonts you can pick, Ashita's own first. The rest come with every Windows install.
window_font.LIST = {
    { id = 'ashita',   name = 'Ashita' },
    { id = 'segoeui',  name = 'Segoe UI', file = 'segoeui.ttf' },
    { id = 'arial',    name = 'Arial',    file = 'arial.ttf' },
    { id = 'tahoma',   name = 'Tahoma',   file = 'tahoma.ttf' },
    { id = 'verdana',  name = 'Verdana',  file = 'verdana.ttf' },
    { id = 'calibri',  name = 'Calibri',  file = 'calibri.ttf' },
    { id = 'consolas', name = 'Consolas', file = 'consola.ttf' },
};

-- Font sizes in whole pixels. Ashita draws its own font at 18.
window_font.SIZE_MIN     = 12;
window_font.SIZE_MAX     = 24;
window_font.SIZE_DEFAULT = 18;

-- The Windows fonts folder.
window_font.FOLDER = ('%s\\Fonts\\'):format(os.getenv('WINDIR') or 'C:\\Windows');

-- The size a font loads at. ImGui draws it at any size from there.
local LOAD_SIZE = 18;

local BY_ID = {};
local ids = {};
for _, entry in ipairs(window_font.LIST) do
    BY_ID[entry.id] = entry;
    ids[#ids + 1] = entry.id;
end

-- The font ids, for the help text and error lines.
window_font.IDS = table.concat(ids, ', ');

-- The ImFont for each Windows font that loaded.
local loaded = {};

-- Lowercase letters and digits only, so "Segoe UI", "segoeui" and "SEGOE-UI" match.
local function squash(text)
    return (tostring(text or ''):lower():gsub('[^%w]', ''));
end

-- The font with this id or name, in any case and with or without spaces, or nil.
function window_font.find(word)
    local wanted = squash(word);
    for _, entry in ipairs(window_font.LIST) do
        if (wanted == entry.id or wanted == squash(entry.name)) then
            return entry;
        end
    end
    return nil;
end

-- A known font id, or Ashita's.
function window_font.clean_id(id)
    return BY_ID[id] ~= nil and id or window_font.LIST[1].id;
end

-- A whole number of pixels between the smallest and biggest size, or the default.
function window_font.clean_size(size)
    size = tonumber(size);
    if (size == nil) then
        return window_font.SIZE_DEFAULT;
    end
    return math.max(window_font.SIZE_MIN, math.min(window_font.SIZE_MAX, math.floor(size + 0.5)));
end

-- Where the font's file is, or nil for Ashita's own.
function window_font.path(id)
    local entry = BY_ID[id];
    return (entry ~= nil and entry.file ~= nil) and (window_font.FOLDER .. entry.file) or nil;
end

-- Loads every Windows font in the list. Only the load event calls this.
function window_font.load_all()
    for _, entry in ipairs(window_font.LIST) do
        local path = window_font.path(entry.id);
        if (path ~= nil and ashita.fs.exists(path)) then
            local ok, face = pcall(imgui.AddFontFromFileTTF, path, LOAD_SIZE);
            if (ok) then
                loaded[entry.id] = face;
            end
        end
    end
end

-- The ImFont to draw with, or nil to draw in Ashita's own.
function window_font.face(id)
    return loaded[id];
end

-- True when a Windows font's file is missing or wouldn't load.
function window_font.failed(id)
    return window_font.path(id) ~= nil and loaded[id] == nil;
end

return window_font;
