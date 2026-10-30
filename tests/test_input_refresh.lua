-- Quiet HP and TP changes leave unrelated combat estimates cached.
local defaults = require('ui.defaults');
local player = require('core.player');
local target = require('core.target');
local monsters = require('core.monsters');
local s = defaults.make();
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.overlay.on, s.overlay.parts.crit = true, true;
addon.path = FIXTURES_PATH;
MOCK.player.zone, MOCK.player.main_level, MOCK.player.main_job = 900, 75, 1;
MOCK.player.sub_job, MOCK.player.sub_level = 0, 0;
MOCK.player.equipment, MOCK.player.buffs = {}, {};
MOCK.target_monster(1, 'Fixture Goblin');
target.on_zone(900);
target.take_in();
target.read(s.overlay);
local raw_read, raw_conditions = player.read, player.hp_tp;
local reads, conditions = 0, 0;
player.read = function (...) reads = reads + 1; return raw_read(...); end;
player.hp_tp = function (...) conditions = conditions + 1; return raw_conditions(...); end;
local function poll()
    MOCK.now = MOCK.now + 0.3;
    return target.readout(s);
end
poll(); poll();
reads, conditions = 0, 0;
local first = target.current();
for i = 1, 100 do
    MOCK.player.tp, MOCK.player.hp = i, 1000 - i;
    local result, rebuilt = poll();
    check('unrelated HP and TP keep cached result ' .. i, result == first and not rebuilt);
end
expect('100 unrelated HP and TP changes cause no full player reads', reads, 0);
expect('Crit does not read HP or TP for an unequipped latent', conditions, 0);

MOCK.player.equipment[13] = 13291;
poll();
reads, conditions = 0, 0;
for i = 1, 10 do MOCK.player.tp = i; poll(); end
expect('Crit ignores Steal gear conditions while Steal is hidden', reads, 0);
expect('an irrelevant equipped ring does not add HP or TP reads', conditions, 0);

local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.steal = { 864 };
MOCK.items[864] = { Name = { 'Fish Scales' } };
MOCK.player.main_job, MOCK.player.hp, MOCK.player.tp = 6, 760, 0;
player.on_base_hp(1000);
s.overlay.parts.steal = true;
target.mark_stale();
poll();
local no_bonus = target.current().steal.low;
reads, conditions = 0, 0;
first = target.current();
for i = 1, 100 do
    MOCK.player.hp, MOCK.player.tp = 760 + i, i;
    local result, rebuilt = poll();
    check('unchanged latent state stays cached ' .. i, result == first and not rebuilt);
end
expect('100 changes on the same side of the latent threshold cause no full reads', reads, 0);
check('the active Steal row watches its equipped latent', conditions > 0);
MOCK.player.hp = 750;
local active, rebuilt = poll();
check('crossing the exact HP threshold refreshes the bonus', rebuilt and active.steal.low == no_bonus + 6);
MOCK.player.tp = 999;
local same, unchanged = poll();
check('TP below 100 percent keeps the active result', same == active and not unchanged);
MOCK.player.tp = 1000;
local spent, spent_changed = poll();
check('100 percent TP removes the latent bonus', spent_changed and spent.steal.low == no_bonus);
MOCK.player.tp = 0;
player.on_base_hp(nil);
local unknown, unknown_changed = poll();
check('missing base HP refreshes latent uncertainty', unknown_changed and unknown.steal.uncertain);
player.on_base_hp(1000);
local known, known_changed = poll();
check('receiving base HP refreshes the known bonus', known_changed and not known.steal.uncertain
    and known.steal.low == no_bonus + 6);
MOCK.player.buffs[1] = 269;
local synced, sync_changed = poll();
check('Level Sync restores the uncertain latent range', sync_changed and synced.steal.uncertain);
MOCK.player.equipment[13] = nil;
local removed, removed_changed = poll();
check('unequipping the ring removes its latent', removed_changed and not removed.steal.uncertain
    and removed.steal.low == no_bonus);
reads, conditions = 0, 0;
for i = 1, 20 do MOCK.player.hp, MOCK.player.tp = i + 500, i; poll(); end
expect('Steal without its latent gear does not rebuild on HP or TP', reads, 0);
expect('Steal without its latent gear does not read HP or TP', conditions, 0);
expect('passive input refresh sends no commands', #MOCK.commands, 0);
return MOCK.report();
