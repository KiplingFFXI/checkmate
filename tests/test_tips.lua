-- The words of each overlay icon's tip: every reason an element is weak or resisted, a Magic school's element,
-- drops at each Treasure Hunter, Steal with one item or a list, before you can use it and before its level is
-- known, every immunity and every job. The readouts come from core\elements.lua, core\drops.lua and
-- core\steal.lua on rows made here, so a tip says what the line it explains says. test_overlay.lua covers showing
-- them.
local tips     = require('ui.tips');
local elements = require('core.elements');
local drops    = require('core.drops');
local steal    = require('core.steal');
local printout = require('core.printout');
local wording  = require('core.wording');
local defaults = require('ui.defaults');

local s = defaults.make();

-- Every tip made below, for the checks at the end.
local made = {};
local function tip(result, kind, id)
    local text = tips.text(s, result, kind, id);
    if (text ~= nil) then made[#made + 1] = text; end
    return text;
end
local function has(text, want) return (text or ''):find(want, 1, true) ~= nil; end

-- Elements ---------------------------------------------------------------------------------------

-- The tip for one element of a row's Elements part. The id is text, the way the mark carries it.
local function element(row, id)
    return tip({ elements = elements.readout(row) }, 'element', id);
end

expect('nullify', element({ nullify = { fire = 100 } }, 'fire'), 'Fire. Fire damage spells do no damage to it.');
expect('nullify some of the time', element({ nullify = { fire = 50 } }, 'fire'),
    'Fire. Fire damage spells do no damage to it 50% of the time.');
expect('absorb', element({ absorb = { fire = 100 } }, 'fire'), 'Fire. Fire damage spells heal it instead.');
expect('absorb some of the time', element({ absorb = { fire = 50 } }, 'fire'),
    'Fire. Fire damage spells heal it instead 50% of the time.');
expect('rank 11', element({ ranks = { fire = 11 } }, 'fire'), 'Fire. Its resistance rank to fire is 11, so effects '
    .. 'that go by fire never land, and fire nukes do an eighth of their damage.');
-- Like a Mystic Avatar in Temenos, whose ice damage taken is -95 on top of rank 11.
expect('rank 11 with its own damage taken gives the share a nuke really does',
    element({ ranks = { ice = 11 }, magic_dmg = { ice = -95 } }, 'ice'), 'Ice. Its resistance rank to ice is 11, so '
    .. 'effects that go by ice never land, and ice nukes do only 0.6% of their damage.');
expect('rank 10', element({ ranks = { fire = 10 } }, 'fire'), 'Fire. Its resistance rank to fire is 10, so each '
    .. 'roll for a spell that goes by fire has only a 5% chance to get through. Fire nukes do half damage at best, and '
    .. 'effects that go by fire rarely land.');
expect('rank 10 on an element that starts with a vowel', element({ ranks = { ice = 10 } }, 'ice'), 'Ice. Its '
    .. 'resistance rank to ice is 10, so each roll for a spell that goes by ice has only a 5% chance to get through. '
    .. 'Ice nukes do half damage at best, and effects that go by ice rarely land.');
expect('rank 10 with its own damage taken gives the best share a nuke really does',
    element({ ranks = { earth = 10 }, magic_dmg = { earth = -50 } }, 'earth'), 'Earth. Its resistance rank to earth '
    .. 'is 10, so each roll for a spell that goes by earth has only a 5% chance to get through. Earth nukes do 25% of '
    .. 'their damage at best, and effects that go by earth rarely land.');
expect('rank 4', element({ ranks = { water = 4 } }, 'water'), 'Water. Its resistance rank to water is 4 or higher, '
    .. 'so water nukes land less often and do half damage, and effects that go by water land less often too.');
expect('half the damage from damage taken alone says nothing about its rank',
    element({ magic_dmg = { fire = -50 } }, 'fire'), 'Fire. Fire nukes do half damage to it.');
expect('less damage', element({ magic_dmg = { water = -75 } }, 'water'),
    'Water. Water nukes do 75% less damage to it.');
expect('and less with the rank\'s half on top, which still says what the rank does',
    element({ ranks = { water = 5 }, magic_dmg = { water = -50 } }, 'water'), 'Water. Its resistance rank to water is '
    .. '4 or higher, so water nukes land less often and do half damage, and effects that go by water land less often '
    .. 'too. With its own water damage taken on top, water nukes do 75% less damage to it.');
expect('more damage', element({ magic_dmg = { ice = 100 } }, 'ice'), 'Ice. Ice nukes do 100% more damage to it.');
expect('extra magic evasion', element({ meva = { water = 10 } }, 'water'),
    'Water. It has extra magic evasion against water, so water spells land less often.');
local LOWEST = 'Its resistance rank to ice is its lowest, so ice nukes and effects that go by ice land on it more '
    .. 'often than those of an element with a higher rank.';
local alone = { ranks = { fire = -2, ice = -3, wind = -2, earth = -2, thunder = -2, water = -2, light = -2,
    dark = -2 } };
expect('the lowest rank', element(alone, 'ice'), 'Ice. ' .. LOWEST);
-- Like a Thunder Elemental, where the elements ranked higher never land, so it can't say "a little" more often.
expect('the lowest next to elements that never land', element({ ranks = { earth = -3, thunder = 11, water = 11 } },
    'earth'), 'Earth. ' .. (LOWEST:gsub('ice', 'earth')));
-- The sample goblin, with ice and thunder tied at its lowest rank.
local goblin = { ranks = { ice = -3, thunder = -3, water = 4 } };
local ice, thunder = element(goblin, 'ice'), element(goblin, 'thunder');
check('two at the lowest rank each get it, with their own element, and neither says the others',
    ice == 'Ice. ' .. LOWEST and thunder == 'Thunder. ' .. (LOWEST:gsub('ice', 'thunder'))
    and not has(ice, 'other') and not has(thunder, 'other'), tostring(ice) .. ' / ' .. tostring(thunder));
expect('a part a script can change says so', element({ ranks = { fire = 11 }, flags = { scripted_elements = true } },
    'fire'), 'Fire. Its resistance rank to fire is 11, so effects that go by fire never land, and fire nukes do an '
    .. 'eighth of their damage. The ? means these values can change during the fight. checkmate shows the stored values.');
check('an element the part doesn\'t list has no tip', element(goblin, 'fire') == nil);
check('and nor does one with no Elements part', tips.text(s, {}, 'element', 'ice') == nil);
-- Every reason on every element, so none reads "a ice" or "a earth".
local wrong_words = {};
for _, id in ipairs(elements.ORDER) do
    for _, row in ipairs({ { nullify = { [id] = 100 } }, { nullify = { [id] = 50 } }, { absorb = { [id] = 100 } },
        { absorb = { [id] = 50 } }, { ranks = { [id] = 11 } }, { ranks = { [id] = 11 }, magic_dmg = { [id] = -95 } },
        { ranks = { [id] = 10 } }, { ranks = { [id] = 10 }, magic_dmg = { [id] = -50 } }, { ranks = { [id] = 4 } },
        { ranks = { [id] = 5 }, magic_dmg = { [id] = -50 } }, { magic_dmg = { [id] = -50 } },
        { magic_dmg = { [id] = -75 } }, { magic_dmg = { [id] = 100 } }, { ranks = { [id] = -3 } },
        { meva = { [id] = 10 } } }) do
        local text = element(row, id);
        if (text == nil or text:find(' [Aa] [AEIOUaeiou]')) then
            wrong_words[#wrong_words + 1] = id .. ': ' .. tostring(text);
        end
    end
end
check('every reason has a tip on every element, and none puts "a" before a vowel', #wrong_words == 0,
    table.concat(wrong_words, ' / '));

-- A Magic school's element -----------------------------------------------------------------------

local SCHOOL = 'Ice. It resists ice as little as any element this school\'s spell can be, so the Magic part goes by '
    .. 'ice.';
expect('a school\'s element', tip({ magic = { { school = 'school_elemental', low = 88, high = 88, element = 'ice' } } },
    'school', 'ice'), SCHOOL);
local never = tip({ magic = { { school = 'school_ninjutsu', word = 'magic_never', element = 'ice' } } }, 'school',
    'ice');
check('and the same after a word like never, naming neither a chance nor the spell', never == SCHOOL
    and not has(never, 'chance') and not has(never, 'that spell'), never);
check('an element with no name has no tip', tips.text(s, {}, 'school', 'bogus') == nil);

-- Jobs -------------------------------------------------------------------------------------------

expect('the main job', tip({ job = 'war/thf' }, 'job', 'war'), 'Warrior, its main job.');
expect('the support job', tip({ job = 'war/thf' }, 'job', 'thf'), 'Thief, its support job.');
expect('a support job the same as the main one only marks the main one', tip({ job = 'drk/drk' }, 'job', 'drk'),
    'Dark Knight, its main job.');
check('a job checkmate has no name for has no tip', tips.text(s, { job = 'xyz/war' }, 'job', 'xyz') == nil);
local unnamed = {};
for _, entry in ipairs(wording.LIST) do
    local key = entry.key:match('^job_(%l+)$');
    if (key ~= nil and tip({ job = key .. '/war' }, 'job', key) == nil) then unnamed[#unnamed + 1] = key; end
end
check('every job with letters has its full name', #unnamed == 0, table.concat(unnamed, ', '));

-- Drops ------------------------------------------------------------------------------------------

for id, name in pairs({ [930] = 'Beastman Blood', [508] = 'Goblin Helm', [4105] = 'Ice Crystal', [880] = 'Bone Chip',
    [4104] = 'Fire\129\154Crystal' }) do
    MOCK.items[id] = { Name = { name } };
end
local DROP_ROW = { drops = { { rate = 150, item = 930 }, { rate = 50, item = 508 }, { rate = 1000, item = 4105 },
    { rate = 5, item = 880 }, { rate = 150, item = 4104 } } };
local function drop(th, id)
    local setting = defaults.make().drops;
    setting.th, setting.max_items = th, 0;
    return tip({ drops = drops.readout(DROP_ROW, setting) }, 'item', id);
end
expect('a drop', drop(0, '930'), 'Beastman Blood. It drops 15% of the time at Treasure Hunter 0.');
expect('the same drop at Treasure Hunter 2', drop(2, '930'),
    'Beastman Blood. It drops 40% of the time at Treasure Hunter 2.');
expect('a chance under 10% with its decimal, like the line', drop(0, '508'),
    'Goblin Helm. It drops 5.0% of the time at Treasure Hunter 0.');
expect('and under 1%', drop(0, '880'), 'Bone Chip. It drops 0.5% of the time at Treasure Hunter 0.');
expect('an item that always drops', drop(0, '4105'), 'Ice Crystal. It always drops.');
expect('a name from the client comes out in plain text', drop(0, '4104'),
    'FireCrystal. It drops 15% of the time at Treasure Hunter 0.');
check('an item not in the list has no tip', drop(0, '656') == nil and tips.text(s, {}, 'item', '930') == nil);

-- Steal ------------------------------------------------------------------------------------------

for id, name in pairs({ [864] = 'Fish Scales', [656] = 'Beastcoin', [605] = 'Pickaxe', [868] = 'Pugil Scales' }) do
    MOCK.items[id] = { Name = { name } };
end
-- A thief at level 42 with +2 Steal on, against a monster at `low` to `high`, or `you` nil for one who can't steal.
local THIEF = { level = 42, bonus = 2 };
local NO_BONUS = { level = 42, bonus = 0 };
local function stolen(ids, you, low, high, id)
    return tip({ steal = steal.readout({ steal = ids }, you, low, high) }, 'steal', id);
end
local NEED_THF = 'You need THF at level 5 or higher, as your main or support job, to use Steal.';
expect('one item', stolen({ 656 }, THIEF, 42, 42, '656'), 'Beastcoin. Your Steal takes it 54% of the time, if the item is still available and you can receive it.');
expect('a level range gives a range, like the line', stolen({ 864 }, THIEF, 19, 20, '864'),
    'Fish Scales. Your Steal takes it 76-77% of the time, if the item is still available and you can receive it.');
s.printout.number_style = 'midpoint';
expect('and its middle with Number ranges on Middle', stolen({ 864 }, THIEF, 19, 20, '864'),
    'Fish Scales. Your Steal takes it ~77% of the time, if the item is still available and you can receive it.');
s.printout.number_style = 'range';
expect('two items each get half', stolen({ 605, 656 }, NO_BONUS, 41, 41, '605'), 'Pickaxe. Your Steal works 51% of '
    .. 'the time, and each time it takes one of its 2 items at random, so you get this one half of those times, if the item is still available and you can receive it.');
expect('three items each get a third', stolen({ 605, 656, 868 }, NO_BONUS, 41, 41, '868'), 'Pugil Scales. Your '
    .. 'Steal works 51% of the time, and each time it takes one of its 3 items at random, so you get this one a third '
    .. 'of those times, if the item is still available and you can receive it.');
expect('without Steal it says what you need', stolen({ 864 }, nil, 42, 42, '864'),
    'Fish Scales. Steal can take it if the item is still available and you can receive it. ' .. NEED_THF);
expect('and with a list it says each Steal takes one', stolen({ 605, 656 }, nil, 42, 42, '605'),
    'Pickaxe. Each successful Steal takes one of its 2 items at random, if still available and you can receive it. ' .. NEED_THF);
expect('before its level is known it says so', stolen({ 864 }, THIEF, nil, nil, '864'),
    'Fish Scales. Steal can take it if the item is still available and you can receive it. Your chance isn\'t known until the monster\'s level is.');
check('an item Steal can\'t take has no tip', stolen({ 864 }, THIEF, 42, 42, '656') == nil
    and tips.text(s, {}, 'steal', '864') == nil);

-- Immunities -------------------------------------------------------------------------------------

local SERVER = 'The server stops it outright, no matter your magic accuracy.';
s.immunities.dark_sleep.label = 'Slp';
expect('Sleep, by its own name even with a label of yours', tip({}, 'immunity', 'dark_sleep'),
    'Immune to Sleep, the dark sleep of spells like Sleep, Sleepga and Soporific. ' .. SERVER);
expect('Lullaby', tip({}, 'immunity', 'light_sleep'),
    'Immune to Lullaby, the light sleep of Foe Lullaby, Horde Lullaby, Sheep Song and Yawn. ' .. SERVER);
s.immunities.dark_sleep.label = 'Sleep';
local wrong = {};
for _, entry in ipairs(printout.IMMUNITIES) do
    local text = tip({}, 'immunity', entry.id);
    local want = ('Immune to %s'):format(entry.label);
    if (text == nil or text:sub(1, #want) ~= want or text:sub(-#SERVER) ~= SERVER) then
        wrong[#wrong + 1] = entry.id;
    end
end
check('all 16 immunities have a tip with their name', #printout.IMMUNITIES == 16 and #wrong == 0,
    table.concat(wrong, ', '));
expect('like Bind', tips.text(s, {}, 'immunity', 'bind'), 'Immune to Bind. ' .. SERVER);
check('an immunity checkmate doesn\'t know has no tip', tips.text(s, {}, 'immunity', 'bogus') == nil);

-- Anything else ----------------------------------------------------------------------------------

check('a kind of mark with no tips has none', tips.text(s, {}, 'bogus', 'ice') == nil);
local more = {};
for _, kind in ipairs({ 'element', 'school', 'item', 'steal', 'immunity', 'job', 'bogus' }) do
    if (tips.more(s, { job = 'war/thf' }, kind, 'war') ~= nil) then more[#more + 1] = kind; end
end
check('no kind has a second line yet', #more == 0, table.concat(more, ', '));

-- Every tip made above is plain text that reads as sentences.
local bad = {};
for _, text in ipairs(made) do
    if (type(text) ~= 'string' or text:find('[^\32-\126]') or text:sub(-1) ~= '.' or text:find('{', 1, true)
        or text:find('[^%d]%%') or text:find('^%%') or text:find('--', 1, true)) then
        bad[#bad + 1] = text;
    end
end
check('every tip is printable ASCII, ends with a period and has nothing left to fill in', #made > 50 and #bad == 0,
    #made .. ' tips: ' .. table.concat(bad, ' / '));

return MOCK.report();
