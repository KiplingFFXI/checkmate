-- Damage does not prove Bind ended, and failed ownership lookups stay cheap.
local effects = require('core.effects');
local tips = require('ui.tips');
local defaults = require('ui.defaults');
local me, other = MOCK.player.server_id, 2001;
local mob, actor = MOCK.mob_id(103, 17), MOCK.mob_id(103, 50);

local function reset()
    effects.forget(true);
    MOCK.now, MOCK.entities, MOCK.player.pet_index = 100, {}, 0;
end

local function action(category, ability, message, param, source)
    effects.on_action(MOCK.action_packet(source or me, category, ability, mob,
        { { message = message, param = param } }), me);
end

local function entry(status)
    effects.take_in(MOCK.now);
    for _, each in ipairs(effects.readout(mob, 'both', MOCK.now) or {}) do
        if (each.effect == status) then return each; end
    end
end

local function player_update(index)
    local data = string.rep('\0', 0x3C) .. string.char(index % 256, math.floor(index / 256)) .. '\0\0';
    return { id = 0x00D, size = #data, data = data };
end

reset();
action(4, 258, 236, 11);
local first = entry(11);
check('a confirmed Bind starts without damage uncertainty', first ~= nil and not first.damage_uncertain and not first.inferred);
local ends = first.ends;
action(1, 0, 1, 1);
local damaged = entry(11);
check('a positive hit keeps the original Bind observation', damaged ~= nil and damaged.damage_uncertain and not damaged.inferred);
expect('damage does not refresh the Bind timer', damaged.ends, ends);
local hover = tips.text(defaults.make(), { effects = { damaged } }, 'effect', '11');
check('Bind hover explains the unobserved break', hover:find('Damage may have broken Bind. No wear-off has been observed.', 1, true));
check('Bind remains free of question marks', not hover:find('?', 1, true));
local version = effects.version(mob);
for _ = 1, 10 do action(1, 0, 1, 1); effects.take_in(MOCK.now); end
expect('more damage does not rebuild an already uncertain Bind', effects.version(mob), version);
expect('repeated damage does not extend expiry', entry(11).ends, ends);
effects.on_message(me, mob, 11, 206, me);
expect('an observed wear-off clears uncertain Bind', entry(11), nil);
action(4, 258, 236, 11);
expect('a new confirmed Bind clears damage uncertainty', entry(11).damage_uncertain, nil);
hover = tips.text(defaults.make(), { effects = { entry(11) } }, 'effect', '11');
check('fresh Bind no longer has a break warning', not hover:find('Damage may have broken Bind.', 1, true));
action(1, 0, 1, 0);
check('zero damage does not make Bind uncertain', not entry(11).damage_uncertain);
action(1, 0, 1, 1);
MOCK.now = entry(11).ends;
effects.take_in(MOCK.now);
expect('the original estimated expiry still clears uncertain Bind', entry(11), nil);

reset();
MOCK.entities[50] = { ServerId = actor, SpawnFlags = 0x10 };
local before = MOCK.entity_reads;
for _ = 1, 10 do action(11, 369, 185, 20, actor); end
check('ten unowned skills require only one full player scan', MOCK.entity_reads - before < 800);
MOCK.entities[0x420] = { ServerId = other, PetTargetIndex = 50, SpawnFlags = 1 };
before = MOCK.entity_reads;
effects.on_player_update(player_update(51));
effects.on_ownership_change(51);
action(11, 369, 185, 20, actor);
check('an unrelated player pet update keeps the miss cached', MOCK.entity_reads - before < 8);
expect('cached miss does not invent ownership', entry(6), nil);
local truncated = player_update(50);
truncated.data = truncated.data:sub(1, 0x3D);
effects.on_player_update(truncated);
action(11, 369, 185, 20, actor);
expect('a truncated owner packet cannot establish ownership', entry(6), nil);
effects.on_player_update(player_update(50));
action(11, 369, 185, 20, actor);
check('a changed foreign pet link is recognized on its first action', entry(6) ~= nil);

reset();
MOCK.entities[50] = { ServerId = actor, SpawnFlags = 0x10 };
action(11, 369, 185, 20, actor);
MOCK.player.pet_index = 50;
action(11, 369, 185, 20, actor);
check('your new charmed pet bypasses a cached miss immediately', entry(6) ~= nil);

reset();
MOCK.entities[50] = { ServerId = actor, SpawnFlags = 0x10 };
action(11, 369, 185, 20, actor);
MOCK.entities[0x420] = { ServerId = other, PetTargetIndex = 50, SpawnFlags = 1 };
MOCK.now = MOCK.now + 0.25;
action(11, 369, 185, 20, actor);
check('an expired miss retries ownership even without an update', entry(6) ~= nil);

reset();
MOCK.entities[50] = { ServerId = actor, SpawnFlags = 0x10 };
action(11, 369, 185, 20, actor);
effects.on_entity(MOCK.entity_packet(actor, 0x04, 50, true));
action(11, 369, 185, 20, actor);
check('native player-master flags override a cached miss', entry(6) ~= nil);
effects.on_entity(MOCK.entity_packet(actor, 0x20, 50));
effects.on_entity(MOCK.entity_packet(mob, 0x20, 17));
action(11, 369, 185, 20, actor);
expect('despawn clears both owner hints and observations', entry(6), nil);

reset();
MOCK.entities[50] = { ServerId = actor, SpawnFlags = 0x10 };
action(11, 369, 185, 20, actor);
MOCK.entities[0x420] = { ServerId = other, PetTargetIndex = 50, SpawnFlags = 1 };
effects.on_ownership_change(50);
action(11, 369, 185, 20, actor);
check('a pet sync clears pending ownership misses', entry(6) ~= nil);
local reads = MOCK.entity_reads;
for _ = 1, 100 do MOCK.now = MOCK.now + 0.01; effects.take_in(MOCK.now); end
expect('ownership caching adds no idle entity reads', MOCK.entity_reads, reads);
expect('effects fixes send no game commands', #MOCK.commands, 0);
return MOCK.report();
