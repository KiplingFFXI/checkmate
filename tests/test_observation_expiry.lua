-- Leaving sight clears observations without guessing whether the monster died.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local target = require('core.target');
local monsters = require('core.monsters');
local pet = require('core.pet');
local packets = require('core.packets');
local s = MOCK.settings.current;
MOCK.player.zone, MOCK.player.main_level = 900, 40;
MOCK.zone_in(900);
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.replace_game_line = false;
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.overlay.parts.name = true;
MOCK.command('/checkmate overlay on');
MOCK.target_monster(1, 'Fixture Goblin');
local id = MOCK.mob_id(900, 1);
local row = monsters.find(900, id, 'Fixture Goblin');
local function checked(index, level)
    MOCK.packet(MOCK.check_packet(index, level, 4, 174));
    MOCK.frame();
end
local function leave(server_id, index)
    MOCK.packet(MOCK.entity_packet(server_id, 0x30, index));
    MOCK.frame();
end
checked(1, 39);
expect('the initial exact observation came from check', target.current().provenance.level_source, 'check');
MOCK.packet(MOCK.entity_packet(id, 0x0F));
MOCK.frame();
expect('ordinary updates preserve a check', target.current().low, 39);
checked(2, 40);
MOCK.packet(MOCK.widescan_packet(1, 39));
MOCK.frame();
leave(id);
MOCK.target.slot0, MOCK.entities[1] = 0, nil;
MOCK.frame();
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.frame();
local result = target.current();
check('same ID and name returning uses its source range', result.low == 38 and result.high == 40
    and result.provenance.level_source == 'spawn');
check('returning target has no old check reading or timestamp', result.con == nil and result.reading == nil
    and result.provenance.checked_at == nil and result.provenance.observed_at == nil);
local low, high = monsters.level(row, 0, 1);
check('the chat widescan cache also falls back to the source range', low == 38 and high == 40);
low, high = monsters.pet_level(row, 1);
check('charming the returning monster cannot reuse its old checked level', low == 38 and high == 40);
MOCK.target_monster(2, 'Fixture Goblin');
MOCK.frame();
expect('another monster retains its own observation', target.current().low, 40);
MOCK.target_monster(1, 'Fixture Goblin');
checked(1, 38);
expect('a fresh check can establish certainty again', target.current().low, 38);

MOCK.player.main_job = 14;
s.overlay.parts.pet, s.printout.parts.pet.on = true, true;
MOCK.summon('Azure');
checked(1, 39);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.frame();
expect('pet parameters are initially observed', target.current().pet.parameter_state, 'checked');
leave(id);
expect('enemy disappearance clears its pet comparison snapshot', target.current().pet.parameter_state, 'unknown');
checked(1, 39);
MOCK.wait(1.6);
leave(id);
MOCK.pet_reply(150, 140);
MOCK.frame();
check('a late pet reply cannot restore a disappeared enemy snapshot', target.current().pet.parameter_state == 'unknown'
    and target.current().pet.observed_at == nil);
checked(1, 39);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.frame();
local own = pet.find(id);
expect('a fresh request can observe pet parameters again', target.current().pet.parameter_state, 'checked');
local parsed_id, parsed_index = packets.despawned(MOCK.entity_packet(own.id, 0x30, own.index));
check('dynamic pets use the packet index, not their offset ID bits', parsed_id == own.id and parsed_index == own.index
    and parsed_index ~= own.id % 0x1000);
leave(own.id, own.index);
MOCK.wait(0.3);
check('same-ID pet disappearance clears parameters and summon certainty', target.current().pet.parameter_state == 'unknown'
    and pet.find(id).generation ~= own.generation and pet.find(id).summon_known == false);
pet.on_sync(own.index);
check('an ordinary same-index pet update cannot restore lost summon knowledge', pet.find(id).summon_known == false);
checked(1, 39);
MOCK.wait(1.6);
leave(own.id, own.index);
MOCK.pet_reply(150, 140);
MOCK.frame();
check('a late reply for a disappeared same-ID pet cannot restore checked parameters',
    target.current().pet.parameter_state == 'unknown' and target.current().pet.observed_at == nil);
MOCK.dismiss();
MOCK.summon('Azure');
check('an explicit dismissal and summon establishes fresh summon knowledge', pet.find(id).summon_known == true);
local sent = #MOCK.commands;
MOCK.wait(3);
expect('observation expiry sends no refresh requests', #MOCK.commands, sent);

MOCK.command('/checkmate overlay off');
monsters.on_check(1, 39);
monsters.on_widescan(1, 39);
leave(id);
low, high = monsters.pet_level(row, 1);
check('chat and charm observations expire while the overlay is off', low == 38 and high == 40);
return MOCK.report();
