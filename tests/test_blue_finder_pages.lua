-- Large finder lists draw one page while copying every matching place.
local finder = require('core.blue_finder');
local window = require('ui.settings_window');
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
local spells, places = {}, {};
for i = 1, 49 do
    spells[i] = { spell = { id = 500 + i, name = 'Spell ' .. i, min_skill = i }, known = false };
end
for i = 1, 61 do
    places[i] = { name = 'Monster ' .. i, zone_name = 'Zone ' .. i, low = 10, high = 12 };
end
local current_spells, current_places = spells, places;
finder.catalog = function() return { built = 'Fixture source' }; end;
finder.spells = function() return current_spells; end;
finder.places = function() return current_places; end;
window.set_open(true);
MOCK.typing['Find settings'] = 'spell finder';
local function draw() MOCK.frame(0); window.draw(s, 'test'); end
local function click(path)
    MOCK.clicks[path] = true;
    draw();
    check('the paging control was drawn: ' .. path, MOCK.clicks[path] == nil);
end
local function count(pattern, kind)
    local n = 0;
    for path, widget in pairs(MOCK.gui.paths) do
        if (widget == kind and path:match(pattern)) then n = n + 1; end
    end
    return n;
end
draw();
expect('only twenty matching spells submit widgets', count('^Blue Magic/Spell %d+ .*##%d+$', 'Selectable'), 20);
check('the first spell page is labeled', MOCK.drew('Page 1 of 3'));
check('Previous spells is disabled on the first page', MOCK.gui.disabled['Blue Magic/finder_spells_pages/Previous spells']);
click('Blue Magic/Spell 1 (not learned)##501');
expect('only twenty matching places submit headers', count('^Blue Magic/Monster %d+##place_%d+$', 'CollapsingHeader'), 20);
click('Blue Magic/finder_places_pages/Next places');
check('the next page shows its own locations', MOCK.gui.paths['Blue Magic/Monster 21##place_21'] == 'CollapsingHeader'
    and MOCK.gui.paths['Blue Magic/Monster 1##place_1'] == nil);
click('Blue Magic/Copy places');
check('copy includes places on other pages', MOCK.clipboard:find('Monster 1 -', 1, true)
    and MOCK.clipboard:find('Monster 61 -', 1, true));
click('Blue Magic/finder_places_pages/Next places');
click('Blue Magic/finder_places_pages/Next places');
draw();
expect('the final page submits only its remaining location', count('^Blue Magic/Monster %d+##place_%d+$', 'CollapsingHeader'), 1);
check('Next places is disabled on the last page', MOCK.gui.disabled['Blue Magic/finder_places_pages/Next places']);
current_places = { places[61] };
draw();
check('a changed location filter returns to its first page', MOCK.gui.paths['Blue Magic/Monster 61##place_1'] == 'CollapsingHeader'
    and MOCK.gui.paths['Blue Magic/finder_places_pages/Next places'] == nil);
click('Blue Magic/finder_spells_pages/Next spells');
check('spells page independently of places', MOCK.gui.paths['Blue Magic/Spell 21 (not learned)##521'] == 'Selectable'
    and MOCK.gui.paths['Blue Magic/Spell 1 (not learned)##501'] == nil);
click('Blue Magic/finder_spells_pages/Next spells');
expect('the last spell page contains nine results', count('^Blue Magic/Spell %d+ .*##%d+$', 'Selectable'), 9);
current_spells = { spells[1] };
draw();
check('a changed spell filter returns to its first page', MOCK.gui.paths['Blue Magic/Spell 1 (not learned)##501'] == 'Selectable'
    and MOCK.gui.paths['Blue Magic/finder_spells_pages/Next spells'] == nil);
expect('paging never sends game commands', #MOCK.commands, 0);
return MOCK.report();
