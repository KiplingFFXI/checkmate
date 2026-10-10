-- Only a matching manual check can reveal a target when the option is enabled.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local target = require('core.target');
local overlay = require('ui.overlay');
local player = require('core.player');
local NAME = '##checkmate_overlay';
for _, part in pairs(s.printout.parts) do part.on = false; end
s.printout.replace_game_line = false;
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.overlay.parts.name, s.overlay.icons, s.overlay.on = true, false, true;
MOCK.player.main_level = 40;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.monster(2, 'Fixture Goblin');
MOCK.monster(400, 'Fixture NM');
local function frame()
    MOCK.frame();
    return table.concat(MOCK.overlay_lines(), ' / ');
end
local function visible() return MOCK.gui.flags[NAME] ~= nil; end
local function hidden()
    return frame() == '' and not visible() and target.current() == nil;
end
local function reply(index, level)
    MOCK.packet(MOCK.check_packet(index or 1, level or 39, 4, 174));
end
local function option(value)
    s.overlay.only_checked = value;
    overlay.changed(s);
end
local function select(index)
    MOCK.target.slot0, MOCK.target.slot1, MOCK.target.picking = index, 0, false;
end

expect('the new option defaults off', s.overlay.only_checked, false);
check('the default still shows source information before a check', frame():find('Fixture Goblin', 1, true) ~= nil
    and target.current().provenance.checked_at == nil);
option(true);
check('enabling the option hides an unchecked target and its current details', hidden());
MOCK.packet(MOCK.widescan_packet(1, 39));
check('a widescan alone does not reveal the target', hidden());

local reads = 0;
local old_parameters, old_attack, old_defenses = player.parameter_inputs, player.pdif_inputs, player.defense_inputs;
player.parameter_inputs = function (...) reads = reads + 1; return old_parameters(...); end;
player.pdif_inputs = function (...) reads = reads + 1; return old_attack(...); end;
player.defense_inputs = function (...) reads = reads + 1; return old_defenses(...); end;
s.overlay.parts.hit, s.overlay.parts.pdif, s.overlay.parts.block = true, true, true;
MOCK.wait(1);
expect('hidden targets do not poll combat inputs', reads, 0);
expect('hidden targets send no commands', #MOCK.commands, 0);
s.overlay.parts.hit, s.overlay.parts.pdif, s.overlay.parts.block = false, false, false;
player.parameter_inputs, player.pdif_inputs, player.defense_inputs = old_parameters, old_attack, old_defenses;

reply();
check('a manual check reply reveals that monster', frame():find('Fixture Goblin (Lv 39)', 1, true) ~= nil
    and target.current().provenance.checked_at ~= nil);
select(2);
check('checking one monster does not reveal another', hidden());
select(1);
check('Remember restores a checked monster when retargeted', frame() ~= '' and target.current().low == 39);
MOCK.pick(2);
check('without cursor following the held checked target stays visible', frame() ~= '' and target.current().id == MOCK.mob_id(900, 1));
s.overlay.follow_cursor = true;
check('cursor following hides an unchecked cursor target', hidden());
s.overlay.follow_cursor = false;
select(1);
frame();

s.overlay.remember = false;
select(2);
check('Remember off hides the next unchecked target', hidden());
select(1);
check('Remember off also forgets the previous target', hidden());
reply();
check('checking again restores the current target with Remember off', frame() ~= '' and target.current().low == 39);
select(2);
reply(2, 40);
check('a reply before the new target first frame survives Remember off', frame() ~= '' and target.current().low == 40);
select(1);
check('the previous target remains forgotten after that fast reply', hidden());
s.overlay.remember = true;

select(400);
MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(900, 400), 0, 0, 249, 400));
check('an impossible-to-gauge reply also counts as a manual check', frame() ~= '' and target.current().impossible == true);
MOCK.packet(MOCK.widescan_packet(400, 51));
check('a later widescan can refine an already checked NM', frame() ~= '' and target.current().low == 51);

select(1);
reply(); frame();
MOCK.packet(MOCK.entity_packet(MOCK.mob_id(900, 1), 0x30, 1));
check('disappearance immediately hides the checked target', hidden());
select(0); frame();
MOCK.target_monster(1, 'Fixture Goblin');
check('a same-ID return stays hidden until another check', hidden());
reply(); frame();
MOCK.entities[1].ServerId = MOCK.mob_id(900, 1) + 0x100000;
check('a replacement server ID at the same index cannot reuse a check', hidden());
MOCK.monster(1, 'Fixture Goblin');
check('restoring an earlier ID does not restore the discarded check', hidden());
reply(); frame();
MOCK.entities[1] = nil;
check('an absent entity invalidates its check even before a despawn packet', hidden());
MOCK.monster(1, 'Fixture Goblin');
check('an entity returning after absence needs a new check', hidden());
reply(); frame();
MOCK.packet(MOCK.widescan_packet(1, 40));
check('a changed widescan level removes the old check and hides the target', hidden());
reply(1, 40); frame();
MOCK.packet(MOCK.message_packet(4321, MOCK.mob_id(900, 1), 0, 0, 6, 1));
check('death hides the checked monster', hidden());
select(0); frame(); select(1);
check('retargeting after death cannot reveal an old check', hidden());
reply(); frame();
MOCK.zone_in(900);
check('zoning clears the visibility permission', hidden());

option(false);
check('turning the option off restores the source-only overlay', frame() ~= '' and target.current().provenance.checked_at == nil);
reply(); frame();
option(true);
check('an existing remembered check is valid when the option is enabled', frame() ~= '' and target.current().low == 39);
s.overlay.on = false; overlay.changed(s);
s.overlay.on = true; overlay.changed(s);
check('turning the overlay off discards its checked targets', hidden());

MOCK.command('/checkmate');
check('the settings window can still show the explicit sample preview', frame():find('Sample Goblin', 1, true) ~= nil);
expect('the sample never becomes current target details', target.current(), nil);
MOCK.command('/checkmate');
check('closing settings hides the sample and unchecked target', hidden());
expect('the new visibility rule sends no game commands', #MOCK.commands, 0);
return MOCK.report();
