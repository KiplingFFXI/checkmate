-- Every visible control can be found by the name shown in the window.
local defaults = require('ui.defaults');
local window = require('ui.settings_window');
local s = defaults.make();
require('ui.skins').fill(s);
window.set_open(true);
window.draw(s, 'test');
local routes = {
    { 'Pets/Show its name', 'Numbers/Show its name', 'Checkbox' },
    { 'Pets/pet/In overlay', 'Overlay/Pet', 'Checkbox' },
    { 'Weaknesses/Weak word', 'Magic/Weak word', 'InputText' },
    { 'Weaknesses/Weapon weak word', 'Magic/Weapon weak word', 'InputText' },
    { 'Weaknesses/dark_sleep/##on', 'Immunities/dark_sleep/##on', 'Checkbox' },
    { 'Weaknesses/components/charm/##chat', 'Monster/Charm', 'Checkbox' },
    { 'Aggro/pursuit/In chat', 'Monster/Pursuit', 'Checkbox' },
    { 'Blue Magic/components/lessons/##chat', 'Monster/Blue Magic', 'Checkbox' },
    { 'Blue Magic/components/chance/##overlay', 'Magic/blue/Blue', 'Checkbox' },
    { 'Effects/Time left', 'Immunities/Time left', 'Checkbox' },
    { 'Monster/Copy details', 'Diagnostics/Copy summary', 'Button' },
    { 'Appearance/Font', 'Look/Font', 'BeginCombo' },
    { 'Appearance/##hit_label', 'Colors/##hit_label', 'BeginCombo' },
    { 'Abbreviations/In chat', 'Short/In chat', 'Checkbox' },
};
for _, route in ipairs(routes) do
    check('control moved to ' .. route[1], MOCK.gui.paths[route[1]] == route[3]
        and MOCK.gui.paths[route[2]] == nil);
end
check('removed tabs never draw', MOCK.gui.tabs.Immunities == nil and MOCK.gui.tabs.Diagnostics == nil
    and MOCK.gui.tabs.Colors == nil and MOCK.gui.tabs.Look == nil and MOCK.gui.tabs.Short == nil);
local monster_options = 0;
for _, section in ipairs(window.INFO_SECTIONS) do
    if (section[4] == nil) then
        for _, label in ipairs({ '##chat', '##overlay' }) do
            local found = MOCK.gui.paths['Monster/' .. section[1] .. '/' .. label] == 'Checkbox';
            check('Monster matrix keeps ' .. section[1] .. ' ' .. label, found);
            if (found) then monster_options = monster_options + 1; end
        end
        check('Monster category remains searchable by its visible name: ' .. section[2], window.search_tabs(section[2]).Monster == true);
    end
end
expect('all metadata sections remain available', #window.INFO_SECTIONS, 13);
expect('Monster has separate chat and overlay controls for ten facts', monster_options, 20);
local count = 0;
for path, widget in pairs(MOCK.gui.paths) do
    local tab, label = path:match('^([^/]+)/.*[/]([^/]+)$');
    if (tab == nil) then tab, label = path:match('^([^/]+)/([^/]+)$'); end
    local finder_result = tab == 'Blue Magic' and ((widget == 'Selectable' and path:match('##%d+$'))
        or (widget == 'CollapsingHeader' and path:match('##place_%d+$')));
    if (tab and MOCK.gui.tabs[tab] and not finder_result and label:sub(1, 2) ~= '##' and label ~= '(?)') then
        label = label:gsub('##.*$', '');
        if (#label > 2 and not label:match('^[%p%s]+$')) then
            count = count + 1;
            check('search finds ' .. tab .. ': ' .. label, window.search_tabs(label)[tab] == true);
        end
    end
end
check('search checked the visible controls', count > 100, count);
check('help wording is searchable', window.search_tabs('available receive').Drops == true);
check('literal search treats punctuation as text', next(window.search_tabs('.*')) == nil);
for _, route in ipairs({
    { 'Show its name', 'Pets', 'Numbers' },
    { 'Show script warning', 'Weaknesses', 'Magic' },
    { 'Time left', 'Effects', 'Immunities' },
    { 'Pursuit', 'Aggro', 'Monster' },
    { 'Charm', 'Weaknesses', 'Monster' },
    { 'Find target details', 'Monster', 'Diagnostics' },
}) do
    local found = window.search_tabs(route[1]);
    check('search routes ' .. route[1] .. ' to its current tab', found[route[2]] == true and found[route[3]] == nil);
end
check('removed diagnostic search topic stays absent', next(window.search_tabs('diagnostics')) == nil);
-- Opening the window leaves display choices alone and sends nothing.
s.pet.show_name, s.pet.hit_word = false, 'Accuracy';
s.elements.script_mark, s.weapons.weak_word = false, 'Vulnerable';
s.immunities.bind.on, s.effects.times = false, false;
s.weaknesses.chat.charm, s.weaknesses.overlay.charm = false, true;
s.printout.parts.pursuit.on, s.overlay.parts.pursuit = true, false;
s.blue.chat.lessons, s.blue.overlay.chance = false, true;
local saves = MOCK.saved;
window.draw(s, 'test');
check('opening preserves independent display values', not s.pet.show_name and s.pet.hit_word == 'Accuracy'
    and not s.elements.script_mark and s.weapons.weak_word == 'Vulnerable' and not s.immunities.bind.on
    and not s.effects.times and not s.weaknesses.chat.charm and s.weaknesses.overlay.charm
    and s.printout.parts.pursuit.on and not s.overlay.parts.pursuit
    and not s.blue.chat.lessons and s.blue.overlay.chance and MOCK.saved == saves);
expect('opening sends no game commands', #MOCK.commands, 0);
-- Result names belong to the finder search; its permanent controls keep normal settings help.
local original_path = addon.path;
addon.path = FIXTURES_PATH .. '/finder';
MOCK.player.spell_data = false;
MOCK.typing['Find settings'] = 'spell finder';
MOCK.clicks['Blue Magic/Foot Kick (spellbook unknown)##577'] = true;
MOCK.hover = true;
window.draw(s, 'test');
for _, label in ipairs({ 'Find a Blue spell', 'Unlearned spells only', 'Find a monster or zone', 'Monsters in this zone', 'Copy places' }) do
    local path = 'Blue Magic/' .. label;
    check('finder control keeps visible help: ' .. label, MOCK.gui.helps[path] and (MOCK.gui.tips[path] or '') ~= '');
    check('finder control remains searchable: ' .. label, window.search_tabs(label)['Blue Magic'] == true);
end
MOCK.typing['Blue Magic/Find a Blue spell'] = 'Foot';
MOCK.typing['Blue Magic/Find a monster or zone'] = 'arena';
window.draw(s, 'test');
for _, id in ipairs({ 'finder_spell', 'finder_place' }) do
    check('finder clear button keeps visible help: ' .. id, MOCK.gui.helps['Blue Magic/Clear##' .. id] == true);
end
check('finder Clear remains discoverable by its visible label', window.search_tabs('Clear')['Blue Magic'] == true);
MOCK.hover = false;
addon.path = original_path;
return MOCK.report();
