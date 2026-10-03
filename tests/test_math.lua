-- Tests the math on its own against the worked examples below. It covers hit rate rounding,
-- crit steps, magic examples A, B and C, and the Treasure Hunter examples at TH 0, 2 and 4.
local physical = require('core.physical');
local magic    = require('core.magic');
local drops    = require('core.drops');
local spells   = require('data.spells');

-- Physical ---------------------------------------------------------------------------------------

-- The server floors the fraction it keeps, so these land one under the plain floor(75 + d / 2).
for _, case in ipairs({ { -92, 28 }, { -36, 56 }, { -34, 57 }, { 0, 75 }, { -10, 70 } }) do
    local d, want = case[1], case[2];
    local got = physical.hit_percent(300 + d, 300);
    check(('hit rate at accuracy - evasion = %d is %d%%'):format(d, want), got == want, got);
end
check('hit rate caps at 95%', physical.hit_percent(400, 300) == 95 and physical.hit_percent(340, 300) == 95);
check('hit rate floors at 20%', physical.hit_percent(190, 300) == 20 and physical.hit_percent(0, 300) == 20);

local CRIT = {
    { -10, 5 }, { 0, 5 }, { 6, 5 }, { 7, 6 }, { 13, 6 }, { 14, 7 }, { 19, 7 }, { 20, 8 }, { 29, 8 },
    { 30, 9 }, { 39, 9 }, { 40, 10 }, { 45, 15 }, { 50, 20 }, { 70, 20 },
};
local crit_ok, crit_bad = true, nil;
for _, case in ipairs(CRIT) do
    local got = physical.crit_percent(100 + case[1], 100);
    if (got ~= case[2]) then crit_ok, crit_bad = false, ('dDEX %d gave %d'):format(case[1], got); end
end
check('crit is 5% plus the DEX steps, 20% at most', crit_ok, crit_bad);

-- A monster with no numbers at its level gets only the /check range. Its edges floor the same way
-- as the hit rate, so the bottom of normal evasion one level over is 57%, not 58%.
local function check_range(my_level, level, reading)
    local me_ = { level = my_level, accuracy = 300, buffs = {}, zone = 100, dex = 50 };
    local hit = physical.readout(me_, { low = level, high = level, reading = reading, con = 4 }).hit;
    return hit and (hit.low .. '-' .. hit.high);
end
expect('high evasion at an even level is 20-59%', check_range(99, 99, 0), '20-59');
expect('normal evasion at an even level is 60-79%', check_range(99, 99, 1), '60-79');
expect('normal evasion 1 level over is 57-77%', check_range(98, 99, 1), '57-77');
expect('low evasion 11 levels over is 57-95%', check_range(88, 99, 2), '57-95');

-- Magic ------------------------------------------------------------------------------------------

check('stat bonus curve', magic.stat_bonus(10) == 10 and magic.stat_bonus(11) == 10.5 and magic.stat_bonus(-10) == -10
    and magic.stat_bonus(-11) == -10.5 and magic.stat_bonus(49) == 24.75 and magic.stat_bonus(-31) == -20.25
    and magic.stat_bonus(200) == 30 and magic.stat_bonus(-200) == -30);

-- Example A. Lv75 BLM, skill 276, INT 112 against a Lv75 WAR with INT 63, Thunder IV (+20) and
-- Jupiter's Staff (+30). MACC 350 against MEVA 225 caps at 95%.
local macc_a = math.floor(276 + magic.stat_bonus(112 - 63) + 20 + 30);
check('example A magic accuracy is 350', macc_a == 350, macc_a);
check('example A is 95%', magic.hit_percent(macc_a, spells.MEVA_BY_LEVEL[75], 0) == 95);

-- Example B. The same caster against a Lv85 with INT 71 and thunder rank 4. MEVA floor(280 x 1.126)
-- is 315 and x = 348 - 315 + 25 - 40 = 18, so 68%.
local macc_b = math.floor(276 + magic.stat_bonus(112 - 71) + 20 + 30);
local meva_b = math.floor(spells.MEVA_BY_LEVEL[85] * 1.126);
check('example B magic accuracy 348 and magic evasion 315', macc_b == 348 and meva_b == 315, macc_b .. ' ' .. meva_b);
expect('example B is 68%', magic.hit_percent(macc_b, meva_b, 10), 68);

