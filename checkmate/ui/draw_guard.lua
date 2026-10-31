-- Close only the ImGui scopes opened during this draw if it fails.
local imgui = require('imgui');
local guard = {};
local top, scope_count = nil, 0;
local calls, saved, wrappers = {}, {}, {};
local active = false;

local function push_scope(scope)
    scope.previous = top;
    if (top ~= nil) then top.following = scope; end
    top, scope_count = scope, scope_count + 1;
end

local function remove(scope)
    if (scope == nil) then error('Settings tried to close an ImGui scope it did not open.', 0); end
    if (scope.previous ~= nil) then scope.previous.following = scope.following; end
    if (scope.following ~= nil) then scope.following.previous = scope.previous;
    else top = scope.previous; end
    scope.previous, scope.following = nil, nil;
    scope_count = scope_count - 1;
end

local function owner()
    local scope = top;
    while (scope ~= nil) do
        if (scope.window) then return scope; end
        scope = scope.previous;
    end
end

local function matching(kind, target, local_scope)
    local window = local_scope and owner();
    local scope = top;
    while (scope ~= nil) do
        if (scope.kind == kind and scope.target == target and (not local_scope or scope.owner == window)) then return scope; end
        scope = scope.previous;
    end
end

local function closed(kind, target, local_scope, count, ...)
    for _ = 1, count do remove(matching(kind, target, local_scope)); end
    return ...;
end

local function close(kind, target, local_scope, finish, count, ...)
    local available = 0;
    local window = local_scope and owner();
    local scope = top;
    while (scope ~= nil) do
        if (scope.kind == kind and scope.target == target and (not local_scope or scope.owner == window)) then
            available = available + 1;
        end
        scope = scope.previous;
    end
    if (type(count) ~= 'number' or count ~= math.floor(count) or count < 0 or count > available) then
        error('Settings tried to close an ImGui scope it did not open.', 0);
    end
    local at = matching(kind, target, local_scope);
    if (at and at.window and at ~= owner()) then
        error('Settings tried to close an ImGui window before its nested scope.', 0);
    end
    if (at and at.window) then
        scope = top;
        while (scope ~= nil) do
            if (scope.local_scope and scope.owner == at) then
                error('Settings tried to close an ImGui window with local scopes still open.', 0);
            end
            scope = scope.previous;
        end
    end
    return closed(kind, target, local_scope, count, finish(...));
end

local function pair(open, finish, conditional, window, local_scope, counted)
    local function opened(...)
        local value = ...;
        if (not conditional or value) then
            push_scope({ kind = finish, finish = calls[finish], window = window,
                owner = owner(), local_scope = local_scope });
        end
        return ...;
    end
    wrappers[open] = function(...)
        return opened(calls[open](...));
    end;
    if (wrappers[finish] == nil) then
        wrappers[finish] = function(...)
            local count = counted and (select(1, ...) or 1) or 1;
            return close(finish, nil, local_scope, calls[finish], count, ...);
        end;
    end
end

-- Begin and BeginChild need End even when they return false. The other Begin calls do not.
pair('Begin', 'End', false, true);
pair('BeginChild', 'EndChild', false, true);
pair('BeginCombo', 'EndCombo', true, true);
pair('BeginListBox', 'EndListBox', true, true);
pair('BeginPopup', 'EndPopup', true, true);
pair('BeginPopupModal', 'EndPopup', true, true);
pair('BeginTable', 'EndTable', true, true);
pair('BeginTooltip', 'EndTooltip', true, true);
pair('BeginDisabled', 'EndDisabled', false, false, true);
pair('BeginGroup', 'EndGroup', false, false, true);
pair('PushFont', 'PopFont');
pair('PushID', 'PopID', false, false, true);
pair('PushStyleColor', 'PopStyleColor', false, false, false, true);
pair('PushStyleVar', 'PopStyleVar', false, false, false, true);
pair('PushTextWrapPos', 'PopTextWrapPos', false, false, true);
pair('PushItemWidth', 'PopItemWidth', false, false, true);
pair('PushClipRect', 'PopClipRect', false, false, true);

local draw_lists = {};
local draw_methods = {};
draw_methods.__index = function(proxy, name)
    local native = proxy.native;
    local fn = native[name];
    local value;
    if (name == 'PushClipRect') then
        value = function(_, ...)
            local out = fn(native, ...);
            push_scope({ kind = 'draw clip', target = proxy, finish = native.PopClipRect,
                argument = native, owner = owner(), local_scope = true });
            return out;
        end;
    elseif (name == 'PopClipRect') then
        value = function(_, ...)
            return close('draw clip', proxy, false, fn, 1, native, ...);
        end;
    elseif (type(fn) == 'function') then
        value = function(_, ...) return fn(native, ...); end;
    else
        return fn;
    end
    rawset(proxy, name, value);
    return value;
end;

wrappers.GetWindowDrawList = function(...)
    local native = calls.GetWindowDrawList(...);
    local proxy = draw_lists[native];
    if (proxy == nil) then proxy = setmetatable({ native = native }, draw_methods); draw_lists[native] = proxy; end
    return proxy;
end;

local function restore()
    for name, entry in pairs(saved) do rawset(imgui, name, entry.value); end
    top, scope_count = nil, 0;
    calls, saved, draw_lists, active = {}, {}, {}, false;
end

local function draw_scoped(draw, ...)
    for name, wrapper in pairs(wrappers) do
        local fn = imgui[name];
        if (fn ~= nil) then
            saved[name], calls[name] = { value = rawget(imgui, name) }, fn;
            rawset(imgui, name, wrapper);
        end
    end
    return draw(...);
end

function guard.run(draw, ...)
    if (active) then return draw(...); end
    active = true;
    local ok, value = pcall(draw_scoped, draw, ...);
    local unclosed = scope_count;
    -- Reverse order closes nested Tables, Children and popups before their parent windows.
    while (top ~= nil) do
        local scope = top;
        remove(scope);
        local closed, why;
        if (scope.argument ~= nil) then closed, why = pcall(scope.finish, scope.argument);
        else closed, why = pcall(scope.finish); end
        if (not closed) then
            restore();
            error('Settings cleanup failed: ' .. tostring(why), 0);
        end
    end
    restore();
    if (not ok) then error(value, 0); end
    if (unclosed > 0) then error('Settings left an ImGui scope open.', 0); end
    return value;
end

return guard;
