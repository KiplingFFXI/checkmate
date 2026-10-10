-- Tests the Steal part. That covers the roll against worked examples from the real data, THF as your main or
-- support job, gear under its own level and under a level sync, Btm. Knife on a support THF, Rogue's Ring's HP and
-- TP line, the item alone on other jobs and before THF 5, lists, nothing, an unknown level, real monsters through a
-- /check, its line before and after the /checkparam reply, every other line staying the same with it off, the
-- overlay, which works your chance out with the rest of its readout, again when your support job comes back, and
-- refreshes when local inputs change, and the ring using base HP from the job info packet.
local steal = require('core.steal');

dofile(ADDON_DIR .. '/checkmate.lua');
MOCK.fire('load');
local s = MOCK.settings.current;

-- Two spaces between parts keep the lines below easy to read. test_printout.lua covers the dividers.
s.printout.divider = 'spaces';

-- The client's short names, which the Drops part prints too.
for id, name in pairs({ [864] = 'Fish Scales', [656] = 'Beastcoin', [605] = 'Pickaxe', [749] = 'Mtl. Beastcoin',
    [1449] = 'T. Whiteshell', [1452] = 'O. Bronzepiece', [1455] = '1 Byne Bill', [868] = 'Pugil Scales',
    [4484] = 'Shall Shell', [4104] = 'Fire Crystal', [4105] = 'Ice Crystal' }) do
    MOCK.items[id] = { Name = { name } };
end

local WAR, BLM, THF, NIN = 1, 4, 6, 13;
local function jobs(main, level, sub, sub_level)
    MOCK.player.main_job, MOCK.player.main_level = main, level;
    MOCK.player.sub_job, MOCK.player.sub_level = sub or 0, sub_level or 0;
end
-- Gear by slot: 0 main, 4 head, 6 hands, 7 legs, 8 feet, 9 neck, 13 ring. SET is Rogue's Bonnet (+1 from 54),
-- Thief's Kote (+3 from 70), Asn. Culottes +1 (+5 from 75), Rog. Poulaines +1 (+2 from 74) and Rabbit Charm (+1
-- from 7), +12 at 75.
local SET = { [4] = 12514, [6] = 12748, [7] = 15585, [8] = 15357, [9] = 13112 };
local CHARM, KNIFE, RING, CULOTTES = 13112, 17623, 13291, 15585;
local function wear(gear, more)
    local on = {};
    for slot, id in pairs(gear or {}) do on[slot] = id; end
    for slot, id in pairs(more or {}) do on[slot] = id; end
    MOCK.player.equipment = on;
end
local function hp_tp(hp, tp)
    MOCK.player.hp, MOCK.player.tp = hp, tp or 0;
end

-- The roll on its own -----------------------------------------------------------------------------

-- The lowest and highest level of the real data's row for `name` at `index` in `zone`.
local function levels_of(zone, name, index)
    local file = loadfile(ADDON_DIR .. '/data/zones/' .. zone .. '.lua')();
    for _, row in ipairs(file.monsters) do
        for _, id in ipairs(row.ids) do
            if (row.name == name and id == index) then
                local low, high;
                for level in pairs(row.levels) do
                    low, high = math.min(low or level, level), math.max(high or level, level);
                end
                return low, high;
            end
        end
    end
end
-- What you bring with your jobs and gear now.
local function you()
    local p = MOCK.player;
    return steal.you(p.main_job, p.main_level, p.sub_job, p.sub_level);
end
-- Your chance against a monster at `low` to `high`, like "89-92", or "none" when you can't use Steal.
local function chance(low, high)
    local r = steal.readout({ steal = { 864 } }, you(), low, high or low);
    if (r.low == nil) then return 'none'; end
    return (r.low == r.high) and tostring(r.low) or (r.low .. '-' .. r.high);
end

