dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local defaults = require('ui.defaults');
local profiles = require('ui.profiles');
local window = require('ui.settings_window');
local tips = require('ui.tips');
local printout = require('core.printout');
local function current() return MOCK.settings.current; end
local function has(text, value) return (text or ''):find(value, 1, true) ~= nil; end
local function command(text)
    local n = #MOCK.printed;
    MOCK.command('/checkmate ' .. text);
    return table.concat(MOCK.printed_since(n), '\n');
end
local function frame()
    local n = #MOCK.printed;
    local ok, message = pcall(MOCK.frame);
    if (not ok) then error(tostring(message) .. '\n' .. table.concat(MOCK.printed_since(n), '\n')); end
end
expect('family grouping starts on', current().links.group_families, true);
local grouped_sample = command('sample');
check('printed sample follows the grouping default', has(grouped_sample, 'Goblin family (Sight)')
    and not has(grouped_sample, 'Goblin Butcher'));
local text = command('linkfamilies off');
check('command turns grouping off and saves it', current().links.group_families == false
    and MOCK.last_save.links.group_families == false and has(text, 'shows each name separately'));
local separate_sample = command('sample');
check('printed sample honors individual mode', has(separate_sample, 'Goblin Butcher (Sight)')
    and has(separate_sample, 'Goblin Leecher (Sight)') and has(separate_sample, 'Goblin Tinkerer (Sight)')
    and not has(separate_sample, 'Goblin family'));
text = command('linkfamilies on');
check('command turns grouping on and saves it', current().links.group_families
    and MOCK.last_save.links.group_families and has(text, 'groups matching names by family'));
local saved = MOCK.saved;
text = command('linkfamilies maybe');
check('invalid command leaves the setting unchanged', current().links.group_families and MOCK.saved == saved
    and has(text, 'linkfamilies on|off'));
text = command('help aggro');
check('Aggro help exposes grouping and the new limit meaning', has(text, '/checkmate linkfamilies on|off')
    and has(text, 'limits entries after grouping. 0 shows every entry.'));
command('maxlinks 2');
expect('entry limit keeps its saved key', MOCK.last_save.links.max_links, 2);
command('linkfamilies off');
check('profile saves the separate-name choice', profiles.save(current(), 'Separate link names'));
command('linkfamilies on');
command('profile load "Separate link names"');
check('profile restores grouping independently of other options', current().links.group_families == false
    and current().links.max_links == 2 and current().links.link_names);
local old = defaults.make();
old.links.group_families = nil;
check('older profile saves without the new key', profiles.save(old, 'Older links'));
command('profile load "Older links"');
check('older profile receives the grouping default', current().links.group_families);
MOCK.navigation_real = true;
require('ui.navigation').select('Aggro');
window.set_open(true);
window.preview_open, window.preview_options = true, { display = 'overlay', source = 'sample' };
frame();
check('embedded sample preview includes family grouping', window.preview_cache.sample.links.grouped
    and window.preview_cache.sample.links.names[1] == 'Goblin family');
check('Aggro contains the grouping checkbox', MOCK.gui.paths['Aggro/Group names by family'] == 'Checkbox');
check('Aggro uses entry terminology for its limit', MOCK.gui.paths['Aggro/Most entries shown'] == 'Slider'
    and MOCK.gui.paths['Aggro/Most names shown'] == nil);
MOCK.clicks['Aggro/Group names by family'] = true;
frame();
check('checkbox matches the command and saves', current().links.group_families == false
    and MOCK.last_save.links.group_families == false);
frame();
check('embedded sample preview refreshes after the checkbox changes', not window.preview_cache.sample.links.grouped
    and #window.preview_cache.sample.links.names == 3 and window.preview_cache.sample.links.names[1] == 'Goblin Butcher');
window.preview_open = false;
command('linknames off');
frame();
check('grouping and limit controls are disabled when names are hidden',
    MOCK.gui.disabled['Aggro/Group names by family'] == true and MOCK.gui.disabled['Aggro/Most entries shown'] == true);
command('linkfamilies on');
check('grouping preference can be changed without enabling names', current().links.group_families and not current().links.link_names);
command('linknames on');
check('settings search finds family grouping and entry limits', window.search_tabs('Group names by family').Aggro
    and window.search_tabs('Most entries shown').Aggro);
local r = { name = 'Example monster', links = { links = true, grouped = true,
    names = { 'Goblin family' }, tags = { { { 'sense_sight' } } }, more = 1,
    all_names = { 'Goblin Thug', 'Goblin Weaver', 'Named helper' },
    all_tags = { ['Goblin Thug'] = { { 'sense_sight' } }, ['Goblin Weaver'] = { { 'sense_sight' } },
        ['Named helper'] = { { 'sense_superlink' } } } } };
local s = defaults.make();
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.parts.links.on = true;
text = MOCK.plain(table.concat(printout.lines(s, r), '\n'));
check('family entries retain existing conditions and overflow formatting', has(text, 'Goblin family (Sight)') and has(text, '+1 more'));
local hover = tips.text(s, r, 'links', 'links');
check('family hover narrows its claim to listed names', has(hover, 'Family labels group only the names listed here')
    and has(hover, 'not every monster in that family') and has(hover, 'not a list of nearby living monsters'));
check('family hover keeps exact names and individual conditions', has(hover, 'Goblin Thug (Sight)')
    and has(hover, 'Goblin Weaver (Sight)') and has(hover, 'Named helper (Superlink)'));
check('full details retain exact membership', has(tips.details(s, r), 'Named helper (Superlink)'));
s.printout.short_words = true;
text = MOCK.plain(table.concat(printout.lines(s, r), '\n'));
check('abbreviated output keeps the family label', has(text, 'Goblin family (S)'));
r.links.grouped = nil;
check('ordinary lists do not claim family grouping', not has(tips.text(s, r, 'links', 'links'), 'Family labels'));
MOCK.settings.switch_character({ links = { group_families = false, max_links = 2 } });
check('saved character choice survives load', current().links.group_families == false and current().links.max_links == 2);
MOCK.settings.switch_character({ links = { max_links = 3 } });
check('older character gets the default without inheriting another character choice', current().links.group_families
    and current().links.max_links == 3 and MOCK.settings.defaults.links.group_families);
expect('all controls stay display only', #MOCK.commands, 0);
return MOCK.report();
