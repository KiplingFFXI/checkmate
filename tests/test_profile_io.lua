-- A failed file operation must not report that a profile was saved.
local profiles = require('ui.profiles');
local s = require('ui.defaults').make();
local file = MOCK_INSTALL_PATH .. '\\config\\addons\\checkmate\\profiles.json';
local open, exists = io.open, ashita.fs.exists;
local function bytes()
    local f = assert(open(file, 'r'));
    local text = f:read('*a');
    f:close();
    return text;
end
check('first profile saves', profiles.save(s, 'Original'));
local original = bytes();
io.open = function (path, mode)
    if (path == file and mode == 'r') then return nil, 'access denied'; end
    return open(path, mode);
end;
ashita.fs.exists = function (path) if (path == file) then return true; end return exists(path); end;
profiles.refresh();
check('an unreadable existing file is protected', not profiles.file_ok());
check('saving cannot overwrite an unreadable file', not profiles.save(s, 'New'));
io.open, ashita.fs.exists = open, exists;
profiles.refresh();
check('the original file survives a read failure', profiles.exists('Original') and not profiles.exists('New'));
for _, failure in ipairs({ 'write', 'close' }) do
    io.open = function (path, mode)
        if (path:sub(1, #file + 1) == file .. '.' and mode == 'w') then
            return {
                write = function () if (failure == 'write') then return nil, 'disk full'; end return true; end,
                close = function () if (failure == 'close') then return nil, 'flush failed'; end return true; end,
            };
        end
        return open(path, mode);
    end;
    check(failure .. ' failure is reported', not profiles.save(s, 'Failed'));
    check(failure .. ' failure leaves the cached profiles alone', not profiles.exists('Failed'));
    io.open = open;
    expect(failure .. ' failure leaves the original file alone', bytes(), original);
end
MOCK.profile_replace_error = true;
check('replacement failure is reported', not profiles.save(s, 'Failed'));
expect('replacement failure preserves the original bytes', bytes(), original);
check('replacement failure does not keep a saved profile in memory', not profiles.exists('Failed'));
MOCK.profile_replace_error = false;
s.drops.th = 3;
check('an existing profile can be replaced', profiles.save(s, 'Original'));
profiles.refresh();
s.drops.th = 0;
check('the replacement loads after a fresh read', profiles.load(s, 'Original') and s.drops.th == 3);
return MOCK.report();
