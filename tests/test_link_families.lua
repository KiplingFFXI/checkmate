local aggro = require('core.aggro');
local monsters = require('core.monsters');
local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local s = defaults.make();
require('ui.skins').fill(s);
s.links.group_families, s.links.max_links = true, 0;
local names = { 'Goblin Butcher', 'Goblin Smithy', 'Goblin Tinkerer' };
local families = {};
for _, name in ipairs(names) do families[name] = { id = 1, name = 'Goblin' }; end
local row = { links = { sight = names }, link_families = families };
local got = aggro.links(row, s.links);
expect('matching helpers use one family label', table.concat(got.names, ', '), 'Goblin family');
check('grouped label keeps Sight', got.grouped and got.tags[1][1][1] == 'sense_sight');
expect('details retain each exact name', table.concat(got.all_names, ', '), table.concat(names, ', '));
expect('source list is not changed', table.concat(row.links.sight, ', '), table.concat(names, ', '));
for _, name in ipairs(names) do
    expect('details keep the way for ' .. name, got.all_tags[name][1][1], 'sense_sight');
end
for id, part in pairs(s.printout.parts) do part.on = id == 'links'; end
local result = { name = 'Target', links = got };
local text = MOCK.plain(table.concat(printout.lines(s, result), '\n'));
check('chat prints the family and its sense', text:find('Links with Goblin family (Sight)', 1, true) ~= nil, text);
local detail = tips.details(s, result);
for _, name in ipairs(names) do check('full details retain ' .. name, detail:find(name .. ' (Sight)', 1, true) ~= nil); end

families['Goblin King'] = { id = 1, name = 'Goblin' };
row.links.sight = { 'Goblin King', 'Goblin Smithy', 'Goblin Tinkerer', 'Unmapped' };
row.links.superlink = { 'Goblin King' };
got = aggro.links(row, s.links);
expect('different link conditions and unmapped names stay separate', table.concat(got.names, ', '), 'Goblin King, Goblin family, Unmapped');
s.links.max_links = 2;
got = aggro.links(row, s.links);
expect('limit counts entries after grouping', got.more, 1);
expect('grouped entry fits within the limit', got.names[2], 'Goblin family');
expect('limit leaves all exact names in the details', #got.all_names, 4);
s.links.group_families = false;
got = aggro.links(row, s.links);
check('individual mode preserves its old name limit', #got.names == 2 and got.names[2] == 'Goblin Smithy' and got.more == 2);
s.links.group_families, s.links.max_links = true, 0;
s.links.link_how = false;
got = aggro.links(row, s.links);
check('hiding senses still groups matching names', got.names[2] == 'Goblin family' and got.tags == nil);
s.links.link_names = false;
got = aggro.links(row, s.links);
check('hiding names also hides family groups', got.names == nil and not got.grouped and got.more == 0);
s.links.link_names, s.links.link_how = true, true;

local function separated(ways, label)
    row.links = ways;
    local value = aggro.links(row, s.links);
    check(label, #value.names == 2 and not value.grouped, table.concat(value.names, ', '));
end
separated({ sight = { names[1] }, sound = { names[2] } }, 'Sight and Sound stay separate');
separated({ sound = { names[1] }, true_sound = { names[2] } }, 'Sound and True Sound stay separate');
separated({ sound = { names[1], names[2] }, superlink = { names[1] } }, 'Superlink alternatives stay with the correct name');
separated({ both = { names[1] }, sight = { names[2] }, sound = { names[2] } }, 'both senses differ from separate alternatives');
separated({ neither = { names[1] }, sight = { names[1], names[2] } }, 'an unworded way still keeps names separate');
row.links = { sight = { names[1], names[2] }, sound = { names[1], names[2] } };
got = aggro.links(row, s.links);
check('identical alternatives can group without dropping a sense', #got.names == 1 and #got.tags[1] == 2
    and got.tags[1][1][1] == 'sense_sight' and got.tags[1][2][1] == 'sense_sound');
row.links = { neither = { names[1], names[2] } };
got = aggro.links(row, s.links);
check('unworded links can group without inventing a sense', #got.names == 1 and #got.tags[1] == 0);
row.links = { sight = { names[1], names[2] } };
row.link_families = nil;
got = aggro.links(row, s.links);
check('older data keeps individual names', #got.names == 2 and not got.grouped);

local file = { monsters = { { links = 1 }, { links = 1 } }, link_lists = { row.links }, link_families = families };
monsters.resolve_links(file);
check('rows share the zone family metadata', file.monsters[1].link_families == families
    and file.monsters[2].link_families == families);
check('rows still share their original link list', file.monsters[1].links == row.links and file.monsters[2].links == row.links);

local real = monsters.find(103, MOCK.mob_id(103, 98), 'Goblin Tinkerer');
got = aggro.links(real, s.links);
expect('Valkurm goblins collapse to their family', table.concat(got.names, ', '), 'Goblin family');
check('Valkurm keeps all original Goblin names', #got.all_names >= 5 and got.all_tags['Goblin Tinkerer'] ~= nil);
local dynamis = monsters.find(134, MOCK.mob_id(134, 2), 'Vanguard Liberator');
got = aggro.links(dynamis, s.links);
check('Dynamis family groups shorten its long list', got.grouped and #got.names < #got.all_names);
check('Dynamis keeps Angra Mainyu in the full details', got.all_tags['Angra Mainyu'] ~= nil);
check('grouping sends no commands', #MOCK.commands == 0);
return MOCK.report();
