-- Manual output must not sit beside a second game line from an automatic check.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local details = require('core.check_details');
local target = require('core.target');
local overlay = require('ui.overlay');

local function visible()
    return MOCK.gui.flags['##checkmate_overlay'] ~= nil;
end

local function setup(chat, replace)
    for id, part in pairs(s.printout.parts) do
        part.on = chat and (id == 'name' or id == 'hit' or id == 'aggro');
    end
    for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'name'; end
    s.printout.replace_game_line = replace;
    s.printout.extras_own_line = true;
    s.printout.divider = 'spaces';
    s.overlay.on, s.overlay.only_checked, s.overlay.icons = true, true, false;
    MOCK.zone_in(900);
    MOCK.target_monster(1, 'Fixture Goblin');
    overlay.changed(s);
    MOCK.frame();
    return #MOCK.printed, #MOCK.commands;
end

local function request(injected, index)
    MOCK.fire('packet_out', MOCK.check_request(index or 1, injected));
end

local function reply(level, index)
    return MOCK.packet(MOCK.check_reply(index or 1, level or 39, 4, 178));
end

for _, automatic_first in ipairs({ true, false }) do
    local order = automatic_first and 'automatic first' or 'manual first';
    local printed, commands = setup(true, true);
    check(order .. ': an unchecked target starts hidden', not visible() and target.current() == nil);
    request(automatic_first);
    request(not automatic_first);
    local first = reply(automatic_first and 40 or 39);
    MOCK.frame();
    if (automatic_first) then
        check(order .. ': an automatic reply leaves the checked-only overlay hidden', not visible() and target.current() == nil);
        expect(order .. ': an automatic reply creates no saved details', details.current(), nil);
        expect(order .. ': an automatic reply prints no Checkmate lines', #MOCK.printed, printed);
    end
    local second = reply(automatic_first and 39 or 40);
    expect(order .. ': the first native check line is hidden', first.blocked, true);
    expect(order .. ': the second native check line is hidden', second.blocked, true);
    MOCK.frame();
    check(order .. ': the overlay keeps the manual level', visible() and target.current() ~= nil and target.current().low == 39);
    MOCK.wait(1.6);
    check(order .. ': only the manual check requests stats', #MOCK.commands == commands + 1
        and MOCK.commands[#MOCK.commands].command == '/checkparam <me>');
    expect(order .. ': the manual stat response is hidden', MOCK.reply(300, 250), 6);
    MOCK.frame();
    local saved = details.current();
    check(order .. ': saved details keep the manual level and stats', saved ~= nil and saved.low == 39
        and saved.hit ~= nil and saved.hit.low == 95);
    local lines = MOCK.printed_since(printed);
    expect(order .. ': exactly the three selected chat rows print', #lines, 3);
    local chat = table.concat(lines, '\n');
    check(order .. ': chat contains the manual level and no automatic level', chat:find('Fixture Goblin (Lv 39)', 1, true)
        and not chat:find('Lv 40', 1, true));
end

-- Packet consumers can run on either side of Checkmate and can block the packet too.
for _, blocked_first in ipairs({ true, false }) do
    local order = blocked_first and 'external blocker first' or 'Checkmate first';
    local printed, commands = setup(true, true);
    request(true);
    local automatic = MOCK.check_reply(1, 40, 4, 178);
    if (blocked_first) then automatic.blocked = true; end
    MOCK.events.packet_in.checkmate_packet_in(automatic);
    expect(order .. ': Checkmate leaves the automatic game line hidden', automatic.blocked, true);
    if (not blocked_first) then automatic.blocked = true; end
    MOCK.frame();
    expect(order .. ': the automatic reply emits no Checkmate chat', #MOCK.printed, printed);
    expect(order .. ': the automatic reply requests no stats', #MOCK.commands, commands);
    expect(order .. ': the automatic reply creates no saved details', details.current(), nil);
    check(order .. ': the automatic reply does not reveal the checked-only overlay', not visible() and target.current() == nil);
end

local printed, commands = setup(true, true);
request(true);
expect('an automatic check alone hides its native line with replacement on', reply(40).blocked, true);
MOCK.wait(2);
expect('an automatic check alone emits no Checkmate chat', #MOCK.printed, printed);
expect('an automatic check alone sends no stat request', #MOCK.commands, commands);
expect('an automatic check alone creates no saved details', details.current(), nil);
check('an automatic check alone cannot reveal the checked-only overlay', not visible() and target.current() == nil);

request(true, 400);
local impossible = MOCK.packet(MOCK.check_reply(400, 0, nil, 249));
expect('an automatic impossible-to-gauge reply is also hidden with replacement on', impossible.blocked, true);
MOCK.frame();
expect('an automatic impossible-to-gauge reply does not print Checkmate details', #MOCK.printed, printed);

printed, commands = setup(true, false);
request(true);
expect('replacement off keeps an automatic game line visible', reply(40).blocked, false);
MOCK.frame();
expect('replacement off still prints no automatic Checkmate lines', #MOCK.printed, printed);
request(false);
expect('replacement off keeps the manual game line visible', reply(39).blocked, false);
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
check('replacement off still prints manual Checkmate details', #MOCK.printed == printed + 3
    and details.current() ~= nil and details.current().low == 39);
expect('replacement off still requests stats only for the manual check', #MOCK.commands, commands + 1);

printed, commands = setup(false, true);
request(true);
expect('overlay-only leaves an automatic game line visible', reply(40).blocked, false);
MOCK.frame();
check('overlay-only still waits for a manual check', not visible() and target.current() == nil);
request(false);
expect('overlay-only leaves the manual game line visible', reply(39).blocked, false);
MOCK.frame();
check('overlay-only shows the manually checked monster', visible() and target.current() ~= nil and target.current().low == 39);
expect('overlay-only emits no Checkmate chat', #MOCK.printed, printed);
expect('a name-only overlay needs no stat request', #MOCK.commands, commands);

printed, commands = setup(true, true);
expect('an unmatched reply keeps its game line', reply(40).blocked, false);
request(false);
local injected = MOCK.check_reply(1, 40, 4, 178);
injected.injected = true;
expect('an injected incoming reply is left alone', MOCK.packet(injected).blocked, false);
local other_player = MOCK.message_packet(2002, MOCK.mob_id(900, 1), 40, 68, 178, 1);
expect('another player\'s reply is left alone', MOCK.packet(other_player).blocked, false);
local unrelated = MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(900, 1), 40, 68, 179, 1);
expect('an unrelated battle message is left alone', MOCK.packet(unrelated).blocked, false);
MOCK.frame();
expect('unmatched and unrelated replies emit no Checkmate chat', #MOCK.printed, printed);
expect('unmatched and unrelated replies send no stat request', #MOCK.commands, commands);
check('unmatched and unrelated replies leave manual details and overlay empty', details.current() == nil
    and not visible() and target.current() == nil);
expect('unrelated replies do not consume the pending manual check', reply(39).blocked, true);
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.frame();
check('the real manual reply still produces its details', #MOCK.printed == printed + 3
    and details.current() ~= nil and details.current().low == 39);
expect('the real manual reply still makes one stat request', #MOCK.commands, commands + 1);

return MOCK.report();
