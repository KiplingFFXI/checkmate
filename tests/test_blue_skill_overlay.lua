-- Skill labels stay in the overlay and follow the client's current Blue Magic skill.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;
local player = require('core.player');
local target = require('core.target');
local monsters = require('core.monsters');
local info = require('core.info');
local printout = require('core.printout');
local lessons = require('core.lessons');
local function command(value) MOCK.command('/checkmate ' .. value); end
local function blue(result)
    for _, section in ipairs((result.info or {}).sections or {}) do
        if (section.id == 'blue') then return section; end
    end
end
local function text(result, overlay)
    return MOCK.plain(table.concat(printout.lines(overlay and printout.overlay_view(s) or s, result), '\n'));
end
local function has(value, needle) return value:find(needle, 1, true) ~= nil; end

expect('inline skill labels start off', s.blue.skill_status, false);
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
MOCK.player.main_job, MOCK.player.skills[43] = 16, 15;
MOCK.player.spell_data, MOCK.player.known_spells = true, { [577] = true };
MOCK.target_monster(1, 'Fixture Goblin');
MOCK.frame();
local row = monsters.find(900, MOCK.mob_id(900, 1), 'Fixture Goblin');
row.info = { blue = { spells = {
    { id = 577, name = 'Foot Kick', min_skill = 0, skill_ids = { 300 } },
    { id = 578, name = 'Helldive', min_skill = 20, skill_ids = { 301 } },
    { id = 579, name = 'Missing Requirement', skill_ids = { 302 } },
} } };
for _, part in pairs(s.printout.parts) do part.on = false; end
for id in pairs(s.overlay.parts) do s.overlay.parts[id] = false; end
s.blue.requirements, s.blue.only_unlearned, s.blue.seen = false, false, false;
s.blue.chat.lessons, s.blue.chat.chance = true, false;
s.blue.overlay.lessons, s.blue.overlay.chance = true, false;
command('show blue');
command('overlayshow blue');
command('overlay on');
MOCK.frame();

local raw_skill, reads = player.blue_skill, 0;
player.blue_skill = function () reads = reads + 1; return raw_skill(); end;
local result = target.readout(s);
local plain_value = 'Foot Kick (known), Helldive (not learned), Missing Requirement (not learned)';
expect('the existing spell list is unchanged with the option off', blue(result).value, plain_value);
check('the default overlay has no inline skill labels', not has(text(result, true), 'Skill '));
local before = reads;
MOCK.now = MOCK.now + 1;
target.readout(s);
expect('disabled labels do not poll Blue Magic skill', reads, before);

command('blueskill on');
expect('the command saves the overlay choice', MOCK.last_save.blue.skill_status, true);
result = target.readout(s);
local first = blue(result);
expect('the base section keeps its existing value', first.value, plain_value);
local expected = 'Foot Kick (known, Skill met: 15/0), Helldive (not learned, Skill too low: 15/20), '
    .. 'Missing Requirement (not learned, Skill unknown)';
expect('each displayed spell gets its own skill result', info.blue_skill_value(first), expected);
check('the overlay displays the shortfall', has(text(result, true), 'Helldive (not learned, Skill too low: 15/20)'));
check('chat does not gain overlay skill labels', not has(text(result, false), 'Skill '));
check('inline labels work with the requirement notes off', not has(table.concat(first.notes, ' '), 'needs Blue Magic skill'));

local read_player, changed_player = player.read, player.inputs_changed;
player.read = function () error('the BLU row does not need a full player read'); end;
player.inputs_changed = function () error('the BLU row does not need the combat input scan'); end;
before = reads;
local quiet = true;
for _ = 1, 50 do
    MOCK.now = MOCK.now + 0.01;
    local current, changed = target.readout(s);
    quiet = quiet and current == result and changed == false;
end
check('quiet frames keep the same readout without rebuilding', quiet);
check('quiet skill polling stays limited to four reads a second', reads > before and reads - before <= 3);
MOCK.player.skills[43] = 20;
MOCK.now = MOCK.now + 0.3;
result = target.readout(s);
check('a skill-up refreshes a BLU-only overlay', has(text(result, true), 'Helldive (not learned, Skill met: 20/20)'));
check('the earlier reading keeps its own skill', has(info.blue_skill_value(first), 'Skill too low: 15/20'));
expect('refreshing the overlay does not rewrite its base value', blue(result).value, plain_value);
MOCK.player.skills[43] = 25;
MOCK.now = MOCK.now + 0.3;
result = target.readout(s);
check('skill above the minimum keeps both values', has(text(result, true), 'Helldive (not learned, Skill met: 25/20)'));
MOCK.player.skills[43] = 20;
MOCK.now = MOCK.now + 0.3;
target.readout(s);
player.read, player.inputs_changed = read_player, changed_player;

