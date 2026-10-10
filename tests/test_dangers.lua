-- Display filters must never change the source coverage or discard full move details.
local dangers = require('core.dangers');
local info = require('core.info');
local tips = require('ui.tips');
local window = require('ui.settings_window');
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
local source = { coverage = 'resolved', entries = {
    { kind = 'skill', id = 1, name = 'Poison Bite', summary = 'Poison Bite: Poison, can crit',
        categories = { 'debuff', 'crit' }, notes = { 'Requires a successful hit.' },
        details = { notes = { 'Effect removal: Poisona or Antidote.' } } },
    { kind = 'spell', id = 2, name = 'Sleep', summary = 'Sleep: Sleep', categories = { 'debuff' },
        level_ranges = { { 10, 20 }, { 30, 40 } } },
    { kind = 'spell', id = 3, name = 'Forced Spell', summary = 'Forced Spell: Poison', categories = { 'debuff' },
        forced = true, level_ranges = { { 50, 60 } } },
    { kind = 'skill', id = 4, name = 'Drain Move', summary = 'Drain Move: HP drain', categories = { 'drain' } },
} };
local at = dangers.readout(source, 25, 25, s.dangers);
expect('exact level excludes ordinary unavailable spells', #at.entries, 3);
check('forced cast survives level filtering', at.value:find('Forced Spell', 1, true) ~= nil);
check('an ordinary spell in a level-window gap stays out', not at.value:find('Sleep', 1, true));
expect('range overlap keeps a possible spell', #dangers.readout(source, 19, 25, s.dangers).entries, 4);
expect('unknown level does not remove possible spells', #dangers.readout(source, nil, nil, s.dangers).entries, 4);
s.dangers.max_moves = 1;
local limited = dangers.readout(source, 25, 25, s.dangers);
expect('compact mode counts the hidden matching moves', limited.more, 2);
check('compact mode says more exist', limited.value:find('+2 more', 1, true) ~= nil);
expect('compact mode retains every full entry', #limited.entries, 3);
for _, id in ipairs(dangers.CATEGORIES) do s.dangers[id] = false; end
s.dangers.crit = true;
local filtered = dangers.readout(source, 25, 25, s.dangers);
expect('overlapping categories need only one selected match', #filtered.selected, 1);
check('crit filter keeps the poison move too', filtered.value:find('Poison Bite', 1, true) ~= nil);
expect('filter keeps the source complete', filtered.coverage, 'resolved');
s.dangers.crit = false;
expect('an empty filter is not an empty source list', dangers.readout(source, 25, 25, s.dangers).value, 'No matching threats');
expect('resolved empty list is explicit', dangers.readout({ coverage = 'resolved', entries = {} }, 25, 25).value, 'No listed threats');
expect('unresolved empty list is explicit', dangers.readout({ coverage = 'unresolved', entries = {}, reasons = { 'Missing setup.' } }, 25, 25).value,
    'Move list unresolved');
source.coverage, source.incomplete = 'partial', true;
s.dangers.debuff = true;
check('partial lists stay marked when filtered', dangers.readout(source, 25, 25, s.dangers).value:find('list incomplete', 1, true));
s.printout.parts.dangers.on = true;
local result = { name = 'Test monster', low = 25, high = 25,
    info = info.readout({ info = { dangers = source } }, 25, 25, { dangers = true, danger_options = s.dangers }, 1) };
local all = tips.details(s, result);
check('Copy details includes moves hidden by categories', all:find('Drain Move', 1, true) ~= nil);
check('Copy details includes moves hidden by the compact limit', all:find('Forced Spell', 1, true) ~= nil);
check('Copy details keeps practical source notes', all:find('Poisona or Antidote', 1, true) ~= nil);
check('Copy details omits spells excluded by observed level', all:find('Sleep:', 1, true) == nil);
window.set_open(true);
window.set_target_details(result);
MOCK.typing['Find settings'] = 'target details';
MOCK.typing['Monster/Find target details'] = 'Poison Bite';
window.draw(s, 'test');
check('search shows a matching move', MOCK.drew('Requires a successful hit.'));
check('search does not show a different poison move', not MOCK.drew('Forced Spell: Poison'));
check('search does not mutate source entries', #source.entries == 4);

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.command('/checkmate dangerdebuff off');
MOCK.command('/checkmate dangermoves 4');
MOCK.command('/checkmate blueseen on');
MOCK.command('/checkmate profile save Threats');
MOCK.command('/checkmate dangerdebuff on');
MOCK.command('/checkmate dangermoves 0');
MOCK.command('/checkmate blueseen off');
MOCK.command('/checkmate profile load Threats');
expect('profile keeps the danger filter', MOCK.settings.current.dangers.debuff, false);
expect('profile keeps the compact limit', MOCK.settings.current.dangers.max_moves, 4);
expect('profile keeps the observer preference', MOCK.settings.current.blue.seen, true);
MOCK.settings.switch_character({ dangers = { debuff = 'yes', crit = false, max_moves = -2 }, blue = { seen = 'yes' } });
expect('invalid category value uses its default', MOCK.settings.current.dangers.debuff, true);
expect('valid disabled category survives repair', MOCK.settings.current.dangers.crit, false);
expect('negative compact limit is repaired', MOCK.settings.current.dangers.max_moves, 0);
expect('invalid observer preference stays off', MOCK.settings.current.blue.seen, false);
MOCK.settings.switch_character({ dangers = { max_moves = 500 } });
expect('compact limit cannot exceed the supported maximum', MOCK.settings.current.dangers.max_moves, dangers.MAX_MOVES);
return MOCK.report();
