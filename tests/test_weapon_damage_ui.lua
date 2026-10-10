-- Weapon damage keeps type names and signed changes readable with pictures missing or turned off.
local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local icons = require('ui.icons');
local overlay = require('ui.overlay');
local window = require('ui.settings_window');
local imgui = require('imgui');
local s = defaults.make();
require('ui.skins').fill(s);
local function has(text, part) return (text or ''):find(part, 1, true) ~= nil; end
local r = { name = 'Example', low = 50, high = 50, weapons = {
    weak = { { kind = 'blunt', percent = 25 }, { kind = 'hand_to_hand', percent = 12.5 } },
    resists = { { kind = 'slashing', percent = -12.5 }, { kind = 'piercing', percent = -50 } },
    notes = { 'These are source values, not a prediction of your final damage.' },
} };
local function text() return MOCK.plain(table.concat(printout.lines(s, r), '\n')); end
check('weapon damage is off in both displays by default', not s.printout.parts.weaknesses.on and not s.overlay.parts.weaknesses);
check('Weaknesses follows Magic', has(printout.DEFAULT_ORDER, 'magic weaknesses effects'));
expect('a missing Weaknesses row is restored in order', printout.clean_order(printout.DEFAULT_ORDER:gsub(' weaknesses', '')),
    printout.DEFAULT_ORDER);
for key, part in pairs(s.printout.parts) do part.on = key == 'weaknesses'; end
s.weaknesses.chat = { elements = false, weapons = true, immunities = false, charm = false };
s.weaknesses.overlay = { elements = false, weapons = true, immunities = false, charm = false };
s.printout.header, s.printout.divider = false, 'pipe';
s.printout.replace_game_line = false;
expect('signed percentages and all four full names', text(),
    'Weaknesses: Weak: Blunt (+25%), Hand-to-hand (+12.5%) | Resists: Slashing (-12.5%), Piercing (-50%)');
s.printout.short_words = true;
check('short forms keep the full signed percentages', has(text(), 'H2H (+12.5%)') and has(text(), 'Slash (-12.5%)'));
s.short.weapon_hand_to_hand = 'Fists';
check('each type has a customizable short form', has(text(), 'Fists (+12.5%)'));
local tip = tips.text(s, r, 'weapon', 'hand_to_hand');
check('short text still has a full-name explanation', has(tip, 'Hand-to-hand does') and has(tip, '12.5% more')
    and has(tip, 'separate from the blunt') and has(tip, 'not a prediction'));
s.printout.short_words = false;
s.weapons.weak_word, s.weapons.resist_word = 'Vulnerable', '';
s.printout.parts.weaknesses.label = 'Damage';
check('part and group labels can be changed or cleared', has(text(), 'Damage: Vulnerable: Blunt (+25%)')
    and has(text(), ' | Slashing (-12.5%)') and not has(text(), 'Resists'));
r.weapons.scripted = true;
check('a script-dependent type gets its question mark', text():sub(-1) == '?');
check('the tooltip explains the question mark', has(tips.text(s, r, 'weapon', 'blunt'), 'can change during the fight'));
local scripted_tip = tips.text(s, { weapons = require('core.weapons').readout({
    weapon_dmg = { blunt = 25 }, flags = { scripted_weapons = true },
}, 50) }, 'weapon', 'blunt');
local _, warnings = scripted_tip:gsub('can change', '');
check('a source readout explains the question mark once', warnings == 1
    and has(scripted_tip, 'The ? marks stored values'));
local saved = r.weapons;
r.weapons = require('core.weapons').readout({ weapon_guard = {
    physical = 75, ranged = -50, absorb = 20, nullify_physical = 10, nullify_ranged = 30 } });
expect('general-only damage and chance entries all appear in Weaknesses', text(),
    'Damage: Melee damage: +75% | Ranged damage: -50% | Physical absorb: 20% | Melee nullify: 10% | Ranged nullify: 30%');
check('general hover distinguishes normal attacks from damage types', has(tips.text(s, r, 'weapon', 'physical'),
    'Normal melee damage taken is 75% more') and has(tips.text(s, r, 'weapon', 'physical'), 'separate from the four'));
check('nullification hover preserves absorption ordering', has(tips.text(s, r, 'weapon', 'nullify_ranged'),
    '30% nullification chance when it is not absorbed'));
for _, entry in ipairs(r.weapons.general) do
    local general_tip = tips.text(s, r, 'weapon', entry.kind);
    local _, mentions = general_tip:gsub(tostring(math.abs(entry.percent)) .. '%%', '');
    check('real general hover states its amount once: ' .. entry.kind, mentions == 1
        and has(general_tip, 'Source baseline') and has(general_tip, 'not final damage predictions'));
end
local synthetic = { weapons = { general = { { kind = 'physical', label = 'Melee damage', percent = -25, signed = true } },
    notes = { 'Synthetic shared context.' } } };
check('synthetic general hover remains self-contained with fallback notes',
    has(tips.text(s, synthetic, 'weapon', 'physical'), 'Normal melee damage taken is 25% less')
    and has(tips.text(s, synthetic, 'weapon', 'physical'), 'Synthetic shared context.'));
local mixed = { weapons = require('core.weapons').readout({ weapon_dmg = { blunt = 25 },
    weapon_guard = { physical = -50 } }) };
check('damage-type hover keeps full general numeric notes', has(tips.text(s, mixed, 'weapon', 'blunt'),
    'Normal melee damage taken -50%'));
local varying_general = { weapons = require('core.weapons').readout({ weapon_guard = { physical = -50 },
    levels = { [50] = { weapon_dmg = { blunt = 25 } }, [51] = {} } }) };
