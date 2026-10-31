-- These masks use the packet layout, not the addon's trait-ID conversion.
local masks = dofile(FIXTURES_PATH .. 'command_data.lua');
local memory = AshitaCore:GetMemoryManager():GetPlayer();
local jobs = require('core.job_settings');
local drops = require('core.drops');
local defaults = require('ui.defaults');
local s = defaults.make();
s.drops.th, s.drops.th_mode = 1, 'auto';
MOCK.player.equipment = {};
MOCK.player.ability_data = true;
MOCK.player.main_job, MOCK.player.main_level = 6, 24;
MOCK.player.sub_job, MOCK.player.sub_level = 1, 12;

MOCK.player.command_data = masks.th1;
check('the fixture puts TH1 in command byte 0xC2', #masks.th1 == 224 and masks.th1:byte(195) == 8);
check('the API reads TH1 at command bit 1555', memory:HasTrait(1555));
check('TH1 does not set weapon-skill bit 19', not memory:HasTrait(19));
check('TH1 does not include the second trait', not memory:HasTrait(1600));
jobs.refresh(true);
expect('THF 24 reads TH1 from the client trait mask', jobs.treasure_hunter(s.drops).level, 1);
expect('automatic drops use TH1 from that mask', drops.readout({ drops = { { rate = 100, item = 1 } } }, s.drops).th, 1);
expect('automatic reading keeps saved manual TH1', s.drops.th, 1);

MOCK.player.command_data = masks.th2;
MOCK.player.main_level, MOCK.player.sub_level = 45, 22;
check('the fixture puts the second trait in command byte 0xC8', masks.th2:byte(201) == 1);
check('the API reads the second trait at command bit 1600', memory:HasTrait(1600));
jobs.refresh(true);
expect('both client traits contribute to TH2', jobs.treasure_hunter(s.drops).level, 2);

MOCK.player.equipment = { [0] = 16480, [6] = 15107 };
MOCK.player.equipment_extra = setmetatable({}, { __index = function() return string.rep('\0', 24); end });
MOCK.player.main_level = 75;
jobs.refresh(true);
expect('client TH2 and two equipped bonuses reach TH4', jobs.treasure_hunter(s.drops).level, 4);

MOCK.player.main_job, MOCK.player.sub_job = 1, 13;
MOCK.player.sub_level, MOCK.player.equipment = 37, {};
MOCK.player.command_data = masks.weapon_skills;
check('the weapon-skill fixture really sets bits 19 and 64', memory:HasTrait(19) and memory:HasTrait(64));
check('weapon skills do not set the TH trait bits', not memory:HasTrait(1555) and not memory:HasTrait(1600));
jobs.refresh(true);
expect('weapon-skill bits cannot give WAR/NIN Treasure Hunter', jobs.treasure_hunter(s.drops).level, 0);
expect('weapon-skill bits cannot raise drop chances', drops.readout({ drops = { { rate = 100, item = 1 } } }, s.drops).th, 0);

MOCK.player.main_job, MOCK.player.main_level = 6, 24;
MOCK.player.command_data = masks.empty;
jobs.refresh(true);
expect('job level does not invent a missing client trait', jobs.treasure_hunter(s.drops).level, 0);
MOCK.player.main_job, MOCK.player.main_level = 1, 75;
MOCK.player.sub_job, MOCK.player.sub_level = 6, 24;
MOCK.player.command_data = masks.th1;
jobs.refresh(true);
expect('a support THF reads the same TH1 bit', jobs.treasure_hunter(s.drops).level, 1);

MOCK.player.ability_data = false;
jobs.refresh(true);
local fallback = jobs.treasure_hunter(s.drops);
check('missing command data keeps an explicit manual fallback', fallback.level == 1 and not fallback.known and fallback.fallback);
return MOCK.report();
