-- Settings pages use wrapped tabs or one compact selector.
local imgui = require('imgui');
local navigation = {};

navigation.TAB_NAMES = {
    'Display', 'Combat', 'Merits', 'Aggro', 'Magic', 'Blue Magic', 'Weaknesses',
    'Pets', 'Monster', 'Drops', 'Effects', 'Abbreviations', 'Appearance', 'Profiles',
};
local active = 'Display';
local names = {};
for _, name in ipairs(navigation.TAB_NAMES) do names[name:lower():gsub('%s+', '')] = name; end
names.blue, names.look, names.colors, names.short = 'Blue Magic', 'Appearance', 'Appearance', 'Abbreviations';
names.printout, names.overlay = 'Display', 'Display';
names.numbers = 'Combat';

function navigation.canonical(name)
    return names[tostring(name or ''):lower():gsub('[%s_-]+', '')];
end

-- The page name can change without changing saved visibility.
function navigation.key(name)
    name = navigation.canonical(name) or name;
    return name == 'Combat' and 'Numbers' or name;
end

function navigation.visible(tabs, name)
    name = navigation.canonical(name) or name;
    if (name == 'Display' and type(tabs) == 'table' and type(tabs.Display) ~= 'boolean') then
        return tabs.Printout ~= false or tabs.Overlay ~= false;
    end
    if (name == 'Combat' and type(tabs) == 'table' and type(tabs.Numbers) ~= 'boolean') then
        return tabs.Combat ~= false;
    end
    return name == 'Appearance' or type(tabs) ~= 'table' or tabs[navigation.key(name)] ~= false;
end

function navigation.normalize(tabs)
    local out = {};
    for _, name in ipairs(navigation.TAB_NAMES) do out[navigation.key(name)] = navigation.visible(tabs, name); end
    return out;
end

function navigation.select(name)
    name = navigation.canonical(name);
    if (name == nil) then return false; end
    active = name;
    return true;
end

function navigation.current()
    return active;
end

-- Measure before drawing so every button fits on its row.
function navigation.rows(labels, available, measure, padding, gap)
    local rows, row, used = {}, {}, 0;
    available, padding, gap = math.max(1, available), padding or 10, gap or 8;
    for _, name in ipairs(labels) do
        local width = math.min(available, math.ceil(measure(name) + padding));
        if (#row > 0 and used + gap + width > available) then
            rows[#rows + 1], row, used = row, {}, 0;
        end
        used = used + (#row > 0 and gap or 0) + width;
        row[#row + 1] = { name = name, width = width };
    end
    if (#row > 0) then rows[#rows + 1] = row; end
    return rows;
end

local function draw_wrapped(visible, look, available)
    local focused = imgui.IsWindowFocused(ImGuiFocusedFlags_RootAndChildWindows);
    local scale = imgui.GetFontSize() / 18;
    local padding = { math.floor(7 * scale + 0.5), 4 };
    local rows = navigation.rows(visible, available, imgui.CalcTextSize, 2 * padding[1], 8);
    local underline;
    imgui.PushStyleVar(ImGuiStyleVar_FramePadding, padding);
    for _, row in ipairs(rows) do
        for index, entry in ipairs(row) do
            if (index > 1) then imgui.SameLine(0, 8); end
            local selected = entry.name == active;
            local base = focused and (selected and look.open_tab or look.tabs)
                or (selected and look.open_tab_unfocused or look.tabs_unfocused);
            imgui.PushStyleColor(ImGuiCol_Button, base);
            imgui.PushStyleColor(ImGuiCol_ButtonHovered, look.tabs_hovered);
            imgui.PushStyleColor(ImGuiCol_ButtonActive, look.open_tab);
            if (imgui.Button(entry.name .. '##checkmate_tab', { entry.width, 0 })) then active = entry.name; end
            imgui.PopStyleColor(3);
            if (entry.name == active) then
                local x1, y1 = imgui.GetItemRectMin();
                local x2 = imgui.GetItemRectMax();
                underline = { x1, y1, x2 };
            end
        end
    end
    imgui.PopStyleVar(1);
    if (underline ~= nil) then
        local line = focused and look.open_tab_line or look.open_tab_line_unfocused;
        imgui.GetWindowDrawList():AddLine({ underline[1], underline[2] }, { underline[3], underline[2] },
            imgui.GetColorU32(line), 2);
    end
end

local function draw_compact(visible, available)
    imgui.SetNextItemWidth(math.max(1, available));
    if (imgui.BeginCombo('##checkmate_page', 'Page: ' .. active)) then
        for _, name in ipairs(visible) do
            local selected = name == active;
            if (imgui.Selectable(name, selected)) then active = name; end
            if (selected) then imgui.SetItemDefaultFocus(); end
        end
        imgui.EndCombo();
    end
end

function navigation.draw(settings, tabs, matches, search_changed, draw_page, options)
    local visible, pages, hidden = {}, {}, {};
    for _, tab in ipairs(tabs) do
        if (matches[tab[1]]) then
            if (navigation.visible(settings.window.tabs, tab[1])) then
                visible[#visible + 1], pages[tab[1]] = tab[1], tab;
            else
                hidden[#hidden + 1] = tab;
            end
        end
    end
    local revealed = false;
    if (#hidden > 0 and options and options.searching) then
        if (imgui.Button(('Show hidden matches (%d)##reveal_tabs'):format(#hidden))) then
            settings.window.tabs = navigation.normalize(settings.window.tabs);
            for _, tab in ipairs(hidden) do settings.window.tabs[navigation.key(tab[1])] = true; end
            visible, pages = {}, {};
            for _, tab in ipairs(tabs) do
                if (matches[tab[1]] and navigation.visible(settings.window.tabs, tab[1])) then
                    visible[#visible + 1], pages[tab[1]] = tab[1], tab;
                end
            end
            active, revealed = hidden[1][1], true;
        end
        if (imgui.IsItemHovered()) then
            imgui.BeginTooltip();
            imgui.PushTextWrapPos(360);
            imgui.TextUnformatted('Shows the hidden tabs matching this search. Their feature settings stay as they are.');
            imgui.PopTextWrapPos();
            imgui.EndTooltip();
        end
    end
    if (#visible == 0) then return revealed; end
    if (pages[active] == nil) then active = visible[1]; end

    local available = options and options.width or imgui.GetContentRegionAvail();
    if (settings.window.compact_navigation == true) then
        draw_compact(visible, available);
    else
        draw_wrapped(visible, settings.look.imgui, available);
    end
    imgui.Separator();
    imgui.PushID(active);
    draw_page(pages[active], settings);
    imgui.PopID();
    return revealed;
end

return navigation;
