local learning = require('core.blue_learning');
local data = require('data.modifiers');
local merits = require('core.merits');

MOCK.player.main_job, MOCK.player.main_level = 16, 75;
MOCK.player.equipment = {};
local commands, reads, saves = #MOCK.commands, MOCK.reads, MOCK.saved;
local value = learning.read();
expect('base learning roll is source33', value.base, 33);
expect('no equipment has no learning bonus', value.gear_bonus, 0);
expect('an eligible unmodified roll is33percent', value.chance, 33);
expect('read uses only a job and equipment snapshot', MOCK.reads - reads, 2);
expect('the snapshot has its own observation time', value.observed_at, MOCK.now);
check('Blue Mage main is distinguished from the remaining gates', value.main_job_ok and value.eligible == nil);

MOCK.player.equipment[6] = 14928;
value = learning.read();
expect('Magus Bazubands add10 percentage points', value.chance, 43);
expect('the direct bonus is reported separately', value.gear_bonus, 10);
check('current gear is named in the input list', #value.items == 1 and value.items[1].id == 14928
    and value.items[1].bonus == 10);
MOCK.player.main_level = 55;
expect('sync below the glove level suppresses its bonus', learning.read().chance, 33);
MOCK.player.main_level = 56;
expect('the glove bonus starts at its source level', learning.read().chance, 43);
MOCK.player.equipment[6], MOCK.player.main_level = 15024, 74;
expect('Magus Bazubands plus1 add11 percentage points', learning.read().chance, 44);
MOCK.player.main_level = 73;
expect('plus1 bonus is suppressed below74', learning.read().chance, 33);
MOCK.player.main_level = 75;
merits.configure({ merits = { fill_in = false, blue_magic_skill = 8, magical_accuracy = 5 } }, 'learning tests');
MOCK.player.skills[43] = 1;
expect('manual merits and actual skill do not alter the conditional roll', learning.read().chance, 44);
MOCK.player.main_job = 1;
value = learning.read();
check('a different main job cannot imply current eligibility', not value.main_job_ok and value.chance == 44);
check('the notes retain remaining learning gates', table.concat(value.notes, ' '):find('credit for the kill', 1, true));

MOCK.player.main_job, MOCK.player.equipment = 16, {};
expect('taking the gloves off does not leave a cached bonus', learning.read().chance, 33);
for _, id in ipairs({ 23189, 23524, 27958, 27979 }) do
    check('modern learning gear is excluded: ' .. id, not data.items[id] or not data.items[id].blue_learning);
end
MOCK.player.main_level = 99;
value = learning.read();
check('an unsupported level is unknown rather than a false exact rate', value.chance == nil and value.reason ~= nil);
MOCK.player.main_level, MOCK.player.main_job = 75, 0;
check('unreadable current job does not manufacture a chance', learning.read().chance == nil);

MOCK.player.main_job, MOCK.player.equipment[6] = 16, 14928;
local old = data.items[14928].blue_learning;
data.items[14928].blue_learning = 200;
expect('source bonuses cannot produce more than100percent', learning.read().chance, 100);
data.items[14928].blue_learning = -100;
expect('negative bonuses cannot produce less than0percent', learning.read().chance, 0);
data.items[14928].blue_learning = old;
data.items[14928].conditional_blue_learning = true;
value = learning.read();
check('conditional gear is qualified without guessing its power', value.uncertain and value.chance == 43
    and table.concat(value.notes, ' '):find('conditional learning bonus', 1, true));
data.items[14928].conditional_blue_learning = nil;

local memory = AshitaCore:GetMemoryManager();
local original = memory.GetInventory;
memory.GetInventory = function ()
    return { GetEquippedItem = function () return { Index = 10 }; end,
        GetContainerItem = function () return nil; end };
end;
value = learning.read();
check('missing equipped item data stays unknown', value.chance == nil and value.reason ~= nil);
memory.GetInventory = original;
expect('reading sends no game commands', #MOCK.commands, commands);
expect('reading saves no settings', MOCK.saved, saves);

return MOCK.report();
