-- A fixed Weapons readout for layout and hover checks. The game state is mocked.
local s = MOCK.settings.current;
local row = { name = 'Weapon damage example', low = 75, high = 75,
    weapons = require('core.weapons').readout({
        weapon_dmg = { slashing = -12.5, piercing = -50, blunt = 25, hand_to_hand = 12.5 },
        weapon_guard = { physical = -25 }, flags = { scripted_weapons = true },
    }, 75),
};
require('core.target').read = function () return 98; end;
require('core.target').readout = function () return row; end;
s.printout.divider = 'spaces';
for key in pairs(s.overlay.parts) do s.overlay.parts[key] = key == 'weaknesses'; end
for key in pairs(s.weaknesses.overlay) do s.weaknesses.overlay[key] = key == 'weapons'; end
s.overlay.on, s.overlay.icons, s.overlay.tips = true, false, true;
s.overlay.font_size, s.overlay.wrap = 28, 270;
s.window.overlay_x, s.window.overlay_y = 24, 40;
require('ui.overlay').changed(s);
require('ui.settings_window').set_open(false);
