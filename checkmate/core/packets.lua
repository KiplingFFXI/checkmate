--[[
    Reads the few incoming packet fields checkmate needs.

    Offsets come from the LandSandBoat server source (src/map/packets), which Phoenix runs unchanged
    for these packets.
]]

local packets = {};

packets.ID = {
    ZONE_IN  = 0x00A,
    MESSAGE  = 0x029,
    PET_SYNC = 0x068,
    MERITS   = 0x08C,
    WIDESCAN = 0x0F4,
};

-- Outgoing /check and /checkparam. checkmate only notes when one goes out.
packets.CHECK_OUT = 0x0DD;

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

-- 0x068 pet update. The server sends it when your pet comes out or goes, and while it changes. Returns
-- your pet's entity index, or 0 with no pet.
function packets.pet_index(e)
    return struct.unpack('H', e.data, 0x0C + 1);
end

-- 0x08C merit list. The server sends every merit when you zone in, and one when you spend points.
-- Each entry is 4 bytes from 0x08, the merit id then its count in the last byte. Returns the count of
-- merit `id`, or nil when the list doesn't have it.
function packets.merit_count(e, id)
    local data = e.data;
    local count = struct.unpack('H', data, 0x04 + 1);
    for at = 0x08, 0x08 + (count - 1) * 4, 4 do
        if (at + 4 > #data) then
            break;
        end
        if (struct.unpack('H', data, at + 1) == id) then
            return struct.unpack('B', data, at + 3 + 1);
        end
    end
    return nil;
end

return packets;
