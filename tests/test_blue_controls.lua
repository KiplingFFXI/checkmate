-- The lesson filter and its notes must work in both displays and survive settings changes.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local target = require('core.target');
local monsters = require('core.monsters');
local function command(value) MOCK.command('/checkmate ' .. value); end
local function lesson()
    for _, row in ipairs((target.readout(s).info or {}).sections or {}) do
        if (row.id == 'blue') then return row; end
    end
end
expect('the filter starts off for existing settings', s.blue.only_unlearned, false);
expect('learning details start on for existing settings', s.blue.requirements, true);
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.frame();
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.info = { blue = { spells = {
    { id = 577, name = 'Foot Kick', min_skill = 0 },
    { id = 578, name = 'Dust Cloud', min_skill = 25 },
} } };
MOCK.player.spell_data = true;
MOCK.player.known_spells = { [577] = true };
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
command('show blue');
command('overlayshow blue');
command('overlay on');
command('blueunlearned on');
MOCK.frame();
expect('the command saves the filter', MOCK.last_save.blue.only_unlearned, true);
expect('the overlay leaves out known spells', lesson().value, 'Dust Cloud (not learned)');
local first = #MOCK.printed;
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.wait(2);
local chat = table.concat(MOCK.printed_since(first), ' ');
check('chat uses the same filter', chat:find('Dust Cloud', 1, true) and not chat:find('Foot Kick', 1, true));
command('bluerequirements off');
MOCK.frame();
check('turning requirements off removes the minimum skill notes', not table.concat(lesson().notes, ' '):find('needs Blue Magic skill', 1, true));
command('profile save Learning');
command('blueunlearned off');
command('bluerequirements on');
command('profile load Learning');
expect('profiles keep the filter preference', s.blue.only_unlearned, true);
expect('profiles keep the requirement preference', s.blue.requirements, false);
MOCK.player.known_spells[578] = true;
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 132) });
MOCK.frame();
expect('learning a remaining lesson updates the filtered result', lesson().value, 'All listed spells learned');
MOCK.player.spell_data = false;
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 132) });
MOCK.frame();
check('an unreadable spellbook brings uncertain lessons back', lesson().value:find('Foot Kick (spellbook unknown)', 1, true));
expect('lesson controls send no game commands', #MOCK.commands, 0);
return MOCK.report();
