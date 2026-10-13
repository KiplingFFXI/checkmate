-- A defender's spikes apply back to the attacker, including when the defender is a player.
local packets = require('core.packets');
local player, mob = MOCK.player.server_id, MOCK.mob_id(103, 17);
local rows = {};
local action = MOCK.action_packet(mob, 1, 0, player, {
    { message = 1, param = 32, reaction = { kind = 2, param = 4, message = 374 } },
});
expect('ordinary callers still skip player targets', packets.action_results(action, rows, 0x1000000), 0);
expect('reaction callers retain the player target', packets.action_results(action, rows, 0x1000000, true), 1);
expect('the defender stays the row target', rows[1].target, player);
expect('spikes carry their own message', rows[1].reaction, 374);
expect('spikes carry their own status', rows[1].reaction_param, 4);
expect('spikes kind is separate from the status', rows[1].reaction_kind, 2);
expect('ordinary hit data stays intact', rows[1].param, 32);

local mixed = MOCK.action_packet_multi(player, 1, 0, {
    { id = player, results = { { message = 1, param = 1 } } },
    { id = mob, results = {
        { message = 1, param = 22, added = { message = 160, param = 3 },
            reaction = { kind = 63, param = 16383, message = 1023 } },
        { message = 1, param = 16 },
    } },
});
expect('normal player rows are still skipped', packets.action_results(mixed, rows, 0x1000000, true), 2);
expect('additional effects survive the reaction block', rows[1].added_param, 3);
expect('all fourteen reaction parameter bits are read', rows[1].reaction_param, 16383);
expect('all ten reaction message bits are read', rows[1].reaction, 1023);
expect('all six reaction kind bits are read', rows[1].reaction_kind, 63);
expect('the following row stays aligned', rows[2].param, 16);
expect('missing reaction clears the message', rows[2].reaction, 0);
expect('missing reaction clears the parameter', rows[2].reaction_param, 0);
expect('missing reaction clears the kind', rows[2].reaction_kind, 0);

local plain = MOCK.action_packet(player, 1, 0, mob, { { message = 1, param = 9 } });
packets.action_results(plain, rows, 0x1000000, true);
expect('reused rows do not keep old reactions', rows[1].reaction, 0);
expect('reused rows do not keep old reaction parameters', rows[1].reaction_param, 0);
expect('reused rows do not keep old reaction kinds', rows[1].reaction_kind, 0);

-- The complete reaction ends at bit 307; every shorter body must be rejected.
for size = 0, 38 do
    local short = { id = action.id, data = action.data:sub(1, size), size = size, data_raw = action.data_raw };
    local ok, n = pcall(packets.action_results, short, rows, 0x1000000, true);
    check('short reaction is not partly accepted: ' .. size, ok and n == 0);
end

local owned = MOCK.entity_packet(mob, 0x04, nil, true);
local id, is_pet = packets.player_pet(owned);
expect('general update reports the exact actor', id, mob);
expect('player ownership is read from its flag', is_pet, true);
id, is_pet = packets.player_pet(MOCK.entity_packet(mob, 0x04, nil, false));
expect('unowned actors still report their identity', id, mob);
expect('a cleared ownership flag is known false', is_pet, false);
for _, mask in ipairs({ 0, 1, 2, 8, 16, 0x24, 0x30 }) do
    expect('partial or despawn update cannot change ownership: ' .. mask,
        packets.player_pet(MOCK.entity_packet(mob, mask, nil, true)), nil);
end
for size = 0, 39 do
    local short = { data = owned.data:sub(1, size), size = size };
    local ok, value = pcall(packets.player_pet, short);
    check('short ownership flag is ignored: ' .. size, ok and value == nil);
end
return MOCK.report();
