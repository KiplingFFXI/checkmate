--[[
    The overlay scenes all_tabs.py renders. With preview.py --full running the whole addon,

        --exec "dofile('<this file>')('after')"

    turns the overlay on in Valkurm Dunes with its real data and sets up one scene. Every scene but the
    sample closes the settings window, so the crop (--window checkmate_overlay) shows the overlay alone.

    sample              the sample goblin, with the settings window open and nothing targeted
    before, after       Goblin Tinkerer before and after a /check, with every part but crit and magic on, and
                        the level range, ID and PH note
    nm                  Valkurm Emperor after a /check, which can't be gauged
    nodata              a placed monster missing from the data
    links               Goblin Tinkerer after a /check, with Most names shown set to All
    nowrap              the same with Wrap lines wider than set to Never
    no_background       after, with Background at 0%
    no_border           after, with Border off
    verdana_24          after, in Verdana at 24 px
    ashita_12           after, in Ashita's font at 12 px
    crit_magic          Goblin Tinkerer before a /check, with crit and magic on for a level 20 BLM
    job                 a Fire Elemental after a /check, with the Job part on and pictures for its two heads
    job_icons_only      the same with Icons only on
    shift               after, with Shift held, so its corner shows. The preview has no mouse, so the corner is
                        in the skin's Resize corner color, not the hovered or held one
    skin_<id>           after, in each skin

    The icon scenes are the sample goblin with the settings window open, like sample, with Elemental magic,
    immunities, elements, drops, steal and its jobs on, and pictures for its items, its statuses and its two
    jobs' heads. The preview has no game art, so a game picture is a grey box with a cross.

    icons               the game's pictures for everything
    icons_badges        Element look set to Colored badges
    icons_only          badges, with Icons only on
    icons_off           Show icons off
    icons_12, icons_24  badges, at font size 12 and 24
    badges_<id>         badges, in each skin

    The tip scenes are the same sample goblin with its pictures, with one part shown, for preview.py
    --mouse-icon 1, which rests the mouse on the part's first icon so its tip shows.

    tip_element         Elements, on Ice
    tip_school          Magic with Elemental on, on the element after it
    tip_drop            Drops, on Beastman Blood
    tip_steal           Steal, on Beastcoin
    tip_immunity        Immunities, on Sleep
    tip_job             Job, on DRK's head
    tip_12, tip_24      tip_element at font size 12 and 24
    tip_skin_<id>       tip_element in each skin
]]

local ITEMS = { [507] = 'Goblin Mail', [508] = 'Goblin Helm', [656] = 'Beastcoin', [930] = 'Beastman Blood',
    [4104] = 'Fire Cluster' };
for id, name in pairs(ITEMS) do
    MOCK.items[id] = { Name = { name } };
end

-- Your /check of the monster at `index`. The reading and defense are 0 for high, 1 for normal and 2 for low.
local function check(index, level, con, reading, defense)
    MOCK.packet(MOCK.check_packet(index, level, con, 170 + reading * 3 + defense));
end
local function command(text)
    MOCK.command('/checkmate ' .. text);
end
-- Pictures for the sample goblin's items, its statuses and its two jobs' heads.
local function sample_pictures()
    for _, id in ipairs({ 507, 508, 656, 930, 12516, 12511 }) do
        MOCK.picture('item', id);
    end
    for _, id in ipairs({ 2, 4, 11, 12, 13, 40, 178, 179, 180, 181, 182, 183, 184, 185 }) do
        MOCK.picture('status', id);
    end
end
-- The part each tip scene shows.
local TIP_PARTS = { tip_element = 'elements', tip_school = 'magic', tip_drop = 'drops', tip_steal = 'steal',
    tip_immunity = 'immunities', tip_job = 'job', tip_effect = 'effects' };

