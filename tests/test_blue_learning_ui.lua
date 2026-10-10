-- Blue row controls and learning details keep visibility separate from their saved contents.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.navigation_real = true;
local panel = require('ui.settings_window');
local nav = require('ui.navigation');
local calls = 0;
local learning = require('core.blue_learning');
local read = learning.read;
learning.read = function() calls = calls + 1; return read(); end;
MOCK.player.main_job, MOCK.player.main_level = 16, 75;
MOCK.player.equipment[6] = 14928;
MOCK.command('/checkmate');
nav.select('Merits');
MOCK.frame(0);
expect('other tabs do not read learning gear', calls, 0);
nav.select('Blue Magic');
MOCK.frame(0);
expect('the visible learning section reads once', calls, 1);
check('the Blue tab shows the gear-adjusted learning chance',
    MOCK.drew('43% per eligible attempt (33% base + 10% from equipped gear).'));
check('gear uses readable names', MOCK.drew('Magus Bazubands: +10%'));
check('learning requirements start folded while the summary remains visible',
    panel.folded['Blue Magic/LEARNING REQUIREMENTS'] == false
    and MOCK.gui.paths['Blue Magic/LEARNING REQUIREMENTS'] == 'CollapsingHeader'
    and not MOCK.drew('Call for Help prevents learning. There is at most one attempt per defeat.'));
for _ = 1, 14 do MOCK.frame(1 / 60); end
expect('unchanged frames reuse the snapshot', calls, 1);
MOCK.player.equipment[6] = nil;
MOCK.frame(0.1);
expect('the next sample reads current gear', calls, 2);
check('taking gloves off removes the bonus',
    MOCK.drew('33% per eligible attempt (33% base + 0% from equipped gear).'));
MOCK.clicks['Blue Magic/LEARNING CHANCE'] = true;
MOCK.frame(1);
expect('a collapsed learning section does not read gear', calls, 2);
MOCK.clicks['Blue Magic/LEARNING CHANCE'] = true;
MOCK.player.main_job = 1;
MOCK.frame(1);
check('non-Blue mains are told the job requirement', MOCK.drew('Your main job must be Blue Mage to learn spells.'));

local s = MOCK.settings.current;
check('master row has an explicit label and separate display controls', MOCK.drew('Show Blue row')
    and MOCK.gui.paths['Blue Magic/blue/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Blue Magic/blue/##overlay'] == 'Checkbox');
check('the two percentages have distinct names', MOCK.drew('Unresisted spell chance')
    and MOCK.gui.paths['Blue Magic/LEARNING CHANCE'] == 'CollapsingHeader');
check('hidden masters disable their components', MOCK.gui.disabled['Blue Magic/components/lessons/##chat']
    and MOCK.gui.disabled['Blue Magic/components/chance/##overlay'] and MOCK.drew('Row hidden'));
local lessons, chance = s.blue.chat.lessons, s.blue.chat.chance;
MOCK.frame(0);
check('disabled components preserve their saved selections', s.blue.chat.lessons == lessons
    and s.blue.chat.chance == chance);
MOCK.clicks['Blue Magic/blue/##chat'] = true;
MOCK.frame(0);
check('showing chat enables only its component column', s.printout.parts.blue.on
    and not MOCK.gui.disabled['Blue Magic/components/chance/##chat']
    and MOCK.gui.disabled['Blue Magic/components/chance/##overlay']);
MOCK.clicks['Blue Magic/components/chance/##chat'] = true;
MOCK.frame(0);
expect('an enabled row can select its unresisted chance', s.blue.chat.chance, not chance);
MOCK.clicks['Blue Magic/blue/##chat'] = true;
MOCK.frame(0);
check('hiding a row keeps its selected components', not s.printout.parts.blue.on
    and s.blue.chat.lessons == lessons and s.blue.chat.chance == not chance);
MOCK.clicks['Blue Magic/blue/##overlay'] = true;
s.overlay.on = false;
MOCK.frame(0);
check('global overlay off is explained without erasing the selected row', s.overlay.parts.blue
    and MOCK.drew('The overlay is off. Turn it on in Display > Overlay options to show this row.'));
MOCK.clicks['Blue Magic/LEARNING REQUIREMENTS'] = true;
MOCK.frame(0);
check('opening requirements reveals the full learning conditions',
    MOCK.drew('Call for Help prevents learning. There is at most one attempt per defeat.')
    and MOCK.drew('Skill merits help meet the requirement; they do not raise the learning chance.'));
MOCK.clicks['Blue Magic/LEARNING REQUIREMENTS'] = true;
MOCK.frame(0);
MOCK.typing['Find settings'] = 'learning requirements';
MOCK.frame(0);
check('search reveals the folded learning requirements', nav.current() == 'Blue Magic'
    and MOCK.drew('Call for Help prevents learning. There is at most one attempt per defeat.'));
MOCK.typing['Find settings'] = '';
MOCK.frame(0);
check('clearing search restores the previous requirements fold',
    panel.folded['Blue Magic/LEARNING REQUIREMENTS'] == false
    and not MOCK.drew('Call for Help prevents learning. There is at most one attempt per defeat.'));
for _, term in ipairs({ 'Show Blue row', 'Unresisted spell chance', 'Learning chance', 'Learning requirements' }) do
    check('Blue control remains searchable: ' .. term, panel.search_tabs(term)['Blue Magic'] == true);
end

local at_close = calls;
MOCK.command('/checkmate');
MOCK.frame(1);
expect('closing settings stops learning gear reads', calls, at_close);
expect('learning display sends no commands', #MOCK.commands, 0);
return MOCK.report();
