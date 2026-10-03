--[[
    The Colorblind safe skin stays readable with red-green colorblindness. Every two colors that mean
    different things are looked at with normal vision and the way protanopia and deuteranopia see them
    (Machado, Oliveira and Fernandes 2009, full strength). They have to stay at least 15 apart by
    CIEDE2000. About 10 reads as clearly different on a thin bar. Chat text is thinner, so 15 leaves room.
    Chat colors use the swatches the settings window draws. The game's own shades can differ a little.
]]
local skins    = require('ui.skins');
local defaults = require('ui.defaults');
local window   = require('ui.settings_window');

local CLOSEST = 15;

-- Applied to linear RGB.
local MATRICES = {
    normal       = { { 1, 0, 0 }, { 0, 1, 0 }, { 0, 0, 1 } },
    protanopia   = { { 0.152286, 1.052583, -0.204868 }, { 0.114503, 0.786281, 0.099216 }, { -0.003882, -0.048116, 1.051998 } },
    deuteranopia = { { 0.367322, 0.860646, -0.227968 }, { 0.280085, 0.672501, 0.047413 }, { -0.011820, 0.042940, 0.968881 } },
};

local function to_linear(c)
    if (c <= 0.04045) then
        return c / 12.92;
    end
    return ((c + 0.055) / 1.055) ^ 2.4;
end

-- The color as someone with that kind of vision sees it, as CIELAB.
local function seen(color, m)
    local r, g, b = to_linear(color[1]), to_linear(color[2]), to_linear(color[3]);
    local function clamp(v) return math.min(math.max(v, 0), 1); end
    r, g, b = clamp(m[1][1] * r + m[1][2] * g + m[1][3] * b), clamp(m[2][1] * r + m[2][2] * g + m[2][3] * b),
        clamp(m[3][1] * r + m[3][2] * g + m[3][3] * b);

    local function f(t)
        if (t > 0.008856) then
            return t ^ (1 / 3);
        end
        return 7.787 * t + 16 / 116;
    end
    local fx = f((0.4124 * r + 0.3576 * g + 0.1805 * b) / 0.95047);
    local fy = f(0.2126 * r + 0.7152 * g + 0.0722 * b);
    local fz = f((0.0193 * r + 0.1192 * g + 0.9505 * b) / 1.08883);
    return { 116 * fy - 16, 500 * (fx - fy), 200 * (fy - fz) };
end

-- CIEDE2000, how different two CIELAB colors look.
local function ciede2000(one, two)
    local rad = math.rad;
    local L1, a1, b1 = one[1], one[2], one[3];
    local L2, a2, b2 = two[1], two[2], two[3];
    local C7 = ((math.sqrt(a1 * a1 + b1 * b1) + math.sqrt(a2 * a2 + b2 * b2)) / 2) ^ 7;
    local G = 0.5 * (1 - math.sqrt(C7 / (C7 + 25 ^ 7)));
    local a1p, a2p = (1 + G) * a1, (1 + G) * a2;
    local C1p, C2p = math.sqrt(a1p * a1p + b1 * b1), math.sqrt(a2p * a2p + b2 * b2);
    local h1p = math.deg(math.atan2(b1, a1p)) % 360;
    local h2p = math.deg(math.atan2(b2, a2p)) % 360;

    local dhp = 0;
    if (C1p * C2p ~= 0) then
        dhp = h2p - h1p;
        if (dhp > 180) then
            dhp = dhp - 360;
        elseif (dhp < -180) then
            dhp = dhp + 360;
        end
    end
    local dLp, dCp = L2 - L1, C2p - C1p;
    local dHp = 2 * math.sqrt(C1p * C2p) * math.sin(rad(dhp / 2));

    local Lbp, Cbp = (L1 + L2) / 2, (C1p + C2p) / 2;
    local hbp = h1p + h2p;
    if (C1p * C2p ~= 0) then
        if (math.abs(h1p - h2p) <= 180) then
            hbp = (h1p + h2p) / 2;
        elseif (h1p + h2p < 360) then
            hbp = (h1p + h2p + 360) / 2;
        else
            hbp = (h1p + h2p - 360) / 2;
        end
    end
    local T = 1 - 0.17 * math.cos(rad(hbp - 30)) + 0.24 * math.cos(rad(2 * hbp))
        + 0.32 * math.cos(rad(3 * hbp + 6)) - 0.20 * math.cos(rad(4 * hbp - 63));
    local dtheta = 30 * math.exp(-((hbp - 275) / 25) ^ 2);
    local Cbp7 = Cbp ^ 7;
    local Rt = -math.sin(rad(2 * dtheta)) * 2 * math.sqrt(Cbp7 / (Cbp7 + 25 ^ 7));
    local l = dLp / (1 + 0.015 * (Lbp - 50) ^ 2 / math.sqrt(20 + (Lbp - 50) ^ 2));
    local c = dCp / (1 + 0.045 * Cbp);
    local h = dHp / (1 + 0.015 * Cbp * T);
    return math.sqrt(l * l + c * c + h * h + Rt * c * h);
