local effects = require('core.effects');
local data = require('data.effects');
local me, other = MOCK.player.server_id, 2001;
local mob, second = MOCK.mob_id(103, 17), MOCK.mob_id(103, 18);
local pet = MOCK.pet_id(0x700);

local function reset()
    effects.forget(true);
    MOCK.now = 100;
    MOCK.entities = {};
    MOCK.player.pet_index, MOCK.player.main_job, MOCK.player.main_level = 0, 2, 75;
    MOCK.player.buffs = {};
end

local function action(category, id, message, param, actor, target, added, reaction)
    effects.on_action(MOCK.action_packet(actor or me, category, id, target or mob,
        { { message = message, param = param, added = added, reaction = reaction } }), me);
end

local function entry(status, target)
    effects.take_in(MOCK.now);
    for _, each in ipairs(effects.readout(target or mob, 'both', MOCK.now) or {}) do
        if (each.effect == status) then return each; end
    end
end

local function value(status, key, target)
    local each = entry(status, target);
    return each and each[key];
end

reset();
MOCK.entities[0x700] = { ServerId = pet, SpawnFlags = 0 };
MOCK.entities[0x420] = { ServerId = other, PetTargetIndex = 0x700, SpawnFlags = 1 };
action(11, 2067, 185, 20, pet);
expect('visible foreign automaton gets its own Knockout estimate', value(148, 'inferred'), true);
expect('foreign automaton uses its own duration', value(148, 'ends'), 130);
local reads = MOCK.entity_reads;
action(11, 2067, 185, 20, pet, second);
check('a verified pet owner avoids another whole player scan', MOCK.entity_reads - reads < 8);
check('foreign pet effects retain the actual pet actor', value(148, 'from', second) == pet);
effects.on_message(me, second, 148, 206, me);
MOCK.entities[0x420].PetTargetIndex = 0;
action(11, 2067, 185, 20, pet, second);
expect('changed owner link cannot authorize another pet estimate', entry(148, second), nil);
MOCK.entities[0x420].PetTargetIndex = 0x700;
MOCK.entities[0x700].ServerId = pet + 1;
action(11, 2067, 185, 20, pet, second);
expect('stale entity index cannot authorize another pet estimate', entry(148, second), nil);

reset();
local charmed = MOCK.mob_id(103, 50);
MOCK.entities[50] = { ServerId = charmed, SpawnFlags = 0x10 };
MOCK.entities[0x420] = { ServerId = other, PetTargetIndex = 50, SpawnFlags = 1 };
action(11, 369, 185, 20, charmed);
expect('a verified charmed monster uses its normal callback estimate', value(6, 'inferred'), true);
expect('charmed Brain Crush duration comes from its monster handler', value(6, 'ends'), 130);
reset();
MOCK.entities[0x700] = { ServerId = pet, SpawnFlags = 0x10 };
action(11, 2067, 185, 20, pet);
expect('dynamic enemy is not mistaken for an automaton', entry(148), nil);
effects.on_entity(MOCK.entity_packet(pet, 0x04, 0x700, false));
local known_reads = MOCK.entity_reads;
for _ = 1, 10 do action(11, 2067, 185, 20, pet); end
check('known nonpet entity updates avoid repeated player scans', MOCK.entity_reads - known_reads <= 10);
effects.on_entity(MOCK.entity_packet(pet, 0x04, 0x700, true));
action(11, 2067, 185, 20, pet);
expect('a native player-master flag identifies a foreign pet without its visible owner', value(148, 'inferred'), true);
effects.on_entity(MOCK.entity_packet(pet, 0x20, 0x700));
action(11, 2067, 185, 20, pet, second);
expect('despawn clears the native pet ownership hint', entry(148, second), nil);

reset();
MOCK.player.pet_index = 0x700;
MOCK.entities[0x700] = { ServerId = pet, SpawnFlags = 0 };
action(11, 1944, 185, 0, pet);
expect('own automaton Bash can attempt Stun at zero damage', value(10, 'inferred'), true);
expect('known absent Earth Maneuver suppresses own Hammermill Slow', entry(13), nil);
MOCK.player.buffs = { 303 };
action(11, 1944, 185, 0, pet);
expect('own Earth Maneuver permits a qualified Hammermill estimate', value(13, 'inferred'), true);
check('Hammermill remains conditional on the unknown attachment', value(13, 'condition'):find('Hammermill', 1, true) ~= nil);

