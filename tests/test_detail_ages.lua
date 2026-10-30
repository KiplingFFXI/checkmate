-- Reading ages advance without rebuilding the monster's facts.
local window = require('ui.settings_window');
local tips = require('ui.tips');
local s = require('ui.defaults').make();
require('ui.skins').fill(s);
window.set_open(true);
window.details_open = true;
s.printout.parts.hit.on, s.printout.parts.pdif.on = true, true;
local result = { name = 'Example Monster', low = 40, high = 40,
    provenance = { inputs_at = 80, checked_at = 80, parameter_at = 80, parameter_state = 'checked' },
    hit = { low = 75, high = 75 },
    pdif = { low = 1, high = 1.2, ratio_low = 1, ratio_high = 1, attack = 100,
        defense_low = 100, defense_high = 100, observed_at = 70 } };
local builds, original = 0, tips.detail_groups;
tips.detail_groups = function (...) builds = builds + 1; return original(...); end;
local function has(text, needle) return (text or ''):find(needle, 1, true) ~= nil; end
local function draw()
    MOCK.frame(0);
    return window.draw(s, 'test');
end
MOCK.now = 100;
window.set_target_details(result);
draw();
check('initial ages use their separate input readings', MOCK.drew('Local inputs: 0:20 ago.')
    and MOCK.drew('Stat reply: 0:20 ago.') and MOCK.drew('Attack stat reply: 0:30 ago.'));
expect('facts are built once', builds, 1);
MOCK.now = 200;
draw();
check('visible ages advance with a stable result', MOCK.drew('Inputs 2:00 ago')
    and MOCK.drew('Local inputs: 2:00 ago.') and MOCK.drew('Stat reply: 2:00 ago.')
    and MOCK.drew('Attack stat reply: 2:10 ago.'));
expect('advancing time does not rebuild fact groups', builds, 1);
MOCK.clicks['Copy details'] = true;
draw();
check('Copy details uses current ages', has(MOCK.clipboard, 'Local inputs: 2:00 ago.')
    and has(MOCK.clipboard, 'Stat reply: 2:00 ago.') and has(MOCK.clipboard, 'Attack stat reply: 2:10 ago.')
    and not has(MOCK.clipboard, '0:20 ago'));
MOCK.typing['Find target details'] = '2:00';
draw();
MOCK.clicks['Copy shown'] = true;
draw();
check('Copy shown keeps fresh ages in matching groups', has(MOCK.clipboard, 'Local inputs: 2:00 ago.')
    and not has(MOCK.clipboard, 'Attack stat reply'));
MOCK.now = 260;
draw();
check('a time-sensitive search stops matching old ages', MOCK.drew('No matching target details.'));
expect('age searches do not rebuild expensive facts', builds, 1);
MOCK.typing['Find target details'] = '';
result.provenance.chat_snapshot = true;
draw();
MOCK.clicks['Copy details'] = true;
draw();
check('saved check ages also advance without changing recorded values', has(MOCK.clipboard, 'Local inputs: 3:00 ago.')
    and result.hit.low == 75 and result.pdif.attack == 100);
tips.detail_groups = original;
return MOCK.report();
