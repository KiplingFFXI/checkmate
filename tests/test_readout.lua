-- Tests the readout through the whole addon, with your stats, skills, gear and buffs read from game
-- memory. It covers Signet, crit from DEX with gear, and what goes into each magic school, like your
-- staff, the seals, Soul Voice, a wind instrument and extra magic accuracy. It also covers resist
-- traits by level, Healing on the undead only, and the drop settings.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';
for index, name in pairs({ [1] = 'Fixture Goblin', [30] = 'Fixture Knight', [400] = 'Fixture NM', [77] = 'Mystery Mob' }) do
    MOCK.entities[index] = { Name = name };
end
local p = MOCK.player;

-- Your /check, answered with accuracy 300 and evasion 250 when hit or evade is on. Returns the plain lines.
local function readout(index, level, con, message)
    local n = #MOCK.printed;
    MOCK.commands = {};
    MOCK.packet(MOCK.check_packet(index, level, con, message or 174));
    MOCK.wait(1.6);
    if (#MOCK.commands > 0) then
        MOCK.reply(300, 250);
        MOCK.frame();
    end
    return table.concat(MOCK.printed_since(n), ' / ');
end
local function has(text, want)
    return text:find(want, 1, true) ~= nil;
end

-- Physical ---------------------------------------------------------------------------------------

s.printout.parts.evade.on = true;
s.printout.parts.crit.on = true;

-- Fixture Goblin at 39 swings with accuracy 154 against your evasion 250, so 75 - 48 = 27% to hit.
local line = readout(1, 39, 0);
check('evade without Signet', has(line, 'Evade: 73%  Crit'), line);
p.buffs = { 253 };
line = readout(1, 39, 0);
check('Signet counts evasion 25% higher on an easy prey', has(line, 'Evade: 80% with Signet'), line);
line = readout(1, 39, 5);
check('no Signet on a tough monster', has(line, 'Evade: 73%  Crit'), line);
line = readout(400, 0, nil, 249);
check('no Signet on a notorious monster', not has(line, 'Signet'), line);
line = readout(77, 39, 0);
check('Signet with the typical values too', has(line, 'with Signet'), line);
MOCK.zone_in(220);
line = readout(77, 39, 0);
check('no Signet on the ferry', not has(line, 'Signet'), line);
MOCK.zone_in(50);
line = readout(77, 39, 0);
check('no Signet in Aht Urhgan', not has(line, 'Signet'), line);
MOCK.zone_in(900);
p.buffs = {};

-- DEX 70 against AGI 41 is 29 over, +3%. Gear DEX 10 makes it 39 over, +4%.
line = readout(1, 39, 0);
check('crit from your DEX', has(line, 'Crit: 8%'), line);
p.stat_mods[1] = 10;
line = readout(1, 39, 0);
check('crit counts gear DEX', has(line, 'Crit: 9%'), line);
p.stat_mods[1] = nil;
s.printout.parts.evade.on = false;
s.printout.parts.crit.on = false;

-- Magic ------------------------------------------------------------------------------------------

s.printout.parts.magic.on = true;
local schools = s.magic.schools;

-- Elemental magic with skill 100 and INT 90 against INT 46 (+23.5) is 123. Ice is its weakest
-- element at rank -2, with magic evasion (111 + 25) x 0.96019 = 130, so x = 18 and 68%.
p.skills[36] = 100;
schools.elemental.on = true;
line = readout(1, 39, 0);
check('elemental on its weakest element', has(line, 'Magic: Elemental 68% (Ice)'), line);
p.skills[36] = 0;
line = readout(1, 39, 0);
check('no skill, no school', not has(line, 'Elemental'), line);
p.skills[36] = 100;
p.equipment[0] = 17547;
line = readout(1, 39, 0);
check('an Ice Staff adds 20', has(line, 'Elemental 88% (Ice)'), line);
p.equipment[0] = 17545;
line = readout(1, 39, 0);
check('a Fire Staff takes 20 off ice', has(line, 'Elemental 49% (Ice)'), line);
p.equipment[0] = nil;
p.stat_mods[4] = 10;
line = readout(1, 39, 0);
check('gear INT counts', has(line, 'Elemental 71% (Ice)'), line);
p.stat_mods[4] = nil;
s.magic.extra_accuracy = 10;
line = readout(1, 39, 0);
check('extra magic accuracy counts', has(line, 'Elemental 78% (Ice)'), line);
s.magic.extra_accuracy = 0;
p.buffs = { 79 };
line = readout(1, 39, 0);
check('Elemental Seal', has(line, 'Elemental 95% (Ice)'), line);
p.buffs = {};

-- A range of levels gives a range. At the top of it the monster is two levels over you.
p.main_level = 38;
line = readout(1, 0, nil, 249);
check('a range of levels', has(line, '(Lv 38-40)') and line:find('Elemental %d+%-%d+%% %(Ice%)') ~= nil, line);
p.main_level = 75;
schools.elemental.on = false;

-- Dark Seal adds only to dark magic, and Elemental Seal doesn't.
p.skills[37] = 60;
schools.dark.on = true;
schools.dark.spell = 'bio';
local plain = readout(1, 39, 0);
p.buffs = { 79 };
check('Elemental Seal does nothing for dark magic', readout(1, 39, 0) == plain, plain);
p.buffs = { 345 };
line = readout(1, 39, 0);
check('Dark Seal does', has(line, 'Dark 95%') and line ~= plain, line);
p.buffs = {};
schools.dark.spell = 'drain';
line = readout(400, 50, 4);
check('Drain is immune on the undead', has(line, 'Dark immune'), line);
schools.dark.on = false;

-- Healing shows only on the undead.
p.skills[33] = 200;
schools.healing.on = true;
check('no Healing on the living', not has(readout(1, 39, 0), 'Healing'));
check('Healing on the undead', has(readout(400, 50, 4), 'Healing'));
schools.healing.on = false;

-- An enfeeble the monster is immune to reads immune.
p.skills[35] = 200;
schools.enfeebling.on = true;
schools.enfeebling.spell = 'bind';
check('an immunity reads immune', has(readout(1, 39, 0), 'Enfeebling immune'));
schools.enfeebling.spell = 'sleep';
check('rank 11 reads never', has(readout(1, 39, 0), 'Enfeebling never'));
schools.enfeebling.on = false;

-- Singing with skill 80 and CHR 60 against Fixture Knight's CHR 40 (+15) is 95. At 44 its magic
-- evasion is 125, and x = -5 halves to -3, so 47% a roll and 71% to land. At 45 its sleep resist
-- trait of 10 (15%) starts, with CHR 41 and evasion 128. x = -9 halves to -5, so 45% a roll and
-- 59% to land.
p.skills[40] = 80;
schools.singing.on = true;
line = readout(30, 44, 4);
check('Lullaby at 44', has(line, 'Singing 71%'), line);
line = readout(30, 45, 4);
check('the resist trait from 45', has(line, 'Singing 59%'), line);
line = readout(30, 0, nil, 249);
check('both levels as a range', has(line, 'Singing 59-71%'), line);
p.buffs = { 52 };
line = readout(30, 44, 4);
check('Soul Voice doubles Lullaby', has(line, 'Singing 99%'), line);
schools.singing.spell = 'elegy';
check('but not Elegy', not has(readout(30, 44, 4), 'Singing 99%'));
schools.singing.spell = 'lullaby';
p.buffs = {};
p.skills[42] = 100;
p.equipment[2] = 17352;
MOCK.items[17352] = { Name = { 'Horn' }, Skill = 42 };
line = readout(30, 44, 4);
check('a wind instrument adds half your wind skill', has(line, 'Singing 99%'), line);
MOCK.items[17352] = { Name = { 'Harp' }, Skill = 41 };
line = readout(30, 44, 4);
check('a string instrument doesn\'t', has(line, 'Singing 71%'), line);
schools.singing.on = false;
s.printout.parts.magic.on = false;

-- Drops ------------------------------------------------------------------------------------------

s.printout.parts.drops.on = true;
MOCK.items[4104] = { Name = { 'Fire Crystal' } };
MOCK.items[4105] = { Name = { 'Ice Crystal' } };
line = readout(1, 39, 0);
check('drops at TH 0', has(line, 'Drops (TH 0): Ice Crystal 100%, Fire Crystal 16%'), line);
s.drops.th = 2;
line = readout(1, 39, 0);
check('drops at TH 2', has(line, 'Drops (TH 2): Ice Crystal 100%, Fire Crystal 41%'), line);
s.drops.max_items = 1;
line = readout(1, 39, 0);
check('most items shown', has(line, 'Ice Crystal 100%  +1 more'), line);
s.drops.max_items = 5;
s.drops.min_chance = 50;
line = readout(1, 39, 0);
check('hide items under a chance', has(line, 'Drops (TH 2): Ice Crystal 100%') and not has(line, 'Fire'), line);
s.drops.min_chance = 0;
s.drops.sort = 'name';
line = readout(1, 39, 0);
check('sort by name', has(line, 'Fire Crystal 41%, Ice Crystal 100%'), line);
line = readout(400, 50, 4);
check('scripted drops note with nothing else', has(line, 'Drops (TH 2): (plus scripted drops)'), line);

return MOCK.report();
