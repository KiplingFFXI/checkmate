local player = require('core.player');
local physical = require('core.physical');
local memory = AshitaCore:GetMemoryManager();
local get_player, get_inventory = memory.GetPlayer, memory.GetInventory;
local buff_reads, missing_buffs = 0, false;
memory.GetPlayer = function(...)
    local stats = get_player(...);
    local buffs = stats.GetBuffs;
    stats.GetBuffs = function(...)
        buff_reads = buff_reads + 1;
        if (missing_buffs) then return nil; end
        return buffs(...);
    end;
    return stats;
end;
player.pdif_inputs();
expect('an attack signature reads the buff list once', buff_reads, 1);
buff_reads = 0;
player.parameter_inputs();
expect('a parameter signature also reads the buff list once', buff_reads, 1);
local origin = player.pdif_inputs();
player.accept_attacks(origin, 400, nil, 450, 10);
missing_buffs = true;
expect('unreadable buffs cannot form an attack signature', player.pdif_inputs().signature, nil);
expect('unreadable buffs invalidate retained attack values', player.pdif_inputs().attack, nil);
expect('unreadable buffs reject the pending attack reply', player.accept_attacks(origin, 400, nil, 450, 11), nil);
expect('unreadable buffs cannot form a parameter signature', player.parameter_inputs().signature, nil);
missing_buffs = false;
MOCK.items[10], MOCK.player.equipment[0] = { Skill = 3 }, 10;
origin = player.parameter_inputs();
local attack_origin = player.pdif_inputs();
memory.GetInventory = function(...)
    local bag = get_inventory(...);
    bag.GetContainerItem = function() return nil; end;
    return bag;
end;
expect('a populated but unreadable equipment slot invalidates attack inputs', player.pdif_inputs().signature, nil);
expect('a populated but unreadable equipment slot invalidates parameter inputs', player.parameter_inputs().signature, nil);
expect('unreadable equipment rejects attack replies', player.accept_attacks(attack_origin, 400, nil, nil, 12), nil);
expect('unreadable equipment rejects parameter replies', player.accept_parameters(origin, { accuracy = 160 }, 12), nil);
memory.GetInventory, memory.GetPlayer = get_inventory, get_player;
expect('restored readable equipment permits a fresh signature', type(player.parameter_inputs().signature), 'string');

local numbers = { hit = { low = 70, high = 80, notes = { 'Existing reason.' } },
    offhand = { low = 60, high = 65 }, ranged = { low = 60, high = 70 },
    ranged_far = { low = 50, high = 60 }, evade = { low = 20, high = 30 },
    crit = { low = 5, high = 5 } };
physical.qualify_parameters(numbers);
physical.qualify_parameters(numbers);
for _, id in ipairs({ 'hit', 'offhand', 'ranged', 'ranged_far', 'evade' }) do
    check(id .. ' gets the conditional warning', numbers[id].uncertain == true);
    expect(id .. ' warning is not duplicated', #numbers[id].notes, id == 'hit' and 2 or 1);
end
expect('qualification preserves prior notes', numbers.hit.notes[1], 'Existing reason.');
expect('qualification does not change the rate', numbers.hit.low, 70);
expect('parameter qualification leaves unrelated crit alone', numbers.crit.uncertain, nil);

package.loaded['data.defenses'] = { shield_rates = { 55, 40, 45, 30, 50, 100 },
    shields = { [100] = { size = 1, level = 1 } }, gear = {},
    job_ranks = { [1] = { block = 3, parry = 3 } }, parry_caps = {},
    prevent_effects = {}, reprisal_effect = 403, issekigan_effect = 470, palisade_effect = 478 };
addon.path = FIXTURES_PATH;
local target = require('core.target');
local monsters = require('core.monsters');
local s = require('ui.defaults').make();
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.overlay.parts.hit = true;
MOCK.player.zone, MOCK.player.main_job, MOCK.player.main_level = 900, 1, 40;
MOCK.player.equipment[1], MOCK.items[100] = 100, { Skill = 0, ShieldSize = 1 };
MOCK.player.skills[30] = 100;
MOCK.target_monster(1, 'Fixture Goblin');
target.on_zone(900); target.take_in(); target.read(s.overlay);
local id = MOCK.mob_id(900, 1);
local row = monsters.find(900, id, 'Fixture Goblin');
for _, stats in pairs(row.levels) do stats.def, stats.attack_skill = 100, 100; end
target.on_check(1, id, 39, 4, 2, nil, false, 1, 'waiting');
local snapshot = player.accept_parameters(player.parameter_inputs(), { accuracy = 160, evasion = 130 }, 10);
target.on_parameters(1, id, 1, snapshot); target.take_in();
local first = target.readout(s);
local full_reads, read = 0, player.read;
player.read = function(...) full_reads = full_reads + 1; return read(...); end;
local current, first_qualified;
for n = 1, 100 do
    MOCK.player.tp, MOCK.now = n * 10, MOCK.now + 0.3;
    current = target.readout(s);
    if (n == 1) then first_qualified = current; end
end
expect('one hundred conditional changes need only the first qualification rebuild', full_reads, 1);
expect('later conditional changes reuse the qualified result', current, first_qualified);
check('the conditional warning remains present', current.hit.uncertain);
expect('the qualified result preserves the rate', current.hit.low, first.hit.low);
expect('the earlier snapshot remains unchanged', first.hit.uncertain, nil);

s.overlay.parts.pdif = true;
player.accept_attacks(player.pdif_inputs(), 400, nil, nil, MOCK.now);
target.mark_stale();
current = target.readout(s);
expect('pDIF still builds alongside a qualified parameter result', current.pdif.attack, 400);
player.accept_attacks(player.pdif_inputs(), 500, nil, nil, MOCK.now);
MOCK.now = MOCK.now + 0.3;
current = target.readout(s);
expect('a new pDIF revision still refreshes independently', current.pdif.attack, 500);

s.overlay.parts.block = true;
target.mark_stale();
current = target.readout(s);
local block = current.block.low;
MOCK.player.skills[30], MOCK.now = 110, MOCK.now + 0.3;
current = target.readout(s);
check('a defensive skill change still refreshes independently', current.block.low > block);
expect('a shield skill change does not discard unrelated accuracy', current.inputs.accuracy, 160);
MOCK.player.stats[1], MOCK.now = 71, MOCK.now + 0.3;
current = target.readout(s);
check('a stable parameter-input change keeps only the last calculated estimate', current.hit and current.hit.retained);
expect('the whole passive flow sends no commands', #MOCK.commands, 0);
player.read = read;
target.forget();
return MOCK.report();
