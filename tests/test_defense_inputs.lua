local player = require('core.player');
MOCK.player.main_job, MOCK.player.sub_job, MOCK.player.sub_level = 7, 1, 37;
MOCK.player.skills = { [30] = 250, [31] = 225 };
MOCK.player.equipment = { [0] = 11000, [1] = 12000 };
MOCK.items[11000] = { Skill = 3, ShieldSize = 0 };
MOCK.items[12000] = { Skill = 0, ShieldSize = 3 };
local memory, extra = AshitaCore:GetMemoryManager(), string.rep('\0', 24);
local original = memory.GetInventory;
memory.GetInventory = function(...)
    local bag = original(...);
    local get = bag.GetContainerItem;
    bag.GetContainerItem = function(...)
        local item = get(...);
        item.Extra = extra;
        return item;
    end;
    return bag;
end;
local first = player.defense_inputs();
expect('shield skill is the client total without another gear addition', first.skills[30], 250);
expect('parry client skill remains separate from its direct modifier', first.skills[31], 225);
expect('main-hand type is read', first.main_skill, 3);
expect('shield resource type is available for unknown source items', first.sub_shield_size, 3);
expect('snapshot reads the current support job', first.sub_job, 1);
expect('snapshot has its own observation timestamp', first.observed_at, MOCK.now);
expect('plain extra data is not an augment warning', first.has_augments, nil);
expect('plain extra data is readable', first.augments_unknown, nil);
expect('unchanged inputs retain their signature', player.defense_inputs().signature, first.signature);
local function changed(label, mutate, restore)
    local before = player.defense_inputs().signature;
    mutate();
    check(label .. ' invalidates the defensive inputs', player.defense_inputs().signature ~= before);
    restore();
end
changed('skill-up', function() MOCK.player.skills[30] = 251; end, function() MOCK.player.skills[30] = 250; end);
changed('parry skill change', function() MOCK.player.skills[31] = 226; end, function() MOCK.player.skills[31] = 225; end);
changed('buff change', function() MOCK.player.buffs = { 403 }; end, function() MOCK.player.buffs = {}; end);
changed('job change', function() MOCK.player.main_job = 1; end, function() MOCK.player.main_job = 7; end);
changed('support restriction', function() MOCK.player.sub_job = 0; end, function() MOCK.player.sub_job = 1; end);
changed('shield removal', function() MOCK.player.equipment[1] = nil; end, function() MOCK.player.equipment[1] = 12000; end);
changed('gear augment change', function() extra = '\2\3' .. string.rep('\0', 22); end,
    function() extra = string.rep('\0', 24); end);
extra = '\2\3' .. string.rep('\0', 22);
check('documented augment system is flagged', player.defense_inputs().has_augments);
extra = '\1\1' .. string.rep('\0', 22);
expect('charge timers are not called augments', player.defense_inputs().has_augments, nil);
extra = '\2\16' .. string.rep('\0', 22);
expect('fishing rod data is not called combat augments', player.defense_inputs().has_augments, nil);
memory.GetInventory = original;
check('missing extra data is explicitly unknown', player.defense_inputs().augments_unknown);
local get_player = memory.GetPlayer;
memory.GetPlayer = function(...)
    local stats = get_player(...);
    stats.GetBuffs = function() return nil; end;
    return stats;
end;
check('missing buff memory does not pretend no statuses are active', player.defense_inputs().reason ~= nil);
memory.GetPlayer = function(...)
    local stats = get_player(...);
    stats.GetCombatSkill = function() return nil; end;
    return stats;
end;
check('missing skill memory does not become zero skill', player.defense_inputs().reason ~= nil);
memory.GetPlayer = function() error('unreadable'); end;
local failed = player.defense_inputs();
expect('API failure gives no usable signature', failed.signature, nil);
check('API failure preserves an explanation', failed.reason ~= nil);
memory.GetPlayer = get_player;
expect('defensive snapshots send no commands', #MOCK.commands, 0);
return MOCK.report();
