-- Profile labels must not become ImGui IDs or lose text after hash markers.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local profiles = require('ui.profiles');
local window = require('ui.settings_window');
local imgui = require('imgui');
local s = MOCK.settings.current;
local names = { 'A###same', 'B###same', 'Tank##day' };
for i, name in ipairs(names) do
    s.drops.th = i;
    check('save literal profile ' .. name, profiles.save(s, name));
end
s.drops.th = 0;
MOCK.command('/checkmate');
local literal, unsafe = {}, {};
local selectable = imgui.Selectable;
imgui.Selectable = function (label, ...)
    for _, name in ipairs(names) do
        if (label == name) then unsafe[#unsafe + 1] = label; end
    end
    return selectable(label, ...);
end
local draw_list, wrapped = imgui.GetWindowDrawList, false;
imgui.GetWindowDrawList = function (...)
    local list = draw_list(...);
    if (not wrapped) then
        wrapped = true;
        local add_text = list.AddText;
        list.AddText = function (self, ...)
            local count = select('#', ...);
            literal[({ ... })[count]] = true;
            return add_text(self, ...);
        end
    end
    return list;
end
local function frame()
    literal = {};
    local ok, why = pcall(MOCK.frame);
    if (not ok) then error(tostring(why) .. '\n' .. table.concat(MOCK.printed, '\n')); end
end
frame();
for _, name in ipairs(names) do check('render the complete name ' .. name, literal[name] == true); end
expect('profile names never enter the selectable label parser', #unsafe, 0);
for i, name in ipairs(names) do
    MOCK.clicks['Profiles/##profiles/' .. i .. '/##profile'] = true;
    frame();
    MOCK.clicks['Profiles/Load'] = true;
    frame();
    expect('load uses the exact saved key ' .. name, MOCK.settings.current.drops.th, i);
end
MOCK.open['Profiles/##WAR'] = true;
MOCK.clicks['Profiles/##WAR/2/##profile'] = true;
frame();
expect('a job link keeps the exact selected profile key', MOCK.settings.current.job_links.WAR, names[2]);
frame();
check('the linked name is drawn literally in the closed preview area', literal[names[2]] == true);
expect('the combo preview parser receives no hash-bearing name', MOCK.gui.previews['Profiles/##WAR'], '');
expect('job link choices also avoid parsed profile names', #unsafe, 0);
MOCK.open['Profiles/##WAR'] = nil;
check('all saved keys remain unchanged', profiles.exists(names[1]) and profiles.exists(names[2]) and profiles.exists(names[3]));
return MOCK.report();
