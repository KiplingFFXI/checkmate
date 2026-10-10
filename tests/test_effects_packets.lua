-- Action packet boundaries, variable blocks, and the fields the Effects tracker reads.
local packets = require('core.packets');
local me, mob = MOCK.player.server_id, MOCK.mob_id(103, 17);
local rows = {};
local e = MOCK.action_packet(me, 4, 58, mob, { { message = 236, param = 4 } });
expect('action category', packets.action_category(e), 4);
local actor, action = packets.action_head(e);
expect('action actor', actor, me);
expect('action id', action, 58);
expect('first target', packets.action_target(e), mob);
expect('one result', packets.action_results(e, rows, 0x1000000), 1);
expect('result target', rows[1].target, mob);
expect('result message', rows[1].message, 236);
expect('result effect', rows[1].param, 4);
expect('no extra message', rows[1].added, 0);

-- An ignored player still has all its variable blocks skipped before the monster's results.
e = MOCK.action_packet_multi(me, 4, 273, {
    { id = 2001, results = { { message = 2, param = 100, added = { message = 163, param = 42 }, reaction = true } } },
    { id = mob, results = {
        { message = 236, param = 2, added = { message = 160, param = 4 }, reaction = true },
        { message = 277, param = 13 },
    } },
});
expect('skip player and keep monster results', packets.action_results(e, rows, 0x1000000), 2);
expect('added effect message', rows[1].added, 160);
expect('added effect value', rows[1].added_param, 4);
expect('result after reaction', rows[2].message, 277);
expect('later result number', rows[2].param, 13);
local reused = rows[1];
local plain = MOCK.action_packet(me, 4, 58, mob, { { message = 236, param = 4 } });
packets.action_results(plain, rows, 0x1000000);
expect('result row reused', rows[1], reused);
expect('old extra message cleared', rows[1].added, 0);
expect('old extra value cleared', rows[1].added_param, 0);

-- Every truncation stops before the native reader goes past the available data.
local all_safe, no_partial = true, true;
for size = 0, math.floor((150 + 36 + 85 + 1 + 37 + 1 + 34) / 8) - 1 do
    local one = MOCK.action_packet(me, 4, 58, mob,
        { { message = 236, param = 4, added = { message = 160, param = 2 }, reaction = true } });
    one.size, one.data = size, one.data:sub(1, size);
    for byte = size, 511 do one.data_raw[byte] = nil; end
    local ok, n = pcall(packets.action_results, one, rows, 0x1000000);
    all_safe = all_safe and ok;
    no_partial = no_partial and n == 0;
    all_safe = all_safe and pcall(packets.action_category, one);
    all_safe = all_safe and pcall(packets.action_target, one);
    all_safe = all_safe and pcall(packets.action_head, one);
end
check('all short headers/results/extra blocks are safe', all_safe);
check('truncated results never return a partial effect', no_partial);

-- A complete first result must not leak through a truncated second result.
e = MOCK.action_packet(me, 4, 273, mob,
    { { message = 236, param = 2 }, { message = 277, param = 4, reaction = true } });
e.size, e.data = e.size - 4, e.data:sub(1, e.size - 4);
expect('later truncation rejects the whole packet', packets.action_results(e, rows, 0x1000000), 0);
e = MOCK.action_packet(me, 4, 58, mob, { { message = 236, param = 4 } });
MOCK.pack_bits(e.data_raw, 72, 6, 16);
expect('invalid target count is rejected', packets.action_results(e, rows, 0x1000000), 0);
e = MOCK.action_packet(me, 4, 58, mob, { { message = 236, param = 4 } });
MOCK.pack_bits(e.data_raw, 182, 4, 9);
expect('invalid result count is rejected', packets.action_results(e, rows, 0x1000000), 0);
e.size = 2000;
expect('claimed size cannot exceed actual bytes', packets.action_results(e, rows, 0x1000000), 0);

-- All 15 targets and eight results per target fit, without counting player results.
local targets = {};
for i = 1, 15 do
    local results = {};
    for j = 1, 8 do results[j] = { message = 236, param = j }; end
    targets[i] = { id = mob + i, results = results };
end
e = MOCK.action_packet_multi(me, 4, 273, targets);
expect('server maximum target/result counts', packets.action_results(e, rows, 0x1000000), 120);
expect('last result is aligned', rows[120].param, 8);
expect('last target is aligned', rows[120].target, mob + 15);

expect('despawn id', packets.despawned(MOCK.entity_packet(mob, 0x30)), mob);
expect('ordinary entity update', packets.despawned(MOCK.entity_packet(mob, 0x0F)), nil);
expect('short entity update', packets.despawned({ data = '', size = 0 }), nil);

-- Tip name lookup checks identity, including the offset between pet ids and entity indices.
local player = require('core.player');
MOCK.party[1] = { id = 2001, name = 'Teammate' };
expect('own name', player.name_of(me), 'Tester');
expect('party name', player.name_of(2001), 'Teammate');
expect('unknown player name', player.name_of(3001), nil);
MOCK.monster(17, 'Test Monster');
expect('monster name', player.name_of(mob), 'Test Monster');
MOCK.entities[17].ServerId = mob + 1;
expect('reused entity index does not give wrong name', player.name_of(mob), nil);
MOCK.summon_quietly('Test Pet');
expect('pet name', player.name_of(MOCK.pet_id(0x700)), 'Test Pet');

return MOCK.report();
