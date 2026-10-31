-- A busy shared profile file needs the same retry message in chat and the menu.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local profiles = require('ui.profiles');
local s = MOCK.settings.current;
check('an existing profile saves', profiles.save(s, 'Original', true));
check('a profile for Undo saves', profiles.save(s, 'Undo Me', true));
check('the Undo profile is deleted', profiles.delete(s, 'Undo Me'));
local file = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json';
local function bytes()
    local stream = assert(io.open(file, 'r'));
    local value = stream:read('*a');
    stream:close();
    return value;
end
local before = bytes();
MOCK.profile_lock_error = 32;
for _, command in ipairs({ 'save Original', 'delete Original', 'rename Original Renamed', 'undo' }) do
    local first = #MOCK.printed;
    MOCK.command('/checkmate profile ' .. command);
    local text = table.concat(MOCK.printed_since(first), '\n');
    check(command .. ' explains that another window is changing profiles',
        text:find('Another game window is changing profiles. Try again in a moment.', 1, true) ~= nil);
    expect(command .. ' leaves shared profiles unchanged', bytes(), before);
end
MOCK.profile_lock_error = 5;
local first = #MOCK.printed;
MOCK.command('/checkmate profile delete Original');
local text = table.concat(MOCK.printed_since(first), '\n');
check('a failed delete does not claim the profile is missing', text:find("Couldn't delete the profile", 1, true) ~= nil);
MOCK.profile_lock_error = nil;
MOCK.command('/checkmate profile undo');
check('Undo can succeed after the other writer finishes', profiles.exists('Undo Me'));
expect('commands leave no lock open', MOCK.profile_locks_open or 0, 0);
-- A failed read is different from a missing name.
local open, exists = io.open, ashita.fs.exists;
local complete = bytes();
for _, failure in ipairs({ 'denied', 'corrupt' }) do
    if (failure == 'denied') then
        io.open = function (path, mode)
            if (path == file and mode == 'r') then return nil, 'access denied'; end
            return open(path, mode);
        end;
        ashita.fs.exists = function (path)
            if (path == file) then return true; end
            return exists(path);
        end;
    else
        local stream = assert(open(file, 'w'));
        stream:write('{ invalid JSON');
        stream:close();
    end
    s.drops.th = 4;
    local first = #MOCK.printed;
    MOCK.command('/checkmate profile load Original');
    local text = table.concat(MOCK.printed_since(first), '\n');
    check(failure .. ' load explains that the shared file could not be read',
        text:find("Couldn't read profiles.json. Your settings were kept.", 1, true) ~= nil);
    expect(failure .. ' load keeps the current settings', s.drops.th, 4);
    io.open, ashita.fs.exists = open, exists;
    local stream = assert(open(file, 'w'));
    stream:write(complete);
    stream:close();
end
return MOCK.report();
