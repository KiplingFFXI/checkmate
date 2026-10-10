-- Evidence and conditions stay visible without pictures, and optional details leave the defaults compact.
local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local window = require('ui.settings_window');
local s = defaults.make();
require('ui.skins').fill(s);
local function has(text, part) return (text or ''):find(part, 1, true) ~= nil; end
local function lines(result)
    local text = table.concat(printout.lines(s, result), '\n');
    return MOCK.plain(text);
end
for key, part in pairs(s.printout.parts) do part.on = key == 'name' or key == 'effects'; end
local result = { name = 'Test monster', low = 42, high = 42 };
check('optional details start compact', not s.effects.estimate_mark and not s.effects.show_empty and not s.ranged.show_distance);
check('empty Effects stays out by default', not has(lines(result), 'Effects:'));
s.effects.show_empty = true;
check('empty observations do not claim a clear monster', has(lines(result), 'No effects observed'));
s.effects.show = 'debuffs';
check('empty filter names only debuffs', has(lines(result), 'No debuffs observed'));
s.effects.show = 'buffs';
check('empty filter names only buffs', has(lines(result), 'No buffs observed'));
check('empty tip states observation limits', has(tips.text(s, result, 'effect', 'none'), 'may still be on'));
result.effects = { { effect = 4, word = 'eff_paralysis', debuff = true, mine = true, left = 80 } };
s.effects.show, s.effects.estimate_mark = 'both', true;
check('chat can mark your timer as estimated too', has(lines(result), 'Paralyze ~1:20'));
expect('known uncertain single value', printout.number_text({ low = 65, high = 65, uncertain = true }, 'range'), '~65%');
expect('uncertain range', printout.number_text({ low = 60, high = 70, uncertain = true }, 'range'), '~60-70%');
expect('midpoint never doubles its marker', printout.number_text({ low = 60, high = 70, uncertain = true }, 'midpoint'), '~65%');
expect('ordinary exact rate stays exact-looking', printout.number_text({ low = 65, high = 65 }, 'range'), '65%');
s.printout.parts.ranged.on = true;
result.shoots, result.ranged, result.ranged_distance = true, { low = 65, high = 65 }, { distance = 12.5 };
check('distance stays hidden until enabled', not has(lines(result), '12.5'));
s.ranged.show_distance = true;
check('distance keeps the sweet-spot estimate', has(lines(result), '65% (12.5 yalms away)'));
check('distance tip explains what is not recalculated', has(tips.text(s, result, 'number', 'ranged'), 'does not change'));
result.provenance = { level_source = 'spawn', stats_source = 'band', observed_at = 10, inputs_at = 20 };
check('spawn level is not described as observed', has(tips.text(s, result, 'level', 'name'), 'bundled spawn data'));
check('typical stats are disclosed', has(tips.text(s, result, 'level', 'name'), 'typical monster stats'));
result.provenance.level_source = 'check';
check('remembered level explains reused identities', has(tips.text(s, result, 'level', 'name'), 'same ID'));
MOCK.now = 100;
check('observation age and input age are separate', has(tips.more(s, result, 'level', 'name'), '1:30 ago.')
    and has(tips.more(s, result, 'number', 'crit'), '1:20 ago.'));
result.magic = {
    { school = 'school_elemental', spell = 'Fire', semantics = 'full', element = 'fire', low = 70, high = 70 },
    { school = 'school_enfeebling', spell = 'Paralyze', semantics = 'land', element = 'ice', low = 60, high = 60,
        uncertain = true, notes = { 'Unknown food bonus.' } },
};
result.inputs = { level = 75, dex = 90, crit_merits = 3, int = 80, mnd = 85, skills = { [36] = 276, [35] = 269 },
    extra_accuracy = 12, modifiers = { magic_accuracy = 7 } };
check('nuke tip names the selected spell and full-damage chance', has(tips.text(s, result, 'magic', 'school_elemental'),
    'Fire. The percentage is its chance of full, unresisted damage'));
check('enfeeble tip separates landing from duration', has(tips.text(s, result, 'magic', 'school_enfeebling'), 'reduced duration'));
check('known uncertainty has a reason', has(tips.text(s, result, 'magic', 'school_enfeebling'), 'Unknown food bonus.'));
check('number details include the actual relevant attributes', has(tips.text(s, result, 'number', 'crit'), 'DEX 90')
    and has(tips.text(s, result, 'number', 'crit'), 'merit ranks 3'));
check('magic details include skill and manual versus known inputs', has(tips.text(s, result, 'magic', 'school_elemental'),
    'Elemental skill 276') and has(tips.text(s, result, 'magic', 'school_elemental'), 'Remaining direct accuracy 12'));
check('flat gear accuracy is not labeled as all direct bonuses', has(tips.text(s, result, 'magic', 'school_elemental'),
    'Flat gear magic accuracy 7'));
result.links = { links = true, names = { 'First' }, more = 1, all_names = { 'First', 'Hidden' },
    all_tags = { Hidden = { { 'sense_superlink' } } } };
check('link tip includes names hidden by the display limit', has(tips.text(s, result, 'links', 'links'), 'Hidden (Superlink)'));
check('link tip does not claim current nearby enemies', has(tips.text(s, result, 'links', 'links'), 'not a list of nearby'));
for i = 1, 25 do result.links.all_names[i] = 'Helper ' .. i; end
check('large link tooltip points to the full scrollable details', has(tips.text(s, result, 'links', 'links'),
    '5 more. Full list: Monster > Target details.') and not has(tips.text(s, result, 'links', 'links'), 'Helper 25'));
