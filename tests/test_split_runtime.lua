-- Independent rows use only their display's enabled components.
addon.path = FIXTURES_PATH;
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local target = require('core.target');
local player = require('core.player');
local monsters = require('core.monsters');
local overlay = require('ui.overlay');
local function command(value) MOCK.command('/checkmate ' .. value); end
MOCK.player.main_level, MOCK.player.zone = 40, 900;
MOCK.zone_in(900);
MOCK.target_monster(1, 'Fixture Goblin');
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.info = {};
for _, id in ipairs({ 'family', 'vitals', 'movement', 'pursuit', 'spawn', 'claim', 'dangers', 'fight', 'traits', 'crystal', 'rewards' }) do
    row.info[id] = { value = id .. ' fixture' };
end
row.info.blue = { spells = { { id = 577, name = 'Foot Kick' } } };
row.info.charm = { value = 'Charmable fixture' };
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.printout.replace_game_line = false;
command('overlay on');
for _, id in ipairs({ 'family', 'vitals', 'movement', 'pursuit', 'spawn', 'claim', 'dangers', 'fight', 'traits', 'crystal', 'rewards' }) do
    s.info[id] = false;
    s.overlay.parts[id] = true;
    overlay.changed(s);
    MOCK.frame();
    local out = target.current();
    check(id .. ' is its own row without the former Monster master', out.info and #out.info.sections == 1
        and out.info.sections[1].id == id, out.info and out.info.sections[1].id);
    s.overlay.parts[id] = false;
end
MOCK.player.spell_data, MOCK.player.known_spells = true, {};
s.overlay.parts.blue = true;
s.blue.overlay.lessons, s.blue.overlay.chance = true, false;
s.info.blue, s.magic.schools.blue.on = false, false;
local reads, polls = 0, 0;
local read, poll = player.read, player.inputs_changed;
player.read = function (...) reads = reads + 1; return read(...); end;
player.inputs_changed = function (...) polls = polls + 1; return poll(...); end;
overlay.changed(s);
MOCK.wait(1);
local out = target.current();
check('Blue lessons ignore obsolete global section flags', out.info and out.info.sections[1].id == 'blue');
check('Blue lessons alone do not compute or poll magic', out.magic == nil and reads == 0 and polls == 0);
MOCK.player.skills = { [43] = 150, [36] = 150 };
s.blue.overlay.lessons, s.blue.overlay.chance = false, true;
s.magic.schools.elemental.on = true;
overlay.changed(s);
MOCK.wait(0.3);
out = target.current();
check('Blue chance works while the Magic row and old Blue switch are off', out.magic and #out.magic == 1
    and out.magic[1].school == 'school_blue' and out.info == nil);
check('an enabled Blue chance uses combat inputs', reads > 0 and polls > 0);
s.overlay.parts.blue, s.overlay.parts.magic = false, true;
overlay.changed(s);
MOCK.frame();
out = target.current();
check('Magic does not calculate the hidden Blue row', out.magic and #out.magic == 1
    and out.magic[1].school == 'school_elemental');
s.overlay.parts.magic, s.overlay.parts.weaknesses = false, true;
s.weaknesses.overlay = { elements = false, weapons = false, immunities = false, charm = true };
s.weaknesses.chat = { elements = true, weapons = true, immunities = true, charm = false };
overlay.changed(s);
MOCK.frame();
out = target.current();
check('overlay Weaknesses uses only its own components', out.info and out.info.sections[1].id == 'charm'
    and out.elements == nil and out.weapons == nil and out.immune == nil);
command('bluepart lessons chat on');
check('Blue chat component command leaves overlay choice alone', s.blue.chat.lessons and not s.blue.overlay.lessons);
command('weakness elements overlay on');
check('Weaknesses component command leaves other choices alone', s.weaknesses.overlay.elements and s.weaknesses.overlay.charm
    and not s.weaknesses.overlay.weapons and s.weaknesses.chat.elements);
command('immuneword "No effect"');
expect('combined immunity word is saved', MOCK.last_save.weaknesses.immune_word, 'No effect');
command('abbreviations on');
command('overlayabbreviations on');
command('abbreviation con_tough Tougher');
check('canonical abbreviation commands retain the existing saved keys', s.printout.short_words and s.overlay.short_words
    and s.short.con_tough == 'Tougher');
command('abbreviationreset con_tough');
expect('canonical reset restores the abbreviation', s.short.con_tough, 'T');
command('short off');
command('overlayshort off');
check('the old abbreviation aliases still work', not s.printout.short_words and not s.overlay.short_words);
expect('all independent rows and display changes send no game commands', #MOCK.commands, 0);
player.read, player.inputs_changed = read, poll;
return MOCK.report();