-- Example C. Lv75 WAR/BLM37 Sleep, enfeebling 105 and dINT +10 is MACC 115, against a Lv72 with MEVA
-- 217. x = -77 halves to -39, so 11% a roll, and state 1 lands 1 - 0.89^2 = 20.8%.
check('example C magic evasion is 217', spells.MEVA_BY_LEVEL[72] == 217);
local hit_c = magic.hit_percent(115, spells.MEVA_BY_LEVEL[72], 72 - 75);
check('example C is 11% a roll', hit_c == 11, hit_c);
expect('example C lands 20%', magic.land_percent(hit_c, 1, 0), 20);

-- x = 170 - 200 + 25 = -5 halves to -3, then -8 for two levels. The other way round gives 43.
expect('the halving comes before the level penalty', magic.hit_percent(170, 200, 2), 39);
check('magic hit floors at 5% and caps at 95%', magic.hit_percent(0, 500, 0) == 5 and magic.hit_percent(900, 0, 0) == 95);
check('state 2 lands unless it misses three times', magic.land_percent(50, 2, 0) == 87);
check('state 3 always lands', magic.land_percent(5, 3, 0) == 100);
check('a resist trait of 25 stops it 30% of the time', magic.land_percent(95, 3, 25) == 70
    and magic.land_percent(60, 1, 25) == 58);

-- The same examples through magic.readout, the way the addon calls it.
local function me(level, skills, stats, main_id)
    local t = { level = level, skills = skills, buffs = {}, main_id = main_id, extra_accuracy = 0 };
    for k, v in pairs(stats) do t[k] = v; end
    return t;
end
local function school(id, spell)
    local schools = {};
    for _, each in ipairs(spells.SCHOOL_ORDER) do schools[each] = { on = false, spell = '' }; end
    schools[id] = { on = true, spell = spell };
    return { schools = schools };
end
local function ranks(weak, rank, others)
    local t = {};
    for name in pairs(spells.ELEMENT_NAMES) do t[name] = others; end
    t[weak] = rank;
    return t;
end
local JUPITERS_STAFF = 17554;
local blm = me(75, { [36] = 276 }, { int = 112, mnd = 50, chr = 50 }, JUPITERS_STAFF);

local war75 = { levels = { [75] = { int = 63, mnd = 50, chr = 50 } }, ranks = ranks('thunder', 0, 1) };
local a = magic.readout(blm, { row = war75, low = 75, high = 75 }, school('elemental', 'tier4'))[1];
check('example A through the readout', a and a.low == 95 and a.high == 95 and a.element == 'Thunder',
    a and (a.low .. ' ' .. tostring(a.element)));

local lv85 = { levels = { [85] = { int = 71, mnd = 50, chr = 50 } }, ranks = ranks('thunder', 4, 5) };
local b = magic.readout(blm, { row = lv85, low = 85, high = 85 }, school('elemental', 'tier4'))[1];
check('example B through the readout', b and b.low == 68 and b.element == 'Thunder', b and (b.low .. ' ' .. tostring(b.element)));

local war_blm = me(75, { [35] = 105 }, { int = 70, mnd = 50, chr = 50 });
local lv72 = { levels = { [72] = { int = 60, mnd = 50, chr = 50 } }, ranks = {} };
local c = magic.readout(war_blm, { row = lv72, low = 72, high = 72 }, school('enfeebling', 'sleep'))[1];
check('example C through the readout', c and c.low == 20 and c.element == nil, c and c.low);

local near = { levels = { [72] = { int = 60, mnd = 50, chr = 50 } }, ranks = { dark_sleep = 10 } };
c = magic.readout(war_blm, { row = near, low = 72, high = 72 }, school('enfeebling', 'sleep'))[1];
check('rank 10 is 5% a roll, 9% to land at state 1', c and c.low == 9, c and c.low);

-- A nuke skips an element the monster absorbs or nullifies, unless every element is like that.
local function nuke_element(row, level)
    local r = magic.readout(blm, { row = row, low = level, high = level }, school('elemental', 'tier1'))[1];
    return r and r.element;
