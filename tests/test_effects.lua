-- The tracker uses Phoenix's exported durations and only the results the client receives.
local effects = require('core.effects');
local packets = require('core.packets');
expect('requiring the tracker does not load duration data', package.loaded['data.effects'], nil);
local me, other = MOCK.player.server_id, 2001;
local mob, second = MOCK.mob_id(103, 17), MOCK.mob_id(103, 18);

local function reset()
    effects.forget(true);
    MOCK.now = 100;
    MOCK.player.equipment, MOCK.player.buffs = {}, {};
end

local function send(category, action, effect, message, actor, target, added)
    effects.on_action(MOCK.action_packet(actor or me, category, action, target or mob,
        { { message = message or 236, param = effect, added = added } }), me);
end

local function take()
    effects.take_in(MOCK.now);
end

local function entry(effect, target)
    local out = effects.readout(target or mob, 'both', MOCK.now) or {};
    for _, each in ipairs(out) do if (each.effect == effect) then return each; end end
    return nil;
end

local function left(effect, target)
    local each = entry(effect, target);
    return each and each.ends and each.ends - MOCK.now;
end

reset();
local before = MOCK.bit_reads;
send(8, 58, 4);
expect('action start reads only the category', MOCK.bit_reads - before, 1);
expect('action start loads no duration data', package.loaded['data.effects'], nil);
before = MOCK.bit_reads;
send(1, 0, 40, 1, mob, me);
expect('monster swing on player stops after the target', MOCK.bit_reads - before, 2);
effects.on_entity(MOCK.entity_packet(mob, 0x30));
expect('untracked despawn loads no data', package.loaded['data.effects'], nil);
effects.on_message(other, mob, 0, 6, me);
effects.on_zone(); take();
expect('untracked death and zone clear load no data', package.loaded['data.effects'], nil);

