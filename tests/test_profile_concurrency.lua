-- Shared profile changes must keep another character's work and release every file lock.
local profiles = require('ui.profiles');
local other = dofile(ADDON_DIR .. '/ui/profiles.lua');
local defaults = require('ui.defaults');
local json = require('json');
local ffi = require('ffi');
local s, t = defaults.make(), defaults.make();
local file = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json';
local open = io.open;
local function bytes()
    local stream = assert(open(file, 'r'));
    local text = stream:read('*a');
    stream:close();
    return text;
end
local function locks_closed(label)
    expect(label .. ' releases its lock', MOCK.profile_locks_open or 0, 0);
end

check('the first profile saves', profiles.save(s, 'Original', true));
local nested_ok, nested_reason;
local once = true;
io.open = function(path, mode)
    if (once and mode == 'w' and path:find('profiles.json.', 1, true)) then
        once = false;
        nested_ok, nested_reason = other.save(t, 'Second', true);
    end
    return open(path, mode);
end;
local ok, reason = profiles.save(s, 'First', true);
io.open = open;
check('the first writer succeeds', ok);
check('a simultaneous writer gets a busy result', nested_ok == false and nested_reason == 'busy');
locks_closed('the first writer');
check('the second writer can retry', other.save(t, 'Second', true));
local stored = json.decode(bytes());
check('both writes survive after retry', stored.Original and stored.First and stored.Second);

other.refresh();
check('the second reader sees an unused name', not other.exists('Race'));
s.drops.th = 1;
check('the first reader creates that name', profiles.save(s, 'Race', true));
t.drops.th = 3;
local prior_source = t.profile_source;
ok, reason = other.save(t, 'Race', true);
check('create-only rechecks the name while locked', not ok and reason == 'exists');
expect('create-only preserves the other profile', json.decode(bytes()).Race.drops.th, 1);
check('a rejected create keeps its settings source', t.profile_source == prior_source);
check('explicit overwrite remains available', other.save(t, 'Race'));
expect('explicit overwrite stores the chosen value', json.decode(bytes()).Race.drops.th, 3);
locks_closed('a create-only collision');

profiles.save(s, 'Delete undo', true);
s.job_links.THF = 'Delete undo';
profiles.delete(s, 'Delete undo');
s.drops.th = 0; profiles.save(s, 'Overwrite undo', true);
s.drops.th = 2; profiles.save(s, 'Overwrite undo');
local before = bytes();
local held = ffi.C.CreateFileA(file .. '.lock', 0xC0010000, 0, nil, 4, 0x04000100, nil);
check('another writer can hold the lock', held ~= ffi.cast('void*', -1));
local attempts = {
    { 'create', function() return profiles.save(s, 'Blocked', true); end },
    { 'overwrite', function() return profiles.save(s, 'Original'); end },
    { 'rename', function() return profiles.rename(s, 'Original', 'Renamed'); end },
    { 'delete', function() return profiles.delete(s, 'Original'); end },
    { 'undo delete', function() return profiles.undo_delete(s); end },
    { 'undo overwrite', function() return profiles.undo_overwrite(); end },
};
for _, attempt in ipairs(attempts) do
    ok, reason = attempt[2]();
    check(attempt[1] .. ' cannot bypass a held lock', not ok and reason == 'busy');
end
check('busy operations preserve all shared bytes', bytes() == before);
expect('busy delete keeps character links alone', s.job_links.THF, nil);
ffi.C.CloseHandle(held);
locks_closed('the held lock');
check('delete undo remains available after busy', profiles.undo_delete(s));
check('overwrite undo remains available after busy', profiles.undo_overwrite());
locks_closed('both undos');

for _, failure in ipairs({ 32, 5 }) do
    MOCK.profile_lock_error = failure;
    ok, reason = profiles.save(s, 'Cannot lock', true);
    check('lock error ' .. failure .. ' is reported', not ok and reason == (failure == 32 and 'busy' or 'file'));
    MOCK.profile_lock_error = nil;
    locks_closed('a failed lock open');
end
before = bytes();
io.open = function(path, mode)
    if (path == file and mode == 'r') then error('simulated read error'); end
    return open(path, mode);
end;
local protected;
protected, ok, reason = pcall(profiles.save, s, 'Read error', true);
io.open = open;
check('a thrown read error is contained', protected and not ok and reason == 'file');
locks_closed('a thrown read error');
local closes = 0;
io.open = function(path, mode)
    if (path == file and mode == 'r') then
        return { read = function() error('simulated stream read error'); end,
            close = function() closes = closes + 1; return true; end };
    end
    return open(path, mode);
end;
protected, ok, reason = pcall(profiles.save, s, 'Stream read error', true);
io.open = open;
check('a stream read error closes the stream', protected and not ok and reason == 'file' and closes == 1);
locks_closed('a stream read error');
closes = 0;
io.open = function(path, mode)
    if (mode == 'w' and path:find('profiles.json.', 1, true)) then
        return { write = function() error('simulated stream write error'); end,
            close = function() closes = closes + 1; return true; end };
    end
    return open(path, mode);
end;
protected, ok, reason = pcall(profiles.save, s, 'Stream write error', true);
io.open = open;
check('a stream write error closes the stream', protected and not ok and reason == 'file' and closes == 1);
locks_closed('a stream write error');
local encode = json.encode;
json.encode = function() error('simulated encode error'); end;
ok, reason = profiles.save(s, 'Encode error', true);
json.encode = encode;
check('an encode error is contained', not ok and reason == 'file');
locks_closed('an encode error');
MOCK.profile_replace_raise = true;
protected, ok, reason = pcall(profiles.save, s, 'Replace error', true);
MOCK.profile_replace_raise = false;
check('a thrown native replace error is contained', protected and not ok and reason == 'file');
locks_closed('a thrown native replace error');
check('read and replace errors preserve the file', bytes() == before);
check('a later save can still acquire the lock', profiles.save(s, 'Recovered', true));
locks_closed('the recovered save');
expect('native lock arguments match the file contract', MOCK.bad_profile_lock_calls or 0, 0);
return MOCK.report();
