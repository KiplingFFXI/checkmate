-- Actual text-hover paths, with every icon off. Use --mouse-text and --frames 40.
local base = dofile(ADDON_DIR .. '/../tests/preview/overlay_scene.lua');
return function (scene)
    base('after');
    local function command(text) MOCK.command('/checkmate ' .. text); end
    command('overlayspot 24 40');
    command('overlayicons off');
    command('overlaytips on');
    local s = MOCK.settings.current;
    for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'name'; end
    if (scene == 'details') then
        MOCK.player.zone, MOCK.player.main_level = 134, 75;
        MOCK.zone_in(134);
        MOCK.target_monster(2, 'Vanguard Liberator');
        command('overlayshow links');
        command('maxlinks 1');
        require('ui.settings_window').set_open(true);
    elseif (scene == 'magic') then
        MOCK.player.skills = { [35] = 62, [36] = 60 };
        command('school elemental on');
        command('overlayshow magic');
    elseif (scene == 'links') then
        command('overlayshow links');
        command('maxlinks 1');
    elseif (scene == 'ph') then
        MOCK.target_monster(330, 'Damselfly');
        MOCK.packet(MOCK.check_packet(330, 21, 5, 174));
        command('overlayph on');
    else
        command('overlayrange on');
    end
    require('ui.overlay').changed(s);
end;
