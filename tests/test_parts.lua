-- Layout rows keep independent display choices and migrate the old groups once.
local parts = require('core.parts');
local defaults = require('ui.defaults');
local printout = require('core.printout');
local function has(text, want) return (text or ''):find(want, 1, true) ~= nil; end
local function plain(s, r) return MOCK.plain(table.concat(printout.lines(s, r), '\n')); end

local s = defaults.make();
expect('twelve source facts have independent rows', #parts.INFO_IDS, 12);
expect('Charm remains source metadata', #parts.INFO, 13);
for _, id in ipairs(parts.INFO_IDS) do
    check(id .. ' starts off on its own line', s.printout.parts[id].on == false
        and s.printout.parts[id].new_line == true and s.overlay.parts[id] == false);
end
check('old grouped rows leave fresh settings', s.printout.parts.info == nil and s.printout.parts.elements == nil
    and s.printout.parts.weapons == nil and s.printout.parts.immunities == nil);
check('new optional component choices start ready', s.weaknesses.chat.elements and s.weaknesses.overlay.charm
    and s.blue.chat.lessons and not s.blue.chat.chance and not s.overlay.parts.pet);

local legacy = T{
    printout = T{ order = 'drops info elements hit info weapons', parts = T{
        info = T{ on = true }, elements = T{ on = false }, weapons = T{ on = true },
        immunities = T{ on = true, label = 'Cannot land' }, magic = T{ on = false },
    } },
    overlay = T{ parts = T{ info = false, elements = true, weapons = false, immunities = false, magic = true } },
    info = T{ family = false, charm = true, blue = true },
    magic = T{ schools = T{ blue = T{ on = true, spell = 'magical' } } },
};
parts.migrate(legacy);
check('legacy info choices become direct row switches', not legacy.printout.parts.family.on
    and legacy.printout.parts.vitals.on and not legacy.overlay.parts.vitals);
check('weakness migration keeps separate chat components', not legacy.weaknesses.chat.elements
    and legacy.weaknesses.chat.weapons and legacy.weaknesses.chat.immunities and legacy.weaknesses.chat.charm);
check('weakness migration keeps separate overlay components', legacy.weaknesses.overlay.elements
    and not legacy.weaknesses.overlay.weapons and not legacy.weaknesses.overlay.immunities
    and not legacy.weaknesses.overlay.charm);
expect('old immunity label remains a component word', legacy.weaknesses.immune_word, 'Cannot land');
check('Blue migrates lessons and chance independently in each display', legacy.blue.chat.lessons
    and not legacy.blue.chat.chance and not legacy.blue.overlay.lessons and legacy.blue.overlay.chance);
check('both legacy Blue uses keep a visible row', legacy.printout.parts.blue.on and legacy.overlay.parts.blue);
expect('info expands once at its previous position', legacy.printout.order,
    'drops family weaknesses vitals movement pursuit spawn claim dangers blue fight traits crystal rewards hit');
check('old source filters cannot hide a newly enabled row', legacy.info.family == true);
legacy.printout.parts.family.on = true;
check('new Family row works after old false flag migration', parts.info_enabled(legacy, 'family', 'chat'));
legacy.weaknesses.chat.charm, legacy.blue.overlay.chance = false, false;
local before = legacy.printout.order;
parts.migrate(legacy);
check('migration is idempotent and preserves new choices', legacy.printout.order == before
    and not legacy.weaknesses.chat.charm and not legacy.blue.overlay.chance and legacy.printout.parts.family.on);

for _, magic in ipairs({ true, { schools = false }, { schools = { blue = 17 } } }) do
    local ok = pcall(parts.migrate, { magic = magic });
    check('malformed legacy magic fields wait safely for typed profile defaults', ok);
end

local partial = T{ layout_version = parts.VERSION, printout = T{ parts = T{ family = T{ on = true } } } };
parts.migrate(partial);
check('partial new rows receive labels and line flags without losing visibility', partial.printout.parts.family.on
    and partial.printout.parts.family.label == 'Family' and partial.printout.parts.family.new_line);

s = defaults.make();
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.header, s.printout.replace_game_line, s.printout.divider = false, false, 'pipe';
s.printout.parts.weaknesses.on = true;
local r = { info = { sections = {
    { id = 'family', label = 'Family', value = 'Goblin' },
    { id = 'charm', label = 'Charm', value = 'Eligible' },
    { id = 'vitals', label = 'HP and MP', value = '~100 HP' },
    { id = 'blue', label = 'Blue Magic', value = 'Bomb Toss (not learned)' },
} }, elements = { weak = { { element = 'ice' } }, resists = {} },
weapons = { weak = { { kind = 'slashing', percent = 25 } }, resists = {} }, immune = { 'bind' },
magic = { { school = 'school_blue', element = 'fire', low = 65, high = 65 },
          { school = 'school_elemental', element = 'fire', low = 75, high = 75 } } };
expect('four weakness components share one row', plain(s, r),
    'Weaknesses: Weak: Ice | Weak: Slashing (+25%) | Immune: Bind | Charm: Eligible');
s.weaknesses.chat.weapons, s.weaknesses.chat.charm = false, false;
expect('chat weakness switches select components', plain(s, r), 'Weaknesses: Weak: Ice | Immune: Bind');
s.overlay.parts.weaknesses, s.printout.display = true, 'overlay';
s.weaknesses.overlay.elements, s.weaknesses.overlay.immunities = false, false;
expect('overlay weakness switches stay independent', plain(s, r), 'Weaknesses: Weak: Slashing (+25%) | Charm: Eligible');
s.printout.display = nil;
s.printout.parts.weaknesses.on = false;
s.printout.parts.family.on, s.printout.parts.vitals.on = true, true;
s.info.family = false;
expect('facts print once with no old group or duplicated heading', plain(s, r), 'Family: Goblin\nHP and MP: ~100 HP');
s.printout.parts.family.label, s.printout.parts.vitals.new_line = 'Type', false;
expect('independent labels and line flags work', plain(s, r), 'Type: Goblin | HP and MP: ~100 HP');
s.printout.order = printout.move(s.printout.order, 'vitals', -1);
check('source facts can move as ordinary rows', has(plain(s, r), 'HP and MP: ~100 HP\nType: Goblin'));
s.printout.parts.family.on, s.printout.parts.vitals.on = false, false;
s.printout.parts.blue.on, s.printout.parts.magic.on, s.blue.chat.chance = true, true, true;
local output = plain(s, r);
check('Blue combines lessons and spell chance in its own row', has(output,
    'Blue Magic: Bomb Toss (not learned) | Spell chance 65% (Fire)'));
check('Magic contains only non-Blue chances', has(output, 'Magic: Elemental 75% (Fire)')
    and select(2, output:gsub('65%%', '')) == 1);
s.blue.chat.lessons = false;
check('the Blue chance can show without lessons', has(plain(s, r), 'Blue Magic: Spell chance 65% (Fire)')
    and not has(plain(s, r), 'Bomb Toss'));
s.magic.schools.blue.on, s.info.blue = false, false;
check('old Blue flags no longer hide the component', parts.magic_settings(s, 'chat').schools.blue.on);
s.blue.chat.lessons = true;
check('info settings use new component choices', parts.info_settings(s, 'chat').blue);
s.magic.schools.elemental.on = true;
s.magic.extra_accuracy = 19;
local selected = parts.magic_settings(s, 'chat');
check('filtered magic keeps inputs and copies school choices', selected.extra_accuracy == 19
    and selected.schools.elemental.on and not rawequal(selected.schools, s.magic.schools)
    and s.magic.schools.blue.on == false);
s.printout.parts.magic.on, s.blue.chat.chance = false, false;
check('lesson-only Blue needs no spell chance', not parts.magic_settings(s, 'chat').schools.blue.on
    and not parts.magic_settings(s, 'chat').schools.elemental.on and parts.any_info(s, 'chat'));
s.printout.text_tips = true;
check('Blue lessons retain their original info hover marker', has(table.concat(printout.lines(s, r), '\n'), '\29info:blue\29'));
check('empty source sections stay out', plain(s, { info = { sections = {} } }) == '');
-- A character missing a whole section receives shared default tables from Ashita.
MOCK.settings_file = {};
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
check('migration never writes new rows into the shared raw defaults',
    MOCK.settings.defaults.printout.parts.family == nil and MOCK.settings.defaults.overlay.parts.family == nil);
MOCK.settings.switch_character({ printout = { parts = { info = { on = true } } },
    overlay = { parts = { info = true } }, info = { family = true, charm = false } });
local loaded = MOCK.settings.current;
check('a later legacy character still migrates enabled source rows', loaded.printout.parts.family.on
    and loaded.overlay.parts.family and not loaded.weaknesses.chat.charm);
MOCK.settings.switch_character({ layout_version = parts.VERSION,
    printout = { parts = { family = { on = false }, weaknesses = { on = true }, blue = { on = true } } },
    overlay = { parts = { family = false, weaknesses = true, blue = true } },
    weaknesses = { chat = { elements = false, weapons = false, immunities = false, charm = true },
        overlay = { elements = true, weapons = false, immunities = false, charm = false } },
    blue = { chat = { lessons = false, chance = true }, overlay = { lessons = true, chance = false } } });
loaded = MOCK.settings.current;
check('character loads preserve explicit new false choices in both displays', not loaded.printout.parts.family.on
    and not loaded.overlay.parts.family and not loaded.weaknesses.chat.elements and loaded.weaknesses.chat.charm
    and loaded.weaknesses.overlay.elements and not loaded.weaknesses.overlay.charm
    and not loaded.blue.chat.lessons and loaded.blue.chat.chance and loaded.blue.overlay.lessons
    and not loaded.blue.overlay.chance);
return MOCK.report();
