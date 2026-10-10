-- Starter choices preserve personal styling and combat inputs, and never write a profile.
local presets = require('ui.presets');
local defaults = require('ui.defaults');
local history = require('ui.history');
local overlay = require('ui.overlay');
local parts = require('core.parts');
local profiles = require('ui.profiles');
local s = defaults.make();
s.look.font, s.look.font_size = 'tahoma', 22;
s.overlay.font, s.overlay.font_size, s.overlay.wrap = 'tahoma', 21, 431;
s.overlay.opacity, s.overlay.icons, s.overlay.tips = 37, false, false;
s.window.x, s.window.overlay_x, s.window.tabs.Magic = 701, 812, false;
s.colors.hit_good, s.short.hit, s.printout.parts.hit.label = 73, 'Land', 'My hit';
s.printout.short_words, s.overlay.short_words = true, true;
s.merits.crit_hit_rate, s.merits.enemy_crit_rate, s.merits.fill_in = 4, 3, false;
s.drops.th, s.drops.min_chance, s.magic.extra_accuracy, s.magic.known_inputs = 4, 80, 71, false;
s.magic.schools.enfeebling.spell = 'paralyze';
s.job_links.WAR = 'My saved profile';
check('saved user profile exists before preset work', profiles.save(s, 'Melee'));
local original = history.copy(s);
local names = {};
for _, item in ipairs(presets.list()) do
    names[#names + 1] = item.name;
    local preview, meta = presets.preview(s, item.id);
    check(item.name .. ' preview is a separate settings tree', preview ~= s and preview.printout.parts ~= s.printout.parts
        and history.equal(s, original));
    check(item.name .. ' explicitly enables a line-based overlay', preview.overlay.on and preview.overlay.own_lines
        and meta.changes[1]:find('Enables the overlay', 1, true));
    check(item.name .. ' preserves appearance and positions', history.equal(preview.look, original.look)
        and history.equal(preview.colors, original.colors) and history.equal(preview.window, original.window)
        and preview.overlay.font_size == 21 and preview.overlay.wrap == 431
        and preview.overlay.opacity == 37 and not preview.overlay.icons and not preview.overlay.tips);
    check(item.name .. ' preserves words and inputs', history.equal(preview.short, original.short)
        and preview.printout.parts.hit.label == 'My hit' and preview.printout.short_words and preview.overlay.short_words
        and history.equal(preview.merits, original.merits) and preview.drops.th == 4
        and preview.magic.extra_accuracy == 71 and not preview.magic.known_inputs
        and preview.magic.schools.enfeebling.spell == 'paralyze'
        and history.equal(preview.job_links, original.job_links));
    local valid, count = true, 0;
    for id, on in pairs(preview.overlay.parts) do
        if (on) then valid, count = valid and overlay.is_part(id), count + 1; end
    end
    check(item.name .. ' only selects supported overlay rows', valid and count <= 10);
    local ordered = {};
    for id in preview.printout.order:gmatch('%S+') do ordered[id] = (ordered[id] or 0) + 1; end
    for _, id in ipairs(parts.ORDER) do valid = valid and ordered[id] == 1; end
    check(item.name .. ' order keeps each canonical part exactly once', valid);
    local applied = history.copy(s);
    check(item.name .. ' apply exactly matches its preview', presets.apply(applied, item.name)
        and history.equal(applied, preview) and presets.matches(applied, item.id));
    applied.colors.hit_good = 69;
    check(item.name .. ' styling does not change its role selections', presets.matches(applied, item.id));
    applied.overlay.on = false;
    check(item.name .. ' altered selections are detected', not presets.matches(applied, item.id));
end
expect('the eight starter choices are stable', table.concat(names, ', '), 'Minimal, Melee, Mage, Ranged, Tank, Blue Mage, Pet Job, Thief');
local metadata = presets.list(); metadata[1].chat[1] = 'broken';
expect('metadata callers cannot change built-ins', presets.list()[1].chat[1], 'difficulty');
check('unknown choices leave settings alone', presets.preview(s, 'unknown') == nil and not presets.apply(s, 'unknown')
    and history.equal(s, original));
check('presets never replace or add saved profiles', #profiles.names() == 1 and profiles.exists('Melee'));
local blue = presets.preview(s, 'Blue Mage');
check('Blue Mage prioritizes learning with chance kept separate', blue.blue.only_unlearned and blue.blue.requirements
    and blue.blue.chat.lessons and blue.blue.overlay.lessons and not blue.blue.chat.chance and not blue.blue.overlay.chance
    and blue.printout.parts.blue.on and blue.overlay.parts.blue);
local pet = presets.preview(s, 'Pet Job');
check('Pet Job includes supported pet and Charm displays', pet.printout.parts.pet.on and pet.overlay.parts.pet
    and pet.weaknesses.chat.charm and pet.weaknesses.overlay.charm);
local thief = presets.preview(s, 'Thief');
check('Thief keeps reward, drop and Steal conditions with the entered TH', thief.printout.parts.rewards.on
    and thief.printout.parts.drops.on and thief.printout.parts.steal.on and thief.drops.notes
    and thief.drops.min_chance == 0 and thief.drops.max_items == 3 and thief.drops.th == 4);
local ranged = presets.preview(s, 'Ranged');
local melee, tank = presets.preview(s, 'Melee'), presets.preview(s, 'Tank');
check('Melee includes both supported hit rows', melee.overlay.parts.hit and melee.overlay.parts.offhand
    and not melee.overlay.parts.ranged and not melee.overlay.parts.evade);
check('Ranged includes ranged hit chance', ranged.overlay.parts.ranged and not ranged.overlay.parts.hit);
check('Tank includes Evade', tank.overlay.parts.evade and not tank.overlay.parts.hit);
check('previewing combat presets leaves existing selections alone', history.equal(s, original));
check('Ranged does not relabel melee Crit as ranged', not ranged.printout.parts.crit.on and not ranged.overlay.parts.crit
    and ranged.ranged.show_distance and ranged.overlay.parts.rangedpdif);
expect('preset operations issue no commands', #MOCK.commands, 0);
return MOCK.report();