end

-- How close two colors get for the kind of vision that sees them closest, and which kind.
local function closest(one, two)
    local best, kind = math.huge, nil;
    for name, m in pairs(MATRICES) do
        local d = ciede2000(seen(one, m), seen(two, m));
        if (d < best) then
            best, kind = d, name;
        end
    end
    return best, kind;
end

-- A known pair checks the color math. Phoenix's salmon ff8d79 and green 63ba8a come out 4.80 apart, closest
-- under protanopia.
local d, kind = closest(skins.hex('ff8d79'), skins.hex('63ba8a'));
check('the color math puts salmon and green 4.80 apart under protanopia', math.abs(d - 4.7975) < 0.001
    and kind == 'protanopia', d .. ' ' .. kind);

--[[
    Every two chat colors that have to look different. Cons in one group may share a color, the way
    checker gives Very Tough and Incredibly Tough one. Every con stays apart from every con in another
    group.
]]
local PAIRS = {
    { 'good', 'ok' }, { 'ok', 'bad' }, { 'good', 'bad' },
    { 'aggro_threat', 'aggro_safe' },
    { 'elements_weak', 'elements_resist' },
};
local CON_GROUPS = {
    { 'too_weak' },
    { 'incredibly_easy_prey', 'easy_prey' },
    { 'decent_challenge' },
    { 'even_match' },
    { 'tough' },
    { 'very_tough', 'incredibly_tough' },
    { 'impossible_to_gauge' },
};
for i = 1, #CON_GROUPS do
    for j = i + 1, #CON_GROUPS do
        for _, one in ipairs(CON_GROUPS[i]) do
            for _, two in ipairs(CON_GROUPS[j]) do
                PAIRS[#PAIRS + 1] = { one, two };
            end
        end
    end
end
check('39 chat pairs', #PAIRS == 39, #PAIRS);

local s = defaults.make();
check('the skin is there', skins.apply(s, 'colorblind') == true and s.printout.con_colors == true);

local worst, what, how = math.huge, nil, nil;
for _, pair in ipairs(PAIRS) do
    local one, two = window.SWATCHES[s.colors[pair[1]]], window.SWATCHES[s.colors[pair[2]]];
    local apart, seen_by = closest(one, two);
    if (apart < worst) then
        worst, what, how = apart, pair[1] .. ' and ' .. pair[2], seen_by;
    end
end
check('every chat color that means something stays apart', worst >= CLOSEST,
    ('%s are only %.1f apart with %s'):format(tostring(what), worst, tostring(how)));

-- The window's done and problem messages.
local apart, seen_by = closest(s.look.imgui.done_messages, s.look.imgui.problem_messages);
check('done and problem messages stay apart', apart >= CLOSEST, ('%.1f with %s'):format(apart, tostring(seen_by)));

-- No meaning color is a green, so nothing leans on red against green.
local GREENS = { [2] = true, [79] = true, [80] = true, [83] = true, [88] = true };
local green, listed = {}, {};
for _, pair in ipairs(PAIRS) do
    for _, key in ipairs(pair) do
        if (GREENS[s.colors[key]] and not listed[key]) then
            green[#green + 1] = key;
            listed[key] = true;
        end
    end
end
check('no green', #green == 0, table.concat(green, ', '));

return MOCK.report();
