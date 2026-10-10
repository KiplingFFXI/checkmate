-- The overlay. Off by default it reads nothing and draws nothing, and the chat printout is the same byte for byte
-- with it on or off. With it on it shows what checkmate knows about your target, your /check fills in the rest,
-- and it keeps that /check until the monster dies near you, you zone, a widescan says it's another monster or
-- your level changes. It also covers what a frame costs, hiding, the sample, moving it and dragging its corner with
-- Shift, the look, wrapping, crit and magic, its icons and their tips, errors in it never stopping the chat
-- printout, and that it never sends anything. The fixture zone 900 gives the exact checks, and the real Valkurm
-- Dunes rows the wording.
local window_font = require('ui.window_font');
window_font.FOLDER = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\';
local font_file = assert(io.open(window_font.FOLDER .. 'segoeui.ttf', 'w'));
font_file:write('not really a font');
font_file:close();

addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local overlay     = require('ui.overlay');
local printout    = require('core.printout');
local monsters    = require('core.monsters');
local player      = require('core.player');
local skins       = require('ui.skins');
local chat_colors = require('ui.chat_colors');
local settings_window = require('ui.settings_window');
local imgui       = require('imgui');
local NAME = '##checkmate_overlay';
local function cur() return MOCK.settings.current; end
cur().links.group_families = false;
cur().weaknesses.overlay = { elements = false, weapons = false, immunities = false, charm = false };

-- One frame. Returns the overlay's lines joined with ' // ', or '' when it drew nothing.
local function frame()
    local panel = require('ui.settings_window');
    panel.folded = panel.folded or {};
    panel.folded['Display/OVERLAY OPTIONS'] = true;
    panel.folded['Appearance/OVERLAY APPEARANCE'] = true;
    MOCK.frame();
    return table.concat(MOCK.overlay_lines(), ' // ');
end
-- True when the overlay's window was begun on the last frame.
local function drew() return MOCK.gui.flags[NAME] ~= nil; end
-- Runs a command and returns what it said.
local function run(text)
    local n = #MOCK.printed;
    MOCK.command(text);
    return table.concat(MOCK.printed_since(n), ' / ');
end
local function has(text, want) return (text or ''):find(want, 1, true) ~= nil; end
-- How many chat lines since the first n say the overlay stopped.
local function stops_since(n)
    local count = 0;
    for _, line in ipairs(MOCK.printed_since(n)) do
        if (line:find('The overlay stopped after an error', 1, true)) then count = count + 1; end
    end
    return count;
end

-- Zones you in. Zone 900 is the fixture, and the rest come from the real data.
local function zone_to(zone, level)
    addon.path = (zone == 900) and FIXTURES_PATH or ADDON_PATH;
    MOCK.player.main_level = level or MOCK.player.main_level;
    MOCK.zone_in(zone);
end
-- Your /check of the monster at `index`. The reading and defense are 0 for high, 1 for normal and 2 for low.
-- Returns the packet.
local function check_reply(index, level, con, reading, defense)
    return MOCK.packet(MOCK.check_packet(index, level, con, 170 + (reading or 1) * 3 + (defense or 1)));
end
-- Your /check of an NM, which the server answers with "impossible to gauge" and no level.
local function check_nm(index)
    return MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(MOCK.player.zone, index), 0, 0, 249, index));
end
local function widescan(index, level) return MOCK.packet(MOCK.widescan_packet(index, level)); end
-- Someone defeats the monster at `index` near you.
local function dies(index)
    return MOCK.packet(MOCK.message_packet(4321, MOCK.mob_id(MOCK.player.zone, index), 0, 0, 6, index));
end
-- Targets nothing for a frame, then the monster at `index`, so the overlay works it out again.
local function retarget(index)
    MOCK.target.slot0, MOCK.target.slot1, MOCK.target.picking = 0, 0, false;
    frame();
    MOCK.target.slot0 = index;
    return frame();
end

-- Off by default --------------------------------------------------------------------------------

zone_to(900, 40);
MOCK.wait(0.5);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls, MOCK.memory_finds = 0, 0, 0, 0;
MOCK.shift = true;
local begun = false;
for _ = 1, 60 do
    frame();
    begun = begun or drew();
end
check('off by default it never reads your target, your entity or the game\'s flags', cur().overlay.on == false
    and MOCK.reads == 0 and MOCK.entity_reads == 0 and MOCK.player_entity_calls == 0 and MOCK.memory_finds == 0,
    ('%d reads, %d entities, %d you, %d finds'):format(MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls,
    MOCK.memory_finds));
check('nor Shift or the chat line, even with Shift held', MOCK.shift_reads == 0 and MOCK.input_checks == 0);
check('and never draws', not begun);
MOCK.shift = false;
zone_to(900);
MOCK.wait(0.5);
check('and zoning loads no monster data until a /check', monsters.built() == nil);
-- Nor any picture, even with drops in chat, and Ashita's d3d8 library never loads.
MOCK.picture('item', 4105);
MOCK.picture('status', 11);
run('/checkmate show drops');
check_reply(1, 39, 4);
for _ = 1, 30 do frame(); end
run('/checkmate hide drops');
check('off, it reads no picture and never loads d3d8, even with drops in chat', package.loaded['d3d8'] == nil
    and MOCK.d3d8_requires == 0 and MOCK.status_lookups == 0 and MOCK.texture_loads == 0,
    ('%d status, %d loads'):format(MOCK.status_lookups, MOCK.texture_loads));
MOCK.items[4105], MOCK.status_icons[11] = nil, nil;
zone_to(900);

-- The chat printout is the same, byte for byte, with the overlay on or off ------------------------

MOCK.monster(5, 'Fixture Rabbit');
MOCK.monster(400, 'Fixture NM');
MOCK.monster(300, 'Nobody');
-- Every con and reading, an NM's 249, a row whose /check level is 2 under its true one and a monster with no row,
-- with the game's line replaced and shown. Returns every chat line as printed and whether each /check was hidden.
local function chat_run()
    local n, hidden = #MOCK.printed, {};
    local function each(e)
        hidden[#hidden + 1] = tostring(e.blocked);
        frame();
    end
    for _, replace in ipairs({ true, false }) do
        cur().printout.replace_game_line = replace;
        for con = 0, 7 do
            MOCK.target.slot0 = 1;
            each(check_reply(1, 39, con, con % 3, (con + 1) % 3));
        end
        for reading = 0, 2 do
            for defense = 0, 2 do
                each(check_reply(1, 38, 4, reading, defense));
            end
        end
        MOCK.target.slot0 = 400;
        each(check_nm(400));
        MOCK.target.slot0 = 5;
        each(check_reply(5, 4, 0));
        MOCK.target.slot0 = 300;
        each(check_reply(300, 33, 2, 0, 2));
        widescan(1, 40);
        dies(1);
        MOCK.level_up(41);
        MOCK.level_up(40);
        frame();
    end
    cur().printout.replace_game_line = true;
    local lines = {};
    for i = n + 1, #MOCK.printed do lines[#lines + 1] = MOCK.printed[i]; end
    return lines, hidden;
end
local off_lines, off_hidden = chat_run();
-- Turning it on with Show icons on loads d3d8 in the command, so the first monster you target doesn't wait for it.
run('/checkmate overlayicons off');
run('/checkmate overlay on');
check('turning the overlay on with Show icons off leaves d3d8 alone', package.loaded['d3d8'] == nil);
run('/checkmate overlay off');
run('/checkmate overlayicons on');
check('and so does Show icons with the overlay off', package.loaded['d3d8'] == nil);
run('/checkmate overlay on');
check('with both on, the command loads d3d8 before the next frame', package.loaded['d3d8'] ~= nil
    and MOCK.d3d8_requires == 1, MOCK.d3d8_requires);
-- Rows that refresh stats after a manual check are covered separately from passive chat parity.
for _, id in ipairs(overlay.PARTS) do
    cur().overlay.parts[id] = not id:find('pdif', 1, true) and id ~= 'block' and id ~= 'parry'
        and id ~= 'hit' and id ~= 'offhand' and id ~= 'ranged' and id ~= 'evade' and id ~= 'pet';
end
cur().overlay.show_range, cur().overlay.show_id, cur().overlay.show_ph = true, true, true;
run('/checkmate overlaywrap 100');
zone_to(900);
frame();
local on_lines, on_hidden = chat_run();
local same = #off_lines == #on_lines and #off_lines > 40 and table.concat(off_hidden, ',') == table.concat(on_hidden, ',');
for i, line in ipairs(off_lines) do
    same = same and on_lines[i] == line;
end
check('the chat printout is the same byte for byte with the overlay on, and hides the same lines', same,
    #off_lines .. ' lines off, ' .. #on_lines .. ' on');
check('while the overlay drew every /check', has(frame(), 'Nobody (Lv 33)'));
for _, id in ipairs(overlay.PARTS) do cur().overlay.parts[id] = false; end
cur().overlay.parts.name, cur().overlay.parts.difficulty, cur().overlay.parts.reading = true, true, true;
cur().overlay.parts.aggro = true;
cur().overlay.show_range, cur().overlay.show_id, cur().overlay.show_ph = false, false, false;
run('/checkmate overlaywrap 520');

-- What a frame costs ----------------------------------------------------------------------------

MOCK.target.slot0 = 0;
frame();
MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls, MOCK.shift_reads = 0, 0, 0, 0;
MOCK.shift = true;
MOCK.wait(1);
MOCK.shift = false;
check('with nothing targeted a frame reads your target and nothing else', MOCK.reads == 60 and MOCK.entity_reads == 0
    and MOCK.player_entity_calls == 0 and not drew(), MOCK.reads);
check('not even Shift while you hold it, since there\'s nothing to move', MOCK.shift_reads == 0, MOCK.shift_reads);
run('/checkmate overlaycursor on');
MOCK.reads = 0;
MOCK.wait(1);
check('and the cursor too with Follow the cursor on', MOCK.reads == 120 and MOCK.player_entity_calls == 0, MOCK.reads);
run('/checkmate overlaycursor off');

-- The game's flags aren't found yet. A cutscene then goes by your status, and the other two read nothing.
MOCK.target.slot0 = 1;
frame();
check('the game\'s flags were looked for once, the first time one was needed', MOCK.memory_finds == 3, MOCK.memory_finds);
MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls = 0, 0, 0;
MOCK.wait(1);
check('with them missing, a frame reads your target and your entity and nothing else', MOCK.reads == 120
    and MOCK.player_entity_calls == 60 and MOCK.entity_reads == 0 and MOCK.memory_finds == 3,
    ('%d reads, %d entities, %d you, %d finds'):format(MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls,
    MOCK.memory_finds));
MOCK.player.status_server = 4;
check('and a cutscene goes by your status', frame() == '' and not drew());
MOCK.player.status_server = 0;
check('which it reads from the entity it already has', frame() ~= '' and MOCK.memory_finds == 3);

-- With the flags found, a frame reads each one its option is on for, and nothing is worked out again.
MOCK.plant_flags();
-- player.lua keeps where it found them, so this makes it look again, like a fresh start.
local function find_flags_again()
    for i = 1, 50 do
        local name = debug.getupvalue(player.in_event, i);
        if (name == 'flags') then
            debug.setupvalue(player.in_event, i, nil);
            return;
        end
    end
    error('player.in_event keeps no flags');
end
find_flags_again();
frame();
check('a fresh look finds all three', MOCK.memory_finds == 6, MOCK.memory_finds);
local lines_calls, real_lines = 0, printout.lines;
printout.lines = function (...)
    lines_calls = lines_calls + 1;
    return real_lines(...);
end
check('Ashita\'s font was looked up once, the first time the overlay drew', MOCK.get_font_calls == 1, MOCK.get_font_calls);
MOCK.get_io_calls = 0;
frame();
MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls, MOCK.shift_reads, MOCK.input_checks = 0, 0, 0, 0, 0;
MOCK.text_input_reads = 0;
local mouse_calls = 0;
for _ = 1, 60 do
    frame();
    for _, name in ipairs(MOCK.gui.calls) do
        if (name:find('Mouse') or name == 'IsWindowHovered' or name == 'GetWindowDrawList') then
            mouse_calls = mouse_calls + 1;
        end
    end
end
check('with every Hide it option on, a frame reads 2 target slots, 2 flag bytes and 3 map words', MOCK.reads == 60 * 7
    and MOCK.player_entity_calls == 60 and MOCK.entity_reads == 0, MOCK.reads);
check('and asks about Shift and the mouse once for text tips, but not the chat line or a text '
    .. 'box', MOCK.shift_reads == 60 and MOCK.input_checks == 0 and MOCK.text_input_reads == 0 and mouse_calls == 60,
    ('%d Shift, %d chat line, %d text box, %d mouse'):format(MOCK.shift_reads, MOCK.input_checks,
    MOCK.text_input_reads, mouse_calls));
check('text tips work without an icon', cur().overlay.tips == true and mouse_calls == 60);
check('and works nothing out again', lines_calls == 0, lines_calls);
check('and looks for the flags no more', MOCK.memory_finds == 6, MOCK.memory_finds);
check('and Ashita\'s font isn\'t looked up again, nor the screen size read, while the target stays the same',
    MOCK.get_font_calls == 1 and MOCK.get_io_calls == 0, MOCK.get_font_calls .. ' ' .. MOCK.get_io_calls);
MOCK.monster(40, 'Fixture Tinkerer');
MOCK.pick(40);
MOCK.reads = 0;
for _ = 1, 60 do frame(); end
check('while you pick a target it reads the cursor\'s slot too', MOCK.reads == 60 * 8 and lines_calls == 0, MOCK.reads);
MOCK.target_monster(40, 'Fixture Tinkerer');
frame();
check('a new target works it out once', lines_calls == 1, lines_calls);
frame();
check('and only once', lines_calls == 1 and MOCK.entity_reads == 1, lines_calls);
printout.lines = real_lines;
for _, option in ipairs({ { 'overlaycutscenes', 6 }, { 'overlayui', 6 }, { 'overlaymap', 4 } }) do
    run('/checkmate ' .. option[1] .. ' off');
    frame();
    MOCK.reads = 0;
    frame();
    check(('with %s off its flag is never read'):format(option[1]), MOCK.reads == option[2], MOCK.reads);
    run('/checkmate ' .. option[1] .. ' on');
end
run('/checkmate overlaycutscenes off');
run('/checkmate overlayui off');
run('/checkmate overlaymap off');
frame();
MOCK.reads = 0;
frame();
check('with every option off, a frame reads only your target', MOCK.reads == 2, MOCK.reads);
run('/checkmate overlaycutscenes on');
run('/checkmate overlayui on');
run('/checkmate overlaymap on');

-- A target with nothing to show never reads the game's flags.
MOCK.monster(501, 'Shopkeeper', 0x02);
MOCK.target.slot0 = 501;
frame();
MOCK.reads = 0;
for _ = 1, 60 do frame(); end
check('with an NPC targeted, a frame reads your target and none of the game\'s flags', MOCK.reads == 60 * 2
    and not drew(), MOCK.reads);
MOCK.target_monster(40, 'Fixture Tinkerer');
frame();
dies(40);
frame();
MOCK.reads = 0;
for _ = 1, 60 do frame(); end
check('nor with a monster that died while it was on show', MOCK.reads == 60 * 2 and not drew(), MOCK.reads);
-- Nor when the parts that are on make no line for this monster. The rabbit has no immunities.
MOCK.target_monster(5, 'Fixture Rabbit');
for _, case in ipairs({ { 'every part off' }, { 'only Immunities on', 'immunities' } }) do
    for _, id in ipairs(overlay.PARTS) do cur().overlay.parts[id] = false; end
    if (case[2] ~= nil) then cur().overlay.parts[case[2]] = true; end
    run('/checkmate overlaylevel on');
    frame();
    MOCK.reads, MOCK.player_entity_calls = 0, 0;
    for _ = 1, 60 do frame(); end
    check(('nor with %s, so it has no line to draw'):format(case[1]), MOCK.reads == 60 * 2
        and MOCK.player_entity_calls == 60 and not drew(), MOCK.reads);
end
for _, id in ipairs({ 'name', 'difficulty', 'reading', 'aggro', 'links' }) do cur().overlay.parts[id] = true; end
cur().weaknesses.overlay.immunities = false;
run('/checkmate overlaylevel on');

-- Hiding ----------------------------------------------------------------------------------------

MOCK.target_monster(1, 'Fixture Goblin');
check('it shows your target', frame() == 'Fixture Goblin (Lv 38-40) // Aggro: Not aggressive | Doesn\'t link', frame());
MOCK.zoning = true;
check('nothing while you zone', frame() == '' and not drew());
MOCK.zoning = false;
for _, flag in ipairs({ { 'event', 'overlaycutscenes' }, { 'hidden', 'overlayui' }, { 'map', 'overlaymap' } }) do
    MOCK.set_flag(flag[1], true);
    check(('the %s flag hides it'):format(flag[1]), frame() == '' and not drew());
    run('/checkmate ' .. flag[2] .. ' off');
    check(('but not with %s off'):format(flag[2]), frame() ~= '');
    run('/checkmate ' .. flag[2] .. ' on');
    MOCK.set_flag(flag[1], false);
    check('and it shows again once the flag goes', frame() ~= '');
end

-- What it shows ---------------------------------------------------------------------------------

-- Each run takes the swatch of its chat color.
run('/checkmate color level lime');
retarget(1);
local runs = MOCK.gui.colored;
check('the name and level come in their own chat colors', runs[1].text == 'Fixture Goblin'
    and runs[1].color == chat_colors.SWATCHES[cur().colors.name] and runs[2].text == ' (Lv 38-40)' and runs[2].joined
    and runs[2].color == chat_colors.SWATCHES[cur().colors.level] and runs[1].color ~= runs[2].color);
check('and the aggro answer in Safe', runs[3].text == 'Aggro: ' and not runs[3].joined and runs[4].text == 'Not aggressive'
    and runs[4].color == chat_colors.SWATCHES[cur().colors.aggro_safe]);
run('/checkmate color level coral');

-- A /check fills in the level, the difficulty and the reading on the top line.
check_reply(1, 39, 4, 0, 2);
check('your /check adds the level, difficulty and reading', frame() == 'Fixture Goblin (Lv 39) | Even Match (High '
    .. 'Evasion, Low Defense) // Aggro: Not aggressive | Doesn\'t link', frame());
check('in its con color', MOCK.gui.colored[3].text:find('^Even Match') ~= nil
    and MOCK.gui.colored[3].color == chat_colors.SWATCHES[cur().colors.even_match], MOCK.gui.colored[3].text);
MOCK.target_monster(400, 'Fixture NM');
check_nm(400);
check('an NM\'s 249 adds Impossible to Gauge and no level', frame() == 'Fixture NM (Lv 50-51) | Impossible to Gauge // '
    .. 'Aggro: Not aggressive | Doesn\'t link', frame());

-- A widescan before any /check gives the exact level.
MOCK.monster(2, 'Fixture Goblin');
MOCK.target.slot0 = 2;
widescan(2, 39);
check('a widescan level shows as the exact level', frame() == 'Fixture Goblin (Lv 39) // Aggro: Not aggressive | Doesn\'t '
    .. 'link', frame());
run('/checkmate overlayrange on');
check('and Show its level range too adds the range', has(frame(), 'Fixture Goblin (Lv 39, range 38-40) // Aggro'),
    frame());
run('/checkmate overlayrange off');

-- Your /check comes back when you target it again.
MOCK.target.slot0 = 1;
check('the /check shows again when you target it again', has(frame(), 'Fixture Goblin (Lv 39) | Even Match'), frame());
MOCK.target.slot0 = 5;
frame();
MOCK.target.slot0 = 1;
check('and after looking at another monster', has(frame(), '| Even Match'));
run('/checkmate overlayremember off');
check_reply(1, 39, 4, 0, 2);
check('with Remember off it shows until your target changes', has(frame(), '| Even Match'));
MOCK.target.slot0 = 5;
frame();
MOCK.target.slot0 = 1;
check('and then it\'s gone', frame() == 'Fixture Goblin (Lv 38-40) // Aggro: Not aggressive | Doesn\'t link', frame());
run('/checkmate overlayremember on');

-- Its death drops the observed level in both displays and hides it until your target changes.
check_reply(1, 39, 4, 0, 2);
widescan(1, 39);
check('a /check and a widescan of it', has(frame(), 'Fixture Goblin (Lv 39) | Even Match'));
dies(1);
check('its death hides it', frame() == '' and not drew());
local row = monsters.find(900, MOCK.mob_id(900, 1));
local low, high = monsters.level(row, nil, 1);
check('chat also drops the defeated monster\'s widescan level', low == 38 and high == 40);
check('and it stays hidden', frame() == '');
check('targeting it again after nothing shows the data\'s range', retarget(1) == 'Fixture Goblin (Lv 38-40) // Aggro: Not '
    .. 'aggressive | Doesn\'t link', frame());

-- A widescan at a different level means a different monster. A /check with no level stays.
check_reply(1, 39, 4, 0, 2);
widescan(1, 40);
check('a widescan at another level drops the /check', frame() == 'Fixture Goblin (Lv 40) // Aggro: Not aggressive | '
    .. 'Doesn\'t link', frame());
check_reply(1, 40, 4, 0, 2);
widescan(1, 40);
check('one at the same level keeps it', has(frame(), 'Fixture Goblin (Lv 40) | Even Match'), frame());
MOCK.target.slot0 = 400;
check_nm(400);
widescan(400, 51);
check('an NM\'s 249 stays through a widescan, with its level', frame() == 'Fixture NM (Lv 51) | Impossible to Gauge // '
    .. 'Aggro: Not aggressive | Doesn\'t link', frame());
MOCK.entities[1].ServerId = MOCK.mob_id(900, 1) + 0x100000;
check('a different server id at the index ignores the kept /check, but not the widescan level', retarget(1)
    == 'Fixture Goblin (Lv 40) // Aggro: Not aggressive | Doesn\'t link', frame());
MOCK.monster(1, 'Fixture Goblin');

-- Zoning drops everything.
check_reply(1, 39, 4, 0, 2);
widescan(2, 39);
frame();
zone_to(900);
check('zoning drops the /checks', frame() == 'Fixture Goblin (Lv 38-40) // Aggro: Not aggressive | Doesn\'t link', frame());
MOCK.target.slot0 = 2;
check('and the widescan levels', has(frame(), 'Fixture Goblin (Lv 38-40)'));

-- A level change drops the con and the reading, and keeps the level.
MOCK.target.slot0 = 1;
check_reply(1, 39, 4, 0, 2);
frame();
MOCK.level_up(41);
check('a new main level drops the difficulty and reading and keeps the level', frame() == 'Fixture Goblin (Lv 39) // '
    .. 'Aggro: Not aggressive | Doesn\'t link', frame());
lines_calls = 0;
printout.lines = function (...)
    lines_calls = lines_calls + 1;
    return real_lines(...);
end
MOCK.level_up(41);
frame();
check('the same level again works nothing out', lines_calls == 0, lines_calls);
printout.lines = real_lines;
MOCK.level_up(40);

-- Aggro goes by the level before a /check, and by the con after.
MOCK.target_monster(40, 'Fixture Tinkerer');
MOCK.level_up(75);
check('before a /check, aggro goes by the Too Weak level', has(frame(), 'Aggro: Too weak to aggro you unless you rest'),
    frame());
MOCK.target_monster(42, 'Fixture Tinkerer');
check('over a range it says where it starts', has(frame(), 'Fixture Tinkerer (Lv 54-57) // Aggro: Aggressive if it\'s level '
    .. '56 or higher'), frame());
check_reply(42, 57, 1);
check('after it, by the con', has(frame(), 'Aggro: Aggressive'), frame());
check_reply(42, 54, 0);
check('Too Weak from the /check', has(frame(), '| Too Weak // Aggro: Too weak to aggro you unless you rest'), frame());
MOCK.level_up(40);

-- Only monsters show. A monster a script spawns has no data, so it only shows once you /check it. A pet you call
-- has none either, and it never answers a /check.
MOCK.monster(500, 'Someone', 0x01);
MOCK.monster(501, 'Shopkeeper', 0x02);
MOCK.target.slot0 = 500;
check('a player draws nothing', frame() == '' and not drew());
MOCK.target.slot0 = 501;
check('nor does an NPC', frame() == '' and not drew());
MOCK.target.slot0 = 0;
check('nor with nothing targeted', frame() == '' and not drew());
MOCK.entities[0x700] = { Name = 'Fixture Treant', ServerId = MOCK.pet_id(0x700), SpawnFlags = 0x10, HPPercent = 100 };
MOCK.target.slot0 = 0x700;
check('a monster a script spawned draws nothing before a /check', frame() == '' and not drew());
MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.pet_id(0x700), 30, 64 + 4, 174, 0x700));
check('and its name, level and difficulty once you /check it', frame() == 'Fixture Treant (Lv 30) | Even Match // Aggro: '
    .. 'Not aggressive | Doesn\'t link', frame());

