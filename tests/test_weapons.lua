local weapons = require('core.weapons');

check('neutral damage types leave Weapons blank', weapons.readout({}) == nil);
local out = weapons.readout({ weapon_dmg = { slashing = -50, piercing = 25, blunt = 12.5, hand_to_hand = -25 } });
check('four damage types remain separate', #out.weak == 2 and #out.resists == 2);
check('type order is stable within each group', out.weak[1].kind == 'piercing' and out.weak[2].kind == 'blunt'
    and out.resists[1].kind == 'slashing' and out.resists[2].kind == 'hand_to_hand');
expect('the modifier remains a signed change', out.resists[1].percent, -50);
expect('fractional modifiers survive', out.weak[2].percent, 12.5);
check('baseline rows have no script mark', not out.scripted);
out = weapons.readout({ weapon_dmg = { piercing = 25 }, weapon_guard = { physical = -50, ranged = -25 } });
expect('generic reduction is not folded into the type', out.weak[1].percent, 25);
check('different melee and ranged reductions stay in notes', out.notes[1]:find('-50%%') and out.notes[2]:find('-25%%'));
out = weapons.readout({ weapon_guard = { physical = -50, absorb = 20, nullify_physical = 10, nullify_ranged = 30 } });
check('generic-only data is available as four separate visible entries', #out.weak == 0 and #out.resists == 0
    and #out.general == 4 and out.general[1].kind == 'physical' and out.general[1].signed
    and out.general[2].kind == 'absorb' and not out.general[2].signed and #out.notes == 6);
check('shared weapon context excludes repeated general amounts', #out.context_notes == 2
    and not table.concat(out.context_notes, ' '):find('50%%') and out.context_notes[1]:find('Source baseline', 1, true));
check('zero general modifiers do not create a damage line', weapons.readout({ weapon_guard = {
    physical = 0, ranged = 0, absorb = 0, nullify_physical = 0, nullify_ranged = 0 } }) == nil);
out = weapons.readout({ weapon_dmg = { blunt = 50 }, flags = { scripted_stats = true, scripted_elements = true } });
check('unrelated scripts do not mark weapon damage', not out.scripted);
out = weapons.readout({ weapon_dmg = { blunt = 50 }, flags = { scripted_weapons = true } });
check('weapon-changing scripts keep the uncertainty marker', out.scripted);
out = weapons.readout({ flags = { scripted_weapons = true } });
check('a neutral scripted baseline still exposes the changing damage', out and out.scripted
    and #out.weak == 0 and #out.resists == 0 and #out.notes > 0);
local varying = { levels = { [20] = { weapon_dmg = { slashing = 10 } }, [21] = { weapon_dmg = { slashing = 20 } } } };
expect('a known level uses its own modifier', weapons.readout(varying, 21).weak[1].percent, 20);
out = weapons.readout(varying);
check('an unknown level does not choose one exact modifier', out.uncertain and #out.weak == 0 and #out.resists == 0);
check('the unknown level explains the missing value', out.notes[1]:find('exact level is unknown', 1, true));
check('shared weapon context retains unknown-level explanations', out.context_notes[1]:find('exact level is unknown', 1, true));
local sparse = { levels = { [20] = {}, [21] = { weapon_dmg = { slashing = 20 } } } };
check('a neutral level does not inherit another level', weapons.readout(sparse, 20) == nil);
out = weapons.readout({ weapon_dmg = { blunt = 10 }, levels = { [20] = {}, [21] = { weapon_guard = { ranged = -50 } } } });
check('unknown generic reduction keeps a common type value', out.uncertain and out.weak[1].percent == 10);

local function spawn(zone, index)
    for _, row in ipairs(require('data.zones.' .. zone).monsters) do
        for _, id in ipairs(row.ids) do
            if (id == index) then return row; end
        end
    end
end

local bones = weapons.readout(spawn(100, 224));
check('West Ronfaure bones keep distinct Blunt and hand-to-hand weaknesses', bones.weak[1].kind == 'blunt'
    and bones.weak[1].percent == 25 and bones.weak[2].kind == 'hand_to_hand' and bones.weak[2].percent == 12.5);
check('the same bones resist slashing and piercing differently', bones.resists[1].percent == -12.5
    and bones.resists[2].percent == -50);
local ooze = weapons.readout(spawn(1, 11));
check('Phanauet Ooze resists all four types at the source amounts', #ooze.weak == 0 and #ooze.resists == 4
    and ooze.resists[1].percent == -50 and ooze.resists[2].percent == -50
    and ooze.resists[3].percent == -75 and ooze.resists[4].percent == -75);
local armory = weapons.readout(spawn(38, 168));
check('Evil Armory retains its baseline cuts and script warning', armory.scripted and #armory.resists == 4
    and armory.resists[1].percent == -50);
local uragnite = weapons.readout(spawn(3, 9));
check('neutral stored Uragnite types still expose its changing shell', uragnite and uragnite.scripted
    and #uragnite.weak == 0 and #uragnite.resists == 0);
local forger = weapons.readout(spawn(108, 415));
check('Forger exposes its general-only melee and ranged vulnerability', #forger.weak == 0 and #forger.resists == 0
    and #forger.general == 2 and forger.general[1].percent == 75 and forger.general[2].percent == 75);
local zhagtegg = weapons.readout(spawn(104, 214));
check('Meteormauler Zhagtegg exposes both general reductions', #zhagtegg.general == 2
    and zhagtegg.general[1].percent == -50 and zhagtegg.general[2].percent == -50);

return MOCK.report();
