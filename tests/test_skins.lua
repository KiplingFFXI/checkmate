-- The look skins. Every skin sets every chat color and every window color. Picking one copies its values in
-- and leaves the dividers and font alone. It also covers Reset to skin, Custom, Undo, the Colorblind safe tip,
-- /checkmate reset asking first, and the window look filled on a first install, after /checkmate reset and from a
-- broken file.
local skins    = require('ui.skins');
local defaults = require('ui.defaults');
local printout = require('core.printout');

local ROLES = { 'background', 'card', 'control', 'hover', 'border', 'text', 'heading', 'muted', 'accent',
    'accent_hover', 'success' };
local offered = {};
for _, entry in ipairs(printout.PALETTE) do offered[entry.code] = true; end

check('six skins, Phoenix first', #skins.LIST == 6 and skins.LIST[1].id == 'phoenix'
    and skins.IDS == 'phoenix, classic, minimal, contrast, ember, colorblind', skins.IDS);
for _, skin in ipairs(skins.LIST) do
    local whole = type(skin.imgui.rounding) == 'number' and type(skin.imgui.spacing) == 'number';
    for _, role in ipairs(ROLES) do
        local c = skin.imgui[role];
        whole = whole and type(c) == 'table' and #c == 4;
        for i = 1, 4 do whole = whole and c[i] >= 0 and c[i] <= 1; end
    end
    check(skin.name .. ' has every window color, roundness and spacing', whole);
    local chat_ok, missing = true, {};
    for _, key in ipairs(printout.COLOR_KEYS) do
        if (offered[skin.chat[key]] ~= true) then
            chat_ok = false;
            missing[#missing + 1] = key;
        end
    end
    check(skin.name .. ' sets every chat color, each in the palette', chat_ok, table.concat(missing, ', '));
    local extra = {};
    for key in pairs(skin.chat) do
        if (key ~= 'con_colors' and printout.color_key(key) == nil) then extra[#extra + 1] = key; end
    end
    check(skin.name .. ' has nothing but chat colors and Color by difficulty', #extra == 0, table.concat(extra, ', '));
    local s = defaults.make();
    s.printout.divider = 'custom';
    s.printout.separator = ' + ';
    s.printout.label_divider = 'custom';
    s.printout.label_separator = '>';
    s.look.font = 'verdana';
    s.look.font_size = 22;
    for _, key in ipairs(printout.COLOR_KEYS) do s.colors[key] = 3; end
    skins.apply(s, skin.id);
    check(skin.name .. ' leaves the divider alone', skin.chat.divider == nil and skin.chat.separator == nil
        and s.printout.divider == 'custom' and s.printout.separator == ' + ');
    check(skin.name .. ' leaves the label divider alone', skin.chat.label_divider == nil and skin.chat.label_separator == nil
        and s.printout.label_divider == 'custom' and s.printout.label_separator == '>');
    local copied = true;
    for _, key in ipairs(printout.COLOR_KEYS) do
        copied = copied and s.colors[key] == skin.chat[key];
    end
    check(skin.name .. ' copies every chat color in', copied);
    check(skin.name .. ' sets Color by difficulty', type(skin.chat.con_colors) == 'boolean'
        and s.printout.con_colors == skin.chat.con_colors);
    local spread, wrong = true, {};
    for _, entry in ipairs(skins.WINDOW_COLORS) do
        local want, got = skin.imgui[entry.role], s.look.imgui[entry.key];
        local same = type(got) == 'table' and got ~= want and got[1] == want[1] and got[2] == want[2]
            and got[3] == want[3] and got[4] == (entry.alpha or want[4]);
        if (not same) then
            spread = false;
            wrong[#wrong + 1] = entry.key;
        end
    end
    check(skin.name .. ' sets every window color from its roles, as copies', spread, table.concat(wrong, ', '));
    check(skin.name .. ' leaves the font alone', s.look.font == 'verdana' and s.look.font_size == 22);
end

-- Every window color has a key, a label and a skin role. All but the four checkmate draws itself paint an
-- ImGui color, and no two paint the same one.
local ROLE_SET, painted, keys = {}, {}, {};
for _, role in ipairs(ROLES) do ROLE_SET[role] = true; end
local shape_ok, problems = true, {};
for _, entry in ipairs(skins.WINDOW_COLORS) do
    local ok = type(entry.key) == 'string' and type(entry.label) == 'string' and ROLE_SET[entry.role] == true
        and keys[entry.key] == nil and skins.window_color(entry.key) == entry;
    if (entry.paints ~= nil) then
        ok = ok and type(entry.paints) == 'number' and painted[entry.paints] == nil;
        painted[entry.paints] = true;
    else
        ok = ok and (entry.key == 'headings' or entry.key == 'notes' or entry.key == 'done_messages'
            or entry.key == 'problem_messages');
    end
    keys[entry.key] = true;
    if (not ok) then
        shape_ok = false;
        problems[#problems + 1] = tostring(entry.key);
    end
end
check('41 window colors, each whole and painting its own ImGui color', shape_ok and #skins.WINDOW_COLORS == 41,
    #skins.WINDOW_COLORS .. ' ' .. table.concat(problems, ', '));
check('the ones that show in the window', painted[ImGuiCol_WindowBg] and painted[ImGuiCol_Text]
    and painted[ImGuiCol_TextSelectedBg] and painted[ImGuiCol_PopupBg] and painted[ImGuiCol_TabDimmedSelectedOverline]
    and painted[ImGuiCol_ResizeGripActive] and painted[ImGuiCol_ScrollbarGrabActive] and painted[ImGuiCol_Separator]
    and not painted[ImGuiCol_TitleBgCollapsed]);
check('a window color by key, any case', skins.window_color('BUTTONS_HOVERED').key == 'buttons_hovered'
    and skins.window_color('sort') == nil and skins.window_color(nil) == nil);

-- The skins look different from each other in chat, except where they share checker's con colors.
local looks = {};
for _, skin in ipairs(skins.LIST) do
    local parts = {};
    for _, key in ipairs(printout.COLOR_KEYS) do parts[#parts + 1] = skin.chat[key]; end
    looks[table.concat(parts, ',')] = true;
end
local count = 0;
for _ in pairs(looks) do count = count + 1; end
check('six different chat looks', count == 6, count);

-- Every skin paints the level range in its level color, so the range matches the level until you pick a color for it.
local range_as_level = true;
for _, skin in ipairs(skins.LIST) do range_as_level = range_as_level and skin.chat.level_range == skin.chat.level; end
check('every skin paints the level range in its level color', range_as_level);

-- And the ID the same way.
local id_as_level = true;
for _, skin in ipairs(skins.LIST) do id_as_level = id_as_level and skin.chat.id == skin.chat.level; end
check('every skin paints the ID in its level color', id_as_level);

-- And the PH note too.
local ph_as_level = true;
for _, skin in ipairs(skins.LIST) do ph_as_level = ph_as_level and skin.chat.ph == skin.chat.level; end
check('every skin paints the PH note in its level color', ph_as_level);

-- Minimal prints in one chat color, the tag, difficulty and reading included.
local minimal = defaults.make();
skins.apply(minimal, 'minimal');
local line = printout.tag(minimal, 'checkmate') .. printout.lines(minimal, { name = 'Goblin', low = 20, high = 20, con = 6,
    reading = 0, defense = 2 })[1];
local cream = '\30' .. string.char(106);
check('Minimal prints everything in its one chat color', MOCK.plain(line):find('Very Tough (High Evasion, Low Defense)', 1, true)
    ~= nil and line:gsub(cream, ''):find('\30', 1, true) == nil, line);
local one = true;
for _, key in ipairs(printout.COLOR_KEYS) do one = one and minimal.colors[key] == 106; end
check('every Minimal color is cream', one);

-- The Phoenix skin uses the phoenix-xi.com colors with square corners.
local phoenix = skins.find('phoenix').imgui;
local function is_hex(c, hex)
    local want = skins.hex(hex);
    return math.abs(c[1] - want[1]) < 1e-6 and math.abs(c[2] - want[2]) < 1e-6 and math.abs(c[3] - want[3]) < 1e-6;
end
check('Phoenix colors', is_hex(phoenix.background, '180e0e') and is_hex(phoenix.card, '291c1c')
    and is_hex(phoenix.text, 'fff8f8') and is_hex(phoenix.accent, 'c55151') and is_hex(phoenix.accent_hover, 'ff8d79')
    and is_hex(phoenix.success, '63ba8a') and is_hex(phoenix.border, 'd2abab') and math.abs(phoenix.border[4] - 0.2) < 1e-6
    and phoenix.rounding == 0);
local same = true;
local fresh = defaults.make();
for _, key in ipairs(printout.COLOR_KEYS) do same = same and fresh.colors[key] == skins.find('phoenix').chat[key]; end
check('the defaults use the Phoenix chat colors', same and fresh.printout.con_colors == skins.find('phoenix').chat.con_colors);

-- Finding a skin.
check('find by id, name, any case', skins.find('ember') ~= nil and skins.find('EMBER') ~= nil
    and skins.find('High Contrast') == skins.find('contrast') and skins.find('Classic FFXI').id == 'classic');
check('an unknown skin is nil', skins.find('bogus') == nil and skins.find(nil) == nil);

-- Applying a skin copies its values in.
local s = defaults.make();
check('an unknown skin changes nothing', skins.apply(s, 'bogus') == false and s.look.skin == 'phoenix');
check('apply works', skins.apply(s, 'Ember') == true);
local ember = skins.find('ember');
check('the chat colors are copied', s.colors.line == 7 and s.colors.name == 76 and s.colors.hit_label == 78
    and s.colors.drops_label == 78 and s.colors.drops_name == 96 and s.colors.good == 80 and s.colors.ok == 69
    and s.colors.bad == 68 and s.colors.tag_word == 8);
check('the window look is copied', s.look.skin == 'ember' and is_hex(s.look.imgui.check_marks, 'e8742a')
    and is_hex(s.look.imgui.buttons_hovered, '4a321c') and s.look.imgui.rounding == 2);
check('as copies, not the skin itself', s.look.imgui.check_marks ~= ember.imgui.accent and s.look.imgui ~= ember.imgui
    and s.look.imgui.check_marks ~= s.look.imgui.slider_handles);
s.look.imgui.check_marks[1] = 0.5;
s.look.imgui.boxes_hovered = { 0.1, 0.2, 0.3, 1 };
s.look.imgui.spacing = 12;
s.colors.hit_label = 3;
check('editing the copy leaves the skin and the other colors alone', ember.imgui.accent[1] ~= 0.5
    and s.look.imgui.slider_handles[1] ~= 0.5 and ember.chat.hit_label == 78);
skins.apply(s, s.look.skin);
check('applying again is Reset to skin', s.look.imgui.check_marks[1] == ember.imgui.accent[1]
    and is_hex(s.look.imgui.boxes_hovered, '4a321c') and s.look.imgui.spacing == 7 and s.colors.hit_label == 78);
check('other settings are left alone', s.drops.th == 0 and s.printout.parts.hit.label == 'Hit' and s.printout.parts.hit.on == false);
s.printout.extras_own_line = false;
s.printout.replace_game_line = false;
skins.apply(s, 'contrast');
check('a skin leaves the extras line alone', s.printout.extras_own_line == false);
check('and Replace the game\'s /check line', s.printout.replace_game_line == false);

-- The skin you picked stays current until anything it set differs. The Look tab shows that as Custom.
local classic = skins.find('classic');
local function fresh_classic()
    local out_s = defaults.make();
    skins.apply(out_s, 'classic');
    return out_s;
end
local every_current = true;
for _, skin in ipairs(skins.LIST) do
    s = defaults.make();
    skins.apply(s, skin.id);
    every_current = every_current and skins.current(s) == skin;
end
check('every skin is current right after you pick it', every_current);
s = fresh_classic();
s.printout.divider = 'note';
s.look.font = 'arial';
s.look.font_size = 22;
check('the divider and font don\'t make it Custom', skins.current(s) == classic);
s.colors.good = 69;
check('a changed chat color makes it Custom', skins.current(s) == nil);
s = fresh_classic();
s.printout.con_colors = false;
check('so does Color by difficulty', skins.current(s) == nil);
s = fresh_classic();
s.look.imgui.buttons[2] = s.look.imgui.buttons[2] + 0.01;
check('and a window color', skins.current(s) == nil);
s = fresh_classic();
s.look.imgui.selected_text[4] = 1;
check('and a see-through amount', skins.current(s) == nil);
s = fresh_classic();
s.look.imgui.buttons[2] = s.look.imgui.buttons[2] + 0.001;
check('but not a color a hair off from the settings file', skins.current(s) == classic);
s.look.imgui.spacing = 9;
check('the spacing counts', skins.current(s) == nil);
s = fresh_classic();
s.look.imgui.rounding = 9;
check('and the corner roundness', skins.current(s) == nil);
s = fresh_classic();
s.look.skin = 'bogus';
check('an unknown skin is Custom', skins.current(s) == nil);

-- Undo takes back the last skin pick or Reset to skin, one step only.
skins.forget_undo();
s = defaults.make();
skins.fill(s);
check('nothing to undo at first', not skins.can_undo() and skins.undo(s) == false and s.look.skin == 'phoenix');
s.colors.name = 73;
s.printout.con_colors = false;
s.look.imgui.background = { 0.5, 0.5, 0.5, 1 };
s.look.imgui.spacing = 11;
skins.apply(s, 'ember');
check('a skin pick can be undone', skins.can_undo() and s.look.skin == 'ember');
check('undo works', skins.undo(s) == true);
check('and puts back the skin, chat colors, Color by difficulty and window look', s.look.skin == 'phoenix'
    and s.colors.name == 73 and s.colors.hit_label == 106 and s.printout.con_colors == false
    and s.look.imgui.background[1] == 0.5 and s.look.imgui.spacing == 11 and is_hex(s.look.imgui.text, 'fff8f8'));
check('one step only', not skins.can_undo() and skins.undo(s) == false and s.colors.name == 73);
skins.apply(s, s.look.skin);
check('Reset to skin puts the skin back', s.colors.name == 8 and skins.current(s) == skins.find('phoenix'));
skins.undo(s);
check('and Undo takes that back too', s.colors.name == 73 and s.look.imgui.background[1] == 0.5);
skins.apply(s, 'classic');
skins.apply(s, 'minimal');
skins.undo(s);
check('two picks undo only the last', s.look.skin == 'classic' and skins.current(s) == classic);
skins.apply(s, 'ember');
skins.apply(s, 'bogus');
check('an unknown skin keeps what Undo puts back', skins.undo(s) and skins.current(s) == classic);
local old_look = s.look.imgui;
skins.apply(s, 'ember');
old_look.check_marks[1] = 0.25;
skins.undo(s);
check('Undo keeps a copy, so the old table changing later doesn\'t reach it', s.look.imgui ~= old_look
    and s.look.imgui.check_marks[1] ~= 0.25 and skins.current(s) == classic);
skins.apply(s, 'ember');
skins.forget_undo();
check('forgetting it leaves nothing to undo', not skins.can_undo() and skins.undo(s) == false
    and s.look.skin == 'ember');

-- Colorblind safe says the swatches aren't the game's own shades.
local tip = skins.find('Colorblind safe').tip;
check('Colorblind safe has a tip', type(tip) == 'string' and tip:find('never puts red against green', 1, true) ~= nil
    and tip:find('the shades in game can differ a little', 1, true) ~= nil
    and tip:find('Print a sample', 1, true) ~= nil, tip);
local tips = 0;
for _, skin in ipairs(skins.LIST) do
    if (skin.tip ~= nil) then tips = tips + 1; end
end
check('and the only one', tips == 1, tips);

-- Filling the window look.
s = defaults.make();
check('the defaults start with no window look', next(s.look.imgui) == nil);
skins.fill(s);
check('fill takes the Phoenix look', is_hex(s.look.imgui.background, '180e0e') and s.look.imgui.spacing == 7
    and s.look.imgui.background ~= phoenix.background);
s.look.skin = 'classic';
s.look.imgui = { text = 'x', rounding = 'y', check_marks = { 1, 2 }, buttons = { 0.1, 'a', 0.3, 1 },
    done_messages = { 0.1, 0.2, 0.3, 0.4 }, bogus = { 1, 1, 1, 1 } };
skins.fill(s);
check('fill repairs broken values from your skin', is_hex(s.look.imgui.text, 'ffffff') and s.look.imgui.rounding == 4
    and is_hex(s.look.imgui.check_marks, 'e8c86a') and is_hex(s.look.imgui.buttons, '1b3470')
    and is_hex(s.look.imgui.background, '0b1a3d'));
check('and keeps good ones', s.look.imgui.done_messages[1] == 0.1 and s.look.imgui.done_messages[4] == 0.4);
check('and drops anything that isn\'t a window color', s.look.imgui.bogus == nil);
local every = true;
for _, entry in ipairs(skins.WINDOW_COLORS) do
    local c = s.look.imgui[entry.key];
    every = every and type(c) == 'table' and type(c[1]) == 'number' and type(c[4]) == 'number';
end
check('and fills every window color', every);
s.look.skin = 'nope';
s.look.imgui = 'broken';
skins.fill(s);
check('an unknown skin fills from Phoenix', is_hex(s.look.imgui.background, '180e0e'));

-- Through the addon, a first install, a skin command, then /checkmate reset.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local cur = MOCK.settings.current;
check('a first install has the Phoenix window look', is_hex(cur.look.imgui.background, '180e0e'));
local kept = MOCK.settings.defaults;
check('without touching the defaults Ashita keeps', next(kept.look.imgui) == nil);
MOCK.command('/checkmate skin classic');
check('the skin command copies it in', cur.look.skin == 'classic' and is_hex(cur.look.imgui.background, '0b1a3d')
    and cur.colors.line == 106 and cur.colors.name == 7 and cur.colors.hit_label == 7);
check('without touching the default colors Ashita keeps', next(kept.colors) == nil);
local saved_all = true;
for _, entry in ipairs(skins.WINDOW_COLORS) do
    local c = MOCK.last_save.look.imgui[entry.key];
    saved_all = saved_all and type(c) == 'table' and c[1] == cur.look.imgui[entry.key][1];
end
check('the saved settings hold every window color', saved_all and is_hex(MOCK.last_save.look.imgui.buttons, '1b3470'));

-- Runs a command. Returns the lines it printed, joined.
local function run(text)
    local n = #MOCK.printed;
    MOCK.command(text);
    return table.concat(MOCK.printed_since(n), ' / ');
end

-- /checkmate skin undo.
local said = run('/checkmate skin undo');
check('skin undo takes back the skin command', cur.look.skin == 'phoenix'
    and is_hex(cur.look.imgui.background, '180e0e') and cur.colors.name == 8 and MOCK.last_save.look.skin == 'phoenix');
check('and says so', said == '[checkmate] Your colors and window look are back to how they were before your last '
    .. 'skin pick or Reset to skin.', said);
said = run('/checkmate skin UNDO');
check('a second undo has nothing to take back', cur.look.skin == 'phoenix' and said == '[checkmate] There\'s nothing '
    .. 'to undo. Undo only takes back your last skin pick or Reset to skin.', said);

-- The Look tab. The skin list says Custom once a color changes, and Undo greys out with nothing to undo.
local look_path = 'Look/##skin';
MOCK.command('/checkmate');
MOCK.frame();
check('a first install shows Phoenix, not Custom', MOCK.gui.previews[look_path] == 'Phoenix'
    and skins.current(cur) == skins.find('phoenix'), MOCK.gui.previews[look_path]);
check('with Undo greyed out', MOCK.gui.paths['Look/Undo'] == 'Button' and MOCK.gui.disabled['Look/Undo'] == true);
cur.colors.good = 69;
MOCK.frame();
check('a changed color shows Custom', MOCK.gui.previews[look_path] == 'Custom', MOCK.gui.previews[look_path]);
MOCK.open[look_path] = true;
MOCK.clicks[look_path .. '/Colorblind safe'] = true;
MOCK.frame();
check('picking Colorblind safe copies it in', cur.look.skin == 'colorblind' and cur.colors.good == 6
    and cur.colors.easy_prey == 71);
MOCK.frame();
check('and the list shows it, with Undo ready', MOCK.gui.previews[look_path] == 'Colorblind safe'
    and MOCK.gui.disabled['Look/Undo'] == nil);
-- Its tip goes in the list's (?), after what every skin sets, and never in the window itself.
MOCK.hover = true;
MOCK.frame();
MOCK.hover = false;
local skin_tip = MOCK.gui.tips[look_path] or '';
check('its tip shows in the list\'s (?)', skin_tip:find('^Sets every window color') ~= nil
    and skin_tip:find('Colorblind safe never puts red against green.', 1, true) ~= nil
    and skin_tip:find('Print a sample on the Printout or Colors tab to see the real ones.', 1, true) ~= nil
    and not MOCK.drew('Colorblind safe never'), skin_tip);
MOCK.clicks[look_path .. '/Colorblind safe'] = true;
MOCK.frame();
MOCK.open[look_path] = nil;
MOCK.clicks['Look/Undo'] = true;
local saves = MOCK.saved;
MOCK.frame();
check('picking the skin you have does nothing, so Undo still goes back before it', cur.look.skin == 'phoenix'
    and cur.colors.good == 69 and MOCK.saved > saves and MOCK.last_save.colors.good == 69);
MOCK.hover = true;
MOCK.frame();
MOCK.hover = false;
check('then it\'s Custom again and Undo greys out', MOCK.gui.previews[look_path] == 'Custom'
    and MOCK.gui.disabled['Look/Undo'] == true);
check('and the list\'s (?) has no skin tip of its own', (MOCK.gui.tips[look_path] or ''):find('Colorblind safe never',
    1, true) == nil and MOCK.gui.tips[look_path] ~= nil);
MOCK.clicks['Look/Reset to skin'] = true;
MOCK.frame();
check('Reset to skin brings Phoenix back', cur.colors.good == 2 and skins.current(cur) == skins.find('phoenix'));
MOCK.clicks['Look/Undo'] = true;
MOCK.frame();
check('and Undo takes it back', cur.colors.good == 69 and cur.look.skin == 'phoenix' and skins.current(cur) == nil);
MOCK.command('/checkmate');

-- /checkmate reset asks first. A second one within 10 seconds does it.
local RESET_SAID = '[checkmate] This puts every one of this character\'s settings back to its default, including '
    .. 'the skin and every color, the window\'s font, size and position, and the job links. Your saved profiles '
    .. 'stay. Type /checkmate reset again within 10 seconds to go ahead.';
skins.apply(cur, 'ember');
cur.drops.th = 3;
cur.job_links.WAR = 'Solo';
saves = MOCK.saved;
said = run('/checkmate reset');
check('the first /checkmate reset says what it puts back and changes nothing', said == RESET_SAID
    and cur == MOCK.settings.current and cur.look.skin == 'ember' and cur.drops.th == 3 and MOCK.saved == saves, said);
MOCK.wait(10.5);
said = run('/checkmate reset');
check('after 10 seconds it asks again', said == RESET_SAID and cur.drops.th == 3, said);
MOCK.wait(9.5);
said = run('/checkmate reset');
cur = MOCK.settings.current;
check('a second one within 10 seconds resets', said == '[checkmate] Every setting is back to its default. Your saved '
    .. 'profiles are still there.' and cur.drops.th == 0, said);
check('reset brings back Phoenix, filled', cur.look.skin == 'phoenix' and is_hex(cur.look.imgui.background, '180e0e')
    and cur.colors.name == 8);
check('and clears the job links', next(cur.job_links) == nil);
check('and leaves nothing to undo', not skins.can_undo());
said = run('/checkmate reset');
check('the next reset asks first again', said == RESET_SAID, said);
said = run('/checkmate help');
check('help says what reset puts back', said:find('[checkmate] /checkmate reset  puts every one of this character\'s '
    .. 'settings back to its default, including the skin and every color, the window\'s font, size and position, and '
    .. 'the job links. Your saved profiles stay. Type it twice within 10 seconds.', 1, true) ~= nil, said);
said = run('/checkmate help look');
check('help look names skin undo', said:find('[checkmate] /checkmate skin undo  takes back your last skin pick or Reset to '
    .. 'skin. It only goes back one step.', 1, true) ~= nil, said);

-- A Classic settings file from before the pet, ID and PH colors gets them from Classic, so it's still Classic.
local classic = skins.find('classic');
local old_colors = {};
for _, key in ipairs(printout.COLOR_KEYS) do
    if (not key:find('^pet_') and key ~= 'id' and key ~= 'ph') then old_colors[key] = classic.chat[key]; end
end
MOCK.settings.switch_character({ look = { skin = 'classic' }, colors = old_colors,
    printout = { con_colors = classic.chat.con_colors } });
cur = MOCK.settings.current;
local pet_colors = {};
for _, key in ipairs({ 'pet_label', 'pet_name', 'pet_level', 'pet_number', 'pet_detail' }) do
    pet_colors[#pet_colors + 1] = tostring(cur.colors[key]);
end
check('a Classic settings file without the pet colors fills them from Classic', table.concat(pet_colors, ',')
    == '7,106,106,1,67', table.concat(pet_colors, ','));
check('and the ID color from Classic too', cur.colors.id == 106, cur.colors.id);
check('and the PH color', cur.colors.ph == 106, cur.colors.ph);
check('and it\'s still Classic', cur.look.skin == 'classic' and skins.current(cur) == classic);

return MOCK.report();
