-- Tests the pet part. That covers which pet gets it, its level the way the server sets it, its hit rate and
-- how often the monster misses it, when /checkparam <pet> goes and which reply lines it hides, a second
-- /check, zoning and a pet that's gone, the pet line itself and the sample. It uses the made-up zone in
-- fixtures\ and the real data\pets.lua.
local physical = require('core.physical');
local printout = require('core.printout');
local defaults = require('ui.defaults');
local pet      = require('core.pet');

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.entities[1] = { Name = 'Fixture Goblin' };
MOCK.entities[2] = { Name = 'Fixture Goblin' };
MOCK.entities[5] = { Name = 'Fixture Rabbit' };
MOCK.entities[40] = { Name = 'Fixture Tinkerer' };
MOCK.entities[400] = { Name = 'Fixture NM' };
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';

-- This file is about the pet part, so the aggro and links parts stay out of its lines until a test needs them.
s.printout.parts.aggro.on = false;
s.printout.parts.links.on = false;
s.printout.parts.pet.on = true;

local WAR, BST, DRG, SMN, PUP = 1, 9, 14, 15, 18;
local function jobs(main, level, sub, sub_level)
    MOCK.player.main_job, MOCK.player.main_level = main, level;
    MOCK.player.sub_job, MOCK.player.sub_level = sub or 0, sub_level or 0;
end
local function sent()
    return #MOCK.commands;
end
local function command(i)
    return MOCK.commands[i] and MOCK.commands[i].command;
end
local function since(n)
    return table.concat(MOCK.printed_since(n), ' / ');
end
-- Your /check of the monster at `index` at `level`, con 4 unless a test says otherwise.
local function check_at(index, level, con, message)
    MOCK.packet(MOCK.check_packet(index, level, con or 4, message or 174));
end
-- Lets everything still waiting finish, so the next test starts clean.
local function settle()
    MOCK.wait(5);
    MOCK.commands = {};
end

local GOBLIN = '[checkmate] Fixture Goblin (Lv 39)  Even Match';
local GOBLIN_ID = MOCK.mob_id(900, 1);

-- Finding the pet ---------------------------------------------------------------------------------

-- What pet.find makes of your pet for a /check of the goblin, like "wyvern 75" or "jug 73-75".
local function found(target)
    local f = pet.find(target or GOBLIN_ID);
    if (f == nil) then return 'none'; end
    local level = (f.low == nil) and '?' or ((f.low == f.high) and tostring(f.low) or (f.low .. '-' .. f.high));
    return f.kind .. ' ' .. level;
end
-- Your /check of the goblin at 39. The /checkparam <pet> is answered with accuracy 150 and evasion 140
-- once it goes. Returns the pet line, or nil when none printed, and how many /checkparams went.
local function pet_line()
    MOCK.commands = {};
    local n = #MOCK.printed;
    check_at(1, 39);
    MOCK.wait(1.6);
    if (sent() > 0) then MOCK.pet_reply(150, 140); end
    MOCK.wait(1.6);
    local line;
    for _, each in ipairs(MOCK.printed_since(n)) do
        if (each:find('Pet: ', 1, true)) then line = each; end
    end
    return line, sent();
end

jobs(DRG, 75);
MOCK.summon('Azure');
expect('a DRG\'s pet is its wyvern, at its level', found(), 'wyvern 75');
MOCK.dismiss();
jobs(PUP, 75);
MOCK.summon('Azure');
expect('a PUP\'s is its automaton', found(), 'automaton 75');
MOCK.dismiss();
jobs(WAR, 75, PUP, 37);
MOCK.summon('Azure');
expect('a PUP support\'s automaton is at the support level', found(), 'automaton 37');
MOCK.dismiss();
jobs(DRG, 75, PUP, 37);
MOCK.summon('Azure');
expect('DRG with PUP support could have either, so it\'s the support level to the main', found(), 'wyvern 37-75');
MOCK.dismiss();
jobs(BST, 75);
MOCK.summon('CourierCarrie');
expect('a BST\'s pet with a jug\'s name is a jug pet', found(), 'jug 73-75');
MOCK.dismiss();
MOCK.charm(2, 'Fixture Goblin');
expect('and a monster it charmed is charmed, at the levels it spawns at', found(), 'charmed 38-40');
expect('checking your own charmed pet gives no pet part', found(MOCK.mob_id(900, 2)), 'none');
MOCK.dismiss();

-- A summoner's avatar or spirit never gets the part, and nothing is sent for it.
local AVATARS = {
    { 'SMN with Ifrit', SMN, 75, 0, 0, 'Ifrit' },
    { 'DRG with SMN support and Carbuncle', DRG, 75, SMN, 37, 'Carbuncle' },
    { 'PUP with SMN support and Ifrit', PUP, 75, SMN, 37, 'Ifrit' },
    { 'SMN with PUP support and Garuda', SMN, 75, PUP, 37, 'Garuda' },
    { 'DRG with SMN support and a wyvern named Titan', DRG, 75, SMN, 37, 'Titan' },
};
for _, case in ipairs(AVATARS) do
    jobs(case[2], case[3], case[4], case[5]);
    MOCK.summon(case[6]);
    local line, count = pet_line();
    check(case[1] .. ': no pet part and nothing sent', found() == 'none' and line == nil and count == 0,
        found() .. ', ' .. tostring(line) .. ', ' .. count .. ' sent');
    MOCK.dismiss();
end
jobs(DRG, 75, WAR, 37);
MOCK.summon('Titan');
expect('without SMN, a wyvern named Titan is a wyvern', found(), 'wyvern 75');
MOCK.dismiss();
jobs(BST, 75, DRG, 37);
MOCK.summon('Azure');
expect('BST main with a pet that\'s not a jug or a monster gets no part', found(), 'none');
MOCK.dismiss();
jobs(DRG, 75);
expect('no pet out, no part', found(), 'none');
MOCK.summon('Azure');
MOCK.entities[MOCK.player.pet_index].HPPercent = 0;
expect('a pet at 0 HP, no part', found(), 'none');
MOCK.dismiss();
local line, count = pet_line();
check('and nothing is sent without a pet', line == nil and count == 0, tostring(line));

-- Levels ------------------------------------------------------------------------------------------

-- A jug pet is its highest level less 0 to 2, or 0 to 1 with Monster Gloves on when it came out.
jobs(BST, 75);
MOCK.summon('CourierCarrie');
expect('BST75 with CourierCarrie, 73-75', found(), 'jug 73-75');
MOCK.dismiss();
MOCK.player.equipment[6] = 15110;
MOCK.summon('CourierCarrie');
expect('Monster Gloves on when it came out, 74-75', found(), 'jug 74-75');
MOCK.player.equipment[6] = nil;
expect('and still 74-75 with them off at the /check', found(), 'jug 74-75');
MOCK.dismiss();
MOCK.summon('CourierCarrie');
MOCK.player.equipment[6] = 15110;
expect('on at the /check only, 73-75', found(), 'jug 73-75');
MOCK.player.equipment[6] = nil;
MOCK.dismiss();
MOCK.player.equipment[6] = 14917;
MOCK.summon('CourierCarrie');
MOCK.player.equipment[6] = nil;
expect('Monster Gloves +1 too', found(), 'jug 74-75');
MOCK.dismiss();
MOCK.summon('CourierCarrie');
expect('CourierCarrie through a /check', pet_line(), '[checkmate] Pet: CourierCarrie (Lv 73-75)  Hit: 95%  Evade: 18%');
MOCK.dismiss();

