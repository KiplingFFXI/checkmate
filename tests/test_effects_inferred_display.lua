-- Secondary effects reach chat and the overlay without a separate status message.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local effects = require('core.effects');
local tips = require('ui.tips');
local function command(text) MOCK.command('/checkmate ' .. text); end
local function has(text, part) return (text or ''):find(part, 1, true) ~= nil; end
local function screen() return table.concat(MOCK.overlay_lines(), ' // '); end
local me, index = MOCK.player.server_id, 2000;
MOCK.zone_in(103);
local mob = MOCK.mob_id(103, index);
MOCK.target_monster(index, 'Unlisted Monster');
command('show effects');
command('overlay on');
command('overlayshow effects');
command('overlayicons off');
local s = MOCK.settings.current;
for key, part in pairs(s.printout.parts) do part.on = key == 'name' or key == 'effects'; end
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'name' or key == 'effects'; end

MOCK.packet(MOCK.action_packet(me, 3, 80, mob, { { message = 185, param = 25 } }));
MOCK.frame();
local readout = effects.readout(mob, 'both', MOCK.now);
check('Shield Break creates an addon-only estimate', readout and readout[1].effect == 148 and readout[1].inferred);
local first = screen();
check('overlay keeps the name clean and shows the timer', not has(first, 'Evasion Down?')
    and has(first, 'Evasion Down 3:00'), first);
local help = tips.text(s, { effects = readout }, 'effect', '148');
check('hover explains the unconfirmed application', has(help, 'did not confirm the debuff'));
check('hover states the assumed TP', has(help, '1,000 TP') and has(help, 'actually used is unknown'));
check('hover keeps estimates out of combat math', has(help, 'does not change combat calculations'));
local conditional = tips.text(s, { effects = {
    { effect = 168, word = 'eff_inhibit_tp', inferred = true, basis = 'unknown',
        condition = 'This needs Penance merits. Other players\' merit ranks are not visible.' },
} }, 'effect', '168');
check('conditional hover names the unseen prerequisite', has(conditional, 'This needs Penance merits.'));
check('non-damaging action hover does not claim a hit landed', has(conditional, 'action was seen')
    and not has(conditional, 'hit landed'));
local icons = require('ui.icons');
expect('Hysteria uses its Phoenix name', effects.game_name(804), 'Hysteria');
expect('Tomahawk uses its Phoenix name', effects.game_name(805), 'Tomahawk');
expect('Hysteria has no unrelated client picture', icons.effect_picture(804), nil);
expect('Tomahawk has no unrelated client picture', icons.effect_picture(805), nil);
local foreign = tips.text(s, { effects = {
    { effect = 168, word = 'eff_inhibit_tp', mine = false, inferred = true, basis = 'merit_unknown' },
} }, 'effect', '168');
check('another player\'s unknown merits are not called yours', has(foreign, 'Their merit rank is unknown.')
    and not has(foreign, 'Your merit rank is unknown.'));

local before = #MOCK.printed;
MOCK.packet(MOCK.check_packet(index, 30, 3, 174));
MOCK.frame();
local chat = table.concat(MOCK.printed_since(before), ' // ');
check('chat keeps the name clean and shows the timer', not has(chat, 'Evasion Down?')
    and has(chat, 'Evasion Down 3:00'), chat);
MOCK.frame(1);
check('the inferred timer counts down', has(screen(), '2:59'), screen());
command('effecttimes off');
MOCK.frame();
check('hiding timers keeps the clean name', has(screen(), 'Evasion Down') and not has(screen(), 'Evasion Down?')
    and not has(screen(), '2:59'), screen());
command('effecttimes on');

MOCK.packet(MOCK.action_packet(me, 3, 80, mob, { { message = 236, param = 148 } }));
MOCK.frame();
local confirmed = effects.readout(mob, 'both', MOCK.now);
check('explicit status confirmation clears uncertainty', confirmed and not confirmed[1].inferred);
check('confirmation keeps the same clean name', has(screen(), 'Evasion Down')
    and not has(screen(), 'Evasion Down?'), screen());
MOCK.packet(MOCK.message_packet(me, mob, 148, 0, 206, index));
MOCK.frame();
expect('wear-off removes the displayed effect', effects.has(mob), false);
expect('tracking sends no game commands', #MOCK.commands, 0);
return MOCK.report();
