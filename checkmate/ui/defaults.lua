--[[
    Default settings. Ashita saves your copy per character under config\addons\checkmate\.

    make() builds fresh tables every call, so editing your settings can never change the defaults.
    The name, difficulty, evasion and defense reading and aggro are on at first. Every other part, and
    every magic school, starts off.

    The look block belongs to the skins in ui\skins.lua. A skin sets the window look under
    look.imgui, every chat color under colors, and Color by difficulty. The default chat colors are
    the Phoenix skin's. look.imgui starts empty and ui\skins.lua fills it from the Phoenix skin. The
    window's font and font size sit beside it, and no skin changes them.
]]

local printout    = require('core.printout');
local spells      = require('data.spells');
local window_font = require('ui.window_font');

local defaults = {};

-- The Phoenix skin's chat colors, by the keys in printout.COLOR_GROUPS. The tag is Ashita's usual one
-- and the text is cream. The name is coral like the site's accent, and the difficulty uses checker's
-- con colors. Good, OK and bad numbers are green, yellow and red. Aggressive is red and the rest is green.
-- Weak elements are green like good numbers, and resisted ones salmon like bad ones.
defaults.PHOENIX_CHAT = {
    con_colors = true,
    tag_brackets = 81, tag_word = 6, line = 106, replies = 106,
    name = 8, level = 8, level_range = 8,
    difficulty = 106, too_weak = 67, incredibly_easy_prey = 106, easy_prey = 2, decent_challenge = 102,
    even_match = 8, tough = 68, very_tough = 76, incredibly_tough = 76, impossible_to_gauge = 5,
    reading = 106, reading_detail = 106,
    hit_label = 106, hit_number = 106, hit_detail = 106,
    evade_label = 106, evade_number = 106, evade_detail = 106,
    crit_label = 106, crit_number = 106, crit_detail = 106,
    aggro_label = 106, aggro_words = 106, aggro_detail = 106, aggro_threat = 76, aggro_safe = 2,
    magic_label = 106, magic_name = 106, magic_number = 106, magic_detail = 106,
    immunities_label = 106, immunities_name = 106, immunities_detail = 106,
    elements_label = 106, elements_weak = 2, elements_resist = 68, elements_detail = 106,
    drops_label = 106, drops_name = 106, drops_number = 106, drops_detail = 106,
    good = 2, ok = 104, bad = 68,
};

local function part(on, label, new_line)
    return T{ on = on, label = label, new_line = new_line };
end

local function magic_schools()
    local schools = T{};
    for _, id in ipairs(spells.SCHOOL_ORDER) do
        schools[id] = T{ on = false, spell = spells.schools[id].spells[1].id };
    end
    return schools;
end

local function immunities()
    local out = T{};
    for _, entry in ipairs(printout.IMMUNITIES) do
        out[entry.id] = T{ on = true, label = entry.label };
    end
    return out;
end

-- Every chat color, the Phoenix skin's. Ashita's merge and a profile load fill a missing color from these.
local function colors()
    local out = T{};
    for _, key in ipairs(printout.COLOR_KEYS) do
        out[key] = defaults.PHOENIX_CHAT[key];
    end
    return out;
end

function defaults.make()
    return T{
        printout = T{
            order        = printout.DEFAULT_ORDER,   -- The name part is always first and isn't in here.
            divider      = 'star',                   -- What goes between parts, one of printout.DIVIDERS.
            separator    = '  ',                   -- The Custom divider's text.
            label_divider   = 'colon',               -- What follows each label, one of printout.LABEL_DIVIDERS.
            label_separator = ':',                   -- The Custom label divider's text. A space follows it.
            header       = true,                     -- "[checkmate]" at the start of each line.
            show_level   = true,                     -- The " (Lv 42)" after the name.
            show_range   = false,                    -- The range after a known level, " (Lv 42, range 40-44)".
            range_word   = 'range',                  -- The word before that range. Empty prints " (Lv 42, 40-44)".
            number_style = 'range',                  -- 'range' prints 64-72%, 'midpoint' prints ~68%.
            con_colors   = defaults.PHOENIX_CHAT.con_colors,   -- Color by difficulty, in the con's color.
            defense_first = false,                   -- "(High Defense, High Evasion)" instead of evasion first.
            extras_own_line = true,                  -- Extras start a new line after the parts the /check answers.
            replace_game_line = true,                -- Hides the game's /check line. checkmate's lines take its place.
            parts = T{
                name       = part(true,  '',       false),
                difficulty = part(true,  '',       false),
                reading    = T{ on = true },         -- The evasion and defense reading after the difficulty.
                hit        = part(false, 'Hit',    false),
                evade      = part(false, 'Evade',  false),
                crit       = part(false, 'Crit',   false),
                aggro      = part(true,  'Aggro',  true),
                magic      = part(false, 'Magic',  true),
                immunities = part(false, 'Immune', true),
                elements   = part(false, 'Elements', true),
                drops      = part(false, 'Drops',  true),
            },
        },
        colors = colors(),                   -- Every chat color by key, as on the Colors tab.
        -- Grade colors on the hit, evade and crit numbers, judged by the middle of a range.
        grades = T{
            on         = true,
            hit_good   = 85,
            hit_ok     = 70,
            evade_good = 30,
            evade_ok   = 15,
            crit_good  = 15,
            crit_ok    = 8,
        },
        aggro = T{
            threat_colors = true,            -- Color by threat, aggressive in one color and the rest in another.
            detection     = true,            -- How it finds you, like "(Sight, Sound)".
            link_names    = true,            -- The names it links with. Off says just "Links".
            max_links     = 5,               -- 0 shows every name.
        },
        magic = T{
            extra_accuracy = 0,              -- Magic accuracy from gear and merits the client can't see.
            schools        = magic_schools(),
        },
        drops = T{
            th          = 0,                 -- Treasure Hunter 0 to 4.
            max_items   = 5,                 -- 0 shows every item.
            min_chance  = 0,                 -- Items under this chance in percent are left out.
            sort        = 'chance',          -- 'chance' or 'name'.
            th_in_label = true,              -- "Drops (TH 2)".
            notes       = true,              -- "(plus scripted drops)" and "(only drops if you get EXP)".
        },
        immunities = immunities(),
        elements = T{
            weak_word   = 'Weak',            -- The word before the elements it's weak to. Empty leaves it out.
            resist_word = 'Resists',         -- The word before the elements it resists.
            strength    = true,              -- How strong each one is, like "(half)", and the magic damage note.
        },
        look = T{
            skin      = 'phoenix',
            imgui     = T{},                 -- Filled by ui\skins.lua.
            font      = 'ashita',            -- The settings window's font, one of ui\window_font.lua's.
            font_size = window_font.SIZE_DEFAULT,   -- The settings window's font size in pixels.
        },
        window = T{                          -- Where the settings window sits and its size.
            x      = 120,
            y      = 20,
            width  = 720,
            height = 560,
        },
        job_links = T{},                     -- A profile name per main job, keyed by job abbreviation.
    };
end

--[[
    Puts your chat colors in a new table, each one checked against the palette, with a missing or
    broken one from the defaults.
]]
function defaults.fix_colors(s)
    local saved = type(s.colors) == 'table' and s.colors or {};
    local fixed = T{};
    for _, key in ipairs(printout.COLOR_KEYS) do
        local code = rawget(saved, key);
        fixed[key] = printout.in_palette(code) and code or defaults.PHOENIX_CHAT[key];
    end
    s.colors = fixed;
end

return defaults;