-- A monster you charm is your pet, so it shows nothing either. It keeps its spawn flags and its ID.
MOCK.target_monster(1, 'Fixture Goblin');
local uncharmed = frame();
MOCK.charm(1, 'Fixture Goblin');
MOCK.entities[1].SpawnFlags = 0x10;
check('a monster you charm shows nothing while it\'s yours', has(uncharmed, 'Fixture Goblin (Lv 39)') and frame() == ''
    and not drew(), uncharmed);
check('nor when you target it again', retarget(1) == '' and not drew());
run('/checkmate');
check('with the settings window open it shows the sample goblin instead', has(frame(), 'Sample Goblin (Lv 42)'), frame());
run('/checkmate');
MOCK.dismiss();
check('and the monster again once the charm breaks', frame() == uncharmed, frame());

-- Picking a target for a spell keeps the one you had, unless Follow the cursor is on.
MOCK.target_monster(1, 'Fixture Goblin');
frame();
MOCK.pick(40);
check('while you pick a target it keeps showing the one you had', has(frame(), 'Fixture Goblin'), frame());
run('/checkmate overlaycursor on');
check('with Follow the cursor on, the one under the cursor', has(frame(), 'Fixture Tinkerer'), frame());
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.pick_with_nothing(40);
check('picking with nothing targeted follows the cursor too', has(frame(), 'Fixture Tinkerer'), frame());
run('/checkmate overlaycursor off');
check('but shows nothing with it off', frame() == '' and not drew());
MOCK.target_monster(1, 'Fixture Goblin');

-- Chat rows stay out while their overlay switches are off.
check_reply(1, 39, 4, 0, 2);
local PART_SHOWS = {
    name = 'Fixture Goblin (Lv 39)', difficulty = 'Even Match', reading = '(High Evasion, Low Defense)',
    aggro = 'Aggro: Not aggressive', immunities = 'Immune: Bind, Paralyze',
    elements = 'Weaknesses: Weak: [I] Ice | Resists: [F] Fire (never lands),', drops = 'Drops (TH 0): ', steal = 'Steal: ',
    job = 'Job: WAR/THF',
};
for id, text in pairs(PART_SHOWS) do
    local on = (id == 'elements' or id == 'immunities') and cur().weaknesses.overlay[id] or cur().overlay.parts[id];
    on = on == true;
    local before = frame();
    run(('/checkmate %s %s'):format(on and 'overlayhide' or 'overlayshow', id));
    local after = frame();
    check(('the %s part %s'):format(id, on and 'hides' or 'shows'), has(before, text) == on and has(after, text) == not on,
        after);
    run(('/checkmate %s %s'):format(on and 'overlayshow' or 'overlayhide', id));
end
for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'evade', 'crit', 'magic', 'pet', 'drops', 'weaknesses' }) do
    cur().printout.parts[id].on = true;
end
run('/checkmate school elemental on');
MOCK.player.skills = { [36] = 150 };
local shown = frame();
check('the chat\'s other parts never show in the overlay', not has(shown, 'Hit') and not has(shown, 'Evade')
    and not has(shown, 'Off-hand') and not has(shown, 'Ranged') and not has(shown, 'Pet') and not has(shown, 'Crit')
    and not has(shown, 'Magic') and not has(shown, 'Drops') and not has(shown, 'Elements') and not has(shown, 'Immune'),
    shown);
for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'evade', 'crit', 'magic', 'pet', 'drops', 'weaknesses' }) do
    cur().printout.parts[id].on = false;
end
run('/checkmate school elemental off');
MOCK.player.skills = {};
-- A saved overlay selection can show checked-stat rows without enabling chat.
for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'evade' }) do cur().overlay.parts[id] = true; end
run('/checkmate overlaylevel on');
shown = frame();
check('saved selections show the available rows', has(shown, 'Hit:') and has(shown, 'Evade:')
    and not has(shown, 'Pet'), shown);
for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'evade' }) do cur().overlay.parts[id] = false; end

-- The name switches, with the chat's words.
run('/checkmate overlaylevel off');
check('Show level off leaves the level out', has(frame(), 'Fixture Goblin | Even Match'), frame());
run('/checkmate overlaylevel on');
run('/checkmate overlayrange on');
run('/checkmate rangeword spawns');
check('the level range, with the chat\'s word', has(frame(), 'Fixture Goblin (Lv 39, spawns 38-40)'), frame());
run('/checkmate overlayrange off');
run('/checkmate rangeword range');
run('/checkmate overlayid on');
run('/checkmate idword Mob');
check('the ID, with the chat\'s word', has(frame(), ('Fixture Goblin (Lv 39) (Mob %d) //   Even Match')
    :format(MOCK.mob_id(900, 1))), frame());
run('/checkmate overlayid off');
run('/checkmate idword ID');
check('and both off again', has(frame(), 'Fixture Goblin (Lv 39) | Even Match'));

-- The dividers. Its own between parts, and the chat's label divider unless that's a symbol.
for _, each in ipairs({ { 'slash', ' / ' }, { 'dash', ' - ' }, { 'spaces', '  ' }, { 'custom "++"', '++' },
    { 'pipe', ' | ' } }) do
    run('/checkmate overlaydivider ' .. each[1]);
    check(('the %s divider goes between parts, Aggro and Links included'):format(each[1]), frame() == ('Fixture Goblin (Lv '
        .. '39)%sEven Match (High Evasion, Low Defense) // Aggro: Not aggressive%sDoesn\'t link'):format(each[2], each[2]),
        frame());
end
run('/checkmate labeldivider custom >');
for _, each in ipairs(printout.LABEL_DIVIDERS) do
    run('/checkmate labeldivider ' .. each.id);
    local text = each.text or '> ';
    if (text:find('[\128-\255]')) then text = ': '; end
    check(('the chat\'s %s label divider shows as Aggro%sNot aggressive'):format(each.id, text),
        has(frame(), 'Aggro' .. text .. 'Not aggressive'), frame());
end
run('/checkmate labeldivider colon');
check('the chat\'s star between parts never shows', cur().printout.divider == 'star' and not has(frame(), '\129\154'));

