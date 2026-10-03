--[[
    The automatic /checkparam behind hit rate and evasion.

    Hit rate and evasion need your current accuracy and evasion, so a second and a half after your
    /check, checkmate sends /checkparam <me>. The six reply lines to that one request are hidden.
    Printout lines from the first one with hit or evade onward wait until the last reply line is in,
    or until 3 seconds pass without it. A /checkparam you type yourself still shows in chat. When a reply
    about you comes in before checkmate sends its own, like the one advcheck asks for 0.99 s after a
    /check, checkmate uses it and sends nothing. advcheck hides that one itself.
]]

local checkparam = {};

-- Seconds from your /check reply to the send. The game ignores a /checkparam sent right after a /check
-- and takes one sent a second later. The extra half second lets advcheck's go first when it's loaded.
local SEND_DELAY = 1.5;

-- How long to wait for the reply after sending, before printing without it.
local REPLY_TIMEOUT = 3.0;

-- The six /checkparam reply lines about you. 712 carries your main hand accuracy and 715, the last
-- one, your evasion.
local REPLY_LINES = { [733] = true, [731] = true, [712] = true, [713] = true, [714] = true, [715] = true };
local ACCURACY  = 712;
local EVASION   = 715;
local LAST_LINE = 715;

local state = {
    pending    = nil,   -- The /check waiting to print.
    send_at    = nil,   -- When to send /checkparam, until it's sent.
    wait_until = nil,   -- Set once it's sent, until its reply ends or times out.
};

-- Your accuracy and evasion from the reply to the current request. Cleared for each new request.
local mine = { accuracy = nil, evasion = nil };

local function finish()
    local pending = state.pending;
    state.pending, state.send_at, state.wait_until = nil, nil, nil;
    return pending;
end

function checkparam.is_reply(message)
    return REPLY_LINES[message] == true;
end

-- True while a request is due or on its way. It's the only thing checked every frame.
function checkparam.is_active()
    return state.send_at ~= nil or state.wait_until ~= nil;
end

--[[
    Your /check came back and `check` waits for the reply. A second /check while one is already on
    its way waits for that same reply, so no second request goes out and no reply line slips through.
    Returns the /check it takes the place of, or nil.
]]
function checkparam.on_check(now, check)
    local replaced = state.pending;
    state.pending = check;
    if (state.wait_until ~= nil) then
        return replaced;
    end
    mine.accuracy, mine.evasion = nil, nil;
    state.send_at = now + SEND_DELAY;
    return replaced;
end

-- Drops the waiting /check and returns it, or nil. A request already sent still has its reply hidden.
function checkparam.cancel()
    local dropped = state.pending;
    state.pending, state.send_at = nil, nil;
    return dropped;
end

-- True once, when it's time to send /checkparam <me>.
function checkparam.due(now)
    if (state.send_at == nil or now < state.send_at) then
        return false;
    end
    state.send_at = nil;
    state.wait_until = now + REPLY_TIMEOUT;
    return true;
end

-- The waiting /check once the reply is overdue, or nil. It prints without the missing values.
function checkparam.timed_out(now)
    if (state.wait_until == nil or now <= state.wait_until) then
        return nil;
    end
    return finish();
end

--[[
    One line of a /checkparam reply about you. Returns whether to hide it, and the waiting /check
    when this line ends the reply.
]]
function checkparam.on_reply(message, value)
    if (state.pending == nil and state.wait_until == nil) then
        return false, nil;
    end

    if (message == ACCURACY) then
        mine.accuracy = value;
    elseif (message == EVASION) then
        mine.evasion = value;
    end

    local ours = state.wait_until ~= nil;
    if (message ~= LAST_LINE) then
        return ours, nil;
    end
    return ours, finish();
end

-- Your accuracy and evasion from this request, nil for any that didn't come back.
function checkparam.mine()
    return mine.accuracy, mine.evasion;
end

-- Clears everything when you zone. Returns the waiting /check, or nil.
function checkparam.reset()
    mine.accuracy, mine.evasion = nil, nil;
    return finish();
end

return checkparam;
