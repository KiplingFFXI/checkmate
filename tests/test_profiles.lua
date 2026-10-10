-- Saving, loading, renaming and deleting profiles, and what the shared file holds, window colors, font and the
-- overlay included, and where the overlay sits left out. It also covers a profile with settings missing, one with
-- wrong types, a broken file, job links loading a profile when you zone in on another job, a profile from
-- before the overlay leaving yours as it was, a profile from before Links was a part of its own, and short words,
-- with a profile from before them leaving both switches and your short forms as they were.
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
s.printout.order = 'drops hit evade crit magic weaknesses';
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
s.aggro.threat_colors = false;
s.printout.parts.links.label = 'Pulls';
s.links.max_links = 9;
s.links.link_how = false;
s.colors.links_detail = 69;
s.printout.parts.weaknesses.on = true;
s.elements.weak_word = 'Soft';
s.elements.strength = false;
s.colors.elements_resist = 76;
s.printout.parts.effects.on = true;
s.printout.parts.effects.label = 'Affects';
s.effects.show, s.effects.times = 'debuffs', false;
s.colors.effects_name = 73;
s.printout.parts.offhand.on = true;
s.printout.parts.ranged.label = 'Bow';
s.ranged.show_far = true;
s.colors.ranged_detail = 73;
s.look.imgui.buttons_pressed[1] = 0.25;
s.look.imgui.heading_lines = { 0.5, 0.6, 0.7, 0.8 };
s.look.font = 'tahoma';
s.look.font_size = 21;
s.overlay.on = true;
s.overlay.parts.drops = true;
s.overlay.parts.crit = true;
s.overlay.divider = 'slash';
s.overlay.font_size = 20;
s.overlay.opacity = 40;
s.job_links.WAR = 'Keep me';
s.window.width = 900;
s.window.overlay_x = 300;
s.window.tabs.Magic = false;
check('save', profiles.save(s, 'Solo BLM'));
local text = read_file() or '';
check('the file is written', text ~= '');
check('the file is ASCII', not text:find('[^\32-\126]'));
check('job links, the window size and where the overlay sits aren\'t in it', not text:find('job_links', 1, true)
    and not text:find('"window"', 1, true) and not text:find('overlay_x', 1, true));
check('visible tabs stay out of shared profiles', json.decode(text)['Solo BLM'].window == nil);
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
    and saved.aggro.threat_colors == false and saved.aggro.max_links == nil and saved.aggro.link_how == nil);
check('and the links part, its settings and its colors', saved.printout.parts.links.on == true
    and saved.printout.parts.links.label == 'Pulls' and saved.links.max_links == 9 and saved.links.link_how == false
    and saved.links.link_names == true and saved.colors.links_detail == 69);
check('and the elements part, its words, how strong and its colors', saved.printout.parts.weaknesses.on == true
    and saved.elements.weak_word == 'Soft' and saved.elements.resist_word == 'Resists'
    and saved.elements.strength == false and saved.colors.elements_resist == 76);
check('and the effects part, its settings and its color', saved.printout.parts.effects.on == true
    and saved.printout.parts.effects.label == 'Affects' and saved.effects.show == 'debuffs'
    and saved.effects.times == false and saved.colors.effects_name == 73);
check('and the off-hand and ranged parts, Show it outside the sweet spot too and their colors',
    saved.printout.parts.offhand.on == true and saved.printout.parts.ranged.label == 'Bow' and saved.ranged.show_far == true
    and saved.colors.ranged_detail == 73);
local every = true;
for _, entry in ipairs(require('ui.skins').WINDOW_COLORS) do
    every = every and type(saved.look.imgui[entry.key]) == 'table';
end
check('it holds every window color, the font and the font size', every and saved.look.font == 'tahoma'
    and saved.look.font_size == 21);
check('and the overlay\'s settings', saved.overlay.on == true and saved.overlay.parts.drops == true
    and saved.overlay.parts.crit == true and saved.overlay.divider == 'slash' and saved.overlay.font_size == 20
    and saved.overlay.opacity == 40 and saved.overlay.wrap == 520);

