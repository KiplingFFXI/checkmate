-- Overlay pet numbers use a manual check's reply for this target and this pet.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local target = require('core.target');
local s = MOCK.settings.current;
MOCK.player.zone, MOCK.player.main_job, MOCK.player.main_level = 900, 14, 40;
MOCK.zone_in(900);
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.replace_game_line = false;
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.overlay.parts.name, s.overlay.parts.pet = true, true;
MOCK.command('/checkmate overlay on');
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.summon('Azure');
MOCK.wait(0.3);
local result = target.current();
check('overlay-only Pet sees the pet without requesting parameters', result and result.pet and #MOCK.commands == 0);
check('its hit and evade stay unknown without observed parameters', result.pet.hit == nil and result.pet.evade == nil
    and result.pet.parameter_state == 'unknown');
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(2);
check('a manual check with chat Pet off requests the overlay pet parameters', #MOCK.commands == 1
    and MOCK.commands[1].command == '/checkparam <pet>');
s.printout.parts.pet.on = true;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
check('the later chat check shares the single pending pet request', #MOCK.commands == 1
    and MOCK.commands[1].command == '/checkparam <pet>');
MOCK.pet_reply(150, 140);
MOCK.frame();
result = target.current();
check('the overlay reuses that checked snapshot', result.pet.hit ~= nil and result.pet.evade ~= nil
    and result.pet.parameter_state == 'checked' and result.pet.observed_at ~= nil);
local observed = result.pet.observed_at;
MOCK.wait(1);
expect('quiet overlay frames do not send refresh requests', #MOCK.commands, 1);
expect('the parameter timestamp remains the reply time', target.current().pet.observed_at, observed);
MOCK.target_monster(2, 'Fixture Goblin');
MOCK.wait(0.3);
check('another target cannot reuse those parameters', target.current().pet.parameter_state == 'unknown'
    and target.current().pet.hit == nil);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.wait(0.3);
expect('remembered matching target retains its checked parameters', target.current().pet.parameter_state, 'checked');
MOCK.dismiss();
MOCK.summon('Azure');
MOCK.frame();
check('dismiss and resummon at the same ID clears the snapshot', target.current().pet.parameter_state == 'unknown'
    and target.current().pet.hit == nil);
expect('pet lifecycle changes send no request', #MOCK.commands, 1);
MOCK.dismiss();
MOCK.frame();
expect('a dismissed pet disappears from the overlay', target.current().pet, nil);
MOCK.summon('Azure');
MOCK.wait(0.3);
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.frame();
MOCK.level_up(39);
MOCK.frame();
expect('a level change clears checked pet parameters', target.current().pet.parameter_state, 'unknown');
MOCK.zone_in(900);
MOCK.frame();
expect('zoning cannot retain checked pet parameters', target.current().pet.parameter_state, 'unknown');
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(1.6);
MOCK.dismiss();
MOCK.summon('Azure');
MOCK.pet_reply(150, 140);
MOCK.frame();
check('a late reply for a dismissed pet cannot attach to its replacement at the same ID',
    target.current().pet.parameter_state == 'unknown' and target.current().pet.hit == nil);
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(6);
check('a pet request timeout never invents a stat reply or timestamp', target.current().pet.parameter_state == 'unknown'
    and target.current().pet.observed_at == nil and target.current().pet.hit == nil);
target.on_pet_parameters(1, MOCK.mob_id(900, 1), { accuracy = 150, evasion = nil });
MOCK.frame();
check('an incomplete reply stays unknown without a fabricated observation time',
    target.current().pet.parameter_state == 'unknown' and target.current().pet.observed_at == nil);
MOCK.command('/checkmate overlay off');
local reads = MOCK.reads;
MOCK.wait(1);
expect('a disabled overlay adds no pet polling', MOCK.reads, reads);
return MOCK.report();
