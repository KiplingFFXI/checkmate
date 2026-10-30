-- Full reward details retain items hidden by the chat and overlay limits.
local window = require('ui.settings_window');
local tips = require('ui.tips');
local drops = require('core.drops');
local steal = require('core.steal');
local printout = require('core.printout');
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
for id, name in pairs({ [100] = 'First reward', [101] = 'Second reward', [102] = 'Rare reward' }) do
    MOCK.items[id] = { Name = { name } };
end
s.printout.parts.drops.on, s.printout.parts.steal.on = true, false;
s.drops.th, s.drops.min_chance, s.drops.max_items = 2, 0, 1;
local row = { drops = { { item = 100, rate = 500 }, { item = 101, rate = 100 }, { item = 102, rate = 10 } },
    steal = { 101, 102 }, flags = { scripted_drops = true, exp_only = true },
    loot_conditions = { 'Only the surviving monster drops these items.' } };
local result = { name = 'Example Monster', low = 40, high = 40,
    drops = drops.readout(row, s.drops), steal = steal.readout(row, { level = 75, bonus = 0 }, 40, 40) };
local function has(text, needle) return (text or ''):find(needle, 1, true) ~= nil; end
local visible = MOCK.plain(table.concat(printout.lines(s, result), '\n'));
check('the ordinary row still obeys its one-item limit', has(visible, 'First reward') and not has(visible, 'Second reward'));
s.printout.parts.steal.on = true;
local full = tips.details(s, result);
check('full Drops and Steal are separate sections', has(full, 'Drop chances at Treasure Hunter 2:')
    and has(full, 'Your Steal works'));
check('full Drops includes every item hidden by the list limit', has(full, 'First reward:')
    and has(full, 'Second reward:') and has(full, 'Rare reward:'));
check('full rewards retain drop conditions and Steal eligibility', has(full, 'You must receive EXP.')
    and has(full, 'Only the surviving monster') and has(full, 'if the item is still available and you can receive it'));
s.drops.min_chance = 100;
result.drops = drops.readout(row, s.drops);
check('fully filtered drops retain a full details list', #result.drops.items == 0
    and has(tips.details(s, result), 'Rare reward:'));
result.drops.th_fallback, result.drops.th_note = true, 'Automatic TH unavailable; using manual TH 2. Traits are unreadable.';
window.set_open(true);
window.details_open = true;
window.set_target_details(result);
local function draw() MOCK.frame(0); return window.draw(s, 'test'); end
draw();
check('full reward groups are visible', MOCK.gui.paths['Drops##detail_drops'] == 'CollapsingHeader'
    and MOCK.gui.paths['Steal##detail_steal'] == 'CollapsingHeader' and MOCK.drew('Rare reward:'));
MOCK.clicks['Copy details'] = true;
draw();
check('Copy details contains filtered rewards and the TH fallback', has(MOCK.clipboard, 'Rare reward:')
    and has(MOCK.clipboard, 'Automatic TH unavailable; using manual TH 2.'));
MOCK.typing['Find target details'] = 'Steal';
draw();
MOCK.clicks['Copy shown'] = true;
draw();
check('Copy shown can isolate the complete Steal pool', has(MOCK.clipboard, 'Second reward')
    and has(MOCK.clipboard, 'Rare reward') and not has(MOCK.clipboard, 'Drop chances'));
result.steal = steal.readout({ steal = {} }, nil, 40, 40);
check('an empty Steal pool has a clear answer', has(tips.details(s, result), 'No Steal items are listed'));
expect('opening reward details sends no commands', #MOCK.commands, 0);
return MOCK.report();
