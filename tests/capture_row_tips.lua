-- Records direct Display hover text alongside the mock's question-mark tips.
return function (draw)
    local imgui = require('imgui');
    local original, stack, found = {}, {}, {};
    local widget, contents, owner;
    for _, key in ipairs({ 'PushID', 'PopID', 'TextUnformatted', 'Checkbox', 'Button', 'BeginTooltip', 'EndTooltip' }) do
        original[key] = imgui[key];
    end
    imgui.PushID = function (id) stack[#stack + 1] = tostring(id); return original.PushID(id); end;
    imgui.PopID = function () stack[#stack] = nil; return original.PopID(); end;
    imgui.TextUnformatted = function (text)
        if (contents) then contents[#contents + 1] = text; else widget = 'text'; end
        return original.TextUnformatted(text);
    end;
    imgui.Checkbox = function (label, ...) widget = label; return original.Checkbox(label, ...); end;
    imgui.Button = function (label, ...) widget = label; return original.Button(label, ...); end;
    imgui.BeginTooltip = function ()
        if (stack[1] == 'Display' and #stack == 2 and (widget == 'text' or widget == '##overlay')) then
            owner = table.concat(stack, '/') .. (widget == 'text' and '/##row_tip' or '/##overlay_tip');
            contents = {};
        elseif (#stack == 0 and (widget == 'Preview##toolbar' or widget == 'Target details##toolbar')) then
            owner, contents = widget, {};
        end
        return original.BeginTooltip();
    end;
    imgui.EndTooltip = function ()
        if (owner) then found[owner] = table.concat(contents, ' '); end
        owner, contents = nil, nil;
        return original.EndTooltip();
    end;
    local ok, failure = pcall(draw);
    for key, value in pairs(original) do imgui[key] = value; end
    if (not ok) then error(failure); end
    for path, text in pairs(found) do MOCK.gui.tips[path] = text; end
    return MOCK.gui.tips;
end;
