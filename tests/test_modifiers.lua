-- Known gear and merits, saved manual totals and missing combat inputs.
local modifiers = require('core.modifiers');
local physical = require('core.physical');
local magic = require('core.magic');
local data = require('data.modifiers');
local spells = require('data.spells');

local function me(job, level)
    return { main_job = job or 4, level = level or 75, dex = 50, agi = 50, int = 50, mnd = 50, chr = 50,
        accuracy = 200, offhand_accuracy = 200, ranged_accuracy = 200, evasion = 200, zone = 100,
        buffs = {}, skills = { [36] = spells.MEVA_BY_LEVEL[75] - 25, [35] = 180, [40] = 180 }, extra_accuracy = 0 };
end
local mob = { low = 75, high = 75, row = { levels = { [75] =
    { acc = 200, eva = 200, dex = 50, agi = 50, int = 50, mnd = 50, chr = 50 } } } };
local function read(own)
    own.modifiers = modifiers.read(own);
    return own.modifiers;
end
local function nuke(own, known)
    return magic.readout(own, mob, { known_inputs = known,
        schools = { elemental = { on = true, spell = 'tier1' } } })[1];
end
local function item_named(name)
    for id, row in pairs(data.items) do if (row.name == name) then return id; end end
end

modifiers.forget();
MOCK.player.equipment = {};
local own = me();
local inputs = read(own);
expect('no equipment means no invented direct crit', inputs.crit, 0);
expect('no equipment means no invented direct magic accuracy', inputs.magic_accuracy, 0);
expect('modern BLM accuracy merits are disabled in the merged era data', data.merits.elemental_magic_accuracy, nil);
expect('modern RDM total accuracy merits are disabled', data.merits.magic_accuracy, nil);
expect('modern NIN accuracy merits are disabled', data.merits.nin_magic_accuracy, nil);
check('Gravity includes the loaded era evasion penalty', data.effects[12] and data.effects[12].hit);
check('era Composure does not include modern magic accuracy', not data.effects[419].own_magic);
check('era Focus does not include modern critical rate', not data.effects[59].own_crit);
expect('plain crit stays 5%', physical.readout(own, mob).crit.low, 5);

