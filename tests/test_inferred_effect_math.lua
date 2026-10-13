-- Inferred effects can be shown without becoming confirmed calculation inputs.
local modifiers = require('core.modifiers');
local physical = require('core.physical');
local magic = require('core.magic');
local pdif = require('core.pdif');
local data = require('data.modifiers');
local spells = require('data.spells');

local function same(a, b)
    if (type(a) ~= type(b)) then return false; end
    if (type(a) ~= 'table') then return a == b; end
    for key, value in pairs(a) do if (not same(value, b[key])) then return false; end end
    for key in pairs(b) do if (a[key] == nil) then return false; end end
    return true;
end

MOCK.player.equipment = {};
local own = { main_job = 4, level = 75, zone = 103, dex = 50, agi = 50, int = 50, mnd = 50, chr = 50,
    accuracy = 200, offhand_accuracy = 200, ranged_accuracy = 200, evasion = 200, attack = 400,
    offhand_attack = 350, ranged_attack = 450, observed_at = 10, buffs = {}, extra_accuracy = 0,
    skills = { [36] = spells.MEVA_BY_LEVEL[75] - 25 } };
own.modifiers = modifiers.read(own);
local mob = { low = 75, high = 75, row = { levels = { [75] =
    { acc = 200, eva = 200, def = 400, dex = 50, agi = 50, int = 50, mnd = 50, chr = 50 } } } };
local pet = { name = 'pet', kind = 'jug', low = 75, high = 75, accuracy = 200, evasion = 200 };
local magic_settings = { known_inputs = true, schools = { elemental = { on = true, spell = 'tier1' } } };
local function values()
    return { enemy = modifiers.enemy(mob), physical = physical.readout(own, mob),
        pet = physical.pet_readout(pet, mob), magic = magic.readout(own, mob, magic_settings),
        main = pdif.readout(own, mob, 'main'), offhand = pdif.readout(own, mob, 'offhand'),
        ranged = pdif.readout(own, mob, 'ranged') };
end

local baseline = values();
mob.effects = {};
for _, id in ipairs({ 146, 147, 148, 149, 129, 217, data.buffs.flash, data.buffs.mighty_strikes }) do
    mob.effects[#mob.effects + 1] = { effect = id, inferred = true };
end
local inferred = values();
for _, key in ipairs({ 'enemy', 'physical', 'pet', 'magic', 'main', 'offhand', 'ranged' }) do
    check('inferred effects leave ' .. key .. ' identical to no effects', same(inferred[key], baseline[key]));
end

mob.effects = { { effect = 5 } };
local blind = values();
mob.effects[2] = { effect = data.buffs.flash, inferred = true };
local mixed = values();
check('confirmed Blind does not let inferred Flash widen player evasion', same(mixed.physical, blind.physical));
check('confirmed Blind does not let inferred Flash widen pet evasion', same(mixed.pet, blind.pet));

mob.effects = { { effect = data.buffs.flash, inferred = false } };
local confirmed = values();
check('confirmed Flash still widens player evasion', confirmed.physical.evade.high == 80
    and confirmed.physical.evade.uncertain and baseline.physical.evade.high < 80);
check('confirmed Flash still widens pet evasion', confirmed.pet.evade.high == 80
    and confirmed.pet.evade.uncertain and baseline.pet.evade.high < 80);
mob.effects = { { effect = data.buffs.mighty_strikes } };
check('confirmed Mighty Strikes still changes enemy critical chance', physical.readout(own, mob).crittaken.low == 100);
mob.effects = { { effect = 148 } };
check('confirmed Evasion Down still qualifies hit chance', physical.readout(own, mob).hit.uncertain);
mob.effects = { { effect = 217 } };
check('confirmed Threnody still qualifies magic chance', magic.readout(own, mob, magic_settings)[1].uncertain);
mob.effects = { { effect = 149 } };
local notes = table.concat(pdif.readout(own, mob, 'main').notes, ' ');
check('confirmed Defense Down retains its observed-effect note', notes:find('was seen', 1, true) ~= nil);

return MOCK.report();
