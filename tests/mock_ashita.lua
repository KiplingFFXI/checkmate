--[[
    Stand-in for Ashita v4 and the game, so checkmate runs outside the game.

    Ashita's own common.lua, chat.lua, json.lua and imgui.lua load from ASHITA_LIBS, so T{}, the table
    merge, :args(), the chat color codes and the imgui constants are the real ones. The game's memory,
    the settings library, the chat log and the GUI manager under imgui.lua are mocked here. Every imgui
    call is checked and recorded. Tests click, type and slide through MOCK.clicks, MOCK.typing and MOCK.slide.

    run.py sets ADDON_DIR, ADDON_PATH (the addon folder with a trailing backslash, like addon.path in
    game), ADDON_FILES, FIXTURES_PATH, ASHITA_LIBS and MOCK_INSTALL_PATH before this runs.
]]

require('common');

MOCK = {
    now      = 0,
    events   = {},
    printed  = {},
    commands = {},       -- Every QueueCommand as { mode, command }.
    saved    = 0,        -- settings.save() calls.
    zoning   = false,    -- True hides your entity, like the zone screen.
    reads    = 0,        -- Game memory reads through AshitaCore:GetMemoryManager().
    player = {
        server_id = 1001, name = 'Tester', zone = 103,
        main_job = 4, main_level = 75,
        -- Base stats by Ashita's index, 0 to 6 for STR DEX VIT AGI INT MND CHR, and the gear and buff
        -- bonus on top by the same index.
        stats     = { [0] = 60, [1] = 70, [2] = 60, [3] = 65, [4] = 90, [5] = 70, [6] = 60 },
        stat_mods = {},
        skills    = {},                                      -- [skill id] = value.
        buffs     = {},                                      -- Buff ids.
        equipment = {},                                      -- [slot] = item id.
    },
    items    = {},       -- [id] = { Name = { 'name' }, Skill = n }
    entities = {},       -- [index] = { Name = 'name' }
    screen   = { 1600, 1200 },
};

-- Each test file records its results with check() or expect() and ends by returning MOCK.report().
local results, failed = {}, 0;
function check(name, cond, detail)
    if (cond) then table.insert(results, 'ok   ' .. name);
    else failed = failed + 1; table.insert(results, 'FAIL ' .. name .. (detail and ('  -> ' .. tostring(detail)) or '')); end
end
function expect(name, got, want) check(name, got == want, got); end
function MOCK.report()
    table.insert(results, (failed == 0) and 'ALL PASSED' or (failed .. ' FAILED'));
    return table.concat(results, '\n');
end

-- os.clock is driven by the tests.
os.clock = function () return MOCK.now; end

addon = { name = 'checkmate', path = ADDON_PATH };

-- struct.unpack for the little-endian formats checkmate reads.
struct = {};
function struct.unpack(fmt, data, pos)
    local function byte(i) return data:byte(pos + i) or 0; end
    if (fmt == 'L' or fmt == 'l') then
        local v = byte(0) + byte(1) * 256 + byte(2) * 65536 + byte(3) * 16777216;
        if (fmt == 'l' and v >= 2147483648) then v = v - 4294967296; end
        return v;
    elseif (fmt == 'H') then
        return byte(0) + byte(1) * 256;
    elseif (fmt == 'B') then
        return byte(0);
    end
    error('unsupported struct format ' .. fmt);
end

ashita = { events = {}, fs = {} };
function ashita.events.register(name, alias, fn)
    MOCK.events[name] = MOCK.events[name] or {};
    MOCK.events[name][alias] = fn;
end
-- run.py makes the config folder, so create_dir does nothing. exists checks the real file.
function ashita.fs.create_dir() return true; end
function ashita.fs.exists(path)
    local f = io.open(path, 'r');
    if (f == nil) then return false; end
    f:close();
    return true;
end

-- MOCK.firing names the event running right now, like 'load' or 'd3d_present', and is nil between them.
function MOCK.fire(name, e)
    e = e or {};
    local outer = MOCK.firing;
    MOCK.firing = name;
    for _, fn in pairs(MOCK.events[name] or {}) do fn(e); end
    MOCK.firing = outer;
    return e;