return function (scene)
    MOCK.player.zone, MOCK.player.main_level = 103, 20;
    MOCK.zone_in(103);
    MOCK.monster(98, 'Goblin Tinkerer');
    MOCK.monster(82, 'Fire Elemental');
    MOCK.monster(334, 'Valkurm Emperor');
    MOCK.monster(2000, 'Mysterious Bug');
    -- preview.py reads the chat lines as text, and the chat's star divider isn't UTF-8, so the chat uses the pipe
    -- here. The overlay has a divider of its own.
    command('divider pipe');
    command('overlay on');
    for key in pairs(MOCK.settings.current.weaknesses.overlay) do
        MOCK.settings.current.weaknesses.overlay[key] = false;
    end
    local function show(part)
        if (part == 'elements' or part == 'immunities' or part == 'weapons' or part == 'charm') then
            command('weakness ' .. part .. ' overlay on');
            command('overlayshow weaknesses');
        else
            command('overlayshow ' .. part);
        end
    end
    if (scene:find('^effects')) then
        command('overlayspot 20 620');
        for key in pairs(MOCK.settings.current.overlay.parts) do
            MOCK.settings.current.overlay.parts[key] = key == 'name' or key == 'effects';
        end
        command('overlayshow effects');
        sample_pictures();
        if (scene == 'effects_only') then command('overlayiconsonly on'); end
        if (scene == 'effects_off') then command('overlayicons off'); end
        if (scene == 'effects_12') then command('overlayfontsize 12'); end
        if (scene == 'effects_24') then command('overlayfontsize 24'); end
        if (scene == 'effects_wrap') then command('overlaywrap 160'); end
        return;
    end
    if (scene == 'sample') then
        -- Below the settings window, so it doesn't sit behind it.
        command('overlayspot 20 620');
        return;
    end
    if (scene:find('^icons') or scene:find('^badges_')) then
        command('overlayspot 20 620');
        command('school elemental on');
        for _, part in ipairs({ 'magic', 'immunities', 'elements', 'drops', 'steal', 'job' }) do
            show(part);
        end
        sample_pictures();
        if (scene ~= 'icons' and scene ~= 'icons_off') then
            command('overlayelementlook badges');
        end
        if (scene == 'icons_only') then
            command('overlayiconsonly on');
        elseif (scene == 'icons_off') then
            command('overlayicons off');
        elseif (scene == 'icons_12') then
            command('overlayfontsize 12');
        elseif (scene == 'icons_24') then
            command('overlayfontsize 24');
        elseif (scene:find('^badges_')) then
            command('skin ' .. scene:sub(8));
        end
        return;
    end
    if (scene:find('^tip_')) then
        command('overlayspot 20 620');
        command('school elemental on');
        show(TIP_PARTS[scene] or 'elements');
        sample_pictures();
        if (scene == 'tip_12') then
            command('overlayfontsize 12');
        elseif (scene == 'tip_24') then
            command('overlayfontsize 24');
        elseif (scene:find('^tip_skin_')) then
            command('skin ' .. scene:sub(10));
        end
        return;
    end
    require('ui.settings_window').set_open(false);

    if (scene == 'nm') then
        MOCK.level_up(43);
        MOCK.target_monster(334, 'Valkurm Emperor');
        MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(103, 334), 0, 0, 249, 334));
        return;
    elseif (scene == 'nodata') then
        MOCK.target_monster(2000, 'Mysterious Bug');
        return;
    elseif (scene == 'crit_magic') then
        MOCK.player.skills = { [35] = 62, [36] = 60 };
        command('school elemental on');
        command('school enfeebling on');
        command('overlayshow crit');
        command('overlayshow magic');
        MOCK.target_monster(98, 'Goblin Tinkerer');
        return;
    elseif (scene == 'job' or scene == 'job_icons_only') then
        -- A level 39 one checks Incredibly Tough to a level 20. Its heads are BLM's and RDM's.
        command('overlayshow job');
        MOCK.picture('item', 13856);
        MOCK.picture('item', 12513);
        if (scene == 'job_icons_only') then
            command('overlayiconsonly on');
        end
        MOCK.target_monster(82, 'Fire Elemental');
        check(82, 39, 7, 1, 1);
        return;
    end

    MOCK.target_monster(98, 'Goblin Tinkerer');
    if (scene == 'before' or scene == 'after') then
        for _, part in ipairs({ 'immunities', 'elements', 'drops', 'steal' }) do
            show(part);
        end
        command('overlayrange on');
        command('overlayid on');
        command('overlayph on');
    end
    if (scene ~= 'before') then
        check(98, 19, 3, 2, 1);
    end
    if (scene == 'links' or scene == 'nowrap') then
        command('maxlinks 0');
    end
    if (scene == 'nowrap') then
        command('overlaywrap 0');
    elseif (scene == 'no_background') then
        command('overlayopacity 0');
    elseif (scene == 'no_border') then
        command('overlayborder off');
    elseif (scene == 'verdana_24') then
        command('overlayfont verdana');
        command('overlayfontsize 24');
    elseif (scene == 'ashita_12') then
        command('overlayfontsize 12');
    elseif (scene == 'shift') then
        MOCK.shift = true;
    elseif (scene:find('^skin_')) then
        command('skin ' .. scene:sub(6));
    end
end
