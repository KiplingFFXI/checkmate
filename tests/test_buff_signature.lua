local player = require('core.player');
MOCK.player.buffs = { 56, 40, 56, 255, 0 };
local attack_origin = player.pdif_inputs();
local parameter_origin = player.parameter_inputs();
check('active buff lookup retains both distinct effects', attack_origin.buffs[56] and attack_origin.buffs[40]);
check('empty buff IDs stay outside the lookup', not attack_origin.buffs[0] and not attack_origin.buffs[255]);

-- Slot order and empty slots do not change which buffs are active.
MOCK.player.buffs = { [2] = 56, [4] = 0, [5] = 40, [7] = 56, [8] = 255 };
expect('attack signature ignores slot order and empty slots', player.pdif_inputs().signature, attack_origin.signature);
expect('parameter signature ignores slot order and empty slots', player.parameter_inputs().signature, parameter_origin.signature);
local attack = player.accept_attacks(attack_origin, 400, 350, 450, 10);
local parameters = player.accept_parameters(parameter_origin, {
    accuracy = 160, evasion = 130, offhand_accuracy = 150, ranged_accuracy = 170,
}, 10);
check('a reordered pending attack reply is accepted', attack ~= nil and attack.attack == 400);
check('a reordered pending parameter reply is accepted', parameters ~= nil and parameters.accuracy == 160);
MOCK.player.buffs = { 40, 56, 56 };
check('accepted attack remains valid after another reorder', player.pdif_valid(attack));
check('accepted parameters remain valid after another reorder', player.parameters_valid(parameters));
expect('reordering preserves the cached attack reading', player.pdif_inputs().attack, 400);

-- Two copies can represent distinct active effects, so losing one still matters.
MOCK.player.buffs = { 40, 56 };
check('losing a duplicate changes the attack signature', player.pdif_inputs().signature ~= attack_origin.signature);
check('losing a duplicate invalidates accepted attack', not player.pdif_valid(attack));
check('losing a duplicate invalidates accepted parameters', not player.parameters_valid(parameters));
expect('losing a duplicate clears the usable attack cache', player.pdif_inputs().attack, nil);
expect('losing a duplicate rejects a pending attack reply', player.accept_attacks(attack_origin, 400, nil, nil, 11), nil);
expect('losing a duplicate rejects a pending parameter reply', player.accept_parameters(parameter_origin, { accuracy = 160 }, 11), nil);

MOCK.player.buffs = { 56, 40, 56 };
attack_origin, parameter_origin = player.pdif_inputs(), player.parameter_inputs();
MOCK.player.buffs = { 56, 40, 56, 56 };
check('gaining a duplicate changes the signature', player.pdif_inputs().signature ~= attack_origin.signature);
expect('gaining a duplicate rejects pending parameter values', player.accept_parameters(parameter_origin, { accuracy = 160 }, 12), nil);
MOCK.player.buffs = { 56, 40, 57 };
expect('a different active buff still rejects pending attack', player.accept_attacks(attack_origin, 400, nil, nil, 12), nil);

MOCK.player.buffs = {};
local empty = player.pdif_inputs().signature;
MOCK.player.buffs = { 255, 0, 255, 0 };
expect('empty representations produce the same signature', player.pdif_inputs().signature, empty);
expect('reading and accepting snapshots sends no commands', #MOCK.commands, 0);
return MOCK.report();
