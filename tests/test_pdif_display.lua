-- pDIF rows keep multipliers, ratios and their inputs distinct from percentage chances.
local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local overlay = require('ui.overlay');
local skins = require('ui.skins');
local window = require('ui.settings_window');
local s = defaults.make();
skins.fill(s);
local ids = { 'pdif', 'offhandpdif', 'rangedpdif' };
local function has(text, value) return (text or ''):find(value, 1, true) ~= nil; end
for _, id in ipairs(ids) do
    check(id .. ' starts off in chat and overlay', not s.printout.parts[id].on and not s.overlay.parts[id]);
    check(id .. ' has an independent line and overlay row', s.printout.parts[id].new_line and overlay.is_part(id));
end
expect('new settings show both forms when enabled', s.pdif.mode, 'both');
for _, part in pairs(s.printout.parts) do part.on = false; end
for _, id in ipairs(ids) do s.printout.parts[id].on = true; end
local value = { low = 1.15, high = 1.93, ratio_low = 558 / 365, ratio_high = 558 / 365,
    attack = 558, defense_low = 365, defense_high = 365, cap_low = 2, cap_high = 2,
    corrected_ratio_low = 1.40, corrected_ratio_high = 1.40, observed_at = 80,
    notes = { 'Normal noncritical attacks only. This is a possible multiplier range, not an average or final damage.',
        'A conditional source modifier is not resolved.' } };
local result = { name = 'Example monster', low = 75, high = 75, dual_wield = true, shoots = true,
    pdif = value, offhandpdif = value, rangedpdif = value };
local function lines()
    local out, first, holding = printout.lines(s, result);
    return MOCK.plain(table.concat(out, '\n')), out, first, holding;
