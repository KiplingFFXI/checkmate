-- Another game window may add a name after this menu opened.
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
MOCK.navigation_real = true;
local panel = require('ui.settings_window');
local profiles = require('ui.profiles');
local json = require('json');
local s = MOCK.settings.current;
local path = MOCK_INSTALL_PATH .. '/config/addons/checkmate/profiles.json';
local function stored()
    local file = assert(io.open(path, 'r'));
    local text = file:read('*a'); file:close();
    return text, json.decode(text);
end
local function frame()
    local before = #MOCK.printed;
    MOCK.frame(0);
    for _, text in ipairs(MOCK.printed_since(before)) do
        assert(not text:find('Stopped after an error', 1, true), text);
    end
end
local function click(label)
    MOCK.clicks['Profiles/' .. label] = true;
    frame();
    assert(MOCK.clicks['Profiles/' .. label] == nil, 'The control was not drawn: ' .. label);
end
require('ui.navigation').select('Profiles');
panel.set_open(true);
s.drops.th = 1;
frame();
local file = assert(io.open(path, 'w'));
assert(file:write(json.encode({ ['New Name'] = { drops = { th = 4 } } })));
assert(file:close());
local before = stored();
MOCK.typing['Profiles/Name'] = 'New Name';
click('Save as new');
check('Save as new preserves a name added after the menu opened', stored() == before);
check('the collision names the existing profile', MOCK.drew('There is already a profile called "New Name"'));
expect('a refused creation does not become an overwrite', profiles.overwritten_name(), nil);

click('##profiles/New Name');
click('Overwrite');
local _, saved = stored();
expect('explicit Overwrite still replaces the selected profile', saved['New Name'].drops.th, 1);
expect('explicit Overwrite keeps its Undo target', profiles.overwritten_name(), 'New Name');

local save, rename, delete, undo_delete, undo_overwrite, deleted = profiles.save, profiles.rename,
    profiles.delete, profiles.undo_delete, profiles.undo_overwrite, profiles.deleted_name;
local function busy() return false, 'busy'; end
profiles.save, profiles.rename, profiles.delete = busy, busy, busy;
profiles.undo_delete, profiles.undo_overwrite = busy, busy;
profiles.deleted_name = function() return 'New Name'; end;
before = stored();
MOCK.typing['Profiles/Name'] = 'Other Name';
for _, label in ipairs({ 'Save as new', 'Overwrite', 'Rename', 'Delete', 'Undo delete', 'Undo overwrite' }) do
    click(label);
    check(label .. ' explains that another window is changing profiles',
        MOCK.drew('Another game window is changing profiles. Try again in a moment.'));
    check(label .. ' keeps the file after contention', stored() == before);
end
profiles.save, profiles.rename, profiles.delete = save, rename, delete;
profiles.undo_delete, profiles.undo_overwrite, profiles.deleted_name = undo_delete, undo_overwrite, deleted;
return MOCK.report();
