local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local defenses = require('core.defenses');
local pdif = require('core.pdif');
local s = defaults.make();
for _, row in pairs(s.printout.parts) do row.on = false; end
s.printout.parts.block.on, s.printout.parts.parry.on, s.printout.parts.pdif.on = true, true, true;
local result = { name = 'Example', low = 75, high = 75,
    block = { eligible = false, status = 'no_shield', unavailable_reason = 'Equip a shield to block.', notes = { 'Equip a shield to block.' } },
    parry = { eligible = false, status = 'weapon_cannot_parry', notes = {} },
    pdif = pdif.readout(nil, {}, 'main', 'Your inputs changed after the attack reading. Check again.') };
local function text() return MOCK.plain(table.concat(printout.lines(s, result), '\n')); end
check('known shield issue is actionable inline', text():find('Shield block: No shield equipped', 1, true));
check('known weapon issue is actionable inline', text():find('Parry: Weapon cannot parry', 1, true));
check('stale Attack snapshot asks for a new check', text():find('pDIF: Check again', 1, true));
s.printout.short_words, s.short.num_no_shield, s.short.num_check_again = true, 'Shield missing', 'Refresh';
check('new states honor customized abbreviations', text():find('Shield missing', 1, true) and text():find('Refresh', 1, true));
result.pdif = pdif.readout(nil, {}, 'main', 'Your current attack inputs could not be read.');
check('unreadable inputs do not promise a refresh fix', text():find('Refresh', 1, true) == nil and text():find('unk', 1, true));
s.printout.short_words = false;
result.block = { low = 30, high = 32, uncertain = true, skill = 250, shield_name = 'Example Shield', shield_size = 3,
    attacker_skill_low = 245, attacker_skill_high = 250,
    notes = { 'Chance for an eligible ordinary melee shield roll, not total damage avoidance. Face the attacker and be able to act.',
        'Example Shield (size 3).', 'Monster weapon skill: 245-250.', 'Palisade is active. Its hidden block-rate power is not included.',
        'Earlier avoidance and special attacks have separate rules.' } };
local hover = tips.text(s, result, 'number', 'block');
check('hover separates result, inputs, requirements and uncertainty', hover:find('\nResult:', 1, true)
    and hover:find('\nInputs:', 1, true) and hover:find('\nRequirements:', 1, true) and hover:find('\nUncertainty:', 1, true));
expect('facing condition appears once', select(2, hover:gsub('face the attacker', '')), 1);
check('specific hidden power remains in hover', hover:find('hidden block-rate power', 1, true));
local full = tips.details(s, result);
for _, note in ipairs(result.block.notes) do check('full details retains ' .. note, full:find(note, 1, true)); end
local native = defenses.readout({ level = 75, main_job = 1, sub_job = 0, sub_id = 0 }, { low = 75, high = 75 }, 'block');
expect('core emits stable no-shield status', native.status, 'no_shield');
local no_melee = defenses.readout(nil, { row = { no_swings = true } }, 'block');
expect('ordinary melee exclusion has a stable status', no_melee.status, 'no_melee');
return MOCK.report();
