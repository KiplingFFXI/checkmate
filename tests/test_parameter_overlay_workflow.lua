-- Player parameter requests start with a manual check, never a passive overlay update.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local target = require('core.target');
local ROWS = { 'hit', 'offhand', 'ranged', 'evade' };
local function has(text, value) return text:find(value, 1, true) ~= nil; end
local function text() return table.concat(MOCK.overlay_lines(), ' / '); end
local function known(id)
    local result = target.current();
    return result and result[id] and type(result[id].low) == 'number' and type(result[id].high) == 'number';
end
local function unknown(ids)
    for _, id in ipairs(ids or ROWS) do if (known(id)) then return false; end end
    return true;
end
local function setup(rows, chat)
    MOCK.command('/checkmate overlay off');
    if (MOCK.player.pet_index ~= 0) then MOCK.dismiss(); end
    MOCK.player.main_job, MOCK.player.main_level, MOCK.player.sub_job, MOCK.player.sub_level = 13, 40, 1, 20;
    MOCK.player.buffs, MOCK.player.stat_mods = {}, {};
    MOCK.player.stats[1], MOCK.player.stats[3] = 70, 65;
    MOCK.player.hp, MOCK.player.hp_max, MOCK.player.tp = 1000, 1000, 0;
    MOCK.items[10], MOCK.items[11], MOCK.items[12], MOCK.items[13] = { Skill = 3 }, { Skill = 2 }, { Skill = 25 }, { Skill = 0 };
    MOCK.player.equipment = { [0] = 10, [1] = 11, [2] = 12, [3] = 13 };
    MOCK.zone_in(900);
    for _, part in pairs(s.printout.parts) do part.on = false; end
    for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
    for _, id in ipairs(chat or {}) do s.printout.parts[id].on = true; end
    for _, id in ipairs(rows or ROWS) do s.overlay.parts[id] = true; end
    s.printout.replace_game_line, s.printout.header = false, false;
    s.overlay.parts.name, s.overlay.remember = true, true;
    MOCK.target_monster(1, 'Fixture Goblin');
    MOCK.monster(2, 'Fixture Goblin');
    MOCK.command('/checkmate overlay on');
    MOCK.frame();
    MOCK.commands = {};
end
local function manual(index)
    MOCK.packet(MOCK.check_packet(index or 1, 39, 4, 174));