-- A THF 75 / NIN 37 with the +12 set against a Sea Serpent Grotto Razorjaw Pugil: 50 + 2 x 12 + 75 - its level.
jobs(THF, 75, NIN, 37);
wear(SET);
local low, high = levels_of(176, 'Razorjaw Pugil', 289);
check('a Razorjaw Pugil is 57 to 60', low == 57 and high == 60, low .. '-' .. high);
local mine = you();
check('a THF 75 with the set brings THF 75 and +12', mine.level == 75 and mine.bonus == 12, mine.level .. ' ' .. mine.bonus);
expect('so 89-92% before its level is known', chance(low, high), '89-92');
expect('and 91% at 58', chance(58), '91');
-- Rogue's Ring uses the base max HP sent by the server, before gear and food.
MOCK.packet(MOCK.job_info_packet(1000));
wear(SET, { [13] = RING });
hp_tp(700, 500);
expect('Rogue\'s Ring at 70% HP and 50% TP makes it 97%', chance(58), '97');
hp_tp(751, 0);
expect('at 75.1% HP it doesn\'t count', chance(58), '91');
hp_tp(750, 1000);
expect('nor at 75% HP with 100% TP', chance(58), '91');
hp_tp(750, 999);
expect('at 75% HP and 99.9% TP it does', chance(58), '97');
-- Displayed HP cannot tell whether the ring is active before the base HP message arrives.
require('core.player').on_base_hp(nil);
MOCK.player.hp_max = 1038;
hp_tp(760, 0);
expect('unknown base HP covers both ring outcomes instead of choosing the displayed-HP bonus', chance(58), '91-97');
MOCK.packet(MOCK.job_info_packet(1000));
expect('the real base HP rules out that bonus', chance(58), '91');
MOCK.player.hp_max = 1000;
-- Your HP and TP are only read with the ring on at its level, and only once.
local function reads_of_you()
    MOCK.reads = 0;
    you();
    return MOCK.reads;
end
local with_ring = reads_of_you();
wear(SET, { [13] = RING, [14] = RING });
local two_rings = reads_of_you();
wear(SET);
local without = reads_of_you();
check('the ring reads your HP and TP once, 2 more reads', with_ring - without == 2, with_ring .. ' vs ' .. without);
check('and still once with one on each hand', two_rings - without == 2, two_rings .. ' vs ' .. without);
jobs(THF, 49, NIN, 24);
wear(SET, { [13] = RING });
hp_tp(100, 0);
check('and at THF 49 your HP and TP aren\'t read, since the ring is level 50', reads_of_you() == without);
expect('and under its level it adds nothing, while Rabbit Charm still adds 1', chance(58), '43');
hp_tp(1000, 0);

-- A NIN 75 / THF 37 with Btm. Knife against a Castle Oztroja Yagudo Abbot. Your THF level is your support level, and
-- the knife counts from main level 71: 50 + 2 x 2 + 37 - its level.
jobs(NIN, 75, THF, 37);
wear({ [0] = KNIFE });
low, high = levels_of(151, 'Yagudo Abbot', 231);
check('a Yagudo Abbot is 55 to 59', low == 55 and high == 59, low .. '-' .. high);
expect('a support THF 37 with Btm. Knife has 32-36%', chance(low, high), '32-36');
expect('and 34% at 57', chance(57), '34');
wear();
expect('30% without the knife', chance(57), '30');
jobs(NIN, 70, THF, 35);
wear({ [0] = KNIFE });
expect('at NIN 70 the knife is under its level, so 50 + 35 - 57 is 28%', chance(57), '28');

-- The chance never goes over 100% or under 0%.
jobs(THF, 75);
wear();
low = levels_of(103, 'Goblin Butcher', 12);
check('a Valkurm Dunes Goblin Butcher is 17 at its lowest', low == 17, low);
expect('a THF 75 has 50 + 75 - 17, 108% kept at 100%', chance(low), '100');
jobs(WAR, 20, THF, 10);
low = levels_of(151, 'Yagudo Avatar', 422);
check('Yagudo Avatar is 75', low == 75, low);
expect('a WAR 20 / THF 10 has 50 + 10 - 75, -15% kept at 0%', chance(low), '0');

