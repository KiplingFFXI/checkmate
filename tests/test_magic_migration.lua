-- An old manual bonus must not be added again through the new automatic inputs.
MOCK.settings_file = { magic = { extra_accuracy = 25 } };
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local function current() return MOCK.settings.current; end
expect('an existing manual total keeps manual mode', current().magic.known_inputs, false);
expect('its existing total stays intact', current().magic.extra_accuracy, 25);

MOCK.settings.switch_character({ magic = { extra_accuracy = 0 } });
expect('an old zero bonus can use known inputs', current().magic.known_inputs, true);
MOCK.settings.switch_character({ magic = { extra_accuracy = 25, known_inputs = true } });
expect('an explicit automatic choice survives character loading', current().magic.known_inputs, true);
MOCK.settings.switch_character({ magic = { extra_accuracy = 0, known_inputs = false } });
expect('an explicit manual choice survives character loading', current().magic.known_inputs, false);
MOCK.settings.reset();
expect('reset starts in automatic mode', current().magic.known_inputs, true);

local path = MOCK_INSTALL_PATH .. '/config/addons/checkmate/profiles.json';
local file = assert(io.open(path, 'w'));
file:write(require('json').encode({
    OldManual = { magic = { extra_accuracy = 25 } },
    OldZero = { magic = { extra_accuracy = 0 } },
    Explicit = { magic = { extra_accuracy = 25, known_inputs = true } },
}));
file:close();
local profiles = require('ui.profiles');
check('an old manual profile loads', profiles.load(current(), 'OldManual'));
check('the profile keeps its total without automatic additions', current().magic.extra_accuracy == 25
    and current().magic.known_inputs == false);
check('an old zero profile loads in automatic mode', profiles.load(current(), 'OldZero')
    and current().magic.known_inputs == true);
check('an explicit profile choice survives', profiles.load(current(), 'Explicit')
    and current().magic.known_inputs == true and current().magic.extra_accuracy == 25);
return MOCK.report();
