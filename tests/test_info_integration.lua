-- Source facts refresh on target, level and spellbook changes, without combat polling.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local monsters = require('core.monsters');
local target = require('core.target');
local profiles = require('ui.profiles');
local player = require('core.player');
local function command(text) MOCK.command('/checkmate ' .. text); end
local function has(text, value) return text:find(value, 1, true) ~= nil; end
local function screen() return table.concat(MOCK.overlay_lines(), ' / '); end
local function section(out, id)
    for _, entry in ipairs(out.info and out.info.sections or {}) do if entry.id == id then return entry; end end
end
check('source rows start off in both displays', not s.printout.parts.family.on and not s.overlay.parts.family
    and not s.printout.parts.blue.on and not s.overlay.parts.blue);
check('Elements warning starts on for older settings', s.elements.script_mark == true);
command('elementmark off');
check('Elements warning can be hidden and saved', not s.elements.script_mark and not MOCK.last_save.elements.script_mark);
command('elementmark on');
check('Elements warning can be restored', s.elements.script_mark);
command('infosection charm off');
check('a section switch saves independently', not s.weaknesses.chat.charm and not s.weaknesses.overlay.charm and not MOCK.last_save.weaknesses.chat.charm);
command('infosection charm on');
check('a section can be restored', s.weaknesses.chat.charm and s.weaknesses.overlay.charm);
addon.path = FIXTURES_PATH;
MOCK.player.main_level = 40;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.frame();
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.info = {
    family = { value = 'Goblin / Beastmen', notes = { 'Source identity.' } },
    vitals = { hp = { [38] = 900, [39] = 1000, [40] = 1100 }, mp = { [38] = 50, [39] = 55, [40] = 60 } },
    blue = { spells = { { id = 577, name = 'Foot Kick' } }, notes = { 'A possible lesson requires the move to be used.' } },
};
MOCK.player.spell_data = true;
MOCK.player.known_spells = {};
for _, part in pairs(s.printout.parts) do part.on = false; end
for part in pairs(s.overlay.parts) do s.overlay.parts[part] = false; end
command('show info');
local before = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(2);
local printed = table.concat(MOCK.printed_since(before), ' / ');
check('chat prints source facts with the checked level', has(printed, 'Goblin / Beastmen') and has(printed, 'HP ~1,000'), printed);
check('chat shows a possible unlearned lesson', has(printed, 'Foot Kick (not learned)'), printed);
expect('Source rows alone send no checkparam request', #MOCK.commands, 0);
command('overlayicons off');
command('overlayshow info');
command('overlay on');
MOCK.frame();
check('the overlay uses the same facts', has(screen(), 'Goblin / Beastmen') and has(screen(), 'Foot Kick (not learned)'), screen());
local old = target.readout(s);
local spell_reads, inputs, original = MOCK.spell_reads or 0, 0, player.inputs_changed;
player.inputs_changed = function (...) inputs = inputs + 1; return original(...); end;
MOCK.player.hp = 500;
MOCK.player.known_spells[577] = true;
MOCK.wait(2);
expect('steady frames do not poll the spellbook', MOCK.spell_reads or 0, spell_reads);
expect('Source rows do not start combat-input polling', inputs, 0);
expect('quiet frames retain the same result', target.readout(s), old);
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 131) });
MOCK.frame();
expect('a truncated spell packet leaves the cache alone', target.readout(s), old);
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 132) });
MOCK.frame();
local learned = target.readout(s);
check('a complete spellbook update refreshes without retargeting', learned ~= old
    and section(learned, 'blue').value == 'Foot Kick (known)', screen());
expect('learning one possible lesson reads it once on rebuild', MOCK.spell_reads, spell_reads + 1);
command('infosection blue off');
MOCK.frame();
local hidden = target.readout(s);
expect('a hidden lesson section leaves the result', section(hidden, 'blue'), nil);
spell_reads = MOCK.spell_reads;
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 132) });
MOCK.frame();
expect('a hidden lesson section ignores spellbook notifications', target.readout(s), hidden);
expect('a hidden lesson section does not query learned spells', MOCK.spell_reads, spell_reads);
command('infosection blue on');
MOCK.player.spell_data = false;
MOCK.frame();
expect('an unavailable client spellbook remains unknown', section(target.readout(s), 'blue').value, 'Foot Kick (spellbook unknown)');
MOCK.player.spell_data = true;
MOCK.spell_api_error = true;
expect('a client API failure remains unknown', player.knows_spell(577), nil);
MOCK.spell_api_error = false;
player.inputs_changed = original;
expect('all passive updates still sent no commands', #MOCK.commands, 0);
command('profile save Field');
command('joblink WAR Field');
command('profile delete Field');
check('profile deletion is available to undo', not profiles.exists('Field') and profiles.deleted_name() == 'Field');
command('profile undo');
check('the command restores the profile and its empty job link', profiles.exists('Field') and s.job_links.WAR == 'Field');
expect('undo is consumed after restoration', profiles.deleted_name(), nil);
return MOCK.report();
