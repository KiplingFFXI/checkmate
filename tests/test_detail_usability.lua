-- Details stay identifiable while filtering, copying, and scrolling their full notes.
MOCK.navigation_real = true;
local window = require('ui.settings_window');
local tips = require('ui.tips');
local info = require('core.info');
local nav = require('ui.navigation');
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
window.set_open(true);
nav.select('Monster');
MOCK.now = 100;
for _, id in ipairs({ 'dangers', 'blue' }) do s.printout.parts[id].on = true; end
local source = { info = { dangers = { coverage = 'resolved', entries = {
    { id = 1, kind = 'skill', name = 'Poison Move', summary = 'Poison Move: Poison', categories = { 'debuff' }, effects = { 'Poison' },
        notes = { 'Requires a successful effect check.' }, details = { notes = { 'Area: 15 yalms radius.', 'Removal: Poisona.',
            'The effect application does not check Utsusemi or Blink.', 'Reviewed removal options: Poison: Poisona.',
            'These are selected options, not a complete cure list.', 'Shadow handling is unresolved for another effect.' },
            unknown = { 'Shadow handling is unresolved for another effect.' } } },
    { id = 2, kind = 'skill', name = 'Critical Move', summary = 'Critical Move: can crit', categories = { 'crit' },
        notes = { 'Its current critical chance is not known.' } },
} } } };
local result = { name = 'Example Monster', low = 40, high = 42, provenance = { inputs_at = 80 },
    info = info.readout(source, 40, 42, { dangers = true, danger_options = s.dangers }, 1) };
result.info.sections[#result.info.sections + 1] = { id = 'blue', label = 'Blue Magic', value = 'Foot Kick (not learned)',
    notes = { 'Foot Kick needs Blue Magic skill 0.', 'Conditions are checked on defeat.' },
    observation = { spells = { { name = 'Foot Kick', state = 'not learned' } }, seen = true, move_states = { 'not observed' } } };
window.set_target_details(result);
local function draw()
    MOCK.frame(0);
    return window.draw(s, 'test');
end
local function has(text, value) return text and text:find(value, 1, true) ~= nil; end
local search = require('ui.search');
local match, searches = search.matches, 0;
search.matches = function (text, query)
    searches = searches + 1;
    return match(text, query);