-- With each part on its own line, the difficulty stays by the name whatever the chat's order. With it off, the
-- overlay follows the chat.
local order = cur().printout.order;
for _ = 1, 13 do run('/checkmate move aggro up'); end
for _ = 1, 13 do run('/checkmate move links up'); end
run('/checkmate newline difficulty on');
check('the chat\'s order puts aggro first, then links', cur().printout.order:find('^aggro links difficulty') ~= nil,
    cur().printout.order);
check('each part on its own line keeps the difficulty by the name', frame() == 'Fixture Goblin (Lv 39) | Even Match (High '
    .. 'Evasion, Low Defense) // Aggro: Not aggressive | Doesn\'t link', frame());
run('/checkmate overlaylines off');
check('with that off it follows the chat\'s order and New line boxes', frame() == 'Fixture Goblin (Lv 39) // Aggro: Not '
    .. 'aggressive | Doesn\'t link // Even Match (High Evasion, Low Defense)', frame());
run('/checkmate overlaylines on');
for _ = 1, 13 do run('/checkmate move links down'); end
for _ = 1, 13 do run('/checkmate move aggro down'); end
run('/checkmate newline difficulty off');
check('the chat\'s order is back', cur().printout.order == order, cur().printout.order);

-- Aggro and Links each turn on and off in the overlay. With each part on its own line, Links stays on Aggro's line
-- when it comes right after it in the order and Aggro shows, and gets a line of its own otherwise.
local TOP = 'Fixture Goblin (Lv 39) | Even Match (High Evasion, Low Defense)';
run('/checkmate overlayhide aggro');
check('with Aggro off, Links gets its own line', frame() == TOP .. ' // Doesn\'t link', frame());
run('/checkmate overlayhide links');
check('with both off, only the top line', frame() == TOP, frame());
run('/checkmate overlayshow aggro');
check('with Links off, Aggro ends after its answer', frame() == TOP .. ' // Aggro: Not aggressive', frame());
run('/checkmate overlayshow links');
run('/checkmate move links up');
check('with Links before Aggro, each has its own line', frame() == TOP .. ' // Doesn\'t link // Aggro: Not aggressive',
    frame());
run('/checkmate move links down');
run('/checkmate newline links on');
check('the chat\'s New line on Links doesn\'t move it off Aggro\'s line', frame() == TOP .. ' // Aggro: Not aggressive | '
    .. 'Doesn\'t link', frame());
run('/checkmate label links Links');
check('and its label comes after the divider', frame() == TOP .. ' // Aggro: Not aggressive | Links: Doesn\'t link',
    frame());
run('/checkmate label links ""');
-- With that off, the overlay follows the chat. Links comes after Aggro on its line, or starts its own with New line on.
run('/checkmate overlaylines off');
check('following the chat, Links starts its own line with its New line on', frame() == TOP .. ' // Aggro: Not '
    .. 'aggressive // Doesn\'t link', frame());
run('/checkmate newline links off');
check('and with it off carries on after Aggro', frame() == TOP .. ' // Aggro: Not aggressive | Doesn\'t link', frame());
run('/checkmate overlayhide aggro');
check('and with Aggro off starts the extras\' line', frame() == TOP .. ' // Doesn\'t link', frame());
run('/checkmate overlayshow aggro');
run('/checkmate overlaylines on');
-- Aggro moved up past Job, which the overlay has off, still has Links right after it. With Job on, Job sits between
-- them, so each gets its own line.
run('/checkmate move aggro up');
check('with Job off between them, Links stays on Aggro\'s line', frame() == TOP .. ' // Aggro: Not aggressive | '
    .. 'Doesn\'t link', frame());
run('/checkmate overlayshow job');
check('and with Job on, Aggro, Job and Links each have a line', frame() == TOP .. ' // Aggro: Not aggressive // Job: '
    .. 'WAR/THF // Doesn\'t link', frame());
run('/checkmate overlayhide job');
run('/checkmate move aggro down');
check('the order is back', cur().printout.order == order, cur().printout.order);
-- Immunities on between them only splits them when the monster is immune to something, the same as the chat.
run('/checkmate move links down');
run('/checkmate move links down');
run('/checkmate overlayshow immunities');
MOCK.target_monster(5, 'Fixture Rabbit');
check('with Immunities on between them and nothing it\'s immune to, Links stays on Aggro\'s line', frame()
    == 'Fixture Rabbit (Lv 5-6) // Aggro: Not aggressive | Doesn\'t link', frame());
MOCK.target_monster(1, 'Fixture Goblin');
check('and with something it\'s immune to, Aggro, Immunities and Links each have a line', frame() == TOP .. ' // Aggro: '
    .. 'Not aggressive // Weaknesses: Immune: Bind, Paralyze // Doesn\'t link', frame());
run('/checkmate overlayhide immunities');
run('/checkmate move links up');
run('/checkmate move links up');
check('the order is back again', cur().printout.order == order, cur().printout.order);

-- The /check counts even when the chat printout has nothing to print.
for _, id in ipairs({ 'name', 'difficulty', 'reading', 'aggro', 'links' }) do run('/checkmate hide ' .. id); end
run('/checkmate replace off');
MOCK.target_monster(5, 'Fixture Rabbit');
local n = #MOCK.printed;
local e = check_reply(5, 4, 0);
local shown_then = frame();
check('with every chat part off the /check prints nothing and leaves the game\'s line', #MOCK.printed == n
    and e.blocked == false);
check('and the overlay still shows it', has(shown_then, 'Fixture Rabbit (Lv 6) | Too Weak'), shown_then);
for _, id in ipairs({ 'name', 'difficulty', 'reading', 'aggro', 'links' }) do run('/checkmate show ' .. id); end
run('/checkmate replace on');

-- Item names come from the game as they are. The overlay draws them in plain text, and the chat as they are.
MOCK.items[4104] = { Name = { 'Fire\129\154Crystal' } };
MOCK.items[4105] = { Name = { 'Ice Crystal' } };
run('/checkmate overlayshow drops');
run('/checkmate show drops');
MOCK.target_monster(1, 'Fixture Goblin');
n = #MOCK.printed;
check_reply(1, 39, 4, 0, 2);
check('the overlay draws an item name in plain text', has(frame(), 'Drops (TH 0): Ice Crystal 100%, FireCrystal 16%'),
    MOCK.overlay_lines()[3]);
check('and chat prints it as it is', has(table.concat(MOCK.printed_since(n), ' / '), 'Fire\129\154Crystal 16%'));
run('/checkmate overlayhide drops');
run('/checkmate hide drops');

