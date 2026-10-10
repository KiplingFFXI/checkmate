-- Profile status compares at edit boundaries; overwrite undo never replaces a newer file version.
local profiles = require('ui.profiles');
local defaults = require('ui.defaults');
local history = require('ui.history');
local presets = require('ui.presets');
local json = require('json');
local s = defaults.make();
local file = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json';
local function read()
    local f = assert(io.open(file, 'r')); local text = f:read('*a'); f:close(); return text;
end
local function write(value)
    local f = assert(io.open(file, 'w')); assert(f:write(json.encode(value))); assert(f:close());
end
expect('a character without a source has a clear status', profiles.status(s).label, 'Custom settings');
check('save establishes a profile baseline', profiles.save(s, 'Mine') and not profiles.status(s).modified
    and profiles.status(s).kind == 'profile' and profiles.status(s).name == 'Mine');
check('source metadata stays out of shared profiles', json.decode(read()).Mine.profile_source == nil);
s.drops.th = 3; profiles.changed(s);
check('an actual setting edit marks the profile modified', profiles.status(s).modified);
s.drops.th = 0; profiles.changed(s);
check('returning to the saved value clears Modified', not profiles.status(s).modified);
s.window.tabs.Magic = false; s.merits.crit_hit_rate = 4; s.job_links.WAR = 'Mine'; profiles.changed(s);
check('per-character fields are outside the saved profile baseline', not profiles.status(s).modified);
local old_open = io.open; local reads = 0;
io.open = function (...) reads = reads + 1; return old_open(...); end;
for _ = 1, 100 do profiles.status(s); end
io.open = old_open;
expect('repeated status draws do not read the profile file', reads, 0);
local reloaded = history.copy(s);
check('a persisted source descriptor survives a new settings owner', not profiles.status(reloaded).modified);
check('rename follows the current baseline', profiles.rename(s, 'Mine', 'Renamed')
    and profiles.status(s).name == 'Renamed' and not profiles.status(s).modified);
local before = history.capture(s);
presets.apply(s, 'Melee'); profiles.mark_preset(s, 'Melee'); history.record(s, before, 'Melee preset');
check('preset baseline is named separately from saved profiles', profiles.status(s).kind == 'preset'
    and profiles.status(s).label == 'Melee' and not profiles.status(s).modified and not profiles.exists('Melee'));
local matches, comparisons = presets.matches, 0;
presets.matches = function (...) comparisons = comparisons + 1; return matches(...); end;
for _ = 1, 100 do profiles.status(s); end
presets.matches = matches;
expect('unchanged status draws do not compare a preset again', comparisons, 0);
s.look.font_size = 22; profiles.changed(s);
check('styling remains independent of a starter selection', not profiles.status(s).modified);
s.overlay.parts.pdif = false; profiles.changed(s);
check('changing a starter row marks it modified', profiles.status(s).modified);
history.undo(s); profiles.changed(s);
check('undo restores the prior source descriptor', profiles.status(s).kind == 'profile' and profiles.status(s).name == 'Renamed');
profiles.load(s, 'Renamed');
s.drops.th = 3; check('overwrite succeeds', profiles.save(s, 'Renamed'));
expect('overwrite undo names its target', profiles.overwritten_name(), 'Renamed');
local newer = read();
MOCK.profile_replace_error = true;
local ok, why = profiles.undo_overwrite();
check('failed overwrite undo preserves bytes and stays available', not ok and why == 'file'
    and read() == newer and profiles.overwritten_name() == 'Renamed');
MOCK.profile_replace_error = false;
ok, why = profiles.undo_overwrite();
check('overwrite undo restores only the previous disk version', ok and why == 'Renamed'
    and json.decode(read()).Renamed.drops.th == 0 and s.drops.th == 3 and profiles.overwritten_name() == nil);
check('settings still show their difference from the restored file', profiles.status(s).modified);
profiles.save(s, 'Renamed');
local external = json.decode(read()); external.Renamed.drops.th = 2; external.Other = { drops = { th = 1 } }; write(external);
local foreign = read();
ok, why = profiles.undo_overwrite();
check('a newer same-name change blocks overwrite undo', not ok and why == 'changed' and read() == foreign);
external.Renamed.drops.th = 3; write(external);
check('an unrelated profile remains when a matching version is restored', profiles.undo_overwrite()
    and json.decode(read()).Other.drops.th == 1);
s.drops.th = 4; profiles.save(s, 'Renamed');
local f = assert(io.open(file, 'w')); f:write('{broken'); f:close();
ok, why = profiles.undo_overwrite();
check('an unreadable file is never replaced by undo', not ok and why == 'file' and read() == '{broken');
return MOCK.report();
