-- Browse listed spell locations without targeting a monster or sending commands.
local imgui = require('imgui');
local finder = require('core.blue_finder');
local player = require('core.player');
local ui = {};
local spell_query, place_query = { '' }, { '' };
local unlearned, this_zone = { true }, { false };
local selected, copied;
local spell_page, place_page, last_choices, last_places = 1, 1;
local spell_scroll, place_scroll = false, false;
local PAGE_SIZE = 20;

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

local function pages(page, count, kind, panel)
    local total = math.max(1, math.ceil(count / PAGE_SIZE));
    page = math.max(1, math.min(total, page));
    if (total == 1) then return page, false; end
    local before = page;
    imgui.PushID('finder_' .. kind .. '_pages');
    imgui.BeginDisabled(page == 1);
    if (imgui.Button('Previous ' .. kind)) then page = page - 1; end
    imgui.EndDisabled();
    panel.control_help('Shows the previous page of matching ' .. kind .. '.', 'Previous ' .. kind);
    imgui.SameLine();
    imgui.TextUnformatted(('Page %d of %d'):format(page, total));
    imgui.SameLine();
    imgui.BeginDisabled(page == total);
    if (imgui.Button('Next ' .. kind)) then page = page + 1; end
    imgui.EndDisabled();
    panel.control_help('Shows the next page of matching ' .. kind .. '.', 'Next ' .. kind);
    imgui.PopID();
    return page, page ~= before;
end

function ui.draw(settings)
    local panel = require('ui.settings_window');
    if (not panel.section_open('SPELL FINDER', 'Find a BLU spell, then browse monsters and zones where it can be learned.')) then return; end
    local source, err = finder.catalog();
    if (source == nil) then note(err); return; end
    local available = imgui.GetContentRegionAvail();
    local scale = (settings.look.font_size or 18) / 18;
    imgui.SetNextItemWidth(math.max(100, math.min(240 * scale, available - 180 * scale)));
    if (imgui.InputText('Find a BLU spell', spell_query, 128)) then copied = nil; end
    panel.control_help('Search the spell finder by spell name.', 'Find a BLU spell');
    clear(spell_query, 'finder_spell', panel);
    imgui.Checkbox('Find only unlearned spells', unlearned);
    panel.control_help('Hides spells your client says you know. Unreadable spellbook entries stay visible.', 'Find only unlearned spells');
    local choices = finder.spells(spell_query[1], unlearned[1]);
    if (choices ~= last_choices) then spell_page, last_choices, spell_scroll = 1, choices, true; end
    local chosen;
    for _, entry in ipairs(choices) do if (entry.spell.id == selected) then chosen = entry; end end
    if (chosen == nil) then selected = nil; end
    note(('%d matching spell%s.'):format(#choices, #choices == 1 and '' or 's'));
    if (#choices == 0) then
        note('Clear the search or turn off Find only unlearned spells to see more spells.');
        return;
    end
    local moved;
    spell_page, moved = pages(spell_page, #choices, 'spells', panel);
    spell_scroll = spell_scroll or moved;
    if (imgui.BeginChild('##finder_spells', { 0, math.min(180, 26 * #choices + 8) * scale }, 0, 0)) then
        if (spell_scroll) then imgui.SetScrollY(0); spell_scroll = false; end
        for i = (spell_page - 1) * PAGE_SIZE + 1, math.min(spell_page * PAGE_SIZE, #choices) do
            local entry = choices[i];
            if (imgui.Selectable(entry.spell.name .. ' (' .. finder.state(entry.known) .. ')##' .. entry.spell.id,
                entry.spell.id == selected)) then
                selected, chosen, copied = entry.spell.id, entry, nil;
            end
        end
    end
    imgui.EndChild();
    if (chosen == nil) then note('Choose a spell to see where it can be learned.'); return; end
    local spell = chosen.spell;
    imgui.Separator();
    note(spell.name .. ' (' .. finder.state(chosen.known) .. ')');
    note('Minimum Blue Magic skill: ' .. tostring(spell.min_skill or 'unknown') .. '.');
    note(finder.LIMITS);
    imgui.SetNextItemWidth(math.max(100, math.min(240 * scale, available - 230 * scale)));
    if (imgui.InputText('Find a monster or zone', place_query, 128)) then copied = nil; end
    panel.control_help('Find listed locations by monster, zone or condition.', 'Find a monster or zone');
    clear(place_query, 'finder_place', panel);
    if (imgui.Checkbox('Monsters in this zone', this_zone)) then copied = nil; end
    panel.control_help('Shows listed monsters in your current zone. It does not check whether they are there now.', 'Monsters in this zone');
    local zone = player.zone();
    local places = finder.places(spell, place_query[1], this_zone[1] and (zone or -1) or nil);
    if (places ~= last_places) then place_page, last_places, place_scroll = 1, places, true; end
    note(('%d matching place%s.'):format(#places, #places == 1 and '' or 's'));
    if (#places == 0) then
        note('No listed locations match these filters. Clear the search or turn off Monsters in this zone.');
        return;
    end
    if (imgui.Button('Copy places')) then
        local ok = pcall(imgui.SetClipboardText, finder.copy(spell, places));
        copied = ok and 'Copied the matching places.' or 'Copy is unavailable. The places are shown below.';
    end
    panel.control_help('Copies every matching location and its conditions.', 'Copy places');
    if (copied ~= nil) then note(copied); end
    place_page, moved = pages(place_page, #places, 'places', panel);
    place_scroll = place_scroll or moved;
    -- Long location lists stay inside the finder instead of stretching the whole settings page.
    if (imgui.BeginChild('##finder_places', { 0, 260 * scale }, 0, 0)) then
        if (place_scroll) then imgui.SetScrollY(0); place_scroll = false; end
        for i = (place_page - 1) * PAGE_SIZE + 1, math.min(place_page * PAGE_SIZE, #places) do
            local place = places[i];
            local expanded = imgui.CollapsingHeader(place.name .. '##place_' .. i, 0);
            note(place.zone_name .. ' - ' .. finder.level_text(place));
            if (place.incomplete) then note('Learnable spell list incomplete.'); end
            if (expanded) then
                for _, line in ipairs(place.context or {}) do note(line); end
                for _, line in ipairs(place.notes or {}) do note(line); end
            end
        end
    end
    imgui.EndChild();
end

return ui;