-- Beast Affinity adds 2 levels a merit, up to 3, to a 75 BST's jug pet. Until a merit list comes in it can
-- be any of them.
MOCK.summon('FunguarFamiliar');
expect('FunguarFamiliar before any merit list, 63-71', found(), 'jug 63-71');
MOCK.packet(MOCK.merit_packet({ { 2564, 2 } }));
expect('a merit list cannot recover the rank of a pet already out', found(), 'jug 63-71');
MOCK.dismiss();
MOCK.summon('FunguarFamiliar');
expect('Beast Affinity 2, 67-69', found(), 'jug 67-69');
MOCK.packet(MOCK.merit_packet({ { 2564, 0 } }));
expect('changing merits leaves an existing jug at its summon rank', found(), 'jug 67-69');
MOCK.dismiss();
MOCK.summon('FunguarFamiliar');
expect('Beast Affinity 0, 63-65', found(), 'jug 63-65');
local entries = {};
for i = 1, 61 do entries[i] = { 0x40 + i * 64, i % 4 }; end
entries[31] = { 2564, 1 };
MOCK.packet(MOCK.merit_packet(entries));
expect('adding a merit also leaves an existing jug alone', found(), 'jug 63-65');
MOCK.dismiss();
MOCK.summon('FunguarFamiliar');
expect('a whole merit list with Beast Affinity 1 in the middle, 65-67', found(), 'jug 65-67');
MOCK.packet(MOCK.merit_packet({ { 2563, 3 } }));
expect('a merit list without it leaves it alone', found(), 'jug 65-67');
jobs(PUP, 75, BST, 37);
expect('BST support gets no merits', found(), 'jug 63-65');
MOCK.zone_in(900);
jobs(BST, 75);
expect('without the returning pet update, zoning leaves its summon unknown', found(), 'jug 1-71');
MOCK.dismiss();
jobs(PUP, 75, BST, 37);
MOCK.summon('CourierCarrie');
expect('PUP75/BST37 with CourierCarrie, 73-75', found(), 'jug 73-75');
MOCK.dismiss();
jobs(BST, 50);
MOCK.summon('CourierCarrie');
expect('BST synced to 50, 48-50', found(), 'jug 48-50');
jobs(BST, 75);
expect('and still 48-50 when the sync ends', found(), 'jug 48-50');
MOCK.dismiss();
jobs(BST, 40);
MOCK.summon('EftFamiliar');
expect('BST40 with EftFamiliar, 38-40', found(), 'jug 38-40');
MOCK.dismiss();

-- Your level changing with the pet out. A wyvern and a jug pet keep the level they came out at, and a level
-- sync caps them. An automaton follows you.
jobs(DRG, 30);
MOCK.summon('Azure');
expect('DRG30 calls its wyvern at 30', found(), 'wyvern 30');
jobs(DRG, 31);
expect('then levels to 31, 30-31', found(), 'wyvern 30-31');
MOCK.dismiss();
MOCK.summon('Azure');
expect('calling it again makes it 31', found(), 'wyvern 31');
MOCK.dismiss();
jobs(BST, 30);
MOCK.summon('CourierCarrie');
expect('BST30 calls CourierCarrie, 28-30', found(), 'jug 28-30');
jobs(BST, 31);
expect('then levels to 31, still 28-30', found(), 'jug 28-30');
MOCK.dismiss();
jobs(BST, 75);
MOCK.summon('CourierCarrie');
jobs(BST, 50);
expect('BST75 calls it, then a sync to 50, 48-50', found(), 'jug 48-50');
jobs(BST, 75);
expect('the sync ends, 73-75', found(), 'jug 73-75');
MOCK.dismiss();
jobs(DRG, 75);
MOCK.summon('Azure');
jobs(DRG, 50);
expect('DRG75 calls its wyvern, then a sync to 50, 50', found(), 'wyvern 50');
jobs(DRG, 75);
expect('the sync ends, 75', found(), 'wyvern 75');
MOCK.dismiss();
jobs(PUP, 30);
MOCK.summon('Azure');
jobs(PUP, 31);
expect('PUP30 levels to 31 and the automaton follows', found(), 'automaton 31');
MOCK.dismiss();
jobs(DRG, 31);
MOCK.summon_quietly('Azure');
expect('a wyvern already out has an unknown summon level', found(), 'wyvern 1-31');
jobs(DRG, 32);
expect('a later level-up cannot recover its earlier summon level', found(), 'wyvern 1-32');
MOCK.dismiss();
jobs(DRG, 30);
MOCK.summon('Azure');
jobs(DRG, 31);
MOCK.zone_in(900);
MOCK.pet_sync(MOCK.player.pet_index);
jobs(DRG, 32);
expect('zoning, then the pet update it comes back with, notes your level then', found(), 'wyvern 31-32');
MOCK.wait(1);
MOCK.reads = 0;
MOCK.pet_sync(MOCK.player.pet_index);
expect('a pet update for the same pet reads only your levels and buffs', MOCK.reads, 2);
MOCK.reads = 0;
MOCK.wait(2);
expect('and a quiet frame with a pet out reads nothing', MOCK.reads, 0);
MOCK.dismiss();

