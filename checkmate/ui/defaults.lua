--[[
    Default settings. Ashita saves your copy per character under config\addons\checkmate\.

    make() builds fresh tables every call, so editing your settings can never change the defaults.
    The name, difficulty, evasion and defense reading, aggro and links are on at first. Every other part,
    and every magic school, starts off. The overlay starts off, with the same parts on as the chat printout.
    Abbreviations start off in chat and in the overlay.

    The look block belongs to the skins in ui\skins.lua. A skin sets the window look under
    look.imgui, every color on the Appearance tab under colors, and Color by difficulty. The default
    colors are the Phoenix skin's. The overlay's element badge colors sit with the chat colors, though
    they never print in chat. look.imgui starts empty and ui\skins.lua fills it from the Phoenix skin.
    The window's font and font size sit beside it, and no skin changes them.
]]

local printout    = require('core.printout');
local wording     = require('core.wording');
local spells      = require('data.spells');
local window_font = require('ui.window_font');
local parts       = require('core.parts');
local navigation  = require('ui.navigation');

local defaults = {};

-- Where the overlay's top left corner starts, in pixels from the top left of the screen.
defaults.OVERLAY_SPOT = { 20, 200 };

-- The Phoenix skin's chat colors, by the keys in printout.COLOR_GROUPS. The tag is Ashita's usual one
-- and the text is cream. The name is coral. Good, OK and bad numbers are green, yellow and red.
-- Aggressive is red and the rest is green.
-- Weak elements are green like good numbers, and resisted ones salmon like bad ones. The overlay's element
-- badges are tomato fire, cyan ice, spring green wind, yellow earth, violet thunder, royal blue water, white
-- light and dark magenta dark.
defaults.PHOENIX_CHAT = {
    con_colors = true,
    tag_brackets = 81, tag_word = 6, line = 106, replies = 106,
    name = 8, level = 8, level_range = 8, id = 8, ph = 8,
    difficulty = 106, too_weak = 67, incredibly_easy_prey = 106, easy_prey = 2, decent_challenge = 102,
    even_match = 8, tough = 68, very_tough = 76, incredibly_tough = 76, impossible_to_gauge = 5,
    reading = 106, reading_detail = 106,
    hit_label = 106, hit_number = 106, hit_detail = 106,
    offhand_label = 106, offhand_number = 106, offhand_detail = 106,
    ranged_label = 106, ranged_number = 106, ranged_detail = 106,
    pdif_label = 106, pdif_number = 106, pdif_detail = 106,
    offhandpdif_label = 106, offhandpdif_number = 106, offhandpdif_detail = 106,
    rangedpdif_label = 106, rangedpdif_number = 106, rangedpdif_detail = 106,
    evade_label = 106, evade_number = 106, evade_detail = 106,
    block_label = 106, block_number = 106, block_detail = 106,
    parry_label = 106, parry_number = 106, parry_detail = 106,
    crit_label = 106, crit_number = 106, crit_detail = 106,
    crittaken_label = 106, crittaken_number = 106, crittaken_detail = 106,
    job_label = 106, job_name = 106, job_detail = 106,
    aggro_label = 106, aggro_words = 106, aggro_detail = 106, aggro_threat = 76, aggro_safe = 2,
    links_label = 106, links_words = 106, links_detail = 106,
    magic_label = 106, magic_name = 106, magic_number = 106, magic_detail = 106,
    immunities_label = 106, immunities_name = 106, immunities_detail = 106,
    effects_label = 106, effects_name = 106, effects_buff = 106,
    effects_time = 106, effects_guess = 67, effects_detail = 106,
    elements_label = 106, elements_weak = 2, elements_resist = 68, elements_detail = 106,
    weapons_label = 106, weapons_weak = 2, weapons_resist = 68, weapons_detail = 106,
    info_label = 106, info_name = 106, info_value = 106, info_detail = 106,
    drops_label = 106, drops_name = 106, drops_number = 106, drops_detail = 106,
    steal_label = 106, steal_name = 106, steal_number = 106, steal_detail = 106,
    pet_label = 106, pet_name = 106, pet_level = 106, pet_number = 106, pet_detail = 106,
    badge_fire = 76, badge_ice = 6, badge_wind = 83, badge_earth = 69, badge_thunder = 73, badge_water = 71,
    badge_light = 1, badge_dark = 72,
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

-- Every chat color, the Phoenix skin's.
local function colors()
    local out = T{};
    for _, key in ipairs(printout.COLOR_KEYS) do
        out[key] = defaults.PHOENIX_CHAT[key];
    end
    return out;
end

function defaults.make()
    local settings = T{
        layout_version = parts.VERSION,
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
            show_id      = false,                    -- The monster's ID after its level, " (ID 17199202)".
            id_word      = 'ID',                     -- The word before the ID. Empty prints " (17199202)".
            show_ph      = false,                    -- The NM a placeholder can pop, " (PH for Valkurm Emperor)".
            ph_word      = 'PH for',                 -- The word before that NM. Empty prints " (Valkurm Emperor)".
            number_style = 'range',                  -- 'range' prints 64-72%, 'midpoint' prints ~68%.
            con_colors   = defaults.PHOENIX_CHAT.con_colors,   -- Color by difficulty, in the con's color.
            defense_first = false,                   -- "(High Defense, High Evasion)" instead of evasion first.
            extras_own_line = true,                  -- Extras start a new line after the parts the /check answers.
            replace_game_line = true,                -- Hides the game's /check line. checkmate's lines take its place.
            icons        = false,                    -- The game's element symbol before each element name in chat.
            icons_only   = false,                    -- With icons on, the symbol without the name.
            short_words  = false,                    -- Abbreviations in the /check lines and the sample.
            parts = T{
                name       = part(true,  '',       false),
                difficulty = part(true,  '',       false),
                reading    = T{ on = true },         -- The evasion and defense reading after the difficulty.
                hit        = part(false, 'Hit',    false),
                pdif       = part(false, 'pDIF',   true),
                offhand    = part(false, 'Off-hand', false),
                offhandpdif = part(false, 'Off-hand pDIF', true),
                ranged     = part(false, 'Ranged', false),
                rangedpdif = part(false, 'Ranged pDIF', true),
                evade      = part(false, 'Evade',  false),
                block      = part(false, 'Shield block', true),
                parry      = part(false, 'Parry', true),
                crit       = part(false, 'Crit',   false),
                crittaken  = part(false, 'Crit taken', false),
                job        = part(false, 'Job',    true),
                aggro      = part(true,  'Aggro',  true),
                links      = part(true,  '',       false),
                magic      = part(false, 'Magic',  true),
                effects    = part(false, 'Effects', true),
                drops      = part(false, 'Drops',  true),
                steal      = part(false, 'Steal',  true),
                pet        = part(false, 'Pet',    true),
            },
        },
        colors = colors(),                   -- Every chat color by key, as on the Appearance tab.
        -- Grade colors on the hit, off-hand, ranged, evade, crit, crit taken and pet numbers, judged by the middle of
        -- a range. Off-hand and ranged go by the hit cutoffs. Crit taken is better the lower it is, so its cutoffs
        -- are the most a Good or OK number can be.
        grades = T{
            on         = true,
            hit_good   = 85,
            hit_ok     = 70,
            evade_good = 30,
            evade_ok   = 15,
            crit_good  = 15,
            crit_ok    = 8,
            crittaken_good = 5,
            crittaken_ok   = 10,
        },
        aggro = T{
            threat_colors = true,            -- Color by threat, aggressive in one color and the rest in another.
            detection     = true,            -- How it finds you, like "(Sight, Sound)".
        },
        links = T{
            link_names     = true,           -- Its link names. Off says "Links", or "Links (Sight)" with link_how on.
            group_families = true,           -- Group names with the same family and link conditions.
            max_links      = 5,              -- 0 shows every entry after grouping.
            link_how       = true,           -- How each one links after its name, like "Goblin Thug (Sight)".
        },
        magic = T{
            known_inputs = true,              -- Known direct bonuses; extra_accuracy is the remaining bonus.
            extra_accuracy = 0,              -- The remaining bonus, or the full direct bonus with known_inputs off.
            schools        = magic_schools(),
        },
        drops = T{
            th          = 0,                 -- Treasure Hunter 0 to 4.
            max_items   = 5,                 -- 0 shows every item.
            min_chance  = 0,                 -- Items under this chance in percent are left out.
            sort        = 'chance',          -- 'chance' or 'name'.
            th_in_label = true,              -- "Drops (TH 2)".
            notes       = true,              -- Scripted loot, EXP-only drops and conditional Drop or Steal chances.
        },
        immunities = immunities(),
        effects = T{
            show  = 'both',                  -- 'both', 'debuffs' or 'buffs', which the Effects part lists.
            times = true,                    -- How long each has left, like Paralyze 1:20.
            estimate_mark = false,           -- A ~ before estimated times.
            show_empty = false,              -- Says when no matching effects have been observed.
        },
        weapons = T{
            weak_word   = 'Weak',            -- The word before damage types that do more damage.
            resist_word = 'Resists',         -- The word before damage types that do less damage.
        },
        blue = T{
            only_unlearned = false,          -- Keep unreadable spellbook entries visible too.
            requirements = true,             -- Learning requirements in hover and target details.
            seen = false,                    -- Whether this monster's move use was observed.
        },
        dangers = T{
            debuff = true, crit = true, dispel = true, drain = true, other = true,
            max_moves = 0,                   -- Zero keeps every matching move in chat and the overlay.
        },
        info = T{
            family = true, charm = true, vitals = true, movement = true, pursuit = true,
            spawn = true, claim = true, dangers = true, blue = true, fight = true,
            traits = true, crystal = true, rewards = true,
        },
        elements = T{
            script_mark = true,             -- Show ? when scripts can change the stored element values.
            weak_word   = 'Weak',            -- The word before the elements it's weak to. Empty leaves it out.
            resist_word = 'Resists',         -- The word before the elements it resists.
            strength    = true,              -- How strong each one is, like "(half)", and the magic damage note.
        },
        pet = T{
            show_name  = true,               -- Your pet's name at the start of the pet part.
            show_level = true,               -- Its level after the name, like "(Lv 75)".
            hit_word   = 'Hit',              -- The word before how often it hits. Empty leaves it out.
            evade_word = 'Evade',            -- The word before how often the monster misses it.
        },
        ranged = T{
            show_far = false,                -- Your hit rate at 25 yalms after the one in the sweet spot.
            show_distance = false,           -- The current distance, without changing the sweet-spot estimate.
        },
        pdif = T{
            mode = 'both',                   -- Multiplier range, Attack/Defense ratio, or both.
        },
        -- Your merits. Each character has its own, so profiles leave them out. With fill_in on, the merit list the
        -- server sends fills both in when you zone and one of them when you change that merit, and one you set by
        -- hand holds until you zone or change that merit.
        merits = T{
            fill_in         = true,
            crit_hit_rate   = 0,             -- Critical Hit Rate, 0 to 4. Each one adds 1% to Crit.
            enemy_crit_rate = 0,             -- Enemy Critical Hit Rate, 0 to 4. Each one takes 1% off Crit taken.
        },
        short = wording.reset(T{}),          -- Each word's short form, by its key in core\wording.lua.
        overlay = T{
            on             = false,              -- While it's off, checkmate never reads your target.
            locked         = false,              -- Stops you moving it or changing its width with Shift and drag.
            remember       = true,               -- Keeps each monster's last /check until it dies, leaves sight or you zone.
            follow_cursor  = false,              -- Shows the monster under the cursor while you pick a target.
            parts = T{                           -- What it shows, with the chat's labels and words.
                name = true, difficulty = true, reading = true, crit = false, crittaken = false, job = false,
                hit = false, offhand = false, ranged = false, evade = false,
                pdif = false, offhandpdif = false, rangedpdif = false,
                block = false, parry = false,
                aggro = true, links = true, magic = false, effects = false, drops = false, steal = false, pet = false,
            },
            show_level     = true,               -- " (Lv 42)" after the name.
            show_range     = false,              -- " (Lv 42, range 40-44)" once the level is exact.
            show_id        = false,              -- " (ID 17199202)".
            show_ph        = false,              -- " (PH for Valkurm Emperor)".
            short_words    = false,              -- Abbreviations in the overlay.
            own_lines      = true,               -- Each part on its own line, the difficulty by the name.
            divider        = 'pipe',             -- One of the dividers it can draw, from ui\overlay.lua.
            separator      = '  ',               -- The Custom divider's text.
            font           = 'ashita',           -- One of ui\window_font.lua's.
            font_size      = 16,                 -- 12 to 24 pixels.
            opacity        = 80,                 -- How solid the background is, 0 to 100 percent.
            border         = true,               -- A line around it in the skin's border color.
            wrap           = 520,                -- Lines wider than this many pixels wrap. 0 never wraps.
            icons          = true,               -- A picture before elements, items, immunities and jobs.
            icons_only     = false,              -- The pictures without their names, unless one won't load.
            element_look   = 'game',             -- 'game' for the game's element pictures, 'badges' for checkmate's.
            tips           = true,               -- A tip on text or an icon when the mouse rests on it.
            hide_in_events = true,               -- Hides in cutscenes and NPC talk.
            hide_with_ui   = true,               -- Hides while the game's interface is hidden.
            hide_on_map    = true,               -- Hides while the map is open.
        },
        look = T{
            skin      = 'phoenix',
            imgui     = T{},                 -- Filled by ui\skins.lua.
            font      = 'ashita',            -- The settings window's font, one of ui\window_font.lua's.
            font_size = window_font.SIZE_DEFAULT,   -- The settings window's font size in pixels.
        },
        profile_source = T{ kind = '', name = '' },
        window = T{                          -- Where the settings window sits and its size, and where the overlay sits.
            tabs = T{},                     -- Which settings tabs this character shows.
            x      = 120,
            y      = 20,
            width  = 840,
            height = 560,
            overlay_x = defaults.OVERLAY_SPOT[1],
            overlay_y = defaults.OVERLAY_SPOT[2],
        },
        job_links = T{},                     -- A profile name per main job, keyed by job abbreviation.
    };
    for _, name in ipairs(navigation.TAB_NAMES) do settings.window.tabs[name] = true; end
    return parts.migrate(settings);
end

--[[
    Puts your chat colors in a new table, each one checked against the palette, with a missing or
    broken one from `chat`, your skin's chat colors. With no `chat` it comes from the Phoenix skin.
]]
function defaults.fix_colors(s, chat)
    local saved = type(s.colors) == 'table' and s.colors or {};
    local fill = chat or defaults.PHOENIX_CHAT;
    local fixed = T{};
    for _, key in ipairs(printout.COLOR_KEYS) do
        local code = rawget(saved, key);
        fixed[key] = printout.in_palette(code) and code or fill[key];
    end
    s.colors = fixed;
end

return defaults;
