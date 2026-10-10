-- Fixed Monster data for settings, text hover and large-font layout checks.
return function (scene)
    local s = MOCK.settings.current;
    local window = require('ui.settings_window');
    local row = { name = 'Monster details example', low = 70, high = 75, info = { sections = {
        { id = 'family', label = 'Family', value = 'Goblins', notes = { 'From the stored family data.' } },
        { id = 'charm', label = 'Charm', value = 'Unknown', notes = { 'The source does not establish whether Charm can land.' } },
        { id = 'vitals', label = 'HP and MP', value = 'HP ~4,210-4,840, MP unknown',
            notes = { 'These are source maximums, not current HP or MP. Fight scaling and scripts can change them.' } },
        { id = 'blue', label = 'Blue Magic', value = 'Bomb Toss (not learned), Frypan (learned)',
            notes = { 'You must see the eligible move. The client spell list says whether you already know the spell.' } },
        { id = 'fight', label = 'Fight rules', value = 'Time limit: 30 minutes',
            notes = { 'This is the source limit, not time remaining in the current fight.' } },
    } } };
    for _, id in ipairs(require('core.parts').INFO_IDS) do s.printout.parts[id].on, s.overlay.parts[id] = true, true; end
    window.set_target_details(row);
    local function set_upvalue(fn, name, value)
        for i = 1, 100 do
            local key, item = debug.getupvalue(fn, i);
            if (key == nil) then break; end
            if (key == name) then item[1] = value; return; end
        end
        error('Preview search field was not found: ' .. name);
    end
    if (scene == 'search') then
        set_upvalue(window.draw_search, 'query', 'Show script warning');
    elseif (scene == 'details_search') then
        set_upvalue(window.draw_target_details, 'details_query', 'eligible');
    elseif (scene == 'undo') then
        local profiles = require('ui.profiles');
        profiles.save(s, 'Saved layout');
        s.job_links.WAR = 'Saved layout';
        profiles.delete(s, 'Saved layout');
    elseif (scene == 'overlay') then
        require('core.target').read = function () return 98; end;
        require('core.target').readout = function () return row; end;
        for key in pairs(s.overlay.parts) do s.overlay.parts[key] = require('core.parts').INFO_SET[key] == true; end
        s.overlay.on, s.overlay.icons, s.overlay.tips = true, false, true;
        s.overlay.font_size, s.overlay.wrap = 28, 310;
        s.window.overlay_x, s.window.overlay_y = 24, 40;
        require('ui.overlay').changed(s);
        window.set_open(false);
    end
end;
