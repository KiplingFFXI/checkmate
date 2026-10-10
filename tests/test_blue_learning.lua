-- Learned filtering must keep unreadable spellbook entries and incomplete move lists honest.
local info = require('core.info');
local player = require('core.player');
MOCK.player.main_job, MOCK.player.skills[43], MOCK.player.hp = 16, 25, 100;
MOCK.target_monster(7, 'Fixture');
MOCK.entities[7].Distance = 400;
local observed = player.blue_learning(7);
expect('the client reader keeps Blue skill', observed.skill, 25);
expect('the client reader keeps main job', observed.job, 16);
expect('the client reader distinguishes alive', observed.alive, true);
expect('the client reader converts squared distance', observed.distance, 20);
MOCK.player.hp = 0;
expect('zero HP is KO rather than missing data', player.blue_learning(7).alive, false);
MOCK.zoning = true;
expect('zoning has no assumed job', player.blue_learning(7).job, nil);
MOCK.zoning = false;
local learned = { [577] = true, [578] = false };
player.knows_spell = function (id) return learned[id]; end;
local reads = 0;
player.blue_learning = function (index)
    reads = reads + 1;
    expect('requirements use the selected monster', index, 7);
    return { job = 16, skill = 10, alive = true, distance = 20 };
end;
local entry = { spells = {
    { id = 577, name = 'Foot Kick', level = 1, min_skill = 0 },
    { id = 578, name = 'Dust Cloud', level = 18, min_skill = 25 },
    { id = 579, name = 'Power Attack', level = 4, min_skill = 0 },
} };
local settings = { blue_options = { only_unlearned = true, requirements = true } };
local function read()
    return info.readout({ info = { blue = entry } }, 10, 10, settings, 7).sections[1];
end
local out = read();
expect('only confirmed learned spells are filtered', out.value, 'Dust Cloud (not learned), Power Attack (spellbook unknown)');
expect('requirements read client inputs once for the list', reads, 1);
local notes = table.concat(out.notes, ' ');
check('the actual minimum skill and shortfall are stated', notes:find('Dust Cloud needs Blue Magic skill 25. Your skill at this reading: 10 (too low).', 1, true));
check('known main job and range are described as a reading', notes:find('At this reading: main-job BLU, alive, 20.0 yalms away (within 100).', 1, true));
check('unseen learning conditions remain requirements', notes:find('Call for Help prevents learning', 1, true));
check('spell level is not mistaken for a learning level requirement', not notes:find('level 18', 1, true));
settings.blue_options.requirements = false;
entry.requirements = { 'Detailed source learning conditions.' };
out = read();
expect('turning requirements off avoids extra client reads', reads, 1);
check('requirements off also hides source learning conditions', not table.concat(out.notes, ' '):find('Detailed source learning conditions.', 1, true));
check('requirements off keeps the basic possible lesson warning', table.concat(out.notes, ' '):find('The monster must use the move', 1, true));
learned[578], learned[579] = true, true;
expect('a completed list says why there are no names left', read().value, 'All listed spells learned');
entry.incomplete = true;
expect('a completed partial list does not claim there are no other lessons', read().value, 'All listed spells learned; other lessons unknown');
settings.blue_options.only_unlearned = false;
check('turning the filter off brings learned spells back', read().value:find('Foot Kick (known)', 1, true));
settings.blue_options.requirements = true;
player.blue_learning = function () return {}; end;
out = read();
notes = table.concat(out.notes, ' ');
check('requirements on includes the source learning conditions', notes:find('Detailed source learning conditions.', 1, true));
check('unreadable inputs stay unknown', notes:find('main job unknown, HP unknown, distance unknown', 1, true)
    and notes:find('Your skill is unknown.', 1, true));
player.blue_learning = function () return { job = 4, skill = 25, alive = false, distance = 101 }; end;
notes = table.concat(read().notes, ' ');
check('known unmet conditions are clear', notes:find('main job is not BLU, KO, 101.0 yalms away (too far)', 1, true));
check('the exact skill boundary counts as enough', notes:find('Your skill at this reading: 25 (enough)', 1, true));
return MOCK.report();