end
local function send(index, command)
    local count = #MOCK.commands;
    manual(index);
    MOCK.wait(1.4);
    expect('manual request retains the 1.5 second delay', #MOCK.commands, count);
    MOCK.wait(0.2);
    check('manual check sends exactly one serialized parameter request', #MOCK.commands == count + 1
        and MOCK.commands[#MOCK.commands].command == (command or '/checkparam <me>') and MOCK.commands[#MOCK.commands].mode == 1);
end
local function reply()
    local hidden = 0;
    for _, packet in ipairs(MOCK.checkparam_packets(300, 250, nil, 150, 165)) do
        if (MOCK.packet(packet).blocked) then hidden = hidden + 1; end
    end
    return hidden;
end

for _, id in ipairs(ROWS) do
    setup({ id });
    MOCK.wait(2);
    check(id .. ' is unknown before any manual check', unknown({ id }) and #MOCK.commands == 0);
    local printed = #MOCK.printed;
    send();
    expect(id .. ' uses and hides only its own six reply lines', reply(), 6);
    MOCK.frame();
    check(id .. ' alone can populate its overlay estimate', known(id));
    expect(id .. ' overlay selection adds no chat row', #MOCK.printed, printed);
    MOCK.wait(4);
    expect(id .. ' does not request a passive refresh', #MOCK.commands, 1);
end

setup();
MOCK.wait(2);
check('all four rows remain unknown before a manual check', unknown());
send(); reply(); MOCK.frame();
check('one complete reply populates all four overlay rows', known('hit') and known('offhand') and known('ranged') and known('evade'));
local original = target.current();
local observed_at = original.provenance and original.provenance.parameter_at;
MOCK.wait(0.6);
check('quiet overlay frames keep the reading time', observed_at ~= nil
    and target.current().provenance.parameter_at == observed_at);
expect('all four rows share one request', #MOCK.commands, 1);
MOCK.player.tp = 1000; MOCK.wait(0.3);
check('TP changes keep the observed numbers with conditional-bonus uncertainty', known('hit') and known('offhand')
    and known('ranged') and known('evade') and target.current().hit.uncertain and target.current().evade.uncertain
    and #(target.current().hit.notes or {}) > 0);
expect('conditional uncertainty does not issue a refresh request', #MOCK.commands, 1);
MOCK.target.slot0 = 2; MOCK.wait(0.3);
check('a passive switch cannot borrow another monster check', unknown());
expect('a passive target switch sends no request', #MOCK.commands, 1);
MOCK.target.slot0 = 1; MOCK.wait(0.3);
check('returning to the same checked monster may reuse its valid snapshot', known('hit') and known('evade'));
MOCK.player.stats[1] = 71; MOCK.wait(0.3);
check('changed accuracy inputs retain the last estimate with a refresh note', known('hit') and known('evade')
    and target.current().hit.retained and target.current().evade.retained);
expect('invalidation never sends a request by itself', #MOCK.commands, 1);

setup(); send();
MOCK.player.stats[3] = 66;
reply(); MOCK.frame();
check('AGI changing while a reply is pending cannot establish new parameters', unknown());

setup(); send();
MOCK.player.equipment[0] = 11;
manual();
local sent = #MOCK.commands;
reply(); MOCK.frame();
expect('a replacement check uses the already sent request', #MOCK.commands, sent);
check('a replacement keeps the original request signature rather than the newer gear', unknown());

setup(); send();
MOCK.target.slot0 = 2;
manual(2);
reply(); MOCK.frame();
check('a same-input replacement can use the shared player reply for its own monster', known('hit')
    and target.current().id == MOCK.mob_id(900, 2));
expect('same-input replacement sends no duplicate request', #MOCK.commands, 1);
MOCK.target.slot0 = 1; MOCK.wait(0.3);
check('the replaced check does not gain the newer check response', unknown());
expect('the replaced check no longer claims a pending reply', target.current().provenance.parameter_state, 'unavailable');
check('the replaced check explains how to refresh it', has(target.current().provenance.parameter_reason,
    'Check this monster again.'));

setup({ 'pdif' }); send(); reply(); MOCK.frame();
check('a pDIF-only request has finished before enabling hit chance', not require('core.checkparam').is_active());
MOCK.command('/checkmate overlayshow hit'); MOCK.frame();
expect('enabling Hit after a pDIF-only reply does not claim it is waiting', target.current().provenance.parameter_state,
    'not_requested');
check('Hit stays unknown until a matching manual check', unknown({ 'hit' }));
expect('enabling Hit does not send a fresh request', #MOCK.commands, 1);

do
    local overlay = require('ui.overlay');
    local original_check, tokens = overlay.on_check, {};
    overlay.on_check = function(...)
        tokens[#tokens + 1] = select(8, ...);
        return original_check(...);
    end;
    setup({ 'hit' }); send();
    manual(); reply(); MOCK.frame();
    check('same-target replacement receives its own newer token', #tokens == 2 and tokens[2] > tokens[1]);
    check('cancelling the older same-target check does not clear the completed replacement', known('hit')
        and target.current().provenance.parameter_state == 'received');
    local received_at = target.current().provenance.parameter_at;
    target.on_parameters(1, MOCK.mob_id(900, 1), tokens[1], nil, 'The older request ended.');
    MOCK.frame();
    check('a late old-token cancellation cannot replace the newer snapshot', known('hit')
        and target.current().provenance.parameter_state == 'received'
        and target.current().provenance.parameter_at == received_at);
    expect('same-target replacement shares its one in-flight request', #MOCK.commands, 1);
    overlay.on_check = original_check;
end

setup(); send();
reply();
MOCK.player.buffs = { 56 };
MOCK.frame();
check('a change between reply receipt and overlay build discards the numbers', unknown());

setup(); send();
MOCK.player.hp = 500;
reply(); MOCK.frame();
check('HP changes during a request keep a qualified rather than fabricated exact estimate', known('hit')
    and target.current().hit.uncertain and target.current().evade.uncertain);

setup(); send();
MOCK.packet(MOCK.entity_packet(MOCK.mob_id(900, 1), 0x30, 1));
MOCK.frame();
MOCK.target_monster(1, 'Fixture Goblin');
reply(); MOCK.frame();
check('a reply for a disappeared check cannot populate a replacement at the same identity', unknown());

setup(); send();
local packets = MOCK.checkparam_packets(300, 250, nil, 150, 165);
for _, index in ipairs({ 1, 2, 3, 6 }) do MOCK.packet(packets[index]); end
MOCK.frame();
check('a completed partial reply only supplies the fields it actually received', known('hit') and known('evade')
    and unknown({ 'offhand', 'ranged' }));

setup(nil, { 'hit' }); send();
packets = MOCK.checkparam_packets(300, 250, nil, 150, 165);
local printed = #MOCK.printed;
for index = 1, 3 do MOCK.packet(packets[index]); end
MOCK.wait(3.2);
check('an incomplete timed-out reply never publishes an overlay snapshot', unknown());
check('existing chat may still use its received partial accuracy', has(table.concat(MOCK.printed_since(printed), ' / '), 'Hit: 95%'));

setup(); send(); reply(); MOCK.frame();
check('a preceding successful reading exists for the next timeout case', known('hit'));
send();
MOCK.wait(3.2);
check('a new check timeout cannot reuse the preceding successful reading', unknown());
expect('a late reply after timeout is visible', reply(), 0);
MOCK.frame();
check('a late unowned reply cannot populate the overlay', unknown());
expect('timeout and late reply do not retry automatically', #MOCK.commands, 2);

setup({}, { 'hit' });
send(); reply(); MOCK.frame();
check('a chat-only numeric choice does not add an overlay row', not has(text(), 'Hit:')
    and not s.overlay.parts.hit and s.printout.parts.hit.on);
setup();
for _, id in ipairs(ROWS) do s.overlay.parts[id] = false; end
MOCK.command('/checkmate overlay off');
manual(); MOCK.wait(5);
expect('with both displays off a manual check sends no parameter request', #MOCK.commands, 0);

for _, pet in ipairs({ { job = 14, name = 'Azure', kind = 'wyvern' }, { job = 18, name = 'Automaton', kind = 'automaton' },
    { job = 9, name = 'CourierCarrie', kind = 'jug' } }) do
    setup({ 'pet' });
    MOCK.player.main_job = pet.job;
    MOCK.summon(pet.name);
    MOCK.wait(0.3);
    check(pet.kind .. ' overlay waits for a manual check', target.current().pet ~= nil
        and target.current().pet.hit == nil and #MOCK.commands == 0);
    local chat_before = #MOCK.printed;
    send(nil, '/checkparam <pet>');
    expect(pet.kind .. ' hides its five requested reply lines', MOCK.pet_reply(150, 140), 5);
    MOCK.frame();
    local shown = target.current().pet;
    check(pet.kind .. ' overlay-only manual check fills pet estimates', shown and shown.hit and shown.evade
        and shown.parameter_state == 'checked');
    check(pet.kind .. ' needs no player request or chat row', #MOCK.commands == 1
        and MOCK.commands[1].command == '/checkparam <pet>' and #MOCK.printed == chat_before);
    MOCK.wait(2);
    expect(pet.kind .. ' passive frames do not refresh pet parameters', #MOCK.commands, 1);
end
setup({ 'pet' });
MOCK.player.main_job = 14;
MOCK.summon('Azure'); MOCK.wait(0.3);
send(nil, '/checkparam <pet>');
MOCK.pet_reply(150, 140); MOCK.frame();
send(nil, '/checkparam <pet>');
MOCK.wait(3.2);
check('a new manual check prevents an older pet reading from surviving a timeout', target.current().pet
    and target.current().pet.hit == nil and target.current().pet.parameter_state == 'unknown');
expect('late pet reply after timeout stays visible', MOCK.pet_reply(150, 140), 0);
MOCK.frame();
check('late pet reply cannot restore the old check token', target.current().pet.hit == nil);
setup({ 'pet' });
MOCK.player.main_job = 15;
MOCK.summon('Carbuncle'); MOCK.wait(0.3);
manual(); MOCK.wait(5);
check('the existing avatar exclusion does not create a parameter request', target.current().pet == nil and #MOCK.commands == 0);
return MOCK.report();
