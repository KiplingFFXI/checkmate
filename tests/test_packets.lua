-- Short packets must not read missing bytes or change the addon's observations.
local packets = require('core.packets');
local fixtures = {
    { 'message', MOCK.message_packet(1000, 1000, 10, 0, 715, 0), 26 },
    { 'widescan', MOCK.widescan_packet(17, 30), 7 },
    { 'zone_in', MOCK.zone_packet(), 8 },
    { 'zone_id', MOCK.zone_packet(), 50 },
    { 'base_hp', MOCK.job_info_packet(1000), 64 },
    { 'main_level', MOCK.stats_packet(30), 14 },
    { 'sub_job', MOCK.stats_packet(30), 15 },
    { 'pet_index', MOCK.pet_sync_packet(0x700), 14 },
    { 'merit_count', MOCK.merit_packet({ { 1, 2 } }), 12 },
};
local read_value = struct.unpack;
struct.unpack = function (format, data, at)
    local bytes = ({ L = 4, l = 4, H = 2, B = 1 })[format];
    assert(at + bytes - 1 <= #data, 'read beyond packet');
    return read_value(format, data, at);
end;
for _, fixture in ipairs(fixtures) do
    local name, whole, minimum = unpack(fixture);
    for size = 0, minimum - 1 do
        local event = { id = whole.id, data = whole.data:sub(1, size), size = size };
        local ok, result = pcall(packets[name], event, 1);
        check(name .. ' ignores a truncated body of ' .. size .. ' bytes', ok and result == nil, result);
        event.data = whole.data;
        ok, result = pcall(packets[name], event, 1);
        check(name .. ' respects a reported size of ' .. size .. ' bytes', ok and result == nil, result);
    end
    check(name .. ' still reads a valid packet', packets[name](whole, 1) ~= nil);
    local padded = MOCK.event({ id = whole.id, size = whole.size,
        data = whole.data .. string.rep('\0', 512 - #whole.data) });
    expect(name .. ' ignores padding after the declared body', packets[name](padded, 1), packets[name](whole, 1));
    padded.size = minimum - 1;
    expect(name .. ' rejects a short declared body with a valid padded tail', packets[name](padded, 1), nil);
end
struct.unpack = read_value;

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.zone_in(103);
MOCK.command('/checkmate show effects');
local effects = require('core.effects');
local mob = MOCK.mob_id(103, 17);
MOCK.packet(MOCK.action_packet(MOCK.player.server_id, 4, 58, mob,
    { { message = 236, param = 4 } }));
MOCK.frame();
check('setup has a tracked effect', effects.has(mob));
for _, fixture in ipairs(fixtures) do
    local whole = fixture[2];
    for _, event in ipairs({
        { id = whole.id, data = '', size = 0 },
        { id = whole.id, data = whole.data:sub(1, fixture[3] - 1), size = whole.size },
        { id = whole.id, data = whole.data, size = 0 },
        { id = whole.id, size = whole.size },
    }) do
        local ok = pcall(MOCK.packet, event);
        check('short packet is ignored by the controller: ' .. fixture[1], ok);
        check('short packet leaves observations alone: ' .. fixture[1], effects.has(mob));
    end
end
local list = MOCK.merit_packet({ { 1, 2 }, { 2, 3 } });
list.data, list.size = list.data:sub(1, 12), 12;
expect('truncated merit list is not partly accepted', packets.merit_count(list, 1), nil);
list = MOCK.merit_packet({ { 1, 2 }, { 2, 3 } });
local merit_size = list.size;
list.data = list.data .. string.rep('\0', 512 - #list.data);
list.size = 12;
check('a merit entry in the padded tail cannot validate a short list', not packets.valid(list));
expect('a merit entry in the padded tail is not observed', packets.merit_counts(list), nil);
list.size = merit_size;
expect('a complete merit list still reads with a padded buffer', packets.merit_counts(list)[2], 3);
return MOCK.report();
