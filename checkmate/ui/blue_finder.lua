-- Browse source lesson locations without targeting a monster or sending commands.
local imgui = require('imgui');
local finder = require('core.blue_finder');
local player = require('core.player');
local ui = {};
local spell_query, place_query = { '' }, { '' };
local unlearned, this_zone = { true }, { false };
local selected, copied;

local function note(text)
    imgui.PushTextWrapPos(0);
    imgui.TextUnformatted(text);
    imgui.PopTextWrapPos();
end

local function clear(box, id, panel)
    if (box[1] ~= '') then
        if (imgui.Button('Clear##' .. id)) then box[1], copied = '', nil; end
        panel.control_help('Clears this search without changing the other finder filters.', 'Clear');
    end
end

function ui.draw(settings)
    local panel = require('ui.settings_window');
    if (not panel.section_open('SPELL FINDER', 'Find a Blue Magic spell, then browse monsters and zones with a supported lesson.')) then return; end
    local source, err = finder.catalog();
    if (source == nil) then note(err); return; end
    local available = imgui.GetContentRegionAvail();
    local scale = (settings.look.font_size or 18) / 18;
    imgui.SetNextItemWidth(math.max(100, math.min(240 * scale, available - 180 * scale)));
    if (imgui.InputText('Find a Blue spell', spell_query, 128)) then copied = nil; end
    panel.control_help('Search the spell finder by lesson name.', 'Find a Blue spell');
    clear(spell_query, 'finder_spell', panel);
    imgui.Checkbox('Unlearned spells only', unlearned);
    panel.control_help('Hides spells your client says you know. Unreadable spellbook entries stay visible.', 'Unlearned spells only');
    local choices = finder.spells(spell_query[1], unlearned[1]);
    local chosen;
    for _, entry in ipairs(choices) do if (entry.spell.id == selected) then chosen = entry; end end
    if (chosen == nil) then selected = nil; end
    note(('%d matching spell%s.'):format(#choices, #choices == 1 and '' or 's'));
    if (#choices == 0) then
        note('Clear the search or turn off Unlearned spells only to see more spells.');
        return;
    end
    if (imgui.BeginChild('##finder_spells', { 0, math.min(180, 26 * #choices + 8) * scale }, 0, 0)) then
        for _, entry in ipairs(choices) do
            if (imgui.Selectable(entry.spell.name .. ' (' .. finder.state(entry.known) .. ')##' .. entry.spell.id,
                entry.spell.id == selected)) then
                selected, chosen, copied = entry.spell.id, entry, nil;
            end
        end
    end
    imgui.EndChild();
    if (chosen == nil) then note('Choose a spell to see its source locations.'); return; end
    local spell = chosen.spell;
    imgui.Separator();
    note(spell.name .. ' (' .. finder.state(chosen.known) .. ')');
    note('Minimum Blue Magic skill: ' .. tostring(spell.min_skill or 'unknown') .. '.');
    note(finder.LIMITS);
    imgui.SetNextItemWidth(math.max(100, math.min(240 * scale, available - 230 * scale)));
    if (imgui.InputText('Find a monster or zone', place_query, 128)) then copied = nil; end
    panel.control_help('Filter the selected spell\'s source places by monster, zone or condition.', 'Find a monster or zone');
    clear(place_query, 'finder_place', panel);
    if (imgui.Checkbox('Monsters in this zone', this_zone)) then copied = nil; end
    panel.control_help('Only source entries in your current zone. This does not check whether monsters are present.', 'Monsters in this zone');
    local zone = player.zone();
    local places = finder.places(spell, place_query[1], this_zone[1] and (zone or -1) or nil);
    note(('%d matching place%s.'):format(#places, #places == 1 and '' or 's'));
    if (#places == 0) then
        note('No source places match these filters. Clear the search or turn off Monsters in this zone.');
        return;
    end
    if (imgui.Button('Copy places')) then
        local ok = pcall(imgui.SetClipboardText, finder.copy(spell, places));
        copied = ok and 'Copied the matching places.' or 'Copy is unavailable. The places are shown below.';
    end
    panel.control_help('Copies every matching source place and its conditions.', 'Copy places');
    if (copied ~= nil) then note(copied); end
    -- Long location lists stay inside the finder instead of stretching the whole settings page.
    if (imgui.BeginChild('##finder_places', { 0, 260 * scale }, 0, 0)) then
        for i, place in ipairs(places) do
            local expanded = imgui.CollapsingHeader(place.name .. '##place_' .. i, 0);
            note(place.zone_name .. ' - ' .. finder.level_text(place));
            if (place.incomplete) then note('Lesson list incomplete.'); end
            if (expanded) then
                for _, line in ipairs(place.context or {}) do note(line); end
                for _, line in ipairs(place.notes or {}) do note(line); end
            end
        end
    end
    imgui.EndChild();
end

return ui;