end
local text, raw, first, holding = lines();
expect('three pDIF rows print on separate lines', #raw, 3);
check('all pDIF rows wait for their Attack inputs', first == 1 and holding[1] and holding[2] and holding[3]);
check('both mode keeps multiplier and raw ratio inputs', has(text, 'pDIF: 1.15-1.93x; Ratio 1.53 (Attack 558 / Defense 365)'));
check('pDIF never uses percent signs or a false ratio cap', not has(text, '%') and not has(text, 'cap'));
expect('multiplier bounds round outward', printout.pdif_span(1.2352, 1.934, 2, true), '1.23-1.94');
expect('exact decimal endpoints do not gain a floating-point step', printout.pdif_span(1.15, 1.93, 2, true), '1.15-1.93');
expect('ratios use nearest rounding', printout.pdif_span(1.2352, 1.934), '1.24-1.93');
local before = text;
s.grades.on, s.printout.number_style = true, 'midpoint';
expect('percentage grades and midpoint do not turn pDIF into a percentage or average', lines(), before);
s.pdif.mode = 'range';
text = lines();
check('range mode shows only multiplier bounds', has(text, '1.15-1.93x') and not has(text, 'Ratio') and not has(text, 'Attack'));
s.pdif.mode = 'ratio';
text = lines();
check('ratio mode shows raw A/D and its inputs', has(text, 'Ratio 1.53 (Attack 558 / Defense 365)') and not has(text, '1.15'));
s.printout.short_words = true;
text = lines();
check('abbreviations only change the fixed ratio/input words', has(text, 'A/D 1.53 (ATK 558 / DEF 365)'));
s.short.pdif_attack = 'Power';
check('a custom pDIF input word is supported', has(lines(), 'Power 558'));
s.printout.short_words, s.pdif.mode = false, 'both';
value.uncertain, value.scripted = true, true;
text = lines();
check('uncertainty and script changes stay visible', has(text, '~1.15-1.93x; Ratio ~1.53') and has(text, '365)?'));
local help = tips.text(s, result, 'number', 'pdif');
check('hover includes both forms regardless of display mode', has(help, 'Result: 1.15-1.93x') and has(help, 'A/D ratio 1.53'));
check('working ratio and curve cap are separate', has(help, 'Working ratio: 1.40')
    and has(help, 'curve cap 2.00') and has(help, 'not the maximum multiplier') and not has(help, 'cap: 2.00x'));
check('source caveats and noncritical scope stay visible', has(help, 'normal noncritical attacks only; possible multipliers, not average or final damage.')
    and has(help, value.notes[2]) and has(help, 'stored monster defense') and has(help, 'can change during the fight'));
MOCK.now = 100;
expect('hover gives the Attack reply its own age', tips.more(s, result, 'number', 'pdif'), 'Attack stat reply: 0:20 ago.');
local full = tips.details(s, result);
check('Target details keeps each enabled weapon path', has(full, 'Main-hand pDIF') and has(full, 'Off-hand pDIF') and has(full, 'Ranged pDIF'));
for _, id in ipairs(ids) do s.printout.parts[id].on = false; end
check('disabled pDIF does not leak into Target details', not has(tips.details(s, result), 'pDIF'));
s.overlay.parts.rangedpdif = true;
check('an overlay-only pDIF row has full details', has(tips.details(s, result), 'Ranged pDIF'));
s.overlay.parts.rangedpdif = false;
s.printout.parts.pdif.on = true;
result.pdif = { notes = { 'Attack is unknown.' } };
text = lines();
check('unreadable inputs stay unknown rather than zero', has(text, 'unknown; Ratio unknown (Attack unknown / Defense unknown)') and not has(text, '0.00'));
check('unknown attack never claims a reply was received', has(tips.text(s, result, 'number', 'pdif'), 'No usable Attack stat reply is available.'));
check('unknown pDIF still states its noncritical scope', has(tips.text(s, result, 'number', 'pdif'), 'normal noncritical attacks only;'));
result.dual_wield, result.shoots = false, false;
for _, id in ipairs(ids) do s.printout.parts[id].on = true; end
local _, fewer = lines();
expect('irrelevant off-hand and ranged rows are omitted', #fewer, 1);
for _, skin in ipairs(skins.LIST) do
    skins.apply(s, skin.id);
    for _, id in ipairs(ids) do
        check(skin.id .. ' provides all ' .. id .. ' colors', printout.in_palette(s.colors[id .. '_label'])
            and printout.in_palette(s.colors[id .. '_number']) and printout.in_palette(s.colors[id .. '_detail']));
    end
end
local old_order = 'difficulty hit offhand ranged evade crit';
check('saved row order gains pDIF beside its matching path', has(printout.clean_order(old_order), 'hit pdif offhand offhandpdif ranged rangedpdif evade'));
local profiles = require('ui.profiles');
s.pdif.mode, s.printout.parts.pdif.label, s.overlay.parts.pdif = 'ratio', 'Damage factor', true;
check('save pDIF choices in a profile', profiles.save(s, 'pDIF settings'));
local loaded = defaults.make();
check('load pDIF choices independently', profiles.load(loaded, 'pDIF settings') and loaded.pdif.mode == 'ratio'
    and loaded.printout.parts.pdif.label == 'Damage factor' and loaded.overlay.parts.pdif);
MOCK.navigation_real = true;
require('ui.navigation').select('Numbers');
window.set_open(true);
MOCK.frame(0);
window.draw(s, 'test');
for _, id in ipairs(ids) do
    check(id .. ' has both Numbers display controls', MOCK.gui.paths['Numbers/' .. id .. '/In chat'] == 'Checkbox'
        and MOCK.gui.paths['Numbers/' .. id .. '/In overlay'] == 'Checkbox');
end
check('pDIF mode has its own non-percent control', MOCK.gui.paths['Numbers/pDIF display'] == 'BeginCombo');
MOCK.open['Numbers/pDIF display'] = true;
MOCK.clicks['Numbers/pDIF display/Multiplier range'] = true;
local changed = window.draw(s, 'test');
check('Numbers mode selection updates settings and requests save', changed.save and s.pdif.mode == 'range');
check('pDIF options are found through settings search', window.search_tabs('Attack/Defense ratio').Numbers
    and window.search_tabs('pDIF').Numbers and window.search_tabs('pDIF').Appearance);
expect('display controls send no game commands', #MOCK.commands, 0);
local target = require('core.target');
target.read = function () return 224; end;
target.readout = function () return result; end;
result.pdif, result.dual_wield, result.shoots = value, true, true;
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'pdif'; end
s.pdif.mode, s.overlay.on, s.overlay.wrap, s.overlay.icons = 'both', true, 250, false;
for _, show_tips in ipairs({ true, false }) do
    s.overlay.tips = show_tips;
    MOCK.frame(0);
    overlay.changed(s);
    overlay.draw(s, false, function () return result; end);
    local drawn = MOCK.overlay_lines();
    check('long pDIF wraps with tips ' .. tostring(show_tips), #drawn > 1);
    local joined = table.concat(drawn, ' '):gsub('%s+', ' ');
    check('wrapped pDIF keeps all inputs with tips ' .. tostring(show_tips), has(joined, 'Attack 558 / Defense 365')
        and has(joined, 'Ratio ~1.53'));
    local fits = true;
    for _, line in ipairs(drawn) do fits = fits and #line * 7 <= 250; end
    check('wrapped pDIF respects the narrow width with tips ' .. tostring(show_tips), fits);
end
return MOCK.report();