-- A level sync's level moves when the sync target levels up or down. That moves you but not your pet, so
-- under a sync checkmate goes by your levels when it first saw the sync with your pet out.
local LEVEL_SYNC = 269;
jobs(DRG, 75);
MOCK.summon('Azure');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(DRG, 50);
expect('DRG75 with its wyvern out, synced to 50, 50', found(), 'wyvern 50');
jobs(DRG, 51);
expect('the sync target levels to 51 and the wyvern stays 50', found(), 'wyvern 50');
jobs(DRG, 49);
expect('or drops to 49, still 50', found(), 'wyvern 50');
MOCK.player.buffs = {};
jobs(DRG, 75);
expect('the sync ends, 75', found(), 'wyvern 75');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(DRG, 50);
MOCK.pet_sync(MOCK.player.pet_index);
jobs(DRG, 51);
expect('a pet update sees the sync too, before any /check', found(), 'wyvern 50');
MOCK.dismiss();
MOCK.summon('Azure');
expect('a wyvern called under the sync is at your level then', found(), 'wyvern 51');
jobs(DRG, 52);
expect('and stays there when the sync target levels', found(), 'wyvern 51');
MOCK.player.buffs = {};
jobs(DRG, 60);
expect('the sync ends and sets it again at 60', found(), 'wyvern 60');
jobs(DRG, 61);
expect('a level-up after that, 60-61', found(), 'wyvern 60-61');
MOCK.player.buffs = { LEVEL_SYNC };
MOCK.dismiss();
jobs(PUP, 50);
MOCK.summon('Azure');
expect('PUP synced at 50 calls its automaton, 50', found(), 'automaton 50');
jobs(PUP, 51);
expect('the sync target levels to 51, 50-51, since a level-up of your own would move it', found(), 'automaton 50-51');
MOCK.dismiss();
jobs(WAR, 50, PUP, 25);
MOCK.summon('Azure');
jobs(WAR, 52, PUP, 26);
expect('the same with PUP support, 25-26', found(), 'automaton 25-26');
MOCK.dismiss();
MOCK.player.buffs = {};
jobs(BST, 75);
MOCK.summon('CourierCarrie');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 50);
expect('BST75 with CourierCarrie, synced to 50, 48-50', found(), 'jug 48-50');
jobs(BST, 51);
expect('the sync target levels to 51, still 48-50', found(), 'jug 48-50');
MOCK.player.buffs = {};
MOCK.dismiss();

-- A sync only sets your pet again when it moves your main level. Once the sync target has caught up to your
-- own level, the sync ending doesn't move you, so your pet stays where the sync put it. A sync takes 30
-- seconds to wear off once it's called off, so its buff goes at least that long after the target levels.
jobs(DRG, 43);
MOCK.summon('Azure');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(DRG, 40);
expect('DRG43 calls its wyvern, then a sync to 40, 40', found(), 'wyvern 40');
jobs(DRG, 43);
expect('the sync target levels past 43 and you\'re back at 43, still 40', found(), 'wyvern 40');
MOCK.wait(30);
MOCK.player.buffs = {};
expect('the sync ends without moving you, still 40', found(), 'wyvern 40');
-- 150 + 4 against the goblin's 143 is 80%, and its 154 against 140 is 82%.
expect('and the pet line goes by 40', pet_line(), '[checkmate] Pet: Azure (Lv 40)  Hit: 80%  Evade: 18%');
jobs(DRG, 44);
expect('a level-up after that, still 40', found(), 'wyvern 40');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(DRG, 38);
expect('a new sync that moves you to 38 sets it again, 38', found(), 'wyvern 38');
MOCK.player.buffs = {};
MOCK.dismiss();
MOCK.packet(MOCK.merit_packet({ { 2564, 2 } }));
jobs(BST, 75);
MOCK.summon('EftFamiliar');
expect('BST75 with Beast Affinity 2 calls EftFamiliar, 47-49', found(), 'jug 47-49');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 73);
expect('a sync to 73 picks it again without the merits, 43-45', found(), 'jug 43-45');
jobs(BST, 75);
expect('the sync target reaches 75, still 43-45', found(), 'jug 43-45');
MOCK.wait(30);
MOCK.player.buffs = {};
expect('and the sync ends without moving you, still 43-45', found(), 'jug 43-45');
MOCK.zone_in(900);
MOCK.dismiss();
MOCK.player.buffs = { LEVEL_SYNC };
jobs(PUP, 43);
MOCK.summon('Azure');
jobs(PUP, 45);
expect('PUP45 synced to 43 calls its automaton, then the sync target levels past 45, 43-45', found(), 'automaton 43-45');
MOCK.wait(30);
MOCK.player.buffs = {};
expect('the sync ends without moving you, still 43-45', found(), 'automaton 43-45');
MOCK.dismiss();

-- A sync ending can send your new level a moment before it takes the buff off, so a pet update can see you
-- back at your own level with the buff still on. The buff going right after that is the sync ending, even
-- when your next /check is a minute later.
local function split_sync_end(main, own)
    jobs(main, own);
    MOCK.pet_sync(MOCK.player.pet_index);
    MOCK.frame();
    MOCK.pet_sync(MOCK.player.pet_index);
    MOCK.wait(0.5);
    MOCK.player.buffs = {};
    MOCK.wait(60);
    return found();
end
jobs(DRG, 75);
MOCK.summon('Azure');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(DRG, 50);
expect('DRG75 with its wyvern out, synced to 50, 50', found(), 'wyvern 50');
expect('your level back at 75 before the buff goes, 75', split_sync_end(DRG, 75), 'wyvern 75');
-- 150 + 4 * 36 against the goblin's 143 is over the 95 cap.
expect('and the pet line goes by 75', pet_line(), '[checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(DRG, 50);
expect('synced to 50 again, 50', found(), 'wyvern 50');
jobs(DRG, 75);
MOCK.pet_sync(MOCK.player.pet_index);
MOCK.player.buffs = {};
expect('the same sync end with the next /check right after it, 75', found(), 'wyvern 75');
MOCK.dismiss();
jobs(BST, 75);
MOCK.summon('CourierCarrie');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 50);
expect('BST75 with CourierCarrie, synced to 50, 48-50', found(), 'jug 48-50');
expect('the same sync end, 73-75', split_sync_end(BST, 75), 'jug 73-75');
MOCK.dismiss();
jobs(PUP, 75);
MOCK.summon('Azure');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(PUP, 50);
expect('PUP75 with its automaton, synced to 50, 50', found(), 'automaton 50');
expect('the same sync end, 75', split_sync_end(PUP, 75), 'automaton 75');
MOCK.dismiss();

-- A level cap ending that moves you up, like leaving a battlefield that capped you at 30, sets a wyvern at
-- your own level again too, and its buff can also go a moment after your level comes in.
local LEVEL_CAP = 143;
MOCK.player.buffs = { LEVEL_CAP };
jobs(DRG, 30);
MOCK.summon('Azure');
expect('DRG75 capped at 30 calls its wyvern, 30', found(), 'wyvern 30');
expect('the cap ends with your level in before the buff goes, 75', split_sync_end(DRG, 75), 'wyvern 75');
MOCK.dismiss();
MOCK.player.buffs = { LEVEL_CAP };
jobs(DRG, 30);
MOCK.summon('Azure');
MOCK.player.buffs = {};
jobs(DRG, 75);
expect('the cap ends before the next /check, 75', found(), 'wyvern 75');
MOCK.dismiss();
-- A new cap can take over from the one holding you without its buff ever going, and that looks the same as a
-- level-up of your own under a cap, so the wyvern is anywhere from where it was to your level now.
MOCK.player.buffs = { LEVEL_CAP };
jobs(DRG, 40);
MOCK.summon('Azure');
jobs(DRG, 75);
MOCK.pet_sync(MOCK.player.pet_index);
MOCK.wait(6);
expect('a cap that moves you up with its buff still on, 40-75', found(), 'wyvern 40-75');
MOCK.player.buffs = {};
MOCK.dismiss();

