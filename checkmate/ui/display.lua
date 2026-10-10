-- Chat and overlay share their row order, labels and line breaks.
local imgui = require('imgui');
local overlay = require('ui.overlay');
local search = require('ui.search');
local display = {};
local enabled = { false };
local unavailable = { value = false };
local expanded;
local saved_order, ordered = nil, {};
local TABLE_FLAGS = bit.bor(ImGuiTableFlags_RowBg, ImGuiTableFlags_BordersInnerH, ImGuiTableFlags_SizingStretchProp);

local function rows(settings)
    local order = settings.printout.order;
    if (saved_order ~= order) then
        saved_order, ordered = order, {};
        for id in order:gmatch('%S+') do ordered[#ordered + 1] = id; end
    end
    return ordered;
end

local function label(ui, id)
    return ui.names[id] or (id == 'name' and 'Name and level') or (id == 'reading' and 'Evasion and defense') or id;
end

local function shown(settings, id)
    if (not enabled[1] or search.active()) then return true; end
    return settings.printout.parts[id].on == true or (overlay.is_part(id) and settings.overlay.parts[id] == true);
end

local function tip(ui, id)
    return ui.tips[id] or ui.overlay_tips[id];
end

local function wrapped(text)
    imgui.AlignTextToFramePadding();
    imgui.PushTextWrapPos(0);
    imgui.TextUnformatted(text);
    imgui.PopTextWrapPos();
end

local function hover_tip(text)
    if (text == nil or not imgui.IsItemHovered(ImGuiHoveredFlags_AllowWhenDisabled)) then return; end
    imgui.BeginTooltip();
    imgui.PushTextWrapPos(360 * imgui.GetFontSize() / 18);
    imgui.TextUnformatted(text);
    imgui.PopTextWrapPos();
    imgui.EndTooltip();
end

local function options(ui, id)
    if (imgui.Button('Options')) then ui.options(id); end
    search.mark('Options ' .. label(ui, id), 'Opens the settings for this row.');
    hover_tip('Opens the settings for this row.');
end

local function line(settings, ui, id)
    local fixed = id == 'name' or id == 'reading';
    ui.checkbox('##new_line', settings.printout.parts[id], 'new_line', nil, fixed);
    search.mark('New line ' .. label(ui, id));
end

local function controls(settings, ui, id, index, count)
    local part = settings.printout.parts[id];
    ui.text_box('##label', part, 'label', -1, ui.label_max or 24, nil, id == 'reading');
    search.mark('Label ' .. label(ui, id));
    imgui.TableNextColumn();
    line(settings, ui, id);
    imgui.TableNextColumn();
    if (index ~= nil) then
        ui.move(settings.printout, id, index, count);
        search.mark('Order ' .. label(ui, id));
    else wrapped('-'); end
end

local function begin_table(wide, suffix)
    if (not imgui.BeginTable('##display_parts' .. suffix, wide and 7 or 4, TABLE_FLAGS)) then return false; end
    local scale = imgui.GetFontSize() / 18;
    imgui.TableSetupColumn('Part', ImGuiTableColumnFlags_WidthStretch, wide and 1.2 or 1);
    imgui.TableSetupColumn('Chat', ImGuiTableColumnFlags_WidthFixed, 38 * scale);
    imgui.TableSetupColumn('Overlay', ImGuiTableColumnFlags_WidthFixed, 60 * scale);
    if (wide) then
        imgui.TableSetupColumn('Label', ImGuiTableColumnFlags_WidthStretch, 1);
        imgui.TableSetupColumn('New line', ImGuiTableColumnFlags_WidthFixed,
            math.max(78 * scale, imgui.CalcTextSize('New line') + 16 * scale));
        imgui.TableSetupColumn('Order', ImGuiTableColumnFlags_WidthFixed, 56 * scale);
    end
    imgui.TableSetupColumn('Options', ImGuiTableColumnFlags_WidthFixed, 92 * scale);
    if (suffix == '') then imgui.TableHeadersRow(); end
    return true;
end

local function editor(settings, ui, id, index, count)
    imgui.PushID(id);
    wrapped(label(ui, id) .. ' layout');
    ui.text_box('Label', settings.printout.parts[id], 'label', math.max(80, imgui.GetContentRegionAvail() * 0.55),
        ui.label_max or 24, 'The row label used in chat and the overlay.', id == 'reading');
    ui.checkbox('New line', settings.printout.parts[id], 'new_line',
        'Starts this part on a new line. Overlay can also put every part on its own line.', id == 'name' or id == 'reading');
    if (index ~= nil) then
        wrapped('Order');
        imgui.SameLine();
        ui.move(settings.printout, id, index, count);
    end
    imgui.Separator();
    imgui.PopID();
end

function display.draw(settings, ui)
    imgui.Checkbox('Enabled only', enabled);
    ui.help('Shows rows selected for chat or the overlay. Hidden rows keep their place in the order.');
    local order = rows(settings);
    local wide = imgui.GetContentRegionAvail() >= 850 * imgui.GetFontSize() / 18;
    if (not wide) then ui.note('Use + beside a row to edit its label, line break and order.'); end
    local in_table = begin_table(wide, '');
    if (not in_table) then return; end
    local function draw_row(id, index)
        if (settings.printout.parts[id] == nil or not shown(settings, id)) then return; end
        imgui.PushID(id);
        imgui.TableNextRow();
        imgui.TableNextColumn();
        if (not wide) then
            if (imgui.Button((expanded == id and '-' or '+') .. '##layout')) then
                expanded = expanded == id and nil or id;
            end
            ui.help('Edits this row\'s label, line break and order.');
            imgui.SameLine();
        end
        wrapped(label(ui, id));
        search.mark(label(ui, id), tip(ui, id));
        hover_tip(tip(ui, id));
        imgui.TableNextColumn();
        ui.checkbox('##chat', settings.printout.parts[id], 'on');
        search.mark('Chat ' .. label(ui, id));
        imgui.TableNextColumn();
        local supported = overlay.is_part(id);
        unavailable.value = false;
        ui.checkbox('##overlay', supported and settings.overlay.parts or unavailable, supported and id or 'value', nil, not supported);
        search.mark('Overlay ' .. label(ui, id));
        hover_tip(supported and ui.overlay_tips[id] or 'This row is available in chat only.');
        imgui.TableNextColumn();
        if (wide) then controls(settings, ui, id, index, #order); imgui.TableNextColumn(); end
        options(ui, id);
        imgui.PopID();
        if (not wide and (expanded == id or search.active())) then
            imgui.EndTable();
            editor(settings, ui, id, index, #order);
            in_table = begin_table(false, '_' .. id);
        end
    end
    draw_row('name');
    for index, id in ipairs(order) do
        if (not in_table) then break; end
        draw_row(id, index);
        if (in_table and id == 'difficulty') then draw_row('reading'); end
    end
    if (in_table) then imgui.EndTable(); end
end

return display;
