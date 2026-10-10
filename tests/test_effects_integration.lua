-- Effects through the real event handlers, chat, target cache, overlay and settings.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local effects = require('core.effects');
local printout = require('core.printout');
local tips = require('ui.tips');
local icons = require('ui.icons');
local function cur() return MOCK.settings.current; end
local function command(text) MOCK.command('/checkmate ' .. text); end
local function has(text, word) return text:find(word, 1, true) ~= nil; end
local function screen() return table.concat(MOCK.overlay_lines(), ' // '); end
local function calls(name)
    local count = 0;
    for _, one in ipairs(MOCK.gui.calls) do if (one == name) then count = count + 1; end end
    return count;
end
local me, mob = MOCK.player.server_id, MOCK.mob_id(103, 2000);
MOCK.zone_in(103);
MOCK.target_monster(2000, 'Unlisted Monster');
local function land(actor, spell, effect, message)
    MOCK.packet(MOCK.action_packet(actor, 4, spell, mob, { { message = message or 236, param = effect } }));
end

check('Effects starts off in both displays', not cur().printout.parts.effects.on and not cur().overlay.parts.effects);
expect('requiring the addon leaves Effects data unloaded', package.loaded['data.effects'], nil);
local bits = MOCK.bit_reads;
land(me, 58, 4);
MOCK.packet(MOCK.entity_packet(mob, 0x30));
MOCK.frame();
expect('off does not parse action bits', MOCK.bit_reads, bits);
expect('off still leaves Effects data unloaded', package.loaded['data.effects'], nil);

command('show effects');
land(me, 58, 4);
MOCK.frame();
check('chat alone starts the tracker', effects.has(mob));
for key, part in pairs(cur().printout.parts) do part.on = key == 'effects' or key == 'name'; end
local before = #MOCK.printed;
MOCK.packet(MOCK.check_packet(2000, 30, 3, 174));
MOCK.frame();
local chat = table.concat(MOCK.printed_since(before), ' // ');
check('a check prints observed effects without monster data', has(chat, 'Effects: Paralyze 2:00'), chat);
command('effects buffs');
before = #MOCK.printed;
MOCK.packet(MOCK.check_packet(2000, 30, 3, 174));
MOCK.frame();
check('chat honors the buff filter', not has(table.concat(MOCK.printed_since(before)), 'Effects:'));
command('effects both');
command('effecttimes off');
before = #MOCK.printed;
MOCK.packet(MOCK.check_packet(2000, 30, 3, 174));
MOCK.frame();
chat = table.concat(MOCK.printed_since(before));
check('times off keeps the names', has(chat, 'Effects: Paralyze') and not has(chat, '2:00'), chat);
command('effecttimes on');

-- The overlay can show an unlisted monster solely from an observed effect.
command('hide effects');
check('turning off the last display forgets observations', not effects.has(mob));
mob = MOCK.pet_id(2000);
MOCK.entities[2000].ServerId = mob;
command('overlay on');
command('overlayshow effects');
for key in pairs(cur().overlay.parts) do cur().overlay.parts[key] = key == 'name' or key == 'effects'; end
command('overlayicons off');
MOCK.frame();
expect('unlisted target starts hidden', screen(), '');
land(me, 58, 4);
land(2001, 56, 13);
MOCK.strings['buffs.names'] = { [40] = 'protect' };
land(mob, 43, 40, 230);
MOCK.frame();
local first = screen();
check('an observed effect makes the target appear', has(first, 'Unlisted Monster') and has(first, 'Paralyze 2:00')
    and has(first, 'Slow 3:00') and has(first, 'Protect 30:00'), first);
MOCK.frame(1);
local next_line = screen();
check('clocks count down with icons off', has(next_line, 'Paralyze 1:59') and has(next_line, 'Protect 29:59'), next_line);
expect('a quiet countdown frame never measures text', calls('CalcTextSize'), 0);
expect('all clocks share one draw list', calls('GetWindowDrawList'), 1);
expect('effect names can show tips even with their icons off', calls('GetMousePos'), 1);
local widths = {};
for _, run in ipairs(MOCK.gui.colored) do if (run.clock) then widths[#widths + 1] = run.size[1]; end end
MOCK.frame(2);
local at, stable = 0, true;
for _, run in ipairs(MOCK.gui.colored) do
    if (run.clock) then at = at + 1; stable = stable and run.size[1] == widths[at]; end
end
check('countdown slots stay the same width', stable and at == 3);
command('effecttimes off');
MOCK.frame();
check('overlay times off keeps names without time slots', has(screen(), 'Paralyze') and calls('GetWindowDrawList') == 0);
command('effecttimes on');

-- Icons and tips preserve names for pictures that cannot distinguish effects.
MOCK.picture('status', 4);
MOCK.picture('status', 13);
MOCK.picture('status', 40);
command('overlayicons on');
MOCK.frame();
expect('one picture per effect', #MOCK.gui.images, 3);
local readout = { effects = {
    { effect = 4, word = 'eff_paralysis', left = 80, mine = true, debuff = true },
    { effect = 40, name = 'Protect', left = 1630, mine = false, own = true },
    { effect = 999, name = 'Mystery', mine = false },
} };
check('tip names your effect in full', has(tips.text(cur(), readout, 'effect', '4'), 'Paralyze, from you.'));
expect('your tooltip time', tips.more(cur(), readout, 'effect', '4'), 'About 1:20 left.');
expect('a buff tooltip says its time is a guess', tips.more(cur(), readout, 'effect', '40'), 'About 27:10 left, a guess.');
check('unknown duration explains its timeout', has(tips.more(cur(), readout, 'effect', '999'), 'after 3 minutes'));
expect('Sleep II uses Sleep picture', icons.effect_picture(19), 2);
expect('Lullaby uses Sleep picture', icons.effect_picture(193), 2);

-- An Effects failure leaves chat and the overlay available, and a checkbox change restarts tracking.
local real_action = effects.on_action;
effects.on_action = function () error('fixture failure'); end;
before = #MOCK.printed;
land(me, 58, 4);
MOCK.frame();
chat = table.concat(MOCK.printed_since(before));
check('an Effects error is reported once', has(chat, 'Effects stopped after an error')
    and not has(chat, 'The overlay stopped after an error') and not has(chat, '[checkmate] Stopped after an error'), chat);
expect('failure clears tracked effects', effects.has(mob), false);
before = #MOCK.printed;
land(me, 58, 4);
MOCK.frame();
expect('the disabled tracker does not repeat its error', #MOCK.printed, before);
effects.on_action = real_action;
command('overlayhide effects');
command('overlayshow effects');
land(me, 58, 4);
MOCK.frame();
check('toggling the Effects part restarts it', effects.has(mob) and has(screen(), 'Paralyze'));
MOCK.packet(MOCK.entity_packet(mob, 0x30));
MOCK.frame();
expect('removing the last effect hides an unlisted target', screen(), '');

-- The sample is stable, and impossible checks can still print Effects on their own line.
command('show effects');
command('divider pipe');
before = #MOCK.printed;
command('sample');
chat = table.concat(MOCK.printed_since(before), ' // ');
check('the sample includes all three Effects examples', has(chat, 'Effects: Paralyze 1:20, Slow 2:45 | Protect 27:10'), chat);
local s = cur();
local raw = table.concat(printout.lines(s, { name = 'Mystery', cant_gauge = true, effects = readout.effects }), '\n');
check('an impossible check still gets Effects', has(MOCK.plain(raw), 'Effects: Paralyze 1:20'), MOCK.plain(raw));
MOCK.zone_in(103);
expect('zoning forgets observations', effects.has(mob), false);

return MOCK.report();
