-- Weapon data goes through the same commands, chat and target cache as the other parts.
MOCK.settings_file = { printout = { order = 'difficulty hit elements drops' } };
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local monsters = require('core.monsters');
local target = require('core.target');
local player = require('core.player');
local function command(text) MOCK.command('/checkmate ' .. text); end
local function has(text, value) return text:find(value, 1, true) ~= nil; end
check('older settings leave Weaknesses off in both displays', not s.printout.parts.weaknesses.on and not s.overlay.parts.weaknesses);
check('older order combines damage types in one Weaknesses row', has(s.printout.order, 'magic weaknesses effects family')
    and not has(s.printout.order, 'elements') and not has(s.printout.order, 'weapons'), s.printout.order);
command('weaponsweakword "Takes more"');
command('weaponsresistword "Takes less"');
check('weapon words save without changing the element words', s.weapons.weak_word == 'Takes more'
    and s.weapons.resist_word == 'Takes less' and MOCK.last_save.weapons.resist_word == 'Takes less'
    and s.elements.weak_word == 'Weak' and s.elements.resist_word == 'Resists');
command('weaponsweakword Weak');
command('weaponsresistword Resists');
addon.path = FIXTURES_PATH;
MOCK.player.main_level = 40;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.frame();
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 };
for _, part in pairs(s.printout.parts) do part.on = false; end
for part in pairs(s.overlay.parts) do s.overlay.parts[part] = false; end
command('show weapons');
local before = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(2);
local chat = table.concat(MOCK.printed_since(before), ' / ');
check('a check prints the weapon changes', has(chat, 'Blunt (+25%)') and has(chat, 'Slashing (-12.5%)')
    and has(chat, 'Piercing (-50%)'), chat);
expect('weapons alone sends no checkparam command', #MOCK.commands, 0);
command('overlayicons off');
command('overlayshow weapons');
command('overlay on');
MOCK.frame();
local shown = table.concat(MOCK.overlay_lines(), ' / ');
check('the selected target shows the same weapon changes', has(shown, 'Blunt (+25%)') and has(shown, 'Piercing (-50%)'), shown);
local cached = target.readout(s);
local input_calls, original = 0, player.inputs_changed;
player.inputs_changed = function (...) input_calls = input_calls + 1; return original(...); end;
MOCK.player.equipment[5] = 14505;
MOCK.player.hp = 500;
MOCK.wait(2);
local same, rebuilt = target.readout(s);
check('static weapon data stays cached while local gear and HP change', same == cached and not rebuilt);
expect('Weapons alone does not poll combat inputs', input_calls, 0);
expect('the passive overlay sends no commands', #MOCK.commands, 0);
player.inputs_changed = original;
row.levels[39].weapon_dmg = { piercing = 50 };
row.levels[40].weapon_dmg = { piercing = -25 };
MOCK.packet(MOCK.check_packet(1, 40, 4, 174));
MOCK.frame();
local changed = target.readout(s);
check('a new checked level selects that level\'s weapon data', changed.weapons.resists[1].kind == 'piercing'
    and changed.weapons.resists[1].percent == -25);
command('overlayhide weapons');
MOCK.frame();
expect('hiding Weapons clears it from the cached result', target.readout(s).weapons, nil);
return MOCK.report();
