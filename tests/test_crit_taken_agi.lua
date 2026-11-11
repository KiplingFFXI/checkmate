dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s, p = MOCK.settings.current, MOCK.player;
local player = require('core.player');
local target = require('core.target');
local tips = require('ui.tips');
local merits = require('core.merits');

s.printout.parts.crittaken.on, s.overlay.parts.crittaken = true, true;
MOCK.command('/checkmate overlay on');
p.main_level, p.stats[3], p.stat_mods[3] = 1, 5, -7;
MOCK.zone_in(11);
MOCK.target_monster(19, 'Moblin Chapman');

-- At level 33 the Chapman's 42 DEX gives it 12% against 0 AGI.
local start = #MOCK.printed;
MOCK.packet(MOCK.check_packet(19, 33, 4, 174));
MOCK.frame();
local result = target.current();
local lines = table.concat(MOCK.printed_since(start), ' / ');
local hover = tips.text(s, result, 'number', 'crittaken');
expect('a negative client total reads as 0 AGI', player.read().agi, 0);
check('chat uses the clamped AGI', lines:find('Crit taken: 12%', 1, true), lines);
check('the overlay uses the same rate', result.crittaken.low == 12 and result.crittaken.high == 12);
check('its hover shows the AGI used', result.inputs.agi == 0 and hover:find('AGI 0', 1, true), hover);

p.stat_mods[3] = 2;
expect('a total within bounds stays as read', player.read().agi, 7);
s.merits.fill_in, s.merits.agi = false, 3;
merits.observe('agi', 1);
p.main_level, p.stats[3], p.stat_mods[3] = 75, 20, 2;
local me = player.read();
expect('manual ranks still apply to AGI within bounds', me.agi, 24);
check('the adjusted snapshot still names the override', me.merit_inputs.stats.agi.unavailable ~= true);
p.stats[3], p.stat_mods[3] = 5, -7;
me = player.read();
expect('a clipped total keeps 0 AGI even with a manual rank', me.agi, 0);
check('the clipped override is still unavailable', me.merit_inputs.stats.agi.unavailable == true);
s.merits.agi = 1;
p.stats[3], p.stat_mods[3] = 100, 900;
expect('the upper bound stays at 999 AGI', player.read().agi, 999);

return MOCK.report();
