--[[
    Reads the few incoming packet fields checkmate needs.

    Offsets come from the LandSandBoat server source (src/map/packets), which Phoenix runs unchanged
    for these packets.
]]

local packets = {};

packets.ID = {
    ZONE_IN  = 0x00A,
    MESSAGE  = 0x029,
    WIDESCAN = 0x0F4,
};

-- 0x029 battle message. Carries /check and /checkparam replies.
function packets.message(e)
    local data = e.data;
    local actor        = struct.unpack('L', data, 0x04 + 1);
    local target       = struct.unpack('L', data, 0x08 + 1);
    local param1       = struct.unpack('l', data, 0x0C + 1);
    local param2       = struct.unpack('L', data, 0x10 + 1);
    local target_index = struct.unpack('H', data, 0x16 + 1);
    local message      = struct.unpack('H', data, 0x18 + 1);
    return actor, target, param1, param2, message, target_index;
end

-- 0x0F4 widescan entry. Carries a monster's true level, even for monsters /check can't gauge. The
-- level is an unsigned byte.
function packets.widescan(e)
    local data = e.data;
    local index = struct.unpack('H', data, 0x04 + 1);
    local level = struct.unpack('B', data, 0x06 + 1);
    return index, level;
end

-- 0x00A zone in. Returns your server id.
function packets.zone_in(e)
    return struct.unpack('L', e.data, 0x04 + 1);
end

return packets;
