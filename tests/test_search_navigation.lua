local imgui = require('imgui');
local search = require('ui.search');
local position = 0;
imgui.GetItemRectMin = function () return 0, position; end;
imgui.GetItemRectMax = function () return 100, position + 20; end;
local function draw(name, duplicate, count)
    MOCK.frame();
    imgui.Begin('Search test', { true }, 0);
    search.begin_tab(name);
    for index = 1, count or 3 do
        position = index * 24;
        imgui.TextUnformatted('Critical ' .. index);
        search.mark('Critical ' .. index, 'Rate');
        if (duplicate) then search.mark('Critical ' .. index, 'Rate'); end
    end
    search.finish_tab();
    imgui.End();
end
search.query('critical');
draw('Combat', true);
local index, count = search.status('Combat');
check('first match is selected and duplicate marks are counted once', index == 1 and count == 3);
expect('first draw jumps once', #MOCK.gui.scrolled, 1);
expect('all distinct matches are highlighted', #MOCK.gui.highlights, 3);
draw('Combat');
expect('unchanged frames do not keep pulling the page back', #MOCK.gui.scrolled, 0);
check('Next schedules an existing match', search.step(1, 'Combat'));
draw('Combat');
expect('Next selects the second match', search.status('Combat'), 2);
expect('Next performs one page scroll', #MOCK.gui.scrolled, 1);
search.step(-1, 'Combat');
search.step(-1, 'Combat');
draw('Combat');
expect('Previous wraps from first to last', search.status('Combat'), 3);
draw('Appearance', false, 2);
expect('another page starts at its own first match', search.status('Appearance'), 1);
draw('Combat');
expect('returning to a page keeps its selected match', search.status('Combat'), 3);
expect('returning preserves the existing scroll position', #MOCK.gui.scrolled, 0);
draw('Combat', false, 1);
index, count = search.status('Combat');
check('removing matches clamps the selection', index == 1 and count == 1);
draw('Combat', false, 1);
expect('a clamped selection scrolls once when it is drawn', #MOCK.gui.scrolled, 1);
search.query('no matching control');
draw('Combat');
index, count = search.status('Combat');
check('unmatched queries report no selection', index == 0 and count == 0);
check('Next does nothing with no matches', not search.step(1, 'Combat'));
search.query('critical rate');
draw('Combat');
expect('all query words match across the label and help', select(2, search.status('Combat')), 3);
search.query('');
draw('Combat');
index, count = search.status('Combat');
check('clearing search clears count and leaves scroll alone', index == 0 and count == 0 and #MOCK.gui.scrolled == 0);
expect('search sends no game commands', #MOCK.commands, 0);
return MOCK.report();
