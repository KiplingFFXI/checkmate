-- Merit choices, server observations and saved settings have separate lifetimes.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.navigation_real = true;
local panel = require('ui.settings_window');
local nav = require('ui.navigation');
local merits = require('core.merits');
local history = require('ui.history');
local profiles = require('ui.profiles');
local function current() return MOCK.settings.current; end
local function frame()
    local before = #MOCK.printed;
    local ok, err = pcall(MOCK.frame);
    for _, text in ipairs(MOCK.printed_since(before)) do
        if (text:find('Stopped after an error', 1, true)) then error(text); end
    end
    if (not ok) then error(err); end
end
MOCK.command('/checkmate');
nav.select('Merits');
frame();
check('Merits opens with the master switch', MOCK.gui.paths['Merits/Use my merits when I zone'] == 'Checkbox');
for _, category in ipairs({ 'ATTRIBUTES', 'COMBAT SKILLS', 'MAGIC SKILLS', 'OTHER', 'JOB MERITS' }) do
    check(category .. ' starts collapsed', MOCK.gui.paths['Merits/' .. category] == 'CollapsingHeader'
        and panel.folded['Merits/' .. category] == false);
end
check('collapsed categories do not draw sliders', MOCK.gui.paths['Merits/shield_skill/##rank'] == nil);
check('missing rank stays unset just by opening the menu', current().merits.shield_skill == nil);
check('missing baseline is explained', MOCK.drew('Zone once to read your merit ranks.'));
MOCK.clicks['Merits/COMBAT SKILLS'] = true;
frame();
check('opening Combat skills reveals its ranks', MOCK.gui.paths['Merits/shield_skill/##rank'] == 'Slider'
    and MOCK.gui.paths['Merits/sword_skill/##rank'] == 'Slider');
expect('unknown is not shown as a selected zero', MOCK.gui.formats['Merits/shield_skill/##rank'], 'Unset');
MOCK.packet(MOCK.merit_packet({ { 226, 2 }, { 228, 0 }, { 196, 8 } }));
frame();
check('the packet fills every supported category rank', current().merits.shield_skill == 2
    and current().merits.parrying_skill == 0 and current().merits.sword_skill == 8);
check('autofill stays out of Undo', history.status(current()) == nil);
local saves = MOCK.saved;
MOCK.packet(MOCK.merit_packet({ { 226, 2 }, { 228, 0 }, { 196, 8 } }));
expect('duplicate ranks do not save', MOCK.saved, saves);
MOCK.clicks['Merits/Use my merits when I zone'] = true;
frame();
expect('one switch disables all autofill', current().merits.fill_in, false);
MOCK.slide['Merits/shield_skill/##rank'] = 4;
frame();
check('dragging a rank does not save each frame', MOCK.last_save.merits.shield_skill == 2);
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
check('slider saves the selected rank only', current().merits.shield_skill == 4
    and MOCK.last_save.merits.shield_skill == 4 and merits.observed('shield_skill') == 2);
local undo = history.status(current());
MOCK.packet(MOCK.merit_packet({ { 226, 1 }, { 278, 5 } }));
check('manual mode still reads actual ranks', merits.observed('shield_skill') == 1
    and merits.observed('blue_magic_skill') == 5);
check('manual mode keeps the choices and Undo', current().merits.shield_skill == 4
    and current().merits.blue_magic_skill == nil and history.status(current()) == undo);
MOCK.command('/checkmate undo');
expect('Undo restores the prior selected rank', current().merits.shield_skill, 2);
expect('Undo leaves the actual observation', merits.observed('shield_skill'), 1);
local before = history.copy(current().merits);
profiles.save(current(), 'MeritInputs');
current().merits.shield_skill = 4;
profiles.load(current(), 'MeritInputs');
check('profile loading preserves all personal merits', current().merits.shield_skill == 4
    and current().merits.fill_in == before.fill_in);
history.reset_section(current(), 'Merits');
check('tab reset restores autofill without erasing personal ranks', current().merits.fill_in
    and current().merits.shield_skill == 4);
MOCK.typing['Find settings'] = 'shield skill';
frame();
check('search finds Merits and opens matching categories', nav.current() == 'Merits'
    and MOCK.gui.paths['Merits/shield_skill/##rank'] == 'Slider');
MOCK.typing['Find settings'] = '';
frame();
check('search preserves the previously folded categories', panel.folded['Merits/MAGIC SKILLS'] == false);
MOCK.zone_in(900);
check('zoning clears the baseline but retains selections', merits.observed('shield_skill') == nil
    and current().merits.shield_skill == 4);
MOCK.packet(MOCK.merit_packet({ { 226, 0 }, { 278, 8 } }));
check('zone autofill accepts zero and magic skill ranks', current().merits.shield_skill == 0
    and current().merits.blue_magic_skill == 8);
nav.select('Merits');
panel.folded['Merits/COMBAT SKILLS'] = true;
frame();
check('rows distinguish references from estimate inputs', MOCK.drew('Reference only') and MOCK.drew('Changes estimates'));
MOCK.slide['Merits/shield_skill/##rank'] = 3;
MOCK.deactivate = true;
frame();
MOCK.deactivate = false;
frame();
check('a changed rank is marked Manual', MOCK.drew('Manual') and MOCK.drew('Ranks read: 2 / 47 | Manual: 1'));
check('autofill explains when manual ranks are replaced',
    MOCK.drew('Zoning replaces manual ranks. Changing a merit in game replaces that rank too.'));
current().merits.parrying_skill = 3;
local saves_before_restore = MOCK.saved;
MOCK.clicks['Merits/Restore game ranks'] = true;
frame();
check('Restore game ranks copies known zero and keeps unread choices', current().merits.shield_skill == 0
    and current().merits.parrying_skill == 3 and current().merits.fill_in);
expect('Restore game ranks saves once', MOCK.saved, saves_before_restore + 1);
expect('restoring ranks is a named Undo action', history.status(current()), 'Restore game ranks');
MOCK.command('/checkmate undo');
expect('Undo restores the manual rank', current().merits.shield_skill, 3);
expect('Undo cannot change the game observation', merits.observed('shield_skill'), 0);
MOCK.open['##reset_actions'] = true;
frame();
check('Merits reset names the option it restores', MOCK.gui.paths['##reset_actions/Reset autofill option'] == 'Selectable'
    and MOCK.gui.paths['##reset_actions/Reset this tab'] == nil);
MOCK.open['##reset_actions'] = nil;
check('merit controls never send game commands', #MOCK.commands == 0);
return MOCK.report();
