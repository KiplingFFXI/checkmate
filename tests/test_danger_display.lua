-- Long danger lists stay complete in chat and Target details.
local defaults = require('ui.defaults');
local printout = require('core.printout');
local tips = require('ui.tips');
local s = defaults.make();
require('ui.skins').fill(s);
for id, part in pairs(s.printout.parts) do part.on = id == 'dangers'; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'dangers'; end
local values, notes = {}, {};
for i = 1, 40 do
    values[i] = ('Move %02d: Poison, can crit'):format(i);
    notes[i] = ('Move %02d needs its effect and hit checks to pass.'):format(i);
end
local section = { id = 'dangers', label = 'Dangers', value = table.concat(values, '; '), notes = notes };
local result = { name = 'Test monster', low = 42, high = 42, info = { sections = { section } } };
local chat = MOCK.plain(table.concat(printout.lines(s, result), '\n'));
local details = tips.details(s, result);
for i, value in ipairs(values) do
    check('chat keeps danger ' .. i, chat:find(value, 1, true) ~= nil);
    check('full details keep danger ' .. i, details:find(value, 1, true) ~= nil);
    check('full details keep condition ' .. i, details:find(notes[i], 1, true) ~= nil);
end
local hover = tips.text(s, result, 'info', 'dangers');
check('long hover stays bounded', #hover < 600, #hover);
check('shortened hover says where the full list lives', hover:find('Monster > Target details', 1, true) ~= nil);
check('shortened hover marks omitted entries', hover:find('; ...', 1, true) ~= nil);
check('full details do not carry the hover cutoff', details:find('; ...', 1, true) == nil);
check('full details separate move conditions', details:find(notes[1] .. '\n\n' .. notes[2], 1, true) ~= nil);
section.value, section.notes = 'Head Butt: Stun', { 'Stun needs a successful hit.' };
hover = tips.text(s, result, 'info', 'dangers');
expect('short hover keeps the effect condition', hover, 'Dangers: Head Butt: Stun. Stun needs a successful hit.');
section.danger_source = { coverage = 'resolved', entries = {
    { kind = 'attack', name = 'Normal attacks', summary = 'Normal attacks: Stun',
        effects = { 'Stun' }, categories = { 'debuff' }, notes = { 'The additional effect can fail.' } },
} };
details = tips.details(s, result);
check('normal attacks are labeled as attacks in full details', details:find('Attack: Normal attacks', 1, true) ~= nil
    and not details:find('Move: Normal attacks', 1, true));
check('normal attack details keep their effect condition', details:find('The additional effect can fail.', 1, true) ~= nil);
return MOCK.report();
