--[[
    Stand-in for Ashita v4 and the game, so checkmate runs outside the game.

    Ashita's own common.lua, chat.lua, json.lua and imgui.lua load from ASHITA_LIBS, so T{}, the table
    merge, :args(), the chat color codes and the imgui constants are the real ones. The game's memory,
    the settings library, the chat log and the GUI manager under imgui.lua are mocked here. Every imgui
    call is checked and recorded. Tests click, type and slide through MOCK.clicks, MOCK.typing and MOCK.slide.

    Your pet is the entity at MOCK.player.pet_index. MOCK.summon, MOCK.charm and MOCK.dismiss change it and
    send the pet update packet the way the server does, and MOCK.summon_quietly brings one out without it,
    like a pet that was out before checkmate loaded. MOCK.pet_reply sends the five /checkparam <pet> reply
    lines, MOCK.merit_packet builds a merit list, and MOCK.send_out fires the packet_out event for a packet
    going out. QueueCommand never fires packet_out.

    Your target is in MOCK.target. MOCK.monster puts a monster in, MOCK.target_monster targets one, and
    MOCK.pick and MOCK.pick_with_nothing bring up the cursor you pick a spell's target with.
    MOCK.plant_flags puts the game's cutscene, hidden interface and map flags where the overlay looks for
    them, and MOCK.set_flag turns one on or off. MOCK.level_up sends your stats packet with a new level.
    Your HP, the max HP the game shows with your gear and food, and your TP are MOCK.player.hp, hp_max and
    tp, which party and player memory answer.
    MOCK.job_info_packet builds the job info packet with your max HP before gear and food.
    MOCK.shift = true holds Shift down. Each time checkmate asks Windows about Shift it's counted in
    MOCK.shift_reads. MOCK.chat_input is what the chat manager's IsInputOpen answers, 0 for closed and 0x11
    with the chat line open, and each time it's asked is counted in MOCK.input_checks. MOCK.text_input = true
    is ImGui's WantTextInput, true while an ImGui text box has the caret, and each read of it is counted in
    MOCK.text_input_reads. It's only there to show the overlay never asks.
    The ffi and d3d8 stand-ins turn MOCK.picture's made-up pictures into numbered textures, and count each load
    in MOCK.texture_loads and each time d3d8 is required in MOCK.d3d8_requires. MOCK.picture can also give one
    status effect another's picture, like the game's own shared ones. A texture load with an argument the real
    call wouldn't get is counted in MOCK.bad_texture_calls, MOCK.texture_error = true makes the load raise an
    error and MOCK.d3d8_error = true makes requiring d3d8 fail. The resource manager counts item and status
    lookups in MOCK.item_lookups and MOCK.status_lookups, and each item's own lookups in MOCK.item_lookups_of.

    MOCK.action_packet and MOCK.action_packet_multi pack action results, added effects and reactions like the
    server. MOCK.entity_packet supplies entity updates. The bit reader counts calls in MOCK.bit_reads and fails
    on an out-of-bounds read. MOCK.strings holds client text and MOCK.party holds other party/alliance members.
    Non-square overlay Dummy items are timer slots; their AddText is recorded as the displayed time.

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
    reads    = 0,        -- Game memory reads through AshitaCore:GetMemoryManager() and ashita.memory.
    entity_reads = 0,    -- GetEntity calls.
    player_entity_calls = 0,   -- GetPlayerEntity calls.
    memory_finds = 0,    -- ashita.memory.find calls.
    get_font_calls = 0,  -- imgui GetFont calls.
    get_io_calls = 0,    -- imgui GetIO calls.
    shift        = false,   -- True holds Shift down.
    shift_reads  = 0,       -- GetAsyncKeyState calls.
    chat_input   = 0,       -- What IsInputOpen answers. 0x11 is the chat line open.
    input_checks = 0,       -- IsInputOpen calls.
    text_input   = false,   -- What GetIO().WantTextInput answers.
    text_input_reads = 0,   -- GetIO().WantTextInput reads.
    -- The game's target list. Slot 0 is your target, or the cursor while you pick one for a spell, and
    -- slot 1 the target you had while you pick.
    target   = { slot0 = 0, slot1 = 0, picking = false },
    patterns = {},       -- [pattern] = the address ashita.memory.find answers for it.
    bytes    = {},       -- [address] = what ashita.memory.read_uint8 answers, 0 when it's not there.
    words    = {},       -- [address] = what ashita.memory.read_uint32 answers, 0 when it's not there.
    player = {
        server_id = 1001, name = 'Tester', zone = 103,
        main_job = 4, main_level = 75, sub_job = 0, sub_level = 0,
        status_server = 0,                                   -- Your status. 4 is a cutscene or NPC talk.
        pet_index = 0,                                       -- Your pet's entity index, 0 with no pet.
        hp = 1000, hp_max = 1000, tp = 0,                    -- Your HP, the game's max HP and TP. TP runs 0 to 3000.
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
    status_icons = {},   -- [status effect id] = { Bitmap, ImageSize }, what GetStatusIconByIndex answers.
    pictures = {},       -- [texture number] = what its picture was made from, like 'item 930'.
    item_lookups = 0,    -- GetItemById calls.
    item_lookups_of = {},   -- [item id] = GetItemById calls for that item.
    status_lookups = 0,  -- GetStatusIconByIndex calls.
    texture_loads = 0,   -- D3DXCreateTextureFromFileInMemoryEx calls.
    bad_texture_calls = 0,   -- Of those, the ones with an argument the real call wouldn't get.
    d3d8_requires = 0,   -- Times the d3d8 library was required.
    overlay_tips_shown = 0,   -- Tooltips the overlay drew.
    other_window = nil,  -- true, 'popup' or 'active' puts another window under the mouse, over the overlay.
    party = {},         -- [slot] = { id, name }, slots 1 to 17 after you.
    strings = {},       -- [resource table][id] = text, like buffs.names.
    string_reads = 0,
    bit_reads = 0,
    clock_reads = 0,
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
os.clock = function () MOCK.clock_reads = MOCK.clock_reads + 1; return MOCK.now; end

-- The texture loads made so far, so each texture gets a number of its own.
local textures = 0;

--[[
    Keyboard input and picture loads are mocked. Profile replacements use the real Windows API,
    or os.rename on other systems. Tests can force a replacement failure without touching the old file.
    MOCK.picture gives each fake texture a number; invalid image data fails to load.
]]
local file_ffi = require('ffi');
-- Keep Windows paths inside the same test folders on other hosts.
if (file_ffi.os ~= 'Windows') then
    local function host_path(path)
        return type(path) == 'string' and (path:gsub('\\', '/')) or path;
    end
    local open, remove, rename = io.open, os.remove, os.rename;
    local load, run = loadfile, dofile;
    io.open = function (path, ...)
        return open(host_path(path), ...);
    end;
    os.remove = function (path)
        return remove(host_path(path));
    end;
    os.rename = function (from, to)
        return rename(host_path(from), host_path(to));
    end;
    loadfile = function (path, ...)
        return load(host_path(path), ...);
    end;
    dofile = function (path)
        return run(host_path(path));
    end;
end
file_ffi.cdef[[
    unsigned long __stdcall GetCurrentProcessId(void);
    int __stdcall MoveFileExA(const char* existing, const char* replacement, unsigned long flags);
]];
package.loaded['ffi'] = {
    cdef = function () end,
    new = function () return {}; end,
    cast = function (ctype, value)
        if (ctype == 'uint32_t') then return value.handle; end
        return value;
    end,
    C = {
        GetCurrentProcessId = function () return file_ffi.os == 'Windows' and file_ffi.C.GetCurrentProcessId() or 1; end,
        MoveFileExA = function (existing, replacement, flags)
            if (MOCK.profile_replace_error) then return 0; end
            if (file_ffi.os ~= 'Windows') then return os.rename(existing, replacement) and 1 or 0; end
            return file_ffi.C.MoveFileExA(existing, replacement, flags);
        end,
        GetAsyncKeyState = function (key)
            MOCK.shift_reads = MOCK.shift_reads + 1;
            return (key == 0x10 and MOCK.shift) and -32768 or 0;
        end,
        S_OK = 0, D3DFMT_A8R8G8B8 = 21, D3DPOOL_MANAGED = 1, D3DX_DEFAULT = 0xFFFFFFFF,
        D3DXCreateTextureFromFileInMemoryEx = function (device, data, size, width, height, mips, usage, format, pool,
                filter, mip_filter, key, info, palette, out)
            MOCK.texture_loads = MOCK.texture_loads + 1;
            if (MOCK.texture_error) then error('the texture would not load'); end
            local png = type(data) == 'string' and data:sub(1, 8) == '\137PNG\13\10\26\10';
            -- The loader's pcall would hide an error, so a wrong argument is counted instead.
            if (device == nil or type(data) ~= 'string' or size ~= #data or width ~= 0xFFFFFFFF
                or height ~= 0xFFFFFFFF or mips ~= 1 or usage ~= 0 or format ~= 21 or pool ~= 1
                or filter ~= 0xFFFFFFFF or mip_filter ~= 0xFFFFFFFF or key ~= (png and 0 or 0xFF000000) or info ~= nil
                or palette ~= nil or type(out) ~= 'table') then
                MOCK.bad_texture_calls = MOCK.bad_texture_calls + 1;
            end
            if (not png and (type(data) ~= 'string' or data:sub(1, 8) ~= 'picture ')) then
                return -2005530516;
            end
            textures = textures + 1;
            MOCK.pictures[textures] = png and ('weapon PNG ' .. size) or data:sub(9);
            out[0] = { handle = textures };
            return 0;
        end,
    },
};

-- d3d8 stand-in. run.py puts Ashita's real libs on the path, and the real one needs the real ffi.
package.preload['d3d8'] = function ()
    MOCK.d3d8_requires = MOCK.d3d8_requires + 1;
    if (MOCK.d3d8_error) then error('d3d8 would not load'); end
    return { get_device = function () return {}; end, gc_safe_release = function (o) return o; end };
end;

--[[
    Gives an item or a status effect a picture, made up as 'picture item 930' or 'picture status 179'. An item
    with no MOCK.items entry gets one named like "Item 930". `how` is 'broken' for one the decoder refuses,
    'empty' for an ImageSize of 0, 'raises' for one whose Bitmap raises an error when it's read, or a status
    effect id to give it that effect's picture, the way the game's own Bind, Stun and Terror share one.
]]
function MOCK.picture(kind, id, how)
    local entry;
    if (kind == 'item') then
        MOCK.items[id] = MOCK.items[id] or { Name = { ('Item %d'):format(id) } };
        entry = MOCK.items[id];
    else
        MOCK.status_icons[id] = MOCK.status_icons[id] or {};
        entry = MOCK.status_icons[id];
    end
    local bitmap = ('picture %s %d'):format(kind, id);
    if (type(how) == 'number') then
        bitmap = MOCK.status_icons[how].Bitmap;
    elseif (how == 'broken') then
        bitmap = 'broken ' .. bitmap;
    end
    entry.Bitmap, entry.ImageSize = bitmap, #bitmap;
    if (how == 'empty') then
        entry.ImageSize = 0;
    elseif (how == 'raises') then
        entry.Bitmap = nil;
        setmetatable(entry, { __index = function (_, key)
            if (key == 'Bitmap') then error('the picture would not read'); end
        end });
    end
end

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

ashita = { events = {}, fs = {}, bits = {} };
-- The server packs each field low bit first. A read beyond the supplied bytes fails the test.
function ashita.bits.unpack_be(data, byte_offset, bit_offset, length)
    MOCK.bit_reads = MOCK.bit_reads + 1;
    local value, start = 0, byte_offset * 8 + bit_offset;
    for i = 0, length - 1 do
        local at = start + i;
        local byte = assert(data[math.floor(at / 8)], 'bit read outside packet');
        value = value + (math.floor(byte / 2 ^ (at % 8)) % 2) * 2 ^ i;
    end
    return value;
end
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
        GetMemberServerId = function (_, i)
            return (i == 0) and MOCK.player.server_id or (MOCK.party[i] and MOCK.party[i].id or 0);
        end,
        GetMemberName = function (_, i)
            return (i == 0) and MOCK.player.name or (MOCK.party[i] and MOCK.party[i].name);
        end,
        GetMemberZone = function (_, i) return MOCK.player.zone; end,
        GetMemberHP = function (_, i) return MOCK.player.hp; end,
        GetMemberTP = function (_, i) return MOCK.player.tp; end,
    };
end

local function player_memory()
    local p = MOCK.player;
    return {
        GetMainJob = function () return p.main_job; end,
        HasSpellData = function ()
            if (MOCK.spell_api_error) then error('spell data unavailable'); end
            return p.spell_data == true;
        end,
        HasSpell = function (_, id)
            MOCK.spell_reads = (MOCK.spell_reads or 0) + 1;
            if (MOCK.spell_api_error) then error('spell data unavailable'); end
            return p.known_spells ~= nil and p.known_spells[id] == true;
        end,
        GetMainJobLevel = function () return p.main_level; end,
        GetAttack = function () return p.attack or 400; end,
        GetSubJob = function () return p.sub_job; end,
        GetSubJobLevel = function () return p.sub_level; end,
        GetHPMax = function () return p.hp_max; end,
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

-- The target list. Each slot or flag read is counted.
local function target_list()
    return {
        GetTargetIndex = function (_, slot)
            MOCK.reads = MOCK.reads + 1;
            return (slot == 0) and MOCK.target.slot0 or MOCK.target.slot1;
        end,
        GetIsSubTargetActive = function ()
            MOCK.reads = MOCK.reads + 1;
            return MOCK.target.picking and 1 or 0;
        end,
    };
end

-- Each read of your memory is counted, so a test can see a frame doing nothing.
local memory = {};
for name, fn in pairs({ GetParty = party, GetPlayer = player_memory, GetInventory = inventory, GetTarget = target_list }) do
    memory[name] = function (...)
        MOCK.reads = MOCK.reads + 1;
        return fn(...);
    end;
end

-- Pattern scans and reads of the game's memory. Each read is counted with the others.
ashita.memory = {
    find = function (module, _, pattern)
        MOCK.memory_finds = MOCK.memory_finds + 1;
        return (module == 'FFXiMain.dll' and MOCK.patterns[pattern]) or 0;
    end,
    read_uint8 = function (address)
        MOCK.reads = MOCK.reads + 1;
        return MOCK.bytes[address] or 0;
    end,
    read_uint32 = function (address)
        MOCK.reads = MOCK.reads + 1;
        return MOCK.words[address] or 0;
    end,
};

-- Where MOCK.plant_flags puts each flag the overlay hides by, and the chain of words the map check follows:
-- the code it finds, the focus slot inside the interface object, the menu with focus, its header and the
-- header's short name.
local FLAG_AT = { event = 0x5000, hidden = 0x6000 + 0xB4, short_name = 0x8000 + 0x46 + 8 };

-- Plants the three patterns so the overlay finds the game's cutscene, hidden interface and map flags,
-- each off.
function MOCK.plant_flags()
    local patterns = require('core.player').PATTERNS;
    MOCK.patterns[patterns.event] = 0x1000;
    MOCK.patterns[patterns.interface] = 0x2000;
    MOCK.patterns[patterns.menu] = 0x3000;
    MOCK.words[0x1000 + 1] = FLAG_AT.event;
    MOCK.words[0x2000 + 10] = 0x6000;        -- The interface object.
    MOCK.words[0x3000] = 0x6000 + 0x54;      -- Its focus slot.
    MOCK.words[0x6000 + 0x54] = 0x7000;      -- The menu with focus.
    MOCK.words[0x7000 + 4] = 0x8000;         -- Its header.
    MOCK.words[FLAG_AT.short_name] = 0x676F6C6C;   -- 'llog', the chat log.
end

-- Turns a planted flag on or off: 'event' for a cutscene, 'hidden' for the hidden interface, 'map' for the map.
function MOCK.set_flag(name, on)
    if (name == 'map') then
        MOCK.words[FLAG_AT.short_name] = on and 0x3070616D or 0x676F6C6C;   -- 'map0' or 'llog'.
    else
        MOCK.bytes[FLAG_AT[name]] = on and 1 or 0;
    end
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
    the window's X once. MOCK.window_size = { w, h } resizes the settings window and MOCK.window_pos =
    { x, y } moves it, each frame while it's set. Each window keeps its own spot and size between frames
    like ImGui's, and SetNextWindowPos and SetNextWindowSize only change them on the frame it appears or
    with ImGuiCond_Always. The overlay is MOCK.overlay_size big, 200 x 60 by default, and
    MOCK.overlay_drag = { x, y } drags it there each frame while it's set, unless it can't move.
    GetWindowPos and GetWindowSize answer for the window being drawn. MOCK.avail is the room
    GetContentRegionAvail answers, 680 wide by default. MOCK.hover = true makes IsItemHovered answer
    true, so every (?) draws its tip.
    Navigation normally draws every matching page for broad control coverage. MOCK.navigation_real = true
    uses the real selection and wrapping; gui.nav_buttons records button sizes and SameLine joins.
    After each frame MOCK.gui holds what was drawn, in calls, names, paths (path -> widget), disabled
    (paths drawn greyed out), texts, formats (slider path -> format), previews (combo path -> the text
    it shows closed), tabs, colors (ImGuiCol id -> the first color pushed for it), fonts (each
    PushFont as { font, size }), tables (table id -> its column count), next_pos and next_pos_cond
    (the last SetNextWindowPos), helps (the path of each thing a (?) follows -> true) and, while
    MOCK.hover is on, tips (that path -> the text of its tip). A text's path is its tab and ids, then
    the text itself, like 'Profiles/PROFILES'. It also holds flags (window name -> its Begin flags),
    placed (window name -> { pos, cond } from its SetNextWindowPos), bg_alpha (the last
    SetNextWindowBgAlpha), styles (each PushStyleVar as { id, value }), pushed (each PushStyleColor as
    { id, color }) and colored (each TextColored as { text, color, window, joined }, where joined means
    a SameLine came right before it). MOCK.overlay_lines() puts the overlay's colored text back
    together as lines.
    GetFont() answers MOCK.ashita_font. AddFontFromFileTTF answers a made-up font table { path, size }
    and records it in MOCK.fonts_loaded. MOCK.broken_fonts[file name] = 'error' makes it raise an error
    for that file instead, and 'nil' makes it answer nil. Every call, broken or not, goes in
    MOCK.font_calls as { path, event }, with the event that was running then.
    GetFontSize() answers the size last pushed, or 18 with nothing pushed. GetFont and GetIO calls are
    counted in MOCK.get_font_calls and MOCK.get_io_calls.
    MOCK.mouse = { x, y } is where the mouse is, and MOCK.mouse_clicked = true makes IsMouseClicked answer
    true, the frame the button goes down. MOCK.mouse_down = true holds it down, and MOCK.mouse_button says
    which button that is, the left one when it's nil. IsAnyMouseDown answers for any of them.
    IsWindowHovered answers true when the mouse is inside the window being drawn and it took the mouse last
    frame, since ImGui works out what's under the mouse from last frame's windows. MOCK.other_window = true
    puts another window under the mouse, over the one being drawn, so IsWindowHovered answers false, and true
    with ImGuiHoveredFlags_AnyWindow. 'popup' is one with a dropdown open and 'active' one with the caret in the
    text box under the mouse, and with AnyWindow they only count when the flags also allow a window blocked by a
    popup or an active item, the way ImGui answers. Each IsWindowHovered call's flags go in MOCK.gui.hover_flags,
    0 for none. GetWindowDrawList answers a draw list whose methods must be in Ashita's ImDrawList annotations.
    Its PushClipRect and PopClipRect must balance by the end of each frame, and each AddTriangleFilled goes in
    MOCK.gui.triangles as { points, color, window }. A Dummy in a window is an icon: it goes in MOCK.gui.colored
    as { icon = true, text = '', size, window, joined }, and the AddImage, or the AddRectFilled and AddText of a
    badge, that come after it fill in its picture (the made-up name MOCK.picture gave it), fill, rounding, letter
    and letter_size. Each AddImage goes in MOCK.gui.images as { texture, low, high }. GetColorU32 hands back the
    color table it's given, so a test can tell which color was used, MOCK.gui.cursor is the last SetMouseCursor
    and MOCK.gui.capture_mouse the last SetNextFrameWantCaptureMouse.
    GetCursorScreenPos starts each window at its spot, and MOCK.gui.cursor_pos is the last
    SetCursorScreenPos. In the overlay each text and icon sits at the cursor, 7 px a character or the icon's
    width, and the cursor goes on to the next line, down by the font size pushed, unless a SameLine puts it
    right after that item. So each icon has its own spot, its top left corner as at in MOCK.gui.colored, and
    MOCK.overlay_icon_spot(n) gives the middle of the nth icon drawn last frame, or nil past the last one. The
    window's own PushClipRect and PopClipRect must balance by the end of each frame too, and each
    InvisibleButton goes in MOCK.gui.buttons as { id, size, flags, at, clip, window }, where at is the cursor
    then and clip the window's clip rect then, or nil. It's never pressed.
    BeginTooltip answers true, like Ashita's. A tooltip begun outside every window is the overlay's: its text
    goes in MOCK.gui.overlay_tip as { text, font_size, wrap }, with the font size pushed when it began and the
    PushTextWrapPos inside it, and MOCK.overlay_tips_shown counts each one. Any other goes in MOCK.gui.tips.
]]

local GUI_NAMES = {};
do
    local f = assert(io.open(ASHITA_LIBS .. '/annotations/SDK/IGuiManager.lua', 'r'));
    for name in f:read('*a'):gmatch('function IGuiManager[.:]([%w_]+)%(') do
        GUI_NAMES[name] = true;
    end
    f:close();
end

-- ImDrawList's methods.
local DRAW_LIST_NAMES = {};
do
    local f = assert(io.open(ASHITA_LIBS .. '/annotations/SDK/IGuiManagerTypes.lua', 'r'));
    for name in f:read('*a'):gmatch('function ImDrawList:([%w_]+)%(') do
        DRAW_LIST_NAMES[name] = true;
    end
    f:close();
end

MOCK.clicks, MOCK.typing, MOCK.slide, MOCK.open = {}, {}, {}, {};
MOCK.mouse = { 0, 0 };
MOCK.ashita_font = { name = 'Ashita font' };
MOCK.fonts_loaded = {};
MOCK.font_calls = {};
MOCK.broken_fonts = {};

local stack = {};        -- Tab, PushID and open combo labels, for widget paths.
local joined = false;    -- A SameLine came after the last text or widget.
local last_item = nil;   -- The path of the last widget or text drawn.
local help_owner = nil;  -- The path the last (?) follows.
local tip_lines = nil;   -- The text drawn in the open tooltip.
local tip_owner = nil;   -- Whose tip that is, 'overlay' or the path of the (?) it's for.
local tip_font = 0;      -- The font size pushed when it began.
local tip_wrap = nil;    -- The PushTextWrapPos inside it.
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
    joined = false;
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
    joined = false;
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
local function is_point(p)
    return type(p) == 'table' and type(p[1]) == 'number' and type(p[2]) == 'number';
end

-- Each window's spot and size as ImGui keeps them, by name, with the frame it last drew in. Then the windows
-- being drawn, the innermost last, and the SetNextWindowPos and SetNextWindowSize that wait for the next Begin.
local OVERLAY = '##checkmate_overlay';
local windows = {};
local drawing = {};
local pending = {};
local frames = 0;
local clips = {};   -- The window clip rects pushed with PushClipRect, as { low, high }.

local function window_named(name)
    windows[name] = windows[name] or { name = name, pos = { 120, 20 }, size = { 720, 560 }, drawn = nil };
    return windows[name];
end
-- The window being drawn.
local function this_window()
    need(#drawing > 0, 'a window function outside Begin and End');
    return drawing[#drawing];
end
-- An item `width` wide at the overlay's cursor, which then goes on to the next line like ImGui's. Hands back the
-- item's top left corner, or nil in any other window.
local function place_item(window, width)
    if (window.name ~= OVERLAY) then
        return nil;
    end
    local at = { window.cursor[1], window.cursor[2] };
    window.last_end = { at[1] + width, at[2] };
    window.cursor = { window.pos[1], at[2] + (font_sizes[#font_sizes] or 18) };
    return at;
end

-- The window's draw list. Every call is checked like the GUI manager's, and called with a colon.
local DRAW_LIST = {
    AddLine = function (low, high, color, width)
        need(is_point(low) and is_point(high) and color ~= nil and type(width) == 'number', 'AddLine args');
        MOCK.gui.draw_lines[#MOCK.gui.draw_lines + 1] = { low = low, high = high, color = color, width = width };
    end,
    AddRect = function (low, high, color)
        need(is_point(low) and is_point(high) and color ~= nil, 'AddRect args');
        MOCK.gui.highlights[#MOCK.gui.highlights + 1] = last_item;
    end,
    PushClipRect = function (low, high, intersect)
        need(is_point(low) and is_point(high) and type(intersect) == 'boolean', 'PushClipRect args');
        bump('clip rect', 1);
    end,
    PopClipRect = function () bump('clip rect', -1); end,
    AddTriangleFilled = function (a, b, c, color)
        need(is_point(a) and is_point(b) and is_point(c) and color ~= nil, 'AddTriangleFilled args');
        MOCK.gui.triangles[#MOCK.gui.triangles + 1] = { points = { { a[1], a[2] }, { b[1], b[2] }, { c[1], c[2] } },
            color = color, window = this_window().name };
    end,
    -- The picture, the badge's square and its letter go on the icon the last Dummy drew.
    AddImage = function (texture, low, high)
        need(type(texture) == 'number' and is_point(low) and is_point(high), 'AddImage args');
        MOCK.gui.images[#MOCK.gui.images + 1] = { texture = texture, low = { low[1], low[2] },
            high = { high[1], high[2] } };
        local icon = MOCK.gui.colored[#MOCK.gui.colored];
        if (icon ~= nil and icon.icon) then icon.picture = MOCK.pictures[texture]; end
    end,
    AddRectFilled = function (low, high, color, rounding)
        need(is_point(low) and is_point(high) and color ~= nil, 'AddRectFilled args');
        local icon = MOCK.gui.colored[#MOCK.gui.colored];
        if (icon ~= nil and icon.icon) then icon.fill, icon.rounding = color, rounding; end
    end,
    AddText = function (...)
        local count = select('#', ...);
        local args = { ... };
        need((count == 3 or count == 5) and type(args[count]) == 'string', 'AddText args');
        local icon = MOCK.gui.colored[#MOCK.gui.colored];
        if (icon ~= nil and icon.clock) then
            icon.text = args[count];
        elseif (icon ~= nil and icon.icon) then
            icon.letter, icon.ink = args[count], args[count - 1];
            if (count == 5) then icon.letter_size = args[2]; end
        end
    end,
};
local draw_list;
draw_list = setmetatable({}, { __index = function (_, name)
    if (not DRAW_LIST_NAMES[name]) then
        error('imgui misuse: ImDrawList has no method ' .. tostring(name), 2);
    end
    return function (self, ...)
        need(self == draw_list, name .. ' called without a colon');
        local special = DRAW_LIST[name];
        if (special) then return special(...); end
    end;
end });

-- GetIO's fields that are read as they're asked for. Each read of WantTextInput is counted.
local IO_FIELDS = { __index = function (_, key)
    if (key == 'WantTextInput') then
        MOCK.text_input_reads = MOCK.text_input_reads + 1;
        return MOCK.text_input;
    end
end };

local SPECIAL = {
    GetItemRectMin = function () return 0, 0; end,
    GetItemRectMax = function () return 100, 20; end,
    SetScrollHereY = function (ratio)
        need(type(ratio) == 'number', 'SetScrollHereY ratio');
        MOCK.gui.scrolled[#MOCK.gui.scrolled + 1] = last_item;
        MOCK.gui.scrolled_windows = MOCK.gui.scrolled_windows or {};
        MOCK.gui.scrolled_windows[#MOCK.gui.scrolled_windows + 1] = this_window().name;
    end,
    SetNextItemOpen = function (value) MOCK.next_header_open = value; end,
    CollapsingHeader = function (label, flags)
        drew_text(label);
        local p = seen(label, 'CollapsingHeader');
        help_owner = p;
        if (MOCK.next_header_open ~= nil) then MOCK.open[p], MOCK.next_header_open = MOCK.next_header_open, nil; end
        if (MOCK.open[p] == nil) then MOCK.open[p] = bit.band(flags or 0, ImGuiTreeNodeFlags_DefaultOpen) ~= 0; end
        if (MOCK.clicks[p]) then MOCK.clicks[p], MOCK.open[p] = nil, not MOCK.open[p]; end
        return MOCK.open[p];
    end,
    Begin = function (name, open, flags)
        need(type(name) == 'string' and type(open) == 'table' and type(flags) == 'number', 'Begin args');
        bump('window', 1);
        MOCK.gui.window = name;
        MOCK.gui.flags[name] = flags;
        local window = window_named(name);
        drawing[#drawing + 1] = window;
        local appearing = window.drawn ~= frames - 1;
        -- What's under the mouse comes from last frame's windows, like ImGui.
        window.hoverable = not appearing and bit.band(window.flags, ImGuiWindowFlags_NoMouseInputs) == 0;
        window.flags = flags;
        window.drawn = frames;
        if (pending.pos ~= nil) then
            MOCK.gui.placed[name] = { pos = pending.pos.value, cond = pending.pos.cond };
        end
        for key, next_ in pairs(pending) do
            if (appearing or next_.cond == ImGuiCond_Always) then
                window[key] = next_.value;
            end
        end
        pending = {};
        joined = false;
        if (name == OVERLAY) then
            -- It sizes itself to its text, and you can only drag it while it can move.
            local fixed = bit.band(flags, ImGuiWindowFlags_NoMove) ~= 0;
            window.pos = (not fixed and MOCK.overlay_drag) or window.pos;
            window.size = MOCK.overlay_size or { 200, 60 };
            window.cursor, window.last_end = { window.pos[1], window.pos[2] }, nil;
            return true;
        end
        window.pos = MOCK.window_pos or window.pos;
        window.size = MOCK.window_size or window.size;
        window.cursor = { window.pos[1], window.pos[2] };
        if (MOCK.close_x) then open[1] = false; MOCK.close_x = false; end
        return true;
    end,
    End = function () bump('window', -1); table.remove(drawing); end,
    BeginChild = function (id, size, child_flags, flags)
        need(type(id) == 'string' and is_point(size) and type(child_flags) == 'number'
            and type(flags) == 'number', 'BeginChild args');
        bump('child', 1);
        local parent = this_window();
        local name = parent.name .. '/' .. path(id);
        local window = window_named(name);
        window.pos, window.size = { parent.pos[1], parent.pos[2] }, { parent.size[1], parent.size[2] };
        window.cursor, window.flags, window.drawn = { window.pos[1], window.pos[2] }, flags, frames;
        drawing[#drawing + 1] = window;
        MOCK.gui.children = MOCK.gui.children or {};
        MOCK.gui.children[#MOCK.gui.children + 1] = { name = name, parent = parent.name, flags = flags };
        return MOCK.child_clipped ~= true;
    end,
    EndChild = function () bump('child', -1); table.remove(drawing); end,
    BeginTabBar = function () bump('tab bar', 1); return true; end,
    EndTabBar = function () bump('tab bar', -1); end,
    BeginTabItem = function (label)
        need(type(label) == 'string', 'BeginTabItem label');
        bump('tab', 1); push(label); MOCK.gui.tabs[label] = true;
        MOCK.gui.tab_open[#MOCK.gui.tab_open + 1] = label;
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
    PushID = function (id)
        need(type(id) == 'string', 'PushID string');
        if (#stack == 0 and MOCK.gui.tabs[id]) then MOCK.gui.tab_open[#MOCK.gui.tab_open + 1] = id; end
        bump('id', 1); push(id);
    end,
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
    PushTextWrapPos = function (x)
        bump('wrap', 1);
        if (tip_lines ~= nil) then tip_wrap = x; end
    end,
    PopTextWrapPos = function () bump('wrap', -1); end,
    PushStyleColor = function (id, color)
        need(type(id) == 'number' and is_color(color), 'PushStyleColor args');
        bump('style color', 1);
        if (MOCK.gui.colors[id] == nil) then MOCK.gui.colors[id] = color; end
        MOCK.gui.pushed[#MOCK.gui.pushed + 1] = { id = id, color = color };
    end,
    PushFont = function (font, size)
        need(type(font) == 'table' and type(size) == 'number' and size > 0, 'PushFont args');
        bump('font', 1);
        font_sizes[#font_sizes + 1] = size;
        MOCK.gui.fonts[#MOCK.gui.fonts + 1] = { font = font, size = size };
    end,
    PopFont = function () bump('font', -1); table.remove(font_sizes); end,
    GetFont = function () MOCK.get_font_calls = MOCK.get_font_calls + 1; return MOCK.ashita_font; end,
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
        MOCK.gui.styles[#MOCK.gui.styles + 1] = { id = id, value = (type(v) == 'table') and { v[1], v[2] } or v };
    end,
    PopStyleVar = function (n) bump('style var', -(n or 1)); end,
    TextColored = function (color, text)
        need(is_color(color) and type(text) == 'string', 'TextColored args');
        local window = this_window();
        place_item(window, #text * 7);
        MOCK.gui.colored[#MOCK.gui.colored + 1] = { text = text, color = color, window = window.name,
            joined = joined };
        drew_text(text);
    end,
    -- In the overlay the cursor goes back to right after the last item.
    SameLine = function ()
        joined = true;
        local window = drawing[#drawing];
        if (window ~= nil and window.name == OVERLAY and window.last_end ~= nil) then
            window.cursor = { window.last_end[1], window.last_end[2] };
        end
    end,
    Dummy = function (size)
        need(is_point(size) and size[1] > 0 and size[2] > 0, 'Dummy size');
        local window = this_window();
        MOCK.gui.colored[#MOCK.gui.colored + 1] = { icon = size[1] == size[2], clock = size[1] ~= size[2],
            text = '', size = { size[1], size[2] },
            window = window.name, joined = joined, at = place_item(window, size[1]) };
        joined = false;
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
    -- One begun outside every window is the overlay's, begun after its End.
    BeginTooltip = function ()
        bump('tooltip', 1);
        tip_lines, tip_owner = {}, (#drawing == 0) and 'overlay' or help_owner or last_item;
        tip_font, tip_wrap = font_sizes[#font_sizes] or 18, nil;
        return true;
    end,
    EndTooltip = function ()
        bump('tooltip', -1);
        local text = table.concat(tip_lines, ' ');
        if (tip_owner == 'overlay') then
            MOCK.gui.overlay_tip = { text = text, font_size = tip_font, wrap = tip_wrap };
            MOCK.overlay_tips_shown = MOCK.overlay_tips_shown + 1;
        else
            MOCK.gui.tips[tip_owner] = text;
        end
        tip_lines = nil;
    end,
    Button = function (label, size)
        need(type(label) == 'string', 'Button label');
        if (size ~= nil) then need(is_point(size), 'Button size'); end
        local name = label:match('^(.-)##checkmate_tab$');
        if (name ~= nil) then
            MOCK.gui.tabs[name] = true;
            MOCK.gui.nav_buttons[#MOCK.gui.nav_buttons + 1] = { name = name, joined = joined,
                size = size and { size[1], size[2] } or nil };
        end
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
    IsMouseDown = function (button)
        need(type(button) == 'number', 'IsMouseDown button');
        return MOCK.mouse_down == true and button == (MOCK.mouse_button or ImGuiMouseButton_Left);
    end,
    IsAnyMouseDown = function () return MOCK.mouse_down == true; end,
    IsMouseClicked = function (button)
        need(type(button) == 'number', 'IsMouseClicked button');
        return MOCK.mouse_clicked == true and button == (MOCK.mouse_button or ImGuiMouseButton_Left);
    end,
    GetMousePos = function () return MOCK.mouse[1], MOCK.mouse[2]; end,
    IsWindowHovered = function (flags)
        need(flags == nil or type(flags) == 'number', 'IsWindowHovered flags');
        flags = flags or 0;
        MOCK.gui.hover_flags[#MOCK.gui.hover_flags + 1] = flags;
        local window = this_window();
        local other = MOCK.other_window;
        if (other ~= nil) then
            return bit.band(flags, ImGuiHoveredFlags_AnyWindow) ~= 0 and (other == true
                or (other == 'popup' and bit.band(flags, ImGuiHoveredFlags_AllowWhenBlockedByPopup) ~= 0)
                or (other == 'active' and bit.band(flags, ImGuiHoveredFlags_AllowWhenBlockedByActiveItem) ~= 0));
        end
        local x, y = MOCK.mouse[1], MOCK.mouse[2];
        return window.hoverable and x >= window.pos[1] and x < window.pos[1] + window.size[1]
            and y >= window.pos[2] and y < window.pos[2] + window.size[2];
    end,
    GetWindowDrawList = function () this_window(); return draw_list; end,
    GetColorU32 = function (color)
        need(is_color(color), 'GetColorU32 color');
        return color;
    end,
    SetMouseCursor = function (cursor)
        need(type(cursor) == 'number', 'SetMouseCursor cursor');
        MOCK.gui.cursor = cursor;
    end,
    SetNextFrameWantCaptureMouse = function (want)
        need(type(want) == 'boolean', 'SetNextFrameWantCaptureMouse boolean');
        MOCK.gui.capture_mouse = want;
    end,
    GetCursorScreenPos = function ()
        local window = this_window();
        return window.cursor[1], window.cursor[2];
    end,
    SetCursorScreenPos = function (pos)
        need(is_point(pos), 'SetCursorScreenPos point');
        this_window().cursor = { pos[1], pos[2] };
        MOCK.gui.cursor_pos = { pos[1], pos[2] };
    end,
    PushClipRect = function (low, high, intersect)
        need(is_point(low) and is_point(high) and type(intersect) == 'boolean', 'PushClipRect args');
        this_window();
        bump('window clip rect', 1);
        clips[#clips + 1] = { { low[1], low[2] }, { high[1], high[2] } };
    end,
    PopClipRect = function () bump('window clip rect', -1); table.remove(clips); end,
    InvisibleButton = function (id, size, flags)
        need(type(id) == 'string' and is_point(size) and size[1] > 0 and size[2] > 0 and type(flags) == 'number',
            'InvisibleButton args');
        local window = this_window();
        MOCK.gui.buttons[#MOCK.gui.buttons + 1] = { id = id, size = { size[1], size[2] }, flags = flags,
            at = { window.cursor[1], window.cursor[2] }, clip = clips[#clips], window = window.name };
        return false;
    end,
    SetNextWindowSize = function (size, cond)
        need(type(size) == 'table' and size[1] > 0 and size[2] > 0 and type(cond) == 'number', 'SetNextWindowSize');
        MOCK.gui.next_size = { size[1], size[2] };
        pending.size = { value = MOCK.gui.next_size, cond = cond };
    end,
    GetWindowSize = function ()
        local window = this_window();
        return window.size[1], window.size[2];
    end,
    SetNextWindowBgAlpha = function (alpha)
        need(type(alpha) == 'number' and alpha >= 0 and alpha <= 1, 'SetNextWindowBgAlpha');
        MOCK.gui.bg_alpha = alpha;
    end,
    SetNextWindowPos = function (pos, cond)
        need(type(pos) == 'table' and type(pos[1]) == 'number' and type(pos[2]) == 'number'
            and type(cond) == 'number', 'SetNextWindowPos');
        MOCK.gui.next_pos = { pos[1], pos[2] };
        MOCK.gui.next_pos_cond = cond;
        pending.pos = { value = MOCK.gui.next_pos, cond = cond };
    end,
    GetWindowPos = function ()
        local window = this_window();
        return window.pos[1], window.pos[2];
    end,
    GetFrameHeight = function () return 22; end,
    IsWindowFocused = function () return MOCK.window_focused ~= false; end,
    GetIO = function ()
        MOCK.get_io_calls = MOCK.get_io_calls + 1;
        return setmetatable({ DisplaySize = { x = MOCK.screen[1], y = MOCK.screen[2] } }, IO_FIELDS);
    end,
    GetContentRegionAvail = function () return MOCK.avail or 680, 400; end,
    CalcTextSize = function (text) return #text * 7, 14; end,
    SetClipboardText = function (text) need(type(text) == 'string', 'SetClipboardText'); MOCK.clipboard = text; end,
    GetClipboardText = function () return MOCK.clipboard or ''; end,
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
            if (args[i] == nil and not (name == 'BeginTabItem' and i == 2)) then
                error(('imgui misuse: %s got nil for argument %d'):format(name, i), 2);
            end
        end
        MOCK.gui.calls[#MOCK.gui.calls + 1] = name;
        MOCK.gui.names[name] = true;
        local special = SPECIAL[name];
        if (special) then return special(...); end
    end;
end });

local function fresh_gui()
    MOCK.gui = { calls = {}, names = {}, paths = {}, disabled = {}, texts = {}, formats = {}, previews = {}, tabs = {}, tab_open = {}, nav_buttons = {},
        colors = {}, fonts = {}, tables = {}, helps = {}, tips = {}, next_size = MOCK.gui and MOCK.gui.next_size,
        next_pos = MOCK.gui and MOCK.gui.next_pos, flags = {}, placed = {}, styles = {}, pushed = {}, colored = {},
        triangles = {}, draw_lines = {}, buttons = {}, images = {}, hover_flags = {}, highlights = {}, scrolled = {} };
    last_item, help_owner, tip_lines, joined = nil, nil, nil, false;
end
fresh_gui();

-- The middle of the nth icon the overlay drew last frame, as x, y, or nil past the last one.
function MOCK.overlay_icon_spot(n)
    local count = 0;
    for _, each in ipairs(MOCK.gui.colored) do
        if (each.icon and each.window == OVERLAY) then
            count = count + 1;
            if (count == n) then
                return each.at[1] + each.size[1] / 2, each.at[2] + each.size[2] / 2;
            end
        end
    end
    return nil;
end

-- The overlay's lines as it drew them this frame. A text starts a new line unless a SameLine came right before it.
-- An icon reads as its picture or its badge's letter in square brackets, like [item 930] or [I].
function MOCK.overlay_lines()
    local lines = {};
    for _, each in ipairs(MOCK.gui.colored) do
        if (each.window == OVERLAY) then
            local text = each.text;
            if (each.icon) then
                text = '[' .. (each.picture or each.letter or '?') .. ']';
            end
            if (each.joined and #lines > 0) then
                lines[#lines] = lines[#lines] .. text;
            else
                lines[#lines + 1] = text;
            end
        end
    end
    return lines;
end

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
            IsInputOpen = function ()
                MOCK.input_checks = MOCK.input_checks + 1;
                return MOCK.chat_input;
            end,
        };
    end,
    GetResourceManager = function ()
        return {
            GetString = function (_, list, id)
                MOCK.string_reads = MOCK.string_reads + 1;
                return MOCK.strings[list] and MOCK.strings[list][id];
            end,
            GetItemById = function (_, id)
                MOCK.item_lookups = MOCK.item_lookups + 1;
                MOCK.item_lookups_of[id] = (MOCK.item_lookups_of[id] or 0) + 1;
                return MOCK.items[id];
            end,
            GetStatusIconByIndex = function (_, index)
                MOCK.status_lookups = MOCK.status_lookups + 1;
                return MOCK.status_icons[index];
            end,
        };
    end,
    GetGuiManager = function () return gui; end,
    GetInstallPath = function () return MOCK_INSTALL_PATH; end,
};

-- Both are counted, apart from game memory reads, so the pet tests' counts stay the same.
function GetPlayerEntity()
    MOCK.player_entity_calls = MOCK.player_entity_calls + 1;
    if (MOCK.zoning) then return nil; end
    return { Name = MOCK.player.name, ServerId = MOCK.player.server_id, PetTargetIndex = MOCK.player.pet_index or 0,
        StatusServer = MOCK.player.status_server };
end
function GetEntity(index)
    MOCK.entity_reads = MOCK.entity_reads + 1;
    return MOCK.entities[index];
end

-- Puts a monster named `name` at entity index `index` in your zone. `flags` are its spawn flags, 0x10 for a
-- monster by default. Players have 0x01 and NPCs 0x02.
function MOCK.monster(index, name, flags)
    MOCK.entities[index] = { Name = name, ServerId = MOCK.mob_id(MOCK.player.zone, index), SpawnFlags = flags or 0x10,
        HPPercent = 100 };
end

-- Puts a monster at `index` and targets it.
function MOCK.target_monster(index, name)
    MOCK.monster(index, name);
    MOCK.target.slot0, MOCK.target.slot1, MOCK.target.picking = index, 0, false;
end

-- Brings up the cursor you pick a spell's target with, on the entity at `cursor`. Slot 0 is the cursor and
-- slot 1 the target you had. With nothing targeted, the game leaves slot 0 at 0 and puts the cursor in slot 1.
function MOCK.pick(cursor)
    MOCK.target.slot0, MOCK.target.slot1, MOCK.target.picking = cursor, MOCK.target.slot0, true;
end
function MOCK.pick_with_nothing(cursor)
    MOCK.target.slot0, MOCK.target.slot1, MOCK.target.picking = 0, cursor, true;
end

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

-- Writes one field the way the server's action packet packer does.
function MOCK.pack_bits(b, at, length, value)
    for i = 0, length - 1 do
        local k, one = at + i, math.floor(value / 2 ^ i) % 2;
        local byte, mask = math.floor(k / 8), 2 ^ (k % 8);
        local old = b[byte] or 0;
        b[byte] = old + (one - math.floor(old / mask) % 2) * mask;
    end
    return at + length;
end

-- An action with targets { id, results = { { message, param, added = { message, param }, reaction } } }.
function MOCK.action_packet_multi(actor, category, action, targets)
    local b, at = bytes(512), 40;
    at = MOCK.pack_bits(b, at, 32, actor);
    at = MOCK.pack_bits(b, at, 6, #targets);
    at = MOCK.pack_bits(b, at, 4, 0);
    at = MOCK.pack_bits(b, at, 4, category);
    at = MOCK.pack_bits(b, at, 32, action or 0);
    at = MOCK.pack_bits(b, at, 32, 0);
    for _, target in ipairs(targets) do
        at = MOCK.pack_bits(b, at, 32, target.id);
        at = MOCK.pack_bits(b, at, 4, #target.results);
        for _, r in ipairs(target.results) do
            at = MOCK.pack_bits(b, at, 3, r.resolution or 0);
            at = MOCK.pack_bits(b, at, 24, 0);
            at = MOCK.pack_bits(b, at, 17, r.param or 0);
            at = MOCK.pack_bits(b, at, 10, r.message or 0);
            at = MOCK.pack_bits(b, at, 31, 0);
            at = MOCK.pack_bits(b, at, 1, r.added and 1 or 0);
            if (r.added) then
                at = MOCK.pack_bits(b, at, 10, 1);
                at = MOCK.pack_bits(b, at, 17, r.added.param or 0);
                at = MOCK.pack_bits(b, at, 10, r.added.message or 0);
            end
            at = MOCK.pack_bits(b, at, 1, r.reaction and 1 or 0);
            if (r.reaction) then at = MOCK.pack_bits(b, at, 34, 0); end
        end
    end
    local size = math.ceil(at / 32) * 4;
    local out = packet(0x028, b, size);
    out.data_raw = b;
    return out;
end

-- The common one-target action, or pass a targets table as the fourth argument.
function MOCK.action_packet(actor, category, action, target, results)
    local targets = type(target) == 'table' and target or { { id = target, results = results } };
    return MOCK.action_packet_multi(actor, category, action, targets);
end

-- An entity update. Mask 0x30 means it left your sight.
function MOCK.entity_packet(id, mask, index)
    local b = bytes(0x20);
    put(b, 0x04, id, 4);
    if (index == nil) then
        index = bit.band(id, 0xFFF);
        if (index >= 0x800) then index = index - 0x100; end
    end
    put(b, 0x08, index, 2);
    b[0x0A] = mask;
    return packet(0x00E, b, 0x20);
end

-- The server id of the monster at `index` in `zone`.
function MOCK.mob_id(zone, index)
    return 0x01000000 + zone * 0x1000 + index;
end

-- The server id of a pet you call at entity index `index` in your zone. The server gives a pet the index
-- plus 0x100, so its low 12 bits are 0x800 or more.
function MOCK.pet_id(index)
    return 0x01000000 + MOCK.player.zone * 0x1000 + index + 0x100;
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

-- The six /checkparam reply lines about `who` (you by default), 712 with `accuracy`, 713 with `offhand`, 714 with
-- `ranged` and 715 with `evasion`. 713 and 714 are 0 when they're left out, like the server sends without an off-hand
-- weapon or anything to shoot.
MOCK.CHECKPARAM_LINES = { 733, 731, 712, 713, 714, 715 };
function MOCK.checkparam_packets(accuracy, evasion, who, offhand, ranged, attack, offhand_attack, ranged_attack)
    who = who or MOCK.player.server_id;
    local values = { [712] = accuracy, [713] = offhand or 0, [714] = ranged or 0, [715] = evasion };
    local attacks = { [712] = attack or 0, [713] = offhand_attack or 0, [714] = ranged_attack or 0 };
    local out = {};
    for _, message in ipairs(MOCK.CHECKPARAM_LINES) do
        out[#out + 1] = MOCK.message_packet(who, who, values[message] or 7, attacks[message] or 0, message, 0);
    end
    return out;
end

-- The five /checkparam <pet> reply lines about your pet, or the pet at entity index `index`. They come from
-- you to the pet, with no 731. 712 has `accuracy` and 715 `evasion`.
MOCK.PET_REPLY_LINES = { 733, 712, 713, 714, 715 };
function MOCK.pet_reply_packets(accuracy, evasion, index)
    index = index or MOCK.player.pet_index;
    local entity = MOCK.entities[index];
    local pet = entity and entity.ServerId or MOCK.pet_id(index);
    local out = {};
    for _, message in ipairs(MOCK.PET_REPLY_LINES) do
        local value = (message == 712) and accuracy or ((message == 715) and evasion or 7);
        out[#out + 1] = MOCK.message_packet(MOCK.player.server_id, pet, value, 0, message, index);
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

-- 0x00A zone in, with your server id at 0x04 and the zone you're coming into at 0x30.
function MOCK.zone_packet(id)
    local b = bytes(0x100);
    put(b, 0x04, id or MOCK.player.server_id, 4);
    put(b, 0x30, MOCK.player.zone, 2);
    return packet(0x00A, b, 0x100);
end

-- 0x01B job info, with your max HP before gear and food at 0x3C.
function MOCK.job_info_packet(base_hp)
    local b = bytes(0x84);
    put(b, 0x3C, base_hp, 4);
    return packet(0x01B, b, 0x84);
end

-- 0x061 your stats, with your main level at 0x0D, and your support job and level from MOCK.player at 0x0E and
-- 0x0F.
function MOCK.stats_packet(level)
    local b = bytes(0x68);
    b[0x0D] = level or MOCK.player.main_level;
    b[0x0E], b[0x0F] = MOCK.player.sub_job, MOCK.player.sub_level;
    return packet(0x061, b, 0x68);
end

-- 0x068 pet update with your pet's entity index at 0x0C, 0 with no pet. This is the short form the server
-- sends with no pet. The HP, TP and name that follow the index with a pet out are left out, since
-- checkmate only reads the index.
function MOCK.pet_sync_packet(index)
    local b = bytes(0x1C);
    put(b, 0x0C, index, 2);
    return packet(0x068, b, 0x1C);
end

-- 0x08C merit list. `entries` are { merit id, count }, 4 bytes each from 0x08, after the count at 0x04.
function MOCK.merit_packet(entries)
    local size = 0x08 + 4 * #entries;
    local b = bytes(size);
    put(b, 0x04, #entries, 2);
    for i, entry in ipairs(entries) do
        local at = 0x08 + 4 * (i - 1);
        put(b, at, entry[1], 2);
        b[at + 3] = entry[2];
    end
    return packet(0x08C, b, size);
end

--[[
    Driving the addon.
]]

function MOCK.packet(e)
    return MOCK.fire('packet_in', e);
end

-- Your /checkparam reply. Returns how many of its six lines were hidden.
function MOCK.reply(accuracy, evasion, who, offhand, ranged)
    local hidden = 0;
    for _, e in ipairs(MOCK.checkparam_packets(accuracy, evasion, who, offhand, ranged)) do
        if (MOCK.packet(e).blocked) then hidden = hidden + 1; end
    end
    return hidden;
end

-- Zones you into `zone`, the way the game does it.
function MOCK.zone_in(zone)
    MOCK.player.zone = zone or MOCK.player.zone;
    MOCK.packet(MOCK.zone_packet());
end

-- Your main level changes, like a level up or a level sync, and the server sends your stats.
function MOCK.level_up(level)
    MOCK.player.main_level = level;
    return MOCK.packet(MOCK.stats_packet(level));
end

-- The pet update packet for `index`.
function MOCK.pet_sync(index)
    return MOCK.packet(MOCK.pet_sync_packet(index));
end

-- Your pet named `name` comes out at entity index `index`, 0x700 by default, the first one the server
-- hands a pet. MOCK.summon sends the pet update right away, like the server, and summon_quietly doesn't.
function MOCK.summon_quietly(name, index)
    index = index or 0x700;
    MOCK.player.pet_index = index;
    MOCK.entities[index] = { Name = name, ServerId = MOCK.pet_id(index), HPPercent = 100 };
end
function MOCK.summon(name, index)
    MOCK.summon_quietly(name, index);
    MOCK.pet_sync(MOCK.player.pet_index);
end

-- You charm the monster at entity index `index`. It keeps its own server id.
function MOCK.charm(index, name)
    MOCK.player.pet_index = index;
    MOCK.entities[index] = { Name = name, ServerId = MOCK.mob_id(MOCK.player.zone, index), HPPercent = 100 };
    MOCK.pet_sync(index);
end

-- Your pet goes. A pet you called goes away, and a monster you charmed stays where it is.
function MOCK.dismiss()
    local index = MOCK.player.pet_index or 0;
    if (index >= 0x700) then
        MOCK.entities[index] = nil;
    end
    MOCK.player.pet_index = 0;
    MOCK.pet_sync(0);
end

-- A packet going out, like 0x0DD for a /check or /checkparam.
function MOCK.send_out(id)
    return MOCK.fire('packet_out', { id = id, blocked = false });
end

-- Your pet's /checkparam reply. Returns how many of its five lines were hidden.
function MOCK.pet_reply(accuracy, evasion, index)
    local hidden = 0;
    for _, e in ipairs(MOCK.pet_reply_packets(accuracy, evasion, index)) do
        if (MOCK.packet(e).blocked) then hidden = hidden + 1; end
    end
    return hidden;
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

-- Control tests keep the old all-pages coverage. Navigation tests and real previews opt into selection.
package.preload['ui.navigation'] = function ()
    local navigation = dofile(ADDON_DIR .. '/ui/navigation.lua');
    local draw = navigation.draw;
    navigation.draw = function (settings, tabs, matches, search_changed, draw_page, options)
        if (MOCK.navigation_real) then
            return draw(settings, tabs, matches, search_changed, draw_page, options);
        end
        local imgui = require('imgui');
        for _, tab in ipairs(tabs) do
            if (matches[tab[1]] and navigation.visible((settings.window or {}).tabs, tab[1])) then
                MOCK.gui.tabs[tab[1]] = true;
                imgui.PushID(tab[1]);
                draw_page(tab, settings);
                imgui.PopID();
            end
        end
    end;
    return navigation;
end;
