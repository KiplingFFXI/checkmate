-- The addon as a whole. Its header, the file layout rules, every font loading on the load event and never
-- after, what a frame costs with nothing to do, and saving on unload.
local f = assert(io.open(ADDON_DIR .. '/checkmate.lua', 'r'));
local source = f:read('*a');
f:close();

-- The header, word for word. The version is any three numbers, because each release bumps it.
local version = source:match("\naddon%.version = '(%d+%.%d+%.%d+)';\n") or 'missing';
check('the header', source:find("addon.name    = 'checkmate';\naddon.author  = 'Kipling';\n"
    .. "addon.version = '" .. version .. "';\n"
    .. "addon.desc    = 'Hit, evade, crit, aggro, magic, immunities, elements, drops and your pet on /check for Phoenix.';\n"
    .. "addon.link    = 'https://github.com/KiplingFFXI/checkmate';\n", 1, true) == 1);
check('the top comment says what it sends and hides', source:find('/checkparam <me>', 1, true) ~= nil
    and source:find('six reply lines', 1, true) ~= nil and source:find('hides the game\'s own line for your /check', 1, true) ~= nil
    and source:find('/checkparam <pet>', 1, true) ~= nil and source:find('five reply lines', 1, true) ~= nil
    and source:find('jug pet, wyvern or automaton', 1, true) ~= nil);

-- No module may shadow one of Ashita's libs, and modules live under core, ui and data.
local SHADOWS = { settings = true, chat = true, imgui = true, common = true, struct = true, bit = true };
local layout_ok, stray = true, {};
for _, path in ipairs(ADDON_FILES) do
    local top = path:match('^([^/]+)%.lua$');
    local folder = path:match('^([^/]+)/');
    if ((top ~= nil and (SHADOWS[top] or top ~= 'checkmate')) or (folder ~= nil and folder ~= 'core' and folder ~= 'ui'
        and folder ~= 'data')) then
        layout_ok = false;
        stray[#stray + 1] = path;
    end
end
check('only checkmate.lua at the top, the rest under core, ui and data', layout_ok, table.concat(stray, ', '));

-- A settings file with Segoe UI as the window's font, in a test fonts folder that holds a made-up Segoe UI
-- and Tahoma.
local window_font = require('ui.window_font');
window_font.FOLDER = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\';
for _, file in ipairs({ 'segoeui.ttf', 'tahoma.ttf' }) do
    local font_file = assert(io.open(window_font.FOLDER .. file, 'w'));
    font_file:write('not really a font');
    font_file:close();
end
MOCK.settings_file = { look = { font = 'segoeui', font_size = 16 } };

dofile(ADDON_DIR .. '/checkmate.lua');
check('nothing loads a font before the load event', #MOCK.font_calls == 0);
MOCK.fire('load');
check('the load event loads every font whose file is there, before any frame', #MOCK.fonts_loaded == 2
    and MOCK.fonts_loaded[1].path == window_font.FOLDER .. 'segoeui.ttf'
    and MOCK.fonts_loaded[2].path == window_font.FOLDER .. 'tahoma.ttf' and #MOCK.font_calls == 2
    and #MOCK.stray_font_loads() == 0);
check('the fonts it loaded are the ones the window draws with', window_font.face('segoeui') == MOCK.fonts_loaded[1]
    and window_font.face('tahoma') == MOCK.fonts_loaded[2] and window_font.failed('verdana')
    and not window_font.failed('ashita') and window_font.face('ashita') == nil);

-- A /check prints.
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.entities[1] = { Name = 'Fixture Goblin' };
local n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('a /check prints, with the star between parts', MOCK.printed_since(n)[1]
    == '[checkmate] Fixture Goblin (Lv 39) \129\154 Even Match', MOCK.printed_since(n)[1]);
MOCK.settings.current.printout.show_id = true;
n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
check('with Show its ID on, the ID is the one the /check reply named', MOCK.printed_since(n)[1]
    == '[checkmate] Fixture Goblin (Lv 39) (ID ' .. MOCK.mob_id(900, 1) .. ') \129\154 Even Match', MOCK.printed_since(n)[1]);
MOCK.settings.current.printout.show_id = false;

-- With nothing waiting, a frame reads no game memory.
MOCK.frame();
MOCK.reads = 0;
MOCK.wait(2);
check('a quiet frame reads no game memory', MOCK.reads == 0, MOCK.reads);
MOCK.zone_in(900);
MOCK.wait(1);
check('after zoning it reads your job once', MOCK.reads > 0 and MOCK.reads <= 3, MOCK.reads);

-- Unload saves.
local saves = MOCK.saved;
MOCK.fire('unload');
check('unload saves the settings', MOCK.saved == saves + 1);
check('and no font loaded after the load event', #MOCK.font_calls == 2 and #MOCK.stray_font_loads() == 0,
    table.concat(MOCK.stray_font_loads(), ', '));

return MOCK.report();