-- A THF 75 synced to 25, with a support level of 12, against a Qufim Island Greater Pugil. Gear only counts once
-- your main level reaches its own, so only Rabbit Charm adds: 50 + 2 + 25 - its level.
jobs(THF, 25, NIN, 12);
wear({ [7] = CULOTTES, [9] = CHARM });
low, high = levels_of(126, 'Greater Pugil', 2);
check('a Greater Pugil is 28 to 29', low == 28 and high == 29, low .. '-' .. high);
check('under the sync the culottes add nothing', you().level == 25 and you().bonus == 1);
expect('so 48-49%', chance(low, high), '48-49');

-- Without THF at 5 or higher you can't use Steal, so there's no chance, and your gear is never read.
jobs(WAR, 75, NIN, 37);
wear(SET);
MOCK.reads = 0;
check('a WAR 75 / NIN 37 can\'t use Steal, and none of its gear is read', you() == nil and MOCK.reads == 0, MOCK.reads);
jobs(THF, 4);
check('nor can a THF 4', you() == nil);
jobs(WAR, 9, THF, 4);
check('nor a WAR 9 / THF 4', you() == nil);
jobs(WAR, 10, THF, 5);
wear();
expect('a WAR 10 / THF 5 can, with 50 + 5 - 25 against a level 25 Beach Pugil', chance(25), '30');
-- A restricted support job comes as job 0 at level 0, the same as none.
jobs(THF, 75, 0, 0);
check('a THF 75 with its support job restricted keeps THF 75', you() ~= nil and you().level == 75);
jobs(NIN, 75, 0, 0);
check('a NIN 75 with it restricted has no THF', you() == nil);

