-- The server sends the same reply for a game check and an injected one.
local packets = require('core.packets');
local check_origin = {};
local MAX_PENDING, REPLY_SECONDS = 64, 5;
local pending = {};

local function expire(now)
    while (pending[1] ~= nil and now - pending[1].at > REPLY_SECONDS) do
        table.remove(pending, 1);
    end
end

function check_origin.record(e, now)
    if (e.id ~= packets.CHECK_OUT or e.blocked) then return nil; end
    local injected = e.injected;
    if (type(injected) ~= 'boolean') then return nil; end
    local id, index, original_check = packets.check_request(e);
    if (id == nil) then return nil; end
    expire(now);
    if (#pending == MAX_PENDING) then table.remove(pending, 1); end
    local origin = (injected or not original_check) and 'injected' or 'manual';
    pending[#pending + 1] = { id = id, index = index, at = now, origin = origin };
    return origin;
end

-- Match the oldest check of this target. The reply has no request number.
function check_origin.take(id, index, now)
    expire(now);
    for at, check in ipairs(pending) do
        if (check.id == id and check.index == index) then
            table.remove(pending, at);
            return check.origin;
        end
    end
end

function check_origin.forget(id, index)
    for at = #pending, 1, -1 do
        local check = pending[at];
        if (check.id == id and check.index == index) then table.remove(pending, at); end
    end
end

function check_origin.reset()
    pending = {};
end

return check_origin;