command('profile save SkillLabels');
command('blueskill off');
command('profile load SkillLabels');
expect('profiles keep the inline skill choice', s.blue.skill_status, true);
command('blueunlearned on');
result = target.readout(s);
check('the learned filter still removes known spells', not has(text(result, true), 'Foot Kick'));
MOCK.player.spell_data = false;
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 132) });
result = target.readout(s);
check('an unknown spellbook keeps skill and spellbook status separate',
    has(text(result, true), 'Helldive (spellbook unknown, Skill met: 20/20)'));
MOCK.player.spell_data = true;
MOCK.packet({ id = 0x0AA, size = 132, data = string.rep('\0', 132) });
command('blueunlearned off');

local observed = lessons.spell_seen;
lessons.spell_seen = function () return true; end;
command('blueseen on');
result = target.readout(s);
check('move observations appear after the skill label',
    has(text(result, true), 'Helldive (not learned, Skill met: 20/20, move seen)'));
check('observed moves still leave chat free of skill labels', not has(text(result, false), 'Skill '));
lessons.spell_seen = observed;
command('blueseen off');

local learning, skill_reader = player.blue_learning, player.blue_skill;
player.blue_learning = function () return {}; end;
player.blue_skill = function () return nil; end;
local unknown = info.readout({ info = row.info }, 39, 39, { blue_options = {
    requirements = false, skill_status = true,
} }, 1).sections[1];
check('an unreadable current skill stays unknown', has(info.blue_skill_value(unknown), 'Helldive (not learned, Skill unknown)'));
check('zero required skill still needs a readable current skill', has(info.blue_skill_value(unknown), 'Foot Kick (known, Skill unknown)'));
player.blue_learning = learning;
player.blue_skill = skill_reader;

player.blue_learning = function () error('inline skill labels do not need HP, job or distance'); end;
local skill_only = info.readout({ info = row.info }, 39, 39, { blue_options = {
    requirements = false, skill_status = true,
} }, 1).sections[1];
check('labels without requirement notes read only the current skill',
    has(info.blue_skill_value(skill_only), 'Helldive (not learned, Skill met: 20/20)'));
player.blue_learning = function () return {}; end;
local partial = info.readout({ info = row.info }, 39, 39, { blue_options = {
    requirements = true, skill_status = true,
} }, 1).sections[1];
check('unreadable learning details do not hide readable skill',
    has(info.blue_skill_value(partial), 'Helldive (not learned, Skill met: 20/20)'));
player.blue_learning = learning;

MOCK.player.skills[43] = 0;
MOCK.now = MOCK.now + 0.3;
result = target.readout(s);
check('zero current skill meets a zero requirement', has(text(result, true), 'Foot Kick (known, Skill met: 0/0)'));
check('zero current skill does not meet a higher requirement', has(text(result, true), 'Helldive (not learned, Skill too low: 0/20)'));
MOCK.player.skills[43] = -1;
MOCK.now = MOCK.now + 0.3;
result = target.readout(s);
check('an invalid client skill refreshes to unknown', has(text(result, true), 'Helldive (not learned, Skill unknown)'));
MOCK.player.skills[43] = 20;
MOCK.now = MOCK.now + 0.3;
result = target.readout(s);
check('a readable client skill restores the answer', has(text(result, true), 'Helldive (not learned, Skill met: 20/20)'));

command('blueskill off');
result = target.readout(s);
check('turning labels off restores the old overlay text', not has(text(result, true), 'Skill '));
before = reads;
MOCK.now = MOCK.now + 1;
target.readout(s);
expect('turning labels off stops skill polling', reads, before);
command('blueskill on');
command('overlayhide blue');
target.readout(s);
before = reads;
MOCK.now = MOCK.now + 1;
target.readout(s);
expect('a hidden BLU row does not poll skill', reads, before);
command('overlayshow blue');
s.blue.overlay.lessons = false;
target.mark_stale();
target.readout(s);
before = reads;
MOCK.now = MOCK.now + 1;
target.readout(s);
expect('a hidden spell component does not poll skill', reads, before);
s.blue.overlay.lessons = true;
row.info = nil;
target.mark_stale();
target.readout(s);
before = reads;
MOCK.now = MOCK.now + 1;
target.readout(s);
expect('a monster with no possible BLU spells does not poll skill', reads, before);
expect('inline skill labels send no game commands', #MOCK.commands, 0);
return MOCK.report();
