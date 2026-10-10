-- Shield and parry rows read current inputs without asking the server for stats.
package.loaded['data.defenses'] = { shield_rates = { 55, 40, 45, 30, 50, 100 },
    shields = { [100] = { size = 1, level = 1, name = 'Example shield' } }, gear = {},
    job_ranks = { [1] = { block = 3, parry = 3 } }, parry_caps = { [39] = 120 },
    prevent_effects = {}, reprisal_effect = 403, issekigan_effect = 470, palisade_effect = 478 };
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.player.main_job, MOCK.player.main_level = 1, 40;
MOCK.player.skills = { [30] = 150, [31] = 150 };
MOCK.player.equipment = { [0] = 10, [1] = 100 };
MOCK.items[10], MOCK.items[100] = { Skill = 3 }, { Skill = 0, ShieldSize = 1 };
local row = require('core.monsters').find(900, 1, 'Fixture Goblin');
for _, stats in pairs(row.levels) do stats.attack_skill, stats.def = 120, 365; end
local s = MOCK.settings.current;
for _, part in pairs(s.printout.parts) do part.on = false; end
for name in pairs(s.overlay.parts) do s.overlay.parts[name] = false; end
s.overlay.on = false;
s.printout.parts.block.on, s.printout.parts.parry.on = true, true;
local player = require('core.player');
player.read = function() error('Defensive rows do not need the full combat snapshot'); end;
require('core.modifiers').read = function() error('Defensive rows do not need the general modifier scan'); end;
local reads, original = 0, player.defense_inputs;
player.defense_inputs = function(...) reads = reads + 1; return original(...); end;
local function checked()
    local printed = #MOCK.printed;
    MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
    MOCK.frame();
    local lines = MOCK.printed_since(printed);
    return table.concat(lines, '\n'), lines;
end
local sent = #MOCK.commands;
local text, lines = checked();
check('manual check has one shield line and one parry line', #lines == 2
    and text:find('Shield block:', 1, true) and text:find('Parry:', 1, true), text);
check('manual check calculates the shield chance', text:find('61.97%', 1, true), text);
check('manual check calculates the parry chance', text:find('13%', 1, true), text);
expect('both rows share one narrow input read', reads, 1);
MOCK.wait(5);
expect('neither row schedules a stats request', #MOCK.commands, sent);
expect('no extra read follows the finished check', reads, 1);

MOCK.player.equipment[1] = nil;
text = checked();
check('removing the shield shows unavailable rather than zero', text:find('Shield block: No shield equipped', 1, true)
    and text:find('Parry:', 1, true), text);
MOCK.items[10].Skill = 1;
text = checked();
check('hand-to-hand makes parry unavailable', text:find('Parry: Weapon cannot parry', 1, true), text);
MOCK.items[10].Skill, MOCK.player.equipment[1] = 3, 100;
for _, stats in pairs(row.levels) do stats.attack_skill = nil; end
text = checked();
check('missing monster weapon skill never falls back to Accuracy', text:find('Shield block: unknown', 1, true), text);
check('parry still uses its own level-based comparison', text:find('13%', 1, true), text);
for _, stats in pairs(row.levels) do stats.attack_skill = 120; end

-- The existing delayed Attack request is independent of these local inputs.
s.printout.parts.pdif.on, s.pdif.mode = true, 'ratio';
s.printout.order = require('core.printout').clean_order('block parry pdif');
local printed = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
text = table.concat(MOCK.printed_since(printed), '\n');
check('defensive rows placed first print before the Attack reply', text:find('Shield block:', 1, true)
    and text:find('Parry:', 1, true) and not text:find('Ratio', 1, true), text);
MOCK.wait(1.6);
expect('mixed display sends only the existing Attack request', #MOCK.commands, sent + 1);
printed = #MOCK.printed;
for _, packet in ipairs(MOCK.checkparam_packets(300, 250, nil, 280, 260, 558, 490, 610)) do
    MOCK.packet(packet);
end
MOCK.frame();
text = table.concat(MOCK.printed_since(printed), '\n');
check('Attack reply prints pDIF without repeating the defensive rows', text:find('1.53', 1, true)
    and not text:find('Shield block:', 1, true) and not text:find('Parry:', 1, true), text);
return MOCK.report();
