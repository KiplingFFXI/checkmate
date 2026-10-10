-- Missing source or client inputs must not turn into a false answer.
local info = require('core.info');
local player = require('core.player');
local reads = 0;
player.knows_spell = function (id)
    reads = reads + 1;
    if (id == 577) then return true; end
    if (id == 578) then return false; end
    return nil;
end;
local function section(out, id)
    for _, entry in ipairs(out and out.sections or {}) do
        if (entry.id == id) then return entry; end
    end
end
local row = { info = {
    family = { value = 'Rabbit / Beast', notes = { 'Source identity.' } },
    charm = { value = 'Charmable', notes = { 'This does not give a success chance.' } },
    vitals = { hp = { [30] = 1200, [31] = 1400 }, mp = { [30] = 0, [31] = 0 } },
    blue = { spells = { { id = 577, name = 'Foot Kick' }, { id = 578, name = 'Dust Cloud' } }, notes = { 'Main-job BLU required.' } },
    spawn = { value = 'Respawn: 5 minutes', notes = { 'This is a source rule, not a live countdown.' } },
} };
expect('an unlisted monster has no invented facts', info.readout(nil), nil);
expect('an old row has no invented facts', info.readout({}), nil);
local out = info.readout(row, 30, 31);
expect('source family has its own section', section(out, 'family').value, 'Rabbit / Beast');
expect('a level range stays a source HP range', section(out, 'vitals').value, 'HP ~1,200-1,400, No MP in source');
expect('known and missing lessons stay separate', section(out, 'blue').value, 'Foot Kick (known), Dust Cloud (not learned)');
expect('spellbook reads happen only for possible lessons', reads, 2);
expect('source notes were not modified', #row.info.blue.notes, 1);
check('HP and MP are not presented as current values', table.concat(section(out, 'vitals').notes, ' '):find('not current HP or MP', 1, true));
out = info.readout(row, 31, 31, { blue = false });
expect('an exact observed level narrows the HP estimate', section(out, 'vitals').value, 'HP ~1,400, No MP in source');
expect('disabling lessons avoids all spellbook reads', reads, 2);
expect('a disabled section stays out', section(out, 'blue'), nil);
out = info.readout(row, 32, 32, { blue = false });
expect('a level outside the source maps stays unknown', section(out, 'vitals').value, 'HP unknown, MP unknown');
out = info.readout(row, 30, 32, { blue = false });
expect('a partly missing range is not shown as complete', section(out, 'vitals').value, 'HP unknown, MP unknown');
row.info_by_index = { [2] = { charm = { value = 'Cannot charm', notes = { 'This spawn is excluded.' } }, spawn = false } };
out = info.readout(row, 30, 30, { blue = false }, 2);
expect('a spawn override replaces the shared answer', section(out, 'charm').value, 'Cannot charm');
expect('a spawn can suppress an inapplicable shared rule', section(out, 'spawn'), nil);
expect('overrides leave unrelated shared facts', section(out, 'family').value, 'Rabbit / Beast');
expect('one spawn did not change another spawn', section(info.readout(row, 30, 30, { blue = false }, 1), 'charm').value, 'Charmable');
local settings = {};
for _, id in ipairs(info.ORDER) do settings[id] = false; end
expect('all sections off leaves no empty Monster heading', info.readout(row, 30, 30, settings), nil);
expect('fully hidden sections do not read the spellbook', reads, 2);
local missing = info.readout({ info = { blue = { spells = { { id = 579, name = 'Power Attack' } } } } });
expect('unavailable spellbook is not called unlearned', section(missing, 'blue').value, 'Power Attack (spellbook unknown)');
local possible = info.readout({ info = { vitals = { mp = { [10] = 100, [11] = 125 }, value = 'HP unknown' } } }, 10, 11);
expect('source MP has its own range', section(possible, 'vitals').value, 'MP ~100-125');
check('having source MP does not promise Aspir', table.concat(section(possible, 'vitals').notes, ' '):find('Aspir', 1, true));
local unknown = info.readout({ info = { vitals = { value = 'Source HP unknown', notes = { 'This fight scales it dynamically.' } } } });
expect('source-specific unknown reason survives without a guessed map', section(unknown, 'vitals').value, 'Source HP unknown');
return MOCK.report();