end;
draw();
local searched = searches;
draw();
expect('unchanged details reuse their current matching groups', searches, searched);
expect('category matrix has category and two display columns', MOCK.gui.tables['##monster_sections'], 3);
check('compact category controls remain individually addressable', MOCK.gui.paths['Monster/family/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Monster/family/##overlay'] == 'Checkbox');
MOCK.clicks['Monster/family/##chat'] = true;
local changed = draw();
check('matrix chat control only changes chat and requests save', s.printout.parts.family.on and not s.overlay.parts.family and changed.save);
check('changing displayed parts rebuilds detail matches', searches > searched);
MOCK.clicks['Target details##toolbar'] = true;
draw();
check('toolbar opens details independently of the current tab', window.details_open and MOCK.gui.children[#MOCK.gui.children].name == 'checkmate##settings/##details_page');
check('fixed header names the selected monster and level range', MOCK.drew('Example Monster (Lv 40-42)'));
check('fixed header distinguishes selection and captured input age', MOCK.drew('Selected target | Inputs 0:20 ago'));
MOCK.clicks['Target details'] = true;
draw();
check('jump scrolls only the details child', #MOCK.gui.scrolled_windows == 1
    and MOCK.gui.scrolled_windows[1] == 'checkmate##settings/##details_page');
expect('jump is consumed once', window.jump_details, nil);
MOCK.now = 105;
draw();
check('header age advances without a new reading', MOCK.drew('Selected target | Inputs 0:25 ago'));
result.provenance.chat_snapshot = true;
draw();
check('saved reading has a distinct fixed header', MOCK.drew('Saved /check | Inputs 0:25 ago'));
local full = tips.details(s, result);
check('full move facts use separate paragraphs', has(full, 'Requires a successful effect check.\n\nArea: 15 yalms radius.\n\nRemoval: Poisona.'));
check('full move names and effects have separate labels', has(full, 'Move: Poison Move\n\nEffects: Poison.'));
check('full critical notes stay intact without invented effects', has(full, 'Threats: can crit.')
    and has(full, 'Its current critical chance is not known.'));
check('full shadow rules keep the original handling note', has(full, 'Shadow rules:\nThe effect application does not check Utsusemi or Blink.'));
check('full removal rules keep options and limitations together', has(full, 'Removal options:\nReviewed removal options: Poison: Poisona.\n\nThese are selected options, not a complete cure list.'));
check('unknown shadow handling stays separate from known rules', has(full, 'Unknown: Shadow handling is unresolved for another effect.'));
check('full Blue separates captured spellbook and observation states', has(full, 'Spell: Foot Kick\nSpellbook: not learned\nMove use: not observed'));
check('full Blue retains every learning condition separately', has(full, 'Learning conditions and notes:\n\nFoot Kick needs Blue Magic skill 0.\n\nConditions are checked on defeat.'));
expect('Blue hover keeps its compact paragraph', tips.text(s, result, 'info', 'blue'),
    'Blue Magic: Foot Kick (not learned). Foot Kick needs Blue Magic skill 0. Conditions are checked on defeat.');
local blue = result.info.sections[#result.info.sections];
blue.observation.spells[2] = { name = 'Wild Carrot', state = 'spellbook unknown' };
check('each full Blue spell has its own captured status block', has(tips.details(s, result),
    'Spell: Foot Kick\nSpellbook: not learned\nMove use: not observed\n\nSpell: Wild Carrot\nSpellbook: spellbook unknown\nMove use: move use unknown'));
blue.observation.seen = false;
check('disabled move observation adds no full-detail state', not has(tips.details(s, result), 'Move use:'));
blue.observation.spells = {};
blue.value = 'All listed spells learned; other lessons unknown';
check('an empty filtered Blue list preserves source uncertainty', has(tips.details(s, result), 'Blue Magic: All listed spells learned; other lessons unknown.'));
blue.value = 'Foot Kick (not learned)';
blue.observation = { spells = { { name = 'Foot Kick', state = 'not learned' } }, seen = true, move_states = { 'not observed' } };
MOCK.typing['Find target details'] = 'Poison Move';
searched = searches;
draw();
check('changed detail search rebuilds matches', searches > searched);
check('search displays its active state and match count', MOCK.drew('Showing 1 of 5 sections.') and MOCK.drew('Search is active.'));
check('nonempty detail search has a clear button', MOCK.gui.paths['Clear##details'] == 'Button');
MOCK.clicks['Copy shown'] = true;
draw();
check('Copy shown includes only matching groups and their full notes', has(MOCK.clipboard, 'Removal: Poisona.')
    and not has(MOCK.clipboard, 'Critical Move') and not has(MOCK.clipboard, 'Foot Kick'));
MOCK.clicks['Copy details'] = true;
draw();
check('full copy keeps sections hidden by search', has(MOCK.clipboard, 'Critical Move') and has(MOCK.clipboard, 'Foot Kick'));
MOCK.clicks['Clear##details'] = true;
searched = searches;
draw();
check('clearing detail search rebuilds matches', searches > searched);
check('clear search restores matches immediately', MOCK.drew('Showing 5 of 5 sections.') and not MOCK.drew('Search is active.'));
MOCK.clicks['Dangers: Poison Move##detail_danger_skill_1'] = true;
draw();
check('a full detail section can fold without changing its match count', not MOCK.drew('Removal: Poisona.')
    and MOCK.drew('Showing 5 of 5 sections.'));
MOCK.clicks['Copy shown'] = true;
draw();
check('Copy shown includes matching folded sections as its help says', has(MOCK.clipboard, 'Removal: Poisona.'));
s.dangers.crit = false;
searched = searches;
draw();
check('changing danger categories rebuilds detail matches', searches > searched);
check('category filtering explains the active categories and hidden count', MOCK.drew('Danger filters: Debuffs, Buff removal, Drains, Other threats. 1 move hidden.'));
MOCK.clicks['Copy shown'] = true;
draw();
check('Copy shown respects danger categories', has(MOCK.clipboard, 'Poison Move') and not has(MOCK.clipboard, 'Critical Move'));
MOCK.clicks['Copy details'] = true;
draw();
check('Copy details keeps danger categories hidden in the UI', has(MOCK.clipboard, 'Critical Move'));
MOCK.typing['Find target details'] = 'missing move';
draw();
check('empty search result offers a clear next step', MOCK.drew('No matching target details. Clear the search or change the danger filters.'));
MOCK.clicks['Copy shown'] = true;
draw();
expect('empty filtered copy never silently copies the full list', MOCK.clipboard, 'No matching target details.');
local second = { name = 'Other Monster', low = 50, high = 50, info = result.info };
window.set_target_details(second);
searched = searches;
draw();
check('changing targets rebuilds detail matches even with the same source facts', searches > searched);
check('persistent search cannot hide the new monster identity', MOCK.drew('Other Monster (Lv 50)') and MOCK.drew('Selected target | Input age unknown'));
window.set_target_details(nil);
draw();
check('a cleared target has no stale identity', MOCK.drew('No monster selected.') and not MOCK.drew('Other Monster'));
window.set_target_details(second);
searched = searches;
draw();
check('returning after a cleared target rebuilds detail matches', searches > searched);
check('finder controls are discoverable by their full names', window.search_tabs('copy places')['Blue Magic']
    and window.search_tabs('find a monster or zone')['Blue Magic']);
expect('detail controls issue no game commands', #MOCK.commands, 0);
return MOCK.report();