-- Nothing it did sent anything, and nothing in it can.
check('nothing was sent through all of that', #MOCK.commands == 0, #MOCK.commands);
local SENDS = { 'QueueCommand', 'AddOutgoingPacket', 'AddIncomingPacket', 'blocked' };
for _, file in ipairs({ 'ui/overlay.lua', 'core/target.lua', 'core/steal.lua' }) do
    local source_file = assert(io.open(ADDON_DIR .. '/' .. file, 'r'));
    local source = source_file:read('*a');
    source_file:close();
    local found = {};
    for _, word in ipairs(SENDS) do
        if (source:find(word, 1, true)) then found[#found + 1] = word; end
    end
    check(file .. ' never sends or hides a packet', #found == 0, table.concat(found, ', '));
end

-- Real monsters ---------------------------------------------------------------------------------

zone_to(103, 20);
frame();
MOCK.target_monster(98, 'Goblin Tinkerer');
check('Goblin Tinkerer before a /check, like the README shows', frame() == 'Goblin Tinkerer (Lv 18-19) // Aggro: Aggressive '
    .. '(Sight) | Links with Goblin Ambusher (Sight), //   Goblin Bounty Hunter (Sight), Goblin Butcher (Sight), //   '
    .. 'Goblin Digger (Sight), Goblin Gambler (Sight) | +3 more', frame());
check_reply(98, 19, 3, 2, 1);
check('and after it', has(frame(), 'Goblin Tinkerer (Lv 19) | Decent Challenge (Low Evasion) // Aggro'), frame());
MOCK.target_monster(334, 'Valkurm Emperor');
MOCK.level_up(43);
check_nm(334);
check('Valkurm Emperor after a /check says where it aggroes', frame() == 'Valkurm Emperor (Lv 29-30) | Impossible to Gauge '
    .. '// Aggro: Aggressive if it\'s level 30 or higher (Sound) //   Links with Damselfly (Sound)', frame());
widescan(334, 30);
check('and after a widescan saw it at 30', frame() == 'Valkurm Emperor (Lv 30) | Impossible to Gauge // Aggro: Aggressive '
    .. '(Sound) | Links with Damselfly (Sound)', frame());
MOCK.level_up(20);
MOCK.target_monster(330, 'Damselfly');
run('/checkmate overlayid on');
run('/checkmate overlayph on');
run('/checkmate phword "PH of"');
check('a PH with its ID and the chat\'s PH word', has(frame(), 'Damselfly (Lv 21-22) (ID 17199434) (PH of Valkurm Emperor)'),
    frame());
run('/checkmate overlayph off');
check('and with Show if it\'s a PH off', has(frame(), 'Damselfly (Lv 21-22) (ID 17199434) //'), frame());
run('/checkmate overlayid off');
run('/checkmate phword "PH for"');

-- The settings window ---------------------------------------------------------------------------

-- While it's open, the sample shows when you have no monster targeted.
MOCK.target.slot0 = 0;
run('/checkmate');
check('with the settings window open and nothing targeted, it shows the sample goblin', frame():find('^Sample Goblin %(Lv 42%) '
    .. '| Decent Challenge %(Low Defense%) // Aggro: Aggressive %(Sight%) | Links with Goblin Butcher') ~= nil, frame());
check('and draws before the settings window, so it sits behind it', MOCK.gui.window == 'checkmate##settings'
    and MOCK.gui.fonts[1].size == 16 and MOCK.gui.fonts[2].size == 18);
MOCK.target.slot0 = 98;
check('with a monster targeted it shows the monster', has(frame(), 'Goblin Tinkerer (Lv 19)'), frame());
MOCK.target.slot0 = 0;
frame();
run('/checkmate');
check('closing the window hides the sample on the next frame', frame() == '' and not drew());

-- Sliders and text boxes show in the overlay before they save.
MOCK.target.slot0 = 98;
run('/checkmate');
frame();
local saves = MOCK.saved;
MOCK.slide['Aggro/Most entries shown'] = 1;
frame();
check('moving Most entries shown changes the link list on the next frame', has(frame(), 'Links with Goblin Ambusher (Sight) | '
    .. '+7 more') and MOCK.saved == saves, frame());
MOCK.slide['Appearance/overlay_appearance/Wrap lines wider than'] = 0;
frame();
check('and the wrap slider', frame() == 'Goblin Tinkerer (Lv 19) | Decent Challenge (Low Evasion) // Aggro: Aggressive '
    .. '(Sight) | Links with Goblin Ambusher (Sight) | +7 more' and MOCK.saved == saves, frame());
MOCK.open['Display/overlay_options/Divider'] = true;
MOCK.clicks['Display/overlay_options/Divider/Custom'] = true;
frame();
MOCK.open['Display/overlay_options/Divider'] = nil;
frame();
saves = MOCK.saved;
MOCK.typing['Display/overlay_options/Custom text'] = ' ~ ';
frame();
check('and the custom divider\'s text box', has(frame(), 'Goblin Tinkerer (Lv 19) ~ Decent Challenge') and MOCK.saved == saves,
    frame());
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
run('/checkmate maxlinks 5');
run('/checkmate overlaywrap 520');
run('/checkmate overlaydivider pipe');

-- Its flags. Clicks always go through it unless you hold Shift, with the settings window open or closed.
local function takes_clicks() return bit.band(MOCK.gui.flags[NAME], ImGuiWindowFlags_NoMouseInputs) == 0; end
local function can_move() return bit.band(MOCK.gui.flags[NAME], ImGuiWindowFlags_NoMove) == 0; end
local function corner_color() return MOCK.gui.triangles[1] and MOCK.gui.triangles[1].color; end
-- Saving copies the skin's colors again, so they're looked up each time.
local function look() return cur().look.imgui; end
frame();
check('with the settings window open and no Shift, clicks go through it', MOCK.gui.flags[NAME] ~= nil
    and not takes_clicks() and not can_move() and #MOCK.gui.triangles == 0);
MOCK.shift = true;
MOCK.input_checks = 0;
frame();
check('holding Shift, it takes the mouse and can move', takes_clicks() and can_move()
    and bit.band(MOCK.gui.flags[NAME], ImGuiWindowFlags_AlwaysAutoResize) ~= 0
    and bit.band(MOCK.gui.flags[NAME], ImGuiWindowFlags_NoBringToFrontOnFocus) ~= 0
    and bit.band(MOCK.gui.flags[NAME], ImGuiWindowFlags_NoSavedSettings) ~= 0);
check('and shows its corner in the skin\'s Resize corner color', #MOCK.gui.triangles == 1
    and MOCK.gui.triangles[1].window == NAME and corner_color() == look().resize_corner);
check('and checks the chat line isn\'t open', MOCK.input_checks == 1, MOCK.input_checks);
MOCK.chat_input = 0x11;
frame();
check('while you type in the chat line, Shift is just typing', not takes_clicks() and #MOCK.gui.triangles == 0);
MOCK.chat_input = 0;
-- ImGui says a text box wants typing the whole time it has the caret, even once you've stopped, so that's never
-- asked. Shift and a drag still moves it.
MOCK.text_input, MOCK.text_input_reads = true, 0;
MOCK.mouse = { 100, 230 };
frame();
frame();
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
MOCK.overlay_drag = { 400, 300 };
frame();
MOCK.mouse_down = false;
frame();
check('a text box that still has the caret doesn\'t stop Shift, so it takes the mouse and moves', takes_clicks()
    and cur().window.overlay_x == 400 and cur().window.overlay_y == 300 and MOCK.text_input_reads == 0,
    ('%d, %d, %d reads'):format(cur().window.overlay_x, cur().window.overlay_y, MOCK.text_input_reads));
MOCK.text_input, MOCK.overlay_drag = false, nil;
run('/checkmate overlayspot 20 200');
run('/checkmate overlaylock on');
MOCK.shift_reads, MOCK.input_checks = 0, 0;
frame();
check('locked, clicks go through it with Shift held, and Shift isn\'t even read', not takes_clicks() and not can_move()
    and #MOCK.gui.triangles == 0 and MOCK.shift_reads == 0 and MOCK.input_checks == 0);
run('/checkmate overlaylock off');
run('/checkmate');
frame();
check('with the settings window closed, Shift works the same', takes_clicks() and can_move() and #MOCK.gui.triangles == 1);
MOCK.shift = false;
frame();
check('and without it clicks go through it', not takes_clicks() and not can_move() and #MOCK.gui.triangles == 0);

-- Holding Shift and dragging it moves it, and the spot saves once you let go. The tests' panel is 200 x 60, and
-- MOCK.overlay_drag is ImGui moving it.
local function press(x, y)
    MOCK.mouse = { x, y };
    frame();
    MOCK.mouse_clicked, MOCK.mouse_down = true, true;
    frame();
    MOCK.mouse_clicked = false;
end
MOCK.shift = true;
frame();
saves = MOCK.saved;
press(100, 230);
MOCK.overlay_drag = { 400, 300 };
frame();
frame();
check('nothing saves while you drag it', MOCK.saved == saves and cur().window.overlay_x == 20);
MOCK.mouse_down = false;
frame();
check('letting go saves where you put it', cur().window.overlay_x == 400 and cur().window.overlay_y == 300
    and MOCK.saved == saves + 1 and MOCK.last_save.window.overlay_x == 400);
MOCK.overlay_drag = nil;
frame();
check('once', MOCK.saved == saves + 1 and MOCK.gui.placed[NAME].pos[1] == 400 and MOCK.gui.placed[NAME].pos[2] == 300);
-- Letting go of Shift first doesn't drop it.
press(450, 330);
MOCK.shift = false;
MOCK.overlay_drag = { 500, 320 };
frame();
check('letting go of Shift in the middle of a drag keeps the drag going', takes_clicks() and can_move()
    and MOCK.saved == saves + 1);
MOCK.mouse_down = false;
frame();
check('until you let go of the mouse, which saves it', cur().window.overlay_x == 500 and MOCK.saved == saves + 2);
MOCK.overlay_drag = nil;
frame();
check('then clicks go through it again', not takes_clicks());
MOCK.shift = true;
press(900, 900);
frame();
check('a Shift and click somewhere else doesn\'t grab it', MOCK.gui.placed[NAME].cond == ImGuiCond_Always);
MOCK.mouse_down = false;
frame();
run('/checkmate overlaylock on');
saves = MOCK.saved;
press(550, 340);
MOCK.overlay_drag = { 600, 500 };
frame();
MOCK.mouse_down = false;
frame();
check('locked, it doesn\'t move or save', MOCK.saved == saves and cur().window.overlay_x == 500
    and MOCK.gui.placed[NAME].pos[1] == 500, MOCK.gui.placed[NAME].pos[1]);
MOCK.overlay_drag = nil;
run('/checkmate overlaylock off');

-- Ashita gives a click to the game unless ImGui wanted the mouse the frame before. A click right as you press Shift,
-- or right as the mouse gets to it, already went to the game, so it doesn't grab it, and it tells ImGui to let the
-- game have the mouse until you let go. It's at 500, 320 now.
MOCK.shift = false;
frame();
saves = MOCK.saved;
MOCK.shift = true;
frame();
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
check('a click the frame after you press Shift doesn\'t grab it, and the game gets the mouse',
    MOCK.gui.placed[NAME].cond == ImGuiCond_Always and MOCK.gui.capture_mouse == false);
-- ImGui would make a click on its empty space its active item, and Ashita keeps your keys from the game while there's
-- one, so a button only the right mouse button presses sits under the mouse instead, clipped to the whole panel.
local pass = MOCK.gui.buttons[1];
check('and a button only the right mouse button presses goes under the mouse, so the game keeps your keys too',
    #MOCK.gui.buttons == 1 and pass.window == NAME and pass.flags == ImGuiButtonFlags_MouseButtonRight
    and pass.at[1] == 550 and pass.at[2] == 340 and pass.clip ~= nil and pass.clip[1][1] == 500
    and pass.clip[1][2] == 320 and pass.clip[2][1] == 700 and pass.clip[2][2] == 380);
check('and the cursor goes back where it was before the text', MOCK.gui.cursor_pos ~= nil
    and MOCK.gui.cursor_pos[1] == 500 and MOCK.gui.cursor_pos[2] == 320);
check('it doesn\'t set its size on the frame of that click', not MOCK.gui.names.SetNextWindowSize);
MOCK.shift = false;
frame();
check('until you let go of the mouse, even after you let go of Shift', MOCK.gui.capture_mouse == false
    and takes_clicks() and MOCK.gui.placed[NAME].cond == ImGuiCond_Always and #MOCK.gui.buttons == 0);
-- That button counts toward the size ImGui fits it to, so one in its padding would make it a frame bigger.
check('and the frame after the click it keeps last frame\'s size', MOCK.gui.names.SetNextWindowSize == true
    and MOCK.gui.next_size[1] == 200 and MOCK.gui.next_size[2] == 60);
MOCK.mouse_down = false;
frame();
check('then clicks go through it again, and nothing moved or saved', MOCK.gui.capture_mouse == nil
    and not takes_clicks() and MOCK.saved == saves and cur().window.overlay_x == 500);
check('and it fits its text again', not MOCK.gui.names.SetNextWindowSize);
MOCK.shift, MOCK.mouse = true, { 900, 900 };
frame();
MOCK.mouse = { 550, 340 };
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
check('nor does a click right as the mouse gets to it', MOCK.gui.placed[NAME].cond == ImGuiCond_Always
    and MOCK.gui.capture_mouse == false);
MOCK.mouse_down = false;
frame();
press(550, 340);
frame();
check('and the next click grabs it', MOCK.gui.placed[NAME].cond == ImGuiCond_Appearing
    and MOCK.gui.capture_mouse == nil);
MOCK.mouse_down = false;
frame();
check('which saves nothing when it doesn\'t move', MOCK.saved == saves and cur().window.overlay_x == 500);

-- The other way round, a click right as you let go of Shift was kept from the game, since it took the mouse the
-- frame before. So it still grabs it, but a click somewhere else then doesn't.
frame();
MOCK.shift = false;
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
MOCK.overlay_drag = { 520, 330 };
frame();
MOCK.mouse_down = false;
frame();
MOCK.overlay_drag = nil;
check('a click right as you let go of Shift still grabs it, and dragging it saves', cur().window.overlay_x == 520
    and cur().window.overlay_y == 330 and MOCK.saved == saves + 1, cur().window.overlay_x);
frame();
check('then clicks go through it again', not takes_clicks());
MOCK.shift, MOCK.mouse = true, { 900, 900 };
frame();
MOCK.shift = false;
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
frame();
check('a click somewhere else right as you let go of Shift doesn\'t grab it', not takes_clicks()
    and MOCK.gui.placed[NAME].cond == ImGuiCond_Always);
MOCK.mouse_down = false;
frame();

-- A click right after you let go of one the game got goes to the game too, since it told ImGui to let the game have
-- the mouse that frame.
MOCK.mouse = { 550, 340 };
frame();
saves = MOCK.saved;
MOCK.shift = true;
frame();
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
frame();
MOCK.mouse_down = false;
frame();
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
check('a click right after letting go of one the game got doesn\'t grab it either', MOCK.gui.capture_mouse == false
    and MOCK.gui.placed[NAME].cond == ImGuiCond_Always);
MOCK.overlay_drag = { 300, 300 };
frame();
MOCK.mouse_down = false;
frame();
MOCK.overlay_drag = nil;
frame();
check('so dragging it and letting go moves and saves nothing', MOCK.saved == saves and cur().window.overlay_x == 520
    and cur().window.overlay_y == 330 and MOCK.gui.placed[NAME].pos[1] == 520);

-- One the game got keeps the mouse with the game until you let go, even when the overlay hides meanwhile.
MOCK.shift = false;
frame();
MOCK.shift = true;
frame();
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
MOCK.set_flag('map', true);
frame();
check('a click the game got keeps the mouse with the game once it hides', not drew()
    and MOCK.gui.capture_mouse == false);
frame();
check('every frame', not drew() and MOCK.gui.capture_mouse == false);
MOCK.mouse_down = false;
frame();
check('until you let go', not drew() and MOCK.gui.capture_mouse == nil);
MOCK.set_flag('map', false);
frame();
check('and when it shows again it fits its text, not the size it had before it hid', drew()
    and not MOCK.gui.names.SetNextWindowSize);

-- A right or middle click the game got goes the same way, but with no button under it, since ImGui never makes those
-- its active item.
for _, button in ipairs({ ImGuiMouseButton_Right, ImGuiMouseButton_Middle }) do
    local which = button == ImGuiMouseButton_Right and 'right' or 'middle';
    MOCK.shift, MOCK.mouse_button = false, button;
    frame();
    saves = MOCK.saved;
    MOCK.shift = true;
    frame();
    MOCK.mouse_clicked, MOCK.mouse_down = true, true;
    frame();
    MOCK.mouse_clicked = false;
    check(('a %s click the frame after you press Shift goes to the game, with no button under it'):format(which),
        MOCK.gui.capture_mouse == false and #MOCK.gui.buttons == 0 and MOCK.gui.placed[NAME].cond == ImGuiCond_Always);
    MOCK.shift = false;
    frame();
    check(('the game keeps the %s button until you let go, even after you let go of Shift'):format(which),
        MOCK.gui.capture_mouse == false and takes_clicks());
    MOCK.mouse_down = false;
    frame();
    check(('then clicks go through it again, and the %s click moved and saved nothing'):format(which),
        MOCK.gui.capture_mouse == nil and not takes_clicks() and MOCK.saved == saves and cur().window.overlay_x == 520);
end
-- One once it has the mouse stays with it and doesn't grab it, so it can't move it or set its width, even on its
-- corner. It's at 520, 330, so its corner is 708 to 720 across and 378 to 390 down.
saves = MOCK.saved;
MOCK.shift, MOCK.mouse = true, { 715, 385 };
frame();
frame();
MOCK.mouse_clicked, MOCK.mouse_down = true, true;
frame();
MOCK.mouse_clicked = false;
check('a right click on its corner once it has the mouse stays with it, and doesn\'t grab the corner',
    MOCK.gui.capture_mouse == nil and corner_color() == look().resize_corner_hovered);
MOCK.mouse = { 655, 385 };
MOCK.overlay_drag = { 300, 300 };
frame();
MOCK.mouse_down = false;
frame();
MOCK.overlay_drag = nil;
frame();
check('so dragging with it moves nothing, sets no width and saves nothing', cur().overlay.wrap == 520
    and MOCK.saved == saves and cur().window.overlay_x == 520 and MOCK.gui.placed[NAME].pos[1] == 520, cur().overlay.wrap);
MOCK.mouse_button, MOCK.mouse = nil, { 550, 340 };

-- Dragging it away and back to exactly where it was leaves it there, and so does a 1 px wobble.
for _, away in ipairs({ { 300, 400 }, { 521, 330 } }) do
    press(550, 340);
    MOCK.overlay_drag = away;
    frame();
    MOCK.overlay_drag = { 520, 330 };
    frame();
    MOCK.mouse_down = false;
    frame();
    MOCK.overlay_drag = nil;
    frame();
    check(('dragging it to %d, %d and back leaves it where it was'):format(away[1], away[2]),
        cur().window.overlay_x == 520 and cur().window.overlay_y == 330 and MOCK.gui.placed[NAME].pos[1] == 520
        and MOCK.gui.placed[NAME].pos[2] == 330, cur().window.overlay_x .. ', ' .. cur().window.overlay_y);
end

-- Holding Shift and dragging its corner sideways sets the wrap, from how wide its text is, so the corner stays with
-- the mouse. It stays where it is, and saves once you let go. Its text is 200 less 8 px of padding each side, 184 px
-- wide, and the corner is 12 px at 16 px text.
local o = cur().overlay;
run('/checkmate overlayspot 20 200');
frame();
MOCK.mouse = { 215, 255 };
frame();
check('with the mouse on its corner it holds still, so a click there doesn\'t move it', takes_clicks() and not can_move());
check('and the corner shows in the hovered color, with the sideways cursor', corner_color() == look().resize_corner_hovered
    and MOCK.gui.cursor == ImGuiMouseCursor_ResizeEW);
saves = MOCK.saved;
local before = #MOCK.overlay_lines();
press(215, 255);
check('grabbing it changes nothing yet, and it shows in the held color', o.wrap == 520
    and corner_color() == look().resize_corner_held);
MOCK.mouse = { 155, 255 };
frame();
check('dragging it 60 px left wraps the text at 124 px on the same frame', o.wrap == 124
    and #MOCK.overlay_lines() > before and MOCK.saved == saves, o.wrap);
check('and it stays where it is', not can_move() and MOCK.gui.placed[NAME].cond == ImGuiCond_Appearing
    and cur().window.overlay_x == 20);
MOCK.mouse = { -500, 255 };
frame();
check(('it goes no narrower than %d px'):format(overlay.CORNER_MIN), o.wrap == overlay.CORNER_MIN, o.wrap);
MOCK.mouse = { 5000, 255 };
frame();
check('nor wider than 1600 px', o.wrap == overlay.WRAP_MAX, o.wrap);
MOCK.mouse = { 315, 255 };
frame();
check('dragging it right of where you grabbed it never wraps sooner, so text that fits keeps its wrap', o.wrap == 520,
    o.wrap);
MOCK.mouse = { 615, 255 };
MOCK.shift = false;
frame();
check('letting go of Shift keeps the corner', o.wrap == 584 and MOCK.saved == saves, o.wrap);
MOCK.mouse_down = false;
frame();
check('letting go of the mouse saves the width', o.wrap == 584 and MOCK.saved == saves + 1
    and MOCK.last_save.overlay.wrap == 584 and cur().window.overlay_x == 20 and cur().window.overlay_y == 200);
frame();
check('once', MOCK.saved == saves + 1 and not takes_clicks());
MOCK.shift = true;
frame();
saves = MOCK.saved;
press(215, 255);
local grabbed_corner = corner_color() == look().resize_corner_held;
MOCK.mouse_down = false;
frame();
check('a click on the corner that doesn\'t move changes and saves nothing', grabbed_corner and o.wrap == 584
    and MOCK.saved == saves);
run('/checkmate overlaylock on');
saves = MOCK.saved;
press(215, 255);
MOCK.mouse = { 155, 255 };
frame();
MOCK.mouse_down = false;
frame();
check('locked, its corner does nothing', o.wrap == 584 and MOCK.saved == saves and #MOCK.gui.triangles == 0);
run('/checkmate overlaylock off');

-- With Never, dragging its corner right keeps Never, and left sets a wrap.
run('/checkmate overlaywrap 0');
frame();
saves = MOCK.saved;
press(215, 255);
MOCK.mouse = { 235, 255 };
frame();
check('Never stays Never when you drag its corner right', o.wrap == 0, o.wrap);
MOCK.mouse = { 195, 255 };
frame();
check('and left of where you grabbed it wraps at the text\'s width less how far', o.wrap == 164, o.wrap);
MOCK.mouse = { 215, 255 };
frame();
MOCK.mouse_down = false;
frame();
check('and back where you grabbed it, it\'s Never again and nothing saves', o.wrap == 0 and MOCK.saved == saves,
    o.wrap);

-- A piece wider than the wrap keeps the panel wider than the wrap, so then its corner goes from the wrap. Dragging it
-- left never wraps later, and right wraps later by as far as you drag it. Here the panel sizes itself to its widest
-- line like ImGui does, at 7 px a character and 8 px of padding each side.
local function fit()
    local widest = 0;
    for _, line in ipairs(MOCK.overlay_lines()) do widest = math.max(widest, #line * 7); end
    MOCK.overlay_size = { widest + 16, 60 };
end
run('/checkmate overlayid on');
run('/checkmate overlaywrap 100');
frame();
fit();
frame();
local right, count = 20 + MOCK.overlay_size[1], #MOCK.overlay_lines();
check('the name with its level and ID is one piece wider than 100 px', MOCK.overlay_size[1] - 16 > 100,
    MOCK.overlay_size[1]);
saves = MOCK.saved;
press(right - 5, 255);
MOCK.mouse = { right - 10, 255 };
frame();
fit();
check('a nudge left leaves the wrap at 100 and the lines as they were', o.wrap == 100
    and #MOCK.overlay_lines() == count, o.wrap);
MOCK.mouse = { right + 25, 255 };
frame();
fit();
check('and 30 px right of where you grabbed it wraps at 130, not the text\'s width and 30', o.wrap == 130, o.wrap);
MOCK.mouse = { right - 5, 255 };
frame();
MOCK.mouse_down = false;
frame();
check('back where you grabbed it, it\'s 100 again and nothing saves', o.wrap == 100 and MOCK.saved == saves, o.wrap);
run('/checkmate overlaywrap 50');
frame();
fit();
frame();
right, saves = 20 + MOCK.overlay_size[1], MOCK.saved;
press(right - 5, 255);
MOCK.mouse = { right - 10, 255 };
frame();
MOCK.mouse_down = false;
frame();
check('and a nudge left from a wrap of 50 you typed leaves it at 50', o.wrap == 50 and MOCK.saved == saves, o.wrap);
-- A short readout, like a name on its own, is narrower than CORNER_MIN, so a nudge left can't wrap it any sooner. It
-- keeps its wrap and saves nothing, and a spot pulled in from past the edge stays saved. Its text is 98 px here.
run('/checkmate overlayspot 5000 200');
MOCK.overlay_size = { 114, 60 };
frame();
frame();
for _, wrap in ipairs({ 520, 0 }) do
    run('/checkmate overlaywrap ' .. wrap);
    frame();
    saves = MOCK.saved;
    press(1595, 255);
    MOCK.mouse = { 1594, 255 };
    frame();
    MOCK.mouse_down = false;
    frame();
    check(('a nudge left on a short readout\'s corner keeps a wrap of %d'):format(wrap), o.wrap == wrap
        and MOCK.saved == saves and cur().window.overlay_x == 5000, o.wrap .. ' ' .. cur().window.overlay_x);
end
MOCK.overlay_size = nil;
run('/checkmate overlayid off');
run('/checkmate overlaywrap 520');
frame();

-- Near the right edge it's pulled in. Growing there while you hold it is no drag.
run('/checkmate overlayspot 1500 200');
frame();
check('a spot near the edge is pulled in so all of it shows', MOCK.gui.placed[NAME].pos[1] == 1400, MOCK.gui.placed[NAME].pos[1]);
saves = MOCK.saved;
press(1450, 230);
MOCK.overlay_size = { 300, 60 };
frame();
frame();
MOCK.mouse_down = false;
frame();
frame();
check('growing near the edge while you hold it saves nothing', MOCK.saved == saves and cur().window.overlay_x == 1500
    and cur().window.overlay_y == 200);
check('and it\'s pulled in for its new size', MOCK.gui.placed[NAME].pos[1] == 1300, MOCK.gui.placed[NAME].pos[1]);
-- Nor is a click on the frame it's pulled in further, since it grew the frame before.
MOCK.overlay_size = { 200, 60 };
frame();
frame();
saves = MOCK.saved;
MOCK.overlay_size = { 300, 60 };
press(1450, 230);
local pulled_in = MOCK.gui.placed[NAME].pos[1];
MOCK.mouse_down = false;
frame();
frame();
check('a click on the frame it\'s pulled in for its new size saves nothing', pulled_in == 1300 and MOCK.saved == saves
    and cur().window.overlay_x == 1500, pulled_in .. ' ' .. cur().window.overlay_x);
-- Narrowing it there with its corner keeps it where you let go, so it doesn't jump back to the edge, and saves
-- that spot. Its corner is 12 px at its bottom right.
MOCK.overlay_size = { 513, 60 };
frame();
frame();
check('a wider one is pulled in further', MOCK.gui.placed[NAME].pos[1] == 1087, MOCK.gui.placed[NAME].pos[1]);
saves = MOCK.saved;
press(1595, 255);
MOCK.mouse = { 1445, 255 };
frame();
MOCK.overlay_size = { 363, 60 };
frame();
check('dragging its corner 150 px left narrows it where it is', o.wrap == 347
    and MOCK.gui.placed[NAME].cond == ImGuiCond_Appearing, o.wrap);
MOCK.mouse_down = false;
frame();
frame();
check('and letting go keeps it there and saves that spot with the width', MOCK.gui.placed[NAME].pos[1] == 1087
    and cur().window.overlay_x == 1087 and cur().window.overlay_y == 200 and MOCK.saved == saves + 1
    and MOCK.last_save.window.overlay_x == 1087 and MOCK.last_save.overlay.wrap == 347, MOCK.gui.placed[NAME].pos[1]);
run('/checkmate overlayspot 1500 200');
MOCK.overlay_size = { 513, 60 };
frame();
frame();
saves = MOCK.saved;
press(1595, 255);
MOCK.mouse_down = false;
frame();
frame();
check('a click on its corner there that doesn\'t move leaves the saved spot', cur().window.overlay_x == 1500
    and MOCK.saved == saves and MOCK.gui.placed[NAME].pos[1] == 1087);
run('/checkmate overlaywrap 520');
MOCK.overlay_size = nil;
MOCK.shift, MOCK.mouse = false, { 0, 0 };

-- A spot off the screen is drawn pulled in, and the saved spot stays for a bigger screen.
run('/checkmate overlayspot 5000 5000');
frame();
frame();
check('a spot off the screen is drawn where all of it shows', MOCK.gui.placed[NAME].pos[1] == 1400
    and MOCK.gui.placed[NAME].pos[2] == 1140 and MOCK.gui.placed[NAME].cond == ImGuiCond_Always);
check('and the saved spot stays', cur().window.overlay_x == 5000 and cur().window.overlay_y == 5000);
MOCK.screen = { 6000, 6000 };
frame();
check('a new screen size is noticed at your next target, not every frame', MOCK.gui.placed[NAME].pos[1] == 1400);
retarget(MOCK.target.slot0);
check('so a bigger screen shows it at the saved spot', MOCK.gui.placed[NAME].pos[1] == 5000, MOCK.gui.placed[NAME].pos[1]);
MOCK.screen = { 1600, 1200 };
run('/checkmate overlayspot reset');
frame();
check('overlayspot reset puts it back at 20, 200', MOCK.gui.placed[NAME].pos[1] == 20 and MOCK.gui.placed[NAME].pos[2] == 200);
run('/checkmate overlayspot 300 400');
frame();
check('and overlayspot puts it where you say', MOCK.gui.placed[NAME].pos[1] == 300 and MOCK.gui.placed[NAME].pos[2] == 400);
run('/checkmate');
MOCK.clicks['Display/overlay_options/Move it back'] = true;
frame();
frame();
check('so does the Move it back button', MOCK.gui.placed[NAME].pos[1] == 20 and cur().window.overlay_y == 200);
run('/checkmate');

-- The look ---------------------------------------------------------------------------------------

-- Its font is one the load event loaded, at its own size.
run('/checkmate overlayfont segoe ui');
run('/checkmate overlayfontsize 20');
frame();
check('it draws in its own font at its own size', MOCK.gui.fonts[1].font == window_font.face('segoeui')
    and MOCK.gui.fonts[1].font ~= nil and MOCK.gui.fonts[1].size == 20);
run('/checkmate overlayfont verdana');
frame();
check('a missing font draws in Ashita\'s', MOCK.gui.fonts[1].font == MOCK.ashita_font and MOCK.gui.fonts[1].size == 20);
run('/checkmate overlayfont ashita');
run('/checkmate overlayfontsize 16');
check('and no font loaded outside the load event', #MOCK.stray_font_loads() == 0, table.concat(MOCK.stray_font_loads(), ', '));

-- Its background, border and corners come from the skin. How solid the background is and the border are its own.
local function style(id)
    for _, each in ipairs(MOCK.gui.styles) do
        if (each.id == id) then return each.value; end
    end
end
local function pushed(id)
    for _, each in ipairs(MOCK.gui.pushed) do
        if (each.id == id) then return each.color; end
    end
end
for _, skin in ipairs(skins.LIST) do
    run('/checkmate skin ' .. skin.id);
    frame();
    local look = cur().look.imgui;
    check(('the %s skin paints its background, border and corners'):format(skin.id), pushed(ImGuiCol_WindowBg) == look.background
        and pushed(ImGuiCol_Border) == look.border and style(ImGuiStyleVar_WindowRounding) == look.rounding
        and style(ImGuiStyleVar_WindowBorderSize) == 1 and MOCK.gui.bg_alpha == 0.8);
end
run('/checkmate skin phoenix');
run('/checkmate overlayopacity 35');
run('/checkmate overlayborder off');
frame();
check('Background sets how solid it is, and Border off takes the line away', MOCK.gui.bg_alpha == 0.35
    and style(ImGuiStyleVar_WindowBorderSize) == 0);
run('/checkmate overlayopacity 80');
run('/checkmate overlayborder on');
frame();
check('its padding and line gap follow its font size', style(ImGuiStyleVar_WindowPadding)[1] == 8
    and style(ImGuiStyleVar_WindowPadding)[2] == 6 and style(ImGuiStyleVar_ItemSpacing)[2] == 2);
run('/checkmate overlayfontsize 24');
frame();
check('and grow with it', style(ImGuiStyleVar_WindowPadding)[1] == 12 and style(ImGuiStyleVar_WindowPadding)[2] == 8
    and style(ImGuiStyleVar_ItemSpacing)[2] == 3);
run('/checkmate overlayfontsize 16');

-- Wrapping ---------------------------------------------------------------------------------------

-- The tests' text is 7 px a character. Lines only break after a comma or a divider with no bracket open, and
-- carry on two spaces in.
run('/checkmate maxlinks 0');
frame();
local function lines_at(wrap)
    run('/checkmate overlaywrap ' .. wrap);
    frame();
    return MOCK.overlay_lines();
end
local flat = lines_at(0);
check('0 never wraps', #flat == 2 and #flat[2] * 7 > 1600, #flat);
local function balanced(line)
    local _, opens = line:gsub('%(', '');
    local _, closes = line:gsub('%)', '');
    return opens == closes;
end
-- A line wider than the wrap is one piece, with no break left inside it.
local function fits(line, wrap)
    local inside = line:gsub('^  ', ''):gsub(',$', '');
    return #line * 7 <= wrap or (not inside:find(', ', 1, true) and not inside:find(' | ', 1, true));
end
local every = true;
for wrap = 7, 700, 7 do
    for _, line in ipairs(lines_at(wrap)) do
        every = every and balanced(line) and fits(line, wrap) and not line:find('|%s*$') and not line:find('%s$')
            and (line:sub(1, 2) == '  ' or line:find('^Goblin Tinkerer') ~= nil or line:find('^Aggro:') ~= nil);
    end
end
check('at every width from 7 to 700 px, lines fit, start two spaces in when they carry on, and never split a bracket or '
    .. 'end with the pipe or a space', every);
local narrow = lines_at(7);
check('a piece wider than the wrap stays whole', narrow[3] == 'Aggro: Aggressive (Sight)'
    and narrow[4] == '  Links with Goblin Ambusher (Sight),' and narrow[5] == '  Goblin Bounty Hunter (Sight),',
    table.concat(narrow, ' // '));
check('the long link list at 520 px', table.concat(lines_at(520), ' // ') == 'Goblin Tinkerer (Lv 19) | Decent Challenge '
    .. '(Low Evasion) // Aggro: Aggressive (Sight) | Links with Goblin Ambusher (Sight), //   Goblin Bounty Hunter (Sight), '
    .. 'Goblin Butcher (Sight), //   Goblin Digger (Sight), Goblin Gambler (Sight), Goblin Leecher (Sight), //   Goblin '
    .. 'Mugger (Sight), Goblin Tinkerer (Sight)', table.concat(lines_at(520), ' // '));
run('/checkmate maxlinks 5');

-- Details in brackets never split at any width, the level range, the reading and a link that comes by sight and
-- sound included.
zone_to(900, 40);
frame();
local tinkerer = monsters.find(900, MOCK.mob_id(900, 40));
tinkerer.detects = { 'sight', 'sound' };
tinkerer.links = { both = { 'Fixture Goblin' } };
MOCK.target_monster(40, 'Fixture Tinkerer');
check_reply(40, 55, 4, 0, 2);
run('/checkmate overlayrange on');
local whole = table.concat(lines_at(0), ' // ');
check('the line has every detail', whole == 'Fixture Tinkerer (Lv 55, range 54-55) | Even Match (High Evasion, Low Defense) '
    .. '// Aggro: Aggressive (Sight, Sound) | Links with Fixture Goblin (Sight, Sound)', whole);
local DETAILS = { '(Lv 55, range 54-55)', '(High Evasion, Low Defense)', '(Sight, Sound)' };
local kept_whole = true;
for wrap = 7, 600, 7 do
    local text = table.concat(lines_at(wrap), '\n');
    for _, detail in ipairs(DETAILS) do
        kept_whole = kept_whole and has(text, detail);
    end
end
check('and none of them split at any width', kept_whole);
run('/checkmate overlayrange off');

-- Odd custom dividers lay out and draw every character, in order. Only a divider at the end of a wrapped line is
-- left off, and one that's only brackets never is.
run('/checkmate maxlinks 0');
zone_to(103, 20);
frame();
MOCK.target_monster(98, 'Goblin Tinkerer');
check_reply(98, 19, 3, 2, 1);
frame();
-- True when `drawn` is `full` with only spaces and some copies of `divider` left out.
local function only_dropped(full, drawn_text, divider, droppable)
    full, drawn_text = full:gsub('%s', ''), drawn_text:gsub('%s', '');
    local i, j = 1, 1;
    while (i <= #full) do
        if (full:sub(i, i + #divider - 1) == divider and droppable and full:sub(i, i) ~= drawn_text:sub(j, j)) then
            i = i + #divider;
        elseif (full:sub(i, i) == drawn_text:sub(j, j)) then
            i, j = i + 1, j + 1;
        else
            return false;
        end
    end
    return j > #drawn_text;
end
for _, each in ipairs({ { '""', '', false }, { '-', '-', true }, { ',', ',', true }, { '(', '(', false },
    { ')', ')', false } }) do
    run('/checkmate overlaydivider custom ' .. each[1]);
    local full = table.concat(lines_at(0), '');
    local wrapped = lines_at(140);
    check(('the custom divider "%s" draws every character'):format(each[2]), #wrapped > 2
        and only_dropped(full, table.concat(wrapped, ''), each[2], each[3]), table.concat(wrapped, ' // '));
end
-- A part's brackets never run past a divider, so the bracket count starts again after each one. A custom divider
-- that's exactly a comma and a space still never breaks inside the reading, which has one of its own, and keeps it,
-- with short words off or on. With one that's only a closing bracket the line can still wrap after the reading.
check_reply(98, 19, 3, 2, 0);
run('/checkmate overlaydivider custom ", "');
for _, short in ipairs({ 'off', 'on' }) do
    run('/checkmate overlayshort ' .. short);
    local reading = (short == 'on') and 'DC (Lo Eva, Hi Def)' or 'Decent Challenge (Low Evasion, High Defense)';
    local kept = true;
    for wrap = 7, 700, 7 do
        kept = kept and has(table.concat(lines_at(wrap), '\n'), reading);
    end
    check(('with a custom ", " divider the reading never splits or loses its comma, short words %s'):format(short), kept);
end
run('/checkmate overlayshort off');
run('/checkmate overlaydivider custom ")"');
run('/checkmate overlaylines off');
run('/checkmate extras same');
run('/checkmate overlayshow crit');
local after_reading = lines_at(196);
check('with a custom ")" divider the line wraps after the reading', after_reading[2] == '  Decent Challenge (Low Evasion, '
    .. 'High Defense))' and (after_reading[3] or ''):find('^  Crit: %d+%%$') ~= nil, table.concat(after_reading, ' // '));
run('/checkmate overlayhide crit');
run('/checkmate extras new');
run('/checkmate overlaylines on');
run('/checkmate overlaydivider pipe');
run('/checkmate overlaywrap 520');
run('/checkmate maxlinks 5');

-- Crit and magic ---------------------------------------------------------------------------------

-- They use your stats when the target is worked out and the monster's level or levels, never a /checkparam.
zone_to(900, 40);
frame();
MOCK.player.main_job, MOCK.player.skills = 4, { [36] = 150 };
run('/checkmate school elemental on');
local reads_of_you, real_read = 0, player.read;
player.read = function (...)
    reads_of_you = reads_of_you + 1;
    return real_read(...);
end
MOCK.target_monster(2, 'Fixture Goblin');
frame();
check('with crit and magic off it never reads your stats', reads_of_you == 0);
run('/checkmate overlayshow crit');
run('/checkmate overlayshow magic');
local commands = #MOCK.commands;
check('before a /check, crit and magic go over its levels', frame() == 'Fixture Goblin (Lv 38-40) // Crit: 8-9% // Aggro: '
    .. 'Not aggressive | Doesn\'t link // Magic: Elemental 95% ([I] Ice)', frame());
check('from your stats, read once when it was worked out', reads_of_you == 1, reads_of_you);
check_reply(2, 39, 4, 1, 1);
check('after it, at its level', has(frame(), 'Fixture Goblin (Lv 39) | Even Match // Crit: 8% //'), frame());
check('and nothing was sent', #MOCK.commands == commands);
reads_of_you = 0;
for _ = 1, 30 do frame(); end
check('frames with the same target don\'t read your stats', reads_of_you == 0, reads_of_you);
MOCK.player.stat_mods[1] = 60;
check('so a buff while it stays targeted leaves crit as it was', has(frame(), 'Crit: 8% //'), frame());
check('until you target it again', has(retarget(2), 'Crit: 20% //') and reads_of_you == 1, frame());
MOCK.player.stat_mods[1] = nil;
check_reply(2, 39, 4, 1, 1);
check('or /check it again', has(frame(), 'Crit: 8% //'), frame());
MOCK.target_monster(400, 'Fixture NM');
check('a monster its scripts change gets the ? mark', has(frame(), 'Crit: 7-8%? //'), frame());
MOCK.target_monster(300, 'Nobody');
check('one with no data can\'t be worked out', frame() == 'Nobody (Lv ?) // Crit: unknown', frame());
run('/checkmate overlayhide crit');
run('/checkmate overlayhide magic');
run('/checkmate school elemental off');
player.read = real_read;
MOCK.player.skills = {};

-- Icons ------------------------------------------------------------------------------------------

local icons = require('ui.icons');
local fresh = require('ui.defaults').make().overlay;
check('Show icons is on by default, with each picture\'s name and the game\'s element pictures', fresh.icons == true
    and fresh.icons_only == false and fresh.element_look == 'game');
-- Unloading lets go of every picture, so the ones the checks above found missing are looked up again.
MOCK.fire('unload');
zone_to(900, 40);
frame();
run('/checkmate overlaywrap 0');
MOCK.target_monster(1, 'Fixture Goblin');
check_reply(1, 39, 4, 0, 2);
MOCK.picture('status', 179);
local status_before, loads_before = MOCK.status_lookups, MOCK.texture_loads;
run('/checkmate overlayshow elements');
check('an element gets the game\'s picture, and one the client has none for gets its badge', has(frame(), 'Weaknesses: '
    .. 'Weak: [status 179] Ice | Resists: [F] Fire (never lands), [Wa] Water (lands less)'), frame());
check('each storm picture is looked up once', MOCK.status_lookups == status_before + 3
    and MOCK.texture_loads == loads_before + 1, MOCK.status_lookups - status_before);
MOCK.picture('status', 178);
status_before = MOCK.status_lookups;
check('a picture that wasn\'t there isn\'t looked for again', has(retarget(1), 'Resists: [F] Fire')
    and MOCK.status_lookups == status_before, frame());
check('Show icons is the overlay\'s own, so the chat\'s Element icons never show there', not has(run('/checkmate icons on'),
    'didn\'t') and not has(run('/checkmate iconsonly on'), 'didn\'t') and has(frame(), 'Weak: [status 179] Ice | '));
local plain_runs = true;
for _, each in ipairs(MOCK.gui.colored) do
    plain_runs = plain_runs and not each.text:find('[^\32-\126]');
end
check('and no text it draws holds a byte the chat font needs', plain_runs);
run('/checkmate overlayicons off');
check('with the chat\'s icons still on and Show icons off, the overlay gets neither pictures nor symbols, just the names',
    has(frame(), 'Weaknesses: Weak: Ice | Resists: Fire (never lands), Water (lands less)'), frame());
run('/checkmate overlayicons on');
run('/checkmate iconsonly off');
run('/checkmate icons off');
run('/checkmate overlayelementlook badges');
status_before = MOCK.status_lookups;
check('Colored badges draws a badge for each element', has(frame(), 'Weak: [I] Ice | Resists: [F] Fire (never lands), '
    .. '[Wa] Water (lands less)') and MOCK.status_lookups == status_before, frame());
run('/checkmate overlayiconsonly on');
check('Icons only leaves the element names out', has(frame(), 'Weaknesses: Weak: [I] | Resists: [F] (never lands), [Wa] '
    .. '(lands less)'), frame());
run('/checkmate overlayelementlook game');
check('with the game\'s pictures too', has(frame(), 'Weak: [status 179] | Resists: [F] (never lands)'), frame());
run('/checkmate overlayiconsonly off');

-- Magic names its element with the same icon.
MOCK.player.main_job, MOCK.player.skills = 4, { [36] = 150 };
run('/checkmate school elemental on');
run('/checkmate overlayshow magic');
check('the element after a magic school gets its icon', has(retarget(1), '% ([status 179] Ice)'), frame());
run('/checkmate overlayelementlook badges');
check('or its badge', has(frame(), '% ([I] Ice)'), frame());
run('/checkmate overlayiconsonly on');
check('and with Icons only, just the badge', has(frame(), '% ([I])'), frame());
run('/checkmate overlayiconsonly off');
run('/checkmate overlayhide magic');
run('/checkmate school elemental off');
MOCK.player.skills = {};

-- Items.
run('/checkmate overlayshow drops');
MOCK.picture('item', 4105);
check('an item gets its own picture from the client, and one with none shows its name alone', has(retarget(1),
    'Drops (TH 0): [item 4105] Ice Crystal 100%, FireCrystal 16%'), frame());
run('/checkmate overlayiconsonly on');
check('Icons only leaves an item\'s name out, but not one with no picture', has(frame(), 'Drops (TH 0): [item 4105] 100%, '
    .. 'FireCrystal 16%'), frame());
run('/checkmate overlayiconsonly off');
for _, how in ipairs({ 'broken', 'empty', 'raises' }) do
    icons.clear();
    MOCK.picture('item', 4104, how);
    local said = #MOCK.printed;
    check(('a picture that\'s %s keeps the item\'s name, and the overlay keeps going'):format(how), has(retarget(1),
        '[item 4105] Ice Crystal 100%, FireCrystal 16%') and stops_since(said) == 0, frame());
end
MOCK.items[4104] = { Name = { 'Fire\129\154Crystal' } };
icons.clear();
MOCK.texture_error = true;
local said_then = #MOCK.printed;
check('a texture that raises an error keeps every name, and the elements get badges', has(retarget(1), 'Drops (TH 0): '
    .. 'Ice Crystal 100%, FireCrystal 16%') and has(frame(), 'Weak: [I] Ice') and stops_since(said_then) == 0, frame());
MOCK.texture_error = false;

-- Each picture loads once, and a steady frame looks nothing up.
icons.clear();
retarget(1);
local loads = MOCK.texture_loads;
MOCK.monster(2, 'Fixture Goblin');
for _ = 1, 3 do
    retarget(2);
    retarget(1);
end
zone_to(900);
frame();
MOCK.target_monster(1, 'Fixture Goblin');
check('each picture loads once, whatever you target and wherever you zone', has(frame(), '[item 4105] Ice Crystal')
    and MOCK.texture_loads == loads, MOCK.texture_loads - loads);
check('and d3d8 only ever loaded once', MOCK.d3d8_requires == 1, MOCK.d3d8_requires);
local counts = { MOCK.item_lookups, MOCK.status_lookups, MOCK.texture_loads };
local draw_lists = 0;
for _ = 1, 30 do
    frame();
    for _, name in ipairs(MOCK.gui.calls) do
        if (name == 'GetWindowDrawList') then draw_lists = draw_lists + 1; end
    end
end
check('steady frames look up and load nothing', MOCK.item_lookups == counts[1] and MOCK.status_lookups == counts[2]
    and MOCK.texture_loads == counts[3]);
check('and get the draw list once a frame while an icon is on show', draw_lists == 30, draw_lists);

-- Sizes and badges.
local function icon_drawn(what)
    for _, each in ipairs(MOCK.gui.colored) do
        if (each.icon and (each.picture == what or each.letter == what)) then return each; end
    end
    return nil;
end
local lines_with = #MOCK.overlay_lines();
local picture = icon_drawn('item 4105');
local image = MOCK.gui.images[1];
check('an icon is as big as the font, 16 by 16 at first', picture ~= nil and picture.size[1] == 16 and picture.size[2] == 16
    and image.high[1] - image.low[1] == 16 and image.high[2] - image.low[2] == 16);
run('/checkmate overlayfontsize 24');
frame();
picture, image = icon_drawn('item 4105'), MOCK.gui.images[1];
check('and 24 by 24 at 24 px', picture ~= nil and picture.size[1] == 24 and image.high[2] - image.low[2] == 24);
run('/checkmate overlayfontsize 16');
run('/checkmate overlayicons off');
check('icons make no more lines than their names alone', #MOCK.overlay_lines() == lines_with and lines_with > 0,
    #MOCK.overlay_lines() .. ' ' .. lines_with);
run('/checkmate overlayicons on');
run('/checkmate overlayelementlook badges');
frame();
local ice, water, fire = icon_drawn('I'), icon_drawn('Wa'), icon_drawn('F');
local look = cur().look.imgui;
local function is_background(color)
    return color[1] == look.background[1] and color[2] == look.background[2] and color[3] == look.background[3]
        and color[4] == 1;
end
check('a badge is its Element badges color', ice ~= nil and ice.fill == chat_colors.SWATCHES[cur().colors.badge_ice]
    and water.fill == chat_colors.SWATCHES[cur().colors.badge_water]);
check('its letter is 10 px at 16, and its corners square on Phoenix', ice.letter_size == 10 and ice.rounding == 0);
check('the letter is the skin\'s text color on royal blue, and its background on cyan and tomato', water.ink == look.text
    and is_background(ice.ink) and is_background(fire.ink));
run('/checkmate color badge_ice lime');
check('a new badge color shows on the next frame', frame() ~= '' and icon_drawn('I').fill == chat_colors.SWATCHES[79]);
run('/checkmate skin classic');
frame();
check('Classic\'s badges have round corners', icon_drawn('I').rounding == 4, icon_drawn('I').rounding);
run('/checkmate skin colorblind');
frame();
look = cur().look.imgui;
check('Colorblind safe\'s slate blue water takes the background color', is_background(icon_drawn('Wa').ink));
run('/checkmate skin phoenix');
frame();
-- Each of the eight badges takes its own color, on the goblin made weak to every element for this.
local real_find = monsters.find;
local EVERY = { fire = 100, ice = 100, wind = 100, earth = 100, thunder = 100, water = 100, light = 100, dark = 100 };
monsters.find = function (zone, id, name)
    local row = real_find(zone, id, name);
    return row and setmetatable({ ranks = {}, meva = {}, magic_dmg = EVERY }, { __index = row });
end
local element_order = require('core.elements').ORDER;
for index, key in ipairs(element_order) do cur().colors['badge_' .. key] = printout.PALETTE[index].code; end
local every_badge = retarget(1);
local wrong_fill = {};
for index, key in ipairs(element_order) do
    local badge = icon_drawn(icons.LETTERS[key]);
    if (badge == nil or badge.fill ~= chat_colors.SWATCHES[printout.PALETTE[index].code]) then
        wrong_fill[#wrong_fill + 1] = key;
    end
end
check('each of the eight badges is its own Element badges color', #wrong_fill == 0 and has(every_badge, '[F] Fire')
    and has(every_badge, '[D] Dark'), table.concat(wrong_fill, ', ') .. ' / ' .. every_badge);
monsters.find = real_find;
run('/checkmate skin phoenix');
retarget(1);

-- Immunities.
for _, id in ipairs({ 'elements', 'drops' }) do run('/checkmate overlayhide ' .. id); end
run('/checkmate overlayelementlook game');
run('/checkmate overlayshow immunities');
icons.clear();
MOCK.picture('status', 11);
MOCK.picture('status', 4);
status_before = MOCK.status_lookups;
check('each immunity gets its game picture', has(retarget(1), 'Immune: [status 11] Bind, [status 4] Paralyze'), frame());
check('and with each name shown, the other immunities\' pictures are never read', MOCK.status_lookups == status_before + 2,
    MOCK.status_lookups - status_before);
run('/checkmate overlayiconsonly on');
status_before = MOCK.status_lookups;
check('Icons only leaves an immunity\'s name out when its picture is its own', has(frame(), 'Immune: [status 11], [status '
    .. '4]') and not has(frame(), 'Bind'), frame());
check('which it works out by reading all 16 once', MOCK.status_lookups == status_before + 16,
    MOCK.status_lookups - status_before);
status_before = MOCK.status_lookups;
retarget(1);
check('and never again', MOCK.status_lookups == status_before, MOCK.status_lookups - status_before);
-- Like the game's own pictures, where Bind, Stun and Terror share one.
MOCK.picture('status', 10, 11);
MOCK.picture('status', 28, 11);
MOCK.fire('unload');
check('an immunity that shares its picture with another keeps its name', has(retarget(1), 'Immune: [status 11] Bind, '
    .. '[status 4]') and not has(frame(), 'Paralyze'), frame());
run('/checkmate overlayiconsonly off');
run('/checkmate overlayhide immunities');

-- Steal, and the sample goblin.
run('/checkmate overlayshow steal');
MOCK.picture('item', 4104);
check('a Steal item gets its picture', has(retarget(1), 'Steal: [item 4104] FireCrystal'), frame());
MOCK.items[930], MOCK.items[508] = { Name = { 'Beastman Blood' } }, { Name = { 'Goblin Helm' } };
MOCK.items[507], MOCK.items[656] = { Name = { 'Goblin Mail' } }, { Name = { 'Beastcoin' } };
for _, id in ipairs({ 930, 508, 507, 656 }) do MOCK.picture('item', id); end
run('/checkmate overlayshow drops');
MOCK.target.slot0 = 0;
run('/checkmate');
local sample = frame();
check('the sample goblin shows its items\' pictures', has(sample, '[item 930] Beastman Blood 15%')
    and has(sample, '[item 508] Goblin Helm') and has(sample, '[item 507] Goblin Mail')
    and has(sample, 'Steal: [item 656] Beastcoin'), sample);
run('/checkmate');
run('/checkmate overlayhide steal');

-- Show icons off draws no icon and reads no picture.
MOCK.target_monster(1, 'Fixture Goblin');
run('/checkmate overlayshow elements');
icons.clear();
run('/checkmate overlayicons off');
counts = { MOCK.status_lookups, MOCK.texture_loads };
local drew_icon = false;
check('with Show icons off the lines are the names alone', has(retarget(1), 'Weaknesses: Weak: Ice | Resists: Fire (never '
    .. 'lands), Water (lands less)') and has(frame(), 'Drops (TH 0): Ice Crystal 100%, FireCrystal 16%'), frame());
draw_lists = 0;
for _ = 1, 30 do
    frame();
    for _, each in ipairs(MOCK.gui.colored) do drew_icon = drew_icon or each.icon == true; end
    for _, name in ipairs(MOCK.gui.calls) do
        if (name == 'GetWindowDrawList') then draw_lists = draw_lists + 1; end
    end
end
check('and draws no icon, never gets the draw list and reads no picture', not drew_icon and draw_lists == 0
    and MOCK.status_lookups == counts[1] and MOCK.texture_loads == counts[2]);
run('/checkmate overlayicons on');

-- Wrapping. An icon counts its width, so a line can wrap with icons and not without, and a wrapped line carries on
-- with its icon.
run('/checkmate overlaywrap 520');
run('/checkmate overlayhide drops');
run('/checkmate overlayelementlook badges');
check('an icon counts its width, and the line carries on with the icon and its name', has(retarget(1), 'Resists: [F] Fire '
    .. '(never lands), //   [Wa] Water (lands less)'), frame());
run('/checkmate overlayicons off');
check('while without icons the line fits', has(frame(), 'Resists: Fire (never lands), Water (lands less)'), frame());
run('/checkmate overlayicons on');
run('/checkmate overlaydivider custom ""');
said_then = #MOCK.printed;
check('with an empty custom divider an icon is never taken for one', has(frame(), 'Weak: [I] Ice')
    and stops_since(said_then) == 0, frame());
-- With Icons only, the space left after an item's picture isn't taken for a one space divider, so a wrap never splits
-- the sample goblin's Goblin Helm from its chance.
run('/checkmate overlaydivider custom " "');
run('/checkmate overlayiconsonly on');
run('/checkmate overlaywrap 200');
run('/checkmate overlayshow drops');
MOCK.target.slot0 = 0;
run('/checkmate');
local helm = frame();
check('with Icons only and a one space divider, an item\'s picture stays with its chance', has(helm, '[item 508] 5.0%')
    and has(helm, 'Drops (TH 0): [item 930] 15%, //'), helm);
-- Only those spaces are glued, never a picture. The goblin's DRK before its slash and its Beastcoin have no spaces
-- left after their pictures. overlay.lua keeps the runs it draws to itself, so this reads them from overlay.draw.
local function overlay_runs()
    for i = 1, 100 do
        local name, value = debug.getupvalue(overlay.draw, i);
        if (name == 'lines') then return value; end
        if (name == nil) then break; end
    end
    error('overlay.draw keeps no lines');
end
MOCK.picture('item', 12516);
MOCK.picture('item', 12511);
run('/checkmate overlayshow job');
run('/checkmate overlayshow steal');
local shown = frame();
local wrong_glue, glued_spaces, bare_pictures = 0, 0, 0;
for _, runs in ipairs(overlay_runs()) do
    for i, each in ipairs(runs) do
        if (each.glued and (each.texture ~= nil or not (each.text or ''):find('^ +$'))) then
            wrong_glue = wrong_glue + 1;
        elseif (each.glued) then
            glued_spaces = glued_spaces + 1;
        end
        if (each.texture ~= nil and not (runs[i + 1] or {}).glued) then bare_pictures = bare_pictures + 1; end
    end
end
check('with Icons only, only the spaces after a picture are glued, even after a picture with none',
    has(shown, 'Job: [item 12516]/[item 12511]') and wrong_glue == 0 and glued_spaces > 0 and bare_pictures > 0,
    ('%d wrong, %d spaces, %d bare: %s'):format(wrong_glue, glued_spaces, bare_pictures, shown));
run('/checkmate overlayhide job');
run('/checkmate overlayhide steal');
run('/checkmate');
run('/checkmate overlayhide drops');
run('/checkmate overlaywrap 520');
run('/checkmate overlayiconsonly off');
MOCK.target_monster(1, 'Fixture Goblin');
run('/checkmate overlaydivider pipe');

-- The chat printout stays the same, byte for byte, whatever the overlay's icons do.
for _, id in ipairs({ 'immunities', 'elements', 'drops', 'steal' }) do
    run('/checkmate overlayshow ' .. id);
    run('/checkmate show ' .. id);
end
local function chat_of_check()
    local from = #MOCK.printed;
    check_reply(1, 39, 4, 0, 2);
    frame();
    local out = {};
    for i = from + 1, #MOCK.printed do out[#out + 1] = MOCK.printed[i]; end
    return table.concat(out, '\n');
end
local chat_icons = chat_of_check();
run('/checkmate overlayiconsonly on');
local chat_only = chat_of_check();
run('/checkmate overlayiconsonly off');
run('/checkmate overlayicons off');
local chat_plain = chat_of_check();
run('/checkmate overlayicons on');
check('the chat printout is the same byte for byte with the overlay\'s icons on, off or alone', chat_icons == chat_plain
    and chat_only == chat_plain and has(chat_plain, 'Ice Crystal') and has(chat_plain, 'Bind')
    and not chat_plain:find('[\29\239]'), MOCK.plain(chat_plain));
for _, id in ipairs({ 'immunities', 'elements', 'drops', 'steal' }) do
    run('/checkmate overlayhide ' .. id);
    run('/checkmate hide ' .. id);
end
run('/checkmate overlayelementlook game');

-- Unloading lets go of the pictures, so a frame after it loads them again.
run('/checkmate overlayshow drops');
retarget(1);
loads = MOCK.texture_loads;
MOCK.fire('unload');
check('after unloading, the next lines load both drops\' pictures again', has(retarget(1), '[item 4105] Ice Crystal 100%, '
    .. '[item 4104] FireCrystal') and MOCK.texture_loads == loads + 2, MOCK.texture_loads - loads);
run('/checkmate overlayhide drops');

-- Tips ------------------------------------------------------------------------------------------

-- Resting the mouse on an icon shows what it means, in ImGui's own tooltip, while the panel stays click-through. The
-- mock's panel is bigger here, so the mouse on an icon is inside it.
local tips = require('ui.tips');
check('Tips on hover is on by default', require('ui.defaults').make().overlay.tips == true);
MOCK.overlay_size = { 600, 120 };
MOCK.target_monster(1, 'Fixture Goblin');
run('/checkmate overlayshow elements');
retarget(1);
-- Puts the mouse in the middle of the nth icon the overlay drew last frame.
local function aim(n)
    MOCK.mouse = { MOCK.overlay_icon_spot(n) };
end
-- The overlay's tip on the last frame, or nil.
local function tip_now()
    return MOCK.gui.overlay_tip and MOCK.gui.overlay_tip.text;
end
-- Frames for `seconds`. Returns the last frame's tip and whether every frame with a tip left the panel
-- click-through and never told ImGui to take the mouse.
local function rest(seconds)
    local through = true;
    for _ = 1, math.floor(seconds * 60 + 0.5) do
        frame();
        if (MOCK.gui.overlay_tip ~= nil) then
            through = through and bit.band(MOCK.gui.flags[NAME], ImGuiWindowFlags_NoInputs) == ImGuiWindowFlags_NoInputs
                and MOCK.gui.capture_mouse == nil;
        end
    end
    return tip_now(), through;
end
-- How many times each mouse and tooltip call ran over `seconds`.
local MOUSE_CALLS = { GetMousePos = true, IsAnyMouseDown = true, IsWindowHovered = true, BeginTooltip = true };
local function mouse_calls_over(seconds)
    local counts = { GetMousePos = 0, IsAnyMouseDown = 0, IsWindowHovered = 0, BeginTooltip = 0 };
    for _ = 1, math.floor(seconds * 60 + 0.5) do
        frame();
        for _, name in ipairs(MOCK.gui.calls) do
            if (MOUSE_CALLS[name]) then counts[name] = counts[name] + 1; end
        end
    end
    return counts;
end

-- With an icon on show and the mouse elsewhere, a frame reads where the mouse is once and nothing else.
MOCK.mouse = { 900, 900 };
local counts = mouse_calls_over(1);
check('with icons on show, a frame reads where the mouse is once, and asks nothing else while it\'s on none',
    counts.GetMousePos == 60 and counts.IsAnyMouseDown == 0 and counts.IsWindowHovered == 0
    and counts.BeginTooltip == 0, ('%d %d %d %d'):format(counts.GetMousePos, counts.IsAnyMouseDown,
    counts.IsWindowHovered, counts.BeginTooltip));
check('overlaytips off turns the tips off', has(run('/checkmate overlaytips off'), 'The overlay no longer shows hover '
    .. 'tips.') and cur().overlay.tips == false);
check('and then a frame reads nothing about the mouse', mouse_calls_over(1).GetMousePos == 0);
run('/checkmate overlaytips on');
run('/checkmate overlayicons off');
check('Show icons off still reads the mouse once per frame for text tips', mouse_calls_over(1).GetMousePos == 60);
run('/checkmate overlayicons on');

-- The mouse on Ice. The tip waits a moment, then says what the icon means, in the overlay's font, wrapped at 20
-- times its size.
local ICE = 'Ice. Its resistance rank to ice is its lowest, so ice nukes and effects that go by ice land on it more '
    .. 'often than those of an element with a higher rank.';
frame();
aim(1);
local shown_before = MOCK.overlay_tips_shown;
check('no tip for the first 0.1 s on an icon', rest(0.1) == nil and MOCK.overlay_tips_shown == shown_before);
local text, through = rest(0.1);
expect('then the tip, which says why it\'s weak', text, ICE);
shown_before = MOCK.overlay_tips_shown;
local still_through;
text, still_through = rest(0.5);
check('and every frame after', text == ICE and MOCK.overlay_tips_shown == shown_before + 30,
    MOCK.overlay_tips_shown - shown_before);
check('while the panel stays click-through and never takes the mouse', through and still_through);
local end_at = 0;
for index, name in ipairs(MOCK.gui.calls) do
    if (name == 'End' and end_at == 0) then end_at = index; end
end
local after_end = {};
for index = end_at + 1, math.min(end_at + 13, #MOCK.gui.calls) do
    after_end[#after_end + 1] = MOCK.gui.calls[index];
end
expect('the tip goes right after the panel\'s End, and the panel\'s own pops come after the tip\'s',
    table.concat(after_end, ' '), 'PushStyleColor PushStyleColor PushStyleVar BeginTooltip PushTextWrapPos '
    .. 'TextUnformatted PopTextWrapPos EndTooltip PopStyleVar PopStyleColor PopStyleColor PopStyleVar PopFont');
-- The tip's look, pushed after the panel's own.
local function tip_border()
    for _, each in ipairs(MOCK.gui.styles) do
        if (each.id == ImGuiStyleVar_PopupBorderSize) then return each.value; end
    end
    return nil;
end
check('in the Open dropdowns and Text colors of the settings window\'s tips', MOCK.gui.colors[ImGuiCol_PopupBg]
    == cur().look.imgui.dropdowns and MOCK.gui.colors[ImGuiCol_Text] == cur().look.imgui.text);
check('with the overlay\'s border, at 16 px wrapped at 320', tip_border() == 1 and MOCK.gui.overlay_tip.font_size == 16
    and MOCK.gui.overlay_tip.wrap == 320, tostring(tip_border()) .. ' ' .. tostring(MOCK.gui.overlay_tip.wrap));
run('/checkmate overlayborder off');
check('a layout made again under the mouse keeps the tip up on the next frame', rest(1 / 60) == ICE);
check('and with Border off its border goes too', tip_border() == 0, tip_border());
run('/checkmate overlayborder on');
run('/checkmate overlayfontsize 24');
frame();
aim(1);
rest(0.2);
check('at 24 px it\'s 24 px and wraps at 480', MOCK.gui.overlay_tip ~= nil and MOCK.gui.overlay_tip.font_size == 24
    and MOCK.gui.overlay_tip.wrap == 480);
run('/checkmate overlayfontsize 16');
frame();

-- Fire and Water, the second and third icons, and moving between them starts the wait over.
aim(2);
check('moving to the next icon starts the wait over', rest(1 / 60) == nil);
expect('Fire\'s tip', rest(0.2), 'Fire. Its resistance rank to fire is 11, so effects that go by fire never land, and '
    .. 'fire nukes do an eighth of their damage.');
aim(3);
check('and again for the next', rest(1 / 60) == nil);
expect('Water\'s tip', rest(0.2), 'Water. It has extra magic evasion against water, so water spells land less often.');
MOCK.mouse = { 900, 900 };
check('moving off every icon takes the tip away on that frame', rest(1 / 60) == nil);

-- None while a mouse button is down, and after letting go it waits again.
aim(1);
rest(0.2);
MOCK.mouse_down = true;
check('no tip while a mouse button is down', rest(0.2) == nil);
MOCK.mouse_down = false;
check('and after letting go it waits again', rest(0.1) == nil and rest(0.1) == ICE);

-- None while another window that takes the mouse is under it, like the settings window, even with a dropdown open or
-- the caret in a text box there. ImGui only says so with both allow flags.
local allow = bit.bor(ImGuiHoveredFlags_AllowWhenBlockedByPopup, ImGuiHoveredFlags_AllowWhenBlockedByActiveItem);
for _, other in ipairs({ true, 'popup', 'active' }) do
    MOCK.other_window = other;
    local none, flags_ok, any_window = rest(0.3) == nil, true, false;
    for _, flags in ipairs(MOCK.gui.hover_flags) do
        flags_ok = flags_ok and bit.band(flags, allow) == allow;
        any_window = any_window or bit.band(flags, ImGuiHoveredFlags_AnyWindow) ~= 0;
    end
    MOCK.other_window = nil;
    check(('no tip with another window under the mouse (%s), asked with both allow flags'):format(tostring(other)),
        none and flags_ok and any_window and #MOCK.gui.hover_flags == 2, #MOCK.gui.hover_flags);
end
check('and once it\'s gone the tip waits and comes back', rest(0.1) == nil and rest(0.1) == ICE);

-- Holding Shift lets the panel take the mouse, and a tip still shows.
MOCK.shift = true;
frame();
aim(1);
text = rest(0.3);
local panel_hovered = false;
for _, flags in ipairs(MOCK.gui.hover_flags) do panel_hovered = panel_hovered or flags == allow; end
check('holding Shift, with the panel under the mouse taking it, the tip still shows', text == ICE and panel_hovered
    and takes_clicks(), text);
MOCK.shift = false;
frame();

-- Drops and jobs.
run('/checkmate overlayhide elements');
run('/checkmate overlayshow drops');
frame();
aim(1);
expect('a drop says its chance at your Treasure Hunter, here that it always drops', rest(0.2), 'Ice Crystal. It always '
    .. 'drops.');
run('/checkmate overlayhide drops');
run('/checkmate overlayshow job');
MOCK.picture('item', 12511);
MOCK.picture('item', 12514);
frame();
aim(1);
expect('a job says its full name and that it\'s the main job', rest(0.2), 'Warrior, its main job.');
aim(2);
expect('or the support job', rest(0.2), 'Thief, its support job.');
run('/checkmate overlayhide job');

-- The game's interface hidden takes the tip away with the panel, and once it's back the tip waits again.
run('/checkmate overlayshow elements');
frame();
aim(1);
rest(0.2);
MOCK.set_flag('hidden', true);
check('no tip while the panel hides with the game\'s interface', rest(0.2) == nil and not drew());
MOCK.set_flag('hidden', false);
check('and once it\'s back the tip waits again', rest(0.1) == nil and rest(0.1) == ICE);
run('/checkmate overlay off');
run('/checkmate overlay on');
check('turning it off and on with the mouse still there waits again', rest(0.1) == nil and rest(0.1) == ICE);

-- A tip's words are worked out once, the first time it shows.
local real_text, asked = tips.text, 0;
tips.text = function (...)
    asked = asked + 1;
    return real_text(...);
end
retarget(1);
aim(1);
rest(1);
MOCK.mouse = { 900, 900 };
rest(0.2);
aim(1);
check('a tip\'s words are worked out once, however long it shows and when the mouse comes back', rest(0.5) == ICE
    and asked == 1, asked);
-- A second line under the tip is asked every frame the tip shows, since it can change, like an effect's time left.
-- No kind has one yet, so this one is made up.
local real_more, more_asked = tips.more, 0;
tips.more = function ()
    more_asked = more_asked + 1;
    return 'About 1:52 left.';
end
shown_before = MOCK.overlay_tips_shown;
check('a second line shows under the tip, asked once each frame the tip shows', rest(0.5) == ICE .. ' About 1:52 left.'
    and more_asked == 30 and MOCK.overlay_tips_shown == shown_before + 30, more_asked);
tips.more = real_more;
check('and without one the tip is its words alone', rest(1 / 60) == ICE);
-- An icon with nothing to say shows no tip, and is asked once.
tips.text = function ()
    asked = asked + 1;
    return nil;
end
asked = 0;
retarget(1);
aim(1);
shown_before = MOCK.overlay_tips_shown;
check('an icon with nothing to say shows no tip, and is asked once', rest(1) == nil and asked == 1
    and MOCK.overlay_tips_shown == shown_before, asked);
-- A mistake working one out stops the overlay, with nothing left open and no tip drawn.
tips.text = function () error('test tip words'); end
retarget(1);
aim(1);
n = #MOCK.printed;
shown_before = MOCK.overlay_tips_shown;
rest(0.3);
check('a mistake in a tip\'s words stops the overlay once, and draws no tip', stops_since(n) == 1
    and has(table.concat(MOCK.printed_since(n), ' / '), 'test tip words') and MOCK.overlay_tips_shown == shown_before
    and not drew());
tips.text = real_text;
run('/checkmate overlay off');
run('/checkmate overlay on');
-- So does a mistake drawing it, after EndTooltip and every pop ran.
retarget(1);
aim(1);
rest(0.2);
imgui.TextUnformatted = function () error('test tip text'); end
n = #MOCK.printed;
frame();
imgui.TextUnformatted = nil;
local tail = {};
for index = #MOCK.gui.calls - 6, #MOCK.gui.calls do tail[#tail + 1] = MOCK.gui.calls[index]; end
check('a mistake drawing the tip stops the overlay once, after EndTooltip and every pop ran', stops_since(n) == 1
    and has(table.concat(MOCK.printed_since(n), ' / '), 'test tip text') and table.concat(tail, ' ')
    == 'PopTextWrapPos EndTooltip PopStyleVar PopStyleColor PopStyleColor PopStyleVar PopFont', table.concat(tail, ' '));
run('/checkmate overlay off');
run('/checkmate overlay on');
-- A mistake in the panel after its tip was worked out draws no tip.
retarget(1);
aim(1);
rest(0.2);
imgui.GetWindowPos = function () error('test window spot'); end
n, shown_before = #MOCK.printed, MOCK.overlay_tips_shown;
frame();
imgui.GetWindowPos = nil;
check('a mistake later in the panel stops it once and draws no tip that frame', stops_since(n) == 1
    and has(table.concat(MOCK.printed_since(n), ' / '), 'test window spot') and MOCK.overlay_tips_shown == shown_before);
run('/checkmate overlay off');
run('/checkmate overlay on');

-- The chat printout stays the same, byte for byte, with a tip up or Tips on hover off.
run('/checkmate show elements');
retarget(1);
aim(1);
rest(0.2);
local chat_with_tip = chat_of_check();
check('a tip was up while that /check printed', tip_now() ~= nil);
run('/checkmate overlaytips off');
local chat_without = chat_of_check();
run('/checkmate overlaytips on');
check('the chat printout is the same byte for byte with a tip up or Tips on hover off', chat_with_tip == chat_without
    and has(chat_with_tip, 'Ice'), MOCK.plain(chat_with_tip));
run('/checkmate hide elements');
run('/checkmate overlayhide elements');

-- Every icon has a tip. The sample goblin with every part that has icons on, walked one icon at a time, as it is,
-- with Icons only and with badges. Each kind of mark comes up, and no other.
MOCK.target.slot0 = 0;
run('/checkmate');
run('/checkmate school elemental on');
run('/checkmate school ninjutsu on');
for _, part in ipairs({ 'job', 'magic', 'immunities', 'elements', 'drops', 'steal' }) do
    run('/checkmate overlayshow ' .. part);
end
for _, id in ipairs({ 930, 508, 507, 656, 12516, 12511 }) do MOCK.picture('item', id); end
for _, id in ipairs({ 2, 11, 12, 178, 179, 180, 181, 182, 183, 184, 185 }) do MOCK.picture('status', id); end
local kinds = {};
tips.text = function (s, result, kind, id)
    kinds[kind] = true;
    return real_text(s, result, kind, id);
end
for _, setup in ipairs({ {}, { 'overlayiconsonly on' }, { 'overlayiconsonly off', 'overlayelementlook badges' } }) do
    for _, command in ipairs(setup) do run('/checkmate ' .. command); end
    frame();
    local walked, untipped = 0, {};
    while (MOCK.overlay_icon_spot(walked + 1) ~= nil) do
        walked = walked + 1;
        aim(walked);
        local each = rest(0.2);
        if (type(each) ~= 'string' or each == '' or each:sub(-1) ~= '.') then untipped[#untipped + 1] = walked; end
        MOCK.mouse = { 900, 900 };
        frame();
    end
    check(('every icon on the sample goblin has a tip (%s)'):format(setup[#setup] or 'as it is'), walked >= 12
        and #untipped == 0, walked .. ' icons, none for ' .. table.concat(untipped, ', '));
end
local asked_kinds = {};
for kind in pairs(kinds) do asked_kinds[#asked_kinds + 1] = kind; end
table.sort(asked_kinds);
expect('and every kind of mark came up, and no other', table.concat(asked_kinds, ' '),
    'element immunity item job school steal');
tips.text = real_text;
run('/checkmate overlayelementlook game');
for _, part in ipairs({ 'job', 'magic', 'immunities', 'elements', 'drops', 'steal' }) do
    run('/checkmate overlayhide ' .. part);
end
run('/checkmate school elemental off');
run('/checkmate school ninjutsu off');
run('/checkmate');
MOCK.overlay_size, MOCK.mouse = nil, { 0, 0 };
MOCK.target_monster(1, 'Fixture Goblin');
frame();

-- Errors ----------------------------------------------------------------------------------------

-- A mistake working out the readout stops the overlay and says so once. The chat printout keeps going.
MOCK.target_monster(1, 'Fixture Goblin');
frame();
local real_monster = player.monster;
player.monster = function () error('test readout'); end
n = #MOCK.printed;
MOCK.target.slot0 = 5;
for _ = 1, 30 do frame(); end
check('an error working out the readout says so once', stops_since(n) == 1
    and has(MOCK.printed_since(n)[1], 'The overlay stopped after an error: ') and has(MOCK.printed_since(n)[1], 'test readout')
    and has(MOCK.printed_since(n)[1], '. Turn it off and on again to restart it.'), table.concat(MOCK.printed_since(n), ' / '));
check('and draws nothing after', frame() == '' and not drew());
n = #MOCK.printed;
e = check_reply(5, 4, 0);
frame();
check('while the chat /check still prints and hides the game\'s line', has(table.concat(MOCK.printed_since(n), ' / '),
    'Fixture Rabbit (Lv 6)') and e.blocked == true, table.concat(MOCK.printed_since(n), ' / '));
player.monster = real_monster;
run('/checkmate overlay off');
run('/checkmate overlay on');
check('turning it off and on starts it again', has(frame(), 'Fixture Rabbit (Lv 5-6)'), frame());
player.monster = function () error('test readout'); end
n = #MOCK.printed;
MOCK.target.slot0 = 1;
frame();
player.monster = real_monster;
check('and when it stops again', stops_since(n) == 1 and frame() == '');
check('typing overlay on starts it too', has(run('/checkmate overlay on'), 'The overlay now shows')
    and has(frame(), 'Fixture Goblin (Lv 38-40)'), frame());
MOCK.target.slot0 = 5;
frame();

-- A mistake after its window began still ends the window and pops everything, and the settings window still draws.
run('/checkmate');
frame();
local real_begin, real_end, real_calc, inside = imgui.Begin, imgui.End, imgui.CalcTextSize, nil;
imgui.Begin = function (name, ...)
    inside = name;
    return real_begin(name, ...);
end
imgui.End = function ()
    inside = nil;
    return real_end();
end
imgui.CalcTextSize = function (...)
    if (inside == NAME) then error('test layout'); end
    return real_calc(...);
end
n = #MOCK.printed;
MOCK.target.slot0 = 1;
for _ = 1, 30 do frame(); end
check('an error inside its window says so once, with every push popped', stops_since(n) == 1
    and has(table.concat(MOCK.printed_since(n), ' / '), 'test layout'));
check('and the settings window still draws', MOCK.gui.window == 'checkmate##settings' and MOCK.gui.tabs.Display == true
    and not has(table.concat(MOCK.printed_since(n), ' / '), 'Stopped after an error'));
imgui.Begin, imgui.End, imgui.CalcTextSize = nil, nil, nil;
run('/checkmate overlay off');
run('/checkmate overlay on');
run('/checkmate');
check('and it starts again', has(frame(), 'Fixture Goblin'));

-- A mistake in what it notes from the server stops it once, after the chat code has done its work.
local function broken(name)
    local real = overlay[name];
    overlay[name] = function () error('test ' .. name); end
    return function () overlay[name] = real; end;
end
-- Your /check still prints and hides the game's line, and the /checkparam reply still hides.
local restore = broken('on_check');
run('/checkmate show hit');
n = #MOCK.printed;
local hidden = 0;
for _ = 1, 3 do
    e = check_reply(1, 39, 4);
    hidden = hidden + (e.blocked and 1 or 0);
    MOCK.wait(2);
    hidden = hidden + MOCK.reply(500, 50);
    frame();
end
check('a broken /check handler leaves the chat /check printing and hiding', hidden == 3 * 7
    and has(table.concat(MOCK.printed_since(n), ' / '), 'Fixture Goblin (Lv 39)'), hidden);
check('and says so once, and the overlay stops', stops_since(n) == 1 and frame() == '');
run('/checkmate hide hit');
restore();
run('/checkmate overlay off');
run('/checkmate overlay on');
-- A widescan still reaches chat.
restore = broken('on_widescan');
n = #MOCK.printed;
for _ = 1, 3 do widescan(3, 39); frame(); end
row = monsters.find(900, MOCK.mob_id(900, 3));
check('a broken widescan handler leaves chat\'s widescan level', select(1, monsters.level(row, nil, 3)) == 39
    and stops_since(n) == 1 and frame() == '');
restore();
run('/checkmate overlay off');
run('/checkmate overlay on');
-- A death still drops chat's own kept level.
check_reply(1, 39, 4);
row = monsters.find(900, MOCK.mob_id(900, 1));
check('chat keeps the /check level for a charmed pet', select(1, monsters.pet_level(row, 1)) == 39);
restore = broken('on_death');
n = #MOCK.printed;
for _ = 1, 3 do dies(1); frame(); end
check('a broken death handler leaves chat dropping its level', select(1, monsters.pet_level(row, 1)) == 38
    and stops_since(n) == 1 and frame() == '');
restore();
run('/checkmate overlay off');
run('/checkmate overlay on');
-- Zoning still resets the chat side.
run('/checkmate show hit');
restore = broken('on_zone');
n = #MOCK.printed;
check_reply(1, 39, 4);
frame();
zone_to(900);
check('a broken zone handler leaves chat forgetting the zone', monsters.built() == nil);
frame();
check('and the /check waiting for its /checkparam reply gave up', MOCK.reply(500, 50) == 0);
for _ = 1, 3 do zone_to(900); frame(); end
check('and says so once', stops_since(n) == 1 and frame() == '', stops_since(n));
run('/checkmate hide hit');
restore();
run('/checkmate overlay off');
run('/checkmate overlay on');
-- Your stats packet.
restore = broken('on_stats');
n = #MOCK.printed;
for _ = 1, 3 do MOCK.level_up(40); frame(); end
check('a broken stats handler says so once and the overlay stops', stops_since(n) == 1 and frame() == '');
restore();
run('/checkmate overlay off');
run('/checkmate overlay on');
check('and it starts again after all of them', has(frame(), 'Fixture Goblin'), frame());

-- checkmate stopping after an error and starting again makes the overlay forget what it kept.
check_reply(1, 39, 4);
check('a /check it keeps', has(frame(), '| Even Match'));
local real_draw = settings_window.draw;
settings_window.draw = function () error('test frame'); end
run('/checkmate');
n = #MOCK.printed;
frame();
check('checkmate stops after an error in its frame', has(MOCK.printed_since(n)[1], 'Stopped after an error'));
settings_window.draw = real_draw;
check_reply(2, 39, 4);
widescan(1, 40);
frame();
run('/checkmate');
MOCK.target.slot0 = 1;
check('starting it again, the overlay forgot the /check', frame() == 'Fixture Goblin (Lv 38-40) // Aggro: Not aggressive | '
    .. 'Doesn\'t link', frame());
MOCK.target.slot0 = 2;
check('and nothing that came in while it was stopped', has(frame(), 'Fixture Goblin (Lv 38-40)'), frame());

-- Settings and data -----------------------------------------------------------------------------

-- Turning it on loads this zone's data on the next frame. Zoning with it on loads the new zone's.
run('/checkmate overlay off');
zone_to(900);
frame();
check('off, zoning loads no data', monsters.built() == nil);
run('/checkmate overlay on');
check('turning it on loads nothing yet', monsters.built() == nil);
MOCK.target.slot0 = 0;
frame();
check('and loads this zone on the next frame', monsters.built() == 'fixture 900', monsters.built());
zone_to(103);
check('zoning drops it', monsters.built() == nil);
frame();
check('and the frame after loads the new zone', monsters.built() ~= nil and monsters.built() ~= 'fixture 900');
zone_to(900);
frame();

-- A hand-edited settings file is cleaned up.
local o = cur().overlay;
o.font, o.font_size, o.divider, o.opacity, o.wrap, o.separator = 'comic', 99, 'star', -5, 'x', 'a\129\154b';
cur().window.overlay_x, cur().window.overlay_y = 'x', -40;
run('/checkmate overlaylock off');
check('a broken overlay section is cleaned', o.font == 'ashita' and o.font_size == 24 and o.divider == 'pipe' and o.opacity == 0
    and o.wrap == 520 and o.separator == 'ab' and cur().window.overlay_x == 20 and cur().window.overlay_y == 0);
o.font_size, o.opacity, o.wrap = 'x', 'x', 2000;
cur().window.overlay_x = 99999;
run('/checkmate overlaylock off');
check('and words where numbers go become the defaults', o.font_size == 16 and o.opacity == 80 and o.wrap == 1600
    and cur().window.overlay_x == overlay.SPOT_MAX, o.font_size);
o.font_size = 0 / 0;
run('/checkmate overlaylock off');
check('and a font size of 0/0 becomes 16 too', o.font_size == 16, o.font_size);
o.wrap, o.separator = 520, '  ';
run('/checkmate overlayspot reset');
check('the overlay still draws', retarget(1) ~= '');

-- Turning it off draws nothing and reads nothing again.
run('/checkmate overlay off');
MOCK.reads, MOCK.entity_reads, MOCK.player_entity_calls, MOCK.shift_reads, MOCK.input_checks = 0, 0, 0, 0, 0;
MOCK.shift = true;
for _ = 1, 30 do frame(); end
MOCK.shift = false;
check('off again, it reads and draws nothing', MOCK.reads == 0 and MOCK.entity_reads == 0 and MOCK.player_entity_calls == 0
    and not drew());
check('and never asks about Shift or the chat line, even with Shift held', MOCK.shift_reads == 0 and MOCK.input_checks == 0);
check('and no font ever loaded outside the load event', #MOCK.stray_font_loads() == 0);
check('and every picture loaded with the arguments the real call takes', MOCK.bad_texture_calls == 0
    and MOCK.texture_loads > 0, MOCK.bad_texture_calls);

return MOCK.report();