-- Load.
s.drops.th = 0;
s.printout.order = 'hit evade crit magic weaknesses drops';
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
s.aggro.threat_colors = true;
s.printout.parts.links.on = false;
s.printout.parts.links.label = '';
s.links.max_links = 5;
s.links.link_how = true;
s.colors.links_detail = 106;
s.printout.parts.weaknesses.on = false;
s.elements.weak_word = 'Weak';
s.elements.strength = true;
s.colors.elements_resist = 68;
s.printout.parts.effects.on = false;
s.printout.parts.effects.label = 'Effects';
s.effects.show, s.effects.times = 'both', true;
s.colors.effects_name = 106;
s.printout.parts.offhand.on = false;
s.printout.parts.ranged.label = 'Ranged';
s.ranged.show_far = false;
s.colors.ranged_detail = 106;
s.look.imgui.buttons_pressed[1] = 1;
s.look.imgui.heading_lines = { 1, 1, 1, 1 };
s.look.font = 'ashita';
s.look.font_size = 18;
s.overlay.on = false;
s.overlay.parts.drops = false;
s.overlay.parts.crit = false;
s.overlay.divider = 'pipe';
s.overlay.font_size = 16;
s.overlay.opacity = 80;
s.window.width = 700;
s.window.overlay_x = 20;
s.window.tabs.Magic, s.window.tabs['Blue Magic'] = true, false;
check('load', profiles.load(s, 'Solo BLM'));
check('loading a profile keeps this character\'s tab visibility', s.window.tabs.Magic
    and not s.window.tabs['Blue Magic'] and s.window.tabs.Appearance);
check('load restores the settings', s.drops.th == 3 and s.printout.order == 'drops hit evade crit magic weaknesses'
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
check('and the aggro part and its settings', s.printout.parts.aggro.on == false and s.aggro.threat_colors == false
    and s.aggro.detection == true);
check('and the links part, its settings and its colors', s.printout.parts.links.on == true
    and s.printout.parts.links.label == 'Pulls' and s.links.max_links == 9 and s.links.link_how == false
    and s.links.link_names == true and s.colors.links_detail == 69);
check('and the elements part, its words, how strong and its colors', s.printout.parts.weaknesses.on == true
    and s.elements.weak_word == 'Soft' and s.elements.resist_word == 'Resists' and s.elements.strength == false
    and s.colors.elements_resist == 76);
check('and the effects part, its settings and its color', s.printout.parts.effects.on == true
    and s.printout.parts.effects.label == 'Affects' and s.effects.show == 'debuffs'
    and s.effects.times == false and s.colors.effects_name == 73);
check('and the off-hand and ranged parts, Show it outside the sweet spot too and their colors',
    s.printout.parts.offhand.on == true and s.printout.parts.ranged.label == 'Bow' and s.ranged.show_far == true
    and s.colors.ranged_detail == 73);
check('and the overlay, on, with its parts and look', s.overlay.on == true and s.overlay.parts.drops == true
    and s.overlay.parts.crit == true and s.overlay.divider == 'slash' and s.overlay.font_size == 20 and s.overlay.opacity == 40);
check('and leaves job links, the window size and where the overlay sits', s.job_links.WAR == 'Keep me'
    and s.window.width == 700 and s.window.overlay_x == 20);
s.overlay.on = false;
check('loading a missing profile fails', profiles.load(s, 'Nope') == false);
local skins = require('ui.skins');
skins.apply(s, 'ember');
check('a skin pick leaves something to undo', skins.can_undo());
profiles.load(s, 'Solo BLM');
check('loading a profile clears Undo, so it can\'t bring back the look from before', not skins.can_undo()
    and s.look.font == 'tahoma' and s.look.imgui.heading_lines[4] == 0.8);
s.overlay.on = false;

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
    .. '"aggro":{"max_links":"5","link_how":7},'
    .. '"look":{"skin":"ember","imgui":{"text":[1,0,0,1]},"font":"comic","font_size":99},'
    .. '"overlay":{"on":"yes","font":"comic","font_size":99,"divider":"star","opacity":"x","wrap":-5,"parts":"none"},'
    .. '"colors":{"name":0,"line":"red","level":69}}}');
profiles.refresh();
MOCK.command('/checkmate profile load Partial');
s = cur();
check('missing part keys come from the defaults', s.printout.parts.hit.on == true and s.printout.parts.hit.label == 'Hit'
    and s.printout.parts.drops.label == 'Drops' and s.printout.parts.name.on == true);
check('an order missing parts gets difficulty first, crit taken, job and aggro right after crit, effects and elements after '
    .. 'immunities and pet last', s.printout.order == 'difficulty drops steal hit pdif offhand offhandpdif ranged rangedpdif evade block parry crit crittaken job aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards pet',
    s.printout.order);