send(4, 58, 4);
expect('land waits for the frame', effects.has(mob), false);
take();
expect('your Paralyze length is the Phoenix maximum', left(4), 120);
expect('your Paralyze is yours', entry(4).mine, true);
expect('Paralyze is a debuff', entry(4).debuff, true);
expect('Paralyze is random', entry(4).random, true);
send(4, 56, 13, 236, other);
send(4, 43, 40, 230, mob);
take();
expect('other Slow length', left(13), 180);
expect('other Slow is a guess', entry(13).mine, false);
expect('Protect length', left(40), 1800);
expect('Protect is a buff', entry(40).debuff, false);
expect('Protect is from the monster itself', entry(40).own, true);
expect('debuff filter', #effects.readout(mob, 'debuffs', MOCK.now), 2);
expect('buff filter', #effects.readout(mob, 'buffs', MOCK.now), 1);
local snapshot = effects.readout(mob, 'both', MOCK.now, true);
MOCK.now = MOCK.now + 5;
expect('chat snapshot holds its time', snapshot[1].left, 120);
expect('live readout continues counting', left(4), 115);
local held = entry(4).ends;
for _, message in ipairs({ 75, 85, 156, 158, 188, 189, 282, 283, 284, 323, 324, 655 }) do
    send(4, 58, 0, message);
end
take();
expect('misses and no-effect do not refresh', entry(4).ends, held);

-- AoE, monster songs/two-hours, pet sleep and added effects use their own result fields.
reset();
effects.on_action(MOCK.action_packet_multi(me, 4, 273, {
    { id = mob, results = { { message = 236, param = 2 } } },
    { id = second, results = { { message = 277, param = 2 } } },
}), me);
take();
check('Sleepga reaches both monsters', entry(2) ~= nil and entry(2, second) ~= nil);
send(4, 394, 198, 230, mob);
send(4, 394, 198, 266, mob, second);
send(11, 688, 44, 101, mob);
send(11, 734, 195, 101, mob);
send(11, 1961, 0, 101, mob);
take();
expect('monster song length', left(198), 120);
expect('song on friend is a buff', entry(198, second).debuff, false);
expect('song on friend is not its own', entry(198, second).own, false);
expect('Mighty Strikes length', left(44), 45);
expect('Astral Flow does not invent a buff', entry(195), nil);
expect('zero effect is not kept', entry(0), nil);
reset();
send(13, 658, 2, 266, MOCK.pet_id(0x700));
take();
expect('Nightmare gains message is still a debuff', entry(2).debuff, true);
expect('pet effect is not treated as the player', entry(2).mine, false);
local nightmare_end = entry(2).ends;
send(4, 220, 3);
take();
expect('a DoT does not shorten Nightmare', entry(2).ends, nightmare_end);
reset();
send(2, 0, 0, 1, other, mob, { message = 160, param = 2 });
send(2, 0, 0, 1, other, second, { message = 160, param = 10 });
take();
expect('foreign Sleep Bolt uses typical item duration', left(2), 25);
expect('foreign Spartan Bullet uses typical item duration', left(10, second), 5);

-- A successful land authorizes replacements; a miss never does.
reset();
send(4, 56, 13); take();
send(4, 57, 33, 230, mob); take();
expect('Haste removes Slow', entry(13), nil);
check('Haste remains', entry(33) ~= nil);
send(4, 56, 13); take();
expect('Slow removes Haste', entry(33), nil);
send(4, 236, 129, 237); take();
send(4, 235, 128, 237); take();
expect('Burn removes Frost', entry(129), nil);
held = entry(128).ends;
send(4, 236, 0, 75); take();
expect('blocked Frost leaves Burn unchanged', entry(128).ends, held);
send(11, 346, 93, 186, mob); take();
send(3, 170, 149, 127); take();
expect('Angon removes Defense Boost', entry(93), nil);
send(4, 253, 2); take();
send(4, 259, 19); take();
expect('Sleep II is normalized to Sleep', entry(19), nil);
check('normalized Sleep remains', entry(2) ~= nil);

-- Dia/Bio's priority is separate from their damage, including damage for zero.
reset();
send(4, 23, 0, 2); take();
expect('Dia can land with zero damage', left(134), 60);
send(4, 230, 0, 2); take();
expect('Bio replaces Dia', entry(134), nil);
expect('Bio length', left(135), 60);
send(4, 24, 0, 252); take();
expect('Dia II replaces Bio', entry(135), nil);
held = entry(134).ends;
MOCK.now = MOCK.now + 1;
send(4, 230, 0, 2); send(4, 24, 0, 2); take();
expect('weaker/equal Dia or Bio cannot refresh', entry(134).ends, held);
send(4, 33, 0, 264, other, second); take();
expect('Diaga shorter target message lands', left(134, second), 60);
MOCK.now = held + 1;
send(4, 23, 0, 2); take();
expect('expired Dia II cannot block a new weaker Dia before a frame', left(134), 60);

-- Packet order also holds when several things arrive before a frame.
reset();
send(4, 253, 2); send(4, 258, 11); send(1, 0, 30, 1); take();
expect('same-frame damage removes new Sleep', entry(2), nil);
expect('same-frame damage removes new Bind', entry(11), nil);
send(4, 253, 2); send(1, 0, 0, 1); take();
check('zero damage keeps Sleep', entry(2) ~= nil);
send(1, 0, 0, 1, me, mob, { message = 163, param = 10 }); take();
expect('extra damage wakes Sleep', entry(2), nil);
send(4, 56, 13);
effects.on_entity(MOCK.entity_packet(mob, 0x30)); take();
expect('same-frame land then despawn clears', effects.has(mob), false);
send(4, 58, 4);
effects.on_zone();
send(4, 56, 13); take();
expect('pre-zone effect is gone', entry(4), nil);
check('post-zone effect remains', entry(13) ~= nil);
effects.on_message(other, mob, 13, 206, me); take();
check('another player wear-off is ignored', entry(13) ~= nil);
effects.on_message(me, mob, 13, 206, me); take();
expect('your wear-off removes effect', entry(13), nil);
send(4, 43, 40, 230, mob); take();
send(4, 260, 40, 341); take();
expect('Dispel removes the named effect', entry(40), nil);
send(4, 56, 13); take();
effects.on_message(other, mob, 0, 6, me); take();
expect('death from any actor clears the monster', effects.has(mob), false);

reset();
send(4, 220, 3); send(4, 253, 2); take();
expect('sleep after a DoT ends in three seconds', left(2), 3);
reset();
send(4, 253, 2); send(4, 220, 3); take();
expect('DoT after sleep ends it in three seconds', left(2), 3);
reset();
send(4, 54, 37, 230, mob); send(4, 220, 3); send(4, 253, 2); take();
expect('Stoneskin protects sleep from a DoT tick', left(2), 60);
send(4, 260, 37, 341); take();
expect('dispelled Stoneskin leaves sleep exposed to the next tick', left(2), 3);
reset();
send(4, 54, 37, 230, mob); take();
MOCK.now = MOCK.now + 290;
send(4, 220, 3); send(4, 253, 2); take();
MOCK.now = MOCK.now + 10; take();
expect('expired Stoneskin leaves sleep exposed to the next tick', left(2), 3);
MOCK.now = MOCK.now + 3; take();
expect('sleep ends after the exposed tick', entry(2), nil);

-- Your estimates use the visible gear and effective Phoenix merit cap, never a foreign player's gear.
local data = require('data.effects');
-- A proc from the off-hand must not borrow an unrelated main-hand proc's duration.
do
    local main, sub;
    for id, duration in pairs(data.procs) do
        local effect = data.proc_effects[id];
        if (effect ~= nil) then
            if (main == nil) then main = id;
            elseif (effect ~= data.proc_effects[main] and duration ~= data.procs[main]) then sub = id; break; end
        end
    end
    check('exported proc fixture has two distinct effects', main ~= nil and sub ~= nil);
    if (main ~= nil and sub ~= nil) then
        reset();
        MOCK.player.equipment[0], MOCK.player.equipment[1] = main, sub;
        send(1, 0, 0, 1, me, mob, { message = 160, param = data.proc_effects[sub] }); take();
        expect('own proc uses the matching weapon duration', left(data.proc_effects[sub]), data.procs[sub]);
        send(1, 0, 1, 1, me, second, { message = 160, param = data.proc_effects[sub] });
        MOCK.player.equipment = {};
        take();
        expect('queued proc keeps the matching weapon at receipt', left(data.proc_effects[sub], second), data.procs[sub]);
    end
end

-- A move that announces more than one status retains each status's own duration row.
do
    local checked = false;
    for skill, row in pairs(data.skills) do
        for effect, info in pairs(row.by_effect or {}) do
            if (info.seconds ~= nil) then
                reset();
                send(11, skill, effect, 242, mob); take();
                expect('multi-effect skill picks its announced duration', left(effect), info.top or info.seconds);
                checked = true;
                break;
            end
        end
        if (checked) then break; end
    end
    check('exported data includes a multi-effect skill fixture', checked);
end
reset();
MOCK.player.equipment[2] = 17371;
send(4, 421, 194, 237); take();
expect('Horn +1 extends Battlefield Elegy', left(194), 144);
MOCK.player.buffs = { data.troubadour };
send(4, 421, 194, 237); take();
expect('Troubadour doubles your song', left(194), 288);
send(4, 421, 194, 237, other); take();
expect('your song gear does not extend another player song', left(194), 120);
MOCK.player.equipment[6] = 13971;
send(3, 57, 11, 277); take();
expect('Hunter Bracers extend Shadowbind', left(11), 40);
effects.on_merits(MOCK.merit_packet({ { data.merits.dia_iii.id, 2 }, { data.merits.angon.id, 2 } }));
send(4, 25, 0, 2); send(3, 170, 149, 127); take();
expect('your Dia III merits', left(134), 60);
expect('your Angon merits', left(149), 45);
reset();
send(4, 25, 0, 2); take();
expect('unknown Dia III ranks use the exported cap', left(134), data.merits.dia_iii.per_rank * data.merits.dia_iii.most);

-- Duration inputs belong to the received action, even when gear or buffs change before the frame.
reset();
MOCK.player.equipment[2] = 17371;
MOCK.player.buffs = { data.troubadour };
send(4, 421, 194, 237);
MOCK.player.equipment[2], MOCK.player.buffs = nil, {};
take();
expect('queued song keeps the instrument and Troubadour at receipt', left(194), 288);
send(4, 421, 194, 237);
MOCK.player.equipment[2], MOCK.player.buffs = 17371, { data.troubadour };
take();
expect('later gear and Troubadour do not extend a queued song', left(194), 120);
reset();
MOCK.player.equipment[6] = 13971;
send(3, 57, 11, 277);
MOCK.player.equipment[6] = nil;
take();
expect('queued Shadowbind keeps the gear at receipt', left(11), 40);
reset();
effects.on_merits(MOCK.merit_packet({ { data.merits.dia_iii.id, 1 } }));
send(4, 25, 0, 2);
effects.on_merits(MOCK.merit_packet({ { data.merits.dia_iii.id, 2 } }));
take();
expect('queued Dia III keeps the merit rank at receipt', left(134), 30);

-- Unknown lengths sort with known lengths, stay explicitly untimed, and expire after three minutes.
reset();
MOCK.strings['buffs.names'] = { [999] = 'odd effect' };
send(4, 0, 999); send(4, 58, 4); take();
expect('unknown length has no visible deadline', entry(999).ends, nil);
expect('unknown effect uses the client name', entry(999).name, 'Odd Effect');
expect('mixed known/unknown readout sorts safely', #effects.readout(mob, 'both', MOCK.now), 2);
local version = effects.version(mob);
MOCK.now = MOCK.now + 120; take();
expect('Paralyze expires', entry(4), nil);
check('expiry changes version', effects.version(mob) ~= version);
version = effects.version(mob); take();
expect('quiet frame does not change version', effects.version(mob), version);
MOCK.now = MOCK.now + 60; take();
expect('unknown effect expires after three minutes', effects.has(mob), false);
effects.forget(); send(4, 58, 4); take();
check('reintroduced id gets a newer version', effects.version(mob) > version);

reset();
for i = 1, 49 do send(4, 58, 4, 236, me, mob + i); end
take();
expect('monster cap drops the first arrival even at identical times', effects.has(mob + 1), false);
local kept = 0;
for i = 1, 49 do if (effects.has(mob + i)) then kept = kept + 1; end end
expect('monster cap is 48', kept, 48);
reset();
for i = 1, 300 do send(4, 58, 4); end
take();
expect('full queues drain without losing the last land', left(4), 120);
check('tracker sends no commands', #MOCK.commands == 0);
-- Measure tracker allocations without counting LuaJIT's trace compilation.
local quiet_tick, quiet_now = effects.take_in, MOCK.now;
local function quiet_frames()
    for _ = 1, 10000 do quiet_tick(quiet_now); end
end
local jit_was_on = jit.status();
jit.off();
collectgarbage('collect');
collectgarbage('stop');
local heap = collectgarbage('count');
quiet_frames();
local growth = collectgarbage('count') - heap;
collectgarbage('restart');
if (jit_was_on) then jit.on(); end
check('quiet tracker frames allocate no growing state', growth == 0, growth);

-- A failed readout stops only this tracker through the callback and returns no readout.
reset(); send(4, 0, 999); take();
local game_name, broke, errors = effects.game_name, effects.broke, 0;
effects.game_name = function () error('broken resource'); end;
effects.broke = function () errors = errors + 1; effects.forget(); end;
expect('failed readout returns nil', effects.readout(mob, 'both', MOCK.now), nil);
expect('failed readout reports through callback', errors, 1);
effects.game_name, effects.broke = game_name, broke;

return MOCK.report();