MOCK.player.equipment = { [0] = 16904, [1] = 16904, [5] = 14505 };
read(own);
expect('main Fudo +3 and Assassin Vest +1 +1 count once; offhand Fudo does not', own.modifiers.crit, 4);
expect('direct gear reaches the real crit calculation', physical.readout(own, mob).crit.low, 9);
own.level = 69; read(own);
expect('gear above your level contributes no direct crit', own.modifiers.crit, 0);
own.level = 75;
MOCK.player.equipment = { [0] = 16686 };
read(own);
expect('Arcanabane latent is not assumed active', own.modifiers.crit, 0);
check('a conditional crit item gives a reason', own.modifiers.crit_uncertain and #own.modifiers.crit_notes > 0);
check('the numeric crit result carries the reason', physical.readout(own, mob).crit.uncertain);

local nashira = item_named('nashira_manteel');
check('source contains Nashira Manteel', nashira ~= nil);
MOCK.player.equipment = { [5] = nashira };
own = me(); read(own);
expect('Nashira direct magic accuracy', own.modifiers.magic_accuracy, 5);
expect('automatic direct accuracy is counted in the formula', nuke(own, true).low, 55);
own.extra_accuracy = 5;
expect('residual extra is added once in known-input mode', nuke(own, true).low, 60);
expect('legacy manual total is not added to automatic gear', nuke(own, false).low, 55);
check('legacy mode explains its manual total', nuke(own, false).notes[1]:find('manual total', 1, true) ~= nil);
expect('the selected stand-in is exposed', nuke(own, true).spell, 'Tier I nuke');
expect('damage spells say full damage chance', nuke(own, true).semantics, 'full');
local sleep = magic.readout(own, mob, { schools = { enfeebling = { on = true, spell = 'sleep' } } })[1];
expect('effects say chance to land', sleep.semantics, 'land');
expect('the effect spell is exposed', sleep.spell, 'Sleep');

MOCK.player.equipment = { [0] = 17554 };
own = me(); own.main_id = 17554; read(own);
expect('elemental staff is not added again as direct gear', own.modifiers.magic_accuracy, 0);
expect('Jupiter staff still contributes its existing +30 once', nuke(own, true).low, 80);
expect('the staff makes thunder the best tied element', nuke(own, true).element, 'thunder');
check('the source-input explanation includes its staff accuracy', table.concat(nuke(own, true).notes, ' '):find(
    'add +30 magic accuracy', 1, true) ~= nil);
expect('legacy mode retains the classic staff contribution once', nuke(own, false).low, 80);
MOCK.player.equipment = { [0] = 18633 };
own.main_id = 18633; read(own);
expect('Chatoyant source bonus covers every element', own.modifiers.staff_accuracy.fire, 30);
expect('Chatoyant affects the automatic formula', nuke(own, true).low, 80);
check('Chatoyant weather potency is named rather than assumed', nuke(own, true).uncertain);
expect('legacy mode adds no newly supported affinity', nuke(own, false).low, 50);
MOCK.player.equipment = { [0] = 18057 };
own.main_id = 18057; read(own);
check('Y scythe preserves its positive and negative source bonuses', own.modifiers.staff_accuracy.dark == 20
    and own.modifiers.staff_accuracy.light == -20);
expect('above-era-level equipment is absent', data.items[26194], nil);
own.level = 50; MOCK.player.equipment = { [0] = 18633 }; read(own);
expect('a level cap under the staff requirement suppresses its bonus', own.modifiers.staff_accuracy.fire, nil);
MOCK.player.equipment = { [10] = 15435 };
own = me(); read(own);
local _, fire_notes, fire_uncertain = modifiers.magic_bonus(own, 'elemental', 'fire', true);
local _, ice_notes, ice_uncertain = modifiers.magic_bonus(own, 'elemental', 'ice', true);
check('Karin Obi marks only its fire weather input as unknown', fire_uncertain and not ice_uncertain
    and #fire_notes > 0 and #ice_notes == 0);
check('normal-cast notes name unobserved weather and magic bursts', table.concat(nuke(own, true).notes, ' '):find(
    'Weather, magic bursts', 1, true) ~= nil);

MOCK.player.equipment = {};
own = me(5); read(own);
check('unobserved RDM merits are named, not guessed', own.modifiers.unknown_merits.fire == true);
check('unknown relevant merit makes the number uncertain', nuke(own, true).uncertain);
local entries = {};
for _, merit in pairs(data.merits) do entries[#entries + 1] = { merit.id, 0 }; end
modifiers.on_merits(MOCK.merit_packet(entries));
local revision = modifiers.version();
modifiers.on_merits(MOCK.merit_packet(entries));
expect('identical merit packets do not invalidate the cache', modifiers.version(), revision);
modifiers.on_merits(MOCK.merit_packet({ { data.merits.fire_magic_accuracy.id, 2 } }));
read(own);
expect('era RDM elemental merits use +3 per observed rank', modifiers.magic_accuracy(own, 'elemental', 'fire', true), 6);
expect('element-specific merit does not apply to another element', modifiers.magic_accuracy(own, 'elemental', 'ice', true), 0);
expect('RDM merit selects the stronger tied fire element', nuke(own, true).element, 'fire');
expect('observed RDM merit improves its selected nuke chance', nuke(own, true).low, 56);
check('observed zero ranks remove uncertainty too', not nuke(own, true).uncertain);
own.level = 74; read(own);
expect('job merits do not apply below 75', modifiers.magic_accuracy(own, 'elemental', 'fire', true), 0);
own = me(4); read(own);
expect('another main job never uses RDM merits', modifiers.magic_accuracy(own, 'elemental', 'fire', true), 0);
own = me(10); own.buffs[data.buffs.troubadour] = true;
modifiers.on_merits(MOCK.merit_packet({ { data.merits.troubadour.id, 1 } })); read(own);
expect('Troubadour follows the pinned formula and merged era merit value', own.modifiers.magic_merits.singing, 320);
own.buffs = {}; read(own);
expect('Troubadour adds nothing without its buff', own.modifiers.magic_merits.singing, nil);
local ok = pcall(modifiers.on_merits, { data = '' });
check('a short merit packet is harmless', ok);
modifiers.forget(); own = me(5); read(own);
check('forget clears merit observations', own.modifiers.unknown_merits.fire == true);

own = me(); own.buffs[data.buffs.mighty_strikes] = true; read(own);
local number = physical.readout(own, mob).crit;
check('your observed Mighty Strikes is 100% at this snapshot', number.low == 100 and number.high == 100
    and not number.uncertain);
own.buffs = { [data.buffs.flash] = true }; read(own);
local numbers = physical.readout(own, mob);
check('Flash widens melee to its floor instead of inventing power', numbers.hit.low == 20 and numbers.hit.high == 75
    and numbers.hit.uncertain);
check('Flash widens ranged to its lower floor', numbers.ranged.low == 5 and numbers.ranged.high == 75
    and numbers.ranged.uncertain);
check('Flash does not alter critical chance', not numbers.crit.uncertain and numbers.crit.low == 5);

own = me(); read(own);
mob.effects = { { effect = data.buffs.mighty_strikes } };
numbers = physical.readout(own, mob);
check('enemy Mighty Strikes uses 100% but exposes the estimated end', numbers.crittaken.low == 100
    and numbers.crittaken.high == 100 and numbers.crittaken.uncertain and #numbers.crittaken.notes > 0);
check('era Mighty Strikes does not add a job-point accuracy warning', not numbers.evade.uncertain);
mob.effects = { { effect = 129 } }; -- Frost lowers AGI, which changes EVA and the DEX/AGI crit comparison.
numbers = physical.readout(own, mob);
check('Frost warns about hit and crit without fabricating a stat reduction', numbers.hit.uncertain
    and numbers.crit.uncertain and numbers.hit.low == 75 and numbers.crit.low == 5);
mob.effects = { { effect = 12 } }; -- Gravity's EVA penalty is restored by the era override.
numbers = physical.readout(own, mob);
check('observed Gravity marks only hit rates uncertain', numbers.hit.uncertain and numbers.ranged.uncertain
    and not numbers.crit.uncertain and not numbers.evade.uncertain);
mob.effects = { { effect = 5 } }; -- Blindness.
numbers = physical.readout(own, mob);
check('Blindness warns only on the affected enemy accuracy calculation', numbers.evade.uncertain
    and not numbers.hit.uncertain and not numbers.crit.uncertain);
mob.effects = { { effect = data.buffs.flash } };
numbers = physical.readout(own, mob);
check('enemy Flash exposes its evasion range', numbers.evade.low == 25 and numbers.evade.high == 80
    and numbers.evade.uncertain);
local pet = { name = 'pet', kind = 'jug', low = 75, high = 75, accuracy = 200, evasion = 200 };
local pet_numbers = physical.pet_readout(pet, mob);
check('enemy Flash exposes the same range for pet evasion', pet_numbers.evade.low == 25
    and pet_numbers.evade.high == 80 and pet_numbers.evade.uncertain and not pet_numbers.hit.uncertain);
mob.effects = { { effect = 129 } };
pet_numbers = physical.pet_readout(pet, mob);
check('observed AGI changes also mark the pet hit baseline uncertain', pet_numbers.hit.uncertain
    and pet_numbers.hit.low == 75 and not pet_numbers.evade.uncertain);
mob.effects = { { effect = 217 } };
check('unknown Threnody power marks magic uncertain', nuke(own, true).uncertain);
mob.effects = nil;
check('removing the observed effect removes its warning', not nuke(own, true).uncertain);
own.buffs[data.buffs.food] = true; read(own);
check('unknown food power is not guessed', own.modifiers.magic_accuracy == 0 and nuke(own, true).uncertain);
expect('food stat bonuses already in memory are not re-added', nuke(own, true).low, 50);
check('manual-total mode leaves food accounting to that total', not nuke(own, false).uncertain);

return MOCK.report();