check('general hover retains unknown-level context without repeating its amount',
    has(tips.text(s, varying_general, 'weapon', 'physical'), 'exact level is unknown'));
check('general values are available in Target details', has(tips.details(s, r), 'Normal melee damage taken is 75% more')
    and has(tips.details(s, r), '20% absorption chance'));
r.weapons.scripted = true;
check('general-only scripted values keep their warning', text():sub(-1) == '?'
    and has(tips.text(s, r, 'weapon', 'physical'), 'can change during the fight'));
r.weapons = require('core.weapons').readout({ weapon_dmg = { blunt = 25 },
    levels = { [50] = { weapon_guard = { physical = -50 } }, [51] = {} } });
check('a hidden level-dependent guard remains visibly unknown alongside a known type', has(text(), 'Blunt (+25%)')
    and has(text(), 'unknown') and not has(text(), 'Melee damage'));
r.weapons = { weak = {}, resists = {}, notes = { 'Other reductions may apply.' } };
expect('an entirely neutral set prints nothing', text(), '');
check('neutral type notes remain available in Target details', has(tips.details(s, r), 'Other reductions may apply.'));
r.weapons.uncertain, r.weapons.notes = true, { 'Damage modifiers vary by level; the exact level is unknown.' };
expect('an unknown level is not mistaken for a neutral type set', text(), 'Damage: unknown');
check('unknown text has its reason', has(tips.text(s, r, 'weapon', 'unknown'), 'exact level is unknown'));
r.weapons.uncertain, r.weapons.scripted = nil, true;
expect('scripted neutral values still disclose changes', text(), 'Damage: can change in the fight');
check('scripted neutral text explains the baseline', has(tips.text(s, r, 'weapon', 'scripted'), 'stored weapon damage types are neutral'));
check('Target details keeps the neutral scripted explanation', has(tips.details(s, r), 'stored weapon damage types are neutral'));
r.weapons = nil;
expect('missing data prints nothing', text(), '');
r.weapons = saved;
s.weapons.weak_word, s.weapons.resist_word, s.printout.parts.weaknesses.label = 'Weak', 'Resists', 'Weaknesses';

-- Pictures load once. Missing or failed pictures stay missing until unloading.
local loads = MOCK.texture_loads;
local texture = icons.weapon('slashing');
check('a bundled PNG decodes with its original alpha', texture ~= nil and MOCK.texture_loads == loads + 1
    and MOCK.bad_texture_calls == 0);
check('a repeated icon does not load again', icons.weapon('slashing') == texture and MOCK.texture_loads == loads + 1);
expect('an unknown type does not load a substitute', icons.weapon('unknown'), nil);
icons.clear();
MOCK.texture_error = true;
loads = MOCK.texture_loads;
expect('a decoder error leaves a missing picture', icons.weapon('piercing'), nil);
expect('a failed picture is not retried every frame', icons.weapon('piercing'), nil);
expect('the decoder was called once', MOCK.texture_loads, loads + 1);
MOCK.texture_error = false;
icons.clear();

-- Text hover works through wrapping without an icon. Icons only keeps the type name and percentage.
s.overlay.on, s.overlay.icons, s.overlay.tips, s.overlay.font_size, s.overlay.wrap = true, false, true, 24, 220;
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'weaknesses'; end
local bounds;
local old_text = imgui.TextColored;
imgui.TextColored = function (color, value)
    if (has(value, 'Hand-to-hand (+12.5%)')) then
        local x, y = imgui.GetCursorScreenPos();
        bounds = { x + 4, y + 8 };
    end
    return old_text(color, value);
end;
ashita.events.register('d3d_present', 'weapon_ui', function () overlay.draw(s, true, function () return r; end); end);
MOCK.frame();
check('large text wraps and keeps the whole type amount', MOCK.drew('Hand-to-hand (+12.5%)') and bounds ~= nil);
MOCK.mouse = bounds;
MOCK.wait(0.3);
check('plain weapon text opens its own tooltip', has(MOCK.gui.overlay_tip and MOCK.gui.overlay_tip.text, 'Hand-to-hand does'));
s.overlay.icons, s.overlay.icons_only = true, true;
overlay.changed(s);
MOCK.frame();
check('Icons only keeps weapon names and percentages', MOCK.drew('Hand-to-hand (+12.5%)') and MOCK.drew('Piercing (-50%)'));
local real_weapon = icons.weapon;
icons.weapon = function () return nil; end;
overlay.changed(s);
MOCK.frame();
check('missing images retain all text', MOCK.drew('Slashing (-12.5%)') and MOCK.drew('Blunt (+25%)'));
r.weapons = require('core.weapons').readout({ weapon_guard = { physical = 75, ranged = -50 } });
overlay.changed(s);
MOCK.frame();
check('Icons only keeps general damage labels and values without substitute pictures',
    MOCK.drew('Melee damage:') and MOCK.drew('+75%') and MOCK.drew('Ranged damage:') and MOCK.drew('-50%'));
r.weapons = saved;
icons.weapon = real_weapon;
imgui.TextColored = old_text;

window.set_open(true);
window.draw(s, 'test');
check('settings offers the part in both displays', MOCK.gui.paths['Display/weaknesses/##chat'] == 'Checkbox'
    and MOCK.gui.paths['Display/weaknesses/##overlay'] == 'Checkbox');
check('Weaknesses tab has separate weapon label fields', MOCK.gui.paths['Weaknesses/Weapon weak word'] == 'InputText'
    and MOCK.gui.paths['Weaknesses/Weapon resists word'] == 'InputText');
check('search can find weapon damage settings by type', window.search_tabs('slashing').Weaknesses == true);
expect('display-only UI sends no commands', #MOCK.commands, 0);
return MOCK.report();
