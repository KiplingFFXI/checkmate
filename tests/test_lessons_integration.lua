-- Real packet, settings, overlay and manual-check paths share the passive observer.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local target = require('core.target');
local lessons = require('core.lessons');
local details = require('core.check_details');
local player = require('core.player');
local function command(text) MOCK.command('/checkmate ' .. text); end
local function blue(result)
    for _, section in ipairs(((result or {}).info or {}).sections or {}) do
        if (section.id == 'blue') then return section; end
    end
end
local function live() return blue(target.readout(s)); end
local function used(index, skill, message, category)
    MOCK.packet(MOCK.action_packet(MOCK.mob_id(900, index), category or 11, skill,
        MOCK.player.server_id, { { message = message or 185, param = 0 } }));
    MOCK.frame();
end
local function check_monster(index)
    MOCK.packet(MOCK.check_packet(index, 39, 4, 174));
    MOCK.frame();
end
local function has(text, value) return text and text:find(value, 1, true) ~= nil; end

addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.monster(2, 'Second Goblin');
MOCK.frame();
local row = require('core.monsters').find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.info = { blue = { spells = {
    { id = 577, name = 'Foot Kick', min_skill = 0, skill_ids = { 257, 258 } },
    { id = 578, name = 'Dust Cloud', min_skill = 25, skill_ids = { 259 } },
    { id = 579, name = 'Unmapped Lesson', min_skill = 0 },
} } };
MOCK.player.spell_data, MOCK.player.known_spells = true, {};
MOCK.player.main_job, MOCK.player.skills[43] = 16, 25;
MOCK.entities[1].Distance = 100;
for id, part in pairs(s.printout.parts) do part.on = id == 'name' or id == 'blue'; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = id == 'name' or id == 'blue'; end
command('overlay on');
MOCK.frame();
expect('move observations default off', s.blue.seen, false);
used(1, 257);
check('off does not add observer wording', not has(live().value, 'observed') and not has(live().value, 'move seen'));
expect('off does not retain completed moves', lessons.seen(1, 257), false);

command('blueseen on');
MOCK.frame();
expect('observer command is saved', MOCK.last_save.blue.seen, true);
check('enabling begins with not observed', has(live().value, 'Foot Kick (not learned, not observed)'));
check('missing mapping stays unknown', has(live().value, 'Unmapped Lesson (not learned, move use unknown)'));
used(1, 257, 185, 7);
check('ready or interrupted action is not marked', has(live().value, 'Foot Kick (not learned, not observed)'));
used(1, 258, 188);
check('completed miss on alternate mapped ID updates live overlay', has(live().value, 'Foot Kick (not learned, move seen)'));
used(1, 259, 75);
check('completed resisted move updates live overlay', has(live().value, 'Dust Cloud (not learned, move seen)'));
check('observer notes preserve learning uncertainty', has(table.concat(live().notes, ' '), 'None of these establishes learning eligibility.'));

local first = #MOCK.printed;
check_monster(1);
local chat = table.concat(MOCK.printed_since(first), ' ');
check('manual chat uses the same observed mapping', has(chat, 'Foot Kick (not learned, move seen)'));
expect('manual details record snapshot provenance', details.current().provenance.chat_snapshot, true);
check('manual saved details include seen state', has(blue(details.current()).value, 'move seen'));

MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(900, 1), 0, 0, 6, 1));
MOCK.frame();
expect('death clears observer', lessons.seen(1, 257), false);
expect('death clears manual snapshot', details.current(), nil);
MOCK.target.slot0 = 2; MOCK.frame();
MOCK.target.slot0 = 1; MOCK.frame();
check('return after death has no old move observation', has(live().value, 'Foot Kick (not learned, not observed)'));
used(1, 257);
check_monster(1);
MOCK.packet(MOCK.entity_packet(MOCK.mob_id(900, 1), 0x30, 1));
MOCK.frame();
expect('despawn clears observer', lessons.seen(1, 257), false);
expect('despawn clears saved details', details.current(), nil);
MOCK.target.slot0 = 2; MOCK.frame();
MOCK.target.slot0 = 1; MOCK.frame();
check('same-ID return cannot restore used marker', has(live().value, 'Foot Kick (not learned, not observed)'));

