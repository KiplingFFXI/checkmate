local effects = require('core.effects');
local me, other = MOCK.player.server_id, 2001;
local mob, second = MOCK.mob_id(103, 17), MOCK.mob_id(103, 18);

local function reset()
    effects.forget();
    MOCK.now = 100;
    MOCK.player.pet_index = 0;
end

local function action(category, id, status, message, actor, target)
    effects.on_action(MOCK.action_packet(actor or me, category, id, target or mob,
        { { message = message or 236, param = status } }), me);
end

local function report(status, actor, target)
    effects.on_message(actor or me, target or mob, status, 203, me);
end

local function entry(status, target)
    effects.take_in(MOCK.now);
    for _, each in ipairs(effects.readout(target or mob, 'both', MOCK.now) or {}) do
        if (each.effect == status) then return each; end
    end
end

reset();
for n = 0, 6 do
    action(4, 266 + n, 136 + n, 329 + n);
    local each = entry(136 + n);
    check('Absorb stat ' .. n .. ' is observed', each ~= nil);
    expect('Absorb stat ' .. n .. ' has era duration', each and each.ends, MOCK.now + 90);
end
reset();
action(4, 266, 136, 75);
expect('resisted Absorb never lands', entry(136), nil);
action(4, 266, 136, 329);
local deadline = entry(136).ends;
MOCK.now = 110;
action(4, 266, 136, 75);
expect('failed Absorb never refreshes', entry(136).ends, deadline);

reset();
report(148);
expect('standard status report confirms the debuff', entry(148).inferred, false);
expect('standard status report does not supply duration', entry(148).ends, nil);
expect('standard status keeps the actual actor', entry(148).from, me);

reset();
for _, status in ipairs({ 146, 147, 148, 149 }) do report(status); end
for _, status in ipairs({ 146, 147, 148, 149 }) do
    check('each status has its own observation ' .. status, entry(status) ~= nil);
    expect('each status has an unknown duration ' .. status, entry(status).ends, nil);
end
effects.on_message(me, mob, 148, 206, me);
expect('wear-off removes only the named status', entry(148), nil);
check('other Full Break statuses remain', entry(149) ~= nil);

reset();
action(4, 604, 100, 2);
report(2);
report(11);
check('Sleep report after applying damage stays', entry(2) ~= nil);
check('Bind report after applying damage stays', entry(11) ~= nil);
action(1, 0, 25, 1, other);
expect('later independent damage clears Sleep', entry(2), nil);
expect('later independent damage clears Bind', entry(11), nil);
action(4, 253, 0, 75);
expect('failed spell cannot resurrect an earlier report', entry(2), nil);

reset();
report(10);
action(4, 252, 0, 75);
expect('unrelated resisted spell cannot assign a report duration', entry(10).ends, nil);
report(13, other);
expect('legacy report has unknown duration', entry(13).ends, nil);
expect('legacy report is not yours', entry(13).mine, false);
expect('legacy report has unknown basis', entry(13).basis, 'unknown');

reset();
action(4, 576, 2);
expect('Yawn uses its own source duration', entry(2).ends, 190);
report(2);
expect('standalone report makes no duration claim', entry(2).ends, nil);
action(4, 561, 149);
expect('Frightful Roar has a spell-specific duration', entry(149).ends, 280);
action(3, 80, 148);
expect('player Shield Break uses its player source baseline', entry(148).ends, 280);

reset();
local pet = MOCK.pet_id(0x700);
MOCK.player.pet_index = 0x700;
MOCK.entities[0x700] = { ServerId = pet };
action(11, 1947, 156, 236, pet);
expect('automaton Flashbulb uses 12 seconds', entry(156).ends, 112);
action(11, 1947, 156, 236, second, second);
expect('monster Flashbulb keeps its own 15 seconds', entry(156, second).ends, 115);
MOCK.player.pet_index = 0;
MOCK.entities[0x700].SpawnFlags = 0x10;
action(11, 1947, 156, 236, pet);
expect('dynamic monster does not use an automaton timer', entry(156).ends, 115);
MOCK.entities[0x700].SpawnFlags = 0;
action(11, 1947, 156, 236, pet);
expect('ambiguous foreign dynamic actor has unknown duration', entry(156).ends, nil);
report(156, pet);
expect('foreign pet status report needs no guessed source', entry(156).ends, nil);

reset();
action(13, 658, 2, 266, pet);
report(2, pet);
report(2, pet);
action(4, 220, 3);
MOCK.now = 104;
check('report retains observed Nightmare deep sleep', entry(2) ~= nil);
reset();
action(4, 24, 0, 2);
report(134);
report(134);
action(4, 230, 0, 2);
expect('report retains observed Dia II priority', entry(135), nil);
expect('reported Dia II duration remains unknown', entry(134).ends, nil);

reset();
report(13, me, mob);
report(13, other, second);
expect('targets keep independent source actors', entry(13, second).from, other);
effects.on_entity(MOCK.entity_packet(mob, 0x30));
expect('despawn clears reported state', entry(13), nil);
effects.on_message(other, second, 0, 6, me);
expect('death clears reported state', entry(13, second), nil);
report(13);
effects.on_zone();
expect('zone clears reported state', entry(13), nil);
reset();
effects.on_message(me, mob, 0, 203, me);
effects.on_message(me, mob, 1024, 203, me);
effects.on_message(me, me, 13, 203, me);
effects.take_in(MOCK.now);
expect('invalid statuses and player targets are ignored', effects.has(mob), false);
local reads = MOCK.reads;
for _ = 1, 10000 do effects.take_in(MOCK.now); end
expect('idle tracker performs no client reads', MOCK.reads, reads);

return MOCK.report();