end

--[[
    Game memory.
]]

local function party()
    return {
        GetMemberServerId = function (_, i) return MOCK.player.server_id; end,
        GetMemberZone = function (_, i) return MOCK.player.zone; end,
    };
end

local function player_memory()
    local p = MOCK.player;
    return {
        GetMainJob = function () return p.main_job; end,
        GetMainJobLevel = function () return p.main_level; end,
        GetStat = function (_, i) return p.stats[i] or 0; end,
        GetStatModifier = function (_, i) return p.stat_mods[i] or 0; end,
        GetCombatSkill = function (_, id)
            return { GetSkill = function () return p.skills[id] or 0; end };
        end,
        -- 32 slots from 0, with 255 for an empty one.
        GetBuffs = function ()
            local b = {};
            for i = 0, 31 do b[i] = p.buffs[i + 1] or 255; end
            return b;
        end,
    };
end

-- An equipped item sits in container 0 at slot + 10, so the two lookups have to agree.
local function inventory()
    return {
        GetEquippedItem = function (_, slot)
            if (MOCK.player.equipment[slot] == nil) then return nil; end
            return { Slot = slot, Index = 0 * 256 + (slot + 10) };
        end,
        GetContainerItem = function (_, container, index)
            if (container ~= 0) then return { Id = 0 }; end
            return { Id = MOCK.player.equipment[index - 10] or 0 };
        end,
    };
end

-- Each read of your memory is counted, so a test can see a frame doing nothing.
local memory = {};
for name, fn in pairs({ GetParty = party, GetPlayer = player_memory, GetInventory = inventory }) do
    memory[name] = function (...)
        MOCK.reads = MOCK.reads + 1;
        return fn(...);
    end;
end

--[[
    Recorded imgui, the GUI manager behind Ashita's real libs/imgui.lua.

    Every call is checked. The function must exist in Ashita's IGuiManager annotations, no argument
    may be nil, and every Begin/End and Push/Pop pair must balance by the end of each frame. Each
    widget gets a path from the tab, the PushID ids and the open combo or list labels, like
    'Printout/hit/##label'.
    Tests drive input by path. MOCK.clicks[path] = true clicks a Button, ArrowButton, Checkbox or
    Selectable. MOCK.typing[path] = text types into an InputText. MOCK.slide[path] = value moves a
    SliderInt or SliderFloat, or sets the first number of a ColorEdit4. Each of those is used once.
    MOCK.open[path] = true keeps a BeginCombo open.
    MOCK.deactivate = true makes IsItemDeactivatedAfterEdit answer true. MOCK.close_x = true clicks
    the window's X once. MOCK.window_size = { w, h } resizes the window and MOCK.window_pos = { x, y }
    moves it, each frame while it's set. The window keeps its spot and size between frames like ImGui's,
    and SetNextWindowPos and SetNextWindowSize only change them on the frame it appears or with
    ImGuiCond_Always. MOCK.avail is the room GetContentRegionAvail
    answers, 680 wide by default. MOCK.hover = true makes IsItemHovered answer true, so every (?)
    draws its tip.
    After each frame MOCK.gui holds what was drawn, in calls, names, paths (path -> widget), disabled
    (paths drawn greyed out), texts, formats (slider path -> format), previews (combo path -> the text
    it shows closed), tabs, colors (ImGuiCol id -> the first color pushed for it), fonts (each
    PushFont as { font, size }), tables (table id -> its column count), next_pos and next_pos_cond
    (the last SetNextWindowPos), helps (the path of each thing a (?) follows -> true) and, while
    MOCK.hover is on, tips (that path -> the text of its tip). A text's path is its tab and ids, then
    the text itself, like 'Profiles/PROFILES'.
    GetFont() answers MOCK.ashita_font. AddFontFromFileTTF answers a made-up font table { path, size }
    and records it in MOCK.fonts_loaded. MOCK.broken_fonts[file name] = 'error' makes it raise an error
    for that file instead, and 'nil' makes it answer nil. Every call, broken or not, goes in
    MOCK.font_calls as { path, event }, with the event that was running then.
    GetFontSize() answers the size last pushed, or 18 with nothing pushed.
]]

