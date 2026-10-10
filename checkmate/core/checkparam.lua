--[[
    Hit, off-hand, ranged, evade and pDIF use /checkparam <me>. Pet uses /checkparam <pet> after it.
    Requests wait 1.5 seconds after other checks because the game ignores them when sent too soon.
    A reply that arrives before our request is reused.

    Only replies to our own requests are hidden: six lines for you and five for your pet.
    Each request waits three seconds for its last line. A checkparam you type still prints.
]]

local checkparam = {};

-- Seconds from the last /check or /checkparam to the send. The game ignores a /checkparam sent right
-- after a /check. Keep this gap so other pending requests can finish too.
local SEND_DELAY = 1.5;

-- How long to wait for the reply after sending, before printing without it.
local REPLY_TIMEOUT = 3.0;

-- The /checkparam reply lines. About you there are six. About your pet there are five, with no 731.
-- 712 carries main-hand accuracy and Attack, 713 the off-hand's, 714 the ranged values and 715, always
-- the last one, the evasion. The pet's 713 and 714 go by your gear, so only yours are kept.
local REPLY_LINES = { [733] = true, [731] = true, [712] = true, [713] = true, [714] = true, [715] = true };
local ACCURACY  = 712;
local OFFHAND   = 713;
local RANGED    = 714;
local EVASION   = 715;
local LAST_LINE = 715;

-- The requests in the order they go out, and the command each one sends.
local ORDER = { 'me', 'pet' };
checkparam.COMMANDS = { me = '/checkparam <me>', pet = '/checkparam <pet>' };

-- Each request holds the /check waiting on it, whether it's due, when its reply is overdue once it's sent,
-- the server id its reply is about, and the accuracy, evasion and Attack values it supplied.
local function blank()
    return { pending = nil, due = false, wait_until = nil, about = nil, accuracy = nil, evasion = nil, offhand = nil,
        ranged = nil, attack = nil, offhand_attack = nil, ranged_attack = nil, pdif_expected = nil,
        parameter_expected = nil, received_at = nil };
end
local requests = { me = blank(), pet = blank() };

-- When the last /check or /checkparam went out, or a reply to one checkmate didn't send came back. The next
-- request waits SEND_DELAY after it.
local quiet_from = -math.huge;

-- Ends a request's wait and returns the /check that waited on it, or nil. Its values stay for printing.
local function finish(r)
    local pending = r.pending;
    r.pending, r.due, r.wait_until = nil, false, nil;
    return pending;
end

function checkparam.is_reply(message)
    return REPLY_LINES[message] == true;
end

-- True while a request is due or on its way. It's the only thing checked every frame.
function checkparam.is_active()
    for _, kind in ipairs(ORDER) do
        local r = requests[kind];
        if (r.due or r.wait_until ~= nil) then
            return true;
        end
    end
    return false;
end

-- A /check or /checkparam went out, anyone's, or your /check came back. The next request waits
-- SEND_DELAY after it.
function checkparam.wait_from(now)
    quiet_from = now;
end

--[[
    `check` waits for request `kind` about server id `about`. When that request is already on its way
    about the same id, `check` waits for that same reply, so no second request goes out and no reply
    line slips through. When it's on its way about another id, `check` can't use it and nothing is
    asked. Returns the /check it takes the place of, or nil, and whether `check` now waits.
]]
function checkparam.ask(kind, check, about)
    local r = requests[kind];
    local replaced = r.pending;
    if (r.wait_until ~= nil) then
        if (r.about == about) then
            r.pending = check;
            return replaced, true;
        end
        r.pending = nil;
        return replaced, false;
    end
    r.pending, r.about, r.due = check, about, true;
    r.pdif_expected = check.pdif_expected;
    r.parameter_expected = check.parameter_expected;
    r.accuracy, r.evasion, r.offhand, r.ranged = nil, nil, nil, nil;
    r.attack, r.offhand_attack, r.ranged_attack = nil, nil, nil;
    r.received_at = nil;
    return replaced, true;
end

-- Drops the waiting /check and returns it, or nil. A request already sent still has its reply hidden.
function checkparam.cancel(kind)
    local r = requests[kind];
    local dropped = r.pending;
    r.pending, r.due = nil, false;
    return dropped;
end

-- The first request that's due once the game will take it, and the server id it's about, or nil.
function checkparam.ready(now)
    if (now < quiet_from + SEND_DELAY) then
        return nil;
    end
    for _, kind in ipairs(ORDER) do
        local r = requests[kind];
        if (r.due) then
            return kind, r.about;
        end
    end
    return nil;
end

-- Request `kind` just went out.
function checkparam.sent(now, kind)
    local r = requests[kind];
    r.due, r.wait_until = false, now + REPLY_TIMEOUT;
    quiet_from = now;
end

-- The /check waiting on the first request whose reply is overdue, and that request's kind, or nil. The
-- /check prints without the missing values. It can be nil when nothing waits on that request anymore.
function checkparam.timed_out(now)
    for _, kind in ipairs(ORDER) do
        local r = requests[kind];
        if (r.wait_until ~= nil and now > r.wait_until) then
            return finish(r), kind;
        end
    end
    return nil;
end

--[[
    One line of a /checkparam reply about server id `about`. Returns whether to hide it, and when this
    line ends the reply, the /check that waited on it and the request's kind. Only replies to
    checkmate's own requests are hidden. A reply nothing waits on still moves the time the next request
    waits from.
]]
function checkparam.on_reply(now, message, value, about, attack)
    local found;
    for _, kind in ipairs(ORDER) do
        local r = requests[kind];
        if (r.about == about and (r.pending ~= nil or r.wait_until ~= nil)) then
            found = kind;
            break;
        end
    end
    if (found == nil) then
        quiet_from = now;
        return false, nil;
    end

    local r = requests[found];
    if (message == ACCURACY or message == EVASION or message == OFFHAND or message == RANGED) then
        r.received_at = now;
    end
    if (message == ACCURACY) then
        r.accuracy = value;
        if (found == 'me') then r.attack = attack; end
    elseif (message == EVASION) then
        r.evasion = value;
    elseif (found == 'me' and message == OFFHAND) then
        r.offhand, r.offhand_attack = value, attack;
    elseif (found == 'me' and message == RANGED) then
        r.ranged, r.ranged_attack = value, attack;
    end

    local ours = r.wait_until ~= nil;
    if (not ours) then
        quiet_from = now;
    end
    if (message ~= LAST_LINE) then
        return ours, nil;
    end
    return ours, finish(r), found;
end

-- The reply's accuracy and evasion, off-hand and ranged accuracy, then the three player Attack values.
-- Then come the inputs captured for this request and the last stat reply's time.
-- Missing fields stay nil. Pet replies never supply player Attack.
function checkparam.values(kind)
    local r = requests[kind];
    return r.accuracy, r.evasion, r.offhand, r.ranged, r.attack, r.offhand_attack, r.ranged_attack,
        r.pdif_expected, r.parameter_expected, r.received_at;
end

-- Clears everything when you zone. Returns every /check that was waiting, once each.
function checkparam.reset()
    local waiting, seen = {}, {};
    for _, kind in ipairs(ORDER) do
        local check = requests[kind].pending;
        if (check ~= nil and not seen[check]) then
            seen[check] = true;
            waiting[#waiting + 1] = check;
        end
        requests[kind] = blank();
    end
    quiet_from = -math.huge;
    return waiting;
end

return checkparam;
