-- Undo restores a deleted profile without replacing newer work or another character's job links.
local profiles = require('ui.profiles');
local defaults = require('ui.defaults');
local s = defaults.make();
s.drops.th, s.job_links.THF = 3, 'Thief';
check('save the original', profiles.save(s, 'Thief'));
check('delete removes its current-character job link', profiles.delete(s, 'Thief') and s.job_links.THF == nil);
expect('the last deletion is named', profiles.deleted_name(), 'Thief');
MOCK.profile_replace_error = true;
local ok, why = profiles.undo_delete(s);
check('a failed restore stays available and changes nothing', not ok and why == 'file'
    and not profiles.exists('Thief') and profiles.deleted_name() == 'Thief' and s.job_links.THF == nil);
MOCK.profile_replace_error = false;
ok, why = profiles.undo_delete(s);
check('undo restores the same profile and link', ok and why == 'Thief' and profiles.exists('Thief') and s.job_links.THF == 'Thief');
s.drops.th = 0;
check('restored settings are the saved ones', profiles.load(s, 'Thief') and s.drops.th == 3);
expect('successful undo is used up', profiles.deleted_name(), nil);
ok, why = profiles.undo_delete(s);
check('undo with nothing pending is explicit', not ok and why == 'none');
profiles.delete(s, 'Thief');
s.drops.th = 1;
profiles.save(s, 'Thief');
ok, why = profiles.undo_delete(s);
check('undo never replaces a recreated name', not ok and why == 'exists');
s.drops.th = 0;
check('the newer profile survives', profiles.load(s, 'Thief') and s.drops.th == 1);
s.job_links.THF = 'Thief';
profiles.delete(s, 'Thief');
s.job_links.THF = 'New choice';
check('undo does not replace a changed link', profiles.undo_delete(s) and s.job_links.THF == 'New choice');
s.job_links.THF = 'Thief';
profiles.delete(s, 'Thief');
local other = defaults.make();
check('another character can restore the shared file without getting your links', profiles.undo_delete(other)
    and other.job_links.THF == nil and s.job_links.THF == nil);
return MOCK.report();