-- Under a sync an automaton never goes down, so the sync's level dropping after a level-up of your own
-- leaves it above you.
MOCK.player.buffs = { LEVEL_SYNC };
jobs(PUP, 38);
MOCK.summon('Azure');
jobs(PUP, 39);
expect('PUP38 under a sync to 39 calls its automaton and levels to 39, 38-39', found(), 'automaton 38-39');
jobs(PUP, 38);
expect('the sync target drops to 38, still 38-39', found(), 'automaton 38-39');
MOCK.player.buffs = {};
MOCK.dismiss();

-- A level sync or level cap picks a jug pet's level again with the gear you have on then, so once one does,
-- the Monster Gloves you called it with stop counting. A sync's level moving under you doesn't.
jobs(BST, 75);
MOCK.player.equipment[6] = 15110;
MOCK.summon('CourierCarrie');
MOCK.player.buffs = { LEVEL_SYNC };
expect('BST75 calls CourierCarrie with Monster Gloves on, then a sync to 75 that doesn\'t move you, 74-75', found(),
    'jug 74-75');
jobs(BST, 74);
expect('the sync target drops to 74, still 74-75', found(), 'jug 74-75');
jobs(BST, 75);
expect('and gets back to 75, still 74-75', found(), 'jug 74-75');
MOCK.wait(30);
MOCK.player.buffs = {};
expect('and the sync ends without moving you, still 74-75', found(), 'jug 74-75');
MOCK.player.equipment[6] = nil;
MOCK.dismiss();
jobs(BST, 75);
MOCK.player.equipment[6] = 15110;
MOCK.summon('CourierCarrie');
MOCK.player.equipment[6] = nil;
expect('BST75 calls CourierCarrie with Monster Gloves on, then takes them off, 74-75', found(), 'jug 74-75');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 50);
expect('synced to 50 with them off, 48-50', found(), 'jug 48-50');
MOCK.player.buffs = {};
jobs(BST, 75);
expect('and 73-75 once the sync ends', found(), 'jug 73-75');
MOCK.dismiss();

-- Gear only counts at its own level, so Monster Gloves don't while a level sync holds you under 75.
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 40);
MOCK.player.equipment[6] = 15110;
MOCK.summon('SheepFamiliar');
expect('BST75 synced to 40 calls SheepFamiliar with Monster Gloves on, 33-35', found(), 'jug 33-35');
MOCK.player.equipment[6] = nil;
MOCK.player.buffs = {};
jobs(BST, 75);
expect('and still 33-35 once the gloves come off and the sync ends', found(), 'jug 33-35');
MOCK.dismiss();

-- Summon snapshots and the original jug cap ---------------------------------------------------------

jobs(BST, 50);
MOCK.summon('CourierCarrie');
expect('a level-50 summon starts at48-50', found(), 'jug 48-50');
jobs(BST, 60);
expect('leveling does not raise the original jug cap', found(), 'jug 48-50');
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 40);
expect('an observed sync rolls under that original cap', found(), 'jug 38-40');
MOCK.player.buffs = {};
jobs(BST, 60);
expect('ending the sync cannot raise the original48-50 spawn cap', found(), 'jug 48-50');
MOCK.dismiss();

jobs(BST, 75);
MOCK.packet(MOCK.merit_packet({ { 2564, 0 } }));
MOCK.summon('FunguarFamiliar');
expect('zero-rank original spawn is63-65', found(), 'jug 63-65');
MOCK.packet(MOCK.merit_packet({ { 2564, 3 } }));
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 50);
found();
MOCK.player.buffs = {};
jobs(BST, 75);
expect('new merits at a sync reset cannot raise the original spawn cap', found(), 'jug 63-65');
MOCK.dismiss();
MOCK.summon('FunguarFamiliar');
expect('a new summon uses the newly observed ranks', found(), 'jug 69-71');
MOCK.packet(MOCK.merit_packet({ { 2564, 0 } }));
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 50);
found();
MOCK.player.buffs = {};
jobs(BST, 75);
expect('a reset with fewer merits can lower the original pet', found(), 'jug 63-65');
MOCK.dismiss();

MOCK.player.equipment[6] = 15110;
MOCK.summon_quietly('FunguarFamiliar');
pet.on_load();
expect('loading beside a jug cannot recover its summon level or gear', found(), 'jug 1-71');
MOCK.packet(MOCK.merit_packet({ { 2564, 3 } }));
MOCK.pet_sync(MOCK.player.pet_index);
expect('later merits and a routine pet update do not invent its original rank', found(), 'jug 1-71');
check('the preexisting jug reports its missing summon observation', pet.find(GOBLIN_ID).summon_known == false);
MOCK.player.equipment[6] = nil;
MOCK.player.buffs = { LEVEL_SYNC };
jobs(BST, 50);
expect('a known reset still cannot recover an unknown original jug cap', found(), 'jug 1-50');
MOCK.player.buffs = {};
jobs(BST, 75);
expect('ending that sync keeps the original unknown lower bound', found(), 'jug 1-71');
check('a jug reset does not claim to recover its original summon', pet.find(GOBLIN_ID).summon_known == false);
MOCK.dismiss();

jobs(DRG, 50);
MOCK.player.buffs = { LEVEL_SYNC };
MOCK.summon_quietly('Azure');
pet.on_load();
expect('a wyvern loaded mid-sync may predate a falling sync level', found(), 'wyvern 1-75');
jobs(DRG, 49);
expect('another falling sync level cannot narrow an unknown wyvern', found(), 'wyvern 1-75');
MOCK.player.buffs = {};
jobs(DRG, 75);
expect('an observed sync end recalculates a wyvern at the new level', found(), 'wyvern 75');
check('the wyvern is known after that recalculation', pet.find(GOBLIN_ID).summon_known == true);
MOCK.dismiss();

jobs(PUP, 50);
MOCK.player.buffs = { LEVEL_SYNC };
MOCK.summon_quietly('Azure');
pet.on_load();
expect('an automaton loaded under an existing sync also keeps a safe upper bound', found(), 'automaton 1-75');
MOCK.dismiss();
jobs(WAR, 50, PUP, 25);
MOCK.summon_quietly('Azure');
pet.on_load();
expect('a support-job automaton has the era support-level upper bound', found(), 'automaton 1-37');
MOCK.dismiss();
jobs(BST, 50);
MOCK.summon_quietly('FunguarFamiliar');
pet.on_load();
expect('a preexisting synced jug retains its source jug cap plus possible merits', found(), 'jug 1-71');
MOCK.player.buffs = {};
MOCK.dismiss();

-- Math --------------------------------------------------------------------------------------------

local fixture = dofile(FIXTURES_PATH .. 'data\\zones\\900.lua');
local rows = {};
for _, row in ipairs(fixture.monsters) do rows[row.name] = row; end
local function range(r)
    if (r == nil) then return 'unknown'; end
    return (r.low == r.high) and tostring(r.low) or (r.low .. '-' .. r.high);