end
local ifrit;
for _, row in ipairs(dofile(ADDON_DIR .. '/data/zones/207.lua').monsters) do
    if (row.ids and row.ids[1] == 7) then ifrit = row; end
end
check('Ifrit Prime absorbs fire, so its tied water rank wins', ifrit and ifrit.name == 'Ifrit Prime'
    and nuke_element(ifrit, next(ifrit.levels)) == 'Water', ifrit and nuke_element(ifrit, next(ifrit.levels)));
local tied = { levels = { [75] = { int = 63 } }, ranks = { fire = -3, water = -3 } };
tied.nullify = { fire = 50 };
expect('nullifying it some of the time counts too', nuke_element(tied, 75), 'Water');
tied.nullify = { all = 100 };
expect('with every element nullified it picks as if none were', nuke_element(tied, 75), 'Fire');

-- Drops ------------------------------------------------------------------------------------------

local function percent(value)
    return math.floor(value * 10000 + 0.5) / 100;
end
local function chances(rolls, th)
    local out = {};
    for id, chance in pairs(drops.chances(rolls, th)) do out[id] = percent(chance); end
    return out;
end

-- Wild Rabbit in West Ronfaure drops hare meat (common) and rabbit hide (uncommon).
local rabbit = { { rate = 150, item = 4358 }, { rate = 100, item = 856 } };
for _, case in ipairs({ { 0, 15, 10 }, { 2, 40, 15 }, { 4, 45, 18 } }) do
    local got = chances(rabbit, case[1]);
    check(('Wild Rabbit at TH %d is %d%% and %d%%'):format(case[1], case[2], case[3]),
        got[4358] == case[2] and got[856] == case[3], got[4358] .. ' ' .. got[856]);
end

-- Forest Hare has rabbit hide on a common and an uncommon roll, and one is enough.
local hare = { { rate = 150, item = 856 }, { rate = 100, item = 856 } };
expect('two rolls of one item at TH 0 are 23.5%', chances(hare, 0)[856], 23.5);
expect('and 49% at TH 2', chances(hare, 2)[856], 49);

-- Leaping Lizzy drops on a very common, a common and an uncommon roll.
local lizzy = { { rate = 240, item = 926 }, { rate = 150, item = 15351 }, { rate = 100, item = 852 } };
local th0, th4 = chances(lizzy, 0), chances(lizzy, 4);
check('Leaping Lizzy at TH 0 is 24, 15 and 10%', th0[926] == 24 and th0[15351] == 15 and th0[852] == 10);
check('and 64, 45 and 18% at TH 4', th4[926] == 64 and th4[15351] == 45 and th4[852] == 18);

-- Wild Sheep has sheep tooth on a rare roll and on the despoil rare roll.
local sheep = { { rate = 50, item = 882 }, { rate = 50, item = 882 } };
expect('Sheep Tooth at TH 0 is 9.75%', chances(sheep, 0)[882], 9.75);
expect('and 13.51% at TH 2', chances(sheep, 2)[882], 13.51);

-- Aweuvhi has a rare group of eight clusters, each weight 1.
local group = {};
for i = 0, 7 do group[#group + 1] = { 4104 + i, 1 }; end
local each_ok = true;
for id, chance in pairs(drops.chances({ { rate = 50, group = group } }, 0)) do
    each_ok = each_ok and id >= 4104 and id <= 4111 and math.abs(chance - 0.00625) < 1e-12;
end
check('each Aweuvhi cluster is 0.625%', each_ok);

check('1000 always drops and ignores TH', drops.roll_chance(1000, 0) == 1 and drops.roll_chance(1000, 4) == 1);
check('rates snap down to their column', drops.roll_chance(239, 0) == 0.15 and drops.roll_chance(5, 0) == 0.005
    and drops.roll_chance(1, 4) == 0.004 and drops.roll_chance(0, 4) == 0);
local nothing = drops.chances({ { rate = 50, group = { { 0, 2 }, { 4104, 2 } } } }, 0);
check('item 0 in a group is nothing', nothing[0] == nil and percent(nothing[4104]) == 2.5, percent(nothing[4104] or 0));
check('TH above 4 reads as 4', drops.roll_chance(150, 9) == drops.roll_chance(150, 4));

return MOCK.report();