used(1, 257);
command('blueseen off'); MOCK.frame();
expect('off clears retained observation immediately', lessons.seen(1, 257), false);
check('off removes marker from live row', not has(live().value, 'move seen') and not has(live().value, 'not observed'));
used(1, 257);
command('blueseen on'); MOCK.frame();
check('on cannot reuse moves received while off', has(live().value, 'Foot Kick (not learned, not observed)'));
command('bluepart lessons chat off');
command('bluepart lessons overlay off');
used(1, 257);
command('bluepart lessons overlay on'); MOCK.frame();
check('hidden lessons do not retain unseen background observations', has(live().value, 'Foot Kick (not learned, not observed)'));
command('bluepart lessons chat on');

-- Chat-only details keep their original stat/learning reading while move observations change.
command('overlay off');
command('show crit');
MOCK.frame();
lessons.forget();
local read_learning, input_reads = player.blue_learning, 0;
player.blue_learning = function(index)
    input_reads = input_reads + 1;
    return read_learning(index);
end;
check_monster(1);
expect('chat-only result is retained', details.current().id, MOCK.mob_id(900, 1));
check('chat-only result starts not observed', has(blue(details.current()).value, 'Foot Kick (not learned, not observed)'));
command('');
MOCK.typing['Find settings'] = 'target details';
MOCK.frame();
check('target details cache first shows the unobserved snapshot', MOCK.drew('Spell: Foot Kick')
    and MOCK.drew('Spellbook: not learned') and MOCK.drew('Move use: not observed'));
local read_count, at = input_reads, details.current().provenance.inputs_at;
local crit_low, crit_high = details.current().crit.low, details.current().crit.high;
MOCK.player.skills[43], MOCK.player.main_level = 200, 75;
MOCK.player.known_spells[577] = true;
used(1, 257);
check('chat-only saved marker updates after a completed move', has(blue(details.current()).value, 'Foot Kick (not learned, move seen)'));
check('visible target details invalidates its cached marker', MOCK.drew('Spell: Foot Kick')
    and MOCK.drew('Spellbook: not learned') and MOCK.drew('Move use: move seen'));
MOCK.clicks['Monster/Copy details'] = true;
MOCK.frame();
check('Copy details includes the refreshed observed marker', has(MOCK.clipboard, 'Spell: Foot Kick\nSpellbook: not learned\nMove use: move seen'));
expect('marker refresh does not reread learning inputs', input_reads, read_count);
expect('marker refresh preserves original input timestamp', details.current().provenance.inputs_at, at);
expect('marker refresh keeps prior critical low estimate', details.current().crit.low, crit_low);
expect('marker refresh keeps prior critical high estimate', details.current().crit.high, crit_high);
check('learning notes retain the original skill reading', has(table.concat(blue(details.current()).notes, ' '), 'Your skill at this reading: 25'));
command('blueseen off'); MOCK.frame();
check('saved snapshot removes markers when observations turn off', has(blue(details.current()).value, 'Foot Kick (not learned)')
    and not has(blue(details.current()).value, 'move seen'));
command('blueseen on'); MOCK.frame();
check('saved snapshot cannot reuse cleared observations', has(blue(details.current()).value, 'Foot Kick (not learned, not observed)'));
expect('snapshot option changes do not reread learning inputs', input_reads, read_count);
expect('snapshot option changes retain original timestamp', details.current().provenance.inputs_at, at);
expect('chat-only observation does not enable overlay', s.overlay.on, false);
expect('lesson observations and details send no game commands', #MOCK.commands, 0);
command('');
player.blue_learning = read_learning;

-- A late parameter response for an older manual check cannot replace the latest source-only details.
command('show hit');
check_monster(1);
MOCK.wait(1.6);
check('legacy hit estimate requested its normal parameter read', #MOCK.commands == 1 and MOCK.commands[1].command == '/checkparam <me>');
command('hide hit');
check_monster(2);
expect('new manual check becomes the details owner', details.current().id, MOCK.mob_id(900, 2));
MOCK.reply(300, 250); MOCK.frame();
expect('old asynchronous parameter reply cannot replace newer details', details.current().id, MOCK.mob_id(900, 2));
MOCK.packet(MOCK.entity_packet(MOCK.mob_id(900, 2), 0x30, 2)); MOCK.frame();
MOCK.reply(310, 260); MOCK.frame();
expect('late reply cannot restore disappeared manual details', details.current(), nil);
expect('observer adds no extra parameter requests', #MOCK.commands, 1);

return MOCK.report();
