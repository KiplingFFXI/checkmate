-- Saving, loading, renaming and deleting profiles, and what the shared file holds, window colors and font
-- included. It also covers a profile with settings missing, one with wrong types, a broken file, and job
-- links loading a profile when you zone in on another job.
local FILE = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json';
local function read_file()
    local f = io.open(FILE, 'r');
    if (f == nil) then return nil; end
    local text = f:read('*a');
    f:close();
    return text;
end
local function write_file(text)
    local f = assert(io.open(FILE, 'w'));
    f:write(text);
    f:close();
end

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local profiles = require('ui.profiles');
local json     = require('json');
local function cur() return MOCK.settings.current; end

check('no file is no profiles', profiles.file_ok() and #profiles.names() == 0);

-- Save, and what the file holds.
local s = cur();
s.drops.th = 3;
s.printout.order = 'drops hit evade crit magic immunities';
s.printout.extras_own_line = false;
s.printout.replace_game_line = false;
s.printout.divider = 'diamond';
s.printout.label_divider = 'custom';
s.printout.label_separator = ' >';
s.printout.defense_first = true;
s.colors.magic_name = 73;
s.printout.show_range = true;
s.printout.range_word = 'spawns';
s.colors.level_range = 69;
s.printout.show_id = true;
s.printout.id_word = 'Mob';
s.colors.id = 73;
s.printout.show_ph = true;
s.printout.ph_word = 'PH:';
s.colors.ph = 69;
s.printout.parts.aggro.on = false;
s.aggro.max_links = 9;
s.aggro.link_how = false;
s.aggro.threat_colors = false;
s.printout.parts.elements.on = true;
s.elements.weak_word = 'Soft';
s.elements.strength = false;
s.colors.elements_resist = 76;
s.look.imgui.buttons_pressed[1] = 0.25;
s.look.imgui.heading_lines = { 0.5, 0.6, 0.7, 0.8 };
s.look.font = 'tahoma';
s.look.font_size = 21;
s.job_links.WAR = 'Keep me';
s.window.width = 900;
check('save', profiles.save(s, 'Solo BLM'));
local text = read_file() or '';
check('the file is written', text ~= '');
check('the file is ASCII', not text:find('[^\32-\126]'));
check('job links and the window size aren\'t in it', not text:find('job_links', 1, true) and not text:find('"window"', 1, true));
local saved = json.decode(text)['Solo BLM'];
check('it holds the settings', saved.drops.th == 3 and saved.printout.order == s.printout.order
    and saved.printout.extras_own_line == false and saved.printout.replace_game_line == false
    and saved.printout.divider == 'diamond' and saved.look.imgui.buttons_pressed[1] == 0.25
    and saved.printout.defense_first == true and saved.colors.magic_name == 73);
check('and the label divider with its custom text', saved.printout.label_divider == 'custom'
    and saved.printout.label_separator == ' >');
check('and the level range, its word and its color', saved.printout.show_range == true
    and saved.printout.range_word == 'spawns' and saved.colors.level_range == 69);
check('and Show its ID, its word and its color', saved.printout.show_id == true and saved.printout.id_word == 'Mob'
    and saved.colors.id == 73);
check('and Show if it\'s a PH, its word and its color', saved.printout.show_ph == true and saved.printout.ph_word == 'PH:'
    and saved.colors.ph == 69);
check('and the aggro part and its settings', saved.printout.parts.aggro.on == false
    and saved.aggro.max_links == 9 and saved.aggro.link_how == false and saved.aggro.threat_colors == false);
check('and the elements part, its words, how strong and its colors', saved.printout.parts.elements.on == true
    and saved.elements.weak_word == 'Soft' and saved.elements.resist_word == 'Resists'
    and saved.elements.strength == false and saved.colors.elements_resist == 76);
local every = true;
for _, entry in ipairs(require('ui.skins').WINDOW_COLORS) do
    every = every and type(saved.look.imgui[entry.key]) == 'table';
end
check('it holds every window color, the font and the font size', every and saved.look.font == 'tahoma'
    and saved.look.font_size == 21);

-- Load.
s.drops.th = 0;
s.printout.order = 'hit evade crit magic immunities drops';
s.printout.extras_own_line = true;
s.printout.replace_game_line = true;
s.printout.divider = 'star';
s.printout.label_divider = 'colon';
s.printout.label_separator = ':';
s.printout.defense_first = false;
s.colors.magic_name = 106;
s.printout.show_range = false;
s.printout.range_word = 'range';
s.colors.level_range = 8;
s.printout.show_id = false;
s.printout.id_word = 'ID';
s.colors.id = 8;
s.printout.show_ph = false;
s.printout.ph_word = 'PH for';
s.colors.ph = 8;
s.printout.parts.aggro.on = true;
s.aggro.max_links = 5;
s.aggro.link_how = true;
s.aggro.threat_colors = true;
s.printout.parts.elements.on = false;
s.elements.weak_word = 'Weak';
s.elements.strength = true;
s.colors.elements_resist = 68;
s.look.imgui.buttons_pressed[1] = 1;
s.look.imgui.heading_lines = { 1, 1, 1, 1 };
s.look.font = 'ashita';
s.look.font_size = 18;
s.window.width = 700;
check('load', profiles.load(s, 'Solo BLM'));
check('load restores the settings', s.drops.th == 3 and s.printout.order == 'drops hit evade crit magic immunities'
    and s.printout.extras_own_line == false and s.printout.replace_game_line == false and s.printout.divider == 'diamond'
    and s.look.imgui.buttons_pressed[1] == 0.25 and s.printout.defense_first == true and s.colors.magic_name == 73);
check('and the label divider', s.printout.label_divider == 'custom' and s.printout.label_separator == ' >');
check('and the level range, its word and its color', s.printout.show_range == true and s.printout.range_word == 'spawns'
    and s.colors.level_range == 69);
check('and Show its ID, its word and its color', s.printout.show_id == true and s.printout.id_word == 'Mob'
    and s.colors.id == 73);
check('and Show if it\'s a PH, its word and its color', s.printout.show_ph == true and s.printout.ph_word == 'PH:'
    and s.colors.ph == 69);
check('and the window colors and font', s.look.imgui.heading_lines[4] == 0.8 and s.look.font == 'tahoma'
    and s.look.font_size == 21);
check('and the aggro part and its settings', s.printout.parts.aggro.on == false and s.aggro.max_links == 9
    and s.aggro.link_how == false and s.aggro.threat_colors == false and s.aggro.detection == true);
check('and the elements part, its words, how strong and its colors', s.printout.parts.elements.on == true
    and s.elements.weak_word == 'Soft' and s.elements.resist_word == 'Resists' and s.elements.strength == false
    and s.colors.elements_resist == 76);
check('and leaves job links and the window size', s.job_links.WAR == 'Keep me' and s.window.width == 700);
check('loading a missing profile fails', profiles.load(s, 'Nope') == false);
local skins = require('ui.skins');
skins.apply(s, 'ember');
check('a skin pick leaves something to undo', skins.can_undo());
profiles.load(s, 'Solo BLM');
check('loading a profile clears Undo, so it can\'t bring back the look from before', not skins.can_undo()
    and s.look.font == 'tahoma' and s.look.imgui.heading_lines[4] == 0.8);

-- Names.
profiles.save(s, 'apple');
profiles.save(s, 'Zebra');
local names = profiles.names();
check('names sort in any case', table.concat(names, ',') == 'apple,Solo BLM,Zebra', table.concat(names, ','));
check('names are cleaned', profiles.clean_name('  a\195\169b  ') == 'ab' and #profiles.clean_name(string.rep('x', 50)) == 32);
check('a blank name isn\'t saved', profiles.save(s, '   ') == false and not profiles.exists(''));
check('saving over a name replaces it', profiles.save(s, 'apple') and #profiles.names() == 3);

-- Rename and delete carry this character's job links.
s.job_links.BLM = 'Solo BLM';
check('rename', profiles.rename(s, 'Solo BLM', 'Nuker'));
check('rename moves the job link', s.job_links.BLM == 'Nuker' and profiles.exists('Nuker') and not profiles.exists('Solo BLM'));
check('rename refuses a name in use', profiles.rename(s, 'Nuker', 'apple') == false and profiles.exists('Nuker'));
check('rename refuses a missing profile', profiles.rename(s, 'Nope', 'New') == false);
check('rename refuses a blank name', profiles.rename(s, 'Nuker', ' ') == false);
check('delete', profiles.delete(s, 'Nuker'));
check('delete clears its job link', s.job_links.BLM == nil and not profiles.exists('Nuker'));
check('deleting a missing profile fails', profiles.delete(s, 'Nuker') == false);

-- Another game window saves a profile. The file is read again before each change, so it survives.
local other = json.decode(read_file());
other['From the other window'] = { drops = { th = 1 } };
write_file(json.encode(other));
profiles.save(s, 'Mine');
check('another window\'s profile survives a save', profiles.exists('From the other window') and profiles.exists('Mine'));

-- A profile that holds only a few settings, and one with wrong types.
write_file('{"Partial":{"printout":{"order":"drops hit evade crit magic immunities","parts":{"hit":{"on":true}}}},'
    .. '"Bad":{"drops":"nope","printout":{"header":"yes","label_divider":"nope","label_separator":7},'
    .. '"look":{"skin":"ember","imgui":{"text":[1,0,0,1]},"font":"comic","font_size":99},'
    .. '"colors":{"name":0,"line":"red","level":69}}}');
profiles.refresh();
MOCK.command('/checkmate profile load Partial');
s = cur();
check('missing part keys come from the defaults', s.printout.parts.hit.on == true and s.printout.parts.hit.label == 'Hit'
    and s.printout.parts.drops.label == 'Drops' and s.printout.parts.name.on == true);
check('an order missing parts gets difficulty first, aggro right after crit, elements after immunities and pet last',
    s.printout.order == 'difficulty drops hit evade crit aggro magic immunities elements pet', s.printout.order);
check('and the elements part, its settings and its colors from the defaults', s.printout.parts.elements.on == false
    and s.printout.parts.elements.label == 'Elements' and s.printout.parts.elements.new_line == true
    and s.elements.weak_word == 'Weak' and s.elements.resist_word == 'Resists' and s.elements.strength == true
    and s.colors.elements_label == 106 and s.colors.elements_weak == 2 and s.colors.elements_resist == 68
    and s.colors.elements_detail == 106);
check('and the aggro part and its settings from the defaults', s.printout.parts.aggro.on == true
    and s.printout.parts.aggro.label == 'Aggro' and s.printout.parts.aggro.new_line == true and s.aggro.threat_colors == true
    and s.aggro.detection == true and s.aggro.link_names == true and s.aggro.max_links == 5 and s.aggro.link_how == true
    and s.colors.aggro_threat == 76 and s.colors.aggro_safe == 2 and s.colors.aggro_label == 106);
check('and the pet part, its settings and the Phoenix pet colors from the defaults', s.printout.parts.pet.on == false
    and s.printout.parts.pet.label == 'Pet' and s.printout.parts.pet.new_line == true and s.pet.show_name == true
    and s.pet.show_level == true and s.pet.hit_word == 'Hit' and s.pet.evade_word == 'Evade' and s.colors.pet_label == 106
    and s.colors.pet_name == 106 and s.colors.pet_level == 106 and s.colors.pet_number == 106 and s.colors.pet_detail == 106);
check('and the difficulty and reading parts, on', s.printout.parts.difficulty.on == true
    and s.printout.parts.reading.on == true and s.printout.con_colors == true);
check('and the extras on their own line', s.printout.extras_own_line == true);
check('and the game\'s /check line replaced', s.printout.replace_game_line == true);
check('missing sections come from the defaults', s.drops.th == 0 and s.magic.schools.blue ~= nil
    and s.immunities.curse.label == 'Curse' and s.grades.hit_good == 85);
check('the window look is filled', type(s.look.imgui.background) == 'table' and type(s.look.imgui.open_tab_line) == 'table'
    and s.look.skin == 'phoenix');
check('and the font from the defaults', s.look.font == 'ashita' and s.look.font_size == 18);
check('and Star between parts', s.printout.divider == 'star' and s.printout.separator == '  ');
check('and Colon after its labels', s.printout.label_divider == 'colon' and s.printout.label_separator == ':');
check('and the level range off, with the word range and the Phoenix range color', s.printout.show_range == false
    and s.printout.range_word == 'range' and s.colors.level_range == 8);
check('and Show its ID off, with the word ID and the Phoenix ID color', s.printout.show_id == false
    and s.printout.id_word == 'ID' and s.colors.id == 8);
check('and Show if it\'s a PH off, with the word PH for and the Phoenix PH color', s.printout.show_ph == false
    and s.printout.ph_word == 'PH for' and s.colors.ph == 8);
check('and the default colors', s.colors.line == 106 and s.colors.name == 8 and s.colors.decent_challenge == 102
    and s.printout.defense_first == false);
MOCK.command('/checkmate profile load Bad');
s = cur();
check('wrong types become defaults', type(s.drops) == 'table' and s.drops.max_items == 5 and s.printout.header == true);
check('an unknown label divider becomes Colon', s.printout.label_divider == 'colon' and s.printout.label_separator == ':');
check('its window look is kept and filled from its skin', s.look.skin == 'ember' and s.look.imgui.text[2] == 0
    and s.look.imgui.rounding == 2);
check('its broken colors come from its skin and a good one stays', s.colors.name == 76 and s.colors.line == 7
    and s.colors.level == 69);
check('an unknown font becomes Ashita\'s and a size too big the biggest', s.look.font == 'ashita' and s.look.font_size == 24);

-- A Classic profile saved before the pet colors gets them from Classic, so it's still Classic.
local PET_COLORS = { 'pet_label', 'pet_name', 'pet_level', 'pet_number', 'pet_detail' };
skins.apply(s, 'classic');
profiles.save(s, 'Old Classic');
local old = json.decode(read_file());
for _, key in ipairs(PET_COLORS) do old['Old Classic'].colors[key] = nil; end
write_file(json.encode(old));
profiles.refresh();
skins.apply(s, 'ember');
MOCK.command('/checkmate profile load "Old Classic"');
s = cur();
local pet_colors = {};
for _, key in ipairs(PET_COLORS) do pet_colors[#pet_colors + 1] = tostring(s.colors[key]); end
check('a Classic profile without the pet colors loads Classic\'s', table.concat(pet_colors, ',') == '7,106,106,1,67',
    table.concat(pet_colors, ','));
check('and stays Classic', s.look.skin == 'classic' and skins.current(s) == skins.find('classic'));

-- A broken file is never written over.
write_file('{broken');
profiles.refresh();
check('a broken file is noticed', profiles.file_ok() == false);
check('and not written over', profiles.save(s, 'X') == false and read_file() == '{broken');
MOCK.command('/checkmate profile save X');
check('the command says so', (MOCK.printed[#MOCK.printed] or ''):find('Couldn\'t save the profile "X".', 1, true) ~= nil);
os.remove(FILE);
profiles.refresh();
check('no file again is no profiles', profiles.file_ok() and #profiles.names() == 0);

-- Zoning in on another main job loads its linked profile.
s = cur();
s.drops.th = 4;
profiles.save(s, 'Thief');
s.drops.th = 0;
s.job_links.THF = 'Thief';
s.job_links.WAR = 'Gone';
MOCK.player.main_job = 1;
MOCK.zone_in();
MOCK.frame();
check('the first job read loads nothing', cur().drops.th == 0);
MOCK.player.main_job = 6;
MOCK.zoning = true;
MOCK.zone_in();
MOCK.frame();
check('nothing while zoning', cur().drops.th == 0);
MOCK.zoning = false;
local n = #MOCK.printed;
MOCK.frame();
check('the linked profile loads on arrival', cur().drops.th == 4, cur().drops.th);
check('and says so', MOCK.printed_since(n)[1]
    == '[checkmate] Your settings now come from the profile "Thief", since it\'s linked to this job.', MOCK.printed_since(n)[1]);
check('job links survive the load', cur().job_links.THF == 'Thief');
cur().drops.th = 1;
MOCK.zone_in();
MOCK.frame();
check('the same job loads nothing', cur().drops.th == 1);
MOCK.player.main_job = 1;
n = #MOCK.printed;
MOCK.zone_in();
MOCK.frame();
check('a link to a missing profile loads nothing', cur().drops.th == 1 and #MOCK.printed == n);
MOCK.player.main_job = 3;
MOCK.zone_in();
MOCK.frame();
check('an unlinked job loads nothing', cur().drops.th == 1);
check('jobs past the era load nothing', profiles.on_job(cur(), 19) == nil and profiles.on_job(cur(), 0) == nil);

-- Another character logs in with their own settings. Links belong to each character.
MOCK.settings.switch_character({ job_links = { WHM = 'Thief' } });
check('the next character has their own links', cur().job_links.THF == nil and cur().job_links.WHM == 'Thief');
n = #MOCK.printed;
MOCK.frame();
check('their first job read loads nothing', #MOCK.printed == n and cur().drops.th == 0);

return MOCK.report();
