local defaults = require('ui.defaults');
local printout = require('core.printout');
local overlay = require('ui.overlay');
local tips = require('ui.tips');
local preview = require('ui.preview');
local profiles = require('ui.profiles');
local s = defaults.make();
local ids = { 'hit', 'offhand', 'ranged', 'evade' };
local function has(text, value) return (text or ''):find(value, 1, true) ~= nil; end
local function plain(lines) return (MOCK.plain(table.concat(lines, '\n')):gsub('\29[^\29]+\29', '')); end
for _, id in ipairs(ids) do
    check(id .. ' is supported but starts off in both displays', overlay.is_part(id)
        and s.overlay.parts[id] == false and not s.printout.parts[id].on);
end
for _, row in pairs(s.printout.parts) do row.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
for _, id in ipairs(ids) do s.overlay.parts[id] = true; end
local result = { name = 'Example monster', low = 42, high = 42, dual_wield = true, shoots = true,
    hit = { low = 72, high = 78 }, offhand = { low = 63, high = 63 },
    ranged = { low = 81, high = 81 }, ranged_far = { low = 66, high = 66 },
    evade = { low = 12, high = 15 }, signet = true,
    provenance = { parameter_state = 'received', parameter_at = 80, inputs_at = 99 },
    inputs = { accuracy = 240, offhand_accuracy = 230, ranged_accuracy = 250, evasion = 220 } };
local lines = printout.lines(printout.overlay_view(s), result);
local text = plain(lines);
check('all four overlay rows render their existing numbers', has(text, 'Hit: 72-78%') and has(text, 'Off-hand: 63%')
    and has(text, 'Ranged: 81%') and has(text, 'Evade: 12-15% with Signet'), text);
expect('own-line overlay keeps each numeric row separate', #lines, 4);
local chat = plain(printout.lines(s, result));
check('overlay selections do not enable chat rows', not has(chat, 'Hit:') and not has(chat, 'Off-hand:')
    and not has(chat, 'Ranged:') and not has(chat, 'Evade:'));
expect('embedded preview uses the same four rows', plain(preview.lines(s, result, { display = 'overlay' })), text);
s.ranged.show_far, s.ranged.show_distance = true, true;
result.ranged_distance = { distance = 12.3 };
text = plain(printout.lines(printout.overlay_view(s), result));
check('ranged display options retain distinct far and current distances', has(text, '66% at 25 yalms') and has(text, '12.3 yalms'), text);
result.dual_wield, result.shoots = false, false;
text = plain(printout.lines(printout.overlay_view(s), result));
check('ineligible weapons leave off-hand and ranged rows out', not has(text, 'Off-hand:') and not has(text, 'Ranged:'));
result.dual_wield, result.shoots, result.scripted = true, true, true;
result.hit.uncertain = true;
text = plain(printout.lines(printout.overlay_view(s), result));
check('script and unresolved-input markers survive the overlay view', has(text, '~72-78%?'), text);
MOCK.now = 100;
for _, id in ipairs(ids) do
    local help = tips.text(s, result, 'number', id);
    check(id .. ' explains snapshot refresh and no passive request', has(help, 'Check again after changing gear or buffs.')
        and has(help, 'passive overlay never requests stats'));
    expect(id .. ' age comes from the stat reply, not the readout', tips.more(s, result, 'number', id), 'Stat reply: 0:20 ago.');
end
for _, state in ipairs({ 'waiting', 'stale', 'unavailable', 'not_requested' }) do
    local value = { provenance = { parameter_state = state, inputs_at = 99,
        parameter_reason = 'The current reading cannot supply this value.' } };
    local help = tips.text(s, value, 'number', 'hit');
    check(state .. ' keeps its reason visible', has(help, value.provenance.parameter_reason));
    check(state .. ' explains what happens next', has(help, state == 'waiting' and 'Waiting for the stat reply'
        or state == 'stale' and 'Check again' or 'Check this monster'));
    expect(state .. ' invents no reply age from local inputs', tips.more(s, value, 'number', 'hit'), nil);
end
check('save overlay numeric selections', profiles.save(s, 'Numeric overlay'));
local loaded = defaults.make();
check('load numeric selections', profiles.load(loaded, 'Numeric overlay'));
for _, id in ipairs(ids) do
    check(id .. ' selection stays separate through a profile', loaded.overlay.parts[id] and not loaded.printout.parts[id].on);
    s.overlay.parts[id] = nil;
end
check('save a profile without the new overlay keys', profiles.save(s, 'Older overlay'));
check('load the older profile', profiles.load(loaded, 'Older overlay'));
for _, id in ipairs(ids) do expect(id .. ' stays off when absent from an older profile', loaded.overlay.parts[id], false); end
expect('formatting, previewing and profiles send no commands', #MOCK.commands, 0);
return MOCK.report();