check('and the elements part, its settings and its colors from the defaults', s.printout.parts.weaknesses.on == false
    and s.printout.parts.weaknesses.label == 'Weaknesses' and s.printout.parts.weaknesses.new_line == true
    and s.elements.weak_word == 'Weak' and s.elements.resist_word == 'Resists' and s.elements.strength == true
    and s.colors.elements_label == 106 and s.colors.elements_weak == 2 and s.colors.elements_resist == 68
    and s.colors.elements_detail == 106);
check('and the effects part, its settings and its colors from the defaults', s.printout.parts.effects.on == false
    and s.printout.parts.effects.label == 'Effects' and s.printout.parts.effects.new_line == true
    and s.effects.show == 'both' and s.effects.times == true and s.colors.effects_label == 106
    and s.colors.effects_name == 106 and s.colors.effects_buff == 106 and s.colors.effects_time == 106
    and s.colors.effects_guess == 67 and s.colors.effects_detail == 106);
check('and the aggro part and its settings from the defaults', s.printout.parts.aggro.on == true
    and s.printout.parts.aggro.label == 'Aggro' and s.printout.parts.aggro.new_line == true and s.aggro.threat_colors == true
    and s.aggro.detection == true and s.colors.aggro_threat == 76 and s.colors.aggro_safe == 2
    and s.colors.aggro_label == 106);
check('and the links part, its settings and its colors from the defaults', s.printout.parts.links.on == true
    and s.printout.parts.links.label == '' and s.printout.parts.links.new_line == false and s.links.link_names == true
    and s.links.max_links == 5 and s.links.link_how == true and s.colors.links_label == 106
    and s.colors.links_words == 106 and s.colors.links_detail == 106);
check('and the pet part, its settings and the Phoenix pet colors from the defaults', s.printout.parts.pet.on == false
    and s.printout.parts.pet.label == 'Pet' and s.printout.parts.pet.new_line == true and s.pet.show_name == true
    and s.pet.show_level == true and s.pet.hit_word == 'Hit' and s.pet.evade_word == 'Evade' and s.colors.pet_label == 106
    and s.colors.pet_name == 106 and s.colors.pet_level == 106 and s.colors.pet_number == 106 and s.colors.pet_detail == 106);
check('and the off-hand and ranged parts off, Show it outside the sweet spot too off and the Phoenix colors from the '
    .. 'defaults', s.printout.parts.offhand.on == false and s.printout.parts.offhand.label == 'Off-hand'
    and s.printout.parts.ranged.on == false and s.printout.parts.ranged.label == 'Ranged'
    and s.printout.parts.ranged.new_line == false and s.ranged.show_far == false and s.colors.offhand_label == 106
    and s.colors.ranged_detail == 106);
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
check('but the overlay settings it doesn\'t have stay as they were', s.overlay.on == false and s.overlay.divider == 'slash'
    and s.overlay.font_size == 20 and s.overlay.parts.drops == true and s.overlay.parts.name == true);
MOCK.command('/checkmate profile load Bad');
s = cur();
check('wrong types become defaults', type(s.drops) == 'table' and s.drops.max_items == 5 and s.printout.header == true);
check('an unknown label divider becomes Colon', s.printout.label_divider == 'colon' and s.printout.label_separator == ':');
check('its window look is kept and filled from its skin', s.look.skin == 'ember' and s.look.imgui.text[2] == 0
    and s.look.imgui.rounding == 2);
check('its broken colors come from its skin and a good one stays', s.colors.name == 76 and s.colors.line == 7
    and s.colors.level == 69);
check('an unknown font becomes Ashita\'s and a size too big the biggest', s.look.font == 'ashita' and s.look.font_size == 24);
check('and the same for the overlay, with its symbol divider the pipe and its wrong types the defaults',
    s.overlay.on == false and s.overlay.font == 'ashita' and s.overlay.font_size == 24 and s.overlay.divider == 'pipe'
    and s.overlay.opacity == 80 and s.overlay.wrap == 0 and s.overlay.parts.name == true and s.overlay.parts.drops == false);
check('an old link setting of the wrong type keeps the default and leaves aggro', s.links.max_links == 5
    and s.links.link_how == true and rawget(s.aggro, 'max_links') == nil and rawget(s.aggro, 'link_how') == nil
    and s.printout.parts.links.on == s.printout.parts.aggro.on);
local before_sample = #MOCK.printed;
MOCK.command('/checkmate sample');
local bad_sample = table.concat(MOCK.printed_since(before_sample), ' / ');
check('so its sample prints the links', bad_sample:find('Links with ', 1, true) ~= nil, bad_sample);

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

