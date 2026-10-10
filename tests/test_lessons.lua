local lessons = require('core.lessons');
local me, index, skill = MOCK.player.server_id, 17, 257;
local id = MOCK.mob_id(MOCK.player.zone, index);

local function reset()
    lessons.forget();
    MOCK.now, MOCK.zoning = 100, false;
    MOCK.player.zone, MOCK.player.pet_index = 103, 0;
    MOCK.entities = {};
    MOCK.monster(index, 'Rabbit');
    id = MOCK.mob_id(MOCK.player.zone, index);
end

local function action(category, action_id, message, actor, target)
    lessons.on_action(MOCK.action_packet(actor or id, category or 11, action_id or skill, target or me,
        { { message = message or 185, param = 0 } }));
end

local function take()
    lessons.take_in(MOCK.now);
end

reset();
expect('requiring observations loads no monster data', package.loaded['data.zones.103'], nil);
expect('readable monster starts not observed', lessons.seen(index, skill), false);
expect('spell with no move mapping stays unknown', lessons.spell_seen(index, {}), nil);
expect('missing mapping stays unknown', lessons.spell_seen(index, nil), nil);
expect('invalid mapping stays unknown', lessons.spell_seen(index, { '257', -1 }), nil);
expect('partly unreadable mapping stays unknown', lessons.spell_seen(index, { skill, 'unknown' }), nil);
expect('out-of-range skill stays unknown', lessons.seen(index, 65536), nil);
expect('valid unobserved mapping is false', lessons.spell_seen(index, { skill }), false);
expect('unreadable entity stays unknown', lessons.seen(18, skill), nil);

local reads = MOCK.entity_reads;
action();
expect('action handler does not read entities', MOCK.entity_reads, reads);
expect('action waits for next frame', lessons.seen(index, skill), false);
local before = lessons.version(index);
take();
expect('completed monster move is observed', lessons.seen(index, skill), true);
check('new observation changes version', lessons.version(index) > before);
expect('alternate mapped skill recognizes lesson', lessons.spell_seen(index, { 452, skill }), true);
expect('unrelated lesson remains unobserved', lessons.spell_seen(index, { 452 }), false);
before = lessons.version(index);
action(); take();
expect('repeated same move does not change version', lessons.version(index), before);

-- Phoenix records m_UsedSkillIds before hit results in battle_entity.cpp OnMobSkillFinished.
for _, message in ipairs({ 0, 185, 188, 189, 75, 85, 282, 283, 284 }) do
    reset(); action(11, skill, message); take();
    expect('completion counts regardless of hit message ' .. message, lessons.seen(index, skill), true);
end

-- Native AbilityInterrupt is SkillStart (7); late range failures use MagicFinish (4).
for _, category in ipairs({ 1, 2, 4, 5, 6, 7, 8, 9, 12, 13, 14, 15 }) do
    reset(); action(category); take();
    expect('category is not completed monster move ' .. category, lessons.seen(index, skill), false);
end
reset(); action(3, 12); take();
expect('native low-id monster skill completion counts', lessons.seen(index, 12), true);
reset(); action(3, skill); action(11, 12); take();
expect('wrong high-id completion category rejected', lessons.seen(index, skill), false);
expect('wrong low-id completion category rejected', lessons.seen(index, 12), false);
reset(); action(11, 0x1F000000); take();
expect('interrupt sentinel cannot be a skill', lessons.seen(index, skill), false);

reset(); action(11, skill, 185, me); take();
expect('player action is excluded', lessons.seen(index, skill), false);
reset(); MOCK.monster(0x700, 'Pet', 0x08);
MOCK.entities[0x700].ServerId = MOCK.pet_id(0x700);
action(11, skill, 185, MOCK.entities[0x700].ServerId); take();
expect('identified pet actor is excluded', lessons.seen(0x700, skill), nil);
reset(); MOCK.player.pet_index = index;
action(); take();
expect('own charmed pet is excluded even with monster flag', lessons.seen(index, skill), nil);
reset(); MOCK.monster(18, 'Other pet', 0x08);
action(11, skill, 185, MOCK.entities[18].ServerId); take();
expect('non-monster entity flags are excluded', lessons.seen(18, skill), nil);

