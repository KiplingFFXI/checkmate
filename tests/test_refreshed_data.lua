-- Keep the reviewed drop correction and era timer notes in the bundled data.
local pass = require('data.zones.166');
local row;
for _, candidate in ipairs(pass.monsters) do
    for _, index in ipairs(candidate.ids) do
        if (index == 129) then row = candidate; end
    end
end
check('the affected Ranguemont Bat Eyes have a row', row ~= nil and row.name == 'Bat Eye');
local storm_axe = false;
for _, drop in ipairs(row.drops or {}) do
    if (drop.item == 16675) then storm_axe = true; end
end
expect('the affected Bat Eyes do not list Storm Axe', storm_axe, false);
for _, index in ipairs({ 129, 130, 131 }) do
    local found = false;
    for _, id in ipairs(row.ids) do if (id == index) then found = true; end end
    check('the correction covers Bat Eye spawn ' .. index, found);
end
expect('the existing Bat Eye respawn stays correct', row.info.spawn.value, 'Respawn 14 minutes');

local dem = require('data.zones.18');
local satiator;
for _, candidate in ipairs(dem.monsters) do
    if (candidate.name == 'Satiator') then satiator = candidate; end
end
check('Satiator has a source row', satiator ~= nil);
expect('Satiator shows the era delay', satiator.info.spawn.value, 'Respawn 4 hours');
local notes = table.concat(satiator.info.spawn.notes, ' ');
check('the era delay does not invent a countdown', notes:find('no remaining time', 1, true) ~= nil);
check('saved timers retain their qualification', notes:find('Saved timers', 1, true) ~= nil);
expect('refreshed zones share the source stamp', pass.built, dem.built);
expect('shared metadata uses the same source', pass.built, require('data.job_settings').built);
return MOCK.report();
