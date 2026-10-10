--[[
    Reads the few incoming packet fields checkmate needs.

    Offsets come from the LandSandBoat server source (src/map/packets), which Phoenix runs unchanged
    for these packets.
]]

local packets = {};

packets.ID = {
    ZONE_IN  = 0x00A,
    ENTITY   = 0x00E,
    JOB_INFO = 0x01B,
    ACTION   = 0x028,
    MESSAGE  = 0x029,
    STATS    = 0x061,
    PET_SYNC = 0x068,
    MERITS   = 0x08C,
    SPELLS   = 0x0AA,
    WIDESCAN = 0x0F4,
};

-- Outgoing /check and /checkparam. checkmate only notes when one goes out.
packets.CHECK_OUT = 0x0DD;

-- The bytes actually available, even when a malformed packet claims to be longer.
local function byte_count(e)
    if (type(e.data) ~= 'string' or type(e.size) ~= 'number') then return 0; end
    return math.max(0, math.min(#e.data, e.size));
end

local MINIMUM = { [packets.ID.MESSAGE] = 26, [packets.ID.WIDESCAN] = 7,
    [packets.ID.ZONE_IN] = 50, [packets.ID.JOB_INFO] = 64, [packets.ID.STATS] = 15,
    [packets.ID.PET_SYNC] = 14, [packets.ID.MERITS] = 8, [packets.ID.SPELLS] = 132 };

-- Validate every field before a packet can change state. Action and entity readers check their own bounds.
function packets.valid(e)
    local minimum = MINIMUM[e.id];
    if (minimum == nil) then return true; end
    local size = byte_count(e);
    if (size < minimum) then return false; end
    if (e.id == packets.ID.MERITS) then
        return 8 + 4 * struct.unpack('H', e.data, 5) <= size;
    end
    return true;
end

-- 0x029 battle message. Carries /check and /checkparam replies.
function packets.message(e)
    if (byte_count(e) < 26) then return nil; end
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
    if (byte_count(e) < 7) then return nil; end
    local data = e.data;
    local index = struct.unpack('H', data, 0x04 + 1);
    local level = struct.unpack('B', data, 0x06 + 1);
    return index, level;
end

-- 0x00A zone in. Returns your server id.
function packets.zone_in(e)
    if (byte_count(e) < 8) then return nil; end
    return struct.unpack('L', e.data, 0x04 + 1);
end

-- 0x00A zone in. Returns the id of the zone you're coming into.
function packets.zone_id(e)
    if (byte_count(e) < 50) then return nil; end
    return struct.unpack('H', e.data, 0x30 + 1);
end

-- 0x01B job info. The server sends it when you zone, level up or down, change jobs, get level synced or capped,
-- or your support job is restricted. Returns your max HP from your race, jobs and merits, before gear and food.
function packets.base_hp(e)
    if (byte_count(e) < 64) then return nil; end
    return struct.unpack('l', e.data, 0x3C + 1);
end

-- 0x061 your stats. The server sends it when you zone, level up, change jobs or get level synced or capped.
-- Returns your main level, which follows level sync.
function packets.main_level(e)
    if (byte_count(e) < 14) then return nil; end
    return struct.unpack('B', e.data, 0x0D + 1);
end

-- 0x061 your stats. Returns your support job, which comes as 0 while it's restricted, the same as none.
function packets.sub_job(e)
    if (byte_count(e) < 15) then return nil; end
    return struct.unpack('B', e.data, 0x0E + 1);
end

-- 0x068 pet update. The server sends it when your pet comes out or goes, and while it changes. Returns
-- your pet's entity index, or 0 with no pet.
function packets.pet_index(e)
    if (byte_count(e) < 14) then return nil; end
    return struct.unpack('H', e.data, 0x0C + 1);
end

-- 0x08C merit list. The server sends every merit when you zone in, and one when you spend points.
-- Each entry is 4 bytes from 0x08, the merit id then its count in the last byte. Returns the count of
-- merit `id`, or nil when the list doesn't have it.
function packets.merit_count(e, id)
    local size = byte_count(e);
    if (size < 8) then return nil; end
    local data = e.data;
    local count = struct.unpack('H', data, 0x04 + 1);
    if (8 + 4 * count > size) then return nil; end
    for at = 0x08, 0x08 + (count - 1) * 4, 4 do
        if (struct.unpack('H', data, at + 1) == id) then
            return struct.unpack('B', data, at + 3 + 1);
        end
    end
    return nil;
end

-- 0x00E's despawn mask. The id is only read when the entity left your sight.
function packets.despawned(e)
    if (byte_count(e) < 0x0B or bit.band(e.data:byte(0x0B), 0x20) == 0) then return nil; end
    return struct.unpack('L', e.data, 0x05), struct.unpack('H', e.data, 0x09);
end

-- The fixed 0x028 header, then 36 bits per target and up to eight variable-length results.
local ACTOR_BIT, COUNT_BIT, CATEGORY_BIT, ACTION_BIT, TARGET_BIT = 40, 72, 82, 86, 150;
local RESULT_BITS, ADDED_BITS, REACTION_BITS = 85, 37, 34;
local unpack_bits = ashita.bits.unpack_be;

-- A short action header never reaches the native bit reader.
local function action_bytes(e, bits)
    return e.data_raw ~= nil and byte_count(e) * 8 >= bits;
end

-- Its category, read first because action starts carry no results to track.
function packets.action_category(e)
    if (not action_bytes(e, CATEGORY_BIT + 4)) then return 0; end
    return unpack_bits(e.data_raw, 0, CATEGORY_BIT, 4);
end

-- Who acted, and the action id as the server sent it.
function packets.action_head(e)
    if (not action_bytes(e, TARGET_BIT)) then return 0, 0; end
    return unpack_bits(e.data_raw, 0, ACTOR_BIT, 32), unpack_bits(e.data_raw, 0, ACTION_BIT, 32);
end

-- The first target, so ordinary monster swings on players can stop here.
function packets.action_target(e)
    if (not action_bytes(e, TARGET_BIT + 32)) then return 0; end
    return unpack_bits(e.data_raw, 0, TARGET_BIT, 32);
end

-- Fills reused rows for targets at or above `from`. A malformed packet returns no results at all.
-- The extra-effect and reaction flags are checked before reading or skipping either block.
function packets.action_results(e, out, from)
    if (not action_bytes(e, TARGET_BIT)) then return 0; end
    local raw, total = e.data_raw, byte_count(e) * 8;
    local targets = unpack_bits(raw, 0, COUNT_BIT, 6);
    if (targets > 15) then return 0; end
    local n, at = 0, TARGET_BIT;
    for _ = 1, targets do
        if (at + 36 > total) then return 0; end
        local target = unpack_bits(raw, 0, at, 32);
        local results = unpack_bits(raw, 0, at + 32, 4);
        if (results > 8) then return 0; end
        at = at + 36;
        for _ = 1, results do
            local start = at;
            if (at + RESULT_BITS + 1 > total) then return 0; end
            at = at + RESULT_BITS;
            local added = unpack_bits(raw, 0, at, 1) == 1;
            at = at + 1;
            local added_at = at;
            if (added) then at = at + ADDED_BITS; end
            if (at + 1 > total) then return 0; end
            local reaction = unpack_bits(raw, 0, at, 1) == 1;
            at = at + 1 + (reaction and REACTION_BITS or 0);
            if (at > total) then return 0; end
            if (target >= from) then
                n = n + 1;
                local row = out[n] or {};
                out[n] = row;
                row.target = target;
                row.param = unpack_bits(raw, 0, start + 27, 17);
                row.message = unpack_bits(raw, 0, start + 44, 10);
                row.added = added and unpack_bits(raw, 0, added_at + 27, 10) or 0;
                row.added_param = added and unpack_bits(raw, 0, added_at + 10, 17) or 0;
            end
        end
    end
    return n;
end

return packets;
