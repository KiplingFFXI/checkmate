-- The addon as a whole. Its header, the file layout rules, every font loading on the load event and never
-- after, what a frame costs with nothing to do, with the overlay off and on, saving on unload, and d3d8 loading
-- on the load event only with the overlay and its icons on, and the overlay keeping going when it won't load.
local f = assert(io.open(ADDON_DIR .. '/checkmate.lua', 'r'));
local source = f:read('*a');
f:close();

-- Addon metadata. Each release has a three-part version.
local version = source:match("\naddon%.version = '(%d+%.%d+%.%d+)';\n") or 'missing';
check('the header', source:find("addon.name    = 'checkmate';\naddon.author  = 'Kipling';\n"
    .. "addon.version = '" .. version .. "';\n"
    .. "addon.desc    = 'Monster details, combat estimates and your pet on /check for Phoenix.';\n"
    .. "addon.link    = 'https://github.com/KiplingFFXI/checkmate';\n", 1, true) == 1);
-- No module may shadow one of Ashita's libs, and modules live under core, ui, data and assets.
local SHADOWS = { settings = true, chat = true, imgui = true, common = true, struct = true, bit = true };
local layout_ok, stray = true, {};
for _, path in ipairs(ADDON_FILES) do
    local top = path:match('^([^/]+)%.lua$');
    local folder = path:match('^([^/]+)/');
    if ((top ~= nil and (SHADOWS[top] or top ~= 'checkmate')) or (folder ~= nil and folder ~= 'core' and folder ~= 'ui'
        and folder ~= 'data' and folder ~= 'assets')) then
        layout_ok = false;
        stray[#stray + 1] = path;
    end
end
check('only checkmate.lua at the top, the rest under core, ui, data and assets', layout_ok, table.concat(stray, ', '));

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
check('with the overlay off, the load event leaves d3d8 alone', package.loaded['d3d8'] == nil and MOCK.d3d8_requires == 0);

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

-- With the overlay on and nothing targeted, a quiet frame reads your target and nothing else.
MOCK.command('/checkmate overlay on');
MOCK.frame();
MOCK.frame();
MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls = 0, 0, 0;
MOCK.wait(2);
check('with the overlay on, a quiet frame reads only your target', MOCK.reads == 120 and MOCK.entity_reads == 0
    and MOCK.player_entity_calls == 0, MOCK.reads);
MOCK.command('/checkmate overlay off');
MOCK.reads = 0;
MOCK.wait(1);
check('and off again, nothing', MOCK.reads == 0, MOCK.reads);

-- Unload saves.
local saves = MOCK.saved;
MOCK.fire('unload');
check('unload saves the settings', MOCK.saved == saves + 1);
check('and no font loaded after the load event', #MOCK.font_calls == 2 and #MOCK.stray_font_loads() == 0,
    table.concat(MOCK.stray_font_loads(), ', '));

-- The overlay's pictures. d3d8 loads on the load event only with the overlay and its icons on. Turning the overlay
-- on above loaded it, and ui\icons.lua keeps it, so this makes it load again, like a fresh start.
local function forget_d3d8()
    local icons = require('ui.icons');
    for i = 1, 50 do
        local name, library = debug.getupvalue(icons.prepare, i);
        if (name == 'library') then
            for j = 1, 50 do
                if (debug.getupvalue(library, j) == 'd3d8') then
                    debug.setupvalue(library, j, nil);
                    package.loaded['d3d8'], MOCK.d3d8_requires = nil, 0;
                    return;
                end
            end
        end
    end
    error('ui.icons keeps no d3d8');
end
forget_d3d8();
MOCK.command('/checkmate overlayicons off');
MOCK.command('/checkmate overlay on');
MOCK.fire('load');
check('nor with the overlay on and Show icons off', MOCK.d3d8_requires == 0);
-- Show icons on in the settings, the way a settings file has it. d3d8 won't load this time.
MOCK.settings.current.overlay.icons = true;
MOCK.d3d8_error = true;
MOCK.fire('load');
check('with both on, the load event loads d3d8 before any frame', MOCK.d3d8_requires == 1, MOCK.d3d8_requires);
for id, name in pairs({ [4104] = 'Fire Crystal', [4105] = 'Ice Crystal' }) do
    MOCK.items[id] = { Name = { name } };
    MOCK.picture('item', id);
end
for _, id in ipairs({ 4, 11, 178, 179, 183 }) do MOCK.picture('status', id); end
for _, part in ipairs({ 'immunities', 'elements', 'drops' }) do MOCK.command('/checkmate overlayshow ' .. part); end
MOCK.command('/checkmate overlaywrap 0');
MOCK.target_monster(1, 'Fixture Goblin');
n = #MOCK.printed;
MOCK.frame();
local shown = table.concat(MOCK.overlay_lines(), ' // ');
check('with no d3d8, elements get badges and items and immunities their names', shown:find('Immune: Bind, Paralyze', 1, true)
    ~= nil and shown:find('Weak: [I] Ice | Resists: [F] Fire', 1, true) ~= nil
    and shown:find('Drops (TH 0): Ice Crystal 100%, Fire Crystal 16%', 1, true) ~= nil, shown);
local stopped = false;
for _, line in ipairs(MOCK.printed_since(n)) do stopped = stopped or line:find('stopped', 1, true) ~= nil; end
check('and the overlay keeps going', not stopped and #MOCK.overlay_lines() > 0);
check('and d3d8 is only tried the once, however many pictures are new', MOCK.d3d8_requires == 1 and MOCK.texture_loads == 0,
    MOCK.d3d8_requires);

return MOCK.report();
