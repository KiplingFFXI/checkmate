-- Search highlights controls and keeps a place among each page's matches.
local imgui = require('imgui');
local search = {};
local query, tab, pages = '', nil, {};
local tokens, cached = {}, {};
local color = { 1, 1, 1, 1 };

function search.matches(text, value)
    text = tostring(text or ''):lower();
    for token in tostring(value or ''):lower():gmatch('%S+') do
        if (not text:find(token, 1, true)) then return false; end
    end
    return true;
end

function search.query(value, ink)
    value = tostring(value or '');
    if (value ~= query) then
        query, pages, tokens, cached = value, {}, {}, {};
        for token in value:lower():gmatch('%S+') do tokens[#tokens + 1] = token; end
    end
    color = ink or color;
end

function search.finish_tab()
    local page = tab and pages[tab];
    if (page == nil) then return; end
    page.total = page.seen;
    if (page.total == 0) then
        page.index, page.pending = 0, true;
    elseif (page.index > page.total or page.index < 1) then
        page.index, page.pending = math.min(math.max(page.index, 1), page.total), true;
    end
end

function search.begin_tab(name)
    search.finish_tab();
    tab = name;
    if (name == nil or #tokens == 0) then return; end
    pages[name] = pages[name] or { index = 1, total = 0, pending = true };
    pages[name].seen = 0;
    pages[name].x1, pages[name].y1, pages[name].x2, pages[name].y2 = nil, nil, nil, nil;
end

function search.status(name)
    local page = pages[name or tab];
    if (page == nil or #tokens == 0) then return 0, 0; end
    return math.min(page.index, page.total), page.total;
end

function search.active()
    return #tokens > 0;
end

function search.step(delta, name)
    local page = pages[name or tab];
    if (page == nil or page.total == 0 or delta == 0) then return false; end
    page.index = (page.index - 1 + (delta < 0 and -1 or 1)) % page.total + 1;
    page.pending = true;
    return true;
end

local function matches(label, tip)
    label, tip = tostring(label or ''), tostring(tip or '');
    local by_tip = cached[label];
    if (by_tip == nil) then by_tip = {}; cached[label] = by_tip; end
    if (by_tip[tip] == nil) then
        local words = (label:gsub('##.*$', '') .. ' ' .. tip):lower();
        local found = true;
        for _, token in ipairs(tokens) do
            if (not words:find(token, 1, true)) then found = false; break; end
        end
        by_tip[tip] = found;
    end
    return by_tip[tip];
end

function search.mark(label, tip)
    if (#tokens == 0 or tab == nil or not matches(label, tip)) then return; end
    local page = pages[tab];
    local x1, y1 = imgui.GetItemRectMin();
    local x2, y2 = imgui.GetItemRectMax();
    if (page.x1 == x1 and page.y1 == y1 and page.x2 == x2 and page.y2 == y2) then return; end
    page.x1, page.y1, page.x2, page.y2 = x1, y1, x2, y2;
    page.seen = page.seen + 1;
    imgui.GetWindowDrawList():AddRect({ x1 - 2, y1 - 1 }, { x2 + 2, y2 + 1 }, imgui.GetColorU32(color), 2, 0, 2);
    if (page.pending and page.seen == page.index) then
        imgui.SetScrollHereY(0.3);
        page.pending = false;
    end
end

return search;
