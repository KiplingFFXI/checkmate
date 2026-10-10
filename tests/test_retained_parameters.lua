addon.path = FIXTURES_PATH;
local player = require('core.player');
local target = require('core.target');
local monsters = require('core.monsters');
local s = require('ui.defaults').make();
local ids = { 'hit', 'offhand', 'ranged', 'evade', 'pdif', 'offhandpdif', 'rangedpdif' };
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
for _, id in ipairs(ids) do s.overlay.parts[id] = true; end
MOCK.items[10], MOCK.items[11], MOCK.items[12], MOCK.items[13] = { Skill = 3 }, { Skill = 2 }, { Skill = 25 }, { Skill = 0 };
MOCK.player.equipment = { [0] = 10, [1] = 11, [2] = 12, [3] = 13 };
MOCK.player.skills = { [2] = 120, [3] = 120, [25] = 120, [29] = 110 };
MOCK.player.zone, MOCK.player.main_level = 900, 40;
MOCK.target_monster(1, 'Fixture Goblin');
local id, token = MOCK.mob_id(900, 1), 0;
target.on_zone(900);
target.take_in();
local row = monsters.find(900, id, 'Fixture Goblin');
row.flags = row.flags or {};
row.flags.scripted_stats = true;
for _, stats in pairs(row.levels) do stats.def = 100; end
local function frame(seconds)
    MOCK.now = MOCK.now + (seconds or 0);
    target.take_in(); target.read(s.overlay);
    return target.readout(s);
end
local function checked(accuracy, attack)
    token = token + 1;
    target.on_check(1, id, 39, 4, 2, nil, false, token, 'waiting');
    local p = player.accept_parameters(player.parameter_inputs(), {
        accuracy = accuracy, offhand_accuracy = accuracy - 10, ranged_accuracy = accuracy - 20, evasion = 130,
    }, MOCK.now);
    target.on_parameters(1, id, token, p);
    player.accept_attacks(player.pdif_inputs(), attack, attack - 10, attack - 20, MOCK.now);
    return frame();
end
frame();
local original = checked(160, 200);
for _, key in ipairs(ids) do check('initial check supplies ' .. key, original[key] and original[key].low ~= nil); end
local received_at = original.provenance.parameter_at;
frame(3600);
expect('elapsed time alone does not replace the reading', target.current(), original);
MOCK.player.buffs, MOCK.player.stats[1] = { 56 }, 75;
local retained = frame(0.3);
check('retained estimates keep the source-script warning', original.scripted and retained.scripted);
for _, key in ipairs(ids) do
    local before, after = original[key], retained[key];
    check('changed inputs retain the exact last ' .. key, after and after.low == before.low and after.high == before.high);
    check('retained ' .. key .. ' is marked as an older estimate', after and after.retained and after.uncertain);
    check('retaining ' .. key .. ' leaves the old result untouched', not before.retained);
end
expect('retained parameter age is the original reply time', retained.provenance.parameter_at, received_at);
check('retained details use the original combat inputs', retained.parameter_inputs and retained.parameter_inputs.accuracy == 160
    and retained.parameter_inputs.level == 40);
MOCK.player.equipment = {};
retained = frame(0.3);
check('removing weapons does not hide retained weapon rows', retained.dual_wield and retained.shoots
    and retained.offhand and retained.ranged and retained.offhandpdif and retained.rangedpdif);
MOCK.target_monster(2, 'Fixture Goblin');
local other = frame();
expect('another target cannot borrow retained accuracy', other.hit, nil);
check('another target cannot borrow retained attack', not other.pdif or other.pdif.low == nil);
MOCK.target_monster(1, 'Fixture Goblin');
retained = frame();
check('returning to the checked target keeps its earlier estimate', retained.hit and retained.hit.low == original.hit.low);
s.overlay.parts.hit = false;
target.mark_stale();
expect('a disabled row stays hidden even with a retained value', frame().hit, nil);
s.overlay.parts.hit = true;
target.mark_stale();
check('re-enabling a retained row needs no stat request', frame().hit ~= nil);
MOCK.player.equipment = { [0] = 10, [1] = 11, [2] = 12, [3] = 13 };
MOCK.player.buffs, MOCK.player.stats[1] = {}, 70;
retained = frame(0.3);
check('restoring old inputs does not relabel an older reading as fresh', retained.hit and retained.hit.retained);
local fresh = checked(180, 250);
check('a new accepted check replaces the retained values', fresh.hit and fresh.hit.low ~= original.hit.low
    and fresh.pdif.attack == 250 and not fresh.hit.retained and not fresh.pdif.retained);
check('new check uses its actual newer reply time', fresh.provenance.parameter_at > received_at);
token = token + 1;
target.on_check(1, id, 39, 4, 2, nil, false, token, 'waiting');
frame();
player.accept_attacks(player.pdif_inputs(), 300, nil, nil, MOCK.now);
frame(0.3);
MOCK.player.buffs = { 56 };
local partial = frame(0.3);
check('a newer partial reply replaces the old main-hand estimate', partial.pdif and partial.pdif.attack == 300
    and partial.pdif.retained);
check('a newer missing off-hand value cannot revive from an older reply', not partial.offhandpdif or partial.offhandpdif.low == nil);
check('a newer missing ranged value cannot revive from an older reply', not partial.rangedpdif or partial.rangedpdif.low == nil);
target.on_disappear(id, 1);
local gone = frame();
expect('disappearance clears retained target accuracy', gone.hit, nil);
MOCK.player.buffs = { 56 };
gone = frame(0.3);
check('disappearance leaves no retained pDIF to revive', not gone.pdif or gone.pdif.low == nil);
checked(160, 200);
MOCK.player.buffs = {};
frame(0.3);
target.on_zone(900);
local zoned = frame();
expect('zoning clears retained accuracy', zoned.hit, nil);
check('zoning clears retained pDIF', not zoned.pdif or zoned.pdif.low == nil);
expect('passive retention never sends a command', #MOCK.commands, 0);
return MOCK.report();