check('target details retains all link names', has(tips.details(s, result), 'Helper 25'));
result.ph_for = { 'Example NM' };
result.ph_details = { { name = 'Example NM', chance = 5, cooldown_min = 3600, cooldown_max = 5400,
    conditions = { 'Only at night.' } } };
local ph = tips.text(s, result, 'ph', 'ph');
check('PH rules keep their source conditions and clock origin', has(ph, '5.0%') and has(ph, '60-90 minutes after NM despawn')
    and has(ph, 'Only at night.') and has(ph, 'do not show whether'), ph);
result.drops = { items = { { id = 1, name = 'Conditional loot', chance = 100 } }, th = 0, more = 0,
    conditions = { 'Only the surviving monster drops it.' } };
local drop = tips.text(s, result, 'item', '1');
check('conditional guaranteed loot never says always drops', not has(drop, 'always drops') and has(drop, 'Only the surviving'));
s.printout.parts.drops.on = true;
check('conditional loot has a compact chat qualifier', has(lines(result), '(conditional)'));
result.drops.conditions, result.drops.scripted = nil, true;
drop = tips.text(s, result, 'item', '1');
check('scripted guaranteed loot remains a conditional table rate', has(drop, 'listed drop rate is 100%')
    and has(drop, 'A script can change which drops are available.') and not has(drop, 'always drops'));
result.drops.items[1].chance = 50;
check('scripted fractional loot keeps its eligibility qualifier', has(tips.text(s, result, 'item', '1'),
    'These rates apply only when the drop conditions are met.'));
check('scripted loot chat names source conditions', has(lines(result), '(scripted loot conditions)'));
result.steal = { ids = { 1 }, items = { 'Loot' }, low = 50, high = 50 };
s.printout.parts.steal.on = true;
check('Steal chat chance is conditional too', has(lines(result), 'Loot (50%) (conditional)'));
s.printout.text_tips, s.printout.marks = true, false;
local raw = table.concat(printout.lines(s, result), '\n');
check('text-only name has a bounded hover span', has(raw, '\29level:name\29') and has(raw, '\29end:text\29'));
check('text-only effects and item names have tips', has(raw, '\29effect:4\29') and has(raw, '\29item:1\29'));
s.printout.text_tips = false;
check('chat never receives hover markers', not has(table.concat(printout.lines(s, result), '\n'), '\29'));
check('search finds Effects under its current tab', window.search_tabs('estimated timers').Effects == true);
check('search finds distance controls', window.search_tabs('current distance').Numbers == true);
check('search finds a stand-in spell', window.search_tabs('Paralyze').Magic == true);
check('search uses plain text, not patterns', next(window.search_tabs('.*')) == nil);
check('search does not alter any setting', s.effects.estimate_mark == true and s.ranged.show_distance == true);
window.set_open(true);
check('diagnostic summary UI has no setter', window.set_diagnostics == nil);
window.set_target_details(result);
MOCK.typing['Find settings'] = 'target details';
window.draw(s, 'test');
check('search renders target details under Monster', MOCK.gui.tabs.Monster == true and MOCK.gui.tabs.Magic ~= true
    and MOCK.gui.tabs.Diagnostics ~= true);
check('target details renders the final name in a large list', MOCK.drew('Helper 25'));
MOCK.clicks['Monster/Copy details'] = true;
window.draw(s, 'test');
check('copy contains full target details without a diagnostic summary', has(MOCK.clipboard, 'Helper 25')
    and not has(MOCK.clipboard, 'Source test-build') and not has(MOCK.clipboard, 'Version test'));
window.set_target_details(nil);
MOCK.gui.texts = {};
window.draw(s, 'test');
check('an absent target keeps a usable Copy details button and no old facts',
    MOCK.gui.paths['Monster/Copy details'] == 'Button' and not MOCK.drew('Helper 25'));
MOCK.clicks['Monster/Copy details'] = true;
window.draw(s, 'test');
expect('copy drops the previous target when none is supplied', MOCK.clipboard, 'No monster selected.');
window.set_target_details(result);
MOCK.clicks['Monster/Copy details'] = true;
window.draw(s, 'test');
check('a later target rebuilds copied details after the empty state', has(MOCK.clipboard, 'Helper 25')
    and not has(MOCK.clipboard, 'No monster selected.'));
check('diagnostics is no longer a search topic', next(window.search_tabs('diagnostics')) == nil);
-- A pet reply has its own age, separate from the target's /check and local inputs.
do
    local pet_result = { pet = { parameter_state = 'checked', observed_at = 40 },
        provenance = { observed_at = 20, inputs_at = 30 } };
    MOCK.now = 100;
    check('pet hover identifies a retained reply without promising a refresh',
        has(tips.text(s, pet_result, 'number', 'pet'), 'retained stats belong to this pet and target')
        and has(tips.text(s, pet_result, 'number', 'pet'), 'overlay never requests pet stats'));
    expect('pet hover uses the pet reply age', tips.more(s, pet_result, 'number', 'pet'), 'Pet stat reply: 1:00 ago.');
    check('switching hover in the same second uses the target age again',
        has(tips.more(s, pet_result, 'level', 'name'), 'Level observation: 1:20 ago.'));
    pet_result.pet.parameter_state, pet_result.pet.observed_at = 'unknown', nil;
    check('missing pet inputs are not presented as a current estimate',
        has(tips.text(s, pet_result, 'number', 'pet'), 'Unknown numbers stay unknown'));
    pet_result.pet.parameter_state = 'source';
    check('charmed-pet source estimates are distinguished from replies',
        has(tips.text(s, pet_result, 'number', 'pet'), 'charmed pet uses stored monster stats'));
end
return MOCK.report();