end
local function numbers(p, mob, accuracy, evasion)
    p.accuracy, p.evasion = accuracy, evasion;
    local r = physical.pet_readout(p, mob);
    return range(r.hit) .. ' / ' .. range(r.evade);
end
-- Fixture Goblin at 39 has accuracy 154 and evasion 143, at 38 150 and 140, and at 40 158 and 146.
local goblin = { row = rows['Fixture Goblin'], low = 39, high = 39 };
local function wyvern(level) return { kind = 'wyvern', name = 'Azure', low = level, high = level }; end
expect('a jug pet at 38-40 with accuracy 150 and evasion 140 against the goblin at 39',
    numbers({ kind = 'jug', name = 'EftFamiliar', low = 38, high = 40 }, goblin, 150, 140), '78-80 / 16-18');
expect('a wyvern at 39 with 160 and 150', numbers(wyvern(39), goblin, 160, 150), '83 / 23');
expect('the same wyvern at 35 loses no accuracy, and the goblin gains 16', numbers(wyvern(35), goblin, 160, 150), '83 / 15');
expect('a pet over the monster gains 4 accuracy a level', numbers(wyvern(41), goblin, 150, 200),
    physical.hit_percent(158, 143) .. ' / ' .. (100 - physical.hit_percent(154, 200)));
expect('and one under it loses none', numbers(wyvern(30), goblin, 150, 200),
    physical.hit_percent(150, 143) .. ' / ' .. (100 - physical.hit_percent(154 + 36, 200)));
expect('95 at most and 20 at least', numbers(wyvern(75), goblin, 400, 0), '95 / 5');
expect('so evade is 80 at most', numbers(wyvern(10), goblin, 0, 400), '20 / 80');
local unknown_mob = numbers(wyvern(39), { low = 39, high = 39 }, 160, 150);
check('a monster with no row uses the typical values, as a range', unknown_mob:find('^%d+%-%d+ / %d+%-%d+$') ~= nil, unknown_mob);
expect('a charmed pet uses its own row at its level', numbers({ kind = 'charmed', low = 40, high = 40,
    row = rows['Fixture Goblin'] }, goblin), '84 / 21');
local charmed_bands = numbers({ kind = 'charmed', low = 39, high = 39 }, goblin);
check('and the typical values without one', charmed_bands:find('^%d+%-%d+ / %d+%-%d+$') ~= nil, charmed_bands);
expect('a charmed pet with no level is unknown', numbers({ kind = 'charmed' }, goblin), 'unknown / unknown');
expect('ranges over the jug\'s levels and the monster\'s', numbers({ kind = 'jug', low = 38, high = 40 },
    { row = rows['Fixture Goblin'], low = 38, high = 40 }, 150, 140), '77-84 / 12-20');
expect('a missing evasion is unknown and the hit rate stays', numbers(wyvern(39), goblin, 160, nil), '83 / unknown');
expect('a monster with no level is unknown', numbers(wyvern(75), { low = nil }, 160, 150), 'unknown / unknown');