reset();
action(13, 530, 144, 0, pet);
expect('Lunar Cry can estimate Accuracy Down without damage', value(146, 'inferred'), true);
expect('Lunar Cry can estimate Evasion Down independently', value(148, 'inferred'), true);
check('Lunar Cry keeps any source condition', type(value(146, 'condition')) == 'string');
reset();
action(13, 530, 75, 0, pet);
expect('resisted Lunar Cry does not infer either effect', effects.has(mob), false);
action(13, 530, 236, 146, pet);
expect('a named Lunar Cry status is confirmed', value(146, 'inferred'), false);
expect('a single named success does not invent the other status', entry(148), nil);

reset();
action(5, 5261, 0, 0);
expect('completed Psychoanima can estimate Intimidate', value(22, 'inferred'), true);
reset();
action(9, 5261, 28, 0);
expect('starting an item does not estimate its effect', entry(22), nil);
action(5, 5261, 75, 0);
expect('failed item result does not estimate its effect', entry(22), nil);
action(5, 5261, 375, 22);
expect('explicit item status is confirmed', value(22, 'inferred'), false);
action(4, 43, 230, 40, mob);
action(6, 65, 453, 40);
expect('Aura Steal removes the named monster buff', entry(40), nil);
action(13, 749, 186, 144, pet);
expect('generic gains-effect message still identifies source-known HP Down as a debuff', value(144, 'debuff'), true);
expect('the reported HP Down remains confirmed', value(144, 'inferred'), false);
check('HP Down appears with the debuffs-only filter', #(effects.readout(mob, 'debuffs', MOCK.now) or {}) > 0);

reset();
effects.observe_merits(MOCK.merit_packet({ { 0x0846, 0 } }));
action(3, 82, 110, 0);
expect('known zero Penance ranks suppress its estimate', entry(168), nil);
effects.forget();
action(3, 82, 110, 0);
expect('turning the display off preserves known zero Penance ranks', entry(168), nil);
effects.observe_merits(MOCK.merit_packet({ { 0x0846, 2 } }));
action(3, 82, 110, 0);
expect('zero-damage Chi Blast can attempt Penance', value(168, 'inferred'), true);
expect('own Penance duration uses actual observed ranks', value(168, 'ends'), 140);
check('Penance estimate explains its condition', type(value(168, 'condition')) == 'string');
reset();
effects.observe_merits(MOCK.merit_packet({ { 0x0846, 2 } }));
MOCK.player.main_level = 74;
action(3, 82, 110, 5);
expect('Penance is unavailable below its job merit level', entry(168), nil);
MOCK.player.main_level, MOCK.player.main_job = 75, 1;
action(3, 82, 110, 5);
expect('Penance does not use subjob or another main job merits', entry(168), nil);
reset();
action(3, 82, 110, 5, other);
expect('unseen foreign Penance ranks remain a qualified estimate', value(168, 'inferred'), true);
check('foreign Penance includes its unknown condition', type(value(168, 'condition')) == 'string');
action(3, 82, 127, 168, other);
expect('explicit Penance success clears the inference condition', value(168, 'condition'), nil);
reset();
MOCK.player.main_job = 1;
effects.observe_merits(MOCK.merit_packet({ { 0x0802, 2 } }));
effects.observe_merits(MOCK.merit_packet({ { 0x0846, 0 } }));
action(6, 150, 100, 0);
expect('Tomahawk duration uses its own rank from a partial packet', value(805, 'ends'), 145);
expect('Tomahawk uses its Phoenix name', effects.game_name(805), 'Tomahawk');
expect('Tomahawk does not use an unrelated client icon', effects.has_icon(805), false);
expect('Hysteria does not use an unrelated client icon', effects.has_icon(804), false);
expect('server-only status description comes from Phoenix metadata', effects.description(804), data.effects[804].description);
effects.on_zone();
action(6, 150, 100, 0, nil, second);
expect('zoning clears actual merit ranks instead of reusing a prior character', value(805, 'basis', second), 'merit_unknown');

reset();
action(3, 66, 317, 0);
expect('own Jump without Spirit Surge cannot infer Defense Down', entry(149), nil);
MOCK.player.buffs = { 126 };
action(3, 66, 317, 0);
expect('successful zero-damage Jump with Spirit Surge can estimate Defense Down', value(149, 'inferred'), true);
reset();
action(3, 66, 324, 0, other);
expect('Jump miss cannot create a conditional estimate', entry(149), nil);
action(3, 66, 317, 0, other);
expect('foreign Jump retains its unknown Spirit Surge condition', value(149, 'inferred'), true);

reset();
action(6, 156, 100, 0, other, other);
expect('observed foreign Feint does not add a status to a player', effects.has(other), false);
action(1, 0, 15, 0, other);
expect('a miss does not consume or apply observed Feint', entry(148), nil);
action(1, 0, 1, 0, other);
expect('a connected zero-damage swing can attempt Feint', value(148, 'inferred'), true);
expect('Feint target duration is distinct from its arm duration', value(148, 'ends'), 130);
action(1, 0, 1, 10, other, second);
expect('observed Feint is consumed only once', entry(148, second), nil);
reset();
action(6, 156, 100, 0, other, other);
action(3, 80, 185, 20, other);
MOCK.now = 101;
action(1, 0, 1, 5, other, second);
expect('a weapon skill does not consume an armed Feint', value(148, 'ends', second), 131);
reset();
action(6, 156, 100, 0, other, other);
MOCK.now = 161;
action(1, 0, 1, 10, other);
expect('unconsumed foreign Feint arm expires', entry(148), nil);
reset();
MOCK.player.buffs = { 343 };
action(1, 0, 1, 1);
expect('own current buff can establish Feint without seeing its use', value(148, 'inferred'), true);
action(1, 0, 1, 1, nil, second);
expect('stale own buff memory cannot rearm consumed Feint', entry(148, second), nil);
reset();
action(6, 156, 100, 0, other, other);
effects.on_message(other, other, 0, 6, me);
action(1, 0, 1, 1, other);
expect('actor death clears an observed Feint arm', entry(148), nil);
reset();
action(6, 156, 100, 0, me, me);
effects.on_message(me, me, 343, 206, me);
action(1, 0, 1, 0);
expect('Feint consumption wear-off before the action keeps a short inference window', value(148, 'inferred'), true);
effects.on_message(me, me, 343, 206, me);
action(1, 0, 1, 5, nil, second);
expect('a duplicate consumption message cannot rearm Feint', entry(148, second), nil);
reset();
effects.on_message(me, me, 343, 206, me);
MOCK.now = 101;
action(1, 0, 1, 5);
expect('an expired or dispelled Feint cannot arm later attacks', entry(148), nil);

for _, spec in ipairs({ { 2, 4, 30 }, { 4, 9, 180 }, { 5, 10, 3 } }) do
    for _, reaction_message in ipairs({ 44, 132, 383 }) do
        reset();
        action(1, 0, 1, 25, mob, me, nil, { kind = spec[1], message = reaction_message, param = 0 });
        expect('spike kind ' .. spec[1] .. ' message ' .. reaction_message .. ' can estimate its status',
            value(spec[2], 'inferred'), true);
        expect('spike kind ' .. spec[1] .. ' uses its own timer', value(spec[2], 'ends'), 100 + spec[3]);
        expect('spike applier is the defender', value(spec[2], 'from'), me);
    end
end
reset();
action(1, 0, 1, 25, mob, me, nil, { kind = 4, message = 374, param = 9 });
expect('Curse spikes status message remains an estimate of a hidden attempt', value(9, 'inferred'), true);
reset();
action(1, 0, 1, 25, mob, me, nil, { kind = 63, message = 44, param = 25 });
expect('Counter is never treated as status spikes', effects.has(mob), false);
for _, spec in ipairs({ { 44, 1, false }, { 132, 1, false }, { 44, 0, true }, { 383, 20, true } }) do
    reset();
    action(4, 253, 236, 2);
    action(1, 0, 1, 25, mob, me, nil, { kind = 2, message = spec[1], param = spec[2] });
    expect('reaction damage only wakes Sleep for positive damage or drain ' .. spec[1] .. '/' .. spec[2],
        entry(2) ~= nil, spec[3]);
end

for _, message in ipairs({ 161, 187, 227, 274, 281, 379, 747 }) do
    reset();
    action(4, 253, 236, 2);
    action(4, 0, message, 10, other);
    expect('positive HP damage or drain ' .. message .. ' wakes Sleep', entry(2), nil);
end
for _, message in ipairs({ 162, 165, 225, 226, 228 }) do
    reset();
    action(4, 253, 236, 2);
    action(4, 0, message, 10, other);
    check('MP or TP drain ' .. message .. ' does not wake Sleep', entry(2) ~= nil);
end
reset();
action(4, 253, 236, 2);
action(1, 0, 1, 0, other, nil, { message = 161, param = 10 });
expect('positive added HP drain wakes even with zero primary damage', entry(2), nil);

reset();
local reads, entity_reads, commands = MOCK.reads, MOCK.entity_reads, #MOCK.commands;
for _ = 1, 10000 do effects.take_in(MOCK.now); end
expect('additional source tracking adds no idle memory reads', MOCK.reads, reads);
expect('additional source tracking adds no idle entity scans', MOCK.entity_reads, entity_reads);
expect('additional source tracking sends no commands', #MOCK.commands, commands);

return MOCK.report();