-- An Ember profile saved before off-hand and ranged loads with both off, right after hit, and their colors from
-- Ember, so it's still Ember.
local WEAPON_COLORS = { 'offhand_label', 'offhand_number', 'offhand_detail', 'ranged_label', 'ranged_number',
    'ranged_detail' };
skins.apply(s, 'ember');
s.printout.order = 'difficulty hit evade crit aggro magic immunities elements drops pet';
profiles.save(s, 'Old Ember');
old = json.decode(read_file());
for _, key in ipairs(WEAPON_COLORS) do old['Old Ember'].colors[key] = nil; end
old['Old Ember'].printout.parts.offhand, old['Old Ember'].printout.parts.ranged, old['Old Ember'].ranged = nil, nil, nil;
write_file(json.encode(old));
profiles.refresh();
skins.apply(s, 'classic');
s.printout.parts.offhand.on, s.printout.parts.ranged.on = true, true;
MOCK.command('/checkmate profile load "Old Ember"');
s = cur();
local weapon_colors = {};
for _, key in ipairs(WEAPON_COLORS) do weapon_colors[#weapon_colors + 1] = tostring(s.colors[key]); end
check('an Ember profile from before off-hand and ranged loads them off, right after hit', s.printout.parts.offhand.on
    == false and s.printout.parts.ranged.on == false and s.ranged.show_far == false and s.printout.order == 'difficulty '
    .. 'hit pdif offhand offhandpdif ranged rangedpdif evade block parry crit crittaken job aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet',
    s.printout.order);
check('with Ember\'s colors for them', table.concat(weapon_colors, ',') == '78,7,85,78,7,85', table.concat(weapon_colors, ','));
check('and stays Ember', s.look.skin == 'ember' and skins.current(s) == skins.find('ember'));

-- A Colorblind safe profile saved before the Steal part loads with it off in chat and the overlay, right after drops
-- wherever drops went, and its colors from Colorblind safe, so it's still Colorblind safe.
local STEAL_COLORS = { 'steal_label', 'steal_name', 'steal_number', 'steal_detail' };
skins.apply(s, 'colorblind');
s.printout.order = 'difficulty hit offhand ranged evade crit aggro magic immunities elements pet drops';
profiles.save(s, 'Old Colorblind');
old = json.decode(read_file());
for _, key in ipairs(STEAL_COLORS) do old['Old Colorblind'].colors[key] = nil; end
old['Old Colorblind'].printout.parts.steal, old['Old Colorblind'].overlay.parts.steal = nil, nil;
write_file(json.encode(old));
profiles.refresh();
skins.apply(s, 'classic');
s.printout.parts.steal.on, s.overlay.parts.steal = true, true;
MOCK.command('/checkmate profile load "Old Colorblind"');
s = cur();
local steal_colors = {};
for _, key in ipairs(STEAL_COLORS) do steal_colors[#steal_colors + 1] = tostring(s.colors[key]); end
check('a Colorblind safe profile from before Steal loads it off, on its own line, right after drops',
    s.printout.parts.steal.on == false and s.printout.parts.steal.label == 'Steal' and s.printout.parts.steal.new_line == true
    and s.overlay.parts.steal == false and s.printout.order == 'difficulty hit pdif offhand offhandpdif ranged rangedpdif evade block parry crit crittaken job '
    .. 'aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards pet drops steal', s.printout.order);
check('with Colorblind safe\'s colors for it', table.concat(steal_colors, ',') == '106,106,1,67',
    table.concat(steal_colors, ','));
check('and stays Colorblind safe', s.look.skin == 'colorblind' and skins.current(s) == skins.find('colorblind'));

-- A High contrast profile saved before the Job part loads with it off in chat and the overlay, on its own line right
-- after crit and crit taken wherever crit went, and its colors from High contrast, so it's still High contrast.
local JOB_COLORS = { 'job_label', 'job_name', 'job_detail' };
skins.apply(s, 'contrast');
s.printout.order = 'difficulty crit hit offhand ranged evade aggro magic immunities elements drops steal pet';
profiles.save(s, 'Old Contrast');
old = json.decode(read_file());
for _, key in ipairs(JOB_COLORS) do old['Old Contrast'].colors[key] = nil; end
old['Old Contrast'].printout.parts.job, old['Old Contrast'].overlay.parts.job = nil, nil;
write_file(json.encode(old));
profiles.refresh();
skins.apply(s, 'classic');
s.printout.parts.job.on, s.overlay.parts.job = true, true;
MOCK.command('/checkmate profile load "Old Contrast"');
s = cur();
local job_colors = {};
for _, key in ipairs(JOB_COLORS) do job_colors[#job_colors + 1] = tostring(s.colors[key]); end
check('a High contrast profile from before the Job part loads it off, on its own line, right after crit taken',
    s.printout.parts.job.on == false and s.printout.parts.job.label == 'Job' and s.printout.parts.job.new_line == true
    and s.overlay.parts.job == false and s.printout.order == 'difficulty crit crittaken job hit pdif offhand offhandpdif ranged rangedpdif evade block parry '
    .. 'aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet', s.printout.order);
check('with High contrast\'s colors for it', table.concat(job_colors, ',') == '82,1,92', table.concat(job_colors, ','));
check('and stays High contrast', s.look.skin == 'contrast' and skins.current(s) == skins.find('contrast'));

-- A profile saved before Links was a part of its own keeps the link settings with aggro, and has no Links part, Links
-- colors or overlay. It loads with Links on when its Aggro was on, its link settings moved to the Links part and its
-- own aggro colors for the Links colors, so its /check lines print the same. Your overlay stays as it was.
local printout = require('core.printout');
local STAR = ' \129\154 ';
local function color(code) return '\30' .. string.char(code); end
local LINK_COLORS = { 'links_label', 'links_words', 'links_detail' };
local function from_before_links(name)
    old = json.decode(read_file());
    local p = old[name];
    p.aggro.link_names, p.aggro.max_links, p.aggro.link_how = p.links.link_names, p.links.max_links, p.links.link_how;
    p.links, p.printout.parts.links, p.overlay = nil, nil, nil;
    for _, key in ipairs(LINK_COLORS) do p.colors[key] = nil; end
    write_file(json.encode(old));
    profiles.refresh();
end
-- The sample's line that starts with `start`, plain and with its colors, or with no `start` all its lines joined.
local function sample(start)
    local n = #MOCK.printed;
    MOCK.command('/checkmate sample');
    local plain, raw = MOCK.printed_since(n), {};
    for i = n + 1, #MOCK.printed do raw[#raw + 1] = MOCK.printed[i]; end
    for i, line in ipairs(plain) do
        if (start ~= nil and line:sub(1, #start) == start) then return line, raw[i]; end
    end
    return table.concat(plain, ' / ');
end
skins.apply(s, 'ember');
s.printout.order = printout.DEFAULT_ORDER;
s.printout.parts.aggro.label = 'Agg';
s.colors.aggro_words, s.colors.aggro_detail = 73, 92;
s.links.max_links, s.links.link_how = 2, false;
profiles.save(s, 'Before links');
s.printout.parts.aggro.on = false;
profiles.save(s, 'Before links, aggro off');
from_before_links('Before links');
from_before_links('Before links, aggro off');
skins.apply(s, 'classic');
s.printout.parts.aggro.on, s.printout.parts.links.on = true, false;
s.links.max_links, s.links.link_how, s.links.link_names = 12, true, false;
s.overlay.parts.aggro, s.overlay.parts.links = true, false;
MOCK.command('/checkmate profile load "Before links"');
s = cur();
local link_colors = {};
for _, key in ipairs(LINK_COLORS) do link_colors[#link_colors + 1] = tostring(s.colors[key]); end
check('a profile from before Links loads it on, since its Aggro was on, right after Aggro with no label',
    s.printout.parts.links.on == true and s.printout.parts.links.label == '' and s.printout.parts.links.new_line == false
    and s.printout.order == printout.DEFAULT_ORDER, s.printout.order);
check('with its link settings moved to the Links part', s.links.max_links == 2 and s.links.link_how == false
    and s.links.link_names == true and s.aggro.max_links == nil and s.aggro.link_how == nil and s.aggro.link_names == nil);
check('and its own aggro colors for the Links colors', table.concat(link_colors, ',') == '78,73,92',
    table.concat(link_colors, ','));
check('and keeps its skin, Ember', s.look.skin == 'ember');
check('and leaves your overlay as it was', s.overlay.parts.aggro == true and s.overlay.parts.links == false);
check('and saves without the old settings', MOCK.last_save.links.max_links == 2 and MOCK.last_save.aggro.max_links == nil);
local line, raw = sample('[checkmate] Agg:');
expect('its sample keeps the migrated aggro settings with family grouping', line,
    '[checkmate] Agg: Aggressive (Sight)' .. STAR .. 'Links with Goblin family');
check('with the divider before Links in its Aggro Details color and Links in its Words color',
    (raw or ''):find(color(92) .. STAR .. color(73) .. 'Links with ', 1, true) ~= nil, MOCK.plain(raw or ''));
MOCK.command('/checkmate profile load "Before links, aggro off"');
s = cur();
check('one with Aggro off loads Links off', s.printout.parts.aggro.on == false and s.printout.parts.links.on == false
    and s.links.max_links == 2 and s.aggro.max_links == nil);
local text = sample();
check('so its sample has no aggro or links line', not text:find('Aggressive', 1, true) and not text:find('Links', 1, true),
    text);
MOCK.command('/checkmate show aggro');
s.printout.parts.aggro.label = 'Aggro';
s.overlay.parts.links = true;

-- The icon settings save and load with the rest.
s.printout.icons, s.printout.icons_only = true, true;
s.overlay.icons, s.overlay.icons_only, s.overlay.element_look = false, true, 'badges';
s.overlay.tips = false;
s.colors.badge_fire = 8;
profiles.save(s, 'Icons');
s.printout.icons, s.printout.icons_only = false, false;
s.overlay.icons, s.overlay.icons_only, s.overlay.element_look = true, false, 'game';
s.overlay.tips = true;
s.colors.badge_fire = 76;
MOCK.command('/checkmate profile load Icons');
s = cur();
check('a profile keeps the chat\'s and the overlay\'s icon settings and the badge colors', s.printout.icons == true
    and s.printout.icons_only == true and s.overlay.icons == false and s.overlay.icons_only == true
    and s.overlay.element_look == 'badges' and s.colors.badge_fire == 8);
check('and Tips on hover', s.overlay.tips == false);

-- A Colorblind safe profile saved before the icons loads with the chat's Element icons off, the overlay's icons as
-- they start and its badge colors from Colorblind safe, so it's still Colorblind safe.
local BADGE_COLORS = { 'badge_fire', 'badge_ice', 'badge_wind', 'badge_earth', 'badge_thunder', 'badge_water',
    'badge_light', 'badge_dark' };
skins.apply(s, 'colorblind');
profiles.save(s, 'Before icons');
old = json.decode(read_file());
local before_icons = old['Before icons'];
for _, key in ipairs(BADGE_COLORS) do before_icons.colors[key] = nil; end
before_icons.printout.icons, before_icons.printout.icons_only = nil, nil;
before_icons.overlay.icons, before_icons.overlay.icons_only, before_icons.overlay.element_look = nil, nil, nil;
before_icons.overlay.tips = nil;
write_file(json.encode(old));
profiles.refresh();
skins.apply(s, 'classic');
MOCK.command('/checkmate profile load "Before icons"');
s = cur();
local badge_colors = {};
for _, key in ipairs(BADGE_COLORS) do badge_colors[#badge_colors + 1] = tostring(s.colors[key]); end
check('a profile from before the icons loads the chat\'s off and the overlay\'s as they start', s.printout.icons == false
    and s.printout.icons_only == false and s.overlay.icons == true and s.overlay.icons_only == false
    and s.overlay.element_look == 'game');
check('and one without Tips on hover gets it on', s.overlay.tips == true);
check('with Colorblind safe\'s badge colors', table.concat(badge_colors, ',') == '76,92,67,69,105,3,106,72',
    table.concat(badge_colors, ','));
check('and stays Colorblind safe', s.look.skin == 'colorblind' and skins.current(s) == skins.find('colorblind'));

-- A profile saved before the overlay has no overlay settings, so loading it leaves yours as they are, the overlay
-- on and its look included. A profile with the overlay turns it on or off.
s.overlay.on = false;
s.drops.th = 2;
profiles.save(s, 'Before overlay');
old = json.decode(read_file());
old['Before overlay'].overlay = nil;
write_file(json.encode(old));
profiles.refresh();
s.overlay.on, s.overlay.font_size, s.overlay.opacity, s.overlay.parts.weaknesses = true, 22, 30, true;
s.drops.th = 0;
MOCK.command('/checkmate profile load "Before overlay"');
s = cur();
check('a profile from before the overlay loads', s.drops.th == 2);
check('and leaves the overlay on, with its parts and look', s.overlay.on == true and s.overlay.font_size == 22
    and s.overlay.opacity == 30 and s.overlay.parts.weaknesses == true and MOCK.last_save.overlay.on == true);
profiles.save(s, 'Overlay on');
s.overlay.on = false;
profiles.save(s, 'Overlay off');
MOCK.command('/checkmate profile load "Overlay on"');
check('a profile with the overlay on turns it on', cur().overlay.on == true);
MOCK.command('/checkmate profile load "Overlay off"');
check('and one with it off turns it off', cur().overlay.on == false and cur().overlay.font_size == 22);

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

-- A job linked to a profile from before the overlay leaves the overlay as it was, so changing jobs never turns it off.
s = cur();
s.overlay.on = false;
s.drops.th = 3;
profiles.save(s, 'Old Ninja');
old = json.decode(read_file());
old['Old Ninja'].overlay = nil;
write_file(json.encode(old));
profiles.refresh();
s.drops.th = 0;
MOCK.command('/checkmate overlay on');
MOCK.command('/checkmate overlayopacity 25');
cur().job_links.NIN = 'Old Ninja';
MOCK.player.main_job = 13;
MOCK.zone_in();
n = #MOCK.printed;
MOCK.frame();
check('a job link loads a profile from before the overlay', cur().drops.th == 3 and table.concat(MOCK.printed_since(n), ' / ')
    == '[checkmate] Your settings now come from the profile "Old Ninja", since it\'s linked to this job.',
    table.concat(MOCK.printed_since(n), ' / '));
check('and leaves the overlay on, with its look', cur().overlay.on == true and cur().overlay.opacity == 25
    and MOCK.last_save.overlay.on == true);
MOCK.command('/checkmate overlay off');

-- Short words save and load with the rest. A profile saved before 1.2.0 has no short forms and no Short words switch
-- for chat, so loading it, by hand or through a job link, leaves both switches and your short forms as they are. One
-- missing a few short forms gets those from the defaults.
s = cur();
s.printout.short_words, s.overlay.short_words = true, true;
s.short.aggro_aggressive, s.short.con_tough = 'Agg', '';
profiles.save(s, 'Short');
local saved_short = json.decode(read_file()).Short;
local short_keys = 0;
for _ in pairs(saved_short.short) do short_keys = short_keys + 1; end
check('a profile holds both switches and every short form', saved_short.printout.short_words == true
    and saved_short.overlay.short_words == true and saved_short.short.aggro_aggressive == 'Agg'
    and saved_short.short.con_tough == '' and short_keys == #require('core.wording').LIST, short_keys);
s.printout.short_words, s.overlay.short_words = false, false;
s.short.aggro_aggressive, s.short.con_tough = 'A', 'T';
MOCK.command('/checkmate profile load Short');
s = cur();
check('and loads them back', s.printout.short_words == true and s.overlay.short_words == true
    and s.short.aggro_aggressive == 'Agg' and s.short.con_tough == '');
s.printout.short_words = false;
profiles.save(s, 'Short off');
s.printout.short_words = true;
MOCK.command('/checkmate profile load "Short off"');
check('a profile saved with chat short words off loads them off', cur().printout.short_words == false);
old = json.decode(read_file());
local before_short = json.decode(json.encode(old.Short));
before_short.short, before_short.overlay, before_short.printout.short_words = nil, nil, nil;
before_short.printout.show_level = false;
old['Before short'] = before_short;
local missing_two = json.decode(json.encode(old.Short));
missing_two.short.aggro_aggressive, missing_two.short.con_tough = nil, nil;
missing_two.short.sense_sight = 'Eye';
old['Missing two'] = missing_two;
write_file(json.encode(old));
profiles.refresh();
for _, on in ipairs({ true, false }) do
    s = cur();
    s.printout.short_words, s.overlay.short_words = on, not on;
    s.short.note_asleep, s.printout.show_level = 'zz', true;
    MOCK.command('/checkmate profile load "Before short"');
    s = cur();
    check(('a profile from before short words keeps chat\'s switch %s and the overlay\'s %s'):format(on and 'on' or 'off',
        on and 'off' or 'on'), s.printout.short_words == on and s.overlay.short_words == not on
        and MOCK.last_save.printout.short_words == on);
    check('and the short forms you typed', s.short.note_asleep == 'zz' and s.short.aggro_aggressive == 'Agg');
    check('while its other printout settings load as saved', s.printout.show_level == false);
end
s.printout.short_words, s.short.note_asleep, s.printout.show_level = true, 'yy', true;
s.job_links.WHM = 'Before short';
MOCK.player.main_job = 3;
MOCK.zone_in();
n = #MOCK.printed;
MOCK.frame();
s = cur();
check('a job linked to it loads it and keeps chat short words on, with your short forms', s.printout.show_level == false
    and s.printout.short_words == true and s.short.note_asleep == 'yy' and table.concat(MOCK.printed_since(n), ' / ')
    == '[checkmate] Your settings now come from the profile "Before short", since it\'s linked to this job.',
    table.concat(MOCK.printed_since(n), ' / '));
MOCK.command('/checkmate profile load "Missing two"');
s = cur();
check('a profile missing two short forms gets those two from the defaults', s.short.aggro_aggressive == 'A'
    and s.short.con_tough == 'T' and s.short.sense_sight == 'Eye');
for _, name in ipairs({ 'Short', 'Short off', 'Before short', 'Missing two' }) do
    profiles.delete(s, name);
end
s.job_links.WHM = nil;

-- Display rows and component choices travel together, including explicit false values.
s = cur();
s.printout.parts.family.on, s.overlay.parts.family = false, true;
s.printout.parts.weaknesses.on, s.overlay.parts.weaknesses = true, true;
s.weaknesses.chat.elements, s.weaknesses.chat.charm = false, true;
s.weaknesses.overlay.elements, s.weaknesses.overlay.charm = true, false;
s.printout.parts.blue.on, s.overlay.parts.blue = true, true;
s.blue.chat.lessons, s.blue.chat.chance = false, true;
s.blue.overlay.lessons, s.blue.overlay.chance = true, false;
profiles.save(s, 'Layout choices');
s.printout.parts.family.on, s.overlay.parts.family = true, false;
s.weaknesses.chat.elements, s.weaknesses.overlay.charm = true, true;
s.blue.chat.lessons, s.blue.overlay.chance = true, true;
MOCK.command('/checkmate profile load "Layout choices"');
s = cur();
check('a new profile preserves explicit per-display row and component choices', not s.printout.parts.family.on
    and s.overlay.parts.family and not s.weaknesses.chat.elements and s.weaknesses.chat.charm
    and s.weaknesses.overlay.elements and not s.weaknesses.overlay.charm and not s.blue.chat.lessons
    and s.blue.chat.chance and s.blue.overlay.lessons and not s.blue.overlay.chance);
old = json.decode(read_file());
old['Legacy rows'] = { printout = { order = 'drops info elements hit', parts = { info = { on = true },
    elements = { on = false }, immunities = { on = true, label = 'Resists all' } } },
    info = { family = false, charm = true, blue = false } };
write_file(json.encode(old));
profiles.refresh();
local raw_legacy = read_file();
MOCK.command('/checkmate profile load "Legacy rows"');
s = cur();
check('an old profile migrates its chat choices without changing the current overlay', not s.printout.parts.family.on
    and s.printout.parts.vitals.on and s.weaknesses.chat.charm and s.weaknesses.chat.immunities
    and not s.weaknesses.chat.elements and s.weaknesses.immune_word == 'Resists all'
    and s.overlay.parts.family and s.overlay.parts.weaknesses and s.weaknesses.overlay.elements
    and not s.weaknesses.overlay.charm and s.overlay.parts.blue and s.blue.overlay.lessons
    and not s.blue.overlay.chance);
check('migration leaves the saved legacy profile untouched', read_file() == raw_legacy);
old = json.decode(read_file());
old['Malformed layout'] = { magic = true, printout = { parts = { info = { on = true } } } };
write_file(json.encode(old));
profiles.refresh();
MOCK.command('/checkmate profile load "Malformed layout"');
s = cur();
check('typed defaults still repair malformed profile magic after layout migration', type(s.magic) == 'table'
    and type(s.magic.schools.blue) == 'table' and s.printout.parts.family.on);
profiles.delete(s, 'Malformed layout');
profiles.delete(s, 'Layout choices');
profiles.delete(s, 'Legacy rows');

-- Another character logs in with their own settings. Links belong to each character.
MOCK.settings.switch_character({ job_links = { WHM = 'Thief' } });
check('another character has fresh tab visibility', cur().window.tabs.Magic and cur().window.tabs['Blue Magic']);
check('the next character has their own links', cur().job_links.THF == nil and cur().job_links.WHM == 'Thief');
n = #MOCK.printed;
MOCK.frame();
check('their first job read loads nothing', #MOCK.printed == n and cur().drops.th == 0);

return MOCK.report();
