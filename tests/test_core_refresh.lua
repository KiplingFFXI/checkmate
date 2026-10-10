-- A poll and the readout it triggers use one set of inputs.
local player = require('core.player');
local target = require('core.target');
local magic = require('core.magic');
local modifiers = require('core.modifiers');
local s = require('ui.defaults').make();
addon.path = FIXTURES_PATH;
MOCK.player.zone, MOCK.player.main_level, MOCK.player.main_job = 900, 40, 1;
MOCK.items[10] = { Skill = 3 };
MOCK.player.equipment = { [0] = 10 };
MOCK.player.skills = { [3] = 200, [30] = 200, [31] = 200 };
MOCK.target_monster(1, 'Fixture Goblin');
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.overlay.parts.pdif, s.overlay.parts.parry = true, true;
local attacks, defenses = 0, 0;
local read_attack, read_defense = player.pdif_inputs, player.defense_inputs;
player.pdif_inputs = function(...)
    attacks = attacks + 1;
    return read_attack(...);
end;
player.defense_inputs = function(...)
    defenses = defenses + 1;
    return read_defense(...);
end;
local function frame(dt)
    MOCK.now = MOCK.now + (dt or 0);
    target.take_in();
    target.read(s.overlay);
    return target.readout(s);
end
target.on_zone(900);
local first = frame();
expect('first build reads Attack inputs once', attacks, 1);
expect('first build reads defensive inputs once', defenses, 1);
check('defensive result is still calculated', first.parry.low ~= nil);
local old_parry = first.parry.low;
MOCK.player.skills[31] = 210;
local changed, rebuilt = frame(0.3);
expect('changed poll builds a fresh result', rebuilt, true);
expect('changed poll does not reread Attack inputs', attacks, 2);
expect('changed poll does not reread defensive inputs', defenses, 2);
check('changed defensive skill reaches the new readout', changed.parry.low > old_parry);
expect('old defensive result remains unchanged', first.parry.low, old_parry);
local quiet = frame(0.3);
expect('quiet due poll retains the result', quiet, changed);
expect('quiet due poll reads Attack once', attacks, 3);
expect('quiet due poll reads defenses once', defenses, 3);
frame(0.1);
expect('frame before the next poll reads no Attack inputs', attacks, 3);
expect('frame before the next poll reads no defensive inputs', defenses, 3);
target.mark_stale();
frame();
expect('an earlier setting rebuild reads fresh Attack inputs once', attacks, 4);
expect('an earlier setting rebuild reads fresh defensive inputs once', defenses, 4);
MOCK.target_monster(2, 'Fixture Goblin');
frame();
expect('target change before the poll reads Attack inputs once', attacks, 5);
expect('target change before the poll reads defensive inputs once', defenses, 5);
s.overlay.parts.pdif, s.overlay.parts.parry = false, false;
target.mark_stale();
frame(0.3);
expect('disabled rows do not read Attack inputs', attacks, 5);
expect('disabled rows do not read defensive inputs', defenses, 5);
expect('refreshes send no commands', #MOCK.commands, 0);
player.pdif_inputs, player.defense_inputs = read_attack, read_defense;
target.forget();

local enemy_calls, enemy = 0, modifiers.enemy;
modifiers.enemy = function(...)
    enemy_calls = enemy_calls + 1;
    return enemy(...);
end;
local me = player.read();
for _, id in ipairs({ 32, 33, 35, 36, 37, 39, 40, 42, 43 }) do me.skills[id] = 200; end
local row = { undead = true, levels = {} };
for level = 38, 40 do row.levels[level] = { int = 45, mnd = 40, chr = 38 }; end
local mob = { row = row, low = 38, high = 40, effects = { { effect = 84 } } };
for _, school in pairs(s.magic.schools) do school.on = true; end
local results = magic.readout(me, mob, s.magic);
expect('all eight schools still produce results', #results, 8);
expect('schools share one enemy confidence calculation', enemy_calls, 1);
check('different schools keep separate notes tables', results[1].notes ~= results[2].notes);
for _, result in ipairs(results) do
    check('each school keeps its cast qualification', table.concat(result.notes, ' '):find('normal cast', 1, true));
end
local old_notes = table.concat(results[1].notes, ' ');
check('observed enemy effects qualify the numeric result', results[1].uncertain);
mob.effects = {};
local refreshed = magic.readout(me, mob, s.magic);
expect('a later readout refreshes enemy confidence', enemy_calls, 2);
check('new enemy confidence reaches the result', table.concat(refreshed[1].notes, ' ') ~= old_notes);
expect('old school notes remain unchanged', table.concat(results[1].notes, ' '), old_notes);

local one_school = { schools = { enfeebling = { on = true, spell = 'slow' } } };
local function no_enemy_notes(label)
    local before = enemy_calls;
    local result = magic.readout(me, mob, one_school);
    expect(label .. ' does not read enemy confidence', enemy_calls, before);
    return result;
end
me.skills[35] = 0;
expect('missing skill has no result', #no_enemy_notes('missing skill'), 0);
me.skills[35] = 200;
local levels = row.levels;
row.levels = {};
expect('missing level stats have no result', #no_enemy_notes('missing level stats'), 0);
row.levels = levels;
row.immune = { 'slow' };
expect('immunity remains explicit', no_enemy_notes('immunity')[1].word, 'magic_immune');
row.immune, row.ranks = nil, { slow = 11 };
expect('never lands remains explicit', no_enemy_notes('never lands')[1].word, 'magic_never');
row.ranks = nil;
one_school.schools.enfeebling.on = false;
expect('disabled schools have no result', #no_enemy_notes('disabled schools'), 0);
modifiers.enemy = enemy;
return MOCK.report();
