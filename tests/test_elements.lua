-- The Elements part. Every step of the rule that sorts an element into weak or resists, real monsters
-- worked out by hand from the Phoenix source, how the part prints with its words, Show how strong, the
-- label divider and every color, and the part through the addon. That covers its default place, a settings
-- file without it, the sample and a real /check.
local elements = require('core.elements');
local printout = require('core.printout');
local wording  = require('core.wording');
local defaults = require('ui.defaults');
local skins    = require('ui.skins');

local function color(code) return '\30' .. string.char(code); end

-- An entry's strength the way the printout words it with short words off, like "absorbs 50%" or "+100%", or nil.
-- The readout hands over a key in core\wording.lua and the amount that prints with it.
local function strength_of(entry)
    if (entry.strength == nil) then
        return entry.amount;
    end
    local word = wording.BY_KEY[entry.strength].full;
    return entry.amount and (word .. ' ' .. entry.amount) or word;
end

-- What the readout holds, like "Weak Ice, Thunder | Resists Water (half) | all -25% ?". Each list keeps
-- one strength per name, and "-" stands for an empty list.
local function shown(row, level)
    local e = elements.readout(row, level);
    if (e == nil) then
        return 'nothing';
    end
    local lists = {};
    for _, kind in ipairs({ { 'weak', 'Weak' }, { 'resists', 'Resists' } }) do
        local names = {};
        for _, entry in ipairs(e[kind[1]]) do
            local strength = strength_of(entry);
            names[#names + 1] = wording.BY_KEY[wording.ELEMENT_KEYS[entry.element]].full
                .. (strength and (' (' .. strength .. ')') or '');
        end
        lists[#lists + 1] = kind[2] .. ' ' .. (#names > 0 and table.concat(names, ', ') or '-');
    end
    lists[#lists + 1] = 'all ' .. tostring(e.all);
    return table.concat(lists, ' | ') .. (e.scripted and ' ?' or '');
end

-- The rule, a step at a time --------------------------------------------------------------------

check('a row with nothing to say is nothing', shown({}) == 'nothing' and shown({ ranks = { fire = 2, dark = 3 } })
    == 'nothing', shown({ ranks = { fire = 2, dark = 3 } }));
expect('the lowest rank below 0 is weak, every element that has it', shown({ ranks = { ice = -3, thunder = -3, water = -2 } }),
    'Weak Ice, Thunder | Resists - | all nil');
expect('a missing rank is 0', shown({ ranks = { light = -1 } }), 'Weak Light | Resists - | all nil');
local same = {};
for _, element in ipairs(elements.ORDER) do same[element] = -2; end
expect('every element at -2 is nothing, since none is lower', shown({ ranks = same }), 'nothing');
same.fire = 4;
expect('and the rest aren\'t weak when one is higher', shown({ ranks = same }),
    'Weak Ice, Wind, Earth, Thunder, Water, Light, Dark | Resists Fire (half) | all nil');
check('a lowest rank of 0 is nothing', shown({ ranks = { fire = 3 } }) == 'nothing');
expect('ranks 1 to 3 are neutral', shown({ ranks = { fire = 1, ice = 2, wind = 3, light = -1 } }),
    'Weak Light | Resists - | all nil');
expect('rank 4 to 9 resists with half the damage', shown({ ranks = { fire = 4, ice = 9 } }),
    'Weak - | Resists Fire (half), Ice (half) | all nil');
expect('rank 10 rarely lands', shown({ ranks = { fire = 10 } }), 'Weak - | Resists Fire (rarely lands) | all nil');
expect('rank 11 never lands', shown({ ranks = { fire = 11 } }), 'Weak - | Resists Fire (never lands) | all nil');
expect('and the same with its own damage taken, which only the tip tells', shown({ ranks = { fire = 11 },
    magic_dmg = { fire = -95 } }), 'Weak - | Resists Fire (never lands) | all nil');

-- Damage taken for one element, alone and with the rank's half.
expect('damage taken up is weak, with how much more', shown({ magic_dmg = { fire = 100, ice = 50 } }),
    'Weak Fire (+100%), Ice (+50%) | Resists - | all nil');
expect('damage taken down resists, with how much less', shown({ magic_dmg = { fire = -60 } }),
    'Weak - | Resists Fire (-60%) | all nil');
expect('half the damage is half, whatever halves it', shown({ magic_dmg = { fire = -50 } }),
    'Weak - | Resists Fire (half) | all nil');
expect('it multiplies with the rank\'s half', shown({ ranks = { fire = 4 }, magic_dmg = { fire = -50 } }),
    'Weak - | Resists Fire (-75%) | all nil');
expect('and can cancel it out', shown({ ranks = { fire = 4 }, magic_dmg = { fire = 100 } }), 'nothing');
expect('or turn it into a weakness', shown({ ranks = { fire = 4 }, magic_dmg = { fire = 200 } }),
    'Weak Fire (+50%) | Resists - | all nil');
expect('under 5% either way is nothing', shown({ magic_dmg = { earth = 0.35, fire = 4.9, ice = -4.9 } }), 'nothing');
expect('5% either way counts', shown({ magic_dmg = { fire = 5, ice = -5 } }), 'Weak Fire (+5%) | Resists Ice (-5%) | all nil');
expect('damage taken beats the lowest rank', shown({ ranks = { fire = -3, ice = -1 }, magic_dmg = { fire = -60 } }),
    'Weak - | Resists Fire (-60%) | all nil');
expect('a decimal prints with one place', shown({ magic_dmg = { fire = 12.5 } }), 'Weak Fire (+12.5%) | Resists - | all nil');

-- Nullify and absorb come before anything else, nullify first like the server.
expect('absorb resists, and beats rank 11', shown({ ranks = { fire = 11 }, absorb = { fire = 100 } }),
    'Weak - | Resists Fire (absorbs) | all nil');
expect('and damage taken up', shown({ absorb = { fire = 100 }, magic_dmg = { fire = 100 } }),
    'Weak - | Resists Fire (absorbs) | all nil');
expect('a chance under 100 shows', shown({ absorb = { fire = 50 } }), 'Weak - | Resists Fire (absorbs 50%) | all nil');
expect('an element\'s chance and every element\'s roll on their own', shown({ absorb = { fire = 50, all = 50 } }),
    'Weak - | Resists Fire (absorbs 75%), Ice (absorbs 50%), Wind (absorbs 50%), Earth (absorbs 50%), Thunder (absorbs 50%), '
    .. 'Water (absorbs 50%), Light (absorbs 50%), Dark (absorbs 50%) | all nil');
expect('nullify beats absorb', shown({ absorb = { fire = 100 }, nullify = { fire = 100 } }),
    'Weak - | Resists Fire (nullifies) | all nil');
expect('an absorbed element still counts as the lowest rank',
    shown({ ranks = { fire = -3, water = -3, ice = 11 }, absorb = { fire = 100 } }),
    'Weak Water | Resists Fire (absorbs), Ice (never lands) | all nil');

-- Extra magic evasion for one element comes last.
expect('extra magic evasion alone resists, landing less', shown({ ranks = { ice = -3, light = -2 }, meva = { light = 50 } }),
    'Weak Ice | Resists Light (lands less) | all nil');
expect('the half wins over it', shown({ ranks = { water = 4 }, meva = { water = 128 } }),
    'Weak - | Resists Water (half) | all nil');
expect('and so does the lowest rank', shown({ ranks = { light = -3, fire = -1 }, meva = { light = 50 } }),
    'Weak Light | Resists - | all nil');
check('magic evasion for everything or for an effect is nothing', shown({ meva = { all = 25, sleep = 30 } }) == 'nothing');

-- Magic damage taken from every element is a note of its own, from 5% either way.
check('the note', shown({ magic_dmg = { all = -25 } }) == 'Weak - | Resists - | all -25%'
    and shown({ magic_dmg = { all = 100 } }) == 'Weak - | Resists - | all +100%'
    and shown({ magic_dmg = { all = -12.5 } }) == 'Weak - | Resists - | all -12.5%'
    and shown({ magic_dmg = { all = 5 } }) == 'Weak - | Resists - | all +5%', shown({ magic_dmg = { all = -12.5 } }));
check('under 5% is nothing', shown({ magic_dmg = { all = 4.9 } }) == 'nothing' and shown({ magic_dmg = { all = -4 } }) == 'nothing');
expect('it never makes an element weak or resisted', shown({ ranks = { ice = 4 }, magic_dmg = { all = 100 } }),
    'Weak - | Resists Ice (half) | all +100%');

-- The exporter separates changes to these fields from unrelated stat scripts.
check('only elemental script changes mark it', shown({ ranks = { ice = -1 }, flags = { scripted_elements = true } })
    == 'Weak Ice | Resists - | all nil ?' and shown({ ranks = { ice = -1 }, flags = { scripted_stats = true } })
    == 'Weak Ice | Resists - | all nil' and shown({ ranks = { ice = -1 }, flags = { scripted_drops = true } })
    == 'Weak Ice | Resists - | all nil');
check('a flag alone is still nothing', shown({ flags = { scripted_elements = true } }) == 'nothing');

-- A field on a level wins at that level. Without an exact level the row's own fields count.
local leveled = { ranks = { fire = -1 }, levels = { [50] = { ranks = { ice = -1 } }, [51] = {} } };
expect('a level\'s own ranks', shown(leveled, 50), 'Weak Ice | Resists - | all nil');
check('the row\'s at a level without them, or with no level', shown(leveled, 51) == 'Weak Fire | Resists - | all nil'
    and shown(leveled, nil) == 'Weak Fire | Resists - | all nil' and shown(leveled, 99) == 'Weak Fire | Resists - | all nil');

-- Real monsters --------------------------------------------------------------------------------

-- The row at a spawn index in a real zone file.
local function row_at(zone, index)
    local file = dofile(ADDON_DIR .. ('/data/zones/%d.lua'):format(zone));
    for _, row in ipairs(file.monsters) do
        for _, id in ipairs(row.ids or {}) do
            if (id == index) then return row; end
        end
    end
    return nil;
end

-- Each by zone and index, with what the rule says.
local REAL = {
    { 'Airi, Central Temenos, only general stat changes', 37, 278,
        'Weak Fire, Light | Resists Ice (half), Dark (half) | all nil' },
    { 'Fire Elemental, Valkurm Dunes', 103, 82, 'Weak Water | Resists Fire (never lands), Ice (never lands) | all nil' },
    { 'Fire Elemental, Cloister of Flames', 207, 8, 'Weak Water | Resists Fire (absorbs), Ice (never lands) | all nil' },
    { 'Ifrit Prime, Waking the Beast', 207, 7, 'Weak Water | Resists Fire (absorbs), Ice (never lands), Wind (half), '
        .. 'Earth (half), Thunder (half), Light (half), Dark (half) | all -20%' },
    { 'Mystic Avatar Ifrit, Central Temenos', 37, 223, 'Weak Water | Resists Fire (absorbs), Ice (never lands), Wind (never '
        .. 'lands), Earth (never lands), Thunder (never lands), Light (never lands), Dark (never lands) | all nil' },
    { 'Evil Armory, Apollyon', 38, 168, 'Weak - | Resists Fire (nullifies), Ice (nullifies), Wind (nullifies), Earth '
        .. '(nullifies), Thunder (nullifies), Water (nullifies), Light (nullifies), Dark (nullifies) | all -12.5% ?' },
    { 'Sea Puk, Bhaflau Thickets', 52, 175, 'Weak Ice | Resists Wind (absorbs) | all nil' },
    { 'Muut, Attohwa Chasm', 7, 374, 'Weak Light | Resists - | all -25%' },
    { 'Adamantking Effigy, Dynamis-Bastok', 186, 1, 'Weak Thunder | Resists - | all -50%' },
    { 'Qutrub, Arrapago Reef', 54, 66, 'Weak Fire, Light | Resists Ice (half), Dark (half) | all +100%' },
    { 'Shikaree Z, Boneyard Gully, at +0.35% earth', 8, 1, 'nothing' },
    { 'Creek Sahagin, Yuhtunga Jungle', 123, 245, 'Weak Thunder | Resists Water (half) | all nil' },
    { 'Nunyenunc, West Sarutabaruta', 115, 261, 'Weak Ice | Resists Light (lands less) | all nil' },
    { 'Uragnite, Manaclipper', 3, 9, 'Weak Thunder | Resists - | all nil ?' },
    { 'Goblin Tinkerer, Valkurm Dunes', 103, 98, 'Weak Light | Resists - | all nil' },
};
for _, case in ipairs(REAL) do
    local row = row_at(case[2], case[3]);
    check(case[1], row ~= nil and shown(row) == case[4], row and shown(row));
end

-- Printing --------------------------------------------------------------------------------------

-- Only elements in the Weaknesses row, with two spaces between groups.
local function settings()
    local s = defaults.make();
    s.printout.divider = 'spaces';
    for _, part in pairs(s.printout.parts) do part.on = false; end
    s.printout.parts.weaknesses.on = true;
    s.weaknesses.chat = { elements = true, weapons = false, immunities = false, charm = false };
    s.printout.replace_game_line = false;
    return s;
end
local function raw_line(s, e)
    return printout.lines(s, { name = 'x', elements = e })[1];
end
local function line(s, e)
    local text = raw_line(s, e);
    return text and MOCK.plain(text) or nil;
end

local GOBLIN = elements.readout({ ranks = { ice = -3, thunder = -3, water = 4 } });
check('the readout hands each element over by its name in elements.ORDER, for its icon', GOBLIN.weak[1].element == 'ice'
    and GOBLIN.weak[2].element == 'thunder' and GOBLIN.resists[1].element == 'water' and GOBLIN.weak[1].name == nil);
check('and why each one is there, for the overlay\'s tips', GOBLIN.weak[1].why == 'lowest'
    and GOBLIN.weak[1].amount == nil and GOBLIN.weak[2].why == 'lowest' and GOBLIN.weak[2].amount == nil
    and GOBLIN.resists[1].why == 'half' and GOBLIN.resists[1].amount == nil);
-- Each reason, with the amount a tip puts in, the nuke share for never and rarely, and the strength as it prints.
-- The first element in either list is the one each row is about.
local function first(row)
    local e = elements.readout(row);
    local entry = e.weak[1] or e.resists[1];
    return entry.why .. ' ' .. tostring(entry.share or entry.amount) .. ' ' .. tostring(strength_of(entry));
end
local REASONS = {
    { 'nullifies always', { nullify = { fire = 100 } }, 'nullify nil nullifies' },
    { 'nullifies half the time', { nullify = { fire = 50 } }, 'nullify 50% nullifies 50%' },
    { 'absorbs always', { absorb = { fire = 100 } }, 'absorb nil absorbs' },
    { 'absorbs half the time', { absorb = { fire = 50 } }, 'absorb 50% absorbs 50%' },
    { 'rank 11', { ranks = { fire = 11 } }, 'never nil never lands' },
    { 'rank 11 with its own damage taken', { ranks = { fire = 11 }, magic_dmg = { fire = -95 } },
        'never 0.6% never lands' },
    { 'rank 11 with more damage taken', { ranks = { fire = 11 }, magic_dmg = { fire = 100 } },
        'never 25% never lands' },
    { 'rank 10', { ranks = { fire = 10 } }, 'rarely nil rarely lands' },
    { 'rank 10 with its own damage taken', { ranks = { fire = 10 }, magic_dmg = { fire = -50 } },
        'rarely 25% rarely lands' },
    { 'rank 4', { ranks = { fire = 4 } }, 'half nil half' },
    { 'half the damage at rank 0', { magic_dmg = { fire = -50 } }, 'halved nil half' },
    { 'less damage at rank 0', { magic_dmg = { fire = -75 } }, 'less -75% -75%' },
    { 'less damage at rank 5', { ranks = { fire = 5 }, magic_dmg = { fire = -50 } }, 'half_less -75% -75%' },
    { 'more damage', { magic_dmg = { fire = 100 } }, 'more +100% +100%' },
    { 'the lowest rank alone', { ranks = { ice = -3, fire = -2, wind = -2, earth = -2, thunder = -2, water = -2,
        light = -2, dark = -2 } }, 'lowest nil nil' },
    { 'extra magic evasion', { meva = { fire = 10 } }, 'meva nil lands less' },
};
for _, case in ipairs(REASONS) do
    expect(('%s gives its reason, amount and strength'):format(case[1]), first(case[2]), case[3]);
end
-- The amount is what prints after the word. A never or rarely with its own damage taken prints nothing after it, so
-- its nuke share is only for the tip.
local never_dmg = elements.readout({ ranks = { fire = 11 }, magic_dmg = { fire = -95 } }).resists[1];
local rarely_dmg = elements.readout({ ranks = { fire = 10 }, magic_dmg = { fire = -50 } }).resists[1];
check('never and rarely print no amount, and keep their nuke share apart for the tip', never_dmg.strength == 'str_never'
    and never_dmg.amount == nil and never_dmg.share == '0.6%' and rarely_dmg.strength == 'str_rarely'
    and rarely_dmg.amount == nil and rarely_dmg.share == '25%');
local s = settings();
expect('weak, then resists with its strength', line(s, GOBLIN), 'Weaknesses: Weak: Ice, Thunder  Resists: Water (half)');
s.printout.divider = 'star';
expect('the regular divider goes between the two', line(s, GOBLIN),
    'Weaknesses: Weak: Ice, Thunder \129\154 Resists: Water (half)');
s.printout.divider = 'spaces';
s.elements.strength = false;
expect('Show how strong off leaves the strength out', line(s, GOBLIN), 'Weaknesses: Weak: Ice, Thunder  Resists: Water');

-- Names in a row that share a strength print it once, after the last of them.
local MYSTIC = elements.readout(row_at(37, 223));
s = settings();
expect('a shared strength prints once', line(s, MYSTIC), 'Weaknesses: Weak: Water  Resists: Fire (absorbs), Ice, Wind, Earth, '
    .. 'Thunder, Light, Dark (never lands)');
local IFRIT = elements.readout(row_at(207, 7));
expect('each run of one strength gets its own', line(s, IFRIT), 'Weaknesses: Weak: Water  Resists: Fire (absorbs), Ice (never '
    .. 'lands), Wind, Earth, Thunder, Light, Dark (half)  Magic damage -20%');
local ARMORY = elements.readout(row_at(38, 168));
expect('every element nullified', line(s, ARMORY), 'Weaknesses: Resists: Fire, Ice, Wind, Earth, Thunder, Water, Light, Dark '
    .. '(nullifies)  Magic damage -12.5%?');
expect('the same strength apart in the list prints twice',
    line(s, elements.readout({ ranks = { fire = 4, ice = 11, wind = 4 } })),
    'Weaknesses: Resists: Fire (half), Ice (never lands), Wind (half)');

-- The note for every element, with Show how strong on only.
local MUUT = elements.readout(row_at(7, 374));
expect('the magic damage note follows the lists', line(s, MUUT), 'Weaknesses: Weak: Light  Magic damage -25%');
local NOTE_ONLY = elements.readout({ magic_dmg = { all = -50 } });
expect('the note alone prints', line(s, NOTE_ONLY), 'Weaknesses: Magic damage -50%');
s.elements.strength = false;
expect('Show how strong off leaves the note out', line(s, MUUT), 'Weaknesses: Weak: Light');
expect('and a monster with only the note leaves the part out', line(s, NOTE_ONLY), nil);
check('nothing to say leaves the part out', line(settings(), nil) == nil
    and line(settings(), elements.readout({ ranks = { fire = 2 } })) == nil);

-- The "?" when a script can change any of it.
expect('the ? at the end', line(settings(), elements.readout(row_at(3, 9))), 'Weaknesses: Weak: Thunder?');

-- Your words, cleaned like labels. An empty word leaves the word and its label divider out.
s = settings();
s.elements.weak_word = 'Soft \226\152\133spot';
s.elements.resist_word = 'Tough';
expect('your own words, printable ASCII only', line(s, GOBLIN), 'Weaknesses: Soft spot: Ice, Thunder  Tough: Water (half)');
s.elements.weak_word = '';
s.elements.resist_word = '   ';
expect('empty words leave the word and divider out', line(s, GOBLIN), 'Weaknesses: Ice, Thunder  Water (half)');
s.elements.weak_word = '  Weak  ';
s.elements.resist_word = 'Resists';
expect('spaces around a word go', line(s, GOBLIN), 'Weaknesses: Weak: Ice, Thunder  Resists: Water (half)');

-- The label divider follows the part's label and each word.
s = settings();
s.printout.label_divider = 'arrow';
expect('the label divider after the label and the words', line(s, GOBLIN), 'Weaknesses \129\168 Weak \129\168 Ice, Thunder  '
    .. 'Resists \129\168 Water (half)');
s.printout.label_divider = 'custom';
s.printout.label_separator = '>';
expect('a custom one too', line(s, GOBLIN), 'Weaknesses> Weak> Ice, Thunder  Resists> Water (half)');
s = settings();
s.printout.parts.weaknesses.label = 'Elem';
expect('your own label', line(s, GOBLIN), 'Elem: Weak: Ice, Thunder  Resists: Water (half)');
s.printout.parts.weaknesses.label = '';
expect('no label starts with the first word', line(s, GOBLIN), 'Weak: Ice, Thunder  Resists: Water (half)');

-- Every color, down to the bytes.
s = settings();
s.colors.line, s.colors.elements_label, s.colors.elements_weak, s.colors.elements_resist, s.colors.elements_detail = 106, 7, 2, 68, 67;
local want = color(106) .. color(7) .. 'Weaknesses' .. color(7) .. ': ' .. color(7) .. 'Weak: ' .. color(2) .. 'Ice' .. color(67)
    .. ', ' .. color(2) .. 'Thunder' .. color(67) .. '  ' .. color(7) .. 'Resists: ' .. color(68) .. 'Water' .. color(67)
    .. ' (half)';
check('label, words, names and details each in their color', raw_line(s, GOBLIN) == want, MOCK.plain(raw_line(s, GOBLIN)));
want = color(106) .. color(7) .. 'Weaknesses' .. color(7) .. ': ' .. color(7) .. 'Weak: ' .. color(2) .. 'Light' .. color(67)
    .. '  ' .. color(67) .. 'Magic damage -25%';
check('the note in the detail color', raw_line(s, MUUT) == want, MOCK.plain(raw_line(s, MUUT)));
check('the ? in the detail color', raw_line(s, elements.readout(row_at(3, 9))):sub(-3) == color(67) .. '?');

-- Weak and resists differ in every skin but Minimal, which prints in one color.
local apart = true;
for _, skin in ipairs(skins.LIST) do
    if (skin.id ~= 'minimal') then
        apart = apart and skin.chat.elements_weak ~= skin.chat.elements_resist;
    end
end
check('weak and resists differ in every skin but Minimal', apart);
check('the Colorblind safe skin paints weak cyan and resists coral', skins.find('colorblind').chat.elements_weak == 6
    and skins.find('colorblind').chat.elements_resist == 8);

-- Its place --------------------------------------------------------------------------------------

local d = defaults.make();
check('Weaknesses starts off on its own line', d.printout.parts.weaknesses.on == false
    and d.printout.parts.weaknesses.label == 'Weaknesses' and d.printout.parts.weaknesses.new_line == true);
check('Weaknesses follows Magic in the default order', printout.DEFAULT_ORDER:find('magic weaknesses effects family', 1, true) ~= nil,
    printout.DEFAULT_ORDER);
check('its words and Show how strong', d.elements.weak_word == 'Weak' and d.elements.resist_word == 'Resists'
    and d.elements.strength == true);

-- The default layout puts it on a line of its own.
s = defaults.make();
s.printout.divider = 'spaces';
s.printout.parts.weaknesses.on = true;
s.weaknesses.chat = { elements = true, weapons = false, immunities = true, charm = false };
local lines = printout.lines(s, { name = 'Goblin', low = 20, high = 20, con = 3, elements = GOBLIN,
    immune = { 'bind' } });
for i, each in ipairs(lines) do lines[i] = MOCK.plain(each); end
check('elements and immunities share one Weaknesses line', #lines == 2
    and lines[2] == 'Weaknesses: Weak: Ice, Thunder  Resists: Water (half)  Immune: Bind', table.concat(lines, ' / '));

-- Through the addon ------------------------------------------------------------------------------

-- A settings file without the elements part in its order or its settings.
MOCK.settings_file = { printout = { order = 'difficulty hit evade crit aggro magic immunities drops' },
    colors = { immunities_name = 69 } };
dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local cur = MOCK.settings.current;
check('an older file gets one Weaknesses row, off and on its own line', cur.printout.order
    == 'difficulty hit pdif offhand offhandpdif ranged rangedpdif evade block parry crit crittaken job aggro links magic weaknesses effects family vitals movement pursuit spawn claim dangers blue fight traits crystal rewards drops steal pet'
    and cur.printout.parts.weaknesses.on == false
    and cur.printout.parts.weaknesses.new_line == true and cur.printout.parts.weaknesses.label == 'Weaknesses', cur.printout.order);
check('with its words, Show how strong and the Phoenix colors', cur.elements.weak_word == 'Weak'
    and cur.elements.resist_word == 'Resists' and cur.elements.strength == true and cur.colors.elements_label == 106
    and cur.colors.elements_weak == 2 and cur.colors.elements_resist == 68 and cur.colors.elements_detail == 106
    and cur.colors.immunities_name == 69);
MOCK.command('/checkmate weakword x');
check('its elements table is the file\'s own', MOCK.settings.defaults.elements.weak_word == 'Weak');
MOCK.command('/checkmate weakword Weak');

-- The sample.
local function run(text)
    local n = #MOCK.printed;
    MOCK.command(text);
    return MOCK.printed_since(n);
end
check('the sample leaves it out while it\'s off', not table.concat(run('/checkmate sample'), ' / '):find('Elements', 1, true));
cur.weaknesses.chat = { elements = true, weapons = false, immunities = false, charm = false };
MOCK.command('/checkmate show weaknesses');
cur.printout.divider = 'spaces';
local printed = run('/checkmate sample');
check('and shows it when it\'s on', printed[3] == '[checkmate] Weaknesses: Weak: Ice, Thunder  Resists: Water (half)',
    table.concat(printed, ' / '));
MOCK.command('/checkmate strength off');
MOCK.command('/checkmate resistword ""');
printed = run('/checkmate sample');
check('with your words and Show how strong off', printed[3] == '[checkmate] Weaknesses: Weak: Ice, Thunder  Water',
    table.concat(printed, ' / '));
MOCK.command('/checkmate strength on');
MOCK.command('/checkmate resistword Resists');

-- A real /check. The part reads the data row, so it prints for a monster that can't be gauged too.
local function readout(zone, index, name, level, con, message)
    MOCK.zone_in(zone);
    MOCK.entities[index] = { Name = name };
    local n = #MOCK.printed;
    MOCK.packet(MOCK.check_packet(index, level, con, message or 174));
    MOCK.frame();
    return MOCK.printed_since(n);
end
printed = readout(207, 7, 'Ifrit Prime', 0, nil, 249);
check('Ifrit Prime in Waking the Beast', printed[3] == '[checkmate] Weaknesses: Weak: Water  Resists: Fire (absorbs), Ice '
    .. '(never lands), Wind, Earth, Thunder, Light, Dark (half)  Magic damage -20%', table.concat(printed, ' / '));
printed = readout(103, 82, 'Fire Elemental', 39, 0);
check('Fire Elemental in Valkurm Dunes', printed[3] == '[checkmate] Weaknesses: Weak: Water  Resists: Fire, Ice (never lands)',
    table.concat(printed, ' / '));
MOCK.command('/checkmate hide aggro');
MOCK.command('/checkmate hide links');
printed = readout(103, 98, 'Goblin Tinkerer', 19, 3);
check('a Goblin Tinkerer', #printed == 2 and printed[2] == '[checkmate] Weaknesses: Weak: Light', table.concat(printed, ' / '));
printed = readout(8, 1, 'Shikaree Z', 0, nil, 249);
check('Shikaree Z has nothing to say, so only the /check line prints', #printed == 1
    and printed[1]:find('^%[checkmate%] Shikaree Z') ~= nil, table.concat(printed, ' / '));
MOCK.zone_in(999);
MOCK.entities[400] = { Name = 'Nobody' };
local n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(400, 30, 3, 174));
MOCK.frame();
check('a monster with no data leaves it out', #MOCK.printed_since(n) == 1, table.concat(MOCK.printed_since(n), ' / '));

return MOCK.report();