-- Through a /check, your wyvern at 75 against the goblin at 39: 150 + 4 * 36 against 143 is over the 95 cap,
-- and 154 against 140 hits 82% of the time.
jobs(DRG, 75);
MOCK.summon('Azure');
expect('your wyvern through a /check', pet_line(), '[checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
MOCK.commands = {};
local n = #MOCK.printed;
check_at(400, 0, nil, 249);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.wait(0.1);
check('a monster whose scripts change its numbers gets the ?', since(n):find('Pet: Azure (Lv 75)  Hit: 95%?  Evade: 5%?', 1,
    true) ~= nil, since(n));
settle();

-- Timing and hiding -------------------------------------------------------------------------------

-- With only the pet part waiting, /checkparam <pet> goes a second and a half after your /check comes back.
n = #MOCK.printed;
check_at(1, 39);
check('nothing prints inside the packet', #MOCK.printed == n);
MOCK.frame();
expect('the /check line prints at once', since(n), GOBLIN);
MOCK.wait(1.4);
expect('nothing sent before a second and a half', sent(), 0);
MOCK.wait(0.2);
check('/checkparam <pet> as if typed, after a second and a half', sent() == 1 and command(1) == '/checkparam <pet>'
    and MOCK.commands[1].mode == 1, command(1));
n = #MOCK.printed;
local hidden = 0;
for i, e in ipairs(MOCK.pet_reply_packets(150, 140)) do
    if (MOCK.packet(e).blocked) then hidden = hidden + 1; end
    if (i < 5) then check('still waiting after reply line ' .. i, #MOCK.printed == n); end
end
expect('all five reply lines hidden', hidden, 5);
check('nothing prints inside the reply packets either', #MOCK.printed == n);
MOCK.frame();
expect('the pet line prints on the frame after its last line', since(n), '[checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
expect('a /checkparam <pet> you type with nothing waiting shows', MOCK.pet_reply(150, 140), 0);
settle();

-- With hit and evade on too, <me> goes first and <pet> a second and a half after it went out, not after its
-- reply came back.
s.printout.parts.hit.on, s.printout.parts.evade.on = true, true;
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
check('<me> goes first', sent() == 1 and command(1) == '/checkparam <me>', command(1));
MOCK.wait(0.4);
expect('its six lines are hidden', MOCK.reply(300, 250), 6);
MOCK.wait(0.9);
expect('<pet> waits for a second and a half after <me> went out', sent(), 1);
MOCK.wait(0.2);
check('then goes', sent() == 2 and command(2) == '/checkparam <pet>', command(2));
expect('and its five are hidden', MOCK.pet_reply(150, 140), 5);
MOCK.frame();
expect('the hit line, then the pet line under it', since(n), GOBLIN .. ' / [checkmate] Hit: 95%  Evade: 73% / '
    .. '[checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
settle();

-- The pet's reply before <me>'s. The pet line under the hit line waits for it.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(3.1);
expect('both sent', sent(), 2);
expect('the pet reply first, hidden', MOCK.pet_reply(150, 140), 5);
MOCK.frame();
expect('and its line waits under the hit line', since(n), GOBLIN);
expect('then <me>\'s', MOCK.reply(300, 250), 6);
MOCK.frame();
expect('and both lines print', since(n), GOBLIN .. ' / [checkmate] Hit: 95%  Evade: 73% / [checkmate] Pet: Azure (Lv 75)  '
    .. 'Hit: 95%  Evade: 18%');
settle();

-- No <me> reply, and the pet's came. The pet line prints with the hit line once <me> times out.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(3.1);
MOCK.pet_reply(150, 140);
MOCK.wait(1.3);
expect('nothing while <me> is still out', since(n), GOBLIN);
MOCK.wait(0.2);
expect('then the hit line with unknown and the pet line with its numbers', since(n), GOBLIN .. ' / [checkmate] Hit: unknown  '
    .. 'Evade: unknown / [checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
settle();
s.printout.parts.hit.on, s.printout.parts.evade.on = false, false;

-- No pet reply within 3 seconds of the send prints unknown, never an old number.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
expect('one send', sent(), 1);
MOCK.wait(2.8);
expect('just the /check line before the timeout', since(n), GOBLIN);
MOCK.wait(0.3);
expect('unknown after it', since(n), GOBLIN .. ' / [checkmate] Pet: Azure (Lv 75)  Hit: unknown  Evade: unknown');
n = #MOCK.printed;
expect('a late reply shows', MOCK.pet_reply(150, 140), 0);
MOCK.frame();
expect('and prints nothing more', since(n), '');
settle();

-- A /checkparam <pet> you type while checkmate's is due is used and shown, and checkmate sends nothing.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.0);
expect('your own reply shows', MOCK.pet_reply(160, 150), 0);
MOCK.frame();
expect('and its numbers print', since(n), GOBLIN .. ' / [checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 23%');
MOCK.wait(3);
expect('and nothing is sent', sent(), 0);
settle();

-- One you type while checkmate's is on its way. The first reply is checkmate's and hidden, the second shows.
check_at(1, 39);
MOCK.wait(1.6);
expect('checkmate\'s goes', sent(), 1);
expect('the first reply is hidden', MOCK.pet_reply(150, 140), 5);
expect('the second shows', MOCK.pet_reply(150, 140), 0);
settle();

-- another addon asks for <me> 0.99 s after a /check. Its reply moves when <pet> can go, to a second and a half
-- after it, and with hit on checkmate uses it and sends no <me>.
s.printout.parts.hit.on, s.printout.parts.evade.on = true, true;
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.0);
expect('another addon\'s reply shows', MOCK.reply(310, 240), 0);
MOCK.wait(1.45);
expect('nothing sent a second and a half after the /check', sent(), 0);
MOCK.wait(0.1);
check('<pet> goes a second and a half after that reply, and no <me>', sent() == 1 and command(1) == '/checkparam <pet>',
    command(1));
MOCK.pet_reply(150, 140);
MOCK.frame();
check('with the hit rate from another addon\'s reply', since(n):find('Hit: 95%  Evade: 68%', 1, true) ~= nil, since(n));
settle();
s.printout.parts.hit.on, s.printout.parts.evade.on = false, false;

-- Another /check or /checkparam going out at 0.99 s, like another addon's with no reply yet, moves <pet> to 2.49 s.
check_at(1, 39);
MOCK.wait(0.99);
MOCK.send_out(0x0DD);
MOCK.wait(1.45);
expect('not at 2.44 s', sent(), 0);
MOCK.wait(0.1);
expect('at 2.49 s', sent(), 1);
MOCK.pet_reply(150, 140);
settle();
s.printout.parts.hit.on = true;
check_at(1, 39);
MOCK.wait(0.99);
MOCK.send_out(0x0DD);
MOCK.wait(1.45);
expect('with hit on, no <me> at 2.44 s', sent(), 0);
MOCK.wait(0.1);
check('and <me> at 2.49 s', sent() == 1 and command(1) == '/checkparam <me>', command(1));
settle();
s.printout.parts.hit.on = false;
MOCK.send_out(0x0DD);
check_at(1, 39);
MOCK.wait(1.4);
expect('one that goes out before the /check comes back changes nothing', sent(), 0);
MOCK.wait(0.2);
expect('so <pet> still goes a second and a half after the /check', sent(), 1);
MOCK.send_out(0x0DE);
check('and another packet going out does nothing', MOCK.pet_reply(150, 140) == 5);
settle();

-- A charmed monster's numbers come from its data, so its line prints with the first ones and nothing is sent.
MOCK.dismiss();
jobs(BST, 75);
check_at(2, 40);
MOCK.wait(2);
MOCK.charm(2, 'Fixture Goblin');
MOCK.commands = {};
n = #MOCK.printed;
check_at(1, 39);
MOCK.frame();
-- Your /check of it said 40. The goblin's 158 + 4 against 143 is 84%, and its 154 against 146 is 79%.
expect('a charmed pet prints at once, at its /check level', since(n), GOBLIN .. ' / [checkmate] Pet: Fixture Goblin (Lv 40)  '
    .. 'Hit: 84%  Evade: 21%');
MOCK.wait(3);
expect('and nothing is sent for it', sent(), 0);
MOCK.dismiss();
-- Someone else kills it, and it comes back at a level of its own, so your /check from before doesn't count.
MOCK.packet(MOCK.message_packet(MOCK.player.server_id + 1, MOCK.mob_id(900, 2), 0, 0, 6, 2));
MOCK.charm(2, 'Fixture Goblin');
expect('charmed again after it died, the levels it spawns at', found(), 'charmed 38-40');
MOCK.dismiss();
jobs(DRG, 75);
MOCK.summon('Azure');
settle();

-- Second /checks, a pet that's gone and zoning ---------------------------------------------------

-- A second /check while <pet> is due. The older one's pet line is left out, and one send goes a second and
-- a half after the newer /check.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(0.5);
check_at(5, 3, 2);
MOCK.wait(1.4);
expect('no send a second and a half after the first /check', sent(), 0);
MOCK.wait(0.2);
expect('one a second and a half after the second', sent(), 1);
expect('its reply hidden', MOCK.pet_reply(150, 140), 5);
MOCK.frame();
-- The rabbit's /check level 3 less its level_mod -2 is 5. 150 + 4 * 70 is far over its 20, and its 22
-- against 140 is under the 20% floor.
local RABBIT = '[checkmate] Fixture Rabbit (Lv 5)  Easy Prey';
expect('the older pet line is left out', since(n), GOBLIN .. ' / ' .. RABBIT .. ' / [checkmate] Pet: Azure (Lv 75)  Hit: 95%  '
    .. 'Evade: 80%');
settle();

-- A second /check with the same pet while it's on its way waits for that same reply.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
check_at(5, 3, 2);
MOCK.wait(1.6);
expect('a second /check while it\'s on its way sends nothing more', sent(), 1);
expect('the reply is still hidden', MOCK.pet_reply(150, 140), 5);
MOCK.frame();
expect('and only the newer pet line prints', since(n), GOBLIN .. ' / ' .. RABBIT .. ' / [checkmate] Pet: Azure (Lv 75)  '
    .. 'Hit: 95%  Evade: 80%');
settle();

-- A different pet by the second /check. The reply on its way is about the old one, so neither gets a pet line.
local old_index = MOCK.player.pet_index;
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
MOCK.dismiss();
MOCK.summon('Azure', 0x701);
check_at(5, 3, 2);
MOCK.wait(1.6);
expect('nothing more is sent', sent(), 1);
expect('the old pet\'s reply is still hidden', MOCK.pet_reply(150, 140, old_index), 5);
MOCK.wait(3.5);
expect('and no pet line prints', since(n), GOBLIN .. ' / ' .. RABBIT);
expect('nothing is sent for the new pet', sent(), 1);
settle();

-- A second /check with no pet out. The older one gives up its pet line.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(0.5);
MOCK.dismiss();
check_at(5, 3, 2);
MOCK.wait(4);
check('the older pet line is left out and nothing is sent', since(n) == GOBLIN .. ' / ' .. RABBIT and sent() == 0,
    since(n));
MOCK.summon('Azure');
settle();

-- A pet dismissed before its /checkparam is due. Nothing is sent and there's no pet line.
n = #MOCK.printed;
check_at(1, 39);
MOCK.frame();
MOCK.dismiss();
MOCK.wait(5);
check('a pet that\'s gone gets nothing sent and no line', sent() == 0 and since(n) == GOBLIN, since(n));
MOCK.summon('Azure');
settle();

-- Zoning while it's on its way. No pet line, and the late reply shows.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
expect('sent before zoning', sent(), 1);
MOCK.zone_in(900);
MOCK.pet_sync(MOCK.player.pet_index);
expect('a late reply after zoning shows', MOCK.pet_reply(150, 140), 0);
MOCK.wait(4);
expect('and no pet line prints after zoning', since(n), GOBLIN);
settle();

-- Hit and pet on, the pet's reply in and <me> still out when a second /check comes. The older pet line has
-- its own numbers, so it prints them.
s.printout.parts.hit.on, s.printout.parts.evade.on = true, true;
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(3.1);
MOCK.pet_reply(150, 140);
MOCK.frame();
check_at(5, 3, 2);
MOCK.frame();
expect('the older pet line prints its numbers, without its hit line', since(n), GOBLIN .. ' / [checkmate] Pet: Azure (Lv 75)  '
    .. 'Hit: 95%  Evade: 18% / ' .. RABBIT);
settle();
s.printout.parts.hit.on, s.printout.parts.evade.on = false, false;

-- The pet's last reply line and a second /check in the same frame. The older pet line still has its numbers.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
check_at(5, 3, 2);
MOCK.frame();
expect('the older pet line prints its numbers', since(n), GOBLIN .. ' / [checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18% / '
    .. RABBIT);
settle();

-- Hit, evade and the pet all on the /check line. A second /check before the first one's <pet> goes out ends
-- its wait for the pet, and its line keeps the hit and evade its own <me> reply gave.
s.printout.parts.hit.on, s.printout.parts.evade.on = true, true;
s.printout.extras_own_line = false;
s.printout.parts.pet.new_line = false;
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
MOCK.reply(300, 250);
MOCK.wait(0.5);
check_at(5, 3, 2);
MOCK.frame();
check('the older /check line keeps its own hit and evade', since(n):find(GOBLIN .. '  Hit: 95%  Evade: 73%  Pet: Azure '
    .. '(Lv 75)  Hit: unknown  Evade: unknown', 1, true) ~= nil, since(n));
settle();
s.printout.parts.hit.on, s.printout.parts.evade.on = false, false;
s.printout.extras_own_line = true;
s.printout.parts.pet.new_line = true;

-- A monster with no row and no level. With only the pet part of the number parts on, the pet line prints
-- at once with unknown numbers, and nothing is sent.
MOCK.entities[99] = { Name = 'Stray Bat' };
n = #MOCK.printed;
check_at(99, 0, nil, 249);
MOCK.wait(3);
check('no row and no level: the pet line at once, unknown, nothing sent', sent() == 0 and since(n) == '[checkmate] Stray Bat '
    .. '(Lv ?)  Impossible to Gauge / [checkmate] Pet: Azure (Lv 75)  Hit: unknown  Evade: unknown', since(n));
settle();
s.printout.parts.crit.on = true;
n = #MOCK.printed;
check_at(99, 0, nil, 249);
MOCK.wait(3);
check('with crit on too, it can\'t be gauged and there\'s no pet line', sent() == 0 and since(n):find('gauged', 1, true)
    ~= nil and since(n):find('Pet:', 1, true) == nil, since(n));
settle();
s.printout.parts.crit.on = false;

-- Pet moved above Aggro. The Aggro line under it prints at once, and the pet line after its reply.
s.printout.parts.aggro.on = true;
s.printout.parts.links.on = true;
s.printout.order = 'difficulty hit evade crit pet aggro magic immunities elements drops';
-- Fixture Tinkerer at 55 has accuracy 210 and evasion 280.
local TINKERER = '[checkmate] Fixture Tinkerer (Lv 55)  Even Match';
local TINKERER_AGGRO = '[checkmate] Aggro: Aggressive  Doesn\'t link';
n = #MOCK.printed;
check_at(40, 55);
MOCK.frame();
expect('the aggro line under the pet line prints at once', since(n), TINKERER .. ' / ' .. TINKERER_AGGRO);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.frame();
expect('and the pet line after its reply', since(n), TINKERER .. ' / ' .. TINKERER_AGGRO .. ' / [checkmate] Pet: Azure (Lv 75)  '
    .. 'Hit: 50%  Evade: 5%');
settle();

-- The pet on the /check line, with the extras on it and the pet's New line off. The Aggro line under it
-- prints at once, and the /check line once the pet's reply is in.
s.printout.extras_own_line = false;
s.printout.parts.pet.new_line = false;
n = #MOCK.printed;
check_at(40, 55);
MOCK.frame();
expect('the Aggro line prints at once', since(n), TINKERER_AGGRO);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.frame();
expect('then the /check line with the pet on it', since(n), TINKERER_AGGRO .. ' / ' .. TINKERER .. '  Pet: Azure (Lv 75)  '
    .. 'Hit: 50%  Evade: 5%');
settle();
n = #MOCK.printed;
check_at(40, 55);
MOCK.wait(0.5);
check_at(1, 39);
MOCK.frame();
check('a /check line that gives up its pet still prints, with unknown, since it stands in for the game\'s',
    since(n):find(TINKERER .. '  Pet: Azure (Lv 75)  Hit: unknown  Evade: unknown', 1, true) ~= nil, since(n));
settle();
s.printout.replace_game_line = false;
n = #MOCK.printed;
check_at(40, 55);
MOCK.wait(0.5);
check_at(1, 39);
MOCK.wait(1.6);
MOCK.pet_reply(150, 140);
MOCK.frame();
expect('with the game\'s line shown it\'s left out', since(n), TINKERER_AGGRO .. ' / [checkmate] Aggro: Not aggressive  '
    .. 'Doesn\'t link / ' .. GOBLIN .. '  Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
settle();
s.printout.replace_game_line = true;
s.printout.extras_own_line = true;
s.printout.parts.pet.new_line = true;
s.printout.order = printout.DEFAULT_ORDER;

-- The pet on the Aggro line, and gone before its /checkparam is due. Nothing is sent, and the Aggro line
-- still prints, with the pet's numbers unknown.
s.printout.parts.pet.new_line = false;
local TINKERER_PET = TINKERER_AGGRO .. '  Pet: Azure (Lv 75)  Hit: unknown  Evade: unknown';
n = #MOCK.printed;
check_at(40, 55);
MOCK.frame();
MOCK.dismiss();
MOCK.wait(5);
check('a pet that\'s gone gets nothing sent, and the line it shares prints with it unknown', sent() == 0
    and since(n) == TINKERER .. ' / ' .. TINKERER_PET, since(n));
MOCK.summon('Azure');
settle();
-- A new pet by your /check while the reply on its way is about the old one. The older /check gave up, so
-- its Aggro line is left out, and the newer one prints with the pet's numbers unknown.
old_index = MOCK.player.pet_index;
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1.6);
MOCK.dismiss();
MOCK.summon('Azure', 0x701);
check_at(40, 55);
MOCK.frame();
expect('a different pet: the newer /check\'s line prints with it unknown', since(n), GOBLIN .. ' / ' .. TINKERER .. ' / '
    .. TINKERER_PET);
expect('and the old pet\'s reply is still hidden', MOCK.pet_reply(150, 140, old_index), 5);
MOCK.dismiss();
MOCK.summon('Azure');
settle();
s.printout.parts.pet.new_line = true;
s.printout.parts.aggro.on = false;
s.printout.parts.links.on = false;

-- A layout change while <pet> is out. Crit ticked a second in puts its line above the pet line, under the
-- lines that already printed, and the pet line still prints once its reply is in.
n = #MOCK.printed;
check_at(1, 39);
MOCK.wait(1);
s.printout.parts.crit.on = true;
MOCK.wait(0.6);
expect('<pet> still goes', sent(), 1);
MOCK.pet_reply(150, 140);
MOCK.frame();
expect('and the pet line prints after a layout change moved it', since(n), GOBLIN
    .. ' / [checkmate] Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
settle();
s.printout.parts.crit.on = false;

-- The tag off.
MOCK.command('/checkmate tag off');
expect('the pet line follows the tag', pet_line(), 'Pet: Azure (Lv 75)  Hit: 95%  Evade: 18%');
MOCK.command('/checkmate tag on');
settle();

-- The pet line --------------------------------------------------------------------------------------

local function color(code) return '\30' .. string.char(code); end
local p = defaults.make();
p.printout.parts.pet.on = true;
local result = { name = 'Fixture Goblin', low = 39, high = 39, con = 4,
    pet = { name = 'Azure', low = 75, high = 75, hit = { low = 95, high = 95 }, evade = { low = 61, high = 61 } } };
local function pet_text()
    local lines, _, _, at = printout.lines(p, result);
    return at and lines[at];
end
expect('the default line down to the bytes in the Phoenix skin', pet_text(), color(106) .. color(106) .. 'Pet'
    .. color(106) .. ': ' .. color(106) .. 'Azure' .. color(106) .. ' (Lv 75)' .. color(106) .. ' \129\154 ' .. color(106)
    .. 'Hit: ' .. color(2) .. '95%' .. color(106) .. ' \129\154 ' .. color(106) .. 'Evade: ' .. color(2) .. '61%');
p.printout.divider = 'spaces';
p.pet.hit_word, p.pet.evade_word = '', '  ';
expect('empty words leave the word and its divider out', MOCK.plain(pet_text()), 'Pet: Azure (Lv 75)  95%  61%');
p.pet.hit_word, p.pet.evade_word = 'Acc', 'Dodge';
expect('your own words', MOCK.plain(pet_text()), 'Pet: Azure (Lv 75)  Acc: 95%  Dodge: 61%');
p.pet.hit_word, p.pet.evade_word = 'Hit', 'Evade';
p.pet.show_level = false;
expect('Show its level off', MOCK.plain(pet_text()), 'Pet: Azure  Hit: 95%  Evade: 61%');
p.pet.show_name = false;
expect('Show its name off leaves the name and level out', MOCK.plain(pet_text()), 'Pet: Hit: 95%  Evade: 61%');
p.pet.show_name, p.pet.show_level = true, true;
p.printout.parts.pet.label = '';
expect('a cleared label', MOCK.plain(pet_text()), 'Azure (Lv 75)  Hit: 95%  Evade: 61%');
p.printout.parts.pet.label = 'Pet';
result.pet.low = 73;
expect('a jug pet\'s levels', MOCK.plain(pet_text()), 'Pet: Azure (Lv 73-75)  Hit: 95%  Evade: 61%');
result.pet.low, result.pet.hit, result.pet.evade = 75, { low = 60, high = 70 }, { low = 20, high = 20 };
expect('a range', MOCK.plain(pet_text()), 'Pet: Azure (Lv 75)  Hit: 60-70%  Evade: 20%');
p.printout.number_style = 'midpoint';
expect('or its middle', MOCK.plain(pet_text()), 'Pet: Azure (Lv 75)  Hit: ~65%  Evade: 20%');
check('the hit rate goes by the hit cutoffs, under 70 Bad', pet_text():find(color(68) .. '~65%', 1, true) ~= nil);
check('and evade by the evade cutoffs, 15 to 30 OK', pet_text():find(color(104) .. '20%', 1, true) ~= nil);
p.grades.hit_ok, p.grades.evade_ok = 60, 25;
check('they follow your cutoffs', pet_text():find(color(104) .. '~65%', 1, true) ~= nil
    and pet_text():find(color(68) .. '20%', 1, true) ~= nil);
p.grades.on = false;
p.colors.pet_number = 69;
check('grades off paints them in the pet\'s Number color', pet_text():find(color(69) .. '~65%', 1, true) ~= nil
    and pet_text():find(color(69) .. '20%', 1, true) ~= nil);
result.pet.evade, result.pet.scripted = nil, true;
expect('unknown, and a ? when scripts change the numbers', MOCK.plain(pet_text()), 'Pet: Azure (Lv 75)  Hit: ~65%?  '
    .. 'Evade: unknown');
result.pet.low, result.pet.high = nil, nil;
expect('a level it doesn\'t know', MOCK.plain(pet_text()), 'Pet: Azure (Lv ?)  Hit: ~65%?  Evade: unknown');

-- The sample --------------------------------------------------------------------------------------

n = #MOCK.printed;
MOCK.command('/checkmate sample');
local sample = MOCK.printed_since(n);
expect('the sample ends with your wyvern', sample[#sample], '[checkmate] Pet: Wyvern (Lv 42)  Hit: 88%  Evade: 27%');
MOCK.command('/checkmate hide pet');
n = #MOCK.printed;
MOCK.command('/checkmate sample');
check('and has no pet line with the part off', not since(n):find('Pet', 1, true), since(n));

return MOCK.report();