reset(); action();
lessons.on_message(me, id, 0, 6, index); take();
expect('death after same-frame completion clears it', lessons.seen(index, skill), false);
reset(); action(); take();
before = lessons.version(index);
lessons.on_message(me, id, 0, 20, index); take();
expect('falls-to-ground message clears it', lessons.seen(index, skill), false);
check('death changes version', lessons.version(index) > before);
reset(); action(); take();
lessons.on_message(me, MOCK.mob_id(103, 18), 0, 6, 18); take();
expect('another monster death does not clear this one', lessons.seen(index, skill), true);

reset(); action(); take();
lessons.on_entity(MOCK.entity_packet(id, 0x30, index)); take();
expect('despawn clears observation', lessons.seen(index, skill), false);
MOCK.monster(index, 'Rabbit');
expect('same id returning does not regain observations', lessons.seen(index, skill), false);
reset(); action(); take();
lessons.on_entity(MOCK.entity_packet(id, 0x10, index)); take();
expect('ordinary entity update keeps observation', lessons.seen(index, skill), true);

reset(); action(); take(); MOCK.entities[index] = nil;
expect('missing entity clears observation on query', lessons.seen(index, skill), nil);
MOCK.monster(index, 'Rabbit');
expect('return after missing entity starts clean', lessons.seen(index, skill), false);
reset(); action(); take(); MOCK.entities[index].HPPercent = 0;
expect('observed zero HP clears certainty', lessons.seen(index, skill), nil);
MOCK.entities[index].HPPercent = 100;
expect('same id after zero HP starts clean', lessons.seen(index, skill), false);
reset(); action(); take(); MOCK.entities[index].Distance = 2501;
MOCK.now = 102; take(); MOCK.entities[index].Distance = 100;
expect('tracked range-exit sweep prevents reuse', lessons.seen(index, skill), false);
reset(); action(); take(); MOCK.entities[index].Name = 'Different monster';
expect('name or form identity change clears observation', lessons.seen(index, skill), false);
reset(); action(); take(); MOCK.entities[index].SpawnFlags = 0x18;
expect('spawn flags change clears observation', lessons.seen(index, skill), false);

reset(); action(); lessons.on_zone(); take();
expect('zone reset drops queued completion', lessons.seen(index, skill), false);
reset(); action(); take(); MOCK.player.zone = 104;
MOCK.monster(index, 'Rabbit');
expect('zone identity cannot reuse old observations', lessons.seen(index, skill), false);
reset(); action(); take(); MOCK.zoning = true;
expect('unavailable player world clears observed entity', lessons.seen(index, skill), nil);
MOCK.zoning = false;
expect('return from unreadable world starts clean', lessons.seen(index, skill), false);

reset();
local packet = MOCK.action_packet(id, 11, skill, me, { { message = 185, param = 1 } });
packet.data = packet.data:sub(1, 22);
packet.size = 22;
lessons.on_action(packet); take();
expect('truncated action cannot record use', lessons.seen(index, skill), false);
reset(); lessons.on_action(MOCK.action_packet(id, 11, skill, me, {})); take();
expect('zero-result action cannot record use', lessons.seen(index, skill), false);
reset(); action(11, skill, 185, MOCK.mob_id(104, index)); take();
expect('wrong-zone actor cannot attach to local index', lessons.seen(index, skill), false);

reset();
for n = 1, 129 do
    MOCK.monster(n, 'Monster ' .. n);
    action(11, skill, 185, MOCK.entities[n].ServerId);
    MOCK.now = 100 + n; take();
end
expect('bounded monster cache evicts oldest observation', lessons.seen(1, skill), false);
expect('bounded monster cache keeps newest observation', lessons.seen(129, skill), true);
reset();
for n = 256, 384 do action(11, n); end
take();
expect('skill bound drops older certainty', lessons.seen(index, 256), false);
expect('skill bound retains latest observation', lessons.seen(index, 384), true);
reset();
for n = 1, 257 do action(); end
lessons.on_entity(MOCK.entity_packet(id, 0x30, index)); take();
expect('queue overflow never loses final disappearance', lessons.seen(index, skill), false);

expect('observations load no duration data', package.loaded['data.effects'], nil);
return MOCK.report();
