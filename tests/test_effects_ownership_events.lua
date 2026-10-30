-- Ownership packets invalidate only the pet lookup they describe.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.zone_in(103);
MOCK.command('/checkmate show effects');
local effects = require('core.effects');
local me, other = MOCK.player.server_id, 2001;
local mob, actor = MOCK.mob_id(103, 17), MOCK.mob_id(103, 50);
MOCK.entities[50] = { ServerId = actor, SpawnFlags = 0x10 };

local function action()
    MOCK.packet(MOCK.action_packet(actor, 11, 369, mob, { { message = 185, param = 20 } }));
end

local function silence()
    effects.take_in(MOCK.now);
    for _, each in ipairs(effects.readout(mob, 'both', MOCK.now) or {}) do
        if (each.effect == 6) then return each; end
    end
end

local function player_update(index)
    local data = string.rep('\0', 0x3C) .. string.char(index % 256, math.floor(index / 256)) .. '\0\0';
    return { id = 0x00D, size = #data, data = data };
end

action();
expect('an unowned monster has no player-pet estimate', silence(), nil);
MOCK.entities[0x420] = { ServerId = other, PetTargetIndex = 50, SpawnFlags = 1 };
local reads = MOCK.entity_reads;
MOCK.packet(player_update(51));
action();
check('an unrelated player update does not start a new owner scan', MOCK.entity_reads - reads < 8);
expect('an unrelated player update does not establish ownership', silence(), nil);
MOCK.packet(player_update(50));
action();
check('the real player-update handler sees a new foreign pet immediately', silence() ~= nil);

effects.forget();
MOCK.entities[0x420].PetTargetIndex = 0;
action();
MOCK.entities[0x420].PetTargetIndex = 50;
local callback, last_index = effects.on_ownership_change, nil;
effects.on_ownership_change = function (index)
    last_index = index;
    return callback(index);
end;
MOCK.packet(MOCK.pet_sync_packet(51));
action();
expect('the real pet-sync handler passes its index', last_index, 51);
expect('an unrelated pet sync preserves another actor miss', silence(), nil);
MOCK.packet(MOCK.pet_sync_packet(50));
action();
check('the matching pet sync refreshes the next pet action', silence() ~= nil);
effects.on_ownership_change = callback;

MOCK.packet(MOCK.action_packet(me, 4, 258, mob, { { message = 236, param = 11 } }));
MOCK.packet(MOCK.action_packet(me, 1, 0, mob, { { message = 1, param = 1 } }));
effects.take_in(MOCK.now);
local bind;
for _, each in ipairs(effects.readout(mob, 'both', MOCK.now) or {}) do
    if (each.effect == 11) then bind = each; end
end
check('real action packets keep damaged Bind as uncertain', bind ~= nil and bind.damage_uncertain == true);
expect('ownership and Bind handlers send no game commands', #MOCK.commands, 0);
return MOCK.report();
