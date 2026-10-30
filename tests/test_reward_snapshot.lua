-- Full rewards keep the TH and Steal inputs from the manual check.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local details = require('core.check_details');
local tips = require('ui.tips');
local monsters = require('core.monsters');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.player.main_job, MOCK.player.main_level = 6, 75;
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.frame();
for id, part in pairs(s.printout.parts) do part.on = id == 'name' or id == 'drops' or id == 'steal'; end
s.overlay.on = false;
s.drops.max_items, s.drops.min_chance = 1, 100;
MOCK.command('/checkmate th 2');
for id, name in pairs({ [100] = 'First reward', [101] = 'Second reward', [102] = 'Rare reward' }) do
    MOCK.items[id] = { Name = { name } };
end
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.drops = { { item = 100, rate = 500 }, { item = 101, rate = 100 }, { item = 102, rate = 10 } };
row.steal = { 101, 102 };
MOCK.packet(MOCK.check_packet(1, 39, 4, 174));
MOCK.frame();
local saved = details.current();
check('overlay-off check retains fully hidden reward items', saved ~= nil and saved.drops ~= nil
    and #saved.drops.items == 0 and #saved.drops.all_items == 3);
local text = tips.details(s, saved);
check('the saved full reward list is available without the overlay', text:find('Rare reward:', 1, true)
    and text:find('Your Steal works', 1, true));
MOCK.command('/checkmate th 4');
MOCK.player.main_job = 1;
check('later TH and job choices do not rewrite saved reward readings', details.current() == saved
    and saved.drops.th == 2 and tips.details(s, saved):find('Drop chances at Treasure Hunter 2:', 1, true)
    and tips.details(s, saved):find('Your Steal works', 1, true));
expect('reward details do not send parameter commands', #MOCK.commands, 0);
return MOCK.report();