local GUI_NAMES = {};
do
    local f = assert(io.open(ASHITA_LIBS .. '/annotations/SDK/IGuiManager.lua', 'r'));
    for name in f:read('*a'):gmatch('function IGuiManager[.:]([%w_]+)%(') do
        GUI_NAMES[name] = true;
    end
    f:close();
end

MOCK.clicks, MOCK.typing, MOCK.slide, MOCK.open = {}, {}, {}, {};
MOCK.ashita_font = { name = 'Ashita font' };
MOCK.fonts_loaded = {};
MOCK.font_calls = {};
MOCK.broken_fonts = {};

local stack = {};        -- Tab, PushID and open combo labels, for widget paths.
local last_item = nil;   -- The path of the last widget or text drawn.
local help_owner = nil;  -- The path the last (?) follows.
local tip_lines = nil;   -- The text drawn in the open tooltip.
local font_sizes = {};   -- Sizes pushed with PushFont.
local balance = {};      -- Open Begin/Push calls by kind.
local disabled = {};     -- BeginDisabled flags.
local greyed = 0;        -- How many of those are true.

local function need(ok, what)
    if (not ok) then error('imgui misuse: ' .. what, 3); end
end
local function bump(kind, step)
    balance[kind] = (balance[kind] or 0) + step;
    need(balance[kind] >= 0, 'too many ends for ' .. kind);
