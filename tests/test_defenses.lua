package.loaded['data.defenses'] = {
    shield_rates = { 55, 40, 45, 30, 50, 100 },
    shields = { [100] = { size = 1, level = 75 } },
    gear = { [200] = { level = 1, parry = 8 },
        [201] = { level = 1, conditional_parry = { low = 0, high = 20 } },
        [202] = { level = 75, parry = 12 } },
    job_ranks = { [1] = { block = 3, parry = 3 }, [2] = { block = 0, parry = 0 },
        [3] = { block = 0, parry = 3 } },
    parry_caps = { [40] = 200, [41] = 210, [100] = 425 },
    reprisal_effect = 403, issekigan_effect = 470, palisade_effect = 478,
    prevent_effects = { [2] = 'Sleep', [14] = 'Charm' },
    unknown_effects = { [535] = { parry = true, name = 'Battuta' } },
};
local defenses = require('core.defenses');
expect('equal shield skill uses the shield-size base', defenses.block_rate(200, 200, 1), 55);
expect('shield deficit follows the native slope', defenses.block_rate(100, 200, 1), 31.75);
expect('shield chance keeps fractional percentage', defenses.block_rate(199, 200, 1), 54.76);
expect('shield floor applies', defenses.block_rate(0, 500, 1), 5);
expect('shield ceiling applies', defenses.block_rate(900, 0, 1), 100);
expect('Reprisal changes skill and rate', defenses.block_rate(200, 200, 1, true), 92.96);
expect('Reprisal gear changes its multiplier', defenses.block_rate(200, 200, 1, true, 1), 100);
expect('Palisade modifier precedes Reprisal', defenses.block_rate(100, 200, 1, true, 0, 10), 67.85);
expect('parry lower branch follows native floor', defenses.parry_rate(200, 200), 8);
expect('parry branch at five skill delta', defenses.parry_rate(205, 200), 9);
expect('parry branch at six skill delta', defenses.parry_rate(206, 200), 10);
expect('parry floor applies', defenses.parry_rate(0, 500), 5);
expect('parry ceiling applies before bonuses', defenses.parry_rate(999, 0, 0, 5), 30);
expect('parry repeats the separate source skill modifier', defenses.parry_rate(200, 200, 8), 10);
expect('Issekigan is after the ordinary cap', defenses.parry_rate(999, 0, 0, 0, 25), 50);
local own = { level = 40, main_job = 1, sub_job = 0, sub_level = 0, main_id = 10,
    main_skill = 3, sub_id = 100, skills = { [30] = 200, [31] = 200 }, buffs = {},
    equipment = {}, observed_at = 42 };
local mob = { low = 40, high = 40, row = { levels = { [40] = { attack_skill = 200 } } } };
local out = defenses.readout(own, mob, 'block');
expect('equipped overlevel shield still blocks under a level cap', out.low, 55);
expect('defensive snapshot age is independent of attack replies', out.observed_at, 42);
expect('job and equipment permit the conditional roll', out.eligible, true);
expect('shield type is available to the hover', out.shield_size, 1);
expect('monster comparison skill is retained', out.attacker_skill_low, 200);
check('shield tooltip explains its conditional denominator', table.concat(out.notes, ' '):find('not total damage avoidance', 1, true));
own.buffs = { [2] = true };
out = defenses.readout(own, mob, 'block');
expect('temporary prevention does not erase the planning chance', out.low, 55);
check('current prevention is disclosed', table.concat(out.notes, ' '):find('Sleep currently prevents', 1, true));
own.buffs = {};
out = defenses.readout(own, mob, 'parry');
expect('plain unaugmented parry is not flagged for nonexistent augments', out.uncertain, nil);
check('parry requires engagement in its conditions', table.concat(out.notes, ' '):find('be engaged', 1, true));
own.equipment[4], own.equipment[5] = 200, 201;
out = defenses.readout(own, mob, 'parry');
expect('client skill plus the second direct parry modifier', out.low, 10);
expect('unresolved latent second modifier is a range', out.high, 13);
check('latent interval is qualified', out.uncertain);
own.equipment = { [4] = 202 };
out = defenses.readout(own, mob, 'parry');
expect('unmodeled overlevel gear is not assumed at full power', out.low, 8);
check('overlevel direct gear omission is explained', table.concat(out.notes, ' '):find('above your current level', 1, true));
own.equipment = {};
own.has_augments = true;
check('actual augmented gear qualifies the second modifier', defenses.readout(own, mob, 'parry').uncertain);
own.has_augments = nil;
own.buffs = { [470] = true };
out = defenses.readout(own, mob, 'parry');
expect('hidden effect power is not guessed', out.low, 8);
check('hidden effect power is explained', table.concat(out.notes, ' '):find('Issekigan', 1, true));
own.buffs = {};
own.buffs = { [535] = true };
out = defenses.readout(own, mob, 'parry');
check('additional hidden-power source effects are qualified', out.uncertain
    and table.concat(out.notes, ' '):find('Battuta', 1, true));
