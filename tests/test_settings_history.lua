-- Undo follows actual setting edits, leaves geometry alone and never touches the profile file.
local history = require('ui.history');
local defaults = require('ui.defaults');
local presets = require('ui.presets');
local profiles = require('ui.profiles');
local s = defaults.make();
expect('empty history has no label', history.status(s), nil);
local before = history.capture(s);
s.window.x, s.window.width = 601, 910;
s.profile_source = { kind = 'preset', name = 'minimal' };
check('moving a window or marking a source does not create undo', not history.record(s, before, 'Move'));
s.drops.th = 4;
check('an actual input edit records once', history.record(s, before, 'Treasure Hunter'));
expect('undo names the setting change', history.status(s), 'Treasure Hunter');
s.window.x = 701;
check('undo restores the edited value and preserves the latest position', history.undo(s) and s.drops.th == 0 and s.window.x == 701);
check('an exhausted undo is explicit', not history.undo(s));
before = history.capture(s);
s.window.tabs.Magic = false;
history.record(s, before, 'Hide Magic');
check('tab visibility is a setting that can be undone', history.undo(s) and s.window.tabs.Magic);
before = history.capture(s);
s.job_links.WAR = 'New link';
history.record(s, before, 'Job link');
check('undo removes a newly added leaf', history.undo(s) and s.job_links.WAR == nil);
s.job_links.WAR = 'Old link'; before = history.capture(s);
s.job_links.WAR = nil;
history.record(s, before, 'Remove link');
check('undo restores a removed leaf', history.undo(s) and s.job_links.WAR == 'Old link');
for value = 1, history.LIMIT + 2 do
    before = history.capture(s); s.links.max_links = value;
    history.record(s, before, 'Names ' .. value);
end
local count = 0;
while history.undo(s) do count = count + 1; end
expect('the history has a small fixed limit', count, history.LIMIT);
local other = defaults.make();
before = history.capture(s); s.drops.th = 3; history.record(s, before, 'TH');
check('another settings owner cannot undo this character', not history.undo(other) and history.status(other) == nil);
history.clear(s);
expect('clearing history leaves no stale owner', history.status(s), nil);

s.printout.parts.magic.label, s.short.hit = 'Spells', 'Land';
s.colors.hit_good, s.look.font_size = 73, 22;
s.merits.crit_hit_rate, s.magic.extra_accuracy, s.magic.known_inputs, s.drops.th = 4, 45, false, 3;
presets.apply(s, 'Mage'); profiles.mark_preset(s, 'mage');
before = history.capture(s);
local changed, label = history.reset_section(s, 'Display');
check('Display resets its two row sets', changed and not s.overlay.on and not s.printout.parts.magic.on
    and not s.overlay.parts.magic and s.printout.parts.aggro.on);
check('Display reset preserves words, style, geometry and manual inputs', s.printout.parts.magic.label == 'Spells'
    and s.short.hit == 'Land' and s.colors.hit_good == 73 and s.look.font_size == 22 and s.window.x == 701
    and s.merits.crit_hit_rate == 4 and s.magic.extra_accuracy == 45 and not s.magic.known_inputs and s.drops.th == 3);
check('section reset has one undo and restores its source', history.undo(s) and history.equal(s, before));
history.clear(s);
s.printout.parts.pet.on = true; s.overlay.parts.pet = true;
before = history.capture(s);
check('Drops reset does not change pet or magic rows', history.reset_section(s, 'drops', { record = false })
    and s.printout.parts.pet.on and s.overlay.parts.pet and s.printout.parts.magic.on and s.magic.extra_accuracy == 45
    and history.status(s) == nil);
check('the parent can record a reset at its own save boundary', history.record(s, before, 'Reset Drops') and history.undo(s));
check('unknown section is rejected without changes', not history.reset_section(s, 'not a section') and history.equal(s, before));
local sections = history.sections();
expect('all section reset choices are described', #sections, 15);
check('no profile file was written', #profiles.names() == 0);
return MOCK.report();
