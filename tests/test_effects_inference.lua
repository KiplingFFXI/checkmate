local effects = require('core.effects');
local data = require('data.effects');
local me, other = MOCK.player.server_id, 2001;
local mob, second = MOCK.mob_id(103, 17), MOCK.mob_id(103, 18);

local function reset()
    effects.forget();
    MOCK.now = 100;
    MOCK.player.pet_index = 0;
end

local function action(category, id, damage, message, target, added, actor)
    effects.on_action(MOCK.action_packet(actor or me, category, id, target or mob,
        { { message = message or 185, param = damage, added = added } }), me);
end

local function entry(status, target)
    effects.take_in(MOCK.now);
    for _, each in ipairs(effects.readout(target or mob, 'both', MOCK.now) or {}) do
        if (each.effect == status) then return each; end
    end
end

reset();
action(3, 80, 25);
local shield = entry(148);
check('positive Shield Break damage creates an estimate', shield ~= nil);
expect('Shield Break estimate is marked', shield and shield.inferred, true);
expect('Shield Break baseline uses Phoenix 1000 TP duration', shield and shield.ends, 280);
expect('Shield Break exposes the TP assumption', shield and shield.default_tp, 1000);
expect('Shield Break exposes the TP timer basis', shield and shield.basis, 'tp_default');
local version = effects.version(mob);
MOCK.now = 110;
action(3, 80, 50);
expect('another inferred hit does not refresh the timer', entry(148).ends, 280);
expect('another inferred hit does not rebuild the readout', effects.version(mob), version);
action(3, 80, 148, 236);
expect('an explicit result confirms the estimate', entry(148).inferred, false);
expect('an explicit result uses its new observation time', entry(148).ends, 290);
MOCK.now = 120;
action(3, 80, 50);
expect('inference cannot downgrade a confirmed effect', entry(148).inferred, false);
expect('inference cannot refresh a confirmed effect', entry(148).ends, 290);

for _, result in ipairs({ { 185, 0 }, { 188, 25 }, { 75, 25 }, { 85, 25 }, { 284, 25 } }) do
    reset();
    action(3, 80, result[2], result[1]);
    expect('no inference from result ' .. result[1] .. ' with value ' .. result[2], entry(148), nil);
end
reset();
action(7, 80, 25);
expect('readying a weapon skill does not infer its status', entry(148), nil);

reset();
action(3, 80, 148, 236);
MOCK.now = 110;
action(3, 87, 50);
for _, status in ipairs({ 146, 147, 148, 149 }) do
    local each = entry(status);
    check('Full Break tracks each eligible status ' .. status, each ~= nil);
    expect('Full Break preserves per-status certainty ' .. status, each and each.inferred, status ~= 148);
    expect('Full Break preserves per-status timer ' .. status, each and each.ends, status == 148 and 280 or 290);
end

reset();
action(3, 80, 25, 185, nil, { message = 160, param = 148 });
expect('matching additional-effect success remains confirmed', entry(148).inferred, false);
reset();
action(3, 80, 25, 185, nil, { message = 163, param = 5 });
expect('an unrelated additional damage result does not suppress the estimate', entry(148).inferred, true);

