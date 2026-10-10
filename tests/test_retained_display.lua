local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local s = defaults.make();
local parameter_ids = { 'hit', 'offhand', 'ranged', 'evade' };
local pdif_ids = { 'pdif', 'offhandpdif', 'rangedpdif' };
local all = { 'hit', 'offhand', 'ranged', 'evade', 'pdif', 'offhandpdif', 'rangedpdif' };
local reason = 'Your inputs changed after this reading. Check again to refresh it.';
local earlier = 'This is the last calculated estimate, kept from your earlier reading.';
local function has(text, want) return (text or ''):find(want, 1, true) ~= nil; end
local function count(text, want)
    local n, at = 0, 1;
    while true do
        local found = text:find(want, at, true);
        if (found == nil) then return n; end
        n, at = n + 1, found + #want;
    end
end
local function plain(settings, result)
    return (MOCK.plain(table.concat(printout.lines(settings, result), '\n')):gsub('\29[^\29]+\29', ''));
end
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
for _, id in ipairs(all) do s.overlay.parts[id] = true; end
local result = { name = 'Example monster', low = 42, high = 42, dual_wield = true, shoots = true,
    provenance = { parameter_state = 'stale', parameter_at = 70, inputs_at = 99, parameter_reason = reason },
    inputs = { level = 75, accuracy = 999, offhand_accuracy = 998, ranged_accuracy = 997, evasion = 996, dex = 100 },
    parameter_inputs = { level = 42, accuracy = 240, offhand_accuracy = 230, ranged_accuracy = 250, evasion = 220 } };
for _, id in ipairs(parameter_ids) do
    result[id] = { low = 72, high = 78, retained = true, uncertain = true, notes = { reason } };
end
for _, id in ipairs(pdif_ids) do
    result[id] = { low = 1.15, high = 1.93, ratio_low = 558 / 365, ratio_high = 558 / 365,
        attack = 558, defense_low = 365, defense_high = 365, observed_at = 80,
        retained = true, uncertain = true, notes = { reason } };
end
MOCK.now = 100;
local text = plain(printout.overlay_view(s), result);
expect('all seven older rows keep their numbers and request refresh', count(text, '(Check again)'), 7);
check('retained chance ranges keep uncertainty', has(text, 'Hit: ~72-78% (Check again)')
    and has(text, 'Off-hand: ~72-78% (Check again)') and has(text, 'Ranged: ~72-78% (Check again)')
    and has(text, 'Evade: ~72-78% (Check again)'), text);
check('retained pDIF keeps both numeric forms', has(text,
    'pDIF: ~1.15-1.93x; Ratio ~1.53 (Attack 558 / Defense 365) (Check again)'), text);
check('overlay-only rows stay out of chat', not has(plain(s, result), '(Check again)'));
for _, mode in ipairs({ 'range', 'ratio', 'both' }) do
    s.pdif.mode = mode;
    text = plain(printout.overlay_view(s), result);
    expect(mode .. ' has one refresh marker per row', count(text, '(Check again)'), 7);
    check(mode .. ' preserves its selected numeric display',
        has(text, '~1.15-1.93x') == (mode ~= 'ratio') and has(text, 'Ratio ~1.53') == (mode ~= 'range'));
end
s.printout.number_style = 'midpoint';
check('midpoint keeps one uncertainty marker and refresh instruction',
    has(plain(printout.overlay_view(s), result), 'Hit: ~75% (Check again)'));
s.printout.number_style = 'range';
local expected_inputs = { hit = 'Accuracy 240', offhand = 'Off-hand accuracy 230',
    ranged = 'Ranged accuracy 250', evade = 'Evasion 220' };
for _, id in ipairs(parameter_ids) do
    local hover = tips.text(s, result, 'number', id);
    check(id .. ' hover identifies the older calculated estimate', has(hover, earlier));
    expect(id .. ' change reason is not repeated', count(hover, reason), 1);
    check(id .. ' hover uses original input hints', has(hover, 'Level 42') and has(hover, expected_inputs[id])
        and not has(hover, 'Level 75') and not has(hover, '99'), hover);
    expect(id .. ' reply age stays with the original stats', tips.more(s, result, 'number', id), 'Stat reply: 0:30 ago.');
end
for _, id in ipairs(pdif_ids) do
    local hover = tips.text(s, result, 'number', id);
    check(id .. ' hover keeps old values and the refresh reason', has(hover, earlier) and has(hover, reason)
        and has(hover, 'Attack 558 / Defense 365'));
    expect(id .. ' reply age uses its own Attack reply', tips.more(s, result, 'number', id), 'Attack stat reply: 0:20 ago.');
end
local groups = {};
for _, group in ipairs(tips.detail_groups(s, result)) do groups[group.id] = group.text; end
for _, id in ipairs(all) do
    check(id .. ' full details identify the retained value and reason', has(groups[id], earlier) and has(groups[id], reason));
    check(id .. ' full details retain the correct reply age', has(groups[id], id:find('pdif', 1, true)
        and 'Attack stat reply: 0:20 ago.' or 'Stat reply: 0:30 ago.'));
end
check('Copy details includes both distinct reply ages', has(tips.details(s, result), 'Stat reply: 0:30 ago.')
    and has(tips.details(s, result), 'Attack stat reply: 0:20 ago.'));
result.parameter_inputs = nil;
local hover = tips.text(s, result, 'number', 'hit');
check('missing old input hints do not borrow current accuracy or level', not has(hover, 'Accuracy 999') and not has(hover, 'Level 75'));
for _, id in ipairs(all) do result[id].retained = nil; end
text = plain(printout.overlay_view(s), result);
check('ordinary uncertainty does not ask for another check', has(text, '~72-78%') and not has(text, '(Check again)'));
check('ordinary pDIF uncertainty is not called an earlier reading', not has(tips.text(s, result, 'number', 'pdif'), earlier));
result.hit, result.offhand, result.ranged, result.evade = nil, nil, nil, nil;
for _, id in ipairs(pdif_ids) do result[id] = { retained = true, notes = { reason } }; end
text = plain(printout.overlay_view(s), result);
check('unknown values are not turned into retained numeric readings', has(text, 'unknown') and not has(text, '(Check again)'));
result.provenance.parameter_at = nil;
groups = {};
for _, group in ipairs(tips.detail_groups(s, result)) do groups[group.id] = group.text; end
check('missing Attack reply time stays unknown in full details', has(groups.pdif, 'Attack stat reply age unknown.')
    and not has(groups.pdif, '0:01 ago.'));
for _, id in ipairs(all) do s.overlay.parts[id] = false; end
check('disabled optional pDIF stays out of full details', not has(tips.details(s, result), 'pDIF'));
expect('formatting and details send no game commands', #MOCK.commands, 0);
return MOCK.report();
