--[[
    The chat colors as screen colors, for the settings window's swatches and the overlay's text.

    Each is the CSS color libs\chat.lua names the code after. 104 and 106 are chat.lua's warning and
    message colors and have no CSS name, so a pale yellow and a cream stand in. 102 has no name there
    either, and a light blue stands in. The game's own shades in the chat log differ, and "Print a
    sample" shows the real ones.
]]

local printout = require('core.printout');
local skins    = require('ui.skins');

local chat_colors = {};

local CHAT_RGB = {
    [1]  = 'ffffff', [2]  = '7cfc00', [3]  = '7b68ee', [5]  = 'ff00ff', [6]   = '00ffff', [7]   = 'ffe4b5',
    [8]  = 'ff7f50', [65] = '696969', [67] = '808080', [68] = 'fa8072', [69]  = 'ffff00', [71]  = '4169e1',
    [72] = '8b008b', [73] = 'ee82ee', [76] = 'ff6347', [77] = 'ffe4e1', [78]  = 'eee8aa', [79]  = '00ff00',
    [80] = '98fb98', [81] = '9932cc', [82] = '00ffff', [83] = '00ff7f', [85]  = 'e9967a', [88]  = '00fa9a',
    [89] = '9370db', [90] = 'f0ffff', [92] = 'e0ffff', [96] = 'fafad2', [102] = 'add8e6', [104] = 'ffff80',
    [105] = 'dda0dd', [106] = 'ffefc2',
};

-- The screen color of each chat color, by its code.
chat_colors.SWATCHES = {};
for _, entry in ipairs(printout.PALETTE) do
    chat_colors.SWATCHES[entry.code] = skins.hex(CHAT_RGB[entry.code] or 'ffffff');
end

return chat_colors;