reset();
effects.on_action(MOCK.action_packet_multi(me, 3, 80, {
    { id = mob, results = { { message = 185, param = 20 }, { message = 185, param = 15 } } },
    { id = second, results = { { message = 188, param = 0 } } },
}), me);
expect('multiple hits produce one estimate', #(effects.readout(mob, 'both', MOCK.now) or {}), 0);
check('positive target is tracked after the frame', entry(148) ~= nil);
expect('missed AoE target stays untracked', entry(148, second), nil);
expect('multiple hits produce only one status', #effects.readout(mob, 'both', MOCK.now), 1);

reset();
action(4, 604, 20, 2);
for _, status in ipairs({ 3, 4, 5, 6, 11, 12, 13 }) do
    local each = entry(status);
    expect('Bad Breath infers the reviewed secondary status ' .. status, each and each.inferred, true);
end
reset();
action(4, 576, 20, 2);
expect('a no-damage spell row has no damage inference', entry(2), nil);
action(4, 596, 20, 2);
expect('Pinecone Bomb can infer Sleep after its own damage', entry(2).inferred, true);
expect('unknown conditional duration remains unknown', entry(2).ends, nil);
action(1, 0, 20, 1, nil, nil, other);
expect('later observed damage removes inferred Sleep', entry(2), nil);

reset();
action(3, 80, 25);
effects.on_message(me, mob, 148, 203, me);
expect('ordinary status message confirms an estimate', entry(148).inferred, false);
expect('ordinary status message does not invent a timer', entry(148).ends, nil);
effects.on_message(me, mob, 148, 206, me);
expect('ordinary wear-off removes the tracked effect', entry(148), nil);

reset();
action(3, 46, 20, 110);
expect('physical job ability uses its own inference row', entry(10).inferred, true);
expect('Shield Bash uses the exported upper duration', entry(10).ends, 108);
reset();
local pet = MOCK.pet_id(0x700);
MOCK.player.pet_index = 0x700;
MOCK.entities[0x700] = { ServerId = pet };
action(11, 1944, 20, 185, nil, nil, pet);
expect('own automaton Shield Bash can infer Stun', entry(10).inferred, true);
expect('automaton Stun uses its own duration', entry(10).ends, 106);
expect('conditional Hammermill Slow is not inferred', entry(13), nil);
reset();
action(11, 1944, 20, 185, nil, nil, pet);
expect('an unidentified foreign pet does not borrow automaton inference', entry(10), nil);
action(13, 528, 20, 317, nil, nil, pet);
expect('explicit pact namespace can infer Moonlit Charge Blind', entry(5).inferred, true);
expect('pact inference uses its source duration', entry(5).ends, 160);
reset();
MOCK.player.pet_index = 0x700;
action(11, 3854, 20, 185, nil, nil, pet);
expect('verified pet alias can infer Brain Crush Silence', entry(6).inferred, true);
expect('pet alias keeps the source duration', entry(6).ends, 130);

-- Exercise uncertainty rules without relying on unrelated source actions.
data.weaponskills[999] = { by_effect = {
    [3] = { effect = 3, seconds = 60, infer = 'damage' },
    [4] = { effect = 4, seconds = 60 },
} };
data.weaponskills[998] = { effect = 80, seconds = 60, infer = 'damage' };
reset();
action(3, 999, 10);
expect('multi-effect inference uses each child flag', entry(3).inferred, true);
expect('unflagged child is not inferred', entry(4), nil);
action(4, 253, 2, 236);
MOCK.now = 104;
check('inferred poison cannot shorten confirmed Sleep', entry(2) ~= nil);
action(4, 220, 3, 236);
MOCK.now = 108;
expect('confirmed poison can shorten confirmed Sleep', entry(2), nil);
reset();
action(4, 266, 136, 329);
local absorb_end = entry(136).ends;
action(3, 998, 10);
expect('inferred replacement cannot remove a confirmed effect', entry(136).ends, absorb_end);
expect('inferred conflicting effect is not added', entry(80), nil);

reset();
for status = 800, 863 do effects.on_message(me, mob, status, 203, me); end
effects.take_in(MOCK.now);
local full_version = effects.version(mob);
action(3, 80, 25);
expect('an estimate cannot evict a full list of observations', entry(148), nil);
expect('a full list keeps all confirmed observations', #effects.readout(mob, 'both', MOCK.now), 64);
expect('ignored full-list estimate does not change the version', effects.version(mob), full_version);

reset();
for index = 1, 48 do effects.on_message(me, MOCK.mob_id(103, index), 148, 203, me); end
effects.take_in(MOCK.now);
local fresh = MOCK.mob_id(103, 49);
action(3, 80, 25, 185, fresh);
expect('a new estimate cannot evict a tracked monster', entry(148, fresh), nil);
for index = 1, 48 do
    check('confirmed monster remains at capacity ' .. index, entry(148, MOCK.mob_id(103, index)) ~= nil);
end
effects.on_message(me, MOCK.mob_id(103, 1), 148, 206, me);
action(3, 80, 25, 185, fresh);
check('explicit removal makes an empty slot available to an estimate', entry(148, fresh) ~= nil);
check('reclaiming an empty slot preserves another confirmed monster', entry(148, MOCK.mob_id(103, 2)) ~= nil);

reset();
for index = 1, 48 do action(3, 80, 25, 185, MOCK.mob_id(103, index)); end
effects.take_in(MOCK.now);
MOCK.now = 281;
action(3, 80, 25, 185, fresh);
local after_gap = entry(148, fresh);
check('expired slots are reclaimed before a queued estimate after a missed frame', after_gap ~= nil);
expect('the new estimate starts at the new action time', after_gap and after_gap.ends, 461);
expect('old estimates expired without a separate earlier frame', effects.has(MOCK.mob_id(103, 2)), false);

reset();
action(3, 80, 25);
effects.take_in(MOCK.now);
MOCK.now = 281;
action(3, 80, 25);
expect('expired same-target estimate can start again after a missed frame', entry(148).ends, 461);

reset();
action(3, 80, 25);
entry(148);
MOCK.now = 281;
expect('inferred duration expires normally', entry(148), nil);
reset();
action(3, 80, 25);
effects.on_entity(MOCK.entity_packet(mob, 0x30));
expect('despawn clears a queued estimate', entry(148), nil);
action(3, 80, 25);
effects.on_message(other, mob, 0, 6, me);
expect('death clears a queued estimate', entry(148), nil);
action(3, 80, 25);
effects.on_zone();
expect('zone clears a queued estimate', entry(148), nil);
local reads, commands = MOCK.reads, #MOCK.commands;
for _ = 1, 10000 do effects.take_in(MOCK.now); end
expect('idle inference tracker reads no client state', MOCK.reads, reads);
expect('inference sends no game commands', #MOCK.commands, commands);

return MOCK.report();