-- The readout. Nothing to steal has no chance even for a thief, no thief has no chance, and an unknown level says so.
jobs(THF, 75);
local r = steal.readout({}, you(), 50, 50);
check('a row with nothing to steal has no items and no chance', #r.items == 0 and r.low == nil and r.unknown == nil);
r = steal.readout({ steal = { 605, 656 } }, nil, 19, 19);
check('without a thief it names the items in the row\'s order and has no chance', table.concat(r.items, ',')
    == 'Pickaxe,Beastcoin' and r.low == nil and r.unknown == nil, table.concat(r.items, ','));
check('with each item\'s id in step with its name, for its picture', table.concat(r.ids, ',') == '605,656',
    table.concat(r.ids, ','));
check('and a row with nothing to steal has no ids', #steal.readout({}, you(), 50, 50).ids == 0);
r = steal.readout({ steal = { 864 } }, you(), nil, nil);
check('a thief against a monster with no level gets unknown', r.unknown == true and r.low == nil);

-- Through a /check --------------------------------------------------------------------------------

-- Your /check of the monster at `index` in your zone at `level`, or an NM's with no level. Returns its lines once
-- they've all printed.
local function check_lines(index, name, level)
    MOCK.monster(index, name);
    local n = #MOCK.printed;
    if (level == nil) then
        MOCK.packet(MOCK.message_packet(MOCK.player.server_id, MOCK.mob_id(MOCK.player.zone, index), 0, 0, 249, index));
    else
        MOCK.packet(MOCK.check_packet(index, level, 4, 174));
    end
    MOCK.wait(2);
    return MOCK.printed_since(n);
end
-- That /check's Steal line, or "none".
local function steal_line(index, name, level)
    for _, line in ipairs(check_lines(index, name, level)) do
        if (line:find('Steal: ', 1, true)) then return line; end
    end
    return 'none';
end

local part = s.printout.parts.steal;
check('it starts off in chat and the overlay, on its own line, labeled Steal', part.on == false and part.new_line == true
    and part.label == 'Steal' and s.overlay.parts.steal == false);
MOCK.zone_in(103);
jobs(THF, 50, WAR, 25);
wear({ [9] = CHARM });
expect('so a /check has no Steal line', steal_line(453, 'Beach Pugil', 25), 'none');
MOCK.command('/checkmate show steal');

-- Valkurm Dunes Beach Pugil 453 at level 25.
expect('a THF 50 / WAR 25 with Rabbit Charm has 50 + 2 + 50 - 25', steal_line(453, 'Beach Pugil', 25),
    '[checkmate] Steal: Fish Scales (77%) (conditional)');
jobs(WAR, 50, THF, 25);
wear();
expect('a WAR 50 / THF 25 goes by its support level, 50 + 25 - 25', steal_line(453, 'Beach Pugil', 25),
    '[checkmate] Steal: Fish Scales (50%) (conditional)');
jobs(WAR, 50, NIN, 25);
expect('a WAR 50 / NIN 25 can\'t use Steal, so it only names the item', steal_line(453, 'Beach Pugil', 25),
    '[checkmate] Steal: Fish Scales');
jobs(WAR, 10, THF, 5);
expect('a WAR 10 / THF 5 has 50 + 5 - 25', steal_line(453, 'Beach Pugil', 25), '[checkmate] Steal: Fish Scales (30%) (conditional)');
jobs(WAR, 9, THF, 4);
expect('a WAR 9 / THF 4 can\'t yet', steal_line(453, 'Beach Pugil', 25), '[checkmate] Steal: Fish Scales');
jobs(THF, 4);
expect('nor a THF 4', steal_line(453, 'Beach Pugil', 25), '[checkmate] Steal: Fish Scales');
-- A Goblin Digger has two items and one chance, 50 + 20 - 19.
jobs(THF, 20);
expect('a Goblin Digger names both with one chance', steal_line(461, 'Goblin Digger', 19),
    '[checkmate] Steal: Pickaxe or Beastcoin (51%) (conditional)');
jobs(THF, 75, NIN, 37);
expect('Valkurm Emperor has nothing to steal', steal_line(334, 'Valkurm Emperor', nil), '[checkmate] Steal: nothing');
jobs(WAR, 75, NIN, 37);
expect('on any job', steal_line(334, 'Valkurm Emperor', nil), '[checkmate] Steal: nothing');
expect('a monster with no row has no Steal line, like Drops', steal_line(1000, 'Mystery Mob', 30), 'none');

-- A Dynamis-Valkurm Vanguard Welldigger is an NM at 75 to 77. A THF 75 / NIN 37 with the set has 50 + 24 + 75, less
-- its level.
MOCK.zone_in(39);
jobs(THF, 75, NIN, 37);
wear(SET);
expect('a Vanguard Welldigger names all three with one range', steal_line(23, 'Vanguard Welldigger', nil),
    '[checkmate] Steal: T. Whiteshell, O. Bronzepiece or 1 Byne Bill (72-74%) (conditional)');
MOCK.command('/checkmate ranges middle');
expect('and its middle with Number ranges on Middle', steal_line(23, 'Vanguard Welldigger', nil),
    '[checkmate] Steal: T. Whiteshell, O. Bronzepiece or 1 Byne Bill (~73%) (conditional)');
MOCK.command('/checkmate ranges range');

MOCK.zone_in(151);
jobs(NIN, 75, THF, 37);
wear({ [0] = KNIFE });
expect('a Yagudo Abbot at 57 for a NIN 75 / THF 37 with Btm. Knife', steal_line(231, 'Yagudo Abbot', 57),
    '[checkmate] Steal: Mtl. Beastcoin (34%) (conditional)');

MOCK.zone_in(176);
jobs(THF, 75, NIN, 37);
MOCK.packet(MOCK.job_info_packet(1000));
wear(SET, { [13] = RING });
hp_tp(700, 0);
expect('a Razorjaw Pugil at 58 with the set and Rogue\'s Ring counting', steal_line(289, 'Razorjaw Pugil', 58),
    '[checkmate] Steal: Fish Scales (97%) (conditional)');
hp_tp(1000, 0);
expect('and with your HP over 75%, the ring adds nothing', steal_line(289, 'Razorjaw Pugil', 58),
    '[checkmate] Steal: Fish Scales (91%) (conditional)');

MOCK.zone_in(69);
expect('an Assault monster has nothing to steal', steal_line(1, 'Leujaoam Worm', 51), '[checkmate] Steal: nothing');

-- The made-up zone: a monster with no level in the data, and a list over one spawn's own levels, 54 to 55.
addon.path = FIXTURES_PATH;
MOCK.zone_in(900);
jobs(THF, 75);
wear();
expect('Fixture Blank has no level, so the chance is unknown', steal_line(20, 'Fixture Blank', nil),
    '[checkmate] Steal: Fire Crystal (unknown)');
expect('a Fixture Tinkerer with no /check level goes over its spawn\'s levels', steal_line(40, 'Fixture Tinkerer', nil),
    '[checkmate] Steal: Fire Crystal or Ice Crystal (70-71%) (conditional)');
jobs(BLM, 75);
expect('and a BLM only gets the names', steal_line(40, 'Fixture Tinkerer', nil),
    '[checkmate] Steal: Fire Crystal or Ice Crystal');
addon.path = ADDON_PATH;

-- Its layout. It starts its own line after Drops, the label is yours and New line works like any part's.
MOCK.zone_in(103);
jobs(THF, 50, WAR, 25);
wear({ [9] = CHARM });
MOCK.command('/checkmate show drops');
local lines = check_lines(453, 'Beach Pugil', 25);
check('it has its own line right after Drops', lines[#lines] == '[checkmate] Steal: Fish Scales (77%) (conditional)'
    and lines[#lines - 1]:find('^%[checkmate%] Drops') ~= nil, table.concat(lines, ' / '));
MOCK.command('/checkmate newline steal off');
lines = check_lines(453, 'Beach Pugil', 25);
expect('with New line off it follows Drops after the divider', lines[#lines],
    '[checkmate] Drops (TH 0): Pugil Scales 10%, Shall Shell 5.0%  Steal: Fish Scales (77%) (conditional)');
MOCK.command('/checkmate newline steal on');
MOCK.command('/checkmate hide drops');
MOCK.command('/checkmate label steal Pilfer');
lines = check_lines(453, 'Beach Pugil', 25);
expect('its label is yours', lines[#lines], '[checkmate] Pilfer: Fish Scales (77%) (conditional)');
MOCK.command('/checkmate label steal ""');
lines = check_lines(453, 'Beach Pugil', 25);
expect('or none at all', lines[#lines], '[checkmate] Fish Scales (77%) (conditional)');
MOCK.command('/checkmate label steal Steal');

-- The Classic skin to the bytes: the label and its divider, the item, then the chance in its own color between
-- parentheses in the details color.
local function color(code) return '\30' .. string.char(code); end
MOCK.command('/checkmate skin classic');
check_lines(453, 'Beach Pugil', 25);
local raw = MOCK.printed[#MOCK.printed];
local want = color(7) .. 'Steal' .. color(7) .. ': ' .. color(106) .. 'Fish Scales' .. color(67) .. ' (' .. color(1)
    .. '77%' .. color(67) .. ')' .. color(67) .. ' (conditional)';
check('Classic paints it in its drops colors', raw:sub(-#want) == want, (raw:gsub('\30(.)', function (c)
    return '{' .. c:byte() .. '}'; end)));
MOCK.command('/checkmate skin phoenix');

-- It goes by the gear you have on when your /check comes back, so its line says the same before and after the
-- /checkparam reply, even with Rabbit Charm taken off while the reply is out.
MOCK.command('/checkmate show hit');
MOCK.monster(453, 'Beach Pugil');
local n = #MOCK.printed;
MOCK.packet(MOCK.check_packet(453, 25, 4, 174));
MOCK.frame();
local first = table.concat(MOCK.printed_since(n), ' / ');
wear();
MOCK.wait(1.6);
MOCK.reply(150, 100);
MOCK.frame();
local all = table.concat(MOCK.printed_since(n), ' / ');
check('the /check line prints first, and Steal waits with the hit line', first:find('Beach Pugil (Lv 25)', 1, true) ~= nil
    and first:find('Steal', 1, true) == nil, first);
check('and still says 77% after the reply', all:find('[checkmate] Steal: Fish Scales (77%) (conditional)', 1, true) ~= nil, all);
MOCK.command('/checkmate hide hit');
expect('the next /check goes by the gear you have on now', steal_line(453, 'Beach Pugil', 25),
    '[checkmate] Steal: Fish Scales (75%) (conditional)');

-- Memory. A monster with nothing to steal or with no row reads the same with the part on as off, even for a thief
-- in the set and Rogue's Ring. One with something to steal reads your jobs, then your 16 gear slots and your HP
-- and TP only when you can use Steal.
local function reads_of(index, name, level)
    MOCK.reads = 0;
    check_lines(index, name, level);
    return MOCK.reads;
end
jobs(THF, 75, NIN, 37);
wear(SET, { [13] = RING });
hp_tp(700, 0);
local on = { reads_of(334, 'Valkurm Emperor', nil), reads_of(1000, 'Mystery Mob', 30), reads_of(453, 'Beach Pugil', 25) };
MOCK.command('/checkmate hide steal');
local off = { reads_of(334, 'Valkurm Emperor', nil), reads_of(1000, 'Mystery Mob', 30), reads_of(453, 'Beach Pugil', 25) };
check('nothing to steal reads no more', on[1] == off[1], on[1] .. ' vs ' .. off[1]);
check('neither does a monster with no row', on[2] == off[2], on[2] .. ' vs ' .. off[2]);
check('a pugil reads your jobs, 16 slots and your HP and TP, once', on[3] - off[3] == 19, on[3] .. ' vs ' .. off[3]);
MOCK.command('/checkmate show steal');
jobs(WAR, 75, NIN, 37);
local war = reads_of(453, 'Beach Pugil', 25);
check('and a WAR only its jobs', war - off[3] == 1, war .. ' vs ' .. off[3]);
hp_tp(1000, 0);

-- No other line changes with the part on. Each /check prints the same lines with it hidden, less its Steal line, or
-- with New line off, less its divider and Steal text.
local SAME = {
    { 103, 453, 'Beach Pugil', 25, { THF, 50, WAR, 25 } },
    { 103, 461, 'Goblin Digger', 19, { THF, 20 } },
    { 103, 334, 'Valkurm Emperor', nil, { WAR, 75, NIN, 37 } },
    { 103, 1000, 'Mystery Mob', 30, { THF, 75 } },
    { 39, 23, 'Vanguard Welldigger', nil, { THF, 75, NIN, 37 } },
    { 151, 231, 'Yagudo Abbot', 57, { NIN, 75, THF, 37 } },
    { 69, 1, 'Leujaoam Worm', 51, { THF, 75 } },
};
wear(SET);
for _, new_line in ipairs({ true, false }) do
    s.printout.parts.steal.new_line = new_line;
    for _, case in ipairs(SAME) do
        local zone, index, name, level, who = unpack(case);
        MOCK.zone_in(zone);
        jobs(unpack(who));
        local with = check_lines(index, name, level);
        MOCK.command('/checkmate hide steal');
        local without = check_lines(index, name, level);
        MOCK.command('/checkmate show steal');
        local less = {};
        for _, line in ipairs(with) do
            line = line:gsub('  Steal: .*$', '');
            if (not line:find('^%[checkmate%] Steal: ')) then less[#less + 1] = line; end
        end
        -- Only the monster with no row has no Steal to take out.
        local had = table.concat(with, ' / '):find('Steal: ', 1, true) ~= nil;
        check(('%s with New line %s prints the same less its Steal'):format(name, new_line and 'on' or 'off'),
            had == (name ~= 'Mystery Mob') and table.concat(less, ' / ') == table.concat(without, ' / '),
            table.concat(with, ' / '));
    end
end
s.printout.parts.steal.new_line = true;

-- The sample has a made-up thief at its level with +2 Steal, 50 + 4 + 42 - 42.
n = #MOCK.printed;
MOCK.command('/checkmate sample');
local sample = table.concat(MOCK.printed_since(n), ' / ');
check('the sample shows Beastcoin at 54%', sample:find('Steal: Beastcoin (54%) (conditional)', 1, true) ~= nil, sample);

-- The overlay -------------------------------------------------------------------------------------

-- One frame. Returns the overlay's Steal line, or "none".
local function frame()
    MOCK.frame();
    for _, line in ipairs(MOCK.overlay_lines()) do
        if (line:find('^Steal: ')) then return line; end
    end
    return 'none';
end
-- Targets nothing for a frame, then the monster at `index`, so the overlay works it out again.
local function retarget(index)
    MOCK.target.slot0 = 0;
    frame();
    MOCK.target.slot0 = index;
    return frame();
end
local function check_reply(index, level)
    MOCK.packet(MOCK.check_packet(index, level, 4, 174));
    return frame();
end

-- The chat's Steal part is off from here, so only the overlay reads anything for it.
MOCK.command('/checkmate hide steal');
MOCK.command('/checkmate overlay on');
n = #MOCK.printed;
MOCK.command('/checkmate overlayshow steal');
expect('overlayshow steal answers', MOCK.printed_since(n)[1], '[checkmate] The overlay now shows the steal part.');
MOCK.zone_in(103);
jobs(THF, 50, WAR, 25);
wear({ [9] = CHARM });
MOCK.target_monster(453, 'Beach Pugil');
expect('before a /check it goes over the 25 to 26 that Beach Pugil 453 spawns at', frame(), 'Steal: Fish Scales (76-77%) (conditional)');
expect('and your /check makes it 77%', check_reply(453, 25), 'Steal: Fish Scales (77%) (conditional)');
-- A quiet frame reads the same with it on as off.
local function quiet_reads()
    frame();
    MOCK.reads = 0;
    for _ = 1, 60 do frame(); end
    return MOCK.reads;
end
local quiet_on = quiet_reads();
MOCK.command('/checkmate overlayhide steal');
local quiet_off = quiet_reads();
check('quiet frames only poll at the bounded interval', quiet_on >= quiet_off and quiet_on - quiet_off <= 480,
    quiet_on .. ' vs ' .. quiet_off);
-- Working it out reads your jobs, then your gear when the monster has something to steal and you can use it.
MOCK.reads = 0;
retarget(453);
local build_off = MOCK.reads;
MOCK.command('/checkmate overlayshow steal');
MOCK.reads = 0;
retarget(453);
check('a rebuild and any due input poll stay bounded', MOCK.reads - build_off >= 17 and MOCK.reads - build_off <= 150,
    MOCK.reads .. ' vs ' .. build_off);

-- Gear, HP and TP changes refresh on the next passive poll, with the target left alone.
wear();
MOCK.wait(0.3);
expect('taking Rabbit Charm off refreshes without another check', frame(), 'Steal: Fish Scales (75%) (conditional)');
expect('the next check agrees', check_reply(453, 25), 'Steal: Fish Scales (75%) (conditional)');
wear({ [9] = CHARM });
MOCK.wait(0.3);
expect('putting it back also refreshes without retargeting', frame(), 'Steal: Fish Scales (77%) (conditional)');
-- Your stats packet works it out again when your support job changes at the same level. A restricted one comes as
-- job 0, and in Dynamis it can come back mid-zone, so a WAR 50 / THF 25 can Steal again with the monster still
-- targeted.
jobs(WAR, 50, 0, 0);
wear();
MOCK.level_up(50);
expect('a WAR 50 with its support job restricted only gets the item', frame(), 'Steal: Fish Scales');
MOCK.reads = 0;
retarget(453);
check('which only read your jobs', MOCK.reads - build_off == 1, MOCK.reads .. ' vs ' .. build_off);
jobs(WAR, 50, THF, 25);
MOCK.level_up(50);
expect('and THF 25 coming back gives the chance on the next frame, 50 + 25 - 25', frame(), 'Steal: Fish Scales (50%) (conditional)');
MOCK.level_up(50);
MOCK.reads = 0;
frame();
local again = MOCK.reads;
MOCK.reads = 0;
frame();
check('the same stats again works nothing out', again == MOCK.reads, again .. ' vs ' .. MOCK.reads);
jobs(THF, 50, WAR, 25);
wear({ [9] = CHARM });
retarget(453);
MOCK.player.sub_level = 12;
MOCK.level_up(25);
expect('a level sync works it out again, 50 + 2 + 25 - 25', frame(), 'Steal: Fish Scales (52%) (conditional)');
MOCK.level_up(50);
MOCK.player.sub_level = 25;

-- Rogue's Ring counts from your HP and TP when it's worked out, with no reads each frame.
MOCK.zone_in(176);
jobs(THF, 75, NIN, 37);
MOCK.packet(MOCK.job_info_packet(1000));
wear(SET, { [13] = RING });
hp_tp(800, 0);
MOCK.target_monster(289, 'Razorjaw Pugil');
frame();
expect('Rogue\'s Ring at 80% HP adds nothing to a Razorjaw Pugil at 58', check_reply(289, 58), 'Steal: Fish Scales (91%) (conditional)');
hp_tp(700, 0);
MOCK.wait(0.3);
expect('your HP dropping to 70% refreshes the latent', frame(), 'Steal: Fish Scales (97%) (conditional)');
expect('retargeting agrees', retarget(289), 'Steal: Fish Scales (97%) (conditional)');
hp_tp(700, 1500);
MOCK.wait(0.3);
expect('your TP going over 100% refreshes it too', frame(), 'Steal: Fish Scales (91%) (conditional)');
expect('retargeting still agrees', retarget(289), 'Steal: Fish Scales (91%) (conditional)');
hp_tp(700, 0);
MOCK.wait(0.3);
expect('and back under 100%, the ring counts again', frame(), 'Steal: Fish Scales (97%) (conditional)');
local ring_on = quiet_reads();
MOCK.command('/checkmate overlayhide steal');
local ring_off = quiet_reads();
check('with the ring counting, passive polling also stays bounded', ring_on >= ring_off and ring_on - ring_off <= 480,
    ring_on .. ' vs ' .. ring_off);
MOCK.command('/checkmate overlayshow steal');
hp_tp(1000, 0);

-- Nothing to steal reads nothing more to work out.
MOCK.zone_in(103);
MOCK.target_monster(334, 'Valkurm Emperor');
expect('Valkurm Emperor shows nothing', frame(), 'Steal: nothing');
MOCK.reads = 0;
retarget(334);
local nothing_on = MOCK.reads;
MOCK.command('/checkmate overlayhide steal');
MOCK.reads = 0;
retarget(334);
check('and works it out with no more reads than with the part off', nothing_on == MOCK.reads,
    nothing_on .. ' vs ' .. MOCK.reads);
MOCK.command('/checkmate overlayshow steal');

-- The sample goblin, while the settings window is open and nothing is targeted.
MOCK.target.slot0 = 0;
MOCK.command('/checkmate');
expect('the sample goblin shows Beastcoin at 54%', frame(), 'Steal: Beastcoin (54%) (conditional)');
MOCK.command('/checkmate');

-- The job info packet -----------------------------------------------------------------------------

-- The server sends your max HP before gear and food when you zone and when your jobs or levels change, and Rogue's
-- Ring's 75% is of that one. A new packet replaces the earlier value.
jobs(THF, 75, NIN, 37);
wear(SET, { [13] = RING });
MOCK.player.hp_max = 1038;
hp_tp(760, 0);
MOCK.packet(MOCK.job_info_packet(1000));
expect('with the server\'s 1000 in, 760 is 76% and the ring adds nothing, like on the server', chance(58), '91');
hp_tp(750, 0);
expect('and at 750 it counts', chance(58), '97');
local ring_reads = reads_of_you();
check('the ring reads HP and TP and checks Level Sync once', ring_reads - without == 2,
    ring_reads .. ' vs ' .. without);
MOCK.packet(MOCK.job_info_packet(1020));
hp_tp(760, 0);
expect('a new packet takes its place, and 760 of 1020 counts', chance(58), '97');

return MOCK.report();
