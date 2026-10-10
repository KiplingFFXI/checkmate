-- Conditional defensive rates stay separate from hit chances and percentage grades.
local defaults = require('ui.defaults');
local printout = require('core.printout');
local overlay = require('ui.overlay');
local tips = require('ui.tips');
local skins = require('ui.skins');
local window = require('ui.settings_window');
local s = defaults.make();
skins.fill(s);
local function has(text, wanted) return text:find(wanted, 1, true) ~= nil; end
for _, id in ipairs({ 'block', 'parry' }) do
    check(id .. ' starts off independently in chat and overlay', not s.printout.parts[id].on and not s.overlay.parts[id]);
    check(id .. ' has an independent line and overlay row', s.printout.parts[id].new_line and overlay.is_part(id));
end
check('new rows follow Evade in the default order', has(s.printout.order, 'evade block parry crit'));
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.parts.block.on, s.printout.parts.parry.on = true, true;
local result = { name = 'Example monster', low = 75, high = 75,
    block = { low = 23.245, high = 27.893, eligible = true, uncertain = true,
        observed_at = 80,
        notes = { 'Facing and attack eligibility still apply.', 'A hidden modifier may change this rate.' } },
    parry = { low = 12.5, high = 12.5, eligible = true, notes = { 'Requires an eligible weapon and engagement.' } } };
local function lines()
    local out, first, waiting = printout.lines(s, result);
    return MOCK.plain(table.concat(out, '\n')), out, first, waiting;
end
local text, raw, first, waiting = lines();
expect('both rows print on separate lines', #raw, 2);
check('defensive rates never wait for checkparam', first == nil and not waiting[1] and not waiting[2]);
check('fractional range bounds round outward', has(text, 'Shield block: ~23.24-27.9%'));
check('single fractional rates keep useful precision', has(text, 'Parry: 12.5%'));
expect('whole percentages do not grow trailing decimals', printout.defense_text({ low = 10, high = 10 }), '10%');
expect('single fractional rate rounds to two decimals', printout.defense_text({ low = 12.345, high = 12.345 }), '12.35%');
expect('exact decimal endpoints do not drift', printout.defense_text({ low = 23.24, high = 27.9 }), '23.24-27.9%');
s.printout.number_style = 'midpoint';
check('existing middle setting applies without losing decimal precision', has(lines(), 'Shield block: ~25.57%'));
s.printout.number_style = 'range';
s.grades.on = true;
s.colors.block_number, s.colors.parry_number = 73, 76;
local _, painted = lines();
check('block ignores unrelated grade cutoffs', painted[1]:find(string.char(30, 73) .. '~23.24-27.9%', 1, true) ~= nil);
check('parry ignores unrelated grade cutoffs', painted[2]:find(string.char(30, 76) .. '12.5%', 1, true) ~= nil);
local block_help = tips.text(s, result, 'number', 'block');
check('hover qualifies the conditional denominator', has(block_help, 'not the share of all incoming attacks'));
check('hover retains both source conditions', has(block_help, result.block.notes[1]) and has(block_help, result.block.notes[2]));
check('hover keeps the full range even in middle mode', has(block_help, 'Result: ~23.24-27.9%'));
MOCK.now = 100;
result.provenance = { parameter_at = 99, inputs_at = 98 };
expect('defensive age uses its own input snapshot', tips.more(s, result, 'number', 'block'), 'Defensive inputs: 0:20 ago.');
expect('missing defensive age does not borrow another reply time', tips.more(s, result, 'number', 'parry'), nil);
result.block = { eligible = false, unavailable_reason = 'No shield is equipped.', notes = { 'No shield is equipped.' } };
result.parry = { notes = { 'Weapon details are unreadable.' } };
text = lines();
check('known ineligibility differs from unreadable inputs', has(text, 'Shield block: not available') and has(text, 'Parry: unknown'));
check('unavailable help retains its concrete reason', has(tips.text(s, result, 'number', 'block'), 'No shield is equipped.'));
expect('a reason shared with source notes appears once', select(2, tips.text(s, result, 'number', 'block'):gsub('No shield is equipped%.', '')), 1);
check('unknown help retains its concrete reason', has(tips.text(s, result, 'number', 'parry'), 'Weapon details are unreadable.'));
check('no client unknown is fabricated as zero', not has(text, '0%'));
s.printout.short_words = true;
check('unavailable has a default abbreviation', has(lines(), 'Shield block: N/A'));
s.short.num_unavailable = 'Cannot';
check('unavailable abbreviation is customizable', has(lines(), 'Shield block: Cannot'));
s.printout.short_words = false;
local full = tips.details(s, result);
check('full details keeps the two independent rates', has(full, 'Shield block') and has(full, 'Parry'));
s.printout.parts.block.on, s.printout.parts.parry.on = false, false;
check('disabled defensive rows stay out of full details', not has(tips.details(s, result), 'Shield block')
    and not has(tips.details(s, result), 'Parry chance'));
s.overlay.parts.block = true;
check('overlay-only block retains full details', has(tips.details(s, result), 'Shield block'));
for _, skin in ipairs(skins.LIST) do
    skins.apply(s, skin.id);
    for _, id in ipairs({ 'block', 'parry' }) do
        check(skin.id .. ' provides all ' .. id .. ' colors', printout.in_palette(s.colors[id .. '_label'])
            and printout.in_palette(s.colors[id .. '_number']) and printout.in_palette(s.colors[id .. '_detail']));
    end
end
local profiles = require('ui.profiles');
s.printout.parts.parry.on, s.printout.parts.parry.label = true, 'Weapon defense';
check('profile saves defensive row choices', profiles.save(s, 'Defensive rows'));
local loaded = defaults.make();
check('profile restores each display choice and label', profiles.load(loaded, 'Defensive rows')
    and loaded.printout.parts.parry.on and loaded.printout.parts.parry.label == 'Weapon defense'
    and loaded.overlay.parts.block and not loaded.printout.parts.block.on);
check('old saved order gains defensive rows after Evade', has(printout.clean_order('difficulty hit evade crit'), 'evade block parry crit'));
MOCK.navigation_real = true;
require('ui.navigation').select('Numbers');
window.set_open(true);
MOCK.frame(0);
window.draw(s, 'test');
for _, id in ipairs({ 'block', 'parry' }) do
    check(id .. ' has both Numbers controls', MOCK.gui.paths['Numbers/' .. id .. '/In chat'] == 'Checkbox'
        and MOCK.gui.paths['Numbers/' .. id .. '/In overlay'] == 'Checkbox');
end
check('settings search finds Shield block and Parry', window.search_tabs('Shield block').Numbers
    and window.search_tabs('Parry').Numbers and window.search_tabs('Shield block').Appearance);
expect('the display sends no game commands', #MOCK.commands, 0);
return MOCK.report();