end
local function path(label)
    return table.concat(stack, '/') .. (#stack > 0 and '/' or '') .. label;
end
local function seen(label, widget)
    local p = path(label);
    last_item = p;
    MOCK.gui.paths[p] = widget;
    if (greyed > 0) then MOCK.gui.disabled[p] = true; end
    return p;
end
local function take(list, p)
    local v = list[p];
    list[p] = nil;
    return v;
end
local function is_color(c)
    return type(c) == 'table' and type(c[1]) == 'number' and type(c[2]) == 'number' and type(c[3]) == 'number'
        and type(c[4]) == 'number';
end
local function push(label)
    stack[#stack + 1] = label;
end
-- Text drawn in the window, or in the open tooltip.
local function drew_text(text)
    if (tip_lines ~= nil) then
        tip_lines[#tip_lines + 1] = text;
        return;
    end
    last_item = path(text);
    MOCK.gui.texts[#MOCK.gui.texts + 1] = text;
end
local function pop()
    table.remove(stack);
end

-- The window's spot and size as ImGui keeps them, the frame it last drew in, and the SetNextWindowPos and
-- SetNextWindowSize that wait for the next Begin.
local window = { pos = { 120, 20 }, size = { 720, 560 }, drawn = nil };
local pending = {};
local frames = 0;

local SPECIAL = {
    Begin = function (name, open, flags)
        need(type(name) == 'string' and type(open) == 'table' and type(flags) == 'number', 'Begin args');
        bump('window', 1);
        MOCK.gui.window = name;
        local appearing = window.drawn ~= frames - 1;
        window.drawn = frames;
        for key, next_ in pairs(pending) do
            if (appearing or next_.cond == ImGuiCond_Always) then
                window[key] = next_.value;
            end
        end
        pending = {};
        window.pos = MOCK.window_pos or window.pos;
        window.size = MOCK.window_size or window.size;
        if (MOCK.close_x) then open[1] = false; MOCK.close_x = false; end
        return true;
    end,
    End = function () bump('window', -1); end,
    BeginTabBar = function () bump('tab bar', 1); return true; end,
    EndTabBar = function () bump('tab bar', -1); end,
    BeginTabItem = function (label)
        need(type(label) == 'string', 'BeginTabItem label');
        bump('tab', 1); push(label); MOCK.gui.tabs[label] = true;
        return true;
    end,
    EndTabItem = function () bump('tab', -1); pop(); end,
    BeginTable = function (id, columns, flags)
        need(type(id) == 'string' and type(columns) == 'number' and type(flags) == 'number', 'BeginTable args');
        bump('table', 1);
        MOCK.gui.tables[id] = columns;
        return true;
    end,
    EndTable = function () bump('table', -1); end,
    TableSetupColumn = function (label) need(type(label) == 'string', 'TableSetupColumn label'); end,
    BeginCombo = function (label, preview)
        need(type(label) == 'string' and type(preview) == 'string', 'BeginCombo args');
        local p = seen(label, 'BeginCombo');
        MOCK.gui.previews[p] = preview;
        if (MOCK.open[p]) then bump('combo', 1); push(label); return true; end
        return false;
    end,
    -- Once a combo or list box ends, the last thing drawn is the combo or list box itself.
    EndCombo = function () bump('combo', -1); last_item = path(''):sub(1, -2); pop(); end,
    BeginListBox = function (label, size)
        need(type(label) == 'string' and type(size) == 'table', 'BeginListBox args');
        seen(label, 'BeginListBox');
        bump('list box', 1); push(label);
        return true;
    end,
    EndListBox = function () bump('list box', -1); last_item = path(''):sub(1, -2); pop(); end,
    PushID = function (id) need(type(id) == 'string', 'PushID string'); bump('id', 1); push(id); end,
    PopID = function () bump('id', -1); pop(); end,
    BeginDisabled = function (flag)
        need(type(flag) == 'boolean', 'BeginDisabled boolean');
        bump('disabled', 1);
        disabled[#disabled + 1] = flag;
        if (flag) then greyed = greyed + 1; end
    end,
    EndDisabled = function ()
        bump('disabled', -1);
        if (table.remove(disabled)) then greyed = greyed - 1; end
    end,
    PushTextWrapPos = function () bump('wrap', 1); end,
    PopTextWrapPos = function () bump('wrap', -1); end,
    PushStyleColor = function (id, color)
        need(type(id) == 'number' and is_color(color), 'PushStyleColor args');
        bump('style color', 1);
        if (MOCK.gui.colors[id] == nil) then MOCK.gui.colors[id] = color; end
    end,
    PushFont = function (font, size)
        need(type(font) == 'table' and type(size) == 'number' and size > 0, 'PushFont args');
        bump('font', 1);
        font_sizes[#font_sizes + 1] = size;
        MOCK.gui.fonts[#MOCK.gui.fonts + 1] = { font = font, size = size };
    end,
    PopFont = function () bump('font', -1); table.remove(font_sizes); end,
    GetFont = function () return MOCK.ashita_font; end,
    GetFontSize = function () return font_sizes[#font_sizes] or 18; end,
    AddFontFromFileTTF = function (path, size)
        need(type(path) == 'string' and type(size) == 'number', 'AddFontFromFileTTF args');
        MOCK.font_calls[#MOCK.font_calls + 1] = { path = path, event = MOCK.firing };
        local broken = MOCK.broken_fonts[path:match('[^\\/]+$')];
        if (broken == 'error') then error('the font file is broken'); end
        if (broken == 'nil') then return nil; end
        local font = { path = path, size = size };
        MOCK.fonts_loaded[#MOCK.fonts_loaded + 1] = font;
        return font;
    end,
    PopStyleColor = function (n) bump('style color', -(n or 1)); end,
    PushStyleVar = function (id, v)
        need(type(id) == 'number' and (type(v) == 'number' or (type(v) == 'table' and #v == 2)), 'PushStyleVar args');
        bump('style var', 1);
    end,
    PopStyleVar = function (n) bump('style var', -(n or 1)); end,
    TextColored = function (color, text)
        need(is_color(color) and type(text) == 'string', 'TextColored args');
        drew_text(text);
    end,
    TextUnformatted = function (text)
        need(type(text) == 'string', 'TextUnformatted string');
        drew_text(text);
    end,
    -- A (?) belongs to the widget or text drawn just before it.
    TextDisabled = function (text)
        need(type(text) == 'string', 'TextDisabled string');
        MOCK.gui.texts[#MOCK.gui.texts + 1] = text;
        if (text == '(?)') then
            need(last_item ~= nil, 'a (?) with nothing before it');
            help_owner = last_item;
            MOCK.gui.helps[help_owner] = true;
        end
    end,
    IsItemHovered = function () return MOCK.hover == true; end,
    BeginTooltip = function ()
        bump('tooltip', 1);
        tip_lines = {};
    end,
    EndTooltip = function ()
        bump('tooltip', -1);
        MOCK.gui.tips[help_owner] = table.concat(tip_lines, ' ');
        tip_lines = nil;
    end,
    Button = function (label)
        need(type(label) == 'string', 'Button label');
        return take(MOCK.clicks, seen(label, 'Button')) == true;
    end,
    ArrowButton = function (id, dir)
        need(type(id) == 'string' and type(dir) == 'number', 'ArrowButton args');
        return take(MOCK.clicks, seen(id, 'ArrowButton')) == true;
    end,
    Checkbox = function (label, t)
        need(type(label) == 'string' and type(t) == 'table' and type(t[1]) == 'boolean', 'Checkbox args');
        if (take(MOCK.clicks, seen(label, 'Checkbox'))) then
            t[1] = not t[1];
            return true;
        end
        return false;
    end,
    Selectable = function (label, selected)
        need(type(label) == 'string' and type(selected) == 'boolean', 'Selectable args');
        return take(MOCK.clicks, seen(label, 'Selectable')) == true;
    end,
    InputText = function (label, buffer, size)
        need(type(label) == 'string' and type(buffer) == 'table' and type(buffer[1]) == 'string'
            and type(size) == 'number', 'InputText args');
        local typed = take(MOCK.typing, seen(label, 'InputText'));
        if (typed ~= nil) then buffer[1] = typed; return true; end
        return false;
    end,
    SliderInt = function (label, t, low, high, format, flags)
        need(type(label) == 'string' and type(t) == 'table' and type(t[1]) == 'number' and low <= high
            and type(format) == 'string' and type(flags) == 'number', 'slider args');
        local p = seen(label, 'Slider');
        MOCK.gui.formats[p] = format;
        local v = take(MOCK.slide, p);
        if (v ~= nil) then t[1] = v; return true; end
        return false;
    end,
    ColorEdit4 = function (label, color, flags)
        need(type(label) == 'string' and is_color(color) and type(flags) == 'number', 'ColorEdit4 args');
        local v = take(MOCK.slide, seen(label, 'ColorEdit4'));
        if (v ~= nil) then color[1] = v; return true; end
        return false;
    end,
    ColorButton = function (id, color, flags, size)
        need(type(id) == 'string' and is_color(color) and type(flags) == 'number' and type(size) == 'table'
            and size[1] > 0, 'ColorButton args');
        return false;
    end,
    IsItemDeactivatedAfterEdit = function () return MOCK.deactivate == true; end,
    IsMouseDown = function () return MOCK.mouse_down == true; end,
    SetNextWindowSize = function (size, cond)
        need(type(size) == 'table' and size[1] > 0 and size[2] > 0 and type(cond) == 'number', 'SetNextWindowSize');
        MOCK.gui.next_size = { size[1], size[2] };
        pending.size = { value = MOCK.gui.next_size, cond = cond };
    end,
    GetWindowSize = function ()
        return window.size[1], window.size[2];
    end,
    SetNextWindowPos = function (pos, cond)
        need(type(pos) == 'table' and type(pos[1]) == 'number' and type(pos[2]) == 'number'
            and type(cond) == 'number', 'SetNextWindowPos');
        MOCK.gui.next_pos = { pos[1], pos[2] };
        MOCK.gui.next_pos_cond = cond;
        pending.pos = { value = MOCK.gui.next_pos, cond = cond };
    end,
    GetWindowPos = function ()
        return window.pos[1], window.pos[2];
    end,
    GetFrameHeight = function () return 22; end,
    GetIO = function () return { DisplaySize = { x = MOCK.screen[1], y = MOCK.screen[2] } }; end,
    GetContentRegionAvail = function () return MOCK.avail or 680, 400; end,
    CalcTextSize = function (text) return #text * 7, 14; end,
};
SPECIAL.SliderFloat = SPECIAL.SliderInt;

local gui = setmetatable({}, { __index = function (_, name)
    if (not GUI_NAMES[name]) then
        error('imgui misuse: IGuiManager has no function ' .. tostring(name), 2);
    end
    return function (...)
        local count = select('#', ...);
        local args = { ... };
        for i = 1, count do
            if (args[i] == nil) then error(('imgui misuse: %s got nil for argument %d'):format(name, i), 2); end
        end
        MOCK.gui.calls[#MOCK.gui.calls + 1] = name;
        MOCK.gui.names[name] = true;
        local special = SPECIAL[name];
        if (special) then return special(...); end
    end;
end });

local function fresh_gui()
    MOCK.gui = { calls = {}, names = {}, paths = {}, disabled = {}, texts = {}, formats = {}, previews = {}, tabs = {},
        colors = {}, fonts = {}, tables = {}, helps = {}, tips = {}, next_size = MOCK.gui and MOCK.gui.next_size,
        next_pos = MOCK.gui and MOCK.gui.next_pos };
    last_item, help_owner, tip_lines = nil, nil, nil;
end
fresh_gui();

-- Every font load that ran outside the load event, as "path during event" lines.
function MOCK.stray_font_loads()
    local stray = {};
    for _, call in ipairs(MOCK.font_calls) do
        if (call.event ~= 'load') then
            stray[#stray + 1] = ('%s during %s'):format(call.path, tostring(call.event));
        end
    end
    return stray;
end

-- True when the text was drawn this frame, anywhere in it.
function MOCK.drew(text)
    for _, each in ipairs(MOCK.gui.texts) do
        if (each:find(text, 1, true)) then return true; end
    end
    return false;
end

AshitaCore = {
    GetMemoryManager = function () return memory; end,
    GetChatManager = function ()
        return {
            QueueCommand = function (_, mode, command)
                MOCK.commands[#MOCK.commands + 1] = { mode = mode, command = command };
            end,
        };
    end,
    GetResourceManager = function ()
        return { GetItemById = function (_, id) return MOCK.items[id]; end };
    end,
    GetGuiManager = function () return gui; end,
    GetInstallPath = function () return MOCK_INSTALL_PATH; end,
};

function GetPlayerEntity()
    if (MOCK.zoning) then return nil; end
    return { Name = MOCK.player.name, ServerId = MOCK.player.server_id };
end
function GetEntity(index) return MOCK.entities[index]; end

-- Chat lines land in MOCK.printed. MOCK.plain() takes the color codes out.
print = function (x) MOCK.printed[#MOCK.printed + 1] = tostring(x); end

function MOCK.plain(line)
    return (line:gsub('[\30\31].', ''));
end

-- Chat lines printed after the first n, without color codes.
function MOCK.printed_since(n)
    local lines = {};
    for i = n + 1, #MOCK.printed do
        lines[#lines + 1] = MOCK.plain(MOCK.printed[i]);
    end
    return lines;
end

--[[
    The settings library, the way Ashita's works. load() takes the character's file
    (MOCK.settings_file, a plain table, or nil for none) or a deep copy of the defaults, then merges the
    defaults in with Ashita's table.merge, which fills a missing key with the defaults' own table.
    reset() starts again from a deep copy of the defaults. switch_character() is another character
    logging in. save() only counts, and keeps a copy in MOCK.last_save.
]]

local function to_T(value)
    if (type(value) ~= 'table') then return value; end
    local out = T{};
    for k, v in pairs(value) do out[k] = to_T(v); end
    return out;
end

local settings_lib = { current = nil, defaults = nil, callbacks = {} };

local function raise()
    for _, fn in pairs(settings_lib.callbacks) do fn(settings_lib.current); end
end

function settings_lib.load(defaults)
    settings_lib.defaults = defaults;
    local loaded = (MOCK.settings_file ~= nil) and to_T(MOCK.settings_file) or defaults:copy(true);
    settings_lib.current = loaded:merge(defaults);
    return settings_lib.current;
end
function settings_lib.save()
    MOCK.saved = MOCK.saved + 1;
    MOCK.last_save = to_T(settings_lib.current);
    return true;
end
function settings_lib.reset()
    settings_lib.current = T{}:merge(settings_lib.defaults:copy(true));
    raise();
    return true;
end
function settings_lib.switch_character(file)
    local loaded = (file ~= nil) and to_T(file) or settings_lib.defaults:copy(true);
    settings_lib.current = loaded:merge(settings_lib.defaults);
    raise();
end
function settings_lib.register(_, alias, fn) settings_lib.callbacks[alias] = fn; end
package.preload['settings'] = function () return settings_lib; end
MOCK.settings = settings_lib;

--[[
    Packets. Each builder returns the packet_in event table.
]]

local function bytes(size)
    local b = {};
    for i = 0, size - 1 do b[i] = 0; end
    return b;
end
local function put(b, offset, value, size)
    for i = 0, size - 1 do b[offset + i] = math.floor(value / 256 ^ i) % 256; end
end
local function packet(id, b, size)
    local chars = {};
    for i = 0, size - 1 do chars[#chars + 1] = string.char(b[i]); end
    return { id = id, size = size, data = table.concat(chars), blocked = false };
end

-- The server id of the monster at `index` in `zone`.
function MOCK.mob_id(zone, index)
    return 0x01000000 + zone * 0x1000 + index;
end

-- 0x029 battle message.
function MOCK.message_packet(actor, target, param1, param2, message, target_index)
    local b = bytes(0x1C);
    put(b, 0x04, actor, 4);
    put(b, 0x08, target, 4);
    put(b, 0x0C, param1 % 4294967296, 4);
    put(b, 0x10, param2, 4);
    put(b, 0x16, target_index or 0, 2);
    put(b, 0x18, message, 2);
    return packet(0x029, b, 0x1C);
end

-- The reply to your own /check of the monster at `index` in your zone. `con` is 0 to 7, nil for 249.
function MOCK.check_packet(index, level, con, message)
    local me = MOCK.player.server_id;
    local param2 = (con ~= nil) and (64 + con) or 0;
    return MOCK.message_packet(me, MOCK.mob_id(MOCK.player.zone, index), level, param2, message, index);
end

-- The six /checkparam reply lines about `who` (you by default), 712 with `accuracy` and 715 with `evasion`.
MOCK.CHECKPARAM_LINES = { 733, 731, 712, 713, 714, 715 };
function MOCK.checkparam_packets(accuracy, evasion, who)
    who = who or MOCK.player.server_id;
    local out = {};
    for _, message in ipairs(MOCK.CHECKPARAM_LINES) do
        local value = (message == 712) and accuracy or ((message == 715) and evasion or 7);
        out[#out + 1] = MOCK.message_packet(who, who, value, 0, message, 0);
    end
    return out;
end

-- 0x0F4 widescan entry.
function MOCK.widescan_packet(index, level)
    local b = bytes(0x10);
    put(b, 0x04, index, 2);
    b[0x06] = level;
    return packet(0x0F4, b, 0x10);
end

-- 0x00A zone in.
function MOCK.zone_packet(id)
    local b = bytes(0x20);
    put(b, 0x04, id or MOCK.player.server_id, 4);
    return packet(0x00A, b, 0x20);
end

--[[
    Driving the addon.
]]

function MOCK.packet(e)
    return MOCK.fire('packet_in', e);
end

-- Your /checkparam reply. Returns how many of its six lines were hidden.
function MOCK.reply(accuracy, evasion, who)
    local hidden = 0;
    for _, e in ipairs(MOCK.checkparam_packets(accuracy, evasion, who)) do
        if (MOCK.packet(e).blocked) then hidden = hidden + 1; end
    end
    return hidden;
end

-- Zones you into `zone`, the way the game does it.
function MOCK.zone_in(zone)
    MOCK.player.zone = zone or MOCK.player.zone;
    MOCK.packet(MOCK.zone_packet());
end

-- One frame. It errors when imgui was left unbalanced.
function MOCK.frame(dt)
    fresh_gui();
    frames = frames + 1;
    MOCK.now = MOCK.now + (dt or 1 / 60);
    MOCK.fire('d3d_present');
    for kind, count in pairs(balance) do
        if (count ~= 0) then error(('imgui misuse: %d %s left open at the end of the frame'):format(count, kind)); end
    end
end

-- Frames for `seconds` of game time, 60 a second.
function MOCK.wait(seconds)
    for _ = 1, math.floor(seconds * 60 + 0.5) do MOCK.frame(1 / 60); end
end

function MOCK.command(text)
    return MOCK.fire('command', { command = text, blocked = false });
end