own.buffs = {};
own.main_job, own.sub_job, own.sub_level = 2, 3, 20;
expect('support-job rank permits parrying', defenses.readout(own, mob, 'parry').eligible, true);
own.sub_level = 0;
expect('native rank eligibility does not add a support-level gate', defenses.readout(own, mob, 'parry').eligible, true);
expect('jobs without shield skill cannot block', defenses.readout(own, mob, 'block').eligible, false);
own.main_job, own.sub_job, own.sub_level = 1, 0, 0;
own.sub_id = 0;
expect('no shield is unavailable rather than zero chance', defenses.readout(own, mob, 'block').eligible, false);
own.sub_id, own.sub_skill = 11, 2;
expect('off-hand weapon is not a shield', defenses.readout(own, mob, 'block').eligible, false);
own.sub_skill, own.sub_shield_size = nil, 3;
expect('an unknown shield stays unknown', defenses.readout(own, mob, 'block').eligible, nil);
own.sub_id, own.main_skill = 100, 1;
expect('hand-to-hand cannot parry', defenses.readout(own, mob, 'parry').eligible, false);
own.main_skill = 3;
package.loaded['data.defenses'].shields[100].size = 99;
expect('unfamiliar shield size does not silently become five percent', defenses.readout(own, mob, 'block').low, nil);
package.loaded['data.defenses'].shields[100].size = 1;
mob.high, mob.row.levels[41] = 41, { attack_skill = 210 };
out = defenses.readout(own, mob, 'block');
expect('block lower endpoint uses higher enemy skill', out.low, 52.67);
expect('block upper endpoint uses lower enemy skill', out.high, 55);
mob.row.flags = { scripted_attack_skill = true };
check('mutable attacker skill is qualified', defenses.readout(own, mob, 'block').scripted);
expect('parry uses its own universal cap, not mutable weapon skill', defenses.readout(own, mob, 'parry').scripted, nil);
mob.row.levels[41].attack_skill = nil;
expect('missing possible attacker skill makes block unknown', defenses.readout(own, mob, 'block').low, nil);
expect('known level permits parry without a source monster row', defenses.readout(own, { low = 40, high = 40 }, 'parry').low, 8);
expect('block never substitutes parry cap for unknown weapon skill', defenses.readout(own, { low = 40, high = 40 }, 'block').low, nil);
expect('missing player inputs stay unknown', defenses.readout(nil, mob, 'block').low, nil);
mob.row.no_swings, mob.row.counters = true, true;
out = defenses.readout(own, mob, 'block');
expect('no ordinary swings makes this conditional estimate unavailable', out.eligible, false);
check('counter-capable targets retain the separate-rules qualification', out.unavailable_reason:find('Counters', 1, true));
mob.row.no_swings, mob.row.tp_moves = nil, true;
out = defenses.readout(own, mob, 'parry');
expect('TP-move replacements do not inherit ordinary parry percentages', out.eligible, false);
check('TP replacements explain their separate rules', out.unavailable_reason:find('TP moves instead', 1, true));
return MOCK.report();
